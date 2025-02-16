unit uMDBSql;

interface

uses
  SysUtils, Classes;

type
  TMDBSql = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    Function SelectTB_ACCESSEVENTDupCheck(aTimestr,aNodeNo,aECUID,aDoorNo,aCardNo:string):string;
    Function SelectTB_ACCESSEVENTFromDayToDay(aFromDate,aToDate,aNodeNo,aEcuId,aDoorNo,aPermitCode,
              aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmCode,aEmName,aEmTypeCode:string):string;
    Function SelectTB_ALARMEVENTFromDayToDay(aFromDate,aToDate,aNodeNo,aEcuId,aAlarmType:string;aOrderASC:Boolean=True):string;
    Function SelectNewTB_ALARMEVENTFromDayToDay(aFromDate,aToDate,aNodeNo,aEcuId,aAlarmType:string):string;
    Function SelectTB_ALARMEVENTFromALARMCatch:string;
    Function SelectTB_ALARMGRADEJoinBase(aBuildingCode,aFloorCode,aAreaCode,aCardNo:string):string;
    Function selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function selectTB_ALARMDEVICEJoinPromiseCode(aPromisecode:string):string;
    Function SelectTB_ATEVENTFromDayBase(aDate:string):string;
    Function SelectTB_ATEVENTFromToDayBase(aFromDate,aToDate:string):string;
    Function SelectTB_ATEVENTDupCheck(aDate,aCompanyCode,aEmCode:string):string;
    Function SelectTB_ATEVENTNonProcessFromDayToDay(aFromDate,aToDate:string):string;
    Function SelectTB_ATEVENTDaySummary(aDate,aCompanyCode,aEmCode:string):string;
    Function SelectTB_CARDAdminJoinBase:string;
    Function SelectTB_CARDJoinTBEmployee(aPrimary:string):string;
    Function SelectTB_CARDFromDoorGradeJoinBase(aAC_NODENO,aAC_ECUID,aDoorNo:string):string;
    Function SelectTB_CARDFromAlarmGradeJoinBase(aAC_NODENO,aAC_ECUID:string):string;
    Function selectTB_DOORJoinAdmin(aBuildingCode,aFloorCode,aAreaCode:string;aDoorView:Boolean=True):string;
    Function selectTB_DOORJoinGrade(aBuildingCode,aFloorCode,aAreaCode,aCardNo:string):string;
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
    Function SelectTB_EMPLOYEEATJoinBase:string;
    Function SelectTB_EMPLOYEEATJoinATBasePAY:string;
    Function SelectTB_EMPLOYEEATJoinExtraBase:string;
    Function SelectTB_EMPLOYEEATVacation(aMonth:string):string;
    Function SelectTB_FOODEVENTALL:string;
    Function SelectTB_FOODEVENTDupCheck(aTime,aNodeNo,aECUID,aReaderNo,aCompanyCode,aEmCode:string):string;
    Function selectTB_FOODJoinPromiseCode(aPromisecode:string):string;
    Function SelectTB_HOLIDAYFromMonth(aMonth:string):string;
    Function SelectTB_GRADEPROGRAMGradeJoinBase(aGradeCode,aProgramGroupCode:string):string;

    function SelectTB_ACCESSEVENTJOINATDEVICE(aFromDate,aToDate:string):string;

    //가공된 쿼리문
    Function SelectDongLocation:string;
    Function SelectFloorLocation:string;
    Function SelectAreaLocation:string;
    Function SelectMCUDeviceLoad:string;
    Function SelectECUDeviceLoad:string;

    Function UpdateTB_PROGRAMIDSetVisible:string;
    Function UpdateTB_DEVICECARDNOFromPromise(aPromiseGrade,aCardNO:string):string;

    Function CreateTB_CARDTYPE:string;
    Function CreateTB_FormName:string;
    Function CreateTB_ALARMSHOW:string;
    Function CreateTB_EMPHIS:string;
    Function CreateTB_SERVERCARDRELAY:string;
    Function CreateTB_SERVERCARDRELAYHIS:string;
    Function CreateTB_PERRELAYCONFIG:string;
    Function CreateTB_DEVICECARDNOACKINDEX : string;
    Function CreateTB_WORKLOG:string;
    Function CreateTB_INOUTCOUNT : string;
    Function CreateTB_INOUTGROUP : string;
    Function CreateTB_FTPLIST : string;
    Function CreateTB_KTCARDISSUE : string;
    Function CreateTB_RELAYGUBUN : string;
    Function CreateTB_DAEMONMULTI : string;
    Function CreateTB_DOORGUBUN : string;
    Function CreateTB_ALARMCODEGROUP : string;
    Function CreateTB_ALARMMODENOTCARD : string;
    Function CreateTB_NOTCARDALARMCODE : string;
    Function CreateTB_AUTHTYPE : string;
    Function CreateSEAT_USER_VIEW : string;
    Function CreateTB_KTBIZMEKADOOR : string;
    Function CreateTB_KTBMDISPLAY : string;
    Function CreateTB_KTBMDISPLAYMESSAGE : string;
    Function CreateTB_BARCODE : string;
    Function CreateTB_SOUNDCODE : string;

    Function AlterTB_EMPHISCARDNO : string;
    Function AlterTB_EMPHISEMNAME : string;
    Function AlterTB_EMPHISHANDPHONE : string;
    Function AlterTB_EMPHISCOMPANYNAME : string;
    Function AlterTB_EMPHISJIJUMNAME : string;
    Function AlterTB_EMPHISDEPARTNAME : string;
    Function AlterTB_EMPHISPOSINAME : string;
    Function AlterTB_EMPHISCARDTYPE : string;
    Function AlterTB_EMPHISSENDSTATUS2 :string;
    Function AlterTB_READERInOutCount : string;
    Function AlterTB_ALARMSTATUSCODEALARMSOUND : string;
    Function AlterTB_EMPHISINSERTTIME : string;
    Function AlterTB_EMPLOYEERelayGubun:string;
    Function AlterTB_COMPANYUPDATECHECK:string;
    Function AlterTB_POSIUPDATECHECK:string;
    Function AlterTB_ADMINBuildingGrade : string;
    Function AlterTB_ADMINDongCode : string;
    Function AlterTB_ADMINFloorCode : string;
    Function AlterTB_ADMINAreaCode : string;
    Function AlterTB_ACCESSDEVICEDaemonGubun : string;
    Function AlterTB_CARDDoorGrade : string;
    Function AlterTB_DOORGUBUN : string;
    Function AlterTB_HOLIDAYState : string;
    Function AlterTB_ACCESSDEVICEHoSend : string;
    Function AlterTB_EMPLOYEEEmNameChange : string;
    Function AlterTB_ALARMSTATUSCODECodeChange :string;
    Function AlterTB_ALARMEVENTCodeChange : string;
    Function AlterTB_ALARMEVENTOperChange : string;
    Function AlterTB_ALARMEVENTSTATECODE2Add : string;
    Function AlterTB_ACCESSEVENTCOMPANYCODE :string;
    Function AlterTB_ACCESSEVENTEMCODE :string;
    Function AlterTB_ACCESSEVENTJIJUMCODE :string;
    Function AlterTB_ACCESSEVENTDEPARTCODE :string;
    Function AlterTB_ACCESSEVENTEMNAME :string;
    Function AlterTB_ACCESSEVENTSCSHIS :string;
    Function AlterTB_ACCESSEVENTAUTHTYPE :string;
    Function AlterTB_DoorSoundIP : string;
    Function AlterTB_DoorSoundPort : string;
    Function AlterTB_DoorSoundVolume : string;

  end;

var
  MDBSql: TMDBSql;

implementation
uses
  uDataModule1;

{$R *.dfm}

{ TMDBSql }

{ TMDBSql }

function TMDBSql.AlterTB_ACCESSDEVICEDaemonGubun: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_DAEMONGUBUN integer DEFAULT 1 NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ACCESSDEVICEHoSend: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD HO_SEND text(1) DEFAULT ''N'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ACCESSEVENTAUTHTYPE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD AC_AUTHTYPE text(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ACCESSEVENTCOMPANYCODE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD CO_COMPANYCODE text(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ACCESSEVENTDEPARTCODE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD CO_DEPARTCODE text(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ACCESSEVENTEMCODE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD EM_CODE text(20) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ACCESSEVENTEMNAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD EM_NAME text(50) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ACCESSEVENTJIJUMCODE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD CO_JIJUMCODE text(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ACCESSEVENTSCSHIS: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD AC_SCSHIS text(5) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ADMINAreaCode: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD LO_AREACODE text(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ADMINBuildingGrade: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD AD_BUILDINGGRADE text(1) DEFAULT ''4'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ADMINDongCode: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD LO_DONGCODE text(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ADMINFloorCode: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ADMIN ADD LO_FLOORCODE text(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ALARMEVENTCodeChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ALARMEVENT alter column  AL_ALARMSTATUSCODE text(5) ';
  result := stSql;

end;

function TMDBSql.AlterTB_ALARMEVENTOperChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ALARMEVENT alter column  AL_OPERATOR text(30) ';
  result := stSql;

end;

function TMDBSql.AlterTB_ALARMEVENTSTATECODE2Add: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_STATUSCODE2 text(5) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ALARMSTATUSCODEALARMSOUND: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ALARMSTATUSCODE ADD AL_ALARMSOUND int DEFAULT 0 NOT NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_ALARMSTATUSCODECodeChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_ALARMSTATUSCODE alter column  AL_ALARMSTATUSCODE text(5) ';
  result := stSql;

end;

function TMDBSql.AlterTB_CARDDoorGrade: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARD ADD CA_DOORGRADE text(1) DEFAULT ''N'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_COMPANYUPDATECHECK: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_COMPANY ADD CO_UPDATECHECK text(1) DEFAULT ''N'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_DOORGUBUN: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_GUBUN text(3) DEFAULT ''000'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_DoorSoundIP: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_SOUNDIP text(30) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_DoorSoundPort: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_SOUNDPORT text(30) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_DoorSoundVolume: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_SOUNDVOLUME text(30) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_EMPHISCARDNO: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD CA_CARDNO text(20) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_EMPHISCARDTYPE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD CA_CARDTYPE text(1) NULL ';
  result := stSql;
end;

function TMDBSql.AlterTB_EMPHISCOMPANYNAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD COMPANY_NAME text(50) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_EMPHISDEPARTNAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD DEPART_NAME text(50) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_EMPHISEMNAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD EM_NAME text(20) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_EMPHISHANDPHONE: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD EM_HANDPHONE text(14) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_EMPHISINSERTTIME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD EH_INSERTTIME text(14) NULL ';
  result := stSql;
end;

function TMDBSql.AlterTB_EMPHISJIJUMNAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD JIJUM_NAME text(50) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_EMPHISPOSINAME: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD PO_NAME text(30) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_EMPHISSENDSTATUS2: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPHIS ADD SEND_STATUS2 text(1) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_EMPLOYEEEmNameChange: string;
var
  stSql : string;
begin
  stSql := 'alter table TB_EMPLOYEE alter column  EM_NAME text(50) ';
  result := stSql;

end;

function TMDBSql.AlterTB_EMPLOYEERelayGubun: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD RG_CODE text(3) NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_HOLIDAYState: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_HOLIDAY ADD HO_STATE text(1) DEFAULT ''I'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_POSIUPDATECHECK: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_POSI ADD PO_UPDATECHECK text(1) DEFAULT ''N'' NULL ';
  result := stSql;

end;

function TMDBSql.AlterTB_READERInOutCount: string;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_READER ADD RE_INOUTCOUNT int DEFAULT 0 NOT NULL ';
  result := stSql;

end;

function TMDBSql.CreateSEAT_USER_VIEW: string;
var
  stSql : string;
begin
  stSql := 'Create Table SEAT_USER_VIEW (';
  stSql := stSql + ' PID text(30) NOT NULL,';
  stSql := stSql + ' USERNAME text(30) ,';
  stSql := stSql + ' USERPWD text(20) ,';
  stSql := stSql + ' PAT_TYPE_DESC text(30) ,';
  stSql := stSql + ' PAT_TYPE int ,';
  stSql := stSql + ' DEPT_NAME text(30) ,';
  stSql := stSql + ' DEPT_CODE text(30) ,';
  stSql := stSql + ' CARD_ISSUE_CNT int ,';
  stSql := stSql + ' BEGIN_DATE text(8) ,';
  stSql := stSql + ' END_DATE text(8) ,';
  stSql := stSql + ' DATE_EXPRD text(8) ,';
  stSql := stSql + ' LOGN_OVER int ,';
  stSql := stSql + ' LAST_USEDATE text(8) ,';
  stSql := stSql + ' PRIMARY KEY (PID) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_ALARMCODEGROUP: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMCODEGROUP (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AG_CODE text(30) NOT NULL,';
  stSql := stSql + ' AL_ALARMSTATUSCODE text(5) NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AG_CODE,AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_ALARMMODENOTCARD: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMMODENOTCARD (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AN_CODE text(5) NOT NULL,';
  stSql := stSql + ' AN_NOTDATA text(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AN_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TMDBSql.CreateTB_ALARMSHOW: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_ALARMSHOW (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_NODENO int NOT NULL,';
  stSql := stSql + ' AC_ECUID text(2) NOT NULL,';
  stSql := stSql + ' AL_ALARMDEVICETYPECODE text(2) NOT NULL,';
  stSql := stSql + ' AL_SUBADDR text(2) NOT NULL,';
  stSql := stSql + ' AL_ZONECODE text(2) NOT NULL,';
  stSql := stSql + ' AL_ZONENO text(2) NOT NULL,';
  stSql := stSql + ' AL_ALARMSTATUSCODE text(2) NOT NULL,';
  stSql := stSql + ' AL_ISALARM text(1) NULL,';
  stSql := stSql + ' AL_ALARMMODECODE text(1) NULL,';
  stSql := stSql + ' AL_DATE text(8) NULL,';
  stSql := stSql + ' AL_TIME text(6) NULL,';
  stSql := stSql + ' AL_MSGNO text(1) NULL,';
  stSql := stSql + ' AL_ZONESTATE text(1) NULL,';
  stSql := stSql + ' AL_OPERATOR text(10) NULL,';
  stSql := stSql + ' AL_CHECKOK text(1) NULL,';
  stSql := stSql + ' AL_CHECKCODE text(3) NULL,';
  stSql := stSql + ' AL_CHECKMSG text(100) NULL,';
  stSql := stSql + ' AL_UPDATETIME text(14) NULL,';
  stSql := stSql + ' AL_UPDATEOPERATOR text(10) NULL,';
    stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AC_NODENO,';
  stSql := stSql + ' AC_ECUID,AL_ALARMDEVICETYPECODE,AL_SUBADDR,';
  stSql := stSql + ' AL_ZONECODE,AL_ZONENO,AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_AUTHTYPE: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_AUTHTYPE (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AT_CODE text(3) NOT NULL,';
  stSql := stSql + ' AT_NAME text(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, AT_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TMDBSql.CreateTB_BARCODE: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_BARCODE (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' BC_IP text(30) NOT NULL,';
  stSql := stSql + ' BC_PORT text(30) NOT NULL,';
  stSql := stSql + ' AC_NODENO Integer NULL,';
  stSql := stSql + ' AC_ECUID text(2) NULL,';
  stSql := stSql + ' DO_DOORNO text(1) NULL,';
  stSql := stSql + ' DO_READER text(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, BC_IP,BC_PORT) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_CARDTYPE: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_CARDTYPE (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CT_CODE text(1) NOT NULL,';
  stSql := stSql + ' CT_NAME text(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, CT_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TMDBSql.CreateTB_DAEMONMULTI: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DAEMONMULTI (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' DM_GUBUN integer NOT NULL,';
  stSql := stSql + ' DM_SERVERIP text(30) NULL,';
  stSql := stSql + ' DM_SERVERPORT text(30) NULL,';
  stSql := stSql + ' DM_ATPORT text(30) NULL,';
  stSql := stSql + ' DM_FDPORT text(30) NULL,';
  stSql := stSql + ' DM_FTPPORT text(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,DM_GUBUN) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_DEVICECARDNOACKINDEX: string;
var
  stSql : string;
begin
  stSql := 'CREATE INDEX TB_DEVICECARDNOACK ';
  stSql := stSql + ' ON TB_DEVICECARDNO ';
  stSql := stSql + ' (GROUP_CODE, DE_RCVACK)';

  result := stSql;
end;

function TMDBSql.CreateTB_DOORGUBUN: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DOORGUBUN (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' DG_CODE text(3) NOT NULL,';
  stSql := stSql + ' DG_NAME text(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,DG_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_EMPHIS: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMPHIS (';
  stSql := stSql + ' SEQ COUNTER NOT NULL,';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' CO_COMPANYCODE text(3) NOT NULL,';
  stSql := stSql + ' EM_CODE text(20) NULL,';
  stSql := stSql + ' FDMS_ID INTEGER NULL,';
  stSql := stSql + ' MODE text(1) NULL,';
  stSql := stSql + ' SEND_STATUS text(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (SEQ) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TMDBSql.CreateTB_FormName: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FORMNAME (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' FM_CODE text(3) NOT NULL,';
  stSql := stSql + ' FM_NAME text(30) NULL,';
  stSql := stSql + ' FM_USE text(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, FM_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_FTPLIST: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_FTPLIST (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_NODENO INTEGER NOT NULL,';
  stSql := stSql + ' AC_ECUID text(2) NOT NULL,';
  stSql := stSql + ' FL_FILENAME text(50) NOT NULL,';
  stSql := stSql + ' FL_SENDPROGRASS text(3) NULL,';
  stSql := stSql + ' FL_SENDSTATE text(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TMDBSql.CreateTB_INOUTCOUNT: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_INOUTCOUNT (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' IO_DATE text(8) NOT NULL,';
  stSql := stSql + ' AC_NODENO INTEGER NOT NULL,';
  stSql := stSql + ' AC_ECUID text(2) NOT NULL,';
  stSql := stSql + ' DO_DOORNO text(1) NOT NULL,';
  stSql := stSql + ' IO_COUNT INTEGER DEFAULT 0 NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,IO_DATE,AC_NODENO,AC_ECUID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_INOUTGROUP: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_INOUTGROUP (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' IO_GROUPNAME text(30) NOT NULL,';
  stSql := stSql + ' AC_NODENO INTEGER NOT NULL,';
  stSql := stSql + ' AC_ECUID text(2) NOT NULL,';
  stSql := stSql + ' DO_DOORNO text(1) NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,IO_GROUPNAME,AC_NODENO,AC_ECUID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_KTBIZMEKADOOR: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_KTBIZMEKADOOR (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_NODENO Integer NOT NULL,';
  stSql := stSql + ' AC_ECUID text(2) NOT NULL,';
  stSql := stSql + ' DO_DOORNO text(1) NOT NULL,';
  stSql := stSql + ' KD_DOORNO text(10) NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TMDBSql.CreateTB_KTBMDISPLAY: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_KTBMDISPLAY (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_NODENO Integer NOT NULL,';
  stSql := stSql + ' AC_ECUID text(2) NOT NULL,';
  stSql := stSql + ' DO_DOORNO text(1) NOT NULL,';
  stSql := stSql + ' KD_IP text(24) NULL,';
  stSql := stSql + ' KD_PORT text(10) NULL,';
  stSql := stSql + ' KD_CLEARTIME text(10) NULL,';
  stSql := stSql + ' KD_GENERALTIME text(10) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TMDBSql.CreateTB_KTBMDISPLAYMESSAGE: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_KTBMDISPLAYMESSAGE (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AC_NODENO Integer NOT NULL,';
  stSql := stSql + ' AC_ECUID text(2) NOT NULL,';
  stSql := stSql + ' DO_DOORNO text(1) NOT NULL,';
  stSql := stSql + ' KM_CODE text(10) NOT NULL,';
  stSql := stSql + ' KM_MESSAGE text(50) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,DO_DOORNO,KM_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TMDBSql.CreateTB_KTCARDISSUE: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_KTCARDISSUE (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' EM_CODE text(20) NOT NULL,';
  stSql := stSql + ' CARD_SEQ Integer NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,EM_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_NOTCARDALARMCODE: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_NOTCARDALARMCODE (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' AN_CODE text(5) NOT NULL,';
  stSql := stSql + ' AN_MODE text(2) NOT NULL,';
  stSql := stSql + ' AL_STATUSCODE2 text(5) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AN_CODE, AN_MODE) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TMDBSql.CreateTB_PERRELAYCONFIG: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_PERRELAYCONFIG (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' PC_CONFIGCODE text(30) NOT NULL,';
  stSql := stSql + ' PC_CONFIGVALUE text(100) NULL,';
  stSql := stSql + ' PC_CONFIGDETAIL text(50) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,PC_CONFIGCODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_RELAYGUBUN: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_RELAYGUBUN (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' RG_CODE text(3) NOT NULL,';
  stSql := stSql + ' RG_NAME text(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,RG_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_SERVERCARDRELAY: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_SERVERCARDRELAY (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' SR_RELAYNO INTEGER NOT NULL,';
  stSql := stSql + ' AC_NODENO INTEGER NULL,';
  stSql := stSql + ' AC_ECUID text(2) NULL,';
  stSql := stSql + ' RE_READERNO text(1) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,SR_RELAYNO) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_SERVERCARDRELAYHIS: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_SERVERCARDRELAYHIS (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' SR_DATETIME text(14) NOT NULL,';
  stSql := stSql + ' SR_RELAYNO INTEGER NOT NULL,';
  stSql := stSql + ' SR_CARDDATA text(20) NULL,';
  stSql := stSql + ' SR_CLIENTIP text(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,SR_DATETIME,SR_RELAYNO) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.CreateTB_SOUNDCODE: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_SOUNDCODE (';
  stSql := stSql + ' GROUP_CODE text(10) DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + ' SO_CODE text(1) NOT NULL,';
  stSql := stSql + ' SO_NAME text(30) NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE, SO_CODE) ';
  stSql := stSql + ' ) ';

  result := stSql;

end;

function TMDBSql.CreateTB_WORKLOG: string;
var
  stSql : string;
begin
  stSql := 'Create Table TB_WORKLOG (';
  stSql := stSql + ' WO_CODE text(30) NOT NULL,';
  stSql := stSql + ' WO_COMMAND text(30) NOT NULL,';
  stSql := stSql + ' WO_DATA text(300),';
  stSql := stSql + ' WO_TIME text(14) NOT NULL,';
  stSql := stSql + ' WO_OPERATOR text(30) ';
  stSql := stSql + ' ) ';

  result := stSql;
end;

function TMDBSql.SelectAreaLocation: string;
var
  stSql : string;
begin
  //구역코드 로딩
  stSql := ' Select a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' From TB_LOCATION a ';
  stSql := stSql + ' Inner Join ';
  stSql := stSql + ' (select ba.LO_DONGCODE,ba.LO_FLOORCODE,ba.LO_AREACODE,ba.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,bb.AD_USERID ';
  end;
  stSql := stSql + ' from TB_Door ba ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR bb  ';
      stSql := stSql + ' ON (ba.GROUP_CODE = bb.GROUP_CODE ';
      stSql := stSql + ' AND ba.AC_NODENO=bb.AC_NODENO ';
      stSql := stSql + ' AND ba.AC_ECUID = bb.AC_ECUID ';
      stSql := stSql + ' AND ba.DO_DOORNO=bb.DO_DOORNO) ';
    end;
  end;
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select bc.LO_DONGCODE,bc.LO_FLOORCODE,bc.LO_AREACODE,bc.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,bd.AD_USERID ';
  end;
  stSql := stSql + ' from TB_ALARMDEVICE bc ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join  TB_ADMINALARMDEVICE bd ';
      stSql := stSql + ' ON (bc.GROUP_CODE = bd.GROUP_CODE ';
      stSql := stSql + ' AND bc.AC_NODENO = bd.AC_NODENO ';
      stSql := stSql + ' AND bc.AC_ECUID = bd.AC_ECUID )';
    end;
  end;
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND d.AC_NODENO = e.AC_NODENO ';
  stSql := stSql + ' AND d.AC_ECUID = e.AC_ECUID ) ';  }
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select bf.LO_DONGCODE,bf.LO_FLOORCODE,bf.LO_AREACODE,bf.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,bg.AD_USERID ';
  end;
  stSql := stSql + ' from TB_FOOD bf ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD bg ';
      stSql := stSql + ' ON (bf.GROUP_CODE = bg.GROUP_CODE ';
      stSql := stSql + ' AND bf.AC_NODENO=bg.AC_NODENO ';
      stSql := stSql + ' AND bf.AC_ECUID = bg.AC_ECUID ';
      stSql := stSql + ' AND bf.FO_DOORNO = bg.FO_DOORNO ) ';
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

function TMDBSql.SelectDongLocation: string;
var
  stSql : string;
begin
  //동코드 로딩
  stSql := ' Select a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' From ';
  stSql := stSql + ' TB_LOCATION a ';
  stSql := stSql + ' Inner Join (';
  stSql := stSql + ' select ba.LO_DONGCODE,ba.LO_FLOORCODE,ba.LO_AREACODE,ba.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,bb.AD_USERID ';
  end;
  stSql := stSql + ' from TB_Door ba ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR bb ';
      stSql := stSql + ' ON (ba.GROUP_CODE = bb.GROUP_CODE ';
      stSql := stSql + ' AND ba.AC_NODENO=bb.AC_NODENO ';
      stSql := stSql + ' AND ba.AC_ECUID = bb.AC_ECUID ';
      stSql := stSql + ' AND ba.DO_DOORNO=bb.DO_DOORNO) ';
    end;
  end;
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select bc.LO_DONGCODE,bc.LO_FLOORCODE,bc.LO_AREACODE,bc.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ',bd.AD_USERID ' ;
  end;
  stSql := stSql + ' from TB_ALARMDEVICE bc ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE bd  ';
      stSql := stSql + ' ON (bc.GROUP_CODE = bd.GROUP_CODE ';
      stSql := stSql + ' AND bc.AC_NODENO = bd.AC_NODENO ';
      stSql := stSql + ' AND bc.AC_ECUID = bd.AC_ECUID ) ';
    end;
  end;
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE be ';
  stSql := stSql + ' ON (bc.GROUP_CODE = e.GROUP_CODE AND bc.AC_NODENO=e.AC_NODENO ';
  stSql := stSql + ' AND bc.AC_ECUID = e.AC_ECUID ) ';  }
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select be.LO_DONGCODE,be.LO_FLOORCODE,be.LO_AREACODE,be.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,bf.AD_USERID ';
  end;
  stSql := stSql + ' from TB_FOOD be ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD bf  ';
      stSql := stSql + ' ON (be.GROUP_CODE = bf.GROUP_CODE ';
      stSql := stSql + ' AND be.AC_NODENO=bf.AC_NODENO ';
      stSql := stSql + ' AND be.AC_ECUID = bf.AC_ECUID ';
      stSql := stSql + ' AND be.FO_DOORNO = bf.FO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' )b ' ;
  stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE )' ;
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

  stSql := stSql + ' AND a.LO_GUBUN = ''0'' ';
  stSql := stSql + ' Group by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' Order by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_GUBUN ';
  result := stSql;
end;

function TMDBSql.SelectECUDeviceLoad: string;
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

function TMDBSql.SelectFloorLocation: string;
var
  stSql : string;
begin
  //층코드 로딩
  stSql := ' Select a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' From TB_LOCATION a ';
  stSql := stSql + ' Inner Join ';
  stSql := stSql + ' (select ba.LO_DONGCODE,ba.LO_FLOORCODE,ba.LO_AREACODE,ba.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,bb.AD_USERID ';
  end;
  stSql := stSql + ' from TB_Door ba ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR bb ';
      stSql := stSql + ' ON (ba.GROUP_CODE = bb.GROUP_CODE ';
      stSql := stSql + ' AND ba.AC_NODENO=bb.AC_NODENO ';
      stSql := stSql + ' AND ba.AC_ECUID = bb.AC_ECUID ';
      stSql := stSql + ' AND ba.DO_DOORNO=bb.DO_DOORNO) ';
    end;
  end;
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select bc.LO_DONGCODE,bc.LO_FLOORCODE,bc.LO_AREACODE,bc.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,bd.AD_USERID ';
  end;
  stSql := stSql + ' from TB_ALARMDEVICE bc ' ;
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE bd  ';
      stSql := stSql + ' ON (bc.GROUP_CODE = bd.GROUP_CODE ';
      stSql := stSql + ' AND bc.AC_NODENO = bd.AC_NODENO ';
      stSql := stSql + ' AND bc.AC_ECUID = bd.AC_ECUID ) ';
    end;
  end;
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND d.AC_NODENO=e.AC_NODENO ';
  stSql := stSql + ' AND d.AC_ECUID = e.AC_ECUID ) '; }
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select be.LO_DONGCODE,be.LO_FLOORCODE,be.LO_AREACODE,be.GROUP_CODE ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ,bf.AD_USERID ';
  end;
  stSql := stSql + ' from  TB_FOOD be ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD bf ';
      stSql := stSql + ' ON (be.GROUP_CODE = bf.GROUP_CODE ';
      stSql := stSql + ' AND be.AC_NODENO=bf.AC_NODENO ';
      stSql := stSql + ' AND be.AC_ECUID = bf.AC_ECUID ';
      stSql := stSql + ' AND be.FO_DOORNO = bf.FO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' ) b ' ;
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

function TMDBSql.SelectMCUDeviceLoad: string;
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

function TMDBSql.SelectNewTB_ALARMEVENTFromDayToDay(aFromDate, aToDate,
  aNodeNo, aEcuId, aAlarmType: string): string;
var
  stSql :string;
begin

  stSql := 'Select a.AL_DATE,a.AL_TIME,a.AC_ECUID,c.AL_ZONENAME,a.AL_OPERATOR,a.AL_ALARMDEVICETYPECODE, ';
  stSql := stSql + ' a.AL_ALARMMODECODE,a.AL_ZONENO,a.AL_ALARMSTATUSCODE,d.AL_ALARMNAME,a.AL_SUBADDR,';
  stSql := stSql + ' a.AL_CHECKCODE,a.AL_CHECKMSG,a.AL_UPDATEOPERATOR,e.AC_DEVICENAME ';
  stSql := stSql + ' FROM  ';
  stSql := stSql + ' (  ';
  stSql := stSql + ' (  ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ( ';
  end;

  stSql := stSql + ' (select * from TB_ALARMEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'') a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' INNER JOIN (select * from TB_ADMINALARMDEVICE ';
      stSql := stSql + ' Where AD_USERID = ''' + Master_ID + ''') b ';
      stSql := stSql + ' ON (a.AC_ECUID = b.AC_ECUID)  ';
      stSql := stSql + ' AND (a.AC_NODENO = b.AC_NODENO) ';
      stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE) ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' INNER JOIN TB_ALARMDEVICE c ';
  stSql := stSql + ' ON (a.AC_ECUID = c.AC_ECUID) ';
  stSql := stSql + ' AND (a.AC_NODENO = c.AC_NODENO) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' INNER JOIN TB_ALARMSTATUSCODE d  ';
  stSql := stSql + ' ON (a.AL_STATUSCODE2 = d.AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
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
    stSql := stSql + ' AND a.AL_STATUSCODE2 = ''' + aAlarmType + ''' ' ;
  end;

  result := stSql;
end;

function TMDBSql.SelectTB_ACCESSEVENTDupCheck(aTimestr, aNodeNo, aECUID,
  aDoorNo, aCardNo: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_ACCESSEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' ';
  stSql := stSql + ' where AC_DATE = ''' + copy(aTimestr,1,8) + '''';
  stSql := stSql + ' AND AC_TIME = ''' + copy(aTimestr,9,6) + '''';
  stSql := stSql + ' AND AC_NODENO = ' + intTostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';
  stSql := stSql + ' and DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' and CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';
  result := stSql;
end;

function TMDBSql.SelectTB_ACCESSEVENTFromDayToDay(aFromDate, aToDate,
  aNodeNo, aEcuId, aDoorNo, aPermitCode,aCompanyCode,aJijumCode,
  aDepartCode,aPosiCode,aEmCode,aEmName,aEmTypeCode:string):string;
var
  stSql : string;
begin
  stSql := ' Select a.AC_DATE,a.AC_TIME,d.DO_DOORNONAME, ';
  stSql := stSql + ' a.AC_READERNO,a.CA_CARDNO,g.CO_NAME as CO_COMPANYNAME, h.CO_NAME as CO_JIJUMNAME,';
  stSql := stSql + ' i.CO_NAME as CO_DEPARTNAME,j.PO_NAME,e.EM_CODE,f.EM_NAME,c.PE_PERMITNAME ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ( ';
  end;

  stSql := stSql + ' (select * from TB_ACCESSEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'') a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' INNER JOIN (select * from TB_ADMINDOOR ' ;
      stSql := stSql + ' WHERE AD_USERID = ''' + Master_ID + ''') b ';
      stSql := stSql + ' ON (a.DO_DOORNO = b.DO_DOORNO) ';
      stSql := stSql + ' AND (a.AC_ECUID = b.AC_ECUID) ';
      stSql := stSql + ' AND (a.AC_NODENO = b.AC_NODENO) ';
      stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE) ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' INNER JOIN (select * from TB_PERMITCODE ';
  if Trim(aPermitCode) <> '' then
    stSql := stSql + ' Where PE_PERMITCODE = ''' + aPermitCode + ''' ';
  stSql := stSql + ' ) c ';
  stSql := stSql + ' ON (a.PE_PERMITCODE = c.PE_PERMITCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' INNER JOIN TB_DOOR d ';
  stSql := stSql + ' ON (a.DO_DOORNO = d.DO_DOORNO) ';
  stSql := stSql + ' AND (a.AC_ECUID = d.AC_ECUID) ';
  stSql := stSql + ' AND (a.AC_NODENO = d.AC_NODENO) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  if (aCompanyCode = '') and (aEmCode = '') and (aEmName = '') then
    stSql := stSql + ' LEFT JOIN '
  else  stSql := stSql + ' INNER JOIN ';
  stSql := stSql + ' TB_CARD e ';
  stSql := stSql + ' ON (a.CA_CARDNO = e.CA_CARDNO) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  if (aCompanyCode = '') and (aEmCode = '') and (aEmName = '') then
    stSql := stSql + ' LEFT JOIN '
  else  stSql := stSql + ' INNER JOIN ';
  stSql := stSql + ' ( select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if aJijumCode <> '' then stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if aDepartCode <> '' then stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  if aPosiCode <> '' then stSql := stSql + ' AND PO_POSICODE = ''' + aPosiCode + ''' ';
  if aEmCode <> '' then stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  if aEmName <> '' then stSql := stSql + ' AND EM_NAME LIKE ''%' + aEmName + '%'' ';
  if Trim(aEmTypeCode) <> '' then stSql := stSql + ' AND RG_CODE = ''' + aEmTypeCode + ''' ';
  stSql := stSql + ') f ';
  stSql := stSql + ' ON (e.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (e.EM_CODE = f.EM_CODE) ';
  stSql := stSql + ' AND (e.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''1'' ) g ';
  stSql := stSql + ' ON (f.CO_COMPANYCODE = g.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (f.GROUP_CODE = g.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''2'' ) h ';
  stSql := stSql + ' ON (f.CO_JIJUMCODE = h.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (f.CO_COMPANYCODE = h.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (f.GROUP_CODE = h.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''3'' ) i ';
  stSql := stSql + ' ON (f.CO_DEPARTCODE = i.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (f.CO_JIJUMCODE = i.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (f.CO_COMPANYCODE = i.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (f.GROUP_CODE = i.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI j ';
  stSql := stSql + ' ON (f.PO_POSICODE = j.PO_POSICODE) ';
  stSql := stSql + ' AND (f.CO_COMPANYCODE = j.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (f.GROUP_CODE = j.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_INPUTTYPE = ''C'' ';
  if Trim(aNodeNo) <> ''  then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo));
    stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND a.DO_DOORNO = ''' + aDoorNo + ''' ';
  end;

  result := stSql;
end;

function TMDBSql.SelectTB_ACCESSEVENTJOINATDEVICE(aFromDate,
  aToDate:string): string;
var
  stSql : string;
begin
  stSql := ' Select a.* ';
  stSql := stSql + ' from ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_ACCESSEVENT a ';
  stSql := stSql + ' INNER JOIN ( ';
  stSql := stSql + ' Select * from TB_ACCESSDEVICE IN ';
  stSql := stSql + '''' + ExeFolder + '\..\DB\ZMOS.mdb'' ';
  stSql := stSql + ' Where AC_ATTYPE = ''1'') b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + aFromDate + ''' AND ''' + aToDate + ''' ';
  stSql := stSql + ' order by a.AC_DATE ASC,a.AC_TIME ASC ';
  result := stSql;
end;

function TMDBSql.selectTB_ALARMDEVICEJoinAdmin(aBuildingCode, aFloorCode,
  aAreaCode: string): string;
var
  stSql : string;
begin
  stSql := 'select a.AL_ZONENAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID ';
  stSql := stSql + ' from ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ( ';
  end;
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_ALARMDEVICE a ';
  stSql := stSql + ' Inner Join ( select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' ) b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' ) ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINALARMDEVICE ';
      stSql := stSql + ' Where AD_USERID = ''' + Master_ID + ''') c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TMDBSql.selectTB_ALARMDEVICEJoinPromiseCode(
  aPromisecode: string): string;
var
  stSql :string;
begin
  stSql := 'select a.AL_ZONENAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID, ';
  stSql := stSql + 'd.DE_DOOR1,d.DE_DOOR2,d.DE_USEALARM,d.DE_PERMIT ';
  stSql := stSql + ' from ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' (';
  end;
  stSql := stSql + ' TB_ALARMDEVICE a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINALARMDEVICE ';
      stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + Master_ID + ''') c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
      stSql := stSql + ' )';
    end;
  end;
  stSql := stSql + ' Inner Join (select * from TB_DEVICECARDNO_PROMISE where PR_NAME = ''' + aPromisecode + ''' ) d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TMDBSql.SelectTB_ALARMEVENTFromALARMCatch: string;
var
  stSql : string;
begin
  stSql := 'select a.*,b.AL_ALARMNAME,b.AL_ALARMVIEW,b.AL_ALARMGRADE ';
  stSql := stSql + ' From TB_ALARMSHOW a ';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE b ';
  stSql := stSql + ' ON(a.AL_ALARMSTATUSCODE = b.AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AL_CHECKOK <> ''Y'' ';
  stSql := stSql + ' AND b.AL_ALARMVIEW <> 0 ';
  stSql := stSql + ' Order by b.AL_ALARMGRADE DESC, a.al_date DESC,a.al_time DESC ';

  result := stSql;
end;

function TMDBSql.SelectTB_ALARMEVENTFromDayToDay(aFromDate, aToDate,
  aNodeNo, aEcuId, aAlarmType: string;aOrderASC:Boolean=True): string;
var
  stSql :string;
begin

  stSql := 'Select a.AL_DATE,a.AL_TIME,c.AL_ZONENAME,a.AL_OPERATOR,a.AL_ALARMDEVICETYPECODE, ';
  stSql := stSql + ' a.AL_ALARMMODECODE,a.AL_ZONENO,a.AL_ALARMSTATUSCODE,d.AL_ALARMNAME,a.AL_SUBADDR,';
  stSql := stSql + ' a.AL_CHECKCODE,a.AL_CHECKMSG,a.AL_UPDATEOPERATOR,e.AC_DEVICENAME ';
  stSql := stSql + ' FROM  ';
  stSql := stSql + ' (  ';
  stSql := stSql + ' (  ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ( ';
  end;

  stSql := stSql + ' (select * from TB_ALARMEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'') a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' INNER JOIN (select * from TB_ADMINALARMDEVICE ';
      stSql := stSql + ' Where AD_USERID = ''' + Master_ID + ''') b ';
      stSql := stSql + ' ON (a.AC_ECUID = b.AC_ECUID)  ';
      stSql := stSql + ' AND (a.AC_NODENO = b.AC_NODENO) ';
      stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE) ';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' INNER JOIN TB_ALARMDEVICE c ';
  stSql := stSql + ' ON (a.AC_ECUID = c.AC_ECUID) ';
  stSql := stSql + ' AND (a.AC_NODENO = c.AC_NODENO) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' INNER JOIN TB_ALARMSTATUSCODE d  ';
  stSql := stSql + ' ON (a.AL_ALARMSTATUSCODE = d.AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
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

  if aOrderASC then
    stSql := stsql + ' Order by a.AL_DATE ASC '
  else stSql := stsql + ' Order by a.AL_DATE DESC ';
  
  result := stSql;
end;

function TMDBSql.SelectTB_ALARMGRADEJoinBase(aBuildingCode,aFloorCode,aAreaCode,aCardNo:string): string;
var
  stSql : string;
begin
  stSql := ' select a.AL_ZONENAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,b.DE_RCVACK   ';
  stSql := stSql + ' From ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ( ';
  end;
  stSql := stSql + ' TB_ALARMDEVICE a ';
  stSql := stSql + ' INNER JOIN (select * from TB_DEVICECARDNO ';
  stSql := stSql + ' Where DE_USEALARM = ''Y'' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''L'' ) b  ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
  stSql := stSql + ' )  ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINALARMDEVICE ';
      stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + Master_ID + ''') d ';
      stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID ) ';
      stSql := stSql + ' )  ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND b.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND b.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND b.LO_AREACODE = ''' + aAreaCode + ''' ';
  result := stSql;
end;



function TMDBSql.SelectTB_ATEVENTDaySummary(aDate, aCompanyCode,
  aEmCode: string): string;
var
  stSql : string;
begin
  stSql := ' select a.AT_DATE,a.CO_COMPANYCODE,a.EM_CODE,a.AT_INTIME,a.AT_OUTTIME,a.AT_LEAVETIME,a.AT_BACKTIME,';
  stSql := stSql + ' a.AT_INCODE,b.AT_INTYPE,a.AT_OUTCODE,c.AT_OUTTYPE,';
  stSql := stSql + ' d.* ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (select * from TB_ATEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'') a ';
  stSql := stSql + ' Left JOIN TB_ATINCODE b';
  stSql := stSql + ' ON (a.AT_INCODE = b.AT_INCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_ATOUTCODE c';
  stSql := stSql + ' ON (a.AT_OUTCODE = c.AT_OUTCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_ATCODE d';
  stSql := stSql + ' ON (a.AT_ATCODE = d.AT_ATCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE)';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';
  result := stSql;
  
end;

function TMDBSql.SelectTB_ATEVENTDupCheck(aDate, aCompanyCode,
  aEmCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_ATEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := stSql;
end;

function TMDBSql.SelectTB_ATEVENTFromDayBase(aDate: string): string;
var
  stSql : string;
begin
  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME,f.AT_ATCODE,j.AT_CODENAME,f.AT_INTIME,f.AT_OUTTIME,I.PO_NAME,';
  stSql := stSql + ' f.AT_INCODE,g.AT_INNAME as JIKAK,f.AT_OUTCODE,h.AT_OUTNAME as JOTAE, ';
  stSql := stSql + ' iif(f.AT_INRESULT = ''N'',''지각'',';
  stSql := stSql + ' iif(f.AT_INRESULT = ''Y'',''정상'','''') ) as JIKAK1, ';
  stSql := stSql + ' iif(f.AT_OUTRESULT = ''N'',''조퇴'',';
  stSql := stSql + ' iif(f.AT_OUTRESULT = ''Y'',''정상'','''') ) as Jotae1, ';
  stSql := stSql + ' f.AT_CONTENT ';
  stSql := stSql + ' FROM  ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
//  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE a ';
{  stSql := stSql + ' Left JOIN TB_CARD b ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.EM_CODE = b.EM_CODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' )  ';      }
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''1'') c  ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''2'') d  ';
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''3'') e ';
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE)  ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_POSI i ';
  stSql := stSql + ' ON (a.PO_POSICODE = i.PO_POSICODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = i.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = i.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN (select * from TB_ATEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' where AT_DATE =''' + aDate + ''') f  ';
  stSql := stSql + ' ON (a.EM_CODE = f.EM_CODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_ATINCODE g ';
  stSql := stSql + ' ON (f.AT_INCODE = g.AT_INCODE)  ';
  stSql := stSql + ' AND (f.GROUP_CODE = g.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_ATOUTCODE h ';
  stSql := stSql + ' ON (f.AT_OUTCODE = h.AT_OUTCODE)  ';
  stSql := stSql + ' AND (f.GROUP_CODE = h.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_ATCODE j ';
  stSql := stSql + ' ON (f.AT_ATCODE = j.AT_ATCODE)  ';
  stSql := stSql + ' AND (f.GROUP_CODE = j.GROUP_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;

end;

function TMDBSql.SelectTB_ATEVENTFromToDayBase(aFromDate,
  aToDate: string): string;
var
  stSql : string;
begin
  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME,f.AT_ATCODE,j.AT_CODENAME,f.AT_INTIME,f.AT_OUTTIME,I.PO_NAME,';
  stSql := stSql + ' f.AT_INCODE,g.AT_INNAME as JIKAK,f.AT_OUTCODE,h.AT_OUTNAME as JOTAE, ';
  stSql := stSql + ' iif(f.AT_INRESULT = ''N'',''지각'',';
  stSql := stSql + ' iif(f.AT_INRESULT = ''Y'',''정상'','''') ) as JIKAK1, ';
  stSql := stSql + ' iif(f.AT_OUTRESULT = ''N'',''조퇴'',';
  stSql := stSql + ' iif(f.AT_OUTRESULT = ''Y'',''정상'','''') ) as Jotae1, ';
  stSql := stSql + ' f.AT_CONTENT ';
  stSql := stSql + ' FROM  ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
//  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE a ';
{  stSql := stSql + ' Left JOIN TB_CARD b ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.EM_CODE = b.EM_CODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' )  ';      }
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''1'') c  ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''2'') d  ';
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''3'') e ';
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE)  ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_POSI i ';
  stSql := stSql + ' ON (a.PO_POSICODE = i.PO_POSICODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = i.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = i.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Inner JOIN (select * from TB_ATEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' where AT_DATE Between ''' + aFromDate + ''' ';
  stSql := stSql + ' AND ''' + aToDate + ''') f  ';
  stSql := stSql + ' ON (a.EM_CODE = f.EM_CODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_ATINCODE g ';
  stSql := stSql + ' ON (f.AT_INCODE = g.AT_INCODE)  ';
  stSql := stSql + ' AND (f.GROUP_CODE = g.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_ATOUTCODE h ';
  stSql := stSql + ' ON (f.AT_OUTCODE = h.AT_OUTCODE)  ';
  stSql := stSql + ' AND (f.GROUP_CODE = h.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_ATCODE j ';
  stSql := stSql + ' ON (f.AT_ATCODE = j.AT_ATCODE)  ';
  stSql := stSql + ' AND (f.GROUP_CODE = j.GROUP_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;

end;

function TMDBSql.SelectTB_ATEVENTNonProcessFromDayToDay(aFromDate,
  aToDate: string): string;
var
  stSql : string;
begin
  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME,f.AT_INTIME,f.AT_OUTTIME,I.PO_NAME,';
  stSql := stSql + ' f.AT_INCODE,g.AT_INNAME as JIKAK,f.AT_OUTCODE,h.AT_OUTNAME as JOTAE, ';
  stSql := stSql + ' f.AT_CONTENT,b.CA_CARDNO,f.AT_DATE ';
  stSql := stSql + ' FROM  ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE a ';
  stSql := stSql + ' Left JOIN TB_CARD b ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.EM_CODE = b.EM_CODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''1'') c  ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''2'') d  ';
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''3'') e ';
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE)  ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_POSI i ';
  stSql := stSql + ' ON (a.PO_POSICODE = i.PO_POSICODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = i.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = i.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Inner JOIN (select * from TB_ATEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' where AT_DATE between ''' + aFromDate + ''' ';
  stSql := stSql + ' AND ''' + aToDate + ''' ';
  stSql := stSql + ' AND ( AT_INCODE = ''000'' OR AT_INCODE IS NULL OR AT_OUTCODE = ''000'' OR AT_OUTCODE IS NULL ';
  stSql := stSql + ' OR  AT_INTIME IS NULL OR AT_OUTTIME IS NULL ) ) f ';
  stSql := stSql + ' ON (a.EM_CODE = f.EM_CODE)  ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE)  ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_ATINCODE g ';
  stSql := stSql + ' ON (f.AT_INCODE = g.AT_INCODE)  ';
  stSql := stSql + ' AND (f.GROUP_CODE = g.GROUP_CODE) ';
  stSql := stSql + ' )  ';
  stSql := stSql + ' Left JOIN TB_ATOUTCODE h ';
  stSql := stSql + ' ON (f.AT_OUTCODE = h.AT_OUTCODE)  ';
  stSql := stSql + ' AND (f.GROUP_CODE = h.GROUP_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TMDBSql.SelectTB_CARDAdminJoinBase: string;
var
  stSql:string;
begin
  stSql := 'select a.CA_CARDNO,a.CA_CARDTYPE,b.CO_COMPANYCODE,b.EM_NAME,b.EM_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_COMPANYNAME,b.CO_JIJUMCODE,d.CO_NAME as CO_JIJUMNAME,b.CO_DEPARTCODE,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' TB_CARD a';
  stSql := stSql + ' Left JOIN TB_EMPLOYEE b';
  stSql := stSql + ' ON (a.EM_CODE = b.EM_CODE)';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = b.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') c ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = c.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS d';
  stSql := stSql + ' ON (b.CO_JIJUMCODE = d.CO_JIJUMCODE)';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = d.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = d.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS e ';
  stSql := stSql + ' ON (b.CO_DEPARTCODE = e.CO_DEPARTCODE)';
  stSql := stSql + ' AND (b.CO_JIJUMCODE = e.CO_JIJUMCODE)';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = e.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = e.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN TB_POSI f';
  stSql := stSql + ' ON (b.PO_POSICODE = f.PO_POSICODE)';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = f.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = f.GROUP_CODE)';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';
  result := stSql;

end;


function TMDBSql.SelectTB_CARDFromAlarmGradeJoinBase(aAC_NODENO,
  aAC_ECUID: string): string;
var
  stSql : string;
begin
  stSql := 'select a.CA_CARDNO,a.CA_CARDTYPE,b.CO_COMPANYCODE,b.EM_NAME,b.EM_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_COMPANYNAME,d.CO_NAME as CO_JIJUMNAME,b.CO_DEPARTCODE,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME,g.DE_RCVACK ';
  stSql := stSql + ' from ';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' TB_CARD a  ';
  stSql := stSql + ' Left JOIN TB_EMPLOYEE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE )';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') c ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = c.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS d';
  stSql := stSql + ' ON (b.CO_JIJUMCODE = d.CO_JIJUMCODE)';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = d.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = d.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS e ';
  stSql := stSql + ' ON (b.CO_DEPARTCODE = e.CO_DEPARTCODE)';
  stSql := stSql + ' AND (b.CO_JIJUMCODE = e.CO_JIJUMCODE)';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = e.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = e.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN TB_POSI f';
  stSql := stSql + ' ON (b.PO_POSICODE = f.PO_POSICODE)';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = f.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = f.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' INNER JOIN (select * from TB_DEVICECARDNO ';
  stSql := stsql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aAC_NODENO ;
  stSql := stSql + ' AND AC_ECUID = ''' + aAC_ECUID + ''' ';
  stSql := stSql + ' AND DE_USEALARM = ''Y'') G ';
  stSql := stSql + ' ON ( a.GROUP_CODE = G.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = G.CA_CARDNO ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';

  result := stSql;
end;

function TMDBSql.SelectTB_CARDFromDoorGradeJoinBase(aAC_NODENO,aAC_ECUID,
  aDoorNo: string): string;
var
  stSql : string;
begin

  stSql := 'select a.CA_CARDNO,a.CA_CARDTYPE,b.CO_COMPANYCODE,b.EM_NAME,b.EM_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_COMPANYNAME,b.CO_JIJUMCODE,d.CO_NAME as CO_JIJUMNAME,b.CO_DEPARTCODE,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME,g.DE_RCVACK ';
  stSql := stSql + ' FROM';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_CARD as a ';
  stSql := stSql + ' INNER JOIN TB_EMPLOYEE as b ';
  stSql := stSql + ' ON (a.EM_CODE = b.EM_CODE)';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = b.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' INNER JOIN ( select * from TB_DEVICECARDNO ';
  stSql := stSql + ' Where DE_USEACCESS = ''Y'' ';
  stSql := stSql + ' AND AC_NODENO = ' + aAC_NODENO ;
  stSql := stSql + ' AND AC_ECUID = ''' + aAC_ECUID + ''' ';
  if aDoorNo = '1' then stSql := stSql + ' AND DE_DOOR1 = ''Y'' '
  else stSql := stSql + ' AND DE_DOOR2 = ''Y'' ';
  stSql := stSql + ' ) as g ';
  stSql := stSql + ' ON (a.CA_CARDNO = g.CA_CARDNO)';
  stSql := stSql + ' AND (a.GROUP_CODE = g.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'')  as c ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = c.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'')  AS d ';
  stSql := stSql + ' ON (b.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = d.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'')  AS e';
  stSql := stSql + ' ON (b.CO_DEPARTCODE = e.CO_DEPARTCODE)';
  stSql := stSql + ' AND (b.CO_JIJUMCODE = e.CO_JIJUMCODE)';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = e.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = e.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' INNER JOIN TB_POSI f';
  stSql := stSql + ' ON (b.PO_POSICODE = f.PO_POSICODE)';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = f.CO_COMPANYCODE)';
  stSql := stSql + ' AND (b.GROUP_CODE = f.GROUP_CODE)';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDTYPE = ''1'' ';

  result := stSql;

end;

function TMDBSql.SelectTB_CARDJoinTBEmployee(aPrimary:string): string;
var
  stSql : string;
begin
  stSql := 'select a.CO_COMPANYCODE,c.CO_NAME as COMPANYNAME,';
  stSql := stSql + ' b.CO_JIJUMCODE,d.CO_NAME as JIJUMNAME,';
  stSql := stSql + ' b.CO_DEPARTCODE,e.CO_NAME as DEPARTNAME,';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME,';
  stSql := stSql + ' a.EM_CODE,b.EM_NAME ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_CARD a ';
  stSql := stSql + ' Left JOIN TB_EMPLOYEE b ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') c ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') d  ';
  stSql := stSql + ' ON (b.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') e ';
  stSql := stSql + ' ON (b.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (b.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI f ';
  stSql := stSql + ' ON (b.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aPrimary + ''' ';
  result := stSql;
end;


function TMDBSql.selectTB_DOORJoinAdmin(aBuildingCode, aFloorCode,
  aAreaCode: string;aDoorView:Boolean=True): string;
var
  stSql : string;
begin

  stSql := ' select a.DO_DOORNONAME,a.DO_DOORNO,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_VIEWSEQ,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ' ;
  stSql := stSql + ' from TB_DOOR a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINDOOR ';
      stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + Master_ID + ''' ';
      stSql := stSql + ' ) b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO )';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' Group by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  if aDoorView then stSql := stSql + ' order by a.DO_VIEWSEQ'
  else stSql := stSql + ' Order by a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO ';

  result := stSql;
end;

function TMDBSql.selectTB_DOORJoinGrade(aBuildingCode, aFloorCode,
  aAreaCode, aCardNo: string): string;
var
  stSql :string;
begin
  stSql := ' select a.DO_VIEWSEQ,a.DO_DOORNONAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,b.DE_RCVACK  ';
  stSql := stSql + ' From ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ( ';
  end;
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_DOOR a ';
  stSql := stSql + ' INNER JOIN (select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND DE_USEACCESS = ''Y'' ';
  stSql := stSql + ' AND DE_PERMIT = ''L''';
  stSql := stSql + ' ) b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' ) ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINDOOR ';
      stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + Master_ID + ''' ';
      stSql := stSql + ') c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO )';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ( (a.DO_DOORNO = ''1'' AND b.DE_DOOR1 = ''Y'') OR  ';
  stSql := stSql + '       (a.DO_DOORNO = ''2'' AND b.DE_DOOR2 = ''Y'') ) ';
  stSql := stSql + ' AND b.CA_CARDNO = ''' + aCardNo + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' order by a.DO_VIEWSEQ ';

  result := stSql;
end;

function TMDBSql.selectTB_DOORJoinPromiseCode(
  aPromisecode: string): string;
var
  stSql:string;
begin
  stSql := ' select a.DO_DOORNONAME,a.DO_DOORNO,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_VIEWSEQ, ' ;
  stSql := stSql + 'c.DE_DOOR1,c.DE_DOOR2,c.DE_USEALARM,c.DE_PERMIT ';
  stSql := stSql + ' from ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ( ';
  end;
  stSql := stSql + ' TB_DOOR a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINDOOR ';
      stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + Master_ID + ''') b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO )';
      stSql := stSql + ' ) ';
    end;
  end;
  stSql := stSql + ' Inner Join (select * from TB_DEVICECARDNO_PROMISE where PR_NAME = ''' + aPromisecode + ''') c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by a.DO_VIEWSEQ ';

  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEE: string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,b.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' c.CO_NAME as JIJUMNAME,d.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,';
  stSql := stSql + ' a.RG_CODE ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE as a ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') AS b ';  //회사명
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS c ';  //지점명
  stSql := stSql + ' ON (a.CO_JIJUMCODE = c.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS d '; //부서명
  stSql := stSql + ' ON (a.CO_DEPARTCODE = d.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI As f ';
  stSql := stSql + ' ON (a.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';  

  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEATJoinATBasePAY: string;
var
  stSql : string;
begin
  stSql := ' select a.CO_COMPANYCODE,a.EM_CODE,b.PA_GUBUN,b.PA_AMT,';
  stSql := stSql + ' c.AT_WORKSTARTTIME,c.AT_WORKENDTIME ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE a ';
  stSql := stSql + ' LEFT JOIN (select * from TB_BASEPAY where PA_CODE = ''001'') b';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' LEFT JOIN TB_ATCODE c ';
  stSql := stSql + ' ON (a.AT_ATCODE = c.AT_ATCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEATJoinBase: string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,G.PA_GUBUN,G.PA_AMT,b.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' c.CO_NAME as JIJUMNAME,d.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,';
  stSql := stSql + ' e.CA_CARDNO,e.CA_CARDTYPE ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE as a ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') AS b ';  //회사명
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS c ';  //지점명
  stSql := stSql + ' ON (a.CO_JIJUMCODE = c.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS d '; //부서명
  stSql := stSql + ' ON (a.CO_DEPARTCODE = d.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_CARD AS e ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.EM_CODE = e.EM_CODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI As f ';
  stSql := stSql + ' ON (a.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_BASEPAY where PA_CODE = ''001'' ) As g ';
  stSql := stSql + ' ON ( a.GROUP_CODE = G.GROUP_CODE ) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = G.CO_COMPANYCODE ) ';
  stSql := stSql + ' AND (a.EM_CODE = G.EM_CODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEATJoinExtraBase: string;
var
  stSql : string;
begin
  stSql := 'select c.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' b.EX_TYPE,b.EX_WEARLYAMT,b.EX_WEXTENDAMT,b.EX_WNIGHTAMT,';
  stSql := stSql + ' b.EX_SEARLYAMT,b.EX_SEXTENDAMT,b.EX_SNIGHTAMT,';
  stSql := stSql + ' b.EX_HEARLYAMT,b.EX_HEXTENDAMT,b.EX_HNIGHTAMT ';
  stSql := stSql + ' FROM  ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE a ';
  stSql := stSql + ' Left JOIN TB_ATEMPEXTRA b ';
  stSql := stSql + ' ON (a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''1'' ) c ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''2'' ) d ';
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''3'' ) e ';
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI f ';
  stSql := stSql + ' ON (a.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;

end;

function TMDBSql.SelectTB_EMPLOYEEATVacation(aMonth: string): string;
var
  stSql : string;
begin
  stSql := 'select ';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME, ';
  stSql := stSql + ' c.VA_DATE,c.AT_VACODE,d.AT_VAMARK ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' (TB_EMPLOYEE a ';
  stSql := stSql + ' INNER JOIN (select * from TB_ATVACATION where Mid(VA_DATE,1,6)  = ''' + aMonth + ''') c ';
  stSql := stSql + ' ON (a.EM_CODE = c.EM_CODE)';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = c.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN TB_ATVACODE d ';
  stSql := stSql + ' ON (c.AT_VACODE = d.AT_VACODE)';
  stSql := stSql + ' AND (c.GROUP_CODE = d.GROUP_CODE)';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEDupCardJoinBase: string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,b.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' c.CO_NAME as JIJUMNAME,d.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,a.RG_CODE ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE as a ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') AS b ';  //회사명
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS c ';  //지점명
  stSql := stSql + ' ON (a.CO_JIJUMCODE = c.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS d '; //부서명
  stSql := stSql + ' ON (a.CO_DEPARTCODE = d.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI As f ';
  stSql := stSql + ' ON (a.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';  

  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEJoinACEventDayToDay(aFromDate,
  aToDate: string): string;
var
  stSql : string;
begin
  stSql := ' select c.AC_DATE,c.AC_TIME,d.AC_DEVICENAME,c.AC_READERNO,c.AC_BUTTONNO,';
  stSql := stSql + ' c.CA_CARDNO,e.CO_NAME as COMPANYNAME,';
  stSql := stSql + ' f.CO_NAME as JIJUMNAME,g.CO_NAME as DEPARTNAME,h.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE  ';
  stSql := stSql + ' FROM  ';
  stSql := stSql + ' (';
  stSql := stSql + ' (  ';
  stSql := stSql + ' (    ';
  stSql := stSql + ' (';
  stSql := stSql + ' (  ';
  stSql := stSql + ' (    ';
  stSql := stSql + ' TB_EMPLOYEE a';
  stSql := stSql + ' INNER JOIN TB_CARD b';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.EM_CODE = b.EM_CODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' )                                  ';
  stSql := stSql + ' INNER JOIN (select * from TB_ACCESSEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' ';
  stSql := stSql + ' Where AC_DATE BETWEEN ''' + aFromDate + ''' ';
  stSql := stSql + ' AND ''' + aToDate + ''') c';
  stSql := stSql + ' ON (b.CA_CARDNO = c.CA_CARDNO)     ';
  stSql := stSql + ' AND (b.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' LEFT JOIN TB_ACCESSDEVICE d';
  stSql := stSql + ' ON (c.AC_ECUID = d.AC_ECUID) ';
  stSql := stSql + ' AND (c.AC_NODENO = d.AC_NODENO)';
  stSql := stSql + ' AND (c.GROUP_CODE = d.GROUP_CODE)';
  stSql := stSql + ' )                                  ';
  stSql := stSql + ' LEFT JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') e';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = e.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' LEFT JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') f';
  stSql := stSql + ' ON (a.CO_JIJUMCODE = f.CO_JIJUMCODE)                            ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE)                         ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE)';
  stSql := stSql + ' )                                  ';
  stSql := stSql + ' LEFT JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') g';
  stSql := stSql + ' ON (a.CO_DEPARTCODE = g.CO_DEPARTCODE)                          ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = g.CO_JIJUMCODE)';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = g.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = g.GROUP_CODE)';
  stSql := stSql + ' )                                  ';
  stSql := stSql + ' LEFT JOIN TB_POSI h                  ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = h.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.PO_POSICODE = h.PO_POSICODE)       ';
  stSql := stSql + ' AND (a.GROUP_CODE = h.GROUP_CODE)           ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;

end;

function TMDBSql.SelectTB_EMPLOYEEJoinATDAYSUMMARYDayToDay(aFromDate,
  aToDate: string): string;
var
  stSql : string;
begin
  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.EM_NAME,f.AT_INTIME,f.AT_OUTTIME,f.AT_LEAVETIME,f.AT_BACKTIME,I.PO_NAME,';
  stSql := stSql + ' f.AT_INCODE,g.AT_INNAME as AT_INNAME,f.AT_OUTCODE,h.AT_OUTNAME as AT_OUTNAME, ';
  stSql := stSql + ' f.AT_CONTENT,J.AT_CODENAME,b.* ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' TB_EMPLOYEE a';
  stSql := stSql + ' INNER JOIN (select * from TB_ATDAYSUMMARY ';
  stSql := stSql + ' where AT_DATE BETWEEN ''' + aFromDate + ''' AND ''' + aToDate + ''')  b';
  stSql := stSql + ' ON (a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') c ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'')  d ';
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'')  e ';
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN  (select * from TB_ATEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'') f ';
  stSql := stSql + ' ON (b.EM_CODE = f.EM_CODE) ';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.AT_DATE = f.AT_DATE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = f.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_ATINCODE g';
  stSql := stSql + ' ON (f.AT_INCODE = g.AT_INCODE) ';
  stSql := stSql + ' AND (f.GROUP_CODE = g.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_ATOUTCODE h';
  stSql := stSql + ' ON (f.GROUP_CODE = h.GROUP_CODE) ';
  stSql := stSql + ' AND (f.AT_OUTCODE = h.AT_OUTCODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI i';
  stSql := stSql + ' ON (a.PO_POSICODE = i.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = i.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = i.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_ATCODE j ';
  stSql := stSql + ' ON (f.AT_ATCODE = j.AT_ATCODE) ';
  stSql := stSql + ' AND (f.GROUP_CODE = j.GROUP_CODE)';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
  
end;

function TMDBSql.SelectTB_EMPLOYEEJoinATEVENTDay(aDate, aCompanyCode,
  aEmCode: string): string;
var
  stSql : string;
begin
  stSql := ' SELECT b.EM_IMAGE,b.EM_NAME,b.EM_CODE,c.CO_NAME as CO_COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as CO_JIJUMNAME,e.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + ' f.PO_NAME,a.AT_INTIME,a.AT_OUTTIME,a.AT_LEAVETIME,a.AT_BACKTIME ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE b ';
  stSql := stSql + ' Left JOIN (select * from TB_ATEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' where AT_DATE =''' + aDate + ''') a ';
  stSql := stSql + ' ON (b.EM_CODE = a.EM_CODE) ';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = a.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = a.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''1'') c  ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''2'') d ';
  stSql := stSql + ' ON (b.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''3'') e ';
  stSql := stSql + ' ON (b.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (b.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI f ';
  stSql := stSql + ' ON (b.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (b.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (b.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND b.EM_CODE = ''' + aEmCode + ''' ';
  result := stSql;

end;

function TMDBSql.SelectTB_EMPLOYEEJoinATMONTHSUMMARY(
  aMonth: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.EM_NAME,';
  stSql := stSql + ' c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' I.PO_NAME,b.*';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' (';
  stSql := stSql + ' TB_EMPLOYEE a';
  stSql := stSql + ' INNER JOIN (select * from TB_ATMONTHSUMMARY where AT_MONTH = ''' + aMonth + ''') b ';
  stSql := stSql + ' ON (a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''1'') c ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''2'') d ';
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN (select * from TB_COMPANY where CO_GUBUN = ''3'') e ';
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI i ';
  stSql := stSql + ' ON (a.PO_POSICODE = i.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = i.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = i.GROUP_CODE)';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEJoinBase: string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,b.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' c.CO_NAME as JIJUMNAME,d.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,';
  stSql := stSql + ' e.CA_CARDNO,e.CA_CARDTYPE,a.RG_CODE,a.FDMS_ID ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE as a ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') AS b ';  //회사명
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS c ';  //지점명
  stSql := stSql + ' ON (a.CO_JIJUMCODE = c.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS d '; //부서명
  stSql := stSql + ' ON (a.CO_DEPARTCODE = d.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_CARD AS e ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.EM_CODE = e.EM_CODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI As f ';
  stSql := stSql + ' ON (a.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';  

  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEJoinCARDRelayBase: string;
var
  stSql : string;
begin
  stSql := 'select g.FDMS_ID,b.CA_CARDNO,';
  stSql := stSql + ' g.CO_COMPANYCODE,c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.PO_POSICODE,f.PO_NAME,g.EM_CODE,a.EM_NAME,a.em_handphone,g.seq,g.SEND_STATUS,g.Mode ';
  stSql := stSql + '    FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPHIS g ';
  stSql := stSql + ' Left Join TB_EMPLOYEE a ';
  stSql := stSql + ' ON (g.CO_COMPANYCODE = a.CO_COMPANYCODE)';
  stSql := stSql + ' AND (g.EM_CODE = a.EM_CODE)';
  stSql := stSql + ' AND (g.GROUP_CODE = a.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN TB_CARD b';
  stSql := stSql + ' ON (g.CO_COMPANYCODE = b.CO_COMPANYCODE)';
  stSql := stSql + ' AND (g.EM_CODE = b.EM_CODE)';
  stSql := stSql + ' AND (g.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' AND (b.CA_GUBUN = ''1'' ) ';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') AS c ';  //회사명
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS d ';  //지점명
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS e '; //부서명
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI As f ';
  stSql := stSql + ' ON (a.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' where g.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEJoinFoodCode(aDate,
  aFoodCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select a.CO_COMPANYCODE,c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.EM_CODE,a.EM_NAME,f.FO_DATE,f.FO_TIME,a.PO_POSICODE,h.PO_NAME,';
  stSql := stSql + ' f.AC_NODENO,f.FO_DOORNO,f.AC_MCUID,f.AC_ECUID,';
  stSql := stSql + ' iif(f.FO_PERMIT = ''Y'',''승인'',';
  stSql := stSql + ' iif(f.FO_PERMIT = ''N'',''미승인'','''') ) as PERMIT, ';
  stSql := stSql + ' f.FO_CONTENT,g.FO_CODENAME,f.FO_FOODAMT ';
  stSql := stSql + '    FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
//  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE a ';
{  stSql := stSql + ' Left JOIN TB_CARD b';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.EM_CODE = b.EM_CODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' )';  }
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') AS c ';  //회사명
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS d ';  //지점명
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS e '; //부서명
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  if aFoodCode <> '' then stSql := stSql + ' Inner JOIN '
  else stSql := stSql + ' Left JOIN ';
  stSql := stSql + ' (select * from TB_FOODEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' ';
  stSql := stSql + ' Where FO_DATE = ''' + aDate + ''' ';
  if aFoodCode <> '' then stSql := stSql + ' AND FO_FOODCODE = ''' + aFoodCode + ''' ';
  stSql := stSql + ' ) f ';
  stSql := stSql + ' ON (a.EM_CODE = f.EM_CODE)';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN TB_FOODCODE g';
  stSql := stSql + ' ON (f.FO_FOODCODE = g.FO_FOODCODE)';
  stSql := stSql + ' AND (f.GROUP_CODE = g.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN TB_POSI As h ';
  stSql := stSql + ' ON (a.PO_POSICODE = h.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = h.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = h.GROUP_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEJoinFoodEventFromD2D(aFoodArea,aFoodCode,
  aFoodPermit, aStartDate, aEndDate: string): string;
var
  stSql : string;
begin
  stSql := 'Select Mid(b.FO_DATE,1,4) + ''-'' + Mid(b.FO_DATE,5,2) + ''-'' + Mid(b.FO_DATE,7,2) as FO_DATE,';
  stSql := stSql + 'Mid(b.FO_TIME,1,2) + '':'' + Mid(b.FO_TIME,3,2) + '':'' + Mid(b.FO_TIME,5,2) as FO_TIME, ' ;
  stSql := stSql + ' iif(b.FO_PERMIT = ''N'',''미승인'',';
  stSql := stSql + ' iif(b.FO_PERMIT = ''Y'',''승인'','''') ) as FO_PERMIT, ';
  stSql := stSql + ' b.FO_CONTENT,b.FO_FOODCODE,';
  stSql := stSql + ' a.CO_COMPANYCODE,c.CO_NAME as COMPANY_NAME, ';
  stSql := stSql + ' a.CO_JIJUMCODE,d.CO_NAME as JIJUM_NAME, ';
  stSql := stSql + ' a.CO_DEPARTCODE,e.CO_NAME as DEPART_NAME,a.PO_POSICODE,f.PO_NAME, ';
  stSql := stSql + ' a.EM_CODE,a.EM_NAME,g.FO_CODENAME,h.FO_NAME ';
  stSql := stSql + ' From ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE a ';
  stSql := stSql + ' Inner Join (select * from TB_FOODEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' ';
  stSql := stSql + ' Where FO_DATE BETWEEN ''' + aStartDate + ''' ';
  stSql := stSql + ' AND ''' + aEndDate + ''' ';
  if aFoodCode <> '' then
    stSql := stSql + ' AND FO_FOODCODE = ''' + aFoodCode + ''' ';
  if aFoodPermit <> '' then
    stSql := stSql + ' AND FO_PERMIT = ''' + aFoodPermit + ''' ';
  stSql := stSql + ' ) b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE )';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = b.CO_COMPANYCODE )';
  stSql := stSql + ' AND (a.EM_CODE = b.EM_CODE )';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') AS c ';  //회사명
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS d ';  //지점명
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS e '; //부서명
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI As f ';
  stSql := stSql + ' ON (a.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join TB_FOODCODE g ';
  stSql := stSql + ' ON ( b.GROUP_CODE = g.GROUP_CODE ) ';
  stSql := stSql + ' AND ( b.FO_FOODCODE = g.FO_FOODCODE ) ';
  stSql := stSql + ' ) ';
  if aFoodArea <> '' then
  begin
    stSql := stSql + ' Inner Join (select * from TB_FOOD ';
    stSql := stSql + '       where AC_NODENO = ' + inttostr(strtoint(copy(aFoodArea,1,3))) ;
    stSql := stsql + '       AND   AC_ECUID = ''' + copy(aFoodArea,4,2) + ''' ';
    stSql := stSql + '       AND   FO_DOORNO = ''' + copy(aFoodArea,6,1) + ''' ) h ';
    stSql := stSql + ' ON (b.GROUP_CODE = h.GROUP_CODE )';
    stSql := stSql + ' AND (b.AC_NODENO = h.AC_NODENO )';
    stSql := stSql + ' AND (b.AC_ECUID = h.AC_ECUID )';
    stSql := stSql + ' AND (b.FO_DOORNO = h.FO_DOORNO ) ';
  end else
  begin
    stSql := stSql + ' Left Join TB_FOOD h ';
    stSql := stSql + ' ON (b.GROUP_CODE = h.GROUP_CODE )';
    stSql := stSql + ' AND (b.AC_NODENO = h.AC_NODENO )';
    stSql := stSql + ' AND (b.AC_ECUID = h.AC_ECUID )';
    stSql := stSql + ' AND (b.FO_DOORNO = h.FO_DOORNO ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEJoinFOODGrade(aNonPay: string): string;
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
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE a ';
  if aNonPay <> '' then  stSql := stSql + ' INNER JOIN '
  else stSql := stSql + ' LEFT JOIN ';
  stSql := stSql + ' (select * from TB_FOODGRADE ';
  if aNonPay <> '' then stSql := stSql + ' where FO_MONEY = ''' + aNonPay + ''' ';
  stSql := stSql + ' ) b ';
  stSql := stSql + ' ON (a.EM_CODE = b.EM_CODE)';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') AS c ';  //회사명
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS d ';  //지점명
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS e '; //부서명
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' ) '; 
  stSql := stSql + ' Left JOIN TB_POSI As f ';
  stSql := stSql + ' ON (a.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;

end;

function TMDBSql.SelectTB_EMPLOYEEJoinFoodState(aStarDate,
  aEndDate,aFoodArea,aFoodPermit: string): string;
var
  stSql : string;
begin
  stSql := 'Select  a.CO_COMPANYCODE,c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.PO_POSICODE,f.PO_NAME,a.EM_CODE,a.EM_NAME,';
  stSql := stSql + ' b.FO_BREAK,b.FO_LUNCH,b.FO_DINNER,b.FO_MIDNIGHT,b.TOT,b.FO_FOODAMT ';
  stSql := stSql + ' FROM  ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
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
  stSql := stSql + ' ( select GROUP_CODE,FO_DATE,CO_COMPANYCODE,EM_CODE,FO_FOODAMT,  ';
  stSql := stSql + ' iif(FO_FOODCODE = ''001'',1,0) as FO_BREAK, ';
  stSql := stSql + ' iif(FO_FOODCODE = ''002'',1,0) as FO_LUNCH, ';
  stSql := stSql + ' iif(FO_FOODCODE = ''003'',1,0) as FO_DINNER, ';
  stSql := stSql + ' iif(FO_FOODCODE = ''004'',1,0) as FO_MIDNIGHT, ';
  stSql := stSql + ' 1 as TOT   ';
  stSql := stSql + ' from  ';
  stSql := stSql + ' (select * from TB_FOODEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' ';
  stSql := stSql + ' Where FO_DATE BETWEEN ''' + aStarDate + ''' ';
  stSql := stSql + ' AND ''' + aEndDate + ''' ';
  if aFoodPermit <> '' then stSql := stSql + ' AND FO_PERMIT = ''' + aFoodPermit + '''  ';
  if aFoodArea <> '' then
  begin
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aFoodArea,1,3))) ;
    stSql := stSql + ' AND AC_ECUID = ''' + copy(aFoodArea,4,2) + ''' ';
    stSql := stSql + ' AND FO_DOORNO = ''' + copy(aFoodArea,6,1) + ''' ';
  end;
  stSql := stSql + ' )  ';
  stSql := stSql + ' ) aa   ';
  stSql := stSql + ' GROUP BY aa.GROUP_CODE,aa.CO_COMPANYCODE,aa.EM_CODE   ';
  stSql := stSql + ' ) b   ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' )';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') AS c ';  //회사명
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS d ';  //지점명
  stSql := stSql + ' ON (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS e '; //부서명
  stSql := stSql + ' ON (a.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI As f ';
  stSql := stSql + ' ON (a.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TMDBSql.SelectTB_EMPLOYEEJoinKTCardISSUE: string;
var
  stSql : string;
begin
  stSql := 'select a.AT_ATCODE,a.EM_PASS,b.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' c.CO_NAME as JIJUMNAME,d.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,a.EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,';
  stSql := stSql + ' e.CA_CARDNO,e.CA_CARDTYPE,g.CARD_SEQ ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_EMPLOYEE as a ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''1'') AS b ';  //회사명
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE)';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''2'') AS c ';  //지점명
  stSql := stSql + ' ON (a.CO_JIJUMCODE = c.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN ( select * from TB_COMPANY where CO_GUBUN = ''3'') AS d '; //부서명
  stSql := stSql + ' ON (a.CO_DEPARTCODE = d.CO_DEPARTCODE) ';
  stSql := stSql + ' AND (a.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = d.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = d.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_CARD AS e ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = e.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.EM_CODE = e.EM_CODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = e.GROUP_CODE)';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left JOIN TB_POSI As f ';
  stSql := stSql + ' ON (a.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stSql + ' AND (a.CO_COMPANYCODE = f.CO_COMPANYCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = f.GROUP_CODE) ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join TB_KTCARDISSUE g';
  stSql := stSql + ' ON ( a.GROUP_CODE = g.GROUP_CODE ) ';
  stSql := stSql + ' AND ( a.EM_CODE = g.EM_CODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TMDBSql.SelectTB_FOODEVENTALL: string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_FOODEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' ';
  result := stSql;
end;

function TMDBSql.SelectTB_FOODEVENTDupCheck(aTime, aNodeNo, aECUID,
  aReaderNo, aCompanyCode,aEmCode: string): string;
var
  stSql : string;
begin
  stSql := 'Select * from TB_FOODEVENT IN ''';
  stSql := stSql + ExeFolder + '\..\DB\ZEVENT.mdb'' ';
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

function TMDBSql.selectTB_FOODJoinPromiseCode(
  aPromisecode: string): string;
var
  stSql : string;
begin
  stSql := 'select a.FO_NAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO, ';
  stSql := stSql + 'c.DE_DOOR1,c.DE_DOOR2,c.DE_USEALARM,c.DE_PERMIT ';
  stSql := stSql + ' from ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then stSql := stSql + ' ( ';
  end;
  stSql := stSql + ' TB_FOOD a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join (select * from TB_ADMINFOOD  ';
      stSql := stsql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + Master_ID + ''') b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
      stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
      stSql := stSql + ') ';
    end;
  end;
  stSql := stSql + ' Inner Join (select * from TB_DEVICECARDNO_PROMISE where PR_NAME = ''' + aPromisecode + ''') c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  result := stSql;
end;

function TMDBSql.SelectTB_GRADEPROGRAMGradeJoinBase(aGradeCode,
  aProgramGroupCode: string): string;
var
  stSql :string;
begin
  stSql := 'select a.*,b.PR_PROGRAMNAME ';
  stSql := stSql + ' FROM ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' TB_GRADEPROGRAM a ';
  stSql := stSql + ' INNER JOIN TB_PROGRAMID b ';
  stSql := stSql + ' ON (a.PR_PROGRAMID = b.PR_PROGRAMID)';
  stSql := stSql + ' AND (a.GROUP_CODE = b.GROUP_CODE)';
  stSql := stSql + ' )';
  stSql := stSql + ' INNER JOIN (select * from TB_PROGRAMGROUP ';
  stSql := stSql + ' Where GUBUN = ''' + aProgramGroupCode + ''') c ';
  stSql := stSql + ' ON (a.PR_GROUPCODE = c.PR_GROUPCODE) ';
  stSql := stSql + ' AND (a.GROUP_CODE = c.GROUP_CODE)';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND a.GR_GRADECODE = ''' + aGradeCode + '''';
  stSql := stSql + ' AND a.GR_GUBUN = ''1'' ';
  result := stSql;
end;

function TMDBSql.SelectTB_HOLIDAYFromMonth(aMonth: string): string;
var
  stSql : string;
begin
  stSql := 'select * from TB_Holiday ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND mid(HO_DAY,1,6) = ''' + aMonth + ''' ';
  result := stSql;

end;

function TMDBSql.UpdateTB_DEVICECARDNOFromPromise(aPromiseGrade,
  aCardNO: string): string;
var
  stSql : string;
begin
  stSql := 'UPDATE TB_DEVICECARDNO a ';
  stSql := stSql + ' INNER JOIN ( select * from TB_DEVICECARDNO_PROMISE ';
  stSql := stSql + ' Where PR_NAME = ''' + aPromiseGrade + ''' ) b ';
  stSql := stSql + ' ON( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Set a.DE_DOOR1 = b.DE_DOOR1, ';
  stSql := stSql + '     a.DE_DOOR2 = b.DE_DOOR2, ';
  stSql := stSql + '     a.DE_USEACCESS = b.DE_USEACCESS, ';
  stSql := stSql + '     a.DE_USEALARM = b.DE_USEALARM, ';
  stSql := stSql + '     a.DE_TIMECODE = b.DE_TIMECODE, ';
  stSql := stSql + '     a.DE_PERMIT = b.DE_PERMIT, ';
  stSql := stSql + '     a.DE_RCVACK = ''N'', ';
  stSql := stSql + '     a.DE_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + '     a.DE_UPDATEOPERATOR = ''' + Master_ID + ''' ';
  stSql := stSql + ' WHERE A.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND A.CA_CARDNO = ''' + aCardNO + ''' ';

  result := stSql;
end;

function TMDBSql.UpdateTB_PROGRAMIDSetVisible: string;
var
  stSql : string;
begin
  stSql := 'UPDATE TB_PROGRAMID ';
  stSql := stSql + ' INNER JOIN TB_CONFIG ';
  stSql := stSql + ' ON (TB_PROGRAMID.CO_CONFIGCODE = TB_CONFIG.CO_CONFIGCODE';
  stSql := stSql + ' AND TB_CONFIG.CO_CONFIGGROUP = ''MOSTYPE'' ) ';
  stSql := stSql + ' SET TB_PROGRAMID.PR_VISIBLE = TB_CONFIG.CO_CONFIGVALUE ';
  stSql := stSql + ' where TB_PROGRAMID.PR_VISIBLE <> ''D'' ';

  result := stSql;
end;

end.
