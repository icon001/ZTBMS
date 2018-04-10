unit uFiregubunCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ComCtrls,
  uSubForm, CommandArray,ADODB,ActiveX, DB;

type
  TfmFiregubunCode = class(TfmASubForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    lb_Code: TLabel;
    lb_name: TLabel;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    btn_Close: TSpeedButton;
    ed_FireCode: TEdit;
    ed_FireName: TEdit;
    chk_AutoCode: TCheckBox;
    sg_FireCode: TAdvStringGrid;
    ADOQuery: TADOQuery;
    procedure sg_FireCodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure ed_FireCodeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure chk_AutoCodeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    State : string;
    L_nTopRow : integer;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowFireCode(aCode:string;aTopRow:integer=1);
    function InsertTB_FIREGUBUN(aFireCode,aName:string):Boolean;
    function UpdateTB_FIREGUBUN(aFireCode,aName:string):Boolean;
    Function DeleteTB_FIREGUBUN(aFireCode:String):Boolean;
    Function GetAutoFireCode:string;
    Function UpdateTB_FireGroup(aFireCode,aNewFireCode:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmFiregubunCode: TfmFiregubunCode;

implementation
uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

{ TfmFiregubunCode }

procedure TfmFiregubunCode.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Insert.Enabled := True;
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmFiregubunCode.FormClear;
begin
  ed_FireCode.Text := '';
  ed_FireName.Text := '';
end;

procedure TfmFiregubunCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_FireCode.Enabled := False;
    ed_FireCode.Enabled := true;
    ed_FireName.Enabled := true;
    chk_AutoCode.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_FireCode.Enabled := True;
    ed_FireCode.Enabled := False;
    ed_FireName.Enabled  := False;
    chk_AutoCode.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_FireCode.Enabled := True;
    ed_FireCode.Enabled := False;
    ed_FireName.Enabled  := False;
    chk_AutoCode.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_FireCode.Enabled := False;
    ed_FireCode.Enabled := False;
    ed_FireName.Enabled  := true;
    chk_AutoCode.Enabled := False;
  end;
end;

procedure TfmFiregubunCode.ShowFireCode(aCode: string; aTopRow: integer);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_FireCode); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_FIREGUBUN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    with sg_FireCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('FG_CODE').AsString;
        cells[1,nRow] := FindField('FG_NAME').AsString;
        if FindField('FG_CODE').AsString  = aCode then
        begin
          SelectRows(nRow,1);
        end;

        nRow := nRow + 1;
        Next;
      end;
      if aTopRow = 0 then
      begin
        if Row > 7 then TopRow := Row - 6;
      end else
      begin
        TopRow := aTopRow;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_FireCodeClick(sg_FireCode);
end;

procedure TfmFiregubunCode.sg_FireCodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_FireCode.Text := cells[0,Row];
    ed_FireName.Text := cells[1,Row];

  end;

end;

procedure TfmFiregubunCode.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_FireCode do
  begin
    L_nTopRow := TopRow;
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 7 then TopRow := RowCount - 7;
      Enabled := False;
    end;
  end;

  ed_FireCode.SetFocus;
  if chk_AutoCode.Checked then chk_AutoCodeClick(self);
end;

procedure TfmFiregubunCode.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_FireName.SetFocus;
  L_nTopRow := sg_FireCode.TopRow;

end;

procedure TfmFiregubunCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
begin
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_FIREGUBUN(ed_FireCode.Text,ed_FireName.Text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_FIREGUBUN(ed_FireCode.Text,ed_FireName.Text);

  if bResult then
  begin
    if UpperCase(State) = 'INSERT' then
      ShowFireCode(ed_FireCode.Text)
    else if UpperCase(State) = 'UPDATE' then
      ShowFireCode(ed_FireCode.Text,sg_FireCode.TopRow);
  end else showmessage('저장실패');
end;

function TfmFiregubunCode.InsertTB_FIREGUBUN(aFireCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_FIREGUBUN( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' FG_CODE,';
  stSql := stSql + ' FG_NAME )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aFireCode + ''',';
  stSql := stSql + '''' + aName + '''';
  stSql := stSql + ')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmFiregubunCode.UpdateTB_FIREGUBUN(aFireCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_FIREGUBUN set ';
  stSql := stSql + ' FG_NAME = ''' + aName + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND FG_CODE = ''' + aFireCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmFiregubunCode.DeleteTB_FIREGUBUN(aFireCode: String): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_FIREGUBUN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And FG_CODE = ''' + aFireCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmFiregubunCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if ed_FireCode.Text = '001' then
  begin
    showmessage('001 코드는 삭제 할 수 없습니다.');
    Exit;
  end;
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_FIREGUBUN(ed_FireCode.Text);
  UpdateTB_FireGroup(ed_FireCode.Text,'000');

  if bResult then ShowFireCode('')
  else showmessage('삭제실패.');

end;

procedure TfmFiregubunCode.ed_FireCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    ed_FireName.SetFocus;
  end;

end;

procedure TfmFiregubunCode.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;

end;

procedure TfmFiregubunCode.FormShow(Sender: TObject);
begin
  inherited;
  Panel1.Caption := fmFiregubunCode.Caption;
  btn_Insert.Enabled := True;
  btn_Update.Enabled := True;
  btn_Delete.Enabled := True;

end;

procedure TfmFiregubunCode.btn_CancelClick(Sender: TObject);
begin
  inherited;
  ShowFireCode(ed_FireCode.text);

end;

procedure TfmFiregubunCode.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := fmFiregubunCode.Width;
  nBlock := (nWidth - 20) div 3; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 10 + nLeft;
  btn_Update.Left := 10 + nBlock + nLeft;
  btn_Save.Left := 10 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 10 + nLeft;
  btn_Cancel.Left := 10 + nBlock + nLeft;
  btn_Close.Left := 10 + (nBlock * 2) + nLeft;

end;

procedure TfmFiregubunCode.chk_AutoCodeClick(Sender: TObject);
begin
  inherited;
  if chk_AutoCode.Checked then ed_FireCode.Text := GetAutoFireCode;

end;

function TfmFiregubunCode.GetAutoFireCode: string;
var
  stSql : string;
  nSeq : integer;
begin
  nSeq := 1;
  stSql := 'select Max(FG_CODE) as FG_CODE from TB_FIREGUBUN ';
  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      result := FillZeroNumber(nSeq,3);
      Exit;
    End;
    if recordCount > 0 then
    begin
      if IsDigit(FindField('FG_CODE').AsString) then
      begin
        nSeq := strtoint(FindField('FG_CODE').AsString) + 1;
      end;
    end;
  end;
  result := FillZeroNumber(nSeq,3);
end;

procedure TfmFiregubunCode.FormActivate(Sender: TObject);
begin
  inherited;
  ShowFireCode('');
end;

function TfmFiregubunCode.UpdateTB_FireGroup(aFireCode,
  aNewFireCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_FIREGROUP set FG_CODE = ''' + aNewFireCode + ''' ';
  stSql := stSql + ' Where FG_CODE = ''' + aFireCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

end.
