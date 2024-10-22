unit uDBCreate;

interface

uses
  SysUtils, Classes;

type
  TdmDBCreate = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    Function AlterTB_ACCESSDEVICE_HO1USE_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_HO2USE_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_HO3USE_Add : Boolean;
    Function AlterTB_ACCESSDEVICE_HOSENDYEAR_Add : Boolean;
    Function AlterTB_ArmArea_Change_Add : Boolean;
    Function AlterTB_ARMAREA_DISARMCHECKUSE_Add : Boolean;
    Function AlterTB_ARMAREA_DISARMCHECKTIME1FROM_Add : Boolean;
    Function AlterTB_ARMAREA_DISARMCHECKTIME1TO_Add : Boolean;
    Function AlterTB_ArmArea_RelayCode_Add : Boolean;
    Function AlterTB_ATEVENT_LASTINTIME_Add : Boolean;
    Function AlterTB_ATEVENT_LASTOUTTIME_Add : Boolean;
    Function AlterTB_ATEVENT_NIGHTWORKTIME_Add : Boolean;
    Function AlterTB_ATEVENT_WORKENDTIME_Add : Boolean;
    Function AlterTB_ATEVENT_WORKSTARTTIME_Add : Boolean;
    Function AlterTB_ATEVENT_WORKTIME_Add : Boolean;
    Function AlterTB_CARD_GUEST_Add : Boolean; //방문자 카드 유무 체크
    Function AlterTB_CARD_STICK_Add : Boolean; //수동 카드 등록 유무 체크
    Function AlterTB_DOOR_SchIgnore_Add : Boolean; //스케줄사용유무무시
    Function AlterTB_EMPLOYEE_GRADETYPE_Add : Boolean;
    Function AlterTB_GUEST_NOTAUTCONTENT_Add : Boolean;
    Function AlterTB_HOLIDAY_HOTYPE_Add : Boolean;
    Function AlterTB_LOCATION_Change_Add : Boolean;
    Function AlterTB_LOCATION_RelayCode_Add : Boolean;

    Function CreateTB_DEVICECARDNO_Idx01 : Boolean;
    Function CreateTB_EMMAPPING:Boolean;
    Function CreateTB_GUEST : Boolean;
    Function CreateTB_GUEST_Idx01 : Boolean;
    Function CreateTB_GUESTDEVICECARDNO : Boolean;
    Function CreateTB_GUESTEVENT : Boolean;
    Function CreateTB_HURELAY:Boolean;  //홍익 세종 연동 테이블
    Function CreateTB_LOGINCREATEHIS: Boolean;
    Function CreateTB_LOGINCOUNT : Boolean;
    Function CreateTB_RELAYCONTROLDOOR : Boolean;
    Function CreateTB_TIMECODEBUILDING:Boolean;


  end;

var
  dmDBCreate: TdmDBCreate;

implementation

uses
  uDataModule1;
  
{$R *.dfm}

{ TdmDBCreate }

function TdmDBCreate.AlterTB_ACCESSDEVICE_HO1USE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD HO_1USE integer DEFAULT 0   ';  //특정일1 사용유무
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ACCESSDEVICE_HO2USE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD HO_2USE integer DEFAULT 0   ';  //특정일2 사용유무
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ACCESSDEVICE_HO3USE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD HO_3USE integer DEFAULT 0   ';  //특정일3 사용유무
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ACCESSDEVICE_HOSENDYEAR_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD HO_SENDYEAR varchar(4)  ';  //미경계 체크 시작 시간
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ARMAREA_DISARMCHECKTIME1FROM_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ARMAREA ADD AR_DISARMCHECKTIME1FROM varchar(4)  ';  //미경계 체크 시작 시간
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ARMAREA_DISARMCHECKTIME1TO_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ARMAREA ADD AR_DISARMCHECKTIME1TO varchar(4)  ';  //미경계 체크 종료시간
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ARMAREA_DISARMCHECKUSE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ARMAREA ADD AR_DISARMCHECKUSE integer  ';  //미경계 체크 사용유무(0,1)
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_EMPLOYEE_GRADETYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_GRADETYPE integer  ';  //0.개인별카드권한,1.그룹별카드권한, 2.소속별카드권한
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_HOLIDAY_HOTYPE_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_HOLIDAY ADD HO_TYPE integer DEFAULT 3 ';  //3.특정일1,4.특정일2,5.특정일3
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_GUEST: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_GUEST  ( ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '   GE_SEQ integer   NOT NULL,';
  stSql := stSql + '   GE_NAME varchar(50)   NULL, ';
  stSql := stSql + '   GE_COMPANYNAME varchar(50)   NULL, ';
  stSql := stSql + '   GE_POSINAME varchar(50)   NULL, ';
  stSql := stSql + '   GE_PHONE varchar(50)   NULL, ';
  stSql := stSql + '   GE_MANAGER varchar(50)   NULL, ';
  stSql := stSql + '   GE_MANAGERPHONE varchar(50)   NULL, ';
  stSql := stSql + '   GE_CONTENT varchar(100)   NULL, ';
  stSql := stSql + '   GE_STATE integer   NULL, ';
  stSql := stSql + '   GE_CARDNO varchar(30)   NULL, ';
  stSql := stSql + '   GE_INTIME varchar(14)   NULL, ';
  stSql := stSql + '   GE_OUTTIME varchar(14)   NULL, ';
  stSql := stSql + '   GE_INSERTTIME varchar(14)   NULL, ';
  stSql := stSql + '   GE_UPDATETIME varchar(14)   NULL, ';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,  GE_SEQ ) ';
  stSql := stSql + ') ';

  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if DBTYPE = 'PG' then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if DBTYPE = 'FB' then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_GUEST_Idx01: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE INDEX TB_GUEST_Idx01 ON TB_GUEST (GE_STATE) ';

  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_GUESTDEVICECARDNO: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE  TB_GUESTDEVICECARDNO  (  ';
  stSql := stSql + '   GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + '   GE_SEQ integer   NOT NULL,';
  stSql := stSql + '   AC_NODENO int NOT NULL,';
  stSql := stSql + '   AC_ECUID varchar(2)   NOT NULL, ';
  stSql := stSql + '   CA_CARDNO varchar(20)   NOT NULL,';
  stSql := stSql + '   DE_DOOR1 char(1)   NULL,';
  stSql := stSql + '   DE_DOOR2 char(1)   NULL,';
  stSql := stSql + '   DE_DOOR3 char(1)   NULL,';
  stSql := stSql + '   DE_DOOR4 char(1)   NULL,';
  stSql := stSql + '   DE_DOOR5 char(1)   NULL,';
  stSql := stSql + '   DE_DOOR6 char(1)   NULL,';
  stSql := stSql + '   DE_DOOR7 char(1)   NULL,';
  stSql := stSql + '   DE_DOOR8 char(1)   NULL,';
  stSql := stSql + '   DE_USEACCESS char(1)   NULL, ';
  stSql := stSql + '   DE_USEALARM char(1)   NULL,';
  stSql := stSql + '   DE_ALARM0 char(1)   NULL,';
  stSql := stSql + '   DE_ALARM1 char(1)   NULL,';
  stSql := stSql + '   DE_ALARM2 char(1)   NULL,';
  stSql := stSql + '   DE_ALARM3 char(1)   NULL,';
  stSql := stSql + '   DE_ALARM4 char(1)   NULL,';
  stSql := stSql + '   DE_ALARM5 char(1)   NULL,';
  stSql := stSql + '   DE_ALARM6 char(1)   NULL,';
  stSql := stSql + '   DE_ALARM7 char(1)   NULL,';
  stSql := stSql + '   DE_ALARM8 char(1)   NULL,';
  stSql := stSql + '   DE_TIMECODE char(1)   NULL,';
  stSql := stSql + '   DE_PERMIT char(1)   NULL,';
  stSql := stSql + '   DE_RCVACK char(1)   NULL,';
  stSql := stSql + '   DE_UPDATETIME varchar(14)   NULL, ';
  stSql := stSql + '   DE_UPDATEOPERATOR varchar(10)   NULL,';
  stSql := stSql + '   AC_MCUID varchar(7)   NULL,';
  stSql := stSql + '  PRIMARY KEY   ( GROUP_CODE ,GE_SEQ,  AC_NODENO ,  AC_ECUID ,  CA_CARDNO )';
  stSql := stSql + ')';

  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if DBTYPE = 'PG' then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if DBTYPE = 'FB' then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_GUESTEVENT: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE TB_GUESTEVENT ( ';
  stSql := stSql + '  GROUP_CODE varchar(10)   DEFAULT ''1234567890'' NOT NULL,';
  stSql := stSql + '  AC_DATE varchar(8)   NOT NULL,';
  stSql := stSql + '  AC_TIME varchar(6)   NOT NULL,';
  stSql := stSql + '  AC_NODENO int DEFAULT 0 NOT NULL,';
  stSql := stSql + '  AC_ECUID varchar(2)   NOT NULL,';
  stSql := stSql + '  DO_DOORNO char(1)   NOT NULL,';
  stSql := stSql + '  CA_CARDNO varchar(20)   NOT NULL, ';
  stSql := stSql + '  AC_READERNO char(1)   NOT NULL,';
  stSql := stSql + '  AC_BUTTONNO char(1)   NOT NULL,';
  stSql := stSql + '  AC_DOORPOSI char(1)   NULL,';
  stSql := stSql + '  AC_INPUTTYPE char(1)   NULL, ';
  stSql := stSql + '  AC_DOORMODE char(1)   NULL, ';
  stSql := stSql + '  AC_PERMITMODE char(1)   NULL, ';
  stSql := stSql + '  PE_PERMITCODE char(1)   NULL,';
  stSql := stSql + '  AC_INSERTDATE varchar(14)   NULL,';
  stSql := stSql + '  AC_INSERTOPERATOR varchar(10)   NULL,';
  stSql := stSql + '  AC_MCUID varchar(7)   NULL,';
  stSql := stSql + '  GE_SEQ integer   NOT NULL,';

  stSql := stSql + '  PRIMARY KEY CLUSTERED ([GROUP_CODE], [AC_DATE], [AC_TIME], [AC_NODENO], [AC_ECUID], [DO_DOORNO], [CA_CARDNO]) ';
  stSql := stSql + ') ';

  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_TIMECODEBUILDING: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_TIMECODEBUILDING (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' LO_DONGCODE varchar(3) NOT NULL,';
  stSql := stSql + ' LO_FLOORCODE varchar(3) NOT NULL,';
  stSql := stSql + ' LO_AREACODE varchar(50) NOT NULL,';
  stSql := stSql + ' TC_GROUP varchar(1) NOT NULL,';
  stSql := stSql + ' TC_TIME1 varchar(8) ,';
  stSql := stSql + ' TC_TIME2 varchar(8) ,';
  stSql := stSql + ' TC_TIME3 varchar(8) ,';
  stSql := stSql + ' TC_TIME4 varchar(8) ,';
  stSql := stSql + ' TC_SEND varchar(1) ,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,LO_DONGCODE,LO_FLOORCODE,LO_AREACODE,TC_GROUP) ';
  stSql := stSql + ' ) ';

  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARD_GUEST_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARD ADD CA_GUEST char(1) DEFAULT ''N'' NULL ';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_GUEST_NOTAUTCONTENT_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_GUEST ADD GE_NOTAUTCONTENT varchar(100) NULL ';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_LOGINCOUNT: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_LOGINCOUNT (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' LC_USERID varchar(50) NOT NULL,';
  stSql := stSql + ' LC_PCIP varchar(30),';
  stSql := stSql + ' LC_FAILCOUNT integer,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,LC_USERID) ';
  stSql := stSql + ' ) ';

  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_DOOR_SchIgnore_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_DOOR ADD DO_SchIgnore char(1) DEFAULT ''N'' NULL ';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_RELAYCONTROLDOOR: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_RELAYCONTROLDOOR (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + '  AC_NODENO int DEFAULT 0 NOT NULL,';
  stSql := stSql + '  AC_ECUID varchar(2)   NOT NULL,';
  stSql := stSql + '  DO_DOORNO char(1)   NOT NULL,';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,DO_DOORNO) ';
  stSql := stSql + ' ) ';

  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_EMMAPPING: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_EMMAPPING (';
  stSql := stSql + ' MP_TYPE varchar(3) NOT NULL,'; //맵핑 타입(1.직위구분)
  stSql := stSql + ' MP_CODE varchar(50) NOT NULL,';//매핑코드
  stSql := stSql + ' DG_CODE varchar(10),';         //DeviceGroup code
  stSql := stSql + ' PRIMARY KEY (MP_TYPE,MP_CODE) ';
  stSql := stSql + ' ) ';

  result := DataModule1.ProcessExecSQL(stSql);
end;



function TdmDBCreate.AlterTB_ATEVENT_LASTINTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATEVENT ADD AT_LASTINTIME varchar(17)  ';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATEVENT_LASTOUTTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATEVENT ADD AT_LASTOUTTIME varchar(17)  ';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ATEVENT_NIGHTWORKTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATEVENT ADD NIGHTWORKTIME integer DEFAULT 0 ';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATEVENT_WORKTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATEVENT ADD WORKTIME integer DEFAULT 0 ';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ATEVENT_WORKENDTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATEVENT ADD AT_WORKENDTIME varchar(8)';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_ATEVENT_WORKSTARTTIME_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ATEVENT ADD AT_WORKSTARTTIME varchar(8)';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBCreate.CreateTB_DEVICECARDNO_Idx01: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE INDEX TB_DEVICECARDNO_Idx01 ON TB_DEVICECARDNO (GROUP_CODE,AC_NODENO,AC_ECUID,DE_RCVACK) ';

  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDBCreate.AlterTB_LOCATION_RelayCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_LOCATION ADD LO_RelayCode varchar(10) ';  
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ArmArea_RelayCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ArmArea ADD AR_RelayCode varchar(10) ';  
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_ArmArea_Change_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_ArmArea ADD AR_Change char(1) ';  
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_LOCATION_Change_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_LOCATION ADD LO_CHANGE char(1) ';  
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_HURELAY: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE TB_HURELAY ( ';
  stSql := stSql + '  HR_SEQ int IDENTITY   NOT NULL,';
  stSql := stSql + '  HR_ID varchar(10)    NULL,';
  stSql := stSql + '  HR_NAME varchar(100)   NULL,';
  stSql := stSql + '  HR_LOCCODE varchar(10)   NULL,';
  stSql := stSql + '  HR_STATUS varchar(5)   NULL,';
  stSql := stSql + '  HR_VACANCY varchar(20)   NULL, ';
  stSql := stSql + '  PRIMARY KEY (HR_SEQ) ';
  stSql := stSql + ') ';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'image','OLEObject',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','AUTOINCREMENT',[rfReplaceAll]);
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end else if DBTYPE = 'PG' then
  begin
    stSql := StringReplace(stSql,'image','oid',[rfReplaceAll]);
    stSql := StringReplace(stSql,'int IDENTITY','serial',[rfReplaceAll]);
  end else if DBTYPE = 'FB' then
  begin
    stSql := StringReplace(stSql,'int IDENTITY','integer',[rfReplaceAll]);
  end;  
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.AlterTB_CARD_STICK_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_CARD ADD CA_STICK char(1) DEFAULT ''N'' NULL ';
  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmDBCreate.CreateTB_LOGINCREATEHIS: Boolean;  //로그인 변경 이력
var
  stSql : string;
begin
  stSql := 'Create Table TB_LOGINCREATEHIS (';
  stSql := stSql + ' GROUP_CODE varchar(10) DEFAULT ''1234567890''  NOT NULL,';
  stSql := stSql + ' LC_DATE varchar(8) NOT NULL,';
  stSql := stSql + ' LC_SEQ integer NOT NULL,';
	stSql := stSql + ' AD_USERID varchar(20) NULL,';
	stSql := stSql + ' AD_USERPW varchar(20) NULL,';
	stSql := stSql + ' AD_USERNAME varchar(50) NULL,';
	stSql := stSql + ' GR_GRADECODE varchar(3) NULL,';
	stSql := stSql + ' AD_UPDATETIME varchar(14) NULL,';
	stSql := stSql + ' AD_UPDATEOPERATER varchar(10) NULL,';
	stSql := stSql + ' AD_MASTER char(1) NULL,';
	stSql := stSql + ' CO_COMPANYCODE varchar(3) NULL,';
	stSql := stSql + ' CO_JIJUMCODE varchar(3) NULL,';
	stSql := stSql + ' CO_DEPARTCODE varchar(3) NULL,';
	stSql := stSql + ' AD_BUILDINGGRADE char(1) NULL ,';
	stSql := stSql + ' LO_DONGCODE varchar(3) NULL , ';
	stSql := stSql + ' LO_FLOORCODE varchar(3) NULL ,';
	stSql := stSql + ' LO_AREACODE varchar(3) NULL ,';
	stSql := stSql + ' LC_MODE int NULL ,';   //1.입력,2.수정,3.삭제
  stSql := stSql + ' LC_PCIP varchar(30),';
  stSql := stSql + ' PRIMARY KEY (GROUP_CODE,LC_DATE,LC_SEQ) ';
  stSql := stSql + ' ) ';

  if DBTYPE = 'MDB' then
  begin
    stSql := StringReplace(stSql,'varchar','text',[rfReplaceAll]);
    stSql := StringReplace(stSql,'char','text',[rfReplaceAll]);
  end;

  result := DataModule1.ProcessExecSQL(stSql);
end;


end.
