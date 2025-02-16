unit uMDIAlarmZoneAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, Grids, BaseGrid, AdvGrid, Mask, RzEdit,
  RzSpnEdt, StdCtrls, Spin, ExtCtrls, RzCmboBx, DB, ADODB,ActiveX,
  uSubForm, CommandArray, AdvObj;

type
  TfmMDIAlarmZoneAdmin = class(TfmASubForm)
    pan_header: TPanel;
    GroupBox4: TGroupBox;
    Splitter2: TSplitter;
    Panel6: TPanel;
    GroupBox10: TGroupBox;
    Label7: TLabel;
    Label22: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label23: TLabel;
    Label12: TLabel;
    ed_regZoneNO: TEdit;
    cmd_sDeviceCode: TComboBox;
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
    cmb_DeviceCode: TComboBox;
    sg_AlarmZone: TAdvStringGrid;
    Panel1: TPanel;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    Label29: TLabel;
    cmb_WatchType: TComboBox;
    ADOQuery: TADOQuery;
    ed_EcuID: TEdit;
    chk_View: TCheckBox;
    ed_ZoneName: TEdit;
    Label1: TLabel;
    lb_Building1: TLabel;
    cmb_BuildingCode1: TComboBox;
    cmb_FloorCode1: TComboBox;
    lb_FloorCode1: TLabel;
    lb_AreaCode1: TLabel;
    cmb_AreaCode1: TComboBox;
    cmb_MCUCode: TComboBox;
    Label2: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sg_AlarmZoneClick(Sender: TObject);
    procedure cmb_DeviceCodeChange(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure cmb_sBuildingCodeChange(Sender: TObject);
    procedure cmb_sFloorCodeChange(Sender: TObject);
    procedure btnAlarmPositionClick(Sender: TObject);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure cmb_MCUCodeChange(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
  private
    State : string;
    ALARMIDList : TStringList;
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    MCUIDList : TStringList;
    DeviceIDList : TStringList;
    sALARMIDList : TStringList;
    sBuildingCodeList : TStringList;
    sFloorCodeList : TStringList;
    sAreaCodeList : TStringList;
    sDeviceIDList : TStringList;
    { Private declarations }
    procedure GridInit;
    procedure AlarmDeviceLoad(cmb_Box:TComboBox;bState:Boolean);
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure DeviceLoad(aList:TStringList;aBuildingCode,aFloorCode,aAreaCode,aNodeNo:string;cmb_Box: TComboBox; aType: string);
    procedure MCULoad(aList:TStringList;aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box: TComboBox; aType: string);
    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadsAlarmDevice(cmb_Box:TComboBox;bState:Boolean);
    procedure AlarmZoneSearch(aDeviceID,aSearchAlarmNo:string;aTop :integer = 0);
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    Function  UpdateTB_ZoneDEVICE(aNodeNo,aEcuID,
                        aZoneNO,
                        aZoneName,
                        aWatchType,
                        aBuildingCode,
                        aFloorCode,
                        aAreaCode,
                        aLocationUse,
                        aTotX,
                        aTotY,
                        aX,
                        aY,
                        aZoneView:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmMDIAlarmZoneAdmin: TfmMDIAlarmZoneAdmin;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uPositionSet;

{$R *.dfm}

procedure TfmMDIAlarmZoneAdmin.AlarmDeviceLoad(cmb_Box: TComboBox;bState:Boolean);
var
  stSql : string;
  stDeviceName : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  ALARMIDList.Clear;
  cmb_Box.Clear;
  cmb_Box.ItemIndex := -1;

  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  if cmb_MCUCode.ItemIndex > 0 then
  begin
    stNodeNo := MCUIDList.Strings[cmb_MCUCode.ItemIndex];
    stSql := stSql + ' AND AC_NODENO = ' + stNodeNo + ' ';
  end else if cmb_BuildingCode1.itemIndex > 0 then
  begin
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex];
    stSql := stSql + ' AND LO_DONGCODE = ''' + stBuildingCode + ''' ';
    if cmb_FloorCode1.ItemIndex > 0 then
    begin
      stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.ItemIndex];
      stSql := stSql + ' AND LO_FLOORCODE = ''' + stFloorCode + ''' ';
      if cmb_AreaCode1.ItemIndex > 0 then
      begin
        stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.ItemIndex];
        stSql := stSql + ' AND LO_AREACODE = ''' + stAreaCode + ''' ';
      end;
    end;
  end;
  stSql := stSql + ' order by AL_VIEWSEQ ';
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
      cmb_Box.Items.Add(FindField('AL_ZONENAME').AsString);
      ALARMIDList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString);
      Next;
    end;
    cmb_Box.ItemIndex := 0;
  end;

end;

procedure TfmMDIAlarmZoneAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMDIAlarmZoneAdmin.GridInit;
var
  nCol : integer;
begin
  with sg_AlarmZone do
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

procedure TfmMDIAlarmZoneAdmin.FormCreate(Sender: TObject);
begin
  ALARMIDList := TStringList.Create;
  sALARMIDList := TStringList.Create;
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  MCUIDList := TStringList.Create;
  DeviceIDList := TStringList.Create;
  sBuildingCodeList := TStringList.Create;
  sFloorCodeList := TStringList.Create;
  sAreaCodeList := TStringList.Create;
  sDeviceIDList := TStringList.Create;
end;

procedure TfmMDIAlarmZoneAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ALARMIDList.Free;
  sALARMIDList.Free;
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  MCUIDList.Free;
  DeviceIDList.Free;
  sBuildingCodeList.Free;
  sFloorCodeList.Free;
  sAreaCodeList.Free;
  sDeviceIDList.Free;

//  self.FindSubForm('Main').FindCommand('RESTART').Execute;

  Action := caFree;
end;

procedure TfmMDIAlarmZoneAdmin.FormShow(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
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
  MCULoad(MCUIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode,'Y');
  if cmb_MCUCode.ItemIndex > -1 then
  begin
    stNodeNo := MCUIDList.Strings[cmb_MCUCode.ItemIndex];
  end;
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,stNodeNo,cmb_DeviceCode,'N');
  DeviceLoad(sDeviceIDList,'','','','',cmd_sDeviceCode,'N');
//  AlarmDeviceLoad(cmb_AlarmCode,True);
//  LoadsAlarmDevice(cmb_regAlarmCode,False);
  LoadsBuildingCode(cmb_sBuildingCode);

  cmb_DeviceCodeChange(self);
  //AlarmZoneSearch('','');
end;

procedure TfmMDIAlarmZoneAdmin.AlarmZoneSearch(aDeviceID,
  aSearchAlarmNo: string;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInit; //스트링그리드 초기화

  stSql := 'select a.*,b.AC_DEVICENAME as DeviceName from TB_ZONEDEVICE a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aDeviceID <> '') and (aDeviceID <> '000') then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(aDeviceID,1,3))) ;
    stSql := stSql + ' AND a.AC_ECUID = ''' + copy(aDeviceID,4,2) + ''' ';
  end;
  stSql := stSql + ' order by a.AC_NODENO,a.AC_ECUID,a.AL_ZONENUM ';

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
      sg_AlarmZone.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_AlarmZone do
        begin
          cells[0,nRow] := FindField('DeviceName').AsString;
          cells[1,nRow] := FindField('AL_ZONENUM').AsString;
          cells[2,nRow] := FindField('AL_ZONENAME').AsString;
          cells[3,nRow] := FindField('AL_WATCHTYPE').AsString;
          cells[4,nRow] := FindField('LO_DONGCODE').AsString;
          cells[5,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[6,nRow] := FindField('LO_AREACODE').AsString;
          cells[7,nRow] := FindField('AL_LOCATEUSE').AsString;
          cells[8,nRow] := FindField('AL_TOTWIDTH').AsString;
          cells[9,nRow] := FindField('AL_TOTHEIGHT').AsString;
          cells[10,nRow] := FindField('AL_CURX').AsString;
          cells[11,nRow] := FindField('AL_CURY').AsString;
          cells[12,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString;
          cells[13,nRow] := FindField('AL_ZONEUSE').AsString;

          if cells[12,nRow] + FindField('AL_ZONENUM').AsString = aSearchAlarmNo then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
        end;
        Next;
      end;
      if aTop <> 0 then
        sg_AlarmZone.topRow := aTop
      else
      begin
        if sg_AlarmZone.row > 11 then sg_AlarmZone.TopRow := sg_AlarmZone.row - 10;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_AlarmZoneClick(sg_AlarmZone);
end;

procedure TfmMDIAlarmZoneAdmin.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmMDIAlarmZoneAdmin.FormClear;
begin
  cmd_sDeviceCode.ItemIndex := -1;
  ed_regZoneNO.Text := '';
  cmb_WatchType.ItemIndex := -1;
  ed_ZoneName.Text := '';
  chk_View.Checked := False;
  cmb_sBuildingCode.ItemIndex := 0;
  cmb_sFloorCode.Clear;
  cmb_sAreaCode.Clear;
  chk_AlarmReg.Checked := False;
  ed_TotWidth.Text := '0';
  ed_TotHeight.Text := '0';
  ed_CurX.Text := '0';
  ed_CurY.Text := '0';
end;

procedure TfmMDIAlarmZoneAdmin.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    //Alarm Form Enable
    sg_AlarmZone.Enabled := False;
    cmd_sDeviceCode.Enabled := True;
    ed_regZoneNO.Enabled := True;
    cmb_WatchType.Enabled := True;
    chk_View.Enabled := True;
    ed_ZoneName.Enabled := True;

    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    chk_AlarmReg.Enabled := True;
    btnAlarmPosition.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    //Alarm Form Enable
    sg_AlarmZone.Enabled := False;
    cmd_sDeviceCode.Enabled := False;
    ed_regZoneNO.Enabled := False;
    cmb_WatchType.Enabled := True;
    chk_View.Enabled := True;
    ed_ZoneName.Enabled := True;

    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    chk_AlarmReg.Enabled := True;
    btnAlarmPosition.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    //Alarm Form Enable
    sg_AlarmZone.Enabled := True;
    cmd_sDeviceCode.Enabled := False;
    ed_regZoneNO.Enabled := False;
    cmb_WatchType.Enabled := False;
    chk_View.Enabled := False;
    ed_ZoneName.Enabled := False;

    cmb_sBuildingCode.Enabled := False;
    cmb_sFloorCode.Enabled := False;
    cmb_sAreaCode.Enabled := False;
    chk_AlarmReg.Enabled := False;
    btnAlarmPosition.Enabled := False;
  end;
end;

procedure TfmMDIAlarmZoneAdmin.sg_AlarmZoneClick(Sender: TObject);
var
  stAlarmNo : string;
  stBuildingCode,stFloorCode : string;
begin

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_EcuID.Text := cells[12,Row];
    cmd_sDeviceCode.ItemIndex := sDeviceIDList.IndexOf(ed_EcuID.Text);

    ed_regZoneNO.Text  := cells[1,Row];
    ed_ZoneName.Text  := cells[2,Row];

    if Not IsDigit(cells[3,Row]) then cells[3,Row] := '0';
    cmb_WatchType.ItemIndex := strtoint(cells[3,Row]);

    if cells[13,Row] = 'Y' then chk_View.Checked := True
    else chk_View.Checked := False;

    if (cells[4,Row] = '') or (cells[4,Row] = '000') then cmb_sBuildingCode.ItemIndex := 0
    else cmb_sBuildingCode.ItemIndex := sBuildingCodeList.IndexOf(cells[4,Row]);
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
    LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
    if (cells[5,Row] = '') or (cells[5,Row] = '000') then cmb_sFloorCode.ItemIndex := 0
    else cmb_sFloorCode.ItemIndex := sFloorCodeList.IndexOf(cells[5,Row]);
    if cmb_sFloorCode.itemindex < 1 then stFloorCode := ''
    else stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
    LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);
    if (cells[6,Row] = '') or (cells[6,Row] = '000') then cmb_sAreaCode.ItemIndex := 0
    else cmb_sAreaCode.ItemIndex := sAreaCodeList.IndexOf(cells[6,Row]);

    if cells[7,Row] = 'Y' then chk_AlarmReg.Checked := True
    else chk_AlarmReg.Checked := False;
    ed_TotWidth.Text := cells[8,Row];
    ed_TotHeight.Text := cells[9,Row];
    ed_CurX.Text := cells[10,Row];
    ed_CurY.Text := cells[11,Row];

  end;

end;

procedure TfmMDIAlarmZoneAdmin.LoadsAreaCode(aBuildingCode,
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

procedure TfmMDIAlarmZoneAdmin.LoadsBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sBuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';
  
  cmb_Box.Items.Add('');
  sBuildingCodeList.Add('000');
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
        sBuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIAlarmZoneAdmin.LoadsFloorCode(aBuildingCode: string;
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

procedure TfmMDIAlarmZoneAdmin.cmb_DeviceCodeChange(Sender: TObject);
var
  stDeviceID : string;
begin
  if cmb_DeviceCode.itemIndex = -1 then cmb_DeviceCode.itemIndex := 0;
  stDeviceID := DeviceIDList.Strings[cmb_DeviceCode.itemIndex];
  AlarmZoneSearch(stDeviceID,'');
end;

procedure TfmMDIAlarmZoneAdmin.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ed_ZoneName.SetFocus;
  ButtonEnable(State);
end;

procedure TfmMDIAlarmZoneAdmin.btn_CancelClick(Sender: TObject);
var
  stDeviceID : string;
begin
  if cmd_sDeviceCode.itemIndex = -1 then cmd_sDeviceCode.itemIndex := 0;
  stDeviceID := DeviceIDList.Strings[cmb_DeviceCode.itemIndex];
  AlarmZoneSearch(stDeviceID,ed_EcuID.Text + ed_regZoneNO.Text,sg_AlarmZone.TopRow);
end;

procedure TfmMDIAlarmZoneAdmin.btn_SaveClick(Sender: TObject);
var
  stDeviceID : string;
  stBuildingCode,stFloorCode,stAreaCode : string;
  stLocationUse : string;
  stTotX,stTotY,stX,stY : string;
  stZoneView : string;
begin
  stDeviceID := ed_EcuID.Text;

  stZoneView := 'N';
  if chk_View.Checked then stZoneView := 'Y';

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
  if UpperCase(State) = 'UPDATE' then
  begin
    UpdateTB_ZoneDEVICE(copy(stDeviceID,1,3),copy(stDeviceID,4,2),
                        ed_regZoneNO.Text,
                        ed_ZoneName.Text,
                        inttostr(cmb_WatchType.ItemIndex),
                        stBuildingCode,
                        stFloorCode,
                        stAreaCode,
                        stLocationUse,
                        stTotX,
                        stTotY,
                        stX,
                        stY,
                        stZoneView);
  end;

  if cmb_DeviceCode.itemIndex = -1 then cmb_DeviceCode.itemIndex := 0;
  stDeviceID := DeviceIDList.Strings[cmb_DeviceCode.itemIndex];
  AlarmZoneSearch(stDeviceID,ed_EcuID.Text + ed_regZoneNO.Text,sg_AlarmZone.TopRow);

end;

function TfmMDIAlarmZoneAdmin.UpdateTB_ZoneDEVICE(aNodeNo,aEcuID, aZoneNO,aZoneName,
  aWatchType, aBuildingCode, aFloorCode, aAreaCode, aLocationUse, aTotX,
  aTotY, aX, aY,aZoneView: string): Boolean;
var
  stSql : string;
begin
  stSql := 'UPDATE TB_ZONEDEVICE set ';
  stSql := stSql + 'AL_ZONENAME = ''' + aZoneName + ''',';
  stSql := stSql + 'AL_LOCATEUSE = ''' + aLocationUse + ''',';
  stSql := stSql + 'AL_TOTWIDTH = ' + aTotX + ',';
  stSql := stSql + 'AL_TOTHEIGHT = ' + aTotY + ',';
  stSql := stSql + 'AL_CURX = ' + aX + ',';
  stSql := stSql + 'AL_CURY = ' + aY + ',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AL_WATCHTYPE = ''' + aWatchType + ''',';
  stSql := stSql + 'AL_ZONEUSE = ''' + aZoneView + ''',';
  stSql := stSql + 'SEND_ACK = ''N'', ';
  stSql := stSql + 'AL_UPDATE = ''Y'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aZoneNO + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMDIAlarmZoneAdmin.cmb_sBuildingCodeChange(Sender: TObject);
var
  stBuildingCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
  cmb_sAreaCode.Clear;

end;

procedure TfmMDIAlarmZoneAdmin.cmb_sFloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);

end;

procedure TfmMDIAlarmZoneAdmin.btnAlarmPositionClick(Sender: TObject);
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
  fmPositionSet.FormName := 'fmAlarmZoneAdmin';
  fmPositionSet.DeviceType := '7';
  fmPositionSet.DeviceName := cmd_sDeviceCode.Text + ':' + ed_regZoneNO.Text;
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


procedure TfmMDIAlarmZoneAdmin.LoadAreaCode(aBuildingCode,
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
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE ';

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
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIAlarmZoneAdmin.LoadBuildingCode(cmb_Box: TComboBox);
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
  stSql := stSql + ' order by LO_DONGCODE ';

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
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIAlarmZoneAdmin.LoadFloorCode(aBuildingCode: string;
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
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE';

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
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIAlarmZoneAdmin.LoadsAlarmDevice(cmb_Box: TComboBox;
  bState: Boolean);
var
  stSql : string;
  stDeviceName : string;
begin
  sALARMIDList.Clear;
  cmb_Box.Clear;
  sALARMIDList.Add('');
  if bState then
    cmb_Box.Items.Add('전체')
  else cmb_Box.Items.add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by AL_VIEWSEQ ';
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
      cmb_Box.Items.Add(FindField('AL_ZONENAME').AsString);
      sALARMIDList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString);
      Next;
    end;
  end;

end;

procedure TfmMDIAlarmZoneAdmin.cmb_BuildingCode1Change(Sender: TObject);
var
  stNodeNo : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';

  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode1);
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];;

  MCULoad(MCUIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode,'Y');

  if cmb_MCUCode.ItemIndex > -1 then
  begin
    stNodeNo := MCUIDList.Strings[cmb_MCUCode.ItemIndex];
  end;
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,stNodeNo,cmb_DeviceCode,'N');
  cmb_DeviceCodeChange(self);
end;

procedure TfmMDIAlarmZoneAdmin.cmb_FloorCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  if cmb_AreaCode1.itemindex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemindex];
  MCULoad(MCUIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode,'Y');

  if cmb_MCUCode.ItemIndex > -1 then
  begin
    stNodeNo := MCUIDList.Strings[cmb_MCUCode.ItemIndex];
  end;
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,stNodeNo,cmb_DeviceCode,'N');
  cmb_DeviceCodeChange(self);


end;

procedure TfmMDIAlarmZoneAdmin.cmb_AreaCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex < 0 then Exit;
  stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemindex];
  MCULoad(MCUIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode,'Y');

  if cmb_MCUCode.ItemIndex > -1 then
  begin
    stNodeNo := MCUIDList.Strings[cmb_MCUCode.ItemIndex];
  end;
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,stNodeNo,cmb_DeviceCode,'N');
  cmb_DeviceCodeChange(self);

end;

procedure TfmMDIAlarmZoneAdmin.MCULoad(aList: TStringList; aBuildingCode,
  aFloorCode, aAreaCode: string; cmb_Box: TComboBox; aType: string);
var
  stSql : string;
  stDeviceName : string;
begin
  aList.Clear;
  cmb_Box.Clear;
  aList.Add('');
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
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
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
      aList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3));
      Next;
    end;
  end;

end;

procedure TfmMDIAlarmZoneAdmin.cmb_MCUCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex < 0 then Exit;
  stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemindex];

  if cmb_MCUCode.ItemIndex > -1 then
  begin
    stNodeNo := MCUIDList.Strings[cmb_MCUCode.ItemIndex];
  end;
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,stNodeNo,cmb_DeviceCode,'N');
  cmb_DeviceCodeChange(self);

end;

procedure TfmMDIAlarmZoneAdmin.Panel1Resize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := Panel1.Width;
  nBlock := (nWidth - 200) div 4; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Update.Width div 2);

  btn_Update.Left := 100 + nLeft;
  btn_Save.Left := 100 + nBlock + nLeft;
  btn_Cancel.Left := 100 + (nBlock * 2) + nLeft;
  btn_Close.Left := 100 + (nBlock * 3) + nLeft;

end;

procedure TfmMDIAlarmZoneAdmin.DeviceLoad(aList: TStringList;
  aBuildingCode, aFloorCode, aAreaCode,aNodeNo: string; cmb_Box: TComboBox;
  aType: string);
var
  stSql : string;
  stDeviceName : string;
  stDeviceID : string;
begin
  aList.Clear;
  cmb_Box.Clear;
  if aType = 'Y' then
  begin
    aList.Add('');
    cmb_Box.Items.Add('전체');
    cmb_Box.ItemIndex := 0;
  end else
  begin
    //cmb_Box.Items.Add('');
  end;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
  stSql := stSql + ' AND AC_ACTYPE = ''1'' ';
  if aNodeNo <> '' then
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';

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
      aList.Add(stDeviceID);
      Next;
    end;
  end;

end;

initialization
  RegisterClass(TfmMDIAlarmZoneAdmin);
Finalization
  UnRegisterClass(TfmMDIAlarmZoneAdmin);

end.
