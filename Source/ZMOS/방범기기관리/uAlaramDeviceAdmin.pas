unit uAlaramDeviceAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ExtCtrls, RzPanel,
  RzRadGrp, Spin, ComCtrls, Mask, RzEdit, RzSpnEdt, DB, ADODB,ActiveX,
  uSubForm, CommandArray,Imm, AdvObj;

type
  TfmAlaramDeviceAdmin = class(TfmASubForm)
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
    lb_sBuilding1: TLabel;
    lb_sFloorCode1: TLabel;
    lb_sAreaCode1: TLabel;
    Label12: TLabel;
    ed_regAlarmName: TEdit;
    cmb_regDeviceCode: TComboBox;
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
    lb_Building1: TLabel;
    cmb_BuildingCode1: TComboBox;
    cmb_FloorCode1: TComboBox;
    lb_FloorCode1: TLabel;
    lb_AreaCode1: TLabel;
    cmb_AreaCode1: TComboBox;
    Label6: TLabel;
    Label8: TLabel;
    cmb_sMCUCode: TComboBox;
    Label9: TLabel;
    ed_telno: TEdit;
    Label10: TLabel;
    mem_etc: TMemo;
    Label11: TLabel;
    cmb_ArmGubun: TComboBox;
    Label13: TLabel;
    cmb_Ecu: TComboBox;
    Label15: TLabel;
    se_ArmAreaNo: TSpinEdit;
    Label16: TLabel;
    ed_ArmAreaName: TEdit;
    SpeedButton1: TSpeedButton;
    SaveDialog1: TSaveDialog;
    ADOSearchQuery: TADOQuery;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmb_MCUCodeChange(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_AlarmClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure cmb_regDeviceCodeChange(Sender: TObject);
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
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure cmb_sMCUCodeChange(Sender: TObject);
    procedure ed_regAlarmNameEnter(Sender: TObject);
    procedure mem_etcKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_EcuChange(Sender: TObject);
    procedure ed_ArmAreaNameChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    MCUIDList : TStringList;
    sMCUIDList : TStringList;
    DeviceIDList : TStringList;
    regDeviceIDList : TStringList;
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    sBuildingCodeList : TStringList;
    sFloorCodeList : TStringList;
    sAreaCodeList : TStringList;
    sAlarmGubunCodeList : TStringList;
    { Private declarations }
    procedure GridInit;
    procedure AlarmSearch(aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,aAlarmNO:string;aTop :integer = 0);
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure SearchLock(aEnable : Boolean);
    procedure MCULoad(aBuildingCode,aFloorCode,aAreaCode:string;aList:TStringList;cmb_Box:TComboBox;aType:string);
    procedure DeviceLoad(aNodeNo:string;StringList:TStringList;cmb_Box:TComboBox;aType:string);
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadArmGubunCode(cmb_Box:TComboBox);

    Function GetAlarmNo:integer;
    Function GetAlarmViewSeq :integer;
    Function GetMaxArmAreaNo(aNodeNo,aEcuID:string) : integer;

    function DeleteTB_ZoneDevice(aAlarmNo: string):Boolean;
    function DeleteTB_ADMINALARMDEVICE(aAlarmNo: string):Boolean;
    function DeleteTB_ALARMDEVICE(aAlarmNo: string):Boolean;

    function DupCheckAlaram(aNodeNo,aEcuID,aArmAreaNo:string;aUseCheck:Boolean=True):Boolean;
    function     InsertTB_ALARMDEVICE(
                         aNodeNo,
                         aEcuID,
                         aAlarmName,
                         aAlarmViewSeq,
                         //aOutDelay,
                         //aInDelay,
                         //aAlarmID,
                         //aMuxTelNo,
                         //aRingCnt,
                         aBuildingCode,
                         aFloorCode,
                         aAreaCode,
                         aLocationUse,
                         aTotX,
                         aTotY,
                         aX,
                         aY,
                         aTelNo,
                         aMemo,
                         aArmGubunCode : string) :Boolean;
    function     UpdateTB_ALARMDEVICE(
                         aNodeNo,
                         aEcuID,
                         aAlarmName,
                         aAlarmViewSeq,
                         //aOutDelay,
                         //aInDelay,
                         //aAlarmID,
                         //aMuxTelNo,
                         //aRingCnt,
                         aBuildingCode,
                         aFloorCode,
                         aAreaCode,
                         aLocationUse,
                         aTotX,
                         aTotY,
                         aX,
                         aY,
                         aTelNo,
                         aMemo,
                         aArmGubunCode : string) :Boolean;
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
                         aY,
                         aTelNo,
                         aMemo,
                         aArmGubunCode : string) :Boolean;
    function UpdateTB_ACCESSDEVICEACK(aNodeNo,aECUID,aSendAck:string):Boolean;
    function CreateTB_ZONEDEVICE(aAlarmNo:string):Boolean;
    function InsertTB_ZONEDEVICE(aNodeNo,aEcuID,aAlamName,aZoneNum:string):Boolean;
    procedure FormNameSet;
  public
    L_bDeviceUpdate : Boolean;
    { Public declarations }
  end;

var
  fmAlaramDeviceAdmin: TfmAlaramDeviceAdmin;
  State : string;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uPositionSet;
{$R *.dfm}

{ TfmAlaramDeviceAdmin }

procedure TfmAlaramDeviceAdmin.GridInit;
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
    for nCol := 3 to ColCount - 1 do
    begin
      ColWidths[nCol] := 0;
    end;
  end;
end;

procedure TfmAlaramDeviceAdmin.MCULoad(aBuildingCode,aFloorCode,aAreaCode:string;aList:TStringList;cmb_Box:TComboBox;aType:string);
var
  stSql : string;
  stDeviceName : string;
begin
  aList.Clear;
  cmb_Box.Clear;
  aList.Add('000');
  if aType = 'Y' then
  begin
    cmb_Box.Items.Add('전체');
  end else
  begin
    cmb_Box.Items.Add('');
  end;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' '
      else
        stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
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
      if FindField('AC_DEVICENAME').AsString = '' then stDeviceName := FindField('AC_MCUIP').AsString
      else stDeviceName := FindField('AC_DEVICENAME').AsString;
      cmb_Box.Items.Add(stDeviceName);
      //MCUIDList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3));
      aList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3));
      Next;
    end;
    if recordCount = 1 then cmb_Box.ItemIndex := 1;
  end;

end;

procedure TfmAlaramDeviceAdmin.FormCreate(Sender: TObject);
begin
  MCUIDList := TStringList.Create;
  sMCUIDList := TStringList.Create;
  MCUIDList.Clear;
  DeviceIDList := TStringList.Create;
  regDeviceIDList := TStringList.Create;
  BuildingCodeList := TStringList.Create;
  BuildingCodeList.Clear;
  FloorCodeList := TStringList.Create;
  FloorCodeList.Clear;
  AreaCodeList := TStringList.Create;
  AreaCodeList.Clear;
  sBuildingCodeList := TStringList.Create;
  sBuildingCodeList.Clear;
  sFloorCodeList := TStringList.Create;
  sFloorCodeList.Clear;
  sAreaCodeList := TStringList.Create;
  sAreaCodeList.Clear;
  sAlarmGubunCodeList := TStringList.Create;

end;

procedure TfmAlaramDeviceAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MCUIDList.Free;
  sMCUIDList.Free;
  DeviceIDList.Free;
  regDeviceIDList.Free;
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  sBuildingCodeList.Free;
  sFloorCodeList.Free;
  sAreaCodeList.Free;
  sAlarmGubunCodeList.Free;
end;

procedure TfmAlaramDeviceAdmin.AlarmSearch(aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,
  aAlarmNO: string;aTop :integer = 0);
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
  SearchLock(False);

  GridInit; //스트링그리드 초기화

  stSql := 'select a.*,b.AC_DEVICENAME as MCUNAME from TB_ARMAREA a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AR_USE = ''Y'' ';
  if ed_ArmAreaName.Text <> '' then stSql := stSql + ' AND AR_NAME Like ''%' + ed_ArmAreaName.Text + '%'' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' '
      else
        stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else
    begin
      if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  end;
  if (aNodeNo <> '') and (aNodeNo <> '000') then    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  if (aECUID <> '') then stSql := stSql + ' AND a.AC_ECUID = ''' + aECUID + ''' ' ;
  stSql := stSql + ' order by a.AR_VIEWSEQ,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO  ';

  Try

    with ADOSearchQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        SearchLock(True);
        Exit;
      End;

      if RecordCount < 1 then
      begin
        SearchLock(True);
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
          cells[1,nRow] := FindField('MCUNAME').AsString;
          cells[2,nRow] := FindField('AC_ECUID').AsString;
          if isDigit(FindField('AR_AREANO').AsString) then stArmAreaNo := inttostr(FindField('AR_AREANO').AsInteger)
          else stArmAreaNo := '0';
          cells[3,nRow] := stArmAreaNo;
          cells[4,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + stArmAreaNo;
          cells[5,nRow] := FindField('AC_NODENO').AsString;
          cells[6,nRow] := FindField('AR_VIEWSEQ').AsString;
          //cells[7,nRow] := FindField('AL_OUTDELAY').AsString;
          //cells[8,nRow] := FindField('AL_INDELAY').AsString;
          //cells[9,nRow] := FindField('AL_ALARMID').AsString;
          //cells[10,nRow] := FindField('AL_MUXTELNO').AsString;
          //cells[11,nRow] := FindField('AL_REMOTERINGCNT').AsString;
          cells[12,nRow] := FindField('LO_DONGCODE').AsString;
          cells[13,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[14,nRow] := FindField('LO_AREACODE').AsString;
          cells[15,nRow] := FindField('AR_LOCATEUSE').AsString;
          cells[16,nRow] := FindField('AR_TOTWIDTH').AsString;
          cells[17,nRow] := FindField('AR_TOTHEIGHT').AsString;
          cells[18,nRow] := FindField('AR_CURX').AsString;
          cells[19,nRow] := FindField('AR_CURY').AsString;
          cells[20,nRow] := FindField('AR_TELNO').AsString;
          cells[21,nRow] := FindField('AR_MEMO').AsString;
          cells[22,nRow] := FindField('AG_ARMCODE').AsString;
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
    SearchLock(True);
  End;
  sg_AlarmClick(sg_Alarm);

end;

procedure TfmAlaramDeviceAdmin.FormClear;
begin
  cmb_sMCUCode.ItemIndex := -1;
  cmb_regDeviceCode.ItemIndex := -1;
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
  cmb_ArmGubun.ItemIndex := -1;
end;

procedure TfmAlaramDeviceAdmin.ButtonEnable(aState: string);
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

procedure TfmAlaramDeviceAdmin.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    //Alarm Form Enable
    sg_Alarm.Enabled := False;
    cmb_sMCUCode.Enabled := True;
    cmb_regDeviceCode.Enabled := True;
    if G_nArmAreaUse = 1 then se_ArmAreaNo.Enabled := True;
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
    ed_telno.Enabled := True;
    mem_etc.Enabled := True;
    cmb_ArmGubun.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    //Alarm Form Enable
    sg_Alarm.Enabled := False;
    cmb_sMCUCode.Enabled := False;
    cmb_regDeviceCode.Enabled := False;
    if G_nArmAreaUse = 1 then se_ArmAreaNo.Enabled := True;
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
    ed_telno.Enabled := True;
    mem_etc.Enabled := True;
    cmb_ArmGubun.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    //Alarm Form Enable
    sg_Alarm.Enabled := True;
    cmb_sMCUCode.Enabled := False;
    cmb_regDeviceCode.Enabled := False;
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
    ed_telno.Enabled := False;
    mem_etc.Enabled := False;
    cmb_ArmGubun.Enabled := False;
  end else if UpperCase(aState) = 'CLICK' then
  begin
    //Alarm Form Enable
    sg_Alarm.Enabled := True;
    cmb_sMCUCode.Enabled := False;
    cmb_regDeviceCode.Enabled := False;
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
    ed_telno.Enabled := False;
    mem_etc.Enabled := False;
    cmb_ArmGubun.Enabled := False;
  end;
end;

procedure TfmAlaramDeviceAdmin.FormShow(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  FormNameSet;
  stBuildingCode := '000';
  stFloorCode    := '000';
  stAreaCode     := '000';
  stNodeNo       := '000';
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;
  LoadBuildingCode(cmb_BuildingCode1);
  if cmb_BuildingCode1.ItemIndex > 0 then
  begin
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex];
    LoadFloorCode(stBuildingCode,cmb_FloorCode1);
    if cmb_FloorCode1.ItemIndex > 0 then
    begin
      stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.ItemIndex];
      LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
      if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.ItemIndex];
    end;
  end;
  LoadsBuildingCode(cmb_sBuildingCode);
  MCULoad(stBuildingCode,stFloorCode,stAreaCode,MCUIDList,cmb_MCUCode,'Y');
  LoadArmGubunCode(cmb_ArmGubun);
  
  if cmb_sMCUCode.ItemIndex > 0 then stNodeNo := copy(sMCUIDList.Strings[cmb_sMCUCode.ItemIndex],1,3);
  DeviceLoad(stNodeNo,regDeviceIDList,cmb_regDeviceCode,'N');
  if cmb_MCUCode.ItemIndex > 0 then stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.ItemIndex],1,3);
  DeviceLoad(stNodeNo,DeviceIDList,cmb_ECU,'Y');
  //AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,'',''); --한남대에서 메모리 부족 에러
  Timer1.Enabled := True;
  L_bDeviceUpdate := False;
end;

procedure TfmAlaramDeviceAdmin.cmb_MCUCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';
  if cmb_BuildingCode1.itemindex > 0 then
    stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex > 0 then
    stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex > 0 then
    stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];
  if cmb_MCUCode.itemIndex < 0 then cmb_MCUCode.itemIndex := 0;
  stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.itemIndex],1,3);
  DeviceLoad(stNodeNo,DeviceIDList,cmb_Ecu,'Y');
  AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,'','');
end;

procedure TfmAlaramDeviceAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAlaramDeviceAdmin.sg_AlarmClick(Sender: TObject);
var
  stNodeNo : string;
  stECUID : string;
  stBuildingCode,stFloorCode,stAreaCode : string;
  nIndex : integer;
  st_ArmCode : string;
begin

  with (Sender as TStringGrid) do
  begin
    if cells[1,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_AlarmNo.Text := cells[4,Row];
    stNodeNo := FillZeroNumber(strtoint(cells[5,Row]),3) ;
    stECUID := cells[2,Row];
    MCULoad('','','',sMCUIDList,cmb_sMCUCode,'N');
    cmb_sMCUCode.ItemIndex := sMCUIDList.IndexOf(stNodeNo);
    DeviceLoad(stNodeNo,regDeviceIDList,cmb_regDeviceCode,'N');
    cmb_regDeviceCode.ItemIndex := regDeviceIDList.IndexOf(stNodeNo + stECUID);

    if Not IsDigit(cells[3,Row]) then cells[3,Row] := '0';
    se_ArmAreaNo.Value := strtoint(cells[3,Row]);

    ed_regAlarmName.Text  := cells[0,Row];

    stBuildingCode := '000';
    stFloorCode := '000';
    stAreaCode := '000';
    if cmb_BuildingCode1.ItemIndex > 0 then  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex] ;
    if cmb_FloorCode1.ItemIndex > 0 then  stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.ItemIndex];
    if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.ItemIndex];

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
    ed_telno.Text := cells[20,Row];
    mem_etc.Text := cells[21,Row];
    st_ArmCode := cells[22,Row];
    nIndex := sAlarmGubunCodeList.IndexOf(st_ArmCode);
    cmb_ArmGubun.ItemIndex := nIndex;
  end;

end;

procedure TfmAlaramDeviceAdmin.DeviceLoad(aNodeNo:string;StringList:TStringList;cmb_Box:TComboBox;aType:string);
var
  stSql : string;
  stDeviceName : string;
  stDeviceID : string;
begin
  StringList.Clear;
  cmb_Box.Clear;
  StringList.Add('');
  if aType = 'Y' then
  begin
    cmb_Box.Items.Add('전체');
  end else
  begin
    cmb_Box.Items.Add('');
  end;
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
  stSql := stSql + ' AND AC_PTTYPE = ''1'' ';
  if (aNodeNo <> '') and (aNodeNo <> '000') then stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' '; 
  if Not IsMaster then
  begin
    if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end;
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
      stDeviceID := FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString;
      StringList.Add(stDeviceID);
      Next;
    end;
  end;

end;

procedure TfmAlaramDeviceAdmin.LoadsBuildingCode(cmb_Box: TComboBox);
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
  if Not IsMaster then
  begin
    if BuildingGrade <> 0 then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_DONGCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

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
      if Not IsMaster then
      begin
        if BuildingGrade <> 0 then
        begin
          if sBuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
          begin
            cmb_Box.ItemIndex := sBuildingCodeList.IndexOf(MasterBuildingCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlaramDeviceAdmin.LoadsFloorCode(aBuildingCode: string;
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

  if Not IsMaster then
  begin
    if BuildingGrade > 1 then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_FLOORCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

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
      if Not IsMaster then
      begin
        if BuildingGrade > 1 then
        begin
          if sFloorCodeList.IndexOf(MasterFloorCode) > 0 then
          begin
            cmb_Box.ItemIndex := sFloorCodeList.IndexOf(MasterFloorCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlaramDeviceAdmin.LoadsAreaCode(aBuildingCode,
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

  if Not IsMaster then
  begin
    if BuildingGrade > 2 then
    begin
      stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_AREACODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

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
      if Not IsMaster then
      begin
        if BuildingGrade > 2 then
        begin
          if sAreaCodeList.IndexOf(MasterAreaCode) > 0 then
          begin
            cmb_Box.ItemIndex := sAreaCodeList.IndexOf(MasterAreaCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlaramDeviceAdmin.btn_InsertClick(Sender: TObject);
var
  stBuildingCode :string;
  stFloorCode :string;
  stAreaCode :string;
  stNodeNo : string;
  stEcuID : string;
  nIndex : integer;
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

  ed_regAlarmName.SetFocus;
  //ed_AlarmNo.Text := inttostr(GetAlarmNo);
  ed_regAlarmSeq.Value := GetAlarmViewSeq;

  cmb_sBuildingCode.Clear;
  cmb_sFloorCode.Clear;
  cmb_sAreaCode.Clear;
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';
  LoadsBuildingCode(cmb_sBuildingCode);
  if cmb_BuildingCode1.ItemIndex > 0 then  cmb_sBuildingCode.ItemIndex := cmb_BuildingCode1.ItemIndex;
  if cmb_sBuildingCode.ItemIndex > 0 then
  begin
    stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode.ItemIndex];
    LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
    if cmb_FloorCode1.ItemIndex > 0 then  cmb_sFloorCode.ItemIndex := cmb_FloorCode1.ItemIndex;
    if cmb_sFloorCode.ItemIndex > 0 then
    begin
      stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode.ItemIndex];
      LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);
      if cmb_AreaCode1.ItemIndex > 0 then  cmb_sAreaCode.ItemIndex := cmb_AreaCode1.ItemIndex;
      if cmb_sAreaCode.ItemIndex > 0 then stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.ItemIndex];
    end;
  end;
  if cmb_MCUCode.ItemIndex > -1 then
  begin
    stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.ItemIndex],1,3);
    nIndex := sMCUIDList.IndexOf(stNodeNo);
    cmb_sMCUCode.ItemIndex := nIndex;
  end;
  stNodeNo := '';
  stEcuID := '';
  MCULoad('','','',sMCUIDList,cmb_sMCUCode,'N');
  if cmb_MCUCode.ItemIndex > 0 then
  begin
    stNodeNo := MCUIDList.Strings[cmb_MCUCode.ItemIndex];
    if cmb_Ecu.ItemIndex > 0 then stEcuID := DeviceIDList.Strings[cmb_Ecu.ItemIndex];
  end;
  cmb_sMCUCode.ItemIndex := sMCUIDList.IndexOf(stNodeNo);
  if cmb_sMCUCode.ItemIndex > -1 then
  begin
    DeviceLoad(stNodeNo,regDeviceIDList,cmb_regDeviceCode,'N');
    cmb_regDeviceCode.ItemIndex := regDeviceIDList.IndexOf(stECUID);
    cmb_regDeviceCodeChange(cmb_regDeviceCode);
  end;

end;

function TfmAlaramDeviceAdmin.GetAlarmNo: integer;
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

procedure TfmAlaramDeviceAdmin.cmb_regDeviceCodeChange(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  nNextArmArea : integer;
begin
  stNodeNo := '';
  stEcuID := '';
  if cmb_sMCUCode.ItemIndex < 1 then Exit;
  if cmb_regDeviceCode.ItemIndex < 1 then exit;
  stNodeNo := sMCUIDList.Strings[cmb_sMCUCode.ItemIndex];
  stEcuID := copy(regDeviceIDList.Strings[cmb_regDeviceCode.ItemIndex],4,2);
  if cmb_regDeviceCode.ItemIndex > -1 then
  begin
    nNextArmArea := GetMaxArmAreaNo(stNodeNo,stEcuID);
    if nNextArmArea > con_nFIXMAXAREANO then
    begin
      se_ArmAreaNo.Value := 0;
    end else se_ArmAreaNo.Value := nNextArmArea ;

    if G_nArmAreaUse = 0 then se_ArmAreaNo.Value := 0; //방범구역 미사용시 구역번호는 0번이다.
    
    if Uppercase(State) = 'INSERT' then
    begin
      if se_ArmAreaNo.Value = 0 then
      begin
        ed_regAlarmName.Text := cmb_regDeviceCode.Text;
      end else
      begin
        ed_regAlarmName.Text := cmb_regDeviceCode.Text + '_' + inttostr(se_ArmAreaNo.Value) + '구역';
      end;
    end;
  end;
(*  if cmb_regDeviceCode.ItemIndex > 0 then
  begin
    if Uppercase(State) = 'INSERT' then
    begin
      ed_regAlarmName.Text := cmb_regDeviceCode.Text;
    end;
    stEcuID := copy(regDeviceIDList.Strings[cmb_regDeviceCode.itemIndex],4,2);
    if stEcuID = '00' then
    begin
      ed_AlarmID.Enabled := True;
      ed_MuxTelNo.Enabled := True;
      Spinner_Ring.Enabled := True;
      Exit;
    end;
  end;
  ed_AlarmID.Enabled := False;
  ed_MuxTelNo.Enabled := False;
  Spinner_Ring.Enabled := False;
*)
end;

procedure TfmAlaramDeviceAdmin.cmb_sBuildingCodeChange(Sender: TObject);
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

procedure TfmAlaramDeviceAdmin.cmb_sFloorCodeChange(Sender: TObject);
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

function TfmAlaramDeviceAdmin.GetAlarmViewSeq: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select Max(AL_VIEWSEQ) as AL_VIEWSEQ from TB_ALARMDEVICE ';
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
    if Not IsDigit(FindField('AL_VIEWSEQ').AsString) then result := 1
    else result := FindField('AL_VIEWSEQ').AsInteger + 1;
  end;
end;

procedure TfmAlaramDeviceAdmin.btn_UpdateClick(Sender: TObject);
var
  stEcuID : string;
begin
  chk_AlaramUpdate.Checked := False;
    
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);
  stEcuID := copy(regDeviceIDList.Strings[cmb_regDeviceCode.itemIndex],4,2);
  if stEcuID = '00' then
  begin
    ed_AlarmID.Enabled := True;
    ed_MuxTelNo.Enabled := True;
    Spinner_Ring.Enabled := True;
  end;
end;

procedure TfmAlaramDeviceAdmin.btn_CancelClick(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
  stEcuID : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';
  stEcuID := '';
  if cmb_BuildingCode1.itemindex > 0 then
    stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex > 0 then
    stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex > 0 then
    stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];
  if cmb_MCUCode.itemIndex < 0 then cmb_MCUCode.itemIndex := 0;
  stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.itemIndex],1,3);
  if cmb_Ecu.itemIndex > 0  then stEcuID := copy(DeviceIDList.Strings[cmb_Ecu.itemIndex],4,2);
  if cmb_regDeviceCode.ItemIndex > 0 then
  begin
    if UpperCase(State) = 'UPDATE' then AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,copy(regDeviceIDList.Strings[cmb_regDeviceCode.ItemIndex],1,5),sg_Alarm.topRow)
    else AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,copy(regDeviceIDList.Strings[cmb_regDeviceCode.ItemIndex],1,5));
  end else
  begin
    if UpperCase(State) = 'UPDATE' then AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,'',sg_Alarm.topRow)
    else AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,'');
  end;
end;

procedure TfmAlaramDeviceAdmin.btn_SaveClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stOldAlarmArea : string;
  stAlarmName : string;
  stBuildingCode,stFloorCode,stAreaCode : string;
  stLocationUse : string;
  stTotX,stTotY,stX,stY : string;
  stTelNo : string;
  stMemo : string;
  stArmGubunCode : string;
  bUpdateKeyChange : Boolean;
  stSql : string;
  i : integer;
begin
  stOldAlarmArea := '';
  if Length(ed_AlarmNo.Text) > 5 then stOldAlarmArea := copy(ed_AlarmNo.Text,6,1);
  if cmb_regDeviceCode.itemIndex < 1 then
  begin
    showmessage('방범 구역을 설정할 기기를 선택해 주세요.');
    Exit;
  end;
  stNodeNo := copy(regDeviceIDList.Strings[cmb_regDeviceCode.itemIndex],1,3);
  stEcuID := copy(regDeviceIDList.Strings[cmb_regDeviceCode.itemIndex],4,2);
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
  stTelNo := ed_telno.Text;
  stMemo := mem_etc.Text;
  stArmGubunCode := '000';
  if cmb_ArmGubun.ItemIndex > 0 then stArmGubunCode := sAlarmGubunCodeList.Strings[cmb_ArmGubun.ItemIndex];

  bUpdateKeyChange := False;
  if UpperCase(State) = 'UPDATE' then
  begin
    if ed_AlarmNo.Text <> stNodeNo + stEcuID + stArmAreaNo then bUpdateKeyChange := True; //키값이 변경 된 경우
  end;

  if cmb_regDeviceCode.ItemIndex > 0 then
  begin
    if UpperCase(State) = 'INSERT' then
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
(*    InsertTB_ALARMDEVICE(
                         stNodeNo,
                         stEcuID,
                         stAlarmName,
                         inttostr(ed_regAlarmSeq.Value),
                         //inttostr(SpinEdit_OutDelay.IntValue),
                         //inttostr(SpinEdit_InDelay.IntValue),
                         //ed_AlarmID.Text,
                         //ed_MuxTelNo.Text,
                         //inttostr(Spinner_Ring.Value),
                         stBuildingCode,
                         stFloorCode,
                         stAreaCode,
                         stLocationUse,
                         stTotX,
                         stTotY,
                         stX,
                         stY,
                         stTelNo,
                         stMemo,
                         stArmGubunCode);
    CreateTB_ZONEDEVICE(FillZeroNumber(strtoint(stNodeNo),3) + stEcuID) ;
    UpdateTB_ACCESSDEVICEACK(stNodeNo,stECUID,'N'); *)

    L_bDeviceUpdate := True;
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
(*    if chk_AlaramUpdate.Checked then
    begin
      UpdateTB_ALARMDEVICE(
                         stNodeNo,
                         stEcuID,
                         stAlarmName,
                         inttostr(ed_regAlarmSeq.Value),
                         //inttostr(SpinEdit_OutDelay.IntValue),
                         //inttostr(SpinEdit_InDelay.IntValue),
                         //ed_AlarmID.Text,
                         //ed_MuxTelNo.Text,
                         //inttostr(Spinner_Ring.Value),
                         stBuildingCode,
                         stFloorCode,
                         stAreaCode,
                         stLocationUse,
                         stTotX,
                         stTotY,
                         stX,
                         stY,
                         stTelNo,
                         stMemo,
                         stArmGubunCode);
      UpdateTB_ACCESSDEVICEACK(stNodeNo,stECUID,'N');
    end else
    begin
      UpdateTB_ALARMDEVICEInfo(
                         stNodeNo,
                         stEcuID,
                         stAlarmName,
                         inttostr(ed_regAlarmSeq.Value),
                         stBuildingCode,
                         stFloorCode,
                         stAreaCode,
                         stLocationUse,
                         stTotX,
                         stTotY,
                         stX,
                         stY,
                         stTelNo,
                         stMemo,
                         stArmGubunCode);
    end;  *)
  end;
  if DupCheckAlaram(stNodeNo,stEcuID,stArmAreaNo,False) then
  begin
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
    stSql := stSql + 'AR_TELNO = '''+ stTelNo +''', ';
    stSql := stSql + 'AR_MEMO = '''+ stMemo +''',  ';
    stSql := stSql + 'AG_ARMCODE = '''+ stArmGubunCode +'''  ';
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
    stSql := stSql + ' AR_TELNO,';
    stSql := stSql + ' AR_MEMO,';
    stSql := stSql + ' AG_ARMCODE,';
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
    stSql := stSql + ' '''+ stTelNo +''', ';
    stSql := stSql + ' '''+ stMemo +''',  ';
    stSql := stSql + ' '''+ stArmGubunCode + ''',  ';
    stSql := stSql + ' ''Y'') ';

    DataModule1.ProcessExecSQL(stSql);
  end;

  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '';
  if cmb_BuildingCode1.itemindex > 0 then
    stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex > 0 then
    stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex > 0 then
    stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];
  if cmb_MCUCode.itemIndex < 0 then cmb_MCUCode.itemIndex := 0;
  if cmb_MCUCode.itemIndex > -1 then
    stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.itemIndex],1,3);
  if cmb_Ecu.itemIndex > -1 then stEcuID := copy(DeviceIDList.Strings[cmb_Ecu.itemIndex],4,2);

  if UpperCase(State) = 'UPDATE' then AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,ed_AlarmNo.text,sg_Alarm.topRow)
  else
      AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,ed_AlarmNo.text);

end;

procedure TfmAlaramDeviceAdmin.btn_DeleteClick(Sender: TObject);
var
  stDeviceID : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
  stEcuID : string;
  stSql : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';
  stEcuID := '';
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
//  stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
(*  DeleteTB_ZoneDevice(ed_AlarmNo.Text);
  DeleteTB_ADMINALARMDEVICE(ed_AlarmNo.Text);
  DeleteTB_ALARMDEVICE(ed_AlarmNo.Text);
*)
  stSql := ' Update TB_ARMAREA set AR_USE = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + copy(ed_AlarmNo.Text,1,3);
  stSql := stSql + ' AND AC_ECUID = ''' + copy(ed_AlarmNo.Text,4,2) + ''' ';
  stSql := stSql + ' AND AR_AREANO = ''' + '0' + copy(ed_AlarmNo.Text,6,1) + ''' ';

  DataModule1.ProcessExecSQL(stSql);

  if cmb_BuildingCode1.itemindex > 0 then
    stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex > 0 then
    stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex > 0 then
    stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];
  if cmb_MCUCode.itemIndex < 0 then cmb_MCUCode.itemIndex := 0;
  stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.itemIndex],1,3);
  if cmb_Ecu.itemIndex > 0  then stEcuID := copy(DeviceIDList.Strings[cmb_Ecu.itemIndex],4,2);

  AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,'');
end;

function TfmAlaramDeviceAdmin.DeleteTB_ZoneDevice(aAlarmNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ZONEDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3))) ;
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmAlaramDeviceAdmin.DeleteTB_ADMINALARMDEVICE(
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

function TfmAlaramDeviceAdmin.DeleteTB_ALARMDEVICE(
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

function TfmAlaramDeviceAdmin.DupCheckAlaram(aNodeNo,
  aEcuID,aArmAreaNo: string;aUseCheck:Boolean=True): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'select * from TB_ARMAREA ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND AR_AREANO = ''' + FillZeroStrNum(aArmAreaNo,2) + ''' ';
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

function TfmAlaramDeviceAdmin.InsertTB_ALARMDEVICE(aNodeNo,
  aEcuID, aAlarmName, aAlarmViewSeq, {aOutDelay, aInDelay, aAlarmID,
  aMuxTelNo, aRingCnt,} aBuildingCode, aFloorCode, aAreaCode, aLocationUse,
  aTotX, aTotY, aX, aY,aTelNo,aMemo,aArmGubunCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ALARMDEVICE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AL_ZONENAME,';
  stSql := stSql + 'AL_VIEWSEQ,';
  //stSql := stSql + 'AL_OUTDELAY,';
  //stSql := stSql + 'AL_INDELAY,';
  //stSql := stSql + 'AL_ALARMID,';
  //stSql := stSql + 'AL_MUXTELNO,';
  //stSql := stSql + 'AL_REMOTERINGCNT,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'AL_LOCATEUSE,';
  stSql := stSql + 'AL_TOTWIDTH,';
  stSql := stSql + 'AL_TOTHEIGHT,';
  stSql := stSql + 'AL_CURX,';
  stSql := stSql + 'AL_CURY,';
  stSql := stSql + 'SEND_ACK, ';
  stSql := stSql + 'AL_UPDATE, ';
  stSql := stSql + 'AL_TELNO, ';
  stSql := stSql + 'AL_MEMO, ';
  stSql := stSql + 'AG_ARMCODE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aAlarmName +''',';
  stSql := stSql + aAlarmViewSeq + ',';
  //stSql := stSql + aOutDelay + ',';
  //stSql := stSql + aInDelay + ',';
  //stSql := stSql + '''' + aAlarmID + ''',';
  //stSql := stSql + '''' + aMuxTelNo + ''',';
  //stSql := stSql + aRingCnt + ',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aLocationUse + ''',';
  stSql := stSql + aTotX + ',';
  stSql := stSql + aTotY + ',';
  stSql := stSql + aX + ',';
  stSql := stSql + aY + ',';
  stSql := stSql + '''N'', ';
  stSql := stSql + '''Y'', ';
  stSql := stSql + ''''+ aTelNo + ''', ';
  stSql := stSql + ''''+ aMemo + ''', ';
  stSql := stSql + ''''+ aArmGubunCode + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmAlaramDeviceAdmin.UpdateTB_ALARMDEVICE(aNodeNo,
  aEcuID, aAlarmName, aAlarmViewSeq, {aOutDelay, aInDelay, aAlarmID,
  aMuxTelNo, aRingCnt,} aBuildingCode, aFloorCode, aAreaCode, aLocationUse,
  aTotX, aTotY, aX, aY,aTelNo,aMemo,aArmGubunCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMDEVICE set ';
  stSql := stSql + 'AL_ZONENAME = ''' + aAlarmName +''',';
  stSql := stSql + 'AL_VIEWSEQ = ' + aAlarmViewSeq + ',';
  //stSql := stSql + 'AL_OUTDELAY = ' + aOutDelay + ',';
  //stSql := stSql + 'AL_INDELAY = ' + aInDelay + ',';
  //stSql := stSql + 'AL_ALARMID = ''' + aAlarmID + ''',';
  //stSql := stSql + 'AL_MUXTELNO = ''' + aMuxTelNo + ''',';
  //stSql := stSql + 'AL_REMOTERINGCNT = ' + aRingCnt + ',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AL_LOCATEUSE = ''' + aLocationUse + ''',';
  stSql := stSql + 'AL_TOTWIDTH = ' + aTotX + ',';
  stSql := stSql + 'AL_TOTHEIGHT = ' + aTotY + ',';
  stSql := stSql + 'AL_CURX = ' + aX + ',';
  stSql := stSql + 'AL_CURY = ' + aY + ',';
  stSql := stSql + 'SEND_ACK = ''N'', ';
  stSql := stSql + 'AL_UPDATE = ''Y'', ';
  stSql := stSql + 'AL_TELNO = '''+ aTelNo +''', ';
  stSql := stSql + 'AL_MEMO = '''+ aMemo +''',  ';
  stSql := stSql + 'AG_ARMCODE = '''+ aArmGubunCode +'''  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
//  stSql := stSql + ' AND AL_DEVICENO = ' + aAlarmNo ;
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmAlaramDeviceAdmin.CreateTB_ZONEDEVICE(
  aAlarmNo: string): Boolean;
var
  i : integer;
begin
  for i := 1 to ZONECOUNT do
  begin
    InsertTB_ZONEDEVICE(copy(aAlarmNo,1,3),copy(aAlarmNo,4,2),ed_regAlarmName.Text,inttostr(i));
  end;
end;

function TfmAlaramDeviceAdmin.InsertTB_ZONEDEVICE(aNodeNo,aEcuID,aAlamName,
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

procedure TfmAlaramDeviceAdmin.btnAlarmPositionClick(Sender: TObject);
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
  fmPositionSet.Free;
end;

function TfmAlaramDeviceAdmin.UpdateTB_ACCESSDEVICEACK(aNodeNo, aECUID,
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

procedure TfmAlaramDeviceAdmin.SpinEdit_OutDelayChange(Sender: TObject);
begin
  chk_AlaramUpdate.Checked := True;
end;

procedure TfmAlaramDeviceAdmin.SpinEdit_InDelayChange(Sender: TObject);
begin
  chk_AlaramUpdate.Checked := True;
end;

procedure TfmAlaramDeviceAdmin.ed_AlarmIDChange(Sender: TObject);
begin
  chk_AlaramUpdate.Checked := True;
end;

procedure TfmAlaramDeviceAdmin.ed_MuxTelNoChange(Sender: TObject);
begin
  chk_AlaramUpdate.Checked := True;
end;

function TfmAlaramDeviceAdmin.UpdateTB_ALARMDEVICEInfo(aNodeNo, aEcuID,
  aAlarmName, aAlarmViewSeq, aBuildingCode, aFloorCode, aAreaCode,
  aLocationUse, aTotX, aTotY, aX, aY,aTelNo,aMemo,aArmGubunCode: string): Boolean;
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
  stSql := stSql + 'AL_UPDATE = ''Y'', ';
  stSql := stSql + 'AL_TELNO = '''+ aTelNo +''', ';
  stSql := stSql + 'AL_MEMO = '''+ aMemo +''',  ';
  stSql := stSql + 'AG_ARMCODE = '''+ aArmGubunCode +'''  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmAlaramDeviceAdmin.cmb_sAreaCodeChange(Sender: TObject);
begin
  if cmb_sAreaCode.itemindex < 0 then
  begin
    cmb_sAreaCode.Text := '';
    Exit;
  end;

end;

procedure TfmAlaramDeviceAdmin.FormNameSet;
begin
  lb_Building1.Caption := FM901;
  lb_sBuilding1.Caption := FM901;
  lb_FloorCode1.Caption := FM911;
  lb_sFloorCode1.Caption := FM911;
  lb_AreaCode1.Caption := FM921;
  lb_sAreaCode1.Caption := FM921;

end;

procedure TfmAlaramDeviceAdmin.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  cmb_Box.Clear;
  cmb_Box.Enabled := True;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  if Not IsMaster then
  begin
    if BuildingGrade <> 0 then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_DONGCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;


  cmb_Box.Items.Add('전체');
  BuildingCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
        BuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
      if Not IsMaster then
      begin
        if BuildingGrade <> 0 then
        begin
          if BuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
          begin
            cmb_Box.ItemIndex := BuildingCodeList.IndexOf(MasterBuildingCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlaramDeviceAdmin.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery:TADOQuery;
begin
  cmb_Box.Clear;
  FloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';
  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if Not IsMaster then
  begin
    if BuildingGrade > 1 then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_FLOORCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  FloorCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
        FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
      if Not IsMaster then
      begin
        if BuildingGrade > 1 then
        begin
          if FloorCodeList.IndexOf(MasterFloorCode) > 0 then
          begin
            cmb_Box.ItemIndex := FloorCodeList.IndexOf(MasterFloorCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlaramDeviceAdmin.LoadAreaCode(aBuildingCode,
  aFloorCode: string; cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  AreaCodeList.Clear;

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

  if Not IsMaster then
  begin
    if BuildingGrade > 2 then
    begin
      stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_AREACODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  AreaCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
        AreaCodeList.Add(FindField('LO_AREACODE').AsString);
        Next;
      end;
      if Not IsMaster then
      begin
        if BuildingGrade > 2 then
        begin
          if AreaCodeList.IndexOf(MasterAreaCode) > 0 then
          begin
            cmb_Box.ItemIndex := AreaCodeList.IndexOf(MasterAreaCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmAlaramDeviceAdmin.cmb_BuildingCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
  stEcuID : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';
  stEcuID := '';

  if cmb_BuildingCode1.ItemIndex > 0 then
  begin
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex];
    LoadFloorCode(stBuildingCode,cmb_FloorCode1);
    if cmb_FloorCode1.ItemIndex > 0 then
    begin
      stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.ItemIndex];
      LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
      if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.ItemIndex];
    end;
  end;

  MCULoad(stBuildingCode,stFloorCode,stAreaCode,MCUIDList,cmb_MCUCode,'Y');
  if cmb_MCUCode.ItemIndex > 0 then stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.ItemIndex],1,3);
  if cmb_Ecu.itemIndex > 0  then stEcuID := copy(DeviceIDList.Strings[cmb_Ecu.itemIndex],4,2);
  AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,'');

end;

procedure TfmAlaramDeviceAdmin.cmb_FloorCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
  stEcuID : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';
  stEcuID := '';

  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  if cmb_AreaCode1.itemindex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemindex];

  MCULoad(stBuildingCode,stFloorCode,stAreaCode,MCUIDList,cmb_MCUCode,'Y');

  if cmb_MCUCode.ItemIndex > 0 then stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.ItemIndex],1,3);
  if cmb_Ecu.itemIndex > 0  then stEcuID := copy(DeviceIDList.Strings[cmb_Ecu.itemIndex],4,2);
  AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,'');

end;

procedure TfmAlaramDeviceAdmin.cmb_AreaCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
  stEcuID : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';
  stEcuID := '';
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex < 0 then Exit;
  stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];

  MCULoad(stBuildingCode,stFloorCode,stAreaCode,MCUIDList,cmb_MCUCode,'Y');

  if cmb_MCUCode.ItemIndex > 0 then stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.ItemIndex],1,3);
  if cmb_Ecu.itemIndex > 0  then stEcuID := copy(DeviceIDList.Strings[cmb_Ecu.itemIndex],4,2);
  AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,'');

end;

procedure TfmAlaramDeviceAdmin.cmb_sMCUCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;

begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';

  if cmb_BuildingCode1.ItemIndex > 0 then  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex] ;
  if cmb_FloorCode1.ItemIndex > 0 then  stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.ItemIndex];
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.ItemIndex];

  if cmb_sMCUCode.ItemIndex > 0 then stNodeNo := copy(sMCUIDList.Strings[cmb_sMCUCode.ItemIndex],1,3);
  DeviceLoad(stNodeNo,regDeviceIDList,cmb_regDeviceCode,'N');

end;

procedure TfmAlaramDeviceAdmin.ed_regAlarmNameEnter(Sender: TObject);
var
  TIMC: HIMC;
  dwSentence : DWORD; dwConversion : DWORD;
begin
  TIMC := ImmGetContext(TEdit(Sender).Handle);
  ImmGetConversionStatus(TIMC, dwConversion, dwSentence);
  ImmSetConversionStatus(TIMC, IME_CMODE_NATIVE, dwSentence);
  ImmReleaseContext(TEdit(Sender).Handle, TIMC);
end;

procedure TfmAlaramDeviceAdmin.mem_etcKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Length(mem_etc.Text) > 99 then
  begin
    showmessage('메모는 최대 100자 까지 입니다.');
  end;
end;

procedure TfmAlaramDeviceAdmin.LoadArmGubunCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sAreaCodeList.Clear;

  cmb_Box.Items.Add('');
  sAlarmGubunCodeList.Add('');
  cmb_Box.ItemIndex := 0;


  stSql := 'select * from TB_ALARMGUBUNCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stsql + ' order by AG_ARMCODE ';

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
        cmb_Box.Items.Add(FindField('AG_ARMNAME').AsString );
        sAlarmGubunCodeList.Add(FindField('AG_ARMCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure TfmAlaramDeviceAdmin.cmb_EcuChange(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  inherited;
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';
  if cmb_BuildingCode1.itemindex > 0 then
    stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex > 0 then
    stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex > 0 then
    stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];
  if cmb_MCUCode.itemIndex > -1 then
    stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.itemIndex],1,3);
  if cmb_Ecu.itemIndex > -1 then stEcuID := copy(DeviceIDList.Strings[cmb_Ecu.itemIndex],4,2);

  AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,'');

end;

function TfmAlaramDeviceAdmin.GetMaxArmAreaNo(aNodeNo,
  aEcuID: string): integer;
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

procedure TfmAlaramDeviceAdmin.ed_ArmAreaNameChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
  stEcuID : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';
  stEcuID := '';
  if cmb_BuildingCode1.itemindex > -1 then
  begin
    stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
    if cmb_FloorCode1.itemindex > -1 then
    begin
      stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
      if cmb_AreaCode1.itemindex > -1 then 
        stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];
    end;
  end;

  if cmb_MCUCode.ItemIndex > 0 then stNodeNo := copy(MCUIDList.Strings[cmb_MCUCode.ItemIndex],1,3);
  if cmb_Ecu.itemIndex > 0  then stEcuID := copy(DeviceIDList.Strings[cmb_Ecu.itemIndex],4,2);
  AlarmSearch(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stEcuID,'');

end;

procedure TfmAlaramDeviceAdmin.SpeedButton1Click(Sender: TObject);
var
  stSaveFileName : string;
begin
  inherited;
  SaveDialog1.FileName := '방범구역';
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if stSaveFileName <> '' then
    begin
      sg_Alarm.SaveToCSV(stSaveFileName);
    end;
  end;

end;

procedure TfmAlaramDeviceAdmin.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  cmb_BuildingCode1Change(cmb_BuildingCode1);
end;

procedure TfmAlaramDeviceAdmin.SearchLock(aEnable: Boolean);
begin
  cmb_BuildingCode1.Enabled := aEnable;
  cmb_FloorCode1.Enabled := aEnable;
  cmb_AreaCode1.Enabled := aEnable;
  cmb_MCUCode.Enabled := aEnable;
  cmb_Ecu.Enabled := aEnable;
  ed_ArmAreaName.Enabled := aEnable;
end;

end.
