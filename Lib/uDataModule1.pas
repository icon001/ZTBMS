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
  ADODB,iniFiles,forms,SyncObjs,
  OleCtrls,ActiveX;

  //통신 모듈을 같이 사용하면서 이쪽으로 통합
const
  ERR_DEVICE_0001   = '통신 이상';
  ERR_DEVICE_0002   = '미등록 기기 ';
  ERR_PROTOCOL_0001 = 'STX이전 데이터';
  ERR_PROTOCOL_0002 = '정의 안된 커맨드';
  ERR_PROTOCOL_0003 = 'ERROR 커맨드';
  ERR_DB_0001       = 'DB저장 실패';
  ERR_PACKET_0001   = 'Packet내 데이터 오류';
  ERR_PACKET_0002   = 'Packet 사이즈부족';

const
  STX = #$2;
  ETX = #$3;
  ENQ = #$5;
  ACK = #$6;
  NAK = #$15;
  EOT = #$04;
  CR  = #13;

const
  Msg_CardNoDownload  = WM_USER + 1004;
  MAXBUFFSIZE = 1024;
  SERVERTIMEOUT = 6000;
  LINEEND = #13;  //클라이언트에서 한문장의 끝을 알리는 데이터값
  DATADELIMITER = '^';
  DelayTime = 300;
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
  //근태 버튼
  INBUTTON = '1'; //출근버튼
  OUTBUTTON = '2'; //퇴근버튼
  LEAVEBUTTON = '3'; //외출버튼
  BACKBUTTON = '4'; //복귀버튼

const
  MCUBMP = 'MCU.bmp';
  ECUBMP = 'ECU.bmp';
  DOORBMP = 'DOOR.bmp';
  DOOROPEROPEN = 'DOOROPEROPEN.bmp';
  DOOROPERCLOSE = 'DOOROPERCLOSE.bmp';
  DOORNOTOPEROPEN = 'DOORNOTOPEROPEN.bmp';
  DOORNOTOPERCLOSE = 'DOORNOTOPERCLOSE.bmp';
  SHUTOPEN = 'SHUTOPEN.bmp';
  SHUTCLOSE = 'SHUTCLOSE.bmp';
  QUESTION = 'QUESTION.bmp';
  ALARMBMP = 'ALARM.bmp';
  WATCHALARM = 'WATCHALARM.bmp';
  NOTWATCHALARM = 'NOTWATCHALARM.bmp';
  WARNINGALARM = 'WARNINGALARM.bmp';
  FOODBMP = 'FOOD.bmp';
  ZONEBMP = 'ZONE.bmp';

type
//  TSystemType = (stDoor,stAlarm,stGrade);
  //TCardtype = (ctnothing,ctAccess, ctAlarm, ctBoth);
  //타입
  TDownloadMode = (dmNone,dmTimeSync,dmCardData,dmCheckDoor);
  TNodeCurrentState = (nsDisConnected,nsConnected,nsFault);
  TWatchMode = (cmNothing,cmArm, cmDisarm,cmPatrol,cmInit,cmTest);
  TAlarmEventState = (aeNothing,aeNormal,aeNormalEvent,aeAlarmEvent);
  TDoorManageMode = (dmNothing,dmManager,dmOpen,dmLock);   //운영/개방 모드 /폐쇄
  TDoorState = (dsNothing,dsClose,dsOpen,dsLongTime,dsOpenErr,dsCloseErr);        //열림/닫힘 상태
  TDoorLockState = (lsNothing,lsClose,lsOpen);        //잠김/열림 상태
  TDoorPNMode = (pnNothing,pnPositive,pnNegative);   //Positive/Negative 상태
  TNetworkMode = (nmRemote,nmLocal);
  TDeviceType = (dtNothing,dtAc,dtAt,dtPt,dtFd);// 출입dtAc,방범dtPt,근태dtAt,식수dtFd
  TRegType = (rtAppend,rtDelete,rtCheck);
  TCardtype = (ctnothing,ctAccess, ctAlarm, ctBoth);

  TNotifyReceive = procedure(Sender: TObject;  ReceiveData: string; NodeNo : integer) of object;

  TAlarmEvent = procedure(Sender: TObject;  Cmd,ReceiveData: string; NodeNo : integer) of object;
  TAlarmEventAnalysis = procedure(Sender:TObject;NodeNo:integer;ECUID:string;
                                  aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aZoneCode,aMode,aStatusCode,aPortNo,aState,
                                  aOperator,aNewStateCode:string;
                                  aAlarmView,aAlarmSound:Boolean) of object;
  TDeviceAlarmEvent = procedure(Sender:TObject;NodeNo:integer;ECUID:string;aAlaramState:TAlarmEventState) of object;
  TBuildingAlarmEvent = procedure(Sender:TObject;aBuildingCode:string;aAlaramState:TAlarmEventState) of object;
  TBuildingAlarmMode = procedure(Sender:TObject;aBuildingCode:string;aAlaramMode:TWatchMode) of object;
  TNodeConnect = procedure(Sender: TObject;  Value:Boolean; NodeNo : integer) of object;
  TNodeConnectState = procedure(Sender:TObject;NodeNo:integer;aConnectState:TNodeCurrentState) of object;
  TConnectType = procedure(Sender: TObject;  Value:Boolean; NodeNo : integer;aEcuID:string) of object;
  TDoorManageModeChangeType = procedure(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorManageType:TDoorManageMode) of object;
  TDoorPNModeChangeType = procedure(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorPNType:TDoorPNMode) of object;
  TDoorStateChangeType = procedure(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorStateType:TDoorState) of object;
  TWatchModeChangeType = procedure(Sender: TObject; NodeNo : integer;aEcuID:string;aWachMode:TWatchMode) of object;
  TDoorModeChangeType = procedure(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorState;
                                  aDoorLockType:TDoorLockState) of object;
  TFireStateChange = procedure(Sender:TObject;NodeNo:integer;aEcuID,aDoorNo:string;aFireState:Boolean) of object;
  TAccessEvent = procedure(Sender:TObject;NodeNo:integer;aEcuID,aDoorNo,aReaderNo,aCardNo,aTime,aPermit,aInputType,aButton:string) of object;
  TDaemonRestart = procedure(Sender:TObject) of object;
  TDaemonConnected = procedure(Sender:TObject;aValue:Boolean) of object;
  TExitButton = procedure (Sender:TObject;NodeNo:integer;aEcuID,aDoorNo,aTime,aInputType:string) of object;
  //  TDeviceConnected = procedure(Sender:TObject;NodeNo:integer;ECUID:string;aValue:Boolean) of object;

  TAdoConnectedEvent = procedure(Sender: TObject;  Connected:Boolean) of object;


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
    FOnAdoConnected: TAdoConnectedEvent;
    { Private declarations }
  public
    { Public declarations }
    isEditMode: Boolean;
    BeforeCardNo: String;


    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
    Function ProcessEventExecSQL(aSql:String): Boolean;
    Function ProcessLogExecSQL(aSql:String): Boolean;
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


    Function GetCompanyName(aCompanyCode:string):string;
    Function GetJijumName(aCompanyCode,aJijumCode:string):string;
    Function GetDepartName(aCompanyCode,aJijumCode,aDepartCode:string):string;
    Function GetPosiName(aCompanyCode,aPosiCode:string):string;
    Function GetFdmsID(aCompanyCode,aEmCode:string):string;

    Function GetDaemonVersion:integer;

    //화재 발생 체크
    Function CheckFireOrgin:Boolean;

    class function GetObject:TDataModule1;

  published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;

var
  DataModule1: TDataModule1;
  IsServer: Integer;
  //CompanyCode: String[10];
  //DepartCode: String[3];
  Master_ID : String;
  Master_Name : string;
  AdminGrade : String;
  //APP_PATH : String;
  ExeFolder: String;
  FileServerPath:string;
  IsClientSERVER : integer; //한빌딩에서 여러개의 회사 사용시 서버구분
//  IsAlarm : Boolean;  //방범 사용 유무  PatrolUse 로변경
//  IsAttend : Boolean; //근태 사용유무   AttendUse 로변경
//  ATTENDTYPE : String; //근태사용타입(BUTTON/UPDATE/READERNO(1/2))
  UseCardPosition : Boolean; //카드 위치정보 사용유무
  G_bACEventFull  : Boolean; //출입이벤트 전체 남길건지 유무
  G_bCommLogSave  : Boolean; //기기 통신 로그 남길건지 유무
  G_bCardLogSave  : Boolean; //카드 로그 남길건지 유무
  G_nFTPUse : integer;       //전체권한 전송시 0 FTP 다운로드 1.F 다운로드
  G_nMultiDaemon : integer;       //데몬동작형태 0: 데몬 단독 동작 1:멀티데몬
  G_nMultiSocket : integer;       //멀티소켓구분
  G_nDaemonGubun : integer;       //데몬 구분자 1~N
  G_nScheduleDeviceAsync : integer;  // 0:스케줄 동기화 사용 안함,1:스케줄 동기화 사용
  G_nScheduleDevice : integer;  // 0:기기자체 스케줄,1:PC에서 스케줄
  UseDeviceServer : Boolean;              //기기대비 서버로 뜰건지
  UseStateShow : Boolean;       //상황표시기로 사용할것인지 유무
  UseFTPZeronServer : Boolean;
  G_nDaemonServerVersion : integer; //데몬서버 버젼

  //Client 프로그램 환경설정
  ACAlarmUse : Boolean; //출입 미승인 알람 사용유무
  LongDoorOpenAlarmUse : Boolean; //장시간 문열림 알람 사용 유무
  ACAlarmEventUse : Boolean; //출입 전용 알람이벤트 사용유무
  ACAlarmEventCode : string; //출입 전용 알람이벤트코드
  ACAlaramFile : string; //알람 발생 파일
  PTAlarmUse : Boolean; //방범 이상 시 알람 사용유무
  PTAlarmMessageUse:Boolean; //존 이상시 알람 메시지 사용유무
  PTAlaramFile : string; //방범 알람 발생 파일
  G_bACIntroView : Boolean;  // 출입 범례 표시 유무
  G_bColseModeView : Boolean;  //폐쇄모드 사용 유무
  G_bFireMessageView : Boolean; //화재 메시지 표시 유무
  G_stFireState : string;  //화재상태
  G_nFireTime : integer;   //화재 메시지 조회 시간 초
  G_dtFireMessageTime : Cardinal;
  G_nLoginMoitorStart: integer; //로그인시 모니터링 시작
  G_nMonitorGubun : integer; //모니터링 시 전체모니터링 0,그룹별모니터링 1
  G_nSearchIndex : integer; //새창 조회시 기본값조회 0,조회안함1
  G_bKTDupCardReg : Boolean; // KT카드 발급시 중복카드 발급 유무
  G_bRelayDefaultCode : string; // 외부연동시 연동 디폴트 코드
  G_nCardRegisterPort : integer; //카드등록기 포트번호

  FOODDEVICE : String; //READER/DOOR
  FOODGRADE : Integer; // 0: 기기,1: 서버
  GROUPCODE : String;  //사업자등록번호 또는 그룹구분코드10자리
  CARDTYPE : string;   //카드타입 1:방범근태카드 2:근태전용카드
  CARDLENGTHTYPE : integer; //카드번호 타입 0:고정4Byte, 1:가변, 2:HEX<->ASCII(KT)
  DUPCARDTYPE : integer;    //0:1인당 1장의 카드 발급,1:1인당 여러장 카드 발급
  PersonRelayType : integer; //가져오는 사원연동형태 0:연동안함,1:삼육대 연동,2:KT서초사옥,3:경희대 ,4:LOMOS
  SendPersonRelayType : integer; //보내는 사원연동형태 0:연동안함,1:삼육대 연동,2:KT서초사옥,3:경희대 ,4:LOMOS
  IsNumericCardNo : Boolean;  //카드번호 숫자타입 True
  IsCardGradCopy : Boolean;   //카드권한 복사 사용 유무
  G_nAccessEventSearch : integer;   //출입이벤트 조회시 원격제어 및 퇴실버튼 조회시 0,카드데이터만 조회시 1
  ALARMVIEW : string;   //REAL : 실시간 조회, QUERY : 쿼리 조회
  AttendUse : Boolean; //근태 사용유무
  AccessUse : Boolean; //출입 사용유무
  FoodUse : Boolean;   //식수 사용유무
  PatrolUse : Boolean; //방범 사용유무
  SensorUse : Boolean; //센서 사용유무
  AlarmEventLengthUse : Boolean; //알람이벤트 처리시 가변 길이 사용
  AlarmEventLength : integer; //알람이벤트 처리시 가변 길이
  InOutCountUse : Boolean; //입실 카운터 사용유무
  RecvAck : Boolean;   //송신데이터에 대한 수신유무
  IsMaster : Boolean;  //Master ID인지 체크하여 Master ID이면 모든 권한 부여
  CompanyGrade : String;  //회사 사용 권한 0: 전체 회사 ,1: 부여된 회사,2:부여된지점,3:부여된 부서
  MasterCompany : string; //사용자 소속 회사
  MasterJijum : string;    //사용자 소속 지점
  MasterDepart:string;     //사용자 소속 부서
  BuildingGrade : integer; //0:전체,1:빌딩,2:층,3:구역,4:출입문단위
  MasterBuildingCode:string; //사용자 관리빌딩
  MasterFloorCode:string;    //사용자 관리층
  MasterAreaCode:string;     //사용자 구역
  ComErrorList : TStringList;
  //Critical_SaveLog:     TCriticalSection;
  ComNodeList: TstringList;  //MCU리스트
  DeviceList: TStringList;   //ECU리스트
  ConnectDeviceList : TStringList; //Connect Device ID

  DeviceClientNodeList: TstringList;  //DeviceClient 모드 MCU리스트
  DeviceClientDeviceList: TStringList;   //DeviceClient 모드 ECU리스트
  DeviceConnectList : TList;


  //지문리더 연동 유무
  fdmsUses : String;   //지문인식 사용 유무
  fdmsPath : string;   //유니온 지문인식 DB Path
  fdmsPW   : string;   //유니온 지문인식 접속 Pw
  fdmsType : string;   //'0' 성현,'1' 유니온
  fdmsNo : integer;    //인증 번호 길이
  fdmsEMCode : Boolean;    //인증 번호 길이

  //Card Reader 연동 유무
  IsCardReaderServer : Boolean;

  G_bApplicationTerminate : Boolean; //Application 종료 여부
  //***************** 인적사항연동 환경
  G_stRelayDBType : string;
  G_stRelayDBServerIP : string;
  G_stRelayDBServerPort :string;
  G_stRelayDBServerUserID : string;
  G_stRelayDBServerUserPW : string;
  G_stRelayDBServerName : string;
  G_stRelayDBType2 : string;
  G_stRelayDBServerIP2 : string;
  G_stRelayDBServerPort2 :string;
  G_stRelayDBServerUserID2 : string;
  G_stRelayDBServerUserPW2 : string;
  G_stRelayDBServerName2 : string;
  G_stRelayKHUAddDate : string;  //경희대 입력 데이터 날짜
  G_stRelayKHUCARDDate : string;  //경희대 카드 변경 데이터 날짜
  G_stRelayKHUDelDate : string;  //경희대 삭제 데이터 날짜

  //******************카드 고정길이 사용 환경
  G_bCardFixedUse : Boolean;   //카드고정 사용 유무
  G_stCardFixedFillChar : string; //카드고정시 채움문자
  G_nCardFixedPosition : integer; //채움문자위치 0:앞,1:뒤
  G_nCardFixedLength : integer;   //카드고정길이 

  //SKT 재실관련
  bSKTLINK :BOOLEAN;
  DBType : string;
  DBName : string;
  DBServer : string;
  DBUser : string;
  DBUserPw : string;
  DBPort : string;
  
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
  CardAutoDownLoadUse :Boolean; //카드자동다운로드 사용유무

  nSpecialProgram : integer;  //특화서비스 0: 범용,1:KT서초사옥,2:RUC(지문연동),3:KTTELECOP(자리수틀림)

  ControlDataList : TStringList;
  G_bControlReceive : Boolean; //제어 수신 여부
  G_bControlSocketConnected : Boolean; //제어 세션 연결 유무
  G_bEventSocketConnected : Boolean; //이벤트 세션 연결 유무
  G_bStateSocketConnected : Boolean; //상태 세션 접속유무

  NETTYPE : string;  //TCPIP or COM

  //Form Name
  FM001 : string;  //회사코드
  FM002 : string;  //회사명
  FM011 : string;  //지점코드
  FM012 : string;  //지점명
  FM021 : string;  //부서코드
  FM022 : string;  //부서명
  FM031 : string;  //직위코드
  FM032 : string;  //직위명
  FM040 : string;  //직원구분
  FM041 : string;  //직원코드
  FM042 : string;  //직원코드명칭
  FM101 : string;  //사번
  FM102 : string;  //이름
  FM103 : string;  //사내전화번호
  FM104 : string;  //입사일
  FM105 : string;  //퇴사일
  FM106 : string;  //사원
  FM901 : string;  //빌딩코드
  FM902 : string;  //빌딩명칭
  FM903 : string;  //빌딩권한
  FM911 : string;  //층코드
  FM912 : string;  //층명칭
  FM913 : string;  //층권한
  FM921 : string;  //구역코드
  FM922 : string;  //구역명칭
  FM923 : string;  //구역권한
  FM933 : string;  //출입문권한

  SendCardTime : Cardinal;    //마지막 카드수신시간

  G_nProcessCount : integer;    //사용 프로세스 갯수
  G_nMaxProcessCount : integer; //최대 프로세스 갯수
  useProcessCount : Boolean;    //프로세스 갯수 사용

  FCS : TCriticalSection;
  FCSSocket : TCriticalSection;

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
  TempAdoQuery : TAdoQuery;
begin

  Result:= False;
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + inttostr(aNodeNo) ;
  stSql := stSql + ' and GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
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
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TDataModule1.GetCardInfofromCardNo(aCardNo:String;
         var aCo:String; Var aSabun: String ):Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Result:= False;
  stSql := ' select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount > 0 then
      begin
        aCo:=   Trim(FindField('CO_COMPANYCODE').AsString);
        aSabun:= Trim(FindField('EM_CODE').AsString);
        Result:= True;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
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
  FCS := TCriticalSection.Create;
  FCSSocket := TCriticalSection.Create;
  
  ComErrorList := TStringList.Create;
  ComErrorList.Clear;
{    ExeFolder  := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');

    Host  := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    userID := ini_fun.ReadString('DBConfig','UserID','sa');
    userPW := ini_fun.ReadString('DBConfig','UserPW','saPasswd');
    DBName := ini_fun.ReadString('DBConfig','DBNAME','ZMOS');
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
//  DataBase.Free;     //쓰레드로 기동시키기 위해서이므로 이때는 프리하면 안됨
  FCS.Free;
  FCSSocket.Free;
  DataModule1 := Nil;

end;

function TDataModule1.DupCheckTB_ACCESS_EVENT(aTimestr:string; aNodeNO:integer; aECUID, aDoorNo,
  aCardNo: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
begin

  result := False;
  stSql := 'Select * from TB_ACCESSEVENT ';
  stSql := stSql + ' where AC_DATE = ''' + copy(aTimestr,1,8) + '''';
  stSql := stSql + ' AND AC_TIME = ''' + copy(aTimestr,9,6) + '''';
  stSql := stSql + ' AND AC_NODENO = ' + intTostr(aNodeNo);
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';
  stSql := stSql + ' and DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' and CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      Sql.Text := stSql;

      try
        open
      except
        exit;
      end;

      if Recordcount > 0 then result := True;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TDataModule1.CardPermitCheck(aCardNo, aNodeNo,aECUID,
  aPermit: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
begin

  result := False;

  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''' + aPermit + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      Sql.Text := stSql;

      try
        open
      except
        exit;
      end;

      if Recordcount > 0 then  result := True;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

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

  result := False;
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      Sql.Text := stSql;

      try
        open
      except
        exit;
      end;

      if Recordcount > 0 then  result := True;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
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

  result := False;
  stSql := 'Select * from TB_FOODEVENT ';
  stSql := stSql + ' where FO_DATE = ''' + copy(aTime,1,8) + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + copy(aTime,9,6) + ''' ';
  stSql := stSql + ' and AC_NodeNO = ' + inttostr(aNodeNo) ;
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' and FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' and CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      Sql.Text := stSql;

      try
        open
      except
        exit;
      end;

      if RecordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


function TDataModule1.DupCheckTB_SUBJECTLEVEL(aSubjectCode,
  aLevelCode: String): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  result := False;
  stSql := 'select * from TB_SUBJECTLEVEL ';
  stSql := stSql + ' Where SUBJECT_CODE = :SUBJECT_CODE ';
  stSql := stSql + ' AND LEVEL_CODE = :LEVEL_CODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
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
        exit;
      end;

      if Recordcount > 0 then  result := True;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
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

function TDataModule1.ProcessExecSQL(aSql: String;bUpdateResult:Boolean=False): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
{  Result:= True;
  CoInitialize(nil);
  ExecQuery := TADOQuery.Create(nil);
  Try
    With ExecQuery do
    begin
      Connection := ADOConnection;
      if DBTYPE = 'MDB' then ADOConnection.BeginTrans;
      Close;
      SQL.Text:= sqlst;
      Try
        ExecSQL;
      Except
        if DBTYPE = 'MDB' then ADOConnection.RollbackTrans;
        Result := False;
        SQLErrorLog('DBError:'+ sqlst);
      End;
      if DBTYPE = 'MDB' then ADOConnection.CommitTrans;
    end;
  Finally
    ExecQuery.Free;
    CoUninitialize;
  End;
}   //원복시키자
  Result:= False;
  //OleInitialize(nil);
  Try
    //FCS.Enter;
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
    ExecQuery.DisableControls;
    //if DBTYPE = 'MDB' then ADOConnection.BeginTrans;
    with ExecQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
      except
      ON E: Exception do
        begin

//          ADOConnection.Connected := False;
//          ADOConnection.ConnectionTimeout := 1;
//          ADOConnection.Connected := True;
          SQLErrorLog('DBError('+ E.Message + ')' + aSql);
          
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;

          //ExecQuery.Free;
          //OleUninitialize;
          //ADOConnection.RollbackTrans;
          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;
  //if DBTYPE = 'MDB' then ADOConnection.CommitTrans;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
      SQLErrorLog('DBError:'+ aSql);
    end;
  end else
  begin
    Result:= True;
  end;
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
  aFileName:= ExeFolder + '\..\log\DBerr'+ FormatDateTIme('yyyymmdd',Now)+'.log';
  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('hh:nn:ss:zzz">"   ',Now) + #13#10 + aSQL;
  WriteLn(f,st);
  System.Close(f);
  //Critical_SaveLog.Release;
  {$I+}
end;

function TDataModule1.ProcessEventExecSQL(aSql: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
{  Result:= True;
  CoInitialize(nil);
  ExecQuery := TADOQuery.Create(nil);
  Try
    With ExecQuery do
    begin
      Connection := ADOConnectionEVENT;
      if DBTYPE = 'MDB' then ADOConnectionEVENT.BeginTrans;
      Close;
      SQL.Text:= sqlst;
      Try
        ExecSQL;
      Except
        if DBTYPE = 'MDB' then ADOConnectionEVENT.RollbackTrans;
        Result := False;
        SQLErrorLog('DBError:'+ sqlst);
      End;
      if DBTYPE = 'MDB' then ADOConnectionEVENT.CommitTrans;
    end;
  Finally
    ExecQuery.Free;
    CoUninitialize;
  End;   }     //원복시키자
  Result:= False;
  //FCS.Enter;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnectionEVENT;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
  //    SQL.Clear;
      SQL.Text:= aSql;
      try
        ExecSql;
      except
      ON E: Exception do
        begin
//          ADOConnectionEVENT.Connected := False;
//          ADOConnection.ConnectionTimeout := 1;
//          ADOConnectionEVENT.Connected := True;
          SQLErrorLog('DBError:'+ SQL.Text);
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;
          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
    //FCS.Leave;
  End;
  Result:= True; 
end;

function TDataModule1.ProcessLogExecSQL(aSql: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
{  Result:= True;
  CoInitialize(nil);
  ExecQuery := TADOQuery.Create(nil);
  Try
    With ExecQuery do
    begin
      Connection := ADOConnectionLOG;
      if DBTYPE = 'MDB' then ADOConnectionLOG.BeginTrans;
      Close;
      SQL.Text:= sqlst;
      Try
        ExecSQL;
      Except
        if DBTYPE = 'MDB' then ADOConnectionLOG.RollbackTrans;
        Result := False;
        SQLErrorLog('DBError:'+ sqlst);
      End;
      if DBTYPE = 'MDB' then ADOConnectionLOG.CommitTrans;
    end;
  Finally
    ExecQuery.Free;
    CoUninitialize;
  End; }
  Result:= False;
  //FCS.Enter;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnectionLOG;
    with ExecQuery do
    begin
      Close;
  //    SQL.Clear;
      SQL.Text:= aSql;
      try
        ExecSql;
      except
      ON E: Exception do
        begin
//          ADOConnectionLOG.Connected := False;
//          ADOConnection.ConnectionTimeout := 1;
//          ADOConnectionLOG.Connected := True;
          SQLErrorLog('DBError:'+ SQL.Text);
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;
          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.Free;
    CoUninitialize;
    //FCS.Leave;
  End;
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
    stSql := stSql + '''' + copy(Get_Local_IPAddr,1,24) + ''',';
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


function TDataModule1.GetCompanyName(aCompanyCode: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := '';
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount > 0 then
      begin
        result := FindField('CO_NAME').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TDataModule1.GetDepartName(aCompanyCode, aJijumCode,
  aDepartCode: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := '';
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount > 0 then
      begin
        result := FindField('CO_NAME').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TDataModule1.GetJijumName(aCompanyCode,
  aJijumCode: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := '';
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount > 0 then
      begin
        result := FindField('CO_NAME').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TDataModule1.GetPosiName(aCompanyCode, aPosiCode: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := '';
  stSql := 'select * from TB_POSI ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ''' + aPosiCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount > 0 then
      begin
        result := FindField('PO_NAME').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TDataModule1.CheckFireOrgin: Boolean;
var
  aCardPermit: Integer;
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin

  Result:= False;
  Exit; //화재복구 체크하지 말자 2011.04.27
  stSql := 'Select * from TB_CURRENTDAEMON ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and CU_STATECODE = ''FIREORIGIN'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount > 0 then
      begin
        if UpperCase(FindField('CU_STATEVALUE').AsString) = 'TRUE' then result := True;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


function TDataModule1.GetFdmsID(aCompanyCode, aEmCode: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := '31';
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount > 0 then
      begin
        result := inttostr(FindField('FDMS_ID').asinteger);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TDataModule1.GetDaemonVersion: integer;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''DAEMON_VER'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount > 0 then
      begin
        Try
          result := strtoint(FindField('CO_CONFIGVALUE').AsString);
        Except
          Exit;
        End;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

end.


