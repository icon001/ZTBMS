unit uMemoSendSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, DB, ADODB,
  uSubForm, CommandArray, Menus;

type
  TfmMemoSendSearch = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    btn_Search: TSpeedButton;
    GroupBox2: TGroupBox;
    btn_Close: TSpeedButton;
    Label2: TLabel;
    ed_sMemoSubject: TEdit;
    Label3: TLabel;
    ed_sMemoContent: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    ed_memSubject: TEdit;
    Label5: TLabel;
    mem_memo: TMemo;
    sg_memo: TAdvStringGrid;
    TempQuery: TADOQuery;
    ed_SendName: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_memoClick(Sender: TObject);
    procedure Ver011Click(Sender: TObject);
    procedure rg_ConfirmClick(Sender: TObject);
    procedure ed_SendNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_sMemoSubjectKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_sMemoContentKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_SendNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    MasterIDList:TStringList;
    { Private declarations }
    procedure  LoadUserName(cmb_box:TComboBox);
    procedure FormClear;

    Function DeleteMemo(aReceiveID,aMemoID:string):Boolean;
    Function UpdateMemoConfirm(aReceiveID,aMemoID,aConfirm:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmMemoSendSearch: TfmMemoSendSearch;

implementation
uses
  uDataModule;
{$R *.dfm}

procedure TfmMemoSendSearch.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMemoSendSearch.LoadUserName(cmb_box: TComboBox);
var
  stSql : string;
begin
  MasterIDList.Clear;
  cmb_box.Clear;
  cmb_box.Items.Add('전체');
  cmb_box.ItemIndex := 0;
  stSql := ' Select * from TB_AUTHADMIN ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    While Not Eof do
    begin
      MasterIDList.Add(FindField('AD_USERID').AsString);
      cmb_box.Items.Add(FindField('AD_USERNAME').AsString);
      Next;
    end;
  end;
end;

procedure TfmMemoSendSearch.FormCreate(Sender: TObject);
begin
  MasterIDList:= TStringList.Create;

//  LoadUserName(cmb_UserName);
  btn_SearchClick(self);
end;

procedure TfmMemoSendSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MasterIDList.Free;
end;

procedure TfmMemoSendSearch.btn_SearchClick(Sender: TObject);
var
  stConfirm : string;
  stUserID : string;
  stSql : string;
  stWhere : string;
  nRow : integer;
begin
  GridInitialize(sg_memo); //스트링그리드 초기화
  FormClear;

  stWhere := ' Where a.AM_SENDERID = ''' + Master_ID + ''' ';

  stUserID := '';
  if Trim(ed_SendName.Text) <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' b.AD_USERNAME Like ''%' + Trim(ed_SendName.Text) + '%'' ';
  end;
  if Trim(ed_sMemoSubject.Text) <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_SUBJECT LIKE ''%' + Trim(ed_sMemoSubject.Text) + '%'' ';
  end;
  if Trim(ed_sMemoContent.Text) <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_MEMO LIKE ''%' + Trim(ed_sMemoContent.Text) + '%'' ';
  end;

  stSql := ' Select a.*,b.AD_USERNAME ';
  stSql := stSql + ' From TB_AUTHMEMO a ';
  stSql := stSql + ' Left Join TB_AUTHADMIN b ';
  stSql := stSql + ' On (a.AM_RECEIPTID = b.AD_USERID) ';

  if stWhere <> '' then stSql := stSql + stWhere;

  stSql := stSql + ' order by AM_DATE DESC,AM_TIME DESC ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    with sg_memo do
    begin
      nRow := 1;
      RowCount := RecordCount + 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('AM_DATE').AsString;
        Cells[1,nRow] := FindField('AD_USERNAME').AsString;
        Cells[2,nRow] := FindField('AM_SUBJECT').AsString;
        Cells[3,nRow] := FindField('AM_CONFIRM').AsString;
        Cells[4,nRow] := FindField('AM_RECEIPTID').AsString;
        Cells[5,nRow] := FindField('AM_MEMOID').AsString;
        Cells[6,nRow] := FindField('AM_MEMO').AsString;

        inc(nRow);
        Next;
      end;
    end;
  end;

end;

procedure TfmMemoSendSearch.FormClear;
begin
  ed_memSubject.Text := '';
  mem_memo.Text := '';
end;

procedure TfmMemoSendSearch.sg_memoClick(Sender: TObject);
begin
  with sg_memo do
  begin
    ed_memSubject.Text := Cells[2,Row];
    mem_memo.Text := Cells[6,Row];
  end;

end;

procedure TfmMemoSendSearch.Ver011Click(Sender: TObject);
begin
  if (Application.MessageBox(PChar('메시지를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  with sg_memo do
  begin
    if DeleteMemo(Cells[4,Row],Cells[5,Row]) then
    begin
      btn_SearchClick(self);
    end;
  end;
end;

function TfmMemoSendSearch.DeleteMemo(aReceiveID, aMemoID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_AUTHMEMO ';
  stSql := stSql + ' Where AM_RECEIPTID = ''' + aReceiveID + ''' ';
  stsql := stsql + ' AND AM_MEMOID = ' + aMemoID ;

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMemoSendSearch.UpdateMemoConfirm(aReceiveID, aMemoID,
  aConfirm: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_AUTHMEMO ';
  stSql := stSql + ' Set AM_CONFIRM = ''' + aConfirm + ''' ';
  stSql := stSql + ' Where AM_RECEIPTID = ''' + aReceiveID + ''' ';
  stsql := stsql + ' AND AM_MEMOID = ' + aMemoID ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMemoSendSearch.rg_ConfirmClick(Sender: TObject);
begin
  btn_SearchClick(self);
end;

procedure TfmMemoSendSearch.ed_SendNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  btn_SearchClick(Self);

end;

procedure TfmMemoSendSearch.ed_sMemoSubjectKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btn_SearchClick(Self);

end;

procedure TfmMemoSendSearch.ed_sMemoContentKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btn_SearchClick(Self);

end;

procedure TfmMemoSendSearch.ed_SendNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_return then 
  perform(WM_NEXTDLGCTL,0,0) ;

end;

end.
