unit uInOutGroupCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, AdvObj, BaseGrid, AdvGrid, Buttons, StdCtrls,
  ComCtrls, DB, ADODB, uSubForm, CommandArray;

type
  TfmInOutGroupCode = class(TfmASubForm)
    Panel12: TPanel;
    StatusBar1: TStatusBar;
    GroupBox6: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    Panel1: TPanel;
    sg_Code: TAdvStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    ed_Code: TEdit;
    ed_Name: TEdit;
    ADOQuery: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    L_State:string;
    L_nTopRow : integer;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure ShowGroupCode(aCode:string;aTopRow:integer=0);
  private
    Function GetAutoCode:string;
    Function InsertTB_INOUTREADERGROUP(aCode,aName:string):Boolean;
    Function UpdateTB_INOUTREADERGROUP(aCode,aName:string):Boolean;
    Function DeleteTB_INOUTREADERGROUP(aCode:string):Boolean;

  public
    { Public declarations }
  end;

var
  fmInOutGroupCode: TfmInOutGroupCode;

implementation

uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmInOutGroupCode.ButtonEnable(aState: string);
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

procedure TfmInOutGroupCode.FormClear;
begin
  ed_Code.Text := '';
  ed_Name.Text := '';
end;

procedure TfmInOutGroupCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    ed_Code.Enabled := False;
    ed_Name.Enabled := True;
    sg_Code.Enabled := False;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    ed_Code.Enabled := False;
    ed_Name.Enabled := False;
    sg_Code.Enabled := True;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    ed_Code.Enabled := False;
    ed_Name.Enabled := True;
    sg_Code.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    ed_Code.Enabled := False;
    ed_Name.Enabled := False;
    sg_Code.Enabled := True;
  end;  
end;

procedure TfmInOutGroupCode.FormShow(Sender: TObject);
begin
  Panel12.Caption := Caption;
  ShowGroupCode('');
end;

procedure TfmInOutGroupCode.btn_InsertClick(Sender: TObject);
begin
  L_State := 'INSERT';
  FormClear;
  FormEnable(L_State);
  ButtonEnable(L_State);

  L_nTopRow := sg_Code.TopRow;

  ed_Code.Text := GetAutoCode;
  ed_Name.SetFocus;
end;

function TfmInOutGroupCode.GetAutoCode: string;
var
  stSql : string;
begin
  result := '001';
  stSql := 'select Max(IO_GROUPCODE) as IO_GROUPCODE from TB_INOUTREADERGROUP ';
  with ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    if Not isDigit(FindField('IO_GROUPCODE').AsString) then Exit;

    result := FillZeroNumber(strtoint(FindField('IO_GROUPCODE').AsString) + 1,3);
  end;
end;

procedure TfmInOutGroupCode.btn_UpdateClick(Sender: TObject);
begin
  L_State := 'UPDATE';
  FormEnable(L_State);
  ButtonEnable(L_State);

  L_nTopRow := sg_Code.TopRow;
  ed_Name.SetFocus;
  ed_Name.SelectAll;
end;

procedure TfmInOutGroupCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInOutGroupCode.btn_CancelClick(Sender: TObject);
begin
  ShowGroupCode(ed_Code.text,L_nTopRow);
end;

procedure TfmInOutGroupCode.ShowGroupCode(aCode: string; aTopRow: integer);
var
  stSql : string;
  nRow : integer;
begin
  GridInit(sg_Code,2); //스트링그리드 초기화

  L_State := 'SEARCH';
  FormClear;
  FormEnable(L_State);
  ButtonEnable(L_State);

  stSql := ' Select * from TB_INOUTREADERGROUP ';
  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;

    with sg_Code do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('IO_GROUPCODE').AsString;
        cells[1,nRow] := FindField('IO_GROUPNAME').AsString;
        if (FindField('IO_GROUPCODE').AsString )  = aCode then
        begin
          SelectRows(nRow,1);
        end;

        nRow := nRow + 1;
        Next;
      end;
      if aTopRow = 0 then
      begin
        if Row > 11 then TopRow := Row - 10;
      end else
      begin
        TopRow := aTopRow;
      end;
    end;

  end;
  sg_CodeClick(Self);

end;

procedure TfmInOutGroupCode.sg_CodeClick(Sender: TObject);
begin
  inherited;
  L_State := 'CLICK';
  FormClear;
  FormEnable(L_State);
  ButtonEnable(L_State);
  with sg_Code do
  begin
    if cells[0,Row] = '' then exit;
    ed_Code.Text := cells[0,Row];
    ed_Name.Text := cells[1,Row];
  end;

end;

procedure TfmInOutGroupCode.btn_SaveClick(Sender: TObject);
var
  bResult : Boolean;
begin
  inherited;
  if Length(ed_Code.Text) <> 3 then
  begin
    showmessage('코드에 오류가 있습니다..');
    Exit;
  end;
  if ed_Name.Text = '' then
  begin
    showmessage('그룹코드명을 입력 해 주세요.');
    ed_Name.SetFocus;
    Exit;
  end;

  if UpperCase(L_State) = 'INSERT' then
    bResult := InsertTB_INOUTREADERGROUP(ed_code.Text,ed_Name.Text)
  else if UpperCase(L_State) = 'UPDATE' then
    bResult := UpdateTB_INOUTREADERGROUP(ed_code.Text,ed_Name.Text);

  if bResult then
  begin
    if UpperCase(L_State) = 'INSERT' then
      ShowGroupCode(ed_code.Text)
    else ShowGroupCode(ed_code.Text,sg_Code.TopRow);
  end else showmessage('저장실패');

end;

function TfmInOutGroupCode.InsertTB_INOUTREADERGROUP(aCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_INOUTREADERGROUP ( ';
  stSql := stSql + 'IO_GROUPCODE,';
  stSql := stSql + 'IO_GROUPNAME ) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aName + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmInOutGroupCode.UpdateTB_INOUTREADERGROUP(aCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_INOUTREADERGROUP Set ';
  stSql := stSql + 'IO_GROUPNAME = ''' + aName + ''' ';
  stSql := stSql + ' Where IO_GROUPCODE = ''' + aCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmInOutGroupCode.btn_DeleteClick(Sender: TObject);
var
  bResult : Boolean;
begin
  inherited;
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_INOUTREADERGROUP(ed_code.Text);

  if bResult then ShowGroupCode(ed_code.Text,sg_Code.TopRow)
  else showmessage('삭제실패.');

end;

function TfmInOutGroupCode.DeleteTB_INOUTREADERGROUP(
  aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_INOUTREADERGROUP ';
  stSql := stSql + ' Where IO_GROUPCODE = ''' + aCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

end.
