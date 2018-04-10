unit uMSDEsql;

interface
//uses
//  uDataModule1;


function SelectTB_UserIDKey: string;
function SelectTB_STATUSKey: string;
function SelectTB_DEVICE_CARDNOKey: string;
function SelectTB_FOOD_EVENTKey: string;
function SelectTB_AT_EVENTKey: string;
function SelectTB_DOORKey: string;

function SelectWorkSchedule: string;
function SelectQuery_DeviceCard: string;
function SelectTB_DEVICENODENTYPEJoin: string;
function SelectClassATJoinCard: string;
function SelectTB_ROOMSCHJoinTB_STUDENTLEVEL:string;
function SelectTB_ROOMSCHJoinTB_CLASSSCH:string;
function SelectTB_ROOMREADERJoinTB_ROOMSCH:string;
//���ǽǿ� �Ἦ�� �л� ��ȸ
function SelectTB_ROOMNonAttend :String;
//���ǽǿ� �⼮�� �л� ��ȸ
function SelectTB_ROOMAttend :String;
//���ǽ� �⼮��(��ü�л��� �Խǽð�)
function SelectRoomAttendState:String;
//�л� �Ǵ� �����Ե� ���ϱ��ð� ����
function SelectInOutState:string;
//�Ĵ絥���͸� �Ϻ� ����ȸ �ϴ� ����
function SelectFoodDataDayDetail:string;
//�Ĵ絥���� �Ϻ� �ļ����п� ���� ���賻�� ��ȸ �ϴ� ����
function SelectFoodDataDaySum:string;
//�Ĵ絥���� �Ⱓ�����賻�� ��ȸ
function SelectFoodDataFromToSum:string;
//�Ĵ絥���� �Ⱓ�����λ󼼳�����ȸ
function SelectFoodPersonDetail:string;
//�Ĵ絥���� ���κ� �հ賻��
function SelectFoodPersonSum:string;
//����� �л������� ��ȸ
function SelectTB_StudentNonAttend:string;
//����� �����Ե����� ��ȸ
function SelectTB_TeacherNonAttend:string;
//�⼮�� �л������� ��ȸ
function SelectTB_StudentAttend:string;

function SelectDupCheckTB_ACCESS_EVENT: string;
function SelectPermitTB_DEVICE_CARDNO : string;

function SelectTB_NODEAll: string;
function SelectTB_DEVICEAll: string;
function SelectTB_ZONEAll: string;
function SelectTB_DOORAll: string;
function SelectTB_DEVICE_CARDNOAll: string;
function SelectTB_ALARM_EVENTAll: string;
function SelectTB_COMPANYAll: string;
function SelectTB_DEPARTAll: string;
function SelectTB_STATEAll: string;
function SelectTB_CARDAll: string;
function SelectTB_POSIAll: string;
function SelectTB_STATUSAll: string;
function SelectTB_WORKCODEAll: string;
function SelectTB_HOLIDAYAll: string;
function SelectTB_DEVICETYPEAll: string;
function SelectTB_CLASSAll: string;
function SelectTB_CLASSSCHAll: string;
function SelectTB_SUBJECTAll: string;
function SelectTB_LEVELAll: string;
function SelectTB_WEEKAll: string;
function SelectTB_STUDYTIMEAll: string;
function SelectTB_ROOMAll: string;
function SelectTB_SUBJECTLEVELAll: string;
function SelectTB_ROOMSCHAll: string;
function SelectTB_ROOMReaderAll : string;
function SelectTB_GRADEAll : string;
function SelectTB_USERAll : string;




function InsertTB_SYSTEMLOG: string; //(aUser_ID,aLog_Note,aIP_Addr:string)
function InsertTB_ALARM_EVENT: string;
function InsertTB_ACCESS_EVENT: string;
function InsertTB_FOOD_EVENT: string;
function InsertTB_AT_EVENT: string;
function InsertTB_CARD: string;
function InsertDoor1TB_DEVICE_CARDNO: string;
function InsertDoor2TB_DEVICE_CARDNO: string;
function InsertTB_SUBJECTLEVEL: string;
function InsertTB_STUDENTLEVEL: string;
function InsertTB_CLASSSCH: string;
function InsertTB_ROOMSCH: string;
function InsertTB_SCHOOLAT:string;


function DeletePermitTB_DEVICE_CARDNO:String;
function DeletePreDateTB_ACCESS_EVENT:String;
function DeletePreDateTB_ALARM_EVENT:String;
function DeletePreDateTB_AT_EVENT:String;
function DeleteTB_STUDENTLEVEL: String;
function DeleteTB_SCHOOLAT: String;
function DeleteTB_AT_EVENT: string;


function UpdateRcv_AckTB_DEVICE_CARDNO:String;
function UpdateWorkOutTB_AT_EVENT:String;
function UpdateDoor1TB_DEVICE_CARDNO:String;
function UpdateDoor2TB_DEVICE_CARDNO:String;
function UpdateAlarmTB_DEVICE_CARDNO:String;
function UpdateTB_SUBJECTLEVEL: string;
function UpdateTB_CLASSSCH: string;
function UpdateTB_ROOMSCH: string;
function UpdateTB_SCHOOLATOutTime : string;



implementation

function SelectTB_UserIDKey: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_USER ';
  stSql := stSql + 'where USER_ID = :USER_ID ';
  Result := stSql;
end;

function SelectTB_STATUSKey: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_STATUS ';
  stSql := stSql + 'where STATUS_CODE = :STATUS_CODE ';
  Result := stSql;
end;

function SelectTB_DEVICE_CARDNOKey: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + 'where CA_CARDNO = :CARD_NO ';
  stSql := stSql + 'and DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + 'and GUBUN = :GUBUN ';
  Result := stSql;
end;

function SelectTB_FOOD_EVENTKey: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'Select * from TB_FOOD_EVENT ';
  stSql := stSql + 'where EVENT_TIME = :EVENT_TIME ';
  stSql := stSql + 'and DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + 'and READER_NO = :READER_NO ';
  stSql := stSql + 'and CARD_NO = :CARD_NO ';
  stSql := stSql + 'and GUBUN = :GUBUN ';

  Result := stSql;
end;

function SelectTB_AT_EVENTKey: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'Select * from TB_AT_EVENT ';
  stSql := stSql + 'where ATTEND_DATE = :ATTEND_DATE ';
  stSql := stSql + 'and CARD_NO = :CARD_NO ';
  Result := stSql;
end;

function SelectTB_DOORKey: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'Select * from TB_DOOR ';
  stSql := stSql + 'where DOOR_CODE = :DOOR_CODE ';
  Result := stSql;
end;

function SelectWorkSchedule: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'Select b.WORK_TIME,b.OUT_TIME from TB_WORKSCH a LEFT JOIN TB_WORKCODE b ';
  stSql := stSql + 'ON (a.WORK_CODE = b.WORK_CODE) ' ;
  stSql := stSql + 'Where a.Date = :WORKDATE ';
  stSql := stSql + 'AND a.CARD_NO = :CARD_NO ';
  Result := stSql;
end;

function SelectQuery_DeviceCard: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'SELECT A.CARD_NO,B.CO_NAME, B.DEPART_NAME,B.USER_NAME, ';
  stSql := stSql + 'A.DEVICE_ID,A.DOOR1,A.DOOR2,A.USE_ACCESS,A.USE_ALARM,A.TIMECODE,A.PERMIT,A.RCV_ACK ' ;
  stSql := stSql + 'FROM TB_DEVICE_CARDNO A  ';
  stSql := stSql + 'INNER JOIN TB_CARD B ON (A.CARD_NO = B.CARD_NO ) ';
  Result := stSql;
end;

function SelectTB_DEVICENODENTYPEJoin: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'SELECT A.DEVICE_ID,A.NODE_NO,A.DEVICE_NAME,A.DEVICE_TYPE,B.NODE_IP,C.TYPENAME,A.GUBUN ';
  stSql := stSql + 'FROM TB_DEVICE A ' ;
  stSql := stSql + 'INNER JOIN TB_NODE B ON (A.NODE_NO = B.NODE_NO AND A.GUBUN = B.GUBUN)  ';
  stSql := stSql + 'INNER JOIN TB_DEVICETYPE C ON (A.DEVICE_TYPE = C.TYPECODE ) ';
  Result := stSql;
end;

function SelectClassATJoinCard: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'select a.CARD_NO,a.CO_CODE,a.ID_NO,a.USER_NAME, b.STUDYTIME_CODE,b.WEEK_CODE,b.IN_RESULT,b.DEVICE_ID,b.READER_NO ';
  stSql := stSql + 'from  TB_CARD a   Left Join TB_SCHOOLAT b ';
  stSql := stSql + '     ON ( a.CARD_NO = b.CARD_NO ) ';
  stSql := stSql + 'where a.DEPART_CODE <> ''001'' ';
  Result := stSql;
end;

function SelectTB_ROOMSCHJoinTB_STUDENTLEVEL:string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'select * from ';
  stSql := stSql + 'TB_ROOMREADER a Inner Join ';
  stSql := stSql + 'TB_ROOMSCH b ON (a.ROOM_CODE = b.ROOM_CODE) ';
  stSql := stSql + 'Inner Join TB_STUDENTLEVEL c ';
  stSql := stSql + 'ON (b.SUBJECT_CODE = c.SUBJECT_CODE AND b.LEVEL_CODE = c.LEVEL_CODE ';
  stSql := stSql + 'AND b.STUDYTIME_CODE = :STUDYTIME_CODE AND  c.STUDENT_NO = :STUDENT_NO) ';
  stSql := stSql + 'where a.DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + 'AND a.READER_NO = :READER_NO ';

  Result := stSql;
end;


function SelectTB_ROOMSCHJoinTB_CLASSSCH:string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'select * from ';
  stSql := stSql + 'TB_ROOMREADER a Inner Join ';
  stSql := stSql + 'TB_ROOMSCH b ON (a.ROOM_CODE = b.ROOM_CODE AND b.WEEK_CODE = :WEEK_CODE AND b.STUDYTIME_CODE = :STUDYTIME_CODE ) ';
  stSql := stSql + 'Inner Join TB_CLASSSCH c ';
  stSql := stSql + 'ON (b.WEEK_CODE = c.WEEK_CODE AND b.SUBJECT_CODE = c.SUBJECT_CODE  ';
  stSql := stSql + 'AND b.STUDYTIME_CODE = c.STUDYTIME_CODE) ';
  stSql := stSql + 'where a.DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + 'AND a.READER_NO = :READER_NO ';


  Result := stSql;
end;

function SelectTB_ROOMREADERJoinTB_ROOMSCH:string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'select a.ROOM_CODE,b.SUBJECT_CODE,b.LEVEL_CODE from ';
  stSql := stSql + 'TB_ROOMREADER a Inner Join ';
  stSql := stSql + 'TB_ROOMSCH b ON (a.ROOM_CODE = b.ROOM_CODE AND b.WEEK_CODE = :WEEK_CODE AND b.STUDYTIME_CODE = :STUDYTIME_CODE ) ';
  stSql := stSql + 'where a.DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + 'AND a.READER_NO = :READER_NO ';

  Result := stSql;
end;

//���ǽǿ� �Ἦ�� �л� ��ȸ
function SelectTB_ROOMNonAttend :String;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + ' select AA.ROOM_CODE,AA.STUDYTIME_CODE,AA.WEEK_CODE,AA.CO_CODE,AA.CARD_NO,AA.CO_NAME,AA.ID_NO,AA.USER_NAME from ';
  stSql := stSql + ' select a.ROOM_CODE,a.STUDYTIME_CODE,a.WEEK_CODE,d.CO_CODE,d.card_no,d.CO_NAME,d.ID_NO,d.USER_NAME from TB_ROOMSCH a ';
  stSql := stSql + ' Inner Join TB_CLASSSCH b';
  stSql := stSql + ' ON (a.WEEK_CODE = b.WEEK_CODE AND a.STUDYTIME_CODE = b.STUDYTIME_CODE AND a.SUBJECT_CODE = b.SUBJECT_CODE) ';
  stSql := stSql + ' Inner Join TB_STUDENTLEVEL c ';
  stSql := stSql + ' ON (b.CLASS_CODE = c.CLASS_CODE AND a.SUBJECT_CODE = c.SUBJECT_CODE  AND a.LEVEL_CODE = c.LEVEL_CODE ) ';
  stSql := stSql + ' Inner Join TB_CARD d ';
  stSql := stSql + ' ON (b.CLASS_CODE = d.CO_CODE AND c.STUDENT_NO = d.ID_NO) ';
  stSql := stSql + ' Inner Join TB_ROOMREADER e ';
  stSql := stSql + ' ON (a.ROOM_CODE = e.ROOM_CODE) ';
  stSql := stSql + ' where a.ROOM_CODE = :ROOM_CODE1 ';
  stSql := stSql + ' AND a.WEEK_CODE = :WEEK_CODE ';
  stSql := stSql + ' AND a.STUDYTIME_CODE = :STUDYTIME_CODE1) AA ';
  stSql := stSql + ' Where Not Exists ';
  stSql := stSql + ' (select BB.ROOM_CODE,BB.CO_CODE,BB.CO_NAME,BB.ID_NO,BB.USER_NAME From ';
  stSql := stSql + ' (select b.ROOM_CODE,c.CO_CODE,c.CO_NAME,c.ID_NO,c.USER_NAME  from TB_SCHOOLAT a ';
  stSql := stSql + ' Inner Join TB_ROOMREADER b ';
  stSql := stSql + ' ON (a.DEVICE_ID = b.DEVICE_ID AND a.READER_NO = b.READER_NO) ';
  stSql := stSql + ' Inner Join TB_CARD c ';
  stSql := stSql + ' ON (a.CARD_NO = c.CARD_NO) ';
  stSql := stSql + ' Where a.SCHOOLAT_DATE = :SCHOOLAT_DATE ';
  stSql := stSql + ' AND a.STUDYTIME_CODE = :STUDYTIME_CODE2 ';
  stSql := stSql + ' AND b.ROOM_CODE = :ROOM_CODE2) BB ';
  stSql := stSql + ' WHERE AA.ROOM_CODE = BB.ROOM_CODE ';
  stSql := stSql + ' AND AA.ID_NO = BB.ID_NO ) ';
  stSql := stSql + ' Order by AA.CO_CODE,AA.ID_NO ';

  Result := stSql;
end;

//���ǽǿ� �⼮�� �л� ��ȸ
function SelectTB_ROOMAttend :String;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + ' select a.SCHOOLAT_DATE,a.IN_RESULT,a.MASTER_ID,a.STUDYTIME_CODE,b.ROOM_CODE,c.CO_CODE,c.CARD_NO,c.CO_NAME,c.ID_NO,c.USER_NAME  from TB_SCHOOLAT a ';
  stSql := stSql + ' Inner Join TB_ROOMREADER b ';
  stSql := stSql + ' ON (a.DEVICE_ID = b.DEVICE_ID AND a.READER_NO = b.READER_NO) ';
  stSql := stSql + ' Inner Join TB_CARD c';
  stSql := stSql + ' ON (a.CARD_NO = c.CARD_NO) ';
  stSql := stSql + ' Where a.SCHOOLAT_DATE = :SCHOOLAT_DATE ';
  stSql := stSql + ' AND a.STUDYTIME_CODE = :STUDYTIME_CODE ';
  stSql := stSql + ' AND b.ROOM_CODE = :ROOM_CODE ';

  Result := stSql;
end;

//���ǽ� �⼮��(��ü�л��� �Խǽð�)
function SelectRoomAttendState:String;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + ' select a.ROOM_CODE,d.CO_CODE,d.CO_NAME,d.ID_NO,d.USER_NAME,e.IN_RESULT,e.INTIME from TB_ROOMSCH a ';
  stSql := stSql + ' Inner Join TB_CLASSSCH b ';
  stSql := stSql + ' ON (a.WEEK_CODE = b.WEEK_CODE AND a.STUDYTIME_CODE = b.STUDYTIME_CODE AND a.SUBJECT_CODE = b.SUBJECT_CODE) ';
  stSql := stSql + ' Inner Join TB_STUDENTLEVEL c ';
  stSql := stSql + ' ON (b.CLASS_CODE = c.CLASS_CODE AND a.SUBJECT_CODE = c.SUBJECT_CODE  AND a.LEVEL_CODE = c.LEVEL_CODE )';
  stSql := stSql + ' Inner Join TB_CARD d ';
  stSql := stSql + ' ON (b.CLASS_CODE = d.CO_CODE AND c.STUDENT_NO = d.ID_NO) ';
  stSql := stSql + ' Left Join TB_SCHOOLAT e ';
  stSql := stSql + ' ON (d.CARD_NO = e.CARD_NO AND a.STUDYTIME_CODE = e.STUDYTIME_CODE AND e.SCHOOLAT_DATE = :SCHOOLAT_DATE ) ';
  stSql := stSql + ' where a.ROOM_CODE = :ROOM_CODE ';
  stSql := stSql + ' AND a.STUDYTIME_CODE = :STUDYTIME_CODE ';
  stSql := stSql + ' AND a.WEEK_CODE = :WEEK_CODE ';
  stSql := stSql + ' Order by d.CO_CODE,d.ID_NO ';

  Result := stSql;
end;


//�л� �Ǵ� �����Ե� ���ϱ��ð� ����
function SelectInOutState:string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + ' select a.USER_NAME,b.IN_TIME,b.OUT_TIME,b.IN_RESULT,a.ID_NO from TB_CARD a ';
  stSql := stSql + ' Left Join TB_AT_EVENT b ';
  stSql := stSql + ' ON (a.CARD_NO = b.CARD_NO AND b.ATTEND_DATE = :ATTEND_DATE ) ';
  stSql := stSql + ' where a.DEPART_CODE = :DEPART_CODE ';

  Result := stSql;
end;


//�Ĵ絥���͸� �Ϻ� ����ȸ �ϴ� ����
function SelectFoodDataDayDetail:string;
var
  stSql : string;
begin
  stSql := ' SELECT A.CARD_NO,A.CO_CODE,A.CO_NAME,A.DEPART_CODE,A.DEPART_NAME,A.POSI_CODE,A.POSI_NAME,A.ID_NO,A.USER_NAME, ';
  stSql := stSql + ' B.EVENT_DATE,B.CARD_NO,B.EVENT_TIME,(B.DEVICE_ID+B.READER_NO) AS DEVNO,B.FOOD_CODE,B.FOOD_PERMIT, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN B.FOOD_CODE =''1'' THEN ''����'' ';
  stSql := stSql + ' WHEN B.FOOD_CODE =''2'' THEN ''�߽�'' ';
  stSql := stSql + ' WHEN B.FOOD_CODE =''3'' THEN ''����'' ';
  stSql := stSql + ' WHEN B.FOOD_CODE =''4'' THEN ''�߽�'' ';
  stSql := stSql + ' END AS TYPEDESC ';
  stSql := stSql + ' FROM TB_FOOD_EVENT B LEFT JOIN TB_CARD A ON (A.CARD_NO = B.CARD_NO) ';
  stSql := stSql + ' Where B.EVENT_DATE = :EVENT_DATE ' ;
//  stSql := stSql + ' AND B.FOOD_PERMIT = ''Y'' ';
  Result := stSql;
end;

//�Ĵ絥���� �Ϻ� �ļ����п� ���� ���賻�� ��ȸ �ϴ� ����
function SelectFoodDataDaySum:string;
var
  stSql : string;
begin
  stSql := ' select SUM(AA.AAA) as BREAKFAST , SUM(AA.BBB) as LUNCH,SUM(AA.CCC) as DINNER,SUM(AA.DDD) as MIDNIGHT ';
  stSql := stSql + ' from ';
  stSql := stSql + ' (select ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''1'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as AAA, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''2'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as BBB, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''3'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as CCC, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''4'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as DDD ';
  stSql := stSql + ' from TB_FOOD_EVENT a ';
  stSql := stSql + ' where EVENT_DATE = :EVENT_DATE ';
  stSql := stSql + ' AND FOOD_PERMIT = ''Y'' ' ;
  stSql := stSql + ' group by FOOD_CODE) AA ';

  Result := stSql;
end;

//�Ĵ絥���� �Ⱓ�����賻�� ��ȸ
function SelectFoodDataFromToSum:string;
var
  stSql : string;
begin
  stSql := ' select AA.EVENT_DATE,SUM(AA.AAA) as BREAKFAST , SUM(AA.BBB) as LUNCH,SUM(AA.CCC) as DINNER,SUM(AA.DDD) as MIDNIGHT ';
  stSql := stSql + ',SUM(AA.AAA + AA.BBB + AA.CCC + AA.DDD) as TOTCNT '  ;
  stSql := stSql + ' from ';
  stSql := stSql + ' (select EVENT_DATE, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''1'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as AAA, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''2'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as BBB, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''3'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as CCC, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''4'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as DDD ';
  stSql := stSql + ' from TB_FOOD_EVENT a ';
  stSql := stSql + ' where EVENT_DATE BETWEEN :EVENT_DATEFROM AND :EVENT_DATETO ';
  stSql := stSql + ' AND FOOD_PERMIT = ''Y'' ' ;
  stSql := stSql + ' group by EVENT_DATE,FOOD_CODE) AA ';
  stSql := stSql + ' group by EVENT_DATE ';

  Result := stSql;
end;

//�Ĵ絥���� �Ⱓ�����λ󼼳�����ȸ
function SelectFoodPersonDetail:string;
var
  stSql : string;
begin

  stSql := '';
  stSql := stSql + ' select a.EVENT_DATE,b.CO_NAME,b.DEPART_NAME,b.ID_NO,b.USER_NAME,a.EVENT_TIME, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''1'' THEN ''����'' ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''2'' THEN ''�߽�'' ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''3'' THEN ''����'' ';
  stSql := stSql + ' WHEN a.FOOD_CODE = ''4'' THEN ''�߽�'' ';
  stSql := stSql + ' END AS FOOD_TYPE, ';
  stSql := stSql + ' a.DEVICE_ID ';
  stSql := stSql + ' from TB_FOOD_EVENT a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.CARD_NO = b.CARD_NO) ';
  stSql := stSql + ' where a.EVENT_DATE BETWEEN :EVENT_DATEFROM AND :EVENT_DATETO ';
  stSql := stSql + ' AND a.FOOD_PERMIT = ''Y'' ';

  Result := stSql;
end;

//�Ĵ絥���� ���κ� �հ賻��
function SelectFoodPersonSum:string;
var
  stSql : string;
begin

  stSql := '';
  stSql := stSql + ' select b.CO_CODE,b.CO_NAME,b.DEPART_NAME,b.ID_NO,b.USER_NAME, ';
  stSql := stSql + ' SUM(a.AAA) as BREAKFAST, SUM(a.BBB) as LUNCH,SUM(a.CCC) as DINNER,SUM(a.DDD) as MIDNIGHT ';
  stSql := stSql + ' ,SUM(a.AAA + a.BBB + a.CCC + a.DDD) as TOTCNT ';
  stSql := stSql + ' from (select CARD_NO, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN FOOD_CODE = ''1'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as AAA, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN FOOD_CODE = ''2'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as BBB, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN FOOD_CODE = ''3'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as CCC, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN FOOD_CODE = ''4'' THEN Count(*) ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END as DDD ';
  stSql := stSql + ' from TB_FOOD_EVENT ';
  stSql := stSql + ' where EVENT_DATE BETWEEN :EVENT_DATEFROM AND :EVENT_DATETO ';
  stSql := stSql + ' AND FOOD_PERMIT = ''Y'' ';
  stSql := stSql + ' group by CARD_NO,FOOD_CODE ';
  stSql := stSql + '  ) a ';
  stSql := stSql + ' INNER JOIN TB_CARD b';
  stSql := stSql + ' ON (a.CARD_NO = b.CARD_NO) ';

  Result := stSql;
end;

//����� �л������� ��ȸ
function SelectTB_StudentNonAttend:string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select a.CARD_NO,a.CO_CODE,a.CO_NAME,a.ID_NO,a.USER_NAME from (';
  stSql := stSql + 'select * from TB_CARD ';
  stSql := stSql + 'where DEPART_CODE = ''002'' ';
  stSql := stSql + 'and co_code = :CLASS_CODE ) a ';
  stSql := stSql + 'Where Not Exists ';
  stSql := stSql + '(select * from TB_AT_EVENT b ';
  stSql := stSql + 'where b.ATTEND_DATE = :ATTEND_DATE ';
  stSql := stSql + 'and a.Card_no = b.CARD_NO) ';
  stSql := stSql + 'Order by a.ID_NO ';

  Result := stSql;
end;

//����� �����Ե����� ��ȸ
function SelectTB_TeacherNonAttend:string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select a.CARD_NO,a.CO_CODE,a.CO_NAME,a.ID_NO,a.USER_NAME from (';
  stSql := stSql + 'select * from TB_CARD ';
  stSql := stSql + 'where DEPART_CODE = ''001'' ';
  stSql := stSql + ' ) a ';
  stSql := stSql + 'Where Not Exists ';
  stSql := stSql + '(select * from TB_AT_EVENT b ';
  stSql := stSql + 'where b.ATTEND_DATE = :ATTEND_DATE ';
  stSql := stSql + 'and a.Card_no = b.CARD_NO)  ';
  stSql := stSql + 'Order by a.ID_NO ';

  Result := stSql;
end;

//�⼮�� �л������� ��ȸ
function SelectTB_StudentAttend:string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_CARD a ';
  stSql := stSql + 'Inner Join TB_AT_EVENT b ';
  stSql := stSql + 'ON (a.CARD_NO = b.CARD_NO) ';
  stSql := stSql + 'Where b.ATTEND_DATE = :ATTEND_DATE ';
  stSql := stSql + 'AND a.DEPART_CODE = :DEPART_CODE ';

  Result := stSql;
end;

function SelectDupCheckTB_ACCESS_EVENT: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'Select * from TB_ACCESS_EVENT ';
  stSql := stSql + 'where EVENT_TIME = :EVENT_TIME ';
  stSql := stSql + 'and DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + 'and DOOR_NO = :DOOR_NO ';
  stSql := stSql + 'and CARD_NO = :CARD_NO ';
  Result := stSql;
end;

function SelectPermitTB_DEVICE_CARDNO : string;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'Select * from TB_DEVICE_CARDNO ';
  stSql := stSql + 'where CARD_NO = :CARD_NO ';
  stSql := stSql + 'and DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + 'and PERMIT = :PERMIT ';
  Result := stSql;
end;


function SelectTB_NODEAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_NODE ';
  Result := stSql;
end;

function SelectTB_DEVICEAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_DEVICE ';
  Result := stSql;
end;

function SelectTB_ZONEAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_ZONE ';
  Result := stSql;
end;

function SelectTB_DOORAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_DOOR ';
  Result := stSql;
end;

function SelectTB_DEVICE_CARDNOAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_DEVICE_CARDNO ';
  Result := stSql;
end;

function SelectTB_ALARM_EVENTAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_ALARM_EVENT ';
  Result := stSql;
end;

function SelectTB_COMPANYAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_COMPANY ';
  Result := stSql;
end;

function SelectTB_DEPARTAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_DEPART ';
  Result := stSql;
end;

function SelectTB_STATEAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_STATE ';
  Result := stSql;
end;

function SelectTB_CARDAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_CARD ';
  Result := stSql;
end;

function SelectTB_POSIAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_POSI ';
  Result := stSql;
end;

function SelectTB_STATUSAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_STATUS ';
  Result := stSql;
end;

function SelectTB_WORKCODEAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_WORKCODE ';
  Result := stSql;
end;

function SelectTB_HOLIDAYAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_HOLIDAY ';
  Result := stSql;
end;

function SelectTB_DEVICETYPEAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_DEVICETYPE ';
  Result := stSql;
end;

function SelectTB_CLASSAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_CLASS ';
  Result := stSql;
end;

function SelectTB_CLASSSCHAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_CLASSSCH ';
  Result := stSql;
end;


function SelectTB_SUBJECTAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_SUBJECT ';
  Result := stSql;
end;

function SelectTB_LEVELAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_LEVEL ';
  Result := stSql;
end;

function SelectTB_WEEKAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_WEEK ';
  Result := stSql;
end;

function SelectTB_STUDYTIMEAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_STUDYTIME ';
  Result := stSql;
end;


function SelectTB_ROOMAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_ROOM ';
  Result := stSql;
end;

function SelectTB_SUBJECTLEVELAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_SUBJECTLEVEL ';
  Result := stSql;
end;

function SelectTB_ROOMSCHAll: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_ROOMSCH ';
  Result := stSql;
end;

function SelectTB_ROOMReaderAll : string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_ROOMREADER ';
  Result := stSql;
end;

function SelectTB_GRADEAll : string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_GRADE ';
  Result := stSql;
end;

function SelectTB_USERAll : string;
var
  stSql:string;
begin
  stSql := '';
  stSql := stSql + 'select * from TB_USER ';
  Result := stSql;
end;


function InsertTB_SYSTEMLOG: string;  //(aUser_ID,aLog_Note,aIP_Addr:string)
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'Insert into TB_SYSTEMLOG';
  stSql := stSql + '(LOG_TIME,USER_ID,LOG_NOTE,IP_ADDR) ';
  stSql := stSql + 'Values';
  stSql := stSql + '(:LOG_TIME,:USER_ID,:LOG_NOTE,:IP_ADDR) ';

//  stSql := stSql + ' Values(getDate(),''' + aUser_ID + ''',''' ;
//  stSql := stSql + aLog_Note + ''',''' + aIP_Addr + ''') ';
  Result := stSql;
end;

function InsertTB_ALARM_EVENT: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'Insert into TB_ALARM_EVENT';
  stSql := stSql + '(EVENT_TIME,DEVICE_ID,MSG_NO,SUB_CLASS,SUB_ADDR,ZONE_CODE,';
  stSql := stSql + 'PORT_MODE,PORT_NO,PORT_STATUS,PORT_STATE,MSG,OPERATOR,ISALARM,GUBUN) ';
  stSql := stSql + 'Values';
  stSql := stSql + '(:EVENT_TIME,:DEVICE_ID,:MSG_NO,:SUB_CLASS,:SUB_ADDR,:ZONE_CODE,';
  stSql := stSql + ':PORT_MODE,:PORT_NO,:PORT_STATUS,:PORT_STATE,:MSG,:OPERATOR,:ISALARM,:GUBUN) ';
  Result := stSql;
end;

function InsertTB_ACCESS_EVENT: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'Insert into TB_ACCESS_EVENT';
  stSql := stSql + '(EVENT_TIME,DEVICE_ID,DOOR_NO,CARD_NO,DOOR_POSI,READER_NO,';
  stSql := stSql + 'INPUT_TYPE,DOOR_MODE,PERMIT_MODE,PERMIT_RESULT,ATTEND_CODE,GUBUN,INSERT_DATE) ';
  stSql := stSql + 'Values';
  stSql := stSql + '(:EVENT_TIME,:DEVICE_ID,:DOOR_NO,:CARD_NO,:DOOR_POSI,:READER_NO,';
  stSql := stSql + ':INPUT_TYPE,:DOOR_MODE,:PERMIT_MODE,:PERMIT_RESULT,:ATTEND_CODE,:GUBUN,getDate()) ';
  Result := stSql;
end;

function InsertTB_FOOD_EVENT: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'Insert into TB_FOOD_EVENT';
  stSql := stSql + '(EVENT_DATE,EVENT_TIME,CARD_NO,ID_NO,DEVICE_ID,READER_NO,';
  stSql := stSql + 'FOOD_CODE,FOOD_PERMIT,RCV_TIME,GUBUN) ';
  stSql := stSql + 'Values ';
  stSql := stSql + '(:EVENT_DATE,:EVENT_TIME,:CARD_NO,:ID_NO,:DEVICE_ID,:READER_NO,';
  stSql := stSql + ':FOOD_CODE,:FOOD_PERMIT,getdate(),:GUBUN) ';
  Result := stSql;
end;

function InsertTB_AT_EVENT: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'Insert into TB_AT_EVENT';
  stSql := stSql + '(ATTEND_DATE,CARD_NO,ID_NO,ATTEND_GROUP,DEFAULT_INTIME,DEFAULT_OUTTIME,';
  stSql := stSql + 'IN_TIME,OUT_TIME,IN_RESULT,OUT_RESULT,ABSENCE,MADEBY,UP_DATE,SEND,INMASTER_ID,OUTMASTER_ID,GUBUN) ';
  stSql := stSql + 'Values ';
  stSql := stSql + '(:ATTEND_DATE,:CARD_NO,:ID_NO,:ATTEND_GROUP,:DEFAULT_INTIME,:DEFAULT_OUTTIME,';
  stSql := stSql + ':IN_TIME,:OUT_TIME,:IN_RESULT,:OUT_RESULT,:ABSENCE,:MADEBY,getdate(),:SEND,:INMASTER_ID,:OUTMASTER_ID,:GUBUN) ';
  Result := stSql;
end;

function InsertTB_CARD: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'INSERT INTO TB_CARD';
  stSql := stSql + '(CARD_NO,CO_CODE,CO_NAME,DEPART_CODE,DEPART_NAME,';
  stSql := stSql + 'POSI_CODE,POSI_NAME,ID_NO,USER_NAME,CARD_STATE,REG_DAY,GUBUN) ';
  stSql := stSql + 'VALUES ';
  stSql := stSql + '(:CARD_NO,:CO_CODE,:CO_NAME,:DEPART_CODE,:DEPART_NAME,';
  stSql := stSql + ':POSI_CODE,:POSI_NAME,:ID_NO,:USER_NAME,:CARD_STATE,getdate(),:GUBUN) ';
  Result := stSql;
end;

function InsertDoor1TB_DEVICE_CARDNO: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'INSERT INTO TB_DEVICE_CARDNO';
  stSql := stSql + '(CARD_NO,DEVICE_ID,DOOR1,USE_ACCESS,USE_ALARM,';
  stSql := stSql + 'TIMECODE,PERMIT,RCV_ACK,UP_DATE,GUBUN) ';
  stSql := stSql + 'VALUES ';
  stSql := stSql + '(:CARD_NO,:DEVICE_ID,:DOOR,:USE_ACCESS,:USE_ALARM,';
  stSql := stSql + ':TIMECODE,:PERMIT,:RCV_ACK,getDate(),:GUBUN) ';
  Result := stSql;
end;

function InsertDoor2TB_DEVICE_CARDNO: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'INSERT INTO TB_DEVICE_CARDNO';
  stSql := stSql + '(CARD_NO,DEVICE_ID,DOOR2,USE_ACCESS,USE_ALARM,';
  stSql := stSql + 'TIMECODE,PERMIT,RCV_ACK,UP_DATE) ';
  stSql := stSql + 'VALUES ';
  stSql := stSql + '(:CARD_NO,:DEVICE_ID,:DOOR,:USE_ACCESS,:USE_ALARM,';
  stSql := stSql + ':TIMECODE,:PERMIT,:RCV_ACK,getDate()) ';
  Result := stSql;
end;

function InsertTB_SUBJECTLEVEL: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'Insert Into TB_SUBJECTLEVEL(';
  stSql := stSql + 'SUBJECTLEVEL_NAME,SUBJECT_CODE,LEVEL_CODE';
  stSql := stSql + ') VALUES( ';
  stSql := stSql + ':SUBJECTLEVEL_NAME,:SUBJECT_CODE,:LEVEL_CODE) ';
  Result := stSql;
end;

function InsertTB_STUDENTLEVEL: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'Insert Into TB_STUDENTLEVEL(';
  stSql := stSql + 'CLASS_CODE,STUDENT_NO,SUBJECT_CODE,LEVEL_CODE';
  stSql := stSql + ') VALUES( ';
  stSql := stSql + ':CLASS_CODE,:STUDENT_NO,:SUBJECT_CODE,:LEVEL_CODE)';
  Result := stSql;
end;

function InsertTB_CLASSSCH: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'Insert Into TB_CLASSSCH(';
  stSql := stSql + 'CLASS_CODE,WEEK_CODE,STUDYTIME_CODE,SUBJECT_CODE';
  stSql := stSql + ') VALUES( ';
  stSql := stSql + ':CLASS_CODE,:WEEK_CODE,:STUDYTIME_CODE,:SUBJECT_CODE) ';
  Result := stSql;
end;



function InsertTB_ROOMSCH: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'Insert Into TB_ROOMSCH(';
  stSql := stSql + 'ROOM_CODE,WEEK_CODE,STUDYTIME_CODE,SUBJECT_CODE,LEVEL_CODE ';
  stSql := stSql + ') VALUES( ';
  stSql := stSql + ':ROOM_CODE,:WEEK_CODE,:STUDYTIME_CODE,:SUBJECT_CODE,:LEVEL_CODE ) ';
  Result := stSql;
end;

function InsertTB_SCHOOLAT:string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'Insert Into TB_SCHOOLAT(';
  stSql := stSql + 'SCHOOLAT_DATE,CARD_NO,STUDYTIME_CODE,WEEK_CODE,INTIME, ';
  stSql := stSql + 'DEVICE_ID,READER_NO,UPDATETIME,IN_RESULT,MASTER_ID ';
  stSql := stSql + ') VALUES( ';
  stSql := stSql + ':SCHOOLAT_DATE,:CARD_NO,:STUDYTIME_CODE,:WEEK_CODE,:TIME, ';
  stSql := stSql + ':DEVICE_ID,:READER_NO,getDate(),:IN_RESULT,:MASTER_ID )';
  Result := stSql;
end;

function DeletePermitTB_DEVICE_CARDNO:String;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'delete from TB_DEVICE_CARDNO ';
  stSql := stSql + 'where CARD_NO = :CARD_NO ';
  stSql := stSql + 'and DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + 'and PERMIT = :PERMIT ';
  Result := stSql;
end;

function DeletePreDateTB_ACCESS_EVENT:String;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'delete from TB_ACCESS_EVENT ';
  stSql := stSql + 'WHERE SUBSTRING(EVENT_TIME ,1,8) <= :DATE ';
  Result := stSql;
end;

function DeletePreDateTB_ALARM_EVENT:String;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'delete from TB_ALARM_EVENT ';
  stSql := stSql + 'WHERE SUBSTRING(EVENT_TIME , 1 , 8) <= :DATE ';
  Result := stSql;
end;

function DeletePreDateTB_AT_EVENT:String;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'delete from TB_AT_EVENT ';
  stSql := stSql + 'WHERE ATTEND_DATE <= :DATE ';
  Result := stSql;
end;


function DeleteTB_STUDENTLEVEL:String;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'delete from TB_STUDENTLEVEL ';
  stSql := stSql + 'WHERE CLASS_CODE = :CLASS_CODE ' ;
  stSql := stSql + ' AND STUDENT_NO = :STUDENT_NO ' ;
  stSql := stSql + ' AND SUBJECT_CODE = :SUBJECT_CODE ';
  Result := stSql;
end;


function DeleteTB_SCHOOLAT: String;
var
  stSql:string;
begin
  stSql := '';
  stSql := ' delete from TB_SCHOOLAT ';
  stSql := stSql + ' where SCHOOLAT_DATE = :SCHOOLAT_DATE ';
  stSql := stSql + ' AND CARD_NO = :CARD_NO ';
  stSql := stSql + ' AND STUDYTIME_CODE = :STUDYTIME_CODE ';
  Result := stSql;
end;

function DeleteTB_AT_EVENT: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := ' delete from TB_AT_EVENT ';
  stSql := stSql + ' where ATTEND_DATE = :ATTEND_DATE ';
  stSql := stSql + ' AND CARD_NO = :CARD_NO ';
  Result := stSql;
end;


function UpdateRcv_AckTB_DEVICE_CARDNO:String;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'update TB_DEVICE_CARDNO ';
  stSql := stSql + 'set RCV_ACK = :RCV_ACK ';
  stSql := stSql + 'where CARD_NO = :CARD_NO ';
  stSql := stSql + 'and DEVICE_ID = :DEVICE_ID ';
  Result := stSql;
end;

function UpdateWorkOutTB_AT_EVENT:String;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'update TB_AT_EVENT ';
  stSql := stSql + 'set OUT_TIME = :OUT_TIME, ';
  stSql := stSql + ' OUT_RESULT = :OUT_RESULT, ';
  stSql := stSql + ' UP_DATE = :UPDATE ';
  stSql := stSql + 'where ATTEND_DATE = :ATTEND_DATE ';
  stSql := stSql + 'and CARD_NO = :CARD_NO ';
  Result := stSql;
end;

function UpdateTB_SUBJECTLEVEL: string;
var
  stSql : string;
begin
  stSql := '';
  stSql := stSql + 'update TB_SUBJECTLEVEL ';
  stSql := stSql + 'set SUBJECTLEVEL_NAME = :SUBJECTLEVEL_NAME ';
  stSql := stSql + ' where SUBJECT_CODE = :SUBJECT_CODE ';
  stSql := stSql + ' AND LEVEL_CODE = :LEVEL_CODE ';
  stSql := stSql + ' AND GUBUN = :GUBUN ';
  Result := stSql;
end;

function UpdateDoor1TB_DEVICE_CARDNO:String;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'update TB_DEVICE_CARDNO ';
  stSql := stSql + 'set DOOR1 = :DOOR, ';
  stSql := stSql + ' USE_ACCESS = :USE_ACCESS, ';
  stSql := stSql + ' PERMIT = :PERMIT, ';
  stSql := stSql + ' RCV_ACK = :RCV_ACK, ';
  stSql := stSql + ' UP_DATE = getDate() ';
  stSql := stSql + 'where CARD_NO = :CARD_NO ';
  stSql := stSql + 'and DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + ' AND GUBUN = :GUBUN ';
  Result := stSql;
end;

function UpdateDoor2TB_DEVICE_CARDNO:String;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'update TB_DEVICE_CARDNO ';
  stSql := stSql + 'set DOOR2 = :DOOR, ';
  stSql := stSql + ' USE_ACCESS = :USE_ACCESS, ';
  stSql := stSql + ' PERMIT = :PERMIT, ';
  stSql := stSql + ' RCV_ACK = :RCV_ACK, ';
  stSql := stSql + ' UP_DATE = getDate() ';
  stSql := stSql + 'where CARD_NO = :CARD_NO ';
  stSql := stSql + 'and DEVICE_ID = :DEVICE_ID ';
  Result := stSql;
end;

function UpdateAlarmTB_DEVICE_CARDNO:String;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'update TB_DEVICE_CARDNO ';
  stSql := stSql + 'set USE_ALARM = :USE_ALARM, ';
  stSql := stSql + ' RCV_ACK = :RCV_ACK, ';
  stSql := stSql + ' UP_DATE = getDate() ';
  stSql := stSql + 'where CARD_NO = :CARD_NO ';
  stSql := stSql + 'and DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + 'and GUBUN = :GUBUN ';
  Result := stSql;
end;


function UpdateTB_CLASSSCH: string;
var
  stSql:string;                      
begin
  stSql := '';
  stSql := 'update TB_CLASSSCH ';
  stSql := stSql + 'set SUBJECT_CODE = :SUBJECT_CODE ';
  stSql := stSql + 'where CLASS_CODE = :CLASS_CODE ';
  stSql := stSql + 'and WEEK_CODE = :WEEK_CODE ';
  stSql := stSql + 'and STUDYTIME_CODE = :STUDYTIME_CODE ';
  Result := stSql;
end;

function UpdateTB_ROOMSCH: string;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'update TB_ROOMSCH ';
  stSql := stSql + 'set SUBJECT_CODE = :SUBJECT_CODE, ';
  stSql := stSql + ' LEVEL_CODE = :LEVEL_CODE ' ;
  stSql := stSql + 'where ROOM_CODE = :ROOM_CODE ';
  stSql := stSql + 'and WEEK_CODE = :WEEK_CODE ';
  stSql := stSql + 'and STUDYTIME_CODE = :STUDYTIME_CODE ';
  Result := stSql;
end;

function UpdateTB_SCHOOLATOutTime : string;
var
  stSql:string;
begin
  stSql := '';
  stSql := 'update TB_SCHOOLAT ';
  stSql := stSql + 'set OUTTIME = :TIME ';
  stSql := stSql + 'where SCHOOLAT_DATE = :SCHOOLAT_DATE ';
  stSql := stSql + 'and CARD_NO = :CARD_NO ';
  stSql := stSql + 'and STUDYTIME_CODE = :STUDYTIME_CODE ';
  stSql := stSql + 'and WEEK_CODE = :WEEK_CODE ';
  stSql := stSql + 'and DEVICE_ID = :DEVICE_ID ';
  stSql := stSql + 'and READER_NO = :READER_NO ';

  Result := stSql;
end;


end.
