unit uPostGreSql;

interface

uses
  SysUtils, Classes,uLomosUtil;

type
  TPostGreSql = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    Function SelectTB_ACCESSEVENTDupCheck(aTimestr,aNodeNo,aECUID,aDoorNo,aCardNo:string):string;
    Function SelectTB_ACCESSEVENTFromDayToDay(aFromDate,aToDate,aNodeNo,aEcuId,aDoorNo,aDoorGubunCode,aPermitCode,
              aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmCode,aEmName,aEmTypeCode:string;aDoorGubun:Boolean):string;
    Function SelectTB_ACCESSEVENTTOPatrolArea(aFromDate,aFromTime,aToDate,aToTime,aPermitCode,aEmCode, aEmName,aEmTypeCode:string):string;
    Function SelectTB_ACCESSEVENTChangeFromDayToDay(aFromDate,aToDate,aNodeNo,aEcuId,aDoorNo,aDoorGubunCode,aPermitCode,
              aCompanyCode,aJijumCode,aDepartCode,aEmCode,aEmName:string;aDoorGubun:Boolean):string;
    Function SelectTB_ACCESSEVENTFromDayToTime(aFromDate,aStartTime,aEndTime,aNodeNo,aEcuId,aDoorNo,aDoorGubunCode,aPermitCode,
              aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmCode,aEmName,aEmTypeCode:string;aDoorGubun:Boolean):string;
    Function SelectTB_ACCESSEVENTPersonState(aFromDate,aToDate,aNodeNo,aEcuId,aDoorNo,aDoorGubunCode,
              aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmCode,aEmName:string;aDoorGubun:Boolean):string;
    Function SelectTB_ALARMEVENTFromDayToDay(aFromDate,aToDate,aNodeNo,aEcuId,aAlarmType:string;aOrderASC:Boolean=True):string;
    Function SelectNewTB_ALARMEVENTFromDayToDay(aFromDate,aToDate,aNodeNo,aEcuId,aAlarmType:string):string;
    Function SelectBuildingTB_ALARMEVENTFromDayToDay(aFromDate,aToDate,aNodeNo,aEcuId,aBuildingCode,aFloorCode,aAreaCode,aAlarmType:string):string;
    Function SelectTB_ALARMEVENTFromALARMCatch:string;
    Function SelectTB_ALARMGRADEJoinBase(aBuildingCode,aFloorCode,aAreaCode,aCardNo:string):string;
    Function selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,aFloorCode,aAreaCode:string;aNodeNo:string='000'):string;
    Function selectTB_ALARMDEVICEJoinPromiseCode(aPromisecode:string):string;
    Function SelectTB_ATEVENTDupCheck(aDate,aCompanyCode,aEmCode:string):string;
    Function SelectTB_ATEVENTInTimeDupCheck(aDate,aNowTime,aCompanyCode,aEmCode:string):string;
    Function SelectTB_ATEVENTFromDayBase(aDate:string;aCardCheck:Boolean = False):string;
    Function SelectTB_ATEVENTFromToDayBase(aFromDate,aToDate:string):string;
    Function SelectTB_ATEVENTNonProcessFromDayToDay(aFromDate,aToDate:string):string;
    Function SelectTB_ATEVENTDaySummary(aDate,aCompanyCode,aEmCode:string):string;
    Function SelectTB_ATEVENTUpdateAttendType(aDate,aCompanyCode,aEmCode:string):string;
    Function SelectTB_ATEVENTOutTimeDupCheck(aDate,aNowTime,aCompanyCode,aEmCode:string):string;
    Function SelectTB_ATEVENTBussinessOutTimeDupCheck(aDate, aNowTime,aCompanyCode,aEMCode:string):string;
    Function SelectTB_ATEVENTBussinessInTimeDupCheck(aDate, aNowTime,aCompanyCode,aEMCode:string):string;
    Function SelectTB_CARDAdminJoinBase:string;
    Function SelectTB_CARDJoinTBEmployee:string;
    Function SelectTB_CARDFromDoorGradeJoinBase(aAC_NODENO,aAC_ECUID,aDoorNo:string):string;
    Function SelectTB_CARDFromAlarmGradeJoinBase(aAC_NODENO,aAC_ECUID:string):string;
    Function selectTB_DOORJoinAdmin(aBuildingCode,aFloorCode,aAreaCode:string;aDoorView:Boolean=True;aNodeNo:string='000'):string;
    Function selectTB_DOORJoinGrade(aBuildingCode,aFloorCode,aAreaCode,aCardNo:string):string;
    Function selectTB_DOORJoinFullDoorGrade(aEmCode,aEmName,aEmTypeCode:string):string;
    Function selectTB_DOORJoinFullArmGrade(aEmCode,aEmName,aEmTypeCode:string):string;
    Function selectTB_DOORJoinPromiseCode(aPromisecode:string):string;
    Function SelectTB_EMPLOYEEJoinACEventDayToDay(aFromDate,aToDate:string):string;
    Function SelectTB_EMPLOYEEJoinATDAYSUMMARYDayToDay(aFromDate,aToDate:string):string;
    Function SelectTB_EMPLOYEEJoinATEVENTDay(aDate,aCompanyCode,aEmCode:string):string;
    Function SelectTB_EMPLOYEEJoinATMONTHSUMMARY(aMonth:string):string;
    Function SelectTB_EMPLOYEE:string;
    Function SelectTB_EMPLOYEEJoinBase:string;
    Function SelectTB_EMPLOYEEJoinKTCardISSUE:string;
    Function SelectTB_EMPLOYEEDupCardJoinBase :string;
    Function SelectTB_EMPLOYEEJoinCARDRelayBase:string;
    Function SelectTB_EMPLOYEEJoinFoodEventFromD2D(aFoodArea,aFoodCode,aFoodPermit,aStartDate,aEndDate:string):string;
    Function SelectTB_EMPLOYEEJoinFOODGrade(aNonPay:string):string;
    Function SelectTB_EMPLOYEEJoinFoodCode(aDate,aFoodCode:string):string;
    Function SelectTB_EMPLOYEEJoinFoodState(aStarDate,aEndDate,aFoodArea,aFoodPermit:string):string;
    Function SelectTB_EMPLOYEEJoinD2DFoodState(aStarDate,aEndDate,aFoodArea,aFoodPermit:string):string;
    Function SelectTB_EMPLOYEEATJoinBase:string;
    Function SelectTB_EMPLOYEEATJoinATBasePAY:string;
    Function SelectTB_EMPLOYEEATJoinExtraBase:string;
    Function SelectTB_EMPLOYEEATVacation(aMonth:string):string;
    Function SelectTB_FOODEVENTALL:string;
    Function SelectTB_FOODEVENTDupCheck(aTime,aNodeNo,aECUID,aReaderNo, aCompanyCode,aEmCode:string):string;
    Function selectTB_FOODJoinPromiseCode(aPromisecode:string):string;
    Function SelectTB_HOLIDAYFromMonth(aMonth:string):string;
    Function SelectTB_GRADEPROGRAMGradeJoinBase(aGradeCode,aProgramGroupCode:string):string;

    function SelectTB_ACCESSEVENTJOINATDEVICE(aFromDate,aToDate:string):string;
    function SelectTB_DEVICECARDNODownLoadCard:string;
    function SelectTB_DEVICECARDNOCardPermit:string;
    function SelectTB_DOORGetDoorInfo : string;
    function SelectTB_ALARMDEVICEGetAlarmInfo :string;

    //Map
    Function SelectMapCountryAll:string;
    Function SelectMapBuildingAll : string;
    Function SelectMapFloorAll : string;
    Function SelectMapAreaAll : string;
    Function SelectMapBuildingCountryID(aCountryID:string):string;
    Function SelectMapFloorBuildingID(aCountryID,aBuildingID:string):string;

    //가공된 쿼리문
    Function SelectDongLocation:string;
    Function SelectFloorLocation:string;
    Function SelectAreaLocation:string;
    Function SelectMCUDeviceLoad:string;
    Function SelectECUDeviceLoad:string;

    Function SelectNotCardReport(aUseDate,aCompanyCode,aJijumCode,aDepartCode,aPosiCode:string):string;
    Function SelectNotPTReport(aFromDate,aToDate,aBuildingCode,aFloorCode:string):string;

    Function UpdateTB_PROGRAMIDSetVisible:string;
    Function UpdateTB_DEVICECARDNOFromPromise(aPromiseGrade,aCardNO:string):string;

    Function CreateTB_ALARMCODEGROUP : string;
    Function CreateTB_ALARMGUBUNCODE : string;
    Function CreateTB_ALARMMODENOTCARD : string;
    Function CreateTB_ALARMSHOW:string;
    Function CreateTB_CARDTYPE:string;
    Function CreateTB_DAEMONMULTI : string;
    Function CreateTB_DEVICECARDNOACKINDEX : string;
    Function CreateTB_DEVICESETTINGINFO : string;
    Function CreateTB_DOORGUBUN : string;
    Function CreateTB_EMPHIS:string;
    Function CreateTB_FormName:string;
    Function CreateTB_FIREGUBUN:string;
    Function CreateTB_FIREGROUP:string;
    Function CreateTB_FTPLIST : string;
    Function CreateTB_INOUTCOUNT:string;
    Function CreateTB_INOUTGROUP:string;
    Function CreateTB_KTCARDISSUE : string;
    Function CreateTB_MAPLOCATION : string;
    Function CreateTB_MAPPOSITION : string;
    Function CreateTB_MAPZONE : string;
    Function CreateTB_NOTCARDALARMCODE : string;
    Function CreateTB_PERRELAYCONFIG:string;
    Function CreateTB_RELAYGUBUN : string;
    Function CreateTB_SERVERCARDRELAY:string;
    Function CreateTB_SERVERCARDRELAYHIS:string;
    Function CreateTB_WORKLOG:string;
    Function CreateTB_KTTMAPPINGCODE:string;
    Function CreateTB_RELAYUNIVERCITY:string;
    Function CreateTB_ATWORKTYPE : string;


    Function CreateView_CARD : string;


    Function AlterTB_ACCESSDEVICEArmControlRing_Add : string;
    Function AlterTB_ACCESSDEVICEDaemonGubun : string;
    Function AlterTB_ACCESSDEVICEDecoderID_Add : string;
    Function AlterTB_ACCESSDEVICEDeviceCode_Add : string;
    Function AlterTB_ACCESSDEVICEDeviceType_Add : string;
    Function AlterTB_ACCESSDEVICEDisArmControlRing_Add : string;
    Function AlterTB_ACCESSDEVICEDoor1Type_Add : string;
    Function AlterTB_ACCESSDEVICEDoor2Type_Add : string;
    Function AlterTB_ACCESSDEVICEHoSend : string;
    Function AlterTB_ACCESSDEVICEInDelay_Add : string;
    Function AlterTB_ACCESSDEVICEJaejung_Add : string;
    Function AlterTB_ACCESSDEVICELinkusSystemID_Add : string;
    Function AlterTB_ACCESSDEVICELinkusTelNo_Add : string;
    Function AlterTB_ACCESSDEVICEMuxID_Add : string;
    Function AlterTB_ACCESSDEVICENameChange : string;
    Function AlterTB_ACCESSDEVICEOutDelay_Add : string;
    Function AlterTB_ACCESSDEVICEPowerType_Add : string;
    Function AlterTB_ACCESSDEVICEReaderType_Add : string;
    Function AlterTB_ACCESSDEVICEReaderType_Delete : string;
    Function AlterTB_ACCESSDEVICERegSend_Add : string;
    Function AlterTB_ACCESSDEVICEUPDATE : string;
    Function AlterTB_ACCESSEVENTCOMPANYCODE :string;
    Function AlterTB_ACCESSEVENTCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_ACCESSEVENTDEPARTCODE :string;
    Function AlterTB_ACCESSEVENTDepartCodeChange(aLen:string='10') : string;
    Function AlterTB_ACCESSEVENTEMCODE :string;
    Function AlterTB_ACCESSEVENTEMCODEChange : string;
    Function AlterTB_ACCESSEVENTEMNAME :string;
    Function AlterTB_ACCESSEVENTJIJUMCODE :string;
    Function AlterTB_ACCESSEVENTJijumCodeChange(aLen:string='10') : string;
    Function AlterTB_ADMINAreaCode : string;
    Function AlterTB_ADMINBuildingGrade : string;
    Function AlterTB_ADMINCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_ADMINDepartCodeChange(aLen:string='10') : string;
    Function AlterTB_ADMINDongCode : string;
    Function AlterTB_ADMINFloorCode : string;
    Function AlterTB_ADMINJijumCodeChange(aLen:string='10') : string;
    Function AlterTB_ADMINCOMPANYCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_ADMINCOMPANYDepartCodeChange(aLen:string='10') : string;
    Function AlterTB_ADMINCOMPANYJijumCodeChange(aLen:string='10') : string;
    Function AlterTB_ALARMDEVICEALARMID_Delete : string;
    Function AlterTB_ALARMDEVICEARMGUBUN : string;
    Function AlterTB_ALARMDEVICEINDELAY_Delete : string;
    Function AlterTB_ALARMDEVICEmemo_Add : string;
    Function AlterTB_ALARMDEVICEMUXTEL_Delete : string;
    Function AlterTB_ALARMDEVICENameChange : string;
    Function AlterTB_ALARMDEVICEOUTDELAY_Delete : string;
    Function AlterTB_ALARMDEVICERegSend_Add : string;
    Function AlterTB_ALARMDEVICERINGCOUNT_Delete : string;
    Function AlterTB_ALARMDEVICETelNo_Add : string;
    Function AlterTB_ALARMDEVICEUPDATE : string;
    Function AlterTB_ALARMEVENTAlarmGRADE_Add : string;
    Function AlterTB_ALARMEVENTAlarmSound_Add : string;
    Function AlterTB_ALARMEVENTCardno_Add : string;
    Function AlterTB_ALARMEVENTCheckUser_Add : string;
    Function AlterTB_ALARMEVENTCodeChange : string;
    Function AlterTB_ALARMEVENTKTTSENDSTATUS_Add: string;
    Function AlterTB_ALARMEVENTOperChange : string;
    Function AlterTB_ALARMEVENTSTATECODE2Add : string;
    Function AlterTB_ALARMSTATUSCODEALARMSOUND : string;
    Function AlterTB_ALARMSTATUSCODECodeChange :string;
    Function AlterTB_ALARMSTATUSCODEPrimaryDelete : string;
    Function AlterTB_ALARMSTATUSCODEGubun_Add : string;
    Function AlterTB_ALARMSTATUSCODEColor_Add : string;
    Function AlterTB_ATDAYSUMMARYCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_ATCODEAWCODE_Add : string;
    Function AlterTB_ATEMPEXTRACompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_ATEVENTCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_ATMONTHEXTRACompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_ATMONTHSUMMARYCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_ATVACATIONCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_BASEPAYCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_CARDCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_CARDDoorGrade : string;
    Function AlterTB_COMPANYCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_COMPANYDepartCodeChange(aLen:string='10') : string;
    Function AlterTB_COMPANYJijumCodeChange(aLen:string='10') : string;
    Function AlterTB_COMPANYUPDATECHECK:string;
    Function AlterTB_CONFIG_ValueChange:string;
    Function AlterTB_DOORALARMLONG_Add : string;
    Function AlterTB_DOORControlTime_Change : string;
    Function AlterTB_DOORDSOPEN_Add : string;
    Function AlterTB_DOORGUBUN : string;
    Function AlterTB_DOORNameChange : string;
    Function AlterTB_DOOROPENMONI_Add : string;
    Function AlterTB_DOORRegSend_Add : string;
    Function AlterTB_DOORREMOTEDOOR_Add : string;
    Function AlterTB_DOORSENDDOOR_Add : string;
    Function AlterTB_DOORUPDATE : string;
    Function AlterTB_EMPHISCARDNO : string;
    Function AlterTB_EMPHISCARDTYPE : string;
    Function AlterTB_EMPHISCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_EMPHISCOMPANYNAME : string;
    Function AlterTB_EMPHISDEPARTNAME : string;
    Function AlterTB_EMPHISEMNAME : string;
    Function AlterTB_EMPHISHANDPHONE : string;
    Function AlterTB_EMPHISINSERTTIME : string;
    Function AlterTB_EMPHISJIJUMNAME : string;
    Function AlterTB_EMPHISPOSINAME : string;
    Function AlterTB_EMPHISSENDSTATUS2 :string;
    Function AlterTB_EMPLOYEEAWCODE_Add : string;
    Function AlterTB_EMPLOYEECompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_EMPLOYEEDepartCodeChange(aLen:string='10') : string;
    Function AlterTB_EMPLOYEEEmNameChange : string;
    Function AlterTB_EMPLOYEEJijumCodeChange(aLen:string='10') : string;
    Function AlterTB_EMPLOYEEPosiCodeChange(aLen:string='10') : string;
    Function AlterTB_EMPLOYEERelayGubun:string;
    Function AlterTB_FOODNameChange:string;
    Function AlterTB_FOODEVENTCompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_FOODGRADECompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_FTPLISTRetryCount : string;
    Function AlterTB_HOLIDAYState : string;
    Function AlterTB_KTCARDISSUEWriteAdd : string;
    Function AlterTB_KTCARDISSUEWriteDateAdd : string;
    Function AlterTB_READERBuildPosi_Add : string;
    Function AlterTB_READERDoorPosi_Add : string;
    Function AlterTB_READERInOutCount :string;
    Function AlterTB_READERReaderVer_Add : string;
    Function AlterTB_READERRegSend_Add : string;
    Function AlterTB_POSICompanyCodeChange(aLen:string='10') : string;
    Function AlterTB_POSIPosiCodeChange(aLen:string='10') : string;
    Function AlterTB_POSIUPDATECHECK:string;
    Function AlterTB_ZONEDEVICEUPDATE : string;
    Function AlterTB_ZONEDEVICEDelayUse_Add : string;
    Function AlterTB_ZONEDEVICEPortRecovery_Add : string;
    Function AlterTB_ZONEDEVICERegSend_Add : string;
    Function AlterTB_DEVICECARDNO_downseq : string;
    Function AlterTB_KTTMAPPINGCODE_SendUse : string;
    Function AlterTB_ZONEDEVICENameChange : string;

  end;

var
  PostGreSql: TPostGreSql;

implementation
uses
  uDataModule1;

{$R *.dfm}

{ TPostGreSql }

{ TPostGreSql }

function TPostGreSql.AlterTB_ACCESSDEVICEArmControlRing_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_ARMRING integer DEFAULT 10 NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEDaemonGubun: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DAEMONGUBUN int DEFAULT 1 NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEDeviceCode_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DEVICECODE varchar(20) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEDeviceType_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DEVICETYPE char(1) DEFAULT ''0'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEDisArmControlRing_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DISARMRING integer DEFAULT 10 NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEDoor1Type_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DOOR1TYPE char(1) DEFAULT ''2'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEDoor2Type_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DOOR2TYPE char(1) DEFAULT ''2'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEHoSend: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD HO_SEND varchar(1) DEFAULT ''N'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEInDelay_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_INDELAY integer DEFAULT 10 NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEJaejung_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_JAEJUNG char(1) DEFAULT ''N'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICELinkusSystemID_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_LINKUSID varchar(10) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICELinkusTelNo_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_LINKUSTELNO varchar(14) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEOutDelay_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_OUTDELAY integer DEFAULT 10 NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEPowerType_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_POWERTYPE char(1) DEFAULT ''0'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEReaderType_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_READERTYPE char(1) DEFAULT ''0'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEReaderType_Delete: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE DROP COLUMN AC_READERTYPE ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICERegSend_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD REG_SEND varchar(1) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEUPDATE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_UPDATE varchar(1) ';
  result := stSql;
end;

function TPostGreSql.AlterTB_ACCESSEVENTCOMPANYCODE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD CO_COMPANYCODE varchar(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSEVENTCompanyCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ACCESSEVENT alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSEVENTDEPARTCODE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD CO_DEPARTCODE varchar(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSEVENTDepartCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ACCESSEVENT alter column  CO_DEPARTCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSEVENTEMCODE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD EM_CODE varchar(20) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSEVENTEMCODEChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ACCESSEVENT alter column  EM_CODE TYPE varchar(50) ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSEVENTEMNAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD EM_NAME varchar(50) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSEVENTJIJUMCODE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD CO_JIJUMCODE varchar(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSEVENTJijumCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ACCESSEVENT alter column  CO_JIJUMCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ADMINAreaCode: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD LO_AREACODE varchar(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ADMINBuildingGrade: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD AD_BUILDINGGRADE CHAR(1) DEFAULT ''4'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ADMINCompanyCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ADMIN alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ADMINCOMPANYCompanyCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ADMINCOMPANY alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ADMINCOMPANYDepartCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ADMINCOMPANY alter column  CO_DEPARTCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ADMINCOMPANYJijumCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ADMINCOMPANY alter column  CO_JIJUMCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ADMINDepartCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ADMIN alter column  CO_DEPARTCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ADMINDongCode: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD LO_DONGCODE varchar(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ADMINFloorCode: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD LO_FLOORCODE varchar(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ADMINJijumCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ADMIN alter column  CO_JIJUMCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICEALARMID_Delete: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE DROP COLUMN AL_ALARMID ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICEINDELAY_Delete: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE DROP COLUMN AL_INDELAY ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICEmemo_Add: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ALARMDEVICE ADD AL_MEMO VARCHAR(100) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICEMUXTEL_Delete: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE DROP COLUMN AL_MUXTELNO ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICEOUTDELAY_Delete: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE DROP COLUMN AL_OUTDELAY ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICERegSend_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE ADD REG_SEND varchar(1) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICERINGCOUNT_Delete: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE DROP COLUMN AL_REMOTERINGCNT ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICETelNo_Add: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ALARMDEVICE ADD AL_TELNO VARCHAR(30) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICEUPDATE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE ADD AL_UPDATE varchar(1) ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMEVENTAlarmGRADE_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_ALARMGRADE int ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMEVENTAlarmSound_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_SOUND char(1) ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMEVENTCardno_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD CA_CARDNO varchar(20) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMEVENTCheckUser_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_CHECKUSER varchar(30) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMEVENTCodeChange: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AL_ALARMSTATUSCODE TYPE varchar(5) ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMEVENTOperChange: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AL_OPERATOR TYPE varchar(30) ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMEVENTSTATECODE2Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_STATUSCODE2 varchar(5) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMSTATUSCODEALARMSOUND: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMSTATUSCODE ADD AL_ALARMSOUND int DEFAULT 0 NOT NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMSTATUSCODECodeChange: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMSTATUSCODE ALTER COLUMN AL_ALARMSTATUSCODE TYPE varchar(5) ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMSTATUSCODEPrimaryDelete: string;
begin

end;

function TPostGreSql.AlterTB_BASEPAYCompanyCodeChange(
  aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_BASEPAY alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ATDAYSUMMARYCompanyCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ATDAYSUMMARY alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;
end;

function TPostGreSql.AlterTB_ATEMPEXTRACompanyCodeChange(aLen:string='10'): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ATEMPEXTRA alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ATEVENTCompanyCodeChange(
  aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ATEVENT alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ATMONTHEXTRACompanyCodeChange(
  aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ATMONTHEXTRA alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ATMONTHSUMMARYCompanyCodeChange(
  aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ATMONTHSUMMARY alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ATVACATIONCompanyCodeChange(
  aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ATVACATION alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_CARDDoorGrade: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARD ADD CA_DOORGRADE char(1) DEFAULT ''N'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_COMPANYUPDATECHECK: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_COMPANY ADD CO_UPDATECHECK char(1) DEFAULT ''N'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_DOORALARMLONG_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_ALARMLONG char(1) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_DOORControlTime_Change: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_DOOR alter column  DO_CONTROLTIME TYPE char(1) ';
  result := stSql;
end;

function TPostGreSql.AlterTB_DOORDSOPEN_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_DSOPEN char(1) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_DOORGUBUN: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_GUBUN varchar(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_DOOROPENMONI_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_OPENMONI char(1) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_DOORRegSend_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD REG_SEND varchar(1) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_DOORREMOTEDOOR_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_REMOTEDOOR char(1) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_DOORSENDDOOR_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_SENDDOOR char(1) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_DOORUPDATE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_UPDATE varchar(1) ';
  result := stSql;
end;

function TPostGreSql.AlterTB_EMPHISCARDNO: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD CA_CARDNO varchar(20) NULL ';
  result := stSql;
end;

function TPostGreSql.AlterTB_EMPHISCARDTYPE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD CA_CARDTYPE varchar(1) NULL ';
  result := stSql;
end;

function TPostGreSql.AlterTB_EMPHISCOMPANYNAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD COMPANY_NAME varchar(50) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPHISDEPARTNAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD DEPART_NAME varchar(50) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPHISEMNAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD EM_NAME varchar(20) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPHISHANDPHONE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD EM_HANDPHONE varchar(14) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPHISINSERTTIME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD EH_INSERTTIME varchar(14) NULL ';
  result := stSql;
end;

function TPostGreSql.AlterTB_EMPHISJIJUMNAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD JIJUM_NAME varchar(50) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPHISPOSINAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD PO_NAME varchar(30) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPHISSENDSTATUS2: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD SEND_STATUS2 varchar(1) NULL ';
  result := stSql;
end;

function TPostGreSql.AlterTB_EMPLOYEEEmNameChange: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ALTER COLUMN EM_NAME TYPE varchar(50) ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPLOYEERelayGubun: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD RG_CODE varchar(3) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_FTPLISTRetryCount: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_FTPLIST ADD FL_RETRYCOUNT INTEGER DEFAULT 0 NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_HOLIDAYState: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_HOLIDAY ADD HO_STATE varchar(1) DEFAULT ''I'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_KTCARDISSUEWriteAdd: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_KTCARDISSUE ADD KI_WRITE char(1) DEFAULT ''N'' NULL ';
  result := stSql;
end;

function TPostGreSql.AlterTB_KTCARDISSUEWriteDateAdd: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_KTCARDISSUE ADD KI_WRITEDATE varchar(8) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_POSIUPDATECHECK: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_POSI ADD PO_UPDATECHECK char(1) DEFAULT ''N'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_READERBuildPosi_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD BUILD_POSI varchar(1) DEFAULT ''0'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_READERDoorPosi_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD DOOR_POSI varchar(1) DEFAULT ''0'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_READERInOutCount: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_INOUTCOUNT int DEFAULT 0 NOT NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_READERReaderVer_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_VER varchar(50) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_READERRegSend_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD REG_SEND varchar(1) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ZONEDEVICEDelayUse_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONEDEVICE ADD AL_DELAYUSE varchar(1) DEFAULT ''0'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ZONEDEVICEPortRecovery_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONEDEVICE ADD AL_PORTRECOVERY varchar(1) DEFAULT ''0'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ZONEDEVICERegSend_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONEDEVICE ADD REG_SEND varchar(1) NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ZONEDEVICEUPDATE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ZONEDEVICE ADD AL_UPDATE varchar(1) ';
  result := stSql;

end;

function TPostGreSql.CreateTB_ALARMCODEGROUP: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMCODEGROUP (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AG_CODE varchar(30) NOT NULL,';
  stSql := stSql + ' AL_ALARMSTATUSCODE varchar(5) NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AG_CODE,AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TPostGreSql.CreateTB_ALARMMODENOTCARD: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMMODENOTCARD (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AN_CODE varchar(5) NOT NULL,';
  stSql := stSql + ' AN_NOTDATA varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AN_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TPostGreSql.CreateTB_ALARMSHOW: string;
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

  result := stSql;
end;

function TPostGreSql.CreateTB_CARDTYPE: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDTYPE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CT_CODE varchar(1) NOT NULL,';
  stSql := stSql + ' CT_NAME varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, CT_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TPostGreSql.CreateTB_DAEMONMULTI: string;
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

  result := stSql;
end;

function TPostGreSql.CreateTB_DEVICECARDNOACKINDEX: string;
var
  stSql : string;
begin
  stSql := 'CREATE INDEX TB_DEVICECARDNOACK ';
  stSql := stSql + ' ON TB_DEVICECARDNO ';
  stSql := stSql + ' (GROUP_CODE, DE_RCVACK)';

  result := stSql;
end;

function TPostGreSql.CreateTB_DEVICESETTINGINFO: string;
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

  result := stSql;
end;

function TPostGreSql.CreateTB_DOORGUBUN: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOORGUBUN (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' DG_CODE varchar(3) NOT NULL,';
  stSql := stSql + ' DG_NAME varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,DG_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TPostGreSql.CreateTB_EMPHIS: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPHIS (';
  stSql := stSql + ' SEQ serial NOT NULL,';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE varchar(3) NOT NULL,';
  stSql := stSql + ' EM_CODE varchar(20) NULL,';
  stSql := stSql + ' FDMS_ID INTEGER NULL,';
  stSql := stSql + ' MODE char(1) NULL,';
  stSql := stSql + ' SEND_STATUS char(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TPostGreSql.CreateTB_FormName: string;
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

  result := stSql;
end;

function TPostGreSql.CreateTB_FTPLIST: string;
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

  result := stSql;
end;

function TPostGreSql.CreateTB_INOUTCOUNT: string;
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

  result := stSql;

end;

function TPostGreSql.CreateTB_INOUTGROUP: string;
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

  result := stSql;
end;

function TPostGreSql.CreateTB_KTCARDISSUE: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_KTCARDISSUE (';
  stSql := stSql + ' GROUP_CODE VARCHAR(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_CODE VARCHAR(20) NOT NULL,';
  stSql := stSql + ' CARD_SEQ INTEGER NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,EM_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TPostGreSql.CreateTB_MAPLOCATION: string;
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
  stSql := stSql + ' ML_NAME varchar(50) NULL,';
  stSql := stSql + ' ML_IMAGE varchar(100) NULL,';
  stSql := stSql + ' ML_IMAGEUSE varchar(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,ML_COUNTRY, ML_BUILDING,ML_FLOOR,ML_AREA,ML_GUBUN) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TPostGreSql.CreateTB_MAPPOSITION: string;
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

  result := stSql;
end;

function TPostGreSql.CreateTB_MAPZONE: string;
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
  stSql := stSql + ' MZ_NORMALIMAGE varchar(100) NULL,';
  stSql := stSql + ' MZ_ALARMIMAGE varchar(100) NULL,';
  stSql := stSql + ' MZ_ALERTIMAGE varchar(100) NULL,';
  stSql := stSql + ' ML_COUNTRY varchar(3) NULL,';
  stSql := stSql + ' ML_BUILDING varchar(3) NULL,';
  stSql := stSql + ' ML_FLOOR varchar(3) NULL,';
  stSql := stSql + ' ML_AREA varchar(3) NULL,';
  stSql := stSql + ' ML_GUBUN varchar(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,MZ_PORTNUM,MZ_PORTSEQ) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TPostGreSql.CreateTB_NOTCARDALARMCODE: string;
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

  result := stSql;

end;

function TPostGreSql.CreateTB_PERRELAYCONFIG: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_PERRELAYCONFIG (';
  stSql := stSql + ' GROUP_CODE VARCHAR(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' PC_CONFIGCODE VARCHAR(30) NOT NULL,';
  stSql := stSql + ' PC_CONFIGVALUE VARCHAR(500) NULL,';
  stSql := stSql + ' PC_CONFIGDETAIL VARCHAR(50) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,PC_CONFIGCODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TPostGreSql.CreateTB_RELAYGUBUN: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_RELAYGUBUN (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' RG_CODE varchar(3) NOT NULL,';
  stSql := stSql + ' RG_NAME varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,RG_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TPostGreSql.CreateTB_SERVERCARDRELAY: string;
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

  result := stSql;
end;

function TPostGreSql.CreateTB_SERVERCARDRELAYHIS: string;
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

  result := stSql;
end;

function TPostGreSql.CreateTB_WORKLOG: string;
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

  result := stSql;
end;

function TPostGreSql.CreateView_CARD: string;
var
  stSql : string;
begin
  stSql := 'CREATE OR REPLACE VIEW vi_cardinfo AS ';
  stSql := stSql + 'SELECT a.group_code, a.ca_cardno, a.em_code, b.em_name, b.co_companyname, b.co_jijumname, b.co_departname, b.po_name, b.co_companycode, b.co_jijumcode, b.co_departcode, b.po_posicode ';
  stSql := stSql + ' FROM tb_card a ';
  stSql := stSql + ' LEFT JOIN ( SELECT a.group_code, a.em_code, a.em_name, b.co_name AS co_companyname, c.co_name AS co_jijumname, d.co_name AS co_departname, e.po_name, a.co_companycode, a.co_jijumcode, a.co_departcode, a.po_posicode ';
  stSql := stSql + '    FROM tb_employee a ';
  stSql := stSql + '    LEFT JOIN tb_company b ON a.group_code = b.group_code AND a.co_companycode = b.co_companycode AND b.co_gubun = ''1'' ';
  stSql := stSql + ' LEFT JOIN tb_company c ON a.group_code = c.group_code AND a.co_companycode = b.co_companycode AND a.co_jijumcode = b.co_jijumcode AND b.co_gubun = ''2'' ';
  stSql := stSql + ' LEFT JOIN tb_company d ON a.group_code = d.group_code AND a.co_companycode = d.co_companycode AND a.co_jijumcode = d.co_jijumcode AND a.co_departcode = d.co_departcode AND b.co_gubun = ''3'' ';
  stSql := stSql + ' LEFT JOIN tb_posi e ON a.group_code = e.group_code AND a.co_companycode = e.co_companycode AND a.po_posicode = e.po_posicode ) b ON a.group_code = b.group_code AND a.co_companycode = b.co_companycode AND a.em_code = b.em_code' ;

  result := stSql;
end;

function TPostGreSql.SelectAreaLocation: string;
var
  stSql : string;
begin
  //구역코드 로딩
  stSql := ' Select a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' From TB_LOCATION a ';
  stSql := stSql + ' Inner Join ';
  stSql := stSql + ' (select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE,b.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,a.AD_USERID ';
  end;
  stSql := stSql + ' from TB_Door b ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR a  ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE AND a.AC_NODENO=b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID AND a.DO_DOORNO=b.DO_DOORNO) ';
    end;
  end;
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select d.LO_DONGCODE,d.LO_FLOORCODE,d.LO_AREACODE,d.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,c.AD_USERID ';
  end;
  stSql := stSql + ' from TB_ALARMDEVICE d ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join  TB_ADMINALARMDEVICE c ';
      stSql := stSql + ' ON (c.GROUP_CODE = d.GROUP_CODE ';
      stSql := stSql + ' AND c.AC_NODENO = d.AC_NODENO ';
      stSql := stSql + ' AND c.AC_ECUID = d.AC_ECUID )';
    end;
  end;
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND d.AC_NODENO = e.AC_NODENO ';
  stSql := stSql + ' AND d.AC_ECUID = e.AC_ECUID ) ';  }
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select g.LO_DONGCODE,g.LO_FLOORCODE,g.LO_AREACODE,g.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,f.AD_USERID ';
  end;

  stSql := stSql + ' from TB_FOOD g ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD f ';
      stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE AND f.AC_NODENO=g.AC_NODENO ';
      stSql := stSql + ' AND f.AC_ECUID = g.AC_ECUID AND f.FO_DOORNO = g.FO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' )b ' ;
  stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE ' ;
  stSql := stSql + ' AND a.LO_FLOORCODE = b.LO_FLOORCODE ' ;
  stSql := stSql + ' AND a.LO_AREACODE = b.LO_AREACODE )' ;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
  stSql := stSql + ' AND a.LO_GUBUN = ''2'' ';
  stSql := stSql + ' Group by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' Order by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_GUBUN ';

  result := stSql;
end;

function TPostGreSql.SelectBuildingTB_ALARMEVENTFromDayToDay(aFromDate,
  aToDate, aNodeNo, aEcuId, aBuildingCode, aFloorCode, aAreaCode,
  aAlarmType: string): string;
var
  stSql :string;
begin
  stSql := 'Select a.AL_DATE,a.AL_TIME,a.AC_ECUID,c.AL_ZONENAME,a.AL_OPERATOR,f.AL_ALARMDEVICETYPENAME as AL_ALARMDEVICETYPECODE, ';
  stSql := stSql + ' a.AL_ALARMMODECODE,a.AL_ZONENO,a.AL_ALARMSTATUSCODE,d.AL_ALARMNAME,a.AL_SUBADDR,';
  stSql := stSql + ' a.AL_CHECKCODE,a.AL_CHECKMSG,a.AL_UPDATEOPERATOR,e.AC_DEVICENAME ,';
  stSql := stSql + ' g.LO_NAME as BUILDINGNAME,h.LO_NAME as FLOORNAME,i.LO_NAME as AREANAME,a.al_updatetime ';
  stSql := stSql + ' From TB_ALARMEVENT a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  )';
    end;
  end;
  stSql := stSql + ' Left Join TB_ALARMDEVICE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  )';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_STATUSCODE2 = d.AL_ALARMSTATUSCODE ) ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON( a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = e.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = e.AC_ECUID ) ';
  stSql := stSql + ' Left Join TB_ALARMDEVICETYPECODE f ';
  stSql := stSql + ' ON(a.AL_ALARMDEVICETYPECODE = f.AL_ALARMDEVICETYPECODE ) ';
  stSql := stSql + ' Left Join TB_LOCATION g ';
  stSql := stSql + ' ON ( c.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND c.LO_DONGCODE = g.LO_DONGCODE  ';
  stSql := stSql + ' AND g.LO_GUBUN = ''0''  )';
  stSql := stSql + ' Left Join TB_LOCATION h ';
  stSql := stSql + ' ON ( c.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND c.LO_DONGCODE = h.LO_DONGCODE  ';
  stSql := stSql + ' AND c.LO_FLOORCODE = h.LO_FLOORCODE  ';
  stSql := stSql + ' AND h.LO_GUBUN = ''1''  )';
  stSql := stSql + ' Left Join TB_LOCATION i ';
  stSql := stSql + ' ON ( c.GROUP_CODE = i.GROUP_CODE ';
  stSql := stSql + ' AND c.LO_DONGCODE = i.LO_DONGCODE  ';
  stSql := stSql + ' AND c.LO_FLOORCODE = i.LO_FLOORCODE  ';
  stSql := stSql + ' AND c.LO_AREACODE = i.LO_AREACODE  ';
  stSql := stSql + ' AND i.LO_GUBUN = ''2''  )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AL_DATE BETWEEN ''' + aFromDate
                 + ''' AND ''' + aToDate + ''' ';
  if Trim(aNodeNo) <> '' then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuId + ''' ';
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then stSql := stSql + ' AND c.LO_DONGCODE = ''' + aBuildingCode + ''' ' ;
    if (aFloorCode <> '') and (aFloorCode <> '000') then stSql := stSql + ' AND c.LO_FLOORCODE = ''' + aFloorCode + ''' ' ;
    if (aAreaCode <> '') and (aAreaCode <> '000') then stSql := stSql + ' AND c.LO_AREACODE = ''' + aAreaCode + ''' ' ;

  end;
  if Trim(aAlarmType) <> '' then
  begin
    stSql := stSql + ' AND a.AL_STATUSCODE2 = ''' + aAlarmType + ''' ' ;
  end;

  result := stSql;
end;

function TPostGreSql.SelectDongLocation: string;
var
  stSql : string;
begin
  //동코드 로딩
  stSql := ' Select a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' From TB_LOCATION a ';
  stSql := stSql + ' Inner Join (';
  stSql := stSql + ' select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE,b.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,a.AD_USERID ';
  end;
  stSql := stSql + ' from TB_Door b ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR a ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE AND a.AC_NODENO=b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID AND a.DO_DOORNO=b.DO_DOORNO) ';
    end;
  end;
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select d.LO_DONGCODE,d.LO_FLOORCODE,d.LO_AREACODE,d.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ',c.AD_USERID ' ;
  end;
  stSql := stSql + ' from TB_ALARMDEVICE d ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE c  ';
      stSql := stSql + ' ON (c.GROUP_CODE = d.GROUP_CODE ';
      stSql := stSql + ' AND c.AC_NODENO = d.AC_NODENO ';
      stSql := stSql + ' AND c.AC_ECUID = d.AC_ECUID ) ';
    end;
  end;
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE AND d.AC_NODENO=e.AC_NODENO ';
  stSql := stSql + ' AND d.AC_ECUID = e.AC_ECUID ) ';  }
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select g.LO_DONGCODE,g.LO_FLOORCODE,g.LO_AREACODE,g.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,f.AD_USERID ';
  end;
  stSql := stSql + ' from TB_FOOD g ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD f  ';
      stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE AND f.AC_NODENO=g.AC_NODENO ';
      stSql := stSql + ' AND f.AC_ECUID = g.AC_ECUID AND f.FO_DOORNO = g.FO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' )b ' ;
  stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE )' ;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.LO_GUBUN = ''0'' ';
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
  stSql := stSql + ' Group by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' Order by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_GUBUN ';
  result := stSql;
end;

function TPostGreSql.SelectECUDeviceLoad: string;
var
  stSql : string;
begin
  //ECU정보 로딩
  stSql := ' Select a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AC_DEVICENAME';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join  ';
      stSql := stSql + ' (select AC_NODENO,AC_MCUID,AC_ECUID,AD_USERID,GROUP_CODE from TB_ADMINDOOR ';
      stSql := stSql + ' Union all ';
      stSql := stSql + ' select b.AC_NODENO,b.AC_MCUID,b.AC_ECUID,a.AD_USERID,a.GROUP_CODE from TB_ADMINALARMDEVICE a  ';
      stSql := stSql + ' Inner Join TB_ALARMDEVICE b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
      stSql := stSql + ' Union all ';
      stSql := stSql + ' select AC_NODENO,AC_MCUID,AC_ECUID,AD_USERID,GROUP_CODE from TB_ADMINFOOD ) b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID) ';
    end;
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
  stSql := stSql + ' Group by a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AC_DEVICENAME ';
  stSql := stSql + ' Order by a.AC_NODENO,a.AC_ECUID ';

  result := stSql;
end;

function TPostGreSql.SelectFloorLocation: string;
var
  stSql : string;
begin
  //층코드 로딩
  stSql := ' Select a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' From TB_LOCATION a ';
  stSql := stSql + ' Inner Join ';
  stSql := stSql + ' (select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE,b.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,a.AD_USERID ';
  end;
  stSql := stSql + ' from TB_Door b ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR a ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE AND a.AC_NODENO=b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID AND a.DO_DOORNO=b.DO_DOORNO) ';
    end;
  end;
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select d.LO_DONGCODE,d.LO_FLOORCODE,d.LO_AREACODE,d.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,c.AD_USERID ';
  end;
  stSql := stSql + ' from TB_ALARMDEVICE d ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE c  ';
      stSql := stSql + ' ON (c.GROUP_CODE = d.GROUP_CODE ';
      stSql := stSql + ' AND c.AC_NODENO = d.AC_NODENO ';
      stSql := stSql + ' AND c.AC_ECUID = d.AC_ECUID ) ';
    end;
  end;
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND d.AC_NODENO=e.AC_NODENO ';
  stSql := stSql + ' AND d.AC_ECUID = e.AC_ECUID ) '; }
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select g.LO_DONGCODE,g.LO_FLOORCODE,g.LO_AREACODE,g.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,f.AD_USERID ';
  end;
  stSql := stSql + ' from  TB_FOOD g ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD f ';
      stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE AND f.AC_NODENO=g.AC_NODENO ';
      stSql := stSql + ' AND f.AC_ECUID = g.AC_ECUID AND f.FO_DOORNO = g.FO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' )b ' ;
  stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE ' ;
  stSql := stSql + ' AND a.LO_FLOORCODE = b.LO_FLOORCODE )' ;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.LO_GUBUN = ''1'' ';
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
  stSql := stSql + ' Group by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' Order by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_GUBUN ';

  result := stSql;
end;

function TPostGreSql.SelectMapAreaAll: string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_MAPLOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ML_GUBUN = ''3'' ';
  result := stSql;

end;

function TPostGreSql.SelectMapBuildingAll: string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_MAPLOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ML_GUBUN = ''1'' ';
  result := stSql;

end;

function TPostGreSql.SelectMapBuildingCountryID(
  aCountryID: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_MAPLOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ML_COUNTRY = ''' + aCountryID + ''' ';
  stSql := stSql + ' AND ML_GUBUN = ''1'' ';
  result := stSql; 
end;

function TPostGreSql.SelectMapCountryAll: string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_MAPLOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ML_GUBUN = ''0'' ';
  result := stSql;

end;

function TPostGreSql.SelectMapFloorAll: string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_MAPLOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ML_GUBUN = ''2'' ';
  result := stSql;

end;

function TPostGreSql.SelectMapFloorBuildingID(aCountryID,
  aBuildingID: string): string;
var
  stSql : string;
begin
  stSql := ' Select * from TB_MAPLOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ML_COUNTRY = ''' + aCountryID + ''' ';
  stSql := stSql + ' AND ML_BUILDING = ''' + aBuildingID + ''' ';
  stSql := stSql + ' AND ML_GUBUN = ''2'' ';
  result := stSql;

end;

function TPostGreSql.SelectMCUDeviceLoad: string;
var
  stSql : string;
begin
  //MCU LAN 정보 조회
  stSql := ' Select a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AC_MCUIP,a.AC_MCUPORT,a.AC_DAEMONGUBUN ';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join  ';
      stSql := stSql + ' (select AC_NODENO,AC_MCUID,AC_ECUID,AD_USERID,GROUP_CODE from TB_ADMINDOOR ';
      stSql := stSql + ' Union all ';
      stSql := stSql + ' select b.AC_NODENO,b.AC_MCUID,b.AC_ECUID,a.AD_USERID,a.GROUP_CODE from TB_ADMINALARMDEVICE a  ';
      stSql := stSql + ' Inner Join TB_ALARMDEVICE b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID =  b.AC_ECUID ) ';
      stSql := stSql + ' Union all ';
      stSql := stSql + ' select AC_NODENO,AC_MCUID,AC_ECUID,AD_USERID,GROUP_CODE from TB_ADMINFOOD ) b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO) ';
    end;
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_ECUID = ''00'' ';
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
  stSql := stSql + ' Group by a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AC_MCUIP,a.AC_MCUPORT,a.AC_DAEMONGUBUN ';
  stSql := stSql + ' Order by a.AC_NODENO ';

  result := stSql;
end;

function TPostGreSql.SelectNewTB_ALARMEVENTFromDayToDay(aFromDate, aToDate,
  aNodeNo, aEcuId, aAlarmType: string): string;
var
  stSql :string;
begin
  stSql := 'Select a.AL_DATE,a.AL_TIME,a.AC_ECUID,c.AL_ZONENAME,a.AL_OPERATOR,f.AL_ALARMDEVICETYPENAME as AL_ALARMDEVICETYPECODE, ';
  stSql := stSql + ' a.AL_ALARMMODECODE,a.AL_ZONENO,a.AL_ALARMSTATUSCODE,d.AL_ALARMNAME,a.AL_SUBADDR,';
  stSql := stSql + ' a.AL_CHECKCODE,a.AL_CHECKMSG,a.AL_UPDATEOPERATOR,e.AC_DEVICENAME,a.AL_STATUSCODE2,a.al_updatetime ';
  stSql := stSql + ' From TB_ALARMEVENT a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  )';
    end;
  end;
  stSql := stSql + ' Left Join TB_ALARMDEVICE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  )';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_STATUSCODE2 = d.AL_ALARMSTATUSCODE ) ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON( a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = e.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = e.AC_ECUID ) ';
  stSql := stSql + ' Left Join TB_ALARMDEVICETYPECODE f ';
  stSql := stSql + ' ON(a.AL_ALARMDEVICETYPECODE = f.AL_ALARMDEVICETYPECODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AL_DATE BETWEEN ''' + aFromDate
                 + ''' AND ''' + aToDate + ''' ';
  if Trim(aNodeNo) <> '' then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuId + ''' ';
  end;
  if Trim(aAlarmType) <> '' then
  begin
    stSql := stSql + ' AND ( a.AL_ALARMSTATUSCODE = ''' + aAlarmType + ''' ' ;
    stSql := stSql + ' OR a.AL_STATUSCODE2 = ''' + aAlarmType + ''') ' ;
  end;
  
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND c.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND c.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND c.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND c.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND c.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND c.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end;

  result := stSql;
end;

function TPostGreSql.SelectNotCardReport(aUseDate, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode: string): string;
var
  stSql : string;
begin
  stSql := ' Select c.CO_NAME as CO_COMPANYNAME,d.CO_NAME as CO_JIJUMNAME, ';
  stSql := stSql + ' e.CO_NAME as CO_DEPARTNAME,f.PO_NAME,a.CO_COMPANYCODE, ';
  stSql := stSql + ' a.EM_CODE, a.CA_CARDNO,a.CA_LASTUSE,a.CA_CARDTYPE, b.* ';
  stSql := stSql + ' FROM TB_CARD a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE AND b.CO_COMPANYCODE = c.CO_COMPANYCODE AND c.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (b.GROUP_CODE = d.GROUP_CODE AND b.CO_COMPANYCODE = d.CO_COMPANYCODE AND b.CO_JIJUMCODE = d.CO_JIJUMCODE AND d.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON (b.GROUP_CODE = e.GROUP_CODE AND b.CO_COMPANYCODE = e.CO_COMPANYCODE AND b.CO_JIJUMCODE = e.CO_JIJUMCODE AND b.CO_DEPARTCODE = e.CO_DEPARTCODE AND  e.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON (b.GROUP_CODE = f.GROUP_CODE AND b.CO_COMPANYCODE = f.CO_COMPANYCODE AND b.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if aUseDate <> '' then
  begin
    stSql := stSql + ' AND ( a.CA_LASTUSE <= ''' + aUseDate + ''' ';
    stSql := stSql + ' OR a.CA_LASTUSE IS NULL ) ';
  end;
  if (aCompanyCode <> '000') and (aCompanyCode <> '') then
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if (aJijumCode <> '000') and (aJijumCode <> '') then
    stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if (aDepartCode <> '000') and (aDepartCode <> '') then
    stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  if (aPosiCode <> '000') and (aPosiCode <> '') then
    stSql := stSql + ' AND b.PO_POSICODE = ''' + aPosiCode + ''' ';



  result := stSql;
end;

function TPostGreSql.SelectNotPTReport(aFromDate, aToDate, aBuildingCode,
  aFloorCode: string): string;
var
  stSql : string;
begin
  stSql := ' select a.AL_ZONENAME,b.LO_NAME as buildingname,c.LO_NAME as floorname,d.LO_NAME as areaname ';
  stSql := stSql + ' from TB_ALARMDEVICE a ';
  stSql := stSql + ' left Join ( select * from TB_LOCATION where LO_GUBUN = ''0'') b ';
  stSql := stSql + ' on (a.GROUP_CODE = b.GROUP_CODE AND a.LO_DONGCODE = b.LO_DONGCODE) ';
  stSql := stSql + ' left Join ( select * from TB_LOCATION where LO_GUBUN = ''1'') c ';
  stSql := stSql + ' on (a.GROUP_CODE = c.GROUP_CODE AND a.LO_DONGCODE = c.LO_DONGCODE and a.LO_FLOORCODE = c.LO_FLOORCODE) ';
  stSql := stSql + ' left Join ( select * from TB_LOCATION where LO_GUBUN = ''2'') d ';
  stSql := stSql + ' on (a.GROUP_CODE = d.GROUP_CODE AND a.LO_DONGCODE = d.LO_DONGCODE and a.LO_FLOORCODE = d.LO_FLOORCODE and a.LO_AREACODE = d.LO_AREACODE) ';
  stSql := stSql + ' where a.GROUP_CODE = '''+GROUPCODE + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' and a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' and a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' and not exists ';
  stSql := stSql + ' (select * from TB_ALARMEVENT e ';
  stSql := stSql + ' where a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' and a.AC_NODENO = e.AC_NODENO ';
  stSql := stSql + ' and a.AC_ECUID = e.AC_ECUID ';
  stSql := stSql + ' and e.AL_DATE between ''' + aFromDate + ''' and '''+ aToDate + ''' ';
  stSql := stSql + ' and (e.AL_STATUSCODE2 = ''A1'' or e.AL_STATUSCODE2 = ''C1'') ) ';


  result := stSql;
end;

function TPostGreSql.SelectTB_ACCESSEVENTChangeFromDayToDay(aFromDate,
  aToDate, aNodeNo, aEcuId, aDoorNo, aDoorGubunCode, aPermitCode,
  aCompanyCode, aJijumCode, aDepartCode, aEmCode, aEmName: string; aDoorGubun: Boolean): string;
var
  stSql : string;
begin
  stSql := 'Select a.AC_DATE,a.AC_TIME,';
  stSql := stSql + 'd.DO_DOORNONAME,';
  stSql := stSql + ' a.AC_READERNO,a.AC_DOORPOSI,a.CA_CARDNO, ';
  stSql := stSql + ' g.CO_NAME as CO_COMPANYNAME,h.CO_NAME as CO_JIJUMNAME, i.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' a.EM_CODE,a.EM_NAME,c.PE_PERMITNAME,  a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE ';
  stSql := stSql + ' From TB_ACCESSEVENT a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    end else
    begin
      if BuildingGrade <> 0 then
      begin
        stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
        stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
        stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
      end;
    end;
  end;
  stSql := stSql + ' Inner Join TB_PERMITCODE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  AND a.PE_PERMITCODE = c.PE_PERMITCODE ) ';
  stSql := stSql + ' Left Join TB_DOOR d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID  ';
  stSql := stSql + ' AND a.DO_DOORNO = d.DO_DOORNO ';
  if aDoorGubunCode <> '' then
    stSql := stSql + ' AND d.DO_GUBUN = ''' + aDoorGubunCode + ''' ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join TB_CARD e ';
  stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE  AND a.CA_CARDNO = e.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_COMPANY g ';
  stSql := stSql + ' ON (a.GROUP_CODE = g.GROUP_CODE AND a.CO_COMPANYCODE = g.CO_COMPANYCODE AND g.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY h ';
  stSql := stSql + ' ON (a.GROUP_CODE = h.GROUP_CODE AND a.CO_COMPANYCODE = h.CO_COMPANYCODE AND a.CO_JIJUMCODE = h.CO_JIJUMCODE AND h.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY i ';
  stSql := stSql + ' ON (a.GROUP_CODE = i.GROUP_CODE AND a.CO_COMPANYCODE = i.CO_COMPANYCODE AND a.CO_JIJUMCODE = i.CO_JIJUMCODE AND a.CO_DEPARTCODE = i.CO_DEPARTCODE AND  i.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_INPUTTYPE = ''C'' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND b.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end;
  stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + aFromDate + ''' AND ''' + aToDate + ''' ';
  if Trim(aNodeNo) <> ''  then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.DO_DOORNO = ''' + aDoorNo + ''' ';
  end;
  if Trim(aPermitCode) <> '' then
  begin
    stSql := stSql + ' AND c.PE_PERMITCODE = ''' + aPermitCode + ''' ';
  end;
  if Trim(aCompanyCode) <> '' then
  begin
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;
  if Trim(aJijumCode) <> '' then
  begin
    stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  end;
  if Trim(aDepartCode) <> '' then
  begin
    stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  end;
  if Trim(aEmCode) <> '' then
  begin
    stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';
  end;
  if Trim(aEmName) <> '' then
  begin
    stSql := stSql + ' AND a.EM_NAME LIKE ''%' + aEmName + '%'' ';
  end;
  result := stSql;
end;

function TPostGreSql.SelectTB_ACCESSEVENTDupCheck(aTimestr, aNodeNo,
  aECUID, aDoorNo, aCardNo: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_ACCESSEVENT ';
  stSql := stSql + ' where AC_DATE = ''' + copy(aTimestr,1,8) + '''';
  stSql := stSql + ' AND AC_TIME = ''' + copy(aTimestr,9,6) + '''';
  stSql := stSql + ' AND AC_NODENO = ' + intTostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';
  stSql := stSql + ' and DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' and CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';
  result := stSql;
end;

function TPostGreSql.SelectTB_ACCESSEVENTFromDayToDay(aFromDate, aToDate,
  aNodeNo, aEcuId, aDoorNo,aDoorGubunCode, aPermitCode,aCompanyCode,aJijumCode,
  aDepartCode,aPosiCode,aEmCode,aEmName,aEmTypeCode:string;aDoorGubun:Boolean):string;
var
  stSql : string;
begin
{  stSql := ' Select a.AC_DATE,a.AC_TIME,d.DO_DOORNONAME, ';
  stSql := stSql + ' a.AC_READERNO,a.CA_CARDNO,e.CO_COMPANYNAME,e.CO_JIJUMNAME, e.CO_DEPARTNAME,';
  stSql := stSql + ' e.PO_NAME,e.EM_CODE,e.EM_NAME,c.PE_PERMITNAME, ';
  stSql := stSql + ' e.CO_COMPANYCODE,e.CO_JIJUMCODE,e.CO_DEPARTCODE,e.PO_POSICODE ';
  stSql := stSql + ' From TB_ACCESSEVENT a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
    stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
  end;
  stSql := stSql + ' Inner Join TB_PERMITCODE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.PE_PERMITCODE = c.PE_PERMITCODE )';
  stSql := stSql + ' Inner Join TB_DOOR d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = d.DO_DOORNO ) ';
  stSql := stSql + ' Left Join ( ';
  stSql := stSql + ' select a.GROUP_CODE,a.CA_CARDNO,a.EM_CODE,b.EM_NAME,b.CO_COMPANYNAME,';
  stSql := stSql + ' b.CO_JIJUMNAME,b.CO_DEPARTNAME,b.PO_NAME, ';
  stSql := stSql + ' b.CO_COMPANYCODE,b.CO_JIJUMCODE,b.CO_DEPARTCODE,b.PO_POSICODE ';
  stSql := stSql + ' from TB_CARD a ';
  stSql := stSql + ' Left Join ( ';
  stSql := stSql + ' select a.GROUP_CODE,a.EM_CODE,a.EM_NAME,b.CO_NAME as CO_COMPANYNAME,';
  stSql := stSql + ' c.CO_NAME as CO_JIJUMNAME,d.CO_NAME as CO_DEPARTNAME,e.PO_NAME, ';
  stSql := stSql + ' a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_COMPANY b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_GUBUN = ''1'')';
  stSql := stSql + ' Left Join TB_COMPANY c';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
  stSql := stSql + ' AND b.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY d';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = d.CO_DEPARTCODE ';
  stSql := stSql + ' AND b.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI e  ';
  stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE  ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.PO_POSICODE = e.PO_POSICODE ) ';
  stSql := stSql + ' )b  ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE)) e ';
  stSql := stSql + ' Left Join TB_CARD f ';
  stSql := stSql + ' ON (a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = f.CA_CARDNO ) ';
  stSql := stSql + ' Left Join vi_cardinfo e ';
  stSql := stSql + ' ON (f.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND f.CA_CARDNO = e.CA_CARDNO ) ';}

  stSql := 'Select a.AC_DATE,a.AC_TIME,';
  stSql := stSql + 'd.DO_DOORNONAME,';
  stSql := stSql + ' a.AC_READERNO,a.AC_DOORPOSI,a.CA_CARDNO, ';
  stSql := stSql + ' g.CO_NAME as CO_COMPANYNAME,h.CO_NAME as CO_JIJUMNAME, i.CO_NAME as CO_DEPARTNAME, j.PO_NAME, ';
  stSql := stSql + ' f.EM_CODE,f.EM_NAME,c.PE_PERMITNAME,  f.CO_COMPANYCODE,f.CO_JIJUMCODE,f.CO_DEPARTCODE,f.PO_POSICODE ';
  stSql := stSql + ' From TB_ACCESSEVENT a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    end else
    begin
      if BuildingGrade <> 0 then
      begin
        stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
        stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
        stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
      end;
    end;
  end;
  stSql := stSql + ' Inner Join TB_PERMITCODE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  AND a.PE_PERMITCODE = c.PE_PERMITCODE ) ';
  stSql := stSql + ' Inner Join TB_DOOR d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID  ';
  stSql := stSql + ' AND a.DO_DOORNO = d.DO_DOORNO ';
  if aDoorGubunCode <> '' then
    stSql := stSql + ' AND d.DO_GUBUN = ''' + aDoorGubunCode + ''' ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join TB_CARD e ';
  stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE  AND a.CA_CARDNO = e.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE f ';
  stSql := stSql + ' ON (e.GROUP_CODE = f.GROUP_CODE AND e.CO_COMPANYCODE = f.CO_COMPANYCODE AND e.EM_CODE = f.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY g ';
  stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE AND f.CO_COMPANYCODE = g.CO_COMPANYCODE AND g.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY h ';
  stSql := stSql + ' ON (f.GROUP_CODE = h.GROUP_CODE AND f.CO_COMPANYCODE = h.CO_COMPANYCODE AND f.CO_JIJUMCODE = h.CO_JIJUMCODE AND h.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY i ';
  stSql := stSql + ' ON (f.GROUP_CODE = i.GROUP_CODE AND f.CO_COMPANYCODE = i.CO_COMPANYCODE AND f.CO_JIJUMCODE = i.CO_JIJUMCODE AND f.CO_DEPARTCODE = i.CO_DEPARTCODE AND  i.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Left Join TB_POSI j ';
  stSql := stSql + ' ON (f.GROUP_CODE = j.GROUP_CODE AND f.CO_COMPANYCODE = j.CO_COMPANYCODE AND f.PO_POSICODE = j.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_INPUTTYPE = ''C'' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND b.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end;
  stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + aFromDate + ''' AND ''' + aToDate + ''' ';
  if Trim(aNodeNo) <> ''  then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.DO_DOORNO = ''' + aDoorNo + ''' ';
  end;
  if Trim(aPermitCode) <> '' then
  begin
    stSql := stSql + ' AND c.PE_PERMITCODE = ''' + aPermitCode + ''' ';
  end;
  if Trim(aCompanyCode) <> '' then
  begin
    stSql := stSql + ' AND f.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;
  if Trim(aJijumCode) <> '' then
  begin
    stSql := stSql + ' AND f.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  end;
  if Trim(aDepartCode) <> '' then
  begin
    stSql := stSql + ' AND f.CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  end;
  if Trim(aPosiCode) <> '' then
  begin
    stSql := stSql + ' AND f.PO_POSICODE = ''' + aPosiCode + ''' ';
  end;
  if Trim(aEmCode) <> '' then
  begin
    stSql := stSql + ' AND f.EM_CODE = ''' + aEmCode + ''' ';
  end;
  if Trim(aEmName) <> '' then
  begin
    stSql := stSql + ' AND f.EM_NAME LIKE ''%' + aEmName + '%'' ';
  end;
  if Trim(aEmTypeCode) <> '' then
  begin
    stSql := stSql + ' AND f.RG_CODE = ''' + aEmTypeCode + ''' ';
  end;
  result := stSql;
end;

function TPostGreSql.SelectTB_ACCESSEVENTFromDayToTime(aFromDate,
  aStartTime, aEndTime, aNodeNo, aEcuId, aDoorNo,aDoorGubunCode, aPermitCode,
  aCompanyCode, aJijumCode, aDepartCode, aPosiCode, aEmCode, aEmName,
  aEmTypeCode: string;aDoorGubun:Boolean): string;
var
  stSql : string;
begin

  stSql := 'Select a.AC_DATE,a.AC_TIME,d.DO_DOORNONAME,  a.AC_READERNO,a.CA_CARDNO, ';
  stSql := stSql + ' g.CO_NAME as CO_COMPANYNAME,h.CO_NAME as CO_JIJUMNAME, i.CO_NAME as CO_DEPARTNAME, j.PO_NAME, ';
  stSql := stSql + ' f.EM_CODE,f.EM_NAME,c.PE_PERMITNAME,  f.CO_COMPANYCODE,f.CO_JIJUMCODE,f.CO_DEPARTCODE,f.PO_POSICODE ';
  stSql := stSql + ' From TB_ACCESSEVENT a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    end else
    begin
      if BuildingGrade <> 0 then
      begin
        stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
        stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
        stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
      end;
    end;
  end;
  stSql := stSql + ' Inner Join TB_PERMITCODE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  AND a.PE_PERMITCODE = c.PE_PERMITCODE ) ';
  stSql := stSql + ' Inner Join TB_DOOR d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID  ';
  stSql := stSql + ' AND a.DO_DOORNO = d.DO_DOORNO ';
  if aDoorGubunCode <> '' then
    stSql := stSql + ' AND d.DO_GUBUN = ''' + aDoorGubunCode + ''' ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join TB_CARD e ';
  stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE  AND a.CA_CARDNO = e.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE f ';
  stSql := stSql + ' ON (e.GROUP_CODE = f.GROUP_CODE AND e.CO_COMPANYCODE = f.CO_COMPANYCODE AND e.EM_CODE = f.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY g ';
  stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE AND f.CO_COMPANYCODE = g.CO_COMPANYCODE AND g.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY h ';
  stSql := stSql + ' ON (f.GROUP_CODE = h.GROUP_CODE AND f.CO_COMPANYCODE = h.CO_COMPANYCODE AND f.CO_JIJUMCODE = h.CO_JIJUMCODE AND h.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY i ';
  stSql := stSql + ' ON (f.GROUP_CODE = i.GROUP_CODE AND f.CO_COMPANYCODE = i.CO_COMPANYCODE AND f.CO_JIJUMCODE = i.CO_JIJUMCODE AND f.CO_DEPARTCODE = i.CO_DEPARTCODE AND  i.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Left Join TB_POSI j ';
  stSql := stSql + ' ON (f.GROUP_CODE = j.GROUP_CODE AND f.CO_COMPANYCODE = j.CO_COMPANYCODE AND f.PO_POSICODE = j.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_INPUTTYPE = ''C'' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND b.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end;
  stSql := stSql + ' AND a.AC_DATE = ''' + aFromDate + ''' ';
  stSql := stSql + ' AND a.AC_TIME BETWEEN ''' + aStartTime + ''' AND ''' + aEndTime + ''' ';
  if Trim(aNodeNo) <> ''  then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.DO_DOORNO = ''' + aDoorNo + ''' ';
  end;
  if Trim(aPermitCode) <> '' then
  begin
    stSql := stSql + ' AND c.PE_PERMITCODE = ''' + aPermitCode + ''' ';
  end;
  if Trim(aCompanyCode) <> '' then
  begin
    stSql := stSql + ' AND f.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;
  if Trim(aJijumCode) <> '' then
  begin
    stSql := stSql + ' AND f.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  end;
  if Trim(aDepartCode) <> '' then
  begin
    stSql := stSql + ' AND f.CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  end;
  if Trim(aPosiCode) <> '' then
  begin
    stSql := stSql + ' AND f.PO_POSICODE = ''' + aPosiCode + ''' ';
  end;
  if Trim(aEmCode) <> '' then
  begin
    stSql := stSql + ' AND f.EM_CODE = ''' + aEmCode + ''' ';
  end;
  if Trim(aEmName) <> '' then
  begin
    stSql := stSql + ' AND f.EM_NAME LIKE ''%' + aEmName + '%'' ';
  end;
  if Trim(aEmTypeCode) <> '' then
  begin
    stSql := stSql + ' AND f.RG_CODE = ''' + aEmTypeCode + ''' ';
  end;
  result := stSql;
end;

function TPostGreSql.SelectTB_ACCESSEVENTJOINATDEVICE(aFromDate,
  aToDate:string): string;
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
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + aFromDate + ''' AND ''' + aToDate + ''' ';
  stSql := stSql + ' order by a.AC_DATE ASC,a.AC_TIME ASC ';
  result := stSql;
end;

function TPostGreSql.SelectTB_ACCESSEVENTPersonState(aFromDate, aToDate,
  aNodeNo, aEcuId, aDoorNo, aDoorGubunCode, aCompanyCode, aJijumCode,
  aDepartCode, aPosiCode, aEmCode, aEmName: string;
  aDoorGubun: Boolean): string;
var
  stSql : string;
begin
  stSql := 'Select ';
  if aDoorGubun then
    stSql := stSql + 'k.DG_NAME as DO_DOORNONAME ,'
  else stSql := stSql + 'd.DO_DOORNONAME,';
  stSql := stSql + ' g.CO_NAME as CO_COMPANYNAME,h.CO_NAME as CO_JIJUMNAME, i.CO_NAME as CO_DEPARTNAME, j.PO_NAME, ';
  stSql := stSql + ' f.EM_CODE,f.EM_NAME,';
  stSql := stSql + ' sum(a.ACCESS) as ACCESS,  ';
  stSql := stSql + ' sum(a.NOTACCESS) as NOTACCESS,  ';
  stSql := stSql + ' sum(a.SUMD) as SUMD ';
  stSql := stSql + ' From ';
  stSql := stSql + ' ( select * ,';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN PE_PERMITCODE = ''1'' then 1 ';
  stsql := stSql + ' WHEN PE_PERMITCODE = ''2'' then 1 ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as ACCESS, ';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN PE_PERMITCODE = ''1'' then 0 ';
  stsql := stSql + ' WHEN PE_PERMITCODE = ''2'' then 0 ';
  stSql := stSql + ' ELSE 1 ';
  stSql := stSql + ' END as NOTACCESS, 1 as SUMD ';
  stSql := stSql + ' from TB_ACCESSEVENT ';
  stSql := stSql + ')a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    end else
    begin
      if BuildingGrade <> 0 then
      begin
        stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
        stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID) ';
      end;
    end;
  end;
  stSql := stSql + ' Inner Join TB_PERMITCODE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  AND a.PE_PERMITCODE = c.PE_PERMITCODE ) ';
  stSql := stSql + ' Inner Join TB_DOOR d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID  ';
  stSql := stSql + ' AND a.DO_DOORNO = d.DO_DOORNO ';
  if aDoorGubunCode <> '' then
    stSql := stSql + ' AND d.DO_GUBUN = ''' + aDoorGubunCode + ''' ';
  stSql := stSql + ' ) ';
  //stSql := stSql + ' Left Join TB_CARD e ';
  //stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE  AND a.CA_CARDNO = e.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE f ';
  stSql := stSql + ' ON (a.GROUP_CODE = f.GROUP_CODE AND a.CO_COMPANYCODE = f.CO_COMPANYCODE AND a.EM_CODE = f.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY g ';
  stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE AND f.CO_COMPANYCODE = g.CO_COMPANYCODE AND g.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY h ';
  stSql := stSql + ' ON (f.GROUP_CODE = h.GROUP_CODE AND f.CO_COMPANYCODE = h.CO_COMPANYCODE AND f.CO_JIJUMCODE = h.CO_JIJUMCODE AND h.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY i ';
  stSql := stSql + ' ON (f.GROUP_CODE = i.GROUP_CODE AND f.CO_COMPANYCODE = i.CO_COMPANYCODE AND f.CO_JIJUMCODE = i.CO_JIJUMCODE AND f.CO_DEPARTCODE = i.CO_DEPARTCODE AND  i.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Left Join TB_POSI j ';
  stSql := stSql + ' ON (f.GROUP_CODE = j.GROUP_CODE AND f.CO_COMPANYCODE = j.CO_COMPANYCODE AND f.PO_POSICODE = j.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_DOORGUBUN k ';
  stSql := stSql + ' ON (d.GROUP_CODE = k.GROUP_CODE AND d.DO_GUBUN = k.DG_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_INPUTTYPE = ''C'' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND b.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end;

  stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + aFromDate + ''' AND ''' + aToDate + ''' ';
  if Trim(aNodeNo) <> ''  then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.DO_DOORNO = ''' + aDoorNo + ''' ';
  end;
  if Trim(aCompanyCode) <> '' then
  begin
    stSql := stSql + ' AND f.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;
  if Trim(aJijumCode) <> '' then
  begin
    stSql := stSql + ' AND f.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  end;
  if Trim(aDepartCode) <> '' then
  begin
    stSql := stSql + ' AND f.CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  end;
  if Trim(aPosiCode) <> '' then
  begin
    stSql := stSql + ' AND f.PO_POSICODE = ''' + aPosiCode + ''' ';
  end;
  if Trim(aEmCode) <> '' then
  begin
    stSql := stSql + ' AND f.EM_CODE = ''' + aEmCode + ''' ';
  end;
  if Trim(aEmName) <> '' then
  begin
    stSql := stSql + ' AND f.EM_NAME LIKE ''%' + aEmName + '%'' ';
  end;
  if aDoorGubun then
    stSql := stSql + ' GROUP BY k.DG_NAME,'
  else stSql := stSql + ' GROUP BY d.DO_DOORNONAME,';
  stSql := stSql + ' g.CO_NAME,h.CO_NAME, i.CO_NAME, j.PO_NAME, ';
  stSql := stSql + ' f.EM_CODE,f.EM_NAME';

  result := stSql;
end;

function TPostGreSql.SelectTB_ALARMDEVICEGetAlarmInfo: string;
var
  stSql : string;
begin
  stSql := ' Select a.AC_NODENO,b.AC_MCUIP,b.AC_MCUPORT,b.AC_MCUID, ';
  stSql := stSql + ' b.AC_DEVICENAME as MCU_NAME,c.AC_ECUID,c.AC_DEVICENAME as ECU_NAME ';
  stSql := stSql + ' from TB_ALARMDEVICE a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_ECUID = ''00'' ) ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';

  result := stSql;
end;

function TPostGreSql.selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,
  aFloorCode, aAreaCode: string;aNodeNo:string='000'): string;
var
  stSql : string;
begin
  stSql := 'select a.AL_ZONENAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID ';
  stSql := stSql + ' from TB_ALARMDEVICE a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      if (aNodeNo <> '000') and isdigit(aNodeNo) then
      begin
        stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
      end else
      begin
        if (aBuildingCode <> '') and (aBuildingCode <> '000') then
          stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
        else
          stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        if (aFloorCode <> '') and (aFloorCode <> '000') then
          stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
        if (aAreaCode <> '') and (aAreaCode <> '000') then
          stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
      end;
    end else if BuildingGrade = 2 then
    begin
      if (aNodeNo <> '000') and isdigit(aNodeNo) then
      begin
        stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
      end else
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
      end;
    end else if BuildingGrade = 3 then
    begin
      if (aNodeNo <> '000') and isdigit(aNodeNo) then
      begin
        stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
      end else
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
      end;
    end else
    begin
      if (aNodeNo <> '000') and isdigit(aNodeNo) then
      begin
        stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
      end else
      begin
        if BuildingGrade = 4 then  stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''' ';
        if (aBuildingCode <> '') and (aBuildingCode <> '000') then
          stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
        if (aFloorCode <> '') and (aFloorCode <> '000') then
          stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
        if (aAreaCode <> '') and (aAreaCode <> '000') then
          stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
      end;
    end;
  end else
  begin
    if (aNodeNo <> '000') and isdigit(aNodeNo) then
    begin
      stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
    end else
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
  end;

  result := stSql;
end;

function TPostGreSql.selectTB_ALARMDEVICEJoinPromiseCode(
  aPromisecode: string): string;
var
  stSql :string;
begin
  stSql := 'select a.AL_ZONENAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID, ';
  stSql := stSql + 'd.DE_DOOR1,d.DE_DOOR2,d.DE_USEALARM,d.DE_PERMIT ';
  stSql := stSql + ' from TB_ALARMDEVICE a ';
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';  }
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
    end;
  end;
  stSql := stSql + ' Inner Join (select * from TB_DEVICECARDNO_PROMISE where PR_NAME = ''' + aPromisecode + ''' ) d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
    end else if BuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''' ';
  end;

  result := stSql;
end;

function TPostGreSql.SelectTB_ALARMEVENTFromALARMCatch: string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.AL_ALARMNAME,b.AL_ALARMVIEW,b.AL_ALARMGRADE,b.AL_ALARMSOUND ';
  stSql := stSql + ' From TB_ALARMEVENT a ';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE b ';
  stSql := stSql + ' ON(a.AL_ALARMSTATUSCODE = b.AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AL_CHECKOK <> ''Y'' ';
  stSql := stSql + ' AND b.AL_ALARMVIEW <> 0 ';
  stSql := stSql + ' Order by b.AL_ALARMGRADE DESC, a.al_date DESC,a.al_time DESC ';

  result := stSql;
end;

function TPostGreSql.SelectTB_ALARMEVENTFromDayToDay(aFromDate, aToDate,
  aNodeNo, aEcuId, aAlarmType: string;aOrderASC:Boolean=True): string;
var
  stSql :string;
begin
  stSql := 'Select a.AL_DATE,a.AL_TIME,c.AL_ZONENAME,a.AL_OPERATOR,a.AL_ALARMDEVICETYPECODE, ';
  stSql := stSql + ' a.AL_ALARMMODECODE,a.AL_ZONENO,a.AL_ALARMSTATUSCODE,d.AL_ALARMNAME,a.AL_SUBADDR,';
  stSql := stSql + ' a.AL_CHECKCODE,a.AL_CHECKMSG,a.AL_UPDATEOPERATOR,e.AC_DEVICENAME ';
  stSql := stSql + ' From TB_ALARMEVENT a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  )';
    end;
  end;
  stSql := stSql + ' Left Join TB_ALARMDEVICE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  )';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_ALARMSTATUSCODE = d.AL_ALARMSTATUSCODE ) ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON( a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = e.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = e.AC_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AL_DATE BETWEEN ''' + aFromDate
                 + ''' AND ''' + aToDate + ''' ';
  if Trim(aNodeNo) <> '' then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuId + ''' ';
  end;
  if Trim(aAlarmType) <> '' then
  begin
    stSql := stSql + ' AND a.AL_ALARMSTATUSCODE = ''' + aAlarmType + ''' ' ;
  end;
  
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND c.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND c.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND c.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND c.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND c.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND c.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end;

  if aOrderASC then
    stSql := stsql + ' Order by a.AL_DATE ASC '
  else stSql := stsql + ' Order by a.AL_DATE DESC ';
  result := stSql;
end;

function TPostGreSql.SelectTB_ALARMGRADEJoinBase(aBuildingCode,aFloorCode,aAreaCode,aCardNo:string): string;
var
  stSql : string;
begin
  stSql := ' select a.AL_ZONENAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,c.DE_RCVACK   ';
  stSql := stSql + ' From TB_ALARMDEVICE a ';
{  stSql := stSql + ' INNER JOIN TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) '; }
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO c  ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  ';
  stSql := stSql + ' AND c.DE_USEALARM = ''Y'' ';
  stSql := stSql + ' AND c.DE_PERMIT = ''L''  ';
  stSql := stSql + ' )  ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE d ';
      stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND c.CA_CARDNO = ''' + aCardNo + ''' ';
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
      if BuildingGrade = 4 then stSql := stSql + ' AND d.AD_USERID = ''' + Master_ID + ''' ';
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

  result := stSql;
end;

function TPostGreSql.SelectTB_ATEVENTDaySummary(aDate, aCompanyCode,
  aEmCode: string): string;
var
  stSql : string;
begin
  stSql := ' select a.AT_DATE,a.CO_COMPANYCODE,a.EM_CODE,a.AT_INTIME,a.AT_OUTTIME,a.AT_LEAVETIME,a.AT_BACKTIME,';
  stSql := stSql + ' a.AT_INCODE,b.AT_INTYPE,a.AT_OUTCODE,c.AT_OUTTYPE,';
  stSql := stSql + ' d.* ';
  stSql := stSql + ' from TB_ATEVENT a';
  stSql := stSql + ' Left JOIN TB_ATINCODE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_INCODE = b.AT_INCODE ) ';
  stSql := stSql + ' Left JOIN TB_ATOUTCODE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_OUTCODE = c.AT_OUTCODE ) ';
  stSql := stSql + ' Left Join TB_ATCODE d ';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_ATCODE = d.AT_ATCODE ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';
  result := stSql;
end;

function TPostGreSql.SelectTB_ATEVENTDupCheck(aDate, aCompanyCode,
  aEmCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_ATEVENT ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_ATEVENTFromDayBase(aDate: string;aCardCheck:Boolean = False): string;
var
  stSql : string;
begin
  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME,f.AT_ATCODE,j.AT_CODENAME,f.AT_INTIME,f.AT_OUTTIME,I.PO_NAME,';
  stSql := stSql + ' f.AT_INCODE,g.AT_INNAME as JIKAK,f.AT_OUTCODE,h.AT_OUTNAME as JOTAE,f.AT_UPDATEOPERATOR, ';
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
  stSql := stSql + ' f.AT_CONTENT ';
  stSql := stSql + ' from TB_EMPLOYEE a  ';
  if aCardCheck then
  begin
    stSql := stSql + ' Inner Join TB_CARD b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stsql := stsql + ' AND a.EM_CODE = b.EM_CODE ';
    stSql := stSql + ' AND b.CA_CARDTYPE = ''1'' ) ';
  end;

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
  stSql := stSql + ' Left Join TB_ATEVENT f ';
  stSql := stSql + ' ON (a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = f.EM_CODE ';
  stSql := stSql + ' AND f.AT_DATE = ''' + aDate + ''') ';
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
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;

end;

function TPostGreSql.SelectTB_ATEVENTFromToDayBase(aFromDate,
  aToDate: string): string;
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
  stSql := stSql + ' f.AT_CONTENT ';
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
  stSql := stSql + ' AND f.AT_DATE Between ''' + aFromDate + ''' ';
  stSql := stSql + ' AND ''' + aToDate + ''') ';
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
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;

end;

function TPostGreSql.SelectTB_ATEVENTNonProcessFromDayToDay(aFromDate,
  aToDate: string): string;
var
  stSql : string;
begin
  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME,f.AT_INTIME,f.AT_OUTTIME,I.PO_NAME,';
  stSql := stSql + ' f.AT_INCODE,g.AT_INNAME as JIKAK,f.AT_OUTCODE,h.AT_OUTNAME as JOTAE, ';
  stSql := stSql + ' f.AT_CONTENT,b.CA_CARDNO,f.AT_DATE ';
  stSql := stSql + ' from TB_EMPLOYEE a  ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND b.CA_CARDTYPE = ''1'') ';
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
  stSql := stSql + ' AND f.AT_DATE BETWEEN ''' + aFromDate + ''' AND ''' + aToDate + ''' ';
  stSql := stSql + ' AND ( f.AT_INCODE = ''000'' OR f.AT_INCODE IS NULL OR f.AT_OUTCODE = ''000'' OR f.AT_OUTCODE IS NULL ';
  stSql := stSql + ' OR f.AT_INTIME IS NULL OR f.AT_OUTTIME IS NULL) )';
  stSql := stSql + ' Left Join TB_ATINCODE g ';
  stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_INCODE = g.AT_INCODE ) ';
  stSql := stSql + ' Left Join TB_ATOUTCODE h ';
  stSql := stSql + ' ON (f.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_OUTCODE = h.AT_OUTCODE ) ';
  stSql := stSql + ' Left Join TB_POSI I ';
  stSql := stSql + ' ON (a.GROUP_CODE = I.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = I.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = I.PO_POSICODE)  ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TPostGreSql.SelectTB_CARDAdminJoinBase: string;
var
  stSql : string;
begin
  stSql := 'select a.CA_CARDNO,a.CA_CARDTYPE,b.CO_COMPANYCODE,b.EM_NAME,b.EM_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_COMPANYNAME,b.CO_JIJUMCODE,d.CO_NAME as CO_JIJUMNAME,b.CO_DEPARTCODE,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME,a.CA_GUBUN,g.CT_NAME ';
  stSql := stSql + ' from TB_CARD a  ';
  stSql := stSql + ' Left JOIN TB_EMPLOYEE b ';
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
  stSql := stSql + ' Left Join TB_CARDTYPE g ';
  stSql := stSql + ' ON ( a.CA_GUBUN = g.CT_CODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';
  result := stSql;
end;


function TPostGreSql.SelectTB_CARDFromAlarmGradeJoinBase(aAC_NODENO,
  aAC_ECUID: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CA_CARDNO,a.CA_CARDTYPE,a.CA_LASTUSE,b.CO_COMPANYCODE,b.CO_JIJUMCODE,b.CO_DEPARTCODE,b.PO_POSICODE,b.EM_NAME,b.EM_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_COMPANYNAME,d.CO_NAME as CO_JIJUMNAME,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' f.PO_NAME ,g.DE_RCVACK';
  stSql := stSql + ' from TB_CARD a  ';
  stSql := stSql + ' Left JOIN TB_EMPLOYEE b ';
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
  stSql := stSql + ' AND G.DE_USEALARM = ''Y'' ';
  stSql := stSql + ' AND G.AC_NODENO = ' + aAC_NODENO ;
  stSql := stSql + ' AND G.AC_ECUID = ''' + aAC_ECUID + ''') ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_CARDFromDoorGradeJoinBase(aAC_NODENO,aAC_ECUID,
  aDoorNo: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CA_CARDNO,a.CA_CARDTYPE,a.CA_LASTUSE,b.CO_COMPANYCODE,b.EM_NAME,b.EM_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_COMPANYNAME,b.CO_JIJUMCODE,d.CO_NAME as CO_JIJUMNAME,b.CO_DEPARTCODE,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME,g.DE_RCVACK ';
  stSql := stSql + ' from TB_CARD a  ';
  stSql := stSql + ' Left JOIN TB_EMPLOYEE b ';
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
  stSql := stSql + ' AND G.DE_USEACCESS = ''Y'' ';
  stSql := stSql + ' AND G.AC_NODENO = ' + aAC_NODENO ;
  stSql := stSql + ' AND G.AC_ECUID = ''' + aAC_ECUID + ''' ';
  if aDoorNo = '1' then stSql := stSql + ' AND G.DE_DOOR1 = ''Y'' '
  else stSql := stSql + ' AND G.DE_DOOR2 = ''Y'' ';
  stSql := stSql + ')';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';

  result := stSql;

end;

function TPostGreSql.SelectTB_CARDJoinTBEmployee: string;
var
  stSql : string;
begin
  stSql := 'select a.CO_COMPANYCODE,a.CA_CARDNO,a.CA_CARDTYPE,c.CO_NAME as COMPANYNAME,';
  stSql := stSql + ' b.CO_JIJUMCODE,d.CO_NAME as JIJUMNAME,';
  stSql := stSql + ' b.CO_DEPARTCODE,e.CO_NAME as DEPARTNAME,';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME,';
  stSql := stSql + ' a.EM_CODE,b.EM_NAME,b.em_retiredate,b.FDMS_ID,b.EM_HANDPHONE ';
  stSql := stSql + ' from TB_CARD a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON(b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TPostGreSql.SelectTB_DEVICECARDNOCardPermit: string;
var
  stSql : string;
begin
  stSql := 'Select a.*,b.positionnum,c.em_retiredate from TB_DEVICECARDNO a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = c.EM_CODE ) ';
  result := stSql;
end;

function TPostGreSql.SelectTB_DEVICECARDNODownLoadCard: string;
var
  stSql : string;
begin
  stSql := 'Select ';
  stSql := stSql + 'a.ac_nodeno,a.ac_ecuid,a.ca_cardno,';
  stSql := stSql + 'a.de_door1,a.de_door2,a.de_useaccess,a.de_usealarm,';
  stSql := stSql + 'a.de_timecode,a.de_permit,a.ac_mcuid,b.positionnum,c.em_retiredate ';
  stSql := stSql + ' from TB_DEVICECARDNO a';
  stSql := stsql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ca_cardno = b.ca_cardno ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON( b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = c.EM_CODE )';
  result := stSql;
end;

function TPostGreSql.SelectTB_DOORGetDoorInfo: string;
var
  stSql : string;
begin
  stSql := ' Select a.AC_NODENO,a.DO_DoorNo,b.AC_MCUIP,b.AC_MCUPORT,b.AC_MCUID, ';
  stSql := stSql + ' b.AC_DEVICENAME as MCU_NAME,c.AC_ECUID,c.AC_DEVICENAME as ECU_NAME ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_ECUID = ''00'' ) ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';

  result := stSql ;

end;

function TPostGreSql.selectTB_DOORJoinAdmin(aBuildingCode, aFloorCode,
  aAreaCode: string;aDoorView:Boolean=True;aNodeNo:string='000'): string;
var
  stSql : string;
begin
  stSql := ' select a.DO_DOORNONAME,a.DO_DOORNO,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_VIEWSEQ ' ;
  stSql := stSql + ' from TB_DOOR a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO )';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aNodeNo <> '000') and isdigit(aNodeNo) then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  end else
  begin
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
  end;

  
  if aDoorView then stSql := stSql + ' order by a.DO_VIEWSEQ'
  else stSql := stSql + ' order by a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO';

  result := stSql;
end;

function TPostGreSql.selectTB_DOORJoinGrade(aBuildingCode, aFloorCode,
  aAreaCode, aCardNo: string): string;
var
  stSql :string;
begin
  stSql := ' select a.DO_VIEWSEQ,a.DO_DOORNONAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,b.DE_RCVACK  ';
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
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO )';
    end;
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND b.CA_CARDNO = ''' + aCardNo + ''' ';
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
      if BuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''' ';
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

  stSql := stSql + ' order by a.DO_VIEWSEQ ';

  result := stSql;
end;

function TPostGreSql.selectTB_DOORJoinPromiseCode(
  aPromisecode: string): string;
var
  stSql:string;
begin
  stSql := ' select a.DO_DOORNONAME,a.DO_DOORNO,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_VIEWSEQ, ' ;
  stSql := stSql + 'c.DE_DOOR1,c.DE_DOOR2,c.DE_USEALARM,c.DE_PERMIT ';
  stSql := stSql + ' from TB_DOOR a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO )';
    end;
  end;
  stSql := stSql + ' Inner Join (select * from TB_DEVICECARDNO_PROMISE where PR_NAME = ''' + aPromisecode + ''') c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
  stSql := stSql + ' order by a.DO_VIEWSEQ ';

  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEE: string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,c.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,';
  stSql := stSql + ' a.RG_CODE ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
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
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEATJoinATBasePAY: string;
var
  stSql : string;
begin
  stSql := ' select a.CO_COMPANYCODE,a.EM_CODE,b.PA_GUBUN,b.PA_AMT,';
  stSql := stSql + ' c.AT_WORKSTARTTIME,c.AT_WORKENDTIME ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' LEFT JOIN TB_BASEPAY b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND b.PA_CODE = ''001'') ';
  stSql := stSql + ' LEFT JOIN TB_ATCODE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_ATCODE = c.AT_ATCODE )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEATJoinBase: string;
var
  stSql : string;
begin
  stSql := 'select a.AW_CODE,c.CO_NAME as COMPANYNAME,a.EM_PASS, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,a.AT_ATCODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,';
  stSql := stSql + ' b.CA_CARDNO,b.CA_CARDTYPE,G.PA_GUBUN,G.PA_AMT ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ) ';
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
  stSql := stSql + ' Left Join TB_BASEPAY G ';
  stSql := stSql + ' ON ( a.GROUP_CODE = G.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = G.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.EM_CODE = G.EM_CODE  ';
  stSql := stSql + ' AND G.PA_CODE = ''001'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;

end;

function TPostGreSql.SelectTB_EMPLOYEEATJoinExtraBase: string;
var
  stSql : string;
begin
  stSql := 'select c.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' b.EX_TYPE,b.EX_WEARLYAMT,b.EX_WEXTENDAMT,b.EX_WNIGHTAMT,';
  stSql := stSql + ' b.EX_SEARLYAMT,b.EX_SEXTENDAMT,b.EX_SNIGHTAMT,';
  stSql := stSql + ' b.EX_HEARLYAMT,b.EX_HEXTENDAMT,b.EX_HNIGHTAMT ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_ATEMPEXTRA b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ) ';
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
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEATVacation(aMonth: string): string;
var
  stSql : string;
begin
  stSql := 'select ';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME, ';
  stSql := stSql + ' c.VA_DATE,c.AT_VACODE,d.AT_VAMARK ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Inner Join TB_ATVACATION c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = c.EM_CODE ';
  stSql := stSql + ' AND substring(c.VA_DATE,1,6) = ''' + aMonth + ''') ';
  stSql := stSql + ' Left Join TB_ATVACODE d ';
  stSql := stSql + ' ON (c.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND c.AT_VACODE = d.AT_VACODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEDupCardJoinBase: string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,a.FDMS_ID,c.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,a.RG_CODE ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
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
//  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEJoinACEventDayToDay(aFromDate,
  aToDate: string): string;
var
  stSql : string;
begin
  stSql := ' select c.AC_DATE,c.AC_TIME,d.AC_DEVICENAME,c.AC_READERNO,c.AC_BUTTONNO,';
  stSql := stSql + ' c.CA_CARDNO,e.CO_NAME as COMPANYNAME,';
  stSql := stSql + ' f.CO_NAME as JIJUMNAME,g.CO_NAME as DEPARTNAME,h.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE  ';
  stSql := stSql + ' From TB_EMPLOYEE a ';
  stSql := stSql + ' Inner Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' Inner Join TB_ACCESSEVENT c ';
  stSql := stSql + ' ON ( b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_CARDNO = c.CA_CARDNO  ';
  stSql := stSql + ' AND c.AC_DATE BETWEEN ''' + aFromDate + ''' ';
  stSql := stSql + ' AND ''' + aToDate + ''') ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE d ';
  stSql := stSql + ' ON(c.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND c.AC_NODENO = d.AC_NODENO ';
  stSql := stSql + ' AND c.AC_ECUID = d.AC_ECUID )';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY f ';
  stSql := stSql + ' ON ( a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = f.CO_JIJUMCODE ';
  stSql := stSql + ' AND f.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY g ';
  stSql := stSql + ' ON ( a.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = g.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = g.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = g.CO_DEPARTCODE ';
  stSql := stSql + ' AND g.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI h ';
  stSql := stSql + ' ON ( a.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = h.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = h.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEJoinATDAYSUMMARYDayToDay(aFromDate,
  aToDate: string): string;
var
  stSql : string;
begin
  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.EM_NAME,f.AT_INTIME,f.AT_OUTTIME,f.AT_LEAVETIME,f.AT_BACKTIME,I.PO_NAME,';
  stSql := stSql + ' f.AT_INCODE,g.AT_INNAME as AT_INNAME,f.AT_OUTCODE,h.AT_OUTNAME as AT_OUTNAME, ';
  stSql := stSql + ' f.AT_CONTENT,J.AT_CODENAME,b.* ';
  stSql := stSql + ' from TB_EMPLOYEE a  ';
  stSql := stSql + ' Inner Join TB_ATDAYSUMMARY b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND b.AT_DATE BETWEEN ''' + aFromDate + '''  ';
  stSql := stSql + ' AND ''' + aToDate + ''')  ';
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
  stSql := stSql + ' Left Join TB_ATEVENT f ';
  stSql := stSql + ' ON (b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = f.EM_CODE ';
  stSql := stSql + ' AND b.AT_DATE = f.AT_DATE )';
  stSql := stSql + ' Left Join TB_ATINCODE g ';
  stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_INCODE = g.AT_INCODE ) ';
  stSql := stSql + ' Left Join TB_ATOUTCODE h ';
  stSql := stSql + ' ON (f.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_OUTCODE = h.AT_OUTCODE ) ';
  stSql := stSql + ' Left Join TB_POSI I ';
  stSql := stSql + ' ON (a.GROUP_CODE = I.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = I.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = I.PO_POSICODE)  ';
  stSql := stSql + ' Left join TB_ATCODE J ';
  stSql := stSql + ' ON(f.GROUP_CODE = J.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_ATCODE = J.AT_ATCODE ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEJoinATEVENTDay(aDate, aCompanyCode,
  aEmCode: string): string;
var
  stSql : string;
begin
  stSql := ' SELECT b.EM_IMAGE,b.EM_NAME,b.EM_CODE,c.CO_NAME as CO_COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as CO_JIJUMNAME,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' f.PO_NAME,a.AT_INTIME,a.AT_OUTTIME,a.AT_LEAVETIME,a.AT_BACKTIME ';
  stSql := stSql + ' FROM TB_EMPLOYEE as b ';
  stSql := stSql + ' Left Join TB_ATEVENT a ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.AT_DATE = ''' + aDate + ''' ) ';
  stSql := stSql + ' Left JOIN TB_COMPANY c ';
  stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left JOIN TB_COMPANY d ';
  stSql := stSql + ' ON (b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left JOIN TB_COMPANY e ';
  stSql := stSql + ' ON (b.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left JOIN TB_POSI as f ';
  stSql := stSql + ' ON (b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND b.EM_CODE = ''' + aEmCode + ''' ';
  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEJoinATMONTHSUMMARY(
  aMonth: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.EM_NAME,';
  stSql := stSql + ' c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' I.PO_NAME,b.*';
  stSql := stSql + ' from TB_EMPLOYEE a  ';
  stSql := stSql + ' Inner Join TB_ATMONTHSUMMARY b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND b.AT_MONTH = ''' + aMonth + ''')  ';
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
  stSql := stSql + ' Left Join TB_POSI I ';
  stSql := stSql + ' ON (a.GROUP_CODE = I.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = I.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = I.PO_POSICODE)  ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEJoinBase: string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,c.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,';
  stSql := stSql + ' b.CA_CARDNO,b.CA_CARDTYPE,a.RG_CODE,a.FDMS_ID ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
//  stSql := stSql + ' AND b.CA_CARDTYPE <> ''4'' ';
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
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEJoinCARDRelayBase: string;
var
  stSql : string;
begin
  stSql := 'select g.FDMS_ID,b.CA_CARDNO,';
  stSql := stSql + ' g.CO_COMPANYCODE,c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.PO_POSICODE,f.PO_NAME,g.EM_CODE,a.EM_NAME,a.em_handphone,g.seq,g.SEND_STATUS,g.Mode ';
  stSql := stSql + ' from TB_EMPHIS g ';
  stSql := stSql + ' Left Join TB_EMPLOYEE a ';
  stSql := stSql + ' ON(g.GROUP_CODE = a.GROUP_CODE ';
  stSql := stSql + ' AND g.CO_COMPANYCODE = a.CO_COMPANYCODE ';
  stSql := stSql + ' AND g.EM_CODE = a.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(g.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND g.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND g.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND b.CA_GUBUN = ''1'' ) ';
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
  stSql := stSql + ' AND d.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Where g.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEJoinFoodCode(aDate,
  aFoodCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select  a.CO_COMPANYCODE,c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.EM_CODE,a.EM_NAME,f.FO_DATE,f.FO_TIME,a.PO_POSICODE,h.PO_NAME,';
  stSql := stSql + ' f.AC_NODENO,f.FO_DOORNO,f.AC_MCUID,f.AC_ECUID,';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN f.FO_PERMIT = ''Y'' then ''승인'' ';
  stsql := stSql + ' WHEN f.FO_PERMIT = ''N'' then ''미승인'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as PERMIT, ';
  stSql := stSql + ' f.FO_CONTENT,g.FO_CODENAME,f.FO_FOODAMT ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
{  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';  }
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
  stSql := stSql + ' AND d.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_FOODEVENT f ';
  stSql := stSql + ' ON (a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = f.EM_CODE ';
  stSql := stSql + ' AND f.FO_DATE = ''' + aDate + ''') ';
  stSql := stSql + ' Left Join TB_FOODCODE g ';
  stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND f.FO_FOODCODE = g.FO_FOODCODE) ';
  stSql := stSql + ' Left Join TB_POSI h ';
  stSql := stSql + ' ON ( a.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = h.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = h.PO_POSICODE ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if aFoodCode <> '' then
  stSql := stSql + ' AND f.FO_FOODCODE = ''' + aFoodCode + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEJoinFoodEventFromD2D(aFoodArea,aFoodCode,
  aFoodPermit, aStartDate, aEndDate: string): string;
var
  stSql : string;
begin
  stSql := 'Select SubString(b.FO_DATE,1,4) || ''-'' || SubString(b.FO_DATE,5,2) || ''-'' || SubString(b.FO_DATE,7,2) as FO_DATE,';
  stSql := stSql + 'SubString(b.FO_TIME,1,2) || '':'' || SubString(b.FO_TIME,3,2) || '':'' || SubString(b.FO_TIME,5,2) as FO_TIME, ' ;
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN b.FO_PERMIT = ''N'' then ''미승인'' ';
  stsql := stSql + ' WHEN b.FO_PERMIT = ''Y'' then ''승인'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as FO_PERMIT, ';
  stSql := stSql + ' b.FO_CONTENT,b.FO_FOODCODE,';
  stSql := stSql + ' b.AC_NODENO,b.AC_ECUID,b.FO_DOORNO, ';
  stSql := stSql + ' a.CO_COMPANYCODE,c.CO_NAME as COMPANY_NAME, ';
  stSql := stSql + ' a.CO_JIJUMCODE,d.CO_NAME as JIJUM_NAME, ';
  stSql := stSql + ' a.CO_DEPARTCODE,e.CO_NAME as DEPART_NAME,a.PO_POSICODE,f.PO_NAME, ';
  stSql := stSql + ' a.EM_CODE,a.EM_NAME,g.FO_CODENAME,h.FO_NAME ';
  stSql := stSql + ' From TB_EMPLOYEE a ';
  stSql := stSql + ' Inner Join TB_FOODEVENT b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND b.FO_DATE BETWEEN ''' + aStartDate + ''' ';
  stSql := stSql + ' AND ''' + aEndDate + ''' ';
  if aFoodCode <> '' then
    stSql := stSql + ' AND b.FO_FOODCODE = ''' + aFoodCode + ''' ';
  if aFoodPermit <> '' then
    stSql := stSql + ' AND b.FO_PERMIT = ''' + aFoodPermit + ''' ';
  stSql := stSql + ' ) ';
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
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Inner Join TB_FOODCODE g ';
  stSql := stSql + ' ON ( b.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND b.FO_FOODCODE = g.FO_FOODCODE ) ';
  stSql := stSql + ' Left Join TB_FOOD h ';
  stSql := stSql + ' ON (b.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND b.AC_NODENO = h.AC_NODENO ';
  stSql := stSql + ' AND b.AC_ECUID = h.AC_ECUID ';
  stSql := stSql + ' AND b.FO_DOORNO = h.FO_DOORNO ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if aFoodArea <> '' then
  begin
    stSql := stSql + ' AND b.AC_NODENO = ' + copy(aFoodArea,1,3);
    stSql := stSql + ' AND b.AC_ECUID = ''' + copy(aFoodArea,4,2) + ''' ';
    stSql := stSql + ' AND b.FO_DOORNO = ''' + copy(aFoodArea,6,1) + ''' ';
  end;
  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEJoinFOODGrade(aNonPay: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CO_COMPANYCODE,a.CO_COMPANYCODE,a.CO_DEPARTCODE,a.EM_CODE,a.PO_POSICODE,a.EM_NAME,';
  stSql := stSql + 'c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,f.PO_NAME,';
  stSql := stSql + 'b.FO_BREAKFIRST,b.FO_LUNCH,b.FO_DINNER,';
  stSql := stSql + 'b.FO_MIDNIGHT,b.FO_MONEY,';
  stSql := stSql + 'b.FO_WEBREAKFIRST,b.FO_WELUNCH,b.FO_WEDINNER,';
  stSql := stSql + 'b.FO_WEMIDNIGHT,';
  stSql := stSql + 'b.FO_HOBREAKFIRST,b.FO_HOLUNCH,b.FO_HODINNER,';
  stSql := stSql + 'b.FO_HOMIDNIGHT';
  stSql := stSql + ' from ';
  stSql := stSql + ' TB_EMPLOYEE a ';
  stSql := stSql + ' LEFT JOIN TB_COMPANY c  ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' LEFT JOIN TB_COMPANY d  ';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'')  ';
  stSql := stSql + ' LEFT JOIN TB_COMPANY e  ';
  stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE  ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''3'')  ';
  stSql := stSql + ' LEFT JOIN TB_POSI f  ';
  stSql := stSql + ' ON (a.GROUP_CODE = f.GROUP_CODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = f.PO_POSICODE)  ';
  stSql := stSql + ' Left Join TB_FOODGRADE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE)';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if aNonPay <> '' then stSql := stSql + ' AND b.FO_MONEY = ''' + aNonPay + ''' ';

  result := stSql;

end;

function TPostGreSql.SelectTB_EMPLOYEEJoinFoodState(aStarDate,
  aEndDate,aFoodArea,aFoodPermit: string): string;
var
  stSql : string;
begin
  stSql := 'Select  a.CO_COMPANYCODE,c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.PO_POSICODE,f.PO_NAME,a.EM_CODE,a.EM_NAME,';
  stSql := stSql + ' b.FO_BREAK,b.FO_LUNCH,b.FO_DINNER,b.FO_MIDNIGHT,b.TOT,b.FO_FOODAMT ';
  stSql := stSql + ' FROM  ';
  stSql := stSql + ' TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join ';
  stSql := stSql + ' (select aa.GROUP_CODE,aa.CO_COMPANYCODE,aa.EM_CODE,  ';
  stSql := stSql + ' SUM(aa.FO_BREAK) as FO_BREAK,   ';
  stSql := stSql + ' SUM(aa.FO_LUNCH) as FO_LUNCH,  ';
  stSql := stSql + ' SUM(aa.FO_DINNER) as FO_DINNER,  ';
  stSql := stSql + ' SUM(aa.FO_MIDNIGHT) as FO_MIDNIGHT,  ';
  stSql := stSql + ' SUM(aa.TOT) as TOT,    ';
  stSql := stSql + ' SUM(aa.FO_FOODAMT) as FO_FOODAMT ';
  stSql := stSql + ' From  ';
  stSql := stSql + ' ( select sa.GROUP_CODE,sa.FO_DATE,sa.CO_COMPANYCODE,sa.EM_CODE,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''001'' THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_BREAK,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''002'' THEN 1   ';
  stSql := stSql + ' ELSE 0 END as FO_LUNCH,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''003'' THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_DINNER,  ';
  stSql := stSql + ' CASE   ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''004'' THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_MIDNIGHT,  ';
  stSql := stSql + ' 1 as TOT,   ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''001'' THEN sb.FO_BREAKAMT ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''002'' THEN sb.FO_LUNCHAMT ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''003'' THEN sb.FO_EVENINGAMT ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''004'' THEN sb.FO_MIDNIGHTAMT ';
  stSql := stSql + ' ELSE 0 END as FO_FOODAMT   ';
  stSql := stSql + ' from  ';
  stSql := stSql + ' TB_FOODEVENT sa  ';
  stSql := stSql + ' Left Join TB_FOOD sb ';
  stSql := stSql + ' ON(sa.GROUP_CODE = sb.GROUP_CODE ';
  stSql := stSql + ' AND sa.AC_NODENO = sb.AC_NODENO ';
  stSql := stSql + ' AND sa.AC_ECUID = sb.AC_ECUID ';
  stSql := stSql + ' AND sa.FO_DOORNO = sb.FO_DOORNO ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Where sa.FO_DATE BETWEEN ''' + aStarDate + ''' ';
  stSql := stSql + ' AND ''' + aEndDate + ''' ';
  if aFoodPermit <> '' then stSql := stSql + ' AND sa.FO_PERMIT = ''' + aFoodPermit + '''  ';
  if aFoodArea <> '' then
  begin
    stSql := stSql + ' AND sa.AC_NODENO = ' + inttostr(strtoint(copy(aFoodArea,1,3))) ;
    stSql := stSql + ' AND sa.AC_ECUID = ''' + copy(aFoodArea,4,2) + ''' ';
    stSql := stSql + ' AND sa.FO_DOORNO = ''' + copy(aFoodArea,6,1) + ''' ';
  end;
  stSql := stSql + ' ) aa   ';
  stSql := stSql + ' GROUP BY aa.GROUP_CODE,aa.CO_COMPANYCODE,aa.EM_CODE   ';
  stSql := stSql + ' ) b   ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
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
  stSql := stSql + ' AND d.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_EMPLOYEEJoinKTCardISSUE: string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,c.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,';
  stSql := stSql + ' b.CA_CARDNO,b.CA_CARDTYPE,g.CARD_SEQ ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ) ';
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
  stSql := stSql + ' Left Join TB_KTCARDISSUE g';
  stSql := stSql + ' ON ( a.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = g.EM_CODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_FOODEVENTALL: string;
begin
  result := 'Select * from TB_FOODEVENT ';
end;

function TPostGreSql.SelectTB_FOODEVENTDupCheck(aTime, aNodeNo, aECUID,
  aReaderNo, aCompanyCode,aEmCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_FOODEVENT ';
  stSql := stSql + ' where FO_DATE = ''' + copy(aTime,1,8) + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + copy(aTime,9,6) + ''' ';
  stSql := stSql + ' and AC_NodeNO = ' + intTostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' and FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' and GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TPostGreSql.selectTB_FOODJoinPromiseCode(
  aPromisecode: string): string;
var
  stSql : string;
begin
  stSql := 'select a.FO_NAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO, ';
  stSql := stSql + 'c.DE_DOOR1,c.DE_DOOR2,c.DE_USEALARM,c.DE_PERMIT ';
  stSql := stSql + ' from TB_FOOD a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
      stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' Inner Join (select * from TB_DEVICECARDNO_PROMISE where PR_NAME = ''' + aPromisecode + ''') c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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

  result := stSql;
end;

function TPostGreSql.SelectTB_GRADEPROGRAMGradeJoinBase(aGradeCode,
  aProgramGroupCode: string): string;
var
  stSql :string;
begin
  stSql := 'select a.*,b.PR_PROGRAMNAME from TB_GRADEPROGRAM a ';
  stSql := stSql + ' Inner Join TB_PROGRAMID b ';
  stSql := stSql + ' ON (a.PR_PROGRAMID = b.PR_PROGRAMID AND a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' Inner Join TB_PROGRAMGROUP c';
  stSql := stSql + ' ON (a.PR_GROUPCODE = c.PR_GROUPCODE AND a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND a.GR_GRADECODE = ''' + aGradeCode + '''';
  stSql := stSql + ' AND a.GR_GUBUN = ''1'' ';
  stSql := stSql + ' AND c.GUBUN = ''' + aProgramGroupCode + '''';
  result := stSql;
end;

function TPostGreSql.SelectTB_HOLIDAYFromMonth(aMonth: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_Holiday ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND SUBSTRING(HO_DAY,1,6) = ''' + aMonth + ''' ';
  result := stSql;

end;

function TPostGreSql.UpdateTB_DEVICECARDNOFromPromise(aPromiseGrade,
  aCardNO: string): string;
var
  stSql : string;
begin
    stSql := 'UPDATE TB_DEVICECARDNO SET ';
    stSql := stSql + ' DE_DOOR1 = ';
    stSql := stSql + ' (SELECT ';
    stSql := stSql + ' DE_DOOR1 ';
    stSql := stSql + ' FROM TB_DEVICECARDNO_PROMISE ';
    stSql := stSql + ' WHERE TB_DEVICECARDNO.GROUP_CODE = TB_DEVICECARDNO_PROMISE.GROUP_CODE ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_NODENO = TB_DEVICECARDNO_PROMISE.AC_NODENO ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_ECUID = TB_DEVICECARDNO_PROMISE.AC_ECUID ';
    stSql := stSql + ' AND TB_DEVICECARDNO_PROMISE.PR_NAME = ''' + aPromiseGrade + ''' ';
    stSql := stSql + ' ), ';
    stSql := stSql + ' DE_DOOR2 = ';
    stSql := stSql + '(SELECT ';
    stSql := stSql + ' DE_DOOR2 ';
    stSql := stSql + ' FROM TB_DEVICECARDNO_PROMISE ';
    stSql := stSql + ' WHERE TB_DEVICECARDNO.GROUP_CODE = TB_DEVICECARDNO_PROMISE.GROUP_CODE ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_NODENO = TB_DEVICECARDNO_PROMISE.AC_NODENO ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_ECUID = TB_DEVICECARDNO_PROMISE.AC_ECUID ';
    stSql := stSql + ' AND TB_DEVICECARDNO_PROMISE.PR_NAME = ''' + aPromiseGrade + ''' ';
    stSql := stSql + ' ), ';
    stSql := stSql + ' DE_USEACCESS =  ';
    stSql := stSql + '(SELECT  ';
    stSql := stSql + ' DE_USEACCESS ';
    stSql := stSql + ' FROM TB_DEVICECARDNO_PROMISE ';
    stSql := stSql + ' WHERE TB_DEVICECARDNO.GROUP_CODE = TB_DEVICECARDNO_PROMISE.GROUP_CODE ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_NODENO = TB_DEVICECARDNO_PROMISE.AC_NODENO ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_ECUID = TB_DEVICECARDNO_PROMISE.AC_ECUID ';
    stSql := stSql + ' AND TB_DEVICECARDNO_PROMISE.PR_NAME = ''' + aPromiseGrade + ''' ';
    stSql := stSql + ' ), ';
    stSql := stSql + ' DE_USEALARM = ';
    stSql := stSql + '(SELECT  ';
    stSql := stSql + ' DE_USEALARM  ';
    stSql := stSql + ' FROM TB_DEVICECARDNO_PROMISE ';
    stSql := stSql + ' WHERE TB_DEVICECARDNO.GROUP_CODE = TB_DEVICECARDNO_PROMISE.GROUP_CODE ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_NODENO = TB_DEVICECARDNO_PROMISE.AC_NODENO ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_ECUID = TB_DEVICECARDNO_PROMISE.AC_ECUID ';
    stSql := stSql + ' AND TB_DEVICECARDNO_PROMISE.PR_NAME = ''' + aPromiseGrade + ''' ';
    stSql := stSql + ' ), ';
    stSql := stSql + ' DE_TIMECODE = ';
    stSql := stSql + '(SELECT ';
    stSql := stSql + ' DE_TIMECODE ';
    stSql := stSql + ' FROM TB_DEVICECARDNO_PROMISE ';
    stSql := stSql + ' WHERE TB_DEVICECARDNO.GROUP_CODE = TB_DEVICECARDNO_PROMISE.GROUP_CODE ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_NODENO = TB_DEVICECARDNO_PROMISE.AC_NODENO ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_ECUID = TB_DEVICECARDNO_PROMISE.AC_ECUID ';
    stSql := stSql + ' AND TB_DEVICECARDNO_PROMISE.PR_NAME = ''' + aPromiseGrade + ''' ';
    stSql := stSql + ' ), ';
    stSql := stSql + ' DE_PERMIT = ';
    stSql := stSql + '(SELECT ';
    stSql := stSql + ' DE_PERMIT ';
    stSql := stSql + ' FROM TB_DEVICECARDNO_PROMISE ';
    stSql := stSql + ' WHERE TB_DEVICECARDNO.GROUP_CODE = TB_DEVICECARDNO_PROMISE.GROUP_CODE ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_NODENO = TB_DEVICECARDNO_PROMISE.AC_NODENO ';
    stSql := stSql + ' AND TB_DEVICECARDNO.AC_ECUID = TB_DEVICECARDNO_PROMISE.AC_ECUID ';
    stSql := stSql + ' AND TB_DEVICECARDNO_PROMISE.PR_NAME = ''' + aPromiseGrade + ''' ';
    stSql := stSql + ' ), ';
    stSql := stSql + ' DE_RCVACK = ''N'', ';
    stSql := stSql + ' DE_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + ' DE_UPDATEOPERATOR = ''' + Master_ID + ''' ';
    //stSql := stSql + ' downseq = 0 ';
    stSql := stSql + ' where TB_DEVICECARDNO.CA_CARDNO = ''' + aCardNO + ''' ';
    stSql := stSql + ' AND TB_DEVICECARDNO.GROUP_CODE = ''' + GROUPCODE + ''' ';
    result := stSql;
end;

function TPostGreSql.UpdateTB_PROGRAMIDSetVisible: string;
var
  stSql : string;
begin
  stSql := 'UPDATE TB_PROGRAMID a  ' ;
  stSql := stSql + ' SET PR_VISIBLE = ( ' ;
  stSql := stSql + '    SELECT CO_CONFIGVALUE ' ;
  stSql := stSql + '    FROM TB_CONFIG b  ' ;
  stSql := stSql + '    where b.CO_CONFIGGROUP = ''MOSTYPE'' ' ;
  stSql := stSql + '    AND a.CO_CONFIGCODE = b.CO_CONFIGCODE) ' ;
  stSql := stSql + ' WHERE a.PR_VISIBLE <> ''D'' ' ;
  result := stSql;
end;

function TPostGreSql.AlterTB_CARDCompanyCodeChange(aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_CARD alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_COMPANYCompanyCodeChange(
  aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_COMPANY alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_COMPANYDepartCodeChange(aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_COMPANY alter column  CO_DEPARTCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_COMPANYJijumCodeChange(aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_COMPANY alter column  CO_JIJUMCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPHISCompanyCodeChange(aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_EMPHIS alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPLOYEECompanyCodeChange(
  aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_EMPLOYEE alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPLOYEEDepartCodeChange(
  aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_EMPLOYEE alter column  CO_DEPARTCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPLOYEEJijumCodeChange(aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_EMPLOYEE alter column  CO_JIJUMCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPLOYEEPosiCodeChange(aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_EMPLOYEE alter column  PO_POSICODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_FOODEVENTCompanyCodeChange(
  aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_FOODEVENT alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_FOODGRADECompanyCodeChange(
  aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_FOODGRADE alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_POSICompanyCodeChange(aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_POSI alter column  CO_COMPANYCODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.AlterTB_POSIPosiCodeChange(aLen: string): string;
var
  stSql : string;
begin
  stSql := 'alter table TB_POSI alter column  PO_POSICODE TYPE varchar('+ aLen + ') ';
  result := stSql;

end;

function TPostGreSql.SelectTB_ATEVENTInTimeDupCheck(aDate, aNowTime,
  aCompanyCode, aEmCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_ATEVENT ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and ( AT_INTIME is null ';
  stSql := stSql + ' OR AT_INTIME > ''' + aNowTime + ''') ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_ACCESSEVENTTOPatrolArea(aFromDate,aFromTime, aToDate,aToTime,
  aPermitCode, aEmCode, aEmName,aEmTypeCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.AC_DATE,a.AC_TIME,a.AC_READERNO,a.AC_DOORPOSI,a.CA_CARDNO,d.AL_ZONENAME, ';
  stSql := stSql + ' g.CO_NAME as CO_COMPANYNAME,h.CO_NAME as CO_JIJUMNAME, i.CO_NAME as CO_DEPARTNAME, j.PO_NAME, ';
  stSql := stSql + ' f.EM_CODE,f.EM_NAME,c.PE_PERMITNAME,  f.CO_COMPANYCODE,f.CO_JIJUMCODE,f.CO_DEPARTCODE,f.PO_POSICODE, ';
  stSql := stSql + ' k.lo_name as BuildingName,l.lo_name as FloorName,m.lo_name as AreaName ';
  stSql := stSql + ' From TB_ACCESSEVENT a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID) ';
  stSql := stSql + ' Inner Join TB_PERMITCODE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE  AND a.PE_PERMITCODE = c.PE_PERMITCODE ) ';
  stSql := stSql + ' Inner Join TB_ALARMDEVICE d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID  ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join TB_CARD e ';
  stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE  AND a.CA_CARDNO = e.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE f ';
  stSql := stSql + ' ON (e.GROUP_CODE = f.GROUP_CODE AND e.CO_COMPANYCODE = f.CO_COMPANYCODE AND e.EM_CODE = f.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY g ';
  stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE AND f.CO_COMPANYCODE = g.CO_COMPANYCODE AND g.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY h ';
  stSql := stSql + ' ON (f.GROUP_CODE = h.GROUP_CODE AND f.CO_COMPANYCODE = h.CO_COMPANYCODE AND f.CO_JIJUMCODE = h.CO_JIJUMCODE AND h.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY i ';
  stSql := stSql + ' ON (f.GROUP_CODE = i.GROUP_CODE AND f.CO_COMPANYCODE = i.CO_COMPANYCODE AND f.CO_JIJUMCODE = i.CO_JIJUMCODE AND f.CO_DEPARTCODE = i.CO_DEPARTCODE AND  i.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Left Join TB_POSI j ';
  stSql := stSql + ' ON (f.GROUP_CODE = j.GROUP_CODE AND f.CO_COMPANYCODE = j.CO_COMPANYCODE AND f.PO_POSICODE = j.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_LOCATION k ';
  stSql := stSql + ' ON (d.LO_DONGCODE = k.LO_DONGCODE ';
  stSql := stSql + ' AND k.LO_GUBUN = ''0'') ';
  stSql := stSql + ' Left Join TB_LOCATION l ';
  stSql := stSql + ' ON (d.LO_DONGCODE = l.LO_DONGCODE ';
  stSql := stSql + ' AND d.LO_FLOORCODE = l.LO_FLOORCODE ';
  stSql := stSql + ' AND l.LO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_LOCATION m ';
  stSql := stSql + ' ON (d.LO_DONGCODE = m.LO_DONGCODE ';
  stSql := stSql + ' AND d.LO_FLOORCODE = m.LO_FLOORCODE ';
  stSql := stSql + ' AND d.LO_AREACODE = m.LO_AREACODE ';
  stSql := stSql + ' AND m.LO_GUBUN = ''2'') ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_INPUTTYPE = ''C'' ';
  stSql := stSql + ' AND a.AC_DATE || a.AC_TIME  BETWEEN ''' + aFromDate + aFromTime + ''' AND ''' + aToDate + aToTime + ''' ';
  //stSql := stSql + ' AND a.AC_TIME BETWEEN ''' + aFromTime + ''' AND ''' + aToTime + ''' ';
  if Trim(aPermitCode) <> '' then
  begin
    stSql := stSql + ' AND c.PE_PERMITCODE = ''' + aPermitCode + ''' ';
  end;
  if Trim(aEmCode) <> '' then
  begin
    stSql := stSql + ' AND f.EM_CODE = ''' + aEmCode + ''' ';
  end;
  if Trim(aEmName) <> '' then
  begin
    stSql := stSql + ' AND f.EM_NAME LIKE ''%' + aEmName + '%'' ';
  end;
  if Trim(aEmTypeCode) <> '' then
  begin
    stSql := stSql + ' AND f.RG_CODE = ''' + aEmTypeCode + ''' ';
  end;
  result := stSql;
end;

function TPostGreSql.SelectTB_ATEVENTUpdateAttendType(aDate, 
  aCompanyCode, aEmCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_ATEVENT ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';
  //stSql := stSql + ' and AT_INTIME is Not Null ';
  //stSql := stSql + ' and AT_INTIME < ''' + aNowTime + ''' ';

  result := stSql;

end;

function TPostGreSql.SelectTB_ATEVENTOutTimeDupCheck(aDate, aNowTime,
  aCompanyCode, aEmCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_ATEVENT ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and ( AT_OUTTIME is null ';
  stSql := stSql + ' OR AT_OUTTIME < ''' + aNowTime + ''') ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := stSql;
end;

function TPostGreSql.SelectTB_ATEVENTBussinessOutTimeDupCheck(aDate,
  aNowTime, aCompanyCode, aEMCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_ATEVENT ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and ( AT_LEAVETIME is null ';
  stSql := stSql + ' OR AT_LEAVETIME > ''' + aNowTime + ''') ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := stSql;

end;

function TPostGreSql.SelectTB_ATEVENTBussinessInTimeDupCheck(aDate,
  aNowTime, aCompanyCode, aEMCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_ATEVENT ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and ( AT_BACKTIME is null ';
  stSql := stSql + ' OR AT_BACKTIME < ''' + aNowTime + ''') ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := stSql;

end;

function TPostGreSql.selectTB_DOORJoinFullDoorGrade(aEmCode, aEmName, aEmTypeCode: string): string;
var
  stSql :string;
begin
  stSql := ' select f.lo_name as BuildingName,g.lo_name as FloorName,h.lo_name as AreaName,a.DO_DOORNONAME,a.AC_NODENO,a.AC_MCUID,a.DO_DOORNO,b.DE_RCVACK,i.co_name as companyName,j.co_name as JijumName,k.co_name as DepartName,d.EM_CODE,e.em_name,b.CA_CARDNO  ';
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
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
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
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
     if BuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''' ';
  if aEmCode <> '' then stSql := stSql + ' AND e.EM_CODE = ''' + aEmCode + ''' ';
  if aEmName <> '' then stSql := stSql + ' AND e.EM_NAME LIKE ''%' + aEmName + '%'' ';
  if aEmTypeCode <> '' then stSql := stSql + ' AND e.RG_CODE = ''' + aEmTypeCode + ''' ';


  result := stSql;
end;

function TPostGreSql.selectTB_DOORJoinFullArmGrade(aEmCode, aEmName,
  aEmTypeCode: string): string;
var
  stSql :string;
begin
  stSql := ' select f.lo_name as BuildingName,g.lo_name as FloorName,h.lo_name as AreaName,a.AL_ZONENAME,a.AC_NODENO,a.AC_MCUID,b.DE_RCVACK,i.co_name as companyName,j.co_name as JijumName,k.co_name as DepartName,d.EM_CODE,e.em_name,b.CA_CARDNO  ';
  stSql := stSql + ' From TB_ALARMDEVICE a ';
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND b.DE_USEALARM = ''Y'' ';
  stSql := stSql + ' AND b.DE_PERMIT = ''L''';
  stSql := stSql + ' ) ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
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
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
     if BuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''' ';
  if aEmCode <> '' then stSql := stSql + ' AND e.EM_CODE = ''' + aEmCode + ''' ';
  if aEmName <> '' then stSql := stSql + ' AND e.EM_NAME LIKE ''%' + aEmName + '%'' ';
  if aEmTypeCode <> '' then stSql := stSql + ' AND e.RG_CODE = ''' + aEmTypeCode + ''' ';


  result := stSql;
end;

function TPostGreSql.CreateTB_ALARMGUBUNCODE: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMGUBUNCODE (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AG_ARMCODE varchar(3) NOT NULL,';
  stSql := stSql + ' AG_ARMNAME varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AG_ARMCODE) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICEARMGUBUN: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMDEVICE ADD AG_ARMCODE varchar(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMEVENTKTTSENDSTATUS_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_KTTSENDSTATUS char(1) DEFAULT ''N'' NULL ';
  result := stSql;   
end;

function TPostGreSql.AlterTB_ACCESSDEVICEMuxID_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_MUXID varchar(2) DEFAULT ''00'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICEDecoderID_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DECODERID varchar(10) DEFAULT ''KTT00'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_CONFIG_ValueChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_CONFIG alter column  CO_CONFIGVALUE TYPE varchar(300) ';
  result := stSql;

end;

function TPostGreSql.CreateTB_KTTMAPPINGCODE: string;
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

  result := stSql;

end;

function TPostGreSql.AlterTB_ALARMDEVICENameChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ALARMDEVICE alter column  AL_ZONENAME TYPE varchar(100) ';
  result := stSql;

end;

function TPostGreSql.AlterTB_ACCESSDEVICENameChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ACCESSDEVICE alter column  AC_DEVICENAME TYPE varchar(100) ';
  result := stSql;

end;

function TPostGreSql.AlterTB_DOORNameChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_DOOR alter column  DO_DOORNONAME TYPE varchar(100) ';
  result := stSql;

end;

function TPostGreSql.AlterTB_FOODNameChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_FOOD alter column  FO_NAME TYPE varchar(100) ';
  result := stSql;

end;

function TPostGreSql.CreateTB_RELAYUNIVERCITY: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_RELAYUNIVERCITY (';
  stSql := stSql + ' SEQ serial NOT NULL,';
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

  result := stSql;
end;

function TPostGreSql.AlterTB_DEVICECARDNO_downseq: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD downseq integer DEFAULT 0 NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_KTTMAPPINGCODE_SendUse: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_KTTMAPPINGCODE ADD senduse varchar(1) DEFAULT ''Y'' NULL ';
  result := stSql;

end;

function TPostGreSql.CreateTB_ATWORKTYPE: string;
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

  result := stSql;
end;

function TPostGreSql.AlterTB_ZONEDEVICENameChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ZONEDEVICE alter column  AL_ZONENAME TYPE varchar(100) ';
  result := stSql;   
end;

function TPostGreSql.AlterTB_ATCODEAWCODE_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATCODE ADD AW_CODE VARCHAR(3)  DEFAULT ''001'' NULL ';
  result := stSql;

end;

function TPostGreSql.AlterTB_EMPLOYEEAWCODE_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD AW_CODE VARCHAR(3)  DEFAULT ''001'' NULL ';
  result := stSql;

end;

function TPostGreSql.SelectTB_EMPLOYEEJoinD2DFoodState(aStarDate, aEndDate,
  aFoodArea, aFoodPermit: string): string;
var
  stSql : string;
begin
  stSql := 'Select  a.CO_COMPANYCODE,b.FO_DATE,c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.PO_POSICODE,f.PO_NAME,a.EM_CODE,a.EM_NAME,';
  stSql := stSql + ' b.FO_BREAK,b.FO_LUNCH,b.FO_DINNER,b.FO_MIDNIGHT,b.TOT,b.FO_FOODAMT ';
  stSql := stSql + ' FROM  ';
  stSql := stSql + ' TB_EMPLOYEE a ';
  stSql := stSql + ' inner Join ';
  stSql := stSql + ' (select aa.GROUP_CODE,aa.FO_DATE,aa.CO_COMPANYCODE,aa.EM_CODE,  ';
  stSql := stSql + ' SUM(aa.FO_BREAK) as FO_BREAK,   ';
  stSql := stSql + ' SUM(aa.FO_LUNCH) as FO_LUNCH,  ';
  stSql := stSql + ' SUM(aa.FO_DINNER) as FO_DINNER,  ';
  stSql := stSql + ' SUM(aa.FO_MIDNIGHT) as FO_MIDNIGHT,  ';
  stSql := stSql + ' SUM(aa.TOT) as TOT,    ';
  stSql := stSql + ' SUM(aa.FO_FOODAMT) as FO_FOODAMT ';
  stSql := stSql + ' From  ';
  stSql := stSql + ' ( select sa.GROUP_CODE,sa.FO_DATE,sa.CO_COMPANYCODE,sa.EM_CODE,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''001'' THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_BREAK,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''002'' THEN 1   ';
  stSql := stSql + ' ELSE 0 END as FO_LUNCH,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''003'' THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_DINNER,  ';
  stSql := stSql + ' CASE   ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''004'' THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_MIDNIGHT,  ';
  stSql := stSql + ' 1 as TOT,   ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''001'' THEN sb.FO_BREAKAMT ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''002'' THEN sb.FO_LUNCHAMT ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''003'' THEN sb.FO_EVENINGAMT ';
  stSql := stSql + ' WHEN sa.FO_FOODCODE = ''004'' THEN sb.FO_MIDNIGHTAMT ';
  stSql := stSql + ' ELSE 0 END as FO_FOODAMT   ';
  stSql := stSql + ' from  ';
  stSql := stSql + ' TB_FOODEVENT sa  ';
  stSql := stSql + ' Left Join TB_FOOD sb ';
  stSql := stSql + ' ON(sa.GROUP_CODE = sb.GROUP_CODE ';
  stSql := stSql + ' AND sa.AC_NODENO = sb.AC_NODENO ';
  stSql := stSql + ' AND sa.AC_ECUID = sb.AC_ECUID ';
  stSql := stSql + ' AND sa.FO_DOORNO = sb.FO_DOORNO ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Where sa.FO_DATE BETWEEN ''' + aStarDate + ''' ';
  stSql := stSql + ' AND ''' + aEndDate + ''' ';
  if aFoodPermit <> '' then stSql := stSql + ' AND sa.FO_PERMIT = ''' + aFoodPermit + '''  ';
  if aFoodArea <> '' then
  begin
    stSql := stSql + ' AND sa.AC_NODENO = ' + inttostr(strtoint(copy(aFoodArea,1,3))) ;
    stSql := stSql + ' AND sa.AC_ECUID = ''' + copy(aFoodArea,4,2) + ''' ';
    stSql := stSql + ' AND sa.FO_DOORNO = ''' + copy(aFoodArea,6,1) + ''' ';
  end;
  stSql := stSql + ' ) aa   ';
  stSql := stSql + ' GROUP BY aa.GROUP_CODE,aa.FO_DATE,aa.CO_COMPANYCODE,aa.EM_CODE   ';
  stSql := stSql + ' ) b   ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
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
  stSql := stSql + ' AND d.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TPostGreSql.AlterTB_ALARMSTATUSCODEGubun_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMSTATUSCODE ADD AL_GUBUN varchar(3)  NULL ';
  result := stSql;
end;

function TPostGreSql.AlterTB_ALARMSTATUSCODEColor_Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMSTATUSCODE ADD AL_COLOR INTEGER  DEFAULT 255 NULL ';
  result := stSql;

end;

function TPostGreSql.CreateTB_FIREGUBUN: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FIREGUBUN (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' FG_CODE varchar(3) NOT NULL,';
  stSql := stSql + ' FG_NAME varchar(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, FG_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TPostGreSql.CreateTB_FIREGROUP: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FIREGROUP (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' AC_NODENO integer NOT NULL,';
  stSql := stSql + ' FG_CODE varchar(3) DEFAULT ''001'' NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AC_NODENO) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

end.
