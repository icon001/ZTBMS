unit uDBFunction;

interface

uses
  SysUtils, Classes,ActiveX,ADODB,DB;

type
  TdmDBFunction = class(TDataModule)
    { Private declarations }
  public
    function ChangeEmCode(aOldCompanyCode,aOldEmCode,aNewCompanyCode,aNewEmCode:string):Boolean;
    function ChangeTB_ATDAYSUMMARY_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_ATEMPEXTRA_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_ATEVENT_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_ATLISTEVENT_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_ATMONTHEXTRA_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_ATMONTHSUMMARY_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_ATVACATION_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_BASEPAY_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_CARD_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_EMPLOYEE_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_FOODCODECount_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_FOODDayCount_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_FOODEVENT_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_FOODGRADE_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_FOODSemesterCount_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function ChangeTB_FOODWeekCount_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode:string):Boolean;
    function DeleteTB_FIREGROUP_NodeNo(aNodeNo:string):Boolean;
    function DeleteTB_RELAYCONTROLDOOR_Key(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    Function DupCheckCardNo(aCardNo:string):Boolean;
    Function DupCheckTB_ACCESSDEVICE_MCUID(aMcuID:string):Boolean;
    Function DupCheckTB_ACCESSDEVICE_MCUIP(aMcuIp,aMcuPort:string):Boolean;
    Function DupCheckTB_EMPLOYEE_EMCODE(aCompanyCode,aEmCode:string):integer;
    Function InsertTB_ACCESSDEVICE(aNodeNo,aMcuID,aEcuID,aMcuIp,aMcuPort,aName,aBuildingCode,
                                   aFloorCode,aAreaCode,aRegState,aTotWidth,aTotHeight,
                                   aCurX,aCurY,aMcuAC,aMcuFd,aMcuPt,aMcuAt,aJavara,aSendAck,
                                   aCardReaderType,aGubun,aUpdate,aViewSeq,aCardType,aArmAreaUse,aTimeCodeType: string;
                                   aSystemId:string='';aMuxID:string='';aDecoderID:string='';aSockType:string='1'):Boolean;
    function InsertIntoTB_ATEVENT_Intime(aDate,aCompanyCode,aEMCode,aAttendCode,aWeekCode,aTime,aAtInCode,aJijumCode,aDepartCode,aEmName,aWorkStartTime:string):Boolean;
    function InsertIntoTB_COMPANY_CompanyName(aCompanyCode,aName:string):Boolean;
    function InsertIntoTB_RELAYCONTROLDOOR_Value(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    Function UpdateTB_ACCESSDEVICE(aNodeNo,aMcuID,aEcuID,aMcuIp,aMcuPort,aName,aBuildingCode,
                                   aFloorCode,aAreaCode,aRegState,aTotWidth,aTotHeight,
                                   aCurX,aCurY,aMcuAC,aMcuFd,aMcuPt,aMcuAt,aJavara,aSendAck,
                                   aCardReaderType,aUpdate,aViewSeq,aCardType,aArmAreaUse,aTimeCodeType:string):Boolean;
    Function UpdateTB_ACCESSDEVICE_Info(aNodeNo,aMcuID,aEcuID,aMcuIp,aMcuPort,aName,aBuildingCode,
                                   aFloorCode,aAreaCode,aRegState,aTotWidth,aTotHeight,
                                   aCurX,aCurY,aViewSeq,aCardType,aArmAreaUse,aTimeCodeType:string):Boolean;
    function UpdateTB_ACCESSDEVICE_Ack(aNodeNo,aEcuID,aAck:string):Boolean;
    function UpdateTB_ACCESSDEVICE_CardReaderType(aNodeNo,aEcuID,aCardReaderType:string):Boolean;
    Function UpdateTB_ACCESSDEVICE_Connect(aNodeNo,aECUID,aConnected:string):Boolean;
    function UpdateTB_ACCESSDEVICE_Field_IntValue(aNodeNo,aEcuID,aFieldName,aValue:string):Boolean;
    function UpdateTB_ACCESSDEVICE_Field_StringValue(aNodeNo,aEcuID,aFieldName,aValue:string):Boolean;
    function UpdateTB_ACCESSDEVICE_HOSEND(aNodeNo,aEcuID,OrgState,NewState:String):Boolean;
    function UpdateTB_ACCESSDEVICE_SystemInfo(aNodeNO,aECUID,aPowerType,aOutDelay,aInDelay,aDoor1Type,aDoor2Type:string):Boolean;
    function UpdateTB_ACCESSDEVICE_TimeAsync(aNodeNo,aEcuID,aOldAck,aNewAck:string):Boolean;
    function UpdateTB_ALARMDEVICE_Field_StringValue(aNodeNo,aEcuID,aFieldName,aValue:string):Boolean;
    function UpdateTB_ARMAREA_Field_StringValue(aNodeNo,aEcuID,aArmAreaNo,aFieldName,aValue:string):Boolean;
    function UpdateTB_ATEVENT_Field_StringValue(aDate,aCompanyCode,aEMCode,aFieldName,aValue:string):Boolean;
    function UpdateTB_ATEVENT_Intime(aDate,aCompanyCode,aEMCode,aAttendCode,aWeekCode,aTime,aAtInCode,aJijumCode,aDepartCode,aEmName,aWorkStartTime:string):Boolean;
    function UpdateTB_ATEVENT_NIGHTWORKTIME_Add(aDate,aCompanyCode,aEMCode,aTimeMM:string):Boolean;
    function UpdateTB_ATEVENT_OutTime(aDate,aCompanyCode,aEMCode,aNowTime,aAtOutCode,aJijumCode,aDepartCode,aEmName,aWorkEndTime:string):Boolean;
    function UpdateTB_ATEVENT_WORKTIME_Add(aDate,aCompanyCode,aEMCode,aTimeMM:string):Boolean;
    function UpdateTB_CARD_Field_StringValue(aCardNo,aFieldName,aValue:string):Boolean;
    function UpdateTB_CURRENTDAEMON_Field_StringValue(aCode,aFieldName,aValue:string):Boolean;
    Function UpdateTB_DEVICECARDNO_AllState(OrgState,NewState:String):Boolean;   //권한전송 상태 변경
    Function UpdateTB_DEVICECARDNO_CardNoState(aNodeNo,aEcuID,aCardNo,aOldState,aNewState:String):Boolean;
    Function UpdateTB_DEVICECARDNO_Field_StringValue(aNodeNo,aEcuID,aCardNo,aFieldName,aValue:string):Boolean;
    Function UpdateTB_DEVICESCHEDULE_Field_StringValue(aNodeNo,aEcuID,aDoorNo,aDayCode,aFieldName,aValue:string):Boolean;
    function UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,aCommand,aRcvAck:string):Boolean; //STR 수신시 다시 전송하지 않도록 처리
    function UpdateTB_DOOR_Field_StringValue(aNodeNo,aEcuID,aDoorNo,aFieldName,aValue:string):Boolean;
    function UpdateTB_DOOR_RcvSetting(aNodeNo,aEcuID,aDoorNo,aDoorType,aControlTime,aFire,aOpenMoni,aSendDoor,
                               aAlarmLong,aDsOpen,aRemoteDoor,aRcvAck:string):Boolean;
    function UpdateTB_DOOR_SCHUSE_Ack(aNodeNo,aEcuID,aDoorNo,aRcvAck:string):Boolean;
  public
    { Public declarations }
    function GetArmAreaName(aNodeNo,aEcuID,aArmAreaNo:string):string;
    function GetDeviceName(aNodeNo,aEcuID:string):string;
    function GetDeviceType(aType:string):string;
    function GetFdmsCardNo : string;
    function GetLastFdmsCardNo : int64;
    function GetNextCompanyCode : string;
    function GetPortName(aNodeNo,aECUID,aPortNo:string):String;
    function GetTB_ATEVENT_LastInTime(aDate,aCompanyCode,aEMCode:string;var aATCode,aWorkStartTime,aWorkEndTime : string):string;
    function GetTB_ATEVENT_LastOutTime(aDate,aCompanyCode,aEMCode:string;var aATCode,aWorkStartTime,aWorkEndTime : string):string;
    function GetTB_ZONEDEVICE_BuildingCode(aNodeNo,aECUID,aPortNo:string):string;
  public
    function UseDeviceTimeCode(aNodeNo,aEcuID:string) : Boolean;
  end;

var
  dmDBFunction: TdmDBFunction;

implementation
uses
  uDataModule1,
  uCommonSql,
  uLomosUtil;

{$R *.dfm}

{ TdmDBFunction }

function TdmDBFunction.ChangeEmCode(aOldCompanyCode, aOldEmCode,
  aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  ChangeTB_ATDAYSUMMARY_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_ATEMPEXTRA_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_ATEVENT_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_ATLISTEVENT_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_ATMONTHEXTRA_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_ATMONTHSUMMARY_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_ATVACATION_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_BASEPAY_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_CARD_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_EMPLOYEE_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_FOODCODECount_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_FOODDayCount_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_FOODEVENT_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_FOODGRADE_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_FOODSemesterCount_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  ChangeTB_FOODWeekCount_EmCode(aOldCompanyCode, aOldEmCode,aNewCompanyCode, aNewEmCode);
  stSql := CommonSql.InsertIntoTB_EMPHIS(aNewCompanyCode,aNewEmCode,'0','2','','1',
           aOldEmCode,'',aOldCompanyCode,'','','사번변경');//수정
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_ATDAYSUMMARY_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATDAYSUMMARY set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_ATEMPEXTRA_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATEMPEXTRA set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_ATEVENT_EmCode(aOldCompanyCode, aOldEmCode,
  aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATEVENT set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_ATLISTEVENT_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATLISTEVENT set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_ATMONTHEXTRA_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATMONTHEXTRA set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_ATMONTHSUMMARY_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATMONTHSUMMARY set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_ATVACATION_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATVACATION set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_BASEPAY_EmCode(aOldCompanyCode, aOldEmCode,
  aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_BASEPAY set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_CARD_EmCode(aOldCompanyCode, aOldEmCode,
  aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_EMPLOYEE_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_FOODCODECount_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODCODECount set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_FOODDayCount_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODDayCount set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_FOODEVENT_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODEVENT set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_FOODGRADE_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODGRADE set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_FOODSemesterCount_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODSemesterCount set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.ChangeTB_FOODWeekCount_EmCode(aOldCompanyCode,
  aOldEmCode, aNewCompanyCode, aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODWeekCount set ';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aNewCompanyCode + ''', ';
  stSql := stSql + 'EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aOldCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.DeleteTB_FIREGROUP_NodeNo(aNodeNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete from TB_FIREGROUP ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.DeleteTB_RELAYCONTROLDOOR_Key(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete from TB_RELAYCONTROLDOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GroupCode + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.DupCheckCardNo(aCardNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  //지문 카드 중복유무
  stSql := ' Select * from TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.DupCheckTB_ACCESSDEVICE_MCUID(
  aMcuID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Result := False;
  stSql := ' Select * from  TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_MCUID = ''' + Trim(aMcuID) + ''' ';

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

      if RecordCount > 0 then Result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.DupCheckTB_ACCESSDEVICE_MCUIP(aMcuIp,
  aMcuPort: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Result := False;
  stSql := ' Select * from  TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  stSql := stSql + ' AND AC_MCUIP = ''' + Trim(aMcuIp) + ''' ';
  stSql := stSql + ' AND AC_MCUPORT = ''' + Trim(aMcuPort) + ''' ';

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

      if RecordCount > 0 then Result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.DupCheckTB_EMPLOYEE_EMCODE(aCompanyCode,
  aEmCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEE   ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmDBFunction.GetArmAreaName(aNodeNo, aEcuID,
  aArmAreaNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_ARMAREA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AR_AREANO = ''' + FillZeroStrNum(aArmAreaNo,2) + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount < 1 then Exit;
      result := FindField('AR_NAME').AsString ;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetDeviceName(aNodeNo, aEcuID: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount < 1 then Exit;
      result := FindField('AC_DEVICENAME').AsString ;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetDeviceType(aType: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := aType;
  stSql := 'select * from TB_ALARMDEVICETYPECODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_ALARMDEVICETYPECODE = ''' + aType + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount < 1 then Exit;
      result := FindField('AL_ALARMDEVICETYPENAME').AsString ;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetFdmsCardNo: string;
var
  stSql : string;
  nFdms_CardNo : int64;
  nLastCardNo : int64;
  stCardNo : string;
  i : integer;
  bResult : Boolean;
begin
  //result := FillZeroNumber2(31,10);
  result := '';

  for i := 0 to 100000 do
  begin
    nLastCardNo := GetLastFdmsCardNo;
    stCardNo := FillCharString(inttostr(nLastCardNo),'2',10,True);
    if CARDLENGTHTYPE = 0 then  //고정길이 타입이면
    begin
      if Not IsNumericCardNo then  //숫자변환이 아니면 숫자 타입을 HEX타입으로 변환하자.
      begin
        stCardNo := Dec2Hex64(StrtoInt64(stCardNo),8);
      end
    end else if CARDLENGTHTYPE = 1 then
    begin
      if Not IsNumericCardNo then  //숫자변환이면
      begin
        stCardNo := Dec2Hex64(StrtoInt64(stCardNo),8);
      end
    end else Exit; //KT사옥용이면 그냥 빠져 나가자.
    stCardNo := GetFixedCardNoCheck(stCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);

    bResult := DupCheckCardNo(stCardNo);
    if Not bResult  then break;
  end;
  if bResult then Exit; //카드번호를 찾지 못한 경우
  result := stCardNo;
   {
  stSql := 'select Max(CA_CARDNO) as CA_CARDNO from TB_CARD ';
  if DBTYPE = 'MSSQL' then
    stSql := stSql + ' Where substring(CA_CARDNO,1,3) = ''000'' '
  else if DBTYPE = 'PG' then
    stSql := stSql + ' Where substring(CA_CARDNO,1,3) = ''000'' '
  else if DBTYPE = 'FB' then
    stSql := stSql + ' Where substring(CA_CARDNO From 1 for 3) = ''000'' '
  else if DBTYPE = 'MDB' then
    stSql := stSql + ' Where Mid(CA_CARDNO ,1, 3) = ''000'' '
  else Exit;

  with fdmsADOQuery do
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
    Try
      if isDigit(FindField('CA_CARDNO').AsString) then
        nFdms_CardNo := strtoint(FindField('CA_CARDNO').AsString)
      else Exit;
      result := FillZeroNumber2(nFdms_CardNo + 1,10);
    Except
      Exit;
    End;

  end;  }
end;

function TdmDBFunction.GetLastFdmsCardNo: int64;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := 31;
  stSql := 'select * from TB_CURRENTDAEMON ';
  stSql := stSql + ' Where CU_STATECODE = ''FDMSCARD'' ';

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
      if recordcount < 1 then Exit;
      if Not isDigit(FindField('CU_STATEVALUE').AsString) then Exit;
      result := strtoint(FindField('CU_STATEVALUE').AsString) + 1;
      stSql := ' Update TB_CURRENTDAEMON set CU_STATEVALUE = ''' + inttostr(result) + ''' ';
      stSql := stSql + ' Where CU_STATECODE = ''FDMSCARD'' ';
      DataModule1.ProcessExecSQL(stSql);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetNextCompanyCode: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := FillZeroNumber(1,G_nCompanyCodeLength);
  stSql := 'select MAX(CO_COMPANYCODE) as CO_COMPANYCODE from TB_COMPANY ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount < 1 then Exit;
      if isDigit(FindField('CO_COMPANYCODE').AsString) then
      begin
        result := FillZeroNumber(strtoint(FindField('CO_COMPANYCODE').AsString) + 1,G_nCompanyCodeLength);
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetPortName(aNodeNo, aECUID,
  aPortNo: string): String;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '' ;

  stSql := 'select a.AL_ZONENAME from TB_ZONEDEVICE a ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND a.AC_ECUID = ''' + aECUID + '''  ';
  stSql := stSql + ' AND a.AL_ZONENUM = ''' + inttostr(strtoint(aPortNo)) + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      End;
      if recordCount > 0  then result := FindField('AL_ZONENAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ATEVENT_LastInTime(aDate, aCompanyCode,
  aEMCode: string;var aATCode,aWorkStartTime,aWorkEndTime : string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_ATEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount < 1 then Exit;
      result := FindField('AT_LASTINTIME').AsString;
      aATCode := FindField('AT_ATCODE').AsString;
      aWorkStartTime := FindField('AT_WORKSTARTTIME').AsString;
      aWorkEndTime := FindField('AT_WORKENDTIME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ATEVENT_LastOutTime(aDate, aCompanyCode,
  aEMCode: string;var aATCode,aWorkStartTime,aWorkEndTime : string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_ATEVENT ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount < 1 then Exit;
      result := FindField('AT_LASTOUTTIME').AsString;
      aATCode := FindField('AT_ATCODE').AsString;
      aWorkStartTime := FindField('AT_WORKSTARTTIME').AsString;
      aWorkEndTime := FindField('AT_WORKENDTIME').AsString;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.GetTB_ZONEDEVICE_BuildingCode(aNodeNo, aECUID,
  aPortNo: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '000000000';
  if Not isDigit(aPortNo) then Exit;
  
  stSql := 'select * from TB_ZONEDEVICE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + inttostr(strtoint(aPortNo)) + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount < 1 then Exit;
      result := FillZeroStrNum(FindField('LO_DONGCODE').AsString,3) + FillZeroStrNum(FindField('LO_FLOORCODE').AsString,3) + FillZeroStrNum(FindField('LO_AREACODE').AsString,3);

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.InsertIntoTB_ATEVENT_Intime(aDate, aCompanyCode,
  aEMCode, aAttendCode, aWeekCode, aTime, aAtInCode, aJijumCode,
  aDepartCode, aEmName, aWorkStartTime: string): Boolean;
var
  stSql : string;

begin

  Result := False;

  stSql := 'Insert into TB_ATEVENT';
  stSql := stSql + '(GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_WEEKCODE,';
  stSql := stSql + 'AT_INTIME,AT_INSERTTIME,AT_INCODE,AT_SUMMARY,CO_JIJUMCODE,CO_DEPARTCODE,EM_NAME,AT_WORKSTARTTIME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',' ;
  stSql := stSql + '''' + aDate + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + aEMCode + ''',' ;
  stSql := stSql + '''' + aAttendCode + ''',' ;
  stSql := stSql + '''' + aWeekCode + ''',' ;
  stSql := stSql + '''' + aTime + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + aAtInCode + ''',' ;
  stSql := stSql + '''N'', ' ;
  stSql := stSql + '''' + aJijumCode + ''',' ;
  stSql := stSql + '''' + aDepartCode + ''',' ;
  stSql := stSql + '''' + aEmName + ''',' ;
  stSql := stSql + '''' + aWorkStartTime + ''')' ;

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_COMPANY_CompanyName(aCompanyCode,
  aName: string): Boolean;
var
  stSql : string;
  stJijumCode : string;
  stDepartCode : string;
begin
  stJijumCode := FillZeroNumber(0,G_nCompanyCodeLength);
  stDepartCode := FillZeroNumber(0,G_nCompanyCodeLength);
  stSql := ' Insert Into TB_COMPANY( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' CO_NAME,';
  stSql := stSql + ' CO_GUBUN,';
  stSql := stSql + ' CO_UPDATECHECK )';
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GroupCode + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + stJijumCode + ''',';
  stSql := stSql + '''' + stDepartCode + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''1'',';
  stSql := stSql + '''N'' ';
  stSql := stSql + ')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_RELAYCONTROLDOOR_Value(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_RELAYCONTROLDOOR( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' DO_DOORNO )';
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GroupCode + ''',';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + '''';
  stSql := stSql + ')';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertTB_ACCESSDEVICE(aNodeNo, aMcuID, aEcuID,
  aMcuIp, aMcuPort, aName, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY, aMcuAC, aMcuFd, aMcuPt, aMcuAt,
  aJavara, aSendAck, aCardReaderType, aGubun, aUpdate, aViewSeq, aCardType,
  aArmAreaUse,aTimeCodeType: string;aSystemId:string='';aMuxID:string='';aDecoderID:string='';aSockType:string='1'): Boolean;
var
  stSql :string;
begin
  if Not isDigit(aSockType) then aSockType := '1';
  
  result := False;
  stSql := ' Insert Into TB_ACCESSDEVICE (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stsql + 'AC_MCUID,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AC_MCUIP,';
  stSql := stSql + 'AC_MCUPORT,';
  stSql := stSql + 'AC_DEVICENAME,';
  stSql := stSql + 'AC_VIEWSEQ ,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'AC_LOCATEUSE,';
  stSql := stSql + 'AC_TOTWIDTH,';
  stSql := stSql + 'AC_TOTHEIGHT,';
  stSql := stSql + 'AC_CURX,';
  stSql := stSql + 'AC_CURY,';
  stSql := stSql + 'AC_ACTYPE,';
  stSql := stSql + 'AC_ATTYPE,';
  stSql := stSql + 'AC_FDTYPE,';
  stSql := stSql + 'AC_PTTYPE,';
  stSql := stSql + 'AC_JAVARATYPE,';
  stSql := stSql + 'AC_NETTYPE,';
  stSql := stSql + 'AC_GUBUN,';
  stSql := stSql + 'AC_DEVICETYPE,';
  stSql := stSql + 'SEND_ACK,';
  stSql := stSql + 'AC_CARDREADERTYPE,';
  stSql := stSql + 'AC_UPDATE ,';
  stSql := stSql + 'AC_CARDBYTE,';
  stSql := stSql + 'AC_ARMAREAUSE,';
  stSql := stSql + 'AC_TIMETYPE,';
  stSql := stSql + 'AC_LINKUSID,';
  stSql := stSql + 'AC_MUXID,';
  stSql := stSql + 'AC_DECODERID,';
  stSql := stSql + 'AC_SOCKTYPE)';
  stSql := stSql + ' values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aMcuID + ''',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aMcuIp + ''',';
  stSql := stSql + '''' + aMcuPort + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '' + aViewSeq + ',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aRegState + ''',';
  stSql := stSql + aTotWidth + ',';
  stSql := stSql + aTotHeight + ',';
  stSql := stSql + aCurX + ',';
  stSql := stSql + aCurY + ',';
  stSql := stSql + '''' + aMcuAC + ''',';
  stSql := stSql + '''' + aMcuAt + ''',';
  stSql := stSql + '''' + aMcuFd + ''',';
  stSql := stSql + '''' + aMcuPt + ''',';
  stSql := stSql + '''' + aJavara + ''',';
  stSql := stSql + '''' + NETTYPE + ''',';
  stSql := stSql + '''' + aGubun + ''',';
  stSql := stSql + '''1'',';  //KTT811
  stSql := stSql + '''' + aSendAck + ''',';
  stSql := stSql + '''' + aCardReaderType + ''', ';
  stSql := stSql + '''' + aUpdate + ''' , ';
  stSql := stSql + '''' + aCardType + ''', ';
  stSql := stSql + '''' + aArmAreaUse + ''', ';
  stSql := stSql + '''' + aTimeCodeType + ''', ';
  stSql := stSql + '''' + aSystemId + ''',';
  stSql := stSql + '''' + aMuxId + ''',';
  stSql := stSql + '''' + aDecoderID + ''', ';
  stSql := stSql + '' + aSockType + ') ';

  result :=  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Delete From TB_TIMECODEDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_TIMECODEDEVICE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_SEND)';
  stSql := stSql + ' Select a.GROUP_CODE,a.AC_NODENO,a.AC_ECUID,b.TC_GROUP,';
  stSql := stSql + ' b.TC_TIME1,b.TC_TIME2,b.TC_TIME3,b.TC_TIME4,''N'' ';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  stSql := stSql + ' Left Join TB_TIMECODE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' Where a.AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_ACCESSDEVICE(aNodeNo, aMcuID, aEcuID,
  aMcuIp, aMcuPort, aName, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY, aMcuAC, aMcuFd, aMcuPt, aMcuAt,
  aJavara, aSendAck, aCardReaderType, aUpdate, aViewSeq, aCardType,
  aArmAreaUse, aTimeCodeType: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Update TB_ACCESSDEVICE  Set ';
  stSql := stSql + 'AC_MCUIP = ''' + aMcuIp + ''',';
  stSql := stSql + 'AC_MCUID = ''' + aMcuID + ''', ';
  stSql := stSql + 'AC_MCUPORT = ''' + aMcuPort + ''',';
  stSql := stSql + 'AC_DEVICENAME = ''' + aName + ''',';
  stSql := stSql + 'AC_VIEWSEQ = ' + aViewSeq + ',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AC_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'AC_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'AC_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'AC_CURX = ' + aCurX + ',';
  stSql := stSql + 'AC_CURY = ' + aCurY + ',';
  stSql := stSql + 'AC_ACTYPE = ''' + aMcuAC + ''',';
  stSql := stSql + 'AC_ATTYPE = ''' + aMcuAt + ''',';
  stSql := stSql + 'AC_FDTYPE = ''' + aMcuFd + ''',';
  stSql := stSql + 'AC_PTTYPE = ''' + aMcuPt + ''', ';
  stSql := stSql + 'AC_JAVARATYPE = ''' + aJavara + ''', ';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''', ';
  stSql := stSql + 'AC_CARDREADERTYPE = ''' + aCardReaderType + ''', ';
  stSql := stSql + 'AC_UPDATE = ''' + aUpdate + ''', ';
  stSql := stSql + 'AC_CARDBYTE = ''' + aCardType + ''', ';
  stSql := stSql + 'AC_TIMETYPE = ''' + aTimeCodeType + ''' ';
  if aArmAreaUse <> '' then stSql := stSql + ',AC_ARMAREAUSE = ''' + aArmAreaUse + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  result :=  DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ACCESSDEVICE_Ack(aNodeNo, aEcuID,
  aAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ACCESSDEVICE set ';
  stSql := stSql + 'SEND_ACK = ''' + aAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;


function TdmDBFunction.UpdateTB_ACCESSDEVICE_CardReaderType(aNodeNo,
  aEcuID, aCardReaderType: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE set AC_CARDREADERTYPE = ''' + aCardReaderType + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNO + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ACCESSDEVICE_Connect(aNodeNo, aECUID,
  aConnected: string): Boolean;
var
  stSql :string;
begin
  stSql := ' Update TB_ACCESSDEVICE set ';
  stSql := stSql + ' AC_CONNECTED = ''' + aConnected + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ACCESSDEVICE_Field_IntValue(aNodeNo,
  aEcuID, aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ACCESSDEVICE set ' + aFieldName + ' = ' + aValue + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GroupCode + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(aNodeNo,
  aEcuID, aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ACCESSDEVICE set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GroupCode + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_ACCESSDEVICE_HOSEND(aNodeNo, aEcuID,
  OrgState, NewState: String): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ACCESSDEVICE set HO_SEND = ''' + NewState + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GroupCode + ''' ';
  if aNodeNO <> '' then  stSql := stSql + ' AND AC_NODENO = ' + aNodeNO + ' ';
  if aEcuID <> '' then  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  if OrgState <> '' then stSql := stSql + ' AND HO_SEND = ''' + OrgState + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_ACCESSDEVICE_Info(aNodeNo, aMcuID, aEcuID,
  aMcuIp, aMcuPort, aName, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY, aViewSeq, aCardType, aArmAreaUse,
  aTimeCodeType: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Update TB_ACCESSDEVICE  Set ';
  stSql := stSql + 'AC_MCUIP = ''' + aMcuIp + ''',';
  stSql := stSql + 'AC_MCUPORT = ''' + aMcuPort + ''',';
  stSql := stSql + 'AC_MCUID = ''' + aMcuID + ''',';
  stSql := stSql + 'AC_DEVICENAME = ''' + aName + ''',';
  stSql := stSql + 'AC_VIEWSEQ = ' + aViewSeq + ',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AC_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'AC_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'AC_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'AC_CURX = ' + aCurX + ',';
  stSql := stSql + 'AC_CURY = ' + aCurY + ', ';
  stSql := stSql + 'AC_UPDATE = ''Y'', ';
  stSql := stSql + 'AC_CARDBYTE = ''' + aCardType + ''', ';
  stSql := stSql + 'AC_TIMETYPE = ''' + aTimeCodeType + ''' ';
  if aArmAreaUse <> '' then stSql := stSql + ',AC_ARMAREAUSE = ''' + aArmAreaUse + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_ACCESSDEVICE_SystemInfo(aNodeNO, aECUID,
  aPowerType, aOutDelay, aInDelay, aDoor1Type,
  aDoor2Type: string): Boolean;
var
  stSql : string;
  nOutDelay : integer;
  nInDelay : integer;
begin
  if isDigit(aOutDelay) then nOutDelay := strtoint(aOutDelay)
  else nOutDelay := 0;
  if isDigit(aInDelay) then nInDelay := strtoint(aInDelay)
  else nInDelay := 0;

  stSql := ' Update TB_ACCESSDEVICE Set ';
  stSql := stSql + ' AC_POWERTYPE = ''' + aPowerType + ''',';
  stSql := stSql + ' AC_OUTDELAY = ' + inttostr(nOutDelay) + ',';
  stSql := stSql + ' AC_INDELAY = ' + inttostr(nInDelay) + ',';
  stSql := stSql + ' AC_DOOR1TYPE = ''' + aDoor1Type[1] + ''',';
  stSql := stSql + ' AC_DOOR2TYPE = ''' + aDoor2Type[1] + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ACCESSDEVICE_TimeAsync(aNodeNo, aEcuID,
  aOldAck, aNewAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE Set TC_TIMECODEASYNC = ''' + aNewAck + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND TC_TIMECODEASYNC = ''' + aOldAck + ''' ';

  DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ALARMDEVICE_Field_StringValue(aNodeNo,
  aEcuID, aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ALARMDEVICE set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ARMAREA_Field_StringValue(aNodeNo, aEcuID,aArmAreaNo,
  aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  aArmAreaNo := FillZeroStrNum(aArmAreaNo,2);
  stSql := 'update TB_ARMAREA set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AR_AREANO = ''' + aArmAreaNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ATEVENT_Field_StringValue(aDate,
  aCompanyCode, aEMCode, aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_ATEVENT set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stsql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ATEVENT_Intime(aDate, aCompanyCode,
  aEMCode, aAttendCode, aWeekCode, aTime, aAtInCode, aJijumCode,
  aDepartCode, aEmName, aWorkStartTime: string): Boolean;
var
  stSql : string;

begin

  stSql := 'Update TB_ATEVENT set ';
  stSql := stSql + 'AT_ATCODE = ''' + aAttendCode + ''',';
  stSql := stSql + 'AT_WEEKCODE = ''' + aWeekCode + ''',';
  stSql := stSql + 'AT_INTIME = ''' + aTime + ''',';
  stSql := stSql + 'AT_INCODE = ''' + aAtInCode + ''',';
  if aJijumCode <> '' then stSql := stSql + 'CO_JIJUMCODE = ''' + aJijumCode + ''',';
  if aDepartCode <> '' then stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  if aEmName <> '' then stSql := stSql + 'EM_NAME = ''' + aEmName + ''',';
  if aWorkStartTime <> '' then stSql := stSql + 'AT_WORKSTARTTIME = ''' + aWorkStartTime + ''',';
  stSql := stSql + 'AT_SUMMARY = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stsql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_ATEVENT_NIGHTWORKTIME_Add(aDate,
  aCompanyCode, aEMCode, aTimeMM: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_ATEVENT ';
  stSql := stSql + 'set NIGHTWORKTIME = NIGHTWORKTIME + ' + aTimeMM + ' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ATEVENT_OutTime(aDate, aCompanyCode,
  aEMCode, aNowTime, aAtOutCode, aJijumCode, aDepartCode, aEmName,
  aWorkEndTime: string): Boolean;
var
  stSql : string;
begin

  stSql := 'update TB_ATEVENT ';
  stSql := stSql + 'set AT_OUTTIME = ''' + aNowTime + ''', ';
  stSql := stSql + ' AT_OUTCODE = ''' + aAtOutCode + ''', ';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  if aJijumCode <> '' then stSql := stSql + ' CO_JIJUMCODE = ''' + aJijumCode + ''', ';
  if aDepartCode <> '' then stSql := stSql + ' CO_DEPARTCODE = ''' + aDepartCode + ''', ';
  if aEmName <> '' then stSql := stSql + ' EM_NAME = ''' + aEmName + ''', ';
  if aWorkEndTime <> '' then stSql := stSql + 'AT_WORKENDTIME = ''' + aWorkEndTime + ''',';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_ATEVENT_WORKTIME_Add(aDate, aCompanyCode,
  aEMCode, aTimeMM: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_ATEVENT ';
  stSql := stSql + 'set WORKTIME = WORKTIME + ' + aTimeMM + ' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_CARD_Field_StringValue(aCardNo, aFieldName,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ' + aFieldName + ' = ''' + aValue + ''' ';
  if aCardNo <> '' then stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
  Result := DataModule1.ProcessExecSQL(stSql);    
end;

function TdmDBFunction.UpdateTB_CURRENTDAEMON_Field_StringValue(aCode,
  aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := 'Update TB_CURRENTDAEMON set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CU_STATECODE = ''' + aCode + ''' ';
  Result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_DEVICECARDNO_AllState(OrgState,
  NewState: String): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := 'Update TB_DEVICECARDNO Set DE_RCVACK = ''' + NewState + ''' ';     //송신중으로 변경
  stSql := stSql + ' Where DE_RCVACK = ''' + OrgState + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ' ;

  Result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_DEVICECARDNO_CardNoState(aNodeNo, aEcuID,
  aCardNo, aOldState,aNewState: String): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_DEVICECARDNO set DE_RCVACK = ''' + aNewState + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  if aCardNo <> '' then stsql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  if aOldState <> '' then  stSql := stSql + ' AND DE_RCVACK = ''' + aOldState + ''' '; //전송준비중인 데이터만 송신하자.

  result := DataModule1.ProcessExecSQL(stSql);
end;


function TdmDBFunction.UpdateTB_DEVICECARDNO_Field_StringValue(aNodeNo,
  aEcuID,aCardNo, aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  if aCardNo <> '' then stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_DEVICESCHEDULE_Field_StringValue(aNodeNo,
  aEcuID, aDoorNo, aDayCode, aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICESCHEDULE set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  if aDoorNo <> '' then stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  if aDayCode <> '' then stSql := stSql + ' AND DE_DAYCODE = ''' + aDayCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo, aEcuID,
  aCommand, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICESETTINGINFO set DS_RCVACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DS_COMMAND = ''' + aCommand + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_DOOR_Field_StringValue(aNodeNo, aEcuID,
  aDoorNo, aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DOOR set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GroupCode + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ' + aDoorNo + ' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_DOOR_RcvSetting(aNodeNo, aEcuID, aDoorNo,
  aDoorType, aControlTime, aFire, aOpenMoni, aSendDoor, aAlarmLong,
  aDsOpen, aRemoteDoor, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  if Not IsDigit(aDoorNo) then Exit;

  stSql := ' Update TB_DOOR set ';
  stSql := stSql + ' DO_DOORTYPE = ''' + aDoorType + ''',';
  stSql := stSql + ' DO_CONTROLTIME = ''' + aControlTime + ''',';
  stSql := stSql + ' DO_FIRE = ''' + aFire + ''',';
  stSql := stSql + ' DO_OPENMONI = ''' + aOpenMoni + ''',';
  stSql := stSql + ' DO_SENDDOOR = ''' + aSendDoor + ''',';
  stSql := stSql + ' DO_ALARMLONG = ''' + aAlarmLong + ''',';
  stSql := stSql + ' DO_DSOPEN = ''' + aDsOpen + ''',';
  stSql := stSql + ' DO_REMOTEDOOR = ''' + aRemoteDoor + ''' ';
  if aRcvAck <> '' then stSql := stSql + ' ,SEND_ACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + inttostr(strtoint(aDoorNo)) + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_DOOR_SCHUSE_Ack(aNodeNo, aEcuID, aDoorNo,
  aRcvAck: string): Boolean;
var
  stSql : string;
begin
  if Not IsDigit(aDoorNo) then Exit;

  stSql := ' Update TB_DOOR set ';
  stSql := stSql + ' SEND_ACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + inttostr(strtoint(aDoorNo)) + ''' ';
  stSql := stSql + ' AND SEND_ACK = ''S'' ';   //스케줄 사용 유무 전송 중인 것만

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UseDeviceTimeCode(aNodeNo,aEcuID:string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND  AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND  AC_ECUID = ''' + aEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount < 1 then Exit;
      if FindField('AC_TIMETYPE').AsString = '1' then result := True;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

end.
