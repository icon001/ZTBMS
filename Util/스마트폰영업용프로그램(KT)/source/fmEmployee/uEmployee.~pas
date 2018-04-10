unit uEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, Buttons, ExtCtrls,ActiveX,ADODB,
  uSubForm, CommandArray;

type
  TfmEmploy = class(TfmASubForm)
    Panel2: TPanel;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    Panel12: TPanel;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    btn_Search: TBitBtn;
    ed_searchText: TEdit;
    sg_Employ: TAdvStringGrid;
    Label1: TLabel;
    btn_Close: TSpeedButton;
    Label2: TLabel;
    ed_emName2: TEdit;
    Label3: TLabel;
    ed_CardNo: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure sg_EmployClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure EmployeeSearch(aCode : string;aTopRow:integer = 0);
    function CheckTB_CARD(aCardNo:string):Boolean;
    function InsertTB_CARD(aCardNo,aName:string):Boolean;
    function UpdateTB_CARD(aCardNo,aName:string):Boolean;
    function DeleteTB_CARD(aCardNo:string):Boolean;
  public
    { Public declarations }
    procedure CardReadProcess(aCardNo:string);
  end;

var
  fmEmploy: TfmEmploy;

implementation

uses
  uDBModule,
  uMain;
{$R *.dfm}



procedure TfmEmploy.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEmploy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fmMain.L_bEmployeeshow := False;
  Action := caFree;
end;

procedure TfmEmploy.btn_SearchClick(Sender: TObject);
begin
  EmployeeSearch('');
end;

procedure TfmEmploy.EmployeeSearch(aCode : string;aTopRow:integer = 0);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  ed_CardNo.Text := '';
  ed_emName2.Text := '';
  
  GridInitialize(sg_Employ); //스트링그리드 초기화

  stSql := 'Select * from TB_CARD ';
  if Trim(ed_searchText.Text) <> '' then
    stSql := stSql + ' Where EM_NAME Like ''%' + Trim(ed_searchText.Text) + '%'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;

      sg_Employ.RowCount := RecordCount + 1;
      nRow := 1;
      First;
      While Not Eof do
      begin
        with sg_Employ do
        begin
          cells[0,nRow] := FindField('CA_CARDNO').AsString;
          cells[1,nRow] := FindField('EM_NAME').AsString;
          if (FindField('CA_CARDNO').AsString)  = aCode then
          begin
            SelectRows(nRow,1);
          end;
        end;
        nRow := nRow + 1;
        Next;
      end;
      if aTopRow = 0 then
      begin
        if sg_Employ.Row > 5 then sg_Employ.TopRow := sg_Employ.Row - 4;
      end else
      begin
        sg_Employ.TopRow := aTopRow;
      end;
      sg_EmployClick(self);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmEmploy.FormCreate(Sender: TObject);
begin
  inherited;
  width := 534;
  top := 0;
  left := 0;

  fmMain.L_bEmployeeshow := True;
end;

procedure TfmEmploy.CardReadProcess(aCardNo: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  ed_cardno.Text := '';
  ed_emName2.Text := '';

  stSql := 'select * from TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        ed_cardno.Text := aCardNo;
        Exit;
      end;

      First;
      ed_cardno.Text := FindField('CA_CARDNO').AsString;
      ed_emName2.Text := FindField('EM_NAME').AsString;
      EmployeeSearch(ed_cardno.Text);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmEmploy.btn_SaveClick(Sender: TObject);
var
  bResult : Boolean;
begin
  if Trim(ed_CardNo.Text) = '' then
  begin
    showmessage('카드번호가 없습니다.');
    Exit;
  end;
  if Trim(ed_emName2.Text) = '' then
  begin
    showmessage('이름이 없습니다.');
    ed_emName2.SetFocus;
    Exit;
  end;

  if CheckTB_CARD(ed_CardNo.Text) then
  begin
    bResult := UpdateTB_CARD(ed_CardNo.Text,ed_emName2.Text);
  end else
  begin
    bResult := InsertTB_CARD(ed_CardNo.Text,ed_emName2.Text);
  end;

  if Not bResult then
  begin
    showmessage('저장에 실패하였습니다.');
    Exit;
  end;
  EmployeeSearch(ed_cardno.Text);

end;

procedure TfmEmploy.sg_EmployClick(Sender: TObject);
begin
  with sg_Employ do
  begin
    if cells[0,Row] <> '' then
    begin
      ed_CardNo.Text := cells[0,Row];
      ed_emName2.Text := cells[1,Row];
    end;
  end;
end;

function TfmEmploy.CheckTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  stSql := 'select * from TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmEmploy.InsertTB_CARD(aCardNo, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARD(CA_CARDNO,EM_NAME) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aName + ''') ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmEmploy.UpdateTB_CARD(aCardNo, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set EM_NAME = ''' + aName + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

procedure TfmEmploy.btn_DeleteClick(Sender: TObject);
var
  bResult : Boolean;
begin
  if Trim(ed_CardNo.Text) = '' then
  begin
    showmessage('카드번호가 없습니다.');
    Exit;
  end;

  bResult := DeleteTB_CARD(ed_CardNo.Text);

  if Not bResult then
  begin
    showmessage('삭제에 실패하였습니다.');
    Exit;
  end;
  EmployeeSearch(ed_cardno.Text);
end;

function TfmEmploy.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete from TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

procedure TfmEmploy.FormShow(Sender: TObject);
begin
  inherited;
  EmployeeSearch('');
end;

initialization
  RegisterClass(TfmEmploy);
Finalization
  UnRegisterClass(TfmEmploy);

end.
