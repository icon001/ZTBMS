unit uReAtInsert_New;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Gauges, Buttons,ADODB,ActiveX,DateUtils, DB;

type
  TfmReAtInsert = class(TForm)
    StaticText1: TStaticText;
    dt_Fromdate: TDateTimePicker;
    dt_todate: TDateTimePicker;
    StaticText2: TStaticText;
    btn_AtReInsert: TSpeedButton;
    btn_Close: TSpeedButton;
    Gauge1: TGauge;
    AttendADOTemp: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_AtReInsertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    WorkTypeList : TStringList;      //근무환경타입에 따라 변경됨
   { Private declarations }
    Function  GetAttendConfig : Boolean;
    procedure WorkTypeListClear;   //근태 타입 Clear

    procedure ATSendClientData(Sender:TObject;aData : string;NodeNo:integer);
  public
    { Public declarations }
  end;

var
  fmReAtInsert: TfmReAtInsert;

implementation
uses
  uDataModule1,
  udmAdoQuery,
  uLomosutil,
  uMDBSql,uMssql,uPostGreSql, udmAttendEvent, UCommonModule;

{$R *.dfm}

procedure TfmReAtInsert.FormCreate(Sender: TObject);
begin
  dt_Fromdate.DateTime := Now;
  dt_toDate.DateTime := Now;

  WorkTypeList := TStringList.Create;

end;

procedure TfmReAtInsert.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmReAtInsert.btn_AtReInsertClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stFromDate,stToDate : string;
  stAtType : string;
  stTimestr : string;
  stCardNo : string;
  stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,stAWCode : string;
  nWorkTypeIndex : integer;
begin
  stFromDate := FormatdateTime('yyyymmdd',dt_Fromdate.Date);
  stToDate := FormatdateTime('yyyymmdd',dt_Todate.Date);

  stSql := 'Delete From TB_ATEVENT Where AT_DATE Between ''' + stFromDate + ''' and ''' + stToDate + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ACCESSEVENTJOINATDEVICE(stFromDate,stToDate)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectTB_ACCESSEVENTJOINATDEVICE(stFromDate,stToDate)
  else if DBTYPE = 'PG' then stSql := PostGresql.SelectTB_ACCESSEVENTJOINATDEVICE(stFromDate,stToDate)
  else Exit;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      Gauge1.Visible := True;
      Gauge1.Progress := 0;
      Gauge1.MaxValue := recordcount;
      while Not Eof do
      begin
        stTimestr := FindField('AC_DATE').Asstring + FindField('AC_TIME').Asstring;
        stCardNo := FindField('CA_CARDNO').Asstring;
        if CommonModule.GetEmployeeInfo_AWCODE(stCardNo,False,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,stAWCode) then
        begin
        //dmAttendEvent.Process_ATEvent(stTimestr,FillZeroNumber(FindField('AC_NODENO').AsInteger,3),FindField('AC_ECUID').AsString,stCardNo,FindField('DO_DOORNO').AsString[1],FindField('AC_READERNO').AsString[1],FindField('AC_BUTTONNO').AsString[1]);
          if Trim(stAWCode) = '' then stAWCode := '001';
          if G_nAttendWorkingType <> 3 then stAWCode := '001'; //혼합이 아닌경우 무조건 '001'로 인식하자.
          nWorkTypeIndex := WorkTypeList.IndexOf(stAWCode);
          if nWorkTypeIndex > -1 then
          begin
            TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).Process_EmployeeATEvent(stTimestr,FillZeroNumber(FindField('AC_NODENO').AsInteger,3),FindField('AC_ECUID').AsString,stCardNo,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,FindField('DO_DOORNO').AsString[1],FindField('AC_READERNO').AsString[1],FindField('AC_BUTTONNO').AsString[1],FindField('AC_DOORPOSI').AsString);
          end;
        end;
        Gauge1.Progress := Gauge1.Progress +  1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Gauge1.Visible := False;
end;


procedure TfmReAtInsert.ATSendClientData(Sender: TObject; aData: string;
  NodeNo: integer);
begin
//
end;

procedure TfmReAtInsert.FormShow(Sender: TObject);
begin
  GetAttendConfig;
end;

function TfmReAtInsert.GetAttendConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  dmAttend : TdmAttendEvent;
  stWorkTypeCode : string;
  nWorkTypeIndex : integer;
  i : integer;
begin
  Result := False;
  if WorkTypeList.Count > 0 then WorkTypeListClear;
  WorkTypeList.Clear;

  G_nAttendWorkingType := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''ATTEND'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''ATTYPE'' ';
  with AttendADOTemp do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    First;
    if recordcount > 0 then
    begin
      if isdigit(FindField('CO_CONFIGVALUE').AsString) then
        G_nAttendWorkingType := strtoint(FindField('CO_CONFIGVALUE').AsString);
    end;
  End;

  stSql := 'select * from TB_ATWORKTYPE ';
  stSql := stSql + ' Order by AW_CODE ';

  with AttendADOTemp do
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
      if G_bApplicationTerminate then Exit;
      dmAttend:= TdmAttendEvent.Create(Self);
      dmAttend.OnSendEvent := ATSendClientData;
      dmAttend.StringListClear;
      dmAttend.AttendWorkTypeCode := FindField('AW_CODE').AsString;
      dmAttend.AttendWorkingType := G_nAttendWorkingType;
      dmAttend.AtYesterDayStandTime := FindField('AW_YESTERDAYTIME').AsString;
      if isDigit(FindField('AW_SATURDAYTYPE').AsString) then
        dmAttend.SaturdayType := strtoint(FindField('AW_SATURDAYTYPE').AsString)
      else dmAttend.SaturdayType := 0;
      if isDigit(FindField('AW_DEVICETYPE').AsString) then
        dmAttend.ATDeviceType := strtoint(FindField('AW_DEVICETYPE').AsString)
      else dmAttend.ATDeviceType := 0;
      if isDigit(FindField('AW_FIXATTYPE').AsString) then
        dmAttend.ATOutFixedType := strtoint(FindField('AW_FIXATTYPE').AsString)
      else dmAttend.ATOutFixedType := 0;
      if isDigit(FindField('AW_NOTBACKUPTYPE').AsString) then
        dmAttend.ATWorkNotBackupType := strtoint(FindField('AW_NOTBACKUPTYPE').AsString)
      else dmAttend.ATWorkNotBackupType := 0;
      dmAttend.ATStartWorkNo:= FindField('AW_ATSTARTBUTTON').AsString;
      dmAttend.ATOffWorkNo:= FindField('AW_ATOFFBUTTON').AsString;
      if isDigit(FindField('AW_INOUTDEVICETYPE').AsString) then
        dmAttend.ATInOutDeviceType := strtoint(FindField('AW_INOUTDEVICETYPE').AsString)
      else dmAttend.ATInOutDeviceType := 0;
      dmAttend.ATWorkOutsideNo:= FindField('AW_WORKOUTBUTTON').AsString;
      dmAttend.ATWorkInNo:= FindField('AW_WORKINBUTTON').AsString;

      WorkTypeList.AddObject(FindField('AW_CODE').AsString,dmAttend);
      Next;
    end;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;



    stSql := 'select * from TB_ATCODE ';
    stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;

      if recordCount < 1 then Exit;
      First;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        stWorkTypeCode := '001';
        if Not FindField('AW_CODE').IsNull then
        begin
          if FindField('AW_CODE').AsString <> '' then stWorkTypeCode := FindField('AW_CODE').AsString; 
        end;
        nWorkTypeIndex := WorkTypeList.IndexOf(stWorkTypeCode);
        if nWorkTypeIndex > -1 then
        begin
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigCodeList_Add(FindField('AT_ATCODE').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigInFromTimeList_Add(FindField('AT_INFROMTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigInToTimeList_Add(FindField('AT_INTOTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigWorkTimeList_Add(FindField('AT_WORKSTARTTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigOutTimeList_Add(FindField('AT_WORKENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigExtendTimeList_Add(FindField('AT_EXTENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigNightTimeList_Add(FindField('AT_NIGHTTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSInFromTimeList_Add(FindField('AT_SINFROMTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSInToTimeList_Add(FindField('AT_SINTOTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSWorkTimeList_Add(FindField('AT_SWORKSTARTTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSOutTimeList_Add(FindField('AT_SWORKENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSExtendTimeList_Add(FindField('AT_SEXTENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSNightTimeList_Add(FindField('AT_SNIGHTTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHInFromTimeList_Add(FindField('AT_HINFROMTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHInToTimeList_Add(FindField('AT_HINTOTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHWorkTimeList_Add(FindField('AT_HWORKSTARTTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHOutTimeList_Add(FindField('AT_HWORKENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHExtendTimeList_Add(FindField('AT_HEXTENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHNightTimeList_Add(FindField('AT_HNIGHTTIME').AsString);
        end;

        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Result := True;
end;

procedure TfmReAtInsert.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WorkTypeList.Free;
end;

procedure TfmReAtInsert.WorkTypeListClear;
var
  i : integer;
begin
  for i := 0 to WorkTypeList.Count - 1 do
  begin
    TdmAttendEvent(WorkTypeList.Objects[i]).Free;
  end;
  WorkTypeList.Clear;

end;

end.
