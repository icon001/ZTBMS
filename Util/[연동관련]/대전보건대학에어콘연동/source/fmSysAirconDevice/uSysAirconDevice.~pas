unit uSysAirconDevice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, AdvObj, BaseGrid, AdvGrid,
  ExtCtrls, Spin, uSubForm, CommandArray;

type
  TfmSysAirconDevice = class(TfmASubForm)
    StatusBar1: TStatusBar;
    GroupBox8: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    Panel1: TPanel;
    sg_Code: TAdvStringGrid;
    Panel2: TPanel;
    Label19: TLabel;
    ed_Devicename: TEdit;
    Label1: TLabel;
    ed_DeviceID: TEdit;
    ed_dmscode: TEdit;
    Panel3: TPanel;
    Label4: TLabel;
    cmb_DMS: TComboBox;
    Label2: TLabel;
    cmb_Controler: TComboBox;
    ed_controlerid: TEdit;
    Label5: TLabel;
    cmb_Relay: TComboBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    cmb_Node: TComboBox;
    Label6: TLabel;
    cmb_AlarmArea: TComboBox;
    ed_RelayID: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_DMSChange(Sender: TObject);
    procedure cmb_ControlerChange(Sender: TObject);
    procedure cmb_RelayChange(Sender: TObject);
    procedure cmb_NodeChange(Sender: TObject);
  private
    State : string;
    L_nTopRow : integer;
    L_nRelayCount : integer;
    DMSCodeList : TStringList;
    ControlerCodeList : TStringList;
    RelayCodeList : TStringList;
    NodeCodeList : TStringList;
    AlarmAreaCodeList : TstringList;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure SearchDevice(aCode:String;aTop:integer=0);
    procedure LoadDMS;
    procedure LoadControler;
    procedure LoadRelay;
    procedure LoadNode;
    procedure LoadAlarmArea;
  private
    function GetNextDeviceID(aDmsCode,aControlerID,aRelayID:string):string;

    function InsertIntoTB_SYSAIRCONDEVICE(aDmsCode,aControlerID,aRelayID,aDeviceID,aName,aNodeNo,aEcuID:string):Boolean;
    function UpdateTB_SYSAIRCONDEVICE(aDmsCode,aControlerID,aRelayID,aDeviceID,aName,aNodeNo,aEcuID:string):Boolean;
    function DeleteTB_SYSAIRCONDEVICE(aNodeNo,aControlerID,aRelayID,aDeviceID:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmSysAirconDevice: TfmSysAirconDevice;

implementation
uses
  uDBModule,
  uLomosUtil;
{$R *.dfm}

procedure TfmSysAirconDevice.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSysAirconDevice.ButtonEnable(aState: string);
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

procedure TfmSysAirconDevice.FormClear;
begin
  ed_DeviceID.Text := '';
  ed_DeviceName.Text := '';
  ed_dmscode.Text := '';
  ed_ControlerID.Text := '';
  ed_RelayID.Text := '';
  cmb_Node.ItemIndex := -1;
  cmb_AlarmArea.ItemIndex := -1;
end;

procedure TfmSysAirconDevice.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    ed_DeviceID.Enabled := True;
    ed_Devicename.Enabled := True;
    cmb_Node.Enabled := True;
    cmb_AlarmArea.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    ed_DeviceID.Enabled := False;
    ed_Devicename.Enabled := True;
    cmb_Node.Enabled := True;
    cmb_AlarmArea.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    ed_DeviceID.Enabled := False;
    ed_Devicename.Enabled := False;
    cmb_Node.Enabled := False;
    cmb_AlarmArea.Enabled := False;
  end else if UpperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    ed_DeviceID.Enabled := False;
    ed_Devicename.Enabled := False;
    cmb_Node.Enabled := False;
    cmb_AlarmArea.Enabled := False;
  end;

end;

procedure TfmSysAirconDevice.btn_InsertClick(Sender: TObject);
var
  stNodeNo : string;
  stControlerID : string;
  stRelayID : string;
begin
  if cmb_DMS.itemIndex < 0 then Exit;
  if cmb_Controler.itemIndex < 0 then Exit;
  if cmb_Relay.itemIndex < 0 then Exit;

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
      if RowCount > 9 then TopRow := RowCount - 9;
      Enabled := False;
    end;
  end;
  stNodeNo := DMSCodeList.Strings[cmb_DMS.itemIndex];
  stControlerID := ControlerCodeList.Strings[cmb_Controler.itemIndex];
  stControlerID := copy(stControlerID,4,2);
  stRelayID := RelayCodeList.Strings[cmb_Relay.itemIndex];
  stRelayID := copy(stRelayID,6,2);
  ed_DeviceID.Text := GetNextDeviceID(stNodeNo,stControlerID,stRelayID);
end;

procedure TfmSysAirconDevice.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmSysAirconDevice.btn_DeleteClick(Sender: TObject);
var
  stDmsCode : string;
  stControlerID : string;
  stRelayID : string;
begin
  if cmb_DMS.ItemIndex < 0 then Exit;
  if cmb_Controler.ItemIndex < 0 then Exit;
  if cmb_Relay.ItemIndex < 0 then Exit;
  stDmsCode := DMSCodeList.Strings[cmb_DMS.ItemIndex];
  stControlerID := ControlerCodeList.Strings[cmb_Controler.ItemIndex];
  stControlerID := copy(stControlerID,4,2);
  stRelayID := RelayCodeList.Strings[cmb_Relay.ItemIndex];
  stRelayID := copy(stRelayID,6,2);
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  DeleteTB_SYSAIRCONDEVICE(stDmsCode,stControlerID,stRelayID,ed_DeviceID.Text);
  SearchDevice('');
end;

procedure TfmSysAirconDevice.sg_CodeClick(Sender: TObject);
var
  stNodeNo : string;
  nIndex : integer;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with sg_code do
  begin
    if cells[0,Row] = '' then Exit;
    ed_DeviceID.Text := cells[0,Row];
    ed_Devicename.Text := cells[1,Row];
    ed_dmscode.Text := cells[2,Row];
    ed_ControlerID.Text := cells[3,Row];
    ed_RelayID.Text := cells[4,Row];
    if isDigit(cells[5,Row]) then
    begin
      stNodeNo := FillZeroNumber(strtoint(cells[5,Row]),3);
      nIndex := NodeCodeList.IndexOf(stNodeNo);
      cmb_Node.ItemIndex := nIndex;
      if cells[6,Row] <> '' then
      begin
        nIndex := AlarmAreaCodeList.IndexOf(stNodeNo + cells[6,Row]);
        cmb_AlarmArea.ItemIndex := nIndex;
      end else cmb_AlarmArea.ItemIndex := 0;
    end;
  end;

end;

procedure TfmSysAirconDevice.SearchDevice(aCode: String; aTop: integer);
var
  stSql : string;
  stNodeNo : string;
  stControlerID : string;
  stRelayID : string;
  nRow : integer;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_Code); //스트링그리드 초기화

  if cmb_DMS.ItemIndex < 0 then Exit;
  if cmb_Controler.ItemIndex < 0 then Exit;
  if cmb_Relay.ItemIndex < 0 then Exit;

  stNodeNo := DMSCodeList.Strings[cmb_DMS.ItemIndex];
  stControlerID := ControlerCodeList.Strings[cmb_Controler.ItemIndex];
  stControlerID := copy(stControlerID,4,2);
  stRelayID := RelayCodeList.Strings[cmb_Relay.ItemIndex];
  stRelayID := copy(stRelayID,6,2);

  stSql := 'select * from TB_SYSAIRCONDEVICE ';
  stSql := stSql + ' Where SD_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + stControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' + stRelayID + ''' ';
  stSql := stSql + ' order by SD_DEVICEID ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    sg_Code.RowCount := recordcount + 1;
    nRow := 1;
    While Not Eof do
    begin
      with sg_Code do
      begin
        cells[0,nRow] := FindField('SD_DEVICEID').AsString;
        cells[1,nRow] := FindField('SD_DEVICENAME').AsString;
        cells[2,nRow] := FindField('SD_NODENO').AsString;
        cells[3,nRow] := FindField('SD_CONTROLERID').AsString;
        cells[4,nRow] := FindField('SD_RELAYID').AsString;
        cells[5,nRow] := FindField('AC_NODENO').AsString;
        cells[6,nRow] := FindField('AC_ECUID').AsString;
        if (FindField('SD_NODENO').AsString + FindField('SD_CONTROLERID').AsString + FindField('SD_RELAYID').AsString + FindField('SD_DEVICEID').AsString)  = aCode then
        begin
          SelectRows(nRow,1);
        end;
      end;
      if aTop = 0 then
      begin
        if sg_Code.Row > 9 then sg_Code.TopRow := sg_Code.Row - 9;
      end else
      begin
        sg_Code.TopRow := aTop;
      end;
      inc(nRow);
      Next;
    end;
  end;
  sg_CodeClick(sg_Code);
end;

procedure TfmSysAirconDevice.btn_SaveClick(Sender: TObject);
var
  stDMSCode : string;
  stControlerID : string;
  stRelayID : string;
  stNodeNo : string;
  stEcuID : string;
  i : integer;
begin
  inherited;
  if cmb_DMS.itemIndex < 0 then
  begin
    showmessage('DMS 를 선택 해 주세요');
    Exit;
  end;
  if cmb_Controler.itemIndex < 0 then
  begin
    showmessage('중앙제어기를 선택 해 주세요');
    Exit;
  end;
  if cmb_Relay.itemIndex < 0 then
  begin
    showmessage('중계기를 선택 해 주세요');
    Exit;
  end;
  if Not IsDigit(ed_DeviceID.Text) then
  begin
    showmessage('실내기 ID 를 확인해 주세요.');
    Exit;
  end;
  stDMSCode := DMSCodeList.Strings[cmb_DMS.itemIndex];
  stControlerID := ControlerCodeList.Strings[cmb_Controler.itemIndex];
  stControlerID := copy(stControlerID,4,2);
  stRelayID := RelayCodeList.Strings[cmb_Relay.itemIndex];
  stRelayID := copy(stRelayID,6,2);
  stNodeNo := '0';
  stEcuID := '00';
  if cmb_AlarmArea.ItemIndex > 0 then
  begin
    stNodeNo := copy(AlarmAreaCodeList.Strings[cmb_AlarmArea.ItemIndex],1,3);
    stEcuID := copy(AlarmAreaCodeList.Strings[cmb_AlarmArea.ItemIndex],4,2);
  end;

  if State = 'INSERT' then
  begin
    InsertIntoTB_SYSAIRCONDEVICE(stDMSCode,stControlerID,stRelayID,ed_DeviceID.Text, ed_Devicename.Text,stNodeNo,stEcuID);
  end else if State = 'UPDATE' then
  begin
    UpdateTB_SYSAIRCONDEVICE(stDMSCode,stControlerID,stRelayID,ed_DeviceID.Text, ed_Devicename.Text,stNodeNo,stEcuID);
  end;
  if State = 'UPDATE' then
     SearchDevice(stDMSCode + stControlerID + stRelayID + ed_DeviceID.Text,sg_code.TopRow)
  else SearchDevice(stDMSCode + stControlerID + stRelayID + ed_DeviceID.Text);
end;

function TfmSysAirconDevice.GetNextDeviceID(aDmsCode,aControlerID,aRelayID:string): string;
var
  stSql : string;
begin
  result := '01';
  stSql := ' select Max(SD_DEVICEID) as id from TB_SYSAIRCONDEVICE ';
  stSql := stSql + ' Where SD_NODENO = ' + aDmsCode + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' + aRelayID + ''' ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    if Not isDigit(FindField('id').asstring) then Exit;
    result := FillZeroNumber(strtoint(FindField('id').asstring) + 1,2);
  end;
end;

function TfmSysAirconDevice.DeleteTB_SYSAIRCONDEVICE(aNodeNo,aControlerID,aRelayID,aDeviceID:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONDEVICE ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' + aRelayID + ''' ';
  stSql := stSql + ' AND SD_DEVICEID = ''' + aDeviceID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

procedure TfmSysAirconDevice.btn_CancelClick(Sender: TObject);
begin
  inherited;
  SearchDevice(ed_dmscode.Text + ed_ControlerID.Text + ed_RelayID.Text + ed_DeviceID.Text,sg_Code.TopRow);
end;

procedure TfmSysAirconDevice.FormActivate(Sender: TObject);
begin
  inherited;
  LoadDMS;
  LoadControler;
  LoadRelay;
  LoadNode;
  LoadAlarmArea;
  SearchDevice('');
end;

procedure TfmSysAirconDevice.FormCreate(Sender: TObject);
begin
  inherited;
  DMSCodeList := TStringList.Create;
  ControlerCodeList := TStringList.Create;
  RelayCodeList := TStringList.Create;
  NodeCodeList := TStringList.Create;
  AlarmAreaCodeList := TstringList.Create;
end;

procedure TfmSysAirconDevice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMSCodeList.Free;
  ControlerCodeList.Free;
  RelayCodeList.Free;
  NodeCodeList.Free;
  AlarmAreaCodeList.Free;
end;

procedure TfmSysAirconDevice.LoadDMS;
var
  stSql : string;
begin
  DMSCodeList.Clear;
  cmb_DMS.Items.Clear;
  cmb_DMS.ItemIndex := -1;
  
  stSql := 'select * from TB_SYSAIRCONDMS ';
  stSql := stSql + ' order by SD_NODENO ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    While Not Eof do
    begin
      DMSCodeList.Add(FillZeroNumber(FindField('SD_NODENO').asinteger,3));
      cmb_DMS.Items.Add(FindField('SD_DMSNAME').AsString);
      Next;
    end;
  end;
  cmb_DMS.ItemIndex := 0;

end;

procedure TfmSysAirconDevice.LoadControler;
var
  stSql : string;
  stNodeNo : string;
begin
  ControlerCodeList.Clear;
  cmb_Controler.Items.Clear;
  cmb_Controler.ItemIndex := -1;
  if cmb_DMS.ItemIndex < 0 then Exit;
  stNodeNo := DMSCodeList.Strings[cmb_DMS.ItemIndex];

  stSql := 'select * from TB_SYSAIRCONCONTROLER ';
  stSql := stSql + ' Where SD_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' order by SD_CONTROLERID ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    While Not Eof do
    begin
      ControlerCodeList.Add(FillZeroNumber(FindField('SD_NODENO').asinteger,3) + FindField('SD_CONTROLERID').AsString);
      cmb_Controler.Items.Add(FindField('SD_CONTROLERNAME').AsString);
      Next;
    end;
  end;
  cmb_Controler.ItemIndex := 0;
end;

procedure TfmSysAirconDevice.cmb_DMSChange(Sender: TObject);
begin
  inherited;
  LoadControler;
  LoadRelay;
  SearchDevice('');
end;

function TfmSysAirconDevice.InsertIntoTB_SYSAIRCONDEVICE(aDmsCode,
  aControlerID, aRelayID, aDeviceID, aName,aNodeNo,aEcuID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_SYSAIRCONDEVICE( ';
  stSql := stSql + ' SD_NODENO,';
  stSql := stSql + ' SD_CONTROLERID,';
  stSql := stSql + ' SD_RELAYID,';
  stSql := stSql + ' SD_DEVICEID,';
  stSql := stSql + ' SD_DEVICENAME,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID )';
  stSql := stSql + ' Values(';
  stSql := stSql + ' ' + aDmsCode + ',';
  stSql := stSql + '''' + aControlerID + ''',';
  stSql := stSql + '''' + aRelayID + ''',';
  stSql := stSql + '''' + aDeviceID + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''')';
  result := dmDBModule.ProcessExecSQL(stSql);

end;

procedure TfmSysAirconDevice.cmb_ControlerChange(Sender: TObject);
begin
  inherited;
  LoadRelay;
  SearchDevice('');
end;

procedure TfmSysAirconDevice.LoadRelay;
var
  stSql : string;
  stNodeNo : string;
  stControlerID : string;
begin
  RelayCodeList.Clear;
  cmb_Relay.Items.Clear;
  cmb_Relay.ItemIndex := -1;
  if cmb_DMS.ItemIndex < 0 then Exit;
  if cmb_Controler.ItemIndex < 0 then Exit;
  stNodeNo := DMSCodeList.Strings[cmb_DMS.ItemIndex];
  stControlerID := ControlerCodeList.Strings[cmb_Controler.ItemIndex];
  stControlerID := copy(stControlerID,4,2);

  stSql := 'select * from TB_SYSAIRCONRELAY ';
  stSql := stSql + ' Where SD_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + stControlerID + ''' ';
  stSql := stSql + ' order by SD_RELAYID ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    While Not Eof do
    begin
      RelayCodeList.Add(FillZeroNumber(FindField('SD_NODENO').asinteger,3) + FindField('SD_CONTROLERID').AsString + FindField('SD_RELAYID').AsString);
      cmb_Relay.Items.Add(FindField('SD_RELAYNAME').AsString);
      Next;
    end;
  end;
  cmb_Relay.ItemIndex := 0;
end;

procedure TfmSysAirconDevice.cmb_RelayChange(Sender: TObject);
begin
  inherited;
  SearchDevice('');
end;

procedure TfmSysAirconDevice.LoadAlarmArea;
var
  stSql : string;
  stNodeNo : string;
begin
  AlarmAreaCodeList.Clear;
  cmb_AlarmArea.Items.Clear;
  AlarmAreaCodeList.Add('00000');
  cmb_AlarmArea.Items.Add('');
  cmb_AlarmArea.ItemIndex := 0;
  if cmb_Node.ItemIndex < 0 then Exit;
  stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];

  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' order by AC_ECUID ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    While Not Eof do
    begin
      AlarmAreaCodeList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString);
      cmb_AlarmArea.Items.Add(FindField('AL_ZONENAME').AsString);
      Next;
    end;
  end;
  cmb_AlarmArea.ItemIndex := 0;
end;

procedure TfmSysAirconDevice.LoadNode;
var
  stSql : string;
begin
  NodeCodeList.Clear;
  cmb_Node.Items.Clear;
  cmb_Node.ItemIndex := -1;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where AC_GUBUN = ''0''';
  stSql := stSql + ' order by AC_NODENO ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    While Not Eof do
    begin
      NodeCodeList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3));
      cmb_Node.Items.Add(FindField('AC_DEVICENAME').AsString);
      Next;
    end;
  end;
  cmb_Node.ItemIndex := 0;
end;

procedure TfmSysAirconDevice.cmb_NodeChange(Sender: TObject);
begin
  inherited;
  LoadAlarmArea;
end;

function TfmSysAirconDevice.UpdateTB_SYSAIRCONDEVICE(aDmsCode, aControlerID,
  aRelayID, aDeviceID, aName, aNodeNo, aEcuID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_SYSAIRCONDEVICE set ';
  stSql := stSql + ' SD_DEVICENAME = ''' + aName + ''',';
  stSql := stSql + ' AC_NODENO = ' + aNodeNo + ',';
  stSql := stSql + ' AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' where SD_NODENO = ' + aDmsCode + '';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' + aRelayID + '''';
  stSql := stSql + ' AND SD_DEVICEID = ''' + aDeviceID + '''';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

end.
