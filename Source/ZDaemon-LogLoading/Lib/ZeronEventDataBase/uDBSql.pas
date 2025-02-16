unit uDBSql;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmDBSql = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    Function GetTB_ACCESSDEVICE_BuidingCode(aGroupCode,aBuildingCode, aFloorCode,aAreaCode:string) : string;
    Function GetTB_ACCESSDEVICE_DeviceList(aGroupCode, aNodeNo, aEcuID:string) : string;
    Function GetTB_ACCESSDEVICE_DeviceName(aGroupCode,aNodeNo,aName:string) : string;
    Function GetTB_ACCESSDEVICE_DeviceVersion(aGroupCode, aNodeNo, aEcuID:string) : string;
    Function GetTB_ACCESSDEVICE_FoodDevice(aGroupCode:string):String;
    Function GetTB_ACCESSDEVICE_NodeID(aGroupCode,aNodeNo:string) : string;
    Function GetTB_ACCESSDEVICE_NodeName(aGroupCode,aName:string) : string;
    Function GetTB_ACCESSEVENT_AccessHistoryReport(aGroupCode,aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,aDoorCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCardType,aEmType,aEtcType,aEtcName:string;aTimeType:integer=0):string;
    Function GetTB_ACCESSEVENT_AccessReport(aGroupCode,aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,aDoorCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCardType,aEmType,aEtcType,aEtcName:string;aTimeType:integer=0):string;
    Function GetTB_ACCESSEVENT_AlarmAreaAccessReport(aGroupCode,aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,aAlarmAreaCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCardType,aEmType,aEtcType,aEtcName:string;aTimeType:integer=0):string;
    Function GetTB_ACCESSEVENT_JOINATDEVICE(aFromDate,aToDate:string;aEmCode:string=''):string;
    Function GetTB_ACCESSEVENT_PatrolReport(aStartDate, aStartTime,aEndDate, aEndTime, aNodeNo, aEcuID, aReaderNo, aName:string):string;
    Function GetTB_ADMINALARMDEVICE_AlarmGrade(aGroupCode,aUserID,aBuildingCode,aFloorCode,aAreaCode:string):String;
    Function GetTB_ADMINCOMPANY_CompanyGrade(aGroupCode,aUserID: string):string;
    Function GetTB_ADMINCOMPANY_DepartGrade(aGroupCode,aUserID,aCompanyCode,aJijumCode: string):string;
    Function GetTB_ADMINCOMPANY_JijumGrade(aGroupCode,aUserID,aCompanyCode: string):string;
    Function GetTB_ADMINDOOR_DoorGrade(aGroupCode,aUserID,aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetTB_ADMINFOOD_FoodGrade(aGroupCode,aUserID,aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetTB_ADMIN_AdminUserName(aGroupCode,aName:string):string;
    Function GetTB_ALARMDEVICE_AlarmAreaGradeReport(aGroupCode,aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,aAlarmAreaCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCardType,aEmType,aEtcType,aEtcName:string;aTimeType:integer=0):string;
    Function GetTB_ALARMDEVICE_AlarmName(aGroupCode,aNodeNo,aName:string) : string;
    Function GetTB_ALARMDEVICE_BuidingCode(aGroupCode,aBuildingCode, aFloorCode,aAreaCode:string) : string;
    Function GetTB_ALARMDEVICE_BuildingAlarmName(aGroupCode,aBuildingCode,aFloorCode,aAreaCode,aName:string) : string;
    Function GetTB_ALARMDEVICE_CardAlarmPermit(aGroupCode,aCardNo,aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetTB_ALARMDEVICE_DEVICECARDNOGROUP(aGroupCode,aDeviceCardGroupCode,aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetTB_ALARMDEVICE_NotCardAlarmPermit(aGroupCode,aCardNo,aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetTB_ALARMDEVICE_TelNumber(aGroupCode,aNodeNo,aEcuID:string):string;
    Function GetTB_ALARMEVENT_AlarmConfirm(aGroupCode,aNodeNo,aEcuID:string;aMsgNo:string = '';aAlarmDate:string='';aAlarmTime:string=''):string;
    Function GetTB_ALARMEVENT_AlarmEventList(aAlarmDate:string):string;
    Function GetTB_ALARMEVENT_AlarmReport(aGroupCode,aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,aAlarmAreaCode,aAlarmMode,aAlarmType,aDeviceType,aAlarmCheckCode,aCardGubun,aName:string;aAlarmGroup:integer; aList:TStringList;aTimeType:integer=0):string;
    Function GetTB_ARMAREA_AlarmName(aGroupCode,aNodeNo,aEcuID,aName,aBuildingCode,aFloorCode,aAreaCode,aArmAreaGubun,aArmAreaDisplay:string):string;
    Function GetTB_ARMAREA_BuildingCode(aGroupCode,aBuildingCode, aFloorCode,aAreaCode:string) : string;
    Function GetTB_ArmArea_ArmAreaGradeReport(aGroupCode,aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,aArmAreaCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCardType,aEmType,aEtcType,aEtcName:string;aTimeType:integer=0):string;
    Function GetTB_ArmArea_EmployeePermit(aBuildingCode,aFloorCode,aAreaCode,aCompanyCode,aEmCode:string):string;
    Function GetTB_ArmArea_GROUPPermit(aBuildingCode,aFloorCode,aAreaCode,aEmGroupCode:string):string;
    Function GetTB_ATEVENT_Report(aGroupCode, aStartDate,aEndDate, aCompanyCode, aJijumCode, aDepartCode, aPosiCode,aEmType, aEtcType, aEtcName:string;aTimeType:integer=0):string;
    Function GetTB_CARD_CardAlarmPermit(aGroupCode,aNodeNo,aEcuID,aCompanyCode,aJijumCode,aDepartCode:string):string;
    Function GetTB_CARD_CardDoorPermit(aGroupCode,aNodeNo,aEcuID,aDoorNO,aCompanyCode,aJijumCode,aDepartCode:string):string;
    Function GetTB_CARD_EmCode(aCompanyCode,aEmCode:string):string;
    Function GetTB_CARD_EmInfo(aGroupCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCardRegType,aEmployeeType,aCardGubun:string;aEtcIndex:integer;aEtcString:string):string;
    Function GetTB_CARD_EmName(aGroupCode,aEmName:string):string;
    Function GetTB_CARD_NOTCardAlarmPermit(aGroupCode,aNodeNo,aEcuID,aCompanyCode,aJijumCode,aDepartCode:string):string;
    Function GetTB_CARD_NOTCardDoorPermit(aGroupCode,aNodeNo,aEcuID,aDoorNO,aCompanyCode,aJijumCode,aDepartCode:string):string;
    Function GetTB_Company_CompanyName(aGroupCode,aName:string) : string;
    Function GetTB_Company_DepartName(aGroupCode,aCompanyCode,aJijumCode,aName:string) : string;
    Function GetTB_Company_JijumName(aGroupCode,aCompanyCode,aName:string) : string;
    Function GetTB_DEVICECARDNO_GradeReport(aBuildingCode,aFloorCode,aAreaCode, aNodeNo, aEcuID, aDoorNo, aCompanyCode,
            aJijumCode,aDepartCode,aPosiCode, aEmpGubun:string; aEtcIndex:integer; aEtcString: string):string;
    Function GetTB_DEVICESCHEDULE_DoorNo(aGroupCode,aNodeNo,aEcuID,aDoorNo:string):string;
    Function GetTB_DOOR_BuidingCode(aGroupCode,aBuildingCode, aFloorCode,aAreaCode:string) : string;
    Function GetTB_DOOR_BuildingDoorName(aGroupCode,aBuildingCode,aFloorCode,aAreaCode,aName:string) : string;
    Function GetTB_DOOR_BuildingScheduleUse(aGroupCode,aBuildingCode,aFloorCode,aAreaCode,aName:string):string;
    Function GetTB_DOOR_CardDoorPermit(aGroupCode,aCardNo,aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetTB_DOOR_DEVICECARDNOGROUP(aGroupCode,aDeviceCardGroupCode,aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetTB_DOOR_DeviceDoorName(aGroupCode,aNodeNo,aEcuID,aName:string;aBuildingCode:string='000';aFloorCode:string='000';aAreaCode:string='000';aDoorGubun:string='') : string;
    Function GetTB_DOOR_DoorGradeReport(aGroupCode,aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,aDoorCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCardType,aEmType,aEtcType,aEtcName:string;aTimeType:integer=0):string;
    Function GetTB_Door_EmployeePermit(aBuildingCode,aFloorCode,aAreaCode,aCompanyCode,aEmCode:string):string;
    Function GetTB_DOOR_GROUPPermit(aBuildingCode,aFloorCode,aAreaCode,aEmGroupCode:string):string;
    Function GetTB_DOOR_NotCardDoorPermit(aGroupCode,aCardNo,aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetTB_EMPLOYEE_EmpInfo(aGroupCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCardRegType,aEmployeeType,aCardGubun:string;aEtcIndex:integer;aEtcString:string;aCardGroupCode:string):string;
    Function GetTB_EMPLOYEE_Info(aGroupCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmployeeType,aCardGroupCode,aWorkCode:string;aEtcIndex:integer;aEtcString,aEmployeeState:string):string;
    Function GetTB_FOOD_BuildingFoodName(aGroupCode,aBuildingCode,aFloorCode,aAreaCode,aName:string) : string;
    Function GetTB_GRADE_AdminClassName(aGroupCode,aName:string):string;
    Function GetTB_Holiday_Name(aGroupCode,aYear:string) : string;
    Function GetTB_LOCATION_AreaName(aGroupCode,aBuildingCode,aFloorCode,aName:string) : string;
    Function GetTB_LOCATION_BuildingGubun(aGroupCode,aGubun:string) : string;
    Function GetTB_LOCATION_BuildingName(aGroupCode,aName:string) : string;
    Function GetTB_Location_FloorName(aGroupCode,aBuildingCode,aName:string) : string;
    Function GetTB_PATROLALARMEVENT_NotPatrolReport(aStartDate, aEndDate, aNodeNo, aEcuID, aReaderNo:string):string;
    Function GetTB_POSI_PosiName(aGroupCode,aCompanyCode,aName:string) : string;
    Function GetTB_PROGRAMID_GradeProgram(aGroupCode,aAdminClassCode,aProgramGroupCode,aMenuGroupCode:string):string;
    Function GetTB_PROGRAMID_NotGradeProgram(aGroupCode,aAdminClassCode,aProgramGroupCode,aMenuGroupCode:string):string;
    Function GetTB_READER_PatrolReader(aNodeNo,aEcuID:string):string;
    function GetTB_SYSTEMLOG_AlarmAreaReport(aGroupCode, aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,aAlarmAreaCode:string;aTimeType:integer=0):string;
    Function GetTB_SYSTEMLOG_CardReport(aGroupCode,aStartDate,aStartTime,aEndDate,aEndTime,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCardType,aEmType,aEtcType,aEtcName:string;aTimeType:integer=0):string;
    function GetTB_SYSTEMLOG_DoorReport(aGroupCode, aStartDate,aStartTime,aEndDate,aEndTime,aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aEcuID,aDoorCode:string;aTimeType:integer=0):string;
    Function GetTB_ZONEDEVICE_BuidingCode(aGroupCode,aBuildingCode, aFloorCode,aAreaCode:string) : string;
  end;

var
  dmDBSql: TdmDBSql;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDBVariable,
  uDeviceVariable;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDataModule1 }

function TdmDBSql.GetTB_ACCESSDEVICE_BuidingCode(aGroupCode, aBuildingCode,
  aFloorCode, aAreaCode: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then
    stSql := stSql + ' AND LO_AREACODE Like ''' + aAreaCode + '%'' ';
  stSql := stSql + ' order by AL_ZONENAME ';
  result := stSql;
end;

function TdmDBSql.GetTB_ACCESSDEVICE_DeviceList(aGroupCode, aNodeNo,
  aEcuID: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.AC_DEVICENAME,a.AC_VER,b.ac_mcuip as NodeIP, ';
  stSql := stSql + ' d.AL_ZONENAME,e.DO_DOORNONAME as door1Name,f.DO_DOORNONAME as door2Name, ';
  stSql := stSql + ' a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  stSql := stSql + ' Left Join (select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where ac_gubun = ''0'') b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ) ';
  stSql := stSql + 'Left Join TB_ALARMDEVICE d ';
  stSql := stSql + 'ON(a.AC_NODENO = d.AC_NODENO and a.AC_ECUID = d.AC_ECUID) ';
  stSql := stSql + 'Left Join TB_DOOR e ';
  stSql := stSql + 'ON(a.AC_NODENO = e.AC_NODENO and a.AC_ECUID = e.AC_ECUID and e.DO_DOORNO = ''1'') ';
  stSql := stSql + 'Left Join TB_DOOR f ';
  stSql := stSql + 'ON(a.AC_NODENO = f.AC_NODENO and a.AC_ECUID = f.AC_ECUID and f.DO_DOORNO = ''2'') ';
  stsql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aNodeNo <> '' then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + '';
    if aEcuID <> '' then stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
  end;
  result := stSql;
end;

function TdmDBSql.GetTB_ACCESSDEVICE_DeviceName(aGroupCode, aNodeNo,
  aName: string): string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.AC_MCUIP as NodeIP from TB_ACCESSDEVICE a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_GUBUN = ''0'') ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if isDigit(aNodeNo) then
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
  if aName <> '' then
    stSql := stSql + ' AND a.AC_DEVICENAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by b.AC_MCUIP,a.AC_ECUID ';

  result := stSql;
end;

function TdmDBSql.GetTB_ACCESSDEVICE_DeviceVersion(aGroupCode, aNodeNo,
  aEcuID: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.AC_DEVICENAME,a.AC_VER,b.ac_mcuip as NodeIP ';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  stSql := stSql + ' Left Join (select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where ac_gubun = ''0'') b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ) ';
  stsql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aNodeNo <> '' then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + '';
    if aEcuID <> '' then stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
  end;
  result := stSql;
end;

function TdmDBSql.GetTB_ACCESSDEVICE_FoodDevice(aGroupCode:string): String;
var
  stSql : string;
begin
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND AC_FDTYPE = ''1'' ';
  stSql := stSql + ' order by AC_NODENO ';

  result := stSql;
end;

function TdmDBSql.GetTB_ACCESSDEVICE_NodeID(aGroupCode,
  aNodeNo: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND AC_GUBUN = ''0'' ';
  if aNodeNo <> '' then
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' order by AC_NODENO,AC_MCUIP ';

  result := stSql;
end;

function TdmDBSql.GetTB_ACCESSDEVICE_NodeName(aGroupCode,
  aName: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND AC_GUBUN = ''0'' ';
  if aName <> '' then
    stSql := stSql + ' AND AC_DEVICENAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by AC_NODENO,AC_MCUIP ';

  result := stSql;
end;

function TdmDBSql.GetTB_ACCESSEVENT_AccessHistoryReport(aGroupCode, aStartDate,
  aStartTime, aEndDate, aEndTime, aBuildingCode, aFloorCode, aAreaCode, aNodeNo,
  aEcuID, aDoorCode, aCompanyCode, aJijumCode, aDepartCode, aPosiCode,
  aCardType, aEmType, aEtcType, aEtcName: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := ' select a.AC_DATE,a.AC_TIME,l.LO_NAME as BUILDINGNAME,m.LO_NAME as FLOORNAME,n.LO_NAME as AREANAME,';
  stSql := stSql + ' k.DO_DOORNONAME,d.CO_NAME as COMPANYNAME,e.CO_NAME as JIJUMNAME,f.CO_NAME as DEPARTNAME,';
  stSql := stSql + ' g.PO_NAME,a.EM_CODE,a.EM_NAME,a.CA_CARDNO,a.AC_READERNO,p.AC_DOORPOSINAME,o.AC_INPUTTYPENAME,';
  stSql := stSql + ' j.PE_PERMITNAME,h.CT_NAME,c.EM_HANDPHONE,c.EM_HOMEPHONE,c.EM_COPHONE,c.EM_ADDR1,c.EM_ADDR2,i.RG_NAME as EM_TYPE,';
  stSql := stSql + ' k.LO_DONGCODE,k.LO_FLOORCODE,k.LO_AREACODE,a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO,';
  stSql := stSql + ' a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,c.PO_POSICODE,b.CA_CARDTYPE,c.RG_CODE from ';
  stSql := stSql + ' TB_ACCESSEVENT a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = c.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( c.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( c.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY f ';
  stSql := stSql + ' ON ( c.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_JIJUMCODE = f.CO_JIJUMCODE ';
  stSql := stSql + ' AND c.CO_DEPARTCODE = f.CO_DEPARTCODE ';
  stSql := stSql + ' AND f.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI g ';
  stSql := stSql + ' ON ( c.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = g.CO_COMPANYCODE  ';
  stSql := stSql + ' AND c.PO_POSICODE = g.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_CARDTYPE h ';
  stSql := stSql + ' ON ( b.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_GUBUN = h.CT_CODE) ';
  stSql := stSql + ' Left Join TB_RELAYGUBUN i ';
  stSql := stSql + ' ON ( c.GROUP_CODE = i.GROUP_CODE ';
  stSql := stSql + ' AND c.RG_CODE = i.RG_CODE) ';
  stSql := stSql + ' Left Join TB_PERMITCODE j ';
  stSql := stSql + ' ON ( a.GROUP_CODE = j.GROUP_CODE ';
  stSql := stSql + ' AND a.PE_PERMITCODE = j.PE_PERMITCODE ) ';
  stSql := stSql + ' Left Join TB_DOOR k ';
  stSql := stSql + ' ON ( a.GROUP_CODE = k.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = k.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = k.AC_ECUID  ';
  stSql := stSql + ' AND a.DO_DOORNO = k.DO_DOORNO ) ';
  stSql := stSql + ' Left Join TB_LOCATION l ';
  stSql := stSql + ' ON ( k.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND k.LO_DONGCODE = l.LO_DONGCODE ';
  stSql := stSql + ' AND l.LO_GUBUN = ''0'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION m ';
  stSql := stSql + ' ON ( k.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND k.LO_DONGCODE = m.LO_DONGCODE ';
  stSql := stSql + ' AND k.LO_FLOORCODE = m.LO_FLOORCODE ';
  stSql := stSql + ' AND m.LO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION n ';
  stSql := stSql + ' ON ( k.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND k.LO_DONGCODE = m.LO_DONGCODE ';
  stSql := stSql + ' AND k.LO_FLOORCODE = m.LO_FLOORCODE ';
  stSql := stSql + ' AND k.LO_AREACODE = m.LO_AREACODE ';
  stSql := stSql + ' AND m.LO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_ACCESSINPUTTYPE o ';
  stSql := stSql + ' ON (a.GROUP_CODE = o.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_INPUTTYPE = o.AC_INPUTTYPE ) ';
  stSql := stSql + ' Left Join TB_DOORPOSICODE p ';
  stSql := stSql + ' ON (a.GROUP_CODE = p.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_DOORPOSI = p.AC_DOORPOSI ) ';

  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.AC_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.AC_DATE + a.AC_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.AC_DATE || a.AC_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aNodeNo = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND k.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if aFloorCode <> '' then stSql := stSql + ' AND k.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if aAreaCode <> '' then stSql := stSql + ' AND k.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    if aDoorCode <> '' then stSql := stSql + ' AND a.DO_DOORNO = ''' + aDoorCode + ''' ';
  end;
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND a.EM_NAME Like ''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND a.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND c.EM_COPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //집전화번호
          stSql := stSql + ' AND c.EM_HOMEPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //휴대전화번호
          stSql := stSql + ' AND c.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //카드번호
          stSql := stSql + ' AND a.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '6' : begin  //주소1
          stSql := stSql + ' AND c.EM_ADDR1 Like ''%' + aEtcName + '%'' ';
      end;
      '7' : begin  //주소2
          stSql := stSql + ' AND c.EM_ADDR2 Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '' then stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    if aJijumCode <> '' then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
    if aDepartCode <> '' then stSql := stSql + ' AND a.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND c.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardType <> '0' then stSql := stSql + ' AND b.CA_CARDTYPE = ''' + aCardType + ''' ';
    if aEmType <> '' then stSql := stSql + ' AND c.RG_CODE = ''' + aEmType + ''' ';
  end;
  stSql := stSql + ' order by a.AC_DATE,a.AC_TIME ';
  result := stSql;

end;

function TdmDBSql.GetTB_ACCESSEVENT_AccessReport(aGroupCode, aStartDate,
  aStartTime, aEndDate, aEndTime, aBuildingCode, aFloorCode, aAreaCode, aNodeNo,
  aEcuID, aDoorCode, aCompanyCode, aJijumCode, aDepartCode, aPosiCode,
  aCardType, aEmType, aEtcType, aEtcName: string;aTimeType:integer=0): string;
var
  stSql : string;
begin
  stSql := ' select a.AC_DATE,a.AC_TIME,l.LO_NAME as BUILDINGNAME,m.LO_NAME as FLOORNAME,n.LO_NAME as AREANAME,';
  stSql := stSql + ' k.DO_DOORNONAME,d.CO_NAME as COMPANYNAME,e.CO_NAME as JIJUMNAME,f.CO_NAME as DEPARTNAME,';
  stSql := stSql + ' g.PO_NAME,c.EM_CODE,c.EM_NAME,a.CA_CARDNO,a.AC_READERNO,p.AC_DOORPOSINAME,o.AC_INPUTTYPENAME,';
  stSql := stSql + ' j.PE_PERMITNAME,h.CT_NAME,c.EM_HANDPHONE,c.EM_HOMEPHONE,c.EM_COPHONE,c.EM_ADDR1,c.EM_ADDR2,i.RG_NAME as EM_TYPE,';
  stSql := stSql + ' k.LO_DONGCODE,k.LO_FLOORCODE,k.LO_AREACODE,a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO,';
  stSql := stSql + ' c.CO_COMPANYCODE,c.CO_JIJUMCODE,c.CO_DEPARTCODE,c.PO_POSICODE,b.CA_CARDTYPE,c.RG_CODE from ';
  stSql := stSql + ' TB_ACCESSEVENT a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = c.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( c.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( c.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY f ';
  stSql := stSql + ' ON ( c.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_JIJUMCODE = f.CO_JIJUMCODE ';
  stSql := stSql + ' AND c.CO_DEPARTCODE = f.CO_DEPARTCODE ';
  stSql := stSql + ' AND f.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI g ';
  stSql := stSql + ' ON ( c.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = g.CO_COMPANYCODE  ';
  stSql := stSql + ' AND c.PO_POSICODE = g.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_CARDTYPE h ';
  stSql := stSql + ' ON ( b.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_GUBUN = h.CT_CODE) ';
  stSql := stSql + ' Left Join TB_RELAYGUBUN i ';
  stSql := stSql + ' ON ( c.GROUP_CODE = i.GROUP_CODE ';
  stSql := stSql + ' AND c.RG_CODE = i.RG_CODE) ';
  stSql := stSql + ' Left Join TB_PERMITCODE j ';
  stSql := stSql + ' ON ( a.GROUP_CODE = j.GROUP_CODE ';
  stSql := stSql + ' AND a.PE_PERMITCODE = j.PE_PERMITCODE ) ';
  stSql := stSql + ' Left Join TB_DOOR k ';
  stSql := stSql + ' ON ( a.GROUP_CODE = k.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = k.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = k.AC_ECUID  ';
  stSql := stSql + ' AND a.DO_DOORNO = k.DO_DOORNO ) ';
  stSql := stSql + ' Left Join TB_LOCATION l ';
  stSql := stSql + ' ON ( k.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND k.LO_DONGCODE = l.LO_DONGCODE ';
  stSql := stSql + ' AND l.LO_GUBUN = ''0'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION m ';
  stSql := stSql + ' ON ( k.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND k.LO_DONGCODE = m.LO_DONGCODE ';
  stSql := stSql + ' AND k.LO_FLOORCODE = m.LO_FLOORCODE ';
  stSql := stSql + ' AND m.LO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION n ';
  stSql := stSql + ' ON ( k.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND k.LO_DONGCODE = m.LO_DONGCODE ';
  stSql := stSql + ' AND k.LO_FLOORCODE = m.LO_FLOORCODE ';
  stSql := stSql + ' AND k.LO_AREACODE = m.LO_AREACODE ';
  stSql := stSql + ' AND m.LO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_ACCESSINPUTTYPE o ';
  stSql := stSql + ' ON (a.GROUP_CODE = o.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_INPUTTYPE = o.AC_INPUTTYPE ) ';
  stSql := stSql + ' Left Join TB_DOORPOSICODE p ';
  stSql := stSql + ' ON (a.GROUP_CODE = p.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_DOORPOSI = p.AC_DOORPOSI ) ';

  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.AC_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.AC_DATE + a.AC_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.AC_DATE || a.AC_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aNodeNo = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND k.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if aFloorCode <> '' then stSql := stSql + ' AND k.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if aAreaCode <> '' then stSql := stSql + ' AND k.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    if aDoorCode <> '' then stSql := stSql + ' AND a.DO_DOORNO = ''' + aDoorCode + ''' ';
  end;
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND c.EM_NAME Like ''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND c.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND c.EM_COPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //집전화번호
          stSql := stSql + ' AND c.EM_HOMEPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //휴대전화번호
          stSql := stSql + ' AND c.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //카드번호
          stSql := stSql + ' AND a.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '6' : begin  //주소1
          stSql := stSql + ' AND c.EM_ADDR1 Like ''%' + aEtcName + '%'' ';
      end;
      '7' : begin  //주소2
          stSql := stSql + ' AND c.EM_ADDR2 Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '' then stSql := stSql + ' AND c.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    if aJijumCode <> '' then stSql := stSql + ' AND c.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
    if aDepartCode <> '' then stSql := stSql + ' AND c.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND c.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardType <> '0' then stSql := stSql + ' AND b.CA_CARDTYPE = ''' + aCardType + ''' ';
    if aEmType <> '' then stSql := stSql + ' AND c.RG_CODE = ''' + aEmType + ''' ';
  end;
  stSql := stSql + ' order by a.AC_DATE,a.AC_TIME ';
  result := stSql;

end;

function TdmDBSql.GetTB_ACCESSEVENT_AlarmAreaAccessReport(aGroupCode,
  aStartDate, aStartTime, aEndDate, aEndTime, aBuildingCode, aFloorCode,
  aAreaCode, aNodeNo, aEcuID, aAlarmAreaCode, aCompanyCode, aJijumCode,
  aDepartCode, aPosiCode, aCardType, aEmType, aEtcType, aEtcName: string;
  aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := ' select a.AC_DATE,a.AC_TIME,l.LO_NAME as BUILDINGNAME,m.LO_NAME as FLOORNAME,n.LO_NAME as AREANAME,';
  stSql := stSql + ' k.AL_ZONENAME,d.CO_NAME as COMPANYNAME,e.CO_NAME as JIJUMNAME,f.CO_NAME as DEPARTNAME,';
  stSql := stSql + ' g.PO_NAME,c.EM_CODE,c.EM_NAME,a.CA_CARDNO,a.AC_READERNO,p.AC_DOORPOSINAME,o.AC_INPUTTYPENAME,';
  stSql := stSql + ' j.PE_PERMITNAME,h.CT_NAME,c.EM_HANDPHONE,c.EM_HOMEPHONE,c.EM_COPHONE,c.EM_ADDR1,c.EM_ADDR2,i.RG_NAME as EM_TYPE,';
  stSql := stSql + ' k.LO_DONGCODE,k.LO_FLOORCODE,k.LO_AREACODE,a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO,';
  stSql := stSql + ' c.CO_COMPANYCODE,c.CO_JIJUMCODE,c.CO_DEPARTCODE,c.PO_POSICODE,b.CA_CARDTYPE,c.RG_CODE from ';
  stSql := stSql + ' TB_ACCESSEVENT a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = c.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( c.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( c.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY f ';
  stSql := stSql + ' ON ( c.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_JIJUMCODE = f.CO_JIJUMCODE ';
  stSql := stSql + ' AND c.CO_DEPARTCODE = f.CO_DEPARTCODE ';
  stSql := stSql + ' AND f.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI g ';
  stSql := stSql + ' ON ( c.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = g.CO_COMPANYCODE  ';
  stSql := stSql + ' AND c.PO_POSICODE = g.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_CARDTYPE h ';
  stSql := stSql + ' ON ( b.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_GUBUN = h.CT_CODE) ';
  stSql := stSql + ' Left Join TB_RELAYGUBUN i ';
  stSql := stSql + ' ON ( c.GROUP_CODE = i.GROUP_CODE ';
  stSql := stSql + ' AND c.RG_CODE = i.RG_CODE) ';
  stSql := stSql + ' Left Join TB_PERMITCODE j ';
  stSql := stSql + ' ON ( a.GROUP_CODE = j.GROUP_CODE ';
  stSql := stSql + ' AND a.PE_PERMITCODE = j.PE_PERMITCODE ) ';
  stSql := stSql + ' Left Join TB_ALARMDEVICE k ';
  stSql := stSql + ' ON ( a.GROUP_CODE = k.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = k.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = k.AC_ECUID ) ';
  stSql := stSql + ' Left Join TB_LOCATION l ';
  stSql := stSql + ' ON ( k.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND k.LO_DONGCODE = l.LO_DONGCODE ';
  stSql := stSql + ' AND l.LO_GUBUN = ''0'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION m ';
  stSql := stSql + ' ON ( k.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND k.LO_DONGCODE = m.LO_DONGCODE ';
  stSql := stSql + ' AND k.LO_FLOORCODE = m.LO_FLOORCODE ';
  stSql := stSql + ' AND m.LO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION n ';
  stSql := stSql + ' ON ( k.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND k.LO_DONGCODE = m.LO_DONGCODE ';
  stSql := stSql + ' AND k.LO_FLOORCODE = m.LO_FLOORCODE ';
  stSql := stSql + ' AND k.LO_AREACODE = m.LO_AREACODE ';
  stSql := stSql + ' AND m.LO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_ACCESSINPUTTYPE o ';
  stSql := stSql + ' ON (a.GROUP_CODE = o.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_INPUTTYPE = o.AC_INPUTTYPE ) ';
  stSql := stSql + ' Left Join TB_DOORPOSICODE p ';
  stSql := stSql + ' ON (a.GROUP_CODE = p.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_DOORPOSI = p.AC_DOORPOSI ) ';

  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.AC_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.AC_DATE + a.AC_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.AC_DATE || a.AC_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aNodeNo = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND k.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if aFloorCode <> '' then stSql := stSql + ' AND k.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if aAreaCode <> '' then stSql := stSql + ' AND k.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
  end;
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND c.EM_NAME Like ''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND c.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND c.EM_COPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //집전화번호
          stSql := stSql + ' AND c.EM_HOMEPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //휴대전화번호
          stSql := stSql + ' AND c.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //카드번호
          stSql := stSql + ' AND a.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '6' : begin  //주소1
          stSql := stSql + ' AND c.EM_ADDR1 Like ''%' + aEtcName + '%'' ';
      end;
      '7' : begin  //주소2
          stSql := stSql + ' AND c.EM_ADDR2 Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '' then stSql := stSql + ' AND c.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    if aJijumCode <> '' then stSql := stSql + ' AND c.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
    if aDepartCode <> '' then stSql := stSql + ' AND c.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND c.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardType <> '0' then stSql := stSql + ' AND b.CA_CARDTYPE = ''' + aCardType + ''' ';
    if aEmType <> '' then stSql := stSql + ' AND c.RG_CODE = ''' + aEmType + ''' ';
  end;
  stSql := stSql + ' order by a.AC_DATE,a.AC_TIME ';
  result := stSql;

end;

function TdmDBSql.GetTB_ACCESSEVENT_JOINATDEVICE(aFromDate,
  aToDate: string;aEmCode:string=''): string;
var
  stSql : string;
begin
  stSql := ' Select a.* ';
  stSql := stSql + ' from ';
  stSql := stSql + ' TB_ACCESSEVENT a ';
  stSql := stSql + ' INNER JOIN ( ';
  stSql := stSql + ' Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where AC_ATTYPE = ''1'') b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + aFromDate + ''' AND ''' + aToDate + ''' ';
  if aEmCode <> '' then stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' order by a.AC_DATE ASC,a.AC_TIME ASC ';
  result := stSql;
end;

function TdmDBSql.GetTB_ACCESSEVENT_PatrolReport(aStartDate, aStartTime,
  aEndDate, aEndTime, aNodeNo, aEcuID, aReaderNo, aName: string): string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.RE_PATROLNAME,d.EM_CODE as EMCODE,d.EM_NAME as EMNAME ';
  stSql := stSql + ' from TB_ACCESSEVENT a ';
  stSql := stSql + ' Inner Join (select * from TB_READER where RE_PATROLUSE = ''1'') b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
  stSql := stSql + ' AND a.AC_READERNO = b.RE_READERNO ) ';
  if aName <> '' then
  begin
    stSql := stSql + ' inner Join TB_CARD c ';
    stSql := stSql + ' ON(a.CA_CARDNO = c.CA_CARDNO) ';
    stSql := stSql + ' inner Join (select * from TB_EMPLOYEE where em_name like ''' + aName + '%'') d ';
    stSql := stSql + ' ON(c.CO_COMPANYCODE = d.CO_COMPANYCODE ';
    stSql := stSql + ' AND c.EM_CODE = d.EM_CODE ) ';
  end else
  begin
    stSql := stSql + ' Left Join TB_CARD c ';
    stSql := stSql + ' ON(a.CA_CARDNO = c.CA_CARDNO) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE d ';
    stSql := stSql + ' ON(c.CO_COMPANYCODE = d.CO_COMPANYCODE ';
    stSql := stSql + ' AND c.EM_CODE = d.EM_CODE ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
  stSql := stSql + ' AND a.AC_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  if (aReaderNo <> '') then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.AC_READERNO = ''' + aReaderNo + ''' ';
  end;


  result := stSql;
end;

function TdmDBSql.GetTB_ADMINALARMDEVICE_AlarmGrade(aGroupCode, aUserID,
  aBuildingCode, aFloorCode, aAreaCode: string): String;
var
  stSql : string;
begin
  stSql := 'select b.AL_ZONENAME,b.AC_NODENO,b.AC_MCUID,b.AC_ECUID ';
  stSql := stSql + ' from TB_ADMINALARMDEVICE a ';
  stSql := stSql + ' Inner Join TB_ALARMDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';

  result := stSql;
end;

function TdmDBSql.GetTB_ADMINCOMPANY_CompanyGrade(aGroupCode,aUserID: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CO_COMPANYCODE,b.CO_NAME from TB_ADMINCOMPANY a ';
  stSql := stSql + ' INNER JOIN TB_COMPANY b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1'' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';
  result := stSql;
end;

function TdmDBSql.GetTB_ADMINCOMPANY_DepartGrade(aGroupCode, aUserID,
  aCompanyCode, aJijumCode: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CO_DEPARTCODE,b.CO_NAME from TB_ADMINCOMPANY a ';
  stSql := stSql + ' INNER JOIN TB_COMPANY b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
  stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''3'' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';

  result := stSql;
end;

function TdmDBSql.GetTB_ADMINCOMPANY_JijumGrade(aGroupCode, aUserID,
  aCompanyCode: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CO_JIJUMCODE,b.CO_NAME from TB_ADMINCOMPANY a ';
  stSql := stSql + ' INNER JOIN TB_COMPANY b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''2'' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';

  result := stSql;
end;

function TdmDBSql.GetTB_ADMINDOOR_DoorGrade(aGroupCode, aUserID, aBuildingCode,
  aFloorCode, aAreaCode: string): string;
var
  stSql : string;
begin
  stSql := 'select b.DO_DOORNONAME,a.DO_DOORNO,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID ';
  stSql := stSql + ' from TB_ADMINDOOR a ';
  stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO  ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND b.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND b.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND b.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';

  result := stSql;
end;

function TdmDBSql.GetTB_ADMINFOOD_FoodGrade(aGroupCode, aUserID, aBuildingCode,
  aFloorCode, aAreaCode: string): string;
var
  stSql : string;
begin
  stSql := 'select b.FO_NAME,b.AC_NODENO,b.AC_MCUID,b.AC_ECUID ,b.FO_DOORNO';
  stSql := stSql + ' from TB_ADMINFOOD a ';
  stSql := stSql + ' Inner Join TB_FOOD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND b.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND b.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND b.LO_AREACODE Like ''' + aAreaCode + '%'' ';

  result := stSql;
end;

function TdmDBSql.GetTB_ADMIN_AdminUserName(aGroupCode, aName: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_ADMIN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGroupCode + ''' ';
  if aName <> '' then
    stSql := stSql + ' AND AD_USERNAME Like ''%' + aName + '%'' ';

  result := stSql;
end;

function TdmDBSql.GetTB_ALARMDEVICE_AlarmAreaGradeReport(aGroupCode, aStartDate,
  aStartTime, aEndDate, aEndTime, aBuildingCode, aFloorCode, aAreaCode, aNodeNo,
  aEcuID, aAlarmAreaCode, aCompanyCode, aJijumCode, aDepartCode, aPosiCode,
  aCardType, aEmType, aEtcType, aEtcName: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := ' select f.lo_name as BuildingName,g.lo_name as FloorName,h.lo_name as AreaName,';
  stSql := stSql + ' a.AL_ZONENAME,a.AC_NODENO,a.AC_ECUID,a.AL_ZONENUM,b.DE_RCVACK,';
  stSql := stSql + ' i.co_name as companyName,j.co_name as JijumName,k.co_name as DepartName,d.EM_CODE,e.em_name,';
  stSql := stsql + ' b.CA_CARDNO,l.PO_NAME,m.CT_NAME,n.RG_NAME as EM_TYPE,b.DE_UPDATETIME  ';
  stSql := stSql + ' From TB_ALARMDEVICE a ';
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND b.DE_USEALARM = ''Y'' ';
  stSql := stSql + ' AND b.DE_PERMIT = ''L''';
  stSql := stSql + ' ) ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID )';
    end;
  end;
  stSql := stSql + ' Left Join TB_CARD d ';
  stSql := stSql + ' ON (b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_CARDNO = d.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND d.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND d.EM_CODE = e.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_LOCATION f ';
  stSql := stSql + ' ON (a.LO_DONGCODE = f.LO_DONGCODE ';
  stSql := stSql + ' AND f.LO_GUBUN = ''0'') ';
  stSql := stSql + ' Left Join TB_LOCATION g ';
  stSql := stSql + ' ON (a.LO_DONGCODE = g.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = g.LO_FLOORCODE ';
  stSql := stSql + ' AND g.LO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_LOCATION h ';
  stSql := stSql + ' ON (a.LO_DONGCODE = h.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = h.LO_FLOORCODE ';
  stSql := stSql + ' AND a.LO_AREACODE = h.LO_AREACODE ';
  stSql := stSql + ' AND h.LO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY i ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = i.CO_COMPANYCODE ';
  stSql := stSql + ' AND i.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY j ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = j.CO_COMPANYCODE ';
  stSql := stSql + ' AND e.CO_JIJUMCODE = j.CO_JIJUMCODE ';
  stSql := stSql + ' AND j.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY k ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = k.CO_COMPANYCODE ';
  stSql := stSql + ' AND e.CO_JIJUMCODE = k.CO_JIJUMCODE ';
  stSql := stSql + ' AND e.CO_DEPARTCODE = k.CO_DEPARTCODE ';
  stSql := stSql + ' AND k.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI l ';
  stSql := stSql + ' ON ( e.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND e.CO_COMPANYCODE = l.CO_COMPANYCODE  ';
  stSql := stSql + ' AND e.PO_POSICODE = l.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_CARDTYPE m ';
  stSql := stSql + ' ON ( d.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND d.CA_GUBUN = m.CT_CODE) ';
  stSql := stSql + ' Left Join TB_RELAYGUBUN n ';
  stSql := stSql + ' ON ( e.GROUP_CODE = n.GROUP_CODE ';
  stSql := stSql + ' AND e.RG_CODE = n.RG_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if Not G_bIsMaster then
     if G_nAdminBuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + G_stAdminUserID + ''' ';
  stSql := stSql + ' AND b.DE_UPDATETIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';

  if aNodeNo = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
  end;
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND e.EM_NAME Like ''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND e.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND e.EM_COPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //집전화번호
          stSql := stSql + ' AND e.EM_HOMEPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //휴대전화번호
          stSql := stSql + ' AND e.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //카드번호
          stSql := stSql + ' AND d.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '6' : begin  //주소1
          stSql := stSql + ' AND e.EM_ADDR1 Like ''%' + aEtcName + '%'' ';
      end;
      '7' : begin  //주소2
          stSql := stSql + ' AND e.EM_ADDR2 Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '' then stSql := stSql + ' AND e.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    if aJijumCode <> '' then stSql := stSql + ' AND e.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
    if aDepartCode <> '' then stSql := stSql + ' AND e.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND e.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardType <> '0' then stSql := stSql + ' AND d.CA_CARDTYPE = ''' + aCardType + ''' ';
    if aEmType <> '' then stSql := stSql + ' AND e.RG_CODE = ''' + aEmType + ''' ';
  end;
  stSql := stSql + ' Order by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.AL_ZONENAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_ALARMDEVICE_AlarmName(aGroupCode, aNodeNo,
  aName: string): string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.AC_MCUIP as NodeIP from TB_ALARMDEVICE a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_GUBUN = ''0'') ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if isDigit(aNodeNo) then
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
  if aName <> '' then
    stSql := stSql + ' AND a.AL_ZONENAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by b.AC_MCUIP,a.AC_ECUID ';

  result := stSql;

end;

function TdmDBSql.GetTB_ALARMDEVICE_BuidingCode(aGroupCode, aBuildingCode,
  aFloorCode, aAreaCode: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then
    stSql := stSql + ' AND LO_AREACODE Like ''' + aAreaCode + '%'' ';
  stSql := stSql + ' order by AL_ZONENAME ';
  result := stSql;
end;

function TdmDBSql.GetTB_ALARMDEVICE_BuildingAlarmName(aGroupCode, aBuildingCode,
  aFloorCode, aAreaCode, aName: string): string;
var
  stSql : string;
  stAllCode : string;
begin
  stSql := 'select a.* from TB_ALARMDEVICE a ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINALARMDEVICE ';
      stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + G_stAdminUserID + ''' ';
      stSql := stSql + ') c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then
    stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  if aName <> '' then
    stSql := stSql + ' AND a.AL_ZONENAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by a.AL_VIEWSEQ,a.AL_ZONENAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_ALARMDEVICE_CardAlarmPermit(aGroupCode, aCardNo,
  aBuildingCode, aFloorCode, aAreaCode: string): string;
var
  stSql : string;
  i : integer;
begin
  stSql := ' Select a.*,b.DE_RCVACK from TB_ALARMDEVICE a';
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND b.DE_USEALARM = ''Y'' ';
  stSql := stSql + ' AND b.DE_PERMIT = ''L''';
  stSql := stSql + ' ) ';
  stSql := stSql + ' AND b.CA_CARDNO = ''' +  aCardNo + ''' ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINALARMDEVICE ';
      stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + G_stAdminUserID + ''' ';
      stSql := stSql + ') c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  stSql := stSql + ' Order by AL_VIEWSEQ,AL_ZONENAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_ALARMDEVICE_DEVICECARDNOGROUP(aGroupCode,
  aDeviceCardGroupCode, aBuildingCode, aFloorCode, aAreaCode: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.DE_DOOR1,b.DE_DOOR2,b.DE_USEALARM,b.DE_PERMIT from TB_ALARMDEVICE a ';
  stSql := stSql + ' Left Join ( select * from TB_DEVICECARDNOGROUP   ';
  stSql := stSql + ' Where CA_GROUP = ''' + aDeviceCardGroupCode + ''') b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then stSql := stSql + ' AND LO_AREACODE Like ''' + aAreaCode + '%'' ';

  result := stSql;
end;

function TdmDBSql.GetTB_ALARMDEVICE_NotCardAlarmPermit(aGroupCode, aCardNo,
  aBuildingCode, aFloorCode, aAreaCode: string): string;
var
  stSql : string;
  i : integer;
begin
  stSql := ' Select a.* from TB_ALARMDEVICE a';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINALARMDEVICE ';
      stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + G_stAdminUserID + ''' ';
      stSql := stSql + ') c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  if G_nDBType = MSSQL then stSql := stSql + ' AND CAST(a.AC_NODENO as varchar(3)) + a.AC_ECUID NOT IN ( '
  else stSql := stSql + ' AND CAST(a.AC_NODENO as varchar(3)) || a.AC_ECUID NOT IN ( ';
  if G_nDBType = MSSQL then stSql := stSql + ' Select CAST(AC_NODENO as varchar(3)) + AC_ECUID '
  else stSql := stSql + ' Select CAST(AC_NODENO as varchar(3)) || AC_ECUID ';
  stSql := stSql + ' From TB_DEVICECARDNO ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''L'' ' ;
  stSql := stSql + ' AND DE_USEALARM = ''Y'' ' ;
  stSql := stSql + ') ';
  stSql := stSql + ' Order by AL_VIEWSEQ,AL_ZONENAME ';


  result := stSql;
end;

function TdmDBSql.GetTB_ALARMDEVICE_TelNumber(aGroupCode, aNodeNo,
  aEcuID: string): string;
var
  stSql : string;
begin
  stSql := ' Select AL_ZONENAME,AL_TELNO,AL_MEMO from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + '' ;
  stSql := stSql + ' AND AC_ECUID = ''' +  aEcuID + ''' ';

  result := stSql;
end;

function TdmDBSql.GetTB_ALARMEVENT_AlarmConfirm(aGroupCode, aNodeNo,
  aEcuID: string;aMsgNo:string = '';aAlarmDate:string='';aAlarmTime:string=''): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.AL_ALARMNAME,c.AL_ZONENAME,c.AL_TELNO,c.AL_MEMO from TB_ALARMEVENT a';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_ALARMSTATUSCODE = b.AL_ALARMSTATUSCODE ) ';
  stSql := stSql + ' Left Join TB_ALARMDEVICE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
  stSql := stSql + ' Where a.AL_CHECKOK = ''N'' ';
  stSql := stSql + ' AND a.AL_ISALARM = ''1'' ';
  if aNodeNo <> '' then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ' ;
    stSql := stSql + ' AND a.AC_ECUID = ''' +  aEcuID + ''' ';
  end;
  if aMsgNo <> '' then stSql := stSql + ' AND a.AL_MSGNO = ''' + aMsgNo + ''' ' ;
  if aAlarmDate <> '' then stSql := stSql + ' AND a.AL_DATE = ''' + aAlarmDate + ''' ' ;
  if aAlarmTime <> '' then stSql := stSql + ' AND a.AL_TIME = ''' + aAlarmTime + ''' ' ;

  stSql := stSql + ' Order by a.AL_DATE DESC,a.AL_TIME DESC ';

  result := stSql;
end;

function TdmDBSql.GetTB_ALARMEVENT_AlarmEventList(aAlarmDate: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.AL_COLOR from TB_ALARMEVENT a ';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE b ';
  stSql := stSql + ' ON(a.AL_ALARMSTATUSCODE = b.AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' Where a.AL_CHECKOK = ''N'' ';
  stSql := stSql + ' AND a.AL_ISALARM = ''1'' ';
  stSql := stSql + ' AND a.AL_DATE > ''' + aAlarmDate + ''' ';
  stSql := stSql + ' Order by a.AL_DATE,a.AL_TIME ';

  result := stSql;
end;

function TdmDBSql.GetTB_ALARMEVENT_AlarmReport(aGroupCode, aStartDate,
  aStartTime, aEndDate, aEndTime, aBuildingCode, aFloorCode, aAreaCode, aNodeNo,
  aEcuID, aAlarmAreaCode, aAlarmMode, aAlarmType, aDeviceType, aAlarmCheckCode,
  aCardGubun, aName: string; aAlarmGroup: integer; aList: TStringList;
  aTimeType: integer): string;
var
  stSql : string;
  stWhere : string;
  i : integer;
begin
  stWhere := '';

  stSql := 'Select a.AL_DATE,a.AL_TIME,f.LO_NAME as BUILDINGNAME,g.LO_NAME as FLOORNAME,h.LO_NAME as AREANAME, ';
  stSql := stSql + ' e.AL_ZONENAME,i.AL_ALARMMODENAME,j.AL_ALARMDEVICETYPENAME,a.AL_SUBADDR,a.AL_ZONENO,a.AL_ZONESTATE,';
  stSql := stSql + ' k.AL_ALARMNAME,';
  if G_nDBType = MSSQL then stSql := stSql + 'l.AL_ALARMNAME + ''('' + a.AL_OPERATOR + '')'' as ALARMDETAIL, '
  else stSql := stSql + 'l.AL_ALARMNAME || ''('' || a.AL_OPERATOR || '')'' as ALARMDETAIL, ';
  stSql := stSql + ' a.CA_CARDNO,d.CT_NAME,a.EM_CODE,c.EM_NAME,m.AL_ALARMCHECKCODENAME,a.AL_CHECKUSER,a.AL_UPDATETIME ';
  stSql := stSql + ' From TB_ALARMEVENT a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = c.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_CARDTYPE d ';
  stSql := stSql + ' ON ( b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_GUBUN = d.CT_CODE) ';
  stSql := stSql + ' Left Join TB_ALARMDEVICE e ';
  stSql := stSql + ' ON ( a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = e.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = e.AC_ECUID ) ';
  stSql := stSql + ' Left Join TB_LOCATION f ';
  stSql := stSql + ' ON ( e.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND e.LO_DONGCODE = f.LO_DONGCODE ';
  stSql := stSql + ' AND f.LO_GUBUN = ''0'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION g ';
  stSql := stSql + ' ON ( e.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND e.LO_DONGCODE = g.LO_DONGCODE ';
  stSql := stSql + ' AND e.LO_FLOORCODE = g.LO_FLOORCODE ';
  stSql := stSql + ' AND g.LO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION h ';
  stSql := stSql + ' ON ( e.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND e.LO_DONGCODE = h.LO_DONGCODE ';
  stSql := stSql + ' AND e.LO_FLOORCODE = h.LO_FLOORCODE ';
  stSql := stSql + ' AND e.LO_AREACODE = h.LO_AREACODE ';
  stSql := stSql + ' AND h.LO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_ALARMMODECODE i ';
  stSql := stSql + ' ON (a.GROUP_CODE = i.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_ALARMMODECODE = i.AL_ALARMMODECODE ) ';
  stSql := stSql + ' Left Join TB_ALARMDEVICETYPECODE j ';
  stSql := stSql + ' ON (a.GROUP_CODE = j.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_ALARMDEVICETYPECODE = j.AL_ALARMDEVICETYPECODE ) ';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE k ';
  stSql := stSql + ' ON (a.GROUP_CODE = k.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_ALARMSTATUSCODE = k.AL_ALARMSTATUSCODE ) ';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE l ';
  stSql := stSql + ' ON (a.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_STATUSCODE2 = l.AL_ALARMSTATUSCODE ) ';
  stSql := stSql + ' Left Join TB_ALARMCHECKCODE m ';
  stSql := stSql + ' ON (a.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_CHECKCODE = m.AL_ALARMCHECKCODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.AL_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.AL_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.AL_DATE + a.AL_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.AL_DATE || a.AL_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aNodeNo = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND e.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if aFloorCode <> '' then stSql := stSql + ' AND e.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if aAreaCode <> '' then stSql := stSql + ' AND e.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    //if aAlarmAreaCode <> '' then stSql := stSql + ' AND a.AL_ZONECODE = ''' + aAlarmAreaCode + ''' ';
  end;
  if aAlarmMode <> '' then stSql := stSql + ' AND a.AL_ALARMMODECODE = ''' + aAlarmMode + ''' ';
  if aDeviceType <> '' then stSql := stSql + ' AND a.AL_ALARMDEVICETYPECODE = ''' + aDeviceType + ''' ';
  if aAlarmCheckCode <> '' then stSql := stSql + ' AND a.AL_CHECKCODE = ''' + aAlarmCheckCode + ''' ';
  if aCardGubun <> '' then stSql := stSql + ' AND b.CA_GUBUN = ''' + aCardGubun + ''' ';
  if aName <> '' then stSql := stSql + ' AND c.EM_NAME Like ''%' + aName + '%'' ';
  if aAlarmType = '' then
  begin
    if aAlarmGroup <> 0 then
    begin
      for i := 0 to aList.Count - 1 do
      begin
        if stWhere = '' then stWhere := stWhere + ' AND ( '
        else stWhere := stWhere + ' OR ';
        stWhere := stWhere + ' a.AL_STATUSCODE2 = ''' + aList.Strings[i] + ''' ' ;
        stWhere := stWhere + ' OR a.AL_ALARMSTATUSCODE = ''' + aList.Strings[i] + ''' ' ;
      end;
      if stWhere <> '' then
      begin
        stWhere := stWhere + ') ';
        stSql := stSql + stWhere;
      end;
    end;
  end else
  begin
    stSql := stSql + ' AND ( a.AL_ALARMSTATUSCODE = ''' + aAlarmType + ''' ' ;
    stSql := stSql + ' OR a.AL_STATUSCODE2 = ''' + aAlarmType + ''') ' ;
  end;
  stSql := stSql + ' order by a.AL_DATE,a.AL_TIME  ';

  result := stSql;
end;

function TdmDBSql.GetTB_ARMAREA_AlarmName(aGroupCode, aNodeNo, aEcuID, aName,
  aBuildingCode, aFloorCode, aAreaCode, aArmAreaGubun,aArmAreaDisplay: string): string;
var
  stSql : string;
  stAllCode : string;
begin
  stSql := 'select a.*,b.AC_DEVICENAME,b.AC_MCUIP,c.LO_NAME as BuildingName1,d.LO_NAME as BuildingName2,e.LO_NAME as BuildingName3,f.AG_ARMNAME,g.AC_ARMAREAUSE from TB_ARMAREA a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_GUBUN = ''0'' ) ';
  stSql := stSql + ' Left Join (select * from TB_LOCATION where LO_GUBUN = ''0'') c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = c.LO_DONGCODE) ';
  stSql := stSql + ' Left Join (select * from TB_LOCATION where LO_GUBUN = ''1'') d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = d.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = d.LO_FLOORCODE) ';
  stSql := stSql + ' Left Join (select * from TB_LOCATION where LO_GUBUN = ''2'') e ';
  stSql := stSql + ' ON(a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = e.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = e.LO_FLOORCODE ';
  stSql := stSql + ' AND a.LO_AREACODE = e.LO_AREACODE) ';
  stSql := stSql + ' Left Join TB_ALARMGUBUNCODE f ';
  stSql := stSql + ' ON(a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.AG_ARMCODE = f.AG_ARMCODE) ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE g ';
  stSql := stSql + ' ON ( a.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = g.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = g.AC_ECUID ';
  stSql := stSql + ' AND ( ';
  stSql := stSql + '       (g.AC_ARMAREAUSE = ''Y'' and a.AR_AREANO > ''00'') ';
  stSql := stSql + '     or (g.AC_ARMAREAUSE <> ''Y'' and a.AR_AREANO = ''00'') ';
  stSql := stSql + '     )';
  stSql := stSql + ' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aNodeNo <> '' then
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
  if aName <> '' then
    stSql := stSql + ' AND a.AR_NAME Like ''%' + aName + '%'' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  if aArmAreaGubun <> '' then
    stSql := stSql + ' AND a.AG_ARMCODE = ''' + aArmAreaGubun + ''' ';
  if aArmAreaDisplay <> '' then
    stSql := stSql + ' AND a.AR_USE = ''' + aArmAreaDisplay + ''' ';

  stSql := stSql + ' order by a.AR_VIEWSEQ,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO ';

  result := stSql;
end;

function TdmDBSql.GetTB_ArmArea_ArmAreaGradeReport(aGroupCode, aStartDate,
  aStartTime, aEndDate, aEndTime, aBuildingCode, aFloorCode, aAreaCode, aNodeNo,
  aEcuID, aArmAreaCode, aCompanyCode, aJijumCode, aDepartCode, aPosiCode,
  aCardType, aEmType, aEtcType, aEtcName: string; aTimeType: integer): string;
var
  stSql : string;
begin
  if Length(aArmAreaCode) = 1 then aArmAreaCode := '0' + aArmAreaCode;

  stSql := ' select f.lo_name as BuildingName,g.lo_name as FloorName,h.lo_name as AreaName,';
  stSql := stSql + ' a.AR_NAME,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO,b.DE_RCVACK,';
  stSql := stSql + ' i.co_name as companyName,j.co_name as JijumName,k.co_name as DepartName,d.EM_CODE,e.em_name,';
  stSql := stsql + ' b.CA_CARDNO,l.PO_NAME,m.CT_NAME,n.RG_NAME as EM_TYPE,b.DE_UPDATETIME  ';
  stSql := stSql + ' From TB_ARMAREA a ';
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND ( (a.AR_AREANO = ''00'' AND b.DE_USEALARM = ''Y'') OR  ';
  stSql := stSql + '       (a.AR_AREANO = ''00'' AND b.DE_ALARM0 = ''Y'') OR  ';
  stSql := stSql + '       (a.AR_AREANO = ''01'' AND b.DE_ALARM1 = ''Y'') OR  ';
  stSql := stSql + '       (a.AR_AREANO = ''02'' AND b.DE_ALARM2 = ''Y'') OR  ';
  stSql := stSql + '       (a.AR_AREANO = ''03'' AND b.DE_ALARM3 = ''Y'') OR  ';
  stSql := stSql + '       (a.AR_AREANO = ''04'' AND b.DE_ALARM4 = ''Y'') OR  ';
  stSql := stSql + '       (a.AR_AREANO = ''05'' AND b.DE_ALARM5 = ''Y'') OR  ';
  stSql := stSql + '       (a.AR_AREANO = ''06'' AND b.DE_ALARM6 = ''Y'') OR  ';
  stSql := stSql + '       (a.AR_AREANO = ''07'' AND b.DE_ALARM7 = ''Y'') OR  ';
  stSql := stSql + '       (a.AR_AREANO = ''08'' AND b.DE_ALARM8 = ''Y'') ) ';
  stSql := stSql + ' AND b.DE_PERMIT = ''L''';
  stSql := stSql + ' ) ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMAREA c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND a.AR_AREANO = c.AR_AREANO )';
    end;
  end;
  stSql := stSql + ' Left Join TB_CARD d ';
  stSql := stSql + ' ON (b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_CARDNO = d.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND d.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND d.EM_CODE = e.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_LOCATION f ';
  stSql := stSql + ' ON (a.LO_DONGCODE = f.LO_DONGCODE ';
  stSql := stSql + ' AND f.LO_GUBUN = ''0'') ';
  stSql := stSql + ' Left Join TB_LOCATION g ';
  stSql := stSql + ' ON (a.LO_DONGCODE = g.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = g.LO_FLOORCODE ';
  stSql := stSql + ' AND g.LO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_LOCATION h ';
  stSql := stSql + ' ON (a.LO_DONGCODE = h.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = h.LO_FLOORCODE ';
  stSql := stSql + ' AND a.LO_AREACODE = h.LO_AREACODE ';
  stSql := stSql + ' AND h.LO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY i ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = i.CO_COMPANYCODE ';
  stSql := stSql + ' AND i.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY j ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = j.CO_COMPANYCODE ';
  stSql := stSql + ' AND e.CO_JIJUMCODE = j.CO_JIJUMCODE ';
  stSql := stSql + ' AND j.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY k ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = k.CO_COMPANYCODE ';
  stSql := stSql + ' AND e.CO_JIJUMCODE = k.CO_JIJUMCODE ';
  stSql := stSql + ' AND e.CO_DEPARTCODE = k.CO_DEPARTCODE ';
  stSql := stSql + ' AND k.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI l ';
  stSql := stSql + ' ON ( e.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND e.CO_COMPANYCODE = l.CO_COMPANYCODE  ';
  stSql := stSql + ' AND e.PO_POSICODE = l.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_CARDTYPE m ';
  stSql := stSql + ' ON ( d.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND d.CA_GUBUN = m.CT_CODE) ';
  stSql := stSql + ' Left Join TB_RELAYGUBUN n ';
  stSql := stSql + ' ON ( e.GROUP_CODE = n.GROUP_CODE ';
  stSql := stSql + ' AND e.RG_CODE = n.RG_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stsql + ' AND a.AR_USE = ''Y'' ';
  if Not G_bIsMaster then
     if G_nAdminBuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + G_stAdminUserID + ''' ';
  stSql := stSql + ' AND b.DE_UPDATETIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';

  if aNodeNo = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    if aArmAreaCode <> '' then stSql := stSql + ' AND a.AR_AREANO = ''' + aArmAreaCode + ''' ';
  end;
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND e.EM_NAME Like ''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND e.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND e.EM_COPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //집전화번호
          stSql := stSql + ' AND e.EM_HOMEPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //휴대전화번호
          stSql := stSql + ' AND e.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //카드번호
          stSql := stSql + ' AND d.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '6' : begin  //주소1
          stSql := stSql + ' AND e.EM_ADDR1 Like ''%' + aEtcName + '%'' ';
      end;
      '7' : begin  //주소2
          stSql := stSql + ' AND e.EM_ADDR2 Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '' then stSql := stSql + ' AND e.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    if aJijumCode <> '' then stSql := stSql + ' AND e.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
    if aDepartCode <> '' then stSql := stSql + ' AND e.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND e.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardType <> '0' then stSql := stSql + ' AND d.CA_CARDTYPE = ''' + aCardType + ''' ';
    if aEmType <> '' then stSql := stSql + ' AND e.RG_CODE = ''' + aEmType + ''' ';
  end;
  stSql := stSql + ' Order by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.AR_NAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_ARMAREA_BuildingCode(aGroupCode, aBuildingCode,
  aFloorCode, aAreaCode: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_ARMAREA ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND AR_USE = ''Y'' ';
  if aBuildingCode <> '' then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then
    stSql := stSql + ' AND LO_AREACODE Like ''' + aAreaCode + '%'' ';
  stSql := stSql + ' order by AR_VIEWSEQ,AR_NAME ';
  result := stSql;
end;

function TdmDBSql.GetTB_ArmArea_EmployeePermit(aBuildingCode, aFloorCode,
  aAreaCode, aCompanyCode, aEmCode: string): string;
var
  stSql : string;
  i : integer;
begin
  stSql := ' Select a.* from TB_ARMAREA a';
  stSql := stSql + ' Inner Join ( select * from TB_DEVICECARDNOEMPLOYEE ';
  stSql := stSql + '              where CO_COMPANYCODE = ''' +aCompanyCode + '''';
  stSql := stSql + '              AND EM_CODE = ''' + aEmCode + '''';
  stSql := stSql + '              AND DE_PERMIT = ''L'' ) b ';
  stSql := stSql + ' ON(a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND ( ';
  stSql := stSql + '        (  (a.AR_AREANO = ''00'') AND ( (b.DE_USEALARM = ''Y'') OR (b.DE_ALARM0 = ''Y'' ) ) )';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''01'') AND (b.DE_ALARM1 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''02'') AND (b.DE_ALARM2 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''03'') AND (b.DE_ALARM3 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''04'') AND (b.DE_ALARM4 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''05'') AND (b.DE_ALARM5 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''06'') AND (b.DE_ALARM6 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''07'') AND (b.DE_ALARM7 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''08'') AND (b.DE_ALARM8 = ''Y'') ) ';
  stSql := stSql + '     ) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';

  stSql := stSql + ' Order by a.AR_VIEWSEQ,a.AR_NAME';

  result := stSql;
end;

function TdmDBSql.GetTB_ArmArea_GROUPPermit(aBuildingCode, aFloorCode,
  aAreaCode, aEmGroupCode: string): string;
var
  stSql : string;
  i : integer;
begin
  stSql := ' Select a.* from TB_ARMAREA a';
  stSql := stSql + ' Inner Join ( select * from TB_DEVICECARDNOGROUP ';
  stSql := stSql + '              where CA_GROUP = ''' +aEmGroupCode + '''';
  stSql := stSql + '              AND DE_PERMIT = ''L'' ) b ';
  stSql := stSql + ' ON(a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND ( ';
  stSql := stSql + '        (  (a.AR_AREANO = ''00'') AND ( (b.DE_USEALARM = ''Y'') OR (b.DE_ALARM0 = ''Y'' ) ) ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''01'') AND (b.DE_ALARM1 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''02'') AND (b.DE_ALARM2 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''03'') AND (b.DE_ALARM3 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''04'') AND (b.DE_ALARM4 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''05'') AND (b.DE_ALARM5 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''06'') AND (b.DE_ALARM6 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''07'') AND (b.DE_ALARM7 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.AR_AREANO = ''08'') AND (b.DE_ALARM8 = ''Y'') ) ';
  stSql := stSql + '     ) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';

  stSql := stSql + ' Order by a.AR_VIEWSEQ,a.AR_NAME';

  result := stSql;
end;

function TdmDBSql.GetTB_ATEVENT_Report(aGroupCode, aStartDate, aEndDate,
  aCompanyCode, aJijumCode, aDepartCode, aPosiCode, aEmType, aEtcType,
  aEtcName: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME,f.AT_DATE,f.AT_ATCODE,j.AT_CODENAME,f.AT_INTIME,f.AT_OUTTIME,I.PO_NAME,';
  stSql := stSql + ' f.AT_INCODE,g.AT_INNAME as JIKAK,f.AT_OUTCODE,h.AT_OUTNAME as JOTAE, ';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN f.AT_INRESULT = ''N'' then ''지각'' ';
  stsql := stSql + ' WHEN f.AT_INRESULT = ''Y'' then ''정상'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as JIKAK1, ';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN f.AT_OUTRESULT = ''N'' then ''조퇴'' ';
  stsql := stSql + ' WHEN f.AT_OUTRESULT = ''Y'' then ''정상'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as Jotae1, ';
  stSql := stSql + ' f.AT_CONTENT,K.CA_CARDNO ';
  stSql := stSql + ' from TB_EMPLOYEE a  ';
{  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND b.CA_CARDTYPE = ''1'') '; }
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (a.Group_Code = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (a.Group_Code = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON (a.Group_Code = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE  ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE  ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Inner Join TB_ATEVENT f ';
  stSql := stSql + ' ON (a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = f.EM_CODE ';
  stSql := stSql + ' AND f.AT_DATE Between ''' + aStartDate + ''' ';
  stSql := stSql + ' AND ''' + aEndDate + ''') ';
  stSql := stSql + ' Left Join TB_ATINCODE g ';
  stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_INCODE = g.AT_INCODE ) ';
  stSql := stSql + ' Left Join TB_ATOUTCODE h ';
  stSql := stSql + ' ON (f.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_OUTCODE = h.AT_OUTCODE ) ';
  stSql := stSql + ' Left Join TB_ATCODE j ';
  stSql := stSql + ' ON (f.GROUP_CODE = j.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_ATCODE = j.AT_ATCODE ) ';
  stSql := stSql + ' Left Join TB_POSI I ';
  stSql := stSql + ' ON (a.GROUP_CODE = I.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = I.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = I.PO_POSICODE)  ';
  stSql := stSql + ' Left Join TB_CARD K ';
  stSql := stSql + ' ON (a.GROUP_CODE = K.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = K.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.EM_CODE = K.EM_CODE)  ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND a.EM_NAME Like ''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND a.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND a.EM_COPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //집전화번호
          stSql := stSql + ' AND a.EM_HOMEPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //휴대전화번호
          stSql := stSql + ' AND a.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //카드번호
          stSql := stSql + ' AND K.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '6' : begin  //주소1
          stSql := stSql + ' AND a.EM_ADDR1 Like ''%' + aEtcName + '%'' ';
      end;
      '7' : begin  //주소2
          stSql := stSql + ' AND a.EM_ADDR2 Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '' then stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    if aJijumCode <> '' then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
    if aDepartCode <> '' then stSql := stSql + ' AND a.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND a.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aEmType <> '' then stSql := stSql + ' AND a.RG_CODE = ''' + aEmType + ''' ';
  end;
  result := stSql;

end;

function TdmDBSql.GetTB_CARD_CardAlarmPermit(aGroupCode, aNodeNo, aEcuID,
  aCompanyCode, aJijumCode, aDepartCode: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CA_CARDNO,a.CA_CARDTYPE,a.CA_LASTUSE,b.CO_COMPANYCODE,b.EM_NAME,b.EM_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_COMPANYNAME,b.CO_JIJUMCODE,d.CO_NAME as CO_JIJUMNAME,b.CO_DEPARTCODE,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME,g.DE_RCVACK ';
  stSql := stSql + ' from TB_CARD a  ';
  if aCompanyCode <> '' then stSql := stSql + ' Inner JOIN TB_EMPLOYEE b '
  else stSql := stSql + ' Left JOIN TB_EMPLOYEE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE )';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (b.Group_Code = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (b.Group_Code = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON (b.Group_Code = e.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = e.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE  ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE  ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO G ';
  stSql := stSql + ' ON ( a.GROUP_CODE = G.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = G.CA_CARDNO ';
  stSql := stSql + ' AND G.AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND G.AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND G.DE_USEALARM = ''Y'' ';
  stSql := stSql + ')';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aJijumCode <> '' then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if aDepartCode <> '' then stSql := stSql + ' AND b.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
  stSql := stSql + ' Order by b.EM_NAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_CARD_CardDoorPermit(aGroupCode, aNodeNo, aEcuID,
  aDoorNO, aCompanyCode, aJijumCode, aDepartCode: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CA_CARDNO,a.CA_CARDTYPE,a.CA_LASTUSE,b.CO_COMPANYCODE,b.EM_NAME,b.EM_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_COMPANYNAME,b.CO_JIJUMCODE,d.CO_NAME as CO_JIJUMNAME,b.CO_DEPARTCODE,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME,g.DE_RCVACK ';
  stSql := stSql + ' from TB_CARD a  ';
  if aCompanyCode <> '' then stSql := stSql + ' Inner JOIN TB_EMPLOYEE b '
  else stSql := stSql + ' Left JOIN TB_EMPLOYEE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE )';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (b.Group_Code = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (b.Group_Code = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON (b.Group_Code = e.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = e.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE  ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE  ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO G ';
  stSql := stSql + ' ON ( a.GROUP_CODE = G.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = G.CA_CARDNO ';
  stSql := stSql + ' AND G.AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND G.AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND G.DE_DOOR' + aDoorNO + ' = ''Y'' ';
  stSql := stSql + ')';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aJijumCode <> '' then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if aDepartCode <> '' then stSql := stSql + ' AND b.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
  stSql := stSql + ' Order by b.EM_NAME ';

  result := stSql;

end;

function TdmDBSql.GetTB_CARD_EmCode(aCompanyCode, aEmCode: string): string;
var
  stSql : string;
begin

  stSql := ' Select a.*,b.CT_NAME from TB_CARD a ';
  stSql := stSql + ' Left Join TB_CARDTYPE b ';
  stSql := stSql + ' ON (a.CA_GUBUN = b.CT_CODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';

  result := stSql;
end;

function TdmDBSql.GetTB_CARD_EmInfo(aGroupCode, aCompanyCode, aJijumCode,
  aDepartCode, aPosiCode, aCardRegType, aEmployeeType, aCardGubun: string;
  aEtcIndex: integer; aEtcString: string): string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,c.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,a.EM_HOMEPHONE,a.EM_HANDPHONE,';//a.EM_IMAGE,';  == 이미지 데이터 때문에 로딩 속도가 너무 느려짐 2012.09.21
  stSql := stSql + ' b.CA_CARDNO,b.CA_GUBUN,b.CA_CARDTYPE,a.RG_CODE,a.FDMS_ID,g.CT_NAME,h.RG_NAME,a.DG_CODE ';
  stSql := stSql + ' from TB_CARD b ';
  stSql := stSql + ' Left Join TB_EMPLOYEE a ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_CARDTYPE g ';
  stSql := stSql + ' ON ( b.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_GUBUN = g.CT_CODE) ';
  stSql := stSql + ' Left Join TB_RELAYGUBUN h ';
  stSql := stSql + ' ON ( a.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND a.RG_CODE = h.RG_CODE) ';
  stSql := stSql + ' Where b.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND b.CA_CARDTYPE = ''1'' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aJijumCode <> '' then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if aDepartCode <> '' then stSql := stSql + ' AND a.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
  if aPosiCode <> '' then stSql := stSql + ' AND a.PO_POSICODE = ''' + aPosiCode + ''' ';
  if aEmployeeType <> '' then stSql := stSql + ' AND a.RG_CODE = ''' + aEmployeeType + ''' ';
  if aCardGubun <> '' then stSql := stSql + ' AND b.CA_GUBUN = ''' + aCardGubun + ''' ';
  if aEtcString <> '' then
  begin
    case aEtcIndex of
      0 : begin  //이름
          stSql := stSql + ' AND a.EM_NAME Like ''%' + aEtcString + '%'' ';
      end;
      1 : begin  //사번
          stSql := stSql + ' AND a.EM_CODE Like ''%' + aEtcString + '%'' ';
      end;
      2 : begin  //사내전화번호
          stSql := stSql + ' AND a.EM_COPHONE Like ''%' + aEtcString + '%'' ';
      end;
      3 : begin  //집전화번호
          stSql := stSql + ' AND a.EM_HOMEPHONE Like ''%' + aEtcString + '%'' ';
      end;
      4 : begin  //휴대전화번호
          stSql := stSql + ' AND a.EM_HANDPHONE Like ''%' + aEtcString + '%'' ';
      end;
      5 : begin  //카드번호
          stSql := stSql + ' AND b.CA_CARDNO Like ''%' + aEtcString + '%'' ';
      end;
      6 : begin  //주소1
          stSql := stSql + ' AND a.EM_ADDR1 Like ''%' + aEtcString + '%'' ';
      end;
      7 : begin  //주소2
          stSql := stSql + ' AND a.EM_ADDR2 Like ''%' + aEtcString + '%'' ';
      end;
    end;
  end;
  stSql := stSql + ' order by c.CO_NAME,a.EM_NAME';

  result := stSql;
end;

function TdmDBSql.GetTB_CARD_EmName(aGroupCode, aEmName: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.CA_CARDNO,b.EM_CODE,b.EM_NAME,c.CO_NAME as COMPANYNAME,d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.CO_COMPANYCODE from TB_CARD a ';
  stSql := stSql + ' INNER JOIN TB_EMPLOYEE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON ( b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( b.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';
  stSql := stSql + ' AND b.EM_NAME Like ''%' + aEmName + '%'' ';
  stSql := stSql + ' order by b.EM_NAME';

  result := stSql;
end;

function TdmDBSql.GetTB_CARD_NOTCardAlarmPermit(aGroupCode, aNodeNo, aEcuID,
  aCompanyCode, aJijumCode, aDepartCode: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CA_CARDNO,a.CA_CARDTYPE,a.CA_LASTUSE,b.CO_COMPANYCODE,b.EM_NAME,b.EM_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_COMPANYNAME,b.CO_JIJUMCODE,d.CO_NAME as CO_JIJUMNAME,b.CO_DEPARTCODE,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME ';
  stSql := stSql + ' from TB_CARD a  ';
  if aCompanyCode <> '' then stSql := stSql + ' Inner JOIN TB_EMPLOYEE b '
  else stSql := stSql + ' Left JOIN TB_EMPLOYEE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE )';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (b.Group_Code = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (b.Group_Code = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON (b.Group_Code = e.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = e.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE  ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE  ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aJijumCode <> '' then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if aDepartCode <> '' then stSql := stSql + ' AND b.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';
  stSql := stSql + ' AND a.CA_CARDNO Not In ';
  stSql := stSql + ' ( select CA_CARDNO from TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_USEALARM = ''Y'' ';
  stSql := stSql + ')';
  stSql := stSql + ' Order by b.EM_NAME ';


  result := stSql;
end;

function TdmDBSql.GetTB_CARD_NOTCardDoorPermit(aGroupCode, aNodeNo, aEcuID,
  aDoorNO,aCompanyCode,aJijumCode,aDepartCode: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CA_CARDNO,a.CA_CARDTYPE,a.CA_LASTUSE,b.CO_COMPANYCODE,b.EM_NAME,b.EM_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_COMPANYNAME,b.CO_JIJUMCODE,d.CO_NAME as CO_JIJUMNAME,b.CO_DEPARTCODE,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME ';
  stSql := stSql + ' from TB_CARD a  ';
  if aCompanyCode <> '' then stSql := stSql + ' Inner JOIN TB_EMPLOYEE b '
  else stSql := stSql + ' Left JOIN TB_EMPLOYEE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE )';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (b.Group_Code = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (b.Group_Code = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON (b.Group_Code = e.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = e.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE  ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE  ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aJijumCode <> '' then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if aDepartCode <> '' then stSql := stSql + ' AND b.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';
  stSql := stSql + ' AND a.CA_CARDNO Not In ';
  stSql := stSql + ' ( select CA_CARDNO from TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DE_DOOR' + aDoorNO + ' = ''Y'' ';
  stSql := stSql + ')';
  stSql := stSql + ' Order by b.EM_NAME ';


  result := stSql;
end;

function TdmDBSql.GetTB_Company_CompanyName(aGroupCode,aName:string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';
  if aName <> '' then
    stSql := stSql + ' AND CO_NAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by CO_NAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_Company_DepartName(aGroupCode, aCompanyCode, aJijumCode,
  aName: string): string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.CO_NAME as COMPANYNAME,c.CO_NAME as JIJUMNAME from TB_COMPANY a ';
  stSql := stSql + ' Inner Join TB_COMPANY b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Inner Join TB_COMPANY c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = c.CO_JIJUMCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if (aCompanyCode <> '') then
  begin
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;
  if (aJijumCode <> '') then
  begin
    stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  end;
  stSql := stSql + ' AND a.CO_GUBUN = ''3'' ';
  if aName <> '' then
    stSql := stSql + ' AND a.CO_NAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by b.CO_NAME,c.CO_NAME,a.CO_NAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_Company_JijumName(aGroupCode, aCompanyCode,
  aName: string): string;
var
  stSql : string;
  stAllCode : string;
begin
  stAllCode := FillZeroNumber(0,G_nCompanyCodeLength);
  stSql := 'select a.*,b.CO_NAME as COMPANYNAME from TB_COMPANY a ';
  stSql := stSql + ' Inner Join TB_COMPANY b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if (aCompanyCode <> '') and (aCompanyCode <> stAllCode) then
  begin
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;
  stSql := stSql + ' AND a.CO_GUBUN = ''2'' ';
  if aName <> '' then
    stSql := stSql + ' AND a.CO_NAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by b.CO_NAME,a.CO_NAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_DEVICECARDNO_GradeReport(aBuildingCode, aFloorCode,
  aAreaCode, aNodeNo, aEcuID, aDoorNo, aCompanyCode, aJijumCode, aDepartCode,
  aPosiCode, aEmpGubun:string; aEtcIndex:integer; aEtcString: string): string;
var
  stSql :string;
begin
  (*  ReportFieldNameList.Add('DO_DOORNONAME');
  ReportFieldNameList.Add('CO_COMPANYNAME');
  ReportFieldNameList.Add('CO_JIJUMNAME');
  ReportFieldNameList.Add('CO_DEPARTNAME');
  ReportFieldNameList.Add('EM_CODE');
  ReportFieldNameList.Add('EM_NAME');
  ReportFieldNameList.Add('CA_CARDNO');
  ReportFieldNameList.Add('CT_NAME');
  ReportFieldNameList.Add('DE_RCVACK');
*)
  stSql := ' select f.lo_name as BuildingName,g.lo_name as FloorName,h.lo_name as AreaName,';
  stSql := stSql + ' a.DO_DOORNONAME,a.AC_NODENO,a.AC_MCUID,a.DO_DOORNO,b.DE_RCVACK,i.co_name as companyName,j.co_name as JijumName,k.co_name as DepartName,d.EM_CODE,e.em_name,b.CA_CARDNO,l.CT_NAME  ';
  stSql := stSql + ' From TB_DOOR a ';
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND ( (a.DO_DOORNO = ''1'' AND b.DE_DOOR1 = ''Y'') OR  ';
  stSql := stSql + '       (a.DO_DOORNO = ''2'' AND b.DE_DOOR2 = ''Y'') ) ';
  stSql := stSql + ' AND b.DE_USEACCESS = ''Y'' ';
  stSql := stSql + ' AND b.DE_PERMIT = ''L''';
  stSql := stSql + ' ) ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO )';
    end;
  end;
  if (aEtcString <> '') or (aCompanyCode <> '') or (aPosiCode <> '') or (aEmpGubun <> '') then
  begin
    stSql := stSql + ' Inner Join TB_CARD d ';
    stSql := stSql + ' ON (b.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND b.CA_CARDNO = d.CA_CARDNO ) ';
    stSql := stSql + ' Inner Join TB_EMPLOYEE e ';
    stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE ';
    stSql := stSql + ' AND d.CO_COMPANYCODE = e.CO_COMPANYCODE ';
    stSql := stSql + ' AND d.EM_CODE = e.EM_CODE ) ';
  end else
  begin
    stSql := stSql + ' Left Join TB_CARD d ';
    stSql := stSql + ' ON (b.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND b.CA_CARDNO = d.CA_CARDNO ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE e ';
    stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE ';
    stSql := stSql + ' AND d.CO_COMPANYCODE = e.CO_COMPANYCODE ';
    stSql := stSql + ' AND d.EM_CODE = e.EM_CODE ) ';
  end;
  stSql := stSql + ' Left Join TB_LOCATION f ';
  stSql := stSql + ' ON (a.LO_DONGCODE = f.LO_DONGCODE ';
  stSql := stSql + ' AND f.LO_GUBUN = ''0'') ';
  stSql := stSql + ' Left Join TB_LOCATION g ';
  stSql := stSql + ' ON (a.LO_DONGCODE = g.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = g.LO_FLOORCODE ';
  stSql := stSql + ' AND g.LO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_LOCATION h ';
  stSql := stSql + ' ON (a.LO_DONGCODE = h.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = h.LO_FLOORCODE ';
  stSql := stSql + ' AND a.LO_AREACODE = h.LO_AREACODE ';
  stSql := stSql + ' AND h.LO_GUBUN >= ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY i ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = i.CO_COMPANYCODE ';
  stSql := stSql + ' AND i.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY j ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = j.CO_COMPANYCODE ';
  stSql := stSql + ' AND e.CO_JIJUMCODE = j.CO_JIJUMCODE ';
  stSql := stSql + ' AND j.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY k ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = k.CO_COMPANYCODE ';
  stSql := stSql + ' AND e.CO_JIJUMCODE = k.CO_JIJUMCODE ';
  stSql := stSql + ' AND e.CO_DEPARTCODE = k.CO_DEPARTCODE ';
  stSql := stSql + ' AND k.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_CARDTYPE l ';
  stSql := stSql + ' ON (d.CA_GUBUN = l.CT_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if isDigit(aDoorNo)  then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.DO_DOORNO = ''' + aDoorNo + ''' ';
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  end;
  if Not G_bIsMaster then
     if G_nAdminBuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + G_stAdminUserID + ''' ';
  if (aCompanyCode <> '') then stSql := stSql + ' AND e.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if (aJijumCode <> '') then stSql := stSql + ' AND e.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if (aDepartCode <> '') then stSql := stSql + ' AND e.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
  if (aPosiCode <> '') then stSql := stSql + ' AND e.PO_POSICODE = ''' + aPosiCode + ''' ';
  if (aEmpGubun <> '') then stSql := stSql + ' AND e.RG_CODE = ''' + aEmpGubun + ''' ';

  if aEtcString <> '' then
  begin
    case aEtcIndex of
      0 : begin  //이름
          stSql := stSql + ' AND e.EM_NAME Like ''%' + aEtcString + '%'' ';
      end;
      1 : begin  //사번
          stSql := stSql + ' AND e.EM_CODE Like ''%' + aEtcString + '%'' ';
      end;
      2 : begin  //사내전화번호
          stSql := stSql + ' AND e.EM_COPHONE Like ''%' + aEtcString + '%'' ';
      end;
      3 : begin  //집전화번호
          stSql := stSql + ' AND e.EM_HOMEPHONE Like ''%' + aEtcString + '%'' ';
      end;
      4 : begin  //휴대전화번호
          stSql := stSql + ' AND e.EM_HANDPHONE Like ''%' + aEtcString + '%'' ';
      end;
      5 : begin  //카드번호
          stSql := stSql + ' AND d.CA_CARDNO Like ''%' + aEtcString + '%'' ';
      end;
      6 : begin  //주소1
          stSql := stSql + ' AND e.EM_ADDR1 Like ''%' + aEtcString + '%'' ';
      end;
      7 : begin  //주소2
          stSql := stSql + ' AND e.EM_ADDR2 Like ''%' + aEtcString + '%'' ';
      end;
    end;
  end;


  result := stSql;


end;

function TdmDBSql.GetTB_DEVICESCHEDULE_DoorNo(aGroupCode, aNodeNo, aEcuID,
  aDoorNo: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_DEVICESCHEDULE ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' Order By DE_DAYCODE ';

  result := stSql;
end;

function TdmDBSql.GetTB_DOOR_BuidingCode(aGroupCode, aBuildingCode, aFloorCode,
  aAreaCode: string): string;
var
  stSql : string;
begin
  stSql := 'select a.*,c.AC_JAVARATYPE from TB_DOOR a ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINDOOR ';
      stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + G_stAdminUserID + ''' ';
      stSql := stSql + ') b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then
    stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  stSql := stSql + ' order by a.DO_VIEWSEQ,a.DO_DOORNONAME ';
  result := stSql;

end;

function TdmDBSql.GetTB_DOOR_BuildingDoorName(aGroupCode, aBuildingCode,
  aFloorCode, aAreaCode, aName: string): string;
var
  stSql : string;
  stAllCode : string;
begin
  stSql := 'select a.*,c.AC_JAVARATYPE from TB_DOOR a ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINDOOR ';
      stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + G_stAdminUserID + ''' ';
      stSql := stSql + ') b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then
    stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  if aName <> '' then
    stSql := stSql + ' AND a.DO_DOORNONAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by a.DO_VIEWSEQ,a.DO_DOORNONAME ';

  result := stSql;

end;

function TdmDBSql.GetTB_DOOR_BuildingScheduleUse(aGroupCode, aBuildingCode,
  aFloorCode, aAreaCode, aName: string): string;
var
  stSql : string;
  stAllCode : string;
begin
  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND DO_SCHUSE = ''1'' ';
  if aBuildingCode <> '' then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then
    stSql := stSql + ' AND LO_AREACODE Like ''' + aAreaCode + '%'' ';
  if aName <> '' then
    stSql := stSql + ' AND DO_DOORNONAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by DO_VIEWSEQ,DO_DOORNONAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_DOOR_CardDoorPermit(aGroupCode, aCardNo, aBuildingCode,
  aFloorCode, aAreaCode: string): string;
var
  stSql : string;
  i : integer;
begin
  stSql := ' Select a.*,b.DE_RCVACK from TB_DOOR a';
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND ( ';
  for i := 1 to conMAXDOORCOUNT do
  begin
    if i <> 1 then stSql := stSql + ' OR ';
    stSql := stSql + '(a.DO_DOORNO = ''' + inttostr(i) + ''' AND b.DE_DOOR' + inttostr(i) + ' = ''Y'') ';
  end;
  stSql := stSql + ' AND b.DE_PERMIT = ''L''';
  stSql := stSql + ' ) ';
  stSql := stSql + ' AND b.CA_CARDNO = ''' +  aCardNo + ''' ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINDOOR ';
      stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + G_stAdminUserID + ''' ';
      stSql := stSql + ') c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.DO_DOORNONAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_DOOR_DEVICECARDNOGROUP(aGroupCode, aDeviceCardGroupCode,
  aBuildingCode, aFloorCode, aAreaCode: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,b.DE_DOOR1,b.DE_DOOR2,b.DE_USEALARM,b.DE_PERMIT from TB_DOOR a ';
  stSql := stSql + ' Left Join ( select * from TB_DEVICECARDNOGROUP   ';
  stSql := stSql + ' Where CA_GROUP = ''' + aDeviceCardGroupCode + ''') b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.DO_DOORNONAME ';

  result := stSql;

end;

function TdmDBSql.GetTB_DOOR_DeviceDoorName(aGroupCode, aNodeNo, aEcuID,
  aName: string;aBuildingCode:string='000';aFloorCode:string='000';aAreaCode:string='000';aDoorGubun:string=''): string;
var
  stSql : string;
  stAllCode : string;
begin
  stSql := 'select a.*,b.AC_DEVICENAME,b.AC_MCUIP,c.LO_NAME as BuildingName1,d.LO_NAME as BuildingName2,e.LO_NAME as BuildingName3,f.DG_NAME from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_GUBUN = ''0'' ) ';
  stSql := stSql + ' Left Join (select * from TB_LOCATION where LO_GUBUN = ''0'') c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = c.LO_DONGCODE) ';
  stSql := stSql + ' Left Join (select * from TB_LOCATION where LO_GUBUN = ''1'') d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = d.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = d.LO_FLOORCODE) ';
  stSql := stSql + ' Left Join (select * from TB_LOCATION where LO_GUBUN = ''2'') e ';
  stSql := stSql + ' ON(a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = e.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = e.LO_FLOORCODE ';
  stSql := stSql + ' AND a.LO_AREACODE = e.LO_AREACODE) ';
  stSql := stSql + ' Left Join TB_DOORGUBUN f ';
  stSql := stSql + ' ON(a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.DO_GUBUN = f.DG_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aNodeNo <> '' then
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
  if aName <> '' then
    stSql := stSql + ' AND a.DO_DOORNONAME Like ''%' + aName + '%'' ';
  if aBuildingCode <> '000' then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '000' then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '000' then
    stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  if aDoorGubun <> '' then
    stSql := stSql + ' AND a.DO_GUBUN = ''' + aDoorGubun + ''' ';


  stSql := stSql + ' order by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO ';

  result := stSql;
end;

function TdmDBSql.GetTB_DOOR_DoorGradeReport(aGroupCode, aStartDate, aStartTime,
  aEndDate, aEndTime, aBuildingCode, aFloorCode, aAreaCode, aNodeNo, aEcuID,
  aDoorCode, aCompanyCode, aJijumCode, aDepartCode, aPosiCode, aCardType,
  aEmType, aEtcType, aEtcName: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := ' select f.lo_name as BuildingName,g.lo_name as FloorName,h.lo_name as AreaName,';
  stSql := stSql + ' a.DO_DOORNONAME,a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO,b.DE_RCVACK,';
  stSql := stSql + ' i.co_name as companyName,j.co_name as JijumName,k.co_name as DepartName,d.EM_CODE,e.em_name,';
  stSql := stsql + ' b.CA_CARDNO,l.PO_NAME,m.CT_NAME,n.RG_NAME as EM_TYPE,b.DE_UPDATETIME  ';
  stSql := stSql + ' From TB_DOOR a ';
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND ( (a.DO_DOORNO = ''1'' AND b.DE_DOOR1 = ''Y'') OR  ';
  stSql := stSql + '       (a.DO_DOORNO = ''2'' AND b.DE_DOOR2 = ''Y'') ) ';
  stSql := stSql + ' AND b.DE_USEACCESS = ''Y'' ';
  stSql := stSql + ' AND b.DE_PERMIT = ''L''';
  stSql := stSql + ' ) ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO )';
    end;
  end;
  stSql := stSql + ' Left Join TB_CARD d ';
  stSql := stSql + ' ON (b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_CARDNO = d.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND d.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND d.EM_CODE = e.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_LOCATION f ';
  stSql := stSql + ' ON (a.LO_DONGCODE = f.LO_DONGCODE ';
  stSql := stSql + ' AND f.LO_GUBUN = ''0'') ';
  stSql := stSql + ' Left Join TB_LOCATION g ';
  stSql := stSql + ' ON (a.LO_DONGCODE = g.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = g.LO_FLOORCODE ';
  stSql := stSql + ' AND g.LO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_LOCATION h ';
  stSql := stSql + ' ON (a.LO_DONGCODE = h.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = h.LO_FLOORCODE ';
  stSql := stSql + ' AND a.LO_AREACODE = h.LO_AREACODE ';
  stSql := stSql + ' AND h.LO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY i ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = i.CO_COMPANYCODE ';
  stSql := stSql + ' AND i.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY j ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = j.CO_COMPANYCODE ';
  stSql := stSql + ' AND e.CO_JIJUMCODE = j.CO_JIJUMCODE ';
  stSql := stSql + ' AND j.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY k ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = k.CO_COMPANYCODE ';
  stSql := stSql + ' AND e.CO_JIJUMCODE = k.CO_JIJUMCODE ';
  stSql := stSql + ' AND e.CO_DEPARTCODE = k.CO_DEPARTCODE ';
  stSql := stSql + ' AND k.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI l ';
  stSql := stSql + ' ON ( e.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND e.CO_COMPANYCODE = l.CO_COMPANYCODE  ';
  stSql := stSql + ' AND e.PO_POSICODE = l.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_CARDTYPE m ';
  stSql := stSql + ' ON ( d.GROUP_CODE = m.GROUP_CODE ';
  stSql := stSql + ' AND d.CA_GUBUN = m.CT_CODE) ';
  stSql := stSql + ' Left Join TB_RELAYGUBUN n ';
  stSql := stSql + ' ON ( e.GROUP_CODE = n.GROUP_CODE ';
  stSql := stSql + ' AND e.RG_CODE = n.RG_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if Not G_bIsMaster then
     if G_nAdminBuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + G_stAdminUserID + ''' ';
  stSql := stSql + ' AND b.DE_UPDATETIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';

  if aNodeNo = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  end else
  begin
    if aNodeNo <> '' then stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
    if aEcuID <> '' then stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    if aDoorCode <> '' then stSql := stSql + ' AND a.DO_DOORNO = ''' + aDoorCode + ''' ';
  end;
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND e.EM_NAME Like ''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND e.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND e.EM_COPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //집전화번호
          stSql := stSql + ' AND e.EM_HOMEPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //휴대전화번호
          stSql := stSql + ' AND e.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //카드번호
          stSql := stSql + ' AND d.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '6' : begin  //주소1
          stSql := stSql + ' AND e.EM_ADDR1 Like ''%' + aEtcName + '%'' ';
      end;
      '7' : begin  //주소2
          stSql := stSql + ' AND e.EM_ADDR2 Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '' then stSql := stSql + ' AND e.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    if aJijumCode <> '' then stSql := stSql + ' AND e.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
    if aDepartCode <> '' then stSql := stSql + ' AND e.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND e.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardType <> '0' then stSql := stSql + ' AND d.CA_CARDTYPE = ''' + aCardType + ''' ';
    if aEmType <> '' then stSql := stSql + ' AND e.RG_CODE = ''' + aEmType + ''' ';
  end;
  stSql := stSql + ' Order by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.DO_DOORNONAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_Door_EmployeePermit(aBuildingCode,aFloorCode,aAreaCode,aCompanyCode,
  aEmCode: string): string;
var
  stSql : string;
  i : integer;
begin
  stSql := ' Select a.* from TB_DOOR a';
  stSql := stSql + ' Inner Join ( select * from TB_DEVICECARDNOEMPLOYEE ';
  stSql := stSql + '              where CO_COMPANYCODE = ''' +aCompanyCode + '''';
  stSql := stSql + '              AND EM_CODE = ''' + aEmCode + '''';
  stSql := stSql + '              AND DE_PERMIT = ''L'' ) b ';
  stSql := stSql + ' ON(a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND ( ';
  stSql := stSql + '        (  (a.DO_DOORNO = 1) AND (b.DE_DOOR1 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 2) AND (b.DE_DOOR2 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 3) AND (b.DE_DOOR3 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 4) AND (b.DE_DOOR4 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 5) AND (b.DE_DOOR5 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 6) AND (b.DE_DOOR6 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 7) AND (b.DE_DOOR7 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 8) AND (b.DE_DOOR8 = ''Y'') ) ';
  stSql := stSql + '     ) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';

  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.DO_DOORNONAME';

  result := stSql;
end;

function TdmDBSql.GetTB_DOOR_GROUPPermit(aBuildingCode, aFloorCode, aAreaCode,
  aEmGroupCode: string): string;
var
  stSql : string;
  i : integer;
begin
  stSql := ' Select a.* from TB_DOOR a';
  stSql := stSql + ' Inner Join ( select * from TB_DEVICECARDNOGROUP ';
  stSql := stSql + '              where CA_GROUP = ''' +aEmGroupCode + '''';
  stSql := stSql + '              AND DE_PERMIT = ''L'' ) b ';
  stSql := stSql + ' ON(a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND ( ';
  stSql := stSql + '        (  (a.DO_DOORNO = 1) AND (b.DE_DOOR1 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 2) AND (b.DE_DOOR2 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 3) AND (b.DE_DOOR3 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 4) AND (b.DE_DOOR4 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 5) AND (b.DE_DOOR5 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 6) AND (b.DE_DOOR6 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 7) AND (b.DE_DOOR7 = ''Y'') ) ';
  stSql := stSql + '     OR (  (a.DO_DOORNO = 8) AND (b.DE_DOOR8 = ''Y'') ) ';
  stSql := stSql + '     ) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';

  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.DO_DOORNONAME';

  result := stSql;
end;

function TdmDBSql.GetTB_DOOR_NotCardDoorPermit(aGroupCode,aCardNo, aBuildingCode, aFloorCode,
  aAreaCode: string): string;
var
  stSql : string;
  i : integer;
begin
  stSql := ' Select a.* from TB_DOOR a';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINDOOR ';
      stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + G_stAdminUserID + ''' ';
      stSql := stSql + ') c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aBuildingCode <> '' then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then stSql := stSql + ' AND a.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  if G_nDBType = MSSQL then stSql := stSql + ' AND CAST(a.AC_NODENO as varchar(3)) + a.AC_ECUID + a.DO_DOORNO NOT IN ( '
  else stSql := stSql + ' AND CAST(a.AC_NODENO as varchar(3)) || a.AC_ECUID || a.DO_DOORNO NOT IN ( ';

  for i := 1 to conMAXDOORCOUNT do
  begin
    if i <> 1 then  stSql := stSql + ' Union All ';
    if G_nDBType = MSSQL then stSql := stSql + ' Select CAST(AC_NODENO as varchar(3)) + AC_ECUID + ''' + inttostr(i) + ''' '
    else stSql := stSql + ' Select CAST(AC_NODENO as varchar(3)) || AC_ECUID || ''' + inttostr(i) + ''' ';
    stSql := stSql + ' From TB_DEVICECARDNO ';
    stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
    stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
    stSql := stSql + ' AND DE_PERMIT = ''L'' ' ;
    stSql := stSql + ' AND DE_DOOR' + inttostr(i) +' = ''Y'' ' ;
  end;
  stSql := stSql + ') ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.DO_DOORNONAME ';


  result := stSql;
end;

function TdmDBSql.GetTB_EMPLOYEE_EmpInfo(aGroupCode,aCompanyCode, aJijumCode, aDepartCode,
  aPosiCode, aCardRegType, aEmployeeType, aCardGubun: string;
  aEtcIndex: integer; aEtcString: string;aCardGroupCode:string): string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,c.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,a.EM_HOMEPHONE,a.EM_HANDPHONE,';//a.EM_IMAGE,';  == 이미지 데이터 때문에 로딩 속도가 너무 느려짐 2012.09.21
  if ((aCardRegType <> '0') and (aCardRegType <> '')) OR (aEtcIndex = 5) OR (aCardGubun <> '') then
    stSql := stSql + ' b.CA_CARDNO,b.CA_GUBUN,b.CA_CARDTYPE,g.CT_NAME,';
  stSql := stSql + ' a.RG_CODE,a.FDMS_ID,h.RG_NAME,a.DG_CODE,a.CA_GROUP,i.CA_GROUPNAME,h.WG_NAME, ';
  stSql := stSql + ' a.DE_TIMECODEUSE,a.TC_GROUP,a.TC_TIME1,a.TC_TIME2,a.TC_TIME3,a.TC_TIME4,a.TC_WEEKCODE,a.EM_MASTER ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  if ((aCardRegType <> '0') and (aCardRegType <> '')) OR (aEtcIndex = 5) OR (aCardGubun <> '') then
  begin
    stSql := stSql + ' Inner Join TB_CARD b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' ) ';
  end;
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = f.PO_POSICODE ) ';
  if ((aCardRegType <> '0') and (aCardRegType <> '')) OR (aEtcIndex = 5) OR (aCardGubun <> '') then
  begin
    stSql := stSql + ' Left Join TB_CARDTYPE g ';
    stSql := stSql + ' ON ( b.GROUP_CODE = g.GROUP_CODE ';
    stSql := stSql + ' AND b.CA_GUBUN = g.CT_CODE) ';
  end;
  stSql := stSql + ' Left Join TB_RELAYGUBUN h ';
  stSql := stSql + ' ON ( a.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND a.RG_CODE = h.RG_CODE) ';
  stSql := stSql + ' Left Join TB_CARDGROUPCODE i ';
  stSql := stSql + ' ON(a.CA_GROUP = i.CA_GROUP) ';
  stSql := stSql + ' Left Join TB_WORKGUBUN h ';
  stSql := stSql + ' ON(a.WG_CODE = h.WG_CODE) ';

  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aJijumCode <> '' then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if aDepartCode <> '' then stSql := stSql + ' AND a.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
  if aPosiCode <> '' then stSql := stSql + ' AND a.PO_POSICODE = ''' + aPosiCode + ''' ';
  if (aCardRegType <> '0') and (aCardRegType <> '') then stSql := stSql + ' AND b.CA_CARDTYPE = ''' + aCardRegType + ''' ';
  if aEmployeeType <> '' then stSql := stSql + ' AND a.RG_CODE = ''' + aEmployeeType + ''' ';
  if aCardGubun <> '' then stSql := stSql + ' AND b.CA_GUBUN = ''' + aCardGubun + ''' ';
  if Length(aCardGroupCode) > 2 then
  begin
    Delete(aCardGroupCode,1,1);//Deep Seq 삭제
    stSql := stSql + ' AND a.CA_GROUP Like ''' + aCardGroupCode + '%'' ';
  end;

  if aEtcString <> '' then
  begin
    case aEtcIndex of
      0 : begin  //이름
          stSql := stSql + ' AND a.EM_NAME Like ''%' + aEtcString + '%'' ';
      end;
      1 : begin  //사번
          stSql := stSql + ' AND a.EM_CODE Like ''%' + aEtcString + '%'' ';
      end;
      2 : begin  //사내전화번호
          stSql := stSql + ' AND a.EM_COPHONE Like ''%' + aEtcString + '%'' ';
      end;
      3 : begin  //집전화번호
          stSql := stSql + ' AND a.EM_HOMEPHONE Like ''%' + aEtcString + '%'' ';
      end;
      4 : begin  //휴대전화번호
          stSql := stSql + ' AND a.EM_HANDPHONE Like ''%' + aEtcString + '%'' ';
      end;
      5 : begin  //카드번호
          stSql := stSql + ' AND b.CA_CARDNO Like ''%' + aEtcString + '%'' ';
      end;
      6 : begin  //주소1
          stSql := stSql + ' AND a.EM_ADDR1 Like ''%' + aEtcString + '%'' ';
      end;
      7 : begin  //주소2
          stSql := stSql + ' AND a.EM_ADDR2 Like ''%' + aEtcString + '%'' ';
      end;
    end;
  end;
  stSql := stSql + ' order by c.CO_NAME,a.EM_NAME';

  result := stSql;
end;

function TdmDBSql.GetTB_EMPLOYEE_Info(aGroupCode, aCompanyCode, aJijumCode,
  aDepartCode, aPosiCode, aEmployeeType, aCardGroupCode, aWorkCode: string;
  aEtcIndex: integer; aEtcString,aEmployeeState: string): string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,c.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,a.EM_HOMEPHONE,a.EM_HANDPHONE,';//a.EM_IMAGE,';  == 이미지 데이터 때문에 로딩 속도가 너무 느려짐 2012.09.21
  stSql := stSql + ' a.RG_CODE,a.FDMS_ID,h.RG_NAME,a.DG_CODE,a.CA_GROUP,i.CA_GROUPNAME,b.WG_TYPE,b.WG_NAME,a.EM_GRADETYPE, ';
  stSql := stSql + ' a.DE_TIMECODEUSE,a.TC_GROUP,a.TC_TIME1,a.TC_TIME2,a.TC_TIME3,a.TC_TIME4,a.TC_WEEKCODE,a.EM_MASTER ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_WORKGUBUN b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.WG_CODE = b.WG_CODE ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE )';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = f.PO_POSICODE ) ';
  if aEtcIndex = 5 then
  begin
    if aEtcString <> '' then
    begin
      stSql := stSql + ' Inner Join TB_CARD g ';
      stSql := stSql + ' ON ( a.GROUP_CODE = g.GROUP_CODE ';
      stSql := stSql + ' AND a.EM_CODE = g.EM_CODE ';
      stSql := stSql + ' AND a.CO_COMPANYCODE = g.CO_COMPANYCODE ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' Left Join TB_RELAYGUBUN h ';
  stSql := stSql + ' ON ( a.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND a.RG_CODE = h.RG_CODE) ';
  stSql := stSql + ' Left Join TB_CARDGROUPCODE i ';
  stSql := stSql + ' ON(a.CA_GROUP = i.CA_GROUP) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aJijumCode <> '' then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if aDepartCode <> '' then stSql := stSql + ' AND a.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
  if aPosiCode <> '' then stSql := stSql + ' AND a.PO_POSICODE = ''' + aPosiCode + ''' ';
  if aEmployeeType <> '' then stSql := stSql + ' AND a.RG_CODE = ''' + aEmployeeType + ''' ';
  if aEmployeeState <> '' then stSql := stSql + ' AND a.WG_CODE = ''' + aEmployeeState + ''' ';

  if Length(aCardGroupCode) > 2 then
  begin
    //Delete(aCardGroupCode,1,1);//Deep Seq 삭제
    stSql := stSql + ' AND a.CA_GROUP Like ''' + aCardGroupCode + '%'' ';
  end;

  if aEtcString <> '' then
  begin
    case aEtcIndex of
      0 : begin  //이름
          stSql := stSql + ' AND a.EM_NAME Like ''%' + aEtcString + '%'' ';
      end;
      1 : begin  //사번
          stSql := stSql + ' AND a.EM_CODE Like ''%' + aEtcString + '%'' ';
      end;
      2 : begin  //사내전화번호
          stSql := stSql + ' AND a.EM_COPHONE Like ''%' + aEtcString + '%'' ';
      end;
      3 : begin  //집전화번호
          stSql := stSql + ' AND a.EM_HOMEPHONE Like ''%' + aEtcString + '%'' ';
      end;
      4 : begin  //휴대전화번호
          stSql := stSql + ' AND a.EM_HANDPHONE Like ''%' + aEtcString + '%'' ';
      end;
      5 : begin  //카드번호
          stSql := stSql + ' AND g.CA_CARDNO Like ''%' + aEtcString + '%'' ';
      end;
      6 : begin  //주소1
          stSql := stSql + ' AND a.EM_ADDR1 Like ''%' + aEtcString + '%'' ';
      end;
      7 : begin  //주소2
          stSql := stSql + ' AND a.EM_ADDR2 Like ''%' + aEtcString + '%'' ';
      end;
    end;
  end;
  stSql := stSql + ' order by c.CO_NAME,a.EM_NAME';

  result := stSql;
end;

function TdmDBSql.GetTB_FOOD_BuildingFoodName(aGroupCode, aBuildingCode,
  aFloorCode, aAreaCode, aName: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_FOOD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGroupCode + ''' ';
  if (aBuildingCode <> '') then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') then
    stSql := stSql + ' AND LO_AREACODE like ''' + aAreaCode + '%'' ';
  if (aName <> '') then
    stSql := stSql + ' AND FO_NAME Like ''%' + aName + '%'' ';

  result := stSql;
end;

function TdmDBSql.GetTB_GRADE_AdminClassName(aGroupCode, aName: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_GRADE ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  if aName <> '' then  stSql := stSql + ' AND GR_GARDENAME Like ''%' + aName + '%'' ';

  result := stSql;

end;


function TdmDBSql.GetTB_Holiday_Name(aGroupCode, aYear: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_HOLIDAY ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND HO_STATE = ''I'' ';
  if G_nDBType = MSSQL then stSql := stSql + ' AND substring(HO_DAY,1,4) = ''' + aYear + ''' '
  else stSql := stSql + ' AND substr(HO_DAY,1,4) = ''' + aYear + ''' ';
  stSql := stSql + ' order by HO_DAY ';

  result := stSql;
end;

function TdmDBSql.GetTB_LOCATION_AreaName(aGroupCode, aBuildingCode, aFloorCode,
  aName: string): string;
var
  stSql : string;
  stAllCode : string;
begin
  stSql := 'select a.*,b.LO_NAME as BUILDINGNAME,c.LO_NAME as FLOORNAME from TB_LOCATION a ';
  stSql := stSql + ' Inner Join TB_LOCATION b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE ';
  stSql := stSql + ' AND b.LO_GUBUN = ''0'' ) ';
  stSql := stSql + ' Inner Join TB_LOCATION c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = c.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = c.LO_FLOORCODE ';
  stSql := stSql + ' AND c.LO_GUBUN = ''1'' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.LO_GUBUN = ''2'' ';
  if aBuildingCode <> '' then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aName <> '' then
    stSql := stSql + ' AND a.LO_NAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by b.LO_NAME,c.LO_NAME,a.LO_NAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_LOCATION_BuildingGubun(aGroupCode,
  aGubun: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  if aGubun <> '' then
    stSql := stSql + ' AND LO_GUBUN = ''' + aGubun + ''' ';
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ';

  result := stSql;
end;

function TdmDBSql.GetTB_LOCATION_BuildingName(aGroupCode,
  aName: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  if aName <> '' then
    stSql := stSql + ' AND LO_NAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by LO_NAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_Location_FloorName(aGroupCode, aBuildingCode,
  aName: string): string;
var
  stSql : string;
  stAllCode : string;
begin
  stSql := 'select a.*,b.LO_NAME as BUILDINGNAME from TB_LOCATION a ';
  stSql := stSql + ' Inner Join TB_LOCATION b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE ';
  stSql := stSql + ' AND b.LO_GUBUN = ''0'' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.LO_GUBUN = ''1'' ';
  if aBuildingCode <> '' then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aName <> '' then
    stSql := stSql + ' AND a.LO_NAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by b.LO_NAME,a.LO_NAME ';

  result := stSql;

end;

function TdmDBSql.GetTB_PATROLALARMEVENT_NotPatrolReport(aStartDate, aEndDate,
  aNodeNo, aEcuID, aReaderNo: string): string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.RE_PATROLNAME,c.PT_NAME ';
  stSql := stSql + ' from TB_PATROLALARMEVENT a ';
  if (aReaderNo <> '') then
  begin
    stSql := stSql + ' Inner Join (select * from TB_READER where RE_PATROLUSE = ''1'') b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
    stSql := stSql + ' AND a.RE_READERNO = b.RE_READERNO ) ';
  end else
  begin
    stSql := stSql + ' Left Join (select * from TB_READER where RE_PATROLUSE = ''1'') b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
    stSql := stSql + ' AND a.RE_READERNO = b.RE_READERNO ) ';
  end;
  stSql := stSql + ' Left Join TB_PATROLTIME c ';
  stSql := stSql + ' ON(a.PT_SEQ = c.PT_SEQ ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.PE_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
  if (aReaderNo <> '') then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.RE_READERNO = ''' + aReaderNo + ''' ';
  end;


  result := stSql;

end;

function TdmDBSql.GetTB_POSI_PosiName(aGroupCode, aCompanyCode,
  aName: string): string;
var
  stSql : string;
  stAllCode : string;
begin
  stSql := 'select a.*,b.CO_NAME as COMPANYNAME from TB_POSI a ';
  stSql := stSql + ' Inner Join TB_COMPANY b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if (aCompanyCode <> '') then
  begin
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;
  if aName <> '' then
    stSql := stSql + ' AND a.PO_NAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' order by b.CO_NAME,a.PO_NAME ';

  result := stSql;
end;

function TdmDBSql.GetTB_PROGRAMID_GradeProgram(aGroupCode, aAdminClassCode,
  aProgramGroupCode, aMenuGroupCode: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.*,c.GR_UPDATE,c.GR_INSERT,c.GR_DELETE from TB_PROGRAMID a';
  stSql := stSql + ' Left Join TB_PROGRAMGROUP b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.PR_GROUPCODE = b.PR_GROUPCODE ) ';
  stSql := stSql + ' Inner Join TB_GRADEPROGRAM c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.PR_GROUPCODE = c.PR_GROUPCODE  ';
  stSql := stSql + ' AND a.PR_PROGRAMID = c.PR_PROGRAMID )  ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND c.GR_GRADECODE = ''' + aAdminClassCode + ''' ';
  if aMenuGroupCode <> '' then
  begin
    stSql := stSql + ' AND a.PR_GROUPCODE = ''' + aMenuGroupCode + ''' ';
  end else
  begin
    if aProgramGroupCode <> '' then stSql := stSql + ' AND b.GUBUN = ''' + aProgramGroupCode + ''' ';
  end;
  stSql := stSql + ' Order by a.PR_PROGRAMNAME ';

  result := stSql;

end;

function TdmDBSql.GetTB_PROGRAMID_NotGradeProgram(aGroupCode,aAdminClassCode,
  aProgramGroupCode, aMenuGroupCode: string): string;
var
  stSql : string;
begin
  stSql := ' Select a.* from TB_PROGRAMID a';
  stSql := stSql + ' Left Join TB_PROGRAMGROUP b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.PR_GROUPCODE = b.PR_GROUPCODE ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aMenuGroupCode <> '' then
  begin
    stSql := stSql + ' AND a.PR_GROUPCODE = ''' + aMenuGroupCode + ''' ';
  end else
  begin
    if aProgramGroupCode <> '' then stSql := stSql + ' AND b.GUBUN = ''' + aProgramGroupCode + ''' ';
  end;
  stSql := stSql + ' AND PR_PROGRAMID NOT IN ( ';
  stSql := stSql + ' Select PR_PROGRAMID ';
  stSql := stSql + ' From TB_GRADEPROGRAM ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND GR_GRADECODE = ''' + aAdminClassCode + ''' ';
  stSql := stSql + ') ';
  stSql := stSql + ' Order by a.PR_PROGRAMNAME ';


  result := stSql;
end;

function TdmDBSql.GetTB_READER_PatrolReader(aNodeNo, aEcuID: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_READER ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND RE_PATROLUSE = ''1'' ';
  if aNodeNo <> '' then stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  if aEcuID <> '' then stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' Order by AC_NODENO,AC_ECUID,RE_READERNO ';

  result := stSql;
end;

function TdmDBSql.GetTB_SYSTEMLOG_AlarmAreaReport(aGroupCode, aStartDate,
  aStartTime, aEndDate, aEndTime, aBuildingCode, aFloorCode, aAreaCode, aNodeNo,
  aEcuID, aAlarmAreaCode: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.AL_ZONENAME,d.LO_NAME as BUILDINGNAME,e.LO_NAME as FLOORNAME,f.LO_NAME as AREANAME from TB_SYSTEMLOG a ';
  stSql := stSql + ' Inner Join TB_ALARMDEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  if Not G_bIsMaster then //Master 가 아니면
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND c.AD_USERID = ''' + G_stAdminUserID + ''') ';
    end;
  end;
  stSql := stSql + ' Left Join TB_LOCATION d ';
  stSql := stSql + ' ON ( b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.LO_DONGCODE = d.LO_DONGCODE ';
  stSql := stSql + ' AND d.LO_GUBUN = ''0'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION e ';
  stSql := stSql + ' ON ( b.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND b.LO_DONGCODE = e.LO_DONGCODE ';
  stSql := stSql + ' AND b.LO_FLOORCODE = e.LO_FLOORCODE ';
  stSql := stSql + ' AND e.LO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION f ';
  stSql := stSql + ' ON ( b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.LO_DONGCODE = f.LO_DONGCODE ';
  stSql := stSql + ' AND b.LO_FLOORCODE = f.LO_FLOORCODE ';
  stSql := stSql + ' AND b.LO_AREACODE = f.LO_AREACODE ';
  stSql := stSql + ' AND f.LO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.AC_TYPE = ''2'' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.SY_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.SY_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.SY_DATE + a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.SY_DATE || a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aNodeNo = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND b.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if aFloorCode <> '' then stSql := stSql + ' AND b.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if aAreaCode <> '' then stSql := stSql + ' AND b.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  end else
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo ;
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
  end;

  stSql := stSql + ' order by a.SY_DATE,a.SY_TIME ';

  result := stSql;

end;

function TdmDBSql.GetTB_SYSTEMLOG_CardReport(aGroupCode, aStartDate, aStartTime,
  aEndDate, aEndTime, aCompanyCode, aJijumCode, aDepartCode, aPosiCode,
  aCardType, aEmType, aEtcType, aEtcName: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := 'select a.*,k.AL_ZONENAME,l.DO_DOORNONAME,d.CO_NAME as COMPANYNAME,e.CO_NAME as JIJUMNAME,f.CO_NAME as DEPARTNAME,';
  stSql := stSql + ' g.PO_NAME,c.EM_CODE,c.EM_NAME,h.CT_NAME,i.RG_NAME as EM_TYPE';
  stSql := stSql + ' from TB_SYSTEMLOG a ';
  stSql := stSql + ' Inner Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = c.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( c.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( c.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY f ';
  stSql := stSql + ' ON ( c.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_JIJUMCODE = f.CO_JIJUMCODE ';
  stSql := stSql + ' AND c.CO_DEPARTCODE = f.CO_DEPARTCODE ';
  stSql := stSql + ' AND f.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI g ';
  stSql := stSql + ' ON ( c.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = g.CO_COMPANYCODE  ';
  stSql := stSql + ' AND c.PO_POSICODE = g.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_CARDTYPE h ';
  stSql := stSql + ' ON ( b.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_GUBUN = h.CT_CODE) ';
  stSql := stSql + ' Left Join TB_RELAYGUBUN i ';
  stSql := stSql + ' ON ( c.GROUP_CODE = i.GROUP_CODE ';
  stSql := stSql + ' AND c.RG_CODE = i.RG_CODE) ';
  stSql := stSql + ' Left Join TB_ALARMDEVICE k ';
  stSql := stSql + ' ON(a.GROUP_CODE = k.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = k.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = k.AC_ECUID ) ';
  stSql := stSql + ' Left Join TB_DOOR l ';
  stSql := stSql + ' ON(a.GROUP_CODE = l.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = l.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = l.AC_ECUID  ';
  stSql := stSql + ' AND a.AC_NUMBER = l.DO_DOORNO ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.SY_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.SY_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.SY_DATE + a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.SY_DATE || a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aEtcName <> '' then
  begin
    case aEtcType[1] of
      '0' : begin  //이름
          stSql := stSql + ' AND c.EM_NAME Like ''%' + aEtcName + '%'' ';
      end;
      '1' : begin  //사번
          stSql := stSql + ' AND c.EM_CODE Like ''%' + aEtcName + '%'' ';
      end;
      '2' : begin  //사내전화번호
          stSql := stSql + ' AND c.EM_COPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '3' : begin  //집전화번호
          stSql := stSql + ' AND c.EM_HOMEPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '4' : begin  //휴대전화번호
          stSql := stSql + ' AND c.EM_HANDPHONE Like ''%' + aEtcName + '%'' ';
      end;
      '5' : begin  //카드번호
          stSql := stSql + ' AND a.CA_CARDNO Like ''%' + aEtcName + '%'' ';
      end;
      '6' : begin  //주소1
          stSql := stSql + ' AND c.EM_ADDR1 Like ''%' + aEtcName + '%'' ';
      end;
      '7' : begin  //주소2
          stSql := stSql + ' AND c.EM_ADDR2 Like ''%' + aEtcName + '%'' ';
      end;
    end;
  end else
  begin
    if aCompanyCode <> '' then stSql := stSql + ' AND c.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    if aJijumCode <> '' then stSql := stSql + ' AND c.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
    if aDepartCode <> '' then stSql := stSql + ' AND c.CO_DEPARTCODE Like ''' + aDepartCode + '%'' ';
    if aPosiCode <> '' then stSql := stSql + ' AND c.PO_POSICODE = ''' + aPosiCode + ''' ';
    if aCardType <> '0' then stSql := stSql + ' AND b.CA_CARDTYPE = ''' + aCardType + ''' ';
    if aEmType <> '' then stSql := stSql + ' AND c.RG_CODE = ''' + aEmType + ''' ';
  end;
  stSql := stSql + ' order by a.SY_DATE,a.SY_TIME ';

  result := stSql;

end;

function TdmDBSql.GetTB_SYSTEMLOG_DoorReport(aGroupCode, aStartDate, aStartTime,
  aEndDate, aEndTime, aBuildingCode, aFloorCode, aAreaCode, aNodeNo, aEcuID,
  aDoorCode: string; aTimeType: integer): string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.DO_DOORNONAME,d.LO_NAME as BUILDINGNAME,e.LO_NAME as FLOORNAME,f.LO_NAME as AREANAME from TB_SYSTEMLOG a ';
  stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.AC_NUMBER = b.DO_DOORNO ) ';
  if Not G_bIsMaster then //Master 가 아니면
  begin
    if G_nAdminBuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND a.AC_NUMBER = c.DO_DOORNO ';
      stSql := stSql + ' AND c.AD_USERID = ''' + G_stAdminUserID + ''') ';
    end;
  end;
  stSql := stSql + ' Left Join TB_LOCATION d ';
  stSql := stSql + ' ON ( b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.LO_DONGCODE = d.LO_DONGCODE ';
  stSql := stSql + ' AND d.LO_GUBUN = ''0'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION e ';
  stSql := stSql + ' ON ( b.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND b.LO_DONGCODE = e.LO_DONGCODE ';
  stSql := stSql + ' AND b.LO_FLOORCODE = e.LO_FLOORCODE ';
  stSql := stSql + ' AND e.LO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION f ';
  stSql := stSql + ' ON ( b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.LO_DONGCODE = f.LO_DONGCODE ';
  stSql := stSql + ' AND b.LO_FLOORCODE = f.LO_FLOORCODE ';
  stSql := stSql + ' AND b.LO_AREACODE = f.LO_AREACODE ';
  stSql := stSql + ' AND f.LO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND a.AC_TYPE = ''1'' ';
  if aTimeType = 0 then
  begin
    stSql := stSql + ' AND a.SY_DATE BETWEEN ''' + aStartDate + ''' AND ''' + aEndDate + ''' ';
    stSql := stSql + ' AND a.SY_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  end else
  begin
    if G_nDBType = MSSQL then stSql := stSql + ' AND a.SY_DATE + a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' '
    else stSql := stSql + ' AND a.SY_DATE || a.SY_TIME BETWEEN ''' + aStartDate + aStartTime + ''' AND ''' + aEndDate + aEndTime + ''' ';
  end;
  if aDoorCode = '' then
  begin
    if aBuildingCode <> '' then stSql := stSql + ' AND b.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if aFloorCode <> '' then stSql := stSql + ' AND b.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if aAreaCode <> '' then stSql := stSql + ' AND b.LO_AREACODE Like ''' + aAreaCode + '%'' ';
  end else
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo ;
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.AC_NUMBER = ''' + aDoorCode + ''' ';
  end;

  stSql := stSql + ' order by a.SY_DATE,a.SY_TIME ';

  result := stSql;

end;

function TdmDBSql.GetTB_ZONEDEVICE_BuidingCode(aGroupCode, aBuildingCode,
  aFloorCode, aAreaCode: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_ZONEDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND AL_ZONEUSE = ''Y'' ';
  if aBuildingCode <> '' then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if aFloorCode <> '' then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if aAreaCode <> '' then
    stSql := stSql + ' AND LO_AREACODE Like ''' + aAreaCode + '%'' ';
  stSql := stSql + ' order by AC_NODENO,AC_ECUID,AL_ZONENUM ';
  result := stSql;
end;

end.
