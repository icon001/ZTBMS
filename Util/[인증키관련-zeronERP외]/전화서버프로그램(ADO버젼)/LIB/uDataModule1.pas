{***************************************************************}
{                                                               }
{  uDataModule1.Pas :DB Module1                                 }
{                                                               }
{  Copyright (c) 2005 this70@naver.com                          }
{                                                               }
{  All rights reserved.                                         }
{                                                               }
{***************************************************************}
unit uDataModule1;




interface

uses
  Controls,
  Dialogs,
  uLomosUtil,
  ComCtrls,
  Messages,
  SysUtils,
  Classes,
  DB,
  dbisamtb, LMDCustomComponent, ADODB,iniFiles,forms,SyncObjs,ActiveX;

const
  Msg_CardNoDownload  = WM_USER + 1004;
  MAXBUFFSIZE = 1024;
  SERVERTIMEOUT = 6000;
  LINEEND = #13;  //클라이언트에서 한문장의 끝을 알리는 데이터값
  DATADELIMITER = '^';
  DelayTime = 100;
  RETRYCOUNT = 3;
  DOORCOUNT = 2;  //기기당 출입문 사용 갯수
  CARDREADERCOUNT = 8; //기기당 카드리더 사용 갯수
  ZONECOUNT = 8;   //기기당 존 갯수
  DOORTYPE  = '1'; //Door Type
  ALARMTYPE = '2'; //ALARM TYPE
  GRADETYPE = '3'; //GRADE TYPE


const
 USE_ENUMPORTS_API = False;
 MAX_COMPORT = 36;       // 최대 255 까지
 MAX_LISTCOUNT = 100; //리스트 출력 count

const
  MCUBMP = 'MCU.bmp';
  ECUBMP = 'ECU.bmp';
  DOORBMP = 'DOOR.bmp';
  DOOROPEROPEN = 'DOOROPEROPEN.bmp';
  DOOROPERCLOSE = 'DOOROPERCLOSE.bmp';
  DOORNOTOPEROPEN = 'DOORNOTOPEROPEN.bmp';
  DOORNOTOPERCLOSE = 'DOORNOTOPERCLOSE.bmp';
  ALARMBMP = 'ALARM.bmp';
  WATCHALARM = 'WATCHALARM.bmp';
  NOTWATCHALARM = 'NOTWATCHALARM.bmp';
  WARNINGALARM = 'WARNINGALARM.bmp';
  FOODBMP = 'FOOD.bmp';
  ZONEBMP = 'ZONE.bmp';

type
//  TSystemType = (stDoor,stAlarm,stGrade);
  //TCardtype = (ctnothing,ctAccess, ctAlarm, ctBoth);
  TDownloadMode = (dmNone,dmTimeSync,dmCardData,dmCheckDoor);

  TDataModule1 = class(TDataModule)
    ADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOExecQuery: TADOQuery;
    ADOConnectionEVENT: TADOConnection;
    ADOConnectionLOG: TADOConnection;
    ADOBackupConnection: TADOConnection;
    ADOTmpQuery: TADOQuery;
    procedure Query_IDAfterPost(DataSet: TDataSet);
    procedure Query_IDBeforeDelete(DataSet: TDataSet);
    procedure Query_IDBeforeEdit(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    isEditMode: Boolean;
    BeforeCardNo: String;
    Function ProcessExecSQL(sqlst:String): Boolean;
    Function ProcessBackupExecSQL(sqlst:String): Boolean;
    Function ProcessEventExecSQL(sqlst:String): Boolean;
    Function ProcessLogExecSQL(sqlst:String): Boolean;
    {SQLLOG저장}
    procedure SQLErrorLog(aSQL:string);

    function CheckPermit(aCardNo: String; aNodeNo:integer; aECUID:String; DoorNo: Char;
         var aACType:Char; var aPTType:char; Var aRegCode:Char; Var aTimeCode:Char ): Boolean;
    function GetCardInfofromCardNo(aCardNo:String; var aCo:String; var aSabun: String ):Boolean;
    function DupCheckTB_ACCESS_EVENT(aTimestr:string; aNodeNO:integer; aECUID,aDoorNo,aCardNo:String):Boolean;
    function DupCheckTB_DEVICE_CARDNO(aCardNo,aNodeNo,aECUID: String):Boolean;
    function DupCheckTB_FOOD_EVENT(aTime:string; aNodeNo:integer;aECUID,aReaderNo,aCardNo:String):Boolean;
    function DupCheckTB_SUBJECTLEVEL(aSubjectCode,aLevelCode:String):Boolean;

    Procedure PermitDeviceCard(aCardNo:String;aPermit:Char);

    function CardPermitCheck(aCardNo,aNodeNo,aECUID,aPermit:String):Boolean;
    function CardPermitDelete(aCardNo,aNodeNo,aECUID,aPermit:String):Boolean;
    function CardRCV_ACKUpdate(aCardNo,aNodeNo,aECUID,aRcv_Ack :String):Boolean;

    function TB_LOWDATAInsert(NodeNO:integer;aIP,aPort,aECUID,aTxRx:string;aCommand:char;aReceiveData:string):Boolean;
    function TB_SYSTEMLOGInsert(aNodeNo,aEcuID,aType,aNumber,aCardNo,aData:string):Boolean;

    Procedure UpdateCompanyName(OldCode,aCode:String; aName:String);
    Procedure UpdateDepartName(OldCode,aCode:String; aName:String);
    Procedure ChangeNewCardNo(OldCardNo,NewCardNo:String);
    class function GetObject:TDataModule1;

  end;

var
  DataModule1: TDataModule1;
  IsServer: Integer;
  CompanyCode: String[10];
  DepartCode: String[3];
  Master_ID : String;
  Master_Name : string;
  AdminGrade : String;
  APP_PATH : String;
  ExeFolder: String;
  IsClientSERVER : integer; //한빌딩에서 여러개의 회사 사용시 서버구분
  IsAlarm : Boolean;  //방범 사용 유무
  IsAttend : Boolean; //근태 사용유무
//  ATTENDTYPE : String; //근태사용타입(BUTTON/UPDATE/READERNO(1/2))
  FOODDEVICE : String; //READER/DOOR
  FOODGRADE : Integer; // 0: 기기,1: 서버
  GROUPCODE : String;  //사업자등록번호 또는 그룹구분코드10자리
  AttendUse : Boolean; //근태 사용유무
  AccessUse : Boolean; //출입 사용유무
  FoodUse : Boolean;   //식수 사용유무
  PatrolUse : Boolean; //방범 사용유무
  SensorUse : Boolean; //센서 사용유무
  RecvAck : Boolean;   //송신데이터에 대한 수신유무
  IsMaster : Boolean;  //Master ID인지 체크하여 Master ID이면 모든 권한 부여
  CompanyGrade : String;  //회사 사용 권한 0: 전체 회사 ,1: 부여된 회사,2:부여된지점,3:부여된 부서
  MasterCompany : string; //사용자 소속 회사
  MasterJijum : string;    //사용자 소속 지점
  MasterDepart:string;     //사용자 소속 부서
  ComErrorList : TStringList;
  //Critical_SaveLog:     TCriticalSection;
  ComNodeList: TstringList;  //MCU리스트
  DeviceList: TStringList;   //ECU리스트
  ConnectDeviceList : TStringList; //Connect Device ID


  //SKT 재실관련
  bSKTLINK :BOOLEAN;
  DBType : string;
  DBName : string;
  DEVICEALARM : string;
  DEVICEALARMCNT : integer;
  DEVICEALARMFILE : string;
  SERVERALARM : string;
  SERVERALARMCNT : integer;
  SERVERALARMFILE : string;
  CurrentDAlarmCnt : integer;
  CurrentSAlarmCnt : integer;
  nCheckTime : integer;       //재실 유무를 판단하는 체크시간
  bDBBackup : Boolean;        //백업중
  bApplicationTerminate : Boolean;  //APP 종료
  bALARMSHORT : Boolean;   //쇼트 감지 사용 유무
  bALARMDOWN  : Boolean;   //단선 감지 사용 유무

  //수신시까지 대기 하기 위해 수신 유무 체크
  bCardReaderTypeCheck : Boolean; //카드리더 타입 셋팅 유무
  bDoorInfoSet: Array [0..7] of Boolean;  //출입문 정보 셋팅 유무
  bReaderInfoSet: Array [0..7] of Boolean; //카드리더 정보 셋팅 유무
  bPortInfoSet: Array [0..7] of Boolean; //포트 정보 셋팅 유무
  bfmEmployShow : Boolean;   //사원등록 화면 여부
  bCheckUsedDevice : Boolean; //ECU 체크 성공 유무
  bLinKusID : Boolean; //방범아이디 등록 성공 유무
  bLinKusMuxTel : Boolean; //방범 Mux 번호 등록 성공 유무
  bSystemInfo : Boolean; //ECU System 정보 등록 성공 유무

  bSeverConnected :Boolean; //서버 접속유무

implementation
uses
uMSDESql;

{$R *.dfm}

{카드 데이터 승인여부 확인}
//CheckPermit(aCardNo,DeviceID,aDoorNo,aCardType,aRegCode,aTimeCode)

function TDataModule1.CheckPermit(aCardNo: String;      // 카드번호
                                  aNodeNo:integer;      //Node No
                                  aECUID :String;     // ECU ID
                                  DoorNo: Char;         // 기기내 문 번호
                                  var aACType:Char;   // 출입유무(0:출입 무,1:출입 유)
                                  var aPTType:Char;   // 방범유무('0':방범 무, 1: 방범 유)
                                  Var aRegCode:Char;    // 등록코드(0:1,2문 1:1번문,2:2번문)
                                  Var aTimeCode:Char    // 타임코드
                                  ): Boolean;
var
  aCardPermit: Integer;
  stSql : string;
  TempQuery : TAdoQuery;
begin
  TempQuery := TAdoQuery.Create(nil);
  TempQuery.Connection := AdoConnection;

  Result:= False;
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + inttostr(aNodeNo) ;
  stSql := stSql + ' and GROUP_CODE = ''' + GROUPCODE + ''' ';

  with TempQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
      TempQuery.Free;
      Exit;
    End;

    if RecordCount > 0 then
    begin
      case DoorNo of
        '1':begin
            if (FindField('DE_DOOR1').asString  = 'Y') and
               (FindField('DE_PERMIT').asString = 'L') then Result:= True;
          end;
        '2':begin
            if (FindField('DE_DOOR2').asString = 'Y') and
               (FindField('DE_PERMIT').asString = 'L') then Result:= True;
          end;
      end;
      //카드타입 확인
      if (FindField('DE_USEACCESS').asString = 'Y') then  aACType:= '1'   //출입권한 유
      else  aACType:= '0';                                             //출입권한 무
      if FindField('DE_USEALARM').asString = 'Y' then aPTType:= '1'     //방범 권한 유
      else aPTType := '0';                                             //방범 권한 무

      // 등록코드 확인
      if (FindField('DE_DOOR1').asstring = 'Y') and (FindField('DE_DOOR2').asstring = 'Y') then
        aRegCode:= '0'
      else if FindField('DE_DOOR1').asstring = 'Y' then
        aRegCode:= '1'
      else if FindField('DE_DOOR2').asstring = 'Y' then
        aRegCode:= '2'
      else
        aRegCode:= '3';

      // 타임 코드
      if FindField('DE_TIMECODE').asString <> '' then
        aTimeCode := FindField('DE_TIMECODE').asString[1];

    end;
  end;
  TempQuery.Free;
end;

function TDataModule1.GetCardInfofromCardNo(aCardNo:String;
         var aCo:String; Var aSabun: String ):Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  Result:= False;
  stSql := ' select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      Exit;
    End;

    if RecordCount > 0 then
    begin
      aCo:=   Trim(FindField('CO_COMPANYCODE').AsString);
      aSabun:= Trim(FindField('EM_CODE').AsString);
      Result:= True;
    end;
  end;
  TempAdoQuery.Free;
end;



procedure TDataModule1.Query_IDAfterPost(DataSet: TDataSet);
var
  aCardNo: String;
  aPermit: Char;
begin
(*  aCardNo:= Query_ID.FindField('CARD_NO').asString;
  if Query_ID.FindField('CARD_STATE').asString = '1' then aPermit:= 'L'
  else                                                    aPermit:= 'N';
  PermitDeviceCard(aCardNo,aPermit);

  // 데이터 수정후 이전 카드와 다르면 이전 카드번호는 정지 한다.
  if (isEditMode = True) and (BeforeCardNo <> aCardNo) then
  begin
    PermitDeviceCard(BeforeCardNo,'N');
    if MessageDlg('저장된 출입,근태,식수데이터의 카드번호도 모두변경 하시겠습니까?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    begin
      ChangeNewCardNo(BeforeCardNo,aCardNo);
      MessageDlg('카드번호 변경이 완료 되었습니다.', mtInformation, [mbOK], 0);
    end;

  end;
*)

end;

Procedure TDataModule1.PermitDeviceCard(aCardNo:String;aPermit:Char);
var
  stSql : string;
begin
  stSql := 'UPDATE TB_DEVICECARDNO ';
  stSql := stSql + ' SET DE_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' WHERE CA_CARDNO = ''' + aCardNo + ''' ';
  ProcessExecSql(stSql);

end;

procedure TDataModule1.Query_IDBeforeDelete(DataSet: TDataSet);
var
  aCardNo: String;
begin
  //UpdateSQL_Query_ID.Apply(ukDelete);
(*  aCardNo:= DataSet.FindField('CARD_NO').asString;
  with CommonQuery do
  begin
    SQL.Clear;
    SQL.Add('delete from TB_CARD');
    SQL.Add('where CARD_NO = :CARD_NO');
    ParambyName('CARD_NO').asString:= aCardNo;
    EXECSQL;
  end;
  PermitDeviceCard(aCardNo,'N'); *)
end;

procedure TDataModule1.Query_IDBeforeEdit(DataSet: TDataSet);
begin
(*  BeforeCardNo:= DataSet.FindField('CARD_NO').asString;  *)
end;

//TB_CARD내 회사명 수정
procedure TDataModule1.UpdateCompanyName(OldCode,aCode, aName: String);
var
  stSql : string;
begin
  stSql := 'UPDATE TB_CARD ';
  stSql := stSql + ' SET CO_CODE = ''' + aCode + ''', CO_NAME = ''' + aName + '''';
  stSql := stSql + ' WHERE CO_CODE =  ''' + OldCode + '''';
  ProcessExecSql(stSql);

end;

//TB_CARD내 부서명 수정
procedure TDataModule1.UpdateDepartName(OldCode,aCode, aName: String);
var
  stSql : string;
begin
  stSql := 'UPDATE TB_CARD ';
  stSql := stSql + ' SET DEPART_CODE = ''' + aCode + ''', DEPART_NAME = ''' + aName + '''';
  stSql := stSql + ' WHERE DEPART_CODE =  ''' + OldCode + '''';

  ProcessExecSql(stSql);

end;
procedure TDataModule1.ChangeNewCardNo(OldCardNo, NewCardNo: String);
var
  stSql : string;
begin
  MessageDlg(OldCardNo + #13 + NewcardNo, mtInformation, [mbOK], 0);
  //출입데이터
  stSql := 'UPDATE TB_ACCESS_EVENT ';
  stSql := stSql + ' SET CARD_NO = ''' + NewCardNo + ''' ';
  stSql := stSql + ' WHERE CARD_NO = ''' + OldCardNo + ''' ';

  ProcessExecSql(stSql);

  //근태데이터
  stSql := ' UPDATE TB_AT_EVENT ';
  stSql := stSql + ' SET CARD_NO = ''' + NewCardNo + ''' ';
  stSql :=  stSql + ' WHERE CARD_NO = ''' + OldCardNo + ''' ';
  ProcessExecSql(stSql);


  //식수데이터
  stSql := ' UPDATE TB_FOOD_EVENT ';
  stSql := stSql + ' SET CARD_NO = ''' + NewCardNo + ''' ';
  stSql :=  stSql + ' WHERE CARD_NO = ''' + OldCardNo + ''' ';
  ProcessExecSql(stSql);
  
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
{var
  conStr : wideString;
  Host : String;
  userID : String;
  userPW : String;
  ini_fun : TiniFile;
  DBName : String;
  ExeFolder : String; }
begin
  ComErrorList := TStringList.Create;
  ComErrorList.Clear;
{    ExeFolder  := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(ExeFolder + '\ktmos.INI');

    Host  := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    userID := ini_fun.ReadString('DBConfig','UserID','sa');
    userPW := ini_fun.ReadString('DBConfig','UserPW','saPasswd');
    DBName := ini_fun.ReadString('DBConfig','DBNAME','KTMOS');
    GROUPCODE := ini_fun.ReadString('COMPANY','GROUPCODE','1234567890');
    ini_fun.free;
    conStr := '';
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + userPW + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + userID + ';';
    conStr := constr + 'Initial Catalog=' + DBName + ';';
    conStr := constr + 'Data Source=' + Host;

    ADOConnection.ConnectionString := conStr;
    ADOConnection.LoginPrompt:= false ;
    Try
      ADOConnection.Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
    End;    }
end;

class function TDataModule1.GetObject: TDataModule1;
begin
 If DataModule1 = Nil then DataModule1:= TDataModule1.Create(Nil);
 Result:= DataModule1;

end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
//  DataModule1.Free;
  DataModule1 := Nil;

end;

function TDataModule1.DupCheckTB_ACCESS_EVENT(aTimestr:string; aNodeNO:integer; aECUID, aDoorNo,
  aCardNo: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  result := False;
  stSql := 'Select * from TB_ACCESSEVENT ';
  stSql := stSql + ' where AC_DATE = ''' + copy(aTimestr,1,8) + '''';
  stSql := stSql + ' AND AC_TIME = ''' + copy(aTimestr,9,6) + '''';
  stSql := stSql + ' AND AC_NODENO = ' + intTostr(aNodeNo);
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';
  stSql := stSql + ' and DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' and CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    try
      open
    except
      TempAdoQuery.Free;
      exit;
    end;

    if Recordcount > 0 then result := True;

  end;
  TempAdoQuery.Free;
end;

function TDataModule1.CardPermitCheck(aCardNo, aNodeNo,aECUID,
  aPermit: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  result := False;

  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''' + aPermit + ''' ';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    try
      open
    except
      TempAdoQuery.Free;
      exit;
    end;

    if Recordcount > 0 then  result := True;

  end;
  TempAdoQuery.Free;

end;

function TDataModule1.CardPermitDelete(aCardNo, aNodeNo,aECUID,
  aPermit: String): Boolean;
var
  stSql : String;
begin
  result := False;
  stSql := 'delete from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''' + aPermit + ''' ';

  result := ProcessExecSql(stSql);

end;

function TDataModule1.DupCheckTB_DEVICE_CARDNO(aCardNo,aNodeNo,aECUID: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  result := False;
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    try
      open
    except
      TempAdoQuery.Free;
      exit;
    end;

    if Recordcount > 0 then  result := True;

  end;
  TempAdoQuery.Free;
end;

function TDataModule1.CardRCV_ACKUpdate(aCardNo, aNodeNo,aECUID,
  aRcv_Ack: String): Boolean;
var
  stSql : String;
begin
  result := False;
  stSql := 'update TB_DEVICECARDNO ';
  stSql := stSql + 'set DE_RCVACK = ''' + aRcv_Ack + ''' ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';

  result := ProcessExecSql(stSql);

end;

function TDataModule1.DupCheckTB_FOOD_EVENT(aTime:string; aNodeNo:integer;aECUID, aReaderNo,
  aCardNo: String): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  result := False;
  stSql := 'Select * from TB_FOODEVENT ';
  stSql := stSql + ' where FO_DATE = ''' + copy(aTime,1,8) + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + copy(aTime,9,6) + ''' ';
  stSql := stSql + ' and AC_NodeNO = ' + inttostr(aNodeNo) ;
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' and FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' and CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and GROUP_CODE = ''' + GROUPCODE + ''' ';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    try
      open
    except
      TempAdoQuery.Free;
      exit;
    end;

    if RecordCount > 0 then result := True;

  end;
  TempAdoQuery.Free;
end;


function TDataModule1.DupCheckTB_SUBJECTLEVEL(aSubjectCode,
  aLevelCode: String): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  result := False;
  stSql := 'select * from TB_SUBJECTLEVEL ';
  stSql := stSql + ' Where SUBJECT_CODE = :SUBJECT_CODE ';
  stSql := stSql + ' AND LEVEL_CODE = :LEVEL_CODE ';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    Parameters.ParamByName('SUBJECT_CODE').Value := aSubjectCode;
    Parameters.ParamByName('LEVEL_CODE').Value := aLevelCode;

    try
      open
    except
      TempAdoQuery.Free;
      exit;
    end;

    if Recordcount > 0 then  result := True;

  end;
  TempAdoQuery.Free;
end;





function TDataModule1.TB_LOWDATAInsert(NodeNO: integer; aIP, aPort,
  aECUID, aTxRx: string; aCommand: char; aReceiveData: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert into TB_LOWDATA ';
  stSql := stSql + '(GROUP_CODE,LO_DATE,AC_NODENO,LO_IP,LO_PORT,LO_ECUID,';
  stSql := stSql + 'LO_TXRX,LO_COMMAND,LO_LOWDATA,LO_INSERTTIME) ';
  stSql := stSql + 'Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + FormatdateTime('yyyymmdd',Now) + ''',';
  stSql := stSql + inttostr(NodeNO) + ',';
  stSql := stSql + '''' + aIP + ''',';
  stSql := stSql + '''' + aPort + ''',';
  stSql := stSql + '''' + aECUID + ''',';
  stSql := stSql + '''' + aTxRx + ''',';
  stSql := stSql + '''' + aCommand + ''',';
  stSql := stSql + '''' + aReceiveData + ''',';
  stSql := stSql + '''' + FormatdateTime('yyyymmddHHMMSS',Now) + ''') ';

  result := ProcessExecSql(stSql);

end;

function TDataModule1.ProcessExecSQL(sqlst: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
    if Not ADOConnection.Connected then ADOConnection.Connected := True;
    ADOConnection.BeginTrans;
    with ExecQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text:= sqlst;
      ExecSql;
    end;
  except
    begin
      ADOConnection.Connected := False;
      SQLErrorLog('DBError:'+ sqlst);
      ADOConnection.RollbackTrans;
      ExecQuery.Free;
      CoUninitialize;
      Exit;
    end
  end;
{  ON E: Exception do
    begin
      SQLErrorLog('DBError:'+ SQL.Text);
      ADOConnection.RollbackTrans;
      ExecQuery.Free;
      CoUninitialize;
      Exit;
    end
  end;  }
  ADOConnection.CommitTrans;
  ExecQuery.Free;
  CoUninitialize;
  Result:= True;
end;

procedure TDataModule1.SQLErrorLog(aSQL: string);
Var
  f: TextFile;
  st: string;
  aFileName: String;
begin

//  if SaveLogData < 1 then Exit;
  if Application.Terminated then Exit;
  {$I-}
  //Critical_SaveLog.Acquire;
  aFileName:= ExeFolder + '\DBerr'+ FormatDateTIme('yyyymmdd',Now)+'.log';
  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('hh:nn:ss:zzz">"   ',Now) + #13#10 + aSQL;
  WriteLn(f,st);
  System.Close(f);
  //Critical_SaveLog.Release;
  {$I+}
end;

function TDataModule1.ProcessEventExecSQL(sqlst: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  ExecQuery := TADOQuery.Create(nil);
  ExecQuery.Connection := ADOConnectionEVENT;
  with ExecQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= sqlst;
    try
      ExecSql;
    except
    ON E: Exception do
      begin
        SQLErrorLog('DBError:'+ SQL.Text);
        ExecQuery.Free;
        Exit;
      end
    end;
  end;
  ExecQuery.Free;
  Result:= True;
end;

function TDataModule1.ProcessLogExecSQL(sqlst: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  ExecQuery := TADOQuery.Create(nil);
  ExecQuery.Connection := ADOConnectionLOG;
  with ExecQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= sqlst;
    try
      ExecSql;
    except
    ON E: Exception do
      begin
        SQLErrorLog('DBError:'+ SQL.Text);
        ExecQuery.Free;
        Exit;
      end
    end;
  end;
  ExecQuery.Free;
  Result:= True;
end;

function TDataModule1.TB_SYSTEMLOGInsert(aNodeNo, aEcuID, aType,aNumber,aCardNo,
  aData: string): Boolean;
var
  stSql : string;
begin
    stSql := 'Insert into TB_SYSTEMLOG(';
    stSql := stSql + ' SY_DATE,SY_TIME,SY_CLIENTIP,SY_OPERATOR,SY_LOGDATA, ' ;
    stSql := stSql + ' AC_NODENO,AC_ECUID,AC_TYPE,CA_CARDNO,AC_NUMBER ';
    stSql := stSql + ') ';
    stSql := stSql + 'VALUES(';
    stSql := stSql + '''' + FormatDateTime('yyyymmdd',Now) + ''',';
    stSql := stSql + '''' + FormatDateTime('HHMMSS',Now) + ''',';
    stSql := stSql + '''' + Get_Local_IPAddr + ''',';
    stSql := stSql + '''' + Master_ID + ''',';
    stSql := stSql + '''' + aData + ''',';
    stSql := stSql + inttostr(strtoint(aNodeNo)) + ',';
    stSql := stSql + '''' + aEcuID + ''',';
    stSql := stSql + '''' + aType + ''',';
    stSql := stSql + '''' + aCardNo + ''',';
    stSql := stSql + '''' + aNumber + ''' ';
    stSql := stSql + ') ';

    result := ProcessExecSQL(stSql);

end;

function TDataModule1.ProcessBackupExecSQL(sqlst: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  ExecQuery := TADOQuery.Create(nil);
  ExecQuery.Connection := ADOBackupConnection;
  with ExecQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= sqlst;
    try
      ExecSql;
    except
    ON E: Exception do
      begin
        SQLErrorLog('DBError:'+ SQL.Text);
        ExecQuery.Free;
        Exit;
      end
    end;
  end;
  ExecQuery.Free;
  Result:= True;
end;

end.


