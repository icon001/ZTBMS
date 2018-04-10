unit uCardReaderServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid,
  Spin, DB, ADODB, uSubForm, CommandArray,ActiveX;

type
  TfmCardReaderServer = class(TfmASubForm)
    Panel12: TPanel;
    GroupBox8: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    sg_Code: TAdvStringGrid;
    Panel1: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    se_RelayNo: TSpinEdit;
    cmb_Ecu: TComboBox;
    se_ReaderNo: TSpinEdit;
    TempQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    State : string;
    ECUDeviceList :TStringList;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
  private
    procedure ShowCardReaderServer(aCode:string);
    procedure cmbEcuLoad(cmb_Box:TComboBox);

    Function InsertTB_SERVERCARDRELAY(aRelayNo,aNodeNo,aEcuID,aReaderNo:string):Boolean;
    Function UpdateTB_SERVERCARDRELAY(aRelayNo,aNodeNo,aEcuID,aReaderNo:string):Boolean;
    Function DeleteTB_SERVERCARDRELAY(aRelayNo:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmCardReaderServer: TfmCardReaderServer;

implementation
uses
  uDataModule1,
  uLomosUtil;
  
{$R *.dfm}

procedure TfmCardReaderServer.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCardReaderServer.ButtonEnable(aState: string);
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

procedure TfmCardReaderServer.FormClear;
begin
  se_RelayNo.Value := 0;
  cmb_Ecu.ItemIndex := 0;
  se_ReaderNo.Value := 1;
end;

procedure TfmCardReaderServer.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    se_RelayNo.Enabled := true;
    cmb_Ecu.Enabled  := true;
    se_ReaderNo.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    se_RelayNo.Enabled := False;
    cmb_Ecu.Enabled  := False;
    se_ReaderNo.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    se_RelayNo.Enabled := False;
    cmb_Ecu.Enabled  := False;
    se_ReaderNo.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    se_RelayNo.Enabled := False;
    cmb_Ecu.Enabled  := true;
    se_ReaderNo.Enabled := True;
  end;
end;

procedure TfmCardReaderServer.ShowCardReaderServer(aCode: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_Code); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select a.*,b.ac_DeviceName from TB_SERVERCARDRELAY a ';
  stSql := stSql + ' Left Join tb_accessdevice b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order by a.SR_RELAYNO ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
  //    Sql.Clear;
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

      with sg_Code do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := inttostr(FindField('SR_RELAYNO').AsInteger);
          cells[1,nRow] := FindField('ac_DeviceName').AsString;
          cells[2,nRow] := FindField('re_readerno').AsString;
          cells[3,nRow] := inttostr(FindField('AC_NODENO').AsInteger);
          cells[4,nRow] := FindField('AC_ECUID').AsString;
          if inttostr(FindField('SR_RELAYNO').AsInteger) = aCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_CodeClick(sg_Code);
end;

procedure TfmCardReaderServer.sg_CodeClick(Sender: TObject);
var
  nIndex : integer;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    se_RelayNo.Value := strtoint(cells[0,Row]);
    nIndex := ECUDeviceList.IndexOf(FillZeroNumber(strtoint(cells[3,Row]),3) + cells[4,Row]);
    if nIndex > 0 then cmb_Ecu.ItemIndex := nIndex;
    se_ReaderNo.Value := strtoint(cells[2,Row]);
  end;
end;

procedure TfmCardReaderServer.FormShow(Sender: TObject);
begin
  ShowCardReaderServer('');
end;

procedure TfmCardReaderServer.cmbEcuLoad(cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add('');
  cmb_Box.ItemIndex := 0;
  ECUDeviceList.Clear;
  ECUDeviceList.Add('');

  stSql := 'select * from tb_accessdevice ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  With TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('ac_DeviceName').AsString);
      ECUDeviceList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString);
      Next;
    end;
  end;
end;

procedure TfmCardReaderServer.FormCreate(Sender: TObject);
begin
  ECUDeviceList := TStringList.Create;
  cmbEcuLoad(cmb_Ecu);
end;

procedure TfmCardReaderServer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ECUDeviceList.Free;
end;

procedure TfmCardReaderServer.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_Code do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 10 then TopRow := RowCount - 10;
      Enabled := False;
    end;
  end;

end;

procedure TfmCardReaderServer.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmCardReaderServer.btn_CancelClick(Sender: TObject);
begin
  ShowCardReaderServer(inttostr(se_RelayNo.Value));
end;

procedure TfmCardReaderServer.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
  stRelayNo,stNodeNo,stEcuID,stReaderNo : string;
begin
  stRelayNo := inttostr(se_RelayNo.Value);

  if cmb_Ecu.ItemIndex < 1 then
  begin
    showmessage('ECU는 반드시 선택하셔야 합니다.');
    Exit;
  end;
  stNodeNo := copy(ECUDeviceList.Strings[cmb_Ecu.ItemIndex],1,3);
  stEcuID := copy(ECUDeviceList.Strings[cmb_Ecu.ItemIndex],4,2);
  stReaderNo := inttostr(se_ReaderNo.Value);

  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_SERVERCARDRELAY(stRelayNo,stNodeNo,stEcuID,stReaderNo)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_SERVERCARDRELAY(stRelayNo,stNodeNo,stEcuID,stReaderNo);

  if bResult then ShowCardReaderServer(stRelayNo)
  else showmessage('저장실패');

end;

function TfmCardReaderServer.InsertTB_SERVERCARDRELAY(aRelayNo, aNodeNo,
  aEcuID, aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_SERVERCARDRELAY( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' SR_RELAYNO,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' RE_READERNO )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aRelayNo + ',';
  stSql := stSql + inttostr(strtoint(aNodeNo)) + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aReaderNo + '''';
  stSql := stSql + ')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmCardReaderServer.UpdateTB_SERVERCARDRELAY(aRelayNo, aNodeNo,
  aEcuID, aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_SERVERCARDRELAY set ';
  stSql := stSql + ' AC_NODENO = ' + inttostr(strtoint(aNodeNo)) + ',';
  stSql := stSql + ' AC_ECUID = ''' + aEcuID + ''',';
  stSql := stSql + ' RE_READERNO = ''' + aReaderNo + ''' ' ;
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND SR_RELAYNO = ' + aRelayNo ;

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmCardReaderServer.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
  stRelayNo : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  stRelayNo := inttostr(se_RelayNo.Value);
  bResult := DeleteTB_SERVERCARDRELAY(stRelayNo);

  if bResult then ShowCardReaderServer(stRelayNo)
  else showmessage('삭제실패.');

end;

function TfmCardReaderServer.DeleteTB_SERVERCARDRELAY(
  aRelayNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SERVERCARDRELAY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND SR_RELAYNO = ' + aRelayNo ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

end.
