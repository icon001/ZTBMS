unit uZeronEventDBCreate;

interface

uses
  SysUtils, Classes,ActiveX,ADODB;

type
  TdmZeronEventDBCreate = class(TDataModule)
  public
    { Public declarations }
    Function AlterTB_ACCESSDEVICE_AREACODE_Change : Boolean;
    Function AlterTB_ACCESSDEVICE_ArmAreaUse_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_ArmControlRing_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_CARDBYTE_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_CARDTYPE_Change: Boolean;
    Function AlterTB_ACCESSDEVICE_DaemonGubun_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_DecoderID_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_DeviceCode_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_DeviceType_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_DisArmControlRing_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_Door1Type_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_Door2Type_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_HoSend_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_InDelay_Add: Boolean;
    Function AlterTB_ACCESSDEVICE_Jaejung_Add: Boolean;
    Function AlterTB_ACCESSDEVICE_JAVARATYPE_Add: Boolean;
    Function AlterTB_ACCESSDEVICE_LinkusSystemID_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_LinkusTelNo_Add  : Boolean;
    Function AlterTB_ACCESSDEVICE_MEMLOAD_ADD : Boolean;
    Function AlterTB_ACCESSDEVICE_MuxID_Add: Boolean;
    Function AlterTB_ACCESSDEVICE_Name_Change: Boolean;
    Function AlterTB_ACCESSDEVICE_OutDelay_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_PowerType_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_ReaderType_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_RegSend_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_SOCKTYPE_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_TIMECODEASYNC_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_TimeCodeSend_Add:Boolean;
    Function AlterTB_ACCESSDEVICE_TIMETYPE_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_UPDATE_Add : Boolean;
    Function AlterTB_ACCESSEVENT_COMPANYCODE_Add : Boolean;
    Function AlterTB_ACCESSEVENT_DEPARTCODE_Add : Boolean;
    Function AlterTB_ACCESSEVENT_EMCODE_Add : Boolean;
    Function AlterTB_ACCESSEVENT_EMCODE_Change : Boolean;
    Function AlterTB_ACCESSEVENT_EMNAME_Add : Boolean;
    Function AlterTB_ACCESSEVENT_JIJUMCODE_Add : Boolean;
    Function AlterTB_ACCESSEVENT_SmallSENDSTATUS_Add : Boolean;
    Function AlterTB_ADMIN_AreaCode_Add : Boolean;
    Function AlterTB_ADMIN_BuildingGrade_Add : Boolean;
    Function AlterTB_ADMIN_DongCode_Add : Boolean;
    Function AlterTB_ADMIN_FloorCode_Add : Boolean;
    Function AlterTB_ALARMDEVICE_AREACODE_Change : Boolean;
    Function AlterTB_ALARMDEVICE_ARMGUBUN_Add : Boolean;
    Function AlterTB_ALARMDEVICE_memo_Add : Boolean;
    Function AlterTB_ALARMDEVICE_Name_Change: Boolean;
    Function AlterTB_ALARMDEVICE_RegSend_Add : Boolean;
    Function AlterTB_ALARMDEVICE_TelNo_Add : Boolean;
    Function AlterTB_ALARMDEVICE_UPDATE_Add : Boolean;
    Function AlterTB_ALARMEVENT_AlarmGRADE_Add : Boolean;
    Function AlterTB_ALARMEVENT_AlarmSound_Add : Boolean;
    Function AlterTB_ALARMEVENT_Cardno_Add: Boolean;
    Function AlterTB_ALARMEVENT_CheckUser_Add : Boolean;
    Function AlterTB_ALARMEVENT_Code_Change : Boolean;
    Function AlterTB_ALARMEVENT_COMPANYCODE_Add : Boolean;
    Function AlterTB_ALARMEVENT_EMCODE_Add : Boolean;
    Function AlterTB_ALARMEVENT_KTTSENDSTATUS_Add : Boolean;
    Function AlterTB_ALARMEVENT_Oper_Change : Boolean;
    Function AlterTB_ALARMEVENT_SmallSENDSTATUS_Add : Boolean;
    Function AlterTB_ALARMEVENT_STATECODE2_Add : Boolean;
    Function AlterTB_ALARMSTATUSCODE_ALARMSOUND_Add :Boolean;
    Function AlterTB_ALARMSTATUSCODE_Code_Change :Boolean;
    Function AlterTB_ALARMSTATUSCODEColor_Add :Boolean;
    Function AlterTB_ALARMSTATUSCODE_Gubun_Add:Boolean;
    Function AlterTB_ARMAREA_AREACODE_Change : Boolean;
    Function AlterTB_ARMAREA_ARMCODE_Add : Boolean;
    Function AlterTB_ARMAREA_MEMLOAD_ADD : Boolean;
    Function AlterTB_ARMAREA_memo_Add : Boolean;
    Function AlterTB_ARMAREA_TelNo_Add : Boolean;
    Function AlterTB_ATCODE_ATHOUTRANGE_Add:Boolean;
    Function AlterTB_ATCODE_ATOUTRANGE_Add:Boolean;
    Function AlterTB_ATCODE_ATSOUTRANGE_Add:Boolean;
    Function AlterTB_ATCODE_AWCODE_Add :Boolean;
    Function AlterTB_ATEVENT_DEPARTCODE_Add : Boolean;
    Function AlterTB_ATEVENT_EMNAME_Add : Boolean;
    Function AlterTB_ATEVENT_JIJUMCODE_Add : Boolean;
    Function AlterTB_ATDAYSUMMARY_DEPARTCODE_Add : Boolean;
    Function AlterTB_ATDAYSUMMARY_EMNAME_Add : Boolean;
    Function AlterTB_ATDAYSUMMARY_JIJUMCODE_Add : Boolean;
    Function AlterTB_ATLISTEVENT_CARDNOChange(aLen: string='20') : Boolean;
    Function AlterTB_ATMONTHSUMMARY_DEPARTCODE_Add : Boolean;
    Function AlterTB_ATMONTHSUMMARY_EMNAME_Add : Boolean;
    Function AlterTB_ATMONTHSUMMARY_JIJUMCODE_Add : Boolean;
    Function AlterTB_ATWORKTYPE_ATOFFBUTTON_Change(aLen:string='10') : Boolean;
    Function AlterTB_ATWORKTYPE_ATSTARTBUTTON_Change(aLen:string='10') : Boolean;
    Function AlterTB_ATWORKTYPE_WORKINBUTTON_Change(aLen:string='10') : Boolean;
    Function AlterTB_ATWORKTYPE_WORKOUTBUTTON_Change(aLen:string='10') : Boolean;
    Function AlterTB_CARD_DoorGrade_Add :Boolean;
    Function AlterTB_CARD_MEMLOAD_Add :Boolean;
    Function AlterTB_CARD_POSITIONNUM_Add :Boolean;
    Function AlterTB_COMPANY_DEPARTCODE_Change : Boolean;
    Function AlterTB_COMPANY_UPDATECHECK_Add : Boolean;
    Function AlterTB_COMPANY_VIEWSEQ_Add : Boolean;
    Function AlterTB_CONFIG_Value_Change: Boolean;
    Function AlterTB_DEVICECARDNO_MEMLOAD_Add:Boolean;
    Function AlterTB_DEVICECARDNOAlarm0_Add:Boolean;
    Function AlterTB_DEVICECARDNOAlarm1_Add:Boolean;
    Function AlterTB_DEVICECARDNOAlarm2_Add:Boolean;
    Function AlterTB_DEVICECARDNOAlarm3_Add:Boolean;
    Function AlterTB_DEVICECARDNOAlarm4_Add:Boolean;
    Function AlterTB_DEVICECARDNOAlarm5_Add:Boolean;
    Function AlterTB_DEVICECARDNOAlarm6_Add:Boolean;
    Function AlterTB_DEVICECARDNOAlarm7_Add:Boolean;
    Function AlterTB_DEVICECARDNOAlarm8_Add:Boolean;
    Function AlterTB_DEVICECARDNODoor3_Add:Boolean;
    Function AlterTB_DEVICECARDNODoor4_Add:Boolean;
    Function AlterTB_DEVICECARDNODoor5_Add:Boolean;
    Function AlterTB_DEVICECARDNODoor6_Add:Boolean;
    Function AlterTB_DEVICECARDNODoor7_Add:Boolean;
    Function AlterTB_DEVICECARDNODoor8_Add:Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Alarm0_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Alarm1_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Alarm2_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Alarm3_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Alarm4_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Alarm5_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Alarm6_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Alarm7_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Alarm8_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Door3_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Door4_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Door5_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Door6_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Door7_Add : Boolean;
    Function AlterTB_DEVICECARDNO_HIS_Door8_Add : Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Alarm0_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Alarm1_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Alarm2_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Alarm3_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Alarm4_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Alarm5_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Alarm6_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Alarm7_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Alarm8_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Door3_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Door4_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Door5_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Door6_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Door7_Add:Boolean;
    Function AlterTB_DEVICECARDNO_PROMISE_Door8_Add:Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Alarm0_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Alarm1_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Alarm2_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Alarm3_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Alarm4_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Alarm5_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Alarm6_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Alarm7_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Alarm8_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Door3_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Door4_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Door5_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Door6_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Door7_Add : Boolean;
    Function AlterTB_DEVICECARDNOGROUP_Door8_Add : Boolean;
    Function AlterTB_DOOR_AREACODE_Change : Boolean;
    Function AlterTB_DOOR_ALARMLONG_Add: Boolean;
    Function AlterTB_DOOR_AGANTINO_Add : Boolean;
    Function AlterTB_DOOR_AGCODE_Add : Boolean;
    Function AlterTB_DOOR_ControlTime_Change: Boolean;
    Function AlterTB_DOOR_DOGUBUN_Add : Boolean;
    Function AlterTB_DOOR_TIMECODEUSE_Add : Boolean;
    Function AlterTB_DOOR_DSOPEN_Add : Boolean;
    Function AlterTB_DOOR_FDMSID_Add : Boolean;
    Function AlterTB_DOOR_FDMSRELAY_Add : Boolean;
    Function AlterTB_DOOR_MEMLOAD_ADD : Boolean;
    Function AlterTB_DOOR_Name_Change: Boolean;
    Function AlterTB_DOOR_OPENMONI_Add: Boolean;
    Function AlterTB_DOOR_RegSend_Add: Boolean;
    Function AlterTB_DOOR_REMOTEDOOR_Add: Boolean;
    Function AlterTB_DOOR_SENDDOOR_Add: Boolean;
    Function AlterTB_DOOR_UPDATE_Add : Boolean;
    Function AlterTB_EMPHIS_CARDNO_Add : Boolean;
    Function AlterTB_EMPHIS_CARDTYPE_Add : Boolean;
    Function AlterTB_EMPHIS_COMPANYNAME_Add : Boolean;
    Function AlterTB_EMPHIS_DEPARTNAME_Add : Boolean;
    Function AlterTB_EMPHIS_EMNAME_Add : Boolean;
    Function AlterTB_EMPHIS_EMNAME_Change(aLength:integer=100) : Boolean;
    Function AlterTB_EMPHIS_HANDPHONE_Add : Boolean;
    Function AlterTB_EMPHIS_INSERTTIME_Add : Boolean;
    Function AlterTB_EMPHIS_JIJUMNAME_Add : Boolean;
    Function AlterTB_EMPHIS_POSINAME_Add : Boolean;
    Function AlterTB_EMPHIS_SENDSTATUS2_Add : Boolean;
    Function AlterTB_EMPLOYEE_AWCODE_Add : Boolean;
    Function AlterTB_EMPLOYEE_CAGROUP_Add : Boolean;
    Function AlterTB_EMPLOYEE_COPHONE_Change: Boolean;
    Function AlterTB_EMPLOYEE_DEPARTCODE_Change : Boolean;
    Function AlterTB_EMPLOYEE_DGAPPLY_Add: Boolean;
    Function AlterTB_EMPLOYEE_DGCODE_Add: Boolean;
    Function AlterTB_EMPLOYEE_EmName_Change(aSize:string='50'): Boolean;
    Function AlterTB_EMPLOYEE_EXPIREUSE_ADD : Boolean;
    Function AlterTB_EMPLOYEE_FDMSID_Add : Boolean;
    Function AlterTB_EMPLOYEE_FDMSRELAY_Add : Boolean;
    Function AlterTB_EMPLOYEE_GRADETYPE_Add : Boolean;
    Function AlterTB_EMPLOYEE_MASTER_Add : Boolean;
    Function AlterTB_EMPLOYEE_RelayGubun_Add : Boolean;
    Function AlterTB_EMPLOYEE_TIME1_Add: Boolean;
    Function AlterTB_EMPLOYEE_TIME2_Add: Boolean;
    Function AlterTB_EMPLOYEE_TIME3_Add: Boolean;
    Function AlterTB_EMPLOYEE_TIME4_Add: Boolean;
    Function AlterTB_EMPLOYEE_TIMECODEUSE_Add : Boolean;
    Function AlterTB_EMPLOYEE_TIMEGROUP_Add: Boolean;
    Function AlterTB_EMPLOYEE_WEEKCODE_Add:Boolean;
    Function AlterTB_EMPLOYEE_WORKCODE_Add : Boolean;
    Function AlterTB_FOOD_AREACODE_Change : Boolean;
    Function AlterTB_FOODEVENT_DEPARTCODE_Add:Boolean;
    Function AlterTB_FOODEVENT_EMNAME_Add:Boolean;
    Function AlterTB_FOODEVENT_JIJUMCODE_Add:Boolean;
    Function AlterTB_FOOD_Name_Change: Boolean;
    Function AlterTB_FTPLIST_RetryCount_Add : Boolean;
    Function AlterTB_HOLIDAY_ACUSE_Add : Boolean;
    Function AlterTB_HOLIDAY_ATUSE_Add : Boolean;
    Function AlterTB_HOLIDAY_State_Add : Boolean;
    Function AlterTB_INOUTGROUPLIST_EcuID_Add: Boolean;
    Function AlterTB_INOUTGROUPLIST_NodeNo_Add: Boolean;
    Function AlterTB_INOUTGROUPLIST_ReaderNo_Add : Boolean;
    Function AlterTB_INOUTGROUPLIST_Time_Add: Boolean;
    Function AlterTB_KTCARDISSUE_WriteDate_Add : Boolean;
    Function AlterTB_KTCARDISSUE_Write_Add : Boolean;
    Function AlterTB_KTTMAPPINGCODE_SendUse_Add : Boolean;
    Function AlterTB_LOCATION_AREACODE_Change : Boolean;
    Function AlterTB_LOCATION_CurX_Add : Boolean;
    Function AlterTB_LOCATION_CurY_Add : Boolean;
    Function AlterTB_LOCATION_TotHeight_Add : Boolean;
    Function AlterTB_LOCATION_TotWidth_Add : Boolean;
    Function AlterTB_LOCATION_VIEWSEQ_Add : Boolean;
    Function AlterTB_POSI_UPDATECHECK_Add : Boolean;
    Function AlterTB_POSI_VIEWSEQ_Add : Boolean;
    Function AlterTB_READER_BuildPosi_Add : Boolean;
    Function AlterTB_READER_DoorPosi_Add : Boolean;
    Function AlterTB_READER_InOutCount_Add : Boolean;
    Function AlterTB_READER_INOUTGROUPCODE_Add: Boolean;
    Function AlterTB_READER_PatrolCurX_Add : Boolean;
    Function AlterTB_READER_PatrolCurY_Add : Boolean;
    Function AlterTB_READER_PatrolName_Add : Boolean;
    Function AlterTB_READER_PatrolTotHeight_Add : Boolean;
    Function AlterTB_READER_PatrolTotWidth_Add : Boolean;
    Function AlterTB_READER_PatrolUse_Add : Boolean;
    Function AlterTB_READER_ReaderVer_Add : Boolean;
    Function AlterTB_READER_RegSend_Add : Boolean;
    Function AlterTB_TIMECODEDEVICE_EACHCHANGE_Add : Boolean;
    Function AlterTB_ZONEDEVICE_AREACODE_Change : Boolean;
    Function AlterTB_ZONEDEVICE_DelayUse_Add: Boolean;
    Function AlterTB_ZONEDEVICE_Name_Change: Boolean;
    Function AlterTB_ZONEDEVICE_PortRecovery_Add: Boolean;
    Function AlterTB_ZONEDEVICE_RegSend_Add: Boolean;
    Function AlterTB_ZONEDEVICE_UPDATE_Add : Boolean;
    Function AlterTB_ZONEDEVICE_View_Add : Boolean;
  public
    Function CreateTB_ACCESSDEVICE : Boolean;
    Function CreateTB_ACCESSEVENT : Boolean;
    Function CreateTB_ACCESSEVENT_IndexSMSENDSTATUS : Boolean;
    Function CreateTB_ACCESSINPUTTYPE:Boolean;
    Function CreateTB_ADMIN : Boolean;
    Function CreateTB_ADMINALARMAREA:Boolean;
    Function CreateTB_ADMINALARMDEVICE:Boolean;
    Function CreateTB_ALARMCODEGROUP:Boolean;
    Function CreateTB_ADMINCOMPANY : Boolean;
    Function CreateTB_ADMINDOOR : Boolean;
    Function CreateTB_ADMINFOOD : Boolean;
    Function CreateTB_ALARMCHECKCODE : Boolean;
    Function CreateTB_ALARMDEVICE : Boolean;
    Function CreateTB_ALARMDEVICETYPECODE : Boolean;
    Function CreateTB_ALARMEVENT : Boolean;
    Function CreateTB_AlarmEvent_Index1:Boolean;
    Function CreateTB_AlarmEVENT_IndexSMSENDSTATUS : Boolean;
    Function CreateTB_ALARMGUBUNCODE:Boolean;
    Function CreateTB_ALARMMODECODE : Boolean;
    Function CreateTB_ALARMMODENOTCARD:Boolean;
    Function CreateTB_ALARMSHOW:Boolean;
    Function CreateTB_ALARMSTATUSCODE:Boolean;
    Function CreateTB_ANTIGROUPCODE:Boolean;
    Function CreateTB_ARMAREA:Boolean;
    Function CreateTB_ATCARD : Boolean;
    Function CreateTB_ATCODE : Boolean;
    Function CreateTB_ATDAYSUMMARY:Boolean;
    Function CreateTB_ATEMPEXTRA : Boolean;
    Function CreateTB_ATEVENT : Boolean;
    Function CreateTB_ATINCODE : Boolean;
    Function CreateTB_ATLISTEVENT:Boolean;
    Function CreateTB_ATMONTHEXTRA:Boolean;
    Function CreateTB_ATMONTHSUMMARY:Boolean;
    Function CreateTB_ATOUTCODE : Boolean;
    Function CreateTB_ATPASS : Boolean;
    Function CreateTB_ATVACATION : Boolean;
    Function CreateTB_ATVACODE : Boolean;
    Function CreateTB_ATWORKTYPE:Boolean;
    Function CreateTB_BASEPAY : Boolean;
    Function CreateTB_CARD : Boolean;
    Function CreateTB_CARDGROUPCODE : Boolean;
    Function CreateTB_CARDTYPE:Boolean;
    Function CreateTB_CLIENTSOCK:Boolean;
    Function CreateTB_COMPANY : Boolean;
    Function CreateTB_CONFIG : Boolean;
    Function CreateTB_CURRENTDAEMON : Boolean;
    Function CreateTB_DAEMONMULTI:Boolean;
    Function CreateTB_DATASHARE : Boolean;
    Function CreateTB_DEVICECARDGROUPCODE:Boolean;
    Function CreateTB_DEVICECARDNO :Boolean;
    Function CreateTB_DEVICECARDNOACKINDEX:Boolean;
    Function CreateTB_DEVICECARDNOEMPLOYEE:Boolean;
    Function CreateTB_DEVICECARDNOGROUP : Boolean;
    Function CreateTB_DEVICECARDNO_HIS : Boolean;
    Function CreateTB_DEVICECARDNO_PROMISE :Boolean;
    Function CreateTB_DEVICESCHEDULE : Boolean;
    Function CreateTB_DEVICESETTINGINFO:Boolean;
    Function CreateTB_DEVICETYPE : Boolean;
    Function CreateTB_DOOR : Boolean;
    Function CreateTB_DOORGUBUN:Boolean;
    Function CreateTB_DOORPOSICODE:Boolean;
    Function CreateTB_EMPLOYEE : Boolean;
    Function CreateTB_EMPLOYEECHANGE:Boolean;
    Function CreateTB_EMPLOYEEEXPIRECHANGE:Boolean;
    Function CreateTB_EMPLOYEEEXPIRE_Trigger : Boolean;
    Function CreateTB_EMPHIS:Boolean;
    Function CreateTB_FACECOP:Boolean;
    Function CreateTB_FIREGROUP:Boolean;
    Function CreateTB_FIREGUBUN:Boolean;
    Function CreateTB_FOOD : Boolean;
    Function CreateTB_FOODCODE : Boolean;
    Function CreateTB_FOODCodeCount:Boolean;
    Function CreateTB_FOODDayCount:Boolean;
    Function CreateTB_FOODEVENT : Boolean;
    Function CreateTB_FOODGRADE : Boolean;
    Function CreateTB_FOODSemesterCount:Boolean;
    Function CreateTB_FOODWeekCount:Boolean;
    Function CreateTB_FormName:Boolean;
    Function CreateTB_FTPLIST : Boolean;
    Function CreateTB_GRADE : Boolean;
    Function CreateTB_GRADEPROGRAM :Boolean;
    Function CreateTB_HOLIDAY : Boolean;
    Function CreateTB_INOUTCOUNT:Boolean;
    Function CreateTB_INOUTGROUP:Boolean;
    Function CreateTB_INOUTGROUPLIST:Boolean;
    Function CreateTB_INOUTREADERGROUP:Boolean;
    Function CreateTB_JAVARASCHEDULE:Boolean;
    Function CreateTB_KTCARDISSUE:Boolean;
    Function CreateTB_KTTMAPPINGCODE:Boolean;
    Function CreateTB_LOCATION : Boolean;
    Function CreateTB_LOWDATA : Boolean;
    Function CreateTB_MAPLOCATION:Boolean;
    Function CreateTB_MAPPOSITION:Boolean;
    Function CreateTB_MAPZONE:Boolean;
    Function CreateTB_MONTHAT:Boolean;
    Function CreateTB_NOTCARDALARMCODE:Boolean;
    Function CreateTB_PATROLALARMEVENT:Boolean;
    Function CreateTB_PATROLSTATE : Boolean;
    Function CreateTB_PatrolTime  : Boolean;
    Function CreateTB_PERMITCODE : Boolean;
    Function CreateTB_PERRELAYCONFIG:Boolean;
    Function CreateTB_POSI : Boolean;
    Function CreateTB_PROGRAMGROUP : Boolean;
    Function CreateTB_PROGRAMID : Boolean;
    Function CreateTB_READER : Boolean;
    Function CreateTB_RELAYGUBUN:Boolean;
    Function CreateTB_RELAYUNIVERCITY:Boolean;
    Function CreateTB_SEMESTER:Boolean;
    Function CreateTB_SENSOREVENT : Boolean;
    Function CreateTB_SERVERCARDRELAY:Boolean;
    Function CreateTB_SERVERCARDRELAYHIS:Boolean;
    Function CreateTB_SMALLSETMAPPING:Boolean;
    Function CreateTB_SONGHOFDCONFIG:Boolean;
    Function CreateTB_SYSTEMLOG : Boolean;
    Function CreateTB_TIMECODE:Boolean;
    Function CreateTB_TIMECODEDEVICE:Boolean;
    Function CreateTB_USERCONFIG : Boolean;
    Function CreateTB_WORKGUBUN:Boolean;
    Function CreateTB_WORKLOG:Boolean;
    Function CreateTB_ZIPCODE : Boolean;
    Function CreateTB_ZONEDEVICE : Boolean;
    Function CreateTB_ZONESCHEDULE : Boolean;
  public
    Function CreateVw_SMS_EVENT:Boolean;
  public
    Function CreateTB_COMPANY_PrimaryKey:Boolean;
    Function CreateTB_LOCATION_PrimaryKey:Boolean;
    Function DropTB_COMPANY_PrimaryKey:Boolean;
    Function DropTB_LOCATION_PrimaryKey:Boolean;
  end;

var
  dmZeronEventDBCreate: TdmZeronEventDBCreate;

implementation
uses
  uZeronEventDataBase,
  uDBVariable,
  uLomosUtil,
  uCommonVariable;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmDBCreate }

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_AREACODE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_ACCESSDEVICE alter column  LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ACCESSDEVICE ALTER COLUMN LO_AREACODE varchar(50) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ACCESSDEVICE ALTER LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ACCESSDEVICE alter column  LO_AREACODE text(50) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_ArmAreaUse_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_ARMAREAUSE char(1) DEFAULT ''N'' NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_ArmControlRing_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_ARMRING integer DEFAULT 10 NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_CARDBYTE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_CARDBYTE integer ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_CARDTYPE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_CARDREADERTYPE TYPE varchar(10) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ACCESSDEVICE ALTER COLUMN AC_CARDREADERTYPE varchar(10) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ACCESSDEVICE ALTER AC_CARDREADERTYPE TYPE varchar(10) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_CARDREADERTYPE text(10) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_DaemonGubun_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DAEMONGUBUN int DEFAULT 1 NOT NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_DecoderID_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DECODERID varchar(10) DEFAULT ''KTT00'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_DeviceCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DEVICECODE varchar(20) NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_DeviceType_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DEVICETYPE char(1) DEFAULT ''0'' NULL ';
   if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_DisArmControlRing_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DISARMRING integer DEFAULT 10 NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_Door1Type_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DOOR1TYPE varchar(1) DEFAULT ''2'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_Door2Type_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DOOR2TYPE varchar(1) DEFAULT ''2'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_HoSend_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD HO_SEND varchar(1) DEFAULT ''N'' NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_InDelay_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_INDELAY integer DEFAULT 10 NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_Jaejung_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_JAEJUNG char(1) DEFAULT ''N'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_JAVARATYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_JAVARATYPE varchar(1) DEFAULT ''0''  NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_LinkusSystemID_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_LINKUSID varchar(10) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_LinkusTelNo_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_LINKUSTELNO varchar(14) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_MEMLOAD_ADD: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_MEMLOAD char(1) DEFAULT ''N'' NULL  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_MuxID_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_MUXID varchar(2) DEFAULT ''00'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_Name_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_DEVICENAME TYPE varchar(100) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ACCESSDEVICE ALTER COLUMN AC_DEVICENAME varchar(100) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ACCESSDEVICE ALTER AC_DEVICENAME TYPE varchar(100) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_DEVICENAME text(100) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_OutDelay_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_OUTDELAY integer DEFAULT 10 NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_PowerType_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_POWERTYPE char(1) DEFAULT ''0'' NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_ReaderType_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_READERTYPE varchar(1) DEFAULT ''0'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;



function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_RegSend_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD REG_SEND varchar(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_SOCKTYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD TC_TIMECODEASYNC varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_TIMECODEASYNC_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_SOCKTYPE integer DEFAULT 1 NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_TimeCodeSend_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_TimeCodeSend varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_TIMETYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_TIMETYPE char(1) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ACCESSDEVICE_UPDATE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_UPDATE varchar(1) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSEVENT_COMPANYCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD CO_COMPANYCODE varchar(3) DEFAULT ''000'' NOT NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSEVENT_DEPARTCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD CO_DEPARTCODE varchar(3) DEFAULT ''000'' NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSEVENT_EMCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD EM_CODE varchar(20) NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSEVENT_EMCODE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_ACCESSEVENT alter column  EM_CODE TYPE varchar(50) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ACCESSEVENT ALTER COLUMN EM_CODE varchar(50) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ACCESSEVENT ALTER EM_CODE TYPE varchar(50) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ACCESSEVENT alter column  EM_CODE text(50) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSEVENT_EMNAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD EM_NAME varchar(50) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSEVENT_JIJUMCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD CO_JIJUMCODE varchar(3) DEFAULT ''000'' NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ACCESSEVENT_SmallSENDSTATUS_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD AC_SMSENDSTATUS char(1) DEFAULT ''N'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ADMIN_AreaCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD LO_AREACODE varchar(3) DEFAULT ''000'' NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ADMIN_BuildingGrade_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD AD_BUILDINGGRADE char(1) DEFAULT ''4'' NOT NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ADMIN_DongCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD LO_DONGCODE varchar(3) DEFAULT ''000'' NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ADMIN_FloorCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD LO_FLOORCODE varchar(3) DEFAULT ''000'' NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMDEVICE_AREACODE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_ALARMDEVICE alter column  LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ALARMDEVICE ALTER COLUMN LO_AREACODE varchar(50) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ALARMDEVICE ALTER LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ALARMDEVICE alter column  LO_AREACODE text(50) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMDEVICE_ARMGUBUN_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE ADD AG_ARMCODE varchar(3) DEFAULT ''000'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMDEVICE_memo_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'alter table TB_ALARMDEVICE ADD AL_MEMO varchar(100) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMDEVICE_Name_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_ALARMDEVICE alter column  AL_ZONENAME TYPE varchar(100) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ALARMDEVICE ALTER COLUMN AL_ZONENAME varchar(100) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ALARMDEVICE ALTER AL_ZONENAME TYPE varchar(100) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ALARMDEVICE alter column  AL_ZONENAME text(100) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMDEVICE_RegSend_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE ADD REG_SEND varchar(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ALARMDEVICE_TelNo_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'alter table TB_ALARMDEVICE ADD AL_TELNO varchar(30) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMDEVICE_UPDATE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE ADD AL_UPDATE varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_AlarmGRADE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_ALARMGRADE int NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_AlarmSound_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_SOUND char(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_Cardno_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD CA_CARDNO varchar(20) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_CheckUser_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_CHECKUSER varchar(30) NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_Code_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AL_ALARMSTATUSCODE TYPE varchar(5) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AL_ALARMSTATUSCODE varchar(5) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ALARMEVENT ALTER AL_ALARMSTATUSCODE TYPE varchar(5) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ALARMEVENT alter column  AL_ALARMSTATUSCODE text(5) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_COMPANYCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD CO_COMPANYCODE varchar(3) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_EMCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD EM_CODE varchar(50) NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_KTTSENDSTATUS_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_KTTSENDSTATUS char(1) DEFAULT ''N'' NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_Oper_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AL_OPERATOR TYPE varchar(30) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AL_OPERATOR varchar(30) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ALARMEVENT ALTER AL_OPERATOR TYPE varchar(30) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ALARMEVENT alter column  AL_OPERATOR text(30) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_SmallSENDSTATUS_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_SMSENDSTATUS char(1) DEFAULT ''N'' NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ALARMEVENT_STATECODE2_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_STATUSCODE2 varchar(5) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMSTATUSCODEColor_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMSTATUSCODE ADD AL_COLOR INTEGER  DEFAULT 255 NULL ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ALARMSTATUSCODE_ALARMSOUND_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMSTATUSCODE ADD AL_ALARMSOUND int DEFAULT 0 NOT NULL ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ALARMSTATUSCODE_Code_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'ALTER TABLE TB_ALARMSTATUSCODE ALTER COLUMN AL_ALARMSTATUSCODE TYPE varchar(5) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ALARMSTATUSCODE ALTER COLUMN AL_ALARMSTATUSCODE varchar(5) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ALARMSTATUSCODE ALTER AL_ALARMSTATUSCODE TYPE varchar(5) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ALARMSTATUSCODE alter column  AL_ALARMSTATUSCODE text(5) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ALARMSTATUSCODE_Gubun_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMSTATUSCODE ADD AL_GUBUN varchar(3)  NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ARMAREA_AREACODE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_ARMAREA alter column  LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ARMAREA ALTER COLUMN LO_AREACODE varchar(50) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ARMAREA ALTER LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ARMAREA alter column  LO_AREACODE text(50) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ARMAREA_ARMCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ARMAREA ADD AG_ARMCODE varchar(3) DEFAULT ''000'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ARMAREA_MEMLOAD_ADD: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ARMAREA ADD AR_MEMLOAD char(1) DEFAULT ''N'' NULL  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ARMAREA_memo_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'alter table TB_ARMAREA ADD AR_MEMO varchar(200) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ARMAREA_TelNo_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'alter table TB_ARMAREA ADD AR_TELNO varchar(30) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATCODE_ATHOUTRANGE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATCODE ADD AT_HOUTRANGE varchar(4)  DEFAULT ''0000'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATCODE_ATOUTRANGE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATCODE ADD AT_OUTRANGE varchar(4)  DEFAULT ''0000'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATCODE_ATSOUTRANGE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATCODE ADD AT_SOUTRANGE varchar(4)  DEFAULT ''0000'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATCODE_AWCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATCODE ADD AW_CODE varchar(3)  DEFAULT ''001'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ATDAYSUMMARY_DEPARTCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATDAYSUMMARY ADD CO_DEPARTCODE varchar(3) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATDAYSUMMARY_EMNAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATDAYSUMMARY ADD EM_NAME varchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATDAYSUMMARY_JIJUMCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATDAYSUMMARY ADD CO_JIJUMCODE varchar(3) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATEVENT_DEPARTCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATEVENT ADD CO_DEPARTCODE varchar(3) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATEVENT_EMNAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATEVENT ADD EM_NAME varchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATEVENT_JIJUMCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATEVENT ADD CO_JIJUMCODE varchar(3) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATLISTEVENT_CARDNOChange(aLen: string='20'): Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = MSSQL then stSql := 'alter table TB_ATLISTEVENT alter column  CA_CARDNO varchar('+ aLen + ') '
  else if G_nDBTYPE = POSTGRESQL then stSql := 'alter table TB_ATLISTEVENT alter column  CA_CARDNO TYPE varchar('+ aLen + ') '
  else if G_nDBTYPE = FIREBIRD then stSql := 'alter table TB_ATLISTEVENT alter column  CA_CARDNO varchar(' + aLen + ') '
  else if G_nDBTYPE = MDB then stSql := 'alter table TB_ATLISTEVENT alter column  CA_CARDNO text('+ aLen + ') ' ;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ATMONTHSUMMARY_DEPARTCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATMONTHSUMMARY ADD CO_DEPARTCODE varchar(3) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATMONTHSUMMARY_EMNAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATMONTHSUMMARY ADD EM_NAME varchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATMONTHSUMMARY_JIJUMCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATMONTHSUMMARY ADD CO_JIJUMCODE varchar(3) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATWORKTYPE_ATOFFBUTTON_Change(
  aLen: string): Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = MSSQL then stSql := 'alter table TB_ATWORKTYPE alter column  AW_ATOFFBUTTON varchar('+ aLen + ') '
  else if G_nDBTYPE = POSTGRESQL then stSql := 'alter table TB_ATWORKTYPE alter column  AW_ATOFFBUTTON TYPE varchar('+ aLen + ') '
  else if G_nDBTYPE = FIREBIRD then stSql := 'alter table TB_ATWORKTYPE alter column  AW_ATOFFBUTTON varchar(' + aLen + ') '
  else if G_nDBTYPE = MDB then stSql := 'alter table TB_ATWORKTYPE alter column  AW_ATOFFBUTTON text('+ aLen + ') ' ;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATWORKTYPE_ATSTARTBUTTON_Change(aLen:string='10'): Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = MSSQL then stSql := 'alter table TB_ATWORKTYPE alter column  AW_ATSTARTBUTTON varchar('+ aLen + ') '
  else if G_nDBTYPE = POSTGRESQL then stSql := 'alter table TB_ATWORKTYPE alter column  AW_ATSTARTBUTTON TYPE varchar('+ aLen + ') '
  else if G_nDBTYPE = FIREBIRD then stSql := 'alter table TB_ATWORKTYPE alter column  AW_ATSTARTBUTTON varchar(' + aLen + ') '
  else if G_nDBTYPE = MDB then stSql := 'alter table TB_ATWORKTYPE alter column  AW_ATSTARTBUTTON text('+ aLen + ') ' ;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ATWORKTYPE_WORKINBUTTON_Change(
  aLen: string): Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = MSSQL then stSql := 'alter table TB_ATWORKTYPE alter column  AW_WORKINBUTTON varchar('+ aLen + ') '
  else if G_nDBTYPE = POSTGRESQL then stSql := 'alter table TB_ATWORKTYPE alter column  AW_WORKINBUTTON TYPE varchar('+ aLen + ') '
  else if G_nDBTYPE = FIREBIRD then stSql := 'alter table TB_ATWORKTYPE alter column  AW_WORKINBUTTON varchar(' + aLen + ') '
  else if G_nDBTYPE = MDB then stSql := 'alter table TB_ATWORKTYPE alter column  AW_WORKINBUTTON text('+ aLen + ') ' ;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ATWORKTYPE_WORKOUTBUTTON_Change(
  aLen: string): Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = MSSQL then stSql := 'alter table TB_ATWORKTYPE alter column  AW_WORKOUTBUTTON varchar('+ aLen + ') '
  else if G_nDBTYPE = POSTGRESQL then stSql := 'alter table TB_ATWORKTYPE alter column  AW_WORKOUTBUTTON TYPE varchar('+ aLen + ') '
  else if G_nDBTYPE = FIREBIRD then stSql := 'alter table TB_ATWORKTYPE alter column  AW_WORKOUTBUTTON varchar(' + aLen + ') '
  else if G_nDBTYPE = MDB then stSql := 'alter table TB_ATWORKTYPE alter column  AW_WORKOUTBUTTON text('+ aLen + ') ' ;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_CARD_DoorGrade_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARD ADD CA_DOORGRADE char(1) DEFAULT ''N'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_CARD_MEMLOAD_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARD ADD CA_MEMLOAD char(1)  DEFAULT ''N'' NOT NULL';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_CARD_POSITIONNUM_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARD ADD POSITIONNUM INTEGER NOT NULL';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_COMPANY_DEPARTCODE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_COMPANY alter column  CO_DEPARTCODE TYPE varchar(50) NOT NULL '
  else if G_nDBTYPE = MSSQL then
    stSql := 'alter table TB_COMPANY alter column  CO_DEPARTCODE varchar(50) NOT NULL '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_COMPANY ALTER CO_DEPARTCODE TYPE varchar(50) NOT NULL '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_COMPANY alter column  CO_DEPARTCODE text(50) NOT NULL ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_COMPANY_UPDATECHECK_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_COMPANY ADD CO_UPDATECHECK char(1) DEFAULT ''N'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_COMPANY_VIEWSEQ_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_COMPANY ADD CO_VIEWSEQ integer DEFAULT 0 NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_CONFIG_Value_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_CONFIG alter column  CO_CONFIGVALUE TYPE varchar(200) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'alter table TB_CONFIG alter column  CO_CONFIGVALUE varchar(200) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_CONFIG ALTER CO_CONFIGVALUE TYPE varchar(200) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_CONFIG alter column  CO_CONFIGVALUE text(200) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOAlarm0_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_ALARM0 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOAlarm1_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_ALARM1 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOAlarm2_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_ALARM2 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOAlarm3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_ALARM3 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOAlarm4_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_ALARM4 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOAlarm5_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_ALARM5 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOAlarm6_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_ALARM6 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOAlarm7_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_ALARM7 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOAlarm8_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_ALARM8 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNODoor3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_DOOR3 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNODoor4_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_DOOR4 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNODoor5_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_DOOR5 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNODoor6_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_DOOR6 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNODoor7_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_DOOR7 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNODoor8_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_DOOR8 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Alarm0_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_ALARM0 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Alarm1_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_ALARM1 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Alarm2_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_ALARM2 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Alarm3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_ALARM3 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Alarm4_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_ALARM4 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Alarm5_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_ALARM5 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Alarm6_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_ALARM6 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Alarm7_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_ALARM7 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Alarm8_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_ALARM8 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Door3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_DOOR3 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Door4_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_DOOR4 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Door5_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_DOOR5 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Door6_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_DOOR6 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Door7_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_DOOR7 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNOGROUP_Door8_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNOGROUP ADD DE_DOOR8 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Alarm0_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_ALARM0 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Alarm1_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_ALARM1 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Alarm2_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_ALARM2 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Alarm3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_ALARM3 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Alarm4_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_ALARM4 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Alarm5_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_ALARM5 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Alarm6_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_ALARM6 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Alarm7_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_ALARM7 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Alarm8_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_ALARM8 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Door3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_DOOR3 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Door4_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_DOOR4 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Door5_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_DOOR5 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Door6_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_DOOR6 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Door7_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_DOOR7 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_HIS_Door8_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_HIS ADD DE_DOOR8 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_MEMLOAD_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DE_MEMLOAD char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Alarm0_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_ALARM0 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Alarm1_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_ALARM1 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Alarm2_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_ALARM2 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Alarm3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_ALARM3 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Alarm4_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_ALARM4 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Alarm5_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_ALARM5 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Alarm6_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_ALARM6 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Alarm7_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_ALARM7 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Alarm8_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_ALARM8 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Door3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_DOOR3 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Door4_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_DOOR4 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Door5_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_DOOR5 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Door6_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_DOOR6 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Door7_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_DOOR7 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DEVICECARDNO_PROMISE_Door8_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO_PROMISE ADD DE_DOOR8 char(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DOOR_AGANTINO_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD AG_ANTINO INTEGER DEFAULT 0  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DOOR_AGCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD AG_CODE INTEGER DEFAULT 0 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DOOR_ALARMLONG_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_ALARMLONG char(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DOOR_AREACODE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_DOOR alter column  LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_DOOR ALTER COLUMN LO_AREACODE varchar(50) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_DOOR ALTER LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_DOOR alter column  LO_AREACODE text(50) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DOOR_ControlTime_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_DOOR alter column  DO_CONTROLTIME TYPE char(1) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'alter table TB_DOOR alter column  DO_CONTROLTIME char(1) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_DOOR ALTER DO_CONTROLTIME TYPE char(1) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_DOOR alter column  DO_CONTROLTIME text(1) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DOOR_DOGUBUN_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_GUBUN varchar(3) DEFAULT ''000'' NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DOOR_DSOPEN_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_DSOPEN char(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DOOR_FDMSID_Add: Boolean;
var
  stSql : string;
begin
  stSql := ' ALTER TABLE TB_DOOR ADD FDMS_ID int NULL';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DOOR_FDMSRELAY_Add: Boolean;
var
  stSql : string;
begin

  stSql := ' ALTER TABLE TB_DOOR ADD FDMS_RELAY varchar(1) NULL';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DOOR_MEMLOAD_ADD: Boolean;
var
  stSql : string;
begin

  stSql := ' ALTER TABLE TB_DOOR ADD DO_MEMLOAD char(1) DEFAULT ''N'' NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_DOOR_Name_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_DOOR alter column  DO_DOORNONAME TYPE varchar(100) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_DOOR ALTER COLUMN DO_DOORNONAME varchar(100) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_DOOR ALTER DO_DOORNONAME TYPE varchar(100) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_DOOR alter column  DO_DOORNONAME text(100) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DOOR_OPENMONI_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_OPENMONI char(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DOOR_RegSend_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD REG_SEND varchar(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DOOR_REMOTEDOOR_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_REMOTEDOOR char(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DOOR_SENDDOOR_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_SENDDOOR char(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DOOR_TIMECODEUSE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_TIMECODEUSE varchar(1) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_DOOR_UPDATE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_UPDATE varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_CARDNO_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD CA_CARDNO varchar(20) NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_CARDTYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD CA_CARDTYPE varchar(1) NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_COMPANYNAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD COMPANY_NAME varchar(50) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_DEPARTNAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD DEPART_NAME varchar(50) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_EMNAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD EM_NAME varchar(20) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_EMNAME_Change(aLength: integer): Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_EMPHIS alter column  EM_NAME TYPE varchar(' + inttostr(aLength) + ')'
  else if G_nDBTYPE = MSSQL then
    stSql := 'alter table TB_EMPHIS alter column  EM_NAME varchar(' + inttostr(aLength) + ')'
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_EMPHIS ALTER EM_NAME TYPE varchar(' + inttostr(aLength) + ')'
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_EMPHIS alter column  EM_NAME text(' + inttostr(aLength) + ')';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_HANDPHONE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD EM_HANDPHONE varchar(14) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_INSERTTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD EH_INSERTTIME varchar(14) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_JIJUMNAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD JIJUM_NAME varchar(50) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_POSINAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD PO_NAME varchar(30) NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPHIS_SENDSTATUS2_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD SEND_STATUS2 varchar(1) NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_AWCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD AW_CODE varchar(3)  DEFAULT ''001'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_CAGROUP_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD CA_GROUP varchar(50)  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_COPHONE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'ALTER TABLE TB_EMPLOYEE ALTER COLUMN EM_COPHONE TYPE varchar(100) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'alter table TB_EMPLOYEE alter column  EM_COPHONE varchar(100) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_EMPLOYEE ALTER EM_COPHONE TYPE varchar(100) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_EMPLOYEE alter column  EM_COPHONE text(100) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_DEPARTCODE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'ALTER TABLE TB_EMPLOYEE ALTER COLUMN CO_DEPARTCODE TYPE varchar(50) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'alter table TB_EMPLOYEE alter column  CO_DEPARTCODE varchar(50) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_EMPLOYEE ALTER CO_DEPARTCODE TYPE varchar(50) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_EMPLOYEE alter column  CO_DEPARTCODE text(50) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_DGAPPLY_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD DG_APPLY varchar(1)  DEFAULT ''N'' NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_DGCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD DG_CODE varchar(10)';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_EmName_Change(aSize:string='50'): Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'ALTER TABLE TB_EMPLOYEE ALTER COLUMN EM_NAME TYPE varchar(' + aSize + ') '
  else if G_nDBTYPE = MSSQL then
    stSql := 'alter table TB_EMPLOYEE alter column  EM_NAME varchar(' + aSize + ') '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_EMPLOYEE ALTER EM_NAME TYPE varchar(' + aSize + ') '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_EMPLOYEE alter column  EM_NAME text(' + aSize + ') ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_EXPIREUSE_ADD: Boolean;
var
  stSql : string;
begin
  stSql := ' ALTER TABLE TB_EMPLOYEE ADD EM_EXPIRUSE char(1) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_FDMSID_Add: Boolean;
var
  stSql : string;
begin

  stSql := 'ALTER TABLE TB_EMPLOYEE ADD FDMS_ID int ';

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_FDMSRELAY_Add: Boolean;
var
  stSql : string;
begin
  stSql := ' ALTER TABLE TB_EMPLOYEE ADD FDMS_RELAY varchar(1) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_GRADETYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_GRADETYPE integer  ';  //0.개인별카드권한,1.그룹별카드권한, 2.소속별카드권한
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_MASTER_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_MASTER char(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_RelayGubun_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD RG_CODE varchar(3) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_TIME1_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD TC_TIME1 varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_TIME2_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD TC_TIME2 varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_TIME3_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD TC_TIME3 varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_TIME4_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD TC_TIME4 varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_TIMECODEUSE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD DE_TIMECODEUSE varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_TIMEGROUP_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD TC_GROUP varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_WEEKCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD TC_WEEKCODE varchar(7) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_EMPLOYEE_WORKCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD WG_CODE integer DEFAULT 1 NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_FOODEVENT_DEPARTCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODEVENT ADD CO_DEPARTCODE varchar(3) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_FOODEVENT_EMNAME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODEVENT ADD EM_NAME varchar(100) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_FOODEVENT_JIJUMCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FOODEVENT ADD CO_JIJUMCODE varchar(3) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_FOOD_AREACODE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_FOOD alter column  LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_FOOD ALTER COLUMN LO_AREACODE varchar(50) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_FOOD ALTER LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_FOOD alter column  LO_AREACODE text(50) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_FOOD_Name_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_FOOD alter column  FO_NAME TYPE varchar(100) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_FOOD ALTER COLUMN FO_NAME varchar(100) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_FOOD ALTER FO_NAME TYPE varchar(100) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_FOOD alter column  FO_NAME text(100) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_FTPLIST_RetryCount_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FTPLIST ADD FL_RETRYCOUNT INTEGER DEFAULT 0 NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_HOLIDAY_ACUSE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_HOLIDAY ADD HO_ACUSE varchar(1) DEFAULT ''1'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_HOLIDAY_ATUSE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_HOLIDAY ADD HO_ATUSE varchar(1) DEFAULT ''1'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_HOLIDAY_State_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_HOLIDAY ADD HO_STATE varchar(1) DEFAULT ''I'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_INOUTGROUPLIST_EcuID_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_INOUTGROUPLIST ADD AC_ECUID varchar(2) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_INOUTGROUPLIST_NodeNo_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_INOUTGROUPLIST ADD AC_NODENO Integer NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_INOUTGROUPLIST_ReaderNo_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_INOUTGROUPLIST ADD RE_READERNO varchar(1)  NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_INOUTGROUPLIST_Time_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_INOUTGROUPLIST ADD IO_TIME varchar(14) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_KTCARDISSUE_WriteDate_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_KTCARDISSUE ADD KI_WRITEDATE varchar(8) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_KTCARDISSUE_Write_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_KTCARDISSUE ADD KI_WRITE char(1) DEFAULT ''N'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_KTTMAPPINGCODE_SendUse_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_KTTMAPPINGCODE ADD senduse varchar DEFAULT ''Y'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_LOCATION_AREACODE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_LOCATION alter column  LO_AREACODE TYPE varchar(50) NOT NULL'
  else if G_nDBTYPE = MSSQL then
    stSql := 'alter table TB_LOCATION alter column  LO_AREACODE varchar(50) NOT NULL'
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_LOCATION ALTER LO_AREACODE TYPE varchar(50) NOT NULL'
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_LOCATION alter column  LO_AREACODE text(50) NOT NULL';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_LOCATION_CurX_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_LOCATION ADD LO_CURX integer DEFAULT 0 NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_LOCATION_CurY_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_LOCATION ADD LO_CURY integer DEFAULT 0 NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_LOCATION_TotHeight_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_LOCATION ADD LO_TOTHEIGHT integer DEFAULT 0 NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_LOCATION_TotWidth_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_LOCATION ADD LO_TOTWIDTH integer DEFAULT 0 NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_LOCATION_VIEWSEQ_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_LOCATION ADD LO_VIEWSEQ integer DEFAULT 0 NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_POSI_UPDATECHECK_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_POSI ADD PO_UPDATECHECK char(1) DEFAULT ''N'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_POSI_VIEWSEQ_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_POSI ADD PO_VIEWSEQ integer DEFAULT 0 NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_READER_BuildPosi_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD DOOR_POSI varchar(1) DEFAULT ''0'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_READER_DoorPosi_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD BUILD_POSI varchar(1) DEFAULT ''0'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_READER_InOutCount_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_INOUTCOUNT int DEFAULT 0 NOT NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_READER_INOUTGROUPCODE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD IO_GROUPCODE varchar(3)  DEFAULT ''000'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_READER_PatrolCurX_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_PATROLCURX integer Default 0 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_READER_PatrolCurY_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_PATROLCURY integer Default 0 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_READER_PatrolName_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_PATROLNAME varchar(100)  ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_READER_PatrolTotHeight_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_PATROLTOTHEIGHT integer Default 0 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_READER_PatrolTotWidth_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_PATROLTOTWIDTH integer Default 0 ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_READER_PatrolUse_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_PATROLUSE char(1)  DEFAULT ''0'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_READER_ReaderVer_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_VER varchar(50) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_READER_RegSend_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD REG_SEND varchar(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_TIMECODEDEVICE_EACHCHANGE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_TIMECODEDEVICE ADD TC_EACHCHANGE varchar(1) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ZONEDEVICE_AREACODE_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_ZONEDEVICE alter column  LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ZONEDEVICE ALTER COLUMN LO_AREACODE varchar(50) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ZONEDEVICE ALTER LO_AREACODE TYPE varchar(50) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ZONEDEVICE alter column  LO_AREACODE text(50) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ZONEDEVICE_DelayUse_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONEDEVICE ADD AL_DELAYUSE varchar(1) DEFAULT ''0'' NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ZONEDEVICE_Name_Change: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
    stSql := 'alter table TB_ZONEDEVICE alter column  AL_ZONENAME TYPE varchar(100) '
  else if G_nDBTYPE = MSSQL then
    stSql := 'ALTER TABLE TB_ZONEDEVICE ALTER COLUMN AL_ZONENAME varchar(100) '
  else if G_nDBTYPE = FireBird then
    stSql := 'alter table TB_ZONEDEVICE ALTER AL_ZONENAME TYPE varchar(100) '
  else if G_nDBTYPE = MDB then
    stSql := 'alter table TB_ZONEDEVICE alter column  AL_ZONENAME text(100) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ZONEDEVICE_PortRecovery_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONEDEVICE ADD AL_PORTRECOVERY varchar(1) DEFAULT ''0'' NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ZONEDEVICE_RegSend_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONEDEVICE ADD REG_SEND varchar(1) NULL ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.AlterTB_ZONEDEVICE_UPDATE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONEDEVICE ADD AL_UPDATE varchar(1) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.AlterTB_ZONEDEVICE_View_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONEDEVICE ADD AL_VIEW char(1) DEFAULT ''Y'' NOT NULL';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ACCESSDEVICE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ACCESSDEVICE] ( ';
  stSql := stSql + '  [GROUP_CODE]varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [AC_NODENO]int NOT NULL,';
  stSql := stSql + '  [AC_ECUID]varchar(2) DEFAULT ''00'' NOT NULL,';
  stSql := stSql + '  [AC_DEVICENAME]varchar(30)   NULL,';
  stSql := stSql + '  [AC_VIEWSEQ]int NULL,';
  stSql := stSql + '  [AC_ACTYPE]char(1)   NULL,';
  stSql := stSql + '  [AC_ATTYPE]char(1)   NULL,';
  stSql := stSql + '  [AC_FDTYPE]char(1)   NULL,';
  stSql := stSql + '  [AC_PTTYPE]char(1)   NULL,';
  stSql := stSql + '  [LO_DONGCODE]varchar(3)   NULL,';
  stSql := stSql + '  [LO_FLOORCODE]varchar(3)   NULL,';
  stSql := stSql + '  [LO_AREACODE]varchar(3)   NULL,';
  stSql := stSql + '  [AC_LOCATEUSE]char(1)   NULL, ';
  stSql := stSql + '  [AC_TOTWIDTH]int NULL, ';
  stSql := stSql + '  [AC_TOTHEIGHT]int NULL,';
  stSql := stSql + '  [AC_CURX]int NULL, ';
  stSql := stSql + '  [AC_CURY]int NULL, ';
  stSql := stSql + '  [AC_LOCALRELAY]varchar(1)   NULL, ';
  stSql := stSql + '  [AC_MCUIP]varchar(24)   NOT NULL,';
  stSql := stSql + '  [AC_MCUPORT]varchar(5)   NOT NULL,';
  stSql := stSql + '  [AC_MCUID]varchar(7)   NULL,';
  stSql := stSql + '  [AC_SUBNET]varchar(20)   NULL,';
  stSql := stSql + '  [AC_GATEWAY]varchar(24)   NULL, ';
  stSql := stSql + '  [AC_CARDREADERTYPE]varchar(1)   NULL,';
  stSql := stSql + '  [AC_VER]varchar(50)   NULL,';
  stSql := stSql + '  [AC_FTPUSE]varchar(1)   NULL,';
  stSql := stSql + '  [AC_CONNECTED]varchar(1)   NULL,';
  stSql := stSql + '  [AC_LASTCONNECTED]varchar(14)   NULL, ';
  stSql := stSql + '  [AC_NETTYPE]varchar(10)   NULL,';
  stSql := stSql + '  [AC_COMPORT]varchar(10)   NULL,';
  stSql := stSql + '  [AC_GUBUN]varchar(1)   NULL, ';
  stSql := stSql + '  [SEND_ACK]varchar(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AC_NODENO], [AC_ECUID])';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ACCESSEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ACCESSEVENT] ( ';
  stSql := stSql + '  [GROUP_CODE]varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [AC_DATE]varchar(8)   NOT NULL,';
  stSql := stSql + '  [AC_TIME]varchar(6)   NOT NULL,';
  stSql := stSql + '  [AC_NODENO]int DEFAULT 0 NOT NULL,';
  stSql := stSql + '  [AC_ECUID]varchar(2)   NOT NULL,';
  stSql := stSql + '  [DO_DOORNO]char(1)   NOT NULL,';
  stSql := stSql + '  [CA_CARDNO]varchar(20)   NOT NULL, ';
  stSql := stSql + '  [AC_READERNO]char(1)   NOT NULL,';
  stSql := stSql + '  [AC_BUTTONNO]char(1)   NOT NULL,';
  stSql := stSql + '  [AC_DOORPOSI]char(1)   NULL,';
  stSql := stSql + '  [AC_INPUTTYPE]char(1)   NULL, ';
  stSql := stSql + '  [AC_DOORMODE]char(1)   NULL, ';
  stSql := stSql + '  [AC_PERMITMODE]char(1)   NULL, ';
  stSql := stSql + '  [PE_PERMITCODE]char(1)   NULL,';
  stSql := stSql + '  [AC_INSERTDATE]varchar(14)   NULL,';
  stSql := stSql + '  [AC_INSERTOPERATOR]varchar(10)   NULL,';
  stSql := stSql + '  [AC_MCUID]varchar(7)   NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AC_DATE], [AC_TIME], [AC_NODENO], [AC_ECUID], [DO_DOORNO], [CA_CARDNO]) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ACCESSEVENT_IndexSMSENDSTATUS: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE INDEX TB_ACCESSEVENT_IndexSMSENDSTATUS ON TB_ACCESSEVENT (AC_SMSENDSTATUS) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ACCESSINPUTTYPE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ACCESSINPUTTYPE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_INPUTTYPE char(1) NOT NULL,';
  stSql := stSql + ' AC_INPUTTYPENAME varchar(50),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AC_INPUTTYPE) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ADMIN: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  [TB_ADMIN] (';
  stSql := stSql + '  [GROUP_CODE]varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [AD_USERID]varchar(20)   NOT NULL,';
  stSql := stSql + '  [AD_USERPW]varchar(20)   NULL,';
  stSql := stSql + '  [AD_USERNAME]varchar(20)   NULL,';
  stSql := stSql + '  [GR_GRADECODE]varchar(3)   NULL,';
  stSql := stSql + '  [AD_UPDATETIME]varchar(14)   NULL,';
  stSql := stSql + '  [AD_UPDATEOPERATER]varchar(10)   NULL, ';
  stSql := stSql + '  [AD_MASTER]char(1)   NULL,';
  stSql := stSql + '  [CO_COMPANYCODE]varchar(3)   NULL, ';
  stSql := stSql + '  [CO_JIJUMCODE]varchar(3)   NULL, ';
  stSql := stSql + '  [CO_DEPARTCODE]varchar(3)   NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AD_USERID]) ';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ADMINALARMAREA: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ADMINALARMAREA (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AD_USERID varchar(20) NOT NULL,';
  stSql := stSql + ' AC_NODENO integer NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' AR_AREANO varchar(2) NOT NULL,';
  stSql := stSql + ' AD_GUBUN varchar(1) ,';
  stSql := stSql + ' AD_UPDATETIME varchar(14) ,';
  stSql := stSql + ' AD_UPDATEOPERATOR varchar(10) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AD_USERID,AC_NODENO,AC_ECUID,AR_AREANO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ADMINALARMDEVICE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  [TB_ADMINALARMDEVICE] ( ';
  stSql := stSql + '  [GROUP_CODE]varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [AD_USERID]varchar(20)   NOT NULL,';
  stSql := stSql + '  [AC_NODENO]int DEFAULT 0 NOT NULL, ';
  stSql := stSql + '  [AC_ECUID]varchar(2)   NOT NULL,';
  stSql := stSql + '  [AD_GUBUN]char(1)   NULL,';
  stSql := stSql + '  [AD_UPDATETIME]varchar(14)   NULL,';
  stSql := stSql + '  [AD_UPDATEOPERATOR]varchar(10)   NULL, ';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AD_USERID], [AC_NODENO],[AC_ECUID])  ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ADMINCOMPANY: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ADMINCOMPANY] ( ';
  stSql := stSql + '  [GROUP_CODE]varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [AD_USERID]varchar(20)   NOT NULL, ';
  stSql := stSql + '  [CO_COMPANYCODE]varchar(3)   NOT NULL, ';
  stSql := stSql + '  [CO_JIJUMCODE]varchar(3)   NOT NULL,';
  stSql := stSql + '  [CO_DEPARTCODE]varchar(3)   DEFAULT ''000'' NOT NULL,';
  stSql := stSql + '  [CO_GUBUN]char(1)   NULL,';
  stSql := stSql + '  [AD_UPDATETIME]varchar(14)   NULL, ';
  stSql := stSql + '  [AD_UPDATEOPERATOR]varchar(10)   NULL, ';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AD_USERID], [CO_COMPANYCODE],[CO_JIJUMCODE], [CO_DEPARTCODE]) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ADMINDOOR: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ADMINDOOR] (';
  stSql := stSql + '  [GROUP_CODE]varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [AD_USERID]varchar(20)   NOT NULL,';
  stSql := stSql + '  [AC_NODENO]int DEFAULT 0 NOT NULL,';
  stSql := stSql + '  [AC_ECUID]varchar(2)   NOT NULL,';
  stSql := stSql + '  [DO_DOORNO]char(1)   DEFAULT ''1'' NOT NULL,';
  stSql := stSql + '  [AD_GUBUN]char(1)   NULL,';
  stSql := stSql + '  [AD_UPDATETIME]varchar(14)   NULL, ';
  stSql := stSql + '  [AD_UPDATEOPERATOR]varchar(10)   NULL,';
  stSql := stSql + '  [AC_MCUID]varchar(7)   NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AD_USERID], [AC_NODENO], [DO_DOORNO], [AC_ECUID]) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ADMINFOOD: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ADMINFOOD] ( ';
  stSql := stSql + ' [GROUP_CODE]varchar(10) NOT NULL,';
  stSql := stSql + '  [AD_USERID]varchar(20) NOT NULL,';
  stSql := stSql + '  [AC_NODENO]int NOT NULL,';
  stSql := stSql + '  [AC_ECUID]varchar(2)  NOT NULL,';
  stSql := stSql + '  [FO_DOORNO]char(1)  NOT NULL,';
  stSql := stSql + '  [AD_UPDATETIME]varchar(14)  NULL,';
  stSql := stSql + '  [AD_UPDATEOPERATOR]varchar(10)  NULL,';
  stSql := stSql + '  [AC_MCUID]varchar(7)  NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AD_USERID], [AC_NODENO], [AC_ECUID], [FO_DOORNO]) ';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ALARMCHECKCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ALARMCHECKCODE  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AL_ALARMCHECKCODE varchar(3)   NOT NULL,';
  stSql := stSql + '   AL_ALARMCHECKCODENAME varchar(30)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AL_ALARMCHECKCODE )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ALARMCODEGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMCODEGROUP (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AG_CODE varchar(30) NOT NULL,';
  stSql := stSql + ' AL_ALARMSTATUSCODE varchar(5) NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AG_CODE,AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ALARMDEVICE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ALARMDEVICE  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL, ';
  stSql := stSql + '   AL_ZONENUM char(2)   NULL, ';
  stSql := stSql + '   AL_ZONENAME varchar(30)   NULL,';
  stSql := stSql + '   AL_LASTMODE char(1)   NULL, ';
  stSql := stSql + '   AL_VIEWSEQ int NULL, ';
  stSql := stSql + '   AC_MCUID varchar(7)   NULL, ';
  stSql := stSql + '   AL_LOCATEUSE char(1)   NULL, ';
  stSql := stSql + '   AL_TOTWIDTH int NULL,';
  stSql := stSql + '   AL_TOTHEIGHT int NULL,';
  stSql := stSql + '   AL_CURX int NULL,';
  stSql := stSql + '   AL_CURY int NULL,  ';
  stSql := stSql + '   LO_DONGCODE varchar(3)   NULL, ';
  stSql := stSql + '   LO_FLOORCODE varchar(3)   NULL, ';
  stSql := stSql + '   LO_AREACODE varchar(3)   NULL, ';
  stSql := stSql + '   AL_OUTDELAY int NULL, ';
  stSql := stSql + '   AL_INDELAY int NULL, ';
  stSql := stSql + '   AL_ALARMID varchar(10)   NULL,';
  stSql := stSql + '   AL_MUXTELNO varchar(20)   NULL,';
  stSql := stSql + '   AL_REMOTERINGCNT int NULL,';
  stSql := stSql + '   SEND_ACK varchar(1)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AC_NODENO ,  AC_ECUID )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ALARMDEVICETYPECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ALARMDEVICETYPECODE  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AL_ALARMDEVICETYPECODE varchar(2)   NOT NULL,';
  stSql := stSql + '   AL_ALARMDEVICETYPENAME varchar(30)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AL_ALARMDEVICETYPECODE ) ';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ALARMEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ALARMEVENT  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AL_DATE varchar(8)   NOT NULL,';
  stSql := stSql + '   AL_TIME varchar(6)   NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL,';
  stSql := stSql + '   AL_MSGNO char(1)   NOT NULL,';
  stSql := stSql + '   AL_ALARMDEVICETYPECODE varchar(2)   NULL,';
  stSql := stSql + '   AL_SUBADDR varchar(2)   NULL, ';
  stSql := stSql + '   AL_ZONECODE varchar(2)   NULL, ';
  stSql := stSql + '   AL_ALARMMODECODE char(1)   NULL, ';
  stSql := stSql + '   AL_ZONENO varchar(2)   NULL, ';
  stSql := stSql + '   AL_ZONESTATE char(1)   NULL, ';
  stSql := stSql + '   AL_ALARMSTATUSCODE varchar(5)   NULL, ';
  stSql := stSql + '   AL_ISALARM char(1)   NULL,';
  stSql := stSql + '   AL_OPERATOR varchar(10)   NULL,  ';
  stSql := stSql + '   AL_INPUTTIME varchar(14)   NULL, ';
  stSql := stSql + '   AL_INPUTOPERATOR varchar(10)   NULL, ';
  stSql := stSql + '   AL_CHECKOK char(1)   NULL, ';
  stSql := stSql + '   AL_CHECKCODE varchar(3)   NULL, ';
  stSql := stSql + '   AL_CHECKMSG varchar(100)   NULL,';
  stSql := stSql + '   AL_UPDATETIME varchar(14)   NULL,';
  stSql := stSql + '   AL_UPDATEOPERATOR varchar(10)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AL_DATE ,  AL_TIME ,  AC_NODENO , AC_ECUID ,  AL_MSGNO )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_AlarmEvent_Index1: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE INDEX TB_ALARMEVENT_idx1 ON TB_ALARMEVENT (AL_CHECKOK, AL_DATE) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_AlarmEVENT_IndexSMSENDSTATUS: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE INDEX TB_ALARMEVENT_IndexSMSENDSTATUS ON TB_ALARMEVENT (AL_SMSENDSTATUS) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ALARMGUBUNCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMGUBUNCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AG_ARMCODE varchar(3) NOT NULL,';
  stSql := stSql + ' AG_ARMNAME varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AG_ARMCODE) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ALARMMODECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ALARMMODECODE  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AL_ALARMMODECODE char(1)   NOT NULL,';
  stSql := stSql + '   AL_ALARMMODENAME varchar(30)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AL_ALARMMODECODE ) ';
  stSql := stSql + ')';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ALARMMODENOTCARD: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMMODENOTCARD (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AN_CODE varchar(5) NOT NULL,';
  stSql := stSql + ' AN_NOTDATA varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AN_CODE) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ALARMSHOW: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMSHOW (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' AC_NODENO int NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' AL_ALARMDEVICETYPECODE varchar(2) NOT NULL,';
  stSql := stSql + ' AL_SUBADDR varchar(2) NOT NULL,';
  stSql := stSql + ' AL_ZONECODE varchar(2) NOT NULL,';
  stSql := stSql + ' AL_ZONENO varchar(2) NOT NULL,';
  stSql := stSql + ' AL_ALARMSTATUSCODE varchar(2) NOT NULL,';
  stSql := stSql + ' AL_ISALARM varchar(1) NULL,';
  stSql := stSql + ' AL_ALARMMODECODE varchar(1) NULL,';
  stSql := stSql + ' AL_DATE varchar(8) NULL,';
  stSql := stSql + ' AL_TIME varchar(6) NULL,';
  stSql := stSql + ' AL_MSGNO varchar(1) NULL,';
  stSql := stSql + ' AL_ZONESTATE varchar(1) NULL,';
  stSql := stSql + ' AL_OPERATOR varchar(10) NULL,';
  stSql := stSql + ' AL_CHECKOK varchar(1) NULL,';
  stSql := stSql + ' AL_CHECKCODE varchar(3) NULL,';
  stSql := stSql + ' AL_CHECKMSG varchar(100) NULL,';
  stSql := stSql + ' AL_UPDATETIME varchar(14) NULL,';
  stSql := stSql + ' AL_UPDATEOPERATOR varchar(10) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AC_NODENO,';
  stSql := stSql + ' AC_ECUID,AL_ALARMDEVICETYPECODE,AL_SUBADDR,';
  stSql := stSql + ' AL_ZONECODE,AL_ZONENO,AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ALARMSTATUSCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ALARMSTATUSCODE  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '   AL_ALARMSTATUSCODE varchar(5)   NOT NULL,';
  stSql := stSql + '   AL_ALARMNAME varchar(30)   NULL, ';
  stSql := stSql + '   AL_ALARMVIEW int NULL,';
  stSql := stSql + '   AL_ALARMGRADE int NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AL_ALARMSTATUSCODE ) ';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ANTIGROUPCODE: Boolean;
var
  stSql : string;
begin
  //안티패스 그룹 코드 생성
  stSql := 'Create Table TB_ANTIGROUPCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AG_CODE integer NOT NULL,';
  stSql := stSql + ' AG_NAME varchar(50),';
  stSql := stSql + ' AG_ANTINO integer ,';          //출입문에 설정되는 AntipassNo
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AG_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ARMAREA: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ARMAREA (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' AC_NODENO INTEGER NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' AR_AREANO varchar(2) NOT NULL,';
  stSql := stSql + ' AR_NAME varchar(100) NULL,';
  stSql := stSql + ' AR_USE varchar(1) DEFAULT ''N'' NULL,';
  stSql := stSql + ' AR_LASTMODE varchar(1),';
  stSql := stSql + ' AR_VIEWSEQ integer,';
  stSql := stSql + ' AR_LOCATEUSE varchar(1),';
  stSql := stSql + ' AR_TOTWIDTH integer,';
  stSql := stSql + ' AR_TOTHEIGHT integer,';
  stSql := stSql + ' AR_CURX integer,';
  stSql := stSql + ' AR_CURY integer,';
  stSql := stSql + ' LO_DONGCODE varchar(3) DEFAULT ''000'' NULL,';
  stSql := stSql + ' LO_FLOORCODE varchar(3) DEFAULT ''000'' NULL,';
  stSql := stSql + ' LO_AREACODE varchar(3) DEFAULT ''000'' NULL,';
  stSql := stSql + ' AR_UPDATE varchar(1) DEFAULT ''N'' NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,AR_AREANO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATCARD: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ATCARD] ( ';
  stSql := stSql + '  [GROUP_CODE]varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [CA_CARDNO]varchar(20) NOT NULL,';
  stSql := stSql + '  [AT_REG]varchar(1) DEFAULT ''Y'' NULL,';
  stSql := stSql + '  [AT_LOAD]varchar(1) DEFAULT ''N'' NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [CA_CARDNO])';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ATCODE  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AT_ATCODE varchar(3)   NOT NULL,';
  stSql := stSql + '   AT_CODENAME varchar(30)   NULL, ';
  stSql := stSql + '   AT_WORKSTARTTIME varchar(4)   NULL,';
  stSql := stSql + '   AT_WORKENDTIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_INFROMTIME varchar(4)   NULL,';
  stSql := stSql + '   AT_INTOTIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_EXTENDTIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_NIGHTTIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_NORMALADD varchar(4)   NULL, ';
  stSql := stSql + '   AT_EARLYADD varchar(4)   NULL,';
  stSql := stSql + '   AT_JIGAKADD varchar(4)   NULL,';
  stSql := stSql + '   AT_JOTAEADD varchar(4)   NULL,';
  stSql := stSql + '   AT_EXTENDADD varchar(4)   NULL,';
  stSql := stSql + '   AT_NIGHTADD varchar(4)   NULL, ';
  stSql := stSql + '   AT_SWORKSTARTTIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_SWORKENDTIME varchar(4)   NULL,';
  stSql := stSql + '   AT_SINFROMTIME varchar(4)   NULL,';
  stSql := stSql + '   AT_SINTOTIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_SEXTENDTIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_SNIGHTTIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_SNORMALADD varchar(4)   NULL, ';
  stSql := stSql + '   AT_SEARLYADD varchar(4)   NULL, ';
  stSql := stSql + '   AT_SJIGAKADD varchar(4)   NULL, ';
  stSql := stSql + '   AT_SJOTAEADD varchar(4)   NULL, ';
  stSql := stSql + '   AT_SEXTENDADD varchar(4)   NULL, ';
  stSql := stSql + '   AT_SNIGHTADD varchar(4)   NULL,  ';
  stSql := stSql + '   AT_HWORKSTARTTIME varchar(4)   NULL,';
  stSql := stSql + '   AT_HWORKENDTIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_HINFROMTIME varchar(4)   NULL,';
  stSql := stSql + '   AT_HINTOTIME varchar(4)   NULL,';
  stSql := stSql + '   AT_HEXTENDTIME varchar(4)   NULL,';
  stSql := stSql + '   AT_HNIGHTTIME varchar(4)   NULL,';
  stSql := stSql + '   AT_HNORMALADD varchar(4)   NULL,';
  stSql := stSql + '   AT_HEARLYADD varchar(4)   NULL,';
  stSql := stSql + '   AT_HJIGAKADD varchar(4)   NULL,';
  stSql := stSql + '   AT_HJOTAEADD varchar(4)   NULL, ';
  stSql := stSql + '   AT_HEXTENDADD varchar(4)   NULL, ';
  stSql := stSql + '   AT_HNIGHTADD varchar(4)   NULL,  ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AT_ATCODE ) ';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATDAYSUMMARY: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ATDAYSUMMARY] (';
  stSql := stSql + '  [GROUP_CODE]varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [AT_DATE]varchar(8) NOT NULL,';
  stSql := stSql + '  [CO_COMPANYCODE]varchar(3) NOT NULL,';
  stSql := stSql + '  [EM_CODE]varchar(20) NOT NULL,';
  stSql := stSql + '  [AT_TYPE]varchar(1) NULL,';
  stSql := stSql + '  [AT_WEEKCODE]int DEFAULT (0) NULL, ';
  stSql := stSql + '  [AT_INFROMMM]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_WORKMM]int DEFAULT (0) NULL, ';
  stSql := stSql + '  [AT_EXTENDMM]int DEFAULT (0) NULL, ';
  stSql := stSql + '  [AT_NIGHTMM]int DEFAULT (0) NULL, ';
  stSql := stSql + '  [AT_INFROMAMT]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_WORKAMT]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_EXTENDAMT]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_NIGHTAMT]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_PAYVACATION]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_NONPAYVACATION]int DEFAULT (0) NULL, ';
  stSql := stSql + '  [AT_JIKAG]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_JOTAE]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_LEAVECOUNT]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_BACKCOUNT]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_REALATTIMEMM]int DEFAULT (0) NULL, ';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AT_DATE], [CO_COMPANYCODE], [EM_CODE]) ';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATEMPEXTRA: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ATEMPEXTRA] (';
  stSql := stSql + '   [GROUP_CODE]varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   [CO_COMPANYCODE]varchar(3) NOT NULL,';
  stSql := stSql + '   [EM_CODE]varchar(20) NOT NULL,';
  stSql := stSql + '   [EX_TYPE]int NULL, ';
  stSql := stSql + '   [EX_WEARLYAMT]int NULL, ';
  stSql := stSql + '   [EX_WEXTENDAMT]int NULL,';
  stSql := stSql + '   [EX_WNIGHTAMT]int NULL, ';
  stSql := stSql + '   [EX_SEARLYAMT]int NULL, ';
  stSql := stSql + '   [EX_SEXTENDAMT]int NULL,';
  stSql := stSql + '   [EX_SNIGHTAMT]int NULL, ';
  stSql := stSql + '   [EX_HEARLYAMT]int NULL, ';
  stSql := stSql + '   [EX_HEXTENDAMT]int NULL, ';
  stSql := stSql + '   [EX_HNIGHTAMT]int NULL, ';
  stSql := stSql + '   PRIMARY KEY CLUSTERED ([GROUP_CODE], [CO_COMPANYCODE], [EM_CODE]) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ATEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ATEVENT  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '   AT_DATE varchar(8)   NOT NULL, ';
  stSql := stSql + '   CO_COMPANYCODE varchar(3)   NOT NULL, ';
  stSql := stSql + '   EM_CODE varchar(20)   NOT NULL, ';
  stSql := stSql + '   CA_GUBUN varchar(1)   NULL, ';
  stSql := stSql + '   CA_CARDNO varchar(20)   NULL, ';
  stSql := stSql + '   AT_ATCODE varchar(3)   NULL, ';
  stSql := stSql + '	 AT_WEEKCODE varchar(1)   NULL, ';
  stSql := stSql + '   AT_DEFAULTINTIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_DEFAULTOUTTIME varchar(4)   NULL,';
  stSql := stSql + '   AT_INTIME varchar(14)   NULL, ';
  stSql := stSql + '   AT_LEAVETIME varchar(14)   NULL,';
  stSql := stSql + '   AT_BACKTIME varchar(14)   NULL,';
  stSql := stSql + '   AT_OUTTIME varchar(14)   NULL,';
  stSql := stSql + '   AT_INRESULT char(1)   NULL,';
  stSql := stSql + '   AT_OUTRESULT char(1)   NULL,';
  stSql := stSql + '   AT_INSERTTIME varchar(14)   NULL,';
  stSql := stSql + '   AT_INSERTOPERATOR varchar(10)   DEFAULT ''SYSTEM'' NULL,';
  stSql := stSql + '   AT_UPDATETIME varchar(14)   NULL,  ';
  stSql := stSql + '   AT_UPDATEOPERATOR varchar(10)    DEFAULT ''SYSTEM'' NULL,';
  stSql := stSql + '   AT_DEFAULTLATETIME varchar(4)   NULL, ';
  stSql := stSql + '   AT_HoliyDay char(1)   NULL,  ';
  stSql := stSql + '   AT_Night char(1)   NULL, ';
  stSql := stSql + '   AT_CONTENT varchar(50)   NULL,';
  stSql := stSql + '   AT_INCODE varchar(3)   NULL,';
  stSql := stSql + '   AT_OUTCODE varchar(3)   NULL,';
  stSql := stSql + '   AT_SUMMARY varchar(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AT_DATE ,  CO_COMPANYCODE , EM_CODE ) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATINCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ATINCODE  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL, ';
  stSql := stSql + '   AT_INCODE varchar(3)   NOT NULL,';
  stSql := stSql + '   AT_INNAME varchar(30)   NULL,';
  stSql := stSql + '   AT_INTYPE varchar(1)   NULL,';
  stSql := stSql + '   AT_INRESULT varchar(1)   NULL, ';
  stSql := stSql + '   AT_SYSTEM char(1)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AT_INCODE )';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATLISTEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ATLISTEVENT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' AC_DATE varchar(8) NOT NULL,'; //찍은날짜
  stSql := stSql + ' AC_TIME varchar(6) NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(3) NOT NULL,';
  stSql := stSql + ' EM_CODE varchar(100) NOT NULL,';
  stSql := stSql + ' AC_NODENO int NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' AT_ATCODE varchar(3) NOT NULL,';
  stSql := stSql + ' AT_ATTYPE varchar(1) NOT NULL,'; //'1:출근,2:퇴근,3:외출,4:복귀'
  stSql := stSql + ' CA_CARDNO varchar(10) NULL,';
  stSql := stSql + ' DO_DOORNO char(1) NULL,';
  stSql := stSql + ' AC_READERNO char(1) NULL,';
  stSql := stSql + ' AC_BUTTONNO char(1) NULL,';
  stSql := stSql + ' AT_DATE varchar(8) NULL,'; //근태날짜
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AC_DATE,';
  stSql := stSql + ' AC_TIME,CO_COMPANYCODE,EM_CODE,';
  stSql := stSql + ' AC_NODENO,AC_ECUID,AT_ATCODE,AT_ATTYPE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ATMONTHEXTRA: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ATMONTHEXTRA] (';
  stSql := stSql + '   [GROUP_CODE]varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   [AT_MONTH]varchar(6) NOT NULL,';
  stSql := stSql + '   [CO_COMPANYCODE]varchar(3) NOT NULL, ';
  stSql := stSql + '   [EM_CODE]varchar(20) NOT NULL,';
  stSql := stSql + '   [AT_EXTRANAME]varchar(50) NOT NULL,';
  stSql := stSql + '   [AT_EXTRAAMT]int NULL,';
  stSql := stSql + '   PRIMARY KEY CLUSTERED ([GROUP_CODE], [AT_MONTH], [CO_COMPANYCODE], [EM_CODE], [AT_EXTRANAME])';
  stSql := stSql + ' )';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATMONTHSUMMARY: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ATMONTHSUMMARY] ( ';
  stSql := stSql + '  [GROUP_CODE]varchar(10) DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '  [AT_MONTH]varchar(6) NOT NULL,';
  stSql := stSql + '  [CO_COMPANYCODE]varchar(3) NOT NULL,';
  stSql := stSql + '  [EM_CODE]varchar(20) NOT NULL,';
  stSql := stSql + '  [AT_STARTDATE]varchar(8) NULL,';
  stSql := stSql + '  [AT_ENDDATE]varchar(8) NULL,';
  stSql := stSql + '  [AT_TOTDAYCOUNT]int NULL,';
  stSql := stSql + '  [AT_HOLIDAYCOUNT]int NULL,';
  stSql := stSql + '  [AT_ATTENDDAYCOUNT]int NULL,';
  stSql := stSql + '  [AT_INCOUNT]int NULL,';
  stSql := stSql + '  [AT_JIKAGCOUNT]int NULL,';
  stSql := stSql + '  [AT_JOTAECOUNT]int NULL,';
  stSql := stSql + '  [AT_NONATCOUNT]int NULL,';
  stSql := stSql + '  [AT_PAYVACOUNT]int NULL,';
  stSql := stSql + '  [AT_NONPAYVACOUNT]int NULL,';
  stSql := stSql + '  [AT_LEAVECOUNT]int NULL,';
  stSql := stSql + '  [AT_BACKCOUNT]int NULL,';
  stSql := stSql + '  [AT_INFROMMM]int NULL,';
  stSql := stSql + '  [AT_WORKMM]int NULL,';
  stSql := stSql + '  [AT_EXTENDMM]int NULL,';
  stSql := stSql + '  [AT_NIGHTMM]int NULL,';
  stSql := stSql + '  [AT_HOLIDAYMM]int NULL,';
  stSql := stSql + '  [AT_REALATTIMEMM]int DEFAULT (0) NULL,';
  stSql := stSql + '  [AT_INFROMAMT]int NULL,';
  stSql := stSql + '  [AT_WORKAMT]int NULL,';
  stSql := stSql + '  [AT_EXTENDAMT]int NULL,';
  stSql := stSql + '  [AT_NIGHTAMT]int NULL,';
  stSql := stSql + '  [AT_HOLIDAYAMT]int NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AT_MONTH], [CO_COMPANYCODE], [EM_CODE])';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATOUTCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ATOUTCODE  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + '   AT_OUTCODE varchar(3)   NOT NULL,';
  stSql := stSql + '   AT_OUTNAME varchar(30)   NULL,';
  stSql := stSql + '   AT_OUTTYPE char(1)   NULL,';
  stSql := stSql + '   AT_OUTRESULT char(1)   NULL,';
  stSql := stSql + '   AT_SYSTEM char(1)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AT_OUTCODE )';
  stSql := stSql + ')';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATPASS: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ATPASS] (';
  stSql := stSql + '  [GROUP_CODE]varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [EM_PASS]varchar(20) NOT NULL,';
  stSql := stSql + '  [AT_REG]varchar(1) DEFAULT ''Y'' NULL,';
  stSql := stSql + '  [AT_LOAD]varchar(1) DEFAULT ''N'' NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [EM_PASS])';
  stSql := stSql + '  ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATVACATION: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ATVACATION] (';
  stSql := stSql + '  [GROUP_CODE]varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [VA_DATE]varchar(8) NOT NULL,';
  stSql := stSql + '  [CO_COMPANYCODE]varchar(3) NOT NULL,';
  stSql := stSql + '  [EM_CODE]varchar(20) NOT NULL,';
  stSql := stSql + '  [AT_VACODE]varchar(3) NULL,';
  stSql := stSql + '  [VA_ETC]varchar(100) NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [VA_DATE], [CO_COMPANYCODE], [EM_CODE]) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ATVACODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_ATVACODE] (';
  stSql := stSql + '  [GROUP_CODE]varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [AT_VACODE]varchar(3) NOT NULL,';
  stSql := stSql + '  [AT_VANAME]varchar(30) NULL, ';
  stSql := stSql + '  [AT_VATYPE]char(1) NULL, ';
  stSql := stSql + '  [AT_SYSTEM]char(1) NULL,';
  stSql := stSql + '  [AT_VAMARK]varchar(2)  NULL, ';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AT_VACODE]) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ATWORKTYPE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ATWORKTYPE (';
  stSql := stSql + ' AW_CODE varchar(3) NOT NULL,'; //근무자타입코드
  stSql := stSql + ' AW_NAME varchar(100),';        //근무자타입명칭
  stSql := stSql + ' AW_YESTERDAYTIME varchar(4),'; //어제날짜기준시간
  stSql := stSql + ' AW_SATURDAYTYPE char(1),';     //토요일근무타입 0:공휴일,1:반휴일,2:평일
  stSql := stSql + ' AW_DEVICETYPE char(1),';       //0:업데이트,1:카드리더,2:버튼방식
  stSql := stSql + ' AW_FIXATTYPE char(1),';        //0:정상,1:전직원 정상 출퇴근
  stSql := stSql + ' AW_NOTBACKUPTYPE char(1),';    //0:미복귀시조퇴처리,1:미복귀시정상퇴근
  stSql := stSql + ' AW_ATSTARTBUTTON char(1),';    //출근조작버튼
  stSql := stSql + ' AW_ATOFFBUTTON char(1),';      //퇴근조작버튼
  stSql := stSql + ' AW_INOUTDEVICETYPE char(1),';  //외출-0:사용안함,1:리더,2:버튼
  stSql := stSql + ' AW_WORKOUTBUTTON char(1),';    //외출조작버튼
  stSql := stSql + ' AW_WORKINBUTTON char(1),';     //복귀조작버튼
  stSql := stSql + ' PRIMARY KEY (AW_CODE) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_BASEPAY: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_BASEPAY] (';
  stSql := stSql + '  [GROUP_CODE]varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [CO_COMPANYCODE]varchar(3) NOT NULL,';
  stSql := stSql + '  [EM_CODE]varchar(20) NOT NULL,';
  stSql := stSql + '  [PA_CODE]varchar(3) NOT NULL,';
  stSql := stSql + '  [PA_GUBUN]varchar(1) NULL,';
  stSql := stSql + '  [PA_AMT]varchar(20) NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [CO_COMPANYCODE], [EM_CODE], [PA_CODE])';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_CARD: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_CARD  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '   CA_CARDNO varchar(20)   NOT NULL, ';
  stSql := stSql + '   CA_GUBUN char(1)   DEFAULT ''1'' NULL, ';
  stSql := stSql + '   CA_CARDTYPE char(1)   NULL,';
  stSql := stSql + '   EM_CODE varchar(20)   NULL,';
  stSql := stSql + '   CO_COMPANYCODE varchar(3)   NULL, ';
  stSql := stSql + '   CA_LASTUSE varchar(8) NULL, ';
  stSql := stSql + '   CA_UPDATETIME varchar(14)   NULL,  ';
  stSql := stSql + '   CA_UPDATEOPERATOR varchar(10)   NULL, ';
  stSql := stSql + '   CA_STATUS varchar(1)   DEFAULT ''Y'' NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  CA_CARDNO ) ';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_CARDGROUPCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDGROUPCODE(';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CA_GROUP varchar(50) NOT NULL,';
  stSql := stSql + ' CA_GROUPNAME nvarchar(100),';
  stSql := stSql + ' CA_DEEPSEQ integer,';
  stSql := stSql + ' CA_CODEUSE char(1),';
  stSql := stSql + ' CA_VIEWSEQ integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CA_GROUP) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','COUNTER',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'image','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varbinary(MAX)','BLOB',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_CARDTYPE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDTYPE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CT_CODE varchar(1) NOT NULL,';
  stSql := stSql + ' CT_NAME varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, CT_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_CLIENTSOCK: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CLIENTSOCK (';
  stSql := stSql + ' SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' CSDATA varchar(1024),';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_COMPANY: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_COMPANY  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   CO_COMPANYCODE varchar(3)   DEFAULT ''000'' NOT NULL,';
  stSql := stSql + '   CO_JIJUMCODE varchar(3)   DEFAULT ''000'' NOT NULL,';
  stSql := stSql + '   CO_DEPARTCODE varchar(3)   DEFAULT ''000'' NOT NULL,';
  stSql := stSql + '   CO_NAME varchar(30)   NULL,';
  stSql := stSql + '   CO_GUBUN char(1)   NULL, ';
  stSql := stSql + '   CO_CHARGE varchar(20)   NULL,';
  stSql := stSql + '   CO_TELNUM varchar(14)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  CO_COMPANYCODE , CO_JIJUMCODE ,  CO_DEPARTCODE )';
  stSql := stSql + ')';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_COMPANY_PrimaryKey: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_COMPANY ADD CONSTRAINT TB_COMPANY_PKIndex1 PRIMARY KEY ( GROUP_CODE,CO_COMPANYCODE,CO_JIJUMCODE,CO_DEPARTCODE ) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_CONFIG: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_CONFIG  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   CO_CONFIGGROUP varchar(10)   NOT NULL,';
  stSql := stSql + '   CO_CONFIGCODE varchar(10)   NOT NULL, ';
  stSql := stSql + '   CO_CONFIGVALUE varchar(100)   NULL,';
  stSql := stSql + '   CO_CONFIGDETAIL varchar(50)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  CO_CONFIGGROUP ,  CO_CONFIGCODE )';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_CURRENTDAEMON: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_CURRENTDAEMON  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   CU_STATECODE varchar(10)   NOT NULL,';
  stSql := stSql + '   CU_STATEVALUE varchar(20)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  CU_STATECODE )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_DAEMONMULTI: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DAEMONMULTI (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' DM_GUBUN integer NOT NULL,';
  stSql := stSql + ' DM_SERVERIP varchar(30) NULL,';
  stSql := stSql + ' DM_SERVERPORT varchar(30) NULL,';
  stSql := stSql + ' DM_ATPORT varchar(30) NULL,';
  stSql := stSql + ' DM_FDPORT varchar(30) NULL,';
  stSql := stSql + ' DM_FTPPORT varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,DM_GUBUN) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_DATASHARE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_DATASHARE  (';
  stSql := stSql + '   PR_PROGRAMID varchar(10)   NOT NULL,';
  stSql := stSql + '   GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + '   DA_DETAIL varchar(30)   NULL,';
  stSql := stSql + '   PR_GROUPCODE varchar(10)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( PR_PROGRAMID ,  GROUP_CODE )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_DEVICECARDGROUPCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DEVICECARDGROUPCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' DG_CODE varchar(10) NOT NULL,';
  stSql := stSql + ' DG_NAME varchar(100),';
  stSql := stSql + ' DG_APPLY varchar(1),';
  stSql := stSql + ' DG_USE varchar(1),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,DG_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_DEVICECARDNO: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_DEVICECARDNO  (  ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL, ';
  stSql := stSql + '   CA_CARDNO varchar(20)   NOT NULL,';
  stSql := stSql + '   DE_DOOR1 char(1)   NULL,';
  stSql := stSql + '   DE_DOOR2 char(1)   NULL,';
  stSql := stSql + '   DE_USEACCESS char(1)   NULL, ';
  stSql := stSql + '   DE_USEALARM char(1)   NULL,';
  stSql := stSql + '   DE_TIMECODE char(1)   NULL,';
  stSql := stSql + '   DE_PERMIT char(1)   NULL,';
  stSql := stSql + '   DE_RCVACK char(1)   NULL,';
  stSql := stSql + '   DE_UPDATETIME varchar(14)   NULL, ';
  stSql := stSql + '   DE_UPDATEOPERATOR varchar(10)   NULL,';
  stSql := stSql + '   AC_MCUID varchar(7)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AC_NODENO ,  AC_ECUID ,  CA_CARDNO )';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_DEVICECARDNOACKINDEX: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD CA_CARDTYPE varchar(1) NULL ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_DEVICECARDNOEMPLOYEE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE TB_DEVICECARDNOEMPLOYEE( ';
	stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
	stSql := stSql + ' CO_COMPANYCODE varchar(3) NOT NULL,';
	stSql := stSql + ' EM_CODE varchar(50) NOT NULL,';
	stSql := stSql + ' AC_NODENO integer NOT NULL, ';
	stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
	stSql := stSql + ' DE_DOOR1 char(1) NULL,';
	stSql := stSql + ' DE_DOOR2 char(1) NULL,';
	stSql := stSql + ' DE_DOOR3 char(1) NULL,';
	stSql := stSql + ' DE_DOOR4 char(1) NULL,';
	stSql := stSql + ' DE_DOOR5 char(1) NULL,';
	stSql := stSql + ' DE_DOOR6 char(1) NULL,';
	stSql := stSql + ' DE_DOOR7 char(1) NULL,';
	stSql := stSql + ' DE_DOOR8 char(1) NULL,';
	stSql := stSql + ' DE_USEACCESS char(1) NULL,';
	stSql := stSql + ' DE_USEALARM char(1) NULL,';
	stSql := stSql + ' DE_TIMECODE char(1) NULL,';
	stSql := stSql + ' DE_PERMIT char(1) NULL,';
	stSql := stSql + ' DE_RCVACK char(1) NULL,';
	stSql := stSql + ' DE_UPDATETIME varchar(14) NULL,';
	stSql := stSql + ' DE_UPDATEOPERATOR varchar(10) NULL,';
	stSql := stSql + ' AC_MCUID varchar(7) NULL,';
	stSql := stSql + ' DE_ALARM0 varchar(1) NULL,';
	stSql := stSql + ' DE_ALARM1 varchar(1) NULL,';
	stSql := stSql + ' DE_ALARM2 varchar(1) NULL,';
	stSql := stSql + ' DE_ALARM3 varchar(1) NULL,';
	stSql := stSql + ' DE_ALARM4 varchar(1) NULL,';
	stSql := stSql + ' DE_ALARM5 varchar(1) NULL,';
	stSql := stSql + ' DE_ALARM6 varchar(1) NULL,';
	stSql := stSql + ' DE_ALARM7 varchar(1) NULL,';
	stSql := stSql + ' DE_ALARM8 varchar(1) NULL, ';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,CO_COMPANYCODE,EM_CODE,AC_NODENO,AC_ECUID) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_DEVICECARDNOGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_DEVICECARDNOGROUP  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   CA_GROUP varchar(50)   NOT NULL, ';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL,';
  stSql := stSql + '   DE_DOOR1 char(1)   NULL,';
  stSql := stSql + '   DE_DOOR2 char(1)   NULL,';
  stSql := stSql + '   DE_USEACCESS char(1)   NULL,';
  stSql := stSql + '   DE_USEALARM char(1)   NULL,';
  stSql := stSql + '   DE_TIMECODE char(1)   NULL,';
  stSql := stSql + '   DE_PERMIT char(1)   NULL, ';
  stSql := stSql + '   DE_RCVACK char(1)   NULL,';
  stSql := stSql + '   DE_UPDATETIME varchar(14)   NULL,';
  stSql := stSql + '   DE_UPDATEOPERATOR varchar(10)   NULL,';
  stSql := stSql + '   AC_MCUID varchar(7)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  CA_GROUP ,  AC_NODENO ,  AC_ECUID )';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_DEVICECARDNO_HIS: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_DEVICECARDNO_HIS  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '   CA_CARDNO varchar(20)   NOT NULL, ';
  stSql := stSql + '   DE_DOOR1 char(1)   NULL, ';
  stSql := stSql + '   DE_DOOR2 char(1)   NULL,';
  stSql := stSql + '   DE_USEACCESS char(1)   NULL,';
  stSql := stSql + '   DE_USEALARM char(1)   NULL,';
  stSql := stSql + '   DE_TIMECODE char(1)   NULL,';
  stSql := stSql + '   DE_PERMIT char(1)   NULL,';
  stSql := stSql + '   DE_RCVACK char(1)   NULL, ';
  stSql := stSql + '   DE_UPDATETIME varchar(14)   NULL, ';
  stSql := stSql + '   DE_UPDATEOPERATOR varchar(10)   NULL, ';
  stSql := stSql + '   AC_MCUID varchar(7)   NOT NULL, ';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   SEQ int NOT NULL,';
  stSql := stSql + '   HIS_OPER varchar(10)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( SEQ ) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_DEVICECARDNO_PROMISE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_DEVICECARDNO_PROMISE  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   PR_NAME varchar(50)   NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL,';
  stSql := stSql + '   DE_DOOR1 char(1)   NULL,';
  stSql := stSql + '   DE_DOOR2 char(1)   NULL,';
  stSql := stSql + '   DE_USEACCESS char(1)   NULL,';
  stSql := stSql + '   DE_USEALARM char(1)   NULL,';
  stSql := stSql + '   DE_TIMECODE char(1)   NULL,';
  stSql := stSql + '   DE_PERMIT char(1)   NULL,';
  stSql := stSql + '   DE_RCVACK char(1)   NULL,';
  stSql := stSql + '   DE_UPDATETIME varchar(14)   NULL,';
  stSql := stSql + '   DE_UPDATEOPERATOR varchar(10)   NULL,';
  stSql := stSql + '   AC_MCUID varchar(7)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  PR_NAME , AC_NODENO , AC_ECUID ) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_DEVICESCHEDULE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_DEVICESCHEDULE  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL, ';
  stSql := stSql + '   DO_DOORNO char(1)   NOT NULL, ';
  stSql := stSql + '   DE_DAYCODE char(1)   NOT NULL,';
  stSql := stSql + '   DE_CELL1TIME varchar(4)   NULL,';
  stSql := stSql + '   DE_CELL1MODE char(1)   NULL,';
  stSql := stSql + '   DE_CELL2TIME varchar(4)   NULL,';
  stSql := stSql + '   DE_CELL2MODE char(1)   NULL, ';
  stSql := stSql + '   DE_CELL3TIME varchar(4)   NULL, ';
  stSql := stSql + '   DE_CELL3MODE char(1)   NULL,';
  stSql := stSql + '   DE_CELL4TIME varchar(4)   NULL, ';
  stSql := stSql + '   DE_CELL4MODE char(1)   NULL, ';
  stSql := stSql + '   DE_CELL5TIME varchar(4)   NULL,';
  stSql := stSql + '   DE_CELL5MODE char(1)   NULL,';
  stSql := stSql + '   DE_UPDATETIME varchar(14)   NULL, ';
  stSql := stSql + '   DE_UPDATEOPERATOR varchar(10)   NULL,';
  stSql := stSql + '   DE_RCVACK char(1)   NULL,';
  stSql := stSql + '   AC_MCUID varchar(7)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AC_NODENO ,  AC_ECUID ,  DO_DOORNO ,  DE_DAYCODE )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_DEVICESETTINGINFO: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DEVICESETTINGINFO (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_NODENO integer NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DS_COMMAND varchar(30) NOT NULL,';
  stSql := stSql + ' DS_RCVACK varchar(1) DEFAULT ''N'' NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,DS_COMMAND) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_DEVICETYPE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_DEVICETYPE  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   DE_DEVICETYPE varchar(2)   NOT NULL,';
  stSql := stSql + '   DE_TYPENAME varchar(30)   NULL, ';
  stSql := stSql + '   DE_ACCESSGROUP char(1)   NULL,';
  stSql := stSql + '   DE_ATGROUP char(1)   NULL,';
  stSql := stSql + '   DE_ALARMGROUP char(1)   NULL,';
  stSql := stSql + '   DE_FOODGROUP char(1)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  DE_DEVICETYPE )';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_DOOR: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_DOOR  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL, ';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL,';
  stSql := stSql + '   DO_DOORNO char(1)   NOT NULL, ';
  stSql := stSql + '   DO_DOORNONAME varchar(30)   NULL, ';
  stSql := stSql + '   DO_LASTMODE char(1)   NULL,';
  stSql := stSql + '   AC_MCUID varchar(7)   NULL,';
  stSql := stSql + '   DO_VIEWSEQ int NULL, ';
  stSql := stSql + '   DO_TOTWIDTH int NULL, ';
  stSql := stSql + '   DO_TOTHEIGHT int NULL,';
  stSql := stSql + '   DO_CURX int NULL, ';
  stSql := stSql + '   DO_CURY int NULL, ';
  stSql := stSql + '   DO_LOCATEUSE char(1)   NULL,';
  stSql := stSql + '   LO_DONGCODE varchar(3)   NULL, ';
  stSql := stSql + '   LO_FLOORCODE varchar(3)   NULL, ';
  stSql := stSql + '   LO_AREACODE varchar(3)   NULL,';
  stSql := stSql + '   FPMS_ID int NULL,';
  stSql := stSql + '   DO_LOCALRELAY varchar(1)   NULL,';
  stSql := stSql + '   DO_STATEREVERSE varchar(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '   Relay_Send varchar(1)   DEFAULT ''N'' NULL, ';
  stSql := stSql + '   DO_DOORTYPE varchar(7)   NULL,';
  stSql := stSql + '   DO_SCHUSE varchar(1)   NULL, ';
  stSql := stSql + '   DO_CONTROLTIME int NULL,  ';
  stSql := stSql + '   DO_CARDREADERTYPE varchar(1)   NULL, ';
  stSql := stSql + '   DO_MODE varchar(1)   NULL, ';
  stSql := stSql + '   DO_FIRE varchar(1)   NULL, ';
  stSql := stSql + '   DO_LASTSTATE varchar(1)   NULL, ';
  stSql := stSql + '   DO_LASTPOSI varchar(1)   NULL,';
  stSql := stSql + '   SEND_ACK varchar(1)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AC_NODENO ,  AC_ECUID ,  DO_DOORNO ) ';
  stSql := stSql + ')  ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_DOORGUBUN: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOORGUBUN (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' DG_CODE varchar(3) NOT NULL,';
  stSql := stSql + ' DG_NAME varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,DG_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_DOORPOSICODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOORPOSICODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_DOORPOSI char(1) NOT NULL,';
  stSql := stSql + ' AC_DOORPOSINAME varchar(50),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_DOORPOSI) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_EMPHIS: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPHIS (';
  if G_nDBTYPE = MSSQL then stSql := stSql + ' SEQ int IDENTITY NOT NULL,'
  else if G_nDBTYPE = PostGresql then stSql := stSql + ' SEQ serial NOT NULL ,'
  else if G_nDBTYPE = FireBird then stSql := stSql + ' SEQ integer NOT NULL ,'
  else if G_nDBTYPE = MDB then stSql := stSql + ' SEQ COUNTER NOT NULL,';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(3) NOT NULL,';
  stSql := stSql + ' EM_CODE varchar(20) NULL,';
  stSql := stSql + ' FDMS_ID INTEGER NULL,';
  stSql := stSql + ' MODE char(1) NULL,';
  stSql := stSql + ' SEND_STATUS char(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

  if G_nDBTYPE = FireBird then
  begin
    stSql := 'CREATE SEQUENCE GEN_TB_EMPHIS_ID ';
    dmZeronEventDataBase.ProcessExecSQL(stSql);

    stSql := 'CREATE OR ALTER TRIGGER TB_EMPHIS_BI FOR TB_EMPHIS ';
    stSql := stSql + ' ACTIVE BEFORE INSERT POSITION 0 ';
    stSql := stSql + ' AS ';
    stSql := stSql + ' BEGIN ';
    stSql := stSql + '   IF (NEW.SEQ IS NULL) THEN ';
    stSql := stSql + '     NEW.SEQ = GEN_ID(GEN_TB_EMPHIS_ID,1); ';
    stSql := stSql + ' END ';
    dmZeronEventDataBase.ProcessExecSQL(stSql);
  end;

end;

function TdmZeronEventDBCreate.CreateTB_EMPLOYEE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_EMPLOYEE  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   EM_CODE varchar(20)   NOT NULL,';
  stSql := stSql + '   CO_COMPANYCODE varchar(3)   NOT NULL,';
  stSql := stSql + '   CO_JIJUMCODE varchar(3)   NULL,';
  stSql := stSql + '   CO_DEPARTCODE varchar(3)   NULL, ';
  stSql := stSql + '   PO_POSICODE varchar(3)   NULL,';
  stSql := stSql + '   EM_NAME varchar(20)   NULL,';
  stSql := stSql + '   EM_COPHONE varchar(14)   NULL,';
  stSql := stSql + '   EM_HOMEPHONE varchar(14)   NULL,';
  stSql := stSql + '   EM_HANDPHONE varchar(14)   NULL,';
  stSql := stSql + '   ZI_ZIPCODE varchar(7)   NULL, ';
  stSql := stSql + '   EM_ADDR1 varchar(50)   NULL,';
  stSql := stSql + '   EM_ADDR2 varchar(50)   NULL,';
  stSql := stSql + '   EM_JOINDATE varchar(8)   NULL,';
  stSql := stSql + '   EM_RETIREDATE varchar(8)   NULL,';
  stSql := stSql + '   EM_IMAGE varchar(100) NULL,';
  stSql := stSql + '   EM_PASS varchar(20)   NULL, ';
  stSql := stSql + '   AT_ATCODE varchar(3)   NULL,';
  stSql := stSql + '   EM_UPDATETIME varchar(14)   NULL,';
  stSql := stSql + '   EM_UPDATEOPERATOR varchar(10)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  EM_CODE ,  CO_COMPANYCODE )';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_EMPLOYEECHANGE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEECHANGE (';
  stSql := stSql + ' SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(3) NOT NULL,';
  stSql := stSql + ' EM_CODE varchar(50) NULL,';
  stSql := stSql + ' CA_CARDNO varchar(50) NULL,';
  stSql := stSql + ' EC_CLIENTIP varchar(50) NULL,';
  stSql := stSql + ' EC_OPERATOR varchar(50) NULL,';
  stSql := stSql + ' EC_INSERTTIME varchar(17) NULL,';
  stSql := stSql + ' EC_FORMNAME varchar(50) NULL,';
  stSql := stSql + ' EC_WORKTYPE char(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_EMPLOYEEEXPIRECHANGE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPLOYEEEXPIRECHANGE (';
  if G_nDBTYPE = PostGresql then stSql := stSql + ' SEQ serial NOT NULL,'
  else if G_nDBTYPE = MSSQL then stSql := stSql + ' SEQ int IDENTITY NOT NULL,'
  else if G_nDBTYPE = MDB then stSql := stSql + ' SEQ COUNTER NOT NULL,'
  else stSql := stSql + ' SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(3) NOT NULL,';
  stSql := stSql + ' EM_CODE varchar(50) NULL,';
  stSql := stSql + ' EM_OLDEXPIRE varchar(8) NULL,';
  stSql := stSql + ' EM_NEWEXPIRE varchar(8) NULL,';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_EMPLOYEEEXPIRE_Trigger: Boolean;
var
  stSql : string;
begin
  if G_nDBTYPE = POSTGRESQL then
  begin

    stSql := 'CREATE OR REPLACE FUNCTION fnc_TB_EMPLOYEEEXPIREChange() ';
    stSql := stSql + '   RETURNS trigger AS ';
    stSql := stSql + ' $$ ';
    stSql := stSql + ' DECLARE ';
    stSql := stSql + ' BEGIN ';
    stSql := stSql + '  IF NEW.em_retiredate <> OLD.em_retiredate THEN ';
    stSql := stSql + ' 	  INSERT INTO tb_employeeexpirechange(co_companycode,em_code,em_oldexpire,em_newexpire) ';
    stSql := stSql + ' 	  VALUES(NEW.co_companycode,NEW.em_code,OLD.em_retiredate,NEW.em_retiredate); ';
    stSql := stSql + '    IF NEW.em_expiruse is NULL or NEW.em_expiruse = ''Y'' THEN ';
    stSql := stSql + ' 	    NEW.em_expiruse := ''N''; ';
    stSql := stSql + '    END IF; ';
    stSql := stSql + '  END IF; ';
    stSql := stSql + ' ';
    stSql := stSql + '  RETURN NEW; ';
    stSql := stSql + ' END ';
    stSql := stSql + ' $$ LANGUAGE ''plpgsql''; ';
    result := dmZeronEventDataBase.ProcessExecSQL(stSql);


    stSql := 'CREATE TRIGGER trg_TB_EMPLOYEEEXPIREChange';
    stSql := stSql + '   BEFORE UPDATE ';
    stSql := stSql + '   ON tb_employee ';
    stSql := stSql + '   FOR EACH ROW ';
    stSql := stSql + '   EXECUTE PROCEDURE fnc_TB_EMPLOYEEEXPIREChange(); ';
    result := dmZeronEventDataBase.ProcessExecSQL(stSql);

  end else if G_nDBTYPE = MSSQL then
  begin
    stSql := 'Create Trigger trg_TB_EMPLOYEEEXPIRECHANGE_Update ON TB_EMPLOYEE For Update  ';
    stSql := ' AS  ';
    stSql := ' 	BEGIN  ';
    stSql := ' 		declare @co_companycode varchar(50)  ';
    stSql := ' 		declare @em_code varchar(50) ';
    stSql := ' 		declare @em_oldretiredate varchar(8) ';
    stSql := ' 		declare @em_newretiredate varchar(8) ';
    stSql := '    ';
    stSql := ' 		if UPDATE(EM_RETIREDATE)  ';
    stSql := ' 		Begin ';
    stSql := ' 			select @co_companycode = co_companycode, @em_code = em_code,@em_oldretiredate = em_retiredate from deleted ';
    stSql := ' 			select @em_newretiredate = em_retiredate from inserted ';
    stSql := ' 			Insert into TB_EMPLOYEEEXPIRECHANGE(CO_COMPANYCODE,EM_CODE,EM_OLDEXPIRE,EM_NEWEXPIRE) values (@co_companycode,@em_code,@em_oldretiredate,@em_newretiredate) ';
    stSql := ' 			update TB_EMPLOYEE set EM_EXPIRUSE = ''N'' where GROUP_CODE = @groupcode and CO_COMPANYCODE = @co_companycode and em_code = @em_code ';
    stSql := ' 		End  ';
    stSql := ' 	END ';

    result := dmZeronEventDataBase.ProcessExecSQL(stSql);

  end;
end;

function TdmZeronEventDBCreate.CreateTB_FACECOP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FACECOP (';
  stSql := stSql + ' SEQ serial NOT NULL,';
  stSql := stSql + ' FA_EMCODE varchar(20) DEFAULT ''0'' NOT NULL,';
  stSql := stSql + ' FA_REGTYPE varchar(1) DEFAULT ''1'' NOT NULL,';
  stSql := stSql + ' FA_CARDNO  varchar(16) NULL,';
  stSql := stSql + ' FA_EMNAME  varchar(100) NULL,';
  stSql := stSql + ' FA_JIJUMNAME  varchar(100) NULL,';
  stSql := stSql + ' FA_DEPARTNAME  varchar(100) NULL,';
  stSql := stSql + ' FA_DUTYNAME  varchar(100) NULL,';
  stSql := stSql + ' FA_HANDPHONE  varchar(14) NULL,';
  stSql := stSql + ' FA_PHONE  varchar(14) NULL,';
  stSql := stSql + ' FA_JOINDATE  varchar(8) NULL,';
  stSql := stSql + ' FA_UPDATE  varchar(1) NULL,';
  if G_nDBTYPE = MDB then stSql := stSql + ' FA_INSERTTIME  DATETIME NOT NULL,'
  else if G_nDBTYPE = MSSQL then stSql := stSql + ' FA_INSERTTIME  DATETIME DEFAULT getdate() NOT NULL,'
  else if G_nDBTYPE = POSTGRESQL then stSql := stSql + ' FA_INSERTTIME  TIMESTAMP DEFAULT NOW() NOT NULL,'
  else if G_nDBTYPE = FIREBIRD then stSql := stSql + ' FA_INSERTTIME  TIMESTAMP DEFAULT NOW() NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_FIREGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FIREGROUP (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' AC_NODENO integer NOT NULL,';
  stSql := stSql + ' FG_CODE varchar(3) DEFAULT ''001'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AC_NODENO) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_FIREGUBUN: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FIREGUBUN (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' FG_CODE varchar(3) NOT NULL,';
  stSql := stSql + ' FG_NAME varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, FG_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_FOOD: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_FOOD  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL,';
  stSql := stSql + '   FO_DOORNO char(1)   NOT NULL,';
  stSql := stSql + '   FO_NAME varchar(30)   NULL, ';
  stSql := stSql + '   LO_DONGCODE varchar(3)   NULL, ';
  stSql := stSql + '   LO_FLOORCODE varchar(3)   NULL,';
  stSql := stSql + '   LO_AREACODE varchar(3)   NULL, ';
  stSql := stSql + '   FO_TOTWIDTH int NULL, ';
  stSql := stSql + '   FO_TOTHEIGHT int NULL,';
  stSql := stSql + '   FO_CURX int NULL, ';
  stSql := stSql + '   FO_CURY int NULL, ';
  stSql := stSql + '   FO_LOCATEUSE char(1)   NULL, ';
  stSql := stSql + '   FO_AMTPER int DEFAULT 100 NULL, ';
  stSql := stSql + '   FO_BREAKAMT int DEFAULT (0) NULL,';
  stSql := stSql + '   FO_LUNCHAMT int DEFAULT (0) NULL,';
  stSql := stSql + '   FO_EVENINGAMT int DEFAULT (0) NULL,';
  stSql := stSql + '   FO_MIDNIGHTAMT int DEFAULT (0) NULL, ';
  stSql := stSql + '   FO_CARDREADERTYPE varchar(1)   NULL, ';
  stSql := stSql + '   AC_MCUID varchar(7)   NULL,';
  stSql := stSql + '   SEND_ACK varchar(1)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AC_NODENO ,  AC_ECUID ,  FO_DOORNO )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_FOODCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_FOODCODE  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   FO_FOODCODE varchar(3)   NOT NULL, ';
  stSql := stSql + '   FO_CODENAME varchar(30)   NULL, ';
  stSql := stSql + '   FO_STARTTIME varchar(4)   NULL,';
  stSql := stSql + '   FO_ENDTIME varchar(4)   NULL, ';
  stSql := stSql + '   FO_AMT int DEFAULT 5000 NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  FO_FOODCODE ) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_FOODCodeCount: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FOODCODECount (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' FC_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' FO_FOODCODE varchar(3) NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(10) NOT NULL,';
  stSql := stSql + ' EM_CODE varchar(50) NOT NULL,';
  stSql := stSql + ' FD_COUNT integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FC_DATE,FO_FOODCODE,CO_COMPANYCODE,EM_CODE) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_FOODDayCount: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FOODDayCount (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' FD_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(10) NOT NULL,';
  stSql := stSql + ' EM_CODE varchar(50) NOT NULL,';
  stSql := stSql + ' FD_COUNT integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FD_DATE,CO_COMPANYCODE,EM_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_FOODEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_FOODEVENT  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   FO_DATE varchar(8)   NOT NULL,';
  stSql := stSql + '   FO_TIME varchar(6)   NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   FO_DOORNO char(1)   NOT NULL, ';
  stSql := stSql + '   CO_COMPANYCODE varchar(3)   NOT NULL, ';
  stSql := stSql + '   EM_CODE varchar(20)   NOT NULL, ';
  stSql := stSql + '   FO_FOODCODE varchar(3)   NULL, ';
  stSql := stSql + '   FO_PERMIT char(1)   NULL, ';
  stSql := stSql + '   FO_INSERTTIME varchar(14)   NULL, ';
  stSql := stSql + '   FO_INSERTOPERATOR varchar(10)   NULL,';
  stSql := stSql + '   FO_UPDATETIME varchar(14)   NULL,';
  stSql := stSql + '   FO_UPDATEOPERATOR varchar(10)   NULL, ';
  stSql := stSql + '   AC_MCUID varchar(7)   NULL, ';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL,';
  stSql := stSql + '   FO_CONTENT varchar(50)   NULL,';
  stSql := stSql + '   FO_FOODAMT int DEFAULT 0 NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  FO_DATE ,  FO_TIME ,  AC_NODENO , AC_ECUID, FO_DOORNO ,  CO_COMPANYCODE ,EM_CODE  ) ';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_FOODGRADE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_FOODGRADE] (';
  stSql := stSql + '  [GROUP_CODE]varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [CO_COMPANYCODE]varchar(3)   NOT NULL,';
  stSql := stSql + '  [EM_CODE]varchar(20)   NOT NULL,';
  stSql := stSql + '  [FO_BREAKFIRST]char(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  [FO_LUNCH]char(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  [FO_DINNER]char(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  [FO_MIDNIGHT]char(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  [FO_WEBREAKFIRST]varchar(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  [FO_WELUNCH]varchar(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  [FO_WEDINNER]varchar(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  [FO_WEMIDNIGHT]varchar(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  [FO_HOBREAKFIRST]varchar(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  [FO_HOLUNCH]varchar(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  [FO_HODINNER]varchar(1)   DEFAULT ''N'' NULL, ';
  stSql := stSql + '  [FO_HOMIDNIGHT]varchar(1)   DEFAULT ''N'' NULL, ';
  stSql := stSql + '  [FO_MONEY]varchar(1)   DEFAULT ''N'' NULL, ';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [CO_COMPANYCODE], [EM_CODE])';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_FOODSemesterCount: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FOODSemesterCount (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' FS_YEAR varchar(4) NOT NULL,';
  stSql := stSql + ' SE_CODE integer NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(10) NOT NULL,';
  stSql := stSql + ' EM_CODE varchar(50) NOT NULL,';
  stSql := stSql + ' FS_COUNT integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FS_YEAR,SE_CODE,CO_COMPANYCODE,EM_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_FOODWeekCount: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FOODWeekCount (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' FW_YEAR varchar(8) NOT NULL,';
  stSql := stSql + ' FW_WEEKDAY integer NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(10) NOT NULL,';
  stSql := stSql + ' EM_CODE varchar(50) NOT NULL,';
  stSql := stSql + ' FW_COUNT integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,FW_YEAR,FW_WEEKDAY,CO_COMPANYCODE,EM_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_FormName: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FORMNAME (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' FM_CODE varchar(3) NOT NULL,';
  stSql := stSql + ' FM_NAME varchar(30) NULL,';
  stSql := stSql + ' FM_USE varchar(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, FM_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_FTPLIST: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FTPLIST (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_NODENO INTEGER NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' FL_FILENAME varchar(50) NOT NULL,';
  stSql := stSql + ' FL_SENDPROGRASS varchar(3) NULL,';
  stSql := stSql + ' FL_SENDSTATE varchar(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_GRADE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_GRADE  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   GR_GRADECODE varchar(3)   NOT NULL, ';
  stSql := stSql + '   GR_GARDENAME varchar(30)   NULL, ';
  stSql := stSql + '   GR_UPDATETIME varchar(14)   NULL, ';
  stSql := stSql + '   GR_UPDATEOPERATOR varchar(10)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  GR_GRADECODE ) ';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_GRADEPROGRAM: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_GRADEPROGRAM  (';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   GR_GRADECODE varchar(3)   NOT NULL,';
  stSql := stSql + '   PR_PROGRAMID varchar(10)   DEFAULT ''0000000000'' NOT NULL, ';
  stSql := stSql + '   PR_GROUPCODE varchar(10)   NULL,';
  stSql := stSql + '   GR_GUBUN char(1)   NULL,';
  stSql := stSql + '   AC_UPDATEDATE varchar(14)   NULL, ';
  stSql := stSql + '   AC_UPDATEOPERATOR varchar(10)   NULL,';
  stSql := stSql + '   GR_UPDATE char(1)   DEFAULT ''Y'' NULL,';
  stSql := stSql + '   GR_INSERT char(1)   DEFAULT ''Y'' NULL,';
  stSql := stSql + '   GR_DELETE char(1)   DEFAULT ''Y'' NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  GR_GRADECODE ,  PR_PROGRAMID )';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_HOLIDAY: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_HOLIDAY  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   HO_DAY varchar(8)   NOT NULL,';
  stSql := stSql + '   HO_DESC varchar(50)   NULL, ';
  stSql := stSql + '   HO_SEND char(1)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  HO_DAY ) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_INOUTCOUNT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_INOUTCOUNT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' IO_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' AC_NODENO INTEGER NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' DO_DOORNO varchar(1) NOT NULL,';
  stSql := stSql + ' IO_COUNT INTEGER DEFAULT 0 NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,IO_DATE,AC_NODENO,AC_ECUID,DO_DOORNO) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_INOUTGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_INOUTGROUP (';
  stSql := stSql + ' GROUP_CODE VARCHAR(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' IO_GROUPNAME VARCHAR(30) NOT NULL,';
  stSql := stSql + ' AC_NODENO INTEGER NOT NULL,';
  stSql := stSql + ' AC_ECUID VARCHAR(2) NOT NULL,';
  stSql := stSql + ' DO_DOORNO VARCHAR(1) NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,IO_GROUPNAME,AC_NODENO,AC_ECUID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_INOUTGROUPLIST: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_INOUTGROUPLIST (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' IO_GROUPCODE varchar(3) NOT NULL,';
  stSql := stSql + ' CA_CARDNO varchar(20) NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,IO_GROUPCODE,CA_CARDNO) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_INOUTREADERGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_INOUTREADERGROUP (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' IO_GROUPCODE varchar(3) NOT NULL,';
  stSql := stSql + ' IO_GROUPNAME varchar(100) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,IO_GROUPCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_JAVARASCHEDULE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_JAVARASCHEDULE (';
  stSql := stSql + ' GROUP_CODE VARCHAR(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' AC_NODENO INTEGER NOT NULL,';
  stSql := stSql + ' AC_ECUID VARCHAR(2) NOT NULL,';
  stSql := stSql + ' DO_DOORNO VARCHAR(2) NOT NULL,';
  stSql := stSql + ' SchUse VARCHAR(1) DEFAULT ''0'' NULL,';
  stSql := stSql + ' WeekStartTime varchar(4),';
  stSql := stSql + ' WeekEndTime varchar(4),';
  stSql := stSql + ' SaturdayStartTime varchar(4),';
  stSql := stSql + ' SaturdayEndTime varchar(4),';
  stSql := stSql + ' SundayStartTime varchar(4),';
  stSql := stSql + ' SundayEndTime varchar(4),';
  stSql := stSql + ' HolidayStartTime varchar(4),';
  stSql := stSql + ' HolidayEndTime varchar(4),';
  stSql := stSql + ' SendState VARCHAR(1) DEFAULT ''N'' NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,DO_DOORNO) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_KTCARDISSUE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_KTCARDISSUE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_CODE varchar(20) NOT NULL,';
  stSql := stSql + ' CARD_SEQ Integer NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,EM_CODE) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_KTTMAPPINGCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_KTTMAPPINGCODE (';
  stSql := stSql + ' AL_ALARMDEVICETYPECODE varchar(2) NOT NULL,';
  stSql := stSql + ' AL_ALARMMODECODE varchar(1) NOT NULL,';
  stSql := stSql + ' AL_ALARMSTATUSCODE2 varchar(5) NOT NULL,';
  stSql := stSql + ' KTTFUNCODE varchar(2) NOT NULL,';
  stSql := stSql + ' KTTEVENTCODE varchar(10) NOT NULL,';
  stSql := stSql + ' KTTCODE varchar(30),';
  stSql := stSql + ' PRIMARY KEY (AL_ALARMDEVICETYPECODE,AL_ALARMMODECODE,AL_ALARMSTATUSCODE2) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_LOCATION: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_LOCATION  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   LO_DONGCODE varchar(3)   DEFAULT ''000'' NOT NULL, ';
  stSql := stSql + '   LO_FLOORCODE varchar(3)   DEFAULT ''000'' NOT NULL,';
  stSql := stSql + '   LO_AREACODE varchar(3)   DEFAULT ''000'' NOT NULL, ';
  stSql := stSql + '   LO_NAME varchar(30)   NULL,';
  stSql := stSql + '   LO_GUBUN char(1)   NULL,';
  stSql := stSql + '   LO_CADIMAGE varchar(100) NULL,';
  stSql := stSql + '   LO_IMAGEUSE char(1)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  LO_DONGCODE ,  LO_FLOORCODE ,  LO_AREACODE )';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_LOCATION_PrimaryKey: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_LOCATION ADD CONSTRAINT TB_LOCATION_PKIndex1 PRIMARY KEY ( GROUP_CODE,LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ) ';
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_LOWDATA: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_LOWDATA  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   SEQ int NOT NULL,';
  stSql := stSql + '   LO_DATE varchar(8)   NULL,';
  stSql := stSql + '   AC_NODENO int NULL,';
  stSql := stSql + '   LO_IP varchar(24)   NULL,';
  stSql := stSql + '   LO_PORT varchar(5)   NULL,';
  stSql := stSql + '   LO_MCUID varchar(7)   NULL,';
  stSql := stSql + '   LO_ECUID varchar(2)   NULL,';
  stSql := stSql + '   LO_TXRX varchar(2)   NULL,';
  stSql := stSql + '   LO_COMMAND char(1)   NULL,';
  stSql := stSql + '   LO_LOWDATA varchar(200)   NULL,';
  stSql := stSql + '   LO_INSERTTIME varchar(14)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  SEQ )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_MAPLOCATION: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_MAPLOCATION (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' ML_COUNTRY varchar(3) NOT NULL,';
  stSql := stSql + ' ML_BUILDING varchar(3) NOT NULL,';
  stSql := stSql + ' ML_FLOOR varchar(3) NOT NULL,';
  stSql := stSql + ' ML_AREA varchar(3) NOT NULL,';
  stSql := stSql + ' ML_GUBUN varchar(1) NOT NULL,';
  stSql := stSql + ' ML_NAME varchar(50) ,';
  stSql := stSql + ' ML_IMAGE varchar(100) ,';
  stSql := stSql + ' ML_IMAGEUSE varchar(1) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ML_COUNTRY, ML_BUILDING,ML_FLOOR,ML_AREA,ML_GUBUN) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_MAPPOSITION: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_MAPPOSITION (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' MP_SEQ integer NOT NULL,';
  stSql := stSql + ' MP_TYPE varchar(1) NULL,';
  stSql := stSql + ' MP_LEFT integer NULL,';
  stSql := stSql + ' MP_TOP integer NULL,';
  stSql := stSql + ' MP_TOTW integer NULL,';
  stSql := stSql + ' MP_TOTH integer NULL,';
  stSql := stSql + ' MP_WIDTH integer NULL,';
  stSql := stSql + ' MP_HEIGHT integer NULL,';
  stSql := stSql + ' MP_NORMALCOLOR varchar(10) NULL,';
  stSql := stSql + ' MP_NORMALFILLCOLOR varchar(10) NULL,';
  stSql := stSql + ' MP_ALERTCOLOR varchar(10) NULL,';
  stSql := stSql + ' MP_ALERTFILLCOLOR varchar(10) NULL,';
  stSql := stSql + ' ML_COUNTRY varchar(3) NULL,';
  stSql := stSql + ' ML_BUILDING varchar(3) NULL,';
  stSql := stSql + ' ML_FLOOR varchar(3) NULL,';
  stSql := stSql + ' ML_AREA varchar(3) NULL,';
  stSql := stSql + ' ML_GUBUN varchar(1) NULL,';
  stSql := stSql + ' LO_DONGCODE varchar(3) NULL,';
  stSql := stSql + ' LO_FLOORCODE varchar(3) NULL,';
  stSql := stSql + ' LO_AREACODE varchar(3) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,MP_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_MAPZONE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_MAPZONE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_NODENO integer NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' MZ_PORTNUM varchar(2) NOT NULL,';
  stSql := stSql + ' MZ_PORTSEQ varchar(2) NOT NULL,';
  stSql := stSql + ' MZ_TYPE varchar(1) NULL,';
  stSql := stSql + ' MZ_LEFT integer NULL,';
  stSql := stSql + ' MZ_TOP integer NULL,';
  stSql := stSql + ' MZ_TOTW integer NULL,';
  stSql := stSql + ' MZ_TOTH integer NULL,';
  stSql := stSql + ' MZ_WIDTH integer NULL,';
  stSql := stSql + ' MZ_HEIGHT integer NULL,';
  stSql := stSql + ' MZ_NORMALCOLOR varchar(10) NULL,';
  stSql := stSql + ' MZ_ALARMCOLOR varchar(10) NULL,';
  stSql := stSql + ' MZ_ALERTCOLOR varchar(10) NULL,';
  stSql := stSql + ' MZ_NORMALIMAGE image NULL,';
  stSql := stSql + ' MZ_ALARMIMAGE image NULL,';
  stSql := stSql + ' MZ_ALERTIMAGE image NULL,';
  stSql := stSql + ' ML_COUNTRY varchar(3) NULL,';
  stSql := stSql + ' ML_BUILDING varchar(3) NULL,';
  stSql := stSql + ' ML_FLOOR varchar(3) NULL,';
  stSql := stSql + ' ML_AREA varchar(3) NULL,';
  stSql := stSql + ' ML_GUBUN varchar(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,MZ_PORTNUM,MZ_PORTSEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_MONTHAT: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_MONTHAT  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '   MO_MONTH varchar(6)   NOT NULL, ';
  stSql := stSql + '   CA_CARDNO varchar(20)   NOT NULL,';
  stSql := stSql + '   MO_01 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_02 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_03 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_04 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_05 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_06 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_07 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_08 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_09 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_10 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_11 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_12 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_13 char(1)   DEFAULT ''0'' NULL, ';
  stSql := stSql + '   MO_14 char(1)   DEFAULT ''0'' NULL, ';
  stSql := stSql + '   MO_15 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_16 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_17 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_18 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_19 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_20 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_21 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_22 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_23 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_24 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_25 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_26 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_27 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_28 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_29 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_30 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_31 char(1)   DEFAULT ''0'' NULL,';
  stSql := stSql + '   MO_ATCNT int DEFAULT 0 NULL, ';
  stSql := stSql + '   MO_JIKAKCNT int DEFAULT 0 NULL,';
  stSql := stSql + '   MO_JOTAECNT int DEFAULT 0 NULL,';
  stSql := stSql + '   MO_NIGHTCNT int DEFAULT 0 NULL, ';
  stSql := stSql + '   MO_HOLIDAYCNT int DEFAULT 0 NULL,';
  stSql := stSql + '   MO_TOTATCNT int DEFAULT 0 NULL,';
  stSql := stSql + '   MO_ABSENCECNT int DEFAULT 0 NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  MO_MONTH ,  CA_CARDNO )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_NOTCARDALARMCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_NOTCARDALARMCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AN_CODE varchar(5) NOT NULL,';
  stSql := stSql + ' AN_MODE varchar(2) NOT NULL,';
  stSql := stSql + ' AL_STATUSCODE2 varchar(5) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AN_CODE, AN_MODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_PATROLALARMEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_PATROLALARMEVENT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' PE_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' AC_NODENO integer NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' RE_READERNO varchar(1) NOT NULL,';
  stSql := stSql + ' PT_SEQ integer NOT NULL,';
  stSql := stSql + ' PE_TIME varchar(6) NULL,';
  stSql := stSql + ' PE_EVENTNAME varchar(100) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,PE_DATE,AC_NODENO,AC_ECUID,RE_READERNO,PT_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_PATROLSTATE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_PATROLSTATE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' PS_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' AC_NODENO integer NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' RE_READERNO char(1) NOT NULL,';
  stSql := stSql + ' PT_SEQ Integer NOT NULL,';
  stSql := stSql + ' PS_STATE char(1) NULL,';
  stSql := stSql + ' PS_UPDATETIME varchar(17) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,PS_DATE,AC_NODENO,AC_ECUID,RE_READERNO,PT_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_PatrolTime: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_PATROLTIME (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' PT_SEQ integer NOT NULL,';
  stSql := stSql + ' PT_NAME varchar(100) NULL,';
  stSql := stSql + ' PT_STRARTTIME varchar(4) NULL,';
  stSql := stSql + ' PT_ENDTIME varchar(4) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,PT_SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_PERMITCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_PERMITCODE  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '   PE_PERMITCODE char(1)   NOT NULL, ';
  stSql := stSql + '   PE_PERMITNAME varchar(30)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  PE_PERMITCODE ) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_PERRELAYCONFIG: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_PERRELAYCONFIG (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' PC_CONFIGCODE varchar(30) NOT NULL,';
  stSql := stSql + ' PC_CONFIGVALUE varchar(100) NULL,';
  stSql := stSql + ' PC_CONFIGDETAIL varchar(50) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,PC_CONFIGCODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_POSI: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_POSI  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   CO_COMPANYCODE varchar(3)   NOT NULL,';
  stSql := stSql + '   PO_POSICODE varchar(3)   NOT NULL,';
  stSql := stSql + '   PO_NAME varchar(30)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE , CO_COMPANYCODE ,  PO_POSICODE ) ';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_PROGRAMGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_PROGRAMGROUP  (  ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '   PR_GROUPCODE varchar(10)   NOT NULL,  ';
  stSql := stSql + '   PR_GROUPCODENAME varchar(30)   NULL,';
  stSql := stSql + '   PR_VISIBLE char(1)   NULL, ';
  stSql := stSql + '   GUBUN varchar(10)   NULL,  ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  PR_GROUPCODE ) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_PROGRAMID: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_PROGRAMID  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   PR_PROGRAMID varchar(10)   NOT NULL, ';
  stSql := stSql + '   PR_GROUPCODE varchar(10)   NULL,';
  stSql := stSql + '   PR_PROGRAMNAME varchar(30)   NULL,';
  stSql := stSql + '   PR_VISIBLE char(1)   NULL, ';
  stSql := stSql + '   PR_VIEWSEQ int NULL,';
  stSql := stSql + '   CO_CONFIGCODE varchar(10)   NULL,';
  stSql := stSql + '   PR_UPDATETIME varchar(14)   NULL, ';
  stSql := stSql + '   PR_UPDATEOPERATOR varchar(10)   NULL, ';
  stSql := stSql + '   PR_ENABLE char(1)   NULL,  ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  PR_PROGRAMID )  ';
  stSql := stSql + ')  ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_READER: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_READER  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL, ';
  stSql := stSql + '   RE_READERNO varchar(1)   NOT NULL,';
  stSql := stSql + '   DO_DOORNO varchar(1)   NULL,';
  stSql := stSql + '   RE_USE varchar(1)   NULL, ';
  stSql := stSql + '   SEND_ACK varchar(1)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AC_NODENO ,  AC_ECUID ,  RE_READERNO ) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_RELAYGUBUN: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_RELAYGUBUN (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' RG_CODE varchar(3) NOT NULL,';
  stSql := stSql + ' RG_NAME varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,RG_CODE) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_RELAYUNIVERCITY: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_RELAYUNIVERCITY (';
  stSql := stSql + ' SEQ int IDENTITY NOT NULL,';
  stSql := stSql + ' COLLEGECODE varchar(100),';
  stSql := stSql + ' COLLEGENAME varchar(100),';
  stSql := stSql + ' DEPARTCODE varchar(100),';
  stSql := stSql + ' DEPARTNAME varchar(100),';
  stSql := stSql + ' POSICODE varchar(100),';
  stSql := stSql + ' POSINAME varchar(100),';
  stSql := stSql + ' EMNAME varchar(100),';
  stSql := stSql + ' EMCODE varchar(100),';
  stSql := stSql + ' DEGREE varchar(100),';
  stSql := stSql + ' CARDNO varchar(100),';
  stSql := stSql + ' CARDSTATECODE varchar(100),';
  stSql := stSql + ' CARDSTATENAME varchar(100),';
  stSql := stSql + ' INSERTTIME datetime,';
  stSql := stSql + ' CHANGE char(1) DEFAULT ''N''  NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_SEMESTER: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_SEMESTER (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' SE_CODE integer NOT NULL,';
  stSql := stSql + ' SE_USE char(1),';
  stSql := stSql + ' SE_STARTDATE varchar(4),';
  stSql := stSql + ' SE_ENDDATE varchar(4),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,SE_CODE) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_SENSOREVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE [TB_SENSOREVENT] ( ';
  stSql := stSql + '  [GROUP_CODE]varchar(10)   DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '  [AL_DATE]varchar(8)   NOT NULL, ';
  stSql := stSql + '  [AL_TIME]varchar(6)   NOT NULL, ';
  stSql := stSql + '  [AC_NODENO]int NOT NULL,  ';
  stSql := stSql + '  [AC_ECUID]varchar(2)   NOT NULL, ';
  stSql := stSql + '  [AL_ZONENO]varchar(2)   NOT NULL, ';
  stSql := stSql + '  [AL_MSGNO]char(1)   NOT NULL, ';
  stSql := stSql + '  [AL_ALARMDEVICETYPECODE]varchar(2)   NULL, ';
  stSql := stSql + '  [AL_SUBADDR]varchar(2)   NULL, ';
  stSql := stSql + '  [AL_ZONECODE]varchar(2)   NULL, ';
  stSql := stSql + '  [AL_ALARMMODECODE]char(1)   NULL, ';
  stSql := stSql + '  [AL_ZONESTATE]char(1)   NULL, ';
  stSql := stSql + '  [AL_ALARMSTATUSCODE]varchar(5)   NULL, ';
  stSql := stSql + '  [AL_ISALARM]char(1)   NULL, ';
  stSql := stSql + '  [AL_OPERATOR]varchar(10)   NULL, ';
  stSql := stSql + '  [AL_INPUTTIME]varchar(14)   NULL, ';
  stSql := stSql + '  [AL_INPUTOPERATOR]varchar(10)   NULL, ';
  stSql := stSql + '  [AL_CHECKOK]char(1)   NULL,  ';
  stSql := stSql + '  [AL_CHECKCODE]varchar(3)   NULL, ';
  stSql := stSql + '  [AL_CHECKMSG]varchar(100)   NULL, ';
  stSql := stSql + '  [AL_UPDATETIME]varchar(14)   NULL, ';
  stSql := stSql + '  [AL_UPDATEOPERATOR]varchar(10)   NULL, ';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AL_DATE], [AL_TIME], [AC_NODENO], [AC_ECUID], [AL_ZONENO], [AL_MSGNO])  ';
  stSql := stSql + ')  ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_SERVERCARDRELAY: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_SERVERCARDRELAY (';
  stSql := stSql + ' GROUP_CODE VARCHAR(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' SR_RELAYNO INTEGER NOT NULL,';
  stSql := stSql + ' AC_NODENO INTEGER NULL,';
  stSql := stSql + ' AC_ECUID VARCHAR(2) NULL,';
  stSql := stSql + ' RE_READERNO VARCHAR(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,SR_RELAYNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_SERVERCARDRELAYHIS: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_SERVERCARDRELAYHIS (';
  stSql := stSql + ' GROUP_CODE VARCHAR(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' SR_DATETIME VARCHAR(14) NOT NULL,';
  stSql := stSql + ' SR_RELAYNO INTEGER NOT NULL,';
  stSql := stSql + ' SR_CARDDATA VARCHAR(20) NULL,';
  stSql := stSql + ' SR_CLIENTIP VARCHAR(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,SR_DATETIME,SR_RELAYNO) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_SMALLSETMAPPING: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_SMALLSETMAPPING (';
  stSql := stSql + ' GROUP_CODE VARCHAR(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' AL_ALARMDEVICETYPECODE varchar(2) NOT NULL,';
  stSql := stSql + ' AL_ALARMMODECODE varchar(1) NOT NULL,';
  stSql := stSql + ' AL_ALARMSTATUSCODE2 varchar(5) NOT NULL,';
  stSql := stSql + ' SM_EVENTCODE varchar(10) NULL,';
  stSql := stSql + ' SM_EXTCODE varchar(10) NULL,';
  stSql := stSql + ' SM_SENDUSE char(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AL_ALARMDEVICETYPECODE,AL_ALARMMODECODE,AL_ALARMSTATUSCODE2) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_SONGHOFDCONFIG: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_SONGHOFDCONFIG (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' SF_CODE varchar(20) NOT NULL,';
  stSql := stSql + ' SF_USE char(1),';
  stSql := stSql + ' SF_COUNT integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,SF_CODE) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_SYSTEMLOG: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_SYSTEMLOG  (  ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   SY_DATE varchar(8)   NOT NULL, ';
  stSql := stSql + '   SY_TIME varchar(6)   NOT NULL,';
  stSql := stSql + '   SY_CLIENTIP varchar(24)   NOT NULL, ';
  stSql := stSql + '   SY_OPERATOR varchar(10)   NOT NULL, ';
  stSql := stSql + '   AC_NODENO int NOT NULL, ';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL, ';
  stSql := stSql + '   CA_CARDNO varchar(20)   NOT NULL, ';
  stSql := stSql + '   AC_NUMBER varchar(1)   NOT NULL,';
  stSql := stSql + '   AC_TYPE varchar(1)   NULL,';
  stSql := stSql + '   SY_LOGDATA varchar(50)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  SY_DATE ,  SY_TIME ,  SY_CLIENTIP ,  SY_OPERATOR ,  AC_NODENO ,  AC_ECUID , CA_CARDNO , AC_NUMBER )  ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_TIMECODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_TIMECODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' TC_GROUP varchar(1) NOT NULL,';
  stSql := stSql + ' TC_TIME1 varchar(8) ,';
  stSql := stSql + ' TC_TIME2 varchar(8) ,';
  stSql := stSql + ' TC_TIME3 varchar(8) ,';
  stSql := stSql + ' TC_TIME4 varchar(8) ,';
  stSql := stSql + ' TC_CHANGE varchar(1) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,TC_GROUP) ';
  stSql := stSql + ' ) ';
  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_TIMECODEDEVICE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_TIMECODEDEVICE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' AC_NODENO integer NOT NULL,';
  stSql := stSql + ' AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + ' TC_GROUP varchar(1) NOT NULL,';
  stSql := stSql + ' TC_TIME1 varchar(8) ,';
  stSql := stSql + ' TC_TIME2 varchar(8) ,';
  stSql := stSql + ' TC_TIME3 varchar(8) ,';
  stSql := stSql + ' TC_TIME4 varchar(8) ,';
  stSql := stSql + ' TC_SEND varchar(1) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,TC_GROUP) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_USERCONFIG: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_USERCONFIG  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AD_USERID varchar(20)   NOT NULL, ';
  stSql := stSql + '   US_CONFIGID varchar(20)   NOT NULL, ';
  stSql := stSql + '   US_CONFGROUP varchar(10)   NOT NULL,';
  stSql := stSql + '   US_VALUE varchar(30)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AD_USERID ,  US_CONFIGID ,  US_CONFGROUP )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_WORKGUBUN: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_WORKGUBUN (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' WG_CODE integer NOT NULL,';
  stSql := stSql + ' WG_TYPE varchar(1) ,';
  stSql := stSql + ' WG_NAME varchar(100) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,WG_CODE) ';
  stSql := stSql + ' ) ';

  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_WORKLOG: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_WORKLOG (';
  stSql := stSql + ' WO_CODE varchar(30) NOT NULL,';
  stSql := stSql + ' WO_COMMAND varchar(30) NOT NULL,';
  stSql := stSql + ' WO_DATA varchar(300),';
  stSql := stSql + ' WO_TIME varchar(14) NOT NULL,';
  stSql := stSql + ' WO_OPERATOR varchar(30) ';
  stSql := stSql + ' ) ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.CreateTB_ZIPCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ZIPCODE  ( ';
  stSql := stSql + '   ZI_ZIPCODE varchar(7)   NOT NULL,';
  stSql := stSql + '   ZI_SIDO varchar(8)   NULL,';
  stSql := stSql + '   ZI_GUGUN varchar(30)   NULL,';
  stSql := stSql + '   ZI_DONG varchar(60)   NULL,';
  stSql := stSql + '   ZI_BUNJI varchar(20)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( ZI_ZIPCODE )';
  stSql := stSql + ')';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ZONEDEVICE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_ZONEDEVICE  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL, ';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL, ';
  stSql := stSql + '   AL_ZONENUM char(1)   DEFAULT ''1'' NOT NULL,';
  stSql := stSql + '   AL_ZONENAME varchar(30)   NULL,';
  stSql := stSql + '   AL_LOCATEUSE char(1)   NULL, ';
  stSql := stSql + '   AL_TOTWIDTH int NULL, ';
  stSql := stSql + '   AL_TOTHEIGHT int NULL, ';
  stSql := stSql + '   AL_CURX int NULL,';
  stSql := stSql + '   AL_CURY int NULL, ';
  stSql := stSql + '   LO_DONGCODE varchar(3)   NULL, ';
  stSql := stSql + '   LO_FLOORCODE varchar(3)   NULL,';
  stSql := stSql + '   LO_AREACODE varchar(3)   NULL, ';
  stSql := stSql + '   AL_ZONETYPE varchar(2)   NULL, ';
  stSql := stSql + '   AL_WATCHTYPE varchar(1)   NULL,';
  stSql := stSql + '   SEND_ACK varchar(1)   NULL,  ';
  stSql := stSql + '   AL_ZONEUSE varchar(1)   NULL, ';
  stSql := stSql + '   AL_ZONESTOP varchar(1)   DEFAULT ''N'' NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  AC_NODENO ,  AC_ECUID ,  AL_ZONENUM )';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if G_nDBTYPE = POSTGRESQL then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if G_nDBTYPE = FireBird then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateTB_ZONESCHEDULE: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  [TB_ZONESCHEDULE] (';
  stSql := stSql + '  [GROUP_CODE]varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  [AC_NODENO]int NOT NULL,';
  stSql := stSql + '  [AC_ECUID]varchar(2)   NOT NULL,';
  stSql := stSql + '  [AL_ZONENUM]char(1)   NOT NULL,';
  stSql := stSql + '  [ZO_SCHNUM]int NOT NULL, ';
  stSql := stSql + '  [ZO_STARTTIME]varchar(4)   NULL, ';
  stSql := stSql + '  [ZO_ENDTIME]varchar(4)   NULL,';
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AC_NODENO], [AC_ECUID], [AL_ZONENUM], [ZO_SCHNUM]) ';
  stSql := stSql + ') ';

  if G_nDBTYPE = MDB then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := dmZeronEventDataBase.ProcessExecSQL(stSql);
end;

function TdmZeronEventDBCreate.CreateVw_SMS_EVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE VIEW Vw_SMS_EVENT AS ';
  stSql := stSql + 'select b.AL_ZONENAME as v_DEVICE_NAME, ' ;
  stSql := stSql + ' c.AL_ZONENAME as v_ZONE_NAME, ' ;
  stSql := stSql + ' a.AL_ALARMSTATUSCODE as v_EVENT_CODE, ' ;
  stSql := stSql + ' a.AL_ZONESTATE as v_ZONE_STATE, ' ;
  stSql := stSql + ' d.AL_ALARMNAME as v_EVENT_NAME, ' ;
  stSql := stSql + ' a.AL_DATE + a.AL_TIME  as v_EVENT_TIME, ' ;
  stSql := stSql + ' a.AL_INPUTTIME  as v_INSERT_TIME,';
  stSql := stSql + ' a.AL_MSGNO as v_MSG_ID ' ;
  stSql := stSql + ' FROM TB_ALARMEVENT a  ' ;
  stSql := stSql + ' Left Join TB_ALARMDEVICE b  ' ;
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID) ';
  stSql := stSql + ' Left Join TB_ZONEDEVICE c  ' ;
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
  stSql := stSql + ' AND a.AL_ZONENO = ''0'' + c.AL_ZONENUM )';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE d  ' ;
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_ALARMSTATUSCODE = d.AL_ALARMSTATUSCODE )';

  dmZeronEventDataBase.ProcessExecSQL(stSql);

  stSql := 'CREATE LOGIN [sms] WITH PASSWORD=N''smspass'', DEFAULT_DATABASE=[zmos], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF';
  dmZeronEventDataBase.ProcessExecSQL(stSql);
  stSql := 'CREATE USER [sms] FOR LOGIN [sms]';
  dmZeronEventDataBase.ProcessExecSQL(stSql);
  stSql := 'ALTER LOGIN [sms] WITH PASSWORD=N''smspass''';
  dmZeronEventDataBase.ProcessExecSQL(stSql);
  stSql := 'EXEC sp_addrolemember ''db_datareader'', ''sms''';
  dmZeronEventDataBase.ProcessExecSQL(stSql);
  stSql := 'EXEC sp_addrolemember ''db_accessadmin'', ''sms''';
  dmZeronEventDataBase.ProcessExecSQL(stSql);
  stSql := 'GRANT SELECT ON  [Vw_SMS_EVENT] TO [sms] ' ;
  dmZeronEventDataBase.ProcessExecSQL(stSql);

end;

function TdmZeronEventDBCreate.DropTB_COMPANY_PrimaryKey: Boolean;
var
  stSql : string;
begin
  stSql := 'sp_helpindex TB_COMPANY ';

  with dmZeronEventDataBase.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    if recordCount < 1 then Exit;
    stSql := 'ALTER TABLE TB_COMPANY DROP ' + FieldByName('index_name').AsString;
    dmZeronEventDataBase.ProcessExecSQL(stSql);
  end;

end;

function TdmZeronEventDBCreate.DropTB_LOCATION_PrimaryKey: Boolean;
var
  stSql : string;
begin
  stSql := 'sp_helpindex TB_LOCATION ';

  with dmZeronEventDataBase.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    if recordCount < 1 then Exit;
    stSql := 'ALTER TABLE TB_LOCATION DROP ' + FieldByName('index_name').AsString;
    dmZeronEventDataBase.ProcessExecSQL(stSql);
  end;
end;

end.
