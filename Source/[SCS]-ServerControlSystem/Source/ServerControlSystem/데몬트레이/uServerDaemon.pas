unit uServerDaemon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, antTaskbarIcon, StdCtrls, ExtCtrls, ComCtrls,
  ToolWin, ActnList, jpeg, ScktComp, DateUtils,DB,iniFiles,
  DXServerCore, DXString, DXUnicastDataQueue, uSubForm,
  CommandArray, ADODB, LMDCustomComponent, LMDFileCtrl, Gauges,
  FolderDialog,ActiveX, OoMisc, AdPort, AdWnPort, IdThreadMgr,
  IdThreadMgrDefault, IdBaseComponent, IdComponent, IdTCPServer,
  uClientCommunication, IdFTPServer,IdFTPList,IdGlobal,IdHashCRC,FileInfo,
  uDevicemodule, uMcusocket,uDataModule1,systeminfos,Registry,
  uDisplaymodule, IdTCPConnection, IdTCPClient, Buttons,SyncObjs  ;

{$DEFINE TApdWinsockport}  //{$DEFINE TClientSocket}

type

  TMyServerThread = class(TServerClientThread)
  public
   procedure ClientExecute; override;
  end;


  TfmMain = class(TfmASubForm)
    tbi: TantTaskbarIcon;
    imlstIcons: TImageList;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    miExit: TMenuItem;
    N3: TMenuItem;
    Ver011: TMenuItem;
    Timer2: TTimer;
    ConnectTimer: TTimer;
    SendTimer: TTimer;
    RecvTimeCheck: TTimer;
    LogDeleteTime: TTimer;
    DataBaseBackupTimer: TTimer;
    SyncTimer: TTimer;
    DeviceInfoSendTimer: TTimer;
    StateCheckTimer: TTimer;
    sendClientTimer: TTimer;
    DeviceServerSendTimer: TTimer;
    DeviceClientConnectCheckTimer: TTimer;

    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mn_FormHide: TMenuItem;
    N4: TMenuItem;
    mn_Exit: TMenuItem;
    mn_Daemon: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N14: TMenuItem;
    ToolBar1: TToolBar;
    btnDaemonStart: TToolButton;
    btnDaemonRestart: TToolButton;
    btnCurrentState: TToolButton;
    ActionList1: TActionList;
    Action_Exit: TAction;
    N2: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N15: TMenuItem;
    mn_PasswdChange: TMenuItem;
    Action_PWChange: TAction;
    N16: TMenuItem;
    N17: TMenuItem;
    Action_DaemonStart: TAction;
    Action_DaemonRestart: TAction;
    Menu_ImageList: TImageList;
    Image1: TImage;
    Action_CurrentState: TAction;
    StatusBar1: TStatusBar;
    ServerSocket1: TServerSocket;
    Action_DaemonStop: TAction;
    DXUnicastDataQueue1: TDXUnicastDataQueue;
    RSERVER1: TDXServerCore;
    N11: TMenuItem;
    mn_Device: TMenuItem;
    N13: TMenuItem;
    N18: TMenuItem;
    mn_Config: TMenuItem;
    N20: TMenuItem;
    Action_AttendConfig: TAction;
    N21: TMenuItem;
    N22: TMenuItem;
    FileCtrl: TLMDFileCtrl;
    ADOfdmsConnection: TADOConnection;
    ADOfdms: TADOQuery;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    mn_AlarmDevice: TMenuItem;
    mn_FoodDevice: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    mn_sensor: TMenuItem;
    FoodServer: TDXServerCore;
    DXUnicastDataQueue2: TDXUnicastDataQueue;
    FirmWareServer: TDXServerCore;
    DXUnicastDataQueue3: TDXUnicastDataQueue;
    ATServer: TDXServerCore;
    DXUnicastDataQueue4: TDXUnicastDataQueue;
    ADOBackupQuery: TADOQuery;
    TblImport: TADOQuery;
    QryInsert: TADOQuery;
    FolderDialog1: TFolderDialog;
    pan_gauge: TPanel;
    Ga_Tot: TGauge;
    Label1: TLabel;
    ga_Table: TGauge;
    lbl_Table: TLabel;
    N33: TMenuItem;
    DB1: TMenuItem;
    DB2: TMenuItem;
    ADOfdmsExec: TADOQuery;
    N32: TMenuItem;
    mn_CardReaderServer: TMenuItem;
    mn_CRSMonitoring: TMenuItem;
    CardReaderSever: TDXServerCore;
    DXUnicastDataQueue5: TDXUnicastDataQueue;
    RelayCardServerQuery: TADOQuery;
    ADOQuery1: TADOQuery;
    SentenceSock: TApdWinsockPort;
    mn_Fire: TMenuItem;
    mn_FireRecovery: TMenuItem;
    mn_AlarmReader: TMenuItem;
    sentenceADOQuery: TADOQuery;
    N27: TMenuItem;
    mn_DeviceSetting: TMenuItem;
    mn_InOutAdmin: TMenuItem;
    mn_InOutReader: TMenuItem;
    mn_InOutGroup: TMenuItem;
    RSERVER: TIdTCPServer;
    IdThreadMgrDefault1: TIdThreadMgrDefault;
    mem_ComList: TMemo;
    N28: TMenuItem;
    PC1: TMenuItem;
    IdFTPServer: TIdFTPServer;
    EST2: TMenuItem;
    DeviceServer1: TIdTCPServer;
    DeviceServer2: TIdTCPServer;
    DeviceServer3: TIdTCPServer;
    IdThreadMgrDefault2: TIdThreadMgrDefault;
    IdThreadMgrDefault3: TIdThreadMgrDefault;
    IdThreadMgrDefault4: TIdThreadMgrDefault;
    N34: TMenuItem;
    N35: TMenuItem;
    FTP1: TMenuItem;
    AdoConnectCheckTimer: TTimer;
    DaemonRestartTimer: TTimer;
    FireDoorOpenTimer: TTimer;
    EST1: TMenuItem;
    DoorAllOpenTimer: TTimer;
    ADOfdmsQuery: TADOQuery;
    mn_DBAllBackup: TMenuItem;
    DB_AllRestore: TMenuItem;
    SaveDialog1: TSaveDialog;
    btnMonitoring: TToolButton;
    btn_TimeAsync: TToolButton;
    btn_state: TToolButton;
    ToolButton1: TToolButton;
    mn_login: TMenuItem;
    mn_Logout: TMenuItem;
    N36: TMenuItem;
    Action_Monitoring: TAction;
    N6: TMenuItem;
    mn_Report: TMenuItem;
    N12: TMenuItem;
    mn_AccessReport: TMenuItem;
    mn_manager: TMenuItem;
    mn_DoorManager: TMenuItem;
    mn_AllDoorClose: TMenuItem;
    mn_AllDoorOpen: TMenuItem;
    mn_dbConnectTest: TMenuItem;
    mn_NotUseCardDelete: TMenuItem;
    N19: TMenuItem;
    mn_Employee: TMenuItem;
    mn_DoorGrade: TMenuItem;
    mn_CardManage: TMenuItem;
    mn_BasicCode: TMenuItem;
    CardAutoDownTimer: TTimer;
    DisplayTimer: TTimer;
    mn_display: TMenuItem;
    mn_BarCode: TMenuItem;
    BarCodeConnectCheckTimer: TTimer;
    SoundClient: TClientSocket;
    mn_BarcodeReConnect: TMenuItem;
    mn_Sound: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SoundClient2: TApdWinsockPort;
    procedure miExitClick(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miShowClick(Sender: TObject);
    procedure bt_HideClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mn_FormHideClick(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure Action_PWChangeExecute(Sender: TObject);
    procedure Action_DaemonStartExecute(Sender: TObject);
    procedure Action_CurrentStateExecute(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ConnectTimerTimer(Sender: TObject);
    procedure Action_DaemonStopExecute(Sender: TObject);
    procedure SendTimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Action_DaemonRestartExecute(Sender: TObject);
    procedure ServerSocket1Accept(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1GetThread(Sender: TObject;
      ClientSocket: TServerClientWinSocket;
      var SocketThread: TServerClientThread);
    procedure RSERVER1NewConnect(ClientThread: TDXClientThread);
    procedure LogDeleteTimeTimer(Sender: TObject);
    procedure DataBaseBackupTimerTimer(Sender: TObject);
    procedure RecvTimeCheckTimer(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure N13Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure Action_AttendConfigExecute(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure CommandArrayCommandsTCommand2Execute(Command: TCommand;
      Params: TStringList);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SyncTimerTimer(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure mn_sensorClick(Sender: TObject);
    procedure mn_FoodDeviceClick(Sender: TObject);
    procedure DeviceInfoSendTimerTimer(Sender: TObject);
    procedure FoodServerNewConnect(ClientThread: TDXClientThread);
    procedure FirmWareServerNewConnect(ClientThread: TDXClientThread);
    procedure ATServerNewConnect(ClientThread: TDXClientThread);
    procedure DB1Click(Sender: TObject);
    procedure DB2Click(Sender: TObject);
    procedure StateCheckTimerTimer(Sender: TObject);
    procedure CardReaderSeverNewConnect(ClientThread: TDXClientThread);
    procedure mn_CardReaderServerClick(Sender: TObject);
    procedure mn_CRSMonitoringClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand3Execute(Command: TCommand;
      Params: TStringList);
    procedure FormShow(Sender: TObject);
    procedure mn_AlarmReaderClick(Sender: TObject);
    procedure SentenceSockTriggerAvail(CP: TObject; Count: Word);
    procedure mn_FireRecoveryClick(Sender: TObject);
    procedure mn_DeviceSettingClick(Sender: TObject);
    procedure mn_InOutReaderClick(Sender: TObject);
    procedure mn_InOutGroupClick(Sender: TObject);
    procedure RSERVERExecute(AThread: TIdPeerThread);
    procedure RSERVERConnect(AThread: TIdPeerThread);
    procedure RSERVERDisconnect(AThread: TIdPeerThread);
    procedure PC1Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure sendClientTimerTimer(Sender: TObject);
    procedure DeviceServer1Execute(AThread: TIdPeerThread);
    procedure DeviceServer1Disconnect(AThread: TIdPeerThread);
    procedure DeviceServer1Connect(AThread: TIdPeerThread);
    procedure DeviceServer1Exception(AThread: TIdPeerThread;
      AException: Exception);
    procedure DeviceServerSendTimerTimer(Sender: TObject);
    procedure DeviceClientConnectCheckTimerTimer(Sender: TObject);
    procedure FTP1Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);
    procedure DaemonRestartTimerTimer(Sender: TObject);
    procedure FireDoorOpenTimerTimer(Sender: TObject);
    procedure EST1Click(Sender: TObject);
    procedure DoorAllOpenTimerTimer(Sender: TObject);
    procedure HolidaySendTimerTimer(Sender: TObject);
    procedure mn_DBAllBackupClick(Sender: TObject);
    procedure CommandArrayCommandsTMONITORExecute(Command: TCommand;
      Params: TStringList);
    procedure mn_loginClick(Sender: TObject);
    procedure mn_LogoutClick(Sender: TObject);
    procedure Action_MonitoringExecute(Sender: TObject);
    procedure mn_AllDoorCloseClick(Sender: TObject);
    procedure mn_AllDoorOpenClick(Sender: TObject);
    procedure btn_TimeAsyncClick(Sender: TObject);
    procedure btn_stateClick(Sender: TObject);
    procedure mn_AccessReportClick(Sender: TObject);
    procedure mn_dbConnectTestClick(Sender: TObject);
    procedure mn_NotUseCardDeleteClick(Sender: TObject);
    procedure CommandArrayCommandsTSendDataExecute(Command: TCommand;
      Params: TStringList);
    procedure mn_EmployeeClick(Sender: TObject);
    procedure mn_BasicCodeClick(Sender: TObject);
    procedure mn_DoorGradeClick(Sender: TObject);
    procedure CardAutoDownTimerTimer(Sender: TObject);
    procedure mn_displayClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure mn_BarCodeClick(Sender: TObject);
    procedure BarCodeConnectCheckTimerTimer(Sender: TObject);
    procedure SoundClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure BitBtn1Click(Sender: TObject);
    procedure SoundClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure SoundClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure SoundClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure mn_BarcodeReConnectClick(Sender: TObject);
    procedure mn_SoundClick(Sender: TObject);
    procedure mn_SoundVolumeSettingClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SoundClient2TriggerAvail(CP: TObject; Count: Word);
    procedure SoundClient2WsConnect(Sender: TObject);
    procedure SoundClient2WsDisconnect(Sender: TObject);
    procedure SoundClient2WsError(Sender: TObject; ErrCode: Integer);
  private
    { Private declarations }
    bDaemonRestart : Boolean; //데몬 재시작중
    L_bDaemonStop : Boolean;  //데몬 스톱
    bClose : Boolean;
    bStop : Boolean;
    bDeviceInfoSend : Boolean;  //Device Info 송신 중...
    FLogined: Boolean;
    //AttendChangeCount : integer; //근무 교대 건수
    AttendConfigCodeList : TStringList; //근태코드 리스트
    AttendConfigInFromTimeList : TStringList; //출입가능시작 시간
    AttendConfigInToTimeList : TStringList; //출입가능끝 시간
    AttendConfigWorkTimeList : TStringList; //근무 시작 시간
    AttendConfigOutTimeList : TStringList; //퇴근 시간
    AttendConfigExtendTimeList : TStringList; //연장근무 시간
    AttendConfigNightTimeList : TStringList; //야간근무 시간
    AttendConfigSInFromTimeList : TStringList; //반휴일 출입가능시작 시간
    AttendConfigSInToTimeList : TStringList; //반휴일 출입가능끝 시간
    AttendConfigSWorkTimeList : TStringList; //반휴일 근무 시작 시간
    AttendConfigSOutTimeList : TStringList; //반휴일 퇴근 시간
    AttendConfigSExtendTimeList : TStringList; //반휴일연장근무 시간
    AttendConfigSNightTimeList : TStringList; //반휴일야간근무 시간
    AttendConfigHInFromTimeList : TStringList; //공휴일 출입가능시작 시간
    AttendConfigHInToTimeList : TStringList; //공휴일 출입가능끝 시간
    AttendConfigHWorkTimeList : TStringList; //공휴일 근무 시작 시간
    AttendConfigHOutTimeList : TStringList; //공휴일 퇴근 시간
    AttendConfigHExtendTimeList : TStringList; //공휴일 연장근무 시간
    AttendConfigHNightTimeList : TStringList; //공휴일 야간근무 시간
    L_YesterDayStandTime : string;           //어제날짜 기준 시간
    L_ToDayStandTime : string;           //오늘날짜 기준 시간
    L_nSaturday : integer;         //0:휴무,1:반휴일,2:평일
    L_nDeviceType : integer;       //0:업데이트,1:카드리더,2:버튼
    L_nATType : integer;           //0:고정근무1:사원별,2:교대근무
    L_nNonBackType : integer;           //0:미복귀시퇴근처리,1:미복귀시정상퇴근

    L_bDeviceSettingShow : Boolean;  //기기설정 화면
    L_bReaderSettingShow : Boolean;  //리더 설정 화면

    DeviceServerPort1 : integer;           //기기별 서버포트 1
    DeviceServerPort2 : integer;           //기기별 서버포트 2
    DeviceServerPort3 : integer;           //기기별 서버포트 3

    DaemonServerIP : string;               //데몬서버 IP
    DaemonServerPort : string;             //데몬서버 Port
    AttendServerPort : string;             //근태서버 Port
    FoodServerPort : string;               //식수서버포트
    FTPServerPort : String;                //FTP서버 포트
    DaemonAccecptClientCount : integer;    //데몬서버에 접속할 수 있는 클라이언트 갯수
    DaemonLogFullData : string;  //ACK 데이터 까지 로그 남길것인지
    DaemonLogDeleteDay : integer; //로그 데이터 몇일전 데이터를 날릴것인지
    DataBaseAutoBackup : string;  //자동백업 사용유무
    DataBaseBackupDir : string;   //백업 디렉토리
    DataBaseBackupTime : string;  //백업 시작 시간
    DataBaseLastBackupDate : string; //마지막 백업 시간
    DataBaseBackupCycle : integer; //백업 사이클
    L_nAccessDeleteDay : integer;     //출입 이벤트 데이터 보관일수
    L_nAttendDeleteDay : integer;     //근태 이벤트 데이터 보관일수
    L_nFoodDeleteDay: integer;        //식수 이벤트 데이터 보관일수
    L_nPatrolDeleteDay : integer;     //방범 이벤트 데이터 보관일수

    L_nCardSendCount : Integer; //카드 송신 건수
    L_nCardAckCount : Integer;  //카드 수신 건수

    L_nFdmsCardLength : integer; //성현지문리더 카드길이

    FoodConfigCodeList : TStringList; //식수 코드 리스트
    FoodConfigStartList : TStringList; // 식수코드 시작시간
    FoodConfigEndList : TStringList;  //식수코드 종료 시간

    bCURRENTSTATE : Boolean;   //실시간 송수신 현황조회 여부
    bCARDSERVERSTATE : Boolean; //카드서버 송수신 현황조회 여부
    bCardDownLoad: Boolean; //카드 다운로드 유무

    procedure DaemonConfigWriting;
    procedure RealDataShow(aIp,aECUID,aGubun,aCmd,aData:string);    //실시간 송수신 내역 확인
    procedure SetLogined(const Value: Boolean);
    Procedure MDIChildShow(FormName:String);
    Procedure MDIChildGradeShow(FormName:String;aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
    Function UpdateTB_DEVICECARDNO(OrgState,NewState:String):Boolean;
    Function UpdateTB_DEVICECARDNOCardNoState(aNodeNo,aEcuID,aCardNo,NewState:String):Boolean;
    Function UpdateTB_FTPLISTSTATE(aNodeNo,aEcuID,aState:string):Boolean;
    Function UpdateTB_DEVICECARDNODeviceRcvAck(aNodeNo,aEcuID,aOldState,aNewState:string):Boolean;

    Function GetPostGresqlBin : string; //PostgreSql 데이터베이스 설치 디렉토리
    Function DeleteTB_LOWDATA(aDate:string):Boolean;
    Function DataBaseBackup(bFull:Boolean):Boolean;
    Function FileDataBaseBackup(bFull:Boolean):Boolean;
    Function PGAllDataBackup(aBackupDir:string):Boolean;
    Function MSSQLAllDataBackup(aBackupDir:string):Boolean;
    Function MDBAllDataBackup(aBackupDir:string):Boolean;
    Function TableFileBackup(aBackupDir,aTableName:string):Boolean;
    Function FileDBRestor(aImportFileName:string):Boolean;
    Function MSSQLDBBackup(bFull:Boolean):Boolean;
    Function MDBBackup:Boolean;
    Function MSSQLLOMOSTOFILE:Boolean;
    Function MSSQLEVENTTOFILE(bFull:Boolean):Boolean;


    Function AdoConnectCheck:Boolean;
    Function DupCheckTB_ALARMEVENT(aTime,aNodeNo,
                        aEcuID,aMsgNo:string):Boolean;
    Function DupCheckTB_AlarmShow(aNodeNo,
                                  aEcuID,
                                  aSubClass,
                                  aSubAddr,
                                  aZoneCode,
                                  aPortNo,
                                  aStatus:string):Boolean;
    Function DeleteTable :Boolean;
    Function UpdateTB_CURRENTDAEMON(aCode,aValue:String):Boolean;
    Function InsertTB_ALARMEVENT(aTime,aNodeNo,aEcuID,aMsgNo,
                      aSubClass,aSubAddr,aZoneCode,aMode,aPortNo,
                      aStatus,aState,aOper,aNewStateCode:string):Boolean;
    Function InsertTB_SENSOREVENT(aTime,aNodeNo,aEcuID,aMsgNo,
                      aSubClass,aSubAddr,aZoneCode,aMode,aPortNo,
                      aStatus,aState,aOper:string):Boolean;
    Function InsertTB_ALARMSHOW(aNodeNo,aEcuID,aSubClass,aSubAddr,
                          aZoneCode,aPortNo,aStatus,aMode,
                          aDate,aTime,aMsgNo,aState,aOper,
                          aCheckOk,aCheckMsg,aUpdateOper:string):Boolean;
    Function UpdateTB_ALARMSHOW(aNodeNo,aEcuID,aSubClass,aSubAddr,
                          aZoneCode,aPortNo,aStatus,aMode,
                          aDate,aTime,aMsgNo,aState,aOper,
                          aCheckOk,aCheckMsg,aUpdateOper:string):Boolean;

    Function UpdateTB_ACCESSDEVICE_Connect(aNodeNo,aECUID,aConnected:string):Boolean;
    Function UpdateTB_ACCESSDEVICEHoSend(aNodeNo,aECUID,aHoSend:string):Boolean;

    //**************************************
    // 환경설정
    //**************************************
    Function SentenceRelayConfigSet:Boolean;
    Function LoadAlarmConfig : Boolean;
    Function LoadFoodConfig : Boolean;
    Function LoadAttendConfig : Boolean;
    Function DaemonConfigSet : Boolean;
    Function GetMultiDaemonConfig(var aDaemonServerIP,aDaemonServerPort,aAttendServerPort,aFoodServerPort,aFTPServerPort:string):Boolean;
    Function DaemonLogConfigSet : Boolean;
    Function DataBaseConfigSet : Boolean;
    Function MCUCommonConfigSet : Boolean;
    procedure InitConfigSet;
    procedure RelayConfigSet;
    procedure SetVisibleMenue;
    Function  UpdateTB_PROTRAMIDVisible(aCode,aValue:string):Boolean;
    Function fdmsConnect:Boolean; //fdms Connect
    Function fdmsUserRelaySend(aEmCode,aFDMS_ID,aEM_NAME,aHandPhone,aDEPART_NAME,aPO_NAME,aCA_CARDNO,aMode:string):Boolean;
    Function fdmsUserRelayDeleteSend(aFDMS_ID,aMode:string):Boolean;
    Function fdmsUserRelay:Boolean;
    Function fdmsGateRelay:Boolean;
    Function fdmsDoorRelaySend(aFDMS_ID,aDOORNONAME:string):Boolean;
    Function CheckFdmsUser(aFDMS_ID:string):Boolean;
    Function UpdateFdmsUser(aEmCode,aFDMS_ID, aEM_NAME,aHandPhone, aDEPART_NAME, aPO_NAME,aCA_CARDNO,aMode:string):Boolean;
    Function InsertFdmsUser(aEmCode,aFDMS_ID, aEM_NAME,aHandPhone, aDEPART_NAME, aPO_NAME,aCA_CARDNO,aMode:string):Boolean;

    //**************************************
    //기기정보 메모리 로드
    //**************************************
    Function LoadNode :Boolean;  //노드를 로드 한다.
    Function UnLoadNode :Boolean;  //노드를 언로드 한다.
//    Function LoadDeviceClientNode :Boolean;  //클라이언트 모드의 기기를 로드 한다.
//    Function UnLoadDeviceClientNode :Boolean;  //클라이언트 모드의 기기를 언로드 한다.
    Function LoadECU : Boolean; //ECU를 로드한다.
    Function UnLoadECU : Boolean; //ECU를 언로드한다.
//    Function LoadDeviceClientECU : Boolean; //클라이언트 모드의 ECU를 로드한다.
//    Function UnLoadDeviceClientECU : Boolean; //클라이언트 모드의 ECU를 로드한다.
    Function LoadInOutReader : Boolean; //입퇴실 리더 정보를 로드 한다.
    Function LoadDisplay :Boolean; //디스플레이 정보를 로드 한다.
    Function LoadDisplayMessage :Boolean; //디스플레이 정보를 로드 한다.
    Function UNLoadDisplay : Boolean;
    Function LoadBarCode :Boolean; //바코드 정보를 로드 한다.
    Function UNLoadBarCode : Boolean;
    Function LoadSoundCode :Boolean; //사운드코드 정보를 로드 한다.

    procedure DeviceServer1Stop;
    procedure DeviceServer2Stop;
    procedure DeviceServer3Stop;


    //***************************************
    //MCU와 통신처리 하기 위한 수신 함수
    //***************************************
    Procedure CommNodeReceve(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //MCU에서 Recv 되는 모든 데이터를 접속되어 있는 클라이언트에 전송
    Procedure CommNodeRcvInvalidDevice(Sender: TObject;  ReceiveData: string ;NodeNO : integer); //등록되지 않은 기기에서 데이터 올라오는 경우 처리

    //****************************************
    //MCU에서 수신한 데이터 파싱 처리 함수
    //****************************************
    Procedure DeviceRcvRegCardData(Sender: TObject;  ReceiveData: string;NodeNO : integer); //카드 등록 응답 데이타
    //메모리지움버튼 클릭시 처리
    Procedure DeviceRegisterClear(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //원격제어 응답 데이타
    //AlarmEvent
    Procedure DeviceRcvAlarmData(Sender: TObject;  cmd,ReceiveData: string;NodeNO : integer); //알람데이타
    procedure DeviceRcvTellogData(Sender: TObject;  ReceiveData: string;NodeNO : integer);
    Procedure DeviceRcvInitAckData(Sender: TObject;  ReceiveData: string;NodeNO : integer); //장비등록 등답데이타
    Procedure DeviceRcvRemoteAckData(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //원격제어 응답 데이타
    Procedure DeviceRcvFTPProcessData(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //원격제어 응답 데이타
    Procedure DeviceRcvCardReadData(Sender: TObject;  ReceiveData: string;NodeNO : integer); // 카드 리딩 데이타
    //상태변경 데이터 처리 (사용안함)
    Procedure DeviceRcvChangeDoorData(Sender: TObject;  ReceiveData: string; NODENO : integer);//문상태 변경 데이타
    //문제어 데이터 처리 (사용안함)
    Procedure DeviceRcvDoorControl(Sender: TObject;  ReceiveData: string;NodeNO : integer);//문제어 응답 데이타
    Procedure DeviceRcvDoorSetup(Sender: TObject;  ReceiveData: string;NodeNO : integer); //문정보 설정 응답 데이타
    Procedure DeviceNotDefineData(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //정의 않된 프로토콜 데이타
    Procedure DeviceErorData(Sender: TObject;  ReceiveData: string;NodeNO : integer); // ERROR 데이터
    procedure DeviceRcvScheduleData(Sender: TObject;  ReceiveData: string;NodeNO : integer); //스케줄 데이터 등록 처리
    procedure DeviceConnected(Sender: TObject;  Value:Boolean; NodeNo : integer;aECUID:string);
    //사용안함
    procedure DoorMangageModeChange(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorManageType:TDoorManageMode); //출입문 운영모드 변경
    //사용안함
    procedure DoorPNModeChange(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorPNType:TDoorPNMode); //출입문 운영모드 변경
    //사용안함
    procedure DoorStateChanged(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorStateType:TDoorState); //출입문 상태 변경

    procedure DeviceCardModeChange(aDeviceID:string;aMode:Char); //'P' : Positive 'N': Negative

    procedure DeviceWatchModeChange(Sender: TObject; NodeNo : integer;aEcuID:string;aWachMode:TWatchMode);
    procedure DoorModeChanged(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorState);

    //*****************************************
    //수신한 데이터  DB에 데이터 처리 함수
    //*****************************************
    Function ProcessFoodData(aTime, aCardNo, aECUID:string; aNodeNO:integer; aReaderNo,aFoodCode,aPermit:char):Boolean;
    Function GetEmCode(aCardNo:string;var aCompanyCode,aEmCode:string):Boolean;
    //근태처리 함수
    Function GetATInCode(aAttendCode,aTime:string;nWeekCode:integer):string; //출근타입에 대한 출근코드 가져오기
    Function GetATOutCode(aAttendCode,aTime:string;nWeekCode:integer;bYesterDay:Boolean):string; //출근타입에 대한 출근코드 가져오기
    Function GetAttendCode(aTime,aCompanyCode,aEMCode:string;nWeekCode:integer):string; //해당일자의 출근타입 가져오자
    Function GetOutAttendCode(aDate,aCompanyCode,aEMCode:string):string; //해당근태일자의 출근 근태 타입을 가져오자.
    Function GetEMPLOYEEATCode(aCompanyCode,aEMCode:string):string;
    Function GetChangeATCode(aTime:string;nWeekCode:integer):string;
    Function GetUpdateAttendType(aTime,aCompanyCode,aEMCode:string;dtYesterDay:TDatetime):string;

    Function InsertATTENDINCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer):Boolean;
    Function InsertATTENDOutCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;
    Function InsertATTENDLEAVECode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;
    Function InsertATTENDBACKCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;

    Function ProcessAttendData1(aTime:String;aCardNo:String):Boolean; // 업데이트 방식
    Function ProcessAttendData2(aTime:String;aCardNo:String;aAttendCode:Char):Boolean; // 리더기 번호 또는 버튼 방식 처리
    Function GetEmployeeInfo(aCardNo:string;bPassNo:Boolean; var aCompanyCode,aEMCode:string ):Boolean;

    Function PorcessAlaramData(aData : string) : Boolean;


    function UpdateRomVer(aNodeNO,aECUID,aRomVer:string):Boolean;
    function UpdateTB_DOORState(aNodeNo,aECUID,aDoorNo:string;aManageType,aPNType,aDoorState:string):Boolean;
    function UpdateTB_ALARMMode(aNodeNo,aECUID,aMode:string):Boolean;

    Function InsertTB_SERVERCARDRELAYHIS(aDate,aRelayNo,aCardData,aClientIP:string):Boolean;

    Function UpdateTB_INOUTCOUNTADD(aDate,aNodeNo,aECUID,aDoorNo,aInOutCount:string):Boolean;
    Function CheckTB_INOUTCOUNT(aDate, aNodeNo, aECUID, aDoorNo:string):Boolean;
    //*****************************************
    //APPLICATION 과 통신하기 위한 함수
    //*****************************************
    procedure RcvFromClient(aClientIP,ast:string);   //클라이언트에서 수신된 데이터 처리
    function  CheckClientDataPacket(aData:String; var bData:String):string;
    procedure ATRcvFromClient(aClientIP,ast:string);   //클라이언트에서 수신된 근태데이터 처리
    procedure FDRcvFromClient(aClientIP,ast:string);   //클라이언트에서 수신된 근태데이터 처리
    procedure RcvFromFirmWareClient(aClientIP,ast:string); //펌웨어용 수신된 데이터 처리
    procedure RcvCardReaderServer(aClientIP,ast:string);
    procedure DeviceSTATECHECK(aDeviceID:string);
    procedure NodeStateAllCheckSend;
    procedure DeviceStateAllCheckSend;
    procedure AlarmStateAllCheckSend;
    procedure DoorStateAllCheckSend;

    //*****************************************
    //기기 정보 전송 함수
    //*****************************************
    function NodeInfo_Send : Boolean;
    function DoorInfo_Send : Boolean;
    function ReaderInfo_Send : Boolean;
    function PortInfo_Send : Boolean;
    function ScheduleInfo_Send : Boolean;
    function ECUInfo_Send(aNodeNo:string):Boolean;
    function ECUInfo_Device_Send(aNodeNo,aUseEcu:string):Boolean;
    function LinKusInfo_Send(aNodeNo,aEcuID:string):Boolean;
    function LinKusIDInfo_Device_Send(aNodeNo, aEcuID,aData:string):Boolean;
    function LinKusMuxTelInfo_Device_Send(aNodeNo, aEcuID,aData:string):Boolean;
    function SystemInfo_Send(aNodeNo, aEcuID,aPowerON,aInDelay,aOutDelay,aSystemType1,aSystemType2,aLocation:string ):Boolean;
    function RegCardReaderType(aNodeNo,aEcuID,aReaderType:string):Boolean;
    function DoorInfo_Device_Send(aNodeNo,aEcuID,aDoorNo,aDoorType,aScheduleUse,aDoorControlTime,aDoorMode,aFire:string):Boolean; //출입문 정보 기기 전송
    function ReaderInfo_Device_Send(aNodeNo,aEcuID,aReaderNo,aDoorNo,aReaderUse:string):Boolean;
    function PortInfo_Device_Send(aNodeNo,aEcuID,aPortNo,aWatchType,aDelayUse,aDelayTime,aLocation:string):Boolean;

    //알람모드 변경
    function ChangeAlarmMode(aNodeNo,aEcuID,aMode: string): Boolean;

    function GetSystemDelayInfo(aNodeNo, aEcuID:string;var nInDelay,nOutDelay:integer):Boolean;
    function GetAlarmNo(aNodeNo, aEcuID:string):integer;
    function UpdateTB_DOORACK(aNodeNO,aEcuID,aDoorNo,aAck:string):Boolean;
    function UpdateTB_READERACK(aNodeNO,aECUID,aReaderNo,aAck:string):Boolean;
    function UpdateTB_AlarmDeviceAck(aNodeNo,aEcuID,aAck:string):Boolean;
    function UpdateTB_ACCESSDEVICEACK(aNodeNo,aEcuID,aAck:string):Boolean;
    function UpdateTB_ZONEDEVICEACK(aNodeNo,aEcuID,aPortNo,aAck:string):Boolean;
    function UpdateTB_DEVICESCHEDULEACK(aNodeNo,aEcuID,aDoorNo,aAck:string):Boolean;
    function UpdateTB_DEVICECARDNOACK(aNodeNo,aEcuID,aAck:string):Boolean;


    Function GetCheckFoodPermit(aYear,aMonth,aDay,aFoodCode,aCardNo:string):char;
    Function CheckHolidy(aYear,aMonth,aDay:string):Boolean;
    //*****************************************
    // 등록 데이터 응답 처리
    //*****************************************
    procedure RcvCardType(aNodeNO,aECUID,aData: string); //카드리더 타입 등록
    procedure RcvCR(aNodeNO,aECUID,aData: String);       //카드리더 등록응답
    Procedure RcvUsedDevice(aNodeNo,aData,aRegGubun: String); // ECU 등록 응답
    procedure RcvDeviceID(aNodeNO,aECUID,aData: string); //아이디 등록 응답
    procedure RcvLinkusId(aNodeNO,aECUID,aData: string); //방범아이디 등록 응답
    procedure RcvTellNo(aNodeNO,aECUID,aData: string); //전화번호 등록 응답
    procedure RcvLinkusTelNo(aNodeNO,aECUID,aData: string); //방벙 MuxTelNo 등록 응답
    procedure RcvSysinfo(aNodeNO,aECUID,aData: string); // ECU System Info 등록 응답
    procedure RcvPort(aNodeNO,aECUID,aData: String); //포트 등록 응답


    //*****************************************
    // 카드서버데이터 전송
    //*****************************************
    Function GetRelayNo(aRelayNo:integer;var aNodeNo,aECUID,aCardReaderNo:string):Boolean;
    procedure SendDeviceCardNo(aRelayNo:integer;aCardData:string);
  private
    //*****************화재연동
    L_stFireStatus : string; //화재감지상태값
    L_bFireAllOpen : Boolean; //화재시 전체개방유무
//    L_bFirstFire : Boolean;   //처음화재발생유무
    L_bFireRecoverUse : Boolean; //화재전체복구 사용유무

    procedure FireConfigSet;
  private
    //ServerControlSystem
    L_bBarCodeChecking : Boolean; //바코드 접속상태 체크중
    L_bDisplayTimerSending : Boolean;
    L_bSoundReply : Boolean;      //Sound 응답 체크
    L_bSoundConnect : Boolean;    //Connect 체크
    DisplayDataList : TStringList;
    procedure SCSConfigSet;
    Function GetSCSAuthentication(aTime,aNodeNo,aECUID,aDoorNo,aCardNo:string;
             var aEmCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,
             aEmName,aCompanyName,aJijumName,aDepartName,aPosiName:string):integer;
    Function KyungHeeServerConnect:Boolean;
    Function GetEmpNoFromCardNo(aCardNO:string;
             Var aSeq:string):string;
    Function CheckKyungHeeEmployee(aEmpNo,aSeq:string;
             var aCompanyCode,aJijumCode,aDepartCode,aPosiCode,
             aEmName,aCompanyName,aJijumName,aDepartName,aPosiName:string):integer;
    Function LocalServerCheckKHUEmployee(aEmpNo,aSeq:string;
             var aCompanyCode,aJijumCode,aDepartCode,aPosiCode,
             aEmName,aCompanyName,aJijumName,aDepartName,aPosiName:string):integer;

    Function InsertLocalSEAT_USER_VIEW(aPID,aUSERNAME,aUSERPWD,
             aPAT_TYPE_DESC,aPAT_TYPE,aDEPT_NAME,aDEPT_CODE,
             aCARD_ISSUE_CNT,aBEGIN_DATE,aEND_DATE,aDATE_EXPRD,
             aLOGN_OVER,aLastUseDate:string):Boolean;
    Function UpdateLocalSEAT_USER_VIEW_LastUseDate(aPID,aLastUseDate:string):Boolean;

    procedure ShowAccessEvent(aSCSResult, aAuthType, aTimestr,
          aNodeNo,aECUID,aDoorNo, aReaderNo, aCardNo, aEmName,
          aCompanyName, aJijumName, aEmCode,aPosiName:string);

  private
    FOracleTCS : TCriticalSection;
    SoundClient1: TClientSocket;
    L_bOracleLog : Boolean ;
    //KTBIZMEKA 연동
    Function KTBizmekaServerConnect:Boolean;
    Function GetDoorNo(aNodeNo, aECUID, aDoorNo:string):string;
    Function CheckKTBizMeka(aCardNo,aKTBizMekaDoorNo:string):integer;
    Function CheckKTBizMekaII(aCardNo,aKTBizMekaDoorNo:string):integer;
    Function CheckKTBizMekaIII(aCardNo,aKTBizMekaDoorNo:string):integer;
    Function CheckBarCodeSystem(aCardNo,aKTBizMekaDoorNo,aNodeNo,aEcuNo,aDoorNo:string):integer;
    Function SendDisPlay( aNodeNo, aECUID, aDoorNo,aAuthType:string): Boolean;
    Function GetDisplayDevice(aNodeNo, aECUID, aDoorNo:string):TdmDisplay;
    Function SoundPlay(aNodeNo,aEcuNo,aDoorNo,aSound:string):Boolean;
    Function GetSoundInfo(aNodeNo,aEcuID,aDoorNo:string; var aSoundIP,aSoundPort:string):Boolean;
    Function SoundVolumSetting(aIP,aPort,aVolume:string):Boolean;

    Procedure RcvBarCodeData(Sender: TObject;aBarCode,aNodeNo,aEcuID,aDoorNo,aReaderNo:string); //바코드 입력 데이터
  private
    //*****************FTPServer DownLoad
    FTPSockList : TStringList;
    SockNo : integer;
    bFTPDownLoad : Boolean; //FTPDownLoad 중이면 다음 작업은 수행하지 말자.
    bFTPSendProcess : Boolean;
    bFtpSendCheck : Boolean; //FTP Send Check
    procedure FTPServerCreate;
    procedure IdFTPServer1UserLogin( ASender: TIdFTPServerThread; const AUsername, APassword: string; var AAuthenticated: Boolean ) ;
    procedure IdFTPServer1ListDirectory( ASender: TIdFTPServerThread; const APath: string; ADirectoryListing: TIdFTPListItems ) ;
    procedure IdFTPServer1RenameFile( ASender: TIdFTPServerThread; const ARenameFromFile, ARenameToFile: string ) ;
    procedure IdFTPServer1RetrieveFile( ASender: TIdFTPServerThread; const AFilename: string; var VStream: TStream ) ;
    procedure IdFTPServer1StoreFile( ASender: TIdFTPServerThread; const AFilename: string; AAppend: Boolean; var VStream: TStream ) ;
    procedure IdFTPServer1RemoveDirectory( ASender: TIdFTPServerThread; var VDirectory: string ) ;
    procedure IdFTPServer1MakeDirectory( ASender: TIdFTPServerThread; var VDirectory: string ) ;
    procedure IdFTPServer1GetFileSize( ASender: TIdFTPServerThread; const AFilename: string; var VFileSize: Int64 ) ;
    procedure IdFTPServer1DeleteFile( ASender: TIdFTPServerThread; const APathname: string ) ;
    procedure IdFTPServer1ChangeDirectory( ASender: TIdFTPServerThread; var VDirectory: string ) ;
    procedure IdFTPServer1CommandXCRC( ASender: TIdCommand ) ;
    procedure IdFTPServer1DisConnect( AThread: TIdPeerThread ) ;
    procedure IdFTPServer1Connect( AThread: TIdPeerThread ) ;

    Function UseFTPDevice(aNodeNo,aEcuID:string):Boolean;//FTP 사용 가능한 기기인지 체크
//    Function FTPDownLoad(aNodeNo,aEcuID:string):Boolean;
    Function CheckFTPDownLoadList: Boolean;
    Function FTPDownLoadStart:Boolean;
    Function DeviceFTPPushStart(aNodeNo:integer;aEcuID,aFileName:string):Boolean;
    Function FTPCardDataSendSuccess(aNodeNo:integer;aEcuID:string):Boolean;
    Function CardDataCreate(aNodeNo,aEcuID:string):Boolean; //카드데이터 생성
    Function UpdateTB_DEVICECARDNOFtpCreate(aGROUP_CODE,aAC_NODENO,aAC_ECUID,aCA_CARDNO,aRcv_State:string):Boolean;
    Function  GetCardDownLoadData(aCardNo,aDoor1,aDoor2,aUseAccess,aUseAlarm,aTimecode,aValidDate,func:String;aPositionNum:integer = 0;aCardPosition:Boolean = False):string;
    Function CheckTB_FTPLIST(aNodeNo,aEcuID:string):Boolean;
    Function UpdateTB_FTPLISTSendStatus(aNodeNo,aEcuID,aFileName,aSendStatus:string):Boolean;
    Function InsertTB_FTPLISTSendStatus(aNodeNo,aEcuID,aFileName,aSendStatus:string):Boolean;

  private
    //ServerControlSystem
    Monitoring : Boolean; //모니터링 화면 떠 있는지 여부

  protected
    function TransLatePath( const APathname, homeDir: string ) : string;
  private
    //*****************전문생성 연동
    L_bSentenceRelayUse:Boolean;//전문연동사용유무
    L_stSentenceServerIP:string;//전문 서버 IP
    L_stSentenceServerPort:string;//전문 서버 Port;
    L_bSCardNoRelayUse:Boolean; //카드번호연동유무
    L_bSSerialRelayUse:Boolean; //일련번호연동유무
    L_bSCompanyCodeRelayUse:Boolean; //회사코드연동유무
    L_bSEmpNoRelayUse:Boolean; //사원번호연동유무
    L_bSEmpNameRelayUse:Boolean; //사원명칭연동유무
    L_bSCardStateRelayUse:Boolean; //카드상태연동유무
    L_bSChangeStateRelayUse:Boolean; //변경상태연동유무
    L_stDelimiter:string; //전문생성시데이터구분자
    L_stSentenceSendData:string; //전문생성후 송신데이터
    L_bSentenceSendResult : Boolean; //전문송신후 결과
    L_bAllDoorOpen : Boolean;  //전체 개방중에
    L_bFierDoorOpen : Boolean;
    //*****************전문생성 연동 끝

    procedure SentenceRelaySend;
    Function SentenceServerConnect:Boolean;

  private
    L_stSendHolidayYear : String;  //Holiday Send Year
    HolidaySendDeviceList : TStringList;

  private
    //************* Daemon 처리 함수
    Function  MDIForm(FormName:string):TForm;
    Function CheckHolidayDevice:Boolean; //Holiday 다운로드 하지 않은 기기가 있는지 체크
    Function GetSendHolidayYear:string;

    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    procedure OracleAdoConnected(Sender: TObject;  DBConnected: Boolean);
    procedure MssqlAdoConnected(Sender: TObject;  DBConnected: Boolean);

  protected
{Detecting Windows Shutdown
To detect Windows Shutdown, you must trap WM_EndSession message. These steps should be taken: Declare a message handling
procedure in your Form's Private section: }
    procedure WMEndSession(var Msg : TWMEndSession); message WM_ENDSESSION;
{Detecting Windows shutdown
When Windows is shutting down, it sends a WM_QueryEndSession to all open applications. To detect (and prevent shutdown), you must
define a message handler to this message. Put this definition on the private section of the main form:}
    procedure WMQueryEndSession(var Msg : TWMQueryEndSession); message WM_QueryEndSession;
    //procedure WndProc(var Message: TMessage); override;
    procedure WndProc(var Msg: TMessage); override;
  public
    ClientCommunication : TClientCommunication; //Client Packet 쌓아 놓은 곳
    ClientConnectList : TList;
    ClientSendList : TStringList;  //클라이언트에 전문 송신 리스트
    InOutCardReaderList : TStringList; //입퇴실 카운트 기기 000(노드번호)00(ECUID)0(ReaderNo)
    InOutCountList : TStringList; //입퇴실 카운트 -1(퇴실) 1(입실) 0(사용안함)
    FireDoorOpenList : TStringList; //화재시 문열림 기기 리스트
    { Public declarations }
     SyncTime : TDateTime;   //Time Sync 시간
     DaemonLogDeleteTime : TDateTime; //데몬 로그 삭제 시간
     DBBackupTime : TDateTime;  //데이터 베이스 백업 동작 시간
     bDataBaseBackup : Boolean; //DataBase Backup


     Function GetDevice(aDeviceNO:String):TDevice;    //Device 번호로 Device 객체를 찾는 Function
     Function GetEcuInfo(aDeviceNO:String):TECUInfo;    //Device 번호로 Ecu 객체를 찾는 Function
     Function SendClientData(aSendData : string):Boolean;
     Function ATSendClientData(stData : string):Boolean;
     Function FDSendClientData(stData : string):Boolean;
     Function ScheduleDataSend:Boolean;
     Property Logined : Boolean read FLogined write  SetLogined; //프로퍼티를 생성함으로 Logined라는 변수가 바뀌면 SetLogined 라는 함수가 실행됨
     function PubDoorInfo_Device_Setting(aNodeNo,aEcuID,aDoorNo,aCardMode,aDoorMode,aDoorControlTime,aOpenMoni,aUseSch,aSendDoor,aAlarmLong,
              aFire,aLockType,aDSOpen,aRemoteDoor:string):Boolean; //출입문 정보 기기 전송
     function PubDoorInfo_Device_Serch(aNodeNo,aEcuID,aDoorNo:string):Boolean; //출입문 정보 조회 전송
     function PubCardTypeSearch(aNodeNo,aEcuID:string):Boolean;

    //*****************************************
    //해당 APPLICATION 과 통신하기 위한 함수
    //*****************************************
     procedure CaseNodeStateAllCheckSend(AThread: TIdPeerThread);
     procedure CaseDeviceStateAllCheckSend(AThread: TIdPeerThread);
     procedure CaseAlarmStateAllCheckSend(AThread: TIdPeerThread);
     procedure CaseDoorStateAllCheckSend(AThread: TIdPeerThread);
     Procedure CheckDOORSTATE(aDeviceID:string); //상태확인 전문 전송
     procedure CheckDeviceSkill(aDeviceID:string); //각 기기의 기능 점검

     //***************************************
     //MCU와 통신처리 하기 위한 송신함수
     //***************************************
     Procedure DeviceTimeSync(aDeviceID:string);  //Time 동기화
     Procedure CardNoDownload(NodeNo:integer;aECUID:String;aAllSend:Boolean); //카드데이터 다운로드
     Procedure CommNodeSend(Sender: TObject;  SendData: string;NodeNO : integer);  //MCU에 Send 되는 모든 데이터를 실시간으로 조회 할 수 있도록 처리
     Procedure NodeConnected(Sender:TObject;  aConnected:Boolean;NodeNo:integer);
     Procedure CheckAlarmSTATE(aDeviceID:string); //방범상태확인
     procedure CheckDEVICEALARMSTATE(aDeviceID:string); //기기별 방범상태
     procedure DoorAllOpenMode; //전체개방모드변경
     Procedure DeviceHoliday(aYear:string); //공휴일 데이터 다운로드
     //Application 에서 해당 기기에 원격제어 명령을 위한 함수
     Procedure DoorOpen(aDeviceID:string); //출입문 오픈 전문 전송
     Procedure DoorModeChange(aDeviceID:string;aMode:Char); //출입문 개방모드 변경
     Procedure DeviceReboot(aDeviceID:string); //기기 재부팅
     Procedure DeviceAlarmModeChange(aDeviceID,aMode:string); //경계모드 변경
     procedure DeviceFireRecovery(aDeviceID:string); //화재복구
     {기기 전체 시간 동기화}
     Procedure TimeSyncAllDeive;
     Function DevicePacketSend(aDeviceID,aCmd,aSendData:string;aQuick:Boolean=False):Boolean;
     Function MCUBroadDataSend(aTargetID,aCmd,aSendData:string;aQuick:Boolean=True):Boolean;


     procedure do_ClientProcessPacket(AThread: TIdPeerThread;aPacket:string);
     Function CaseSendClientData(stData : string;AThread: TIdPeerThread):Boolean;
  public
     procedure do_DeviceServerProcessPacket(AThread: TIdPeerThread;aPacket:string);

    //**************************************
    //기기정보 조회
    //**************************************
    Function FindCommNode(aNodeNo:Integer):TCommNode; // 노드번호로 TCommnode를 찾는 function
    Function FindClientMcuNode(aMcuID:string):TMCUNodeInfo;// MCUID로 TMCUNodeInfo를 찾는 function
    Function DeviceClientNodeAddItem(aMcuID:string):Boolean;
    Function DeviceClientECUAddItem(aNodeNo:integer;aEcuID:string):Boolean;
  private
    wmTaskbar : word;
    procedure DefaultHandler(var Message);override;  //데몬트레이 사라짐 방지
    procedure  AppException( Sender:  TObject;  E:  Exception) ;
  end;

var
  fmMain: TfmMain;
  L_bLogined : Boolean;


implementation
uses
  uLogin,
  uPwChange,
  uDataBaseConfig,
  uLomosUtil,
  uCurrentState, uLocateCode, uDeviceCode, uAttendConfig, DoorSchReg,
  uSchadule,udmAdoQuery, uNetConfig, uDoorAdmin, uAlaramDeviceAdmin,
  uAlarmZoneAdmin, uFoodAdmin,uCommonSql, uMDBSql, uPostGreSql, uMssql,
  uCardReaderServer, uAlaramReader, uDeviceSetting, uInOutReader,
  uInOutGroup,
  uClientInfo,
  uReaderSetting,
  uPersonRelay,
  UCommonModule, uOracleRelay,
  uMonitoring, uNotUseCardDelete,
  uMSSQLRelay, uCompanyCode, uDisplayAdmin, uBarCode,
  udmBarCode, uSound;



{$R *.dfm}

//*****************************************
//FTP SERVER 관련 모듈
//*****************************************


function StartsWith( const str, substr: string ) : boolean;
begin
  result := copy( str, 1, length( substr ) ) = substr;
end;

function BackSlashToSlash( const str: string ) : string;
var
  a: dword;
begin
  result := str;
  for a := 1 to length( result ) do
    if result[a] = '\' then
      result[a] := '/';
end;

function SlashToBackSlash( const str: string ) : string;
var
  a: dword;
begin
  result := str;
  for a := 1 to length( result ) do
    if result[a] = '/' then
      result[a] := '\';
end;

function GetSizeOfFile( const APathname: string ) : int64;
begin
  result := FileSizeByName( APathname ) ;
end;

function GetNewDirectory( old, action: string ) : string;
var
  a: integer;
begin
  if action = '../' then
  begin
    if old = '/' then
    begin
      result := old;
      exit;
    end;
    a := length( old ) - 1;
    while ( old[a] <> '\' ) and ( old[a] <> '/' ) do
      dec( a ) ;
    result := copy( old, 1, a ) ;
    exit;
  end;
  if ( action[1] = '/' ) or ( action[1] = '\' ) then
    result := action
  else
    result := old + action;
end;

function CalculateCRC( const path: string ) : string;
var
  f: tfilestream;
  value: dword;
  IdHashCRC32: TIdHashCRC32;
begin
  IdHashCRC32 := nil;
  f := nil;
  try
    IdHashCRC32 := TIdHashCRC32.create;
    f := TFileStream.create( path, fmOpenRead or fmShareDenyWrite ) ;
    value := IdHashCRC32.HashValue( f ) ;
    result := inttohex( value, 8 ) ;
  finally
    f.free;
    IdHashCRC32.free;
  end;
end;

//*****************************************
//FTP SERVER 관련 모듈
//*****************************************




procedure TfmMain.miExitClick(Sender: TObject);
begin
  bClose := True;
  Close;

end;

procedure TfmMain.tbiDblClick(Sender: TObject);
//var
//   ptMouse : TPoint;
begin
{   SetForegroundWindow(Application.Handle);
   GetCursorPos(ptMouse);
   pmTest.Popup(ptMouse.X, ptMouse.Y);
}
{
  if L_bLogined then
  begin
    TLogin.GetObject.ShowLoginDlg;
    Logined := TLogin.GetObject.Logined;

    if Not FLogined then Exit;
  end;
}
  Visible := True;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  stKey : string;
  stSaupId : string;
  bResult : Boolean;
  stDate : string;
  LogoFile : string;
  ini_fun : TiniFile;
begin
  wmTaskbar := RegisterWindowMessage('TaskbarCreated');
  L_bOracleLog := False;
  FOracleTCS := TCriticalSection.Create;

  Application.OnException := AppException;

  L_bAllDoorOpen := False;
  L_bFierDoorOpen := False;
  G_nProcessCount := 0;
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Zmos.INI');
    G_nDaemonGubun  := ini_fun.ReadInteger('DAEMON','GUBUN',0);
    if ini_fun.ReadString('DAEMON','MAXPROCESS','TRUE') = 'TRUE' then useProcessCount := True
    else useProcessCount := False;

    G_stOracleServerIP := ini_fun.ReadString('연동','ORACLEServerIP','163.180.98.73');
    G_stOracleServerPort := ini_fun.ReadString('연동','ORACLEServerPort','1521');
    G_stOracleUserID := ini_fun.ReadString('연동','ORACLEUserID','SEAT');
    G_stOracleUserPW := ini_fun.ReadString('연동','ORACLEUserPW','seat01');
    G_stOracleDataBaseName := ini_fun.ReadString('연동','ORACLEDBName','DLIDB');

    G_stKTBIZDBType := ini_fun.ReadString('연동','KTDBTYPE','MSSQL');
    G_stMSSQLRelayServerIP := ini_fun.ReadString('연동','MSSQLServerIP','127.0.0.1');
    G_stMSSQLRelayServerPort := ini_fun.ReadString('연동','MSSQLServerPort','1433');
    G_stMSSQLRelayUserID := ini_fun.ReadString('연동','MSSQLUserID','sa');
    G_stMSSQLRelayUserPW := ini_fun.ReadString('연동','MSSQLUserPW','saPasswd');
    G_stMSSQLRelayDataBaseName := ini_fun.ReadString('연동','MSSQLDBName','zmos');

    fmMain.Width :=   ini_fun.ReadInteger('Form','Width',1024);
    fmMain.Height :=   ini_fun.ReadInteger('Form','Height',734);
    fmMain.Left :=   ini_fun.ReadInteger('Form','Left',0);
    fmMain.Top :=    ini_fun.ReadInteger('Form','Top',0);
    if ini_fun.ReadInteger('Form','Maximized',1) = 0 then fmMain.WindowState := wsNormal
    else fmMain.WindowState := wsMaximized;

  Finally
    ini_fun.Free;
  end;
  
  NETTYPE :='TCPIP';
  L_bLogined := True;

  Self.ModuleID := 'Main';
  ExeFolder  := ExtractFileDir(Application.ExeName);
  bApplicationTerminate := False;
  bCardDownLoad := False;
  bFTPSendProcess := False;

  LogSave(ExeFolder + '\..\log\lomosHis.log','Daemon Program Start ');

  tbi.Visible := True;
  tbi.Hint := '서버컨트롤시스템 정지';
  StatusBar1.Panels[0].Text := '서버컨트롤시스템 정지';
  ConnectTimer.Enabled := False;
  DeviceClientConnectCheckTimer.Enabled := False;
  SendTimer.Enabled := False;
  DeviceServerSendTimer.Enabled := False;
  sendClientTimer.Enabled := False;

  ClientCommunication := TClientCommunication.create;
  ClientConnectList := TList.Create;
  ClientConnectList.Clear;
  DeviceConnectList := TList.Create;
  DeviceConnectList.Clear;
  ClientSendList := TStringList.Create;
  ClientSendList.Clear;
  InOutCardReaderList := TStringList.Create;
  InOutCardReaderList.Clear;
  InOutCountList := TStringList.Create;
  InOutCountList.Clear;
  FireDoorOpenList := TStringList.Create;
  FireDoorOpenList.Clear;

  ComNodeList := TStringList.Create;
  ComNodeList.Clear;
  DeviceList := TStringList.Create;
  DeviceList.Clear;
  DeviceClientNodeList:= TStringList.Create;  //DeviceClient 모드 MCU리스트
  DeviceClientNodeList.Clear;
  DeviceClientDeviceList:= TStringList.Create;  //DeviceClient 모드 ECU리스트
  DeviceClientDeviceList.Clear;

  DisplayList := TStringList.Create;
  DisplayList.clear;
  BarCodeList := TStringList.Create;

  ConnectDeviceList := TStringList.Create;
  ConnectDeviceList.Clear;
  FoodConfigCodeList := TStringList.Create; //식수 코드 리스트
  FoodConfigStartList := TStringList.Create; // 식수코드 시작시간
  FoodConfigEndList := TStringList.Create;  //식수코드 종료 시간
  AttendConfigCodeList := TStringList.Create; //근태코드 리스트
  AttendConfigInFromTimeList := TStringList.Create; //출입가능시작 시간
  AttendConfigInToTimeList := TStringList.Create; //출입가능끝 시간
  AttendConfigWorkTimeList := TStringList.Create; //근무 시작 시간
  AttendConfigOutTimeList := TStringList.Create; //퇴근 시간
  AttendConfigExtendTimeList := TStringList.Create; //연장근무 시간
  AttendConfigNightTimeList := TStringList.Create; //야간근무 시간
  AttendConfigSInFromTimeList := TStringList.Create; //반휴일 출입가능시작 시간
  AttendConfigSInToTimeList := TStringList.Create; //반휴일 출입가능끝 시간
  AttendConfigSWorkTimeList := TStringList.Create; //반휴일 근무 시작 시간
  AttendConfigSOutTimeList := TStringList.Create; //반휴일 퇴근 시간
  AttendConfigSExtendTimeList := TStringList.Create; //반휴일연장근무 시간
  AttendConfigSNightTimeList := TStringList.Create; //반휴일야간근무 시간
  AttendConfigHInFromTimeList := TStringList.Create; //공휴일 출입가능시작 시간
  AttendConfigHInToTimeList := TStringList.Create; //공휴일 출입가능끝 시간
  AttendConfigHWorkTimeList := TStringList.Create; //공휴일 근무 시작 시간
  AttendConfigHOutTimeList := TStringList.Create; //공휴일 퇴근 시간
  AttendConfigHExtendTimeList := TStringList.Create; //공휴일 연장근무 시간
  AttendConfigHNightTimeList := TStringList.Create; //공휴일 야간근무 시간
  HolidaySendDeviceList := TStringList.Create;

  AlarmModeNotCardList := TStringList.Create;  //카드데이터 아닌 리스트
  ZoneDetectList := TStringList.Create;        //존감지 상태 코드

  DisplayDataList := TStringList.Create;       //디스플레이에 전송 데이터
  L_bDisplayTimerSending := False;             //디스플레이에 전송 중인 경우

  SyncTime:= Trunc(Tomorrow) + EncodeTime(0,0,1,0);
  DaemonLogDeleteTime := Now;  //Trunc(Tomorrow) + EncodeTime(0,0,1,0);
  L_nCardSendCount := 0;  //송신건수
  L_nCardAckCount  := 0;  //CardAck Count
  bDaemonRestart := False;
  L_bDaemonStop := False;

//  Visible := False;
  bClose := False;
  bStop := False;
  bDBBackup := False;
  bDataBaseBackup := False;
//  Application.ProcessMessages;
  if bApplicationTerminate then Exit;

  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      bClose := True;
      Application.Terminate;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;
  DaemonConfigWriting;
  FTPServerCreate;
  LogoFile := ExeFolder + '\..\image\DaemonLogo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);
  Action_DaemonStartExecute(Self);
  UpdateTB_DEVICECARDNO('S','N');
  SyncTimer.Enabled := True;
  //AdoConnectCheckTimer.Enabled := True;
  DataModule1.OnAdoConnected := DataModuleAdoConnected;
  dmOracleRelay.OnAdoConnected := OracleAdoConnected;
  dmMssqlRelay.OnAdoConnected := MssqlAdoConnected;
  //DEBUG
  //LogSave(ExeFolder + '\..\log\lomosHis.log','FormCreate ');

  Monitoring := False;
  Logined := False;

  CompanyGrade := '0';
  IsMaster := True;
  FM001 := '회사코드';
  FM011 := '지점코드';
  FM021 := '부서코드';
  FM031 := '직위코드';
  FM002 := '회사명칭';
  FM012 := '지점명칭';
  FM022 := '부서명칭';
  FM032 := '직위명칭';
  FM040 := '직원구분';
  FM041 := '직원코드';
  FM042 := '직원코드명칭';
  FM101 := '사번';
  FM102 := '이름';
  FM103 := '사내전화번호';
  FM104 := '입사일';
  FM105 := '퇴사일';
  FM106 := '사원';
  FM901 := '빌딩코드';
  FM902 := '빌딩명칭';
  FM903 := '빌딩권한';
  FM911 := '층코드';
  FM912 := '층명칭';
  FM913 := '층권한';
  FM921 := '구역코드';
  FM922 := '구역명칭';
  FM923 := '구역권한';
  FM933 := '출입문권한';

end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  fmCurrentState : TForm;
begin
  if bClose = False then
  Begin
    Visible := False;
    CanClose := False;
    ShowWindow( Application.Handle, SW_HIDE );
    mem_ComList.Lines.Clear;
    mem_ComList.Visible := False;
    if bCURRENTSTATE then
    begin
      fmCurrentState := MDIForm('TfmCurrentState');
      if fmCurrentState <> nil then
      begin
        TfmCurrentState(fmCurrentState).CloseForm;
      end;
    end;
    Exit;
  End;

end;

procedure TfmMain.miShowClick(Sender: TObject);
begin
{  if L_bLogined then
  begin
    TLogin.GetObject.ShowLoginDlg;
    Logined := TLogin.GetObject.Logined;

    if Not FLogined then Exit;
  end;
}
  Visible := True;
end;

procedure TfmMain.bt_HideClick(Sender: TObject);
begin
  Visible := False;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if bApplicationTerminate then Exit;
  //bt_Hide.Click;

  Action_MonitoringExecute(Self);
  

  StateCheckTimer.Enabled := True;
  //DEBUG
  //LogSave(ExeFolder + '\..\log\lomosHis.log','FormActivate ');


  //Self.Hide;
  Ver011.Caption := 'Ver ' + strBuildInfo ;
  fmMain.Caption := '서버컨트롤시스템[' + strBuildInfo + ']';

  if G_nSCSRelayServer = 0 then  //KyungheeServer
  begin
    KyungHeeServerConnect;
    N19.Visible := False;
    mn_BasicCode.Visible := False;
    mn_CardManage.Visible := False;
    mn_display.Visible := False;
    mn_BarCode.Visible := False;
  end else if G_nSCSRelayServer = 1 then //KT 비즈메카
  begin
    KTBizmekaServerConnect;
    N19.Visible := True;
    mn_BasicCode.Visible := True;
    mn_CardManage.Visible := True;
    mn_display.Visible := False;
    mn_BarCode.Visible := False;
  end else if G_nSCSRelayServer =  2 then //인천 대공원
  begin
    KTBizmekaServerConnect;
    N19.Visible := True;
    mn_BasicCode.Visible := True;
    mn_CardManage.Visible := True;
    mn_display.Visible := True;
    mn_BarCode.Visible := False;
  end else if G_nSCSRelayServer = 3 then //KT 비즈메카 II
  begin
    KTBizmekaServerConnect;
    N19.Visible := True;
    mn_BasicCode.Visible := True;
    mn_CardManage.Visible := True;
    mn_display.Visible := False;
    mn_BarCode.Visible := False;
  end else if G_nSCSRelayServer = 4 then //바코드 연동관리
  begin
    KTBizmekaServerConnect;
    N19.Visible := True;
    mn_BasicCode.Visible := True;
    mn_CardManage.Visible := True;
    mn_display.Visible := False;
    mn_BarCode.Visible := True;
  end;
end;

//데몬 폼 HIDE
procedure TfmMain.mn_FormHideClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Action_ExitExecute(Sender: TObject);
begin
  if L_bLogined then
  begin
    TLogin.GetObject.ShowLoginDlg;
    Logined := TLogin.GetObject.Logined;

    if Not FLogined then Exit;
  end;
  bClose := True;
  Close;
end;

procedure TfmMain.SetLogined(const Value: Boolean);
begin
  FLogined := Value;
  mn_Daemon.Enabled := Value;
  mn_manager.Enabled := Value;
  mn_Report.Enabled := Value;
  mn_Config.Enabled := Value;
  ToolBar1.Enabled := Value;
  btnMonitoring.Enabled := Value;
  btn_TimeAsync.Enabled := Value;
  btn_state.Enabled := Value;
  if Value then
  begin
    mn_login.Enabled := False;
    mn_Logout.Enabled := True;
    if Monitoring then
    begin
      self.FindClassForm('TfmMonitoring').FindCommand('LOGIN').Params.Values['Data'] := 'LOGIN';
      self.FindClassForm('TfmMonitoring').FindCommand('LOGIN').Execute;
    end;
  end else
  begin
    mn_login.Enabled := True;
    mn_Logout.Enabled := False;
    if Monitoring then
    begin
      self.FindClassForm('TfmMonitoring').FindCommand('LOGIN').Params.Values['Data'] := '';
      self.FindClassForm('TfmMonitoring').FindCommand('LOGIN').Execute;
    end;
  end;
end;

procedure TfmMain.Action_PWChangeExecute(Sender: TObject);
begin
  fmPwChange:= TfmPwChange.Create(Self);
  fmPwChange.SHowModal;
  fmPwChange.Free;
end;

procedure TfmMain.Action_DaemonStartExecute(Sender: TObject);
var
  i : integer;
begin
  Action_DaemonStart.Enabled := False;
  bStop := False;
  StatusBar1.Panels[0].Text := '서버컨트롤시스템 기동중...';
  tbi.Hint := '서버컨트롤시스템 기동중...';
  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      bClose := True;
      Application.Terminate;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;

  SCSConfigSet;
  DaemonConfigSet;
  InitConfigSet;
  LoadAttendConfig; //근태환경설정로드
  LoadFoodConfig;   //식수환경설정로드

  DaemonLogConfigSet;   //데몬로그 환경설정
  RelayConfigSet;     //연동관련 환경설정
  LogDeleteTime.Enabled := True;  //데몬로그 삭제
  DataBaseConfigSet;
  DBBackupTime := EncodeDateTime(strtoint(copy(DataBaseLastBackupDate,1,4)),
                                 strtoint(copy(DataBaseLastBackupDate,5,2)),
                                 strtoint(copy(DataBaseLastBackupDate,7,2)),
                                 strtoint(copy(DataBaseBackupTime,1,2)),
                                 strtoint(copy(DataBaseBackupTime,3,2)),
                                 0,0);
  DBBackupTime := DBBackupTime + DataBaseBackupCycle ; // 마지막 백업 시간 + 백업 주기 => 다음에 백업할 시간임

  if DataBaseAutoBackup = 'TRUE' then DataBaseBackupTimer.Enabled := True
  else DataBaseBackupTimer.Enabled := False;

  LoadInOutReader; //입퇴실 리더 정보 로드

  if UseDeviceServer then  //기기가 서버모드이면
  begin
    LoadNode;      //노드 정보 로드
    LoadECU;       //기기 정보 로드
    //초기 MCU와 접속
    for I:= 0 to ComNodeList.Count -1 do
    begin
      if bApplicationTerminate then Exit;
      Try
{$IFDEF TApdWinsockport}
        TCommnode(ComNodeList.Objects[i]).Open:= True;
{$ELSE}
        TCommNode(ComNodeList.Objects[I]).Active:= True;
{$ENDIF}
        LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Connecting '+ TCommnode(ComNodeList.Objects[i]).NodeNoStr );
      Except
        LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','ConnectError '+ TCommnode(ComNodeList.Objects[i]).NodeNoStr );
      End;

    end;
    ConnectTimer.Enabled:= True;
    SendTimer.Enabled:= True;
  end else
  begin
//    LoadDeviceClientNode;
//    LoadDeviceClientECU;
    DeviceServer1.DefaultPort := DeviceServerPort1; //TCPServer 로변경
    DeviceServer1.Active := True;
    DeviceServer2.DefaultPort := DeviceServerPort2; //TCPServer 로변경
    DeviceServer2.Active := True;
    DeviceServer3.DefaultPort := DeviceServerPort3; //TCPServer 로변경
    DeviceServer3.Active := True;
    
    DeviceClientConnectCheckTimer.Enabled := True;
    DeviceServerSendTimer.Enabled := True;
  end;


  mn_BarcodeReConnect.Visible := False;
  if G_nSCSRelayServer = 2 then   //인천대공원인경우
  begin
    LoadDisplay; //디스플레이 정보를 로드 한다.
    LoadDisplayMessage; //디스플레이 정보를 로드 한다.
  end else if G_nSCSRelayServer = 4 then   //바코드 연동인경우
  begin
    LoadBarCode; //바코드 정보를 로드 한다.
    LoadSoundCode; //사운드코드 정보를 로드 한다.
    mn_SoundVolumeSettingClick(self); //사운드 음량을 조절한다.
    mn_BarcodeReConnect.Visible := True;
  end;

  //sendClientTimer.Enabled := True;

  tbi.Hint := '서버컨트롤시스템 정상';
  StatusBar1.Panels[0].Text := '서버컨트롤시스템 정상';

  MCUCommonConfigSet;
  if CardAutoDownLoadUse then CardAutoDownTimer.Enabled := True
  else CardAutoDownTimer.Enabled := False;


  { 서버컨트롤 시스템에서는 필요 없다.
  if fdmsUses = 'TRUE' then
  begin
    //여기서 DBConnect 하자...
    if fdmsConnect then fdmsRelyTimer.Enabled := True
    else fdmsRelyTimer.Enabled := False;
  end  else fdmsRelyTimer.Enabled := False;

  //RSERVER.DefaultPort := strtoint(DaemonServerPort); //TCPServer 로변경
  //RSERVER.Active := True;
  IdFTPServer.DefaultPort := strtoint(FtpServerPort);
  if Not IdFTPServer.Active then IdFTPServer.Active := True;
  RSERVER1.ServerPort := strtoint(DaemonServerPort);
  RSERVER1.Start;
  ATSERVER.ServerPort := strtoint(AttendServerPort);
  ATSERVER.Start;
  FoodServer.ServerPort := strtoint(FoodServerPort);
  FoodServer.Start;

  if SensorUse then mn_sensor.Visible := True
  else mn_sensor.Visible := False;

  if InOutCountUse then mn_InOutAdmin.Visible := True
  else mn_InOutAdmin.Visible := False;

  if IsCardReaderServer then
  begin
    mn_CardReaderServer.Visible := True;
    mn_CRSMonitoring.Visible := True;
    CardReaderSever.Start;
  end else
  begin
    mn_CardReaderServer.Visible := False;
    mn_CRSMonitoring.Visible := False;
    CardReaderSever.Stop;
  end;

  mn_FoodDevice.Visible := FoodUse;
  mn_AlarmDevice.Visible := PatrolUse;

  SentenceRelayConfigSet;
  if L_bSentenceRelayUse then
  begin
    SentenceRelayTimer.Enabled := True;
  end  else SentenceRelayTimer.Enabled := False;

  if (PersonRelayType = 2) or (SendPersonRelayType > 0) then //서초사옥 테이블 연동
  begin
    PersonRelayTimer.Enabled := True;
  end else PersonRelayTimer.Enabled := False;

  StateCheckTimer.Enabled := True;
  HolidaySendTimer.Enabled := True;
  }
  //화재감지시 환경설정값 읽어와서 셋팅
  FireConfigSet;
  if L_bFireRecoverUse then
  begin
    mn_Fire.Visible := True;
  end else
  begin
    mn_Fire.Visible := False;
  end;

  CommonModule.LoadAlarmModeNotCard(AlarmModeNotCardList);
  CommonModule.LoadZoneDetectList(ZoneDetectList);
  L_bDaemonStop := False;
end;

procedure TfmMain.Action_CurrentStateExecute(Sender: TObject);
begin
  MDIChildShow('TfmCurrentState');
end;

procedure TfmMain.MDIChildShow(FormName: String);
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if bApplicationTerminate then Exit;
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        //(screen.forms[i] as TForm).show;
        {Screen.Forms[i].CloseQuery;
        Screen.Forms[i].Destroy;
        break;}
        if Screen.ActiveForm = Screen.Forms[i] then
        begin
          Screen.Forms[i].WindowState := wsMaximized;
          Exit;
        end;
        SetWindowPos(Screen.Forms[i].Handle, 0, 0, 0, 0, 0,
        HWND_TOP );   //WS_EX_TOPMOST
        Screen.Forms[i].Show;
        Screen.Forms[i].WindowState := wsMaximized;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    tmpForm.Show;
    tmpForm.WindowState := wsMaximized;
  end;
end;

procedure TfmMain.Timer2Timer(Sender: TObject);
begin
  if bApplicationTerminate then Exit;
  StatusBar1.Panels[4].Text := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
end;

{ TMyServerThread }

procedure TMyServerThread.ClientExecute;
var
 Stream: TWinSocketStream;
 InBuf, OutBuf: array [0..MAXBUFFSIZE] of Char;
 Buffer, strCmd, strRet,stAck: String;
 i: Integer;
 nLength : Integer;
 RecvData : string;
begin


 try
   Stream := TWinSocketStream.Create(ClientSocket, SERVERTIMEOUT);

   Buffer:='';
   while (not Terminated) and ClientSocket.Connected do
   begin
      if bApplicationTerminate then Exit;
{       if not Stream.WaitForData(SERVERTIMEOUT) then
       begin
          ClientSocket.Close;
          Break;
       end;  }

       try
          i:=Stream.Read(InBuf, MAXBUFFSIZE);
       except
          ClientSocket.Close;
          Break;
       end;

       if i = 0 then
       begin
         //ClientSocket.Close;
         Continue;
         //Break;
       end;

       InBuf[i]:=#0;  //중간에 쓰레기 데이터를 없애기 위함
       Buffer:=Buffer + InBuf;

       nLength := Pos(LINEEND, Buffer);
       while nLength > 0 do
       begin
          if bApplicationTerminate then Exit;
          nLength := Pos(LINEEND, Buffer);
          RecvData := copy(Buffer,1,nLength); //한라인 추출
          Delete(Buffer,1,nLength);  //Buffer 에서 앞에 한라인 삭제

          i := Pos(DATADELIMITER, RecvData); //Command 추출
          strCmd:=UpperCase(Copy(RecvData, 1, i-1));
          //클라이언트에 수신확인 전송
          stAck := 'A' + '000' + strCmd  + LINEEND;
          StrPCopy(OutBuf, stAck);
          Stream.Write(OutBuf , StrLen(OutBuf ));  //Ack 전송

          if strCmd='ACCESS' then
             //출입문제어
          else if strCmd='SCHEDULE' then
             //스케줄등록
          else if strCmd='ALARM' then
          begin
            //방범모드제어
          end
          else if strCmd = 'TIME' then
            //시간동기화
          else if strCmd = 'DEVICESTATUS' then
            //상태확인
          else if strCmd = 'CARDDOWNLOAD' then
            //카드데이터 다운로드
          else
             strRet:='Unknown Command.';

       end;
   end;

 except
   HandleException;
 end;

 Stream.Free;
end;

function TfmMain.SendClientData(aSendData: string): Boolean;
begin
//  ClientSendList.Add(aSendData);
  DXUnicastDataQueue1.AddToQueue(aSendData + LINEEND);
  if mem_ComList.Visible then
  begin
    mem_ComList.Lines.Add('[TX]['+aSendData+']');
  end;
end;

procedure TfmMain.ToolButton1Click(Sender: TObject);
begin
//ClientSocket1.Open;
end;

procedure TfmMain.ConnectTimerTimer(Sender: TObject);
var
  I: Integer;
  aPollingTime: TDatetime;
  aTimeOut: TDatetime;
  Present : TDatetime;
begin
  if bApplicationTerminate then Exit;
  if Not UseDeviceServer then Exit; //기기 클라이언트 모드로 동작할때는 이쪽을 타면 안됨

{  if SyncTime <= Now then
  begin
    DeviceTimeSync('000000000000'); //시간 동기화
    CardNoDownload(0,'00',False); //미전송 데이터 전송
    SyncTime := SyncTime + 1;
  end;   }

  for I:= 0 to ComNodeList.Count -1 do
  begin
    if bApplicationTerminate then Exit; //폼 종료시에는 작업하지 말자....
    if bStop then Exit;
    if Assigned(ComNodeList.Objects[i]) then
    begin
      Try
        aPollingTime:= TCommnode(ComNodeList.Objects[i]).LastConnectedTime;
        aTimeOut:= IncTime(aPollingTime,0,0,15,0);
        if Now > aTimeout then
        begin
{$IFDEF TApdWinsockport}
          TCommnode(ComNodeList.Objects[i]).Open:= False;
          Delay(50);
          if bApplicationTerminate then Exit;
          TCommnode(ComNodeList.Objects[i]).Open:= True;
          LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','ReConnecting '+TCommnode(ComNodeList.Objects[i]).wsAddress);
{$ELSE}
          TCommnode(ComNodeList.Objects[i]).active:= False;
          Delay(50);
          if bApplicationTerminate then Exit;
          TCommnode(ComNodeList.Objects[i]).active:= True;
          LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','ReConnecting '+TCommnode(ComNodeList.Objects[i]).Socket.RemoteAddress);
{$ENDIF}
        end;
      Except
        //무시
      End;
    end;
  end;
end;

procedure TfmMain.DeviceTimeSync(aDeviceID:string);
var
  I: Integer;
  aDevice : TDevice;
  aEcuInfo : TECUInfo;
begin
  if UseDeviceServer then
  begin
    if (copy(aDeviceID,1,3) = '000') or (Trim(aDeviceID) = '') then
    begin
      for I:= 0 to DeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        TDevice(DeviceList.Objects[I]).SendPacket('R','TM00'+ FormatDatetime('yyyymmddhhnnss',Now));
        Delay(150);
      end;
      LogSave(ExeFolder + '\..\log\lomosHis.log','All Time Sync');
      Exit;
    end else
    begin
      aDevice := GetDevice(aDeviceID);
      if aDevice <> nil then aDevice.SendPacket('R','TM00'+ FormatDatetime('yyyymmddhhnnss',Now));
    end;
  end else
  begin
    if (copy(aDeviceID,1,3) = '000') or (Trim(aDeviceID) = '') then
    begin
      for I:= 0 to DeviceClientDeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        TECUInfo(DeviceClientDeviceList.Objects[I]).SendPacket('R','TM00'+ FormatDatetime('yyyymmddhhnnss',Now));
        Delay(150);
      end;
      LogSave(ExeFolder + '\..\log\lomosHis.log','All Time Sync');
      Exit;
    end else
    begin
      aEcuInfo := GetEcuInfo(aDeviceID);
      if aEcuInfo <> nil then aEcuInfo.SendPacket('R','TM00'+ FormatDatetime('yyyymmddhhnnss',Now));
    end;
  end;
end;

function TfmMain.FindCommNode(aNodeNo: Integer): TCommNode;
var
  Nodestr: String;
  NodeIndex: Integer;
begin
  Result:= nil;
  NodeStr:= 'NODE'+InttoStr(aNodeNo);
  NodeIndex:= ComNodeList.IndexOf(NodeStr);
  if NodeIndex > -1 then
    Result:= TCommNode(ComNodeList.Objects[NodeIndex]);

end;

procedure TfmMain.Action_DaemonStopExecute(Sender: TObject);
var
  i : integer;
begin
  if L_bDaemonStop then Exit;
  L_bDaemonStop := True;
  if Not UseDeviceServer then //서버가 서버모드로 동작하는 경우 충분한 시간을 갖자.
     Delay(1000);
  ClientSendList.Clear; //클라이언트 전송 패킷을 전체 삭제
  Delay(100);
  InOutCardReaderList.Clear;
  InOutCountList.Clear;
  RSERVER1.Stop;
  StateCheckTimer.Enabled := False;
  ConnectTimer.Enabled := False;

  for i := 0 to ClientConnectList.Count - 1 do
  begin
    Try
      TClientInfo(ClientConnectList.Items[i]).AThread.Connection.Socket.Close;
    Except
      continue;
    End;
  end;
  //RSERVER.Active := False;

  //IdFTPServer.Active := False;
  FoodServer.Stop;

  StatusBar1.Panels[0].Text := '서버컨트롤시스템 중지 중...';
  tbi.Hint := '서버컨트롤시스템 중지 중...';
  bStop := True;
  sendClientTimer.Enabled := False;

  if UseDeviceServer then  //기기가 서버모드이면
  begin
    SendTimer.Enabled:= False;
//    ConnectTimer.Enabled:= False;
    
    UnLoadECU;
    UnLoadNode;
    DeviceList.Clear;
    ComNodeList.Clear;
  end else
  begin
    DeviceServerSendTimer.Enabled := False;
    DeviceClientConnectCheckTimer.Enabled := False;

//    UnLoadDeviceClientECU;
//    UnLoadDeviceClientNode;
    DeviceServer1Stop;
    DeviceServer2Stop;
    DeviceServer3Stop;
    {
    Try
      if DeviceServer1.Active then
        DeviceServer1.Active := False;
    Except
    End;   }
    {
    Try
      if DeviceServer2.Active then
        DeviceServer2.Active := False;
    Except
    End;
    Try
      if DeviceServer3.Active then
        DeviceServer3.Active := False;
    Except
    End;  }
    DeviceConnectList.Clear;
    DeviceClientNodeList.Clear;  //DeviceClient 모드 MCU리스트
    DeviceClientDeviceList.Clear;   //DeviceClient 모드 ECU리스트
  end;

  if G_nSCSRelayServer = 2 then   //인천대공원인경우
  begin
    UNLoadDisplay; //디스플레이 정보를 UN로드 한다.
  end else if G_nSCSRelayServer = 4 then   //바코드시스템인경우
  begin
    UNLoadBarcode;
  end;

  FoodConfigCodeList.Clear;
  FoodConfigStartList.Clear;
  FoodConfigEndList.Clear;

  Action_DaemonStart.Enabled := True;
  StatusBar1.Panels[0].Text := '서버컨트롤시스템 중지';
  tbi.Hint := '서버컨트롤시스템 중지';
end;

procedure TfmMain.CardNoDownload(NodeNo:integer;aECUID:String; aAllSend: Boolean);
var
  aCardno: String;
  aDeviceID: String;
  aAccess: String[1];
  aAlarm: String[1];
  aDoor1: String[1];
  aDoor2: String[1];
  aTimeCode: Char;
  aSend: String[1];
  aPermit: Char;
  aDevice: TDevice;
  aEcuInfo: TECUInfo;
  aCardType: Char;
  aRegCode: Char;
  DeviceIndex: Integer;
  aDownLoadData: String;
  stSql : String;
  TempAdoQuery : TADOQuery;
  i : integer;
  nPositionNum : integer;
  stValidDate : string;
begin
  if bCardDownLoad then Exit;

  bCardDownLoad := True;
  if aAllSend then
  begin
    //여기에서 FTP 다운로드 가능 기기인지 체크 하여
    //if UseFTPDevice(inttostr(NodeNo),aECUID) then
    if G_nFTPUse = 0 then
    begin
      if CheckTB_FTPLIST(inttostr(NodeNo),aEcuID) then
      begin
        UpdateTB_FTPLISTSendStatus(inttostr(NodeNo),aEcuID,FillZeroNumber(NodeNo,3) + aEcuID,'N');
      end else
      begin
        InsertTB_FTPLISTSendStatus(inttostr(NodeNo),aEcuID,FillZeroNumber(NodeNo,3) + aEcuID,'N');
      end;
      bCardDownLoad := False;
      Exit; //FTP DownLoad 성공이면 빠져 나감
    end else
    begin
    end;
{    if FTPDownLoad(inttostr(NodeNo),aECUID) then
    begin
      bCardDownLoad := False;
      Exit; //FTP DownLoad 성공이면 빠져 나감
    end;  }

  end;

  stSql := 'Update TB_DEVICECARDNO Set DE_RCVACK = ''R'' '; //송신 준비 상태로 변경
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ' ;
  stSql := stSql + ' AND DE_RCVACK <> ''S'' ';              //송신중이 아닌 데이터
  if NodeNo <> 0 then   //전체송신
  begin
    stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(NodeNo) ;
  end;
  if (aAllSend = FALSE) then
  begin
    stSql := stSql + ' AND DE_RCVACK = ''N'' ' ;
  end else               //전체 전송
  begin
    stSql := stSql + ' AND DE_RCVACK <> ''S'' ' ;
  end;

  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Select ';
  if DBTYPE = 'MSSQL' then stSql := stSql + ' top 100 ';
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
  stSql := stSql + ' Where a.DE_RCVACK = ''R'' ';
  stSql := stSql + ' AND a.GROUP_CODE = ''' + GROUPCODE + ''' ' ;
  if ConnectDeviceList.Count > 0 then
  begin
    stSql := stSql + ' AND (';
    for i:=0 to ConnectDeviceList.Count - 1 do
    begin
      if i <> 0 then stSql := stSql + ' OR ';
      stSql := stSql + '(AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
      stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''')';
    end;
    stSql := stSql + ' ) ';
  end else
  begin
    bCardDownLoad := False;
    Exit;
  end;
  if DBTYPE = 'PG' then stSql := stSql + ' LIMIT 100 OFFSET 0 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      //UpdateTB_DEVICECARDNO('R','S');


      if RecordCount > 0  then
      begin

        //DisableControls;
        First;
        while not eof do
        begin
          if bApplicationTerminate then Exit;
          stValidDate := Trim(FindField('em_retiredate').asString);
          if Length(stValidDate) <> 8 then stValidDate := '00000000';
          if Not IsDigit(stValidDate) then stValidDate := '00000000';
          stValidDate := copy(stValidDate,3,6); //유효기간

          aCardNo:= FindField('CA_CARDNO').asString;
          aDeviceID:= FillZeroNumber(FindField('AC_NODENO').asInteger,3);
          aDeviceID:= aDeviceID + FindField('AC_ECUID').AsString;
          UpdateTB_DEVICECARDNOCardNoState(inttostr(FindField('AC_NODENO').asInteger),FindField('AC_ECUID').AsString,aCardNo,'S'); //송신데이터 송신중으로 처리
          Try
            nPositionNum :=  FindField('positionnum').AsInteger;
          Except
            nPositionNum := 0; //널인경우
          End;

          if (FindField('DE_DOOR1').IsNull) or (Trim(FindField('DE_DOOR1').asstring) = '')  then aDoor1:='N'
          else aDoor1:= FindField('DE_DOOR1').asString;

          if (FindField('DE_DOOR2').IsNull) or (Trim(FindField('DE_DOOR2').asstring) = '') then aDoor2:='N'
          else aDoor2:= FindField('DE_DOOR2').asString;

          if (FindField('DE_USEACCESS').IsNull) or (Trim(FindField('DE_USEACCESS').asstring) = '')  then aAccess:='N'
          else aAccess:= FindField('DE_USEACCESS').asString;
          if (FindField('DE_USEALARM').IsNull) or (Trim(FindField('DE_USEALARM').asstring) = '')  then aAlarm:='N'
          else aAlarm:= FindField('DE_USEALARM').asString;
          if (FindField('DE_TIMECODE').IsNull) or (Trim(FindField('DE_TIMECODE').asstring) = '')  then aTimeCode:='0'
          else aTimeCode:= FindField('DE_TIMECODE').asstring[1];
          if (FindField('DE_PERMIT').IsNull) or (Trim(FindField('DE_PERMIT').asstring) = '')  then aPermit:='N'
          else aPermit:= FindField('DE_PERMIT').asString[1];

  {        if (FindField('DE_RCVACK').IsNull) or (Trim(FindField('DE_RCVACK').asstring) = '')  then aSend:='N'
          else aSend:= FindField('DE_RCVACK').asString;
  }
          if aPermit = 'L' then
          begin

            if aAccess = 'Y' then   //출입 허가
            begin

              if aAlarm = 'Y' then aCardType:= '2' //카드타입설정: 2=> 출입 + 방범
              else                 aCardType:= '0'; //카드타입설정: 0=> 출입

              if (aDoor1 = 'Y') and (aDoor2 = 'Y') then
              begin
                aRegCode:= '0';
              end else if  aDoor1 = 'Y' then
              begin
                aRegCode:= '1';
              end else if  aDoor2 = 'Y' then
              begin
                aRegCode:= '2';
              end else
              begin
                if aAlarm = 'Y' then aCardType:= '1' //카드타입설정: 1=> 방범 전용
                else
                begin
                  aRegCode:= '0';
                  aPermit:= 'N';
                end;
              end;
            end else if aAlarm = 'Y' then  // 출입 X ,방범만 OK
            begin
              //aRegCode:= '3';
              aRegCode:= '0';
              aCardType:= '1';

            end else
            begin
              aCardType:= '0';
              aRegCode:= '0';
              aPermit:= 'N';
            end;
          end
          else
          begin
              aCardType:= '0';
              aRegCode:= '0';
              aPermit:= 'N';
          end;


          if UseDeviceServer then
            DeviceIndex:= DeviceList.IndexOf(aDeviceID)
          else
            DeviceIndex:= DeviceClientDeviceList.IndexOf(aDeviceID);

          if DeviceIndex < 0 then
          begin
            ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                         '1253',aDeviceID+'미등록 기기');

            RealDataShow('','','Er','',aDeviceID+'미등록 기기[카드다운로드]');

          end else
          begin
            if ConnectDeviceList.IndexOf(aDeviceID) > -1 then  //Connect 된 경우
            begin
              if aAllSend then
              begin
                if aPermit = 'L' then aPermit := 'F';
              end;
              if UseDeviceServer then
              begin
                aDevice:= TDevice(DeviceList.Objects[DeviceIndex]);
                aDevice.CD_Download(aCardNo,stValidDate, acardType, aRegCode, aTimeCode,aPermit,False,nPositionNum,UseCardPosition);
              end else
              begin
                aEcuInfo:= TECUInfo(DeviceClientDeviceList.Objects[DeviceIndex]);
                aEcuInfo.CD_Download(aCardNo,stValidDate, acardType, aRegCode, aTimeCode,aPermit,False,nPositionNum,UseCardPosition);
              end;
              L_nCardSendCount := L_nCardSendCount + 1; //카드 송신 건수를 증가 시키자.
            end;
          end;
          Next;
          Application.ProcessMessages;
        end;
        //EnableControls;
  //      Edit1.Text := inttostr(L_nCardSendCount) + '/' + FormatDateTime('yyyymmdd:HH:MM:SS',Now);
      end;

      //close;
    end;
  Finally
    bCardDownLoad := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.SendTimerTimer(Sender: TObject);
var
  I: Integer;
  emptyData: Integer;
  bWait:Boolean;
begin
  emptyData:= 0;
  if bApplicationTerminate then Exit;
  SendTimer.Enabled := False;

  for I:= 0 to ComNodeList.Count -1 do
  begin
    if bApplicationTerminate then Exit;
    if bStop then Exit;
    if (TCommNode(ComNodeList.Objects[I]).QuickSendDataList.Count > 0)
       or (TCommNode(ComNodeList.Objects[I]).ReserveSendDataList.Count > 0)
       or (TCommNode(ComNodeList.Objects[I]).CardSendDataList.Count > 0) then
    begin
        RecvTimeCheck.Enabled := True;  //송신할게 있는거다.
        Try
{$IFDEF TApdWinsockport}
          if TCommNode(ComNodeList.Objects[I]).Open then TCommNode(ComNodeList.Objects[I]).ExecSendPacket;
          if TCommNode(ComNodeList.Objects[I]).ReserveSendDataList.Count = 0 then Inc(emptyData);
{$ELSE}
          if TCommNode(ComNodeList.Objects[I]).Socket.Connected then TCommNode(ComNodeList.Objects[I]).ExecSendPacket;
          if TCommNode(ComNodeList.Objects[I]).ReserveSendDataList.Count = 0 then Inc(emptyData);
{$ENDIF}
        Except
          //무시
        End;
    end;
  end;
  SendTimer.Enabled := True;
  StatusBar1.Panels[1].Text := inttostr(L_nCardAckCount) + '/' + inttostr(L_nCardSendCount);
end;

procedure TfmMain.DeviceRcvRegCardData(Sender: TObject;
  ReceiveData: string;NodeNO : integer);
var
  stECUID : string;
  stCardNo: String;
  stSql : String;
  stClientSendData : string;
  nCardNoLen : integer;
  i : integer;
  stTemp1,stTemp2 : string;
begin
  Try
    L_nCardAckCount := L_nCardAckCount + 1;   //카드응답건수를 증가 시키자.

    stECUID := copy(ReceiveData,15,2);

    nCardNoLen := strtoint(Copy(ReceiveData,25,2));
    if CARDLENGTHTYPE = 3 then //3Byte => 8자리 숫자
    begin
      stCardNo:= Copy(ReceiveData,27,8);
      stCardNo:= DecodeCardNo(stCardNo,8,True);
      Delete(stCardNo,1,2);
      stTemp1 := FillZeroNumber2(Hex2Dec64(copy(stCardNo,1,2)),3);
      stTemp2 := FillZeroNumber2(Hex2Dec64(copy(stCardNo,3,4)),5);
      stCardNo := stTemp1 + stTemp2;
    end else if HidCardType = 1 then   //Hid CardType
    begin
      stCardNo:= Copy(ReceiveData,27,8);
      stCardNo:= DecodeCardNo(stCardNo);
      stCardNo := HidReverseCardNo(stCardNo);
    end else if CARDLENGTHTYPE = 0 then  //고정길이 타입이면
    begin
      stCardNo:= Copy(ReceiveData,27,8);
      if IsNumericCardNo then
        stCardNo:= DecodeCardNo(stCardNo)
      else stCardNo:= DecodeCardNo(stCardNo,8,True);
    end
    else
    begin
      stCardNo:= Copy(ReceiveData,27,nCardNoLen);
      if CARDLENGTHTYPE = 1 then
      begin
          if IsNumericCardNo then stCardNo:= inttostr(Hex2Dec64(stCardNo));
      end else if CARDLENGTHTYPE = 2 then
      begin
        stCardNo := Hex2Ascii(stCardNo);
      end;
    end;

    if dmAdoQuery.DupCheckTB_DEVICE_CARDNO(stCardNo,inttostr(NodeNO),stECUID) then  //Key 값으로 존재하면
    begin
      if dmAdoQuery.CardPermitCheck(stCardNo,inttostr(NodeNO),stECUID,'N') then
         dmAdoQuery.CardPermitDelete(stCardNo,inttostr(NodeNO),stECUID,'N') // Permit 이 'N'인 데이터는 삭제 한다.
      else dmAdoQuery.CardRCV_ACKUpdate(stCardNo,inttostr(NodeNO),stECUID,'Y');
    end;

    if L_nCardSendCount = L_nCardAckCount then
    begin
      if Not bCardDownLoad then
      begin
        L_nCardSendCount := 0;
        L_nCardAckCount := 0;
        UpdateTB_DEVICECARDNO('S','N');
      end;
    end;

    stClientSendData:= 'R' +
         'E' + //ECU
         FillZeroNumber(NodeNO,3) +
         stECUID +
         '00' + //DOORNO
         '00' + //READERNO
         'CR' + //'CR' 카드등록응답
         'C' + // 카드데이터
         FillZeroNumber(Length(stCardNo),3) +
         stCardNo;
    //여기에서 접속되어 있는 클라이언트에 데이터 송신
    SendClientData(stClientSendData);
  Finally
    if useProcessCount then
    begin
      FCS.Enter;
      G_nProcessCount := G_nProcessCount - 1;
      FCS.Leave;
      StatusBar1.Panels[2].Text := inttostr(G_nProcessCount);
    end;
  End;
end;

function TfmMain.UpdateTB_DEVICECARDNO(OrgState,
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

procedure TfmMain.FormResize(Sender: TObject);
begin
  if bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - statusBar1.Panels[1].Width - statusbar1.Panels[3].Width - statusbar1.Panels[4].Width;
end;

function TfmMain.GetDevice(aDeviceNO: String): TDevice;
var
  DeviceIndex: Integer;
begin
  DeviceIndex:= DeviceList.Indexof(aDeviceNO);
  if DeviceIndex > -1 then Result:= TDevice(DeviceList.Objects[DeviceIndex])
  else Result:= nil;

end;

Function TfmMain.LoadNode : Boolean;
var
  aCommNode   : TCommnode;

  aNodeStr : String;
  NodeNo   : Integer;
  IPStr       : String;
  nPort : integer;

  stSql : String;
  TempAdoQuery : TADOQuery;

begin

  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    if ComNodeList = nil then ComNodeList := TStringList.Create;
    ComNodeList.Clear;
    if DeviceClientNodeList = nil then DeviceClientNodeList := TStringList.Create;
    DeviceClientNodeList.Clear;

    // MCU List 만 추출
    stSql := ' select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND AC_GUBUN = ''0'' ';
    stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
    if G_nMultiDaemon > 0 then //멀티데몬이면
    begin
      stSql := stSql + ' AND AC_DAEMONGUBUN = ' + inttostr(G_nDaemonGubun) + ' ';
    end;

    //TCommmode 로드
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;


      First;
      while not eof do
      begin
        if bApplicationTerminate then Exit;
        {TreeView 추가}
        NodeNo:= FindField('AC_NODENO').asInteger;
        IPStr:=  Trim(FindField('AC_MCUIP').asString);
        if Not IsDigit(FindField('AC_MCUPORT').asString) then nPort := 3000
        else nPort:= strtoint(FindField('AC_MCUPORT').asString);

        aNodeStr:=  FillZeroNumber(NodeNo,3)+':'+ IPStr+':'+ inttostr(nPort);

        {Create Commnode}
{$IFDEF TApdWinsockport}
        aCommNode:= TCommNode.Create(Self);
        aCommNode.No:= NodeNo;
        aCommNode.NodeNoStr :=         aNodeStr;
        aCommNode.WsAddress:=           IPStr;
        aCommNode.wsPort:=              inttostr(nPort);
        aCommNode.OnRcvData:=           CommNodeReceve;
        aCommNode.OnSendData :=         CommNodeSend;
        aCommNode.OnRcvInvalidDevice:=  CommNodeRcvInvalidDevice;
        aCommNode.OnConnected :=        NodeConnected;
        if Trim(IPStr) <> '' then
        begin
          ComNodeList.AddObject('NODE'+InttoStr(aCommNode.No),aCommNode);
        end;
{$ELSE}
        aCommNode:= TCommNode.Create(Self);
        aCommNode.No:= NodeNo;
        aCommNode.NodeNoStr :=         aNodeStr;
        aCommNode.Address :=           IPStr;
        aCommNode.Port :=              nPort;
        aCommNode.OnRcvData:=           CommNodeReceve;
        aCommNode.OnSendData :=         CommNodeSend;
        aCommNode.OnRcvInvalidDevice:=  CommNodeRcvInvalidDevice;
        aCommNode.OnConnected :=        NodeConnected;
        if Trim(IPStr) <> '' then
        begin
          ComNodeList.AddObject('NODE'+InttoStr(aCommNode.No),aCommNode);
        end;
{$ENDIF}

        Next;
      end;
      close;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Result := True;
end;

Function TfmMain.UnLoadNode :Boolean;
var
  i: integer;
begin
  if  ComNodeList <> nil then
  begin
    for i:= 0 to ComNodeList.Count -1 do
    begin
      if Assigned(ComNodeList.Objects[i]) then
      begin
        Try
{$IFDEF TApdWinsockport}
          TCommNode(ComNodeList.Objects[I]).Open := False;
          TCommNode(ComNodeList.Objects[i]).Free;
{$ELSE}
          TCommNode(ComNodeList.Objects[I]).Active:= False;
          TCommNode(ComNodeList.Objects[i]).Free;
{$ENDIF}
        Except
          ComNodeList.Clear;
          Exit;
        End;
      end;

    end;
    ComNodeList.clear;
  end;
end;

function TfmMain.LoadECU: Boolean;
var
  stSql : String;
  NodeNo,OldNodeNo    : Integer;
  aCommNode   : TCommnode;
  aDeviceStr : string;
  aDevice     : TDevice;
  aDeviceType : CHAR;
  TempAdoQuery : TADOQuery;

begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    DeviceList.Clear;

    // ECU List 전체 추출
    stSql := ' select a.* from TB_ACCESSDEVICE a ';
    if G_nMultiDaemon > 0 then //멀티데몬이면
    begin
      stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND b.AC_GUBUN = ''0'' ';
      stSql := stSql + ' AND b.AC_DAEMONGUBUN = ' + inttostr(G_nDaemonGubun) + ' ';
      stSql := stSql + ' ) ';
    end;
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' order by a.AC_NODENO ';

    // 기기
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      OldNodeNo:= 0;
      First;
      while not eof do
      begin
        if bApplicationTerminate then Exit;
        NodeNo:= FindField('AC_NODENO').asInteger;
        // Append Treeview
        if OldNodeNo <> NodeNo then
        begin
          aCommnode:= FindCommNode(NodeNo);
        end;
        aDeviceStr:=FillzeroNumber(NodeNo,3) + FindField('AC_ECUID').asString;

        //Create TDevice
        aDevice:= TDevice.Create(Self);
        aDevice.NodeNo := NodeNo;
        aDevice.ECUID := FindField('AC_ECUID').asString;
        aDevice.DeviceID:= aDeviceStr;
        aDevice.DeviceName := FindField('AC_DEVICENAME').AsString;

        //출입타입
        if FindField('AC_ACTYPE').AsString = '' then aDeviceType := '0'
        else aDeviceType := FindField('AC_ACTYPE').AsString[1];

        if aDeviceType = '1' then aDevice.ACtype := dtAc
        else aDevice.ACtype := dtNothing ;

        //식수타입
        if FindField('AC_FDTYPE').AsString = '' then aDeviceType := '0'
        else aDeviceType := FindField('AC_FDTYPE').AsString[1];
        aDevice.FoodAmtPer := 0;
        if aDeviceType = '1' then
        begin
          aDevice.FDtype := dtFD;
        end
        else aDevice.FDtype := dtNothing ;

        //방범타입
        if FindField('AC_PTTYPE').AsString = '' then aDeviceType := '0'
        else aDeviceType := FindField('AC_PTTYPE').AsString[1];
        if aDeviceType = '1' then aDevice.PTtype := dtPT
        else aDevice.PTtype := dtNothing ;

        //근태타입
        if FindField('AC_ATTYPE').AsString = '' then aDeviceType := '0'
        else aDeviceType := FindField('AC_ATTYPE').AsString[1];

       // 기기종류
        case aDeviceType of
          '0': aDevice.ATtype:= dtNothing;  // 미사용
          '1': aDevice.ATtype:= dtAt;      // 업데이트 방식
        end;
        if aCommnode <> nil then
        begin
          aDevice.CommNode            := aCommnode;

          aDevice.OnRcvTellogData     := DeviceRcvTellogData;
          aDevice.OnRcvAlarmData      := DeviceRcvAlarmData;         //알람 데이터
          aDevice.OnRcvInitAckData    := DeviceRcvInitAckData;       //기기등록
          aDevice.OnRegisterClear     := DeviceRegisterClear;        //메모리지움버튼클릭
          aDevice.OnRcvRemoteAckData  := DeviceRcvRemoteAckData;     //원격제어 응답(알람)
          aDevice.OnRcvFTPProcessData  := DeviceRcvFTPProcessData;     //FTP 전송상태 체크
          aDevice.OnRcvCardReadData   := DeviceRcvCardReadData;      //카드 리딩 데이터
          aDevice.OnRcvChangeDoorData := DeviceRcvChangeDoorData;    //문상태 변경
          aDevice.OnRcvDoorControl    := DeviceRcvDoorControl;       //문제어
          aDevice.OnRcvDoorSetup      := DeviceRcvDoorSetup;         //문설정 응답
          aDevice.OnRcvRegCardData    := DeviceRcvRegCardData;       //카드 등록응답
          aDevice.OnNotDefineData     := DeviceNotDefineData;
          aDevice.OnRcvRegSchedule    := DeviceRcvScheduleData;       //스케줄 데이터 등록 응답
          aDevice.OnErrorData         := DeviceErorData;
          aDevice.OnConnected         := DeviceConnected;
          aDevice.OnDoorManageModeChange := DoorMangageModeChange;  //출입문 운영모드 변경
          aDevice.OnDoorPNModeChange := DoorPNModeChange;  //출입문 운영모드 변경
          aDevice.OnDoorStateChange   := DoorStateChanged;  //출입문 상태 변경
          aDevice.OnWatchModeChange   := DeviceWatchModeChange; //경계상태 변경
          aDevice.OnDoorModeChange    := DoorModeChanged; //출입문 상태변경

          DeviceList.AddObject( aDeviceStr,aDevice);
        end;

        next;
      end;
      close;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmMain.UnLoadECU: Boolean;
var
  i: integer;
begin
  if  DeviceList <> nil then
  begin
{    for i:= 0 to DeviceList.Count -1 do
    begin
      if Assigned(DeviceList.Objects[i]) then
      begin
        TDevice(DeviceList.Objects[i]).Free;
      end;

    end;    }
    DeviceList.clear;
  end;
end;

procedure TfmMain.CommNodeReceve(Sender: TObject; ReceiveData: string;NodeNO : integer);
var
  stClientSendData: string;
  stNodeNo :String;
  stECUID : string;
  stSubCLass : string;
  cCommand : char;
  cRcv_MsgNo :char;
  stIP : string;
  stPort : string;
begin
  if bApplicationTerminate then Exit;
  stECUID:= Copy(ReceiveData,15,2);
  
{  //if (pos('Bad Command',ReceiveData) > 0) or (pos('COMM ERROR',ReceiveData) > 0 ) then
  if (pos('COMM ERROR',ReceiveData) > 0 ) then
  begin
    if ComErrorList.IndexOf(Fillzeronumber(NodeNO,3) + stECUID) < 0 then ComErrorList.Add(Fillzeronumber(NodeNO,3) + stECUID);
  end else
  begin
    if ComErrorList.IndexOf(Fillzeronumber(NodeNO,3) + stECUID) > -1 then ComErrorList.Delete(ComErrorList.IndexOf(Fillzeronumber(NodeNO,3) + stECUID));
  end;     }

  stSubCLass := copy(ReceiveData,34,2);
  cCommand:= ReceiveData[17];
  cRcv_MsgNo:= ReceiveData[18];
  if UseDeviceServer then
  begin
{$IFDEF TApdWinsockport}
    stIP := TCommNode(Sender).WsAddress;
    stPort := TCommNode(Sender).WsPort;
{$ELSE}
    stIP := TCommNode(Sender).Address;
    stPort := inttostr(TCommNode(Sender).Port);
{$ENDIF}
  end else
  begin
    stIP := TMCUNodeInfo(Sender).ClientIP;
    stPort := inttostr(TMCUNodeInfo(Sender).ClientPort);
  end;

  if (cCommand <> 'e') and (cCommand <> 'a') then
    LogSave(ExeFolder + '\..\log\Comm'+ FormatDateTIme('yyyymmdd',Now)+ FillZeroNumber(NodeNO,3) + '.log','[RX]' + ReceiveData);
{  //Low Data Table에 Insert
  if DaemonLogFullData = 'Y' then dmAdoQuery.TB_LOWDATAInsert(NodeNO,stIP,stPort,stECUID,'RX',cCommand,ReceiveData)
  else if (cCommand <> 'e') and (cCommand <> 'a') then //폴링데이터와 ACK 데이터는 로그 남기지 말자.
  dmAdoQuery.TB_LOWDATAInsert(NodeNO,stIP,stPort,stECUID,'RX',cCommand,ReceiveData);
}

  stNodeNo:= FillZeroNumber(NodeNO,3);
  //실시간송수신화면에 디스플레이
  RealDataShow(stIP,stECUID,'Rx',cCommand,ReceiveData);

  stClientSendData:= 'R'+ stNodeNo+ ReceiveData + LINEEND;

  if Monitoring then
  begin
    self.FindClassForm('TfmMonitoring').FindCommand('Message').Params.Values['Data'] := stClientSendData;
    self.FindClassForm('TfmMonitoring').FindCommand('Message').Execute;
  end;

end;

procedure TfmMain.CommNodeSend(Sender: TObject; SendData: string;NodeNO : integer);
var
  st: string;
  stNodeNo :String;
  stECUID : string;
  cCommand : char;
  stIP : string;
  stPort : string;
begin
  stECUID:= Copy(SendData,15,2);
  cCommand:= SendData[17];
  if UseDeviceServer then
  begin
{$IFDEF TApdWinsockport}
    stIP := TCommNode(Sender).WsAddress;
    stPort := TCommNode(Sender).WsPort;
{$ELSE}
    stIP := TCommNode(Sender).Address;
    stPort := inttostr(TCommNode(Sender).Port);
{$ENDIF}
  end else
  begin
    stIP := TMCUNodeInfo(Sender).ClientIP;
    stPort := inttostr(TMCUNodeInfo(Sender).ClientPort);
  end;

  if (cCommand <> 'e') and (cCommand <> 'a') then
    LogSave(ExeFolder + '\..\log\Comm'+ FormatDateTIme('yyyymmdd',Now)+ FillZeroNumber(NodeNO,3) + '.log','[TX]' + SendData);
  //Low Data Table에 Insert
{  if DaemonLogFullData = 'Y' then dmAdoQuery.TB_LOWDATAInsert(NodeNO,stIP,stPort,stECUID,'TX',cCommand,SendData)
  else if (cCommand <> 'e') and (cCommand <> 'a') then //폴링데이터와 ACK 데이터는 로그 남기지 말자.
  dmAdoQuery.TB_LOWDATAInsert(NodeNO,stIP,stPort,stECUID,'TX',cCommand,SendData);
}
  //실시간송수신화면에 디스플레이{TO DO}
  RealDataShow(stIP,stECUID,'Tx',cCommand,SendData);


end;

procedure TfmMain.CommNodeRcvInvalidDevice(Sender: TObject;
  ReceiveData: string;NodeNO : integer);
var
  aMsg:String;
  stIP : string;
  stPort : string;
  stECUID : string;
  cCommand : Char;
begin
  aMsg:= '정의 되지 않은 기기:[ '+ inttostr(NodeNO) + ']'+ Copy(ReceiveData,8,9);
  ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
              '기기등록정보',aMsg);

  stECUID:= Copy(ReceiveData,15,2);
  if UseDeviceServer then
  begin
{$IFDEF TApdWinsockport}
    stIP := TCommNode(Sender).WsAddress;
    stPort := TCommNode(Sender).WsPort;
{$ELSE}
    stIP := TCommNode(Sender).Address;
    stPort := inttostr(TCommNode(Sender).Port);
{$ENDIF}
  end else
  begin
    stIP := TMCUNodeInfo(Sender).ClientIP;
    stPort := inttostr(TMCUNodeInfo(Sender).ClientPort);
  end;
  
  cCommand:= ReceiveData[17];
  RealDataShow(stIP,stECUID,'Er',cCommand,aMsg);

end;

//알람데이터 수신시 데이터 처리 루틴...
procedure TfmMain.DeviceRcvAlarmData(Sender: TObject; cmd,ReceiveData: string;NodeNO : integer);
var
  stTime         : String[50];
  //stDeviceID     : String[9];
  stEcuID : string;
  stMsgNo        : String;
  stSubCLass     : String[2];
  stSubAddr      : String[2];
  stZOneCode     : String[2];
  stMode         : String[2];
  stModeStr       : String;
  stStatus       : String[2];
  stPortNo       : String[2];
  stState        : String;
  stOper         : String[20];
  stClientSendData : string;
  stNewStateCode : string;
  nIndex : integer;
begin
  Try
    //stDeviceID := copy(ReceiveData,8,9);
    stEcuID := copy(ReceiveData,15,2);
    stMsgNo    := ReceiveData[18];
    stTime     := copy(ReceiveData,20,14);
    stSubCLass := copy(ReceiveData,34,2);
    stSubAddr  := copy(ReceiveData,36,2);
    stZoneCode := copy(ReceiveData,38,2);
    stMode     := ReceiveData[40];
    stStatus   := copy(ReceiveData,41,2);
    stPortNo   := copy(ReceiveData,43,2);
    stState    := ReceiveData[45];
    stOper     := copy(ReceiveData,46,10);
    stNewStateCode := stStatus;


    if (IsDigit(stTime)= False) or
       (IsDigit(stEcuID)= False) then  Exit;

    stMode:= UpperCase(stMode);
    if cmd = 'A' then
    begin
      if stStatus = '00' then
      begin
        //Mode Change StateCode
        nIndex := AlarmModeNotCardList.IndexOf(stOper);
        if nIndex > -1 then
        begin
          if stMode = 'A' then
            stNewStateCode := TAlarmStatusCode(AlarmModeNotCardList.Objects[nIndex]).ALARMSTATUSCODE
          else stNewStateCode := TAlarmStatusCode(AlarmModeNotCardList.Objects[nIndex]).DISALARMSTATUSCODE;
        end else
        begin
          if stMode = 'A' then stNewStateCode := 'A1'
          else stNewStateCode := 'C1';
        end;
      end else if isDigit(stPortNo) then
      begin
        //Alarm StateCode
        nIndex := ZoneDetectList.IndexOf(stStatus);
        if nIndex < 0 then
        begin
          stNewStateCode := 'Z' + stState;
        end;
      end;

    end;

    if stStatus = L_stFireStatus then
    begin
      if cmd = 'A' then
      begin
        UpdateTB_CURRENTDAEMON('FIREORIGIN','TRUE');
        if L_bFireAllOpen then
        begin
          //화재감지시 전체개방
          //DEBUG
          LogSave(ExeFolder + '\..\log\lomosHis.log','화재감지전체개방 ');
          //LogSave(ExeFolder + '\..\log\Fire.log',ReceiveData);

          DataModule1.TB_SYSTEMLOGInsert('0','00','0','0','0','화재감지전체개방');
          FireDoorOpenTimer.Enabled := True;
          //DoorAllOpenTimer.Enabled := True;
          {if Not L_bFierDoorOpen then
          begin
            L_bFierDoorOpen := True;
            DoorAllOpenMode;
          end;     }

  //        L_bFirstFire := True;
        end;
      end;
    end;



    stClientSendData:= 'R' +
         'A' + //ECU
         FillZeroNumber(NodeNO,3) +
         stECUID +
         '00' + //DOORNO
         '00' + //READERNO
         'PT' + //'PT' 알람신호
         'C' + // 카드데이터
         FillZeroNumber(Length(ReceiveData + ';' + stNewStateCode ),3) +
         ReceiveData + ';' +
         stNewStateCode;
    //여기에서 접속되어 있는 클라이언트에 데이터 송신
    SendClientData(stClientSendData);
    //DEBUG
    //LogSave(ExeFolder + '\..\log\lomosHis.log',stClientSendData);

    if stMode = 'A' then //Alarm 신호 올라 오면 단선 신호인지 쇼트 신호 인지 체크하자
    begin
  {    if Not bALARMSHORT then
      begin
        if stState = 'S' then Exit; //쇼트 신호를 감지 하지 않는 경우 빠져 나감
      end;
      if Not bALARMDOWN then
      begin
        if stState = 'P' then Exit; //단선 신호를 감지 하지 않는 경우 빠져 나감
      end; }
      //Alaram 신호만 클라이언트 전송하자.

    end;

    if UpperCase(Cmd) <> 'O' then   //상태 조회 아닌 알람 발생시만 이벤트 처리 하자.
    begin
      {알람 데이터 무조건 저장}
      if Not DupCheckTB_ALARMEVENT(stTime,
                          inttostr(NodeNo),
                          stEcuID,
                          stMsgNo) then
      InsertTB_ALARMEVENT(stTime,
                          inttostr(NodeNo),
                          stEcuID,
                          stMsgNo,
                          stSubClass,
                          stSubAddr,
                          stZoneCode,
                          stMode,
                          stPortNo,
                          stStatus,
                          stState,
                          stOper,
                          stNewStateCode);
                      
      if PatrolUse then
      begin
        if ALARMVIEW = 'QUERY' then // 쿼리 조회 하는 경우 쿼리조회테이블 업데이트
        begin
          if Not DupCheckTB_AlarmShow(inttostr(NodeNo),
                                      stEcuID,
                                      stSubClass,
                                      stSubAddr,
                                      stZoneCode,
                                      stPortNo,
                                      stStatus
                                      ) then
          begin
            InsertTB_ALARMSHOW(inttostr(NodeNo),
                              stEcuID,
                              stSubClass,
                              stSubAddr,
                              stZoneCode,
                              stPortNo,
                              stStatus,
                              stMode,
                              copy(stTime,1,8),
                              copy(stTime,9,6),
                              stMsgNo,
                              stState,
                              stOper,
                              'N',
                              '',
                              'SYSTEM'
                              );
          end else
          begin
            UpdateTB_ALARMSHOW(inttostr(NodeNo),
                              stEcuID,
                              stSubClass,
                              stSubAddr,
                              stZoneCode,
                              stPortNo,
                              stStatus,
                              stMode,
                              copy(stTime,1,8),
                              copy(stTime,9,6),
                              stMsgNo,
                              stState,
                              stOper,
                              'N',
                              '',
                              'SYSTEM'
                              ); 
          end;
        end;

        //UpdateTB_ALARMMode(inttostr(NodeNo),stEcuID,stMode);
      end;

      if SensorUse then
      begin
        if Not IsDigit(stPortNo) then Exit;
        InsertTB_SENSOREVENT(stTime,
                            inttostr(NodeNo),
                            stEcuID,
                            stMsgNo,
                            stSubClass,
                            stSubAddr,
                            stZoneCode,
                            stMode,
                            stPortNo,
                            stStatus,
                            stState,
                            stOper);
      end;
    end;
  Finally
    if useProcessCount then
    begin
      FCS.Enter;
      G_nProcessCount := G_nProcessCount - 1;
      FCS.Leave;
      StatusBar1.Panels[2].Text := inttostr(G_nProcessCount);
    end;
  End;

end;

procedure TfmMain.DeviceRcvInitAckData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
var
  stECUID: String;
  I: Integer;
  aRegCode: String;
  aRegGubun : string;
begin
  stECUID := Copy(ReceiveData, 15,2);

  aRegCode:= Copy(ReceiveData,19,2);
  aRegGubun := Copy(ReceiveData,21,2);
  //40 K1123456700i1IF00제론시스템      61
  if aRegCode = 'ID' then
  begin
    RcvDeviceID(inttostr(NodeNo),stECUID,ReceiveData);
  end else if aRegCode = 'CD' then
  begin
    RcvCR(inttostr(NodeNO),stECUID,ReceiveData);
  end else if aRegCode = 'SY' then
  begin
    RcvSysinfo(inttostr(NodeNo),stECUID,ReceiveData);
  end else if aRegCode = 'RY' then
  begin
    //RcvRelay(ReceiveData)
  end else if aRegCode = 'LP' then
  begin
    RcvPort(inttostr(NodeNo),stECUID,ReceiveData)
  end else if aRegCode = 'AD' then
  begin
    //RcvUsedAlarmdisplay(ReceiveData)
  end else if aRegCode = 'EX' then
  begin
    RcvUsedDevice(inttostr(NodeNo),ReceiveData,aRegGubun);
  end else if aRegCode = 'TN' then
  begin
    RcvTellNo(inttostr(NodeNo),stECUID,ReceiveData);
  end else if aRegCode = 'CT' then
  begin
    //RcvCallTime(ReceiveData);
  end else if aRegCode = 'BT' then
  begin
    //RcvbroadcastTime(ReceiveData);
  end else if aRegCode = 'DI' then
  begin
    //RcvDialInfo(ReceiveData);
  end else if aRegCode = 'DT' then
  begin
    //RcvControlDialInfo(ReceiveData);
  end else if aRegCode = 'NW' then
  begin
    //ClearWiznetInfo;
    //if aRegGubun = '00' then
    //  RcvWiznetInfo(ReceiveData)
    //else if aRegGubun = '50' then
    //  RcvKTLAN(copy(ReceiveData,18,Length(ReceiveData)-17));
  end else if aRegCode = 'VC' then
  begin
    //RcvVoiceTime(ReceiveData);
  end else if aRegCode = 'Id' then
  begin
    RcvLinkusId(inttostr(NodeNo),stECUID,ReceiveData);
  end else if aRegCode = 'Tn' then
  begin
    RcvLinkusTelNo(inttostr(NodeNo),stECUID,ReceiveData);
  end else if aRegCode = 'Pt' then
  begin
    //RcvLinkusPt(ReceiveData);
  end else if aRegCode = 'Rc' then
  begin
    //RcvRingCount(ReceiveData);
  end else if aRegCode = 'Ct' then
  begin
    RcvCardType(inttostr(NodeNo),stECUID,ReceiveData);
  end else if aRegCode = '0@' then
  begin
    //RcvResetData(ReceiveData);
  end else if aRegCode = 'EL' then //존확장기 추가
  begin
    //RcvZoneExInfo(ReceiveData);
  end;
end;

procedure TfmMain.DeviceRcvRemoteAckData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
var
  stCode : string;
  stGubun : string;
  stECUID : string;
  stRomVer : string;
  nPos : integer;
begin
  //037 K1123456700r1TM00050107180637EF
  stCode:= Copy(ReceiveData,19,2);
  stGubun:= Copy(ReceiveData,21,2);
  stECUID :=  copy(ReceiveData,15,2);
  if (stCode = 'VR') or (stCode = 'fu') then //버젼확인
  begin
    stRomVer :=Copy(ReceiveData,23,Length(ReceiveData)-25);
    UpdateRomVer(inttostr(NodeNO),stECUID,stRomVer);
  end else if (stCode = 'fp') then
  begin
    nPos := Pos('ftp success',ReceiveData);
    if nPos > 0 then
    begin
      FTPCardDataSendSuccess(NodeNO,stECUID);
    end;
  end;
end;

procedure TfmMain.DeviceRcvCardReadData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
Var
  stDate: String;
  stCardNo: String;
  bExitButton : Boolean;
  cDoorNo: Char;
  cPosi:    Char;
  cReaderNo: Char;
  stName: String;
  stCo: String;
  stDepart: String;
  cPermit: Char;
  stPermitStr: String;
  stClientSendData: string;
  stECUID: string;
  nIndex: Integer;
  nInOutIndex : integer;
  stInOutcode : string;
  stInOutCount : string;
  stLocate: String;
  cInputtype: Char;
  stInputStr: String;
  cACType : Char;
  cPTType : char;
  cCardType : char;
  cRegCode:  Char;
  cTimeCode: Char;
  cCardManageMode : Char;// 0x30 Posi 0x31 Nega 0x32 Posi2 0x33 Nega3
  stTimeStr: String;
  cButton: Char;
  stTime: String;
  stSabun: String;
  cFoodCode: Char;
  cAtType :Char;
  stSql : string;
  stTemp:string;
  nCardNoLen : integer;
  nPositionNum : integer;
  stRcvPositionNum : string;
  bUseFoodDevice : Boolean;    //식수 사용 기기인지
  bUseACDevice : Boolean;      //출입 사용 기기인지
  bUseATDevice : Boolean;      //근태 사용 기기인지
  bUsePTDevice : Boolean;      //방범 사용 기기인지
  stValidDate : string; //유효기간
  nPos : integer;
  nSCSResult : integer; //
  nSendResult : integer;
  aDevice : TDevice;
  stSCSHis : string;
  stAuthType : string;
  stEmCode,stCompanyCode,stJijumCode,stDepartCode,stPosiCode : string;
  stEmName,stCompanyName,stJijumName,stDepartName,stPosiName : string;
  cAuth : char; //'R' : 승인,'N' : 미승인
  stTemp1,stTemp2 : string;
begin
//052K112345670022c
//E611005041616543900CC00F29905D185
  Try
    bExitButton := False;
    CDLogSave(ExeFolder + '\..\log\CDLOG'+ FormatDateTIme('yyyymmdd',Now)+'.log',ReceiveData);
    if Length(ReceiveData) < 49 then
    begin
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   ERR_PACKET_0001,'카드출입데이터:'+ReceiveData);
      Exit;
    end;

    stECUID:=    Copy(ReceiveData,15,2);
    cDoorNo:=     ReceiveData[21];
    cReaderNo:=   ReceiveData[22];
    cPosi:=       ReceiveData[23];
    cCardManageMode := ReceiveData[36];
    cButton:= ReceiveData[41];
    if Not IsDigit(cButton) then cButton := '0';
    stClientSendData:= 'R' +
         'E' + //ECU
         FillZeroNumber(NodeNO,3) +
         stECUID +
         '0' + cDoorNo + //DOORNO
         '0' + cReaderNo + //READERNO
         'AC' + //'AC' 출입
         'C' + // 카드데이터
         FillZeroNumber(Length(ReceiveData),3) +
         ReceiveData;
    //여기에서 접속되어 있는 클라이언트에 데이터 송신
    SendClientData(stClientSendData);

    stTimeStr:= Copy(ReceiveData,24,12);
    stTimeStr:= '20'+ stTimeStr;

    if not isDigit(stTimeStr) then
    begin
       ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                    ERR_PACKET_0001,'카드출입데이터:'+ReceiveData);
       Exit;
    end;

    stDate:= Copy(stTimeStr,1,4)+'-'+
            Copy(stTimeStr,5,2)+'-'+
            Copy(stTimeStr,7,2)+' '+
            Copy(stTimeStr,9,2)+':'+
            Copy(stTimeStr,11,2)+':'+
            Copy(stTimeStr,13,2);

    cInputType:= ReceiveData[38];
    case cInputtype of
      'C': stInputStr:= '카드리더';
      'P': stInputStr:= '전화';
    else stInputStr:= cInputType;
    end;

    cPermit:= ReceiveData[39];

    nCardNoLen := strtoint(Copy(ReceiveData,42,2));
    stRcvPositionNum := '';
    if CARDLENGTHTYPE = 3 then //3Byte => 8자리 숫자
    begin
      stCardNo:= Copy(ReceiveData,44,8);
      stCardNo:= DecodeCardNo(stCardNo,8,True);
      Delete(stCardNo,1,2);
      stTemp1 := FillZeroNumber2(Hex2Dec64(copy(stCardNo,1,2)),3);
      stTemp2 := FillZeroNumber2(Hex2Dec64(copy(stCardNo,3,4)),5);
      stCardNo := stTemp1 + stTemp2;
    end else if HidCardType = 1 then   //Hid CardType
    begin
      stTemp:= Copy(ReceiveData,44,8);
      stCardNo:= DecodeCardNo(stTemp);
      if stCardNo = '0000000000' then bExitButton := True;
      if Not bExitButton then
      begin
        stCardNo := HidReverseCardNo(stCardNo);
      end;
    end else if CARDLENGTHTYPE = 0 then   //고정길이타입이면
    begin
      stTemp:= Copy(ReceiveData,44,8);
      if UseCardPosition then stRcvPositionNum := copy(ReceiveData,52,5);
      if IsNumericCardNo then
      begin
        stCardNo:= DecodeCardNo(stTemp);
        if stCardNo = '0000000000' then bExitButton := True;
      end
      else
      begin
        stCardNo:= DecodeCardNo(stTemp,8,True);
        if FillZeroNumber2(Hex2Dec64(stCardNo),10) = '0000000000' then bExitButton := True;
      end;
    end else
    begin
      if nCardNoLen = 0 then Exit;
      stCardNo:= Copy(ReceiveData,44,nCardNoLen);
      if UseCardPosition then stRcvPositionNum := copy(ReceiveData,44 + nCardNoLen,5);
      stTemp := FillZeroNumber(0,nCardNoLen);
      if stCardNo = stTemp then bExitButton := True; //Exit 버튼 눌른것임

      if Not bExitButton then
      begin
        if CARDLENGTHTYPE = 1 then    //가변길이타입
        begin
            if IsNumericCardNo then stCardNo:= inttostr(Hex2Dec64(stCardNo));
        end else if CARDLENGTHTYPE = 2 then  //HEX2ASCII 타입
        begin
          stCardNo := Hex2Ascii(stCardNo,True);
          //stCardNo := stringReplace(stCardNo,#$0,#$1E,[rfReplaceAll]);
          nPos := Pos(#$0,stCardNo);
          if nPos > 0 then Exit;
        end;
      end else
      begin
        if CARDLENGTHTYPE = 2 then stCardNo := '00000000000'; //퇴실버튼이 0이 22개로 올라옴
      end;

    end;

    stAuthType := '000';
    if cPosi = 'S' then   //서버승인인경우
    begin
      stSCSHis := inttostr(SERVEREVENT);
      stAuthType := '001';
    end else
    begin
      stSCSHis := inttostr(CARDEVENT);
      if cCardManageMode = '3' then stAuthType := '004';
    end;

    if G_bACEventFull and bExitButton then //출입이력 전체 남기고...
    begin
        stSql := CommonSql.InsertIntoTB_ACCEVENT(
                               copy(stTimestr,1,8),
                               copy(stTimestr,9,6),
                               inttostr(NodeNo),
                               stECUID,
                               cDoorNo,
                               Trim(copy(stCardNo,1,20)),
                               cReaderNo,
                               cButton,
                               cPosi,
                               cInputType,
                               ReceiveData[37],
                               ReceiveData[36],
                               cPermit,
                               FormatdateTime('yyyymmddHHMMSS',Now),
                               stSCSHis,
                               stAuthType
                               );
        //DataModule1.ProcessExecSQL(stSql);
        DataModule1.ProcessEventExecSQL(stSql);
        Exit;
    end;
    if bExitButton then Exit; //퇴실 버튼이면 빠져나감

    //cAttendCode:= cPosi;

    {저장}
    // 출입/방범 카드데이터 저장

    if Not dmAdoQuery.DupCheckTB_ACCESS_EVENT(stTimestr,NodeNO,stECUID,cDoorNo,stCardNo) then
    begin
      stSql := CommonSql.InsertIntoTB_ACCEVENT(
                               copy(stTimestr,1,8),
                               copy(stTimestr,9,6),
                               inttostr(NodeNo),
                               stECUID,
                               cDoorNo,
                               stCardNo,
                               cReaderNo,
                               cButton,
                               cPosi,
                               cInputType,
                               ReceiveData[37],
                               ReceiveData[36],
                               cPermit,
                               FormatdateTime('yyyymmddHHMMSS',Now),
                               stSCSHis,
                               stAuthType
                               );
      //DataModule1.ProcessExecSQL(stSql);
      DataModule1.ProcessEventExecSQL(stSql);

    end else
    begin
      if cPosi = 'S' then
      begin
        //서버 승인인 경우 업데이트
        stSql := CommonSql.UpdateTB_ACCESSEVENTSCSHIS(
                           copy(stTimestr,1,8),
                           copy(stTimestr,9,6),
                           inttostr(NodeNo),
                           stECUID,
                           cDoorNo,
                           stCardNo,
                           stSCSHis);
        DataModule1.ProcessEventExecSQL(stSql);
      end else
      begin
        ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   '중복데이터(출입통제):',ReceiveData);
      end;
    end;

    aDevice := GetDevice(FillzeroNumber(NodeNo,3) + stECUID);

    if (G_nSCSRelayServer = 1) or (G_nSCSRelayServer = 2) or (G_nSCSRelayServer = 3) or (G_nSCSRelayServer = 4) then //KT BizMeka 인 경우 MasterCard 먼저 체크하자.
    begin

      if dmAdoQuery.CheckPermit(stCardNo,NodeNo,stECUID,cDoorNo,stRcvPositionNum,UseCardPosition,cACType,cPTType,cRegCode,cTimeCode,nPositionNum,stValidDate) then
      begin  // Master Card 이고
        if (cPermit <> #$31) and  (cPermit <> #$32) then    //미승인이면
        begin
          //출입문 열자
          if aDevice <> nil then
          begin
            stAuthType := '001';
            nSCSResult := aDevice.ServerDoorControl(cReaderNo,cDoorNo,cButton,stCardNo,'R');

            stSql := CommonSql.UpdateTB_ACCESSEVENTEmployeeInfo(
                               copy(stTimestr,1,8),
                               copy(stTimestr,9,6),
                               inttostr(NodeNo),
                               stECUID,
                               cDoorNo,
                               stCardNo,
                               stEmCode,
                               stCompanyCode,
                               stJijumCode,
                               stDepartCode,
                               stPosiCode,
                               stEmName,
                               inttostr(nSCSResult),
                               stAuthType );

            DataModule1.ProcessEventExecSQL(stSql);
          end;
          {DB확인결과 승인...}
          if (cACType = '1') AND (cPTType = '1') then cCardType := '2' //출입+방범
          else if (cACType = '1') then cCardType := '0' //출입전용
          else if (cPTType = '1') then cCardType := '1' //방범전용
          else cCardType := '3';
          aDevice.CD_DownLoad(stCardNo,stValidDate,cCardType,cRegCode,cTimeCode,'L',True,nPositionNum,UseCardPosition);
        end;
        ShowAccessEvent(inttostr(AUTH), '001', stTimestr,
        inttostr(NodeNo),stECUID,cDoorNo, cReaderNo, stCardNo, stEmName,
        '', '', stEmCode,'');
        Exit;
      end else //권한 테이블에 권한이 미등록 되어 있고
      begin
        if (cPermit = #$31) or (cPermit = #$32) then  //승인허가이면 권한삭제
        begin
          if cRegCode = '4' then
          begin
            aDevice.CD_DownLoad(stCardNo,stValidDate,'0','0','0','N',True,nPositionNum,UseCardPosition);   //권한이 아예 없는 경우
          end else if cRegCode <> '5' then //DB Select 오류가 아니면
          begin
            if (cACType = '1') AND (cPTType = '1') then cCardType := '2' //출입+방범
            else if (cACType = '1') then cCardType := '0' //출입전용
            else if (cPTType = '1') then cCardType := '1' //방범전용
            else cCardType := '3';
            aDevice.CD_DownLoad(stCardNo,stValidDate,cCardType,cRegCode,cTimeCode,'L',True,nPositionNum,UseCardPosition);  //권한 다운로드
          end;
        end;
      end;
    end;

    if cPosi = 'S' then Exit;  //서버에서 승인 내려 보낸거면 다시 탈 필요 없다.

    //StatusBar1.Panels[2].Text := '[GetSCSAuthentication]';
    nSCSResult := GetSCSAuthentication(stTimestr,inttostr(NodeNo),stECUID,cDoorNo,stCardNo,
           stEmCode,stCompanyCode,stJijumCode,stDepartCode,stPosiCode,
           stEmName,stCompanyName,stJijumName,stDepartName,stPosiName);

    if isDigit(cPosi) and ((cCardManageMode = '0') OR (cCardManageMode = '2')) then //Server 제어가 아니고 Positive인경우에만 처리
    begin
      cAuth := 'N';//미승인

      //서버 승인코드 업데이트
      if nSCSResult = NOTSERVERCONNECTED then stAuthType := '003' //DB 접속실패승인
      else if nSCSResult = AUTH then stAuthType := '001'          //승인
      else stAuthType := '002';                                   //미승인


{      stSql := CommonSql.UpdateTB_ACCESSEVENTAUTHTYPE(
                         copy(stTimestr,1,8),
                         copy(stTimestr,9,6),
                         inttostr(NodeNo),
                         stECUID,
                         cDoorNo,
                         stCardNo,
                         stAuthType);
      DataModule1.ProcessEventExecSQL(stSql);

      stSql := CommonSql.UpdateTB_ACCESSEVENTSCSHIS(
                         copy(stTimestr,1,8),
                         copy(stTimestr,9,6),
                         inttostr(NodeNo),
                         stECUID,
                         cDoorNo,
                         stCardNo,
                         inttostr(nSCSResult));
      DataModule1.ProcessEventExecSQL(stSql); }

      if aDevice = nil then
      begin
        //StatusBar1.Panels[2].Text := '[UpdateTB_ACCESSEVENTEmployeeInfo]';
        stSql := CommonSql.UpdateTB_ACCESSEVENTEmployeeInfo(
                           copy(stTimestr,1,8),
                           copy(stTimestr,9,6),
                           inttostr(NodeNo),
                           stECUID,
                           cDoorNo,
                           stCardNo,
                           stEmCode,
                           stCompanyCode,
                           stJijumCode,
                           stDepartCode,
                           stPosiCode,
                           stEmName,
                           inttostr(nSCSResult),
                           stAuthType );
        DataModule1.ProcessEventExecSQL(stSql);
        ShowAccessEvent(inttostr(nSCSResult), stAuthType, stTimestr,
        inttostr(NodeNo),stECUID,cDoorNo, cReaderNo, stCardNo, stEmName,
        stCompanyName, stJijumName, stEmCode,stPosiName);
        Exit;
      end;

      if (nSCSResult = AUTH) then cAuth := 'R';
      if G_nSCSRelayServer = 0 then
      begin
         if (nSCSResult = NOTSERVERCONNECTED) then cAuth := 'R';   //경희대 24시간 열람실은 서버 접속 실패시 문을 열자
      end;
      nSCSResult := aDevice.ServerDoorControl(cReaderNo,cDoorNo,cButton,stCardNo,cAuth);

      stSql := CommonSql.UpdateTB_ACCESSEVENTEmployeeInfo(
                         copy(stTimestr,1,8),
                         copy(stTimestr,9,6),
                         inttostr(NodeNo),
                         stECUID,
                         cDoorNo,
                         stCardNo,
                         stEmCode,
                         stCompanyCode,
                         stJijumCode,
                         stDepartCode,
                         stPosiCode,
                         stEmName,
                         inttostr(nSCSResult),
                         stAuthType );
      DataModule1.ProcessEventExecSQL(stSql);

      if G_nSCSRelayServer = 2 then
      begin
        //여기에서 시리얼로 데이터 전송 하자.
        SendDisPlay( inttostr(NodeNo),stECUID,cDoorNo,stAuthType);
      end;

    end;
    if isDigit(cPosi) then
      ShowAccessEvent(inttostr(nSCSResult), stAuthType, stTimestr,
        inttostr(NodeNo),stECUID,cDoorNo, cReaderNo, stCardNo, stEmName,
        stCompanyName, stJijumName, stEmCode,stPosiName)

  Finally
    if useProcessCount then
    begin
      FCS.Enter;
      G_nProcessCount := G_nProcessCount - 1;
      FCS.Leave;
      StatusBar1.Panels[2].Text := inttostr(G_nProcessCount);
    end;
  End;
end;

//문상태 변경 데이터 처리
procedure TfmMain.DeviceRcvChangeDoorData(Sender: TObject;
  ReceiveData: string; NODENO :integer);
Var
  st: String;
  stECUID: String;
  stDoorNo: String;
  cMsgNo: Char;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;
begin
  //0434K1123456700c6
  //19쨰 ~
  //D20000504161543370000O D3

  if Length(ReceiveData) < 40 then    Exit;

  stECUID := Copy(ReceiveData,15,2);
  stDoorNo:= ReceiveData[21];

  cMsgNo:=    ReceiveData[18];
  cDoorState:= ReceiveData[40];    //문상태
  cDoorMode:=  ReceiveData[37];    //운영/개방
  cDoorMode2:= ReceiveData[36];    //Posi/Nega

  //UpdateTB_DOORState(inttostr(NODENO),stECUID,stDoorNo,cDoorMode,cDoorMode2,cDoorState);
end;

procedure TfmMain.DeviceRcvDoorControl(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
var
  stECUID: String;
  stDoorNo: String;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;

begin
  //SHowMessage(ReceiveData);

  stECUID := Copy(ReceiveData,15,2);
  stDoorNo:= ReceiveData[21];

  cDoorMode2:= ReceiveData[24];    //Posi/Nega
  cDoorMode:=  ReceiveData[25];    //운영/개방
  cDoorState:= ReceiveData[26];    //문상태

//  UpdateTB_DOORState(inttostr(NODENO),stECUID,stDoorNo,cDoorMode,cDoorMode2,cDoorState);

end;

procedure TfmMain.DeviceRcvDoorSetup(Sender: TObject; ReceiveData: string;
  NodeNO: integer);
var
  nDoorNo : integer;
  stData : string;
  stEcuID : string;
begin
//         1         2
//123456789012345678901234567
//a11  0040000000100000000095
  {기기 문번호}

  Try
    stEcuID:= Copy(ReceiveData,15,2);
    stData := Copy(ReceiveData,19,Length(ReceiveData)-20);
    if stData[3] >= #$30 then
    begin
      nDoorNo := StrtoInt(stData[3]);
    end else Exit;
    if L_bDeviceSettingShow then
    begin
      fmDeviceSetting.DoorInfoSetting(inttostr(NodeNo),stEcuID,inttostr(nDoorNo),stData);
    end else Exit;  //기기설정에서 셋팅한 정보가 아니면 Exit;
    //if stData[1] <> 'g' then Exit;  //이프로그램에서는 'g' 만 사용함
    if stData[1] <> 'a' then Exit;

    if nDoorNo > DOORCOUNT then    Exit;
    bDoorInfoSet[nDoorNo - 1] := True;
    UpdateTB_DOORACK(inttostr(NodeNO),stEcuID,inttostr(nDoorNo),'Y');
  Finally
    if useProcessCount then
    begin
      FCS.Enter;
      G_nProcessCount := G_nProcessCount - 1;
      FCS.Leave;
      StatusBar1.Panels[2].Text := inttostr(G_nProcessCount);
    end;
  End;

end;

procedure TfmMain.DeviceNotDefineData(Sender: TObject; ReceiveData: string;
  NodeNO: integer);
begin
//
end;

procedure TfmMain.DeviceErorData(Sender: TObject; ReceiveData: string;
  NodeNO: integer);
begin
//
end;

function TfmMain.ProcessFoodData(aTime, aCardNo,  aECUID: string;aNodeNO:integer;
  aReaderNo, aFoodCode, aPermit: char): Boolean;
var
  stDateStr: String;
  wYear    : word;
  wMonth   : word;
  wDay     : word;
  wHour    : word;
  wMinute  : word;
  wSecond  : word;
  dtPresent: TDatetime;
  cPermit: Char;
  dtStartTime : TDatetime;
  dtEndTime : TDatetime;
  stFoodCode: String;
  stSql : string;
  i : integer;
  DeviceIndex : integer;
  stRelay : string;
  stFoodData : string;
  stCompanyCode,stEmCode : string;
begin
  if isDigit(aPermit) then cPermit:= 'Y'    //#31 또는 #32 이면 승인 아니면 N
  else                     cPermit:= 'N';

  wYear  := StrtoInt(Copy(aTime,1,4));
  wMonth := StrtoInt(Copy(aTime,5,2));
  wDay   := StrtoInt(Copy(aTime,7,2));
  wHour  := StrtoInt(Copy(aTime,9,2));
  wMinute:= StrtoInt(Copy(aTime,11,2));
  wSecond:= StrtoInt(Copy(aTime,13,2));

  dtPresent:= EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, wSecond,00);
  stFoodCode := '000'; // 디폴트코드
  
//  if FoodConfigCodeList.Count < 1 then Exit; //FoodCount 가 없으면 식수환경 설정이 없으므로 그만두자
  for i:= 0 to FoodConfigCodeList.Count - 1 do
  begin
    if bApplicationTerminate then Exit;
    wHour := strtoInt(copy(FoodConfigStartList.Strings[i],1,2));
    wMinute := strtoInt(copy(FoodConfigStartList.Strings[i],3,2));
    dtStartTime := EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, 00,00);
    wHour := strtoInt(copy(FoodConfigEndList.Strings[i],1,2));
    wMinute := strtoInt(copy(FoodConfigEndList.Strings[i],3,2));
    dtEndTime := EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, 00,00);
    if (dtPresent >=  dtStartTime ) And (dtPresent <=  dtEndTime ) then
    begin
       stFoodCode:= FoodConfigCodeList.Strings[i];
       break;
    end;
  end;

  stDateStr:= Copy(aTime,1,8);

  if FOODGRADE = 1 then //서버에서 승인 권한 체크 하는 경우
  begin
    //여기에서 aPermit 을 체크하자...
    cPermit := GetCheckFoodPermit(Fillzeronumber(wYear,4),Fillzeronumber(wMonth,2),Fillzeronumber(wDay,2),stFoodCode,aCardNo);
    if UseDeviceServer then
      DeviceIndex:= DeviceList.Indexof(FillZeroNumber(aNodeNO,3) + aEcuID)
    else
      DeviceIndex:= DeviceClientDeviceList.Indexof(FillZeroNumber(aNodeNO,3) + aEcuID);

    //릴레이 신호 보내자.
    if DeviceIndex > -1 then
    begin
      if cPermit = 'Y' then
      begin
        stRelay := 'RY0001f01';
        if UseDeviceServer then
          Tdevice(DeviceList.Objects[DeviceIndex]).SendPacket('R',stRelay,True)
        else
          TECUInfo(DeviceClientDeviceList.Objects[DeviceIndex]).SendPacket('R',stRelay,True);
      end else if cPermit = 'D' then
      begin
        stRelay := 'RY0002f01';
        if UseDeviceServer then
          Tdevice(DeviceList.Objects[DeviceIndex]).SendPacket('R',stRelay,True)
        else
          TECUInfo(DeviceClientDeviceList.Objects[DeviceIndex]).SendPacket('R',stRelay,True);
      end else
      begin
        stRelay := 'RY0003f01';
        if UseDeviceServer then
          Tdevice(DeviceList.Objects[DeviceIndex]).SendPacket('R',stRelay,True)
        else
          TECUInfo(DeviceClientDeviceList.Objects[DeviceIndex]).SendPacket('R',stRelay,True);
      end;
    end;
  end;
  //여기서 식수 관제 프로그램에 데이터 송신
  stFoodData:= 'F'+ ';' + aTime+ ';' + FillZeroNumber(aNodeNO,3) + aEcuID+ ';' + aReaderNo + ';' + aCardNo + ';' + cPermit + ';' + #$0D;
  FDSendClientData(stFoodData);

  if Not GetEmCode(aCardNo,stCompanyCode,stEmCode) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'미등록카드' + ':' + stFoodData);
    Exit;
  end;
  if not dmAdoQuery.DupCheckTB_FOOD_EVENT(aTime,aNodeNo,aECUID,aReaderNo,stCompanyCode,stEmCode) then
  begin
      stSql := stSql + 'Insert into TB_FOODEVENT';
      stSql := stSql + '(GROUP_CODE,FO_DATE,FO_TIME,AC_NODENO,AC_ECUID,';
      stSql := stSql + 'FO_DOORNO,CO_COMPANYCODE,EM_CODE,FO_FOODCODE,FO_PERMIT,FO_INSERTTIME) ';
      stSql := stSql + 'Values ';
      stSql := stSql + '(';
      stSql := stSql + '''' + GROUPCODE + ''',';
      stSql := stSql + '''' + copy(aTime,1,8) + ''',';
      stSql := stSql + '''' + copy(aTime,9,6) + ''',';
      stSql := stSql + inttostr(aNodeNo) + ',';
      stSql := stSql + '''' + aECUID + ''',';
      stSql := stSql + '''' + aReaderNo + ''',';
      stSql := stSql + '''' + stCompanyCode + ''',';
      stSql := stSql + '''' + stEmCode + ''',';
      stSql := stSql + '''' + stFoodCode + ''',';
      stSql := stSql + '''' + cPermit + ''',';
      stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''')';

      DataModule1.ProcessEventExecSQL(stSql);

  end;
end;

function TfmMain.LoadFoodConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    FoodConfigCodeList.Clear;
    FoodConfigStartList.Clear;
    FoodConfigEndList.Clear;

    stSql := 'select * from TB_FOODCODE ';
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

      First;
      while Not Eof do
      begin
        if bApplicationTerminate then Exit;
        FoodConfigCodeList.Add(FindField('FO_FOODCODE').AsString);
        FoodConfigStartList.Add(FindField('FO_STARTTIME').AsString );
        FoodConfigEndList.Add(FindField('FO_ENDTIME').AsString );

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

//업데이트 방식의 근태 처리로 2교대 이상의 상황에서는 사용 불가
function TfmMain.ProcessAttendData1(aTime, aCardNo: String): Boolean;
var
  stDate: String;
  wYear    : word;
  wMonth   : word;
  wDay     : word;
  wHour    : word;
  wMinute  : word;
  wSecond  : word;
  dtPresent: TDatetime;
  dtYesterDay : TDatetime;

  stAttendCode : string; //출근코드
  nWeekCode : integer; //1:공휴일,7:토요일
  stAttendType : string;
  stEMCode : string;
  stCompanyCode : string;
begin
  if Not GetEmployeeInfo(aCardNo,False,stCompanyCode,stEMCode) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '근태 데이터 사원정보 조회오류',aTime+':'+aCardNo);
    Exit;
  end;

  wYear  := StrtoInt(Copy(aTime,1,4));
  wMonth := StrtoInt(Copy(aTime,5,2));
  wDay   := StrtoInt(Copy(aTime,7,2));
  wHour  := StrtoInt(Copy(aTime,9,2));
  wMinute:= StrtoInt(Copy(aTime,11,2));
  wSecond:= StrtoInt(Copy(aTime,13,2));
  dtPresent:= EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, wSecond,00);
  dtYesterDay := dtPresent - 1;

  stDate:= Copy(aTime,1,8);

  //오늘이 무슨요일인가? 알자...
  nWeekCode := DayOfWeek(dtPresent); //1: 일요일,7:토요일
  if nWeekCode <> 1 then
    if CheckHolidy(Copy(aTime,1,4),Copy(aTime,5,2),Copy(aTime,7,2)) then nWeekCode := 1; //공휴일이면

  //L_nSaturday //0:휴무,1:반휴일,2:평일
  if nWeekCode = 7 then //토요일 이면 평일로 쓸건지 여부 체크
  begin
    if L_nSaturday = 0 then  nWeekCode := 1      //공휴일 처리
    else if L_nSaturday = 2 then nWeekCode := 8; //평일 처리
  end;

  stAttendType := GetUpdateAttendType(aTime,stCompanyCode,stEMCode,dtYesterDay);

  if stAttendType = '1' then //출근
  begin
    InsertATTENDINCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode);
  end else if stAttendType = '2' then //퇴근
  begin
    InsertATTENDOUTCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '근태 데이터 저장 오류[근태코드]',aTime+':'+stCompanyCode+':'+stEMCode+':'+stAttendType);
    Exit;
  end;

end;

function TfmMain.ProcessAttendData2(aTime, aCardNo: String;
  aAttendCode: Char): Boolean;
var
  stDate: String;
  wYear    : word;
  wMonth   : word;
  wDay     : word;
  wHour    : word;
  wMinute  : word;
  wSecond  : word;
  dtPresent: TDatetime;
  dtYesterDay : TDatetime;

  nWeekCode : integer; //1:공휴일,7:토요일

  stEMCode : string;
  stCompanyCode : string;

begin
  if Not GetEmployeeInfo(aCardNo,False,stCompanyCode,stEMCode) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '근태 데이터 사원정보 조회오류',aTime+':'+aCardNo+':'+aAttendCode);
    Exit;
  end;

  wYear  := StrtoInt(Copy(aTime,1,4));
  wMonth := StrtoInt(Copy(aTime,5,2));
  wDay   := StrtoInt(Copy(aTime,7,2));
  wHour  := StrtoInt(Copy(aTime,9,2));
  wMinute:= StrtoInt(Copy(aTime,11,2));
  wSecond:= StrtoInt(Copy(aTime,13,2));
  dtPresent:= EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, wSecond,00);
  dtYesterDay := dtPresent - 1;

  stDate:= Copy(aTime,1,8);

  //오늘이 무슨요일인가? 알자...
  nWeekCode := DayOfWeek(dtPresent); //1: 일요일,7:토요일
  if nWeekCode <> 1 then
    if CheckHolidy(Copy(aTime,1,4),Copy(aTime,5,2),Copy(aTime,7,2)) then nWeekCode := 1; //공휴일이면

    //L_nSaturday //0:휴무,1:반휴일,2:평일
  if nWeekCode = 7 then //토요일 이면 평일로 쓸건지 여부 체크
  begin
    if L_nSaturday = 0 then  nWeekCode := 1      //공휴일 처리
    else if L_nSaturday = 2 then nWeekCode := 8; //평일 처리
  end;

  if aAttendCode = '1' then //출근
  begin
    InsertATTENDINCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode);
  end else if aAttendCode = '2' then //퇴근
  begin
    InsertATTENDOUTCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
  end else if aAttendCode = '3' then //외출
  begin
    InsertATTENDLEAVECode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
    //여기에서 외출시 현재 퇴근이면...
    if L_nNonBackType = 0 then //미복귀시 현재 시간으로 퇴근 처리
      InsertATTENDOUTCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay)
    else if L_nNonBackType = 1 then //미복귀시 정상 퇴근 처리
    begin
      dmAdoQuery.TB_ATEVENTOuttimeUpdate(stDate,stCompanyCode,stEMCode,aTime,'001');
    end;
  end else if aAttendCode = '4' then //복귀
  begin
    InsertATTENDBACKCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
    dmAdoQuery.TB_ATEVENTOuttimeUpdate(stDate,stCompanyCode,stEMCode,'','000'); //퇴근시간 지움
  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '근태 데이터 저장 오류[근태코드]',aTime+':'+aCardNo+':'+aAttendCode);
    Exit;
  end;


end;

function TfmMain.LoadAttendConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    AttendConfigCodeList.Clear;
    AttendConfigInFromTimeList.Clear;
    AttendConfigInToTimeList.Clear;
    AttendConfigWorkTimeList.Clear;
    AttendConfigOutTimeList.Clear;
    AttendConfigExtendTimeList.Clear;
    AttendConfigNightTimeList.Clear;
    AttendConfigSInFromTimeList.Clear;
    AttendConfigSInToTimeList.Clear;
    AttendConfigSWorkTimeList.Clear;
    AttendConfigSOutTimeList.Clear;
    AttendConfigSExtendTimeList.Clear;
    AttendConfigSNightTimeList.Clear;
    AttendConfigHInFromTimeList.Clear;
    AttendConfigHInToTimeList.Clear;
    AttendConfigHWorkTimeList.Clear;
    AttendConfigHOutTimeList.Clear;
    AttendConfigHExtendTimeList.Clear;
    AttendConfigHNightTimeList.Clear;

    L_YesterDayStandTime := '0000'; //기준시간 = 00시 00분
    L_ToDayStandTime := '0000'; // 기준시간 = 00시 00분

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

      First;
      while Not Eof do
      begin
        if bApplicationTerminate then Exit;
        AttendConfigCodeList.Add(FindField('AT_ATCODE').AsString);
        AttendConfigInFromTimeList.Add(FindField('AT_INFROMTIME').AsString);
        AttendConfigInToTimeList.Add(FindField('AT_INTOTIME').AsString);
        AttendConfigWorkTimeList.Add(FindField('AT_WORKSTARTTIME').AsString);
        AttendConfigOutTimeList.Add(FindField('AT_WORKENDTIME').AsString);
        AttendConfigExtendTimeList.Add(FindField('AT_EXTENDTIME').AsString);
        AttendConfigNightTimeList.Add(FindField('AT_NIGHTTIME').AsString);
        AttendConfigSInFromTimeList.Add(FindField('AT_SINFROMTIME').AsString);
        AttendConfigSInToTimeList.Add(FindField('AT_SINTOTIME').AsString);
        AttendConfigSWorkTimeList.Add(FindField('AT_SWORKSTARTTIME').AsString);
        AttendConfigSOutTimeList.Add(FindField('AT_SWORKENDTIME').AsString);
        AttendConfigSExtendTimeList.Add(FindField('AT_SEXTENDTIME').AsString);
        AttendConfigSNightTimeList.Add(FindField('AT_SNIGHTTIME').AsString);
        AttendConfigHInFromTimeList.Add(FindField('AT_HINFROMTIME').AsString);
        AttendConfigHInToTimeList.Add(FindField('AT_HINTOTIME').AsString);
        AttendConfigHWorkTimeList.Add(FindField('AT_HWORKSTARTTIME').AsString);
        AttendConfigHOutTimeList.Add(FindField('AT_HWORKENDTIME').AsString);
        AttendConfigHExtendTimeList.Add(FindField('AT_HEXTENDTIME').AsString);
        AttendConfigHNightTimeList.Add(FindField('AT_HNIGHTTIME').AsString);

        Next;
      end;

      stSql := 'select * from TB_CONFIG ';
      stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND CO_CONFIGGROUP = ''ATTEND'' ';

      Close;
      //Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;

      First;
      if RecordCount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then Exit;
          if FindField('CO_CONFIGCODE').AsString = 'YTIME' then
            L_YesterDayStandTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'TTIME' then
            L_ToDayStandTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then
            L_nSaturday := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then
            L_nDeviceType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
            L_nATType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'OUTTIME' then
            L_nNonBackType := strtoint(FindField('CO_CONFIGVALUE').AsString);

          next;
        end;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Result := True;
end;

procedure TfmMain.Action_DaemonRestartExecute(Sender: TObject);
var
  stClientSendData : string;
begin
  if bDaemonRestart then Exit;
  btnDaemonRestart.Enabled := False;
  bDaemonRestart := True;
  //Delay(500);
  Action_DaemonstopExecute(self);
  Delay(1000);
  if bApplicationTerminate then Exit;
  Action_DaemonstartExecute(self);
  //여기에서 데몬이 Restart 하는 정보를 Client 에 정보 전송함...
  stClientSendData := 'R' +
                      'S' +
                      '000' +
                      '00' +
                      '00' +
                      '00' +
                      'SV' +
                      'R' +
                      FillZeroNumber(Length('RESTART'),3) +
                      'RESTART';
  SendClientData(stClientSendData);
  ATSendClientData(stClientSendData);
  bDaemonRestart := False;
  btnDaemonRestart.Enabled := True;
end;

function TfmMain.DaemonConfigSet: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    CARDLENGTHTYPE := 0; //디폴트로 고정 4Byte 사용
    DUPCARDTYPE := 0; //1인당 한장의 카드 사용 원칙
    IsNumericCardNo := True; //카드번호 숫자타입 사용/미사용

    HidCardType := 0; //범용 카드
    
    DaemonServerIP := '127.0.0.1';
    DaemonServerPort := '1000'; //디폴트 포트
    AttendServerPort := '3433';
    FoodServerPort := '3432';
    FTPServerPort := '3001';

    UseDeviceServer := True; //기본적으로 기기가 서버인 구조이다.
    DeviceServerPort1 := 3000;
    DeviceServerPort2 := 3001;
    DeviceServerPort3 := 3002;

    UseCardPosition := False; //카드 위치정보 사용 유무
    G_bACEventFull := True;   //출입이력을 전체 남기자.
    G_nFTPUse := 0;           //FTP사용
    G_nMultiDaemon := 0;      //데몬 단독 동작

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND (CO_CONFIGGROUP = ''DAEMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'') ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      while Not Eof do
      begin
        if bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'PORT' then  DaemonServerPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'FTPPORT' then FTPServerPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'ATPORT' then AttendServerPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'FOODPORT' then FoodServerPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'IP' then DaemonServerIP := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString= 'CLIENTCNT' then DaemonAccecptClientCount := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'LOGINTYPE' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'FALSE' then L_bLogined := True
          else L_bLogined := False;
        end
        else if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then CARDLENGTHTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'DUPCARD' then DUPCARDTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'CARDNUM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then IsNumericCardNo := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'DEVICESVER' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then UseDeviceServer := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'DTOSPORT1' then
        begin
          if IsDigit(FindField('CO_CONFIGVALUE').AsString) then DeviceServerPort1 := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'DTOSPORT2' then
        begin
          if IsDigit(FindField('CO_CONFIGVALUE').AsString) then DeviceServerPort2 := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'DTOSPORT3' then
        begin
          if IsDigit(FindField('CO_CONFIGVALUE').AsString) then DeviceServerPort3 := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'CAPOSINUM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then UseCardPosition := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'ACEVENT' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then G_bACEventFull := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'FTPUSE' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nFTPUse := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'MULTI' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMultiDaemon := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'MAXPROCESS' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMaxProcessCount := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'HIDCARD' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then HidCardType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'SPECIALCD' then nSpecialProgram := strtoint(FindField('CO_CONFIGVALUE').AsString);

        Next;
      end;
    end;
  Finally
//    if nSpecialProgram = 1 then CARDLENGTHTYPE := 2; // KT 사옥 프로그램인 경우는 무조건 HEX<->ASCII
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if G_nMultiDaemon > 0 then // 멀티 데몬인경우
  begin
    if Not GetMultiDaemonConfig(DaemonServerIP,DaemonServerPort,AttendServerPort,FoodServerPort,FTPServerPort) then
      G_nMultiDaemon := 0;
  end;
  result := True;
end;

procedure TfmMain.ServerSocket1Accept(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  statusbar1.Panels[3].Text := inttostr(ServerSocket1.Socket.ActiveConnections) + ' Connect';
end;

procedure TfmMain.ServerSocket1GetThread(Sender: TObject;
  ClientSocket: TServerClientWinSocket;
  var SocketThread: TServerClientThread);
begin


  if ServerSocket1.Socket.ActiveConnections > DaemonAccecptClientCount then
  begin
    ClientSocket.SendText('E' + '000' + 'Sorry! Max Client Connected.' + LINEEND);
    ClientSocket.Close;
  end
  else
  begin
    SocketThread := TMyServerThread.Create(False, ClientSocket);
  end;

end;

procedure TfmMain.RSERVER1NewConnect(ClientThread: TDXClientThread);
Var
   Ws:String;
   I: Integer;
   aIndex: Integer;
   StartTime:Comp;
   aLog: String;
   Sock: Integer;
   nIndex : integer;
   st: string;
   st2: string;
begin
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;
  DXUnicastDataQueue1.AddSock(Sock);

  StartTime:=TimeCounter+ 600000;
  ws:='';

  While ClientThread.Socket.Connected and (not DXString.Timeout (StartTime) ) do
  Begin
    If Application.Terminated then
    Begin
       ClientThread.Socket.CloseNow;
       Exit;
    End;
    //If ForceAbort then Exit;

    If ClientThread.Socket.Readable then
    Begin
      If ClientThread.Socket.CharactersToRead=0 then
      begin
        Break;
      end else
      begin
        for I:= 1 to ClientThread.Socket.CharactersToRead do
        begin
          if bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {원격지에서 받은 데이터 처리 루틴추가}
        nIndex := pos(LINEEND,Ws);
        if nIndex > 0 then
        begin
          repeat
            st:= CheckClientDataPacket(Ws,st2);
            Ws:= st2;
{            if pos('DEAMONRESTART',st) > 0 then
            begin
               ClientThread.Socket.Disconnect;
            end;    }
            if st <> '' then RcvFromClient(ClientThread.Socket.PeerIPAddress,st);
            //ClientThread.Socket.WriteLn(st);
          until pos(LINEEND,Ws) = 0;

          //if Ws <> '' then RcvFromClient(ClientThread.Socket.PeerIPAddress,ws);
          //Ws:= Ws ;

          //ws:='';
        end;

      end;
      StartTime:=TimeCounter+ 600000;
    End
    Else Begin
       DoSleepEx(1);
       //Application.ProcessMessages;
       ProcessWindowsMessageQueue;
    end;
  end;
  DXUnicastDataQueue1.DelSock(Sock);

end;

procedure TfmMain.RcvFromClient(aClientIP, ast: string);
var
  nIndex : integer;
  stCMD : string;
  stDeviceID : string;
  bSendAll : Boolean;
begin
  nIndex := pos(DATADELIMITER,ast);
  stCMD := Trim(copy(ast,1,nIndex - 1));
  Delete(ast,1,nIndex);
  nIndex := pos(DATADELIMITER,ast);
  stDeviceID := copy(ast,1,nIndex - 1);
  Delete(ast,1,nIndex);
  if mem_ComList.Visible then
  begin
    mem_ComList.Lines.Add('[RX]'+ aClientIP + '['+ast+']');
  end;

  if stCMD = 'STATECHECK' then DeviceSTATECHECK(stDeviceID)            //상태확인
  else if stCMD = 'ALARMCHECK' then CheckAlarmSTATE(stDeviceID)      //방범상태확인
  else if stCMD = 'DEVICEALARMSTATE' then CheckDEVICEALARMSTATE(stDeviceID)      //데몬의 방범상태확인
  else if stCMD = 'DOOROPEN' then DoorOpen(stDeviceID)               //출입승인
  else if stCMD = 'OPENMODE' then DoorModeChange(stDeviceID,'1')     //개방모드
  else if stCMD = 'OPERATEMODE' then DoorModeChange(stDeviceID,'0')  //운영모드
  else if stCMD = 'CLOSEMODE' then DoorModeChange(stDeviceID,'2')  //폐쇄모드
  else if stCMD = 'TIMESYNC' then DeviceTimeSync(stDeviceID)         //시간동기화
  else if stCMD = 'REBOOT' then DeviceReboot(stDeviceID)             //기기 재부팅
  else if stCMD = 'ALARMSETTING' then DeviceAlarmModeChange(stDeviceID,'1')  //경계
  else if stCMD = 'ALARMDISABLE' then DeviceAlarmModeChange(stDeviceID,'0')  //경계해제
//  else if stCMD = 'HOLIDAY' then DeviceHoliday(stDeviceID)  //공휴일 다운로드
  else if stCMD = 'CARDDOWNLOAD' then  //카드권한다운로드
  begin
    if ast[1] = 'Y' then bSendAll := True
    else bSendAll := False;
    CardNoDownload(strtoint(copy(stDeviceID,1,3)),copy(stDeviceID,4,2),bSendAll);
  end
  else if stCMD = 'DEAMONRESTART' then
  begin
    DaemonRestartTimer.Enabled := True;
    //Action_DaemonRestartExecute(self);
  end else if stCMD = 'SCHEDULETIMER' then DeviceInfoSendTimer.Enabled := True   //데몬재시작
  else if stCMD = 'FIRERECOVERY' then DeviceFireRecovery(stDeviceID);
//
end;

function TfmMain.DaemonLogConfigSet: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    DaemonLogFullData := 'N';
    DaemonLogDeleteDay := 3;
    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_CONFIGGROUP = ''DAEMONLOG'' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      while Not Eof do
      begin
        if bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'FULLLOG' then  DaemonLogFullData := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'DELETDAY' then DaemonLogDeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

procedure TfmMain.LogDeleteTimeTimer(Sender: TObject);
var
  dtDate : TDateTime;
  stDate : string;
begin
  if bApplicationTerminate then Exit;
  if DaemonLogDeleteTime > Now then  Exit;
  //StatusBar1.Panels[2].Text := 'LogDeleteTime';
  Application.ProcessMessages;

  DaemonLogDeleteTime := DaemonLogDeleteTime + 1;

  dtDate := Now - DaemonLogDeleteDay;
  stDate := FormatdateTime('yyyymmdd',dtDate);

  DeleteTB_LOWDATA(stDate);

end;

function TfmMain.DeleteTB_LOWDATA(aDate: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Delete From TB_LOWDATA ';
  stSql := stSql + ' where LO_DATE < ''' + aDate + '''';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  Result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.DataBaseConfigSet: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    DataBaseAutoBackup := 'FALSE';
    DataBaseBackupDir := 'c:\Backup';
    DataBaseBackupTime := '0100';
    DataBaseBackupCycle := 10;
    L_nAccessDeleteDay := 90;
    L_nAttendDeleteDay := 90;
    L_nFoodDeleteDay := 90;
    L_nPatrolDeleteDay := 90;
    DataBaseLastBackupDate := FormatDateTime('yyyymmdd',Now);

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_CONFIGGROUP = ''DATABASE'' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      while Not Eof do
      begin
        if bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'AUTO' then  DataBaseAutoBackup := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'BACKDIR' then DataBaseBackupDir := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'BACKTIME' then  DataBaseBackupTime := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'BACKCYCLE' then  DataBaseBackupCycle := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'AT_DELETE' then L_nAttendDeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'FD_DELETE' then L_nFoodDeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'AC_DELETE' then L_nAccessDeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'PT_DELETE' then L_nPatrolDeleteDay := strtoint(FindField('CO_CONFIGVALUE').AsString);
        Next;
      end;
    end;

    stSql := 'select * from TB_CURRENTDAEMON ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CU_STATECODE = ''LASTBACKUP'' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      DataBaseLastBackupDate := FindField('CU_STATEVALUE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

procedure TfmMain.DataBaseBackupTimerTimer(Sender: TObject);
begin
  if bApplicationTerminate then Exit;
  if DBBackupTime > Now then Exit;
  if bDataBaseBackup then Exit;
  bDataBaseBackup := True;
  DBBackupTime := DBBackupTime + DataBaseBackupCycle;    //다음 주기를 구해 놓자
  //StatusBar1.Panels[2].Text := 'DataBaseBackupTimer';
  Application.ProcessMessages;
  
  if FileDataBaseBackup(False) then
  begin
    DeleteTable;

    UpdateTB_CURRENTDAEMON('LASTBACKUP',FormatDateTime('yyyymmdd',now));
  end;

  bDataBaseBackup := False;

end;

function TfmMain.DataBaseBackup(bFull:Boolean): Boolean;

begin
  Result := False;

  if not DirectoryExists(DataBaseBackupDir) then
  begin
   if Not CreateDir(DataBaseBackupDir) then
   begin
      DataBaseBackupTimer.Enabled := False;
      showmessage(DataBaseBackupDir + ' 은 생성할수 없는 디렉토리입니다. 환경설정을 확인 후 재기동하여 주세요. ');
      Exit;
   end;
  end;

  if bDBBackup then Exit;

  bDBBackup := True;

  if DBType = 'MSSQL' then
  begin
    Result := MSSQLDBBackup(bFull);
  end else
  begin
    Result := MDBBackup;
  end;

  bDBBackup := False;

  {
  with Datamodule1.GetObject.ADOExecQuery do
  begin
    stSql := 'BACKUP DATABASE ' + stDBName + ' TO disk = ''' + stBackupFile + '''';
    Close;
    //Sql.Clear;
    Sql.Text := stSql ;

    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;
  }
  Result := True;
end;

function TfmMain.DeleteTable: Boolean;
var
  stSql : string;
  stDate : string; //삭제할 날짜
begin
  Result := False;
  if bApplicationTerminate then Exit;
  //출입 데이터 삭제
  stDate := FormatdateTime('yyyymmdd',Now - L_nAccessDeleteDay);
  stSql := ' Delete From TB_ACCESSEVENT ';
  stSql := stSql + ' where AC_DATE <= ''' + stDate + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //근태 데이터 삭제
  stDate := FormatdateTime('yyyymmdd',Now - L_nAttendDeleteDay);
  stSql := ' Delete From TB_ATEVENT ';
  stSql := stSql + ' where AT_DATE <= ''' + stDate + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //식수 데이터 삭제
  stDate := FormatdateTime('yyyymmdd',Now - L_nFoodDeleteDay);
  stSql := ' Delete From TB_FOODEVENT ';
  stSql := stSql + ' where FO_DATE <= ''' + stDate + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //방범 데이터 삭제
  stDate := FormatdateTime('yyyymmdd',Now - L_nPatrolDeleteDay);
  stSql := ' Delete From TB_ALARMEVENT ';
  stSql := stSql + ' where AL_DATE <= ''' + stDate + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //권한변경 이력 데이터 삭제
  stDate := FormatdateTime('yyyymmdd',Now - L_nAccessDeleteDay);
  stSql := ' Delete From TB_DEVICECARDNO_HIS ';
  if DBTYPE = 'FB' then
    stSql := stSql + ' where substring(DE_UPDATETIME from 1 for 8) <= ''' + stDate + ''' '
  else
    stSql := stSql + ' where substring(DE_UPDATETIME,1,8) <= ''' + stDate + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  Result := True;
end;

function TfmMain.UpdateTB_CURRENTDAEMON(aCode, aValue: String): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := 'Update TB_CURRENTDAEMON Set CU_STATEVALUE = ''' + aValue + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CU_STATECODE = ''' + aCode + ''' ';
  Result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.RecvTimeCheckTimer(Sender: TObject);
var
  tmpTime : Cardinal;
  stSql : string;
  i : integer;
begin
  if bApplicationTerminate then Exit;
  if  L_nCardSendCount = L_nCardAckCount then
  Begin
    if Not bCardDownLoad then
    begin
      //송신 성공
      L_nCardSendCount := 0;
      L_nCardAckCount := 0;

      RecvTimeCheck.enabled := False;
      UpdateTB_DEVICECARDNO('S','N');
    end;
    Exit;
  End;
  
  tmpTime := getTickCount;
  if (SendCardTime + 3000) < tmpTime then
  begin
    //수신 완료 후 3초가 지났는데... 송신 성공이 안되었으면 송신중인 데이터 미송신으로 변경 후 다운로드 해제
    if Not bCardDownLoad then
    begin
      L_nCardSendCount := 0;
      L_nCardAckCount := 0;

      RecvTimeCheck.enabled := False;
      if UseDeviceServer then
      begin
        for i := 0 to ComNodeList.Count - 1 do
        begin
          TCommnode(ComNodeList.Objects[i]).CardSendDataList.Clear; //현재 카드데이터 미 전송 분 Clear 하자
        end;
      end else
      begin
        for i := 0 to DeviceClientNodeList.Count - 1 do
        begin
          TMCUNodeInfo(DeviceClientNodeList.Objects[i]).CardSendDataList.Clear; //현재 카드데이터 미 전송 분 Clear 하자
        end;
      end;
      UpdateTB_DEVICECARDNO('S','N');
    end;
    Exit;

  end;
end;

function TfmMain.MCUCommonConfigSet: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    CardAutoDownLoadUse := False;

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_CONFIGGROUP = ''MCUCOMM'' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      while Not Eof do
      begin
        if bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'CARDAUTO' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then CardAutoDownLoadUse := True;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

procedure TfmMain.CommandArrayCommandsTCommand0Execute(Command: TCommand;
  Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['상태'];
   if stResult = 'TRUE' then bCURRENTSTATE := True
   else bCURRENTSTATE := False;

end;

procedure TfmMain.InitConfigSet;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stFileServerIP : string;
  stFileServerDir : string;
begin
  FileServerPath := '';
  stFileServerDir := '';


  AccessUse := False;
  PatrolUse := False;
  AttendUse := False;
  FoodUse := False;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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

      First;
      While Not Eof do
      begin
        if bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'ACCESS' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  AccessUse := True
          else AccessUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'ALARM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  PatrolUse := True
          else PatrolUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'ATTEND' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  AttendUse := True
          else AttendUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'FOOD' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  FoodUse := True
          else FoodUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'SENSOR' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  SensorUse := True
          else SensorUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'INOUTCOUNT' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  InOutCountUse := True
          else InOutCountUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'FOODDEVICE' then
        begin
          FOODDEVICE := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FOODGRADE' then
        begin
          FOODGRADE := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'FILEDIR' then
        begin
          stFileServerDir := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FILEIP' then
        begin
          stFileServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'ALARMVIEW' then
        begin
          ALARMVIEW := UpperCase(FindField('CO_CONFIGVALUE').AsString);
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if Trim(stFileServerDir) <> '' then
  begin
    FileServerPath := stFileServerDir;
  end;
  //권한관리쪽에서 보여줄 항목을 셋팅하자
  SetVisibleMenue;

end;

procedure TfmMain.CheckDOORSTATE(aDeviceID: string);
var
  stNodeNo,stECUID,stDoorNo : string;
  i : integer;
  aDevice: TDevice;
  aEcuInfo : TECUInfo;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);
  stDoorNo := copy(aDeviceID,6,1);

  if UseDeviceServer then
  begin
    if (stNodeNo = '') or (stNodeNo = '000') then //전체상태조회
    begin
      for i := 0 to DeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        aDevice:= GetDevice(DeviceList.Strings[i] );
        if aDevice <> nil then
        begin
          if aDevice.CommNode.SocketConnected = True then aDevice.CheckDoorState('1');
          if aDevice.CommNode.SocketConnected = True then aDevice.CheckDoorState('2');
        end else
        begin
          Continue;
        end;
      end;
      Exit;
    end;

    if (stECUID = '00') and (stDoorNo = '0') then //노드전체상태조회
    begin
      for i := 0 to DeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        if stNodeNo <> copy(DeviceList.Strings[i],1,3) then Continue;
        aDevice:= GetDevice(DeviceList.Strings[i] );
        if aDevice <> nil then
        begin
          if aDevice.CommNode.SocketConnected = True then aDevice.CheckDoorState('1');
          if aDevice.CommNode.SocketConnected = True then aDevice.CheckDoorState('2');
        end else
        begin
          Continue;
        end;
      end;
      Exit;
    end;

    aDevice:= GetDevice(stNodeNo + stECUID );
    if aDevice <> nil then
    begin
      if aDevice.CommNode.SocketConnected = True then aDevice.CheckDoorState(stDoorNo[1],True);
    end;
  end else
  begin
    if (stNodeNo = '') or (stNodeNo = '000') then //전체상태조회
    begin
      for i := 0 to DeviceClientDeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        aEcuInfo:= GetEcuInfo(DeviceClientDeviceList.Strings[i] );
        if aEcuInfo <> nil then
        begin
          if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckDoorState('1');
          if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckDoorState('2');
        end else
        begin
          Continue;
        end;
      end;
      Exit;
    end;

    if (stECUID = '00') and (stDoorNo = '0') then //노드전체상태조회
    begin
      for i := 0 to DeviceClientDeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        if stNodeNo <> copy(DeviceClientDeviceList.Strings[i],1,3) then Continue;
        aEcuInfo:= GetEcuInfo(DeviceClientDeviceList.Strings[i] );
        if aEcuInfo <> nil then
        begin
          if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckDoorState('1');
          if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckDoorState('2');
        end else
        begin
          Continue;
        end;
      end;
      Exit;
    end;

    aEcuInfo:= GetEcuInfo(stNodeNo + stECUID );
    if aEcuInfo <> nil then
    begin
      if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckDoorState(stDoorNo[1],True);
    end;
  end;

end;

procedure TfmMain.DoorOpen(aDeviceID: string);
var
  stNodeNo,stECUID,stDoorNo : string;
  i : integer;
  aDevice: TDevice;
  aEcuInfo: TEcuInfo;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);
  stDoorNo := copy(aDeviceID,6,1);

  if UseDeviceServer then
  begin
    aDevice:= GetDevice(stNodeNo + stECUID  );
    if aDevice <> nil then
    begin
      if aDevice.CommNode.SocketConnected = True then aDevice.DoorExitButton(stDoorNo[1]);
    end;
  end else
  begin
    aEcuInfo:= GetEcuInfo(stNodeNo + stECUID  );
    if aEcuInfo <> nil then
    begin
      if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.DoorExitButton(stDoorNo[1]);
    end;
  end;

end;

procedure TfmMain.DoorModeChange(aDeviceID: string;aMode:Char);
var
  stNodeNo,stECUID,stDoorNo : string;
  i : integer;
  aDevice: TDevice;
  aEcuInfo: TEcuInfo;
begin
  //LogSave(ExeFolder + '\..\log\ModeChange'+FormatDateTime('yyyymmdd',now)+'.log',aDeviceID + ':' + aMode);
  //StatusBar1.Panels[2].Text := 'ModeChange(' + aDeviceID + ')';
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);
  stDoorNo := copy(aDeviceID,6,1);

  if UseDeviceServer then
  begin
    aDevice:= GetDevice(stNodeNo + stECUID  );
    if aDevice <> nil then
    begin
      if aDevice.CommNode.SocketConnected = True then aDevice.DoorModeChange(stDoorNo[1],aMode)
    end;
  end else
  begin
    aEcuInfo:= GetEcuInfo(stNodeNo + stECUID  );
    if aEcuInfo <> nil then
    begin
      if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.DoorModeChange(stDoorNo[1],aMode)
    end;
  end;

end;

procedure TfmMain.DeviceReboot(aDeviceID: string);
var
  aDevice : TDevice;
  aEcuInfo: TEcuInfo;
begin
  if UseDeviceServer then
  begin
    aDevice := GetDevice(aDeviceID);
    if aDevice <> nil then aDevice.ReBoot;
  end else
  begin
    aEcuInfo := GetEcuInfo(aDeviceID);
    if aEcuInfo <> nil then aEcuInfo.ReBoot;
  end;

end;

procedure TfmMain.DeviceAlarmModeChange(aDeviceID, aMode: string);
var
  aDevice : TDevice;
  aEcuInfo: TEcuInfo;
begin
  if UseDeviceServer then
  begin
    aDevice := GetDevice(aDeviceID);
    if aDevice <> nil then
    begin
      if aMode = '1' then aDevice.ChangewatchMode(cmArm)
      else if aMode = '0' then aDevice.ChangewatchMode(cmDisArm);
    end;
  end else
  begin
    aEcuInfo := GetEcuInfo(aDeviceID);
    if aEcuInfo <> nil then
    begin
      if aMode = '1' then aEcuInfo.ChangewatchMode(cmArm)
      else if aMode = '0' then aEcuInfo.ChangewatchMode(cmDisArm);
    end;
  end;
end;

procedure TfmMain.N13Click(Sender: TObject);
begin
  fmLocateCode:= TfmLocateCode.Create(Self);
  fmLocateCode.WorkCode := 0;
  fmLocateCode.IsInsertGrade := True;
  fmLocateCode.IsUpdateGrade := True;
  fmLocateCode.IsDeleteGrade := True;
  fmLocateCode.SHowmodal;
  fmLocateCode.Free;

end;

procedure TfmMain.N18Click(Sender: TObject);
begin
  fmDeviceCode:= TfmDeviceCode.Create(Self);
  fmDeviceCode.WorkCode := 0;
  fmDeviceCode.IsInsertGrade := True;
  fmDeviceCode.IsUpdateGrade := True;
  fmDeviceCode.IsDeleteGrade := True;
  fmDeviceCode.SHowmodal;
  fmDeviceCode.Free;
  Delay(100);
  Action_DaemonRestartExecute(self);
  Delay(100);
  if bApplicationTerminate then Exit;
  DeviceInfoSendTimer.Enabled := True;

end;

procedure TfmMain.CommandArrayCommandsTCommand1Execute(Command: TCommand;
  Params: TStringList);
begin
  Action_DaemonRestartExecute(Self);  
end;

procedure TfmMain.Action_AttendConfigExecute(Sender: TObject);
begin
  fmAttendConfig:= TfmAttendConfig.Create(Self);
  fmAttendConfig.SHowmodal;
  fmAttendConfig.Free;
  Action_DaemonRestartExecute(self);
  Delay(100);

end;

function TfmMain.PorcessAlaramData(aData: string): Boolean;
begin
//
end;

function TfmMain.InsertTB_ALARMEVENT(aTime, aNodeNo, aEcuID, aMsgNo,
  aSubClass, aSubAddr, aZoneCode, aMode, aPortNo, aStatus, aState,
  aOper,aNewStateCode: string): Boolean;
var
  stSql : string;
  stAlNodeNo : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
{  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;


  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  with TempAdoQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql ;

    Try
      Open;
    Except
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '알람데이터입력오류',aNodeNo + aEcuID +'DB오픈 실패');
      TempAdoQuery.Free;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '알람데이터입력오류',aNodeNo + aEcuID +'미등록 기기');
      RealDataShow('','','Er','',aNodeNo + aEcuID +'미등록 기기[알람데이터입력오류]');
      TempAdoQuery.Free;
      Exit;
    end;
    First;
    stAlNodeNo := FindField('AL_DEVICENO').AsString;
  end;

  TempAdoQuery.Free;    }


  stSql := ' Insert Into TB_ALARMEVENT(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AL_DATE,';
  stSql := stSql + 'AL_TIME,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AL_MSGNO,';
  stSql := stSql + 'AL_ALARMDEVICETYPECODE,';
  stSql := stSql + 'AL_SUBADDR,';
  stSql := stSql + 'AL_ZONECODE,';
  stSql := stSql + 'AL_ALARMMODECODE,';
  stSql := stSql + 'AL_ZONENO,';
  stSql := stSql + 'AL_ZONESTATE,';
  stSql := stSql + 'AL_ALARMSTATUSCODE,';
  stSql := stSql + 'AL_OPERATOR,';
  stSql := stSql + 'AL_STATUSCODE2) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE +''',';
  stSql := stSql + '''' + copy(aTime,1,8) +''',';
  stSql := stSql + '''' + copy(aTime,9,6) +''',';
  stSql := stSql + aNodeNo +',';
  stSql := stSql + '''' + aEcuID +''',';
  stSql := stSql + '''' + aMsgNo +''',';
  stSql := stSql + '''' + aSubClass +''',';
  stSql := stSql + '''' + aSubAddr +''',';
  stSql := stSql + '''' + aZoneCode +''',';
  stSql := stSql + '''' + aMode +''',';
  stSql := stSql + '''' + aPortNo +''',';
  stSql := stSql + '''' + aState  +''',';
  stSql := stSql + '''' + aStatus +''',';
  stSql := stSql + '''' + aOper + ''',';
  stSql := stSql + '''' + aNewStateCode + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

procedure TfmMain.DeviceHoliday(aYear: string);
var
  i,j : integer;
  aDevice : TDevice;
  aEcuInfo : TEcuInfo;
  HolidayList : TStringList;
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  aHoCmd : string;
  bHolidaySendSuccess : Boolean;
begin
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'Select * from TB_HOLIDAY ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    if DBTYPE = 'FB' then
      stSql := stSql + ' AND SUBSTRING(HO_DAY from 1 for 4) = ''' + aYear + ''' '
    else
      stSql := stSql + ' AND SUBSTRING(HO_DAY,1,4) = ''' + aYear + ''' ';

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        UpdateTB_ACCESSDEVICEHoSend('','','Y');
        Exit;
      end;
      First;
      HolidayList := TStringList.Create;
      HolidayList.Clear;
      While Not Eof do
      begin
        if bApplicationTerminate then Exit;
        HolidayList.Add(FindField('HO_STATE').AsString + copy(FindField('HO_DAY').AsString,5,4));
        Next;
      end;
    end;

    if UseDeviceServer then
    begin
      for i:= 0 to HolidaySendDeviceList.Count - 1 do
      begin
        if bApplicationTerminate then Exit;
        nIndex := DeviceList.IndexOf(HolidaySendDeviceList.Strings[i]);
        if nIndex < 0 then continue;
        aDevice := nil;
        aDevice := TDevice(DeviceList.Objects[nIndex]);
        if aDevice <> nil then
        begin
          if Not aDevice.Holiday('W','0100','1') then continue;  //전체문 0
          if Not aDevice.Holiday('W','0100','2') then continue;
          for j:=0 to HolidayList.Count - 1 do
          begin
            if bApplicationTerminate then Exit;
            aHoCmd := 'A';
            bHolidaySendSuccess := False;
            if copy(HolidayList.Strings[j],1,1) = 'D' then aHoCmd := 'D';
            if Not aDevice.Holiday(aHoCmd[1],copy(HolidayList.Strings[j],2,4),'1') then break;
            if Not aDevice.Holiday(aHoCmd[1],copy(HolidayList.Strings[j],2,4),'2') then break;
            bHolidaySendSuccess := True;
          end;
          if bHolidaySendSuccess then UpdateTB_ACCESSDEVICEHoSend(copy(HolidaySendDeviceList.Strings[i],1,3),copy(HolidaySendDeviceList.Strings[i],4,2),'Y');
        end;
      end;
    end else
    begin
      for i:= 0 to HolidaySendDeviceList.Count - 1 do
      begin
        if bApplicationTerminate then Exit;
        nIndex := DeviceList.IndexOf(HolidaySendDeviceList.Strings[i]);
        if nIndex < 0 then continue;
        aEcuInfo := nil;
        aEcuInfo := TEcuInfo(DeviceClientDeviceList.Objects[nIndex]);
        if aEcuInfo <> nil then
        begin
          if Not aEcuInfo.Holiday('W','0100','1') then continue;
          if Not aEcuInfo.Holiday('W','0100','2') then continue;;
          for j:=0 to HolidayList.Count - 1 do
          begin
            if bApplicationTerminate then Exit;
            aHoCmd := 'A';
            bHolidaySendSuccess := False;
            if copy(HolidayList.Strings[j],1,1) = 'D' then aHoCmd := 'D';
            if Not aEcuInfo.Holiday(aHoCmd[1],copy(HolidayList.Strings[j],2,4),'1') then break;
            if Not aEcuInfo.Holiday(aHoCmd[1],copy(HolidayList.Strings[j],2,4),'2') then break;
            bHolidaySendSuccess := True;
          end;
          if bHolidaySendSuccess then UpdateTB_ACCESSDEVICEHoSend(copy(HolidaySendDeviceList.Strings[i],1,3),copy(HolidaySendDeviceList.Strings[i],4,2),'Y');
        end;
        Application.ProcessMessages;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  HolidayList.Free;

end;

//실시간 송수신 현황을 리스트에 조회한다.
procedure TfmMain.RealDataShow(aIp, aECUID, aGubun, aCmd, aData: string);
var
  fmCurrentState :TForm;
begin
  if bCURRENTSTATE then
  begin
    fmCurrentState := MDIForm('TfmCurrentState');
    if fmCurrentState <> nil then
    begin
      TfmCurrentState(fmCurrentState).DisplayStringGrid(aCmd,aGubun,aIp,aECUID,aData);
    end;

    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['IP'] := aIp;
    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['ECUID'] := aECUID;
    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['TxRx'] := aGubun;
    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['Cmd'] := aCmd;
    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['Data'] := aData;
    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Execute;


  end;

end;

procedure TfmMain.CheckAlarmSTATE(aDeviceID: string);
var
  stNodeNo,stECUID : string;
  i : integer;
  aDevice: TDevice;
  aEcuInfo: TEcuInfo;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);

  if UseDeviceServer then
  begin
    if (stNodeNo = '') or (stNodeNo = '000') then //전체상태조회
    begin
      for i := 0 to DeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        aDevice:= GetDevice(DeviceList.Strings[i] );
        if aDevice <> nil then
        begin
          if aDevice.CommNode.SocketConnected = True then aDevice.CheckWatchMode;
        end else
        begin
          Continue;
        end;
      end;
      Exit;
    end;

    //aDevice:= GetDevice(stNodeNo + '00');//stECUID ); //메인 컨트롤에서만 인식함
    aDevice:= GetDevice(stNodeNo + stECUID ); //메인 컨트롤에서만 인식함
    if aDevice <> nil then
    begin
      if aDevice.CommNode.SocketConnected = True then aDevice.CheckWatchMode;
    end;
  end else
  begin
    if (stNodeNo = '') or (stNodeNo = '000') then //전체상태조회
    begin
      for i := 0 to DeviceClientDeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        aEcuInfo:= GetEcuInfo(DeviceClientDeviceList.Strings[i] );
        if aEcuInfo <> nil then
        begin
          if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckWatchMode;
        end else
        begin
          Continue;
        end;
      end;
      Exit;
    end;

    //aEcuInfo:= GetEcuInfo(stNodeNo + '00');//stECUID ); //메인 컨트롤에서만 인식함
    aEcuInfo:= GetEcuInfo(stNodeNo + stECUID ); //메인 컨트롤에서만 인식함
    if aEcuInfo <> nil then
    begin
      if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckWatchMode;
    end;

  end;

end;

procedure TfmMain.N22Click(Sender: TObject);
begin
  DoorscheduleRegForm:= TDoorscheduleRegForm.Create(Self);
  DoorscheduleRegForm.Showmodal;
  DoorscheduleRegForm.Free;
  Delay(1000);
  DeviceInfoSendTimer.Enabled := True;

end;

procedure TfmMain.CommandArrayCommandsTCommand2Execute(Command: TCommand;
  Params: TStringList);
begin
  ScheduleDataSend;  
end;

function TfmMain.ScheduleDataSend: Boolean;
var
  stSql : string;
  stNodeNo,stECUID,stDoorNo : string;
  aDevice: TDevice;
  aEcuInfo: TEcuInfo;
  stSendData : string;
  TempAdoQuery : TADOQuery;
begin

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'select * from TB_DEVICESCHEDULE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND DE_RCVACK = ''N'' ';

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
      First;
      While Not Eof do
      begin
        if bApplicationTerminate then Exit;
        stNodeNo := FillzeroNumber(FindField('AC_NODENO').AsInteger,3);
        stECUID := FindField('AC_ECUID').AsString;
        stDoorNo := FindField('DO_DOORNO').AsString;
        stSendData:= FindField('DE_CELL5TIME').asString + FindField('DE_CELL1MODE').asString+
                  FindField('DE_CELL1TIME').asString + FindField('DE_CELL2MODE').asString+
                  FindField('DE_CELL2TIME').asString + FindField('DE_CELL3MODE').asString+
                  FindField('DE_CELL3TIME').asString + FindField('DE_CELL4MODE').asString+
                  FindField('DE_CELL4TIME').asString + FindField('DE_CELL5MODE').asString;

        if UseDeviceServer then
        begin
          aDevice:= GetDevice(stNodeNo + stECUID );
          if aDevice <> nil then
          begin
            aDevice.SendDoorSchadule(FindField('DO_DOORNO').AsString[1],FindField('DE_DAYCODE').AsString[1],stSendData);
          end;
        end else
        begin
          aEcuInfo:= GetEcuInfo(stNodeNo + stECUID );
          if aEcuInfo <> nil then
          begin
            aEcuInfo.SendDoorSchadule(FindField('DO_DOORNO').AsString[1],FindField('DE_DAYCODE').AsString[1],stSendData);
          end;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

//스케줄 데이터 등록 처리
procedure TfmMain.DeviceRcvScheduleData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
var
  stSql : string;
  stECUID,stDoorNo : string;
begin
  Try
    stECUID := copy(ReceiveData,15,2);
    stDoorNo := copy(ReceiveData,21,1);

    UpdateTB_DEVICESCHEDULEACK(inttostr(NodeNo),stECUID,stDoorNO,'Y');
  Finally
    if useProcessCount then
    begin
      FCS.Enter;
      G_nProcessCount := G_nProcessCount - 1;
      FCS.Leave;
      StatusBar1.Panels[2].Text := inttostr(G_nProcessCount);
    end;
  End;


end;

procedure TfmMain.SetVisibleMenue;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := ' select a.CO_CONFIGCODE,b.CO_CONFIGVALUE ';
    stSql := stSql + ' FROM TB_PROGRAMID a  ';
    stSql := stSql + ' INNER JOIN TB_CONFIG b ';
    stSql := stSql + ' ON (a.CO_CONFIGCODE = b.CO_CONFIGCODE';
    stSql := stSql + ' AND a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND b.CO_CONFIGGROUP = ''MOSTYPE'' )';
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' group by a.CO_CONFIGCODE,b.CO_CONFIGVALUE ';

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;

      while Not Eof do
      begin
        if bApplicationTerminate then Exit;
        UpdateTB_PROTRAMIDVisible(FindField('CO_CONFIGCODE').AsString,FindField('CO_CONFIGVALUE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.UpdateTB_PROTRAMIDVisible(aCode, aValue: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'update TB_PROGRAMID  Set PR_VISIBLE = ''' + aValue + ''' ' ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND PR_VISIBLE <> ''D'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCode + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.MDBBackup: Boolean;
begin
//
end;

function TfmMain.MSSQLDBBackup(bFull:Boolean): Boolean;
begin
  if bApplicationTerminate then Exit;
  result := False;

  result := MSSQLLOMOSTOFILE;
  if Not result then Exit;
  result := MSSQLEVENTTOFILE(bFull);

end;

function TfmMain.MSSQLEVENTTOFILE(bFull:Boolean): Boolean;
var
  conStr:string;
  stDBName : string;
  stBackupDBName : string;
  stSql : string;
  stDate : string;
  TempAdoQuery : TADOQuery;

begin

  if bApplicationTerminate then Exit;

  result := False;
  if bFull then stBackupDBName := DataBaseBackupDir + '\FULLEVENT' + FormatdateTime('yyyymmdd',now) + '.mdb'
  else stBackupDBName := DataBaseBackupDir + '\EVENT' + FormatdateTime('yyyymmdd',now) + '.mdb' ;

  if FileExists(stBackupDBName) then Exit;

  stDBName := ExeFolder + '\..\DB\EVENT.mdb';

  if Not FileExists(stDBName) then Exit;
  FileCtrl.CopyFiles(stDBName,stBackupDBName);

  conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
  conStr := conStr + 'Data Source=' + stBackupDBName + ';';
  conStr := conStr + 'Persist Security Info=True;';
  conStr := conStr + 'Jet OLEDB:Database ';

  with DataModule1.AdoBackupConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          Exit;
        end;
      else
        begin
          Exit;
        end;
    End;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    //MSSQL 출입 데이터를 MDB에 내리자
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nAccessDeleteDay);
    stSql := 'select * from TB_ACCESSEVENT ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_DATE <= ''' + stDate + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_ACCESSEVENT(
              FindField('GROUP_CODE').AsString,
              FindField('AC_DATE').AsString,
              FindField('AC_TIME').AsString,
              FindField('AC_NODENO').AsString,
              FindField('AC_ECUID').AsString,
              FindField('DO_DOORNO').AsString,
              FindField('CA_CARDNO').AsString,
              FindField('AC_READERNO').AsString,
              FindField('AC_DOORPOSI').AsString,
              FindField('AC_INPUTTYPE').AsString,
              FindField('AC_DOORMODE').AsString,
              FindField('AC_PERMITMODE').AsString,
              FindField('PE_PERMITCODE').AsString,
              FindField('AC_INSERTDATE').AsString,
              FindField('AC_INSERTOPERATOR').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    //MSSQL 근태 데이터를 MDB에 내리자
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nAttendDeleteDay);
    stSql := 'select * from TB_ATEVENT ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AT_DATE <= ''' + stDate + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_ATEVENT(
              FindField('GROUP_CODE').AsString,
              FindField('AT_DATE').AsString,
              FindField('CA_CARDNO').AsString,
              FindField('AT_ATCODE').AsString,
              FindField('AT_DEFAULTINTIME').AsString,
              FindField('AT_DEFAULTOUTTIME').AsString,
              FindField('AT_INTIME').AsString,
              FindField('AT_OUTTIME').AsString,
              FindField('AT_INRESULT').AsString,
              FindField('AT_OUTRESULT').AsString,
              FindField('AT_INSERTTIME').AsString,
              FindField('AT_INSERTOPERATOR').AsString,
              FindField('AT_UPDATETIME').AsString,
              FindField('AT_UPDATEOPERATOR').AsString,
              FindField('AT_DEFAULTLATETIME').AsString,
              FindField('AT_HoliyDay').AsString,
              FindField('AT_Night').AsString,
              FindField('AT_CONTENT').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    //MSSQL 식수 데이터를 MDB에 내리자
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nFoodDeleteDay);
    stSql := 'select * from TB_FOODEVENT ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND FO_DATE <= ''' + stDate + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_FOODEVENT(
              FindField('GROUP_CODE').AsString,
              FindField('FO_DATE').AsString,
              FindField('FO_TIME').AsString,
              FindField('AC_NODENO').AsString,
              FindField('AC_ECUID').AsString,
              FindField('FO_DOORNO').AsString,
              FindField('CA_CARDNO').AsString,
              FindField('FO_FOODCODE').AsString,
              FindField('FO_PERMIT').AsString,
              FindField('FO_INSERTTIME').AsString,
              FindField('FO_INSERTOPERATOR').AsString,
              FindField('FO_UPDATETIME').AsString,
              FindField('FO_UPDATEOPERATOR').AsString,
              FindField('FO_CONTENT').AsString,
              FindField('FO_FOODAMT').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    //MSSQL 방범 데이터를 MDB에 내리자
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nPatrolDeleteDay);
    stSql := 'select * from TB_ALARMEVENT ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AL_DATE <= ''' + stDate + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_ALARMEVENT(
              FindField('GROUP_CODE').AsString,
              FindField('AL_DATE').AsString,
              FindField('AL_TIME').AsString,
              FindField('AC_NODENO').AsString,
              FindField('AC_ECUID').AsString,
              FindField('AL_MSGNO').AsString,
              FindField('AL_ALARMDEVICETYPECODE').AsString,
              FindField('AL_SUBADDR').AsString,
              FindField('AL_ZONECODE').AsString,
              FindField('AL_ALARMMODECODE').AsString,
              FindField('AL_ZONENO').AsString,
              FindField('AL_ZONESTATE').AsString,
              FindField('AL_ALARMSTATUSCODE').AsString,
              FindField('AL_ISALARM').AsString,
              FindField('AL_OPERATOR').AsString,
              FindField('AL_INPUTTIME').AsString,
              FindField('AL_INPUTOPERATOR').AsString,
              FindField('AL_CHECKOK').AsString,
              FindField('AL_CHECKCODE').AsString,
              FindField('AL_CHECKMSG').AsString,
              FindField('AL_UPDATETIME').AsString,
              FindField('AL_UPDATEOPERATOR').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;
    //MSSQL 센서 데이터를 MDB에 내리자
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nPatrolDeleteDay);
    stSql := 'select * from TB_SENSOREVENT ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AL_DATE <= ''' + stDate + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_SENSOREVENT(
              FindField('GROUP_CODE').AsString,
              FindField('AL_DATE').AsString,
              FindField('AL_TIME').AsString,
              FindField('AC_NODENO').AsString,
              FindField('AC_ECUID').AsString,
              FindField('AL_MSGNO').AsString,
              FindField('AL_ALARMDEVICETYPECODE').AsString,
              FindField('AL_SUBADDR').AsString,
              FindField('AL_ZONECODE').AsString,
              FindField('AL_ALARMMODECODE').AsString,
              FindField('AL_ZONENO').AsString,
              FindField('AL_ZONESTATE').AsString,
              FindField('AL_ALARMSTATUSCODE').AsString,
              FindField('AL_ISALARM').AsString,
              FindField('AL_OPERATOR').AsString,
              FindField('AL_INPUTTIME').AsString,
              FindField('AL_INPUTOPERATOR').AsString,
              FindField('AL_CHECKOK').AsString,
              FindField('AL_CHECKCODE').AsString,
              FindField('AL_CHECKMSG').AsString,
              FindField('AL_UPDATETIME').AsString,
              FindField('AL_UPDATEOPERATOR').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    // 카드권한 변경 이력을 MDB에 내리자
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nAccessDeleteDay);
    stSql := 'select * from TB_DEVICECARDNO_HIS ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    if DBTYPE = 'FB' then
      stSql := stSql + ' AND substring(DE_UPDATETIME from 1 for 8) <= ''' + stDate + ''' '
    else
      stSql := stSql + ' AND substring(DE_UPDATETIME,1,8) <= ''' + stDate + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_DEVICECARDNO_HIS(
              FindField('SEQ').AsString,
              FindField('GROUP_CODE').AsString,
              FindField('AC_NODENO').AsString,
              FindField('AC_ECUID').AsString,
              FindField('CA_CARDNO').AsString,
              FindField('DE_DOOR1').AsString,
              FindField('DE_DOOR2').AsString,
              FindField('DE_USEACCESS').AsString,
              FindField('DE_USEALARM').AsString,
              FindField('DE_TIMECODE').AsString,
              FindField('DE_PERMIT').AsString,
              FindField('DE_RCVACK').AsString,
              FindField('DE_UPDATETIME').AsString,
              FindField('DE_UPDATEOPERATOR').AsString,
              FindField('HIS_OPER').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmMain.MSSQLLOMOSTOFILE: Boolean;
var
  stBackupDBName : string;
  stDBName : string;
  conStr : string;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stBackupDBName := DataBaseBackupDir + '\LOMOS.mdb';
  if FileExists(stBackupDBName) then
  begin
    FileCtrl.CopyFiles(stBackupDBName,stBackupDBName + '_bak');
  end;

  stDBName := ExeFolder + '\..\DB\LOMOS.mdb';

  if Not FileExists(stDBName) then Exit;
  FileCtrl.CopyFiles(stDBName,stBackupDBName);

  conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
  conStr := conStr + 'Data Source=' + stBackupDBName + ';';
  conStr := conStr + 'Persist Security Info=True;';
  conStr := conStr + 'Jet OLEDB:Database ';

  with DataModule1.AdoBackupConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          Exit;
        end;
      else
        begin
          Exit;
        end;
    End;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    //MSSQL 카드 데이터를 MDB에 내리자
    stSql := 'select * from TB_CARD ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_CARD(
              FindField('GROUP_CODE').AsString,
              FindField('CA_CARDNO').AsString,
              FindField('CA_GUBUN').AsString,
              FindField('CA_CARDTYPE').AsString,
              FindField('EM_CODE').AsString,
              FindField('CO_COMPANYCODE').AsString,
              FindField('CA_UPDATETIME').AsString,
              FindField('CA_UPDATEOPERATOR').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    //MSSQL 사원 데이터를 MDB에 내리자
    stSql := 'select * from TB_EMPLOYEE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_EMPLOYEE(
              FindField('GROUP_CODE').AsString,
              FindField('EM_CODE').AsString,
              FindField('CO_COMPANYCODE').AsString,
              FindField('CO_DEPARTCODE').AsString,
              FindField('PO_POSICODE').AsString,
              FindField('EM_NAME').AsString,
              FindField('EM_COPHONE').AsString,
              FindField('EM_HOMEPHONE').AsString,
              FindField('EM_HANDPHONE').AsString,
              FindField('ZI_ZIPCODE').AsString,
              FindField('EM_ADDR1').AsString,
              FindField('EM_ADDR2').AsString,
              FindField('EM_JOINDATE').AsString,
              FindField('EM_RETIREDATE').AsString,
              FindField('EM_UPDATETIME').AsString,
              FindField('EM_UPDATEOPERATOR').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;
    //MSSQL 회사코드를 MDB에 내리자
    stSql := 'select * from TB_COMPANY ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_COMPANY(
              FindField('GROUP_CODE').AsString,
              FindField('CO_COMPANYCODE').AsString,
              FindField('CO_DEPARTCODE').AsString,
              FindField('CO_NAME').AsString,
              FindField('CO_GUBUN').AsString,
              FindField('CO_CHARGE').AsString,
              FindField('CO_TELNUM').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    //MSSQL 직위코드를 MDB에 내리자
    stSql := 'select * from TB_POSI ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_POSI(
              FindField('GROUP_CODE').AsString,
              FindField('PO_POSICODE').AsString,
              FindField('PO_NAME').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    //MSSQL  기기코드를 MDB에 내리자
    stSql := 'select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_ACCESSDEVICE(
              FindField('GROUP_CODE').AsString,
              FindField('AC_NODENO').AsString,
              FindField('AC_ECUID').AsString,
              FindField('AC_MCUIP').AsString,
              FindField('AC_MCUPORT').AsString,
              FindField('AC_LASTCONNECTED').AsString,
              FindField('AC_DEVICENAME').AsString,
              FindField('LO_DONGCODE').AsString,
              FindField('LO_FLOORCODE').AsString,
              FindField('LO_AREACODE').AsString,
              FindField('AC_VIEWSEQ').AsString,
              FindField('AC_ACTYPE').AsString,
              FindField('AC_ATTYPE').AsString,
              FindField('AC_FDTYPE').AsString,
              FindField('AC_PTTYPE').AsString,
              FindField('AC_TOTWIDTH').AsString,
              FindField('AC_TOTHEIGHT').AsString,
              FindField('AC_CURX').AsString,
              FindField('AC_CURY').AsString,
              FindField('AC_LOCATEUSE').AsString,
              FindField('AC_LOCALRELAY').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    //MSSQL  문정보를 MDB에 내리자
    stSql := 'select * from TB_DOOR ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_DOOR(
              FindField('GROUP_CODE').AsString,
              FindField('AC_NODENO').AsString,
              FindField('AC_ECUID').AsString,
              FindField('DO_DOORNO').AsString,
              FindField('DO_DOORNONAME').AsString,
              FindField('DO_LASTMODE').AsString,
              FindField('DO_VIEWSEQ').AsString,
              FindField('DO_TOTWIDTH').AsString,
              FindField('DO_TOTHEIGHT').AsString,
              FindField('DO_CURX').AsString,
              FindField('DO_CURY').AsString,
              FindField('DO_LOCATEUSE').AsString,
              FindField('LO_DONGCODE').AsString,
              FindField('LO_FLOORCODE').AsString,
              FindField('LO_AREACODE').AsString,
              FindField('Relay_Send').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    //MSSQL  방범기기 정보를 MDB에 내리자
    stSql := 'select * from TB_ALARMDEVICE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_ALARMDEVICE(
              FindField('GROUP_CODE').AsString,
              FindField('AC_NODENO').AsString,
              FindField('AC_ECUID').AsString,
              FindField('AL_ZONENUM').AsString,
              FindField('AL_ZONENAME').AsString,
              FindField('AL_LASTMODE').AsString,
              FindField('AL_VIEWSEQ').AsString,
              FindField('AL_LOCATEUSE').AsString,
              FindField('AL_TOTWIDTH').AsString,
              FindField('AL_TOTHEIGHT').AsString,
              FindField('AL_CURX').AsString,
              FindField('AL_CURY').AsString,
              FindField('LO_DONGCODE').AsString,
              FindField('LO_FLOORCODE').AsString,
              FindField('LO_AREACODE').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    //MSSQL  식수기기 정보를 MDB에 내리자
    stSql := 'select * from TB_FOOD ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_FOOD(
              FindField('GROUP_CODE').AsString,
              FindField('AC_NODENO').AsString,
              FindField('AC_ECUID').AsString,
              FindField('FO_DOORNO').AsString,
              FindField('FO_NAME').AsString,
              FindField('LO_DONGCODE').AsString,
              FindField('LO_FLOORCODE').AsString,
              FindField('LO_AREACODE').AsString,
              FindField('FO_TOTWIDTH').AsString,
              FindField('FO_TOTHEIGHT').AsString,
              FindField('FO_CURX').AsString,
              FindField('FO_CURY').AsString,
              FindField('FO_LOCATEUSE').AsString,
              FindField('FO_AMTPER').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;

    //MSSQL  카드권한 정보를 MDB에 내리자
    stSql := 'select * from TB_DEVICECARDNO ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin

      Close;
      //Sql.Clear;
      sql.Text := stSql;
      try
        Open;
      Except
        Exit;
      End;

      if recordcount > 0 then
      begin
        while Not Eof do
        begin
          if bApplicationTerminate then
          begin
            Exit;
          end;
          dmAdoQuery.InsertMDBTB_DEVICECARDNO(
              FindField('GROUP_CODE').AsString,
              FindField('AC_NODENO').AsString,
              FindField('AC_ECUID').AsString,
              FindField('CA_CARDNO').AsString,
              FindField('DE_DOOR1').AsString,
              FindField('DE_DOOR2').AsString,
              FindField('DE_USEACCESS').AsString,
              FindField('DE_USEALARM').AsString,
              FindField('DE_TIMECODE').AsString,
              FindField('DE_PERMIT').AsString,
              FindField('DE_RCVACK').AsString,
              FindField('DE_UPDATETIME').AsString,
              FindField('DE_UPDATEOPERATOR').AsString);
          Next;
          Application.ProcessMessages;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

procedure TfmMain.RelayConfigSet;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin


  IsCardReaderServer := False;
  L_bSentenceRelayUse := False;

  fdmsUses := 'FALSE';
  fdmsPath := '';
  fdmsPW   := '';
  fdmsNo := 4;
  L_nFdmsCardLength := 24;
  PersonRelayType := 0;
  SendPersonRelayType := 0;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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

      First;
      While Not Eof do
      begin
        if bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'fdmsUSE' then
        begin
          fdmsUses := UpperCase(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'fdmsPath' then
        begin
          fdmsPath := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'fdmsPW' then
        begin
          fdmsPW := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'fdmsType' then
        begin
          fdmsType := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FDMSNO' then
        begin
          fdmsNo := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'cardServer' then
        begin
          if strtoint(FindField('CO_CONFIGVALUE').AsString) = 1 then
              IsCardReaderServer := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'SENT_RELAY' then
        begin
          if strtoint(FindField('CO_CONFIGVALUE').AsString) = 1 then
              L_bSentenceRelayUse := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'PER_RELAY' then
        begin
          PersonRelayType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'PER_SRELAY' then
        begin
          SendPersonRelayType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'FDMSCARDLN' then
        begin
          L_nFdmsCardLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  //권한관리쪽에서 보여줄 항목을 셋팅하자
  SetVisibleMenue;

end;

function TfmMain.fdmsConnect: Boolean;
var
  conStr : string;
begin
  result := False;
  if Not FileExists(fdmsPath) then Exit;
  conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ fdmsPath + ';Persist Security Info=True;';
  if fdmsType = '1' then
  begin
    if fdmsPW <> '' then conStr := constr + 'Jet OLEDB:Database Password=' + fdmsPW;
  end else
  begin
    conStr := constr + 'Jet OLEDB:Database Password=tjdgustltmxpa';
  end;

  with ADOfdmsConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false;
    Try
      Connected := True;
    Except
      Exit;
    End;
  end;

  result := True;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
  ini_fun : TiniFile;
begin
  bApplicationTerminate := True;
  if Monitoring then
    self.FindClassForm('TfmMonitoring').FindCommand('Close').Execute;
  Action_DaemonStopExecute(self);
  IdFTPServer.Active := False;

  tbi.Visible := False;

  Timer2.Enabled := False;
  ConnectTimer.Enabled := False;
  SendTimer.Enabled := False;
  RecvTimeCheck.Enabled := False;
  LogDeleteTime.Enabled := False;
  DataBaseBackupTimer.Enabled := False;
  SyncTimer.Enabled := False;
  DeviceInfoSendTimer.Enabled := False;
  StateCheckTimer.Enabled := False;
  sendClientTimer.Enabled := False;
  DeviceServerSendTimer.Enabled := False;
  DeviceClientConnectCheckTimer.Enabled := False;
  DaemonRestartTimer.Enabled := False;

  Timer2.Free;
  ConnectTimer.Free;
  SendTimer.Free;
  RecvTimeCheck.Free;
  LogDeleteTime.Free;
  DataBaseBackupTimer.Free;
  SyncTimer.Free;
  DeviceInfoSendTimer.Free;
  StateCheckTimer.Free;
  sendClientTimer.Free;
  DeviceServerSendTimer.Free;
  DeviceClientConnectCheckTimer.Free;
  AlarmModeNotCardList.Free;  //카드데이터 아닌 리스트
  ZoneDetectList.Free;       //존감지 상태 코드


  RServer1.Close;
  //RSERVER.Active := False;
  Delay(100);
  //RServer.Free;
  FoodServer.Close;
  Delay(100);
  FoodServer.Free;
  FirmWareServer.Close;
  Delay(100);
  FirmWareServer.Free;
//  ServerSocket1.Close;
  DXUnicastDataQueue1.Free;
  DXUnicastDataQueue2.Free;
  DXUnicastDataQueue3.Free;
  DXUnicastDataQueue4.Free;


//  ClientCommunication.Free;   //Thread 수행중일때는 Free 하지 말자
  ClientConnectList.Free;
  DeviceConnectList.Free;
  
  ClientSendList.Free;
  InOutCardReaderList.Free;
  InOutCountList.Free;
  FireDoorOpenList.Free;
//  ComNodeList.Destroy;
  DeviceList.free;
  ConnectDeviceList.Free;
  FoodConfigCodeList.Free;
  FoodConfigStartList.Free;
  FoodConfigEndList.Free;
  AttendConfigCodeList.Free;
  AttendConfigInFromTimeList.Free;
  AttendConfigInToTimeList.Free;
  AttendConfigWorkTimeList.Free;
  AttendConfigOutTimeList.Free;
  AttendConfigExtendTimeList.Free;
  AttendConfigNightTimeList.Free;
  AttendConfigSInFromTimeList.Free;
  AttendConfigSInToTimeList.Free;
  AttendConfigSWorkTimeList.Free;
  AttendConfigSOutTimeList.Free;
  AttendConfigSExtendTimeList.Free;
  AttendConfigSNightTimeList.Free;
  AttendConfigHInFromTimeList.Free;
  AttendConfigHInToTimeList.Free;
  AttendConfigHWorkTimeList.Free;
  AttendConfigHOutTimeList.Free;
  AttendConfigHExtendTimeList.Free;
  AttendConfigHNightTimeList.Free;
  HolidaySendDeviceList.Free;

  DisplayDataList.Free;

  FTPSockList.Free;
  FOracleTCS.free;
  LogSave(ExeFolder + '\..\log\lomosHis.log','Daemon Program Close ');

  Try
    ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
    ini_fun.WriteInteger('Form','Width',fmMain.Width);
    ini_fun.WriteInteger('Form','Height',fmMain.Height);
    ini_fun.WriteInteger('Form','Left',fmMain.Left);
    ini_fun.WriteInteger('Form','Top',fmMain.Top);
    if fmMain.WindowState = wsMaximized then ini_fun.WriteInteger('Form','Maximized',1)
    else ini_fun.WriteInteger('Form','Maximized',0);
  Finally
    ini_fun.Free;
  End;

end;

procedure TfmMain.SyncTimerTimer(Sender: TObject);
begin
  if bApplicationTerminate then Exit;
  //StatusBar1.Panels[2].Text := 'SyncTimer';
  Application.ProcessMessages;
  SyncTimer.Interval := 24 * 60 * 60 * 1000; //1일 주기
  TimeSyncAllDeive;
end;

procedure TfmMain.TimeSyncAllDeive;
begin
  DeviceTimeSync('');
end;

procedure TfmMain.DeviceConnected(Sender: TObject; Value: Boolean;
  NodeNo: integer; aECUID: string);
var
  nIndex : integer;
  stClientSendData : string;
begin
  if Value then
  begin
    CheckDOORSTATE(FillZeroNumber(NodeNo,3) + aECUID + '1'); //1번출입문 상태 체크 전송
    CheckDOORSTATE(FillZeroNumber(NodeNo,3) + aECUID + '2'); //2번출입문 상태 체크 전송
    CheckAlarmSTATE(FillZeroNumber(NodeNo,3) + aECUID);
    CheckDeviceSkill(FillZeroNumber(NodeNo,3) + aECUID);     //각 기기의 기능 체크
    stClientSendData := 'R' +
                        'E' +
                        FillZeroNumber(NodeNo,3) +
                        aECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('Connected'),3) +
                        'Connected';
    nIndex := ConnectDeviceList.IndexOf(FillZeroNumber(NodeNo,3) + aECUID);
    if nIndex < 0 then
    begin
      ConnectDeviceList.Add(FillZeroNumber(NodeNo,3) + aECUID);
      DeviceInfoSendTimer.Enabled := True;
    end;
    nIndex := ComErrorList.IndexOf(FillZeroNumber(NodeNo,3) + aECUID);
    if nIndex > -1 then
    begin
      ComErrorList.Delete(nIndex);
    end;
    if aECUID = '00' then  //MCU 이면 시간동기화 한번 날리자.
    begin
      if UseDeviceServer then
        TDevice(Sender).SendPacket('R','TM00'+ FormatDatetime('yyyymmddhhnnss',Now))
      else
        TEcuInfo(Sender).SendPacket('R','TM00'+ FormatDatetime('yyyymmddhhnnss',Now));
    end;
    if G_nSCSRelayServer = 2 then
    begin
      //여기에서 시리얼로 데이터 전송 하자.
      SendDisPlay( inttostr(NodeNo),aECUID,'1','000');
      SendDisPlay( inttostr(NodeNo),aECUID,'2','000');
    end;

    //UpdateTB_ACCESSDEVICE_Connect(FillZeroNumber(NodeNo,3),aECUID,'C');
  end else
  begin
    stClientSendData := 'R' +
                        'E' +
                        FillZeroNumber(NodeNo,3) +
                        aECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('DisConnected'),3) +
                        'DisConnected';
    nIndex := ConnectDeviceList.IndexOf(FillZeroNumber(NodeNo,3) + aECUID);
    if nIndex > -1 then ConnectDeviceList.Delete(nIndex);
    nIndex := ComErrorList.IndexOf(FillZeroNumber(NodeNo,3) + aECUID);
    if nIndex > -1 then
    begin
      ComErrorList.Add(FillZeroNumber(NodeNo,3) + aECUID);
    end;
    //UpdateTB_ACCESSDEVICE_Connect(FillZeroNumber(NodeNo,3),aECUID,'D');
  end;
  SendClientData(stClientSendData);
  ATSendClientData(stClientSendData);
  FDSendClientData(stClientSendData);
  StatusBar1.Panels[3].Text := inttostr(ConnectDeviceList.Count) + '/' + inttostr(DeviceList.Count);
end;

procedure TfmMain.N23Click(Sender: TObject);
begin
  MDIChildShow('TfmDeviceConnectState');
end;

function TfmMain.LoadAlarmConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  bALARMSHORT := TRUE;
  bALARMDOWN := TRUE;
{  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  result := False;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''ALARM'' ';

  with TempAdoQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      Exit;
    end;

    while Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'SHORT' then
      begin
        if FindField('CO_CONFIGVALUE').AsString <> '1' then bALARMSHORT := FALSE;
      end else if FindField('CO_CONFIGCODE').AsString = 'DOWN' then
      begin
        if FindField('CO_CONFIGVALUE').AsString <> '1' then bALARMDOWN := FALSE;
      end;
      Next;
    end;
  end;
  TempAdoQuery.Free;  }
  result := True;
end;

procedure TfmMain.NodeConnected(Sender: TObject; aConnected: Boolean;
  NodeNo: integer);
var
  stClientSendData : string;
begin
  if aConnected then
  begin
    //CheckDOORSTATE(FillZeroNumber(NodeNo,3) + '00' + '0'); //ECU 상태 체크 전송
    //CheckAlarmSTATE(FillZeroNumber(NodeNo,3) + '00');
    stClientSendData := 'R' +
                        'N' +
                        FillZeroNumber(NodeNo,3) +
                        '00' +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('Connected'),3) +
                        'Connected';
    //st:= 'RCN'+ FillZeroNumber(NodeNo,3) + 'Connected' + LINEEND;
  end else
  begin
    stClientSendData := 'R' +
                        'N' +
                        FillZeroNumber(NodeNo,3) +
                        '00' +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('DisConnected'),3) +
                        'DisConnected';
    //st:= 'RCN'+ FillZeroNumber(NodeNo,3) + 'DisConnected' + LINEEND;
  end;
  SendClientData(stClientSendData);
  ATSendClientData(stClientSendData);
  FDSendClientData(stClientSendData);

end;

function TfmMain.UpdateTB_ACCESSDEVICE_Connect(aNodeNo, aECUID,
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

procedure TfmMain.N24Click(Sender: TObject);
begin
  Action_DaemonStopExecute(self);
  fmNetConfig:= TfmNetConfig.Create(Self);
  fmNetConfig.SHowmodal;
  fmNetConfig.Free;
  Action_DaemonStartExecute(self);
  DeviceInfoSendTimer.Enabled :=True;

end;

procedure TfmMain.N26Click(Sender: TObject);
var
  stClientSendData : string;
begin
  fmDoorAdmin:= TfmDoorAdmin.Create(Self);
  fmDoorAdmin.IsInsertGrade := True;
  fmDoorAdmin.IsUpdateGrade := True;
  fmDoorAdmin.IsDeleteGrade := True;
  fmDoorAdmin.SHowmodal;
  fmDoorAdmin.Free;
  Delay(100);
  //여기에서 출입문 데이터 미전송분 있으면 데이터 전송
  Action_DaemonRestartExecute(self);
  Delay(100);
  if bApplicationTerminate then Exit;
  DeviceInfoSendTimer.Enabled := True;
{  Delay(1000);
  DeviceInfoSendTimer.Enabled := True;
  stClientSendData := 'R' +
                      'S' +
                      '000' +
                      '00' +
                      '00' +
                      '00' +
                      'SV' +
                      'R' +
                      FillZeroNumber(Length('RESTART'),3) +
                      'RESTART';
  SendClientData(stClientSendData);
  ATSendClientData(stClientSendData); }

end;

procedure TfmMain.N31Click(Sender: TObject);
begin
  fmAlaramDeviceAdmin:= TfmAlaramDeviceAdmin.Create(Self);
  fmAlaramDeviceAdmin.SHowmodal;
  fmAlaramDeviceAdmin.Free;
  //여기에서 출입문 데이터 미전송분 있으면 데이터 전송
  Delay(100);
  Action_DaemonRestartExecute(self);
  Delay(1000);
  if bApplicationTerminate then Exit;
  DeviceInfoSendTimer.Enabled := True;

end;

procedure TfmMain.mn_sensorClick(Sender: TObject);
begin
  fmAlarmZoneAdmin:= TfmAlarmZoneAdmin.Create(Self);
  fmAlarmZoneAdmin.SHowmodal;
  fmAlarmZoneAdmin.Free;
  //여기에서 출입문 데이터 미전송분 있으면 데이터 전송
  Delay(1000);
  if bApplicationTerminate then Exit;
  DeviceInfoSendTimer.Enabled := True;

end;

procedure TfmMain.mn_FoodDeviceClick(Sender: TObject);
begin
  fmFoodAdmin:= TfmFoodAdmin.Create(Self);
  fmFoodAdmin.SHowmodal;
  fmFoodAdmin.Free;
  //여기에서 출입문 데이터 미전송분 있으면 데이터 전송
  Delay(100);
  Action_DaemonRestartExecute(self);
  Delay(1000);
  if bApplicationTerminate then Exit;
  DeviceInfoSendTimer.Enabled := True;
end;

function TfmMain.UpdateRomVer(aNodeNO, aECUID, aRomVer: string): Boolean;
var
  stSql : string;
begin
  stSql := ' update TB_ACCESSDEVICE set AC_VER = ''' + aRomVer + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNO)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_DOORState(aNodeNo, aECUID, aDoorNo: string;
  aManageType,aPNType, aDoorState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DOOR set ';
  stSql := stSql + ' DO_LASTMODE = ''' + aManageType + ''',';
  stSql := stSql + ' DO_LASTPOSI = ''' + aPNType + ''',';
  stSql := stSql + ' DO_LASTSTATE = ''' + aDoorState + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + inttostr(strtoint(aDoorNo)) + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_ALARMMode(aNodeNo, aECUID,
  aMode: string): Boolean;
var
  stsql : string;
begin
  stSql := 'Update TB_ALARMDEVICE set ';
  stSql := stSql + ' AL_LASTMODE = ''' + aMode + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeviceInfoSendTimerTimer(Sender: TObject);
var
  bNodeResult : Boolean;
  bEcuResult : Boolean;
  bDoorResult : Boolean;
  bReaderResult : Boolean;
  bPortResult : Boolean;
  bSchedule :Boolean;
begin
  DeviceInfoSendTimer.Enabled := False;
  //StatusBar1.Panels[2].Text := 'DeviceInfoSendTimer';
  Application.ProcessMessages;
  bSchedule := ScheduleInfo_Send;    //스케줄 데이터 전송
  if bSchedule then  Exit;
  DeviceInfoSendTimer.Enabled := True;
  Exit;
  {
  //기기정보 설정은 zRegT에서만 셋팅하도록 처리 2009.11.16
  if bApplicationTerminate then Exit; //폼 종료시에는 작업하지 말자....
  DeviceInfoSendTimer.Enabled := False;
  if bDeviceInfoSend then Exit;
  bDeviceInfoSend := True;
  bNodeResult := NodeInfo_Send; // ECU 정보 전송
  bDoorResult := DoorInfo_Send;    //출입문 정보 전송
  bReaderResult := ReaderInfo_Send;  //리더 정보 전송
  //2009 1106 방범 기기설정 안내려 보냄
//  bPortResult := PortInfo_Send;      //포트 정보 전송
  bDeviceInfoSend := False;
  if bNodeResult and bEcuResult and bDoorResult and bReaderResult and bDeviceInfoSend then
  begin
    CheckDOORSTATE('');
    Exit;
  end;
  DeviceInfoSendTimer.Enabled := True;  }
end;

function TfmMain.NodeInfo_Send: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  bResult : Boolean;
  nInDelay,nOutDelay:integer;
  stSystemType : string;
  i : integer;
  nTemp : integer;
begin
  result := True;
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
  stSql := stSql + ' AND SEND_ACK = ''N'' ';
  if ConnectDeviceList.Count > 0 then
  begin
    stSql := stSql + ' and ( ';
    for i := 0 to ConnectDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if i <> 0 then stSql := stSql + ' OR ';
      stSql := stSql + '( AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
      stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''' ) ';
    end;
    stSql := stSql + ' ) ';
  end else
  begin
    result := False;
    Exit;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount > 0 then
      begin
        While Not Eof do
        begin
          if bApplicationTerminate then Exit;
          UpdateTB_DOORACK(inttostr(FindField('AC_NODENO').AsInteger),FindField('AC_ECUID').AsString,'0','N');   //출입문 정보를 다시 전송
          UpdateTB_READERACK(inttostr(FindField('AC_NODENO').AsInteger),FindField('AC_ECUID').AsString,'0','N'); //리더 상태를 다시 전송
          UpdateTB_ZONEDEVICEACK(inttostr(FindField('AC_NODENO').AsInteger),FindField('AC_ECUID').AsString,'0','N'); //포트 정보도 다시 전송
          UpdateTB_DEVICESCHEDULEACK(inttostr(FindField('AC_NODENO').AsInteger),FindField('AC_ECUID').AsString,'0','N'); //스케쥴 정보를 다시 전송
          UpdateTB_DEVICECARDNOACK(inttostr(FindField('AC_NODENO').AsInteger),FindField('AC_ECUID').AsString,'N');
          //여기에서 경계 해제 모드 날리자...
          bResult := ChangeAlarmMode(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'D');
          Delay(100); //경계 해제후 Delay
          if bApplicationTerminate then Exit;
          if FindField('AC_ECUID').AsString = '00' then  //MCU 인경우
          begin
              bResult := ECUInfo_Send(FindField('AC_NODENO').AsString);
              if Not bResult then result := False;
              //여기에서 방범인 경우
              if FindField('AC_PTTYPE').AsString = '1' then
              begin
                //2009 1106 방범 기기설정 안내려 보냄
               // bResult := LinKusInfo_Send(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString);
               // if Not bResult then result := False;
              end;
          end;
          //기기 카드리더 Type 전송
          bResult := RegCardReaderType(FindField('AC_NODENO').AsString,
                     FindField('AC_ECUID').AsString,
                     FindField('AC_CARDREADERTYPE').AsString);
          //Delay(100);
          //시스템 정보 전송
          GetSystemDelayInfo(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,nInDelay,nOutDelay);
          if FindField('AC_PTTYPE').AsString = '1' then  stSystemType := '2' //방범 + 출입
          else stSystemType := '1';

          //2009 1106 방범 기기설정 안내려 보냄
          //bResult := SystemInfo_Send(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'1',
          //                           inttostr(nInDelay),inttostr(nOutDelay),stSystemType,stSystemType,'' );
          Next;
          Delay(100);
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.UpdateTB_DOORACK(aNodeNO, aEcuID, aDoorNo,
  aAck: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_DOOR set ';
  stSql := stSql + 'SEND_ACK = ''' + aAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  if aDoorNo <> '0' then
    stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_READERACK(aNodeNO, aECUID, aReaderNo,
  aAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_READER set ';
  stSql := stSql + 'SEND_ACK = ''' + aAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  if aReaderNo <> '0' then
    stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.ECUInfo_Send(aNodeNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  bResult : Boolean;
  st : string;
begin
  result := True;
  st:='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
  //stSql := stSql + ' AND AC_ECUID <> ''00'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if recordCount > 0 then
      begin
        While Not Eof do
        begin
          if bApplicationTerminate then Exit;
          st[strtoint(FindField('AC_ECUID').asstring)+1]:= '1';
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  bResult := ECUInfo_Device_Send(aNodeNo,st);
  if Not bResult then result := False;
end;

function TfmMain.ECUInfo_Device_Send(aNodeNo, aUseEcu: string): Boolean;
var
  stSendData:string;
  stDeviceID : string;
  FirstTickCount : Double;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + '00';
  stSendData:='EX0' + '0' + aUseEcu;
  bCheckUsedDevice := False;
  if DevicePacketSend(stDeviceID,'I',stSendData) then
  begin
    FirstTickCount := GetTickCount + 3000; //3초 대기
    While Not bCheckUsedDevice do
    begin
      if bApplicationTerminate then Exit;
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
    end;
  end;

  result := bCheckUsedDevice;
end;

function TfmMain.DevicePacketSend(aDeviceID, aCmd,
  aSendData: string;aQuick:Boolean=False): Boolean;
var
  aDevice: TDevice;
  aEcuInfo: TEcuInfo;
begin
  result := False;
  if bApplicationTerminate then Exit;
  if UseDeviceServer then
  begin
    aDevice:= GetDevice(aDeviceID );
    if aDevice <> nil then
    begin
      if aDevice.CommNode.SocketConnected = True then
      begin
        aDevice.SendPacket(aCmd[1],aSendData,aQuick);
        result := True;
      end;
    end;
  end else
  begin
    aEcuInfo:= GetEcuInfo(aDeviceID );
    if aEcuInfo <> nil then
    begin
      if aEcuInfo.McuNode.SocketConnected = True then
      begin
        aEcuInfo.SendPacket(aCmd[1],aSendData,aQuick);
        result := True;
      end;
    end;
  end;
end;

procedure TfmMain.RcvCardType(aNodeNO,aECUID,aData: string);
begin
  Delete(aData,1,1);
  bCardReaderTypeCheck := True;
  if L_bReaderSettingShow then
  begin
    fmReaderSetting.RcvCardType(aNodeNo,aEcuID,aData);
  end;
end;

procedure TfmMain.RcvCR(aNodeNO, aECUID, aData: String);
var
  st: String;
  nReaderNo : integer;
begin
  Delete(aData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData,20,2);
  nReaderNo := StrtoInt(st);
  bReaderInfoSet[nReaderNo-1] := True;
  if L_bReaderSettingShow then
  begin
    fmReaderSetting.RcvReaderState(aNodeNo,aEcuID,aData);
  end;
  UpdateTB_READERACK(aNodeNO,aECUID,inttostr(nReaderNo),'Y');
end;

procedure TfmMain.RcvUsedDevice(aNodeNo, aData, aRegGubun: String);
begin
  bCheckUsedDevice := True;
  //UpdateTB_ACCESSDEVICE_RCV(aNodeNo,'Y');
end;

function TfmMain.ChangeAlarmMode(aNodeNo, aEcuID,aMode: string): Boolean;
var
  aData: string;
  stDeviceID : string;
begin
  Result := false;
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  aData := 'MC' +         //COMMAND
    '00' +                //ZONE 고정
    aMode;                //A:경계, D:해제, P:순회
  Result := DevicePacketSend(stDeviceID, 'R', aData);
end;

function TfmMain.LinKusInfo_Send(aNodeNo, aEcuID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  bResult : Boolean;
begin
  result := True;

  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount > 0 then
      begin
        bResult := LinKusIDInfo_Device_Send(aNodeNo, aEcuID,FindField('AL_ALARMID').AsString);
        if Not bResult then result := False;
        bResult := LinKusMuxTelInfo_Device_Send(aNodeNo, aEcuID,FindField('AL_MUXTELNO').AsString);
        if Not bResult then result := False;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if result then UpdateTB_AlarmDeviceAck(aNodeNo,aEcuID,'Y');

end;

function TfmMain.LinKusIDInfo_Device_Send(aNodeNo, aEcuID,
  aData: string): Boolean;
var
  stSendData:string;
  stDeviceID : string;
  FirstTickCount : Double;
  stLinkusID : string;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  if Not IsDigit(aData) then aData := '43690';
  stLinkusID := Dec2Hex(StrToInt(aData), 4);
  bLinKusID := False;
  stSendData := 'Id00' + stLinkusID;
  if DevicePacketSend(stDeviceID,'I',stSendData) then
  begin
    FirstTickCount := GetTickCount + 3000; //3초 대기
    While Not bLinKusID do
    begin
      if bApplicationTerminate then Exit;
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
    end;
  end;

  result := bLinKusID;
end;

function TfmMain.LinKusMuxTelInfo_Device_Send(aNodeNo, aEcuID,
  aData: string): Boolean;
var
  stSendData:string;
  stDeviceID : string;
  FirstTickCount : Double;
  stLinkusID : string;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  bLinKusMuxTel := False;
  stSendData := 'Tn00' + '00' + aData;
  if DevicePacketSend(stDeviceID,'I',stSendData) then
  begin
    FirstTickCount := GetTickCount + 3000; //3초 대기
    While Not bLinKusMuxTel do
    begin
      if bApplicationTerminate then Exit;
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
    end;
  end;

  result := bLinKusMuxTel;
end;

procedure TfmMain.RcvDeviceID(aNodeNO,aECUID,aData: string);
begin
//
end;

procedure TfmMain.RcvTellNo(aNodeNO,aECUID,aData: string);
begin
//
end;

function TfmMain.UpdateTB_AlarmDeviceAck(aNodeNo, aEcuID,
  aAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ALARMDEVICE set ';
  stSql := stSql + 'SEND_ACK = ''' + aAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.GetSystemDelayInfo(aNodeNo, aEcuID: string; var nInDelay,
  nOutDelay: integer): Boolean;
var
  stSql : string;
begin
  result := False;
  nInDelay := 0;
  nOutDelay := 0;
  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  with DataModule1.ADOTmpQuery do
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
    Try
      nInDelay := FindField('AL_INDELAY').AsInteger;
      nOutDelay := FindField('AL_OUTDELAY').AsInteger;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.SystemInfo_Send(aNodeNo, aEcuID, aPowerON, aInDelay,
  aOutDelay, aSystemType1, aSystemType2, aLocation: string): Boolean;
var
  stSendData:string;
  stDeviceID : string;
  FirstTickCount : Double;
  stLinkusID : string;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  bSystemInfo := False;
  stSendData := 'SY00' +                                   // COMMAND
    aPowerON +                         // 정전감시여부
    FillZeroNumber(strtoint(aOutDelay), 3) +                     // 퇴실지연시간
    '2' +                                             // 예비
    aSystemType1 +                             // Door1
    aSystemType2 +                             //Door2
    SetLengthStr(aLocation, 16) +                           // 위치명
    FillZeroNumber(strtoint(aInDelay), 3) +                      // 입실지연시간
    '1';                                              // 관제 통신 방식(고정)
  if DevicePacketSend(stDeviceID,'I',stSendData) then
  begin
    FirstTickCount := GetTickCount + 3000; //3초 대기
    While Not bSystemInfo do
    begin
      if bApplicationTerminate then Exit;
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
    end;
  end;

  result := bSystemInfo;
end;

procedure TfmMain.RcvSysinfo(aNodeNO,aECUID,aData: string);
begin
  bSystemInfo := True;
  UpdateTB_ACCESSDEVICEACK(aNodeNo,aEcuID,'Y');
end;

function TfmMain.UpdateTB_ACCESSDEVICEACK(aNodeNo, aEcuID,
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

function TfmMain.DoorInfo_Send: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  bResult : Boolean;
  i : integer;
begin
  result := True;
  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' where SEND_ACK = ''N'' ';
  if ConnectDeviceList.Count > 0 then
  begin
    stSql := stSql + ' and ( ';
    for i := 0 to ConnectDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if i <> 0 then stSql := stSql + ' OR ';
      stSql := stSql + '( AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
      stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''' ) ';
    end;
    stSql := stSql + ' ) ';
  end else
  begin
    result := False;
    Exit;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount > 0 then
      begin
        While Not Eof do
        begin
          if bApplicationTerminate then Exit;
          bResult := DoorInfo_Device_Send(
                     FindField('AC_NODENO').AsString,
                     FindField('AC_ECUID').AsString,
                     FindField('DO_DOORNO').AsString,
                     FindField('DO_DOORTYPE').AsString,
                     FindField('DO_SCHUSE').AsString,
                     FindField('DO_CONTROLTIME').AsString,
                     FindField('DO_MODE').AsString,
                     FindField('DO_FIRE').AsString,
                     );
          if Not bResult then result := False;
          Delay(100);
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  
end;

function TfmMain.RegCardReaderType(aNodeNo, aEcuID,
  aReaderType: string): Boolean;
var
  FirstTickCount : Double;
  stSendData : string;
  stDeviceID : string;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  stSendData := 'Ct00' + aReaderType; //카드리더 타입 등록

  bCardReaderTypeCheck := False;
  if DevicePacketSend(stDeviceID, 'I', stSendData) then
  begin
    FirstTickCount := GetTickCount + 3000; //3초 대기
    While Not bCardReaderTypeCheck do
    begin
      if bApplicationTerminate then Exit;
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
    end;
  end;

  result := bCardReaderTypeCheck;
end;

function TfmMain.DoorInfo_Device_Send(aNodeNo, aEcuID, aDoorNo, aDoorType,
  aScheduleUse, aDoorControlTime, aDoorMode, aFire: string): Boolean;
var
  stSendData:string;
  stDeviceID : string;
  stDoorControlTime : string;
  nDoorTime : integer;
  nOrd : integer;
  nOrdUDiff : integer;
  FirstTickCount : Double;
  stPnMode : string;
  stOpenMode : string;
  aDevice: TDevice;
  aEcuInfo: TEcuInfo;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  if strtoint(aDoorControlTime) < 10 then
  begin
     stDoorControlTime := Trim(aDoorControlTime);
  end else
  begin
    nOrdUDiff := 26;
    nDoorTime := strtoint(aDoorControlTime) - 10;
    nDoorTime := nDoorTime div 5;
    if nDoorTime < nOrdUDiff then  nOrd := Ord('A') + nDoorTime
    else nOrd := Ord('a') + nDoorTime - nOrdUDiff;
    if nOrd > Ord('z') then nOrd := Ord('z');
    stDoorControlTime := Char(nOrd);
  end;

  if UseDeviceServer then
  begin

    aDevice:= GetDevice(stDeviceID);
    if aDevice = nil then Exit;

    if aDoorNo = '1' then
    begin
      if aDevice.DoorPNMode1 = pnNothing then Exit //상태전송 후 다시 들어 오자
      else if aDevice.DoorPNMode1 = pnPositive then stPnMode := '0'
      else if aDevice.DoorPNMode1 = pnNegative then stPnMode := '1';
      if aDevice.DoorManageMode1 = dmNothing then Exit //상태전송 후 다시 들어 오자
      else if aDevice.DoorManageMode1 = dmManager then stOpenMode := '0'
      else if aDevice.DoorManageMode1 = dmOpen then stOpenMode := '1'
      else if aDevice.DoorManageMode1 = dmLock then stOpenMode := '2';
    end else if aDoorNo = '2' then
    begin
      if aDevice.DoorPNMode2 = pnNothing then Exit //상태전송 후 다시 들어 오자
      else if aDevice.DoorPNMode2 = pnPositive then stPnMode := '0'
      else if aDevice.DoorPNMode2 = pnNegative then stPnMode := '1';
      if aDevice.DoorManageMode2 = dmNothing then Exit //상태전송 후 다시 들어 오자
      else if aDevice.DoorManageMode2 = dmManager then stOpenMode := '0'
      else if aDevice.DoorManageMode2 = dmOpen then stOpenMode := '1'
      else if aDevice.DoorManageMode2 = dmLock then stOpenMode := '2';
    end else Exit;
  end else
  begin

    aEcuInfo:= GetEcuInfo(stDeviceID);
    if aEcuInfo = nil then Exit;

    if aDoorNo = '1' then
    begin
      if aEcuInfo.DoorPNMode1 = pnNothing then Exit //상태전송 후 다시 들어 오자
      else if aEcuInfo.DoorPNMode1 = pnPositive then stPnMode := '0'
      else if aEcuInfo.DoorPNMode1 = pnNegative then stPnMode := '1';
      if aEcuInfo.DoorManageMode1 = dmNothing then Exit //상태전송 후 다시 들어 오자
      else if aEcuInfo.DoorManageMode1 = dmManager then stOpenMode := '0'
      else if aEcuInfo.DoorManageMode1 = dmOpen then stOpenMode := '1'
      else if aEcuInfo.DoorManageMode1 = dmLock then stOpenMode := '2';
    end else if aDoorNo = '2' then
    begin
      if aEcuInfo.DoorPNMode2 = pnNothing then Exit //상태전송 후 다시 들어 오자
      else if aEcuInfo.DoorPNMode2 = pnPositive then stPnMode := '0'
      else if aEcuInfo.DoorPNMode2 = pnNegative then stPnMode := '1';
      if aEcuInfo.DoorManageMode2 = dmNothing then Exit //상태전송 후 다시 들어 오자
      else if aEcuInfo.DoorManageMode2 = dmManager then stOpenMode := '0'
      else if aEcuInfo.DoorManageMode2 = dmOpen then stOpenMode := '1'
      else if aEcuInfo.DoorManageMode2 = dmLock then stOpenMode := '2';
    end else Exit;
  end;
  
  stSendData:= 'A' +                                        //MSG Code
          //IntToStr(Send_MsgNo)+                         //Msg Count
          '0'+
          aDoorNo +  //문번호
          //IntToStr(gbDoorNo.ItemIndex+1)+       //문번호

          #$20 + #$20 +                                 // Record count
          stPnMode +   //카드운영모드 (0:Positive,1:Negative)   //'A' 일때만 사용한다.
          stOpenMode +   //출입문 운영모드(0:운영,1:개방,2:폐쇄   //'A' 일때만 사용한다.
          stDoorControlTime                         +   //Door제어 시간
//          InttoStr(RzSpinEdit4.IntValue)            +   //Door제어 시간
          '0'            +   //장시간 열림 경보
          aScheduleUse       +   //스케줄 적용유무 (0:안함,1:적용)
          '1' +  //출입문상태 사용유무(0:사용안함,1:출입문상태)
          '0'   +   //통신이상시 기기운영 (0:정지,1:동작)
          //#$FF+                                         //분실카드 추적 기능(기능삭제)
          '0' +   //AntiPassBack(0:사용안함,1:사용)
          '0' +   //장시간 열림 부저출력(0:안함,1:사용)
          '0' +   //통신 이상시 부저 출력 (0:안함,1:사용)
          aDoorType     +   //전기정 타입
          aFire  +   //화재 발생시 문제어(0:안함,1:사용)
          '0'    +   //DS LS 검사
          '0000000';
  bDoorInfoSet[strtoint(aDoorNo) - 1] := False;
  if DevicePacketSend(stDeviceID,'c',stSendData) then
  begin
    FirstTickCount := GetTickCount + 3000; //3초 대기
    While Not bDoorInfoSet[strtoint(aDoorNo) - 1] do
    begin
      if bApplicationTerminate then Exit;
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
    end;
  end;

  result := bDoorInfoSet[strtoint(aDoorNo) - 1];
end;

function TfmMain.ReaderInfo_Send: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  bResult : Boolean;
  stReaderUse : string;
  i : integer;
begin
  result := True;
  stSql := 'select * from TB_READER ';
  stSql := stSql + ' where SEND_ACK = ''N'' ';
  if ConnectDeviceList.Count > 0 then
  begin
    stSql := stSql + ' and ( ';
    for i := 0 to ConnectDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if i <> 0 then stSql := stSql + ' OR ';
      stSql := stSql + '( AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
      stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''' ) ';
    end;
    stSql := stSql + ' ) ';
  end else
  begin
    result := False;
    Exit;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount > 0 then
      begin
        While Not Eof do
        begin
          if bApplicationTerminate then Exit;
          if FindField('RE_USE').AsString = 'Y' then stReaderUse := '1'
          else stReaderUse := '0';
          bResult := ReaderInfo_Device_Send(
                     FindField('AC_NODENO').AsString,
                     FindField('AC_ECUID').AsString,
                     FindField('RE_READERNO').AsString,
                     FindField('DO_DOORNO').AsString,
                     stReaderUse);
          if Not bResult then
          begin
            result := False;
          End;
          //Application.ProcessMessages;
          Delay(100);
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.ReaderInfo_Device_Send(aNodeNo, aEcuID, aReaderNo,
  aDoorNo, aReaderUse: string): Boolean;
var
  stLocate : string;
  stDeviceID : string;
  FirstTickCount : Double;
  stSendData : string;
begin
  stLocate := '';
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  stSendData:= 'CD'+FillZeroNumber(strtoint(aReaderNo),2) +
          aReaderUse +   //리더 사용 유무
          '0'+         //리더 위치
          aDoorNo +         //Door No
          '00' +                //존번호
          Setlengthstr(stLocate,16) +           //위치명
          '0' +  //건물 설치 위치
          '0';       //Wigand Card Bit

  bReaderInfoSet[strtoint(aReaderNo) - 1] := False;
  if DevicePacketSend(stDeviceID,'I',stSendData) then
  begin
    FirstTickCount := GetTickCount + 3000; //3초 대기
    While Not bReaderInfoSet[strtoint(aReaderNo) - 1] do
    begin
      if bApplicationTerminate then Exit;
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
    end;
  end;

  result := bReaderInfoSet[strtoint(aReaderNo) - 1];
end;

function TfmMain.PortInfo_Send: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  bResult : Boolean;
  i : integer;
begin
  result := True;
  stSql := 'select * from TB_ZONEDEVICE a ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.SEND_ACK = ''N'' ';
  if ConnectDeviceList.Count > 0 then
  begin
    stSql := stSql + ' and ( ';
    for i := 0 to ConnectDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if i <> 0 then stSql := stSql + ' OR ';
      stSql := stSql + '( a.AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
      stSql := stSql + ' AND a.AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''' ) ';
    end;
    stSql := stSql + ' ) ';
  end else
  begin
    result := False;
    Exit;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount > 0 then
      begin
        While Not Eof do
        begin
          if bApplicationTerminate then Exit;
          bResult := PortInfo_Device_Send(
                     FindField('AC_NODENO').AsString,
                     FindField('AC_ECUID').AsString,
                     FindField('AL_ZONENUM').AsString, //포트 번호
                     FindField('AL_WATCHTYPE').AsString, //감시형태
                     '0',            //감지시간 미사용
                     '4',            //감지시간
                     '');             //위치
          if Not bResult then
          begin
            result := False;
          End;
          //Application.ProcessMessages;
          Delay(100);
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.PortInfo_Device_Send(aNodeNo, aEcuID, aPortNo, aWatchType,
  aDelayUse, aDelayTime, aLocation: string): Boolean;
var
  stLocate : string;
  stDeviceID : string;
  FirstTickCount : Double;
  stSendData : string;
  stPortNoStr : string;
begin
  stLocate := '';
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  stPortNoStr := FillZeroNumber(strtoint(aPortNo), 2);

  stSendData := 'LP' +                              //COMMAND
    stPortNoStr +                               //포트번호
    'S' + aPortNo +                                     //상태코드('SS' 고정)
    aWatchType +                     //감시형태
    '0' +                                      //알람발생 방식(고정)
    '0' +                                      //복구신호전송(고정)
    aDelayUse +                      //지연시간 사용유무
    '00' +                                     //램프
    '00' +                                     //싸이렌
    '00' +                                     //릴레이1
    '00' +                                     //릴레이2
    '00' +                                     //출입문연동1
    '00' +                                     //출입문연동2
    '00' +                                     //메인램프
    '00' +                                     //메인싸이렌
    '00' +                                     //메인릴레이1
    '00' +                                     //메인릴레이2
    '00' +                                     //존번호
    SetLengthstr(aLocation, 16) +                   //위치명
    FillZeroNumber(strtoint(aDelayTime), 2) +           //감지시간
    '00';                                      //사용안함

  bPortInfoSet[strtoint(aPortNo) - 1] := False;
  if DevicePacketSend(stDeviceID,'I',stSendData) then
  begin
    FirstTickCount := GetTickCount + 3000; //3초 대기
    While Not bPortInfoSet[strtoint(aPortNo) - 1] do
    begin
      if bApplicationTerminate then Exit;
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
    end;
  end;

  result := bPortInfoSet[strtoint(aPortNo) - 1];
end;

procedure TfmMain.RcvPort(aNodeNO, aECUID, aData: String);
var
  st: String;
  nPortNo : integer;
begin
  Delete(aData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData,20,2);
  nPortNo := StrtoInt(st);
  bPortInfoSet[nPortNo-1] := True;
  UpdateTB_ZONEDEVICEACK(aNodeNO,aECUID,inttostr(nPortNo),'Y');
end;

function TfmMain.UpdateTB_ZONEDEVICEACK(aNodeNo, aEcuID, aPortNo,
  aAck: string): Boolean;
var
  stSql : string;
  nAlarmNo : integer;
begin
  //nAlarmNo := GetAlarmNo(aNodeNo, aEcuID);
  stSql := 'Update TB_ZONEDEVICE set ';
  stSql := stSql + 'SEND_ACK = ''' + aAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  if aPortNo <> '0' then
    stSql := stSql + ' AND AL_ZONENUM = ''' + aPortNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.GetAlarmNo(aNodeNo, aEcuID: string): integer;
var
  stSql : string;
begin
  result := 0;
{  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  with DataModule1.ADOTmpQuery do
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
    result := FindField('AL_DEVICENO').AsInteger;
  end; }
end;

procedure TfmMain.RcvLinkusId(aNodeNO, aECUID, aData: string);
begin
  bLinKusID := True;
end;

procedure TfmMain.RcvLinkusTelNo(aNodeNO, aECUID, aData: string);
begin
  bLinKusMuxTel := True;
end;

function TfmMain.ScheduleInfo_Send: Boolean;
var
  st:         string;
  stNodeNo : string ;
  stEcuID : string;
  cDoor:      Char;
  nDoorIndex: Integer;
  cDay:       Char;
  stData:      String;
  nIndex:     Integer;
  aDevice:    TDevice;
  aEcuInfo:    TEcuInfo;
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
begin
  result := True;

  stSql := 'SELECT * ';
  stSql := stSql + ' FROM TB_DEVICESCHEDULE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND DE_RCVACK = ''N'' ' ;
  if ConnectDeviceList.Count > 0 then
  begin
    stSql := stSql + ' and ( ';
    for i := 0 to ConnectDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if i <> 0 then stSql := stSql + ' OR ';
      stSql := stSql + '( AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
      stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''' ) ';
    end;
    stSql := stSql + ' ) ';
  end else
  begin
    result := False;
    Exit;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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

      if RecordCount > 0 then
      begin
  //      result := False;   //송신 내역이 있으면 다시 한번 이 로직 들어 와 보자...
  //      aDeviceID:= FindField('DEVICE_ID').asString;
        First;
        While not eof do
        begin
          if bApplicationTerminate then Exit;
          stNodeNo := FillZeroNumber(FindField('AC_NODENO').AsInteger,3);
          stECUID := FindField('AC_ECUID').asString;
          cDoor:= FindField('DO_DOORNO').asString[1];
          cDay := FindField('DE_DAYCODE').asString[1];
          stData:= FindField('DE_CELL5TIME').asString + FindField('DE_CELL1MODE').asString+
                  FindField('DE_CELL1TIME').asString + FindField('DE_CELL2MODE').asString+
                  FindField('DE_CELL2TIME').asString + FindField('DE_CELL3MODE').asString+
                  FindField('DE_CELL3TIME').asString + FindField('DE_CELL4MODE').asString+
                  FindField('DE_CELL4TIME').asString + FindField('DE_CELL5MODE').asString;

          if UseDeviceServer then
          begin
             aDevice:= GetDevice(FillZeroNumber(strtoint(stNodeNo),3) + stECUID );
             if aDevice <> nil then
             begin
                aDevice.SendDoorSchadule(cDoor,cDay,stData);
                Delay(200);
             end;
          end else
          begin
             aEcuInfo:= GetEcuInfo(FillZeroNumber(strtoint(stNodeNo),3) + stECUID );
             if aEcuInfo <> nil then
             begin
                aEcuInfo.SendDoorSchadule(cDoor,cDay,stData);
                Delay(200);
             end;
          end;
           Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetCheckFoodPermit(aYear, aMonth, aDay, aFoodCode,
  aCardNo: string): char;
var
  Present: TDatetime;
  stWEEK_CODE : string;
  stSql : string;
begin
  result := 'N';
  stSql := 'select b.* from ';
  stSql := stSql + ' TB_CARD a ';
  stSql := stSql + ' Inner Join TB_FOODGRADE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stsql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' where a.CA_CARDNO = ''' + aCardNo + ''' ';

  if CheckHolidy(aYear,aMonth,aDay) then
  begin
    if aFoodCode = '001' then stSql := stSql + ' AND b.FO_HOBREAKFIRST = ''Y'' '
    else if aFoodCode = '002' then stSql := stSql + ' AND b.FO_HOLUNCH = ''Y'' '
    else if aFoodCode = '003' then stSql := stSql + ' AND b.FO_HODINNER = ''Y'' '
    else if aFoodCode = '004' then stSql := stSql + ' AND b.FO_HOMIDNIGHT = ''Y'' ';
//    stSql := stSql + ' AND b.FO_HOLIDAY = ''Y'' ';
  end else
  begin
    Present:= EncodeDatetime(strtoint(aYear), strtoint(aMonth), strtoint(aDay), 00, 00, 00,00);
    stWEEK_CODE := inttostr(DayOfWeek(Present));
    if stWEEK_CODE = '1' then
    begin
      //stSql := stSql + ' AND b.FO_HOLIDAY = ''Y'' '
      if aFoodCode = '001' then stSql := stSql + ' AND b.FO_HOBREAKFIRST = ''Y'' '
      else if aFoodCode = '002' then stSql := stSql + ' AND b.FO_HOLUNCH = ''Y'' '
      else if aFoodCode = '003' then stSql := stSql + ' AND b.FO_HODINNER = ''Y'' '
      else if aFoodCode = '004' then stSql := stSql + ' AND b.FO_HOMIDNIGHT = ''Y'' ';
    end else if stWEEK_CODE = '7' then
    begin
      //stSql := stSql + ' AND b.FO_WEEKEND = ''Y'' '
      if aFoodCode = '001' then stSql := stSql + ' AND b.FO_WEBREAKFIRST = ''Y'' '
      else if aFoodCode = '002' then stSql := stSql + ' AND b.FO_WELUNCH = ''Y'' '
      else if aFoodCode = '003' then stSql := stSql + ' AND b.FO_WEDINNER = ''Y'' '
      else if aFoodCode = '004' then stSql := stSql + ' AND b.FO_WEMIDNIGHT = ''Y'' ';
    end else
    begin
      if aFoodCode = '001' then stSql := stSql + ' AND b.FO_BREAKFIRST = ''Y'' '
      else if aFoodCode = '002' then stSql := stSql + ' AND b.FO_LUNCH = ''Y'' '
      else if aFoodCode = '003' then stSql := stSql + ' AND b.FO_DINNER = ''Y'' '
      else if aFoodCode = '004' then stSql := stSql + ' AND b.FO_MIDNIGHT = ''Y'' ';
    end;
    //stSql := stSql + ' AND b.FO_WEEK = ''Y'' ';
  end;

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      result := 'E';
      Exit;
    End;
    if recordCount < 1 then Exit;
    //if FindField('FO_MONEY').AsString = 'Y' then result := 'D'
    //else
    result := 'Y';
  end;
end;

function TfmMain.CheckHolidy(aYear, aMonth, aDay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_HOLIDAY ';
  stSql := stSql + ' where HO_DAY = ''' + aYear + aMonth + aDay + ''' ';
  with DataModule1.ADOTmpQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text :=  stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
  end;
  result := True;
end;

procedure TfmMain.FoodServerNewConnect(ClientThread: TDXClientThread);
Var
   Ws:String;
   I: Integer;
   aIndex: Integer;
   StartTime:Comp;
   aLog: String;
   Sock: Integer;
begin
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;
  DXUnicastDataQueue2.AddSock(Sock);

  StartTime:=TimeCounter+ 600000;
  ws:='';

  While ClientThread.Socket.Connected do
  Begin
    If Application.Terminated then
    Begin
       ClientThread.Socket.CloseNow;
       Exit;
    End;
    //If ForceAbort then Exit;

    If ClientThread.Socket.Readable then
    Begin
      If ClientThread.Socket.CharactersToRead=0 then
      begin
        Break;
      end else
      begin
        for I:= 1 to ClientThread.Socket.CharactersToRead do
        begin
          if bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {원격지에서 받은 데이터 처리 루틴추가}
        if Ws <> '' then FDRcvFromClient(ClientThread.Socket.PeerIPAddress,ws);
        //Ws:= Ws ;
//        ClientThread.Socket.WriteLn(ws);
        ws:='';
      end;
      StartTime:=TimeCounter+ 600000;
    End
    Else Begin
       DoSleepEx(1);
       //Application.ProcessMessages;
       ProcessWindowsMessageQueue;
    end;
  end;
  DXUnicastDataQueue2.DelSock(Sock);

end;

function TfmMain.InsertTB_SENSOREVENT(aTime, aNodeNo, aEcuID, aMsgNo,
  aSubClass, aSubAddr, aZoneCode, aMode, aPortNo, aStatus, aState,
  aOper: string): Boolean;
var
  stSql : string;
  stAlNodeNo : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  {TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;


  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  with TempAdoQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql ;

    Try
      Open;
    Except
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '센서데이터입력오류',aNodeNo + aEcuID +'DB오픈 실패');
      TempAdoQuery.Free;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '센서데이터입력오류',aNodeNo + aEcuID +'미등록 기기');
      RealDataShow('','','Er','',aNodeNo + aEcuID +'미등록 기기[센서데이터입력오류]');
      TempAdoQuery.Free;
      Exit;
    end;
    First;
    stAlNodeNo := FindField('AL_DEVICENO').AsString;
  end;

  TempAdoQuery.Free;}


  stSql := ' Insert Into TB_SENSOREVENT(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AL_DATE,';
  stSql := stSql + 'AL_TIME,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AL_ZONENO,';
  stSql := stSql + 'AL_MSGNO,';
  stSql := stSql + 'AL_ALARMDEVICETYPECODE,';
  stSql := stSql + 'AL_SUBADDR,';
  stSql := stSql + 'AL_ZONECODE,';
  stSql := stSql + 'AL_ALARMMODECODE,';
  stSql := stSql + 'AL_ZONESTATE,';
  stSql := stSql + 'AL_ALARMSTATUSCODE,';
  stSql := stSql + 'AL_OPERATOR) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE +''',';
  stSql := stSql + '''' + copy(aTime,1,8) +''',';
  stSql := stSql + '''' + copy(aTime,9,6) +''',';
  stSql := stSql + aNodeNo +',';
  stSql := stSql + '''' + aECUID + ''',' ;
  stSql := stSql + '''' + aPortNo +''',';
  stSql := stSql + '''' + aMsgNo +''',';
  stSql := stSql + '''' + aSubClass +''',';
  stSql := stSql + '''' + aSubAddr +''',';
  stSql := stSql + '''' + aZoneCode +''',';
  stSql := stSql + '''' + aMode +''',';
  stSql := stSql + '''' + aState  +''',';
  stSql := stSql + '''' + aStatus +''',';
  stSql := stSql + '''' + aOper +''')';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

procedure TfmMain.FirmWareServerNewConnect(ClientThread: TDXClientThread);
Var
   Ws:String;
   I: Integer;
   aIndex: Integer;
   StartTime:Comp;
   aLog: String;
   Sock: Integer;
begin
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;
  DXUnicastDataQueue3.AddSock(Sock);

  StartTime:=TimeCounter+ 600000;
  ws:='';

  While ClientThread.Socket.Connected do
  Begin
    If Application.Terminated then
    Begin
       ClientThread.Socket.CloseNow;
       Exit;
    End;
    //If ForceAbort then Exit;

    If ClientThread.Socket.Readable then
    Begin
      If ClientThread.Socket.CharactersToRead=0 then
      begin
        Break;
      end else
      begin
        for I:= 1 to ClientThread.Socket.CharactersToRead do
        begin
          if bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {원격지에서 받은 데이터 처리 루틴추가}
        if Ws <> '' then RcvFromFirmWareClient(ClientThread.Socket.PeerIPAddress,ws);
        //Ws:= Ws ;
        //ClientThread.Socket.WriteLn(ws);
        ws:='';
      end;
      StartTime:=TimeCounter+ 600000;
    End
    Else Begin
       DoSleepEx(1);
       //Application.ProcessMessages;
       ProcessWindowsMessageQueue;
    end;
  end;
  DXUnicastDataQueue3.DelSock(Sock);

end;

procedure TfmMain.RcvFromFirmWareClient(aClientIP, ast: string);
var
  nIndex : integer;
  stCMD : string;
  stDeviceID : string;
  bSendAll : Boolean;
begin
{  nIndex := pos(DATADELIMITER,ast);
  stCMD := copy(ast,1,nIndex - 1);
  Delete(ast,1,nIndex);
  nIndex := pos(DATADELIMITER,ast);
  stDeviceID := copy(ast,1,nIndex - 1);
  Delete(ast,1,nIndex);

  if stCMD = 'STATECHECK' then CheckDOORSTATE(stDeviceID)            //상태확인
  else if stCMD = 'ALARMCHECK' then CheckAlarmSTATE(stDeviceID)      //방범상태확인
  else if stCMD = 'DOOROPEN' then DoorOpen(stDeviceID)               //출입승인
  else if stCMD = 'OPENMODE' then DoorModeChange(stDeviceID,'1')     //개방모드
  else if stCMD = 'OPERATEMODE' then DoorModeChange(stDeviceID,'0')  //운영모드
  else if stCMD = 'TIMESYNC' then DeviceTimeSync(stDeviceID)         //시간동기화
  else if stCMD = 'REBOOT' then DeviceReboot(stDeviceID)             //기기 재부팅
  else if stCMD = 'ALARMSETTING' then DeviceAlarmModeChange(stDeviceID,'1')  //경계
  else if stCMD = 'ALARMDISABLE' then DeviceAlarmModeChange(stDeviceID,'0')  //경계해제
  else if stCMD = 'HOLIDAY' then DeviceHoliday(stDeviceID)  //공휴일 다운로드
  else if stCMD = 'CARDDOWNLOAD' then  //카드권한다운로드
  begin
    if ast[1] = 'Y' then bSendAll := True
    else bSendAll := False;
    CardNoDownload(strtoint(copy(stDeviceID,1,3)),copy(stDeviceID,4,2),bSendAll);
  end
  else if stCMD = 'DEAMONRESTART' then Action_DaemonRestartExecute(self);   //데몬재시작
}
end;

function TfmMain.GetAttendCode(aTime, aCompanyCode,aEMCode: string;nWeekCode:integer): string;
begin
  result := '000';
  if L_nATType = 0 then //고정근무타입이면  첫번째 근태 타입을 넘겨준다.
  begin
    if AttendConfigCodeList.Count > 0 then
      result := AttendConfigCodeList.Strings[0];
  end else if L_nATType = 1 then
  begin
    result := GetEMPLOYEEATCode(aCompanyCode,aEMCode);
  end else if L_nATType = 2 then
  begin
    result := GetChangeATCode(aTime,nWeekCode);
  end;

end;

function TfmMain.GetChangeATCode(aTime: string;nWeekCode:integer): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
  stTime : string;

begin
  result := '000';
  stTime := copy(aTime,9,4);


  stSql := 'select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if nWeekCode = 1 then //일요일 데이터에서 찾자
  begin
    stSql := stSql + ' AND AT_HINFROMTIME <= ''' + stTime + ''' ';
    stSql := stSql + ' AND AT_HINTOTIME >= ''' + stTime + ''' ';
  end else if nWeekCode = 7 then
  begin
    stSql := stSql + ' AND AT_SINFROMTIME <= ''' + stTime + ''' ';
    stSql := stSql + ' AND AT_SINTOTIME >= ''' + stTime + ''' ';
  end else
  begin
    stSql := stSql + ' AND AT_INFROMTIME <= ''' + stTime + ''' ';
    stSql := stSql + ' AND AT_INTOTIME >= ''' + stTime + ''' ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;
      Result := FindField('AT_ATCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetEMPLOYEEATCode(aCompanyCode,aEMCode: string): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'select * from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ' ;
    stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ' ;

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;
      if FindField('AT_ATCODE').IsNull then Result := '000'
      else if Trim(FindField('AT_ATCODE').AsString) = '' then Result := '000'
      else Result := FindField('AT_ATCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


function TfmMain.GetATInCode(aAttendCode, aTime: string;
  nWeekCode: integer): string;
var
  nIndex : integer;
  stInFromTime,stWorkStartTime:string;
begin
  result := '000';

  nIndex := AttendConfigCodeList.IndexOf(aAttendCode);
  if nIndex < 0 then Exit;
  if nWeekCode = 1 then  //공휴일
  begin
    stInFromTime := AttendConfigHInFromTimeList.Strings[nIndex];
    stWorkStartTime := AttendConfigHWorkTimeList.Strings[nIndex];
  end else if nWeekCode = 7 then //토요일
  begin
    stInFromTime := AttendConfigSInFromTimeList.Strings[nIndex];
    stWorkStartTime := AttendConfigSWorkTimeList.Strings[nIndex];
  end else //평일
  begin
    stInFromTime := AttendConfigInFromTimeList.Strings[nIndex];
    stWorkStartTime := AttendConfigWorkTimeList.Strings[nIndex];
  end;
  if copy(aTime,9,4) < stInFromTime then result := '004' //조기출근
  else if copy(aTime,9,4) > stWorkStartTime then result := '002' //지각
  else result := '001'; //정상출근
end;

function TfmMain.GetOutAttendCode(aDate, aCompanyCode,aEMCode: string): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';


  stSql := 'select * from TB_ATEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ' ;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ' ;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;
      if FindField('AT_ATCODE').IsNull then Result := '000'
      else if Trim(FindField('AT_ATCODE').AsString) = '' then Result := '000'
      else Result := FindField('AT_ATCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetATOutCode(aAttendCode, aTime: string;
  nWeekCode: integer;bYesterDay:Boolean): string;
var
  nIndex : integer;
  stWorkEndTime:string;
  stExtendTime:string;
  stNightTime:string;
begin
  result := '000';

  nIndex := AttendConfigCodeList.IndexOf(aAttendCode);
  if nIndex < 0 then Exit;
  if nWeekCode = 1 then  //공휴일
  begin
    stWorkEndTime := AttendConfigHOutTimeList.Strings[nIndex];
    stExtendTime := AttendConfigHExtendTimeList.Strings[nIndex];
    stNightTime := AttendConfigHNightTimeList.Strings[nIndex];
  end else if nWeekCode = 7 then //토요일
  begin
    stWorkEndTime := AttendConfigSOutTimeList.Strings[nIndex];
    stExtendTime := AttendConfigSExtendTimeList.Strings[nIndex];
    stNightTime := AttendConfigSNightTimeList.Strings[nIndex];
  end else //평일
  begin
    stWorkEndTime := AttendConfigOutTimeList.Strings[nIndex];
    stExtendTime := AttendConfigExtendTimeList.Strings[nIndex];
    stNightTime := AttendConfigNightTimeList.Strings[nIndex];
  end;

  if Not bYesterDay then  //저녁에 퇴근이면...
  begin
    if copy(aTime,9,4) < stWorkEndTime then result := '002' //조퇴
    else result := '001';    //정상퇴근
    if stExtendTime <> '0000' then
    begin
      if stExtendTime > L_YesterDayStandTime then //작으면 연장근무시간이 새벽이므로 어제날짜 기준일때 적용 됨
      begin
        if stNightTime > L_YesterDayStandTime then
        begin
          if (stExtendTime < copy(aTime,9,4)) and (copy(aTime,9,4) < stNightTime) then result := '003' //연장근무
          else if copy(aTime,9,4) >= stNightTime then result := '004'; //야간근무
        end else result := '003'; //야간근무 기준이 새벽이면 무조건 연장근무임
      end;
    end else  //연장코드 미사용
    begin
      if  stNightTime <> '0000' then   //야간코드 미사용이면 그냥 정규퇴근
      begin
        if stNightTime > L_YesterDayStandTime then  //야간근무시간이 새벽이 아니면...
        begin
          if copy(aTime,9,4) >= stNightTime then result := '004'; //야간근무
        end;
      end;
    end;
  end else   //새벽에 퇴근이면...
  begin
    result := '001'; //정상 퇴근
    if stExtendTime <> '0000' then //연장근무 사용중이고...
    begin
      if stExtendTime < L_YesterDayStandTime then //연장근무시간이 새벽부터이면
      begin
        if stExtendTime < copy(aTime,9,4) then
        begin
          result := '003'; //연장근무
          if stNightTime <> '0000' then //야간근무시간 사용중이고...
          begin
            if stNightTime < L_YesterDayStandTime then  // 야간 근무가 새벽이면
            begin
              if stNightTime < copy(aTime,9,4) then result := '004'; //야간근무
            end;
          end;
        end;
      end else //연장근무 시간이 저녁 시간이면
      begin
        result := '003'; //연장근무
        if stNightTime <> '0000' then //야간근무시간 사용중이고...
        begin
          if stNightTime < L_YesterDayStandTime then //새벽시간부터 시작이면
          begin
            if stNightTime < copy(aTime,9,4) then result := '004'; //야간근무
          end else result := '004';
        end;
      end;
    end else //연장근무 사용 안 하고
    begin
      if stNightTime <> '0000' then //야간근무시간 사용중이고...
      begin
        if stNightTime < L_YesterDayStandTime then //야간근무시간이 새벽부터이면
        begin
          if stNightTime < copy(aTime,9,4) then result := '004'; //야간근무
        end else result := '004'; //야간근무가 저녁시간부터이면 야간근무
      end;
    end;

  end;
end;

function TfmMain.InsertATTENDINCode(aDate, aTime, aCompanyCode,aEMCode: String;
  nWeekCode: integer): Boolean;
var
  stAttendCode : string;
  stATInCode : string;
  nIndex : integer;
begin
  result := False;
  
  //근태적용일 오늘 출근하면서 전일자 출근 표시 할일이 있을까? 없을것이다. 고로 오늘날짜가 근태일이다.
  stAttendCode := GetAttendCode(aTime,aCompanyCode,aEMCode,nWeekCode);
  nIndex := AttendConfigCodeList.IndexOf(stAttendCode);
  if nIndex = -1 then //근태코드를 찾지 못한경우
  begin
    if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
    begin
      dmAdoQuery.TB_ATEVENTIntimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,'000');
    end;
    Exit;
  end;
  stATInCode := GetATInCode(stAttendCode,aTime,nWeekCode);  //출근타입에 대한 출근코드 가져오자.
  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
  begin
    dmAdoQuery.TB_ATEVENTIntimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,stATInCode);
  end;
  result := True;

end;

function TfmMain.InsertATTENDOutCode(aDate, aTime, aCompanyCode,aEMCode: String;
  nWeekCode: integer;dtYesterDay:TDatetime): Boolean;
var
  bYesterDay : Boolean;
  stAttendCode : string;
  stATOutCode : string;
  nIndex : integer;
begin
  result := False;
  bYesterDay := False;

  //기준시간이 새벽에 찍었는가?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    aDate := FormatDateTime('yyyymmdd',dtYesterDay);
    bYesterDay := True;
  end;

  stAttendCode := GetOutAttendCode(aDate,aCompanyCode,aEMCode); //근태 데이터에서 근태코드를 가져옴.
  nIndex := AttendConfigCodeList.IndexOf(stAttendCode);
  if nIndex = -1 then //근태코드를 찾지 못한경우
  begin
    if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
    begin
      dmAdoQuery.TB_ATEVENTOuttimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,'000');
    end else dmAdoQuery.TB_ATEVENTOuttimeUpdate(aDate,aCompanyCode,aEMCode,aTime,'000');
    Exit;
  end;
  
  stATOutCode := GetATOutCode(stAttendCode,aTime,nWeekCode,bYesterDay);  //근태타입에 대한 퇴근코드 가져오자.
  dmAdoQuery.TB_ATEVENTOuttimeUpdate(aDate,aCompanyCode,aEMCode,aTime,stATOutCode);
  result := True;
end;

function TfmMain.InsertATTENDBACKCode(aDate, aTime, aCompanyCode,aEMCode: String;nWeekCode:integer;
  dtYesterDay: TDatetime): Boolean;
var
  bYesterDay : Boolean;
begin
  result := False;
  bYesterDay := False;

  //기준시간이 새벽에 찍었는가?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    aDate := FormatDateTime('yyyymmdd',dtYesterDay);
    bYesterDay := True;
  end;

  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
  begin
    dmAdoQuery.TB_ATEVENTBACKtimeInsert(aDate,aCompanyCode,aEMCode,inttostr(nWeekCode),aTime);
  end else dmAdoQuery.TB_ATEVENTBACKtimeUpdate(aDate,aCompanyCode,aEMCode,aTime);

end;

function TfmMain.InsertATTENDLEAVECode(aDate, aTime, aCompanyCode,aEMCode: String;nWeekCode:integer;
  dtYesterDay: TDatetime): Boolean;
var
  bYesterDay : Boolean;
begin
  result := False;
  bYesterDay := False;

  //기준시간이 새벽에 찍었는가?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    aDate := FormatDateTime('yyyymmdd',dtYesterDay);
    bYesterDay := True;
  end;

  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
  begin
    dmAdoQuery.TB_ATEVENTLEAVEtimeInsert(aDate,aCompanyCode,aEMCode,inttostr(nWeekCode),aTime);
  end else dmAdoQuery.TB_ATEVENTLEAVEtimeUpdate(aDate,aCompanyCode,aEMCode,aTime);

end;

function TfmMain.GetUpdateAttendType(aTime, aCompanyCode,aEMCode: string;dtYesterDay:TDatetime): string;
var
  stDate : string;
begin
  stDate := copy(aTime,1,8);
  //기준시간이 새벽에 찍었는가?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    stDate := FormatDateTime('yyyymmdd',dtYesterDay); //어제날짜.
  end;
  
  if dmAdoQuery.DupCheckTB_AT_EVENT(stDate,aCompanyCode,aEMCode) then result := '2' //퇴근
  else result := '1'; //출근

end;

procedure TfmMain.WMEndSession(var Msg: TWMEndSession);
begin
  if Msg.EndSession = True then
  begin
//
  end;
end;

procedure TfmMain.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
//  if MessageDlg('Close Windows ?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
//    Msg.Result := 0
//  else
    bClose := True;
    Close;
    Delay(1000);
    Msg.Result := 1;

end;

procedure TfmMain.WndProc(var Msg: TMessage);
begin
  inherited;
    if Msg.WParam = SC_MINIMIZE then
    begin
      Close;
    end;

end;

function TfmMain.GetEmployeeInfo(aCardNo: string; bPassNo: Boolean;
  var aCompanyCode, aEMCode: string): Boolean;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aCompanyCode := '000';
  aEMCode := '000';

  if Not bPassNo then
  begin
    stSql := 'select a.CO_COMPANYCODE,a.EM_CODE from TB_CARD a ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ' ;
  end
  else   //비밀번호인경우
  begin
    stSql := 'select CO_COMPANYCODE,EM_CODE from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND EM_PASS = ''' + aCardNo + ''' ' ;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aEMCode := FindField('EM_CODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

procedure TfmMain.ATServerNewConnect(ClientThread: TDXClientThread);
Var
   Ws:String;
   I: Integer;
   aIndex: Integer;
   StartTime:Comp;
   aLog: String;
   Sock: Integer;
begin
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;
  DXUnicastDataQueue4.AddSock(Sock);

  StartTime:=TimeCounter+ 600000;
  ws:='';

  While ClientThread.Socket.Connected and (not DXString.Timeout (StartTime) ) do
  Begin
    If Application.Terminated then
    Begin
       ClientThread.Socket.CloseNow;
       Exit;
    End;
    //If ForceAbort then Exit;

    If ClientThread.Socket.Readable then
    Begin
      If ClientThread.Socket.CharactersToRead=0 then
      begin
        Break;
      end else
      begin
        for I:= 1 to ClientThread.Socket.CharactersToRead do
        begin
          if bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {원격지에서 받은 데이터 처리 루틴추가}
        if Ws <> '' then ATRcvFromClient(ClientThread.Socket.PeerIPAddress,ws);
        //Ws:= Ws ;
        ClientThread.Socket.WriteLn(ws);
        ws:='';
      end;
      StartTime:=TimeCounter+ 600000;
    End
    Else Begin
       DoSleepEx(1);
       //Application.ProcessMessages;
       ProcessWindowsMessageQueue;
    end;
  end;
  DXUnicastDataQueue1.DelSock(Sock);

end;

procedure TfmMain.ATRcvFromClient(aClientIP, ast: string);
var
  nIndex : integer;
  stCMD : string;
  stDeviceID : string;
  bSendAll : Boolean;
begin
  nIndex := pos(DATADELIMITER,ast);
  stCMD := copy(ast,1,nIndex - 1);
  Delete(ast,1,nIndex);
  nIndex := pos(DATADELIMITER,ast);
  stDeviceID := copy(ast,1,nIndex - 1);
  Delete(ast,1,nIndex);

  if stCMD = 'DEAMONRESTART' then Action_DaemonRestartExecute(self) //데몬재시작
  else if stCMD = 'STATECHECK' then DeviceSTATECHECK(stDeviceID)
  else if stCMD = 'ATTENDCONFIGREFRESH' then LoadAttendConfig ;

end;

procedure TfmMain.DeviceSTATECHECK(aDeviceID: string);
var
  i: integer;
  stClientSendData : string;
begin
  if copy(aDeviceID,1,5) = '00000' then  //전체 상태 조회
  begin
    NodeStateAllCheckSend;
    DeviceStateAllCheckSend;
    AlarmStateAllCheckSend;
    DoorStateAllCheckSend;
  end else
  begin
    CheckDOORSTATE(copy(aDeviceID,1,6));
  end;
end;

function TfmMain.ATSendClientData(stData: string): Boolean;
begin
  if Not ATServer.IsActive then Exit;
  DXUnicastDataQueue4.AddToQueue(stData + LINEEND);
end;

//운영/개방모드 변경
procedure TfmMain.DoorMangageModeChange(Sender: TObject; NodeNo: integer;
  aEcuID, aDoorNo: string; aDoorManageType: TDoorManageMode);
var
  stMode : string;
  stClientSendData : string;
begin
{  Case aDoorManageType of
    dmNothing : begin stMode := 'E' end;
    dmClose : begin stMode := 'C' end;
    dmOpen : begin stMode := 'O' end;
    else begin stMode := 'E' end;
  end;
  stClientSendData := 'R' +
                    'D' +
                    FillZeroNumber(NodeNo,3) +
                    aEcuID +
                    FillZeroNumber(strtoint(aDoorNo),2) +
                    '00' +
                    'DV' +
                    'M' +
                    FillZeroNumber(1,3) +
                    stMode;
  SendClientData(stClientSendData);   }
end;

//문 열림 상태 변경
procedure TfmMain.DoorStateChanged(Sender: TObject; NodeNo: integer;
  aEcuID, aDoorNo: string; aDoorStateType: TDoorState);
var
  stMode : string;
  stClientSendData : string;
begin
{  Case aDoorStateType of
    dsNothing : begin stMode := 'E' end;
    dsClose : begin stMode := 'C' end;
    dsOpen : begin stMode := 'O' end;
    else begin stMode := 'E' end;
  end;
  stClientSendData := 'R' +
                    'D' +
                    FillZeroNumber(NodeNo,3) +
                    aEcuID +
                    FillZeroNumber(strtoint(aDoorNo),2) +
                    '00' +
                    'DV' +
                    'D' +
                    FillZeroNumber(1,3) +
                    stMode;
  SendClientData(stClientSendData);   }
end;

//Posi/Negative 모드 변경
procedure TfmMain.DoorPNModeChange(Sender: TObject; NodeNo: integer;
  aEcuID, aDoorNo: string; aDoorPNType: TDoorPNMode);
var
  stMode : string;
  stClientSendData : string;
begin
{  Case aDoorPNType of
    pnNothing : begin stMode := 'E' end;
    pnPositive : begin stMode := 'P' end;
    pnNegative : begin stMode := 'N' end;
    else begin stMode := 'E' end;
  end;
  stClientSendData := 'R' +
                    'D' +
                    FillZeroNumber(NodeNo,3) +
                    aEcuID +
                    FillZeroNumber(strtoint(aDoorNo),2) +
                    '00' +
                    'DV' +
                    'P' +
                    FillZeroNumber(1,3) +
                    stMode;
  SendClientData(stClientSendData);  }
end;

//경계 모드 변경
procedure TfmMain.DeviceWatchModeChange(Sender: TObject; NodeNo: integer;
  aEcuID: string; aWachMode: TWatchMode);
var
  stMode : string;
  stClientSendData : string;
begin
    Case aWachMode of
     cmArm : begin  stMode := 'A' end;
     cmDisarm : begin stMode := 'D' end;
     cmTest : begin stMode := 'T' end;
     cmInit : begin stMode := 'I' end;
     cmPatrol : begin stMode := 'P' end;
     else begin stMode := 'E' end;
    end;
    stClientSendData := 'R' +
                      'A' +
                      FillZeroNumber(NodeNo,3) +
                      aEcuID +
                      '00' +
                      '00' +
                      'DV' +
                      'S' +
                      FillZeroNumber(1,3) +
                      stMode;
    SendClientData(stClientSendData);
end;

procedure TfmMain.NodeStateAllCheckSend;
var
  i : integer;
  stClientSendData : string;
begin
  if UseDeviceServer then
  begin
    for i:= 0 to ComNodeList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if TCommNode(ComNodeList.Objects[i]).SocketConnected then
      begin
        stClientSendData := 'R' +
                        'N' +
                        FillZeroNumber(TCommNode(ComNodeList.Objects[i]).No,3) +
                        '00' +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('Connected'),3) +
                        'Connected';
      end else
      begin
        stClientSendData := 'R' +
                        'N' +
                        FillZeroNumber(TCommNode(ComNodeList.Objects[i]).No,3) +
                        '00' +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('DisConnected'),3) +
                        'DisConnected';
      end;
      SendClientData(stClientSendData);
      ATSendClientData(stClientSendData);
      FDSendClientData(stClientSendData);
      Application.ProcessMessages;
    end;
  end else
  begin
    for i:= 0 to DeviceClientNodeList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if TMCUNodeInfo(DeviceClientNodeList.Objects[i]).SocketConnected then
      begin
        stClientSendData := 'R' +
                        'N' +
                        FillZeroNumber(TMCUNodeInfo(DeviceClientNodeList.Objects[i]).No,3) +
                        '00' +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('Connected'),3) +
                        'Connected';
      end else
      begin
        stClientSendData := 'R' +
                        'N' +
                        FillZeroNumber(TMCUNodeInfo(DeviceClientNodeList.Objects[i]).No,3) +
                        '00' +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('DisConnected'),3) +
                        'DisConnected';
      end;
      SendClientData(stClientSendData);
      ATSendClientData(stClientSendData);
      FDSendClientData(stClientSendData);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfmMain.DeviceStateAllCheckSend;
var
  i : integer;
  stClientSendData : string;
begin
  if UseDeviceServer then
  begin
    for i:=0 to DeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if TDevice(DeviceList.Objects[i]).Connected then
      begin
        stClientSendData := 'R' +
                        'E' +
                        FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3) +
                        TDevice(DeviceList.Objects[i]).ECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('Connected'),3) +
                        'Connected';
      end else
      begin
        stClientSendData := 'R' +
                        'E' +
                        FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3) +
                        TDevice(DeviceList.Objects[i]).ECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('DisConnected'),3) +
                        'DisConnected';
      end;
      SendClientData(stClientSendData);
      ATSendClientData(stClientSendData);
      Application.ProcessMessages;
    end;
  end else
  begin
    for i:=0 to DeviceClientDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if TEcuInfo(DeviceClientDeviceList.Objects[i]).Connected then
      begin
        stClientSendData := 'R' +
                        'E' +
                        FillZeroNumber(TEcuInfo(DeviceClientDeviceList.Objects[i]).NodeNo,3) +
                        TEcuInfo(DeviceClientDeviceList.Objects[i]).ECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('Connected'),3) +
                        'Connected';
      end else
      begin
        stClientSendData := 'R' +
                        'E' +
                        FillZeroNumber(TEcuInfo(DeviceClientDeviceList.Objects[i]).NodeNo,3) +
                        TEcuInfo(DeviceClientDeviceList.Objects[i]).ECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('DisConnected'),3) +
                        'DisConnected';
      end;
      SendClientData(stClientSendData);
      ATSendClientData(stClientSendData);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfmMain.AlarmStateAllCheckSend;
var
  i : integer;
  stMode : string;
begin
  if UseDeviceServer then
  begin
    for i:=0 to DeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      DeviceWatchModeChange(self,
                            TDevice(DeviceList.Objects[i]).NodeNo,
                            TDevice(DeviceList.Objects[i]).ECUID,
                            TDevice(DeviceList.Objects[i]).WatchMode);
      Application.ProcessMessages;
    end;
  end else
  begin
    for i:=0 to DeviceClientDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      DeviceWatchModeChange(self,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).NodeNo,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).ECUID,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).WatchMode);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfmMain.DoorStateAllCheckSend;
var
  i : integer;
  stPNMode,stManageMode,stOpenState:string;
begin
  if UseDeviceServer then
  begin
    for i:=0 to DeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      DoorModeChanged(self,
                            TDevice(DeviceList.Objects[i]).NodeNo,
                            TDevice(DeviceList.Objects[i]).ECUID,
                            '01',
                            TDevice(DeviceList.Objects[i]).DoorManageMode1,
                            TDevice(DeviceList.Objects[i]).DoorPNMode1,
                            TDevice(DeviceList.Objects[i]).DoorState1
                            );
      Delay(1);
      if bApplicationTerminate then Exit;
      DoorModeChanged(self,
                            TDevice(DeviceList.Objects[i]).NodeNo,
                            TDevice(DeviceList.Objects[i]).ECUID,
                            '02',
                            TDevice(DeviceList.Objects[i]).DoorManageMode2,
                            TDevice(DeviceList.Objects[i]).DoorPNMode2,
                            TDevice(DeviceList.Objects[i]).DoorState2
                            );
      Application.ProcessMessages;
    end;
  end else
  begin
    for i:=0 to DeviceClientDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      DoorModeChanged(self,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).NodeNo,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).ECUID,
                            '01',
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorManageMode1,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorPNMode1,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorState1
                            );
      Delay(1);
      if bApplicationTerminate then Exit;
      DoorModeChanged(self,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).NodeNo,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).ECUID,
                            '02',
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorManageMode2,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorPNMode2,
                            TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorState2
                            );
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfmMain.DoorModeChanged(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorState);
var
  stManageType : string;
  stPNType : string;
  stDoorState : string;
  stData : string;
  stClientSendData : string;
begin
  Case aDoorManageType of
    dmNothing : begin stManageType := 'E' end;
    dmManager : begin stManageType := '0' end;
    dmOpen : begin stManageType := '1' end;
    dmLock : begin stManageType := '2' end;
    else begin stManageType := 'E' end;
  end;

  Case aDoorPNType of
    pnNothing : begin stPNType := 'E' end;
    pnPositive : begin stPNType := '0' end;
    pnNegative : begin stPNType := '1' end;
    else begin stPNType := 'E' end;
  end;

  Case aDoorStateType of
    dsNothing : begin stDoorState := 'E' end;
    dsClose : begin stDoorState := 'C' end;
    dsOpen : begin stDoorState := 'O' end;
    dsLongTime : begin stDoorState := 'T' end;
    dsOpenErr : begin stDoorState := 'U' end;
    dsCloseErr : begin stDoorState := 'L' end;
    else begin stDoorState := 'E' end;
  end;
  stData :=  stManageType +
             stPNType +
             stDoorState;

  stClientSendData := 'R' +
                    'D' +
                    FillZeroNumber(NodeNo,3) +
                    aEcuID +
                    FillZeroNumber(strtoint(aDoorNo),2) +  //
                    '00' +
                    'DV' +
                    'S' +
                    FillZeroNumber(Length(stData),3) +
                    stData;
  SendClientData(stClientSendData);
  //UpdateTB_DOORState(inttostr(NODENO),aEcuID,aDoorNo,stManageType,stPNType,stDoorState);
end;

function TfmMain.FileDataBaseBackup(bFull: Boolean): Boolean;
var
  stBackupDir : string;
begin
  Result := False;

  if not DirectoryExists(DataBaseBackupDir) then
  begin
   if Not CreateDir(DataBaseBackupDir) then
   begin
      DataBaseBackupTimer.Enabled := False;
      StatusBar1.Panels[2].Text := DataBaseBackupDir + ' 은 생성할수 없는 디렉토리입니다. 환경설정을 확인 후 재기동하여 주세요. ';
      //showmessage(DataBaseBackupDir + ' 은 생성할수 없는 디렉토리입니다. 환경설정을 확인 후 재기동하여 주세요. ');
      Exit;
   end;
  end;

  if bDBBackup then Exit;
  bDBBackup := True;
  tbi.Hint := 'DataBase 백업중...';
  StatusBar1.Panels[0].Text := 'DataBase 백업중...';
  stBackupDir := DataBaseBackupDir + '\' + FormatDateTime('yyyymmdd',Now);


  TableFileBackup(stBackupDir,'TB_ACCESSDEVICE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ACCESSEVENT');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ADMIN');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ADMINALARMDEVICE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ADMINCOMPANY');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ADMINDOOR');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ADMINFOOD');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ALARMDEVICE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ALARMEVENT');
  Delay(1000);
  if bApplicationTerminate then Exit;

  TableFileBackup(stBackupDir,'TB_ATCARD');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATCODE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATDAYSUMMARY');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATEMPEXTRA');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATEVENT');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATINCODE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATMONTHEXTRA');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATMONTHSUMMARY');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATOUTCODE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATPASS');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATVACATION');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATVACODE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_BASEPAY');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_CARD');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_COMPANY');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_CONFIG');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_DEVICECARDNO');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_DEVICECARDNO_PROMISE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_DEVICESCHEDULE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_DOOR');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_FOOD');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_FOODCODE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_FOODEVENT');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_FOODGRADE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_LOCATION');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_READER');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_SENSOREVENT');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ZONEDEVICE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ZONESCHEDULE');
  Delay(1000);
  if bApplicationTerminate then Exit;

  TableFileBackup(stBackupDir,'TB_EMPLOYEE');
  Delay(1000);
 if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_EMPHIS');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_GRADE');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_GRADEPROGRAM');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_HOLIDAY');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_MONTHAT');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_POSI');
  Delay(1000);
  if bApplicationTerminate then Exit;   
  tbi.Hint := '서버컨트롤시스템 정상';
  StatusBar1.Panels[0].Text := '서버컨트롤시스템 정상';

  bDBBackup := False;
  result := True;
end;

function TfmMain.FileDBRestor(aImportFileName: string): Boolean;
var
   targetName: string;
   i,idx:      Integer;
   txtFile:    TextFile;
   fldStr:     String;
   ValStr:     String;
   delStr:     String;
   v:          String;
   QryList:    TStringList;
   q:          String;
   stSql : string;
begin
  result := False;
  if Not FileExists(aImportFileName) then Exit;
  targetName := ExtractFileName(aImportFileName);
  targetName := ChangeFileExt(targetName,'');
//  targetName := copy(targetName,9,Length(targetName) - 8);
  lbl_Table.Caption := '[' + targetName + '] 테이블 복구중...';
  Screen.Cursor              := crSQLWait;

  if (DBTYPE = 'MSSQL') or (DBTYPE = 'MDB') then
  begin
    q:= '''';
    fldStr     := '';
    ValStr     := '';
    QryList    := TstringList.Create;
    QryList.Clear;
    TblImport.Close;
    TblImport.LoadFromFile(aImportFileName);
    if TblImport.IsEmpty() then begin
      QryList.Free;
      Exit;
    end;
    ga_Table.MaxValue := TblImport.RecordCount;
    ga_Table.Progress := 0;

    delStr:='';
    for i := 0 to (TblImport.FieldCount - 1)  do begin
      if bApplicationTerminate then Exit;
       fldStr := fldStr + delStr+ '['+TblImport.Fields[i].FieldName+']';
       delStr :=',';
    end; // for
    //QryList.Append('TRUNCATE TABLE ['+targetName+']');
    QryList.Append('INSERT INTO ['+targetName+']');
    fldStr := '('+fldStr+')';
    QryList.Append(fldStr);
    QryList.Append('VALUES');
    //    MainForm.LogMessage(targetName+' - Records:'+IntToStr(QryMain.RecordCount),True);
    delstr := '';
    TblImport.First();
    WHILE (NOT(TblImport.Eof)) do begin
      if bApplicationTerminate then Exit;
       Application.ProcessMessages;
       For i := 0 to (TblImport.FieldCount - 1) do begin
        if bApplicationTerminate then Exit;
          if TblImport.Fields[i].IsNull then begin
             v      := '';
             ValStr := ValStr+delStr+'NULL'; // NO quotes
          end else begin
             v      := TblImport.Fields[i].AsString;
             idx := POS('''',v);
             if idx > 0 then begin
                Insert(q,v,idx);
             end;
    //             StringReplace(v,,'',[rfReplaceAll]);  // get rid of single quotes in query
             ValStr := ValStr+delStr+''''+v+''''; // quote it
          end;
          delStr := ',';
       end; //for field values
       ValStr   := '('+ ValStr +')';
       QryList.Append(ValStr);
       //QryInsert.SQL.Clear;
       qryInsert.SQL := QryList;
       Try
        QryInsert.ExecSQL;                         //   <-------------- very slow for 100K+ records
       Except
        //무시
       End;
       ValStr   := '';
       delstr   := '';
       QryList.Delete(QryList.Count - 1);
       ga_Table.Progress := ga_Table.Progress +  1;
       TblImport.Next();
    end;
    QryList.Free;
  end else if DBTYPE = 'PG' then
  begin
    stSql := 'copy ' + targetName + ' From ''' + stringReplace(aImportFileName,'\','\\',[rfReplaceAll]) + '''';
    with TblImport do
    begin
      Close;
      //Sql.Clear;
      Sql.text := stSql;
      Try
        ExecSql;
      Except
        //
      End;
    end;
  end;
  Screen.Cursor                    := crDefault;
  Ga_Tot.Progress := Ga_Tot.Progress + 1;

end;

function TfmMain.TableFileBackup(aBackupDir,aTableName: string): Boolean;
var
  stBackupDir : string;
  stSql : string;
begin
  stBackupDir := aBackupDir;
  if not DirectoryExists(stBackupDir) then
  begin
   if Not CreateDir(stBackupDir) then
   begin
      DataBaseBackupTimer.Enabled := False;
      //showmessage(stBackupDir + ' 은 생성할수 없는 디렉토리입니다. 환경설정을 확인 후 재기동하여 주세요. ');
      Exit;
   end;
  end;
  if (DBTYPE = 'MSSQL') or (DBTYPE = 'MDB') then
  begin
    stSql := ' select * from ' + aTableName ;
  end else if DBTYPE = 'PG' then
  begin
    stSql := 'copy( select * from ' + aTableName  + ') to ''' + stringReplace(stBackupDir,'\','\\',[rfReplaceAll]) + '\\' + aTableName + '.BAK''' ;
  end;

  with ADOBackupQuery do
  begin
    Close;
    //SQL.Clear;
    SQL.Text := stSql;
    Try
      if (DBTYPE = 'MSSQL') or (DBTYPE = 'MDB') then
      begin
        Open;
      end else if DBTYPE = 'PG' then
      begin
        ExecSql;
      end;
    Except
      Exit;
    End;
    if (DBTYPE = 'MSSQL') or (DBTYPE = 'MDB') then SaveToFile(stBackupDir + '\' + aTableName + '.BAK');
  end;
  result := True;
end;

procedure TfmMain.DB1Click(Sender: TObject);
var
  stDir:string;
begin
  FolderDialog1.Directory := DataBaseBackupDir;
  if Not FolderDialog1.Execute then Exit;
  stDir := FolderDialog1.Directory;
  showmessage(stDir + ' 디렉토리의 데이터를 복구합니다.');

  tbi.Hint := 'DataBase 복구중...';
  pan_gauge.Visible := True;
  Ga_Tot.MaxValue := 44;
  Ga_Tot.Progress := 0;
  StatusBar1.Panels[0].Text := 'DataBase 복구중...';
  FileDBRestor(stDir + '\' + 'TB_ACCESSDEVICE' + '.BAK');
  Ga_Tot.Progress := Ga_Tot.Progress + 1;
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ACCESSEVENT' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ADMIN' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ADMINCOMPANY' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATCARD' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATCODE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATDAYSUMMARY' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATEMPEXTRA' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATEVENT' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATINCODE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATMONTHEXTRA' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATMONTHSUMMARY' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATOUTCODE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATPASS' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATVACATION' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATVACODE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_BASEPAY' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_CARD' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_COMPANY' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_CONFIG' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_EMPLOYEE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_GRADE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_GRADEPROGRAM' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_HOLIDAY' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_MONTHAT' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_POSI' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ADMINALARMDEVICE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ADMINDOOR' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ADMINFOOD' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ALARMDEVICE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ALARMEVENT' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_DEVICECARDNO' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_DEVICECARDNO_PROMISE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_DEVICESCHEDULE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_DOOR' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_FOOD' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_FOODCODE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_FOODEVENT' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_FOODGRADE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_LOCATION' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_READER' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_SENSOREVENT' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ZONEDEVICE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ZONESCHEDULE' + '.BAK');
  Delay(1000);
  if bApplicationTerminate then Exit;
  pan_gauge.Visible := False;
  tbi.Hint := '서버컨트롤시스템 정상';
  StatusBar1.Panels[0].Text := '서버컨트롤시스템 정상';

end;

procedure TfmMain.DB2Click(Sender: TObject);
var
  stBackupDir : string;
begin
  if FolderDialog1.Execute then
  begin
    stBackupDir := FolderDialog1.Directory;
    if DBType = 'PG' then PGAllDataBackup(stBackupDir)
    else if DBType = 'MSSQL' then MSSQLAllDataBackup(stBackupDir)
    else if DBType = 'MDB' then MDBAllDataBackup(stBackupDir);
  end;
//  FileDataBaseBackup(False);
end;

procedure TfmMain.DaemonConfigWriting;
var
  stSql : string;
begin
  stSql := CommonSql.UpdateTB_CONFIG('ATTEND','CARDTYPE','1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('DAEMON','NETTYPE','TCPIP');
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then
  begin
    stSql := CommonSql.UpdateTB_CONFIG('MOSTYPE','FILEDIR',ExeFolder + '\..\Resource');
    DataModule1.ProcessExecSQL(stSql);
    stSql := CommonSql.UpdateTB_CONFIG('DAEMON','IP','127.0.0.1');
    DataModule1.ProcessExecSQL(stSql);
  end;

end;

function TfmMain.DupCheckTB_ALARMEVENT(aTime, aNodeNo, aEcuID,
  aMsgNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

  stSql := ' select * from TB_ALARMEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_DATE = ''' + copy(aTime,1,8) + ''' ';
  stSql := stSql + ' AND AL_TIME = ''' + copy(aTime,9,6) + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND AL_MSGNO = ''' + aMsgNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnectionEVENT;
    TempAdoQuery.DisableControls;
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
      if recordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.GetEmCode(aCardNo: string; var aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if recordCount > 0 then
      begin
        aCompanyCode := FindField('CO_COMPANYCODE').AsString;
        aEmCode := FindField('EM_CODE').AsString;
        result := True;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.fdmsUserRelaySend(aEmCode,aFDMS_ID, aEM_NAME,aHandPhone, aDEPART_NAME, aPO_NAME,
  aCA_CARDNO,aMode: string): Boolean;
var
  stSql : string;
  stNowDate : string;
  bResult : Boolean;
begin
  Result := False;
  //Datamodule1.SQLErrorLog('FDMSLOG:fdmsUserRelaySend');
  if CheckFdmsUser(aFDMS_ID) then
  begin
    Result := UpdateFdmsUser(aEmCode,aFDMS_ID, aEM_NAME,aHandPhone, aDEPART_NAME, aPO_NAME,aCA_CARDNO,aMode);
  end else
  begin
    Result := InsertFdmsUser(aEmCode,aFDMS_ID, aEM_NAME,aHandPhone, aDEPART_NAME, aPO_NAME,aCA_CARDNO,aMode);
  end;
{  stNowDate := formatdatetime('yyyymmddHHMM',now);
  stSql := 'select * from Tuser ';
  stSql := stSql + ' Where id = ' + aFDMS_ID ;
  With ADOfdms do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

//showmessage('지문인식 조회');
    if RecordCount > 0 then
    begin
      //Update
      stSql := 'update tuser set ';
      stSql := stSql + 'Name = ''' + aEM_NAME + ''',';
      stSql := stSql + 'datelimit = ''N0000000000000000'',' ;
      stSql := stSql + 'badmin = ''0'', ' ;
      stSql := stSql + 'company = ''' + aDEPART_NAME + ''',' ;
      stSql := stSql + 'dept = ''' + aPO_NAME + ''',';
      stSql := stSql + 'validtype = ''4'', ';
      stSql := stSql + 'cardnum = ''' + aCA_CARDNO + ''',';
      stSql := stSql + 'identify = ''0'',' ;
      stSql := stSql + ' seculevel = ''0'' ';
      stSql := stSql + ' Where id = ' + aFDMS_ID ;
      ADOfdmsExec.Close;
      //ADOfdmsExec.Sql.Clear;
      ADOfdmsExec.Sql.Text := stSql;

      Try
        ADOfdmsExec.ExecSQL;
      Except
        Exit;
      End;
//showmessage('지문인식 업데이트');
    end
    else
    begin
      //Insert
      stSql := 'Insert into Tuser(id,Name,Reg_date,Datelimit,Badmin,Company,Dept,';
      stSql := stSql + 'Validtype,Cardnum,Identify,SecuLevel) Values( ';
      stSql := stSql + aFDMS_ID + ',';
      stSql := stSql + '''' + aEM_NAME + ''',';
      stSql := stSql + '''' + stNowDate + ''',';
      stSql := stSql + '''N0000000000000000'',';
      stSql := stSql + '''0'',';
      stSql := stSql + '''' + aDEPART_NAME + ''',';
      stSql := stSql + '''' + aPO_NAME + ''',';
      stSql := stSql + '''4'',';
      stSql := stSql + '''' + aCA_CARDNO + ''',';
      stSql := stSql + '''0'',';
      stSql := stSql + '''0'')';

      ADOfdmsExec.Close;
      //ADOfdmsExec.SQL.Clear;
      ADOfdmsExec.SQL.Text := stSql;
      Try
        ADOfdmsExec.ExecSQL;
      Except
        Exit;
      End;
//showmessage('지문인식 인서트');

    end;
  end;    }

//  Result := True;
end;

function TfmMain.fdmsGateRelay: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.UpdateTB_DOORfdmsRelay('N','R');
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FDMS_RELAY = ''R'' ';
  with ADOfdmsQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      if bApplicationTerminate then Exit;
      if FindField('FDMS_ID').AsString <> '' then
      begin
        if fdmsDoorRelaySend(FindField('FDMS_ID').AsString,
                         FindField('DO_DOORNONAME').AsString
                         )
        then
        begin
          stSql := CommonSql.UpdateTB_DoorfdmsSendAck(
                              FindField('AC_NODENO').AsString,
                              FindField('AC_ECUID').AsString,
                              FindField('DO_DOORNO').AsString,
                              'Y');
          DataModule1.ProcessExecSQL(stSql);
        end;
      end;
      Next;
    end;
  end;
  stSql := CommonSql.UpdateTB_DOORfdmsRelay('R','N');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.fdmsUserRelay: Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stFdmsID : string;
begin
  stSql := CommonSql.UpdateTB_EMPHISState1('N','R');
  DataModule1.ProcessExecSQL(stSql);

  { 속도를 위해서 테이블 구조 바꿈 
  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinCARDRelayBase
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinCARDRelayBase
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinCARDRelayBase
  else Exit;
  stSql := stSql + ' AND g.SEND_STATUS = ''R'' ';
  }
  stSql := 'select a.seq,a.group_code,a.co_companycode,a,em_code,a.fdms_id,a.mode,';
  stSql := stSql + ' a.send_status,a.ca_cardtype,a.send_status2,a.em_name,a.em_handphone,a.company_name,a.jijum_name,a.depart_name,a.po_name,b.ca_cardno ';
  stSql := ' select ';
  if DBTYPE = 'MSSQL' then stSql := stSql + ' top 200 ';
  stSql := stSql + ' a.*,b.ca_cardno as cardNo  ';
  stSql := stSql + ' from TB_EMPHIS a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND b.CA_GUBUN = ''1'' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.SEND_STATUS = ''R'' ';
  stSql := stSql + ' Order by a.SEQ ';
  if DBTYPE = 'PG' then stSql := stSql + ' LIMIT 200 OFFSET 0 ';

  with ADOfdmsQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      ON E: Exception do
      begin
        Datamodule1.SQLErrorLog('FDMSLOG:' + E.Message + ':' + stSql);
        Exit;
      end;
    End;

    While Not Eof do
    begin
      if bApplicationTerminate then Exit;
      stFdmsID := '';
      nFdmsID := FindField('FDMS_ID').AsInteger;
      if nSpecialProgram = 2 then //RUC 센터
      begin
        if IsDigit(FindField('EM_CODE').AsString) then
        begin
          stFdmsID := FindField('EM_CODE').AsString;
        end;
      end else
        stFdmsID := inttostr(nFdmsID);
        
      if FindField('MODE').AsString = '3' then
      begin
          if fdmsUserRelayDeleteSend(stFdmsID,
                           FindField('Mode').AsString
                           )
          then
          begin
            stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
            DataModule1.ProcessExecSQL(stSql);
          end;
      end
      else if stFdmsID <> '' then
      begin
        if IsNumericCardNo then
        begin
          if IsDigit(FindField('cardNo').AsString) then
          begin
            if fdmsUserRelaySend(FindField('EM_CODE').AsString,
                             stFdmsID,
                             FindField('EM_NAME').AsString,
                             FindField('em_handphone').AsString,
                             FindField('DEPART_NAME').AsString,
                             FindField('PO_NAME').AsString,
                             Dec2Hex64(StrtoInt64(FindField('cardNo').AsString),8),
                             FindField('Mode').AsString
                             )
            then
            begin
              if CheckFdmsUser(stFdmsID) then
              begin
                stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
                DataModule1.ProcessExecSQL(stSql);
              end;
            end;
          end
          else
          begin
            if DUPCARDTYPE = 1 then   //카드가 2장 이상인경우 삭제된 카드일 수 있다.
            begin
              if fdmsUserRelayDeleteSend(stFdmsID,
                               '3'
                               )
              then
              begin
                stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
                DataModule1.ProcessExecSQL(stSql);
              end;
            end else
            begin
              //카드번호가 잘못된것은 지문쪽에 전송하지 않는다.
              stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
              DataModule1.ProcessExecSQL(stSql);
            end;
          end;
        end else
        begin
          if (Trim(FindField('cardNo').AsString) <> '')  then
          begin
            if fdmsUserRelaySend(FindField('EM_CODE').AsString,
                             stFdmsID,
                             FindField('EM_NAME').AsString,
                             FindField('em_handphone').AsString,
                             FindField('DEPART_NAME').AsString,
                             FindField('PO_NAME').AsString,
                             Ascii2Hex(FindField('cardNo').AsString),
                             FindField('Mode').AsString
                             )
            then
            begin
              if CheckFdmsUser(stFdmsID) then
              begin
                stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
                DataModule1.ProcessExecSQL(stSql);
              end;
            end;
          end
          else
          begin
            if DUPCARDTYPE = 1 then   //카드가 2장 이상인경우 삭제된 카드일 수 있다.
            begin
              if fdmsUserRelayDeleteSend(stFdmsID,
                               '3'
                               )
              then
              begin
                stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
                DataModule1.ProcessExecSQL(stSql);
              end;
            end else
            begin
              //카드번호가 잘못된것은 지문쪽에 전송하지 않는다.
              stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
              DataModule1.ProcessExecSQL(stSql);
            end;
          end;
        end;
      end
      else
      begin
        //지문번호가 잘못된것은 지문쪽에 전송하지 않는다.
        stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
        DataModule1.ProcessExecSQL(stSql);
      end;
      //StatusBar1.Panels[2].Text := FindField('EM_NAME').AsString;
      Application.ProcessMessages;
      Next;
    end;
  end;
  //stSql := CommonSql.UpdateTB_EMPHISState1('R','N');
  //DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.fdmsDoorRelaySend(aFDMS_ID, aDOORNONAME: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := 'select * from Tgate ';
  stSql := stSql + ' Where id = ' + aFDMS_ID ;
  With ADOfdms do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

//showmessage('지문인식 조회');
    if RecordCount > 0 then
    begin
      //Update
      stSql := ' Update Tgate set ';
      stSql := stSql + ' Name=''' + aDOORNONAME + ''',';
      stSql := stSql + ' Block=''0'',UserCtrl=''0'' ';
      stSql := stSql + ' Where id=' + aFDMS_ID ;

      ADOfdmsExec.Close;
      //ADOfdmsExec.Sql.Clear;
      ADOfdmsExec.Sql.Text := stSql;

      Try
        ADOfdmsExec.ExecSQL;
      Except
        Exit;
      End;
//showmessage('지문인식 업데이트');
    end
    else
    begin
      //Insert
      stSql := ' Insert into Tgate(id,Name,Reg_Date,Block,UserCtrl) ';
      stSql := stSql + ' Values(';
      stSql := stSql + aFDMS_ID + ',';
      stSql := stSql + '''' + aDOORNONAME + ''',';
      stSql := stSql + '''' + formatdatetime('yyyymmddhhmm',Now) + ''',';
      stSql := stSql + '''0'',';
      stSql := stSql + '''0'') ';

      ADOfdmsExec.Close;
      //ADOfdmsExec.SQL.Clear;
      ADOfdmsExec.SQL.Text := stSql;
      Try
        ADOfdmsExec.ExecSQL;
      Except
        Exit;
      End;
//showmessage('지문인식 인서트');

    end;
  end;

  Result := True;
end;

procedure TfmMain.StateCheckTimerTimer(Sender: TObject);
var
  i : integer;
begin
  StateCheckTimer.Enabled := False;
  //StatusBar1.Panels[2].Text := 'StateCheckTimer';
  if UseDeviceServer then
  begin
    Application.ProcessMessages;
    for I:= 0 to DeviceList.Count -1 do
    begin
      if bApplicationTerminate then Exit;
      if TDevice(DeviceList.Objects[I]).Connected then
      begin
        if (TDevice(DeviceList.Objects[I]).DoorManageMode1 = dmNothing) or
           (TDevice(DeviceList.Objects[I]).DoorState1 = dsNothing) or
           (TDevice(DeviceList.Objects[I]).DoorPNMode1 = pnNothing) then
        begin
          TDevice(DeviceList.Objects[I]).CheckDoorState('1',False);
        end;
        if (TDevice(DeviceList.Objects[I]).DoorManageMode2 = dmNothing) or
           (TDevice(DeviceList.Objects[I]).DoorState2 = dsNothing) or
           (TDevice(DeviceList.Objects[I]).DoorPNMode2 = pnNothing)then
        begin
          TDevice(DeviceList.Objects[I]).CheckDoorState('2',False);
        end;
        if (TDevice(DeviceList.Objects[I]).WatchMode = cmNothing) then
        begin
          TDevice(DeviceList.Objects[I]).CheckWatchMode;
        end;
        if Not TDevice(DeviceList.Objects[I]).DeviceSkillReceive  then  //기능 체크
        begin
          TDevice(DeviceList.Objects[I]).CheckSystemSkill;
        end;
      end;
    end;
  end else
  begin
    for I:= 0 to DeviceClientDeviceList.Count -1 do
    begin
      if bApplicationTerminate then Exit;
      if TEcuInfo(DeviceClientDeviceList.Objects[I]).Connected then
      begin
        if (TEcuInfo(DeviceClientDeviceList.Objects[I]).DoorManageMode1 = dmNothing) or
           (TEcuInfo(DeviceClientDeviceList.Objects[I]).DoorState1 = dsNothing) or
           (TEcuInfo(DeviceClientDeviceList.Objects[I]).DoorPNMode1 = pnNothing) then
        begin
          TEcuInfo(DeviceClientDeviceList.Objects[I]).CheckDoorState('1',False);
        end;
        if (TEcuInfo(DeviceClientDeviceList.Objects[I]).DoorManageMode2 = dmNothing) or
           (TEcuInfo(DeviceClientDeviceList.Objects[I]).DoorState2 = dsNothing) or
           (TEcuInfo(DeviceClientDeviceList.Objects[I]).DoorPNMode2 = pnNothing)then
        begin
          TEcuInfo(DeviceClientDeviceList.Objects[I]).CheckDoorState('2',False);
        end;
        if (TEcuInfo(DeviceClientDeviceList.Objects[I]).WatchMode = cmNothing) then
        begin
          TEcuInfo(DeviceClientDeviceList.Objects[I]).CheckWatchMode;
        end;
        if Not TEcuInfo(DeviceList.Objects[I]).DeviceSkillReceive  then  //기능 체크
        begin
          TEcuInfo(DeviceList.Objects[I]).CheckSystemSkill;
        end;
      end;
    end;
  end;
  StateCheckTimer.Enabled := True;
end;

function TfmMain.DupCheckTB_AlarmShow(aNodeNo, aEcuID, aSubClass, aSubAddr,
  aZoneCode, aPortNo, aStatus: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

  stSql := ' select * from TB_ALARMSHOW ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND AL_ALARMDEVICETYPECODE = ''' + aSubClass + ''' ';
  stSql := stSql + ' AND AL_SUBADDR = ''' + aSubAddr + ''' ';
  stSql := stSql + ' AND AL_ZONECODE = ''' + aZoneCode + ''' ';
  stSql := stSql + ' AND AL_ZONENO = ''' + aPortNo + ''' ';
  stSql := stSql + ' AND AL_ALARMSTATUSCODE = ''' + aStatus + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnectionEVENT;
    TempAdoQuery.DisableControls;
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
      if recordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.InsertTB_ALARMSHOW(aNodeNo, aEcuID, aSubClass, aSubAddr,
  aZoneCode, aPortNo, aStatus, aMode, aDate, aTime, aMsgNo, aState, aOper,
  aCheckOk, aCheckMsg, aUpdateOper: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ALARMSHOW(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' AL_ALARMDEVICETYPECODE,';
  stSql := stSql + ' AL_SUBADDR,';
  stSql := stSql + ' AL_ZONECODE,';
  stSql := stSql + ' AL_ZONENO,';
  stSql := stSql + ' AL_ALARMSTATUSCODE,';
  stSql := stSql + ' AL_ALARMMODECODE,';
  stSql := stSql + ' AL_DATE,';
  stSql := stSql + ' AL_TIME,';
  stSql := stSql + ' AL_MSGNO,';
  stSql := stSql + ' AL_ZONESTATE,';
  stSql := stSql + ' AL_OPERATOR,';
  stSql := stSql + ' AL_CHECKOK,';
  stSql := stSql + ' AL_CHECKCODE,';
  stSql := stSql + ' AL_UPDATETIME,';
  stSql := stSql + ' AL_UPDATEOPERATOR ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aSubClass + ''',';
  stSql := stSql + '''' + aSubAddr + ''',';
  stSql := stSql + '''' + aZoneCode + ''',';
  stSql := stSql + '''' + aPortNo + ''',';
  stSql := stSql + '''' + aStatus + ''',';
  stSql := stSql + '''' + aMode + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aTime + ''',';
  stSql := stSql + '''' + aMsgNo + ''',';
  stSql := stSql + '''' + aState + ''',';
  stSql := stSql + '''' + aOper + ''',';
  stSql := stSql + '''' + aCheckOk + ''',';
  stSql := stSql + '''' + aCheckMsg + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + aUpdateOper + ''')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_ALARMSHOW(aNodeNo, aEcuID, aSubClass, aSubAddr,
  aZoneCode, aPortNo, aStatus, aMode, aDate, aTime, aMsgNo, aState, aOper,
  aCheckOk, aCheckMsg, aUpdateOper: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ALARMSHOW set ';
  stSql := stSql + ' AL_ALARMMODECODE = ''' + aMode + ''',';
  stSql := stSql + ' AL_DATE = ''' + aDate + ''',';
  stSql := stSql + ' AL_TIME = ''' + aTime + ''',';
  stSql := stSql + ' AL_MSGNO = ''' + aMsgNo + ''',';
  stSql := stSql + ' AL_ZONESTATE = ''' + aState + ''',';
  stSql := stSql + ' AL_OPERATOR = ''' + aOper + ''',';
  stSql := stSql + ' AL_CHECKOK = ''' + aCheckOk + ''',';
  stSql := stSql + ' AL_CHECKCODE = ''' + aCheckMsg + ''',';
  stSql := stSql + ' AL_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + ' AL_UPDATEOPERATOR = ''' + aUpdateOper + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_ALARMDEVICETYPECODE = ''' + aSubClass + ''' ';
  stSql := stSql + ' AND AL_SUBADDR = ''' + aSubAddr + ''' ';
  stSql := stSql + ' AND AL_ZONECODE = ''' + aZoneCode + ''' ';
  stSql := stSql + ' AND AL_ZONENO = ''' + aPortNo + '''';
  stSql := stSql + ' AND AL_ALARMSTATUSCODE = ''' + aStatus + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.CheckFdmsUser(aFDMS_ID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if fdmsType = '0' then //성현
  begin
    stSql := ' select * from tb_employe ';
    stSql := stSql + ' Where str_empCode = ''' + 'ep_' + FillZeroNumber(strtoint(aFDMS_ID),7)  + ''' ';
  end else if fdmsType = '1' then //유니온
  begin
    stSql := 'select * from Tuser ';
    stSql := stSql + ' Where id = ' + aFDMS_ID ;
  end else Exit;

  With ADOfdms do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    if recordCount > 0 then result := True;
  End;
  
end;

function TfmMain.InsertFdmsUser(aEmCode,aFDMS_ID, aEM_NAME, aHandPhone,
  aDEPART_NAME, aPO_NAME, aCA_CARDNO,aMode: string): Boolean;
var
  stSql : string;
  stMode : string;
  stCardNo : string;
begin
  result := False;
  if fdmsType = '0' then //성현
  begin
    stCardNo := FillCharString(aCA_CARDNO,'F',L_nFdmsCardLength);
    stMode := inttostr(strtoint(aMode) - 1);
    if Trim(aHandPhone) = '' then aHandPhone := '000-000-0000';
    stSql := ' Insert Into tb_employe(';
    stSql := stSql + 'str_empnum,';
    stSql := stSql + 'str_empCode,';
    stSql := stSql + 'str_empName,';
    stSql := stSql + 'str_empPostCode,';
    stSql := stSql + 'str_empPositionCode,';
    stSql := stSql + 'str_empJumin,';
    stSql := stSql + 'str_empTel,';
    stSql := stSql + 'str_empUserTimetableName,';
    stSql := stSql + 'str_empUserTimetableData,';
    stSql := stSql + 'str_emptmId,';
    stSql := stSql + 'str_emptmCardnum,';
    stSql := stSql + 'byte_empMainControlModify,';
    stSql := stSql + 'date_empAccountDate) ';
    stSql := stSql + ' Values(';
    stSql := stSql + '''' + aEmCode + ''',';
    stSql := stSql + '''' + 'ep_' + FillZeroNumber(strtoint(aFDMS_ID),7)  + ''',';
    stSql := stSql + '''' + aEM_NAME + ''',';
    stSql := stSql + '''설정안함'',';
    stSql := stSql + '''설정안함'',';
    stSql := stSql + '''000000-0000000'',';
    stSql := stSql + '''' + aHandPhone + ''',';
    stSql := stSql + '''기본값'',';
    stSql := stSql + '''FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFF'',';
    stSql := stSql + ''''+ FillZeroNumber(strtoint(aFDMS_ID),fdmsNo)+''',';
    stSql := stSql + '''' + stCardNo + ''',';
    stSql := stSql + '''' + stMode + ''',';
    stSql := stSql + '''' + formatDateTime('yyyy-mm-dd AMPM HH:MM:SS',Now) + ''')' ;
  end else if fdmsType = '1' then //유니온
  begin
    stSql := 'Insert into Tuser(id,Name,Reg_date,Datelimit,Badmin,Company,Dept,';
    stSql := stSql + 'Validtype,Cardnum,Identify,SecuLevel) Values( ';
    stSql := stSql + aFDMS_ID + ',';
    stSql := stSql + '''' + aEM_NAME + ''',';
    stSql := stSql + '''' + formatdatetime('yyyymmddHHMM',now) + ''',';
    stSql := stSql + '''N0000000000000000'',';
    stSql := stSql + '''0'',';
    stSql := stSql + '''' + aDEPART_NAME + ''',';
    stSql := stSql + '''' + aPO_NAME + ''',';
    stSql := stSql + '''4'',';
    stSql := stSql + '''' + aCA_CARDNO + ''',';
    stSql := stSql + '''0'',';
    stSql := stSql + '''0'')';
  end else Exit;

  with ADOfdmsExec do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      ON E: Exception do
      begin
        Datamodule1.SQLErrorLog('FDMS:' + E.Message + ':' + stSql);
        Exit;
      end;
    End;
  end;
  result := True;
end;

function TfmMain.UpdateFdmsUser(aEmCode,aFDMS_ID, aEM_NAME, aHandPhone,
  aDEPART_NAME, aPO_NAME, aCA_CARDNO,aMode: string): Boolean;
var
  stSql : string;
  stMode : string;
  stCardNo : string;
begin
  result := False;
  if fdmsType = '0' then //성현
  begin
    if Trim(aHandPhone) = '' then aHandPhone := '000-000-0000';
    stMode := inttostr(strtoint(aMode) - 1);
    stCardNo := FillCharString(aCA_CARDNO,'F',L_nFdmsCardLength);
    stSql := ' Update tb_employe set ';
    stSql := stSql + 'str_empNum = ''' + aEmCode + ''',';
    stSql := stSql + 'str_empName = ''' + aEM_NAME + ''',';
    stSql := stSql + 'str_empTel = ''' + aHandPhone + ''',';
    stSql := stSql + 'str_emptmCardnum = ''' + stCardNo + ''', ';
    stSql := stSql + 'byte_empMainControlModify = ''' + stMode + ''' ';
    stSql := stSql + ' where str_empCode = ''' + 'ep_' + FillZeroNumber(strtoint(aFDMS_ID),7)  + ''' ';

  end else if fdmsType = '1' then //유니온
  begin
      stSql := 'update tuser set ';
      stSql := stSql + 'Name = ''' + aEM_NAME + ''',';
      stSql := stSql + 'datelimit = ''N0000000000000000'',' ;
      stSql := stSql + 'badmin = ''0'', ' ;
      stSql := stSql + 'company = ''' + aDEPART_NAME + ''',' ;
      stSql := stSql + 'dept = ''' + aPO_NAME + ''',';
      stSql := stSql + 'validtype = ''4'', ';
      stSql := stSql + 'cardnum = ''' + aCA_CARDNO + ''',';
      stSql := stSql + 'identify = ''0'',' ;
      stSql := stSql + ' seculevel = ''0'' ';
      stSql := stSql + ' Where id = ' + aFDMS_ID ;

  end else Exit;

  with ADOfdmsExec do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      ON E: Exception do
      begin
        Datamodule1.SQLErrorLog('FDMS:' + E.Message + ':' + stSql);
        Exit;
      end;
    End;
  end;
  result := True;
end;

function TfmMain.fdmsUserRelayDeleteSend(aFDMS_ID, aMode: string): Boolean;
var
  stSql : string;
  stMode : string;
begin
  result := True;
  if fdmsType = '0' then //성현
  begin
    stMode := inttostr(strtoint(aMode) - 1);
    stSql := ' Update tb_employe set ';
    stSql := stSql + 'byte_empMainControlModify = ''' + stMode + ''' ';
    stSql := stSql + ' where str_empCode = ''' + 'ep_' + FillZeroNumber(strtoint(aFDMS_ID),7)  + ''' ';
  end else Exit;
  
  result := False;

  with ADOfdmsExec do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;


procedure TfmMain.CardReaderSeverNewConnect(ClientThread: TDXClientThread);
Var
   Ws:String;
   I: Integer;
   StartTime:Comp;
   aLog: String;
   Sock: Integer;
   nIndex : integer;
begin
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;
  DXUnicastDataQueue5.AddSock(Sock);

  StartTime:=TimeCounter+ 600000;
  ws:='';

  While ClientThread.Socket.Connected do
  Begin
    If Application.Terminated then
    Begin
       ClientThread.Socket.CloseNow;
       Exit;
    End;
    //If ForceAbort then Exit;

    If ClientThread.Socket.Readable then
    Begin
      If ClientThread.Socket.CharactersToRead=0 then
      begin
        Break;
      end else
      begin
        for I:= 1 to ClientThread.Socket.CharactersToRead do
        begin
          if bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {원격지에서 받은 데이터 처리 루틴추가}
        nIndex:= Pos(STX,Ws);
        if nIndex = 0 then Exit;
        if nIndex > 1 then Delete(Ws,1,nIndex-1);
        nIndex:= Pos(ETX,Ws);
        if nIndex = 0 then Exit;
        Ws := copy(Ws,1,nIndex);
        ClientThread.Socket.WriteLn(ws);   //STX + ETX 가 있는 경우에만 리턴

        if Ws <> '' then RcvCardReaderServer(ClientThread.Socket.PeerIPAddress,ws);
        if bCARDSERVERSTATE then
        begin
          self.FindClassForm('TfmCardReaderServerMonitor').FindCommand('Message').Params.Values['IP'] := ClientThread.Socket.PeerIPAddress;
          self.FindClassForm('TfmCardReaderServerMonitor').FindCommand('Message').Params.Values['Data'] := Ws;
          self.FindClassForm('TfmCardReaderServerMonitor').FindCommand('Message').Execute;
        end;

        //Ws:= Ws ;
        ws:='';
      end;
      StartTime:=TimeCounter+ 600000;
    End
    Else Begin
       DoSleepEx(1);
       //Application.ProcessMessages;
       ProcessWindowsMessageQueue;
    end;
  end;
  DXUnicastDataQueue5.DelSock(Sock);

end;

procedure TfmMain.RcvCardReaderServer(aClientIP, ast: string);
var
  nIndex : integer;
  nRelayNo : integer;
  nCardLen : integer;
  stCardData : string;
begin
  nIndex := pos(STX,ast);

  if Not IsDigit(copy(ast,2,4)) then Exit;
  nRelayNo := strtoint(copy(ast,2,4));
  if Not IsDigit(copy(ast,6,2)) then Exit;
  nCardLen := strtoint(copy(ast,6,2));

  stCardData := copy(ast,8,nCardLen);

  SendDeviceCardNo(nRelayNo,stCardData);
  InsertTB_SERVERCARDRELAYHIS(FormatDateTime('yyyymmddHHMMSS',Now),inttostr(nRelayNo),stCardData,aClientIP);

end;

procedure TfmMain.SendDeviceCardNo(aRelayNo: integer; aCardData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stCardReaderNo : string;
  aDevice: TDevice;
  aEcuInfo: TEcuInfo;
begin
  if Not GetRelayNo(aRelayNo,stNodeNo,stECUID,stCardReaderNo) then Exit;

  if UseDeviceServer then
  begin
    aDevice := GetDevice(stNodeNo + stEcuID);
    if aDevice <> nil then
      aDevice.ServerCarDataSend(stCardReaderNo,aCardData);
  end else
  begin
    aEcuInfo := GetEcuInfo(stNodeNo + stEcuID);
    if aEcuInfo <> nil then
      aEcuInfo.ServerCarDataSend(stCardReaderNo,aCardData);
  end;
end;

function TfmMain.GetRelayNo(aRelayNo: integer; var aNodeNo, aECUID,
  aCardReaderNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' select * from TB_SERVERCARDRELAY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND SR_RELAYNO = ' + inttostr(aRelayNo) ;

  with RelayCardServerQuery do
  begin
    Close;
//    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    aNodeNo := FillZeroNumber(FindField('AC_NODENO').AsInteger,3);
    aECUID := FindField('AC_ECUID').AsString;
    aCardReaderNo := FindField('RE_READERNO').AsString;
  end;
  result := True;
end;

function TfmMain.InsertTB_SERVERCARDRELAYHIS(aDate, aRelayNo, aCardData,
  aClientIP: string): Boolean;
var
  stSql : string;
  nCardData : int64;
begin
  if IsNumericCardNo then
  begin
    //nCardData := Hex2Dec64(aCardData);
    //aCardData := FillZeroNumber2(nCardData,10);
    aCardData := FillZeroNumber2(Hex2Dec64(aCardData),10);
  end;
  stSql := 'Insert Into TB_SERVERCARDRELAYHIS(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'SR_DATETIME,';
  stSql := stSql + 'SR_RELAYNO,';
  stSql := stSql + 'SR_CARDDATA,';
  stSql := stSql + 'SR_CLIENTIP) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + aRelayNo + ',';
  stSql := stSql + '''' + aCardData + ''',';
  stSql := stSql + '''' + aClientIP + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
  
end;

procedure TfmMain.mn_CardReaderServerClick(Sender: TObject);
begin
  fmCardReaderServer:= TfmCardReaderServer.Create(Self);
  fmCardReaderServer.SHowmodal;
  fmCardReaderServer.Free;
end;

procedure TfmMain.mn_CRSMonitoringClick(Sender: TObject);
begin
  MDIChildShow('TfmCardReaderServerMonitor');
end;

procedure TfmMain.CommandArrayCommandsTCommand3Execute(Command: TCommand;
  Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['STATE'];
   if UpperCase(stResult) = 'TRUE' then bCARDSERVERSTATE := True
   else bCARDSERVERSTATE := False;

end;

procedure TfmMain.FormShow(Sender: TObject);
//var
//  ini_fun : TiniFile;
//  LogoFile : string;
var
  stSql : string;
begin

  bCARDSERVERSTATE := False;
  bCURRENTSTATE := False;
  L_bDeviceSettingShow :=  False;
  L_stSendHolidayYear := GetSendHolidayYear;

  //DEBUG
  //LogSave(ExeFolder + '\..\log\lomosHis.log','FormShow ');
//  L_bFirstFire := False;

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','DAEMON_VER','2');
  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMain.DeviceRegisterClear(Sender: TObject; ReceiveData: string;
  NodeNO: integer);
var
  stECUID : string;
begin
  stEcuID := copy(ReceiveData,15,2);

  UpdateTB_ACCESSDEVICEACK(inttostr(NodeNo),stEcuID,'N'); //기기정보를 다시 날리자.

  InsertTB_ALARMEVENT(formatDateTime('yyyymmddhhnnss',Now),
                      inttostr(NodeNo),
                      stEcuID,
                      '0',
                      '0',
                      '0',
                      '0',
                      '0',
                      '0',
                      '0',
                      '0',
                      'MEMCLEAR',
                      'MC');

end;

function TfmMain.UpdateTB_DEVICESCHEDULEACK(aNodeNo, aEcuID, aDoorNo,
  aAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICESCHEDULE ';
  stSql := stSql + ' Set DE_RCVACK = ''' + aAck + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  if aDoorNo <> '0' then
    stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_DEVICECARDNOACK(aNodeNo, aEcuID,
  aAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO ';
  stSql := stSql + ' Set DE_RCVACK = ''' + aAck + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.mn_AlarmReaderClick(Sender: TObject);
begin
  fmAlaramReader:= TfmAlaramReader.Create(Self);
  fmAlaramReader.SHowmodal;
  fmAlaramReader.Free;
  DeviceInfoSendTimer.Enabled := True;

end;

function TfmMain.CheckClientDataPacket(aData: String;
  var bData: String): string;
var
  nIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
begin

  Result:= '';
  nIndex := pos(LINEEND,aData);
  if nIndex > 0 then
  begin
    Result := copy(aData,1,nIndex);
    Delete(aData, 1, nIndex);
    bData:= aData;
  end;

end;

function TfmMain.SentenceRelayConfigSet: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  L_stSentenceServerIP:='127.0.0.1';
  L_stSentenceServerPort:='3000';
  L_bSCardNoRelayUse:=True;
  L_bSSerialRelayUse:=True;
  L_bSCompanyCodeRelayUse:=True;
  L_bSEmpNoRelayUse:=True;
  L_bSEmpNameRelayUse:=True;
  L_bSCardStateRelayUse:=True;
  L_bSChangeStateRelayUse:=True;
  L_stDelimiter :=',';
  L_stSentenceSendData:='';


  stSql := 'select * from TB_PERRELAYCONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

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

      First;
      While Not Eof do
      begin
        if bApplicationTerminate then Exit;
        if FindField('PC_CONFIGCODE').AsString = 'SCARDNO' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bSCardNoRelayUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SSERIAL' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bSSerialRelayUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SCOMPANYCODE' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bSCompanyCodeRelayUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SEMPNO' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bSEmpNoRelayUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SEMPNAME' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bSEmpNameRelayUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SCARDSTATE' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bSCardStateRelayUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SCHANGESTATE' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bSChangeStateRelayUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SDELIMITER' then
          L_stDelimiter := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'SRELAYIP' then
          L_stSentenceServerIP := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'SRELAYPORT' then
          L_stSentenceServerPort := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBTYPE' then
          G_stRelayDBType := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERIP' then
          G_stRelayDBServerIP := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERPORT' then
          G_stRelayDBServerPort := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBUSERID' then
          G_stRelayDBServerUserID := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBUSERPW' then
          G_stRelayDBServerUserPW := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBNAME' then
          G_stRelayDBServerName := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBTYPE2' then
          G_stRelayDBType2 := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERIP2' then
          G_stRelayDBServerIP2 := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERPORT2' then
          G_stRelayDBServerPort2 := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBUSERID2' then
          G_stRelayDBServerUserID2 := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBUSERPW2' then
          G_stRelayDBServerUserPW2 := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBNAME2' then
          G_stRelayDBServerName2 := FindField('PC_CONFIGVALUE').AsString;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.SentenceRelaySend;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  PastTime : dword;
begin
  if bApplicationTerminate then Exit;

  stSql := commonSql.UpdateTB_EMPHISState2('N','S'); //송신중으로 변경
  DataModule1.ProcessExecSQL(stSql);

  {//EMPHIS 에서 필드 추가로 조인이 필요 없음
  stSql := 'select a.*,b.EM_NAME from TB_EMPHIS a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' Where a.SEND_STATUS2 = ''S'' ';
  }
  stSql := 'select * from TB_EMPHIS ';
  stSql := stSql + ' Where SEND_STATUS2 = ''S'' ';
  stSql := stSql + ' order by seq ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then
      begin
        Exit;
      end;

      if Not SentenceServerConnect then Exit;

      First;
      While Not Eof do
      begin
        if bApplicationTerminate then Exit;
        L_stSentenceSendData := '';
        if L_bSSerialRelayUse then
        begin
          if L_stSentenceSendData <> '' then L_stSentenceSendData := L_stSentenceSendData + L_stDelimiter;
          L_stSentenceSendData := L_stSentenceSendData + inttostr(FindField('FDMS_ID').AsInteger);
        end;
        if L_bSCompanyCodeRelayUse then
        begin
          if L_stSentenceSendData <> '' then L_stSentenceSendData := L_stSentenceSendData + L_stDelimiter;
          L_stSentenceSendData := L_stSentenceSendData + FindField('CO_COMPANYCODE').AsString;
        end;
        if L_bSEmpNoRelayUse then
        begin
          if L_stSentenceSendData <> '' then L_stSentenceSendData := L_stSentenceSendData + L_stDelimiter;
          L_stSentenceSendData := L_stSentenceSendData + FindField('EM_CODE').AsString;
        end;
        if L_bSEmpNameRelayUse then
        begin
          if L_stSentenceSendData <> '' then L_stSentenceSendData := L_stSentenceSendData + L_stDelimiter;
          L_stSentenceSendData := L_stSentenceSendData + FindField('EM_NAME').AsString;
        end;
        if L_bSCardStateRelayUse then
        begin
          if L_stSentenceSendData <> '' then L_stSentenceSendData := L_stSentenceSendData + L_stDelimiter;
          L_stSentenceSendData := L_stSentenceSendData + FindField('CA_CARDTYPE').AsString;
        end;
        if L_bSChangeStateRelayUse then
        begin
          if L_stSentenceSendData <> '' then L_stSentenceSendData := L_stSentenceSendData + L_stDelimiter;
          L_stSentenceSendData := L_stSentenceSendData + FindField('MODE').AsString;
        end;
        if L_bSCardNoRelayUse then
        begin
          if L_stSentenceSendData <> '' then L_stSentenceSendData := L_stSentenceSendData + L_stDelimiter;
          L_stSentenceSendData := L_stSentenceSendData + FindField('CA_CARDNO').AsString;
        end;
        L_stSentenceSendData := STX + L_stSentenceSendData + ETX;

        L_bSentenceSendResult := False;

        if Not SentenceSock.Open then break;
        SentenceSock.FlushInBuffer;
        SentenceSock.FlushOutBuffer;
        Delay(10);
        Try
          SentenceSock.PutString(L_stSentenceSendData);
          //StatusBar1.Panels[2].Text := '[TX]' + L_stSentenceSendData ;
        Except
          Exit;
        End;

        PastTime := GetTickCount + 1000;
        While Not L_bSentenceSendResult do
        begin
          Application.ProcessMessages;
          if GetTickCount > PastTime then Break;  //300밀리동안 응답 없으면 실패로 처리함
        end;

        if L_bSentenceSendResult then
        begin
          stSql := CommonSql.UpdateTB_EMPHISSendAck2(inttostr(FindField('seq').asinteger),'Y');
          DataModule1.ProcessExecSQL(stSql);
        end;
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
    
    stSql := commonSql.UpdateTB_EMPHISState2('S','N'); //송신실패한거 미송신으로 변경
    DataModule1.ProcessExecSQL(stSql);
  End;

end;

function TfmMain.SentenceServerConnect: Boolean;
begin
  result := False;
  Try
    SentenceSock.Open := False;
    SentenceSock.WsAddress := L_stSentenceServerIP;
    SentenceSock.WsPort := L_stSentenceServerPort;
    SentenceSock.Open := True;
  Except
    Exit;
  End;
  result := True;
end;

procedure TfmMain.SentenceSockTriggerAvail(CP: TObject; Count: Word);
var
  st:String;
  I: Integer;
  nIndex : integer;
begin
  st:= '';
  for I := 1 to Count do st := st + SentenceSock.GetChar;
  nIndex := Pos(STX,st);
  if nIndex = 0 then Exit;
  if nIndex > 1 then Delete(st,1,nIndex - 1);
  nIndex := Pos(ETX,st);
  if nIndex = 0 then Exit;
  st := copy(st,1,nIndex);

 // StatusBar1.Panels[2].Text := '[RX]' + st;
  
  if st = L_stSentenceSendData then L_bSentenceSendResult := True;
end;

procedure TfmMain.mn_FireRecoveryClick(Sender: TObject);
var
  i : integer;
begin
  //L_bFirstFire := False;
  L_bFierDoorOpen := False;
  if UseDeviceServer then
  begin
    for i:= 0 to ComNodeList.Count - 1 do
    begin
      TCommnode(ComNodeList.Objects[i]).FireRecovery;
    end;
  end else
  begin
    for i:= 0 to DeviceClientNodeList.Count - 1 do
    begin
      TMCUNodeInfo(DeviceClientNodeList.Objects[i]).FireRecovery;
    end;
  end;
  UpdateTB_CURRENTDAEMON('FIREORIGIN','FALSE');
end;

procedure TfmMain.DoorAllOpenMode;
var
  i : integer;
  stDeviceID : string;
  stSendData : string;
begin
  if L_bAllDoorOpen then Exit;
  L_bAllDoorOpen := True;
  // Door1 All Open Mode Change
  stSendData:= 'C'+                                     //  Msg Code
       //InttoStr(CommNode.Send_MsgNo)+          // Message Count
       '0' +
       '1' + //aDoorNo+                                //  기기내 Door No
       #$30+                                   //  RecordCount(고정)
       #$32+                                   //  RecordCount(모드변경 #$32)
       '1'; //aMode;                                  //  '0':운영 ,'1':개방
  MCUBroadDataSend('99','c',stSendData);
  // Door2 All Open Mode Change
  stSendData:= 'C'+                                     //  Msg Code
       //InttoStr(CommNode.Send_MsgNo)+          // Message Count
       '0' +
       '2' + //aDoorNo+                                //  기기내 Door No
       #$30+                                   //  RecordCount(고정)
       #$32+                                   //  RecordCount(모드변경 #$32)
       '1'; //aMode;                                  //  '0':운영 ,'1':개방
  MCUBroadDataSend('99','c',stSendData);
  {
  //Delay(500);
  if UseDeviceServer then
  begin
    for i:= 0 to DeviceList.Count - 1 do
    begin
      stDeviceID := FillZeroNumber(TDevice(DeviceList.Objects[I]).NodeNo,3) + TDevice(DeviceList.Objects[I]).ECUID + '1';
      FireDoorOpenList.Add(stDeviceID);
      //TDevice(DeviceList.Objects[I]).DoorModeChange('1','1',False); //1번문 개방
      //Delay(200);
      stDeviceID := FillZeroNumber(TDevice(DeviceList.Objects[I]).NodeNo,3) + TDevice(DeviceList.Objects[I]).ECUID + '2';
      FireDoorOpenList.Add(stDeviceID);
      StatusBar1.Panels[2].Text := 'FireDoorOpenList Add(' + inttostr(i) + ')';
      Application.ProcessMessages;
      //DoorModeChange(stDeviceID,'1');
      //TDevice(DeviceList.Objects[I]).DoorModeChange('2','1',False); //2번문 개방
      //Delay(200);
    end;
  end else
  begin
    for i:= 0 to DeviceClientDeviceList.Count - 1 do
    begin
      stDeviceID := FillZeroNumber(TEcuInfo(DeviceClientDeviceList.Objects[I]).NodeNo,3) + TEcuInfo(DeviceClientDeviceList.Objects[I]).ECUID + '1';
      FireDoorOpenList.Add(stDeviceID);
      stDeviceID := FillZeroNumber(TEcuInfo(DeviceClientDeviceList.Objects[I]).NodeNo,3) + TEcuInfo(DeviceClientDeviceList.Objects[I]).ECUID + '2';
      FireDoorOpenList.Add(stDeviceID);
      StatusBar1.Panels[2].Text := 'FireDoorOpenList Add(' + inttostr(i) + ')';
      Application.ProcessMessages;
//      TEcuInfo(DeviceClientDeviceList.Objects[I]).DoorModeChange('1','1',True); //1번문 개방
//      Delay(200);
//      TEcuInfo(DeviceClientDeviceList.Objects[I]).DoorModeChange('2','1',True); //2번문 개방
//      Delay(200);
    end;
  end;
  FireDoorOpenTimer.Enabled := True; }
  L_bAllDoorOpen := False;
end;

procedure TfmMain.FireConfigSet;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  L_stFireStatus := 'FI'; //화재감지상태값
  L_bFireAllOpen := False; //화재시 전체개방유무
  L_bFireRecoverUse := False; //화재전체복구 사용유무

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''FIRE'' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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

      First;
      While Not Eof do
      begin
        if bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'FIRERECUSE' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then  L_bFireRecoverUse := True
          else L_bFireRecoverUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'FIREOPEN' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then  L_bFireAllOpen := True
          else L_bFireAllOpen := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'FIRESTATUS' then
        begin
          L_stFireStatus := FindField('CO_CONFIGVALUE').AsString ;
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.FDSendClientData(stData: string): Boolean;
begin
  if Not FoodServer.IsActive then Exit;
  DXUnicastDataQueue2.AddToQueue(stData + LINEEND);
end;

procedure TfmMain.FDRcvFromClient(aClientIP, ast: string);
var
  nIndex : integer;
  stCMD : string;
  stDeviceID : string;
  bSendAll : Boolean;
begin
  nIndex := pos(DATADELIMITER,ast);
  stCMD := copy(ast,1,nIndex - 1);
  Delete(ast,1,nIndex);
  nIndex := pos(DATADELIMITER,ast);
  stDeviceID := copy(ast,1,nIndex - 1);
  Delete(ast,1,nIndex);

  if stCMD = 'STATECHECK' then DeviceSTATECHECK(stDeviceID);

end;


procedure TfmMain.mn_DeviceSettingClick(Sender: TObject);
begin
  fmDeviceSetting:= TfmDeviceSetting.Create(Self);
  L_bDeviceSettingShow := True;
  fmDeviceSetting.Showmodal;
  L_bDeviceSettingShow := False;
  fmDeviceSetting.Free;

end;

function TfmMain.PubDoorInfo_Device_Serch(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stDeviceID : string;
  aDevice: TDevice;
  aEcuInfo : TEcuInfo;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  if UseDeviceServer then
  begin
    aDevice:= GetDevice(stDeviceID);
    if aDevice = nil then Exit;
    aDevice.DeviceDoorInfoSearch(aDoorNo);
  end else
  begin
    aEcuInfo:= GetEcuInfo(stDeviceID);
    if aEcuInfo = nil then Exit;
    aEcuInfo.DeviceDoorInfoSearch(aDoorNo);
  end;
  result := True;
end;

function TfmMain.PubDoorInfo_Device_Setting(aNodeNo, aEcuID, aDoorNo,
  aCardMode,aDoorMode,aDoorControlTime,aOpenMoni,aUseSch,aSendDoor,aAlarmLong,
  aFire,aLockType,aDSOpen,aRemoteDoor: string): Boolean;
var
  stDeviceID : string;
  aDevice: TDevice;
  aEcuInfo: TEcuInfo;
  stDoorControlTime1 : string;
  nOrdUDiff : integer;
  nDoorTime : integer;
  nOrd : integer;
  stMSEC : string;
  nMSec : integer;
  nRemoteCancelDoorOpen1 : integer;
  nLockType : integer;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  if UseDeviceServer then
  begin
    aDevice:= GetDevice(stDeviceID);
    if aDevice = nil then Exit;
  end else
  begin
    aEcuInfo:= GetEcuInfo(stDeviceID);
    if aEcuInfo = nil then Exit;
  end;

  if IsDigit(aDoorControlTime) then
  begin
    if strtoint(aDoorControlTime) < 10 then
    begin
       stDoorControlTime1 := Trim(aDoorControlTime);
    end else
    begin
      nOrdUDiff := 26;
      nDoorTime := strtoint(aDoorControlTime) - 10;
      nDoorTime := nDoorTime div 5;
      if nDoorTime < nOrdUDiff then  nOrd := Ord('A') + nDoorTime
      else nOrd := Ord('a') + nDoorTime - nOrdUDiff;
      if nOrd > Ord('z') then nOrd := Ord('z');
      stDoorControlTime1 := Char(nOrd);
    end;
  end else
  begin
    stMSEC := copy(aDoorControlTime,1,3);
    if Not isDigit(stMSEC) then
    begin
      //showmessage('밀리초 단위는 선택에 의해서만 가능합니다.');
      Exit;
    end;
    nMSec := strtoint(stMsec) div 100;
    if nMSec < 1 then
    begin
      //showmessage('밀리초 단위는 선택에 의해서만 가능합니다.');
      Exit;
    end;
    if nMSec > 9 then
    begin
      //showmessage('밀리초 단위는 선택에 의해서만 가능합니다.');
      Exit;
    end;
    nOrd := $20 + nMSec; //21~29 까지 MSEC;
    stDoorControlTime1 := Char(nOrd);
  end;

  if Not IsDigit(aCardMode) then aCardMode := '0';
  if Not IsDigit(aDoorMode) then aDoorMode := '0';
  if Not IsDigit(aOpenMoni) then aOpenMoni := '0';
  if Not IsDigit(aUseSch)   then aUseSch := '0';
  if Not IsDigit(aSendDoor)   then aSendDoor := '0';
  if Not IsDigit(aAlarmLong)   then aAlarmLong := '0';
  if Not IsDigit(aFire)   then aFire := '0';

  //출입문1
  if strtoint(aLockType) < 4 then nLockType := strtoint(aLockType)
  else nLockType := strtoint(aLockType) + 2;
  if not isDigit(aDSOpen) then aDSOpen := '0';
  if not isDigit(aRemoteDoor) then aRemoteDoor := '0';

  if UseDeviceServer then
  begin
    aDevice.DeviceDoorInfoSetting(aDoorNo,
                                aCardMode,
                                aDoorMode,
                                stDoorControlTime1,
                                aOpenMoni,
                                aUseSch,
                                aSendDoor,
                                aAlarmLong,
                                aFire,
                                inttostr(nLockType),
                                aDSOpen,
                                aRemoteDoor);
  end else
  begin
    aEcuInfo.DeviceDoorInfoSetting(aDoorNo,
                                aCardMode,
                                aDoorMode,
                                stDoorControlTime1,
                                aOpenMoni,
                                aUseSch,
                                aSendDoor,
                                aAlarmLong,
                                aFire,
                                inttostr(nLockType),
                                aDSOpen,
                                aRemoteDoor);
  end;


end;

function TfmMain.MDIForm(FormName: string): TForm;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        result := Screen.Forms[i];
        Exit;
      end;
    end;
  end;
end;

procedure TfmMain.mn_InOutReaderClick(Sender: TObject);
begin
  fmInOutReader:= TfmInOutReader.Create(Self);
  fmInOutReader.SHowmodal;
  fmInOutReader.Free;

end;

procedure TfmMain.mn_InOutGroupClick(Sender: TObject);
begin
  fmInOutGroup:= TfmInOutGroup.Create(Self);
  fmInOutGroup.SHowmodal;
  fmInOutGroup.Free;

end;

procedure TfmMain.RSERVERExecute(AThread: TIdPeerThread);
var
  stTemp : string;
  ClientInfo : TClientInfo;
  nIndex : integer;
begin
  if bApplicationTerminate then Exit;

  Try
    ClientInfo := Pointer(AThread.Data);
    if ClientInfo = nil then Exit;
    nIndex := ClientConnectList.IndexOf(ClientInfo);
    if nIndex > -1 then TClientInfo(ClientConnectList.Items[nIndex]).AliveTime := Now;
    stTemp:= AThread.Connection.ReadLn(LINEEND);
//    stTemp:= AThread.Connection.CurrentReadBuffer;
    if AThread <> nil then
    begin
      do_ClientProcessPacket(AThread,stTemp);
    end;
  Except
    //로그정리
    AThread.Stop;
  End;

end;

procedure TfmMain.RSERVERConnect(AThread: TIdPeerThread);
var
  ClientInfo : TClientInfo;
begin
  if bApplicationTerminate then Exit;
  AThread.FreeOnTerminate := True;
  ClientInfo := TClientInfo.Create;
  ClientInfo.ClientIP := AThread.Connection.Socket.Binding.PeerIP;
  ClientInfo.ClientPort := AThread.Connection.Socket.Binding.PeerPort;
  ClientInfo.AThread := AThread;
  ClientConnectList.Add(ClientInfo);
  AThread.Data := ClientInfo;
end;

procedure TfmMain.RSERVERDisconnect(AThread: TIdPeerThread);
var
  ClientInfo : TClientInfo;
  nIndex : integer;
begin
  ClientInfo := Pointer(AThread.Data);
  if ClientInfo = nil then Exit;
  AThread.Data := nil;
  nIndex := ClientConnectList.IndexOf(ClientInfo);
  if nIndex > -1 then ClientConnectList.Delete(nIndex);
  ClientInfo.Free;
end;

procedure TfmMain.do_ClientProcessPacket(AThread: TIdPeerThread;aPacket: string);
var
  nIndex : integer;
  stCMD : string;
  stDeviceID : string;
  stData : string;
begin
  if Trim(aPacket) = '' then Exit;
  nIndex := pos(DATADELIMITER,aPacket);
  stCMD := Trim(copy(aPacket,1,nIndex - 1));
  Delete(aPacket,1,nIndex);
  nIndex := pos(DATADELIMITER,aPacket);
  stDeviceID := copy(aPacket,1,nIndex - 1);
  Delete(aPacket,1,nIndex);
  stData := aPacket;

  if stCMD = '' then Exit;
  if stDeviceID = '' then Exit;

  ClientCommunication.Excute(AThread,stCMD,stDeviceID,stData);
end;


procedure TfmMain.CaseNodeStateAllCheckSend(AThread: TIdPeerThread);
var
  i : integer;
  stClientSendData : string;
begin
  if UseDeviceServer then
  begin
    for i:= 0 to ComNodeList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if TCommNode(ComNodeList.Objects[i]).SocketConnected then
      begin
        stClientSendData := 'R' +
                        'N' +
                        FillZeroNumber(TCommNode(ComNodeList.Objects[i]).No,3) +
                        '00' +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('Connected'),3) +
                        'Connected';
      end else
      begin
        stClientSendData := 'R' +
                        'N' +
                        FillZeroNumber(TCommNode(ComNodeList.Objects[i]).No,3) +
                        '00' +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('DisConnected'),3) +
                        'DisConnected';
      end;
      CaseSendClientData(stClientSendData,AThread);
      Application.ProcessMessages;
    end;
  end else
  begin
    for i:= 0 to DeviceClientNodeList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if TMCUNodeInfo(DeviceClientNodeList.Objects[i]).SocketConnected then
      begin
        stClientSendData := 'R' +
                        'N' +
                        FillZeroNumber(TMCUNodeInfo(DeviceClientNodeList.Objects[i]).No,3) +
                        '00' +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('Connected'),3) +
                        'Connected';
      end else
      begin
        stClientSendData := 'R' +
                        'N' +
                        FillZeroNumber(TMCUNodeInfo(DeviceClientNodeList.Objects[i]).No,3) +
                        '00' +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('DisConnected'),3) +
                        'DisConnected';
      end;
      CaseSendClientData(stClientSendData,AThread);
      Application.ProcessMessages;
    end;
  end;

end;

function TfmMain.CaseSendClientData(stData: string;
  AThread: TIdPeerThread): Boolean;
begin
  AThread.Connection.WriteLn(stData);
end;

procedure TfmMain.CaseDeviceStateAllCheckSend(AThread: TIdPeerThread);
var
  i : integer;
  stClientSendData : string;
begin
  if UseDeviceServer then
  begin
    for i:=0 to DeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if TDevice(DeviceList.Objects[i]).Connected then
      begin
        stClientSendData := 'R' +
                        'E' +
                        FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3) +
                        TDevice(DeviceList.Objects[i]).ECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('Connected'),3) +
                        'Connected';
      end else
      begin
        stClientSendData := 'R' +
                        'E' +
                        FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3) +
                        TDevice(DeviceList.Objects[i]).ECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('DisConnected'),3) +
                        'DisConnected';
      end;
      CaseSendClientData(stClientSendData,AThread);
      Application.ProcessMessages;
    end;
  end else
  begin
    for i:=0 to DeviceClientDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if TEcuInfo(DeviceClientDeviceList.Objects[i]).Connected then
      begin
        stClientSendData := 'R' +
                        'E' +
                        FillZeroNumber(TEcuInfo(DeviceClientDeviceList.Objects[i]).NodeNo,3) +
                        TEcuInfo(DeviceClientDeviceList.Objects[i]).ECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('Connected'),3) +
                        'Connected';
      end else
      begin
        stClientSendData := 'R' +
                        'E' +
                        FillZeroNumber(TEcuInfo(DeviceClientDeviceList.Objects[i]).NodeNo,3) +
                        TEcuInfo(DeviceClientDeviceList.Objects[i]).ECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'C' +
                        FillZeroNumber(Length('DisConnected'),3) +
                        'DisConnected';
      end;
      CaseSendClientData(stClientSendData,AThread);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfmMain.CaseAlarmStateAllCheckSend(AThread: TIdPeerThread);
var
  i : integer;
  stMode : string;
  stClientSendData : string;
begin
  if UseDeviceServer then
  begin
    for i:=0 to DeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;

      Case TDevice(DeviceList.Objects[i]).WatchMode of
       cmArm : begin  stMode := 'A' end;
       cmDisarm : begin stMode := 'D' end;
       cmTest : begin stMode := 'T' end;
       cmInit : begin stMode := 'I' end;
       cmPatrol : begin stMode := 'P' end;
       else begin stMode := 'E' end;
      end;
      stClientSendData := 'R' +
                        'A' +
                        FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3) +
                        TDevice(DeviceList.Objects[i]).ECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'S' +
                        FillZeroNumber(1,3) +
                        stMode;


      CaseSendClientData(stClientSendData,AThread);
      Application.ProcessMessages;
    end;
  end else
  begin
    for i:=0 to DeviceClientDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;

      Case TEcuInfo(DeviceClientDeviceList.Objects[i]).WatchMode of
       cmArm : begin  stMode := 'A' end;
       cmDisarm : begin stMode := 'D' end;
       cmTest : begin stMode := 'T' end;
       cmInit : begin stMode := 'I' end;
       cmPatrol : begin stMode := 'P' end;
       else begin stMode := 'E' end;
      end;
      stClientSendData := 'R' +
                        'A' +
                        FillZeroNumber(TEcuInfo(DeviceClientDeviceList.Objects[i]).NodeNo,3) +
                        TEcuInfo(DeviceClientDeviceList.Objects[i]).ECUID +
                        '00' +
                        '00' +
                        'DV' +
                        'S' +
                        FillZeroNumber(1,3) +
                        stMode;


      CaseSendClientData(stClientSendData,AThread);
      Application.ProcessMessages;
    end;
  end;

end;

procedure TfmMain.CaseDoorStateAllCheckSend(AThread: TIdPeerThread);
var
  i : integer;
  stManageType : string;
  stPNType : string;
  stDoorState : string;
  stData : string;
  stClientSendData : string;
begin

  if UseDeviceServer then
  begin
    for i:=0 to DeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      Case TDevice(DeviceList.Objects[i]).DoorManageMode1 of
        dmNothing : begin stManageType := 'E' end;
        dmManager : begin stManageType := '0' end;
        dmOpen : begin stManageType := '1' end;
        dmLock : begin stManageType := '2' end;
        else begin stManageType := 'E' end;
      end;
      Case TDevice(DeviceList.Objects[i]).DoorPNMode1 of
        pnNothing : begin stPNType := 'E' end;
        pnPositive : begin stPNType := '0' end;
        pnNegative : begin stPNType := '1' end;
        else begin stPNType := 'E' end;
      end;
      Case TDevice(DeviceList.Objects[i]).DoorState1 of
        dsNothing : begin stDoorState := 'E' end;
        dsClose : begin stDoorState := 'C' end;
        dsOpen : begin stDoorState := 'O' end;
        dsLongTime : begin stDoorState := 'T' end;
        dsOpenErr : begin stDoorState := 'U' end;
        dsCloseErr : begin stDoorState := 'L' end;
        else begin stDoorState := 'E' end;
      end;
      stData :=  stManageType +
                 stPNType +
                 stDoorState;
      stClientSendData := 'R' +
                        'D' +
                        FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3) +
                        TDevice(DeviceList.Objects[i]).ECUID +
                        '01' +  //
                        '00' +
                        'DV' +
                        'S' +
                        FillZeroNumber(Length(stData),3) +
                        stData;
      CaseSendClientData(stClientSendData,AThread);
      Application.ProcessMessages;
      Delay(10);

      Case TDevice(DeviceList.Objects[i]).DoorManageMode2 of
        dmNothing : begin stManageType := 'E' end;
        dmManager : begin stManageType := '0' end;
        dmOpen : begin stManageType := '1' end;
        dmLock : begin stManageType := '2' end;
        else begin stManageType := 'E' end;
      end;
      Case TDevice(DeviceList.Objects[i]).DoorPNMode2 of
        pnNothing : begin stPNType := 'E' end;
        pnPositive : begin stPNType := '0' end;
        pnNegative : begin stPNType := '1' end;
        else begin stPNType := 'E' end;
      end;
      Case TDevice(DeviceList.Objects[i]).DoorState2 of
        dsNothing : begin stDoorState := 'E' end;
        dsClose : begin stDoorState := 'C' end;
        dsOpen : begin stDoorState := 'O' end;
        dsLongTime : begin stDoorState := 'T' end;
        dsOpenErr : begin stDoorState := 'U' end;
        dsCloseErr : begin stDoorState := 'L' end;
        else begin stDoorState := 'E' end;
      end;
      stData :=  stManageType +
                 stPNType +
                 stDoorState;
      stClientSendData := 'R' +
                        'D' +
                        FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3) +
                        TDevice(DeviceList.Objects[i]).ECUID +
                        '02' +  //
                        '00' +
                        'DV' +
                        'S' +
                        FillZeroNumber(Length(stData),3) +
                        stData;
      CaseSendClientData(stClientSendData,AThread);
      Application.ProcessMessages;
    end;
  end else
  begin
    for i:=0 to DeviceClientDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      Case TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorManageMode1 of
        dmNothing : begin stManageType := 'E' end;
        dmManager : begin stManageType := '0' end;
        dmOpen : begin stManageType := '1' end;
        dmLock : begin stManageType := '2' end;
        else begin stManageType := 'E' end;
      end;
      Case TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorPNMode1 of
        pnNothing : begin stPNType := 'E' end;
        pnPositive : begin stPNType := '0' end;
        pnNegative : begin stPNType := '1' end;
        else begin stPNType := 'E' end;
      end;
      Case TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorState1 of
        dsNothing : begin stDoorState := 'E' end;
        dsClose : begin stDoorState := 'C' end;
        dsOpen : begin stDoorState := 'O' end;
        dsLongTime : begin stDoorState := 'T' end;
        dsOpenErr : begin stDoorState := 'U' end;
        dsCloseErr : begin stDoorState := 'L' end;
        else begin stDoorState := 'E' end;
      end;
      stData :=  stManageType +
                 stPNType +
                 stDoorState;
      stClientSendData := 'R' +
                        'D' +
                        FillZeroNumber(TEcuInfo(DeviceClientDeviceList.Objects[i]).NodeNo,3) +
                        TEcuInfo(DeviceClientDeviceList.Objects[i]).ECUID +
                        '01' +  //
                        '00' +
                        'DV' +
                        'S' +
                        FillZeroNumber(Length(stData),3) +
                        stData;
      CaseSendClientData(stClientSendData,AThread);
      Application.ProcessMessages;
      Delay(10);

      Case TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorManageMode2 of
        dmNothing : begin stManageType := 'E' end;
        dmManager : begin stManageType := '0' end;
        dmOpen : begin stManageType := '1' end;
        dmLock : begin stManageType := '2' end;
        else begin stManageType := 'E' end;
      end;
      Case TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorPNMode2 of
        pnNothing : begin stPNType := 'E' end;
        pnPositive : begin stPNType := '0' end;
        pnNegative : begin stPNType := '1' end;
        else begin stPNType := 'E' end;
      end;
      Case TEcuInfo(DeviceClientDeviceList.Objects[i]).DoorState2 of
        dsNothing : begin stDoorState := 'E' end;
        dsClose : begin stDoorState := 'C' end;
        dsOpen : begin stDoorState := 'O' end;
        dsLongTime : begin stDoorState := 'T' end;
        dsOpenErr : begin stDoorState := 'U' end;
        dsCloseErr : begin stDoorState := 'L' end;
        else begin stDoorState := 'E' end;
      end;
      stData :=  stManageType +
                 stPNType +
                 stDoorState;
      stClientSendData := 'R' +
                        'D' +
                        FillZeroNumber(TEcuInfo(DeviceClientDeviceList.Objects[i]).NodeNo,3) +
                        TEcuInfo(DeviceClientDeviceList.Objects[i]).ECUID +
                        '02' +  //
                        '00' +
                        'DV' +
                        'S' +
                        FillZeroNumber(Length(stData),3) +
                        stData;
      CaseSendClientData(stClientSendData,AThread);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfmMain.PC1Click(Sender: TObject);
begin
  mem_ComList.Visible := Not mem_ComList.Visible;
  mem_ComList.Lines.Clear;
end;

procedure TfmMain.N34Click(Sender: TObject);
var
  i : integer;
  stCardNo : string;
  stSql : string;
begin
  pan_gauge.Visible := True;
  ga_Table.Progress := 0;
  ga_Table.MaxValue := 33000;
  for i := 1 to 33000 do
  begin
    ga_Table.Progress := i;
    stCardNo := FillZeroNumber(i,16);
    stSql := 'Insert Into TB_CARD(ca_cardno,ca_gubun,ca_cardtype,em_code,co_companycode,ca_updatetime,ca_updateoperator,ca_status,positionnum) ';
    stSql := stSql + ' values( ';
    stSql := stSql + '''' + stCardNo + ''',';
    stSql := stSql + '''1'',';
    stSql := stSql + '''1'',';
    stSql := stSql + '''' + stCardNo + ''',';
    stSql := stSql + '''001'',';
    stSql := stSql + '''' + FormatDateTime('yyyymmddhhmmss',now) + ''',';
    stSql := stSql + '''TEST'',';
    stSql := stSql + '''Y'',';
    stSql := stSql + '' + inttostr(i) + ')';
    DataModule1.ProcessExecSQL(stSql);

    stSql := 'Insert Into tb_employee(em_code,co_companycode,co_jijumcode,co_departcode,po_posicode,em_name) ';
    stSql := stSql + ' values( ';
    stSql := stSql + '''' + stCardNo + ''',';
    stSql := stSql + '''001'',';
    stSql := stSql + '''000'',';
    stSql := stSql + '''000'',';
    stSql := stSql + '''000'',';
    stSql := stSql + '''' + stCardNo + ''') ';
    DataModule1.ProcessExecSQL(stSql);
    application.ProcessMessages;

  end;
  pan_gauge.Visible := False;

end;

procedure TfmMain.sendClientTimerTimer(Sender: TObject);
var
  nConnection : integer;
  ClientInfo : TClientInfo;
  stData : string;
begin
  //StatusBar1.Panels[2].Text := 'sendClientTimer';
  Application.ProcessMessages;
  if ClientSendList.Count < 1 then Exit;
  sendClientTimer.Enabled := False;
  stData := ClientSendList.Strings[0];
  ClientSendList.Delete(0);
  for nConnection:=0 to ClientConnectList.Count - 1 do
  begin
    TClientInfo(ClientConnectList.Items[nConnection]).AThread.Connection.WriteLn(stData);
    Application.ProcessMessages;
  end;
  //sendClientTimer.Enabled := True;
end;

function TfmMain.LoadInOutReader: Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
  stInOutReader : string;
begin
  Result := False;

  InOutCardReaderList.Clear;
  InOutCountList.Clear;

  stSql := 'Select * from TB_READER where RE_INOUTCOUNT <> 0 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    With TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While Not Eof do
      begin
        stInOutReader := FillZeroNumber(FindField('AC_NODENO').AsInteger,3);
        stInOutReader := stInOutReader + FindField('AC_ECUID').AsString;
        stInOutReader := stInOutReader + FindField('RE_READERNO').AsString;
        InOutCardReaderList.Add(stInOutReader);
        InOutCountList.Add(inttostr(FindField('RE_INOUTCOUNT').asinteger));
        next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  Result := True;

end;

function TfmMain.UpdateTB_INOUTCOUNTADD(aDate, aNodeNo, aECUID, aDoorNo,
  aInOutCount: string): Boolean;
var
  stSql : string;
begin
  if Not CheckTB_INOUTCOUNT(aDate, aNodeNo, aECUID, aDoorNo) then
  begin
    stSql := ' Insert Into TB_INOUTCOUNT( ';
    stSql := stSql + ' GROUP_CODE,' ;
    stSql := stSql + ' IO_DATE, ';
    stSql := stSql + ' AC_NODENO, ';
    stSql := stSql + ' AC_ECUID, ';
    stSql := stSql + ' DO_DOORNO, ';
    stSql := stSql + ' IO_COUNT) ';
    stSql := stSql + ' VALUES( ';
    stSql := stSql + '''' + GROUPCODE + ''', ';
    stSql := stSql + '''' + aDate + ''',';
    stSql := stSql + '' + aNodeNo + ', ';
    stSql := stSql + '''' + aECUID + ''', ';
    stSql := stSql + '''' + aDoorNo + ''', ';
    stSql := stSql + '' + aInOutCount + ') ';
  end else
  begin
    stSql := ' Update TB_INOUTCOUNT set ';
    stSql := stSql + ' IO_COUNT = IO_COUNT + (' + aInOutCount + ') ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ' ;
    stSql := stSql + ' AND IO_DATE = ''' + aDate + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
    stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.CheckTB_INOUTCOUNT(aDate, aNodeNo, aECUID,
  aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_INOUTCOUNT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND IO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text :=  stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
  end;
  result := True;
end;

procedure TfmMain.FTPServerCreate;
begin
  if not DirectoryExists(ExtractFileDir(Application.ExeName) + '\data') then
  begin
    if not CreateDir(ExtractFileDir(Application.ExeName) + '\data')then
    raise Exception.Create('Cannot create '+ ExtractFileDir(Application.ExeName) + '\data');
  end;
  IdFTPServer := tIdFTPServer.create( nil ) ;
  IdFTPServer.DefaultPort := 3101;
  IdFTPServer.AllowAnonymousLogin := False;
  IdFTPServer.EmulateSystem := ftpsUNIX;
  IdFTPServer.HelpReply.text := 'Help is not implemented';
  IdFTPServer.OnChangeDirectory := IdFTPServer1ChangeDirectory;
  IdFTPServer.OnGetFileSize := IdFTPServer1GetFileSize;
  IdFTPServer.OnListDirectory := IdFTPServer1ListDirectory;
  IdFTPServer.OnUserLogin := IdFTPServer1UserLogin;
  IdFTPServer.OnRenameFile := IdFTPServer1RenameFile;
  IdFTPServer.OnDeleteFile := IdFTPServer1DeleteFile;
  IdFTPServer.OnRetrieveFile := IdFTPServer1RetrieveFile;
  IdFTPServer.OnStoreFile := IdFTPServer1StoreFile;
  IdFTPServer.OnMakeDirectory := IdFTPServer1MakeDirectory;
  IdFTPServer.OnRemoveDirectory := IdFTPServer1RemoveDirectory;

  IdFTPServer.Greeting.NumericCode := 220;
  IdFTPServer.OnDisconnect := IdFTPServer1DisConnect;
  IdFTPServer.OnConnect := IdFTPServer1Connect;
  with IdFTPServer.CommandHandlers.add do
  begin
    Command := 'XCRC';
    OnCommand := IdFTPServer1CommandXCRC;
  end;
  FTPSockList := TStringList.Create;
  FTPSockList.Clear;
  SockNo := 0;

end;

procedure TfmMain.IdFTPServer1ChangeDirectory(ASender: TIdFTPServerThread;
  var VDirectory: string);
begin
  VDirectory := GetNewDirectory( ASender.CurrentDir, VDirectory ) ;
end;

procedure TfmMain.IdFTPServer1CommandXCRC(ASender: TIdCommand);
var
  s: string;
begin
  with TIdFTPServerThread( ASender.Thread ) do
  begin
    if Authenticated then
    begin
      try
        s := ProcessPath( CurrentDir, ASender.UnparsedParams ) ;
        s := TransLatePath( s, TIdFTPServerThread( ASender.Thread ) .HomeDir ) ;
        ASender.Reply.SetReply( 213, CalculateCRC( s ) ) ;
      except
        ASender.Reply.SetReply( 500, 'file error' ) ;
      end;
    end;
  end;
end;

procedure TfmMain.IdFTPServer1Connect(AThread: TIdPeerThread);
begin
//  FTPSockList.AddObject(inttostr(SockNo),AThread);
//  inc(SockNo);
end;

procedure TfmMain.IdFTPServer1DeleteFile(ASender: TIdFTPServerThread;
  const APathname: string);
begin
  DeleteFile( pchar( TransLatePath( ASender.CurrentDir + '/' + APathname, ASender.HomeDir ) ) ) ;
end;

procedure TfmMain.IdFTPServer1DisConnect(AThread: TIdPeerThread);
var
  st : string;
  i : integer;
begin
  AThread.Data := nil;
  AThread.Stop;
  FTPSockList.Clear;
end;

procedure TfmMain.IdFTPServer1GetFileSize(ASender: TIdFTPServerThread;
  const AFilename: string; var VFileSize: Int64);
begin
  VFileSize := GetSizeOfFile( TransLatePath( AFilename, ASender.HomeDir ) ) ;

end;

procedure TfmMain.IdFTPServer1ListDirectory(ASender: TIdFTPServerThread;
  const APath: string; ADirectoryListing: TIdFTPListItems);

  procedure AddlistItem( aDirectoryListing: TIdFTPListItems; Filename: string; ItemType: TIdDirItemType; size: int64; date: tdatetime ) ;
  var
    listitem: TIdFTPListItem;
  begin
    listitem := aDirectoryListing.Add;
    listitem.ItemType := ItemType;
    listitem.FileName := Filename;
    listitem.OwnerName := 'anonymous';
    listitem.GroupName := 'all';
    listitem.OwnerPermissions := '---';
    listitem.GroupPermissions := '---';
    listitem.UserPermissions := '---';
    listitem.Size := size;
    listitem.ModifiedDate := date;
  end;

var
  f: tsearchrec;
  a: integer;
begin
  ADirectoryListing.DirectoryName := apath;

  a := FindFirst( TransLatePath( apath, ASender.HomeDir ) + '*.*', faAnyFile, f ) ;
  while ( a = 0 ) do
  begin
    if ( f.Attr and faDirectory > 0 ) then
      AddlistItem( ADirectoryListing, f.Name, ditDirectory, f.size, FileDateToDateTime( f.Time ) )
    else
      AddlistItem( ADirectoryListing, f.Name, ditFile, f.size, FileDateToDateTime( f.Time ) ) ;
    a := FindNext( f ) ;
  end;

  FindClose( f ) ;
end;

procedure TfmMain.IdFTPServer1MakeDirectory(ASender: TIdFTPServerThread;
  var VDirectory: string);
begin
  MkDir( TransLatePath( VDirectory, ASender.HomeDir ) ) ;

end;

procedure TfmMain.IdFTPServer1RemoveDirectory(ASender: TIdFTPServerThread;
  var VDirectory: string);
begin
  RmDir( TransLatePath( VDirectory, ASender.HomeDir ) ) ;

end;

procedure TfmMain.IdFTPServer1RenameFile(ASender: TIdFTPServerThread;
  const ARenameFromFile, ARenameToFile: string);
begin
  if not MoveFile( pchar( TransLatePath( ARenameFromFile, ASender.HomeDir ) ) , pchar( TransLatePath( ARenameToFile, ASender.HomeDir ) ) ) then
    RaiseLastWin32Error;
end;

procedure TfmMain.IdFTPServer1RetrieveFile(ASender: TIdFTPServerThread;
  const AFilename: string; var VStream: TStream);
begin
  VStream := TFileStream.create( translatepath( AFilename, ASender.HomeDir ) , fmopenread or fmShareDenyWrite ) ;

end;

procedure TfmMain.IdFTPServer1StoreFile(ASender: TIdFTPServerThread;
  const AFilename: string; AAppend: Boolean; var VStream: TStream);
begin
  if FileExists( translatepath( AFilename, ASender.HomeDir ) ) and AAppend then
  begin
    VStream := TFileStream.create( translatepath( AFilename, ASender.HomeDir ) , fmOpenWrite or fmShareExclusive ) ;
    VStream.Seek( 0, soFromEnd ) ;
  end
  else
    VStream := TFileStream.create( translatepath( AFilename, ASender.HomeDir ) , fmCreate or fmShareExclusive ) ;

end;

procedure TfmMain.IdFTPServer1UserLogin(ASender: TIdFTPServerThread;
  const AUsername, APassword: string; var AAuthenticated: Boolean);
begin
  AAuthenticated := ( AUsername = 'zeron' ) and ( APassword = 'zeronpass' ) ;
  if not AAuthenticated then
    exit;

  ASender.HomeDir := ExtractFileDir(Application.ExeName) + '\data';
  asender.currentdir := '/';
end;

function TfmMain.TransLatePath(const APathname, homeDir: string): string;
var
  tmppath: string;
begin
  result := SlashToBackSlash( homeDir ) ;
  tmppath := SlashToBackSlash( APathname ) ;
  if homedir = '/' then
  begin
    result := tmppath;
    exit;
  end;

  if length( APathname ) = 0 then
    exit;
  if result[length( result ) ] = '\' then
    result := copy( result, 1, length( result ) - 1 ) ;
  if tmppath[1] <> '\' then
    result := result + '\';
  result := result + tmppath;
end;

Function TfmMain.CardDataCreate(aNodeNo, aEcuID: string):Boolean;
var
  stSql : string;
//  CardList : TStringList;
  stFileName : string;
  nPositionNum : integer;
  stTemp : string;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stFileName := ExtractFileDir(Application.ExeName) + '\data';
  if not DirectoryExists(stFileName) then
  begin
    if not CreateDir(stFileName)then
    raise Exception.Create('Cannot create '+stFileName);
  end;
  stFileName := stFileName + '\' + FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  if FileExists(stFileName) then
  begin
    if Not DeleteFile(stFileName) then Exit;
  end;

  stSql := 'Update TB_DEVICECARDNO Set DE_RCVACK = ''C'' '; //FTP File Create 상태로 변경
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ' ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND DE_PERMIT = ''L'' ' ;

  DataModule1.ProcessExecSQL(stSql);

//  stSql := stSql + ' Order by b.positionnum ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      while True do
      begin
        if bApplicationTerminate then Exit;
        stSql := ' select ';
        if DBTYPE = 'MSSQL' then stSql := stSql + ' top 200 ';
        stSql := stSql + ' a.CA_CARDNO,a.DE_DOOR1,a.DE_DOOR2,a.DE_USEACCESS,a.DE_USEALARM,a.DE_TIMECODE,a.DE_PERMIT,';
        stSql := stSql + ' b.positionnum,c.EM_retiredate,a.AC_NODENO,a.AC_ECUID,a.GROUP_CODE from TB_DEVICECARDNO a ';
        stSql := stSql + ' Left Join TB_CARD b ';
        stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
        stSql := stSql + ' Left Join TB_EMPLOYEE c ';
        stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
        stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
        stSql := stSql + ' AND b.EM_CODE = c.EM_CODE ) ';
        stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
        stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
        stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
        stSql := stSql + ' AND a.DE_RCVACK = ''C'' ';  //FTP전송
        if DBTYPE = 'PG' then stSql := stSql + ' LIMIT 200 OFFSET 0 ';

        Close;
        Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          Exit;
        End;
        result := True;
        if recordCount < 1 then break;
        //CardList := TStringList.Create;
        //CardList.Clear;
        while Not Eof do
        begin
          if bApplicationTerminate then Exit;
          Try
            nPositionNum := FindField('positionnum').AsInteger;
          Except
            nPositionNum := 0;
          End;
          FileAppend(stFileName,GetCardDownLoadData(FindField('CA_CARDNO').AsString,
                                           FindField('DE_DOOR1').AsString,
                                           FindField('DE_DOOR2').AsString,
                                           FindField('DE_USEACCESS').AsString,
                                           FindField('DE_USEALARM').AsString,
                                           FindField('DE_TIMECODE').AsString,
                                           FindField('EM_retiredate').AsString, //퇴사일자
                                           FindField('DE_PERMIT').AsString,
                                           nPositionNum,UseCardPosition));
          UpdateTB_DEVICECARDNOFtpCreate(FindField('GROUP_CODE').AsString,
                                           FindField('AC_NODENO').AsString,
                                           FindField('AC_ECUID').AsString,
                                           FindField('CA_CARDNO').AsString,
                                           'F');
  {        CardList.Add(GetCardDownLoadData(FindField('CA_CARDNO').AsString,
                                           FindField('DE_DOOR1').AsString,
                                           FindField('DE_DOOR2').AsString,
                                           FindField('DE_USEACCESS').AsString,
                                           FindField('DE_USEALARM').AsString,
                                           FindField('DE_TIMECODE').AsString,
                                           FindField('EM_retiredate').AsString, //퇴사일자
                                           FindField('DE_PERMIT').AsString,
                                           nPositionNum,UseCardPosition));  }
          Application.ProcessMessages;
          Next;
        end;
        //CardList.SaveToFile(stFileName);
        //CardList.Destroy;
      end;
      for i := 0 to 300 do
      begin
        stTemp := '                                                              ';
        FileAppend(stFileName,stTemp);
        //CardList.Add(stTemp);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.GetCardDownLoadData(aCardNo, aDoor1, aDoor2, aUseAccess,
  aUseAlarm,aTimeCode,aValidDate, func: String;aPositionNum:integer = 0;aCardPosition:Boolean = False): string;
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RegType: Char;
  aCardType: Char;
  nCardLength : integer;
  stCardPositionNum : string;
  stRegCode : string;
  stCardAuth : string;

  nCheckSum : integer;
  stCheckSum : string;
  stTemp1,stTemp2 : string;
begin

  if aPositionNum <> 0 then
  begin
    stCardPositionNum := FillZeroNumber(aPositionNum,5);
    if aCardPosition then
    begin
      if func = 'L' then func := 'J'; // 등록인 경우만 J 로 변경 해 줌
    end;
  end else
  begin
    aCardPosition := False; //위치정보가 없는 경우 무조건 일반 포맷으로 전송
    stCardPositionNum := '*****';
  end;

  if CARDLENGTHTYPE = 3 then //3Byte => 8자리 숫자
  begin
    stTemp1 := copy(aCardNo,1,3);
    stTemp1 := Dec2Hex(strtoint(stTemp1),2);
    stTemp2 := copy(aCardNo,4,5);
    stTemp2 := Dec2Hex(strtoint(stTemp2),4);
    aCardNo := stTemp1 + stTemp2;
    aCardNo := inttostr(Hex2Dec64(aCardNo));
    aCardNo := FillZeroStrNum(Trim(aCardNo),10);
    xCardNo:=  '00'+EncodeCardNo(aCardNo)
  end else if HidCardType = 1 then   //Hid CardType
  begin
    aCardNo := inttostr(Hex2Dec64(aCardNo));
    aCardNo := HidReverseCardNo(aCardNo);
    aCardNo := inttostr(Hex2Dec64(aCardNo));
    aCardNo := FillZeroStrNum(Trim(aCardNo),10);
    xCardNo:=  '00'+EncodeCardNo(aCardNo);
  end else if CARDLENGTHTYPE = 0 then //4Byte 고정
  begin
    if IsNumericCardNo then
    begin
      if Not Isdigit(aCardNo) then Exit;
      aCardNo := FillZeroStrNum(Trim(aCardNo),10);
      xCardNo:=  '00'+EncodeCardNo(aCardNo);
    end
    else
    begin
      aCardNo := inttostr(Hex2Dec64(aCardNo));
      aCardNo := FillZeroStrNum(Trim(aCardNo),10);
      xCardNo:=  '00'+EncodeCardNo(aCardNo)
      //xCardNo:= '00' + aCardNo;
      //xCardNo := FillZeroStrNum(Trim(xCardNo),10);
    end;
  end else
  begin
    if CARDLENGTHTYPE = 1 then
    begin
      if IsNumericCardNo then
        xCardNo:=  Dec2Hex64(StrtoInt64(aCardNo),20)
      else xCardNo:= aCardNo;
    end else if CARDLENGTHTYPE = 2 then
    begin
      xCardNo := Ascii2Hex(aCardNo,False,True);
    end;
    nCardLength := Length(xCardNo);
    xCardNo := FillzeroNumber(nCardLength,2) + xCardNo;
  end;

  if Length(Trim(aValidDate)) < 8 then
  begin
    aValidDate := '000000';
  end else
  begin
    aValidDate := copy(aValidDate,3,6);
  end;

  if aDoor1 = 'Y' then
  begin
    if aDoor2 = 'Y' then stRegCode := '0'
    else stRegCode := '1';
  end else
  begin
    if aDoor2 = 'Y' then stRegCode := '2'
    else stRegCode := '3';
  end;

  if aUseAccess = 'Y' then
  begin
    if aUseAlarm = 'Y' then stCardAuth:= '2' //카드타입설정: 2=> 출입 + 방범
    else
    begin
      stCardAuth:= '0'; //카드타입설정: 0=> 출입
      if stRegCode = '3' then func := 'N';  //방범전용 카드인데 방범사용안하면 삭제
    end;
  end else
  begin
    if aUseAlarm = 'Y' then stCardAuth := '1'
    else func := 'N';  //카드 삭제
  end;

  aData:= '';
  aData:= func +
          '0' +
          stRegCode +                  //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          '  ' +                     //RecordCount #$20 #$20
          '0' +                      //예비
          xCardNo +                  //카드번호
          aValidDate +                 //유효기간
          '0' +                      //등록 결과
          stCardAuth +                 //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          aTimeCode;                //타임패턴

    if aCardPosition then
    begin
      if func = 'J' then aData := aData + stCardPositionNum; // 등록인 경우 위치 정보 추가
    end;

  //체크섬
  nCheckSum := 0;
  for i:= 1 to Length(aData) do
  begin
    nCheckSum := nCheckSum + Ord(aData[i]);
  end;
  stCheckSum := Dec2Hex(nCheckSum,2);
  if Length(stCheckSum) < 2 then stCheckSum := '0' + stCheckSum
  else if Length(stCheckSum) > 2 then stCheckSum := copy(stCheckSum,Length(stCheckSum) - 1,2);
  result := aData + ',' + stCheckSum;
  
end;
{
function TfmMain.FTPDownLoad(aNodeNo, aEcuID: string): Boolean;
begin
  result := False;
  if bFTPDownLoad then Exit;
  //향후 여기에서 FTP 기능이 있는지 여부 체크
  if strtoint(aNodeNo) = 0 then Exit; //전체 전송이면 FTP 전송이 안됨 빠져 나간다.

  bFTPDownLoad := True;
  if Not CardDataCreate(aNodeNo,aEcuID) then
  begin
    bFTPDownLoad := False;
    Exit; //파일생성 실패시 빠져나간다.
  end;

  bFTPDownLoad := False;
end;
}
function TfmMain.CheckTB_FTPLIST(aNodeNo, aEcuID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_FTPLIST ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
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

function TfmMain.InsertTB_FTPLISTSendStatus(aNodeNo, aEcuID,aFileName,
  aSendStatus: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_FTPLIST(';
  stSql := stSql + ' GROUP_CODE, ';
  stSql := stSql + ' AC_NODENO, ';
  stSql := stSql + ' AC_ECUID, ';
  stSql := stSql + ' FL_FILENAME,';
  stSql := stSql + ' FL_SENDSTATE) ';
  stSql := stSql + ' Values( ';
  stSql := stsql + '''' + GROUPCODE + ''',';
  stSql := stSql + ''   + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aFileName + ''',';
  stSql := stsql + '''' + aSendStatus + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_FTPLISTSendStatus(aNodeNo, aEcuID,aFileName,
  aSendStatus: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FTPLIST set ';
  stSql := stSql + ' FL_FILENAME = ''' + aFileName + ''',';
  stSql := stSql + ' FL_SENDSTATE = ''' + aSendStatus + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.CheckFTPDownLoadList: Boolean;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  
  stSql := 'Select * from TB_FTPLIST ';
  stsql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stsql := stSql + ' AND FL_SENDSTATE = ''N'' ';
  if ConnectDeviceList.Count > 0 then
  begin
    stSql := stSql + ' AND (';
    for i:=0 to ConnectDeviceList.Count - 1 do
    begin
      if i <> 0 then stSql := stSql + ' OR ';
      stSql := stSql + '(AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
      stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''')';
    end;
    stSql := stSql + ' ) ';
  end else Exit;
  
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := true;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

Function TfmMain.FTPDownLoadStart :Boolean;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'Select * from TB_FTPLIST ';
  stsql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stsql := stSql + ' AND FL_SENDSTATE = ''N'' ';
  if ConnectDeviceList.Count > 0 then
  begin
    stSql := stSql + ' AND (';
    for i:=0 to ConnectDeviceList.Count - 1 do
    begin
      if i <> 0 then stSql := stSql + ' OR ';
      stSql := stSql + '(AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
      stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''')';
    end;
    stSql := stSql + ' ) ';
  end else Exit;
//  stSql := stSql + ' LIMIT 1 OFFSET 0 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        result := DeviceFTPPushStart(FindField('AC_NODENO').Asinteger,FindField('AC_ECUID').AsString,FindField('FL_FILENAME').AsString);
        if result then Exit; //명령 전송했으면 전송 완료까지 대기
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

Function TfmMain.DeviceFTPPushStart(aNodeNo: integer; aEcuID,aFileName: string):Boolean;
var
  stData : string;
  stPath : string;
  clFileInfo : TFileInfo;
  aDevice:    TDevice;
  aEcuInfo:    TEcuInfo;
begin
  result := False;
  if Not CardDataCreate(inttostr(aNodeNo),aEcuID) then Exit;

  stPath := ExtractFileDir(Application.ExeName) + '\data';
  if Not FileExists(stPath + '\' + aFileName) then Exit;
  clFileInfo := TFileInfo.Create(stPath + '\' + aFileName);
  stData := 'fp02';       //CardData(All Clear)
  stData := stData + '1'; //모니터링 유무(1: 모니터링,0:안함)
  stData := stData + '1'; //게이지 데이터 전송 유무

  stData := stData + 'pc' + ' ' + DaemonServerIP;
  stData := stData + ' ' + FTPServerPort;
  stData := stData + ' zeron' ;
  stData := stData + ' zeronpass';
  stData := stData + ' ' + aFileName;
  stData := stData + ' ' + inttostr(clFileInfo.FileSize);
  clFileInfo.Free;

  if UseDeviceServer then
  begin
    aDevice:= GetDevice(FillZeroNumber(aNodeNo,3) + aECUID );
    if aDevice = nil then Exit;
    aDevice.SendPacket('R','fp00'); //ftp stop
    delay(100);
    aDevice.SendPacket('R',stData);
  end else
  begin
    aEcuInfo:= GetEcuInfo(FillZeroNumber(aNodeNo,3) + aECUID );
    if aEcuInfo = nil then Exit;
    aEcuInfo.SendPacket('R','fp00'); //ftp stop
    delay(100);
    aEcuInfo.SendPacket('R',stData);
  end;
  bFtpSendCheck := True;  //전송상태 체크 변수
  result := True;
end;

function TfmMain.FTPCardDataSendSuccess(aNodeNo: integer;
  aEcuID: string): Boolean;
begin
  UpdateTB_FTPLISTSTATE(inttostr(aNodeNo),aEcuID,'Y');
  UpdateTB_DEVICECARDNODeviceRcvAck(inttostr(aNodeNo),aEcuID,'F','Y');
  bFTPSendProcess := False; //전송 완료
end;

function TfmMain.UpdateTB_DEVICECARDNODeviceRcvAck(aNodeNo, aEcuID,
  aOldState, aNewState: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_DEVICECARDNO set DE_RCVACK = ''' + aNewState + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stsql := stSql + ' AND DE_RCVACK = ''' + aOldState + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_FTPLISTSTATE(aNodeNo, aEcuID,
  aState: string): Boolean;
var
  stsql : string;
begin
  stSql := ' Update TB_FTPLIST set FL_SENDSTATE = ''' + aState + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO  = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.UseFTPDevice(aNodeNo, aEcuID: string): Boolean;
begin
  result := True; //우선은 True;
end;

procedure TfmMain.DeviceRcvFTPProcessData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
begin
  //FTP 전송 상태 데이터가 오는 곳...
  bFtpSendCheck := True;
  //FTPSendProcessChckTimer.Enabled := False;
  //FTPSendProcessChckTimer.Enabled := True;
end;

{
//기기가 ClientMode로 동작할때
function TfmMain.LoadDeviceClientNode: Boolean;
var
  aMcuServer   : TMCUNodeInfo;
  NodeNo    : Integer;
  stMcuID  : string;

  stSql : String;
  TempAdoQuery : TADOQuery;
  nIndex : integer;

begin

  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    if DeviceClientNodeList = nil then DeviceClientNodeList := TStringList.Create;
    DeviceClientNodeList.Clear;

    // MCU List 만 추출
    stSql := ' select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND AC_GUBUN = ''0'' ';
    stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';

    //TCommmode 로드
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;


      First;
      while not eof do
      begin
        if bApplicationTerminate then Exit;
        NodeNo:= FindField('AC_NODENO').asInteger;
        stMcuID := FindField('AC_MCUID').AsString;

        aMcuServer   := TMCUNodeInfo.create;
        aMcuServer.No := NodeNo;
        aMcuServer.AThread := nil;
        aMcuServer.SocketConnected := False;
        aMcuServer.MCUID := stMcuID;
        aMcuServer.OnRcvData:=           CommNodeReceve;
        aMcuServer.OnSendData :=         CommNodeSend;
        aMcuServer.OnRcvInvalidDevice:=  CommNodeRcvInvalidDevice;
        aMcuServer.OnConnected :=        NodeConnected;
        if Length(Trim(stMcuID)) = 7 then
        begin
          nIndex := DeviceClientNodeList.IndexOf(stMcuID);
          if nIndex < 0 then DeviceClientNodeList.AddObject(stMcuID,aMcuServer);
        end;

        Next;
      end;
      close;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Result := True;
end;
}
{
function TfmMain.UnLoadDeviceClientNode: Boolean;
var
  i: integer;
begin
  if  DeviceClientNodeList <> nil then
  begin
    //FCSSocket.Enter;
    for i:= 0 to DeviceClientNodeList.Count -1 do
    begin
      if Assigned(DeviceClientNodeList.Objects[i]) then
      begin
        Try
          if TMCUNodeInfo(DeviceClientNodeList.Objects[i]).AThread <> nil then
          begin
            if TMCUNodeInfo(DeviceClientNodeList.Objects[i]).AThread.Connection.Connected then
            begin
              TMCUNodeInfo(DeviceClientNodeList.Objects[i]).AThread.Stop;
              TMCUNodeInfo(DeviceClientNodeList.Objects[i]).AThread := nil;
            end;
          end;
        Except
          DeviceClientNodeList.Clear;
          Exit;
        End;
      end;
    end;
    DeviceClientNodeList.clear;
    //FCSSocket.Leave;
  end;
end;
}
{
function TfmMain.LoadDeviceClientECU: Boolean;
var
  stSql : String;
  NodeNo,OldNodeNo    : Integer;
  aMcuNode   : TMCUNodeInfo;
  aEcu     : TECUInfo;
  stDeviceID : string;
  aDeviceType : CHAR;
  TempAdoQuery : TADOQuery;
  stMCUID : string;
begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    DeviceClientDeviceList.Clear;

    // ECU List 전체 추출
    stSql := ' select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
    stSql := stSql + ' order by AC_NODENO ';

    // 기기
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      OldNodeNo:= 0;
      First;
      while not eof do
      begin
        if bApplicationTerminate then Exit;
        NodeNo:= FindField('AC_NODENO').asInteger;
        stMCUID := FindField('AC_MCUID').AsString;
        // Append Treeview
        if OldNodeNo <> NodeNo then
        begin
          aMcuNode:= FindClientMcuNode(stMCUID);
        end;
        if aMcuNode = nil then
        begin
          Next;
          Continue;
        end;
        stDeviceID:=FillzeroNumber(NodeNo,3) + FindField('AC_ECUID').asString;

        //Create TDevice
        aEcu:= TECUInfo.Create;
        aEcu.NodeNo := NodeNo;
        aEcu.ECUID := FindField('AC_ECUID').asString;
        aEcu.DeviceID:= stDeviceID;
        aEcu.DeviceName := FindField('AC_DEVICENAME').AsString;

        //출입타입
        if FindField('AC_ACTYPE').AsString = '' then aDeviceType := '0'
        else aDeviceType := FindField('AC_ACTYPE').AsString[1];
        if aDeviceType = '1' then aEcu.ACtype := dtAc
        else aEcu.ACtype := dtNothing ;

        //식수타입
        if FindField('AC_FDTYPE').AsString = '' then aDeviceType := '0'
        else aDeviceType := FindField('AC_FDTYPE').AsString[1];
        aEcu.FoodAmtPer := 0;
        if aDeviceType = '1' then
        begin
          aEcu.FDtype := dtFD;
        end
        else aEcu.FDtype := dtNothing ;

        //방범타입
        if FindField('AC_PTTYPE').AsString = '' then aDeviceType := '0'
        else aDeviceType := FindField('AC_PTTYPE').AsString[1];
        if aDeviceType = '1' then aEcu.PTtype := dtPT
        else aEcu.PTtype := dtNothing ;

        //근태타입
        if FindField('AC_ATTYPE').AsString = '' then aDeviceType := '0'
        else aDeviceType := FindField('AC_ATTYPE').AsString[1];

        case aDeviceType of
          '0': aEcu.ATtype:= dtNothing;  // 미사용
          '1': aEcu.ATtype:= dtAt;      // 업데이트 방식
        end;
        if aMcuNode <> nil then
        begin
          aEcu.McuNode            := aMcuNode;

          aEcu.OnRcvAlarmData      := DeviceRcvAlarmData;         //알람 데이터
          aEcu.OnRcvInitAckData    := DeviceRcvInitAckData;       //기기등록
          aEcu.OnRegisterClear     := DeviceRegisterClear;        //메모리지움버튼클릭
          aEcu.OnRcvRemoteAckData  := DeviceRcvRemoteAckData;     //원격제어 응답(알람)
          aEcu.OnRcvFTPProcessData  := DeviceRcvFTPProcessData;     //FTP 전송상태 체크
          aEcu.OnRcvCardReadData   := DeviceRcvCardReadData;      //카드 리딩 데이터
          aEcu.OnRcvChangeDoorData := DeviceRcvChangeDoorData;    //문상태 변경
          aEcu.OnRcvDoorControl    := DeviceRcvDoorControl;       //문제어
          aEcu.OnRcvDoorSetup      := DeviceRcvDoorSetup;         //문설정 응답
          aEcu.OnRcvRegCardData    := DeviceRcvRegCardData;       //카드 등록응답
          aEcu.OnNotDefineData     := DeviceNotDefineData;
          aEcu.OnRcvRegSchedule    := DeviceRcvScheduleData;       //스케줄 데이터 등록 응답
          aEcu.OnErrorData         := DeviceErorData;
          aEcu.OnConnected         := DeviceConnected;
          aEcu.OnDoorManageModeChange := DoorMangageModeChange;  //출입문 운영모드 변경
          aEcu.OnDoorPNModeChange := DoorPNModeChange;  //출입문 운영모드 변경
          aEcu.OnDoorStateChange   := DoorStateChanged;  //출입문 상태 변경
          aEcu.OnWatchModeChange   := DeviceWatchModeChange; //경계상태 변경
          aEcu.OnDoorModeChange    := DoorModeChanged; //출입문 상태변경

          if stDeviceID <> '' then
            DeviceClientDeviceList.AddObject( stDeviceID,aEcu);
        end;

        next;
      end;
      close;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;
}
function TfmMain.FindClientMcuNode(aMcuID: string): TMCUNodeInfo;
var
  NodeIndex: Integer;
begin
  Result:= nil;
  NodeIndex:= DeviceClientNodeList.IndexOf(aMcuID);
  if NodeIndex > -1 then
    Result:= TMCUNodeInfo(DeviceClientNodeList.Objects[NodeIndex]);

end;

procedure TfmMain.do_DeviceServerProcessPacket(AThread: TIdPeerThread;
  aPacket: string);
begin

end;

procedure TfmMain.DeviceServer1Execute(AThread: TIdPeerThread);
var
  stTemp : string;
  DeviceSocket : TDeviceSocketInfo;
  nIndex : integer;
begin
  if bApplicationTerminate then Exit;
  if L_bDaemonStop then
  begin
    if AThread.Connection.Connected then AThread.Stop;
    Exit;
  end;
  Try
    DeviceSocket := Pointer(AThread.Data);
    if DeviceSocket = nil then Exit;
    //FCSSocket.Enter; //이부분을 넣으니 쓰레드 처리하는데 문제가 생김
    if Not L_bDaemonStop then
      stTemp:= AThread.Connection.CurrentReadBuffer;
    nIndex := DeviceConnectList.IndexOf(DeviceSocket);
    if nIndex > -1 then
    begin
      if Not L_bDaemonStop then
      begin
        //TDeviceSocketInfo(DeviceConnectList.Items[nIndex]).AliveTime := Now;
        TDeviceSocketInfo(DeviceConnectList.Items[nIndex]).PushData(stTemp);
      end;
    end else
    begin
      if AThread.Connection.Connected then AThread.Stop;
    end;
    //FCSSocket.Leave;

  Except
    //로그정리
    if AThread.Connection.Connected then AThread.Stop;
  End;

end;



procedure TfmMain.DeviceServer1Disconnect(AThread: TIdPeerThread);
var
  DeviceSocket : TDeviceSocketInfo;
  nIndex : integer;
begin
  Try
    DeviceSocket := Pointer(AThread.Data);
    if DeviceSocket = nil then Exit;
    AThread.Data := nil;
    FCSSocket.Enter;
    nIndex := DeviceConnectList.IndexOf(DeviceSocket);
    if nIndex > -1 then
    begin
      TDeviceSocketInfo(DeviceConnectList.Items[nIndex]).Connected := False;
      TDeviceSocketInfo(DeviceConnectList.Items[nIndex]).AThread := nil;
      DeviceConnectList.Delete(nIndex);
    end;
    FCSSocket.Leave;
  Finally
    DeviceSocket.Free;
  End;

end;

procedure TfmMain.DeviceServer1Connect(AThread: TIdPeerThread);
var
  DeviceSocket : TDeviceSocketInfo;
  nIndex : integer;
begin
  if bApplicationTerminate then Exit;
  if L_bDaemonStop then
  begin
    AThread.Stop;
    Exit;
  end;
  DeviceSocket := TDeviceSocketInfo.Create;
  DeviceSocket.ClientIP := AThread.Connection.Socket.Binding.PeerIP;
  DeviceSocket.ClientPort := AThread.Connection.Socket.Binding.PeerPort;
  DeviceSocket.AThread := AThread;
  nIndex := DeviceConnectList.IndexOf(DeviceSocket);
  if nIndex < 0 then
  begin
    DeviceConnectList.Add(DeviceSocket);
  end else
  begin
    DeviceConnectList.Delete(nIndex);
    DeviceConnectList.Add(DeviceSocket);
  end;
  AThread.Data := DeviceSocket;

end;

procedure TfmMain.DeviceServer1Exception(AThread: TIdPeerThread;
  AException: Exception);
var
  DeviceSocket : TDeviceSocketInfo;
  nIndex : integer;
begin
  Try
    DeviceSocket := Pointer(AThread.Data);
    if DeviceSocket = nil then Exit;
    AThread.Data := nil;
    //FCSSocket.Enter;
    nIndex := DeviceConnectList.IndexOf(DeviceSocket);
    if nIndex > -1 then
    begin
      TDeviceSocketInfo(DeviceConnectList.Items[nIndex]).Connected := False;
      TDeviceSocketInfo(DeviceConnectList.Items[nIndex]).AThread := nil;
      DeviceConnectList.Delete(nIndex);
    end;
    //FCSSocket.Leave;
  Finally
    DeviceSocket.Free;
  End;

end;

procedure TfmMain.DeviceServerSendTimerTimer(Sender: TObject);
var
  I: Integer;
  emptyData: Integer;
  bWait:Boolean;
begin
  emptyData:= 0;
  if bApplicationTerminate then Exit;
  //StatusBar1.Panels[2].Text := 'DeviceServerSendTimer';
  Application.ProcessMessages;
  DeviceServerSendTimer.Enabled := False;

  for I:= 0 to DeviceClientNodeList.Count -1 do
  begin
    if bApplicationTerminate then Exit;
    if bStop then Exit;
    if (TMCUNodeInfo(DeviceClientNodeList.Objects[I]).QuickSendDataList.Count > 0)
       or (TMCUNodeInfo(DeviceClientNodeList.Objects[I]).ReserveSendDataList.Count > 0)
       or (TMCUNodeInfo(DeviceClientNodeList.Objects[I]).CardSendDataList.Count > 0) then
    begin
        RecvTimeCheck.Enabled := True;  //송신할게 있는거다.
        Try
          if TMCUNodeInfo(DeviceClientNodeList.Objects[I]).SocketConnected then TMCUNodeInfo(DeviceClientNodeList.Objects[I]).ExecSendPacket;
//          if TMCUNodeInfo(DeviceClientNodeList.Objects[I]).ReserveSendDataList.Count = 0 then Inc(emptyData);
        Except
          //무시
        End;
    end;
  end;
  DeviceServerSendTimer.Enabled := True;
  StatusBar1.Panels[1].Text := inttostr(L_nCardAckCount) + '/' + inttostr(L_nCardSendCount);

end;

function TfmMain.GetEcuInfo(aDeviceNO: String): TECUInfo;
var
  DeviceIndex: Integer;
begin
  DeviceIndex:= DeviceClientDeviceList.Indexof(aDeviceNO);
  if DeviceIndex > -1 then Result:= TECUInfo(DeviceClientDeviceList.Objects[DeviceIndex])
  else Result:= nil;

end;

procedure TfmMain.DeviceClientConnectCheckTimerTimer(Sender: TObject);
var
  I: Integer;
  aPollingTime: TDatetime;
  aTimeOut: TDatetime;
  Present : TDatetime;
begin
  if bApplicationTerminate then Exit;
  if UseDeviceServer then Exit; //기기 서버모드로 동작할때는 이쪽을 타면 안됨
  //StatusBar1.Panels[2].Text := 'DeviceClientConnectCheckTimer';
  Application.ProcessMessages;

  for I:= 0 to DeviceClientNodeList.Count -1 do
  begin
    if bApplicationTerminate then Exit; //폼 종료시에는 작업하지 말자....
    if bStop then Exit;
    if Assigned(DeviceClientNodeList.Objects[i]) then
    begin
      Try
        aPollingTime:= TMCUNodeInfo(DeviceClientNodeList.Objects[i]).AliveTime;
        aTimeOut:= IncTime(aPollingTime,0,0,15,0);
        if Now > aTimeout then
        begin
          if TMCUNodeInfo(DeviceClientNodeList.Objects[i]).SocketConnected then
          begin
            TMCUNodeInfo(DeviceClientNodeList.Objects[i]).SocketConnected := False;
            if TMCUNodeInfo(DeviceClientNodeList.Objects[i]).AThread <> nil then
            begin
              if TMCUNodeInfo(DeviceClientNodeList.Objects[i]).AThread.Connection.Connected then
                 TMCUNodeInfo(DeviceClientNodeList.Objects[i]).AThread.Stop;
            end;
            //TMCUNodeInfo(DeviceClientNodeList.Objects[i]).AThread := nil;
          end;
        end;
      Except
        //무시
      End;
    end;
  end;
end;

procedure TfmMain.FTP1Click(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stNodeNo,stEcuID:string;
begin
  stSql := 'Select * from TB_ACCESSDEVICE ';

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

      While Not Eof do
      begin
        stNodeNo := inttostr(FindField('AC_NODENO').AsInteger);
        stEcuID  := FindField('AC_ECUID').AsString;
        //여기에서 FTP 다운로드 가능 기기인지 체크 하여
        if UseFTPDevice(stNodeNo,stEcuID) then
        begin
          if CheckTB_FTPLIST(stNodeNo,stEcuID) then
          begin
            UpdateTB_FTPLISTSendStatus(stNodeNo,stEcuID,FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + stEcuID,'N');
          end else
          begin
            InsertTB_FTPLISTSendStatus(stNodeNo,stEcuID,FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + stEcuID,'N');
          end;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.UpdateTB_DEVICECARDNOCardNoState(aNodeNo, aEcuID, aCardNo,
  NewState: String): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_DEVICECARDNO set DE_RCVACK = ''' + NewState + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stsql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  if NewState = 'S' then
    stSql := stSql + ' AND DE_RCVACK = ''R'' '; //전송준비중인 데이터만 송신하자.

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.N35Click(Sender: TObject);
begin
  fmReaderSetting:= TfmReaderSetting.Create(Self);
  L_bReaderSettingShow := True;
  fmReaderSetting.Showmodal;
  L_bReaderSettingShow := False;
  fmReaderSetting.Free;

end;

function TfmMain.PubCardTypeSearch(aNodeNo, aEcuID: string): Boolean;
var
  stDeviceID : string;
  aDevice: TDevice;
  aEcuInfo : TEcuInfo;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  if UseDeviceServer then
  begin
    aDevice:= GetDevice(stDeviceID);
    if aDevice = nil then Exit;
    aDevice.CardTypeSearch;
  end else
  begin
    aEcuInfo:= GetEcuInfo(stDeviceID);
    if aEcuInfo = nil then Exit;
    aEcuInfo.CardTypeSearch;
  end;
  result := True;
end;

function TfmMain.GetMultiDaemonConfig(var aDaemonServerIP,
  aDaemonServerPort, aAttendServerPort, aFoodServerPort,
  aFTPServerPort: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_DAEMONMULTI ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND DM_GUBUN = ' + inttostr(G_nDaemonGubun) + ' ';
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
      if recordCount < 1 then Exit;
      aDaemonServerIP := FindField('DM_SERVERIP').AsString;
      aDaemonServerPort := FindField('DM_SERVERPORT').AsString;
      aAttendServerPort := FindField('DM_ATPORT').AsString;
      aFoodServerPort := FindField('DM_FDPORT').AsString;
      aFTPServerPort := FindField('DM_FTPPORT').AsString;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.AdoConnectCheckTimerTimer(Sender: TObject);
begin
  //StatusBar1.Panels[2].Text := 'AdoConnectCheckTimer';
  AdoConnectCheckTimer.Enabled := False;
  if Not TDataBaseConfig.GetObject.DBConnected then Exit;
  //Application.ProcessMessages;
  //if AdoConnectCheck then Exit;

  TDataBaseConfig.GetObject.DBConnected := False;
  Action_DaemonRestartExecute(self);
  //AdoConnectCheckTimer.Enabled := True;
end;

function TfmMain.AdoConnectCheck: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

  stSql := ' select * from tb_currentdaemon ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnectionEVENT;
    TempAdoQuery.DisableControls;
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
      if recordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.DeviceRcvTellogData(Sender: TObject; ReceiveData: string;
  NodeNO: integer);
begin
  Try
  Finally
    if useProcessCount then
    begin
      FCS.Enter;
      G_nProcessCount := G_nProcessCount - 1;
      FCS.Leave;
      StatusBar1.Panels[2].Text := inttostr(G_nProcessCount);
    end;
  End;
end;

procedure TfmMain.DaemonRestartTimerTimer(Sender: TObject);
begin
  DaemonRestartTimer.Enabled := False;
  Action_DaemonRestartExecute(self);

end;

procedure TfmMain.FireDoorOpenTimerTimer(Sender: TObject);
var
  stDeviceID : string;
  i : integer;
begin
  FireDoorOpenTimer.Enabled := False;
  StatusBar1.Panels[2].Text := 'FireDoorOpenTimer';

  if UseDeviceServer then
  begin
    for i:= 0 to DeviceList.Count - 1 do
    begin
      if TDevice(DeviceList.Objects[I]) = nil then continue;
      if TDevice(DeviceList.Objects[I]).ECUID <> '00' then continue;  //메인컨트롤만 전송
      TDevice(DeviceList.Objects[I]).FireOutbreak(True);
    end;
  end else
  begin
    for i:= 0 to DeviceList.Count - 1 do
    begin
      if TEcuInfo(DeviceList.Objects[I]) = nil then continue;
      if TEcuInfo(DeviceList.Objects[I]).ECUID <> '00' then continue;
      TEcuInfo(DeviceList.Objects[I]).FireOutbreak(True);
    end;
  end;


{  FireDoorOpenTimer.Enabled := False;
  if FireDoorOpenList.Count = 0 then Exit;
  //StatusBar1.Panels[2].Text := 'FireDoorOpenTimer';
  stDeviceID := FireDoorOpenList.Strings[0];
  FireDoorOpenList.Delete(0);
  DoorModeChange(stDeviceID,'1');
  FireDoorOpenTimer.Enabled := True;
}
end;

procedure TfmMain.EST1Click(Sender: TObject);
begin
  L_bFierDoorOpen := True;
  DoorAllOpenMode;

end;

procedure TfmMain.DoorAllOpenTimerTimer(Sender: TObject);
begin
  DoorAllOpenTimer.Enabled := False;
  if Not L_bFierDoorOpen then
  begin
    L_bFierDoorOpen := True;
    DoorAllOpenMode;
  end;
end;

procedure TfmMain.DataModuleAdoConnected(Sender: TObject;
  DBConnected: Boolean);
begin
  if Not DBConnected then
  begin
    LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log','DisConnected' );
    AdoConnectCheckTimer.Enabled := True;
  end;
end;

procedure TfmMain.DeviceFireRecovery(aDeviceID: string);
var
  NodeStr : string;
  NodeIndex : integer;
begin
  if Not IsDigit(aDeviceID) then Exit;
  L_bFierDoorOpen := False;
  
  NodeStr:= 'NODE'+InttoStr(strtoint(aDeviceID));
  NodeIndex:= ComNodeList.IndexOf(NodeStr);
  if NodeIndex < 0 then Exit;
  if UseDeviceServer then
  begin
    TCommnode(ComNodeList.Objects[NodeIndex]).FireRecovery;
  end else
  begin
    TMCUNodeInfo(DeviceClientNodeList.Objects[NodeIndex]).FireRecovery;
  end;
  UpdateTB_CURRENTDAEMON('FIREORIGIN','FALSE');

end;

function TfmMain.UpdateTB_DEVICECARDNOFtpCreate(aGROUP_CODE, aAC_NODENO,
  aAC_ECUID, aCA_CARDNO, aRcv_State: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO Set DE_RCVACK = ''' + aRcv_State + ''' '; //FTP File Create Complete상태로 변경
  stSql := stSql + ' WHERE GROUP_CODE = ''' + aGROUP_CODE + ''' ' ;
  stSql := stSql + ' AND AC_NODENO = ' + aAC_NODENO ;
  stSql := stSql + ' AND AC_ECUID = ''' + aAC_ECUID + ''' ' ;
  stSql := stSql + ' AND CA_CARDNO = ''' + aCA_CARDNO + ''' '  ;

  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMain.HolidaySendTimerTimer(Sender: TObject);
var
  stNowYear : string;
begin
  stNowYear := formatDateTime('yyyy',now);
  if (L_stSendHolidayYear <> stNowYear) then
  begin
    UpdateTB_ACCESSDEVICEHoSend('','','N');
    L_stSendHolidayYear := stNowYear;
  end;
  if Not CheckHolidayDevice then Exit;
  DeviceHoliday(stNowYear);
  UpdateTB_CURRENTDAEMON('SEND_HOYY',stNowYear);
end;

function TfmMain.CheckHolidayDevice: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  i :integer;
begin
  result := False;
  HolidaySendDeviceList.Clear;

  stSql := ' Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND HO_SEND = ''N'' ';
  if ConnectDeviceList.Count > 0 then
  begin
    stSql := stSql + ' and ( ';
    for i := 0 to ConnectDeviceList.Count - 1 do
    begin
      if bApplicationTerminate then Exit;
      if i <> 0 then stSql := stSql + ' OR ';
      stSql := stSql + '( AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
      stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''' ) ';
    end;
    stSql := stSql + ' ) ';
  end else
  begin
    Exit;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;
      result := True;
      while Not Eof do
      begin
        HolidaySendDeviceList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString);
        Next;
      end;
    End;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.UpdateTB_ACCESSDEVICEHoSend(aNodeNo,aECUID,aHoSend: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE set HO_SEND = ''' + aHoSend + ''' ';
  if isDigit(aNodeNo) then
  begin
    if strtoint(aNodeNo) <> 0 then
    begin
      stSql := stSql + ' Where AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
      stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
    end;
  end;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.GetSendHolidayYear: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '';
  stSql := 'Select * from TB_CURRENTDAEMON ';
  stSql := stSql + ' where CU_STATECODE = ''SEND_HOYY'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;
      result := FindField('CU_STATEVALUE').AsString;
    End;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.mn_DBAllBackupClick(Sender: TObject);
var
  filename : string;
begin
{  SaveDialog1.DefaultExt:= 'BAK';
  SaveDialog1.Filter := 'Backup files (*.BAK)|*.BAK';
  if SaveDialog1.Execute then
  begin
   filename := SaveDialog1.FileName;
   if DataBaseAllBackup(filename) then showmessage('데이터 백업 완료')
   else showmessage('데이터 백업 실패');
  end;
}

end;



function TfmMain.GetPostGresqlBin: string;
var
  regKey : TRegistry;
  stKey : string;
begin
  result := '';
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_LOCAL_MACHINE;
    if (not regKey.KeyExists('\Software\PostgreSQL\Installations\postgresql-8.3')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
    regKey.OpenKey ('\Software\PostgreSQL\Installations\postgresql-8.3',False);
    stKey := regKey.ReadString('Base Directory');
    if stKey = '' then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY 해제
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY 해제
     regKey.Free;
  result := stKey + '\Bin';

end;

function TfmMain.MDBAllDataBackup(aBackupDir: string): Boolean;
var
  ini_fun : TiniFile;
  stExeFolder : String;
  stDBDir : string;
begin
  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Zmos.INI');
  stDBDir := ini_fun.ReadString('DBConfig','DBPATH',stExeFolder + '/../DB');
  ini_fun.Free;

  if FileExists(stDBDir + '/ZMOS.mdb') then
    CopyFile(pchar(stDBDir + '/ZMOS.mdb'),pchar(aBackupDir + '/ZMOS.mdb'),True);
  if FileExists(stDBDir + '/ZEVENT.mdb') then
    CopyFile(pchar(stDBDir + '/ZEVENT.mdb'),pchar(aBackupDir + '/ZEVENT.mdb'),True );
  if FileExists(stDBDir + '/ZLOG.mdb') then
    CopyFile(pchar(stDBDir + '/ZLOG.mdb'),pchar(aBackupDir + '/ZLOG.mdb'),True );

end;

function TfmMain.MSSQLAllDataBackup(aBackupDir: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' SELECT name as tablename FROM sysobjects WHERE xtype = ''U'' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      While Not Eof do
      begin
        TableFileBackup(aBackupDir,UpperCase(FindField('tablename').AsString));
        Delay(1000);
        if bApplicationTerminate then Exit;
        Next;
      end;
    end;
  Finally
    bCardDownLoad := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;


function TfmMain.PGAllDataBackup(aBackupDir: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' SELECT relname AS tablename ';
  stSql := stSql + ' FROM pg_class WHERE relkind IN (''r'') ';
  stSql := stSql + ' AND relname NOT LIKE ''pg_%'' AND relname NOT LIKE ''sql_%'' ORDER BY tablename ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      While Not Eof do
      begin
        TableFileBackup(aBackupDir,UpperCase(FindField('tablename').AsString));
        Delay(1000);
        if bApplicationTerminate then Exit;
        Next;
      end;
    end;
  Finally
    bCardDownLoad := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;


{
function TfmMain.UnLoadDeviceClientECU: Boolean;
var
  i: integer;
begin
  if  DeviceClientDeviceList <> nil then
  begin
//    for i:= 0 to DeviceList.Count -1 do
//    begin
//      if Assigned(DeviceList.Objects[i]) then
//      begin
//        TDevice(DeviceList.Objects[i]).Free;
//      end;
//
//    end;
//    DeviceClientDeviceList.clear;
  end;

end;
}
procedure TfmMain.DeviceServer1Stop;
var
  List: TList;
  I: Integer;
begin
  List := DeviceServer1.Threads.LockList;

  try
    for I := 0 to List.Count - 1 do
      TIdPeerThread(List.Items[i]).Connection.Disconnect;
  finally
    DeviceServer1.Threads.UnlockList;
  end;

  Application.ProcessMessages;
  Delay(DeviceServer1.TerminateWaitTime);
  DeviceServer1.Active := False;

end;

procedure TfmMain.DeviceServer2Stop;
var
  List: TList;
  I: Integer;
begin
  List := DeviceServer2.Threads.LockList;

  try
    for I := 0 to List.Count - 1 do
      TIdPeerThread(List.Items[i]).Connection.Disconnect;
  finally
    DeviceServer2.Threads.UnlockList;
  end;

  Application.ProcessMessages;
  Sleep(DeviceServer2.TerminateWaitTime);
  DeviceServer2.Active := False;
end;

procedure TfmMain.DeviceServer3Stop;
var
  List: TList;
  I: Integer;
begin
  List := DeviceServer3.Threads.LockList;

  try
    for I := 0 to List.Count - 1 do
      TIdPeerThread(List.Items[i]).Connection.Disconnect;
  finally
    DeviceServer3.Threads.UnlockList;
  end;

  Application.ProcessMessages;
  Sleep(DeviceServer3.TerminateWaitTime);
  DeviceServer1.Active := False;
end;

function TfmMain.DeviceClientNodeAddItem(aMcuID: string): Boolean;
var
  aMcuServer   : TMCUNodeInfo;
  stSql : String;
  TempAdoQuery : TADOQuery;
  nAcNodeNo : integer;
  nIndex : integer;
begin
  Result := False;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    // MCU 추출
    stSql := ' select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND AC_GUBUN = ''0'' ';
    stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
    stSql := stSql + ' AND AC_MCUID = ''' + aMcuID + ''' ';

    //TCommmode 로드
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      if recordCount < 1 then Exit;
      First;
      nAcNodeNo:= FindField('AC_NODENO').asInteger;

      aMcuServer   := TMCUNodeInfo.create;
      aMcuServer.No := nAcNodeNo;
      aMcuServer.AThread := nil;
      aMcuServer.SocketConnected := False;
      aMcuServer.MCUID := aMcuID;
      aMcuServer.OnRcvData:=           CommNodeReceve;
      aMcuServer.OnSendData :=         CommNodeSend;
      aMcuServer.OnRcvInvalidDevice:=  CommNodeRcvInvalidDevice;
      aMcuServer.OnConnected :=        NodeConnected;
      if Length(Trim(aMcuID)) = 7 then
      begin
        nIndex := DeviceClientNodeList.IndexOf(aMcuID);
        if nIndex < 0 then DeviceClientNodeList.AddObject(aMcuID,aMcuServer);
      end else
      begin
        aMcuServer.Free;
        Exit
      end;
      Result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.DeviceClientECUAddItem(aNodeNo: integer;
  aEcuID: string): Boolean;
var
  stSql : String;
  nAcNodeNo : integer;
  stMCUID : string;
  aMcuNode   : TMCUNodeInfo;
  aEcu     : TECUInfo;
  stDeviceID : string;
  TempAdoQuery : TAdoQuery;
  aDeviceType : CHAR;
begin
  Result := False;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    // ECU List 전체 추출
    stSql := ' select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

    // 기기
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      if recordcount < 1 then exit;

      First;
      nAcNodeNo:= FindField('AC_NODENO').asInteger;
      stMCUID := FindField('AC_MCUID').AsString;
      aMcuNode:= FindClientMcuNode(stMCUID);
      if aMcuNode = nil then Exit;

      stDeviceID:=FillzeroNumber(nAcNodeNo,3) + FindField('AC_ECUID').asString;

      //Create TDevice
      aEcu:= TECUInfo.Create;
      aEcu.NodeNo := nAcNodeNo;
      aEcu.ECUID := FindField('AC_ECUID').asString;
      aEcu.DeviceID:= stDeviceID;
      aEcu.DeviceName := FindField('AC_DEVICENAME').AsString;

      //출입타입
      if FindField('AC_ACTYPE').AsString = '' then aDeviceType := '0'
      else aDeviceType := FindField('AC_ACTYPE').AsString[1];
      if aDeviceType = '1' then aEcu.ACtype := dtAc
      else aEcu.ACtype := dtNothing ;

      //식수타입
      if FindField('AC_FDTYPE').AsString = '' then aDeviceType := '0'
      else aDeviceType := FindField('AC_FDTYPE').AsString[1];
      aEcu.FoodAmtPer := 0;
      if aDeviceType = '1' then
      begin
        aEcu.FDtype := dtFD;
      end
      else aEcu.FDtype := dtNothing ;

      //방범타입
      if FindField('AC_PTTYPE').AsString = '' then aDeviceType := '0'
      else aDeviceType := FindField('AC_PTTYPE').AsString[1];
      if aDeviceType = '1' then aEcu.PTtype := dtPT
      else aEcu.PTtype := dtNothing ;

      //근태타입
      if FindField('AC_ATTYPE').AsString = '' then aDeviceType := '0'
      else aDeviceType := FindField('AC_ATTYPE').AsString[1];

      case aDeviceType of
        '0': aEcu.ATtype:= dtNothing;  // 미사용
        '1': aEcu.ATtype:= dtAt;      // 업데이트 방식
      end;
      if aMcuNode <> nil then
      begin
        aEcu.McuNode            := aMcuNode;

        aEcu.OnRcvAlarmData      := DeviceRcvAlarmData;         //알람 데이터
        aEcu.OnRcvInitAckData    := DeviceRcvInitAckData;       //기기등록
        aEcu.OnRegisterClear     := DeviceRegisterClear;        //메모리지움버튼클릭
        aEcu.OnRcvRemoteAckData  := DeviceRcvRemoteAckData;     //원격제어 응답(알람)
        aEcu.OnRcvFTPProcessData  := DeviceRcvFTPProcessData;     //FTP 전송상태 체크
        aEcu.OnRcvCardReadData   := DeviceRcvCardReadData;      //카드 리딩 데이터
        aEcu.OnRcvChangeDoorData := DeviceRcvChangeDoorData;    //문상태 변경
        aEcu.OnRcvDoorControl    := DeviceRcvDoorControl;       //문제어
        aEcu.OnRcvDoorSetup      := DeviceRcvDoorSetup;         //문설정 응답
        aEcu.OnRcvRegCardData    := DeviceRcvRegCardData;       //카드 등록응답
        aEcu.OnNotDefineData     := DeviceNotDefineData;
        aEcu.OnRcvRegSchedule    := DeviceRcvScheduleData;       //스케줄 데이터 등록 응답
        aEcu.OnErrorData         := DeviceErorData;
        aEcu.OnConnected         := DeviceConnected;
        aEcu.OnDoorManageModeChange := DoorMangageModeChange;  //출입문 운영모드 변경
        aEcu.OnDoorPNModeChange := DoorPNModeChange;  //출입문 운영모드 변경
        aEcu.OnDoorStateChange   := DoorStateChanged;  //출입문 상태 변경
        aEcu.OnWatchModeChange   := DeviceWatchModeChange; //경계상태 변경
        aEcu.OnDoorModeChange    := DoorModeChanged; //출입문 상태변경

        if stDeviceID <> '' then
          DeviceClientDeviceList.AddObject( stDeviceID,aEcu);
      end;

    end;
    result := True;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.CheckDEVICEALARMSTATE(aDeviceID: string);
var
  stNodeNo,stECUID : string;
  i : integer;
  aDevice: TDevice;
  aEcuInfo: TEcuInfo;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);

  if UseDeviceServer then
  begin
    if (stNodeNo = '') or (stNodeNo = '000') then //전체상태조회
    begin
      for i := 0 to DeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        aDevice:= GetDevice(DeviceList.Strings[i] );
        if aDevice <> nil then
        begin
          //if aDevice.CommNode.SocketConnected = True then aDevice.CheckWatchMode;
          DeviceWatchModeChange(self,
                                aDevice.NodeNo,
                                aDevice.ECUID,
                                aDevice.WatchMode);
        end else
        begin
          Continue;
        end;
      end;
      Exit;
    end;

    aDevice:= GetDevice(stNodeNo + stECUID );
    if aDevice <> nil then
    begin
      //if aDevice.CommNode.SocketConnected = True then aDevice.CheckWatchMode;
      DeviceWatchModeChange(self,
                            aDevice.NodeNo,
                            aDevice.ECUID,
                            aDevice.WatchMode);
    end;
  end else
  begin
    if (stNodeNo = '') or (stNodeNo = '000') then //전체상태조회
    begin
      for i := 0 to DeviceClientDeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        aEcuInfo:= GetEcuInfo(DeviceClientDeviceList.Strings[i] );
        if aEcuInfo <> nil then
        begin
          //if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckWatchMode;
          DeviceWatchModeChange(self,
                                aEcuInfo.NodeNo,
                                aEcuInfo.ECUID,
                                aEcuInfo.WatchMode);
        end else
        begin
          Continue;
        end;
      end;
      Exit;
    end;

    aEcuInfo:= GetEcuInfo(stNodeNo + '00');//stECUID ); //메인 컨트롤에서만 인식함
    if aEcuInfo <> nil then
    begin
      //if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckWatchMode;
      DeviceWatchModeChange(self,
                            aEcuInfo.NodeNo,
                            aEcuInfo.ECUID,
                            aEcuInfo.WatchMode);
    end;

  end;
end;

function TfmMain.MCUBroadDataSend(aTargetID, aCmd, aSendData: string;
  aQuick: Boolean): Boolean;
var
  i : integer;
  stSendData : string;
begin

  if ComNodeList.Count < 1 then Exit;
  
  stSendData := 'SM26' +
                aTargetID + //aTargetID : 99 - All
                aCmd +
                aSendData;

  if UseDeviceServer then
  begin
    for i := 0 to ComNodeList.Count - 1 do
    begin
      if TCommNode(ComNodeList.Objects[i]).SocketConnected then
        TCommNode(ComNodeList.Objects[i]).SendPacket('00','R',stSendData,aQuick);
      Application.ProcessMessages;
    end;
  end else
  begin
    for i := 0 to DeviceClientNodeList.Count - 1 do
    begin
      if TMCUNodeInfo(DeviceClientNodeList.Objects[i]).SocketConnected then
        TMCUNodeInfo(DeviceClientNodeList.Objects[i]).SendPacket('00','R',stSendData,aQuick);
      Application.ProcessMessages;
    end;
  end;

end;

procedure TfmMain.CommandArrayCommandsTMONITORExecute(Command: TCommand;
  Params: TStringList);
var
  stMonitor : string;
begin
  stMonitor := Params.Values['VALUE'];

  if stMonitor = 'TRUE' then Monitoring := True
  else Monitoring := False;
//Monitor 열림/닫힘

end;

procedure TfmMain.mn_loginClick(Sender: TObject);
begin
  TLogin.GetObject.ShowLoginDlg;
  Logined := TLogin.GetObject.Logined;
end;

procedure TfmMain.mn_LogoutClick(Sender: TObject);
begin
  Logined := False;
end;

procedure TfmMain.Action_MonitoringExecute(Sender: TObject);
begin
  MDIChildShow('TfmMonitoring');
end;

procedure TfmMain.mn_AllDoorCloseClick(Sender: TObject);
begin
  if L_bLogined then
  begin
    TLogin.GetObject.ShowLoginDlg;
    Logined := TLogin.GetObject.Logined;

    if Not Logined then Exit;
  end;
  DoorModeChange('000','0');
end;

procedure TfmMain.mn_AllDoorOpenClick(Sender: TObject);
begin
  if L_bLogined then
  begin
    TLogin.GetObject.ShowLoginDlg;
    Logined := TLogin.GetObject.Logined;

    if Not Logined then Exit;
  end;
  DoorModeChange('000','1');
end;

procedure TfmMain.btn_TimeAsyncClick(Sender: TObject);
begin
  DeviceTimeSync('');

end;

procedure TfmMain.btn_stateClick(Sender: TObject);
begin
  CheckDOORSTATE('');

end;

procedure TfmMain.SCSConfigSet;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  G_nSCSRelayServer := 0;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''SCS'' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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

      First;
      While Not Eof do
      begin
        if bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'RY_SERVER' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then  G_nSCSRelayServer := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  if G_nSCSRelayServer = 0 then
  begin
    stSql := 'Update TB_CONFIG ';
    stSql := stSql + ' Set CO_CONFIGVALUE = ''1'' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_CONFIGGROUP = ''COMMON'' ';
    stSql := stSql + ' AND CO_CONFIGCODE = ''CARDNOTYPE'' ';

    DataModule1.ProcessExecSQL(stSql);

    stSql := 'Update TB_CONFIG ';
    stSql := stSql + ' Set CO_CONFIGVALUE = ''1'' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_CONFIGGROUP = ''COMMON'' ';
    stSql := stSql + ' AND CO_CONFIGCODE = ''CARDNUM'' ';

    DataModule1.ProcessExecSQL(stSql);
  end;
  
end;

function TfmMain.GetSCSAuthentication(aTime,aNodeNo, aECUID, aDoorNo,
  aCardNo: string;var aEmCode,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,
  aEmName,aCompanyName,aJijumName,aDepartName,aPosiName:string): integer;
var
  stSeq : string;
  stKTBizMekaDoorNo : string;
  stResult : string;
begin
  if G_nSCSRelayServer = 0 then  //KyungheeServer
  begin
    aEmCode := GetEmpNoFromCardNo(aCardNO,stSeq);
    result := LocalServerCheckKHUEmployee(aEmCode,stSeq,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,
              aEmName,aCompanyName,aJijumName,aDepartName,aPosiName);

    if (result = NOTRESULTED) or
       (result = NOTSERVERCONNECTED) then
    begin
      if Not KyungHeeServerConnect then
      begin
        result := NOTSERVERCONNECTED;
        Exit;
      end;
      result := CheckKyungHeeEmployee(aEmCode,stSeq,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,
              aEmName,aCompanyName,aJijumName,aDepartName,aPosiName);
    end;
  end else if G_nSCSRelayServer = 1 then //KT비즈메카
  begin
    if Not KTBizmekaServerConnect then
    begin
      result := NOTSERVERCONNECTED;
      Exit;
    end;
    stKTBizMekaDoorNo := GetDoorNo(aNodeNo, aECUID, aDoorNo);
    if Trim(stKTBizMekaDoorNo) = '' then
    begin
      result := NOTRESULTED;
      Exit;
    End;
    result := CheckKTBizMeka(aCardNo,stKTBizMekaDoorNo);
  end else if G_nSCSRelayServer = 2 then //인천대공원
  begin
    if Not KTBizmekaServerConnect then
    begin
      result := NOTSERVERCONNECTED;
      Exit;
    end;
    stKTBizMekaDoorNo := GetDoorNo(aNodeNo, aECUID, aDoorNo);
    if Trim(stKTBizMekaDoorNo) = '' then
    begin
      result := NOTRESULTED;
      Exit;
    End;
    result := CheckKTBizMekaII(aCardNo,stKTBizMekaDoorNo);
  end else if G_nSCSRelayServer = 3 then //KT비즈메카 II
  begin
    if Not KTBizmekaServerConnect then
    begin
      result := NOTSERVERCONNECTED;
      Exit;
    end;
    stKTBizMekaDoorNo := GetDoorNo(aNodeNo, aECUID, aDoorNo);
    if Trim(stKTBizMekaDoorNo) = '' then
    begin
      result := NOTRESULTED;
      Exit;
    End;
    result := CheckKTBizMekaIII(aCardNo,stKTBizMekaDoorNo);
  end else if G_nSCSRelayServer = 4 then //바코드시스템
  begin
    if Not KTBizmekaServerConnect then
    begin
      result := NOTSERVERCONNECTED;
      Exit;
    end;
    stKTBizMekaDoorNo := GetDoorNo(aNodeNo, aECUID, aDoorNo);
    if Trim(stKTBizMekaDoorNo) = '' then
    begin
      result := NOTRESULTED;
      Exit;
    End;
    result := CheckBarCodeSystem(aCardNo,stKTBizMekaDoorNo,aNodeNo, aECUID, aDoorNo);
  end;

end;

function TfmMain.KyungHeeServerConnect: Boolean;

begin
  result := False;
  if Not dmOracleRelay.OracleADOConnection.Connected then
  begin
    dmOracleRelay.OracleConnectTimer.Interval := 1000;
    dmOracleRelay.OracleConnectTimer.Enabled := True;
    Exit;
  end;
  result := True;
  {
  begin
    if Not dmOracleRelay.AdoConnected(G_stOracleServerIP, G_stOracleServerPort,
                      G_stOracleUserID, G_stOracleUserPW, G_stOracleDataBaseName) then Exit;
  end;
  result := True; }
end;

function TfmMain.GetEmpNoFromCardNo(aCardNO: string;Var aSeq:string): string;
var
  stTemp : string;
begin
  Delete(aCardNo,1,1); //학교코드
  aCardNo := StringReplace(aCardNo,'N',' ',[rfReplaceAll]);
  stTemp := copy(aCardNo,1,13);
  aSeq := Trim(copy(aCardNo,14,2));

  result := Trim(stTemp);

end;

function TfmMain.CheckKyungHeeEmployee(aEmpNo, aSeq: string;
var aCompanyCode,aJijumCode,aDepartCode,aPosiCode,
             aEmName,aCompanyName,aJijumName,aDepartName,aPosiName:string): integer;
var
  stSql : string;
  TempOracleAdo : TAdoQuery;
  stBeginDate : string;
  stEndDate : string;
  stExprdDate : string;
begin
  aCompanyCode:='000';
  aJijumCode:='000';
  aDepartCode:='000';
  aPosiCode:='000';
  aEmName:='';
  aCompanyName:='';
  aJijumName:='';
  aDepartName:='';
  aPosiName:='';
  
  result := NOTRESULTED;
  stSql := 'Select * from SEAT_USER_VIEW ';
  stSql := stSql + ' Where PID = ''' + aEmpNo + ''' ';
//  stSql := stSql + ' AND CARD_ISSUE_CNT = ' + aSeq ;

  Try
    CoInitialize(nil);
    TempOracleAdo := TADOQuery.Create(nil);
    TempOracleAdo.Connection := dmOracleRelay.OracleADOConnection;
    TempOracleAdo.DisableControls;

    With TempOracleAdo do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        on E : Exception do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          result := NOTSERVERCONNECTED;
          LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log','KyungSearch Error' + E.Message );
          Exit;
        end;

      End;
      if recordCount < 1 then Exit;
      result := AUTH;
      //Exit;
      if FindField('PAT_TYPE').AsInteger = 81 then result := NOTAUTH;
      aCompanyCode:='001';
      aJijumCode:=copy(FindField('DEPT_CODE').AsString,1,3);
      aDepartCode:='001';
      aPosiCode:='000';
      aEmName:=FindField('USERNAME').AsString;
      aCompanyName:='경희대수원캠퍼스';
      aJijumName:=FindField('DEPT_NAME').AsString;
      aDepartName:='';
      aPosiName:='';
      stBeginDate := '';
      stEndDate := '';
      stExprdDate := '';
      if Not FindField('BEGIN_DATE').IsNull then stBeginDate := FindField('BEGIN_DATE').asstring;
      if Not FindField('END_DATE').IsNull then stEndDate := FindField('END_DATE').asstring;
      if Not FindField('DATE_EXPRD').IsNull then stExprdDate := FindField('DATE_EXPRD').asstring;

      //StatusBar1.Panels[2].Text := '[InsertLocalSEAT_USER_VIEW]';
      InsertLocalSEAT_USER_VIEW(
        FindField('PID').asstring,
        FindField('USERNAME').asstring,
        FindField('USERPWD').asstring,
        FindField('PAT_TYPE_DESC').asstring,
        inttostr(FindField('PAT_TYPE').asinteger),
        FindField('DEPT_NAME').asstring,
        FindField('DEPT_CODE').asstring,
        inttostr(FindField('CARD_ISSUE_CNT').asinteger),
        stBeginDate,
        stEndDate,
        stExprdDate,
        inttostr(FindField('LONG_OVER').asinteger),
        FormatDateTime('yyyymmdd',Now)
      );

    end;
    
  Finally
    TempOracleAdo.EnableControls;
    TempOracleAdo.Free;
    CoUninitialize;
  End;



end;

procedure TfmMain.ShowAccessEvent(aSCSResult, aAuthType, aTimestr, aNodeNo,
  aECUID, aDoorNo, aReaderNo, aCardNo, aEmName, aCompanyName, aJijumName,
  aEmCode, aPosiName: string);
var
  fmMonitor :TForm;
begin
  if Not Monitoring then Exit;
  fmMonitor := MDIForm('TfmMonitoring');
  if fmMonitor = nil then Exit;
  TfmMonitoring(fmMonitor).ShowAccessEvent(aSCSResult, aAuthType, aTimestr, aNodeNo,
  aECUID, aDoorNo, aReaderNo, aCardNo, aEmName, aCompanyName, aJijumName,
  aEmCode, aPosiName);

end;



procedure TfmMain.mn_AccessReportClick(Sender: TObject);
begin
  MDIChildShow('TfmAccessReport');
end;

function TfmMain.LocalServerCheckKHUEmployee(aEmpNo, aSeq: string;
  var aCompanyCode, aJijumCode, aDepartCode, aPosiCode, aEmName,
  aCompanyName, aJijumName, aDepartName, aPosiName: string): integer;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  aCompanyCode:='000';
  aJijumCode:='000';
  aDepartCode:='000';
  aPosiCode:='000';
  aEmName:='';
  aCompanyName:='';
  aJijumName:='';
  aDepartName:='';
  aPosiName:='';
  
  result := NOTRESULTED;
  stSql := 'Select * from SEAT_USER_VIEW ';
  stSql := stSql + ' Where PID = ''' + aEmpNo + ''' ';
//  stSql := stSql + ' AND CARD_ISSUE_CNT = ' + aSeq ;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    With TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        on E : Exception do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          result := NOTSERVERCONNECTED;
          LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log','LocalServer Error' + E.Message );
          Exit;
        end;

      End;
      if recordCount < 1 then Exit;
      result := AUTH;
      if FindField('PAT_TYPE').AsInteger = 81 then result := NOTAUTH;
      aCompanyCode:='001';
      aJijumCode:=copy(FindField('DEPT_CODE').AsString,1,3);
      aDepartCode:='001';
      aPosiCode:='000';
      aEmName:=FindField('USERNAME').AsString;
      aCompanyName:='경희대수원캠퍼스';
      aJijumName:=FindField('DEPT_NAME').AsString;
      aDepartName:='';
      aPosiName:='';

      UpdateLocalSEAT_USER_VIEW_LastUseDate(aEmpNo,FormatDateTime('yyyymmdd',now));

    end;
    
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.InsertLocalSEAT_USER_VIEW(aPID, aUSERNAME, aUSERPWD,
  aPAT_TYPE_DESC, aPAT_TYPE, aDEPT_NAME, aDEPT_CODE, aCARD_ISSUE_CNT,
  aBEGIN_DATE, aEND_DATE, aDATE_EXPRD, aLOGN_OVER,
  aLastUseDate: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert into SEAT_USER_VIEW ( ';
  stSql := stSql + 'PID,';
  stSql := stSql + 'USERNAME,';
  stSql := stSql + 'USERPWD,';
  stSql := stSql + 'PAT_TYPE_DESC,';
  stSql := stSql + 'PAT_TYPE,';
  stSql := stSql + 'DEPT_NAME,';
  stSql := stSql + 'DEPT_CODE,';
  stSql := stSql + 'CARD_ISSUE_CNT,';
  stSql := stSql + 'BEGIN_DATE,';
  stSql := stSql + 'END_DATE,';
  stSql := stSql + 'DATE_EXPRD,';
  stSql := stSql + 'LOGN_OVER,';
  stSql := stSql + 'LAST_USEDATE) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aPID + ''',';
  stSql := stSql + '''' + aUSERNAME + ''',';
  stSql := stSql + '''' + aUSERPWD + ''',';
  stSql := stSql + '''' + aPAT_TYPE_DESC + ''',';
  stSql := stSql + '' + aPAT_TYPE + ',';
  stSql := stSql + '''' + aDEPT_NAME + ''',';
  stSql := stSql + '''' + aDEPT_CODE + ''',';
  stSql := stSql + '' + aCARD_ISSUE_CNT + ',';
  stSql := stSql + '''' + aBEGIN_DATE + ''',';
  stSql := stSql + '''' + aEND_DATE + ''',';
  stSql := stSql + '''' + aDATE_EXPRD + ''',';
  stSql := stSql + '' + aLOGN_OVER + ',';
  stSql := stSql + '''' + aLastUseDate + ''')';

  result := DataModule1.ProcessExecSQL(stSql);
  if Not result then
    StatusBar1.Panels[2].Text := 'NOT:' + stSql
  else StatusBar1.Panels[2].Text := stSql;

end;

function TfmMain.UpdateLocalSEAT_USER_VIEW_LastUseDate(aPID,
  aLastUseDate: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update SEAT_USER_VIEW set LAST_USEDATE = ''' + aLastUseDate + ''' ';
  stSql := stSql + ' Where PID = ''' + aPID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMain.mn_dbConnectTestClick(Sender: TObject);
begin
  if G_nSCSRelayServer = 0 then  //KyungheeServer
  begin
    dmOracleRelay.OracleConnectTimer.Interval := 1000;
    dmOracleRelay.OracleConnectTimer.Enabled := True;
  end;

end;

procedure TfmMain.OracleAdoConnected(Sender: TObject;
  DBConnected: Boolean);
var
  stText : string;
begin
  stText := 'Oracle Ado Connect Success!!! ';
  if Not DBConnected then
  begin
    LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log','DisConnected' );
    stText := 'Oracle Ado Connect Fail!!! ';
    if G_nSCSRelayServer = 0 then  //KyungheeServer
    begin
      dmOracleRelay.OracleConnectTimer.Interval := 30000;
      dmOracleRelay.OracleConnectTimer.Enabled := True;
    end;
  end;
  StatusBar1.Panels[2].Text := stText;

end;

procedure TfmMain.mn_NotUseCardDeleteClick(Sender: TObject);
begin
  fmNotUseCardDelete:= TfmNotUseCardDelete.Create(Self);
  fmNotUseCardDelete.SHowmodal;
  fmNotUseCardDelete.Free;

end;

procedure TfmMain.CommandArrayCommandsTSendDataExecute(Command: TCommand;
  Params: TStringList);
var
  stRecvData : string;
  nIndex : integer;
  stCMD : string;
  stDeviceID : string;
  bSendAll : Boolean;
begin
  stRecvData := Params.Values['VALUE'];

  nIndex := pos(DATADELIMITER,stRecvData);
  stCMD := copy(stRecvData,1,nIndex - 1);
  Delete(stRecvData,1,nIndex);
  nIndex := pos(DATADELIMITER,stRecvData);
  stDeviceID := copy(stRecvData,1,nIndex - 1);
  Delete(stRecvData,1,nIndex);

  if stCMD = 'STATECHECK' then CheckDOORSTATE(stDeviceID)            //상태확인
  else if stCMD = 'ALARMCHECK' then CheckAlarmSTATE(stDeviceID)      //방범상태확인
  else if stCMD = 'DOOROPEN' then DoorOpen(stDeviceID)               //출입승인
  else if stCMD = 'OPENMODE' then DoorModeChange(stDeviceID,'1')     //개방모드
  else if stCMD = 'OPERATEMODE' then DoorModeChange(stDeviceID,'0')  //운영모드
  else if stCMD = 'TIMESYNC' then DeviceTimeSync(stDeviceID)         //시간동기화
  else if stCMD = 'REBOOT' then DeviceReboot(stDeviceID)             //기기 재부팅
  else if stCMD = 'ALARMSETTING' then DeviceAlarmModeChange(stDeviceID,'1')  //경계
  else if stCMD = 'ALARMDISABLE' then DeviceAlarmModeChange(stDeviceID,'0')  //경계해제
  else if stCMD = 'HOLIDAY' then DeviceHoliday(stDeviceID)  //공휴일 다운로드
  else if stCMD = 'CARDDOWNLOAD' then  //카드권한다운로드
  begin
    if stRecvData[1] = 'Y' then bSendAll := True
    else bSendAll := False;
    CardNoDownload(strtoint(copy(stDeviceID,1,3)),copy(stDeviceID,4,2),bSendAll);
  end
  else if stCMD = 'DEAMONRESTART' then Action_DaemonRestartExecute(self) //데몬재시작
  else if stCMD = 'CARDMODE' then DeviceCardModeChange(stDeviceID,stRecvData[1]); //카드 모드 'P' Positive,'N' Negative

end;

procedure TfmMain.DeviceCardModeChange(aDeviceID: string; aMode: Char);
var
  stNodeNo,stECUID,stDoorNo : string;
  i,j : integer;
  aDevice: TDevice;
begin
  stNodeNo := copy(aDeviceID,1,3);
  if aMode = 'N' then aMode := '1'  //Nega
  else aMode := '0';  //Posi

  if (stNodeNo = '000') or (stNodeNo = '') then
  begin
      for i:=0 to DeviceList.Count - 1 do
      begin
        if bApplicationTerminate then Exit;
        aDevice := TDevice(DeviceList.Objects[i]);
        if aDevice.CommNode.SocketConnected = True then
        begin
          for j:= 1 to DOORCOUNT do
          begin
            if bApplicationTerminate then Exit;
            aDevice.CardModeChange(inttostr(j)[1],aMode);
            Delay(200);
          end;
        end;
      end;
    Exit;
  end;
  stECUID := copy(aDeviceID,4,2);
  stDoorNo := copy(aDeviceID,6,1);

    aDevice:= GetDevice(stNodeNo + stECUID  );
    if aDevice <> nil then
    begin
      if aDevice.CommNode.SocketConnected = True then aDevice.CardModeChange(stDoorNo[1],aMode)
    end;

end;

function TfmMain.KTBizmekaServerConnect: Boolean;
begin
  //Exit; //Test
  result := False;
  if Not dmMSSQLRelay.MssqlADOConnection.Connected then
  begin
    dmMSSQLRelay.MssqlConnectTimer.Interval := 1000;
    dmMSSQLRelay.MssqlConnectTimer.Enabled := True;
    Exit;
  end;
  result := True;

end;

function TfmMain.GetDoorNo(aNodeNo, aECUID, aDoorNo: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '';
  stSql := ' Select * from TB_KTBIZMEKADOOR ';
  stSql := stSql + ' where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := FindField('KD_DOORNO').asstring;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;


end;

function TfmMain.CheckKTBizMeka(aCardNo,
  aKTBizMekaDoorNo: string): integer;
var
  stSql : string;
  TempMssqlAdo : TAdoQuery;
  stResult :string;
begin
  Try
    result := NOTRESULTED;
    if UpperCase(G_stKTBIZDBType) = 'ORACLE' then
    begin
      with dmMSSQLRelay.ADOSP do
      begin
        ProcedureName := 'PSP_CALL_OPEN_DOOR';
        Parameters.Clear;
        Parameters.CreateParameter('PC_CARDNO',ftString,pdInput,20,'');
        Parameters.CreateParameter('PC_GATEID',ftString,pdInput,2,'');
        Parameters.CreateParameter('PC_FLAG',ftInteger,pdInput,0,0);
        Parameters.CreateParameter('sOutResult',ftString,pdOutput,20,'');
        Parameters.ParamByName('PC_CARDNO').Value := aCardNo;
        Parameters.ParamByName('PC_GATEID').Value := aKTBizMekaDoorNo;
        Parameters.ParamByName('PC_FLAG').Value := 1;
        ExecProc;
        stResult := Parameters.ParamByName('sOutResult').Value;
        if Not isDigit(stResult) then Exit;
        if strtoint(stResult) = 1 then result := AUTH
        else result := NOTAUTH;

      end;
      Exit;
    end;


    stSql := 'DECLARE @flag int ';
    stSql := stSql + ' EXEC @flag = dbo.PSP_CALL_OPEN_DOOR ''' + aCardNo + ''',''' + aKTBizMekaDoorNo + ''',1 ';
    stSql := stSql + ' SELECT @flag as Flag ';

    Try
      CoInitialize(nil);
      TempMssqlAdo := TADOQuery.Create(nil);
      TempMssqlAdo.Connection := dmMssqlRelay.MssqlADOConnection;
      TempMssqlAdo.DisableControls;

      With TempMssqlAdo do
      begin
        Close;
        Sql.Text := stSql;
        Try
          Open;
        Except
          on E : Exception do
          begin
            // ERROR MESSAGE-BOX DISPLAY
            result := NOTSERVERCONNECTED;
            dmMSSQLRelay.MssqlADOConnection.Connected := False;
            KTBizmekaServerConnect;
            LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log','KTBIZMEKASearch Error' + E.Message );
            Exit;
          end;

        End;
        if recordCount < 1 then Exit;
        if strtoint(FindField('Flag').AsString) = 1 then result := AUTH
        else result := NOTAUTH;

      end;
    
    Finally
      TempMssqlAdo.EnableControls;
      TempMssqlAdo.Free;
      CoUninitialize;
    End;
  Except
    LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','CheckKTBizMeka Selected Error' );
  End;

end;

procedure TfmMain.MssqlAdoConnected(Sender: TObject; DBConnected: Boolean);
var
  stText : string;
begin
  stText := 'Mssql Ado Connect Success!!! ';
  if Not DBConnected then
  begin
    LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log','DisConnected' );
    stText := 'MSSQL Ado Connect Fail!!! ';
    if (G_nSCSRelayServer = 1) or (G_nSCSRelayServer = 2) or (G_nSCSRelayServer = 3) or (G_nSCSRelayServer = 4) then  //KT BizMeka
    begin
      dmMssqlRelay.MssqlConnectTimer.Interval := 30000;
      dmMssqlRelay.MssqlConnectTimer.Enabled := True;
    end;
  end;
  StatusBar1.Panels[2].Text := stText;

end;

procedure TfmMain.mn_EmployeeClick(Sender: TObject);
begin
  MDIChildGradeShow('TfmEmploy',true,true,true);
end;

procedure TfmMain.mn_BasicCodeClick(Sender: TObject);
begin
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  Try
    fmCompanyCode.Caption := mn_BasicCode.Caption;
    fmCompanyCode.WorkCode := 0;
    fmCompanyCode.IsInsertGrade := true;
    fmCompanyCode.IsUpdateGrade := true;
    fmCompanyCode.IsDeleteGrade := true;
    fmCompanyCode.SHowmodal;
  Finally
    fmCompanyCode.Free;
  End;

end;

procedure TfmMain.mn_DoorGradeClick(Sender: TObject);
begin
  MDIChildGradeShow('TfmMDICardAdmin',true,true,true);
end;

procedure TfmMain.MDIChildGradeShow(FormName: String; aInsertGrade,
  aUpdateGrade, aDeleteGrade: Boolean);
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  tmpClass := FindClass(FormName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(FormName) then
      begin
        Screen.Forms[i].Show;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    TfmASubForm(tmpForm).IsInsertGrade := aInsertGrade;
    TfmASubForm(tmpForm).IsUpdateGrade := aUpdateGrade;
    TfmASubForm(tmpForm).IsDeleteGrade := aDeleteGrade;
    tmpForm.Show;
  end;
end;

procedure TfmMain.CardAutoDownTimerTimer(Sender: TObject);
begin
  if bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := 'CardAutoDownTimer';
  Application.ProcessMessages;
  CardAutoDownTimer.Interval := 1000;
  CardAutoDownTimer.Enabled := False;
  CardNoDownload(0,'00',False); //미전송 데이터 전송
  CardAutoDownTimer.Enabled := True;

end;

procedure TfmMain.CheckDeviceSkill(aDeviceID: string);
var
  stNodeNo,stECUID : string;
  i : integer;
  aDevice: TDevice;
  aEcuInfo: TEcuInfo;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);

  if UseDeviceServer then
  begin
    if (stNodeNo = '') or (stNodeNo = '000') then //전체상태조회
    begin
      for i := 0 to DeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        aDevice:= GetDevice(DeviceList.Strings[i] );
        if aDevice <> nil then
        begin
          if aDevice.CommNode.SocketConnected = True then aDevice.CheckSystemSkill;
        end else
        begin
          Continue;
        end;
      end;
      Exit;
    end;

    aDevice:= GetDevice(stNodeNo + stECUID );
    if aDevice <> nil then
    begin
      if aDevice.CommNode.SocketConnected = True then aDevice.CheckSystemSkill;
    end;
  end else
  begin
    if (stNodeNo = '') or (stNodeNo = '000') then //전체상태조회
    begin
      for i := 0 to DeviceClientDeviceList.Count -1 do
      begin
        if bApplicationTerminate then Exit;
        aEcuInfo:= GetEcuInfo(DeviceClientDeviceList.Strings[i] );
        if aEcuInfo <> nil then
        begin
          if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckSystemSkill;
        end else
        begin
          Continue;
        end;
      end;
      Exit;
    end;

    aEcuInfo:= GetEcuInfo(stNodeNo + stECUID );
    if aEcuInfo <> nil then
    begin
      if aEcuInfo.McuNode.SocketConnected = True then aEcuInfo.CheckSystemSkill;
    end;
  end;

end;

function TfmMain.CheckKTBizMekaII(aCardNo,
  aKTBizMekaDoorNo: string): integer;
var
  stSql : string;
  TempMssqlAdo : TAdoQuery;
  stHexCardNo : string;
  nResult : integer;
begin
  Try
    result := NOTRESULTED;
    stHexCardNo := aCardno;
    if IsNumericCardNo then
      stHexCardNo := Dec2Hex64(strtoint64(aCardno),8);
    stSql := 'DECLARE @flag VARCHAR ';
    stSql := stSql + ' EXEC dbo.PSP_BIKE_INOUT ''' + stHexCardNo + ''',''' + FormatDateTime('yyyymmdd',now) + ''',''' + FormatDateTime('hhnnss',now) + ''',''' + aKTBizMekaDoorNo + ''',@flag OUTPUT ';
    stSql := stSql + ' SELECT @flag as Flag ';

    Try
      CoInitialize(nil);
      TempMssqlAdo := TADOQuery.Create(nil);
      TempMssqlAdo.Connection := dmMssqlRelay.MssqlADOConnection;
      TempMssqlAdo.DisableControls;

      With TempMssqlAdo do
      begin
        Close;
        Sql.Text := stSql;
        Try
          Open;
        Except
          on E : Exception do
          begin
            // ERROR MESSAGE-BOX DISPLAY
            result := NOTSERVERCONNECTED;
            dmMSSQLRelay.MssqlADOConnection.Connected := False;
            KTBizmekaServerConnect;
            LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log','KTBIZMEKASearch Error' + E.Message );
            Exit;
          end;

        End;
        if recordCount < 1 then Exit;
        nResult := strtoint(FindField('Flag').asstring);
        if nResult = 0 then result := AUTH
        else result := NOTAUTH;

      end;
    
    Finally
      TempMssqlAdo.EnableControls;
      TempMssqlAdo.Free;
      CoUninitialize;
    End;
  Except
    LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','CheckKTBizMekaII Selected Error' );
  End;

end;

function TfmMain.SendDisPlay(aNodeNo, aECUID, aDoorNo,
  aAuthType: string): Boolean;
var
  aDisplay   : TdmDisplay;
begin
  Try
    aDisplay := GetDisplayDevice(aNodeNo, aECUID, aDoorNo) ;

    if aDisplay <> nil then
    begin
      StatusBar1.Panels[2].Text := '디스플레이출력 시작';
      aDisplay.SendData(aAuthType);
      StatusBar1.Panels[2].Text := '디스플레이출력 종료';
    end;
  Except
    LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','SendDisPlay Error' );
  End;

end;

function TfmMain.LoadDisplay: Boolean;
var
  stSql : String;
  aDisplay   : TdmDisplay;
  TempAdoQuery : TADOQuery;
  nNodeNo : integer;
  stDisplayID : string;

begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    DisplayList.Clear;

    // Display List 전체 추출
    stSql := ' select * from TB_KTBMDISPLAY  ';

    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      First;
      while not eof do
      begin
        if bApplicationTerminate then Exit;

        nNodeNo:= FindField('AC_NODENO').asInteger;
        stDisplayID:=FillzeroNumber(nNodeNo,3) + FindField('AC_ECUID').asString + FindField('DO_DOORNO').asString;

        //Create TDevice
        aDisplay:= TdmDisplay.Create(Self);
        //aDisplay.DeviceLayer := dlWinsock;
        aDisplay.DisplayIP := FindField('KD_IP').AsString;
        aDisplay.DisplayPort := FindField('KD_PORT').asString;
        if isDigit(FindField('KD_CLEARTIME').asstring) then
          aDisplay.ClearTime := strtoint(FindField('KD_CLEARTIME').asstring);
        if isDigit(FindField('KD_GENERALTIME').asstring) then
          aDisplay.GeneralTime := strtoint(FindField('KD_GENERALTIME').asstring);


        DisplayList.AddObject(stDisplayID,aDisplay);

        next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmMain.LoadDisplayMessage: Boolean;
var
  stSql : String;
  aDisplay   : TdmDisplay;
  TempAdoQuery : TADOQuery;

begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    // Display List 전체 추출
    stSql := ' select * from TB_KTBMDISPLAYMESSAGE  ';

    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      First;
      while not eof do
      begin
        if bApplicationTerminate then Exit;

        aDisplay := GetDisplayDevice(inttostr(FindField('AC_NODENO').asInteger), FindField('AC_ECUID').asString, FindField('DO_DOORNO').asString);

        if aDisplay <> nil then
        begin
          if FindField('KM_CODE').asstring = '000' then
          begin
            aDisplay.GeneralMessage := FindField('KM_MESSAGE').asstring;
          end else if FindField('KM_CODE').asstring = '001' then
          begin
            aDisplay.AuthMessage := FindField('KM_MESSAGE').asstring;
          end else if FindField('KM_CODE').asstring = '002' then
          begin
            aDisplay.NotAuthMessage := FindField('KM_MESSAGE').asstring;
          end;
        end;

        next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmMain.GetDisplayDevice(aNodeNo, aECUID,
  aDoorNo: string): TdmDisplay;
var
  stDisplayID : string;
  DeviceIndex : integer;
begin
  stDisplayID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + aDoorNo;

  result := nil;
  DeviceIndex:= DisplayList.Indexof(stDisplayID);
  if DeviceIndex > -1 then result:= TdmDisplay(DisplayList.Objects[DeviceIndex])
  else Exit;

end;

function TfmMain.UNLoadDisplay: Boolean;
begin
  DisplayList.Clear;
end;

procedure TfmMain.mn_displayClick(Sender: TObject);
begin
  fmDisplayAdmin:= TfmDisplayAdmin.Create(Self);
  fmDisplayAdmin.IsInsertGrade := True;
  fmDisplayAdmin.IsUpdateGrade := True;
  fmDisplayAdmin.IsDeleteGrade := True;
  fmDisplayAdmin.SHowmodal;
  fmDisplayAdmin.Free;
  Delay(100);
  //여기에서 환경 설정 다시 로드
  Action_DaemonRestartExecute(self);

end;

function TfmMain.CheckKTBizMekaIII(aCardNo,
  aKTBizMekaDoorNo: string): integer;
var
  stSql : string;
  TempMssqlAdo : TAdoQuery;
  stResult : string;
begin
  Try
    result := NOTRESULTED;
    if UpperCase(G_stKTBIZDBType) = 'ORACLE' then
    begin
      with dmMSSQLRelay.ADOSP do
      begin
        ProcedureName := 'PSP_CALL_OPEN_DOOR2';
        Parameters.Clear;
        Parameters.CreateParameter('PC_CARDNO',ftString,pdInput,20,'');
        Parameters.CreateParameter('PC_GATEID',ftString,pdInput,2,'');
        Parameters.CreateParameter('PC_FLAG',ftInteger,pdInput,0,0);
        Parameters.CreateParameter('sOutResult',ftString,pdOutput,20,'');
        Parameters.ParamByName('PC_CARDNO').Value := aCardNo;
        Parameters.ParamByName('PC_GATEID').Value := aKTBizMekaDoorNo;
        Parameters.ParamByName('PC_FLAG').Value := '1';
        ExecProc;
        stResult := Parameters.ParamByName('sOutResult').Value;
        if Not isDigit(stResult) then Exit;
        if strtoint(stResult) = 1 then result := AUTH
        else result := NOTAUTH;

      end;
      Exit;
    end;
    stSql := 'DECLARE @flag varchar(255) ';
    stSql := stSql + ' EXEC dbo.PSP_CALL_OPEN_DOOR2 ''' + aCardNo + ''',''' + aKTBizMekaDoorNo + ''',1,@flag output ';
    stSql := stSql + ' SELECT @flag as Flag ';

    Try
      CoInitialize(nil);
      TempMssqlAdo := TADOQuery.Create(nil);
      TempMssqlAdo.Connection := dmMssqlRelay.MssqlADOConnection;
      TempMssqlAdo.DisableControls;

      With TempMssqlAdo do
      begin
        Close;
        Sql.Text := stSql;
        Try
          Open;
        Except
          on E : Exception do
          begin
            // ERROR MESSAGE-BOX DISPLAY
            result := NOTSERVERCONNECTED;
            dmMSSQLRelay.MssqlADOConnection.Connected := False;
            KTBizmekaServerConnect;
            LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log','KTBIZMEKASearch Error' + E.Message );
            Exit;
          end;

        End;
        if recordCount < 1 then Exit;
        stResult := Trim(FindField('Flag').AsString);
        if stResult = '1' then result := AUTH
        else result := NOTAUTH;

      end;
    
    Finally
      TempMssqlAdo.EnableControls;
      TempMssqlAdo.Free;
      CoUninitialize;
    End;
  Except
    LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','CheckKTBizMekaIII Selected Error' );
  End;
end;

procedure TfmMain.Button1Click(Sender: TObject);
begin
  CheckKTBizMeka('1234567890','1');

end;

procedure TfmMain.mn_BarCodeClick(Sender: TObject);
begin
  fmBarCode:= TfmBarCode.Create(Self);
  fmBarCode.SHowmodal;
  fmBarCode.Free;
  Delay(100);
  //바코드 변경 사항 적용
  Action_DaemonRestartExecute(self);
end;

function TfmMain.LoadBarCode: Boolean;
var
  stSql : String;
  aBarCode   : TdmBarCode;
  TempAdoQuery : TADOQuery;
  stBarCodeID : string;

begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    BarCodeList.Clear;

    // Display List 전체 추출
    stSql := ' select * from TB_BARCODE  ';

    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      First;
      while not eof do
      begin
        if bApplicationTerminate then Exit;

        stBarCodeID:=FindField('BC_IP').asString + FindField('BC_PORT').asString;

        //Create TDevice
        aBarCode:= TdmBarCode.Create(Self);
        aBarCode.BarCodeID := stBarCodeID;
        aBarCode.BarCodeIP := FindField('BC_IP').asString;
        aBarCode.BarCodePORT := FindField('BC_PORT').asString;
        aBarCode.DoorNodeNo := FindField('AC_NODENO').asInteger;
        aBarCode.DoorECUID := FindField('AC_ECUID').asString;
        aBarCode.DoorNo := FindField('DO_DOORNO').asString;
        aBarCode.ReaderNo := FindField('DO_READER').asString;

        aBarCode.OnRcvBarCode:=  RcvBarCodeData;

        BarCodeList.AddObject(stBarCodeID,aBarCode);

        next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  BarCodeConnectCheckTimer.Enabled := True;
  result := True;
end;

function TfmMain.UNLoadBarCode: Boolean;
var
  i : integer;
begin
  if BarCodeList.Count < 1 then Exit;
  BarCodeConnectCheckTimer.Enabled := False;
  L_bBarCodeChecking := False;
  for i := 0 to BarCodeList.Count - 1 do
  begin
    TdmBarCode(BarCodeList.Objects[i]).BarCodeConnect := False;
  end;
  BarCodeList.Clear;
end;

procedure TfmMain.BarCodeConnectCheckTimerTimer(Sender: TObject);
var
  i : integer;
begin
  if BarCodeList.Count < 1 then Exit;
  if L_bBarCodeChecking then Exit;
  L_bBarCodeChecking := True;
  Try
    for i:= 0 to BarCodeList.Count - 1 do
    begin
      if Not L_bBarCodeChecking then Exit; //Timer 정지
      if Not TdmBarCode(BarCodeList.Objects[i]).BarCodeConnected then TdmBarCode(BarCodeList.Objects[i]).BarCodeConnect := True
      else
        TdmBarCode(BarCodeList.Objects[i]).PutString('A'); //무의미한 데이터 한패킷씩 보내자... 끊겼을때 다시 접속하기 위함
    end;
  Finally
    L_bBarCodeChecking := False;
  End;

end;

function TfmMain.CheckBarCodeSystem(aCardNo,
  aKTBizMekaDoorNo,aNodeNo,aEcuNo,aDoorNo: string): integer;
var
  stSql : string;
  TempMssqlAdo : TAdoQuery;
  TempOraStoredProc : TADOStoredProc;
  stResult : string;
begin
  //TEST
  {
  if chk_Accecept.Checked then result := AUTH
  else result := NOTAUTH;

  if rg_sound.ItemIndex > 0 then
    SoundPlay(aNodeNo,aEcuNo,aDoorNo,inttostr(rg_sound.ItemIndex));
  Exit;
  }
  //TEST END

  Try
    Try
      FOracleTCS.Enter;
      result := NOTRESULTED;
      if UpperCase(G_stKTBIZDBType) = 'ORACLE' then
      begin
        Try
          {CoInitialize(nil);
          TempOraStoredProc := TADOStoredProc.Create(nil);
          TempOraStoredProc.Connection := dmMssqlRelay.MssqlADOConnection;
          TempOraStoredProc.DisableControls;}
          if L_bOracleLog then LogSave(ExeFolder + '\..\log\oracle' + FormatDateTime('yyyymmdd',now) + '.log','Start' );
          with dmMSSQLRelay.ADOSP do
          //with TempOraStoredProc do
          begin
            ProcedureName := 'PSP_CALL_OPEN_DOOR2';
            Parameters.Clear;
            Parameters.CreateParameter('PC_CARDNO',ftString,pdInput,20,'');
            Parameters.CreateParameter('PC_GATEID',ftString,pdInput,2,'');
            Parameters.CreateParameter('PC_FLAG',ftInteger,pdInput,0,0);
            Parameters.CreateParameter('sOutResult',ftString,pdOutput,20,'');
            Parameters.ParamByName('PC_CARDNO').Value := aCardNo;
            Parameters.ParamByName('PC_GATEID').Value := aKTBizMekaDoorNo;
            Parameters.ParamByName('PC_FLAG').Value := '1';
            Try
              ExecProc;
              stResult := Parameters.ParamByName('sOutResult').Value;
            Except
              ON E: Exception do
              begin
                LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log','DBError(' + E.Message + ')' );
                MssqlAdoConnected(dmMSSQLRelay,False);
                Exit;
              end;
            End;
            if Length(stResult) < 2 then Exit;
            if Not isDigit(stResult) then Exit;
            if stResult[1] = '1' then result := AUTH
            else result := NOTAUTH;
            if L_bOracleLog then LogSave(ExeFolder + '\..\log\oracle' + FormatDateTime('yyyymmdd',now) + '.log','End' );
            SoundPlay(aNodeNo,aEcuNo,aDoorNo,stResult[2]);
          end;
          Exit;
        Finally
          {TempOraStoredProc.EnableControls;
          TempOraStoredProc.Free;
          CoUninitialize; }
          if L_bOracleLog then LogSave(ExeFolder + '\..\log\oracle' + FormatDateTime('yyyymmdd',now) + '.log','Finally' );
        End;
      end;
      stSql := 'DECLARE @flag varchar(255) ';
      stSql := stSql + ' EXEC dbo.PSP_CALL_OPEN_DOOR2 ''' + aCardNo + ''',''' + aKTBizMekaDoorNo + ''',1,@flag output ';
      stSql := stSql + ' SELECT @flag as Flag ';

      Try
        CoInitialize(nil);
        TempMssqlAdo := TADOQuery.Create(nil);
        TempMssqlAdo.Connection := dmMssqlRelay.MssqlADOConnection;
        TempMssqlAdo.DisableControls;

        With TempMssqlAdo do
        begin
          Close;
          Sql.Text := stSql;
          Try
            Open;
          Except
            on E : Exception do
            begin
              // ERROR MESSAGE-BOX DISPLAY
              result := NOTSERVERCONNECTED;
              dmMSSQLRelay.MssqlADOConnection.Connected := False;
              KTBizmekaServerConnect;
              LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log','KTBIZMEKASearch Error' + E.Message );
              Exit;
            end;

          End;
          if recordCount < 1 then Exit;
          stResult := Trim(FindField('Flag').AsString);
          if stResult[1] = '1' then result := AUTH
          else result := NOTAUTH;
          SoundPlay(aNodeNo,aEcuNo,aDoorNo,stResult[2]);
        end;
    
      Finally
        TempMssqlAdo.EnableControls;
        TempMssqlAdo.Free;
        CoUninitialize;
      End;
    Finally
      FOracleTCS.Leave;
    End;
  Except
    LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','CheckBarCodeSystem Error' );
  End;
end;

function TfmMain.SoundPlay(aNodeNo, aEcuNo, aDoorNo,
  aSound: string): Boolean;
var
  stSoundIP : string;
  stSoundPort : string;
  stPacket : string;
  PastTime : dword;
  stSoundFileName : string;
begin
  Try
    Try
      result := False;
      GetSoundInfo(aNodeNo,aEcuNo,aDoorNo,stSoundIP,stSoundPort);
      if Trim(stSoundIP) = '' then Exit;
      if Not isDigit(stSoundPort) then Exit;
      stSoundFileName := G_stSoundCode[strtoint(aSound)];
      if Trim(stSoundFileName) = '' then exit;
  {    if aSound = '1' then
        stPacket := '@P3unreco~1' + #13#10
      else if aSound = '2' then
        stPacket := '@P3finish1' + #13#10
      else if aSound = '3' then
        stPacket := '@P3thanks' + #13#10;
  }
      stPacket := '@P3' + stSoundFileName + #13#10;
      //SoundClient1 := TClientSocket.Create(self);
      //SoundClient1.OnConnect := SoundClientConnect;
      //SoundClient1.OnDisconnect := SoundClientDisconnect;
      //SoundClient1.OnError := SoundClientError;
      //SoundClient1.OnRead := SoundClientRead;
      //SoundClient.Host := stSoundIP;
      //SoundClient.Port := strtoint(stSoundPort);
      SoundClient2.WsAddress := stSoundIP;
      SoundClient2.WsPort := stSoundPort;
      if L_bOracleLog then LogSave(ExeFolder + '\..\log\oracle' + FormatDateTime('yyyymmdd',now) + '.log','SoundStart' );
      Try
        //SoundClient.Active := True;
        SoundClient2.Open := True;
      Except
        if L_bOracleLog then LogSave(ExeFolder + '\..\log\oracle' + FormatDateTime('yyyymmdd',now) + '.log','SoundError' );
        Exit;
      End;

      PastTime := GetTickCount + 500;
      While Not L_bSoundConnect do
      begin
        if GetTickCount > PastTime then Exit;  //500밀리동안 응답 없으면 실패로 처리함
        Application.ProcessMessages;
      end;

      L_bSoundReply := False;
      //SoundClient.Socket.SendText(UpperCase(stPacket));
      SoundClient2.PutString(UpperCase(stPacket));
      if L_bOracleLog then LogSave(ExeFolder + '\..\log\oracle' + FormatDateTime('yyyymmdd',now) + '.log','SoundSend' );

      PastTime := GetTickCount + 1000;
      While Not L_bSoundReply do
      begin
        if GetTickCount > PastTime then Exit;  //1000밀리동안 응답 없으면 실패로 처리함
        Application.ProcessMessages;
      end;
      result := False;
    Finally
      L_bSoundConnect := False;
      //SoundClient.Active := False;
      //SoundClient1.Free;
      SoundClient2.Open := False;
      if L_bOracleLog then LogSave(ExeFolder + '\..\log\oracle' + FormatDateTime('yyyymmdd',now) + '.log','SoundFinally' );
    End;
  Except
    LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','SoundPlay Error' );
  End;


end;

function TfmMain.GetSoundInfo(aNodeNo, aEcuID, aDoorNo: string;
  var aSoundIP, aSoundPort: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := ' Select * from TB_DOOR ';
  stSql := stSql + ' where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      First;
      aSoundIP := FindField('DO_SOUNDIP').AsString;
      aSoundPort := FindField('DO_SOUNDPORT').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

procedure TfmMain.SoundClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  szBuffer : string;
begin
  inherited;
  szBuffer := Socket.ReceiveText;
  if Pos('!',szBuffer) > 0 then L_bSoundReply := True;
//  Memo1.Lines.Add('RCVDATA:' + szBuffer);

end;

procedure TfmMain.BitBtn1Click(Sender: TObject);
var
  j : integer;
  stPacket : string;
begin
  inherited;
  stPacket := '@P3' + #13#10;
  SoundClient1 := TClientSocket.Create(self);
  SoundClient1.OnConnect := SoundClientConnect;
  SoundClient1.OnDisconnect := SoundClientDisconnect;
  SoundClient1.OnError := SoundClientError;
  SoundClient1.OnRead := SoundClientRead;
  SoundClient1.Host := '192.168.0.12';
  SoundClient1.Port := 502;
  Try
    SoundClient1.Active := True;
  Except
    Exit;
  End;
  for j:= 0 to 1000 do
  begin
    Delay(1000);
    SoundClient1.Socket.SendText(stPacket);
  end;
end;

procedure TfmMain.SoundClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  inherited;
  L_bSoundConnect := True;
  //Memo1.Lines.Add('Connected');
end;

procedure TfmMain.SoundClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  inherited;
  L_bSoundConnect := False;
  //Memo1.Lines.Add('DisConnected');
end;

procedure TfmMain.RcvBarCodeData(Sender: TObject;aBarCode,aNodeNo,aEcuID,aDoorNo,aReaderNo:string);
var
  aDevice : TDevice;
  stBarCode : string;
  cInputType : char;
  cPermit : char;
  cButton : char;
  cAuth : char;
  stInputStr : string;
  stTimeStr : string;
  nCardNoLen : integer;
  stEmCode,stCompanyCode,stJijumCode,stDepartCode,stPosiCode : string;
  stEmName,stCompanyName,stJijumName,stDepartName,stPosiName : string;
  stAuthType : string;
  stSql : string;
  nSCSResult : integer;
begin
  stBarCode := aBarCode;
  Try
    if Length(stBarCode) < 1 then
    begin
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   ERR_PACKET_0001,'바코드데이터:'+aBarCode);
      Exit;
    end;

    stTimeStr:= FormatDateTime('yyyymmddhhnnss',now);

    cInputType:= 'B';
    stInputStr := '바코드';

    cPermit:= 'A';


    stAuthType := '000';

    stSql := CommonSql.InsertIntoTB_ACCEVENT(
                           copy(stTimestr,1,8),
                           copy(stTimestr,9,6),
                           aNodeNo,
                           aEcuID,
                           aDoorNo,
                           stBarCode,
                           aReaderNo,
                           '0',
                           '',
                           cInputType,
                           '',
                           '',
                           cPermit,
                           FormatdateTime('yyyymmddHHMMSS',Now),
                           '',
                           stAuthType
                           );

    DataModule1.ProcessEventExecSQL(stSql);


    {저장}

    aDevice := GetDevice(FillzeroNumber(strtoint(aNodeNo),3) + aECUID);

    nSCSResult := GetSCSAuthentication(stTimestr,aNodeNo,aECUID,aDoorNo,stBarCode,
           stEmCode,stCompanyCode,stJijumCode,stDepartCode,stPosiCode,
           stEmName,stCompanyName,stJijumName,stDepartName,stPosiName);

    cAuth := 'N';//미승인

    //서버 승인코드 업데이트
    if nSCSResult = NOTSERVERCONNECTED then stAuthType := '003' //DB 접속실패승인
    else if nSCSResult = AUTH then stAuthType := '001'          //승인
    else stAuthType := '002';                                   //미승인

    if aDevice = nil then
    begin
      ShowAccessEvent(inttostr(nSCSResult), stAuthType, stTimestr,
      aNodeNo,aECUID,aDoorNo, '0', aBarCode, stEmName,
      stCompanyName, stJijumName, stEmCode,stPosiName);
      Exit;
    end;

    if (nSCSResult = AUTH) then cAuth := 'R';
    if G_nSCSRelayServer = 0 then
    begin
       if (nSCSResult = NOTSERVERCONNECTED) then cAuth := 'R';   //경희대 24시간 열람실은 서버 접속 실패시 문을 열자
    end;

    cButton := '0';
    nSCSResult := aDevice.ServerDoorControl(aReaderNo,aDoorNo,cButton,copy(stBarCode,1,8),cAuth);

    ShowAccessEvent(inttostr(nSCSResult), stAuthType, stTimestr,
        aNodeNo,aECUID,aDoorNo, '0', stBarCode, stEmName,
        stCompanyName, stJijumName, stEmCode,stPosiName)

  Finally

  End;
end;

procedure TfmMain.SoundClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  inherited;
  L_bSoundConnect := False;
  ErrorCode := 0;
 // Memo1.Lines.Add('SocketError!!!');
end;

procedure TfmMain.mn_BarcodeReConnectClick(Sender: TObject);
var
  i : integer;
begin
  if BarCodeList.Count < 1 then Exit;
  Try
    for i:= 0 to BarCodeList.Count - 1 do
    begin
      TdmBarCode(BarCodeList.Objects[i]).BarCodeConnect := False;
      TdmBarCode(BarCodeList.Objects[i]).BarCodeConnected := False;
    end;
  Finally
  End;

end;

procedure TfmMain.mn_SoundClick(Sender: TObject);
begin
  fmSound:= TfmSound.Create(Self);
  fmSound.SHowmodal;
  fmSound.Free;
  Delay(100);
  //바코드 변경 사항 적용
  Action_DaemonRestartExecute(self);

end;

function TfmMain.LoadSoundCode: Boolean;
var
  stSql : string;
  stSoundCode : string;
  stSoundName : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := ' select * from TB_SOUNDCODE  ';

    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      First;
      while not eof do
      begin
        if bApplicationTerminate then Exit;

        stSoundCode := FindField('SO_CODE').asString;
        stSoundName := pchar(FindField('SO_NAME').asString);

        G_stSoundCode[strtoint(stSoundCode)] := stSoundName;
        next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.mn_SoundVolumeSettingClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stIP,stPort,stVolume : string;
begin
  inherited;
  stSql := 'Select * from TB_DOOR ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      First;
      while not eof do
      begin
        if bApplicationTerminate then Exit;
        stIP := FindField('DO_SOUNDIP').AsString;
        stPort := FindField('DO_SOUNDPORT').AsString;
        stVolume  := FindField('DO_SOUNDVOLUME').AsString;
        if stIP <> '' then
        begin
          if isDigit(stPort) then
          begin
            if isDigit(stVolume) then SoundVolumSetting(stIP,stPort,stVolume);
          end;
        end;
        next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.SoundVolumSetting(aIP, aPort, aVolume: string): Boolean;
var
  stPacket : string;
  PastTime : dword;
  stHexVolume : string;
begin
  Try
    result := False;
    if Trim(aIP) = '' then Exit;
    if Not isDigit(aPort) then Exit;
    if Not isDigit(aVolume) then Exit;
    stHexVolume := Dec2Hex(strtoint(aVolume),2);
    stPacket := '@V' + stHexVolume + #13#10;
    SoundClient.Host := aIP;
    SoundClient.Port := strtoint(aPort);
    Try
      SoundClient.Active := True;
    Except
      Exit;
    End;

    PastTime := GetTickCount + 500;
    While Not L_bSoundConnect do
    begin
      if GetTickCount > PastTime then Exit;  //500밀리동안 응답 없으면 실패로 처리함
      Application.ProcessMessages;
    end;

    L_bSoundReply := False;
    SoundClient.Socket.SendText(UpperCase(stPacket));

    PastTime := GetTickCount + 1000;
    While Not L_bSoundReply do
    begin
      if GetTickCount > PastTime then Exit;  //1000밀리동안 응답 없으면 실패로 처리함
      Application.ProcessMessages;
    end;
    result := False;
  Finally
    L_bSoundConnect := False;
    SoundClient.Active := False;
  End;

end;

procedure TfmMain.BitBtn2Click(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i:= 0 to 1000 do
  begin
    SoundPlay('1','00','1','1');
    //memo1.lines.add('Button2:' + inttostr(i));
    Application.ProcessMessages;
  end;

end;

procedure TfmMain.SoundClient2TriggerAvail(CP: TObject; Count: Word);
var
  szBuffer : string;
  I: Integer;
begin
  inherited;
  Try
    for I := 1 to Count do szBuffer := szBuffer + SoundClient2.GetChar;
  Except
    Exit;
  End;
  //szBuffer := Socket.ReceiveText;
  if Pos('!',szBuffer) > 0 then L_bSoundReply := True;
  //Memo1.Lines.Add('RCVDATA:' + szBuffer);

end;

procedure TfmMain.SoundClient2WsConnect(Sender: TObject);
begin
  inherited;
  L_bSoundConnect := True;
  //Memo1.Lines.Add('Connected');

end;

procedure TfmMain.SoundClient2WsDisconnect(Sender: TObject);
begin
  inherited;
  L_bSoundConnect := False;
  //Memo1.Lines.Add('DisConnected');

end;

procedure TfmMain.SoundClient2WsError(Sender: TObject; ErrCode: Integer);
begin
  inherited;
  L_bSoundConnect := False;
  ErrorCode := 0;
  //Memo1.Lines.Add('SocketError!!!');

end;

procedure TfmMain.DefaultHandler(var Message);
begin
  inherited DefaultHandler(Message);
  with Tmessage(message) do
  begin
    if Msg = wmTaskbar then
    begin
      if tbi = nil then
      begin
        tbi := TantTaskbarIcon.Create(self);
      end;
      {사라진 트레이 재생}

      tbi.Visible := False;
      tbi.Visible := True;
    end;
  end;//with

end;

procedure TfmMain.AppException(Sender: TObject; E: Exception);
var
  sObj : string;
  ctrl : TControl;
  Comp : TComponent;
begin
  sObj := '';
  if Sender <> nil then
  begin
    if Sender.InheritsFrom(TControl) then
    begin
      ctrl := TControl(Sender);
      While (ctrl <> nil) do
      begin
        sObj := ctrl.Name + '->' + sObj;
        ctrl := ctrl.Parent;
      end;
    end else if Sender.InheritsFrom(TComponent) then
    begin
      Comp := TComponent(Sender);
      sObj := Comp.Name;
      if (Comp.Owner <> nil) then
      begin
        sObj := comp.Owner.Name + '->' + sObj;
      end;
    end;
  end;
  LogSave(ExeFolder + '\..\log\SCSApplication' + FormatDateTime('yyyymmdd',now) + '.log',sObj);

end;

end.
