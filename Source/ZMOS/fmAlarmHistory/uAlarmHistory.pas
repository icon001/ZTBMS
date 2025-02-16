unit uAlarmHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons,
  uSubForm, CommandArray, DB, ADODB, AdvObj;

type
  TfmAlarmHistory = class(TfmASubForm)
    Panel12: TPanel;
    GroupBox1: TGroupBox;
    sg_AlarmReport: TAdvStringGrid;
    GroupBox2: TGroupBox;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    Label1: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    cmb_Position: TComboBox;
    Label4: TLabel;
    cmb_AlarmType: TComboBox;
    btn_Alarmposition: TSpeedButton;
    ZoneGroup: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    st_zone1: TStaticText;
    st_zone2: TStaticText;
    st_zone3: TStaticText;
    st_zone4: TStaticText;
    st_zone5: TStaticText;
    st_zone6: TStaticText;
    st_zone7: TStaticText;
    st_zone8: TStaticText;
    btn_positionZone1: TSpeedButton;
    btn_positionZone2: TSpeedButton;
    btn_positionZone3: TSpeedButton;
    btn_positionZone4: TSpeedButton;
    btn_positionZone5: TSpeedButton;
    btn_positionZone6: TSpeedButton;
    btn_positionZone7: TSpeedButton;
    btn_positionZone8: TSpeedButton;
    btn_Close: TSpeedButton;
    AdoQuery: TADOQuery;
    ADOQuery1: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_AlarmpositionClick(Sender: TObject);
    procedure cmb_PositionChange(Sender: TObject);
    procedure cmb_AlarmTypeChange(Sender: TObject);
    procedure dt_FromDateChange(Sender: TObject);
    procedure dt_ToDateChange(Sender: TObject);
    procedure btn_positionZone1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DeviceCodeList : TStringList;
    AlarmCodeList : TStringList;
    { Private declarations }
    procedure GetAlarmName(cmb_box : TComboBox);
    procedure GetAlarmType(cmb_box : TComboBox);
    procedure AlaramHistorySearch;
    procedure ZoneSearch(aNodeNo,aEcuID:string);
    Function TravelStaticText(Group:TGroupBox;aTextName:String;no:string):TStaticText;
  public
    { Public declarations }
    L_stNODENO : string;
    L_stECUID : string;
    L_stArmAreaNo : string;
    stDeviceName : string;
  end;

var
  fmAlarmHistory: TfmAlarmHistory;

implementation

uses
  uLomosUtil, uDataModule1, uDeviceMap, uMssql, uPostGreSql, uMDBSql,
  uZonePosition, uFireBird;
{$R *.dfm}

procedure TfmAlarmHistory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceCodeList.Free;
  AlarmCodeList.Free;

end;

procedure TfmAlarmHistory.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAlarmHistory.FormActivate(Sender: TObject);
var
  stDeviceID : string;
  nIndex : integer;
begin
  Try
    dt_FromDate.Date := Now -1;
    dt_ToDate.Date := Now;
    
    GetAlarmName(cmb_Position);
    GetAlarmType(cmb_AlarmType);
    if (Trim(L_stNODENO) <> '') and (Trim(L_stECUID) <> '')  then
    begin
      stDeviceID := FillzeroNumber(strtoint(L_stNODENO),3) + L_stECUID;
      nIndex := DeviceCodeList.IndexOf(stDeviceID);
      if nIndex < 0 then
      begin
        nIndex := 0;
      End;
      cmb_Position.ItemIndex := nIndex;
    end else Exit;
  Except
    Exit;
  End;
  ZoneSearch(L_stNODENO,L_stECUID);
  AlaramHistorySearch;
end;

procedure TfmAlarmHistory.GetAlarmName(cmb_box: TComboBox);
var
  stSql:string;
begin
  cmb_box.Clear;
  DeviceCodeList.Clear;
  cmb_box.Items.Add('전체');
  DeviceCodeList.Add('000000');
  cmb_box.ItemIndex := 0;

  stSql := 'select a.AR_NAME,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO  ';
  stSql := stSql + ' from TB_ARMAREA a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMAREA b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
      stSql := stSql + ' AND a.AR_AREANO = b.AR_AREANO ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AR_USE = ''Y'' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end;

  with DataModule1.ADOTmpQuery do
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
    First;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AR_NAME').AsString);
      DeviceCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + inttostr(FindField('AR_AREANO').AsInteger));
      Next;
    end;
  end;

end;

procedure TfmAlarmHistory.GetAlarmType(cmb_box: TComboBox);
var
  stSql:string;
begin
  cmb_box.Clear;
  AlarmCodeList.Clear;
  cmb_box.Items.Add('전체');
  AlarmCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := ' Select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  with DataModule1.ADOTmpQuery do
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
    First;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AL_ALARMNAME').AsString);
      AlarmCodeList.Add(FindField('AL_ALARMSTATUSCODE').AsString);
      Next;
    end;
  end;

end;

procedure TfmAlarmHistory.btn_AlarmpositionClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if cmb_Position.ItemIndex < 1 then Exit; //전체 이면 위치정보 안먹게
  stAlarmID:= DeviceCodeList.Strings[cmb_Position.ItemIndex];

  fmDeviceMap:= TfmDeviceMap.Create(Self);
  fmDeviceMap.DeviceID := stAlarmID;
  fmDeviceMap.DeviceName := cmb_Position.text;
  fmDeviceMap.L_stCreateForm := 'TfmAlarmHistory';
  fmDeviceMap.DeviceType := '4';
  fmDeviceMap.showmodal;

end;

procedure TfmAlarmHistory.AlaramHistorySearch;
var
  stSql : string;
  nRow : integer;
  stNodeNo,stEcuID,stArmAreaNo,stAlarmType:string;
begin
  GridInitialize(sg_AlarmReport);

  stNodeNo:='';
  stEcuID:= '';
  stAlarmType:= '';
  if cmb_Position.ItemIndex > 0 then
  begin
    stNodeNo := inttostr(strtoint(copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],1,3)));
    stEcuID := copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],4,2) ;
    stArmAreaNo := copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],6,1) ;
  end;
  if cmb_AlarmType.ItemIndex > 0 then
  begin
    stAlarmType := AlarmCodeList.Strings[cmb_AlarmType.ItemIndex] ;
  end;

  if DBTYPE = 'MSSQL' then
     stSql := MSSQL.SelectTB_ALARMEVENT_ArmAreaFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stAlarmType,False)
  else if DBTYPE = 'PG' then
     stSql := PostGreSql.SelectTB_ALARMEVENT_ArmAreaFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stAlarmType,False)
  else if DBTYPE = 'MDB' then
     stSql := MDBSql.SelectTB_ALARMEVENT_ArmAreaFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stAlarmType,False)
  else if DBTYPE = 'FB' then
     stSql := FireBird.SelectTB_ALARMEVENT_ArmAreaFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stAlarmType,False)
  else Exit;

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

    if RecordCount < 1 then
    begin
//      showmessage('조회할 데이터가 없습니다.');
      Exit;
    end;
    First;
    nRow := 1;
    sg_AlarmReport.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_AlarmReport  do
      begin
        cells[0,nRow] := copy(FindField('AL_DATE').AsString,1,4) + '-' + copy(FindField('AL_DATE').AsString,5,2)
                         + '-' + copy(FindField('AL_DATE').AsString,7,2)
                         + ' ' + copy(FindField('AL_TIME').AsString,1,2)
                         + ':' + copy(FindField('AL_TIME').AsString,3,2)
                         + ':' + copy(FindField('AL_TIME').AsString,5,2);   //발생시각
        if FindField('AR_NAME').AsString <> '' then
          cells[1,nRow] := FindField('AR_NAME').AsString
        else cells[1,nRow] := FindField('AC_DEVICENAME').AsString;
        cells[2,nRow] := FindField('AL_ZONENO').AsString;
        //cells[3,nRow] := FindField('AL_ALARMSTATUSCODE').AsString;    
        cells[3,nRow] := FindField('AL_ALARMDEVICETYPECODE').AsString;
        cells[4,nRow] := FindField('AL_SUBADDR').AsString;
        if FindField('AL_ALARMMODECODE').AsString = 'D' then cells[5,nRow] := '해제모드'
        else if FindField('AL_ALARMMODECODE').AsString = 'A' then cells[5,nRow] := '경계모드';
//        cells[4,nRow] := FindField('AL_ALARMMODECODE').AsString;
        if FindField('AL_ALARMNAME').AsString <> '' then
          cells[6,nRow] := FindField('AL_ALARMNAME').AsString + '(' + FindField('AL_OPERATOR').AsString + ')'
        else cells[6,nRow] := FindField('AL_ALARMSTATUSCODE').AsString + '(' + FindField('AL_OPERATOR').AsString + ')';
        cells[7,nRow] := FindField('AL_CHECKCODE').AsString;
        cells[8,nRow] := FindField('AL_CHECKMSG').AsString;
        cells[9,nRow] := FindField('AL_UPDATEOPERATOR').AsString;

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmAlarmHistory.ZoneSearch(aNodeNo, aEcuID: string);
var
  stSql : string;
begin
  stSql := 'select * from TB_ZONEDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  with ADOQuery1 do
  begin
    Close;
    SQL.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    while Not Eof do
    begin
      if findfield('AL_ZONENUM').AsString = '1' then st_zone1.Caption := findfield('AL_ZONENAME').AsString
      else if findfield('AL_ZONENUM').AsString = '2' then st_zone2.Caption := findfield('AL_ZONENAME').AsString
      else if findfield('AL_ZONENUM').AsString = '3' then st_zone3.Caption := findfield('AL_ZONENAME').AsString
      else if findfield('AL_ZONENUM').AsString = '4' then st_zone4.Caption := findfield('AL_ZONENAME').AsString
      else if findfield('AL_ZONENUM').AsString = '5' then st_zone5.Caption := findfield('AL_ZONENAME').AsString
      else if findfield('AL_ZONENUM').AsString = '6' then st_zone6.Caption := findfield('AL_ZONENAME').AsString
      else if findfield('AL_ZONENUM').AsString = '7' then st_zone7.Caption := findfield('AL_ZONENAME').AsString
      else if findfield('AL_ZONENUM').AsString = '8' then st_zone8.Caption := findfield('AL_ZONENAME').AsString;
      Next;
    End;
  end;
end;

procedure TfmAlarmHistory.cmb_PositionChange(Sender: TObject);
var
  stAC_NODENO,stAC_ECUID : string;
begin
  stAC_NODENO := inttostr(strtoint(copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],1,3)));
  stAC_ECUID := copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],4,2) ;

  ZoneSearch(stAC_NODENO,stAC_ECUID);
  AlaramHistorySearch;

end;

procedure TfmAlarmHistory.cmb_AlarmTypeChange(Sender: TObject);
begin
  AlaramHistorySearch;

end;

procedure TfmAlarmHistory.dt_FromDateChange(Sender: TObject);
begin
  AlaramHistorySearch;

end;

procedure TfmAlarmHistory.dt_ToDateChange(Sender: TObject);
begin
  AlaramHistorySearch;
end;

procedure TfmAlarmHistory.btn_positionZone1Click(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  aControl : TStaticText;
begin
  stNodeNo := inttostr(strtoint(copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],1,3)));
  stEcuID := copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],4,2) ;
  if stNodeNo = '0' then Exit;

  fmZonePosition:= TfmZonePosition.Create(Self);
  fmZonePosition.stAC_NODENO := stNodeNo;
  fmZonePosition.stAC_ECUID := stEcuID;
  fmZonePosition.stPortNo := inttostr(TSpeedButton(Sender).Tag);
  aControl := TravelStaticText(ZoneGroup,'st_zone',inttostr(TSpeedButton(Sender).Tag));
  fmZonePosition.stDeviceName  := aControl.caption + ' ';

  fmZonePosition.ShowModal;
  fmZonePosition.Free;

end;

Function TfmAlarmHistory.TravelStaticText(Group: TGroupBox;
  aTextName: String;no:string):TStaticText;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to Group.ControlCount-1 do
  Begin
    If LowerCase(Group.Controls[Loop].name) = LowerCase(aTextName) + no then
    Begin
      Result:=TStaticText(Group.Controls[Loop]);
      exit;
    End;
  End;

end;

procedure TfmAlarmHistory.FormShow(Sender: TObject);
begin
  Panel12.Caption := fmAlarmHistory.Caption;
  DeviceCodeList := TStringList.Create;
  AlarmCodeList := TStringList.Create;

end;

end.
