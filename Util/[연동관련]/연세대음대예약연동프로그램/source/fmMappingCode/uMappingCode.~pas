unit uMappingCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid,
  uSubForm, CommandArray,ADOdb,ActiveX;

type
  TfmMappingCode = class(TfmASubForm)
    Panel12: TPanel;
    GroupBox6: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel10: TPanel;
    StaticText2: TStaticText;
    ed_ecuid: TEdit;
    StaticText4: TStaticText;
    ed_doorno: TEdit;
    StaticText6: TStaticText;
    ed_devicecode: TEdit;
    sg_code: TAdvStringGrid;
    StaticText1: TStaticText;
    ed_readerno: TEdit;
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure sg_codeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    State : string;
    L_nTopRow : integer;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure ShowMappingCode(aCode:string;aTopRow:integer=0);
  private
    function DeleteTB_RELAYDEVICEMAPPINGCODE(aCode:string):Boolean;
    function InsertTB_RELAYDEVICEMAPPINGCODE(aCode,aEcuID,aDoorNo,aReaderNo:string):Boolean;
    function UpdateTB_RELAYDEVICEMAPPINGCODE(aCode,aEcuID,aDoorNo,aReaderNo:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmMappingCode: TfmMappingCode;

implementation

uses uDBModule;

{$R *.dfm}

procedure TfmMappingCode.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with sg_Code do
  begin
    L_nTopRow := TopRow;
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 11 then TopRow := RowCount - 11;
      Enabled := False;
    end;
  end;
  ed_devicecode.SetFocus;

end;

procedure TfmMappingCode.ButtonEnable(aState: string);
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
    btn_Update.Enabled := True;
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

procedure TfmMappingCode.FormClear;
begin
  ed_devicecode.Text := '';
  ed_ecuid.Text := '';
  ed_doorno.Text := '';
  ed_readerno.Text := '';
end;

procedure TfmMappingCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    ed_devicecode.Enabled := True;
    ed_ecuid.Enabled := True;
    ed_doorno.Enabled := True;
    ed_readerno.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    ed_devicecode.Enabled := False;
    ed_ecuid.Enabled := False;
    ed_doorno.Enabled := False;
    ed_readerno.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    ed_devicecode.Enabled := False;
    ed_ecuid.Enabled := False;
    ed_doorno.Enabled := False;
    ed_readerno.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    ed_devicecode.Enabled := False;
    ed_ecuid.Enabled := True;
    ed_doorno.Enabled := True;
    ed_readerno.Enabled := True;
  end;
end;

procedure TfmMappingCode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);
  ed_ecuid.SetFocus;
  L_nTopRow := sg_Code.TopRow;
end;

procedure TfmMappingCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMappingCode.btn_CancelClick(Sender: TObject);
begin
  ShowMappingCode(ed_devicecode.text,L_nTopRow);

end;

procedure TfmMappingCode.ShowMappingCode(aCode: string; aTopRow: integer);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_Code); //스트링그리드 초기화
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_RELAYDEVICEMAPPINGCODE ';
  stSql := stSql + ' order by RM_CODE ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := dmDBModule.ADOConnection;

  Try
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

      with sg_Code do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('RM_CODE').AsString;
          cells[1,nRow] := FindField('RM_ECUID').AsString;
          cells[2,nRow] := FindField('RM_DOORID').AsString;
          cells[3,nRow] := FindField('RM_READERID').AsString;
          if (FindField('RM_CODE').AsString )  = aCode then
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
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_CodeClick(sg_Code);
end;

procedure TfmMappingCode.sg_codeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_devicecode.Text := cells[0,Row];
    ed_ecuid.Text := cells[1,Row];
    ed_doorno.Text := cells[2,Row];
    ed_readerno.Text := cells[3,Row];
  end;

end;

procedure TfmMappingCode.FormActivate(Sender: TObject);
begin
  inherited;
  ShowMappingCode('');
end;

procedure TfmMappingCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_RELAYDEVICEMAPPINGCODE(ed_devicecode.Text);

  if bResult then ShowMappingCode('',sg_Code.TopRow)
  else showmessage('삭제실패.');

end;

function TfmMappingCode.DeleteTB_RELAYDEVICEMAPPINGCODE(
  aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete from TB_RELAYDEVICEMAPPINGCODE ';
  stSql := stSql + ' Where RM_CODE = ''' + aCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

procedure TfmMappingCode.btn_SaveClick(Sender: TObject);
var
  bResult : Boolean;
begin
  if Trim(ed_devicecode.Text) = '' then
  begin
    showmessage('기기코드를 입력하세요.');
    ed_devicecode.SetFocus;
    Exit;
  end;
  if Trim(ed_ecuid.Text) = '' then
  begin
    showmessage('확장기번호를 입력하세요.');
    ed_ecuid.SetFocus;
    Exit;
  end;
  if Trim(ed_doorno.Text) = '' then
  begin
    showmessage('출입문번호를 입력하세요.');
    ed_doorno.SetFocus;
    Exit;
  end;
  if Trim(ed_readerno.Text) = '' then
  begin
    showmessage('리더번호를 입력하세요.');
    ed_readerno.SetFocus;
    Exit;
  end;

  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_RELAYDEVICEMAPPINGCODE(ed_devicecode.Text,ed_ecuid.text,ed_doorno.text,ed_readerno.text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_RELAYDEVICEMAPPINGCODE(ed_devicecode.Text,ed_ecuid.text,ed_doorno.text,ed_readerno.text);

  if Not bResult then
  begin
    showmessage('저장실패');
    exit;
  end;
  
  if UpperCase(State) = 'INSERT' then
    ShowMappingCode(ed_devicecode.Text)
  else ShowMappingCode(ed_devicecode.Text,sg_code.TopRow);

end;

function TfmMappingCode.InsertTB_RELAYDEVICEMAPPINGCODE(aCode, aEcuID,
  aDoorNo, aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_RELAYDEVICEMAPPINGCODE( ';
  stSql := stSql + 'RM_CODE,';
  stSql := stSql + 'RM_ECUID,';
  stSql := stSql + 'RM_DOORID,';
  stSql := stSql + 'RM_READERID) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aReaderNo + ''') ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMappingCode.UpdateTB_RELAYDEVICEMAPPINGCODE(aCode, aEcuID,
  aDoorNo, aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_RELAYDEVICEMAPPINGCODE set ';
  stSql := stSql + 'RM_ECUID = ''' + aEcuID + ''',';
  stSql := stSql + 'RM_DOORID = ''' + aDoorNo + ''',';
  stSql := stSql + 'RM_READERID = ''' + aReaderNo + ''' ';
  stSql := stSql + ' Where RM_CODE = ''' + aCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

end.
