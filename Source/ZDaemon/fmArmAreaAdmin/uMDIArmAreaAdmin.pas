unit uMDIArmAreaAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ExtCtrls, RzPanel,
  RzRadGrp, Spin, ComCtrls, Mask, RzEdit, RzSpnEdt, DB, ADODB,ActiveX,Imm,
  AdvObj, uSubForm, CommandArray;

type
  TfmMDIArmArea = class(TfmASubForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    pan_header: TPanel;
    GroupBox4: TGroupBox;
    Splitter2: TSplitter;
    Panel6: TPanel;
    GroupBox10: TGroupBox;
    Label7: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label23: TLabel;
    Label12: TLabel;
    ed_regAlarmName: TEdit;
    cmb_sEcuList: TComboBox;
    ed_regAlarmSeq: TSpinEdit;
    cmb_sBuildingCode: TComboBox;
    cmb_sFloorCode: TComboBox;
    cmb_sAreaCode: TComboBox;
    ed_TotWidth: TEdit;
    ed_TotHeight: TEdit;
    ed_CurX: TEdit;
    ed_CurY: TEdit;
    btnAlarmPosition: TBitBtn;
    chk_AlarmReg: TCheckBox;
    Panel5: TPanel;
    GroupBox11: TGroupBox;
    Label9: TLabel;
    cmb_MCUCode: TComboBox;
    sg_Alarm: TAdvStringGrid;
    GroupBox1: TGroupBox;
    ed_AlarmID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ed_MuxTelNo: TEdit;
    Label79: TLabel;
    Spinner_Ring: TRzSpinner;
    Label14: TLabel;
    SpinEdit_OutDelay: TRzSpinEdit;
    Label4: TLabel;
    Label76: TLabel;
    SpinEdit_InDelay: TRzSpinEdit;
    Label5: TLabel;
    ed_AlarmNo: TEdit;
    ADOQuery: TADOQuery;
    chk_AlaramUpdate: TCheckBox;
    Label6: TLabel;
    se_ArmAreaNo: TSpinEdit;
    cmb_sMCUList: TComboBox;
    Label8: TLabel;
    cmb_Ecu: TComboBox;
    Label10: TLabel;
    chk_DisArmAlarm: TCheckBox;
    Label11: TLabel;
    ed_DisArmCheckFrom: TEdit;
    Label16: TLabel;
    ed_DisArmCheckTo: TEdit;
    Label17: TLabel;
    ed_ArmAreaName: TEdit;
    Label18: TLabel;
    ed_RelayCode: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmb_MCUCodeChange(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_AlarmClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure cmb_sEcuListChange(Sender: TObject);
    procedure cmb_sBuildingCodeChange(Sender: TObject);
    procedure cmb_sFloorCodeChange(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btnAlarmPositionClick(Sender: TObject);
    procedure SpinEdit_OutDelayChange(Sender: TObject);
    procedure SpinEdit_InDelayChange(Sender: TObject);
    procedure ed_AlarmIDChange(Sender: TObject);
    procedure ed_MuxTelNoChange(Sender: TObject);
    procedure cmb_sAreaCodeChange(Sender: TObject);
    procedure ed_regAlarmNameEnter(Sender: TObject);
    procedure cmb_sMCUListChange(Sender: TObject);
    procedure cmb_EcuChange(Sender: TObject);
    procedure ed_ArmAreaNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    MCUIDList : TStringList;
    DeviceIDList : TStringList;
    sMCUIDList : TStringList;
    sDeviceIDList : TStringList;
    sBuildingCodeList : TStringList;
    sFloorCodeList : TStringList;
    sAreaCodeList : TStringList;
    { Private declarations }
    procedure GridInit;
    procedure MCULoad(aList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
    procedure AlarmSearch(aNodeNo,aEcuID,aAlarmNo:string;aTop :integer = 0);
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    //procedure DeviceLoad(cmb_Box:TComboBox);
    procedure EcuLoad(aNodeNo:string;aList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);

    Function GetAlarmNo:integer;
    Function GetAlarmViewSeq :integer;
    Function GetMaxArmAreaNo(aNodeNo,aEcuID:string) : integer;

    function DeleteTB_ZoneDevice(aAlarmNo: string):Boolean;
    function DeleteTB_ADMINALARMDEVICE(aAlarmNo: string):Boolean;
    function DeleteTB_ALARMDEVICE(aAlarmNo: string):Boolean;

    function DupCheckAlaram(aNodeNo,aEcuID,aArmArea:string;aUseCheck:Boolean=True):Boolean;
    function InsertTB_ALARMDEVICE(
                         aNodeNo,
                         aEcuID,
                         aAlarmName,
                         aAlarmViewSeq,
                         aOutDelay,
                         aInDelay,
                         aAlarmID,
                         aMuxTelNo,
                         aRingCnt,
                         aBuildingCode,
                         aFloorCode,
                         aAreaCode,
                         aLocationUse,
                         aTotX,
                         aTotY,
                         aX,
                         aY : string) :Boolean;
    function     UpdateTB_ALARMDEVICE(
                         aNodeNo,
                         aEcuID,
                         aAlarmName,
                         aAlarmViewSeq,
                         aOutDelay,
                         aInDelay,
                         aAlarmID,
                         aMuxTelNo,
                         aRingCnt,
                         aBuildingCode,
                         aFloorCode,
                         aAreaCode,
                         aLocationUse,
                         aTotX,
                         aTotY,
                         aX,
                         aY : string) :Boolean;
    function     UpdateTB_ALARMDEVICEInfo(
                         aNodeNo,
                         aEcuID,
                         aAlarmName,
                         aAlarmViewSeq,
                         aBuildingCode,
                         aFloorCode,
                         aAreaCode,
                         aLocationUse,
                         aTotX,
                         aTotY,
                         aX,
                         aY : string) :Boolean;
    function UpdateTB_ACCESSDEVICEACK(aNodeNo,aECUID,aSendAck:string):Boolean;
    function CreateTB_ZONEDEVICE(aAlarmNo:string):Boolean;
    function InsertTB_ZONEDEVICE(aNodeNo,aEcuID,aAlamName,aZoneNum:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmMDIArmArea: TfmMDIArmArea;
  State : string;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uPositionSet;
{$R *.dfm}

{ TfmAlaramDeviceAdmin }

procedure TfmMDIArmArea.GridInit;
var
  nCol : integer;
begin
  with sg_Alarm do
  begin
    RowCount := 2;
    for nCol := 0 to ColCount - 1 do
    begin
      Cells[nCol,1] := '';
    end;
    for nCol := 4 to ColCount - 1 do
    begin
      ColWidths[nCol] := 0;
    end;
  end;
end;

procedure TfmMDIArmArea.MCULoad(aList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
var
  stSql : string;
  stDeviceName : string;
begin
  aList.Clear;
  cmb_Box.Clear;
  if aAll then
  begin
    aList.Add('');
    cmb_Box.Items.Add('전체');
  end;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  stSql := stSql + ' order by AC_NODENO ';
  with AdoQuery do
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
    while Not Eof do
    begin
      if FindField('AC_DEVICENAME').AsString = '' then stDeviceName := FindField('AC_MCUIP').AsString
      else stDeviceName := FindField('AC_DEVICENAME').AsString;
      cmb_Box.Items.Add(stDeviceName);
      aList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3));
      Next;
    end;
  end;
  if cmb_Box.Items.Count > 0 then cmb_Box.ItemIndex := 0;
end;

procedure TfmMDIArmArea.FormCreate(Sender: TObject);
begin
  MCUIDList := TStringList.Create;
  MCUIDList.Clear;
  DeviceIDList := TStringList.Create;
  DeviceIDList.Clear;
  sMCUIDList := TStringList.Create;
  sDeviceIDList := TStringList.Create;
  sBuildingCodeList := TStringList.Create;
  sBuildingCodeList.Clear;
  sFloorCodeList := TStringList.Create;
  sFloorCodeList.Clear;
  sAreaCodeList := TStringList.Create;
  sAreaCodeList.Clear;

  MCULoad(MCUIDList,cmb_MCUCode,True);
  //DeviceLoad(cmb_regDeviceCode);
  LoadsBuildingCode(cmb_sBuildingCode);
end;

procedure TfmMDIArmArea.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MCUIDList.Free;
  DeviceIDList.Free;
  sMCUIDList.Free;
  sDeviceIDList.Free;
  sBuildingCodeList.Free;
  sFloorCodeList.Free;
  sAreaCodeList.Free;

  self.FindSubForm('Main').FindCommand('RESTART').Execute;

  Action := caFree;
end;

procedure TfmMDIArmArea.AlarmSearch(aNodeNo,aEcuID,
  aAlarmNo: string;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
  stArmAreaNo : string;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInit; //스트링그리드 초기화

  stSql := 'select a.*,b.AC_DEVICENAME as ECUNAME from TB_ARMAREA a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AR_USE = ''Y'' ';
  if (aNodeNo <> '') and (aNodeNo <> '000') then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
    if (aECUID <> '') then stSql := stSql + ' AND a.AC_ECUID = ''' + aECUID + ''' ' ;
  end;
  if ed_ArmAreaName.Text <> '' then stSql := stSql + ' AND a.AR_NAME Like ''%' + ed_ArmAreaName.Text + '%'' ';
  stSql := stSql + ' order by a.AR_VIEWSEQ,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO ';

  Try
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
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      sg_Alarm.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_Alarm do
        begin
          cells[0,nRow] := FindField('AR_NAME').AsString;
          cells[1,nRow] := FindField('ECUNAME').AsString;
          cells[2,nRow] := FindField('AC_ECUID').AsString;
          if isDigit(FindField('AR_AREANO').AsString) then stArmAreaNo := inttostr(strtoint(FindField('AR_AREANO').AsString))
          else stArmAreaNo := '0';
          cells[3,nRow] := stArmAreaNo;
          cells[4,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + stArmAreaNo;
          cells[5,nRow] := FindField('AC_NODENO').AsString;
          cells[6,nRow] := FindField('AR_VIEWSEQ').AsString;
//          cells[6,nRow] := FindField('AL_OUTDELAY').AsString;
//          cells[7,nRow] := FindField('AL_INDELAY').AsString;
//          cells[8,nRow] := FindField('AL_ALARMID').AsString;
//          cells[9,nRow] := FindField('AL_MUXTELNO').AsString;
//          cells[10,nRow] := FindField('AL_REMOTERINGCNT').AsString;
          cells[12,nRow] := FindField('LO_DONGCODE').AsString;
          cells[13,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[14,nRow] := FindField('LO_AREACODE').AsString;
          cells[15,nRow] := FindField('AR_LOCATEUSE').AsString;
          cells[16,nRow] := FindField('AR_TOTWIDTH').AsString;
          cells[17,nRow] := FindField('AR_TOTHEIGHT').AsString;
          cells[18,nRow] := FindField('AR_CURX').AsString;
          cells[19,nRow] := FindField('AR_CURY').AsString;
          cells[20,nRow] := FindField('AR_DISARMCHECKUSE').AsString;
          cells[21,nRow] := FindField('AR_DISARMCHECKTIME1FROM').AsString;
          cells[22,nRow] := FindField('AR_DISARMCHECKTIME1TO').AsString;
          cells[23,nRow] := FindField('AR_RelayCode').AsString;

          if (FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + stArmAreaNo)  = aAlarmNo then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
        end;
        Next;
      end;
      if aTop <> 0 then
        sg_Alarm.topRow := aTop
      else
      begin
        if sg_Alarm.row > 12 then sg_Alarm.TopRow := sg_Alarm.row - 11;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_AlarmClick(sg_Alarm);

end;

procedure TfmMDIArmArea.FormClear;
begin
  cmb_sMCUList.ItemIndex := -1;
  cmb_sEcuList.ItemIndex := -1;
  se_ArmAreaNo.Value := 0;
  ed_regAlarmName.Text := '';
  ed_regAlarmSeq.Value := 0;
  SpinEdit_OutDelay.Value := 0;
  SpinEdit_InDelay.Value := 0;
  ed_AlarmID.Text := '';
  ed_MuxTelNo.Text := '';
  Spinner_Ring.Value := 10;
  cmb_sBuildingCode.ItemIndex := -1;
  cmb_sFloorCode.Clear;
  cmb_sAreaCode.Clear;
  ed_TotWidth.Text := '0';
  ed_TotHeight.Text := '0';
  ed_CurX.Text := '0';
  ed_CurY.Text := '0';
  chk_DisArmAlarm.Checked := False;

  ed_AlarmNo.Text := '';
  ed_RelayCode.Text := '';
end;

procedure TfmMDIArmArea.ButtonEnable(aState: string);
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

procedure TfmMDIArmArea.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    //Alarm Form Enable
    sg_Alarm.Enabled := False;
    cmb_sMCUList.Enabled := True;
    cmb_sEcuList.Enabled := True;
    se_ArmAreaNo.Enabled := True;
    ed_AlarmNo.Enabled := True;
    ed_regAlarmName.Enabled := True;
    ed_regAlarmSeq.Enabled := True;
    SpinEdit_OutDelay.Enabled := True;
    SpinEdit_InDelay.Enabled := True;
    ed_AlarmID.Enabled := False;
    ed_MuxTelNo.Enabled := False;
    Spinner_Ring.Enabled := False;
    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    chk_AlarmReg.Enabled := True;
    btnAlarmPosition.Enabled := True;
    chk_DisArmAlarm.Enabled := True;
    ed_DisArmCheckFrom.Enabled := True;
    ed_DisArmCheckTo.Enabled := True;
    ed_RelayCode.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    //Alarm Form Enable
    sg_Alarm.Enabled := False;
    cmb_sMCUList.Enabled := False;
    cmb_sEcuList.Enabled := False;
    se_ArmAreaNo.Enabled := True;
    ed_AlarmNo.Enabled := True;
    ed_regAlarmName.Enabled := True;
    ed_regAlarmSeq.Enabled := True;
    SpinEdit_OutDelay.Enabled := True;
    SpinEdit_InDelay.Enabled := True;
    ed_AlarmID.Enabled := False;
    ed_MuxTelNo.Enabled := False;
    Spinner_Ring.Enabled := False;
    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    chk_AlarmReg.Enabled := True;
    btnAlarmPosition.Enabled := True;
    chk_DisArmAlarm.Enabled := True;
    ed_DisArmCheckFrom.Enabled := True;
    ed_DisArmCheckTo.Enabled := True;
    ed_RelayCode.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    //Alarm Form Enable
    sg_Alarm.Enabled := True;
    cmb_sMCUList.Enabled := False;
    cmb_sEcuList.Enabled := False;
    se_ArmAreaNo.Enabled := False;
    ed_AlarmNo.Enabled := False;
    ed_regAlarmName.Enabled := False;
    ed_regAlarmSeq.Enabled := False;
    SpinEdit_OutDelay.Enabled := False;
    SpinEdit_InDelay.Enabled := False;
    ed_AlarmID.Enabled := False;
    ed_MuxTelNo.Enabled := False;
    Spinner_Ring.Enabled := False;
    cmb_sBuildingCode.Enabled := False;
    cmb_sFloorCode.Enabled := False;
    cmb_sAreaCode.Enabled := False;
    chk_AlarmReg.Enabled := False;
    btnAlarmPosition.Enabled := False;
    chk_DisArmAlarm.Enabled := False;
    ed_DisArmCheckFrom.Enabled := False;
    ed_DisArmCheckTo.Enabled := False;
    ed_RelayCode.Enabled := False;
  end;
end;

procedure TfmMDIArmArea.FormShow(Sender: TObject);
begin
  pan_header.Caption := Caption;
  AlarmSearch('000','','');
end;

procedure TfmMDIArmArea.cmb_MCUCodeChange(Sender: TObject);
var
  stNodeNo : string;
begin
  if cmb_MCUCode.itemIndex = -1 then cmb_MCUCode.itemIndex := 0;
  stNodeNo := MCUIDList.Strings[cmb_MCUCode.itemIndex];
  EcuLoad(stNodeNo,DeviceIDList,cmb_Ecu,True);
  AlarmSearch(stNodeNo,'','');
end;

procedure TfmMDIArmArea.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMDIArmArea.sg_AlarmClick(Sender: TObject);
var
  stNodeNo : string;
  stECUID : string;
  stBuildingCode,stFloorCode : string;
begin

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_AlarmNo.Text := cells[4,Row];
    stNodeNo := FillZeroNumber(strtoint(cells[5,Row]),3) ;
    stECUID := cells[2,Row];
    MCULoad(sMCUIDList,cmb_sMCUList,False);
    cmb_sMCUList.ItemIndex := sMCUIDList.IndexOf(stNodeNo);
    EcuLoad(stNodeNo,sDeviceIDList,cmb_sEcuList,False);
    cmb_sEcuList.ItemIndex := sDeviceIDList.IndexOf(stECUID);

    if Not IsDigit(cells[3,Row]) then cells[3,Row] := '0';
    se_ArmAreaNo.Value := strtoint(cells[3,Row]);

    ed_regAlarmName.Text  := cells[0,Row];

    if Not IsDigit(cells[7,Row]) then cells[7,Row] := '0';
    SpinEdit_OutDelay.Value := strtoint(cells[7,Row]);
    if Not IsDigit(cells[8,Row]) then cells[8,Row] := '0';
    SpinEdit_InDelay.Value := strtoint(cells[8,Row]);
    ed_AlarmID.Text := cells[9,Row];
    ed_MuxTelNo.Text := cells[10,Row];
    if Not IsDigit(cells[11,Row]) then cells[11,Row] := '10';
    Spinner_Ring.Value := strtoint(cells[11,Row]);

    if (cells[12,Row] = '') or (cells[12,Row] = '000') then cmb_sBuildingCode.ItemIndex := 0
    else cmb_sBuildingCode.ItemIndex := sBuildingCodeList.IndexOf(cells[12,Row]);
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
    LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
    if (cells[13,Row] = '') or (cells[13,Row] = '000') then cmb_sFloorCode.ItemIndex := 0
    else cmb_sFloorCode.ItemIndex := sFloorCodeList.IndexOf(cells[13,Row]);
    if cmb_sFloorCode.itemindex < 1 then stFloorCode := ''
    else stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
    LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);
    if (cells[14,Row] = '') or (cells[14,Row] = '000') then cmb_sAreaCode.ItemIndex := 0
    else cmb_sAreaCode.ItemIndex := sAreaCodeList.IndexOf(cells[14,Row]);

    if Not isDigit(cells[6,Row]) then cells[6,Row] := '0';
    ed_regAlarmSeq.Value := strtoint(cells[6,Row]);
    if cells[15,Row] = 'Y' then chk_AlarmReg.Checked := True
    else chk_AlarmReg.Checked := False;
    ed_TotWidth.Text := cells[16,Row];
    ed_TotHeight.Text := cells[17,Row];
    ed_CurX.Text := cells[18,Row];
    ed_CurY.Text := cells[19,Row];
    if cells[20,Row] = '1' then chk_DisArmAlarm.Checked := True;
    ed_DisArmCheckFrom.Text := cells[21,Row];
    ed_DisArmCheckTo.Text := cells[22,Row];
    ed_RelayCode.Text := cells[23,Row];

  end;

end;
 {
procedure TfmArmAreaAdmin.DeviceLoad(cmb_Box: TComboBox);
var
  stSql : string;
  stDeviceName : string;
begin
  DeviceIDList.Clear;
  cmb_Box.Clear;
  DeviceIDList.Add('');
  cmb_Box.Items.Add('');

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_PTTYPE = ''1'' ';
  stSql := stSql + ' order by AC_NODENO,AC_ECUID ';
  with AdoQuery do
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
    while Not Eof do
    begin
      if FindField('AC_DEVICENAME').AsString = '' then stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_MCUIP').AsString
      else stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_DEVICENAME').AsString;
      cmb_Box.Items.Add(stDeviceName);
      DeviceIDList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString );
      Next;
    end;
  end;

end;
       }
procedure TfmMDIArmArea.LoadsBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sBuildingCodeList.Clear;

  cmb_Box.Items.Add('');
  sBuildingCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';
  
  Try
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
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        sBuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIArmArea.LoadsFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sFloorCodeList.Clear;

  cmb_Box.Items.Add('');
  sFloorCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE ';

  Try
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
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        sFloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIArmArea.LoadsAreaCode(aBuildingCode,
  aFloorCode: string; cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sAreaCodeList.Clear;

  cmb_Box.Items.Add('');
  sAreaCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if (aFloorCode <> '') And (aFloorCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
  end else Exit;
  stSql := stsql + ' order by LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ';

  Try
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
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        sAreaCodeList.Add(FindField('LO_AREACODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIArmArea.btn_InsertClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with sg_Alarm do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 5 then TopRow := RowCount - 5;
      Enabled := False;
    end;
  end;

  stNodeNo := '';
  stEcuID := '';
  MCULoad(sMCUIDList,cmb_sMCUList,False);
  if cmb_MCUCode.ItemIndex > 0 then
  begin
    stNodeNo := MCUIDList.Strings[cmb_MCUCode.ItemIndex];
    if cmb_Ecu.ItemIndex > 0 then stEcuID := DeviceIDList.Strings[cmb_Ecu.ItemIndex];
  end;
  cmb_sMCUList.ItemIndex := sMCUIDList.IndexOf(stNodeNo);
  if cmb_sMCUList.ItemIndex > -1 then
  begin
    EcuLoad(stNodeNo,sDeviceIDList,cmb_sEcuList,False);
    cmb_sEcuList.ItemIndex := sDeviceIDList.IndexOf(stECUID);
    cmb_sEcuListChange(cmb_sEcuList);
  end;

  ed_regAlarmName.SetFocus;
  //ed_AlarmNo.Text := inttostr(GetAlarmNo);
  ed_regAlarmSeq.Value := GetAlarmViewSeq;

end;

function TfmMDIArmArea.GetAlarmNo: integer;
var
  stSql : string;
begin
{  result := 1;
  stSql := ' Select Max(AL_DEVICENO) as AlarmNo ';
  stSql := stSql + ' from TB_ALARMDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';

  With AdoQuery do
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
    if Not IsDigit(FindField('AlarmNo').AsString) then Exit;
    result := FindField('AlarmNo').AsInteger + 1;
  end;  }
end;

procedure TfmMDIArmArea.cmb_sEcuListChange(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  nNextArmArea : integer;
begin
  stNodeNo := '';
  stEcuID := '';
  if cmb_sMCUList.ItemIndex < 0 then Exit;
  if cmb_sEcuList.ItemIndex < 0 then exit;
  stNodeNo := sMCUIDList.Strings[cmb_sMCUList.ItemIndex];
  stEcuID := sDeviceIDList.Strings[cmb_sEcuList.ItemIndex];
  if cmb_sEcuList.ItemIndex > -1 then
  begin
    nNextArmArea := GetMaxArmAreaNo(stNodeNo,stEcuID);
    if nNextArmArea > con_nFIXMAXAREANO then
    begin
      se_ArmAreaNo.Value := 0;
    end else se_ArmAreaNo.Value := nNextArmArea ;
    if Uppercase(State) = 'INSERT' then
    begin
      if se_ArmAreaNo.Value = 0 then
      begin
        ed_regAlarmName.Text := cmb_sEcuList.Text;
      end else
      begin
        ed_regAlarmName.Text := cmb_sEcuList.Text + '_' + inttostr(se_ArmAreaNo.Value) + '구역';
      end;
    end;
  end;
end;

procedure TfmMDIArmArea.cmb_sBuildingCodeChange(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_sBuildingCode.itemindex < 0 then
  begin
    cmb_sBuildingCode.Text := '';
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
  cmb_sAreaCode.Clear;

end;

procedure TfmMDIArmArea.cmb_sFloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  if cmb_sBuildingCode.itemindex < 0 then
  begin
    cmb_sBuildingCode.Text := '';
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  if cmb_sFloorCode.itemindex < 0 then
  begin
    cmb_sFloorCode.Text := '';
    Exit;
  end;
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);

end;

function TfmMDIArmArea.GetAlarmViewSeq: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select Max(AR_VIEWSEQ) as AR_VIEWSEQ from TB_ARMAREA ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

  with AdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if Not IsDigit(FindField('AR_VIEWSEQ').AsString) then result := 1
    else result := FindField('AR_VIEWSEQ').AsInteger + 1;
  end;
end;

procedure TfmMDIArmArea.btn_UpdateClick(Sender: TObject);
var
  stEcuID : string;
begin
  chk_AlaramUpdate.Checked := False;
    
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmMDIArmArea.btn_CancelClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := '';
  stEcuID := '';
  if cmb_MCUCode.itemIndex > 0  then stNodeNo := MCUIDList.Strings[cmb_MCUCode.itemIndex];
  if cmb_Ecu.itemIndex > 0  then stEcuID := DeviceIDList.Strings[cmb_Ecu.itemIndex];
  if UpperCase(State) = 'UPDATE' then AlarmSearch(stNodeNo,stEcuID,ed_AlarmNo.text,sg_Alarm.topRow)
  else AlarmSearch(stNodeNo,stEcuID,ed_AlarmNo.text);
end;

procedure TfmMDIArmArea.btn_SaveClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stOldAlarmArea : string;
  stAlarmName : string;
  stArmAreaNo : string;
  stBuildingCode,stFloorCode,stAreaCode : string;
  stLocationUse : string;
  stTotX,stTotY,stX,stY : string;
  bUpdateKeyChange : Boolean;
  i : integer;
  stSql : string;
  stDisArmEventUse : string;
begin

  stOldAlarmArea := '';
  if Length(ed_AlarmNo.Text) > 5 then stOldAlarmArea := copy(ed_AlarmNo.Text,6,1);
  stNodeNo := sMCUIDList.Strings[cmb_sMCUList.itemIndex];
  stEcuID := sDeviceIDList.Strings[cmb_sEcuList.itemIndex];
  stArmAreaNo := inttostr(se_ArmAreaNo.Value);
  stAlarmName := ed_regAlarmName.Text;
  stBuildingCode := '000';
  if cmb_sBuildingCode.ItemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode.ItemIndex];
  stFloorCode := '000';
  if cmb_sFloorCode.ItemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode.ItemIndex];
  stAreaCode := '000';
  if cmb_sAreaCode.ItemIndex > 0 then stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.ItemIndex];
  stLocationUse := 'N';
  if chk_AlarmReg.Checked then stLocationUse := 'Y';
  stTotX := '0';
  if IsDigit(ed_TotWidth.text) then stTotX := ed_TotWidth.text;
  stTotY := '0';
  if IsDigit(ed_TotHeight.text) then stTotY := ed_TotHeight.text;
  stX := '0';
  if IsDigit(ed_CurX.text) then stX := ed_CurX.text;
  stY := '0';
  if IsDigit(ed_CurY.text) then stY := ed_CurY.text;

  stDisArmEventUse := '0';
  if chk_DisArmAlarm.Checked then stDisArmEventUse := '1';

  if cmb_sMCUList.ItemIndex < 0 then
  begin
    showmessage('방범 구역을 설정할 기기를 선택해 주세요.');
    Exit;
  end;

  bUpdateKeyChange := False;
  if UpperCase(State) = 'UPDATE' then
  begin
    if ed_AlarmNo.Text <> stNodeNo + stEcuID + stArmAreaNo then bUpdateKeyChange := True; //키값이 변경 된 경우
  end;

  if cmb_sEcuList.ItemIndex > -1 then
  begin
    if (UpperCase(State) = 'INSERT') or
       bUpdateKeyChange then
    begin
      if DupCheckAlaram(stNodeNo,stEcuID,stArmAreaNo) then
      begin
        showmessage('선택된 기기의 방범 구역이 이미 지정되어 있습니다.');
        Exit;
      end;
    end;
  end else
  begin
    showmessage('방범 구역을 설정할 기기를 선택해 주세요.');
    Exit;
  end;

  if UpperCase(State) = 'INSERT' then
  begin
    if se_ArmAreaNo.Value > 0 then //방범구역이 0 보다 큰 경우는 0번의 방범구역을 해제 해야 함.
    begin
      if DupCheckAlaram(stNodeNo,stEcuID,'0') then  //0번 방범 구역을 사용 하고 있음
      begin
        if (Application.MessageBox(PChar('구역경계를 사용하는 경우 컨트롤러 방범구역은 삭제 됩니다. 계속 하시겠습니까?'),'정보',MB_OKCANCEL) = ID_CANCEL)  then Exit;
        stSql := ' Update TB_ARMAREA set AR_USE = ''N'' ';
        stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
        stSql := stSql + ' AND AC_NODENO = ' + stNodeNo + ' ';
        stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';
        stSql := stSql + ' AND AR_AREANO = ''00'' ';

        DataModule1.ProcessExecSQL(stSql);
      end;
    end else //방범구역이 0 인 경우에는 구역경계를 사용 하지 않음
    begin
      for i := 1 to con_nFIXMAXAREANO do
      begin
        if DupCheckAlaram(stNodeNo,stEcuID,inttostr(i)) then  //0번 방범 구역을 사용 하고 있음
        begin
          if (Application.MessageBox(PChar('컨트롤러 방범구역을 사용하는 경우 구역경계는 삭제 됩니다. 계속 하시겠습니까?'),'정보',MB_OKCANCEL) = ID_CANCEL)  then Exit;

          stSql := ' Update TB_ARMAREA set AR_USE = ''N'' ';
          stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
          stSql := stSql + ' AND AC_NODENO = ' + stNodeNo + ' ';
          stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';
          stSql := stSql + ' AND AR_AREANO <> ''00'' ';

          DataModule1.ProcessExecSQL(stSql);
          break;
        end;
      end;
    end;
  end else if UpperCase(State) = 'UPDATE' then
  begin
    if bUpdateKeyChange then
    begin
      //여기에서 이전  Key 사용 안함
      stSql := ' Update TB_ARMAREA set AR_USE = ''N'' ';
      stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND AC_NODENO = ' + stNodeNo + ' ';
      stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';
      stSql := stSql + ' AND AR_AREANO = ''' + '0' + stOldAlarmArea + ''' ';

      DataModule1.ProcessExecSQL(stSql);
    end;
  end;
  
  if DupCheckAlaram(stNodeNo,stEcuID,stArmAreaNo,False) then
  begin
(*
    stSql := ' Update TB_ARMAREA set AR_USE = ''Y'', ';
    stSql := stSql + ' AR_NAME = ''' + stAlarmName + ''',';
    stSql := stSql + ' AR_VIEWSEQ = ' + inttostr(ed_regAlarmSeq.Value) + ' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + stNodeNo + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';
    stSql := stSql + ' AND AR_AREANO = ''' + '0' + stArmAreaNo + ''' ';

    DataModule1.ProcessExecSQL(stSql);
*)
    stSql := ' Update TB_ARMAREA set AR_USE = ''Y'', ';
    stSql := stSql + ' AR_NAME = ''' + stAlarmName + ''',';
    stSql := stSql + ' AR_VIEWSEQ = ' + inttostr(ed_regAlarmSeq.Value) + ', ';
    stSql := stSql + 'LO_DONGCODE = ''' + stBuildingCode + ''',';
    stSql := stSql + 'LO_FLOORCODE = ''' + stFloorCode + ''',';
    stSql := stSql + 'LO_AREACODE = ''' + stAreaCode + ''',';
    stSql := stSql + 'AR_LOCATEUSE = ''' + stLocationUse + ''',';
    stSql := stSql + 'AR_TOTWIDTH = ' + stTotX + ',';
    stSql := stSql + 'AR_TOTHEIGHT = ' + stTotY + ',';
    stSql := stSql + 'AR_CURX = ' + stX + ',';
    stSql := stSql + 'AR_CURY = ' + stY + ', ';
    stSql := stSql + 'AR_UPDATE = ''Y'', ';
    stSql := stSql + 'AR_DISARMCHECKUSE = ' + stDisArmEventUse + ', ';
    stSql := stSql + 'AR_DISARMCHECKTIME1FROM = ''' + ed_DisArmCheckFrom.Text + ''',';
    stSql := stSql + 'AR_DISARMCHECKTIME1TO = ''' + ed_DisArmCheckTO.Text + ''',';
    stSql := stSql + 'AR_RelayCode = ''' + ed_RelayCode.Text + ''',';
    stSql := stSql + 'AR_MEMLOAD = ''N'', ';
    stSql := stSql + 'AR_Change = ''Y'' ';


    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + stNodeNo + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';
    stSql := stSql + ' AND AR_AREANO = ''' + '0' + stArmAreaNo + ''' ';

    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    stSql := ' Insert Into TB_ARMAREA ( ';
    stSql := stSql + ' GROUP_CODE,';
    stSql := stSql + ' AC_NODENO,';
    stSql := stSql + ' AC_ECUID,';
    stSql := stSql + ' AR_AREANO,';
    stSql := stSql + ' AR_NAME,';
    stSql := stSql + ' AR_VIEWSEQ,';
    stSql := stSql + ' LO_DONGCODE,';
    stSql := stSql + ' LO_FLOORCODE,';
    stSql := stSql + ' LO_AREACODE,';
    stSql := stSql + ' AR_LOCATEUSE,';
    stSql := stSql + ' AR_TOTWIDTH,';
    stSql := stSql + ' AR_TOTHEIGHT,';
    stSql := stSql + ' AR_CURX,';
    stSql := stSql + ' AR_CURY,';
    stSql := stSql + ' AR_UPDATE,';
    stSql := stSql + ' AR_RelayCode ,';
    stSql := stSql + ' AR_Change ,';
    stSql := stSql + ' AR_USE ) ';
    stSql := stSql + ' Values( ';
    stSql := stSql + ' ''' + GROUPCODE + ''', ';
    stSql := stSql + ' ' + stNodeNo + ', ';
    stSql := stSql + ' ''' + stEcuID + ''', ';
    stSql := stSql + ' ''' + '0' + stArmAreaNo + ''', ';
    stSql := stSql + ' ''' + stAlarmName + ''',';
    stSql := stSql + ' ' + inttostr(ed_regAlarmSeq.Value) + ', ';
    stSql := stSql + ' ''' + stBuildingCode + ''',';
    stSql := stSql + ' ''' + stFloorCode + ''',';
    stSql := stSql + ' ''' + stAreaCode + ''',';
    stSql := stSql + ' ''' + stLocationUse + ''',';
    stSql := stSql + ' ' + stTotX + ',';
    stSql := stSql + ' ' + stTotY + ',';
    stSql := stSql + ' ' + stX + ',';
    stSql := stSql + ' ' + stY + ', ';
    stSql := stSql + ' ''Y'', ';
    stSql := stSql + ' ''' + ed_RelayCode.Text + ''',' ;
    stSql := stSql + ' ''Y'', ';
    stSql := stSql + ' ''Y'') ';

    DataModule1.ProcessExecSQL(stSql);
  end;

  stNodeNo := '';
  stEcuID := '';
  if cmb_MCUCode.itemIndex > 0 then  stNodeNo := MCUIDList.Strings[cmb_MCUCode.itemIndex];
  if cmb_Ecu.itemIndex > 0 then  stEcuID := DeviceIDList.Strings[cmb_Ecu.itemIndex];
  if UpperCase(State) = 'UPDATE' then AlarmSearch(stNodeNo,stEcuID,ed_AlarmNo.text,sg_Alarm.topRow)
  else AlarmSearch(stNodeNo,stEcuID,ed_AlarmNo.text);

end;

procedure TfmMDIArmArea.btn_DeleteClick(Sender: TObject);
var
  stDeviceID : string;
  stNodeNo : string;
  stEcuID : string;
  stSql : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
//  stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
//  DeleteTB_ZoneDevice(ed_AlarmNo.Text);
//  DeleteTB_ADMINALARMDEVICE(ed_AlarmNo.Text);
//  DeleteTB_ALARMDEVICE(ed_AlarmNo.Text);

  stSql := ' Update TB_ARMAREA set AR_USE = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + copy(ed_AlarmNo.Text,1,3);
  stSql := stSql + ' AND AC_ECUID = ''' + copy(ed_AlarmNo.Text,4,2) + ''' ';
  stSql := stSql + ' AND AR_AREANO = ''' + '0' + copy(ed_AlarmNo.Text,6,1) + ''' ';

  DataModule1.ProcessExecSQL(stSql);

  stNodeNo := '';
  stEcuID := '';
  if cmb_MCUCode.itemIndex > 0 then  stNodeNo := MCUIDList.Strings[cmb_MCUCode.itemIndex];
  if cmb_Ecu.itemIndex > 0 then  stEcuID := DeviceIDList.Strings[cmb_Ecu.itemIndex];
  AlarmSearch(stNodeNo,stEcuID,'');
end;

function TfmMDIArmArea.DeleteTB_ZoneDevice(aAlarmNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ZONEDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3))) ;
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMDIArmArea.DeleteTB_ADMINALARMDEVICE(
  aAlarmNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ADMINALARMDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3))) ;
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMDIArmArea.DeleteTB_ALARMDEVICE(
  aAlarmNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ALARMDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3))) ;
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMDIArmArea.DupCheckAlaram(aNodeNo,
  aEcuID,aArmArea: string;aUseCheck:Boolean=True): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'select * from TB_ARMAREA ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND AR_AREANO = ''' + '0' + aArmArea + ''' ';
  if aUseCheck then stSql := stSql + ' AND AR_USE = ''Y'' ';
  with AdoQuery do
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
    result := True;
  end;
end;

function TfmMDIArmArea.InsertTB_ALARMDEVICE(aNodeNo,
  aEcuID, aAlarmName, aAlarmViewSeq, aOutDelay, aInDelay, aAlarmID,
  aMuxTelNo, aRingCnt, aBuildingCode, aFloorCode, aAreaCode, aLocationUse,
  aTotX, aTotY, aX, aY: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ALARMDEVICE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AL_ZONENAME,';
  stSql := stSql + 'AL_VIEWSEQ,';
//  stSql := stSql + 'AL_OUTDELAY,';
//  stSql := stSql + 'AL_INDELAY,';
//  stSql := stSql + 'AL_ALARMID,';
//  stSql := stSql + 'AL_MUXTELNO,';
//  stSql := stSql + 'AL_REMOTERINGCNT,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'AL_LOCATEUSE,';
  stSql := stSql + 'AL_TOTWIDTH,';
  stSql := stSql + 'AL_TOTHEIGHT,';
  stSql := stSql + 'AL_CURX,';
  stSql := stSql + 'AL_CURY,';
  stSql := stSql + 'SEND_ACK, ';
  stSql := stSql + 'AL_UPDATE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aAlarmName +''',';
  stSql := stSql + aAlarmViewSeq + ',';
//  stSql := stSql + aOutDelay + ',';
//  stSql := stSql + aInDelay + ',';
//  stSql := stSql + '''' + aAlarmID + ''',';
//  stSql := stSql + '''' + aMuxTelNo + ''',';
//  stSql := stSql + aRingCnt + ',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aLocationUse + ''',';
  stSql := stSql + aTotX + ',';
  stSql := stSql + aTotY + ',';
  stSql := stSql + aX + ',';
  stSql := stSql + aY + ',';
  stSql := stSql + '''N'', ';
  stSql := stSql + '''Y'') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIArmArea.UpdateTB_ALARMDEVICE(aNodeNo,
  aEcuID, aAlarmName, aAlarmViewSeq, aOutDelay, aInDelay, aAlarmID,
  aMuxTelNo, aRingCnt, aBuildingCode, aFloorCode, aAreaCode, aLocationUse,
  aTotX, aTotY, aX, aY: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMDEVICE set ';
  stSql := stSql + 'AL_ZONENAME = ''' + aAlarmName +''',';
  stSql := stSql + 'AL_VIEWSEQ = ' + aAlarmViewSeq + ',';
//  stSql := stSql + 'AL_OUTDELAY = ' + aOutDelay + ',';
//  stSql := stSql + 'AL_INDELAY = ' + aInDelay + ',';
//  stSql := stSql + 'AL_ALARMID = ''' + aAlarmID + ''',';
//  stSql := stSql + 'AL_MUXTELNO = ''' + aMuxTelNo + ''',';
//  stSql := stSql + 'AL_REMOTERINGCNT = ' + aRingCnt + ',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AL_LOCATEUSE = ''' + aLocationUse + ''',';
  stSql := stSql + 'AL_TOTWIDTH = ' + aTotX + ',';
  stSql := stSql + 'AL_TOTHEIGHT = ' + aTotY + ',';
  stSql := stSql + 'AL_CURX = ' + aX + ',';
  stSql := stSql + 'AL_CURY = ' + aY + ',';
  stSql := stSql + 'SEND_ACK = ''N'', ';
  stSql := stSql + 'AL_UPDATE = ''Y'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
//  stSql := stSql + ' AND AL_DEVICENO = ' + aAlarmNo ;
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMDIArmArea.CreateTB_ZONEDEVICE(
  aAlarmNo: string): Boolean;
var
  i : integer;
begin
  for i := 1 to ZONECOUNT do
  begin
    InsertTB_ZONEDEVICE(copy(aAlarmNo,1,3),copy(aAlarmNo,4,2),ed_regAlarmName.Text,inttostr(i));
  end;
end;

function TfmMDIArmArea.InsertTB_ZONEDEVICE(aNodeNo,aEcuID,aAlamName,
  aZoneNum: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ZONEDEVICE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AL_ZONENUM,';
  stSql := stSql + 'AL_ZONENAME,';
  stSql := stSql + 'AL_LOCATEUSE,';
  stSql := stSql + 'AL_TOTWIDTH,';
  stSql := stSql + 'AL_TOTHEIGHT,';
  stSql := stSql + 'AL_CURX,';
  stSql := stSql + 'AL_CURY,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'AL_WATCHTYPE,';
  stSql := stSql + 'SEND_ACK) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + inttostr(strtoint(aNodeNo)) + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aZoneNum + ''',';
  stSql := stSql + '''' + aAlamName + '-' + aZoneNum + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '0,';
  stSql := stSql + '0,';
  stSql := stSql + '0,';
  stSql := stSql + '0,';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''0'',';
  stSql := stSql + '''N'') ';
  
  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMDIArmArea.btnAlarmPositionClick(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_sBuildingCode.itemIndex < 0 then
  begin
    stBuildingCode := '';
  end else
  begin
    stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode.itemIndex];
  end;
  if cmb_sFloorCode.itemIndex < 0 then
  begin
    stFloorCode := '';
  end else
  begin
    stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode.itemIndex];
  end;
  if cmb_sAreaCode.itemIndex < 0 then
  begin
    stAreaCode := '';
  end else
  begin
    stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.itemIndex];
  end;


  fmPositionSet:= TfmPositionSet.Create(Self);
  fmPositionSet.FormName := 'fmAlarmDeviceAdmin';
  fmPositionSet.DeviceType := '4';
  fmPositionSet.DeviceName := ed_regAlarmName.Text;
  fmPositionSet.X_Position := ed_CurX.Text;
  fmPositionSet.Y_Position := ed_CurY.Text;
  fmPositionSet.X_Size := ed_TotWidth.Text;
  fmPositionSet.Y_Size := ed_TotHeight.Text;

  fmPositionSet.BuildingCode := stBuildingCode;
  fmPositionSet.FloorCode := stFloorCode;
  fmPositionSet.SectorCode := stAreaCode;

  fmPositionSet.SHowmodal;
  if fmPositionSet.L_bSave then chk_AlarmReg.Checked := True;
  ed_CurX.Text := inttostr(fmPositionSet.L_nImageLeft);
  ed_CurY.Text := inttostr(fmPositionSet.L_nImageTop);
  ed_TotWidth.Text := inttostr(fmPositionSet.L_nImageWidth);
  ed_TotHeight.Text := inttostr(fmPositionSet.L_nImageHeight);
  fmPositionSet.Free;
end;

function TfmMDIArmArea.UpdateTB_ACCESSDEVICEACK(aNodeNo, aECUID,
  aSendAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ACCESSDEVICE set ';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMDIArmArea.SpinEdit_OutDelayChange(Sender: TObject);
begin
  chk_AlaramUpdate.Checked := True;
end;

procedure TfmMDIArmArea.SpinEdit_InDelayChange(Sender: TObject);
begin
  chk_AlaramUpdate.Checked := True;
end;

procedure TfmMDIArmArea.ed_AlarmIDChange(Sender: TObject);
begin
  chk_AlaramUpdate.Checked := True;
end;

procedure TfmMDIArmArea.ed_MuxTelNoChange(Sender: TObject);
begin
  chk_AlaramUpdate.Checked := True;
end;

function TfmMDIArmArea.UpdateTB_ALARMDEVICEInfo(aNodeNo, aEcuID,
  aAlarmName, aAlarmViewSeq, aBuildingCode, aFloorCode, aAreaCode,
  aLocationUse, aTotX, aTotY, aX, aY: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMDEVICE set ';
  stSql := stSql + 'AL_ZONENAME = ''' + aAlarmName +''',';
  stSql := stSql + 'AL_VIEWSEQ = ' + aAlarmViewSeq + ',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AL_LOCATEUSE = ''' + aLocationUse + ''',';
  stSql := stSql + 'AL_TOTWIDTH = ' + aTotX + ',';
  stSql := stSql + 'AL_TOTHEIGHT = ' + aTotY + ',';
  stSql := stSql + 'AL_CURX = ' + aX + ',';
  stSql := stSql + 'AL_CURY = ' + aY + ', ';
  stSql := stSql + 'AL_UPDATE = ''Y'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMDIArmArea.cmb_sAreaCodeChange(Sender: TObject);
begin
  if cmb_sAreaCode.itemindex < 0 then
  begin
    cmb_sAreaCode.Text := '';
    Exit;
  end;

end;

procedure TfmMDIArmArea.ed_regAlarmNameEnter(Sender: TObject);
var
  TIMC: HIMC;
  dwSentence : DWORD; dwConversion : DWORD;
begin
  TIMC := ImmGetContext(TEdit(Sender).Handle);
  ImmGetConversionStatus(TIMC, dwConversion, dwSentence);
  ImmSetConversionStatus(TIMC, IME_CMODE_NATIVE, dwSentence);
  ImmReleaseContext(TEdit(Sender).Handle, TIMC);

end;

procedure TfmMDIArmArea.EcuLoad(aNodeNo:string;aList:TStringList;cmb_Box: TComboBox; aAll: Boolean);
var
  stSql : string;
  stDeviceName : string;
begin
  aList.Clear;
  cmb_Box.Clear;
  if aAll then
  begin
    aList.Add('000');
    cmb_Box.Items.Add('전체');
  end;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_PTTYPE = ''1'' ';
  if isDigit(aNodeNo) then
  begin
    if strtoint(aNodeNo) <> 0 then stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  end;
  stSql := stSql + ' order by AC_NODENO,AC_ECUID ';
  with AdoQuery do
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
    while Not Eof do
    begin
      if FindField('AC_DEVICENAME').AsString = '' then stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_MCUIP').AsString
      else stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_DEVICENAME').AsString;
      cmb_Box.Items.Add(stDeviceName);
      aList.Add(FindField('AC_ECUID').AsString );
      Next;
    end;
  end;
  if cmb_Box.Items.Count > 0 then cmb_Box.ItemIndex := 0;
end;

procedure TfmMDIArmArea.cmb_sMCUListChange(Sender: TObject);
var
  stNodeNo : string;
begin
  stNodeNo := sMCUIDList.Strings[cmb_sMCUList.itemIndex];
  EcuLoad(stNodeNo,sDeviceIDList,cmb_sEcuList,False);
  cmb_sEcuListChange(cmb_sEcuList);
end;

procedure TfmMDIArmArea.cmb_EcuChange(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := '';
  stEcuID := '';
  if cmb_MCUCode.itemIndex > 0 then stNodeNo := MCUIDList.Strings[cmb_MCUCode.itemIndex];
  if cmb_Ecu.itemIndex > 0 then stEcuID := DeviceIDList.Strings[cmb_Ecu.itemIndex];
  AlarmSearch(stNodeNo,stEcuID,'');
end;

function TfmMDIArmArea.GetMaxArmAreaNo(aNodeNo,aEcuID:string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select Max(AR_AREANO) as AR_AREANO from TB_ARMAREA ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AR_USE = ''Y'' ';

  with AdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if Not IsDigit(FindField('AR_AREANO').AsString) then result := 0
    else result := FindField('AR_AREANO').AsInteger + 1;
  end;
end;

procedure TfmMDIArmArea.ed_ArmAreaNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := '';
  stEcuID := '';
  if cmb_MCUCode.itemIndex > 0 then stNodeNo := MCUIDList.Strings[cmb_MCUCode.itemIndex];
  if cmb_Ecu.itemIndex > 0 then stEcuID := DeviceIDList.Strings[cmb_Ecu.itemIndex];
  AlarmSearch(stNodeNo,stEcuID,'');
end;

initialization
  RegisterClass(TfmMDIArmArea);
Finalization
  UnRegisterClass(TfmMDIArmArea);

end.
