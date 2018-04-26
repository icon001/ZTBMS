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
  uDevicemodule, uDataModule1,systeminfos,Registry, FindFile,
  SyncObjs, Buttons,Contnrs, AppEvnts,WinSock,ShellAPI, OleCtrls, SHDocVw  ;

//{$DEFINE TApdWinsockport}
//{$DEFINE TClientSocket}
{$DEFINE TWinSocket}
//{$DEFINE DEBUG}  //

const
  ClientConnectTime = 600000;
  AllSendClientDelayTime = 10;

type
  TCardEmployeeInfo = Class(TComponent)
  private
    FEmName: string;
    FDepartCode: string;
    FEMCode: string;
    FJijumCode: string;
    FAWCode: string;
    FCompanyCode: string;
    FLoadDate: string;
  published
    Property CompanyCode : string read FCompanyCode write FCompanyCode;
    Property JijumCode : string read FJijumCode write FJijumCode;
    Property DepartCode : string read FDepartCode write FDepartCode;
    Property EMCode : string read FEMCode write FEMCode;
    Property EmName : string read FEmName write FEmName;
    Property AWCode : string read FAWCode write FAWCode;
    property LoadDate : string read FLoadDate write FLoadDate;
  end;
{  TDeviceLockState = Class(TComponent)
   private
    EcuID : string;       //Ȯ��� ���̵�
    ConnectState : char;  //00: ����,01:����
    ArmState : string;    //0000:��,0001:���,0010:����,0011:����,0100:Init,0101:Test
    Door1PNMode : string; //00:��,01:Posi,02:Nega
    Door1MangerMode : string; //000:��,001:�,010:����,011:���
    Door1FireState : string;  //0:����,1:ȭ��
    Door1DoorState : string;  //000:��,001:����,010:����,011:��ð�,100:��������,101:��������
    Door1LockState : string;  //000:��,001:���,010:����
    Door2PNMode : string;
    Door2MangerMode : string;
    Door2FireState : string;
    Door2DoorState : string;
    Door2LockState : string;
}

  TClientSendThread = class(TThread)
  private
  protected
    procedure Execute; override;
    procedure ClientSendDataProcess(aData:string) ;
  public
  end;

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
    Timer1: TTimer;
    ConnectTimer: TTimer;
    SendTimer: TTimer;
    RecvTimeCheck: TTimer;
    LogDeleteTime: TTimer;
    DataBaseBackupTimer: TTimer;
    CardAutoDownTimer: TTimer;
    fdmsRelyTimer: TTimer;
    SyncTimer: TTimer;
    DeviceInfoSendTimer: TTimer;
    StateCheckTimer: TTimer;
    SentenceRelayTimer: TTimer;
    sendClientTimer: TTimer;
    FTPSendTimer: TTimer;
    FTPSendProcessChckTimer: TTimer;
    PersonRelayTimer: TTimer;

    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mn_FormHide: TMenuItem;
    N4: TMenuItem;
    mn_Exit: TMenuItem;
    N6: TMenuItem;
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
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
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
    ADOfdmsQuery: TADOQuery;
    HolidaySendTimer: TTimer;
    mn_DBAllBackup: TMenuItem;
    DB_AllRestore: TMenuItem;
    SaveDialog1: TSaveDialog;
    FindFile: TFindFile;
    LogDirectoryDeleteTimer: TTimer;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    FileName_: TEdit;
    Location_: TEdit;
    Subfolders: TCheckBox;
    Phrase: TEdit;
    CaseSenstitive: TCheckBox;
    WholeWord: TCheckBox;
    TabSheet3: TTabSheet;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    CreatedBeforeDate: TDateTimePicker;
    CreatedAfterDate: TDateTimePicker;
    CreatedBeforeTime: TDateTimePicker;
    CreatedAfterTime: TDateTimePicker;
    CBD: TCheckBox;
    CBT: TCheckBox;
    CAD: TCheckBox;
    CAT: TCheckBox;
    TabSheet5: TTabSheet;
    ModifiedBeforeDate: TDateTimePicker;
    ModifiedAfterDate: TDateTimePicker;
    ModifiedBeforeTime: TDateTimePicker;
    ModifiedAfterTime: TDateTimePicker;
    MBD: TCheckBox;
    MBT: TCheckBox;
    MAD: TCheckBox;
    MAT: TCheckBox;
    TabSheet6: TTabSheet;
    AccessedBeforeDate: TDateTimePicker;
    AccessedAfterDate: TDateTimePicker;
    AccessedBeforeTime: TDateTimePicker;
    AccessedAfterTime: TDateTimePicker;
    ABD: TCheckBox;
    ABT: TCheckBox;
    AAD: TCheckBox;
    AAT: TCheckBox;
    TabSheet2: TTabSheet;
    Attributes: TGroupBox;
    System: TCheckBox;
    Hidden: TCheckBox;
    Readonly: TCheckBox;
    Archive: TCheckBox;
    Directory: TCheckBox;
    Compressed: TCheckBox;
    Encrypted: TCheckBox;
    Offline: TCheckBox;
    SparseFile: TCheckBox;
    ReparsePoint: TCheckBox;
    Temporary: TCheckBox;
    Device: TCheckBox;
    Normal: TCheckBox;
    NotContentIndexed: TCheckBox;
    Virtual: TCheckBox;
    FileSize: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    SizeMaxEdit: TEdit;
    SizeMinEdit: TEdit;
    SizeMin: TUpDown;
    SizeMax: TUpDown;
    SizeMinUnit: TComboBox;
    SizeMaxUnit: TComboBox;
    mn_sequencechange: TMenuItem;
    ClientStateCheckTimer: TTimer;
    ClientAckTimer: TTimer;
    ThreadCheckTimer: TTimer;
    PCScheduleTimer: TTimer;
    DeviceSortTimer: TTimer;
    STRTimer: TTimer;
    btnKTTMonitoring: TToolButton;
    btnDDNSMonitoring: TToolButton;
    mn_kttCodeAdmin: TMenuItem;
    RestartTimer: TTimer;
    AttendADOTemp: TADOQuery;
    StateSendTimer: TTimer;
    CardDownLoadADOQuery1: TADOQuery;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    ClientDBSocketClearTimer: TTimer;
    JavarScheduleTimer: TTimer;
    mn_InOutGroupCode: TMenuItem;
    GroupPermitTimer: TTimer;
    FaceCopRelayTimer: TTimer;
    N40: TMenuItem;
    Memo1: TMemo;
    DBProcessTimer: TTimer;
    ApplicationEvents1: TApplicationEvents;
    CardLoadTimer: TTimer;
    mn_GlobalAntiPass: TMenuItem;
    mn_AntipassCode: TMenuItem;
    mn_AntipassDoor: TMenuItem;
    LogServerTimer: TTimer;
    FoodTimer: TTimer;
    DeviceInfoSearch: TTimer;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    WebRelayTimer: TTimer;
    ModBusServer: TDXServerCore;
    ModBusQue: TDXUnicastDataQueue;
    CheckKTTSenderTimer: TTimer;
    CheckFPSystemTimer: TTimer;
    DeviceLoadTimer: TTimer;
    ValidExpiredTimer: TTimer;
    mn_HolidayReSend: TMenuItem;
    CardDeleteTimer: TTimer;
    DaemonStateCheckTimer: TTimer;
    RelayEmployeeServer: TDXServerCore;
    RelayEmployeeQueue: TDXUnicastDataQueue;
    RelayControlTimer: TTimer;
    mn_JNHospital: TMenuItem;
    CardDownLoadCheckTimer: TTimer;
    procedure miExitClick(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miShowClick(Sender: TObject);
    procedure bt_HideClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mn_FormHideClick(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure Action_PWChangeExecute(Sender: TObject);
    procedure Action_DaemonStartExecute(Sender: TObject);
    procedure Action_CurrentStateExecute(Sender: TObject);
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
    procedure LogDeleteTimeTimer(Sender: TObject);
    procedure DataBaseBackupTimerTimer(Sender: TObject);
    procedure RecvTimeCheckTimer(Sender: TObject);
    procedure CardAutoDownTimerTimer(Sender: TObject);
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
    procedure fdmsRelyTimerTimer(Sender: TObject);
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
    procedure SentenceRelayTimerTimer(Sender: TObject);
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
    procedure FTPSendTimerTimer(Sender: TObject);
    procedure FTPSendProcessChckTimerTimer(Sender: TObject);
    procedure FTP1Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure PersonRelayTimerTimer(Sender: TObject);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);
    procedure DaemonRestartTimerTimer(Sender: TObject);
    procedure FireDoorOpenTimerTimer(Sender: TObject);
    procedure EST1Click(Sender: TObject);
    procedure DoorAllOpenTimerTimer(Sender: TObject);
    procedure HolidaySendTimerTimer(Sender: TObject);
    procedure mn_DBAllBackupClick(Sender: TObject);
    procedure LogDirectoryDeleteTimerTimer(Sender: TObject);
    procedure FindFileFolderChange(Sender: TObject; const Folder: String;
      var IgnoreFolder: TFolderIgnore);
    procedure FindFileFileMatch(Sender: TObject;
      const FileInfo: TFileDetails);
    procedure mn_sequencechangeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ClientStateCheckTimerTimer(Sender: TObject);
    procedure ClientAckTimerTimer(Sender: TObject);
    procedure ThreadCheckTimerTimer(Sender: TObject);
    procedure PCScheduleTimerTimer(Sender: TObject);
    procedure DeviceSortTimerTimer(Sender: TObject);
    procedure STRTimerTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnKTTMonitoringClick(Sender: TObject);
    procedure CommandArrayCommandsTKTTMONITORINGExecute(Command: TCommand;
      Params: TStringList);
    procedure btnDDNSMonitoringClick(Sender: TObject);
    procedure CommandArrayCommandsTDDNSMINITORINGExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTMONITORINGSTATEExecute(
      Command: TCommand; Params: TStringList);
    procedure mn_kttCodeAdminClick(Sender: TObject);
    procedure CommandArrayCommandsTRESTARTExecute(Command: TCommand;
      Params: TStringList);
    procedure RestartTimerTimer(Sender: TObject);
    procedure StateSendTimerTimer(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure ClientDBSocketClearTimerTimer(Sender: TObject);
    procedure JavarScheduleTimerTimer(Sender: TObject);
    procedure mn_InOutGroupCodeClick(Sender: TObject);
    procedure GroupPermitTimerTimer(Sender: TObject);
    procedure FaceCopRelayTimerTimer(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure DBProcessTimerTimer(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure CardLoadTimerTimer(Sender: TObject);
    procedure mn_AntipassCodeClick(Sender: TObject);
    procedure mn_AntipassDoorClick(Sender: TObject);
    procedure LogServerTimerTimer(Sender: TObject);
    procedure FoodTimerTimer(Sender: TObject);
    procedure DeviceInfoSearchTimer(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure WebRelayTimerTimer(Sender: TObject);
    procedure ModBusServerNewConnect(ClientThread: TDXClientThread);
    procedure CheckKTTSenderTimerTimer(Sender: TObject);
    procedure CheckFPSystemTimerTimer(Sender: TObject);
    procedure DeviceLoadTimerTimer(Sender: TObject);
    procedure ValidExpiredTimerTimer(Sender: TObject);
    procedure mn_HolidayReSendClick(Sender: TObject);
    procedure CardDeleteTimerTimer(Sender: TObject);
    procedure DaemonStateCheckTimerTimer(Sender: TObject);
    procedure RelayEmployeeServerNewConnect(ClientThread: TDXClientThread);
    procedure RelayControlTimerTimer(Sender: TObject);
    procedure mn_JNHospitalClick(Sender: TObject);
    procedure CardDownLoadCheckTimerTimer(Sender: TObject);
  private
    //Component ����
    MonitorSERVER: TDXServerCore;
    FNowDate: string;
    FFoodCurrentWeekDay: integer;
    FFoodCurrentSemesterCode: integer;
    FFoodCurrentFoodCode: string;
    FPositiveMode: TDoorPNMode;
    Function FileToDBLoad:Boolean;
    Function FileToDBInsertAlarmEvent(aFileName:string):Boolean;
    Function FileToDBInsertCardAccessEvent(aFileName:string):Boolean;
    procedure SetNowDate(const Value: string);
    procedure SetFoodCurrentWeekDay(const Value: integer);
    procedure SetFoodCurrentSemesterCode(const Value: integer);
    procedure SetFoodCurrentFoodCode(const Value: string);
    procedure SetPositiveMode(const Value: TDoorPNMode);

  private
    FClientReceive : TCriticalSection;
    FClientSender : TCriticalSection;
    FStateCheckTCS : TCriticalSection;

    procedure WinSockAccept(Sender: TObject;socket: tSocket;aConnectIP:string;aConnectPort:integer);
    procedure WinSockDisConnect(Sender: TObject;socket: tSocket);
    procedure WinSockReadEvent(Sender: TObject;socket: tSocket);
    procedure WinSockStop(Sender: TObject;socket: tSocket);
    procedure WinSockNodePacket(Sender: TObject;  aSocket : tSocket;aMcuID,ClientIP,ReceiveData: string);
    procedure WinSockNodeDisConnect(Sender: TObject;  aSocket : tSocket;aMcuID:string);

  private
    //�޸� ����
    L_bAllDoorOpen : Boolean;  //��ü ������...
    L_bCardDownLoad: Boolean; //ī�� �ٿ�ε� ����
    L_bClose : Boolean;          //���� �޴� Ŭ����
    L_bDaemonStart : Boolean;    //������ Start �� ����
    L_bDaemonStop : Boolean;     //���� ����
    L_bDaemonRestart : Boolean;  //���� �������
    L_bDataBaseBackup : Boolean; //DataBase Backup
    L_bDBProcessTimerStart : Boolean; //
    L_bDeviceLoading : Boolean;  // ��� �ε����̴�.
    L_bFireAllOpen : Boolean; //ȭ��� ��ü��������
    L_bFierDoorOpen : Boolean;   //ȭ��߻��� ���� ���Թ� ����
    L_bFireRecoverUse : Boolean; //ȭ����ü���� �������
    L_bFormActive : Boolean;     //Form �� Active �� ���¿����� �����ϴ� ��ƾ�� �ִ� ��� ���
    L_bFTPSendProcess : Boolean;  //FTP �ٿ�ε� ���ΰ��
    L_bFtpSendCheck : Boolean;    //FTP �ٿ�ε� ������ üũ
    L_bHolidayChange : Boolean;
    L_bLogined : Boolean;
    L_bNotDeviceStateCheck : Boolean; //State Not Check
    L_bPositiveLog : Boolean;
    L_bProcessStateCheckII : Boolean; //����Ȯ�� II ��...
    L_bProcessStateCheckIII : Boolean; //����Ȯ�� III ��...
    L_bProcessStateCheckIV : Boolean; //����Ȯ�� III ��...
    L_bRelaySentenceUse:Boolean;//���������������
    L_bRelaySCardNoUse:Boolean; //ī���ȣ��������
    L_bRelaySCardStateUse:Boolean; //ī����¿�������
    L_bRelaySChangeStateUse:Boolean; //������¿�������
    L_bRelaySCompanyCodeUse:Boolean; //ȸ���ڵ忬������
    L_bRelaySEmpNameUse:Boolean; //�����Ī��������
    L_bRelaySEmpNoUse:Boolean; //�����ȣ��������
    L_bRelaySentenceSendResult : Boolean; //�����۽��� ���
    L_bRelaySSerialUse:Boolean; //�Ϸù�ȣ��������
    L_bSendDeviceInfo : Boolean;  //Device Info �۽� ��...
    L_bShowCardServerState : Boolean; //ī�弭�� �ۼ��� ��Ȳ��ȸ ����
    L_bShowCurrentState : Boolean;   //�ǽð� �ۼ��� ��Ȳ��ȸ ����
    L_bShowDeviceSetting : Boolean;  //��⼳�� ȭ��
    L_bShowReaderSetting : Boolean;  //���� ���� ȭ��
    L_bShowKttMonitoring : Boolean;
    L_bShowDDNSMonitoring : Boolean;
    L_bShowMonitoringState : Boolean;
    L_bSTRDataSending : Boolean;     //ServerToRegist
    L_bSendClientSequence : Boolean;  //Ŭ���̾�Ʈ ���� ����
    L_bRestartingTimer : Boolean;
    L_bValidExpiredChecking : Boolean;  //��ȿ�Ⱓ üũ
    L_bWebComplete : Boolean;
    L_nConnectCount : integer;
    L_nOldDBSocketSeq : integer;
    L_nRelayDoorDelayControlTime : integer; //������ ���� ���ð� 

    L_arrayNodeState: array [0..NODECOUNT] of integer;
    L_nMaxNodeNo : integer;           //�ִ� ��� ��ȣ 

    L_nCardAckCount : Integer;  //ī�� ���� �Ǽ�
    L_nCardSendCount : Integer; //ī�� �۽� �Ǽ�
    L_nDataBaseBackupCycle : integer; //��� ����Ŭ
    L_nDaemonAccecptClientCount : integer;    //���󼭹��� ������ �� �ִ� Ŭ���̾�Ʈ ����(�̻��)
    L_nDeviceInfoSearchNo : integer;         
    L_nDeviceServerPort1 : integer;           //��⺰ ������Ʈ 1
    L_nDeviceServerPort2 : integer;           //��⺰ ������Ʈ 2
    L_nDeviceServerPort3 : integer;           //��⺰ ������Ʈ 3
    L_nEventdeleteAccessDay : integer;     //���� �̺�Ʈ ������ �����ϼ�
    L_nEventdeleteAttendDay : integer;     //���� �̺�Ʈ ������ �����ϼ�
    L_nEventdeleteDaemonLogDay : integer; //�α� ������ ������ �����͸� ����������
    L_nEventdeleteFoodDay: integer;        //�ļ� �̺�Ʈ ������ �����ϼ�
    L_nEventdeletePatrolDay : integer;     //��� �̺�Ʈ ������ �����ϼ�
//    L_nFdmsCardLength : integer;           //������������ ī�����
    L_nFoodDayLimitCount : integer;        //���� �ļ� ���� Ƚ��
    L_nFoodWeekLimitCount : integer;       //�ֺ� �ļ� ���� Ƚ��
    L_nFoodSemesterLimitCount : integer;   //�б⺰ �ļ� ���� Ƚ��
    L_nFoodDupEvent : integer;          //�ļ� �ߺ� �̺�Ʈ �߻� ����
    L_nKTTControlServerAlarmEventCount : integer; //���� ���� ���� �˶� ī����
    L_nThreadRestartCount : integer;
    L_nSendClientTimer : integer;  //Ŭ���̾�Ʈ ���� Ÿ�̸�

    L_stAttendServerPort : string;             //���¼��� Port
    L_stClientComBuff : string;
    L_stCONTROLPort : string;                  //������Ʈ
    L_stDaemonLogFullData : string;            //ACK ������ ���� �α� ���������(�̻��)
    L_stDaemonServerIP : string;               //���󼭹� IP
    L_stDaemonServerPort : string;             //���󼭹� Port
    L_stDataBaseAutoBackup : string;  //�ڵ���� �������
    L_stDataBaseBackupDir : string;   //��� ���丮
    L_stDataBaseBackupTime : string;  //��� ���� �ð�
    L_stDataBaseLastBackupDate : string; //������ ��� �ð�
    L_stDeviceSortDate : string; //��� ��Ʈ ���� �ð�
    L_stEventPort : string;                    //�̺�Ʈ��Ʈ(������)
    L_stFaceCopPort : string;
    L_stFaceCopDBName : string;
    L_stFaceCopUserID : string;
    L_stFaceCopUserPW : string;
    L_stFireStatus : string;                   //ȭ�簨�����°�
    L_stFoodServerPort : string;               //�ļ�������Ʈ
    L_stFTPServerPort : String;                //FTP���� ��Ʈ
    L_stLogDirectory : string;                 //�α� ����� ��� �α� ���丮
    L_stRelayDelimiter:string; //���������õ����ͱ�����
    L_stRelaySentenceSendData:string; //���������� �۽ŵ�����
    L_stRelaySentenceServerIP:string;//���� ���� IP
    L_stRelaySentenceServerPort:string;//���� ���� Port;
    L_stSendHolidayYear : String;      //Holiday Send Year
    L_stStatePort : string;                    //���� ��Ʈ(������)
    L_stLongTimeState : string;        //��ð� ���� ��ȣ �̺�Ʈ �߻��� �ڵ�
    L_stFoodYesterDayTime : string;          //�ļ� ���� ��¥


  public
    ClientCommunication : TClientCommunication; //Client Packet �׾� ���� ��
    ClientSenderThread :TClientSendThread;
    ClientReceiveThreadTime : dword;
    ClientSendThreadTime : dword;
    
    dtDaemonLogDeleteTime : TDateTime; //���� �α� ���� �ð�
    dtDBBackupTime : TDateTime;  //������ ���̽� ��� ���� �ð�
    dtSyncTime : TDateTime;   //Time Sync �ð�
    dtRelayEmployeeSuccessTime : TDateTime; //�������� ���� ���� �ð�
   
    procedure  AppException( Sender:  TObject;  E:  Exception) ;
  private
    //StringList ����
    AccessEventList : TStringList;
    AlarmEventList : TStringList;
    ATEventList : TStringList;
    ArmAreaRelayModeList : TStringList;  //������� ���� ��� ����Ʈ
    CardEmployeeInfoList : TStringList;
    ClientReceiveDataList : TStringList;
    ClientSendList : TStringList;  //Ŭ���̾�Ʈ�� ���� �۽� ����Ʈ
    FireBreakGubunList : TStringList; //ȭ��߻� ����Ʈ
    FireDoorOpenList : TStringList; //ȭ��� ������ ��� ����Ʈ
    FoodConfigCodeList : TStringList; //�ļ� �ڵ� ����Ʈ
    FoodConfigStartList : TStringList; // �ļ��ڵ� ���۽ð�
    FoodConfigEndList : TStringList;  //�ļ��ڵ� ���� �ð�
    FoodEventList : TStringList;
    FoodServerEmployeeList : TStringList; //�ļ������� ���� �����������Ʈ
    HolidaySendDeviceList : TStringList;   //������ ���� ��⸮��Ʈ
    RelayControlDoorList : TStringList; //�������� ���Թ� ����Ʈ
    StateCheckList : TStringList;
    STRSendList : TStringList;       //STRTimer �� ���� ������ ����
    WorkTypeList : TStringList;      //�ٹ�ȯ��Ÿ�Կ� ���� �����
    NodeStateList : TStringList;     //��庰 ���¸� ��� �ִ� ����Ʈ
    L_arrHolidayList : array[1..12] of string;    //HolidayList


  private
    //ȯ����ȸ �� ����
    Function  GetAlarmConfig : Boolean;
    Function  GetAttendConfig : Boolean;
    Function  GetCardConfig : Boolean;
    Function  GetDaemonConfig : Boolean;
    Function  GetDaemonLogConfig : Boolean;
    Function  GetDataBaseConfig : Boolean;
    procedure GetFireConfig;
    Function  GetFoodConfig(aInit:Boolean=True) : Boolean;
    Function  GetFoodCurrentCode(aTime:string) : string;
    Function  GetFoodCurrentSemesterCode(aDate:string) : integer;
    Function  GetKTTControlConfig : Boolean;
    Function  GetMCUCommonConfig : Boolean;
    procedure GetMonitoringTypeConfig;
    Function  GetMultiDaemonConfig(var aDaemonServerIP,aDaemonServerPort,aAttendServerPort,aFoodServerPort,aFTPServerPort:string):Boolean;
    Function  GetPostGresqlBin : string; //PostgreSql �����ͺ��̽� ��ġ ���丮
    procedure GetRelayConfig;
    Function  GetSentenceRelayConfig:Boolean;
    Function  GetEmployeeInfoFromOper(aCardNo:string;var aCompanyCode,aEmCode:string):Boolean;
    Function  GetSonghoConfig:Boolean;

    procedure WritingDaemonConfig;
    procedure WorkTypeListClear;   //���� Ÿ�� Clear
    procedure FoodTimeSetting;
    procedure EmployeeValidDateToExpired;  //��ȿ�Ⱓ ���� ��� ���� ����
    procedure EmployeeExpireChangeToValid; //��ȿ�Ⱓ �þ ��� ���� ����
    procedure EmployeeCardValidateStart(aCompanyCode,aEmCode:string); //��ȿ�Ⱓ ���� �Ȱ��
    procedure EmployeeCardValidateStop(aCompanyCode,aEmCode:string);
  private
    //������ ��ȸ
    function  GetAlarmNo(aNodeNo, aEcuID:string):integer; //������
    Function  GetCheckFoodPermit(aYear,aMonth,aDay,aFoodCode,aCardNo:string):char;
    Function  GetSendHolidayYear:string;  //������ ���� ���
    Function  GetStatusCode(aStatus:string;var aAlarmView,aAlarmSound,aAlarmGrade:string):Boolean;
    function  GetSystemDelayInfo(aNodeNo, aEcuID:string;var nInDelay,nOutDelay:integer):Boolean;
//    Function  GetUpdateAttendType(aATDate,aNowTime,aCompanyCode,aEMCode:string;dtYesterDay:TDatetime):string;
  public
    Function  GetCardDownLoadData(aCardNo,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,aUseAccess,aUseAlarm,
              aAlarm0,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8,aTimecode,aValidDate,func,
              aTIMECODEUSE,aTCGROUP,aTIME1,aTIME2,aTIME3,aTIME4,aTCWEEKCODE,aMaster,aWorkType,aCardGubun:String;aPositionNum:integer = 0;
              aCardPosition:Boolean = False;aCardFixType:integer=-1):string;
    Function  GetDevice(aDeviceNO:String):TDevice;    //Device ��ȣ�� Device ��ü�� ã�� Function
    Function  GetDoorNowScheduleMode(a1Time,a1Mode,a2Time,a2Mode,a3Time,a3Mode,
                                     a4Time,a4Mode,a5Time,a5Mode,aTime:string):string; //���� ������ ��带 �������� �Լ�
    function  GetDoorTime(aDoorControlTime:char):string;
    Function  GetNodeNoFromMCUID(aMcuID:string):integer;  //MCUID�� ����ȣ�� ã�´�
  private
    FLogined: Boolean;
    //������ �Լ�
    Function  AdoConnectCheck:Boolean;
    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    Procedure MDIChildShow(FormName:String);
    Function  MDIForm(FormName:string):TForm;
    procedure RealDataShow(aIp,aECUID,aGubun,aCmd,aData:string;aNodeno:integer);    //�ǽð� �ۼ��� ���� Ȯ��
    procedure SetLogined(const Value: Boolean);
    procedure SetVisibleMenue;

    procedure CriticalSectionCreate;
    procedure CriticalSectionFree;
    procedure MemoryInitialize;
    procedure StringListCreate;
    procedure StringListClear;
    procedure StringListFree;
    procedure MultiSocketInitialize;
    procedure MultiSocketFree;
    procedure TimerFree;
  private
    //��� �۾�
    Function DataBaseBackup(bFull:Boolean):Boolean;       //��� �޴� Ŭ�� �� ���� ��
    Function FileDataBaseBackup(bFull:Boolean):Boolean;   //��ġ�� ���
    Function CreateBackupInfo(aBackupini:string):Boolean; //��� ���丮 ����
    Function PGAllDataBackup(aBackupDir:string):Boolean;  //PostGresql �����ͺ��̽� ���
    Function MSSQLAllDataBackup(aBackupDir:string):Boolean;
    Function MDBAllDataBackup(aBackupDir:string):Boolean;
    Function PGTableLayoutCreate(aBackupDir,aTableName:string):Boolean;
    Function MSSQLTableLayoutCreate(aBackupDir,aTableName:string):Boolean;
    Function TableFileBackup(aBackupDir,aTableName:string):Boolean;
    Function FileDBRestor(aImportFileName:string):Boolean;
    Function DeleteRestoreTable(aTable:string):Boolean;
    Function MSSQLDBBackup(bFull:Boolean):Boolean;
    Function MDBBackup:Boolean;
    Function MSSQLLOMOSTOFILE:Boolean;
    Function MSSQLEVENTTOFILE(bFull:Boolean):Boolean;

    Function DeleteEventTable :Boolean; //��� �Ϸ� �� Event Table ����
    //��ġ �۾�
    procedure DBLogLoad;
    procedure PCScheduleStart;
    procedure GroupPermitToEmCode;
    procedure EmCodeToGroupPermit;
    function EmployeeGroupCodeDelete(aGroupPermitCode:string):Boolean;
    function FaceCopRelayStart1:Boolean;
    function FaceCopRelayStart2:Boolean;
    function FacecopGetEmployee(aEmCode,aRegType,aCardNo,aEmName,aJijumName,aDepartName,aPosiName,aHandPhone,aHomePhone,aJoinDate,aExpireDate:string):Boolean;
    function GroupPermitCodeToEmployeeApply(aGroupPermitCode:string):Boolean;
    function CopyCardToGroupPermit(aCardNo,aGroupPermitCode:string):Boolean;
    function UpdateTB_DEVICECARDNOExistCardGroupCode(aCardNo,aGroupPermitCode:string):Boolean;
    function InsertTB_DEVICECARDNONotExistCardGroupCode(aCardNo,aGroupPermitCode:string):Boolean;
    function UpdateTB_DEVICECARDGROUPCODE_Apply(aGroupPermitCode,aOldApply,aNewApply:string):Boolean;
    function UpdateTB_EMPLOYEE_Apply(aCompanyCode,aEmCode,aOldApply,aNewApply:string):Boolean;
  private
    //PC �� ���
    procedure MonitorServerStart(ServerPort:integer);
    procedure MonitorServerStop;
    procedure MonitorAlarmRefresh;

    procedure BroadCastMonitorClient(aData:string); //A PC���� ��ü PC�� ��ε� ĳ��Ʈ... ����͸� ��Ҵ��� üũ


    procedure Process_DeviceSTATECHECK(aDeviceID:string);
    procedure Process_DeviceAllState_II_MemorySave;
    procedure Process_DeviceAllState_II_CheckSend;
    procedure Process_DeviceAllState_III_MemorySave;
    procedure Process_DeviceAllState_III_CheckSend;
    procedure Process_DeviceAllState_IV_MemorySave;
    procedure Process_DeviceAllState_IV_CheckSend;
    procedure GetNodeStateCheck;
    procedure ProcessNodeStateCheck(aNodeNo:integer);
    function NodeStateListDelete(aIndex:integer):Boolean;
    function NodeStateListClear:Boolean;

    procedure RcvFromATClient(aClientIP,ast:string);   //Ŭ���̾�Ʈ���� ���ŵ� ���µ����� ó��
    procedure RcvFromFDClient(aClientIP,ast:string);   //Ŭ���̾�Ʈ���� ���ŵ� ���µ����� ó��
    procedure RcvFromFirmWareClient(aClientIP,ast:string); //�߿���� ���ŵ� ������ ó��
    procedure RcvCardReaderServer(aClientIP,ast:string);
    procedure RcvFromClient(aClientIP,ast:string);   //Ŭ���̾�Ʈ���� ���ŵ� ������ ó��
    function RcvFromModBusClient(aClientIP,aReadData:string):string;  //������ ��� �������� ����
    function GetModeBusAlarmStatus(aNodeNo,aStartEcuID,aEndCount:integer):string;

    Function SendClientData(aSendData : string;aDirect:Boolean=False):Boolean;
    Function SendSettingData(aSendData : string):Boolean;
    Function ControlSendData(aSendData: string):Boolean;
    procedure ATSendClientData(Sender:TObject;aData : string;NodeNo:integer);
    Function FDSendClientData(stData : string):Boolean;

    procedure NodeStateAllCheckSend;
    procedure DeviceStateAllCheckSend;
    procedure AlarmStateAllCheckSend;
    procedure DoorStateAllCheckSend;
    procedure AllStateCheck(aData:string); //��ü���� üũ��

    procedure ClientSenderProcessStart;   //Ŭ���̾�Ʈ �۽� ������ ����
    procedure ClientSenderProcessStop;    //Ŭ���̾�Ʈ �۽� ������ ����

    procedure do_ClientProcessPacket(AThread: TIdPeerThread;aPacket:string);
    Function  CaseSendClientData(stData : string;AThread: TIdPeerThread):Boolean;
  private
    procedure MonitorEventData(Sender:TObject;aGubun,aIP,aData,aTemp4 : string);

  private
    procedure KTTEventData(Sender:TObject;aGubun,aIP,aState,aTemp4 : string);
    procedure DDNSEventData(Sender:TObject;aGubun,aIP,aState,aTemp4 : string);
  public
    //*****************************************
    //�ش� APPLICATION �� ����ϱ� ���� �Լ�
    //*****************************************
    procedure CaseNodeStateAllCheckSend(AThread: TIdPeerThread);  //�����忡�� ����ϴ� �Լ�
    procedure CaseDeviceStateAllCheckSend(AThread: TIdPeerThread);
    procedure CaseAlarmStateAllCheckSend(AThread: TIdPeerThread);
    procedure CaseDoorStateAllCheckSend(AThread: TIdPeerThread);

  private
    //Table Insert,Update,Delete
    Function InsertTB_ALARMEVENT(aTime,aNodeNo,aEcuID,aMsgNo,
                      aSubClass,aSubAddr,aZoneCode,aMode,aPortNo,
                      aStatus,aState,aOper,aNewStateCode,aAlarmView,
                      aAlarmSound,aAlarmGrade,aCheckOk,aCardNo,aCompanyCode,aEmCode:string):Boolean;
    Function InsertTB_ALARMSHOW(aNodeNo,aEcuID,aSubClass,aSubAddr,
                          aZoneCode,aPortNo,aStatus,aMode,
                          aDate,aTime,aMsgNo,aState,aOper,
                          aCheckOk,aCheckMsg,aUpdateOper:string):Boolean;
    Function InsertTB_FTPLIST(aNodeNo,aEcuID,aFileName,aSendStatus:string):Boolean;
    Function InsertTB_INOUTGROUPLIST(aInOutGroupCode,aCardNo,aNodeNo,aEcuID,aReaderNo,aTime:string):Boolean;
    Function InsertTB_SENSOREVENT(aTime,aNodeNo,aEcuID,aMsgNo,
                      aSubClass,aSubAddr,aZoneCode,aMode,aPortNo,
                      aStatus,aState,aOper:string):Boolean;
    Function InsertTB_SERVERCARDRELAYHIS(aDate,aRelayNo,aCardData,aClientIP:string):Boolean;

    function UpdateTB_DEVICESCHEDULE_Ack(aNodeNo,aEcuID,aDoorNo,aDayCode,aAck:string):Boolean;
    function UpdateTB_DOOR_Info(aNodeNo,aEcuID,aDoorNo,aDoorType,aControlTime,aSchUse,aFire,aOpenMoni,aSendDoor,
                               aAlarmLong,aDsOpen,aRemoteDoor,aRcvAck:string):Boolean;
    function UpdateTB_DOOR_Ack(aNodeNO,aEcuID,aDoorNo,aAck:string):Boolean;
    function UpdateTB_DOOR_MEMLOAD(aNodeNO,aEcuID,aDoorNo,aMemload:string):Boolean;
    function UpdateTB_DOOR_State(aNodeNo,aECUID,aDoorNo:string;aManageType,aPNType,aDoorState:string):Boolean;
    Function UpdateTB_FTPLIST_Cancel(aNodeNo,aEcuID:string):Boolean;
    Function UpdateTB_FTPLIST_FileName(aNodeNo,aEcuID,aFileName,aSendStatus:string):Boolean;
    Function UpdateTB_FTPLIST_Per(aNodeNo,aEcuID,aPer:string):Boolean;
    Function UpdateTB_FTPLIST_RetryCountAdd(aNodeNo,aEcuID:string):Boolean;
    Function UpdateTB_FTPLIST_RetryCountClear(aNodeNo,aEcuID:string):Boolean;
    Function UpdateTB_FTPLIST_State(aNodeNo,aEcuID,aState:string):Boolean;
    Function UpdateTB_INOUTCOUNT_Add(aDate,aNodeNo,aECUID,aDoorNo,aInOutCount:string):Boolean;
    Function UpdateTB_INOUTGROUPLIST(aInOutGroupCode,aCardNo,aNodeNo,aEcuID,aReaderNo,aTime:string):Boolean;
    Function UpdateTB_JAVARASCHEDULE_Ack(aNodeNo,aEcuID,aAck:string):Boolean;
    Function UpdateTB_PROTRAMID_Visible(aCode,aValue:string):Boolean;
    function UpdateTB_READER_Ack(aNodeNO,aECUID,aReaderNo,aAck:string):Boolean;
    function UpdateTB_READER_Info(aNodeNo,aEcuID,aReaderNo,aReaderUse,aDoorPosi,aDoorNo,aBuildPosi,aSendAck:string):Boolean;
    function UpdateTB_TIMECODEDEVICE_Ack(aNodeNo,aEcuID,aTimeGroup,aOldAck,aAck:string):Boolean;
    function UpdateTB_TIMECODEDEVICE_AckAllGroup(aNodeNo,aEcuID,aOldAck,aAck:string):Boolean;
    function UpdateTB_ZONEDEVICE_Ack(aNodeNo,aEcuID,aPortNo,aAck:string):Boolean;
    function UpdateTB_ZONEDEVICE_Info(aNodeNo,aEcuID,aPortNo,aAlarmType,aRecoverType,aDelayUse:string):Boolean;

    Function DeleteTB_LOWDATA(aDate:string):Boolean;
    Function DeleteTB_INOUTGROUPLIST(aInOutGroupCode,aCardNo:string):Boolean;

  private
    //Table Search
    Function CheckTB_FTPLIST(aNodeNo,aEcuID:string):Boolean;
    Function CheckTB_INOUTCOUNT(aDate, aNodeNo, aECUID, aDoorNo:string):Boolean;
    Function DupCheckTB_ALARMEVENT(aTime,aNodeNo,
                        aEcuID,aMsgNo:string):Boolean;
    Function DupCheckTB_AlarmShow(aNodeNo,
                                  aEcuID,
                                  aSubClass,
                                  aSubAddr,
                                  aZoneCode,
                                  aPortNo,
                                  aStatus:string):Boolean;
    Function CheckCardDownloadCount : integer;
    Function MemoryCardGradeCheck(aCardNo,aNodeNo,aECUID,aDoorCheckNo,aPermit,aValidDate:string):integer;
    Function MemoryCardEmployeeInfoCheck(aCardNo:string;var aCompanyCode,aEMCode,aJijumCode,aDepartCode,aEmName,aAWCode:string):integer;
    Function MemoryCardLoad : Boolean;
  public
    //������ üũ
    Procedure Check_AlarmSTATE(aDeviceID:string;aAllCheck:Boolean=TRUE); //�������Ȯ��
    procedure Check_DEVICEALARMSTATE(aDeviceID:string); //��⺰ �������
    procedure Check_DeviceSkill(aDeviceID:string); //�� ����� ��� ����
    procedure Check_DeviceVersion(aDeviceID:string);// �� ����� ���� ���� üũ
    Procedure Check_DoorState(aDeviceID:string); //����Ȯ�� ���� ����
    function  Check_STRRespose(aCheckData:string;aDelay:integer):Boolean;
    Function  Check_JavaraOpen(aNodeNo,aEcuID,aDoorNo:string):Boolean; //�ڹٶ� Open ��� ���� ���� üũ
    Function  Check_JavaraClose(aNodeNo,aEcuID,aDoorNo:string):Boolean; //�ڹٶ� Open ��� ���� ���� üũ
    Function  Check_HolidayClear(aNowYear:string):Boolean; //�⵵�� ���� �Ǹ� Ư���� Clear �� �����ؾ� �Ѵ�. �������� ���� ��Ʈ�ѷ��� ������ �ؾ� �ȴ�.
    Function  Check_HolidayDevice:Boolean; //Holiday �ٿ�ε� ���� ���� ��Ⱑ �ִ��� üũ
    Function  Search_PortState(aDeviceID:string):Boolean;
    Function  Search_ZoneExtendPortState(aDeviceID:string):Boolean;

    procedure Process_STRReceive(aCheckData:string); //STR ��� ������ ���� ó��

    Procedure Control_AlarmModeChange(aDeviceID,aMode:string); //����� ����
    Procedure Control_DeviceReboot(aDeviceID:string); //��� �����
    procedure Control_DeviceFireRecovery(aDeviceID:string); //ȭ�纹��
    procedure Control_DoorAllOpenMode; //��ü�����庯��
    Procedure Control_DoorModeChange(aDeviceID:string;aMode:Char); //���Թ� ������ ����
    procedure Control_POSINEGAModeChange(aDeviceID:string;aMode:Char);//Posi'0',Nega'1'
    Procedure Control_DoorOpen(aDeviceID:string); //���Թ� ���� ���� ����
    procedure Control_MemoryClear(aNodeNo,aEcuID:string); //�޸� ����
    procedure Control_ScheduleDoorModeChange(aDeviceID:string;aMode,aSchUse:Char);
    procedure DaemonArmAreaState(aDeviceID:string);    //���󿡼� ������� ����

  public
    procedure STRDataSend; //����� ���� ������ �ε�
    Procedure CardNoDownload(NodeNo:integer;aECUID:String;aAllSend:Boolean); //ī�嵥���� �ٿ�ε�

    function  Send_CardReaderSetting(aNodeNo:integer;aEcuID,aCardReaderNo:string):Boolean;  //ī�帮�� ��� ������ �ε�
    function  Send_CardReaderType(aNodeNo:integer;aEcuID:string):Boolean; //ī�帮�� Ÿ�� ������ �ε�
    procedure DeviceHolidayClear(aDeviceID:string=''); //Ư���� ������ ����
    procedure HolidayListDataCreate(aYear:string);
    Procedure Send_DeviceHoliday(aYear:string); //������ ������ �ٿ�ε�
    function  Send_DoorScheduleInfo : Boolean;  //���Թ� ������ ������ ����
    function  Send_DoorSetting(aNodeNo:integer;aEcuID,aDoorNo:string):Boolean; //���Թ� ������ �ε�
    function  Send_EcuType(aNodeNo:integer):Boolean;       //��Ʈ�ѷ� Ÿ���� �ε�
    function  Send_JaejungDelay(aNodeNo:integer;aEcuID:string):Boolean; //������ ������ �� ��� ������ �ε�
    function  Send_McuID(aNodeNo:integer):Boolean;         //���� ��Ʈ�ѷ� ���̵� �ε�
    function  Send_PortSetting(aNodeNo:integer;aEcuID,aPortNo:string):Boolean; //�� ������ �ε�
    function  Send_SystemInfo(aNodeNo:integer;aEcuID:string):Boolean;  //�ý��� ������ �ε�
    function  Send_TelecopID(aNodeNo:integer):Boolean;       //�ڷ�İ���� ���̵� �ε�
    function  Send_TelecopTelCount(aNodeNo:integer):Boolean; //�ڷ�İ��������Ƚ���ε�
    function  Send_TelecopTelNumber(aNodeNo:integer;aNo:string):Boolean;  //�ڷ�İ ������ȭ��ȣ �ε�
    function  Send_UseDoorSchedule : Boolean;    //������ ���� ���� ���� - ����͸����� ������ �������� ������
    function  Send_UseEcuCount(aNodeNo:integer):Boolean;   //���κ� Ȯ��� ��뿩�� ����
    function  Send_FireGroup(aFireGroupCode:string):Boolean;
    function  Send_RegistDoorTimeCodeUse:Boolean;   //���Թ� Ÿ���ڵ� ��뿩�� ����
    function  Send_RegistTimeCode:Boolean;          //��⿡ Ÿ���ڵ� ����
  public
     //�׸��� ��⼳������ ���� ���� �ϴ� �Լ�
    function PubDoorInfo_Device_Setting(aNodeNo,aEcuID,aDoorNo,aCardMode,aDoorMode,aDoorControlTime,aOpenMoni,aUseSch,aSendDoor,aAlarmLong,
              aFire,aLockType,aDSOpen,aRemoteDoor:string;aCmd:string = 'A'):Boolean; //���Թ� ���� ��� ����
    function PubDoorInfo_Device_Serch(aNodeNo,aEcuID,aDoorNo:string):Boolean; //���Թ� ���� ��ȸ ����
    function PubCardTypeSearch(aNodeNo,aEcuID:string):Boolean;
    Function DevicePacketSend(aDeviceID,aCmd,aSendData:string;aQuick:Boolean=False):Boolean;

  public
    //���� ���� �������
    function  Registration_CardReaderInfo(aNodeNo:integer;aEcuID,aCardReaderNo,aReaderUse,aReaderDoor,aDoorPosi,aBuildPosi:string):Boolean;   //ī�帮�� ���� ���
    function  Registration_CardReaderType(aNodeNo:integer;aEcuID,aCardReaderType:string):Boolean;
    function  Registration_ControllerID(aNodeNo:integer;aMCUID:string):Boolean;
    Procedure Registration_DeviceTimeSync(aDeviceID:string);  //Time ����ȭ
    function  Registration_DeviceType(aNodeNo:integer;aEcuType:string):Boolean;
    function  Registration_DoorLockInfo(aNodeNo:integer;aEcuID,aDoorNo,aCardMode,aDoorMode,aDoorControlTime,
                aOpenMoni,aSchUse,aSendDoor,aAlarmLong,aLockType,aControlFire,aDSOpenState,aRemoteDoorOpen:string):Boolean;
    function  Registration_JaejungDelayUse(aNodeNo:integer;aEcuID,aJaeJung:string):Boolean;
    function  Registration_LinkusID(aNodeNo:integer;aLinkusID:string):Boolean;
    function  Registration_LinkusTelNumber(aNodeNo:integer;aLinkusTelNumber:string):Boolean;
    function  Registration_Port(aNodeNo:integer;aEcuID,aPortNo,aWatchType,aZoneDelay,aPortRecovery,aWhatchTime,aLocate:string):Boolean;
    function  Registration_RingCount(aNodeNo:integer;aLinkusArmRing,aLinkusDisArmRing:string):Boolean;
    function  Registration_SystemInfo(aNodeNo:integer;aEcuID,aPowerType,aOutDelay,aInDelay,aDoor1Type,aDoor2Type:string):Boolean;
    function  Registration_UsedDevice(aNodeNo:integer;aEcuList:string):Boolean;

    //*****************************************
    // ��� ������ ���� ó��
    //*****************************************
    procedure Receive_RegCardType(aNodeNO,aECUID,aData: string); //ī�帮�� Ÿ�� ���
    procedure Receive_RegCardReaderInfo(aNodeNO,aECUID,aData: String);       //ī�帮�� �������
    procedure Receive_RegControllerID(aNodeNO,aECUID,aMcuID: string); //���̵� ��� ����
    procedure Receive_RegJaejungDelayUse(aNodeNO,aECUID,aJaejung: String); //���� ���
    procedure Receive_RegKTTelNumber(aNodeNO,aECUID,aData: string); //���α�����ȭ��ȣ ��� ����
    procedure Receive_RegLinkusId(aNodeNO,aECUID,aLinkusID: string); //������̵� ��� ����
    procedure Receive_RegLinkusTelNumber(aNodeNO,aECUID,aData: string); //�溡 MuxTelNo ��� ����
    procedure Receive_RegPort(aNodeNO,aECUID,aData: String); //��Ʈ ��� ����
    procedure Receive_RegRingCount(aNodeNO,aECUID,aData: string);   //�������Ƚ�� �������
    procedure Receive_RegSysteminfo(aNodeNO,aECUID,aData: string); // ECU System Info ��� ����
    Procedure Receive_RegUsedDevice(aNodeNo,aEcuID,aPacketData,aRegGubun: String); // ECU ��� ����
    procedure Receive_JavaraSchedule(aNodeNo,aEcuID,aPacketData:string); //�ڹٶ� ������ ���
    procedure Receive_DoorTimeCodeUse(aNodeNo,aEcuID,aPacketData:string); //���Թ�Ÿ���ڵ� ������� ���
  private
    L_bWebRelay : Boolean;
    InnoNixAlarmEventList : TStringList;
    { Private declarations }
    //**************************************
    // ���� ����
    //**************************************
    Function FingerDeviceRelay : Boolean;
    Function FingerSend : Boolean;
    Function fdmsConnect:Boolean; //fdms Connect
    Function fdmsUserRelaySend(aEmCode,aFDMS_ID,aEM_NAME,aHandPhone,aDEPART_NAME,aPO_NAME,aCA_CARDNO,aMode,aJijumcode:string):Boolean;
    Function fdmsUserRelayDeleteSend(aFDMS_ID,aMode:string):Boolean;
    Function fdmsUserRelay:Boolean;
    Function fdmsGateRelay:Boolean;
    Function fdmsDoorRelaySend(aFDMS_ID,aDOORNONAME:string):Boolean;
    Function CheckFdmsUser(aFDMS_ID:string;var aFdmsKey,aFdmsCardNo:string):Boolean;
    Function GetFdmsUserKey(aFDMS_Key:string):string;
    Function NextFdmsUserKey:string;
    Function DeleteFdmsUser(aFDMS_ID:string):Boolean;
    Function UpdateFdmsUser(aFdmsKey,aEmCode,aFDMS_ID, aEM_NAME,aHandPhone, aDEPART_NAME, aPO_NAME,aCA_CARDNO,aMode,aJijumCode:string):Boolean;
    Function InsertFdmsUser(aEmCode,aFDMS_ID, aEM_NAME,aHandPhone, aDEPART_NAME, aPO_NAME,aCA_CARDNO,aMode,aJijumCode:string):Boolean;
    function SHF_CheckSyncUserterminal(aPOSITIONNUM,aFINGERDEVICEID:string):integer;
    function SHF_CheckTB_TERMINAL(aterminalid:string):integer;
    function SHF_ProcessExecSQL(aSql:string):integer;
    Function SHF_RelayFingerUserPermit(aFINGERDEVICEID,aPOSITIONNUM,aPermit,aCardNo:string):Boolean;
    Function RelayFingerDevice(aDEVICESEQ,aFINGERDEVICEID,aDEVICEIP,aDEVICEPORT,aDEVICENAME:string):Boolean;

    procedure SentenceRelaySend;
    Function  SentenceServerConnect:Boolean;

    Function  InnoNixAlarmEventSend(aZoneNumber:string):Boolean;
  private
    //**************************************
    //������� �ε�
    //**************************************
    Function LoadAntiGroup : Boolean;  //AntiGroup �� �ε� �Ѵ�.
    Function LoadArmArea(aFirst:Boolean=True) : Boolean; //������� ��뿩�θ� �ε��Ѵ�.
    Function LoadDoor(aFirst:Boolean=True) : Boolean; //Door ��뿩�θ� �ε��Ѵ�.
    Function LoadECU(aFirst:Boolean=True) : Boolean; //ECU�� �ε��Ѵ�.
    Function LoadInOutReader : Boolean; //����� ���� ������ �ε� �Ѵ�.
    Function LoadNode(aFirst:Boolean=True) :Boolean;  //��带 �ε� �Ѵ�.
    Function UnLoadECU : Boolean; //ECU�� ��ε��Ѵ�.
    Function UnLoadNode :Boolean;  //��带 ��ε� �Ѵ�.
    Function LoadFireGroup :Boolean; //ȭ��׷��� �ε� �Ѵ�.
    Function LoadMCUID :Boolean;     //������Ʈ�ѷ�ID�� �ε� �Ѵ�.
    Function LoadDeviceCardNo(aCardNo:string='') : Boolean; //��Ʈ�ѷ� ī�� ������ �ε� �Ѵ�.
    Function LoadTB_RELAYCONTROLDOOR : Boolean;
  public
    //**************************************
    //������� ��ȸ
    //**************************************
    Function FindCommNode(aNodeNo:Integer):TCommNode; // ����ȣ�� TCommnode�� ã�� function

  private
    procedure DeviceServerStart;
    Function DAEMON_LogServerExecute : Boolean;
    Function KTTSenderDaemon_Execute : Boolean;
    Function SHFPDamon_Execute:Boolean;

  private
    //***************************************
    //MCU�� ���ó�� �ϱ� ���� ���� �Լ�
    //***************************************
    Procedure NodeConnected(Sender:TObject;  aConnected:Boolean;NodeNo,OldConnected:integer);
    procedure NodeDisConnectAlarmEvent(Sender:TObject;NodeNo:integer);
    procedure NodeReConnectAlarmEvent(Sender:TObject;NodeNo:integer);
    Procedure CommNodeReceve(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //MCU���� Recv �Ǵ� ��� �����͸� ���ӵǾ� �ִ� Ŭ���̾�Ʈ�� ����
    Procedure CommNodeRcvInvalidDevice(Sender: TObject;  ReceiveData: string ;NodeNO : integer); //��ϵ��� ���� ��⿡�� ������ �ö���� ��� ó��
    Procedure CommNodeSend(Sender: TObject;  SendData: string;NodeNO : integer);  //MCU�� Send �Ǵ� ��� �����͸� �ǽð����� ��ȸ �� �� �ֵ��� ó��

    procedure DirectSendPacket(aDeviceID,aData:string);
    Function  MCUBroadDataSend(aTargetID,aCmd,aSendData:string;aQuick:Boolean=True):Boolean;
    //****************************************
    //MCU���� ������ ������ �Ľ� ó�� �Լ�
    //****************************************
    Procedure DeviceRcvRegCardData(Sender: TObject;  ReceiveData: string;NodeNO : integer;aCardType:integer); //ī�� ��� ���� ����Ÿ
    //�޸������ư Ŭ���� ó��
    Procedure DeviceRegisterClear(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //�������� ���� ����Ÿ
    //AlarmEvent
    Procedure DeviceRcvAlarmData(Sender: TObject;  cmd,ReceiveData: string;NodeNO : integer;FireGubunCode:string); //�˶�����Ÿ
    procedure DeviceRcvTellogData(Sender: TObject;  ReceiveData: string;NodeNO : integer);
    Procedure DeviceRcvInitAckData(Sender: TObject;  ReceiveData: string;NodeNO : integer); //����� ��䵥��Ÿ
    Procedure DeviceRcvRemoteAckData(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //�������� ���� ����Ÿ
    Procedure DeviceRcvFTPProcessData(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //�������� ���� ����Ÿ
    Procedure DeviceRcvCardReadData(Sender: TObject;  ReceiveData: string;NodeNO : integer;nDeviceCardType:integer); // ī�� ���� ����Ÿ
    Procedure DeviceRcvDoorSetup(Sender: TObject;  ReceiveData: string;NodeNO : integer); //������ ���� ���� ����Ÿ
    //���º��� ������ ó�� (������)
    Procedure DeviceRcvChangeDoorData(Sender: TObject;  ReceiveData: string; NODENO : integer);//������ ���� ����Ÿ
    //������ ������ ó�� (������)
    Procedure DeviceRcvDoorControl(Sender: TObject;  ReceiveData: string;NodeNO : integer);//������ ���� ����Ÿ
    Procedure DeviceNotDefineData(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //���� �ʵ� �������� ����Ÿ
    Procedure DeviceErorData(Sender: TObject;  aData: string;NodeNO : integer); // ERROR ������
    procedure DeviceRcvScheduleData(Sender: TObject;  ReceiveData: string;NodeNO : integer); //������ ������ ��� ó��
    procedure DeviceRcvRegTimeCodeData(Sender: TObject;  ReceiveData: string;NodeNO : integer); //Ÿ���ڵ� ��� ó��
    procedure DeviceConnected(Sender: TObject;  Value:Boolean; NodeNo : integer;aECUID:string);
    //������
    procedure DoorMangageModeChange(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorManageType:TDoorManageMode); //���Թ� ���� ����
    //������
    procedure DoorPNModeChange(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorPNType:TDoorPNMode); //���Թ� Posi/Nega��� ����
    //������
    procedure DoorStateChanged(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorStateType:TDoorDSState); //���Թ� ���� ����

    procedure DeviceWatchModeChange(Sender: TObject; NodeNo : integer;aEcuID,aArmArea:string;aWachMode:TWatchMode);
    procedure DoorModeChanged(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorDSState;
                                  aDoorLockMode:TDoorLockState;
                                  aDoorFire:Boolean);
    procedure FireStateChange(Sender:TObject;NodeNo:integer;aEcuID,aDoorNo:string;aFireState:Boolean);

    procedure DeviceTypeChange(Sender:TObject;NodeNo:integer;aEcuID,aDeviceType:string);
    procedure DeviceCodeChange(Sender:TObject;NodeNo:integer;aEcuID,aDeviceCode:string);
    procedure DeviceArmAreaDisArmEvent(Sender:TObject;NodeNo:integer;aEcuID,aArmAreaNo:string);
    //*****************************************
    //������ ������  DB�� ������ ó�� �Լ�
    //*****************************************
    Function ProcessFoodData(aTime, aCardNo, aECUID:string; aNodeNO:integer; aReaderNo,aFoodCode,aPermit:char;aJijumCode,aDepartCode,aEmName:string):Boolean;

    Function PorcessAlaramData(aData : string) : Boolean;


    //*****************************************
    // ī�弭�������� ����
    //*****************************************
    Function GetRelayNo(aRelayNo:integer;var aNodeNo,aECUID,aCardReaderNo:string):Boolean;
    procedure SendDeviceCardNo(aRelayNo:integer;aCardData:string);

    Function GetArmAreaRelayNo(aNodeNo,aEcuID,aArmArea:string):integer;
  private
    //*****************FTPServer DownLoad
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

    Function FTP_CardDataCreate(aNodeNo,aEcuID:string):Boolean; //ī�嵥���� ����
    Function FTP_CardDataSendSuccess(aNodeNo:integer;aEcuID:string):Boolean;
    Function FTP_DevicePushStart(aNodeNo:integer;aEcuID,aFileName:string):Boolean;
    Function FTP_DownLoadListCheck: Boolean;
    Function FTP_DownLoadStart:Boolean;
    Function FTP_UseDevice(aNodeNo,aEcuID:string):Boolean;//FTP ��� ������ ������� üũ

  private
    //KTT ���� ���� �˶� ���� ������ �ε�
    procedure KTTControlCenterAlarmListLoad(NodeNo:integer;aCommNode:TCommNode);
    function AntiPassProcess(aAntiGroup,aDeviceIndex:integer;aTime,aNodeNo,aECUID,aDoorNo,aCardNo,aReaderNo,aButton,aPosi,aInputType,aDoorMode,aPermitMode,aPermitCode:string):integer;
    function SonghoFoodProcess(aDeviceIndex:integer;aTime,aNodeNo,aECUID,aDoorNo,aCardNo,aReaderNo,aButton,aPosi,aInputType,aDoorMode,aCardManageMode,aPermitCode:string):char;
    procedure AddFoodServerEmployeeList(aCompanyCode,aEMCode:string);
    procedure AddFoodCodeCount(aCompanyCode,aEMCode:string);
    procedure AddFoodDayCount(aCompanyCode,aEMCode:string);
    procedure AddFoodWeekCount(aCompanyCode,aEMCode:string);
    procedure AddFoodSemesterCount(aCompanyCode,aEMCode:string);
    function CheckTB_FoodCodeCount(aDate,aFoodCode,aCompanyCode,aEMCode:string):integer;
    function CheckTB_FoodDayCount(aDate,aCompanyCode,aEMCode:string):integer;
    function CheckTB_FoodSemesterCount(aYear,aSemesterCode,aCompanyCode,aEMCode:string):integer;
    function CheckTB_FoodWeekCount(aYear,aWeekDay,aCompanyCode,aEMCode:string):integer;
  private
    //KT��� ī���ȣ ����ǿ� ���ؼ� ���α׷� ������
    function KTEmployeeCardChange(aEmCode:string):Boolean;
    function EmployeeNewCardChange(aEmCode,aCardNO:string):Boolean;
    function KTOldCardChage(aOldCardNo,aNewCardNO:string):Boolean;
    function DeleteOldCard(aCardNo : string):Boolean;
    function KTOldEmployeeCardStop:Boolean;
    function KTOldCardStopFromEmCode(aEmCode:string):Boolean;
    function NotUsedCardDelete(aDate:string):Boolean;
    function UpdateTB_CARD_Stop(aCardNo : string):Boolean;
  protected
    function TransLatePath( const APathname, homeDir: string ) : string;
    Function Employee_ServerExecute : Boolean;
    Function Employee_ServerTerminate : Boolean;
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

  private
    wmTaskbar : word;
    procedure DefaultHandler(var Message);override;  //����Ʈ���� ����� ����

  published
    Property Logined : Boolean read FLogined write  SetLogined; //������Ƽ�� ���������� Logined��� ������ �ٲ�� SetLogined ��� �Լ��� �����
    Property NowDate : string read FNowDate write SetNowDate;   //���ó�¥�� ���� �Ǹ� ����,��,�б⸦ ����Ѵ�.
    property FoodCurrentFoodCode: string read FFoodCurrentFoodCode write SetFoodCurrentFoodCode;
    property FoodCurrentWeekDay : integer read FFoodCurrentWeekDay write SetFoodCurrentWeekDay;
    property FoodCurrentSemesterCode : integer read FFoodCurrentSemesterCode write SetFoodCurrentSemesterCode;
    property PositiveMode : TDoorPNMode read FPositiveMode write SetPositiveMode;
  end;

var
  fmMain: TfmMain;


implementation
uses
  uAntiPassGroupCode,
  uLogin,
  uPwChange,
  uDataBaseConfig,
  uLomosUtil,
  uCurrentState, uLocateCode,uAttendConfig, DoorSchReg,
  uSchadule,udmAdoQuery, uNetConfig, 
  uFoodAdmin,uCommonSql, uMDBSql, uPostGreSql, uMssql,
  uCardReaderServer, uAlaramReader, uDeviceSetting, uInOutReader,
  uInOutGroup,
  uClientInfo,
  uReaderSetting,
  uPersonRelay,
  UCommonModule,
  uSequenceChange,
  udmServerToMonitor,
  uKTTControl,
  udmAttendEvent,
  uMonitoringServer,
  uKTTMonitoring,
  uKTTDDNS,
  uDDNSMonitoring,
  uMonitoringState, uKTTCodeAdmin, uFiregubunCode, uFireGroup,
  uInOutGroupCode, uFireBird,
  uNodeServerWinSocket, uDoorAntiPass,
  uAntiPassGroup, uMessage,
  uRelayDB,
  uRelayDoor,
  uFoodEmployee,
  uZTBMSFunction,
  uFoodSummary, uDBFunction;



{$R *.dfm}

function GetAttributeStatus(CB: TCheckBox): TFileAttributeStatus;
begin
  case CB.State of
    cbUnchecked: Result := fsUnset;
    cbChecked: Result := fsSet;
  else
    Result := fsIgnore;
  end;
end;

//*****************************************
//FTP SERVER ���� ���
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
//FTP SERVER ���� ���
//*****************************************




procedure TfmMain.miExitClick(Sender: TObject);
begin
  L_bClose := True;
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
  if L_bLogined then
  begin
    TLogin.GetObject.ShowLoginDlg;
    Logined := TLogin.GetObject.Logined;

    if Not FLogined then Exit;
  end;

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
  L_bDBProcessTimerStart := True;
  L_bDeviceLoading := False;
  wmTaskbar := RegisterWindowMessage('TaskbarCreated');
  Master_ID := 'SYSTEM';

  Application.OnException := AppException;

  NETTYPE :='TCPIP';
  CriticalSectionCreate;
  MemoryInitialize;
  StringListCreate;
  StringListClear;

  dmNodeServerWinSock := TdmNodeServerWinSock.Create(nil);
  dmNodeServerWinSock.OnWinSockAccept := WinSockAccept;
  dmNodeServerWinSock.OnWinSockDisConnect := WinSockDisConnect;
  dmNodeServerWinSock.OnWinSockReadEvent := WinSockReadEvent;
  dmNodeServerWinSock.OnWinSockStop := WinSockStop;

  ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Zmos.INI');
  G_nDaemonGubun  := ini_fun.ReadInteger('DAEMON','GUBUN',0);
  if ini_fun.ReadString('CARD','DOWNLOADLOG','FALSE') = 'TRUE' then G_bCardDownloadLogSave := True
  else G_bCardDownloadLogSave := False;
  if ini_fun.ReadString('DAEMON','MAXPROCESS','TRUE') = 'TRUE' then useProcessCount := True
  else useProcessCount := False;
  if ini_fun.ReadString('DAEMON','DEVICESTATECHECK','TRUE') = 'TRUE' then L_bNotDeviceStateCheck := False
  else L_bNotDeviceStateCheck := True;
  L_stFaceCopPort := ini_fun.ReadString('FACECOP','Port','5432');
  L_stFaceCopDBName := ini_fun.ReadString('FACECOP','DBNAME','postgres');
  L_stFaceCopUserID := ini_fun.ReadString('FACECOP','USERID','postgres');
  L_stFaceCopUserPW := ini_fun.ReadString('FACECOP','USERPW','topadmin');
  if ini_fun.ReadString('FACECOP','ODBC','FALSE') = 'FALSE' then FACEODBCType := False
  else FACEODBCType := True;
  G_nAckSendType := ini_fun.ReadInteger('DAEMON','SENDACKTYPE',-1);
  if G_nAckSendType > 0 then G_nAckSendType := 0;
  G_nNodeConnectDelayTime := ini_fun.ReadInteger('DAEMON','NODETIMEOUT',30);
  G_nNodeServerEnqCount := ini_fun.ReadInteger('DAEMON','ServerEnqCount',3);
  G_nNodeDisConnectDelayTime := ini_fun.ReadInteger('DAEMON','NODEDISCONNECTDELAYTIME',180);
  G_nNodeSocketConnectedNFDelayTime := ini_fun.ReadInteger('DAEMON','NodeSocketConnectedNFDelayTime',300);
  if G_nNodeConnectDelayTime < 10 then G_nNodeConnectDelayTime := 10;
  if G_nNodeDisConnectDelayTime < 1 then G_nNodeDisConnectDelayTime := 1;
  ini_fun.Free;

  Self.ModuleID := 'Main';
  ExeFolder  := ExtractFileDir(Application.ExeName);
  G_bApplicationTerminate := False;

  LogSave(ExeFolder + '\..\log\lomosHis.log','Daemon Program Start ');

  tbi.Visible := True;
  tbi.Hint := '�ۼ��ŵ��󼭹� ����';
  StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� ����';
  Timer1.Enabled := False;
  ConnectTimer.Enabled := False;
  SendTimer.Enabled := False;
  sendClientTimer.Enabled := True;
  FTPSendProcessChckTimer.Enabled := False; //FTP ���������� üũ�ϴ� Ÿ�̸�

  ClientCommunication := TClientCommunication.create;
  DeviceConnectList := TStringList.Create;
  DeviceConnectList.Clear;

  dtSyncTime:= Trunc(Tomorrow) + EncodeTime(0,0,1,0);
  dtDaemonLogDeleteTime := Now;  //Trunc(Tomorrow) + EncodeTime(0,0,1,0);
  dtRelayEmployeeSuccessTime := Now;


  bDBBackup := False;
  if G_bApplicationTerminate then Exit;

{  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      L_bClose := True;
      Application.Terminate;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end; }
  FTPServerCreate;
  MultiSocketInitialize;
  

  Action_DaemonStartExecute(Self);
  tbi.Hint := 'GetSonghoConfig_Start';
  GetSonghoConfig;
  tbi.Hint := 'FoodTimeSetting_Start';
  FoodTimeSetting;
  tbi.Hint := 'UpdateTB_DEVICECARDNO_AllState_Start';
  dmDBFunction.UpdateTB_DEVICECARDNO_AllState('S','N');
  tbi.Hint := 'UpdateTB_DEVICECARDNO_AllState_End';
  dmDBFunction.UpdateTB_ACCESSDEVICE_HOSEND('','','R','N');
  //UpdateTB_CARD_AllMemload('N'); -- �泲��� ���� ��뷮 ����Ʈ���� �޸� �ε� �۾� ������ ������ �� �ö� ��
  WritingDaemonConfig;
  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    self.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  LogoFile := ExeFolder + '\..\image\DaemonLogo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);
  SyncTimer.Enabled := True;
  //AdoConnectCheckTimer.Enabled := True;
  DataModule1.OnAdoConnected := DataModuleAdoConnected;
  dmKTTControl.OnEvent := KTTEventData;
  dmKTTDDNS.OnEvent := DDNSEventData;
  dmMonitoringServer.OnEvent := MonitorEventData;
  //DEBUG
  //LogSave(ExeFolder + '\..\log\lomosHis.log','FormCreate ');
  LogDirectoryDeleteTimer.Enabled := True;

  ClientStateCheckTimer.Enabled := True;
  CheckFPSystemTimer.Enabled := True;
  DaemonStateCheckTimer.Enabled := True;
  MonitorSERVER := nil;

  //DBProcessTimer.Enabled := True;

  DBLogLoad;

  if not DirectoryExists(ExeFolder + '\LogDB') then
  begin
   if Not CreateDir(ExeFolder + '\LogDB') then
   begin
   end;
  end;

  L_nConnectCount := 0;
  tbi.Hint := 'FormCreate';
  tbi.Show;
  Panel1.Left := -1000;
  L_bWebRelay := False;
  L_bValidExpiredChecking := False;
  ValidExpiredTimer.Enabled := True;
  PositiveMode := pnPositive; //����Ʈ�� positive mode ���� �Ѵ�.
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  fmCurrentState : TForm;
  fmKTTMonitoring : TForm;
  fmDDNSMonitoring : TForm;
  fmMonitoringState : TForm;
begin
  if L_bClose = False then
  Begin
    Visible := False;
    CanClose := False;
    ShowWindow( Application.Handle, SW_HIDE );
    if L_bShowCurrentState then
    begin
      fmCurrentState := MDIForm('TfmCurrentState');
      if fmCurrentState <> nil then
      begin
        TfmCurrentState(fmCurrentState).CloseForm;
      end;
    end;
    if L_bShowKttMonitoring then
    begin
      fmKTTMonitoring := MDIForm('TfmKTTMonitoring');
      if fmKTTMonitoring <> nil then
      begin
        TfmKTTMonitoring(fmKTTMonitoring).CloseForm;
      end;
    end;
    if L_bShowDDNSMonitoring then
    begin
      fmDDNSMonitoring := MDIForm('TfmDDNSMonitoring');
      if fmDDNSMonitoring <> nil then
      begin
        TfmDDNSMonitoring(fmDDNSMonitoring).CloseForm;
      end;
    end;
    if L_bShowMonitoringState then
    begin
      fmMonitoringState := MDIForm('TfmMonitoringState');
      if fmMonitoringState <> nil then
      begin
        TfmMonitoringState(fmMonitoringState).CloseForm;
      end;
    end;

    Exit;
  End;

end;

procedure TfmMain.miShowClick(Sender: TObject);
begin
  if L_bLogined then
  begin
    TLogin.GetObject.ShowLoginDlg;
    Logined := TLogin.GetObject.Logined;

    if Not FLogined then Exit;
  end;

  Visible := True;
end;

procedure TfmMain.bt_HideClick(Sender: TObject);
begin
  Visible := False;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  //bt_Hide.Click;

  SendTimer.Enabled:= True;
  Timer1.Enabled := True;
  FoodTimer.Enabled := True;
  FTPSendTimer.Enabled := True;
  

  ConnectTimer.Enabled:= True;
  StateCheckTimer.Enabled := True;
  CardAutoDownTimer.Enabled := True;//CardAutoDownLoadUse;
  HolidaySendTimer.Enabled := True;

  if G_nScheduleDevice = 1 then  //PC ������ ����̸� PC���� ������ ���� ����.
  begin
    PCScheduleTimer.Enabled := True;
    HolidaySendTimer.Enabled := False;
  end;


  //DEBUG
  //LogSave(ExeFolder + '\..\log\lomosHis.log','FormActivate ');


  //Self.Hide;
  Ver011.Caption := 'Ver ' + strBuildInfo ;
  if G_nSpecialProgram = 4 then
  begin
    fmMain.Caption := '�л�ȸ������[' + strBuildInfo + ']';
  end else
  begin
    fmMain.Caption := '��ŵ���[' + strBuildInfo + ']';
  end;
  
  if L_bFormActive then Exit;
  L_bFormActive := True;

  if isDigit(L_stDaemonServerPort) then
    MonitorServerStart(strtoint(L_stDaemonServerPort));
  tbi.Hint := 'MonitorServer(Active)';

  if isDigit(L_stFtpServerPort) then
  begin
    IdFTPServer.DefaultPort := strtoint(L_stFtpServerPort);
    if Not IdFTPServer.Active then IdFTPServer.Active := True;
  end;
  tbi.Hint := 'FTPServer(Active)';
  if isDigit(L_stAttendServerPort) then
  begin
    ATSERVER.ServerPort := strtoint(L_stAttendServerPort);
    ATSERVER.Start;
  end;
  tbi.Hint := 'ATSERVER(Active)';
  if isDigit(L_stFoodServerPort) then
  begin
    FoodServer.ServerPort := strtoint(L_stFoodServerPort);
    FoodServer.Start;
  end;
  tbi.Hint := 'FoodServer(Active)';
  tbi.Hint := '���󼭹� ����(Active)';
end;

//���� �� HIDE
procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  Visible:=False;
  Timer1.Enabled:=False;
end;

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
  L_bClose := True;
  Close;
end;

procedure TfmMain.SetLogined(const Value: Boolean);
begin
  FLogined := Value;
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
  stSql : string;
begin
  if G_bApplicationTerminate then Exit;

  While L_bDeviceLoading do
  begin
    StatusBar1.Panels[0].Text := 'DeviceLoading...';
    Application.ProcessMessages;
    Delay(1);
  end;
  L_nThreadRestartCount := 0;
  Action_DaemonStart.Enabled := False;
  L_bDaemonStop := False;
  StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��...';
  tbi.Hint := '�ۼ��ŵ��󼭹� �⵿��...';
  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��(1)...';
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��(2)...';
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��(3)...';
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��(4)...';
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��(5)...';
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��(6)...';
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��(7)...';
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��(8)...';
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��(9)...';
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� �⵿��(10)...';
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('�����ͺ��̽� ���� �����Դϴ�. �����ͺ��̽� ȯ�漳���� Ȯ���Ͽ� �ּ���.');
    L_bClose := True;
    Application.Terminate;
    Exit;
  end;
StatusBar1.Panels[0].Text := '�����ͺ��̽� ���ӿϷ�...';
  (*
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if G_bApplicationTerminate then Exit;
    if TDataBaseConfig.GetObject.Cancel then
    begin
      L_bClose := True;
      LogSave(ExeFolder + '\..\log\lomosHis.log','Daemon Program Close(DB Connect Fail) ');

      Application.Terminate;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;
   *)

  GetDaemonConfig;
StatusBar1.Panels[0].Text := 'GetDaemonConfig �ε��Ϸ�...';
  sendClientTimer.Interval := L_nSendClientTimer;

  GetMonitoringTypeConfig;
StatusBar1.Panels[0].Text := 'GetMonitoringTypeConfig �ε��Ϸ�...';
  GetAttendConfig; //����ȯ�漳���ε�
StatusBar1.Panels[0].Text := 'GetAttendConfig �ε��Ϸ�...';
  GetCardConfig;   //ī��ȯ�漳���ε�
StatusBar1.Panels[0].Text := 'GetCardConfig �ε��Ϸ�...';
  GetFoodConfig;   //�ļ�ȯ�漳���ε�
StatusBar1.Panels[0].Text := 'GetFoodConfig �ε��Ϸ�...';

  GetDaemonLogConfig;   //����α� ȯ�漳��
StatusBar1.Panels[0].Text := 'GetDaemonLogConfig �ε��Ϸ�...';
  GetRelayConfig;     //�������� ȯ�漳��
StatusBar1.Panels[0].Text := 'GetRelayConfig �ε��Ϸ�...';
  LogDeleteTime.Enabled := True;  //����α� ����
  GetDataBaseConfig;
StatusBar1.Panels[0].Text := 'GetDataBaseConfig �ε��Ϸ�...';
  if isdigit(L_stDataBaseLastBackupDate) then
  begin
    dtDBBackupTime := EncodeDateTime(strtoint(copy(L_stDataBaseLastBackupDate,1,4)),
                                   strtoint(copy(L_stDataBaseLastBackupDate,5,2)),
                                   strtoint(copy(L_stDataBaseLastBackupDate,7,2)),
                                   strtoint(copy(L_stDataBaseBackupTime,1,2)),
                                   strtoint(copy(L_stDataBaseBackupTime,3,2)),
                                   0,0);
    dtDBBackupTime := dtDBBackupTime + L_nDataBaseBackupCycle ; // ������ ��� �ð� + ��� �ֱ� => ������ ����� �ð���
  end;

  if L_stDataBaseAutoBackup = 'TRUE' then DataBaseBackupTimer.Enabled := True
  else DataBaseBackupTimer.Enabled := False;


  Try
    L_bDeviceLoading := True;

    UnLoadNode;
    UnLoadEcu;

    LoadAntiGroup;    //��Ƽ�н� �׷� ���� �ε�
StatusBar1.Panels[0].Text := 'LoadAntiGroup �ε��Ϸ�...';
    LoadInOutReader; //����� ���� ���� �ε�
StatusBar1.Panels[0].Text := 'LoadInOutReader �ε��Ϸ�...';
    LoadMCUID;
StatusBar1.Panels[0].Text := 'LoadMCUID �ε��Ϸ�...';
    LoadNode;      //��� ���� �ε�
StatusBar1.Panels[0].Text := 'LoadNode �ε��Ϸ�...';
    LoadECU;       //��� ���� �ε�
StatusBar1.Panels[0].Text := 'LoadECU �ε��Ϸ�...';
    LoadDoor;      //���Թ� ���� �ε�
StatusBar1.Panels[0].Text := 'LoadDoor �ε��Ϸ�...';
    LoadArmArea;   //������� ���� �ε�
StatusBar1.Panels[0].Text := 'LoadArmArea �ε��Ϸ�...';
    LoadFireGroup; //ȭ��׷� ���� �ε�
StatusBar1.Panels[0].Text := 'LoadFireGroup �ε���...';
    //UpdateTB_DEVICECARDNO_AllMemory('N'); //��뷮�� �ð��� �ʹ� ���� ��� �Դ´�...��.��
    if G_bCardMemoryLoad then LoadDeviceCardNo; //ī����� �ε�

  //  if UseDeviceServer then  //��Ⱑ ��������̸�
  //  begin
      //�ʱ� MCU�� ����
      for I:= 0 to ComNodeList.Count -1 do
      begin
        if G_bApplicationTerminate then Exit;
        Try
          if TCommNode(ComNodeList.Objects[I]).SocketType = 1 then
          begin
            TCommNode(ComNodeList.Objects[I]).Open := True;
            Delay(200);
            if Not G_bApplicationTerminate then LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Connecting '+ TCommnode(ComNodeList.Objects[i]).NodeNoStr );
          end;
        Except
          if Not G_bApplicationTerminate then LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','ConnectError '+ TCommnode(ComNodeList.Objects[i]).NodeNoStr );
        End;

      end;
  //  end else
  //  begin
      DeviceServerStart;
  //  end;
    //Device Load �� ���� ��
    GetKTTControlConfig; //KTT���� ȯ�� ���� �ε�

    if G_nSpecialProgram = 4 then
    begin
      tbi.Hint := '�л�ȸ������ ����';
      StatusBar1.Panels[0].Text := '�л�ȸ������ ����';
      tbi.ImageIndex := 1;
    end else
    begin
      tbi.Hint := '�ۼ��ŵ��󼭹� ����';
      StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� ����';
      tbi.ImageIndex := 0;
    end;

    GetMCUCommonConfig;
    //CardLoadTimer.Enabled := True;  -- �泲��� ���� ��뷮 ����Ʈ������ �޸� �ε��� ���� �ʴ´�.
  


    if fdmsUses = 'TRUE' then
    begin
      //���⼭ DBConnect ����...
      if fdmsConnect then fdmsRelyTimer.Enabled := True
      else fdmsRelyTimer.Enabled := False;
    end  else fdmsRelyTimer.Enabled := False;

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

    GetSentenceRelayConfig;
    if L_bRelaySentenceUse then
    begin
      SentenceRelayTimer.Enabled := True;
    end  else SentenceRelayTimer.Enabled := False;

    if (PersonRelayType = 2) or (SendPersonRelayType > 0) then //���ʻ�� ���̺� ����
    begin
      PersonRelayTimer.Enabled := True;
    end else PersonRelayTimer.Enabled := False;

    if FACECOPRelayType <> 0 then //Facecop ��� ���̺� ����
    begin
      FaceCopRelayTimer.Enabled := False;
      FaceCopRelayTimer.Interval := FACECOPRelayCycleTime * 1000 * 10  ;
      FaceCopRelayTimer.Enabled := True;
      StatusBar1.Panels[2].Text := 'FaceCopCycleTime-' + inttostr(FaceCopRelayTimer.Interval);
    end else FaceCopRelayTimer.Enabled := False;

    //ȭ�簨���� ȯ�漳���� �о�ͼ� ����
    GetFireConfig;
    if L_bFireRecoverUse then
    begin
      mn_Fire.Visible := True;
    end else
    begin
      mn_Fire.Visible := False;
    end;
    //StateCheckTimer.Enabled := True;

    CommonModule.LoadAlarmModeNotCard(AlarmModeNotCardList);
    CommonModule.LoadZoneDetectList(ZoneDetectList);
    L_bDaemonStop := False;
    L_bDaemonStart := True;

    DeviceInfoSendTimer.Enabled := True;

    mn_GlobalAntiPass.Visible := G_bGlobalAntiPass;
    if G_nEventDBType = 0 then LogServerTimer.Enabled := False
    else LogServerTimer.Enabled := True;
  Finally
    L_bDeviceLoading := False;
  End;

  if G_nSpecialProgram = 9 then
  begin
    L_bPositiveLog := True;
    LoadTB_RELAYCONTROLDOOR;
    RelayControlTimer.Enabled := True;
    mn_JNHospital.Visible := True;
  end else
  begin
    RelayControlTimer.Enabled := False;
    mn_JNHospital.Visible := False;
  end;

  tbi.Hint := '����_���� START';
  DeviceLoadTimer.Enabled := True;
end;

procedure TfmMain.Action_CurrentStateExecute(Sender: TObject);
begin
  if L_bFormActive then
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
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        if Screen.ActiveForm = Screen.Forms[i] then
        begin
          Screen.Forms[i].WindowState := wsMaximized;
          Exit;
        end;
        Screen.Forms[i].Show;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    tmpForm.Show;
  end;
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
 stIP : string;
 stTemp : string;
begin


 try
   Stream := TWinSocketStream.Create(ClientSocket, SERVERTIMEOUT);

   Buffer:='';
   while (not Terminated) and ClientSocket.Connected do
   begin
      if G_bApplicationTerminate then Exit;
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

       InBuf[i]:=#0;  //�߰��� ������ �����͸� ���ֱ� ����
       Buffer:=Buffer + InBuf;

       nLength := Pos(LINEEND, Buffer);
       while nLength > 0 do
       begin
          if G_bApplicationTerminate then Exit;
          nLength := Pos(LINEEND, Buffer);
          RecvData := copy(Buffer,1,nLength); //�Ѷ��� ����
          Delete(Buffer,1,nLength);  //Buffer ���� �տ� �Ѷ��� ����
          if RecvData <> '' then
          begin
            fmMain.FClientReceive.Enter;
            stTemp := stIP + DATADELIMITER + RecvData;
            fmMain.ClientReceiveDataList.Add(stTemp);
            fmMain.FClientReceive.Leave;
          end;
          {
          i := Pos(DATADELIMITER, RecvData); //Command ����
          strCmd:=UpperCase(Copy(RecvData, 1, i-1));
          //Ŭ���̾�Ʈ�� ����Ȯ�� ����
          stAck := 'A' + '000' + strCmd  + LINEEND;
          StrPCopy(OutBuf, stAck);
          Stream.Write(OutBuf , StrLen(OutBuf ));  //Ack ����

          if strCmd='ACCESS' then
             //���Թ�����
          else if strCmd='SCHEDULE' then
             //�����ٵ��
          else if strCmd='ALARM' then
          begin
            //����������
          end
          else if strCmd = 'TIME' then
            //�ð�����ȭ
          else if strCmd = 'DEVICESTATUS' then
            //����Ȯ��
          else if strCmd = 'CARDDOWNLOAD' then
            //ī�嵥���� �ٿ�ε�
          else
             strRet:='Unknown Command.'; }

       end;
   end;

 except
   HandleException;
 end;

 Stream.Free;
end;

function TfmMain.SendClientData(aSendData: string;aDirect:Boolean=False): Boolean;
begin
  if Not(aDirect) and L_bSendClientSequence then
  begin
    Try
      FClientSender.Enter;
      ClientSendList.Add(aSendData);
    Finally
      FClientSender.Leave;
    End;
    Exit;
  end;
{  FClientSender.Enter;
  ClientSendList.Add(aSendData);
  FClientSender.Leave;//}
  if G_bApplicationTerminate then Exit;
{  if DXUnicastDataQueue1.WaitingQueues > 10 then     //ť�� ���� ������� ���� �̸�
  begin
    if DataPumpThreadTime < (GetTickCount - 3000) then //���� �ñ׳��� 3�ʸ� �ѱ� ��� �����带 �� ���� ����.
    begin
      inc(L_nThreadRestartCount);
      StatusBar1.Panels[5].Text := inttostr(DXUnicastDataQueue1.WaitingQueues);
      {DXUnicastDataQueue1.ThreadStart := False;
      //Delay(200);
      DXUnicastDataQueue1.ThreadStart := True;//}{
    end;
  end;  }
  //DXUnicastDataQueue1.AddToQueue(aSendData + LINEEND);
  if G_nMonitorSockType = 0 then
    dmMonitoringServer.MonitoringBroadCastData(aSendData)
  else dmMonitoringServer.DBSocketBroadCastData(aSendData);
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
  if G_bApplicationTerminate then Exit;
  if Not L_bDaemonStart then Exit;
  StatusBar1.Panels[2].Text := 'ConnectTimerTimer';

{  if dtSyncTime <= Now then
  begin
    Registration_DeviceTimeSync('000000000000'); //�ð� ����ȭ
    CardNoDownload(0,'00',False); //������ ������ ����
    dtSyncTime := dtSyncTime + 1;
  end;   }
  Try
    ConnectTimer.Enabled := False;
    ConnectTimer.Interval := 1000;
    for I:=DeviceConnectList.Count - 1 downto 0 do
    begin
      aPollingTime:= TDeviceSocketInfo(DeviceConnectList.objects[i]).LastConnectedTime;
      aTimeOut:= IncTime(aPollingTime,0,0,G_nNodeConnectDelayTime,0);
      if Now > aTimeout then
      begin
        WinSockDisConnect(TDeviceSocketInfo(DeviceConnectList.objects[i]),TDeviceSocketInfo(DeviceConnectList.objects[i]).WinSocket);
      end;
    end;
    for I:= 0 to ComNodeList.Count -1 do
    begin
//      L_nConnectCount := L_nConnectCount + 1;
//      if L_nConnectCount >= ComNodeList.Count then L_nConnectCount := 0;
      if G_bApplicationTerminate then Exit; //�� ����ÿ��� �۾����� ����....
      if L_bDaemonStop then Exit;
      if Assigned(ComNodeList.Objects[i]) then
      begin
        if TCommnode(ComNodeList.Objects[i]).SocketConnected then
        begin
          aPollingTime:= TCommnode(ComNodeList.Objects[i]).LastConnectedTime;
          aTimeOut:= IncTime(aPollingTime,0,0,G_nNodeConnectDelayTime,0);
          if Now > aTimeout then
          begin
            if TCommnode(ComNodeList.Objects[i]).ServerEnqCount < G_nNodeServerEnqCount then
            begin
              TCommnode(ComNodeList.Objects[i]).ServerEnqCount := TCommnode(ComNodeList.Objects[i]).ServerEnqCount + 1;
              //Time Out�� �Ȱ�� �������� 'ENQ'�� ������ ����...
              LogSave(ExeFolder + '\..\log\ServerENQ'+ FormatDateTIme('yyyymmdd',Now)+'.log','ENQ SEND'+TCommnode(ComNodeList.Objects[i]).ConnectIP);  //�����⿡�� ���� ������ ���� ���� ���� �� �α� ���� 2011.06.10
              if TCommnode(ComNodeList.Objects[i]).Open then
              begin
                TCommnode(ComNodeList.Objects[i]).SendPacket('00','e','',True,-1);
              end;
            end else
            begin
              LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','TimeOut Close '+TCommnode(ComNodeList.Objects[i]).ConnectIP);  //�����⿡�� ���� ������ ���� ���� ���� �� �α� ���� 2011.06.10
              TCommnode(ComNodeList.Objects[i]).Open:= False;
              TCommnode(ComNodeList.Objects[i]).SocketConnected := False;
            end;
          end;
        end;
      end;
    end;
//    if UseDeviceServer then
//    begin
    for I:= L_nConnectCount to ComNodeList.Count -1 do
    begin
      L_nConnectCount := L_nConnectCount + 1;
      if L_nConnectCount >= ComNodeList.Count then L_nConnectCount := 0;
      if G_bApplicationTerminate then Exit; //�� ����ÿ��� �۾����� ����....
      if L_bDaemonStop then Exit;

      if Assigned(ComNodeList.Objects[i]) then
      begin
        Try
          if TCommnode(ComNodeList.Objects[i]).SocketType = 1 then   //PC->��Ʈ�ѷ� ��忡���� ���� ����...
          begin
            if Not TCommnode(ComNodeList.Objects[i]).SocketConnected then
            begin
              aPollingTime:= TCommnode(ComNodeList.Objects[i]).LastConnectedTime;   //�������� ��� �õ� ���� �ʰ�...
              aTimeOut:= IncTime(aPollingTime,0,0,G_nNodeConnectDelayTime,0);
              if Now > aTimeout then
              begin
                LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','ReConnecting '+TCommnode(ComNodeList.Objects[i]).ConnectIP);  //�����⿡�� ���� ������ ���� ���� ���� �� �α� ���� 2011.06.10
                TCommnode(ComNodeList.Objects[i]).Open := False;
                Delay(100);
                TCommnode(ComNodeList.Objects[i]).LastConnectedTime := Now;
                TCommnode(ComNodeList.Objects[i]).Open := True;
                //Delay(2000);
                break;
               end;
            end;
          end;
        Except
          //����
        End;
      end;
    end;
//    end else
//    begin
//      L_nConnectCount := 0;
//    end;
  Finally
    if Not G_bApplicationTerminate then ConnectTimer.Enabled := True;
  End;
end;

procedure TfmMain.Registration_DeviceTimeSync(aDeviceID:string);
var
  I: Integer;
  aDevice : TDevice;
begin
  if (copy(aDeviceID,1,3) = '000') or (Trim(aDeviceID) = '') then
  begin
    for I:= 0 to DeviceList.Count -1 do
    begin
      if G_bApplicationTerminate then Exit;
      if (TDevice(DeviceList.Objects[I]).ECUID = '00') and (TDevice(DeviceList.Objects[i]).Connected) then
      begin
        TDevice(DeviceList.Objects[I]).SendPacket('R','TM00'+ FormatDatetime('yyyymmddhhnnss',Now),True,-1);
        Delay(150);
      end;
    end;
    LogSave(ExeFolder + '\..\log\lomosHis.log','All Time Sync');
    Exit;
  end else
  begin
    aDevice := GetDevice(aDeviceID);
    if aDevice <> nil then aDevice.SendPacket('R','TM00'+ FormatDatetime('yyyymmddhhnnss',Now),True);
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
  L_bDaemonStart := False;
  L_bDaemonStop := True;
  DeviceLoadTimer.Enabled := False;

  dmKTTControl.SERVERUSES := False;
  dmKTTDDNS.DDNSUSES := False;
  if Not UseDeviceServer then //������ �������� �����ϴ� ��� ����� �ð��� ����.
  begin
    //dmNodeServerWinSock.ServerStart := False;
    WinSockStop(dmNodeServerWinSock,dmNodeServerWinSock.WinSocket);
    //Delay(1000);
  end;
  FClientSender.Enter;
  ClientSendList.Clear; //Ŭ���̾�Ʈ ���� ��Ŷ�� ��ü ����
  FClientSender.Leave;
  Delay(100);
  InOutCardReaderList.Clear;
  InOutGroupReaderList.Clear;
  InOutCountList.Clear;
  //if RSERVER.Active then
  //  RSERVER.Active := False;
  //DXUnicastDataQueue1.DeleteAllSocket;
  //ServerSocket1.Active := False;

  //StateCheckTimer.Enabled := False;
  //ConnectTimer.Enabled := False;


  StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� ���� ��...';
  tbi.Hint := '�ۼ��ŵ��󼭹� ���� ��...';
  UnLoadECU;
  UnLoadNode;
  DeviceList.Clear;
  ComNodeList.Clear;

//  if UseDeviceServer then  //��Ⱑ ��������̸�
//  begin
//    SendTimer.Enabled:= False;
//  end else
//  begin
    for i := DeviceConnectList.Count - 1 downto 0 do
    begin
      TDeviceSocketInfo(DeviceConnectList.Objects[i]).Free;
    end;
    DeviceConnectList.Clear;
//  end;


  FoodConfigCodeList.Clear;
  FoodConfigStartList.Clear;
  FoodConfigEndList.Clear;

  Action_DaemonStart.Enabled := True;
  StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� ����';
  tbi.Hint := '�ۼ��ŵ��󼭹� ����';
//  HolidaySendTimer.Enabled := False;
//  PCScheduleTimer.Enabled := False;
  
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
  aCardType: Char;
  aRegCode: Char;
  DeviceIndex: Integer;
  aDownLoadData: String;
  stSql : String;
  TempAdoQuery : TADOQuery;
  i : integer;
  nPositionNum : integer;
  stValidDate : string;
  stAlarmAreaGrade : string;
  stDoorAreaGrade : string;
  stCardTimeCode : string;
  stCardWeekCode : string;
  stCardGroup : string;
begin
  if L_bCardDownLoad then Exit;
  Try
    L_bCardDownLoad := True;
    if aAllSend then
    begin
      //���⿡�� FTP �ٿ�ε� ���� ������� üũ �Ͽ�
      //if FTP_UseDevice(inttostr(NodeNo),aECUID) then
      if G_nFTPUse = 0 then
      begin
        if CheckTB_FTPLIST(inttostr(NodeNo),aEcuID) then
        begin
          UpdateTB_FTPLIST_FileName(inttostr(NodeNo),aEcuID,FillZeroNumber(NodeNo,3) + aEcuID,'N');
        end else
        begin
          InsertTB_FTPLIST(inttostr(NodeNo),aEcuID,FillZeroNumber(NodeNo,3) + aEcuID,'N');
        end;
        FTPSendTimer.Enabled := True;
        L_bCardDownLoad := False;
        Exit; //FTP DownLoad �����̸� ���� ����
      end else
      begin
      end;
  {    if FTPDownLoad(inttostr(NodeNo),aECUID) then
      begin
        L_bCardDownLoad := False;
        Exit; //FTP DownLoad �����̸� ���� ����
      end;  }

    end;
  Except
    L_bCardDownLoad := False;
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       'carddownload','FTP DownLoad Error');
    Exit;
  end;

  Try
    //if CheckCardDownloadCount > 0 then Exit; //��� ���� ���·� ������ �ȳ��� ���� ��찡 �߻��� ������ ����...

    stSql := 'Update TB_DEVICECARDNO Set DE_RCVACK = ''R'' '; //�۽� �غ� ���·� ����
    stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ' ;
    //stSql := stSql + ' AND DE_RCVACK <> ''S'' ';              //�۽����� �ƴ� ������
    if NodeNo <> 0 then   //��ü�۽�
    begin
      stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;
      stSql := stSql + ' AND AC_NODENO = ' + inttostr(NodeNo) ;
    end;
    if (aAllSend = FALSE) then
    begin
      stSql := stSql + ' AND DE_RCVACK = ''N'' ' ;
    end else               //��ü ����
    begin
      stSql := stSql + ' AND DE_RCVACK <> ''S'' ' ;
    end;

    if G_bCardFixedUse then
    begin
      if DBTYPE = 'PG' then stSql := stSql + ' AND length(convert_to(ca_cardno ,''UHC'')) = ' + inttostr(G_nCardFixedLength) + ' '
      else stSql := stSql + ' AND Len(CA_CARDNO) = ' + inttostr(G_nCardFixedLength) + ' ';
    end;

    DataModule1.ProcessExecSQL(stSql);
//ErrorLogSave(ExeFolder + '\..\log\Debug'+ FormatDateTIme('yyyymmdd',Now)+'.log', 'carddownload',stSql);
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   'carddownload','Update TB_DEVICECARDNO Error');
  End;


  Try
    stSql := 'Select ';
    if DBTYPE = 'MSSQL' then stSql := stSql + ' top 100 ';
    stSql := stSql + 'a.ac_nodeno,a.ac_ecuid,a.ca_cardno,';
    stSql := stSql + 'a.de_door1,a.de_door2,a.de_useaccess,a.de_usealarm,';
    stSql := stSql + 'a.de_timecode,a.de_permit,a.ac_mcuid,b.positionnum,b.ca_cardtype,c.em_retiredate, ';
    stSql := stSql + 'a.DE_DOOR3,a.DE_DOOR4,a.DE_DOOR5,a.DE_DOOR6,a.DE_DOOR7,a.DE_DOOR8, ';
    stSql := stSql + 'a.DE_ALARM0,a.DE_ALARM1,a.DE_ALARM2,a.DE_ALARM3,a.DE_ALARM4,a.DE_ALARM5,a.DE_ALARM6,a.DE_ALARM7,a.DE_ALARM8, ';
    stSql := stSql + 'c.DE_TIMECODEUSE,c.TC_GROUP,c.TC_TIME1,c.TC_TIME2,c.TC_TIME3 ,c.TC_TIME4,c.TC_WEEKCODE,a.DE_RCVACK,c.EM_MASTER,d.WG_TYPE  ';
    stSql := stSql + ' from TB_DEVICECARDNO a';
    stSql := stsql + ' Left Join TB_CARD b ';
    stSql := stSql + ' ON( a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.ca_cardno = b.ca_cardno ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE c ';
    stSql := stSql + ' ON( b.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
    stSql := stSql + ' AND b.EM_CODE = c.EM_CODE )';
    stSql := stSql + ' Left Join TB_WORKGUBUN d ';
    stSql := stSql + ' ON( c.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND c.WG_CODE = d.WG_CODE)';
    stSql := stSql + ' Where a.DE_RCVACK = ''R'' ';
    stSql := stSql + ' AND a.GROUP_CODE = ''' + GROUPCODE + ''' ' ;
    if G_bCardFixedUse then
    begin
      if DBTYPE = 'PG' then stSql := stSql + ' AND length(convert_to(a.ca_cardno ,''UHC'')) = ' + inttostr(G_nCardFixedLength) + ' '
      else stSql := stSql + ' AND Len(a.CA_CARDNO) = ' + inttostr(G_nCardFixedLength) + ' ';
    end;
    (*
    if ConnectDeviceList.Count > 0 then
    begin
      stSql := stSql + ' AND (';
      for i:=0 to ConnectDeviceList.Count - 1 do
      begin
        if i <> 0 then stSql := stSql + ' OR ';
        stSql := stSql + '(a.AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
        stSql := stSql + ' AND a.AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''')';
      end;
      stSql := stSql + ' ) ';
    end else
    begin
      L_bCardDownLoad := False;
      Exit;
    end;
    *)
    stSql := stSql + ' order by a.de_permit,a.ca_cardno ';
    if DBTYPE = 'PG' then stSql := stSql + ' LIMIT 100 OFFSET 0 ';
  Except
    L_bCardDownLoad := False;
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   'carddownload','ConnectDeviceList Memory Error');
    Exit;
  End;
//ErrorLogSave(ExeFolder + '\..\log\Debug'+ FormatDateTIme('yyyymmdd',Now)+'.log','carddownload',stSql);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
{$IFDEF DEBUG}
  ErrorLogSave(ExeFolder + '\..\log\carddown'+ FormatDateTIme('yyyymmddhh',Now)+'.log',
               '1253','3-0');
{$ENDIF}
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
{$IFDEF DEBUG}
  ErrorLogSave(ExeFolder + '\..\log\carddown'+ FormatDateTIme('yyyymmddhh',Now)+'.log',
               '1253','3-1');
{$ENDIF}
        Open;
{$IFDEF DEBUG}
  ErrorLogSave(ExeFolder + '\..\log\carddown'+ FormatDateTIme('yyyymmddhh',Now)+'.log',
               '1253','3-2');
{$ENDIF}
      Except
        on E : EDatabaseError do
          begin
            // ERROR MESSAGE-BOX DISPLAY
            ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       'carddownload',E.Message + stSql);
            Exit;
          end;
        else
          begin
            ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       'carddownload','Select Error' + stSql);
            Exit;
          end;

        Exit;
      End;

      //UpdateTB_DEVICECARDNO('R','S');


      if RecordCount > 0  then
      begin

        //DisableControls;
        //Memo1.Lines.Add('CardAutoDownCount:'+ inttostr(recordcount));
        First;
        Try
          while not eof do
          begin
            if G_bApplicationTerminate then Exit;

            stValidDate := Trim(FindField('em_retiredate').asString);
            if Length(stValidDate) <> 8 then stValidDate := '00000000';
            if Not IsDigit(stValidDate) then stValidDate := '00000000';
            stValidDate := copy(stValidDate,3,6); //��ȿ�Ⱓ

            aCardNo:= FindField('CA_CARDNO').asString;
            //Memo1.Lines.Add('CardAutoDownStart:'+ aCardNo);
            aDeviceID:= FillZeroNumber(FindField('AC_NODENO').asInteger,3);
            aDeviceID:= aDeviceID + FindField('AC_ECUID').AsString;
            if ConnectDeviceList.IndexOf(aDeviceID) < 0 then
            begin
              dmDBFunction.UpdateTB_DEVICECARDNO_CardNoState(inttostr(FindField('AC_NODENO').asInteger),FindField('AC_ECUID').AsString,aCardNo,'R','D'); //�۽� �غ����� ��� DisConnect �� ����
            end else
            begin
              dmDBFunction.UpdateTB_DEVICECARDNO_CardNoState(inttostr(FindField('AC_NODENO').asInteger),FindField('AC_ECUID').AsString,aCardNo,'R','S'); //�۽ŵ����� �۽������� ó��

              //UpdateTB_DEVICECARDNO_CardNoMemLoad(inttostr(FindField('AC_NODENO').asInteger),FindField('AC_ECUID').AsString,aCardNo,'Y'); //�޸� �ε����� ó��
              Try
                nPositionNum :=  FindField('positionnum').AsInteger;
              Except
                nPositionNum := 0; //���ΰ��
              End;

              if (FindField('DE_DOOR1').IsNull) or (Trim(FindField('DE_DOOR1').asstring) = '')  then aDoor1:='N'
              else aDoor1:= FindField('DE_DOOR1').asString;

              if (FindField('DE_DOOR2').IsNull) or (Trim(FindField('DE_DOOR2').asstring) = '') then aDoor2:='N'
              else aDoor2:= FindField('DE_DOOR2').asString;

              if (FindField('DE_USEACCESS').IsNull) or (Trim(FindField('DE_USEACCESS').asstring) = '')  then aAccess:='N'
              else aAccess:= FindField('DE_USEACCESS').asString;
              if ((FindField('DE_DOOR1').IsNull) or (Trim(FindField('DE_DOOR1').asstring) = '') or (FindField('DE_DOOR1').asstring = 'N')) and
                 ((FindField('DE_DOOR2').IsNull) or (Trim(FindField('DE_DOOR2').asstring) = '') or (FindField('DE_DOOR2').asstring = 'N')) and
                 ((FindField('DE_DOOR3').IsNull) or (Trim(FindField('DE_DOOR3').asstring) = '') or (FindField('DE_DOOR3').asstring = 'N')) and
                 ((FindField('DE_DOOR4').IsNull) or (Trim(FindField('DE_DOOR4').asstring) = '') or (FindField('DE_DOOR4').asstring = 'N')) and
                 ((FindField('DE_DOOR5').IsNull) or (Trim(FindField('DE_DOOR5').asstring) = '') or (FindField('DE_DOOR5').asstring = 'N')) and
                 ((FindField('DE_DOOR6').IsNull) or (Trim(FindField('DE_DOOR6').asstring) = '') or (FindField('DE_DOOR6').asstring = 'N')) and
                 ((FindField('DE_DOOR7').IsNull) or (Trim(FindField('DE_DOOR7').asstring) = '') or (FindField('DE_DOOR7').asstring = 'N')) and
                 ((FindField('DE_DOOR8').IsNull) or (Trim(FindField('DE_DOOR8').asstring) = '') or (FindField('DE_DOOR8').asstring = 'N'))
              then aAccess := 'N'; //1��,2�� ���� ���� ��� ������ ���Ա��� ���°���... 2011.06.09 ����

              if (FindField('DE_USEALARM').IsNull) or (Trim(FindField('DE_USEALARM').asstring) = '')  then aAlarm:='N'
              else aAlarm:= FindField('DE_USEALARM').asString;
              //20150813 ������� ���� �ο� �ϸ鼭 DE_USEALARM �� Null ���� ��
              //aAlarm:= FindField('DE_USEALARM').asString;

              if (FindField('DE_TIMECODE').IsNull) or (Trim(FindField('DE_TIMECODE').asstring) = '')  then aTimeCode:='0'
              else aTimeCode:= FindField('DE_TIMECODE').asstring[1];
              if (FindField('DE_PERMIT').IsNull) or (Trim(FindField('DE_PERMIT').asstring) = '')  then aPermit:='N'
              else aPermit:= FindField('DE_PERMIT').asString[1];

              if FindField('ca_cardtype').AsString <> '1' then aPermit:='N'; //��� ī�尡 �ƴϸ�
              if Not FindField('WG_TYPE').IsNull then
              begin
                if FindField('WG_TYPE').AsString <> '1' then aPermit:='N';  //���� ���� �ƴϸ�...
              end;

      {        if (FindField('DE_RCVACK').IsNull) or (Trim(FindField('DE_RCVACK').asstring) = '')  then aSend:='N'
              else aSend:= FindField('DE_RCVACK').asString;
      }
              if aPermit = 'L' then
              begin
                if aAccess = 'Y' then   //���� �㰡
                begin

                  if (aAlarm = 'Y') or
                     (FindField('DE_ALARM0').AsString = 'Y') or
                     (FindField('DE_ALARM1').AsString = 'Y') or
                     (FindField('DE_ALARM2').AsString = 'Y') or
                     (FindField('DE_ALARM3').AsString = 'Y') or
                     (FindField('DE_ALARM4').AsString = 'Y') or
                     (FindField('DE_ALARM5').AsString = 'Y') or
                     (FindField('DE_ALARM6').AsString = 'Y') or
                     (FindField('DE_ALARM7').AsString = 'Y') or
                     (FindField('DE_ALARM8').AsString = 'Y')
                  then aCardType:= '2' //ī��Ÿ�Լ���: 2=> ���� + ���
                  else                 aCardType:= '0'; //ī��Ÿ�Լ���: 0=> ����

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
                    if (FindField('DE_DOOR3').AsString = 'Y') or
                       (FindField('DE_DOOR4').AsString = 'Y') or
                       (FindField('DE_DOOR5').AsString = 'Y') or
                       (FindField('DE_DOOR6').AsString = 'Y') or
                       (FindField('DE_DOOR7').AsString = 'Y') or
                       (FindField('DE_DOOR8').AsString = 'Y') then
                    begin
                       aRegCode:= '3';
                       if (aAlarm = 'Y') or
                         (FindField('DE_ALARM0').AsString = 'Y') or
                         (FindField('DE_ALARM1').AsString = 'Y') or
                         (FindField('DE_ALARM2').AsString = 'Y') or
                         (FindField('DE_ALARM3').AsString = 'Y') or
                         (FindField('DE_ALARM4').AsString = 'Y') or
                         (FindField('DE_ALARM5').AsString = 'Y') or
                         (FindField('DE_ALARM6').AsString = 'Y') or
                         (FindField('DE_ALARM7').AsString = 'Y') or
                         (FindField('DE_ALARM8').AsString = 'Y')
                       then aCardType:= '2' //ī��Ÿ�Լ���: 2=> ���� + ���
                       else                 aCardType:= '0'; //ī��Ÿ�Լ���: 0=> ����
                    end else
                    begin
                      if (aAlarm = 'Y') or
                         (FindField('DE_ALARM0').AsString = 'Y') or
                         (FindField('DE_ALARM1').AsString = 'Y') or
                         (FindField('DE_ALARM2').AsString = 'Y') or
                         (FindField('DE_ALARM3').AsString = 'Y') or
                         (FindField('DE_ALARM4').AsString = 'Y') or
                         (FindField('DE_ALARM5').AsString = 'Y') or
                         (FindField('DE_ALARM6').AsString = 'Y') or
                         (FindField('DE_ALARM7').AsString = 'Y') or
                         (FindField('DE_ALARM8').AsString = 'Y')
                      then aCardType:= '1' //ī��Ÿ�Լ���: 1=> ��� ����
                      else
                      begin
                        aRegCode:= '0';
                        aPermit:= 'N';
                      end;
                    end;
                  end;
                end else if (aAlarm = 'Y') or
                         (FindField('DE_ALARM0').AsString = 'Y') or
                         (FindField('DE_ALARM1').AsString = 'Y') or
                         (FindField('DE_ALARM2').AsString = 'Y') or
                         (FindField('DE_ALARM3').AsString = 'Y') or
                         (FindField('DE_ALARM4').AsString = 'Y') or
                         (FindField('DE_ALARM5').AsString = 'Y') or
                         (FindField('DE_ALARM6').AsString = 'Y') or
                         (FindField('DE_ALARM7').AsString = 'Y') or
                         (FindField('DE_ALARM8').AsString = 'Y')
                then  // ���� X ,����� OK
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

              stAlarmAreaGrade := CommonModule.GetAlarmAreaGrade(aAlarm,FindField('DE_ALARM0').AsString,FindField('DE_ALARM1').AsString,FindField('DE_ALARM2').AsString,
                                                    FindField('DE_ALARM3').AsString,FindField('DE_ALARM4').AsString,FindField('DE_ALARM5').AsString,
                                                    FindField('DE_ALARM6').AsString,FindField('DE_ALARM7').AsString,FindField('DE_ALARM8').AsString,FindField('EM_MASTER').AsString);
              stDoorAreaGrade := CommonModule.GetDoorAreaGrade(aAccess,FindField('DE_DOOR1').AsString,FindField('DE_DOOR2').AsString,FindField('DE_DOOR3').AsString,
                                                  FindField('DE_DOOR4').AsString,FindField('DE_DOOR5').AsString,FindField('DE_DOOR6').AsString,
                                                  FindField('DE_DOOR7').AsString,FindField('DE_DOOR8').AsString);
              stCardGroup := '0';
              if Not FindField('TC_GROUP').IsNull then stCardGroup := FindField('TC_GROUP').AsString;
              stCardTimeCode := '0000';
              if FindField('TC_TIME1').AsString = 'Y' then stCardTimeCode[4] := '1';
              if FindField('TC_TIME2').AsString = 'Y' then stCardTimeCode[3] := '1';
              if FindField('TC_TIME3').AsString = 'Y' then stCardTimeCode[2] := '1';
              if FindField('TC_TIME4').AsString = 'Y' then stCardTimeCode[1] := '1';
              stCardTimeCode := BinaryToHex(stCardTimeCode);
              if Not FindField('TC_WEEKCODE').IsNull then
              begin
                if FindField('DE_TIMECODEUSE').AsString = 'Y' then
                 stCardWeekCode := '1' + FindField('TC_WEEKCODE').AsString
                else stCardWeekCode := '0' + FindField('TC_WEEKCODE').AsString;
              end else stCardWeekCode := '00000000';
              stCardWeekCode := BinaryToHex(stCardWeekCode);

              DeviceIndex:= DeviceList.IndexOf(aDeviceID);

              if DeviceIndex < 0 then
              begin
                ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                             '1253',aDeviceID+'�̵�� ���[ī��ٿ�ε�]');

                RealDataShow('','','Er','',aDeviceID+'�̵�� ���[ī��ٿ�ε�]',FindField('AC_NODENO').asInteger);
                //Memo1.Lines.Add('CardAutoDownLoadDeviceIndex Error');

              end else
              begin
                if ConnectDeviceList.IndexOf(aDeviceID) > -1 then  //Connect �� ���
                begin
                  if aAllSend then
                  begin
                    if aPermit = 'L' then aPermit := 'F';
                  end;
                  aDevice:= TDevice(DeviceList.Objects[DeviceIndex]);
                  if aDevice <> nil then
                  begin
                    aDevice.CD_Download(aCardNo,stValidDate, acardType, aRegCode, aTimeCode,aPermit,stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode,False,nPositionNum,UseCardPosition,'S');
                    StatusBar1.Panels[2].Text := 'DeviceCardDownLoad:'+ aCardNo;
                    //Memo1.Lines.Add('Device CardDownLoad:'+ aCardNo);
                  end;
                  L_nCardSendCount := L_nCardSendCount + 1; //ī�� �۽� �Ǽ��� ���� ��Ű��.
                  //Memo1.Lines.Add('CardAutoDownLoad:'+ inttostr(L_nCardSendCount) + aCardNo);
                end else
                begin
                  //Memo1.Lines.Add('CardAutoDownLoad:DisConnected'+ aDeviceID);
                end;
              end;
            end;
            //Memo1.Lines.Add('CardAutoDownLoad:DisConnected1');
            Next;
            //Memo1.Lines.Add('CardAutoDownLoad:DisConnected2');
            sleep(1);
            MyProcessMessage;  

            //Application.ProcessMessages;   //20131011 �����뿡�� ���� ���� �߻��ؼ� MyProcessMessage �� ���� ��
            //Memo1.Lines.Clear;
            //Memo1.Lines.Add('CardAutoDownLoad:DisConnected3');
          end;
        Except
          ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       'carddownload','DownLoad Error');

        End;
        //EnableControls;
  //      Edit1.Text := inttostr(L_nCardSendCount) + '/' + FormatDateTime('yyyymmdd:HH:MM:SS',Now);
      end;
{$IFDEF DEBUG}
  ErrorLogSave(ExeFolder + '\..\log\carddown'+ FormatDateTIme('yyyymmddhh',Now)+'.log',
               '1253','5');
{$ENDIF}

      //close;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
    L_bCardDownLoad := False;
    //Memo1.Lines.Add('CardAutoDownLoadEnd');
  End;
end;

procedure TfmMain.SendTimerTimer(Sender: TObject);
var
  I: Integer;
  emptyData: Integer;
  bWait:Boolean;
begin
  emptyData:= 0;
  if G_bApplicationTerminate then Exit;
  if Not L_bDaemonStart then Exit;

  SendTimer.Enabled := False;

  for I:= 0 to ComNodeList.Count -1 do
  begin
    if G_bApplicationTerminate then Exit;
    if L_bDaemonStop then Exit;
    Try
      if TCommNode(ComNodeList.Objects[I]).Open then TCommNode(ComNodeList.Objects[I]).ExecSendPacket;
      if TCommNode(ComNodeList.Objects[I]).ReserveSendDataList.Count = 0 then Inc(emptyData);
    Except
      //����
    End;
    (*
    if (TCommNode(ComNodeList.Objects[I]).QuickSendDataList.Count > 0)
       or (TCommNode(ComNodeList.Objects[I]).ReserveSendDataList.Count > 0)
       or (TCommNode(ComNodeList.Objects[I]).CardSendDataList.Count > 0) then
    begin
        //StatusBar1.Panels[5].Text := inttostr(TCommNode(ComNodeList.Objects[I]).QuickSendDataList.Count) + '/' + inttostr(TCommNode(ComNodeList.Objects[I]).ReserveSendDataList.Count);
        if (TCommNode(ComNodeList.Objects[I]).CardSendDataList.Count > 0) then
        begin
          RecvTimeCheck.Enabled := False;
          RecvTimeCheck.Enabled := True;  //�۽��Ұ� �ִ°Ŵ�.
        end;
        Try
          if TCommNode(ComNodeList.Objects[I]).Open then TCommNode(ComNodeList.Objects[I]).ExecSendPacket;
          if TCommNode(ComNodeList.Objects[I]).ReserveSendDataList.Count = 0 then Inc(emptyData);
        Except
          //����
        End;
    end;  *)
  end;
  Try
    if Not G_bApplicationTerminate then SendTimer.Enabled := True;
    StatusBar1.Panels[1].Text := inttostr(L_nCardAckCount) + '/' + inttostr(L_nCardSendCount);
  Except
  End;
end;

procedure TfmMain.DeviceRcvRegCardData(Sender: TObject;
  ReceiveData: string;NodeNO : integer;aCardType:integer);
var
  stECUID : string;
  stCardNo: String;
  stSql : String;
  stClientSendData : string;
  nCardNoLen : integer;
  i : integer;
  nCardNo : int64;
  chCmd : char;
  stCardTemp : string;
begin
  Try

    stECUID := copy(ReceiveData,15,2);
    chCmd:= ReceiveData[19];
    // �ڵ����� ���� Ÿ�Կ� ���缭 ī�� ������ ��ȯ,2014-09-19
    if isDigit(Copy(ReceiveData,25,2)) then
      nCardNoLen := strtoint(Copy(ReceiveData,25,2))
    else nCardNoLen := 0;
    if nCardNoLen = 0 then
    begin
      stCardNo:= Copy(ReceiveData,27,8);
      if G_nSpecialProgram = 3 then  //KTTELECOP ���ǵ����Ʈ�� 3�ڸ��� ���.
      begin
        stCardNo := DecodeCardNo(stCardNo,8,True);
        stCardNo := copy(stCardNo,1,6) + '00';
        nCardNo:= Hex2Dec64(stCardNo);
        stCardNo:= FillZeroNumber2(nCardNo,10);
      end else
      begin
        if IsNumericCardNo then
          stCardNo:= DecodeCardNo(stCardNo)
        else stCardNo:= DecodeCardNo(stCardNo,8,True);
      end;
      //�ø��� ī�� ������ ����
      if CARDLENGTHTYPE = 1 then //PC���� �������� ī�� ������̸� ī���ȣ ���� ��ŭ ����
      begin
        stCardNO := FillCharString(stCardNO,'*',G_nCardFixedLength);
      end else if CARDLENGTHTYPE = 2 then //ī�����̸�
      begin
        stCardNO := FillCharString(stCardNO + '0','*',11);
      end;
      stCardNo := GetFixedCardNoCheck(stCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);
    end else
    begin
      stCardNo:= Copy(ReceiveData,27,nCardNoLen);
      if aCardType = 2 then stCardNo := Hex2Ascii(stCardNo,True);
      if CARDLENGTHTYPE = 0 then  //PC���� �������� Ÿ������ ������̸�
      begin
        stCardNo := copy(stCardNo,1,8);
        if G_nSpecialProgram = 3 then  //KTTELECOP ���ǵ����Ʈ�� 3�ڸ��� ���.
        begin
          stCardNo := copy(stCardNo,1,6) + '00';
        end;
        if IsNumericCardno then   //����Ÿ���̸�
        begin
          nCardNo:= Hex2Dec64(stCardNo);
          stCardNo:= FillZeroNumber2(nCardNo,10);
        end;
      end else if CARDLENGTHTYPE = 2 then //ī�����̸�
      begin
(*        if nCardNoLen = 22 then  //KT������� ������
        begin
          stCardNo := Hex2Ascii(stCardNo);
        end;
*)
        stCardNo := copy(stCardNo,1,11);
        if stCardNo[10] = '*' then stCardNo[9] := '0'; //�ø��� ī���̸�
      end;
      stCardNo := GetFixedCardNoCheck(stCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);
    end;
    // �ڵ����� ���� Ÿ�Կ� ���缭 ī�� ������ ��ȯ,2014-09-19
    
    if dmAdoQuery.DupCheckTB_DEVICE_CARDNO(stCardNo,inttostr(NodeNO),stECUID) then  //Key ������ �����ϸ�
    begin
      //if dmAdoQuery.CardPermitCheck(stCardNo,inttostr(NodeNO),stECUID,'N') then
      if Uppercase(chCmd) = 'N' then
      begin
        if dmAdoQuery.CardPermitCheck(stCardNo,inttostr(NodeNO),stECUID,'N') then
           dmAdoQuery.CardPermitDelete(stCardNo,inttostr(NodeNO),stECUID,'N') // Permit �� 'N'�� �����ʹ� ���� �Ѵ�.
        else dmAdoQuery.CardRCV_ACKUpdate(stCardNo,inttostr(NodeNO),stECUID,'Y');  //n���� �Դµ� Permit �� N �� �ƴ� �����ʹ� ���ۿϷ� ǥ�� ���� ����͸����� ����ó�� ���ϴ� �κ� ������ 20120214
      end else dmAdoQuery.CardRCV_ACKUpdate(stCardNo,inttostr(NodeNO),stECUID,'Y');
    end else
    begin
      stCardTemp := stCardNo;
      if Length(stCardTemp) > 10 then
      begin
        if stCardTemp[9] = '0' then stCardTemp[9] := '*'
        else stCardTemp[9] := '0';
        if dmAdoQuery.DupCheckTB_DEVICE_CARDNO(stCardTemp,inttostr(NodeNO),stECUID) then  //Key ������ �����ϸ�
        begin
          if Uppercase(chCmd) = 'N' then
          begin
            if dmAdoQuery.CardPermitCheck(stCardTemp,inttostr(NodeNO),stECUID,'N') then
               dmAdoQuery.CardPermitDelete(stCardTemp,inttostr(NodeNO),stECUID,'N') // Permit �� 'N'�� �����ʹ� ���� �Ѵ�.
            else dmAdoQuery.CardRCV_ACKUpdate(stCardTemp,inttostr(NodeNO),stECUID,'Y');  //n���� �Դµ� Permit �� N �� �ƴ� �����ʹ� ���ۿϷ� ǥ�� ���� ����͸����� ����ó�� ���ϴ� �κ� ������ 20120214
          end else dmAdoQuery.CardRCV_ACKUpdate(stCardTemp,inttostr(NodeNO),stECUID,'Y');
        end;
      end;
    end;

    L_nCardAckCount := L_nCardAckCount + 1;   //ī������Ǽ��� ���� ��Ű��.
    if L_nCardSendCount <= L_nCardAckCount then
    begin
      if Not L_bCardDownLoad then
      begin
        L_nCardSendCount := 0;
        L_nCardAckCount := 0;
        dmDBFunction.UpdateTB_DEVICECARDNO_AllState('S','N');
      end;
    end;

    stClientSendData:= 'R' +
           'E' + //ECU
           FillZeroNumber(NodeNO,3) +
           stECUID +
           '00' + //DOORNO
           '00' + //READERNO
           'CR' + //'CR' ī��������
           'C' + // ī�嵥����
           FillZeroNumber(Length(stCardNo),3) +
           stCardNo;
      //���⿡�� ���ӵǾ� �ִ� Ŭ���̾�Ʈ�� ������ �۽�
      //SendClientData(stClientSendData); //--Ŭ���̾�Ʈ ���� Ȯ���� �ʿ� ��� ���� 2011.10.11

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

procedure TfmMain.FormResize(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - statusBar1.Panels[1].Width - statusbar1.Panels[3].Width - statusbar1.Panels[4].Width - statusbar1.Panels[5].Width - statusbar1.Panels[6].Width;
end;

function TfmMain.GetDevice(aDeviceNO: String): TDevice;
var
  DeviceIndex: Integer;
begin
  DeviceIndex:= DeviceList.Indexof(aDeviceNO);
  if DeviceIndex > -1 then Result:= TDevice(DeviceList.Objects[DeviceIndex])
  else Result:= nil;

end;

Function TfmMain.LoadNode(aFirst:Boolean=True) : Boolean;
var
  aCommNode   : TCommnode;
  oArmAreaRelayModeState : TArmAreaRelayModeState;

  aNodeStr : String;
  NodeNo   : Integer;
  IPStr       : String;
  nPort : integer;
  stKTTID : string;

  stSql : String;
  TempAdoQuery : TADOQuery;
  nCardType : integer;
  nSockType : integer;
  nIndex : integer;
begin
  L_nMaxNodeNo := 0;
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    if ComNodeList = nil then ComNodeList := TStringList.Create;
//    ComNodeList.Clear;
//    dmKTTControl.ListClear;

    // MCU List �� ����
    stSql := ' select a.*,b.FG_CODE from TB_ACCESSDEVICE a ';
    stSql := stSql + ' Left Join TB_FIREGROUP b ';
    stSql := stSql + ' ON( a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ) ';
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND a.AC_GUBUN = ''0'' ';
    stSql := stSql + ' AND a.AC_NETTYPE = ''' + NETTYPE + ''' ';
    stSql := stSql + ' AND a.AC_MEMLOAD = ''N'' ';
    if G_nMultiDaemon > 0 then //��Ƽ�����̸�
    begin
      stSql := stSql + ' AND a.AC_DAEMONGUBUN = ' + inttostr(G_nDaemonGubun) + ' ';
    end;
    stSql := stSql + ' Order by a.AC_NODENO ';

    //TCommmode �ε�
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //����ó��
        Exit;
      End;


      First;
      while not eof do
      begin
        if G_bApplicationTerminate then Exit;
        nCardType := CARDLENGTHTYPE ; //0-����(4Byte),1-����(G_nCardFixedLength �� ����)
        {TreeView �߰�}
        NodeNo:= FindField('AC_NODENO').asInteger;
        if L_nMaxNodeNo < NodeNo then L_nMaxNodeNo := NodeNo;
        IPStr:=  Trim(FindField('AC_MCUIP').asString);
        if Not IsDigit(FindField('AC_MCUPORT').asString) then nPort := 3000
        else nPort:= strtoint(FindField('AC_MCUPORT').asString);

        if Not FindField('AC_CARDBYTE').IsNull then nCardType := FindField('AC_CARDBYTE').AsInteger; //0-����(4Byte),1-����(G_nCardFixedLength �� ����)

        nSockType := 1;
        if Not FindField('AC_SOCKTYPE').IsNull then nSockType := FindField('AC_SOCKTYPE').AsInteger;

        aNodeStr:=  FillZeroNumber(NodeNo,3)+':'+ IPStr+':'+ inttostr(nPort);

        nIndex := ComNodeList.IndexOf('NODE'+InttoStr(NodeNo));
        if nIndex < 0 then
        begin
          {Create Commnode}
          aCommNode:= TCommNode.Create(Self);
          aCommNode.SocketConnected := False;
          aCommNode.No:= NodeNo;
          aCommNode.CardFixType := nCardType;
          aCommNode.SocketType := nSockType;
          aCommNode.FIREGUBUNCODE := FindField('FG_CODE').asString;
          //if UseDeviceServer then aCommNode.SocketType := 1
          //else aCommNode.SocketType := 2 ;

          aCommNode.NodeNoStr :=         aNodeStr;
          aCommNode.ConnectIP := IPStr;
          aCommNode.ConnectPort := nPort;
          aCommNode.OnRcvData:=           CommNodeReceve;
          aCommNode.OnSendData :=         CommNodeSend;
          aCommNode.OnRcvInvalidDevice:=  CommNodeRcvInvalidDevice;
          aCommNode.OnConnected :=        NodeConnected;

          KTTControlCenterAlarmListLoad(NodeNo,aCommNode);

          if (nSockType = 2) or (Trim(IPStr) <> '') then  //
          begin
            ComNodeList.AddObject('NODE'+InttoStr(aCommNode.No),aCommNode);
          end;
        end else
        begin
          TCommNode(ComNodeList.Objects[nIndex]).ConnectIP := IPStr;
          TCommNode(ComNodeList.Objects[nIndex]).ConnectPort := nPort;
          TCommNode(ComNodeList.Objects[nIndex]).Open := False;
        end;

        stKTTID := FindField('AC_MUXID').AsString + FindField('AC_DECODERID').AsString + FindField('AC_LINKUSID').AsString;
        if Trim(stKTTID) <> '' then
          dmKTTControl.DeviceAdd(stKTTID,FillZeroNumber(aCommNode.No,3));

        nIndex := ArmAreaRelayModeList.IndexOf(FillZeroNumber(NodeNo,3));
        if nIndex < 0 then
        begin
          oArmAreaRelayModeState := TArmAreaRelayModeState.Create(nil);
          ArmAreaRelayModeList.addObject(FillZeroNumber(NodeNo,3),oArmAreaRelayModeState);
        end;

        Next;
      end;
      if aFirst then dmKTTControl.LoadLastnSeq;
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
  stSql : string;
begin
  if  ComNodeList <> nil then
  begin
    for i:= ComNodeList.Count -1 downto 0  do
    begin
      if Assigned(ComNodeList.Objects[i]) then
      begin
        Try
          if TCommNode(ComNodeList.Objects[I]).Open then
          begin
            TCommNode(ComNodeList.Objects[I]).OldConnected := -1; //NF ��ȣ ������ ����.
            TCommNode(ComNodeList.Objects[I]).Open := False;
          end;
          Try
            TCommNode(ComNodeList.Objects[i]).Free;
          Except
            LogSave(ExeFolder + '\..\log\err' + formatdatetime('yyyymmdd',now) + '.log','UnLoadNode Error(' + inttostr(i) + ')');
          End;
        Except
          ComNodeList.Clear;
          Exit;
        End;
      end;

    end;
    ComNodeList.clear;
  end;
  dmKTTControl.ListClear;

  stSql := 'Update TB_ACCESSDEVICE set AC_MEMLOAD = ''N'' ';
  DataModule1.ProcessExecSQL(stSql);
  
end;

function TfmMain.LoadECU(aFirst:Boolean=True): Boolean;
var
  stSql : String;
  NodeNo,OldNodeNo    : Integer;
  aCommNode   : TCommnode;
  stDeviceID : string;
  aDevice     : TDevice;
  aDeviceType : CHAR;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    //DeviceList.Clear;

    // ECU List ��ü ����
    stSql := ' select a.* from TB_ACCESSDEVICE a ';
    if G_nMultiDaemon > 0 then //��Ƽ�����̸�
    begin
      stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND b.AC_GUBUN = ''0'' ';
      stSql := stSql + ' AND b.AC_DAEMONGUBUN = ' + inttostr(G_nDaemonGubun) + ' ';
      stSql := stSql + ' ) ';
    end;
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND a.AC_NETTYPE = ''' + NETTYPE + ''' ';
    stSql := stSql + ' AND a.AC_MEMLOAD = ''N'' ';
    stSql := stSql + ' order by a.AC_NODENO ';

    // ���
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //����ó��
        Exit;
      End;
      OldNodeNo:= 0;
      First;
      while not eof do
      begin
        if G_bApplicationTerminate then Exit;
        NodeNo:= FindField('AC_NODENO').asInteger;
        // Append Treeview
        if OldNodeNo <> NodeNo then
        begin
          aCommnode:= FindCommNode(NodeNo);
        end;
        OldNodeNo := NodeNo;
        stDeviceID:=FillzeroNumber(NodeNo,3) + FindField('AC_ECUID').asString;

        nIndex := DeviceList.IndexOf(stDeviceID);
        if nIndex < 0 then
        begin
          //Create TDevice
          aDevice:= TDevice.Create(Self);
          aDevice.NodeNo := NodeNo;
          aDevice.ECUID := FindField('AC_ECUID').asString;
          aDevice.DeviceID:= stDeviceID;
          aDevice.DeviceName := FindField('AC_DEVICENAME').AsString;


          if aCommnode <> nil then
          begin
            aDevice.CommNode            := aCommnode;

            //����Ÿ��
            if FindField('AC_ACTYPE').AsString = '' then aDeviceType := '0'
            else aDeviceType := FindField('AC_ACTYPE').AsString[1];

            if aDeviceType = '1' then aDevice.ACtype := dtAc
            else aDevice.ACtype := dtNothing ;


            //���Ÿ��
            if FindField('AC_PTTYPE').AsString = '' then aDeviceType := '0'
            else aDeviceType := FindField('AC_PTTYPE').AsString[1];
            if aDeviceType = '1' then aDevice.PTtype := dtPT
            else aDevice.PTtype := dtNothing ;

            //�ļ�Ÿ��
            if FindField('AC_FDTYPE').AsString = '' then aDeviceType := '0'
            else aDeviceType := FindField('AC_FDTYPE').AsString[1];
            aDevice.FoodAmtPer := 0;
            if aDeviceType = '1' then
            begin
              aDevice.FDtype := dtFD;
            end
            else aDevice.FDtype := dtNothing ;

            //����Ÿ��
            if FindField('AC_ATTYPE').AsString = '' then aDeviceType := '0'
            else aDeviceType := FindField('AC_ATTYPE').AsString[1];

           // �������
            case aDeviceType of
              '0': aDevice.ATtype:= dtNothing;  // �̻��
              '1': aDevice.ATtype:= dtAt;      // ������Ʈ ���
            end;

            //���Ÿ��
            if FindField('AC_DEVICETYPE').AsString = '' then aDeviceType := '1'
            else aDeviceType := FindField('AC_DEVICETYPE').AsString[1];
            aDevice.DeviceCode := FindField('AC_DEVICECODE').AsString; 
            aDevice.DeviceType := aDeviceType; //1:811,2:812,3:100,4:200

            aDevice.OnRcvTellogData     := DeviceRcvTellogData;
            aDevice.OnRcvAlarmData      := DeviceRcvAlarmData;         //�˶� ������
            aDevice.OnRcvInitAckData    := DeviceRcvInitAckData;       //�����
            aDevice.OnRegisterClear     := DeviceRegisterClear;        //�޸������ưŬ��
            aDevice.OnRcvRemoteAckData  := DeviceRcvRemoteAckData;     //�������� ����(�˶�)
            aDevice.OnRcvFTPProcessData  := DeviceRcvFTPProcessData;     //FTP ���ۻ��� üũ
            aDevice.OnRcvCardReadData   := DeviceRcvCardReadData;      //ī�� ���� ������
            aDevice.OnRcvChangeDoorData := DeviceRcvChangeDoorData;    //������ ����
            aDevice.OnRcvDoorControl    := DeviceRcvDoorControl;       //������
            aDevice.OnRcvDoorSetup      := DeviceRcvDoorSetup;         //������ ����
            aDevice.OnRcvRegCardData    := DeviceRcvRegCardData;       //ī�� �������
            aDevice.OnNotDefineData     := DeviceNotDefineData;
            aDevice.OnRcvRegSchedule    := DeviceRcvScheduleData;       //������ ������ ��� ����
            aDevice.OnRcvRegTimeCode    := DeviceRcvRegTimeCodeData;    //Ÿ���ڵ� ��� ����
            aDevice.OnErrorData         := DeviceErorData;
            aDevice.OnConnected         := DeviceConnected;
            aDevice.OnDoorManageModeChange := DoorMangageModeChange;  //���Թ� ���� ����
            aDevice.OnDoorPNModeChange := DoorPNModeChange;  //���Թ� ���� ����
            aDevice.OnDoorStateChange   := DoorStateChanged;  //���Թ� ���� ����
            aDevice.OnWatchModeChange   := DeviceWatchModeChange; //������ ����
            aDevice.OnDoorModeChange    := DoorModeChanged; //���Թ� ���º���
            aDevice.OnDeviceTypeChange    := DeviceTypeChange; //��Ʈ�ѷ� Ÿ�� �����
            aDevice.OnDeviceCodeChange    := DeviceCodeChange; //��Ʈ�ѷ� �ڵ� �����
            aDevice.OnFireStateChange    := FireStateChange; //��Ʈ�ѷ� �ڵ� �����
            aDevice.OnDeviceArmAreaDisArmEvent := DeviceArmAreaDisArmEvent; //�̰��ð� �˶� �߻�

            DeviceList.AddObject( stDeviceID,aDevice);
          end else
          begin
            //����Ÿ��
            if FindField('AC_ACTYPE').AsString = '' then aDeviceType := '0'
            else aDeviceType := FindField('AC_ACTYPE').AsString[1];

            if aDeviceType = '1' then TDevice(DeviceList.Objects[nIndex]).ACtype := dtAc
            else TDevice(DeviceList.Objects[nIndex]).ACtype := dtNothing ;


            //���Ÿ��
            if FindField('AC_PTTYPE').AsString = '' then aDeviceType := '0'
            else aDeviceType := FindField('AC_PTTYPE').AsString[1];
            if aDeviceType = '1' then TDevice(DeviceList.Objects[nIndex]).PTtype := dtPT
            else TDevice(DeviceList.Objects[nIndex]).PTtype := dtNothing ;

            //�ļ�Ÿ��
            if FindField('AC_FDTYPE').AsString = '' then aDeviceType := '0'
            else aDeviceType := FindField('AC_FDTYPE').AsString[1];
            TDevice(DeviceList.Objects[nIndex]).FoodAmtPer := 0;
            if aDeviceType = '1' then
            begin
              TDevice(DeviceList.Objects[nIndex]).FDtype := dtFD;
            end
            else TDevice(DeviceList.Objects[nIndex]).FDtype := dtNothing ;

            //����Ÿ��
            if FindField('AC_ATTYPE').AsString = '' then aDeviceType := '0'
            else aDeviceType := FindField('AC_ATTYPE').AsString[1];

           // �������
            case aDeviceType of
              '0': TDevice(DeviceList.Objects[nIndex]).ATtype:= dtNothing;  // �̻��
              '1': TDevice(DeviceList.Objects[nIndex]).ATtype:= dtAt;      // ������Ʈ ���
            end;

            //���Ÿ��
            if FindField('AC_DEVICETYPE').AsString = '' then aDeviceType := '1'
            else aDeviceType := FindField('AC_DEVICETYPE').AsString[1];
            TDevice(DeviceList.Objects[nIndex]).DeviceType := aDeviceType; //1:811,2:812,3:100,4:200
            TDevice(DeviceList.Objects[nIndex]).DeviceName := FindField('AC_DEVICENAME').AsString;

          end;
        end;
        dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(inttostr(NodeNo),FindField('AC_ECUID').asString,'AC_MEMLOAD','Y');

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
  stSql : string;
begin
  Try
    if  DeviceList <> nil then
    begin
      for i:= DeviceList.Count -1 downto 0 do
      begin
        if Assigned(DeviceList.Objects[i]) then
        begin
          TDevice(DeviceList.Objects[i]).CommNode := nil;
          TDevice(DeviceList.Objects[i]).Free;
        end;
      end;
      DeviceList.clear;
    end;
  Except
    LogSave(ExeFolder + '\..\log\err' + formatdatetime('yyyymmdd',now) + '.log','UnLoadECU Error(' + inttostr(i) + ')');
  End;
  stSql := ' Update TB_DOOR set DO_MEMLOAD = ''N'' ';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Update TB_ARMAREA set AR_MEMLOAD = ''N'' ';
  DataModule1.ProcessExecSQL(stSql);

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
  if G_bApplicationTerminate then Exit;
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

  stIP := TCommNode(Sender).ConnectIP;
  stPort := inttostr(TCommNode(Sender).ConnectPort);

  if G_bCommLogSave then
  begin
    if (cCommand <> 'e') and (cCommand <> 'a') then
      LogSave(ExeFolder + '\..\log\Comm'+ FormatDateTIme('yyyymmddhh',Now) + '.log','[RX]' + '(' + FillZeroNumber(NodeNO,3) + ')' +ReceiveData);
  end;
{  //Low Data Table�� Insert
  if L_stDaemonLogFullData = 'Y' then dmAdoQuery.TB_LOWDATAInsert(NodeNO,stIP,stPort,stECUID,'RX',cCommand,ReceiveData)
  else if (cCommand <> 'e') and (cCommand <> 'a') then //���������Ϳ� ACK �����ʹ� �α� ������ ����.
  dmAdoQuery.TB_LOWDATAInsert(NodeNO,stIP,stPort,stECUID,'RX',cCommand,ReceiveData);
}

  stNodeNo:= FillZeroNumber(NodeNO,3);
  //�ǽð��ۼ���ȭ�鿡 ���÷���
  RealDataShow(stIP,stECUID,'Rx',cCommand,ReceiveData,NodeNO);

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
  
  stIP := TCommNode(Sender).ConnectIP;
  stPort := inttostr(TCommNode(Sender).ConnectPort);

  if G_bCommLogSave then
  begin
    if (cCommand <> 'e') and (cCommand <> 'a') then
      LogSave(ExeFolder + '\..\log\Comm'+ FormatDateTIme('yyyymmddhh',Now) + '.log','[TX]' + '(' + FillZeroNumber(NodeNO,3) + ')' + SendData);
  end;
  //Low Data Table�� Insert
{  if L_stDaemonLogFullData = 'Y' then dmAdoQuery.TB_LOWDATAInsert(NodeNO,stIP,stPort,stECUID,'TX',cCommand,SendData)
  else if (cCommand <> 'e') and (cCommand <> 'a') then //���������Ϳ� ACK �����ʹ� �α� ������ ����.
  dmAdoQuery.TB_LOWDATAInsert(NodeNO,stIP,stPort,stECUID,'TX',cCommand,SendData);
}
  //�ǽð��ۼ���ȭ�鿡 ���÷���{TO DO}
  RealDataShow(stIP,stECUID,'Tx',cCommand,SendData,NodeNO);


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
  aMsg:= '���� ���� ���� ���:[ '+ inttostr(NodeNO) + ']'+ Copy(ReceiveData,8,9) + ' ' + ReceiveData;
  ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
              '���������',aMsg);

  stECUID:= Copy(ReceiveData,15,2);
  stIP := TCommNode(Sender).ConnectIP;
  stPort := inttostr(TCommNode(Sender).ConnectPort);

  cCommand:= ReceiveData[17];
  RealDataShow(stIP,stECUID,'Er',cCommand,aMsg,NodeNO);

end;

//�˶������� ���Ž� ������ ó�� ��ƾ...
procedure TfmMain.DeviceRcvAlarmData(Sender: TObject; cmd,ReceiveData: string;NodeNO : integer;FireGubunCode:string);
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
  stAlarmView : string;
  stAlarmSound : string;
  stAlarmGrade : string;
  stCheckOK : string;
  nOperLenth : integer;
  nOperStartPoint : integer;
  stCardNo : string;
  stCompanyCode,stEmCode : string;
  stTemp : string;
  bAlarmEventLog : Boolean;
  nCardFixType : integer;
begin
//  ReceiveData := stringReplace(ReceiveData,#0,'0',[rfReplaceAll]);
  nCardFixType := CARDLENGTHTYPE ;
  nIndex := ComNodeList.Indexof('NODE'+InttoStr(NodeNO));
  if nIndex > -1 then
  begin
    nCardFixType := TCommNode(ComNodeList.Objects[nIndex]).CardFixType;
  end;
  nOperStartPoint := 46;
  if nCardFixType = 0 then
  begin
    nOperLenth := 10;
    nOperStartPoint := 46;
  end else
  begin
    if AlarmEventLengthUse then
    begin
      nOperLenth := AlarmEventLength;
      nOperStartPoint := nOperStartPoint + 2;
    end else
    begin
      nOperLenth := 10;       
      nOperStartPoint := 46;
    end;
    //nOperLenth := 16;
    //nOperStartPoint := nOperStartPoint + 2;
  end;
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
    //stOper     := copy(ReceiveData,46,10);
    stOper     := copy(ReceiveData,nOperStartPoint,nOperLenth);
    stOper := Trim(stOper);       //���� �����Ͱ� ������ ��찡 �־ ó����.
    stOper := stringReplace(stOper,'''','',[rfReplaceAll]);
    stNewStateCode := stStatus;
    if (Trim(stStatus) = '') then stStatus := 'S' + stPortNo[2];

    if (Not G_bLineCheck) and (stStatus = 'PC') then Exit;   //ȸ�� üũ�� ó������ ����...

    stAlarmView := '0';
    stAlarmSound := '0';
    stAlarmGrade := '0';
    stCheckOK := 'Y';

    stCardNo := '';
    stCompanyCode := '';
    stEmCode := '';

    if (IsDigit(stTime)= False) or
       (IsDigit(stEcuID)= False) then  Exit;

    stMode:= UpperCase(stMode);
    if cmd = 'A' then
    begin
      if stStatus = '00' then
      begin
        //Mode Change StateCode
        stOper := StringReplace(stOper,'.KTLinkUs.','CtrlCenter',[rfReplaceAll]);
        nIndex := AlarmModeNotCardList.IndexOf(copy(stOper,1,10));
        if nIndex > -1 then
        begin
          if stMode = 'A' then
            stNewStateCode := TAlarmStatusCode(AlarmModeNotCardList.Objects[nIndex]).ALARMSTATUSCODE
          else stNewStateCode := TAlarmStatusCode(AlarmModeNotCardList.Objects[nIndex]).DISALARMSTATUSCODE;
        end else
        begin
          if stMode = 'A' then stNewStateCode := 'A1'
          else stNewStateCode := 'C1';
          stCardNo := stOper;
          if nCardFixType = 0 then  //���� 4Byte
          begin
            if Length(stCardNo) = 10 then delete(stCardNo,1,2);
            if CARDLENGTHTYPE = 0 then
            begin
              stCardNo := copy(stCardNo,1,8);
              if IsNumericCardno then stCardNo := FillZeroNumber2(Hex2Dec64(stCardNo),10);
            end else if CARDLENGTHTYPE = 1 then  //���� ī��
            begin
              stCardNO := FillCharString(stCardNO,'*',G_nCardFixedLength);
            end else if CARDLENGTHTYPE = 2 then  //PC���� KT���
            begin
              //stCardNO := FillCharString(stCardNO + '0','*',11);
            end;
          end else
          begin
            if CARDLENGTHTYPE = 0 then
            begin
              stCardNo := copy(stCardNo,1,8);
              if IsNumericCardno then stCardNo := FillZeroNumber2(Hex2Dec64(stCardNo),10);
            end;
          end;
          GetEmployeeInfoFromOper(stCardNo,stCompanyCode,stEmCode);
        end;
      end else if isDigit(stPortNo) then
      begin
        //Alarm StateCode
        nIndex := ZoneDetectList.IndexOf(stStatus);
        if nIndex < 0 then
        begin
          stAlarmView := '1';
          stAlarmSound := '1';
          stAlarmGrade := '9';
          stNewStateCode := 'Z' + stState;
        end;

        (*if stState = 'N' then
        begin
          stAlarmView := '0';
          stAlarmSound := '0';
          stAlarmGrade := '0';
        end; *)
      end;
    end;

    if stNewStateCode = 'NF' then
    begin
      if UpperCase(stSubCLass) = 'CD' then stNewStateCode := '31'
      else if (UpperCase(stSubCLass) = 'MN') or (UpperCase(stSubCLass) = 'EX') then stNewStateCode := '21';
    end else if stNewStateCode = 'NR' then
    begin
      if UpperCase(stSubCLass) = 'CD' then stNewStateCode := '32'
      else if (UpperCase(stSubCLass) = 'MN') or (UpperCase(stSubCLass) = 'EX') then stNewStateCode := '22';
    end else if stNewStateCode = 'CO' then
    begin
      if UpperCase(stSubCLass) = 'CD' then stNewStateCode := '33'
      else if (UpperCase(stSubCLass) = 'MN') or (UpperCase(stSubCLass) = 'EX') then stNewStateCode := '23';
    end else if stNewStateCode = 'CC' then
    begin
      if UpperCase(stSubCLass) = 'CD' then stNewStateCode := '34'
      else if (UpperCase(stSubCLass) = 'MN') or (UpperCase(stSubCLass) = 'EX') then stNewStateCode := '24';
    end;
    if stStatus = L_stFireStatus then
    begin
      stNewStateCode := 'FI';
      if stState = 'N' then
        stNewStateCode := 'F2';
    end;
    if (stNewStateCode = 'E1') and (stState = 'N') then stNewStateCode := 'E2';
    if (stNewStateCode = 'G1') and (stState = 'N') then stNewStateCode := 'G2';
    if (stNewStateCode = 'Q1') and (stState = 'N') then stNewStateCode := 'Q2';

    if (stAlarmView = '0') and (stAlarmSound = '0') then GetStatusCode(stNewStateCode,stAlarmView,stAlarmSound,stAlarmGrade);
    if (stAlarmView = '0') and (stAlarmSound = '0') then GetStatusCode(stStatus,stAlarmView,stAlarmSound,stAlarmGrade);

    if stNewStateCode = 'FI' then
    begin
      if cmd = 'A' then
      begin
        dmDBFunction.UpdateTB_CURRENTDAEMON_Field_StringValue('FIREORIGIN','CU_STATEVALUE','TRUE');
        if L_bFireAllOpen then
        begin
          //ȭ�簨���� ��ü����
          //DEBUG
          LogSave(ExeFolder + '\..\log\lomosHis.log','ȭ�簨����ü���� ');
          //LogSave(ExeFolder + '\..\log\Fire.log',ReceiveData);


          if isDigit(FireGubunCode) then
          begin
            if strtoint(FireGubunCode) <> 0 then  //��� ���ϴ� �׷�
            begin
              DataModule1.TB_SYSTEMLOGInsert('0','00','0','0','0',FireGubunCode + 'ȭ�簨����ü����');
              if FireBreakGubunList.IndexOf(FireGubunCode) < 0 then
                 FireBreakGubunList.Add(FireGubunCode);
              FireDoorOpenTimer.Enabled := True;
            end;
          end;
          //DoorAllOpenTimer.Enabled := True;
          {if Not L_bFierDoorOpen then
          begin
            L_bFierDoorOpen := True;
            Control_DoorAllOpenMode;
          end;     }

  //        L_bFirstFire := True;
        end;
      end;
    end;


    stClientSendData:= 'R' +
           'A' + //�˶�
           FillZeroNumber(NodeNO,3) +
           stECUID +
           '00' + //DOORNO
           '00' + //READERNO
           'PT' + //'PT' �˶���ȣ
           'C' + // ī�嵥����
           FillZeroNumber(Length(ReceiveData + ';' + stNewStateCode ),3) +
           ReceiveData + ';' +
           stNewStateCode;
      //���⿡�� ���ӵǾ� �ִ� Ŭ���̾�Ʈ�� ������ �۽�
      // SendClientData(stClientSendData);  -- ����͸��� �����ͷ��� ���̱� ���ؼ� �˶��ߺ� ��ȣ�� ��������.
      SendSettingData(stClientSendData);

    //DEBUG
    //LogSave(ExeFolder + '\..\log\lomosHis.log',stClientSendData);

    if (stAlarmView <> '0') or (stAlarmSound <> '0') then
        stCheckOK := 'N';

    if stMode = 'A' then //Alarm ��ȣ �ö� ���� �ܼ� ��ȣ���� ��Ʈ ��ȣ ���� üũ����
    begin
    end;
    if UpperCase(Cmd) = 'A' then
    begin
      //����͸��� �����ͷ��� ���̱� ���ؼ� �˶��ߺ� ��ȣ�� ��������.
      if stCheckOK = 'N' then SendClientData(stClientSendData);
    end;

    if UpperCase(Cmd) <> 'O' then   //���� ��ȸ �ƴ� �˶� �߻��ø� �̺�Ʈ ó�� ����.
    begin
      bAlarmEventLog := True;
      if G_nSpecialProgram = 4 then
      begin
        if G_stAlarmEventStartTime < G_stAlarmEventEndTime then
        begin
          if copy(stTime,9,4) < G_stAlarmEventStartTime then bAlarmEventLog := False
          else if copy(stTime,9,4) > G_stAlarmEventEndTime then bAlarmEventLog := False;
        end else
        begin
          if (copy(stTime,9,4) < G_stAlarmEventStartTime) and (copy(stTime,9,4) > G_stAlarmEventEndTime) then bAlarmEventLog := False;
        end;
        if Uppercase(stStatus) <> Uppercase('Q1') then bAlarmEventLog := True;
      end;
      if bAlarmEventLog then
      begin
        if G_nEventDBType = 0 then
        begin
          {�˶� ������ ������ ����}
          if Not DupCheckTB_ALARMEVENT(stTime,
                              inttostr(NodeNo),
                              stEcuID,
                              stMsgNo) then
          begin
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
                              stNewStateCode,
                              stAlarmView,
                              stAlarmSound,
                              stAlarmGrade,
                              stCheckOK,
                              stCardNo,
                              stCompanyCode,
                              stEmCode);
            dmKTTControl.AlarmEventProcess;
          end;
        end else
        begin
          //201402 DB ó�� �κ��� Timer�� ��ü
          stTemp := stTime + FillZeroNumber(NodeNo,3) + stEcuID + stMsgNo + stSubClass +
                    stSubAddr + stZoneCode + stMode[1] + stPortNo + stStatus + stState[1] +
                    FillSpace(stOper,20) + FillSpace(stNewStateCode,2) + stAlarmView[1] + stAlarmSound[1] +
                    stAlarmGrade[1] + stCheckOK[1] + FillSpace(stCardNo,20) + FillSpace(stCompanyCode,3) +
                    FillSpace(stEmCode,30);
          //AlarmEventList.Add(stTemp);
          if Not FileAppend(ExeFolder + '\Logdb\AlarmEvent' + FormatDateTime('yyyymmddhhnnss',now),stTemp,False) then
          begin
            //result := False;
          end;

        end;
      end;
      if G_nSpecialProgram = 6 then //�̳�н� ��õ �̸�
      begin
        if isDigit(stPortNo) then
        begin
          if stState <> 'N' then
          begin
            stTemp := FillZeroNumber(NodeNo,3) + stEcuID + FillZeroStrNum(stPortNo,2);
            if InnoNixAlarmEventList.IndexOf(stTemp) < 0 then
            begin
              InnoNixAlarmEventList.Add(stTemp);
            end;
          end;
        end;
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
  stClientSendData : string;
  stTemp : string;
begin
  stECUID := Copy(ReceiveData, 15,2);

  aRegCode:= Copy(ReceiveData,19,2);
  aRegGubun := Copy(ReceiveData,21,2);
  //40 K1123456700i1IF00���нý���      61
  if aRegCode = 'ID' then
  begin
    stTemp := copy(ReceiveData,23,7);
    Receive_RegControllerID(inttostr(NodeNo),stECUID,stTemp);
  end else if aRegCode = 'CD' then
  begin
    Receive_RegCardReaderInfo(inttostr(NodeNO),stECUID,ReceiveData);
  end else if aRegCode = 'SY' then
  begin
    if aRegGubun = '00' then
      Receive_RegSysteminfo(inttostr(NodeNo),stECUID,ReceiveData);
  end else if aRegCode = 'sy' then
  begin
    if aRegGubun = '00' then
      Receive_RegJaejungDelayUse(inttostr(NodeNo),stECUID,ReceiveData[23]);
  end else if aRegCode = 'RY' then
  begin
    //RcvRelay(ReceiveData)
  end else if aRegCode = 'LP' then
  begin
    Receive_RegPort(inttostr(NodeNo),stECUID,ReceiveData)
  end else if aRegCode = 'AD' then
  begin
    //RcvUsedAlarmdisplay(ReceiveData)
  end else if aRegCode = 'EX' then
  begin
    Receive_RegUsedDevice(inttostr(NodeNo),stECUID,ReceiveData,aRegGubun);
  end else if aRegCode = 'TN' then
  begin
    stTemp := copy(ReceiveData,23,Length(ReceiveData) - 22);
    Receive_RegKTTelNumber(inttostr(NodeNo),stECUID,stTemp);
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
    if aRegGubun = '00' then
    begin
      stTemp := copy(ReceiveData,23,4);
      Receive_RegLinkusId(inttostr(NodeNo),stECUID,stTemp);
    end;
  end else if aRegCode = 'Tn' then
  begin
    stTemp := copy(ReceiveData,23,Length(ReceiveData) - 24);
    Receive_RegLinkusTelNumber(inttostr(NodeNo),stECUID,stTemp);
  end else if aRegCode = 'Pt' then
  begin
    //RcvLinkusPt(ReceiveData);
  end else if aRegCode = 'Rc' then
  begin
    if aRegGubun = '00' then
    begin
      stTemp := copy(ReceiveData,23,4);
      Receive_RegRingCount(inttostr(NodeNo),stECUID,stTemp);
    end;
  end else if aRegCode = 'Ct' then
  begin
    Receive_RegCardType(inttostr(NodeNo),stECUID,ReceiveData);
  end else if aRegCode = '0@' then
  begin
    //RcvResetData(ReceiveData);
  end else if aRegCode = 'EL' then //��Ȯ��� �߰�
  begin
    //RcvZoneExInfo(ReceiveData);
  end else if aRegCode = 'DL' then
  begin
    if aRegGubun = '04' then Receive_JavaraSchedule(inttostr(NodeNo),stECUID,ReceiveData)   //�ڹٶ����� �߰�
    else if aRegGubun = '09' then Receive_DoorTimeCodeUse(inttostr(NodeNo),stECUID,ReceiveData);
  end;
  stClientSendData:= 'R' +
         'E' + //���
         FillZeroNumber(NodeNO,3) +
         stECUID +
         '00' + //DOORNO
         '00' + //READERNO
         'ST' + //'ST' Setup
         'C' + // ī�嵥����
         FillZeroNumber(Length(ReceiveData ),3) +
         ReceiveData;
    //���⿡�� ���ӵǾ� �ִ� STRŬ���̾�Ʈ�� ������ �۽�
  SendSettingData(stClientSendData);
end;

procedure TfmMain.DeviceRcvRemoteAckData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
var
  stCode : string;
  stGubun : string;
  stECUID : string;
  stRomVer : string;
  stTemp : string;
  nPos : integer;
  stClientSendData : string;
begin
  //037 K1123456700r1TM00050107180637EF
  stCode:= Copy(ReceiveData,19,2);
  stGubun:= Copy(ReceiveData,21,2);
  stECUID :=  copy(ReceiveData,15,2);
  if (stCode = 'VR') then
  begin
    if (stGubun = '00') then
    begin
      stRomVer :=Copy(ReceiveData,23,Length(ReceiveData)-24);
      dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(inttostr(NodeNO),stECUID,'AC_VER',stTemp);
    end else if (stGubun = '01') then
    begin
      stTemp :=Copy(ReceiveData,23,Length(ReceiveData)-24);
      dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(inttostr(NodeNO),stECUID,'AC_DEVICECODE',stTemp);
    end;
  end else if (stCode = 'fu') then //����Ȯ��
  begin
    if (stGubun = '01') or (stGubun = '00') then
    begin
      stRomVer :=Copy(ReceiveData,23,Length(ReceiveData)-24);
      dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(inttostr(NodeNO),stECUID,'AC_VER',stRomVer);
    end;
  end else if (stCode = 'fp') then
  begin
    nPos := Pos('ftp success',ReceiveData);
    if nPos > 0 then
    begin
      FTP_CardDataSendSuccess(NodeNO,stECUID);
    end;
  end;
  stClientSendData:= 'R' +
         'E' + //���
         FillZeroNumber(NodeNO,3) +
         stECUID +
         '00' + //DOORNO
         '00' + //READERNO
         'ST' + //'ST' Setup
         'C' + // ī�嵥����
         FillZeroNumber(Length(ReceiveData ),3) +
         ReceiveData;
    //���⿡�� ���ӵǾ� �ִ� STRŬ���̾�Ʈ�� ������ �۽�
  SendSettingData(stClientSendData);
  SendClientData(stClientSendData);  
end;

procedure TfmMain.DeviceRcvCardReadData(Sender: TObject;
  ReceiveData: string; NodeNO: integer;nDeviceCardType:integer);
Var
  stDate: String;
  stCardNo: String;
  bExitButton : Boolean;
  cDoorNo: Char;
  cPosi:    Char;
  cReaderNo: Char;
  cPermit: Char;
  stPermitStr: String;
  stClientSendData: string;
  stECUID: string;
  nTempIndex : integer;
  nInOutIndex : integer;
  stInOutcode : string;
  stInOutGroupCode : string;
  stInOutCount : string;
  stLocate: String;
  cInputtype: Char;
  stInputStr: String;
  cACType : Char;
  cPTType : char;
  cCardType : char;
  cRegCode:  Char;
  cTimeCode: Char;
  stTimeStr: String;
  cButton: Char;
  stTime: String;
  stSabun: String;
  cFoodCode: Char;
  stSql : string;
  stTemp:string;
  nCardNoLen : integer;
  nPositionNum : integer;
  stRcvPositionNum : string;
  bUseFoodDevice : Boolean;    //�ļ� ��� �������
  bUseACDevice : Boolean;      //���� ��� �������
  bUseATDevice : Boolean;      //���� ��� �������
  bUsePTDevice : Boolean;      //��� ��� �������
  stValidDate : string; //��ȿ�Ⱓ
  nPos : integer;
  nReaderNo : integer;

  stCompanyCode : string;
  stEmCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stEmName : string;
  nCardNo : int64;
  stOrgCardNo : string; //KTTelecop ��
  cDoorCheckNo : char;
  cCardManageMode : char;

  nWorkTypeIndex : integer;
  stAWCode : string;
  bGetEmployee : Boolean; //ī���ȣ�� ������� �������� ��������
  stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode : string;
  stEvent : string;
  nCardCheck : integer;
  oCardEmployeeInfo : TCardEmployeeInfo;
  stNodeNo : string;
  nAntiGroup : integer;
  nAntiPassSendResult : integer;
  cFoodResult : Char;
begin
//052K112345670022c
//E611005041616543900CC00F29905D185
  stNodeNo := FillZeroNumber(NodeNO,3);
  Try
    bExitButton := False;
    if G_bCardLogSave then
      CDLogSave(ExeFolder + '\..\log\CDLOG'+ FormatDateTIme('yyyymmdd',Now)+'.log',ReceiveData);
    if Length(ReceiveData) < 49 then
    begin
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   ERR_PACKET_0001,'ī�����Ե�����:'+ReceiveData);
      Exit;
    end;

    stECUID:=    Copy(ReceiveData,15,2);
    cDoorNo:=     ReceiveData[21];
    cReaderNo:=   ReceiveData[22];
    if Not isDigit(cReaderNo) then cReaderNo := '0';
    cPosi:=       ReceiveData[23];
    cCardManageMode := ReceiveData[36];
    cButton:= ReceiveData[41];
//    if Not IsDigit(cButton) then cButton := '0';

    stClientSendData:= 'R' +
           'E' + //ECU
           stNodeNo +
           stECUID +
           '0' + cDoorNo + //DOORNO
           '0' + cReaderNo + //READERNO
           'AC' + //'AC' ����
           'C' + // ī�嵥����
           FillZeroNumber(Length(ReceiveData) + 2,3) +
           ReceiveData + ';' + inttostr(nDeviceCardType);
      //���⿡�� ���ӵǾ� �ִ� Ŭ���̾�Ʈ�� ������ �۽�
    //SendClientData(stClientSendData);

    stTimeStr:= Copy(ReceiveData,24,12);
    stTimeStr:= '20'+ stTimeStr;

    if not isDigit(stTimeStr) then
    begin
       ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                    ERR_PACKET_0001,'ī�����Ե�����:'+ReceiveData);
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
      'C': stInputStr:= 'ī�帮��';
      'P': stInputStr:= '��ȭ';
    else stInputStr:= cInputType;
    end;

    cPermit:= ReceiveData[39];
    // �ڵ����� ���� Ÿ�Կ� ���缭 ī�� ������ ��ȯ,2014-09-19
    if isDigit(Copy(ReceiveData,42,2)) then
      nCardNoLen := strtoint(Copy(ReceiveData,42,2))
    else nCardNoLen := 0;
    stRcvPositionNum := '';

    if nCardNoLen = 0 then
    begin
      stTemp:= Copy(ReceiveData,44,8);
      if UseCardPosition then stRcvPositionNum := copy(ReceiveData,52,5);
      if G_nSpecialProgram = 3 then  //KTTELECOP ���ǵ����Ʈ�� 3�ڸ��� ���.
      begin
        stCardNo := DecodeCardNo(stTemp,8,True);
        stOrgCardNo := stCardNo;
        stCardNo := copy(stCardNo,1,6) + '00';
        nCardNo:= Hex2Dec64(stCardNo);
        stCardNo:= FillZeroNumber2(nCardNo,10);
        if stCardNo = '0000000000' then bExitButton := True;
      end else
      begin
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
      end;
      //�ø��� ī�� ������ ����
      if CARDLENGTHTYPE = 1 then //PC���� �������� ī�� ������̸� ī���ȣ ���� ��ŭ ����
      begin
        if Not bExitButton then stCardNO := FillCharString(stCardNO,'*',G_nCardFixedLength);
      end else if CARDLENGTHTYPE = 2 then //ī�����̸�
      begin
        if Not bExitButton then stCardNO := FillCharString(stCardNO + '0','*',11);
      end;
      if Not bExitButton then stCardNo := GetFixedCardNoCheck(stCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);
    end else
    begin
      stCardNo:= Copy(ReceiveData,44,nCardNoLen);
      if UseCardPosition then stRcvPositionNum := copy(ReceiveData,44 + nCardNoLen,5);
      stTemp := FillZeroNumber(0,nCardNoLen);
      if stCardNo = stTemp then bExitButton := True; //Exit ��ư ��������

      if Not bExitButton then
      begin
        if nDeviceCardType = 2 then
        begin
          stCardNo := Hex2Ascii(stCardNo,True);
          if stCardNo = '00000000000' then bExitButton := True; //Exit ��ư ��������
        end;
      end;
      if Not bExitButton then
      begin
        if CARDLENGTHTYPE = 0 then  //PC���� �������� Ÿ������ ������̸�
        begin
          stCardNo := copy(stCardNo,1,8);
          if G_nSpecialProgram = 3 then  //KTTELECOP ���ǵ����Ʈ�� 3�ڸ��� ���.
          begin
            stCardNo := copy(stCardNo,1,6) + '00';
          end;
          if IsNumericCardno then   //����Ÿ���̸�
          begin
            nCardNo:= Hex2Dec64(stCardNo);
            stCardNo:= FillZeroNumber2(nCardNo,10);
          end;
        end else if CARDLENGTHTYPE = 1 then    //��������Ÿ��
        begin
//          if nDeviceCardType = 2 then stCardNo := Hex2Ascii(stCardNo,True);
          //if IsNumericCardNo then stCardNo:= inttostr(Hex2Dec64(stCardNo));
        end else if CARDLENGTHTYPE = 2 then  //HEX2ASCII Ÿ��
        begin
//          if nDeviceCardType = 2 then stCardNo := Hex2Ascii(stCardNo,True);
          //stCardNo := stringReplace(stCardNo,#$0,#$1E,[rfReplaceAll]);
          nPos := Pos(#$0,stCardNo);
          if nPos > 0 then Exit;
          stCardNo := copy(stCardNo,1,11);
          if stCardNo[10] = '*' then stCardNo[9] := '0'; //�ø��� ī���̸�
        end;
        stCardNo := GetFixedCardNoCheck(stCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);
      end else
      begin
        if CARDLENGTHTYPE = 2 then stCardNo := '00000000000'; //��ǹ�ư�� 0�� 22���� �ö��
      end;
    end;
    // �ڵ����� ���� Ÿ�Կ� ���缭 ī�� ������ ��ȯ,2014-09-19
(*
    if CARDLENGTHTYPE = 0 then   //��������Ÿ���̸�
    begin
      if nCardNoLen > 0 then
      begin
        //STX������ ���� �� �� Ÿ �ý��� �����Ͱ� ��� �� ���
        ErrorLogSave(ExeFolder + '\..\log\ErrCard'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                    ERR_PACKET_0001,FillZeroNumber(NodeNO,3) + ReceiveData);
      end;
      stTemp:= Copy(ReceiveData,44,8);
      if UseCardPosition then stRcvPositionNum := copy(ReceiveData,52,5);
      if G_nSpecialProgram = 3 then  //KTTELECOP ���ǵ����Ʈ�� 3�ڸ��� ���.
      begin
        stCardNo := DecodeCardNo(stTemp,8,True);
        stOrgCardNo := stCardNo;
        stCardNo := copy(stCardNo,1,6) + '00';
        nCardNo:= Hex2Dec64(stCardNo);
        stCardNo:= FillZeroNumber2(nCardNo,10);
        if stCardNo = '0000000000' then bExitButton := True;
      end else
      begin
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
      end;
    end else
    begin
      if nCardNoLen = 0 then
      begin
        //KT��������� ���� �� �� STX�� ī��  �����Ͱ� ���� ���
        ErrorLogSave(ExeFolder + '\..\log\ErrCard'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                    ERR_PACKET_0001,FillZeroNumber(NodeNO,3) + ReceiveData);
        Exit;
      end;
      stCardNo:= Copy(ReceiveData,44,nCardNoLen);
      if UseCardPosition then stRcvPositionNum := copy(ReceiveData,44 + nCardNoLen,5);
      stTemp := FillZeroNumber(0,nCardNoLen);
      if stCardNo = stTemp then bExitButton := True; //Exit ��ư ��������

      if Not bExitButton then
      begin
        if CARDLENGTHTYPE = 1 then    //��������Ÿ��
        begin
            if IsNumericCardNo then stCardNo:= inttostr(Hex2Dec64(stCardNo));
        end else if CARDLENGTHTYPE = 2 then  //HEX2ASCII Ÿ��
        begin
          stCardNo := Hex2Ascii(stCardNo,True);
          //stCardNo := stringReplace(stCardNo,#$0,#$1E,[rfReplaceAll]);
          nPos := Pos(#$0,stCardNo);
          if nPos > 0 then Exit;
        end;
      end else
      begin
        if CARDLENGTHTYPE = 2 then stCardNo := '00000000000'; //��ǹ�ư�� 0�� 22���� �ö��
      end;

    end; *)

    if G_bACEventFull and bExitButton then //�����̷� ��ü �����...
    begin
{        stSql :=  'Insert into TB_ACCESSEVENT';
        stSql := stSql + '(GROUP_CODE,AC_DATE,AC_TIME,AC_NODENO,AC_ECUID,';
        stSql := stSql + 'DO_DOORNO,CA_CARDNO,AC_READERNO,AC_BUTTONNO,AC_DOORPOSI,AC_INPUTTYPE,';
        stSql := stSql + 'AC_DOORMODE,AC_PERMITMODE,PE_PERMITCODE,AC_INSERTDATE)';
        stSql := stSql + ' Values(';
        stSql := stSql + '''' + GROUPCODE + ''',';
        stSql := stSql + '''' + copy(stTimestr,1,8) + ''',';
        stSql := stSql + '''' + copy(stTimestr,9,6) + ''',';
        stSql := stSql + inttostr(NodeNo) + ',';
        stSql := stSql + '''' + stECUID + ''',';
        stSql := stSql + '''' + cDoorNo + ''',';
        stSql := stSql + '''' + copy(stCardNo,1,20) + ''',';
        stSql := stSql + '''' + cReaderNo + ''',';
        stSql := stSql + '''' + cButton + ''',';
        stSql := stSql + '''' + cPosi + ''',';
        stSql := stSql + '''' + cInputType + ''',';
        stSql := stSql + '''' + ReceiveData[37] + ''',';
        stSql := stSql + '''' + ReceiveData[36] + ''',';
        stSql := stSql + '''' + cPermit + ''',';
        stSql := stSql + '''' + FormatdateTime('yyyymmddHHMMSS',Now) + ''')';
}
        if G_nEventDBType = 0 then
        begin
          if Not dmAdoQuery.DupCheckTB_ACCESS_EVENT(stTimestr,NodeNO,stECUID,cDoorNo,stCardNo) then
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
                              ReceiveData[37],  //�/����
                              ReceiveData[36],  //Posi/Nega
                              cPermit,
                              FormatdateTime('yyyymmddHHMMSS',Now),
                              '000',
                              '',
                              '000',
                              '000',
                              '');
            //DataModule1.ProcessExecSQL(stSql);
            DataModule1.ProcessEventExecSQL(stSql);
          end;
        end else
        begin
          stEvent := stTimestr + stNodeNo + stEcuID + cDoorNo + FillSpace(stCardNo,20) +
                     cReaderNo + cButton + cPosi + cInputType + ReceiveData[37] + ReceiveData[36] +
                     cPermit + FormatdateTime('yyyymmddHHMMSS',Now) + FillZeroNumber(0,3) + FillSpace('',30) +
                     FillZeroNumber(0,3) + FillZeroNumber(0,3) + FillSpace('',100);
          //AccessEventList.Add(stEvent);
          if Not FileAppend(ExeFolder + '\Logdb\CardAccessEvent' + FormatDateTime('yyyymmddhhnnss',now),stEvent,False) then
          begin
            //result := False;
          end;

        end;
        SendClientData(stClientSendData); //����͸��� ����;
        Exit;
    end;
    if bExitButton then Exit; //��� ��ư�̸� ��������

    cDoorCheckNo := cDoorNo;
    if (cButton = 'a') or (cButton = 'c') then cDoorCheckNo := '0' //���� �� ���� ��ư ���� �� ��������� ��ȸ ����.
    else if (cPermit = 'C') or (cPermit = '2') or (cPermit = '3') or (cPermit = '4') then cDoorCheckNo := '0'; //��� ó���� ������� ����.
    if (cPermit = 'A') then cDoorCheckNo := 'A'; //�̵�� ī��� ���� �ϳ��� ���Ѹ� �־ ������ �ִ°Ŵ�.

    if cPosi = 'S' then Exit;  //�������� ������ �� ���
    //���⿡�� AntiPass ��� ������� üũ����.
    if cCardManageMode = '2' then
    begin
      if G_bGlobalAntiPass then
      begin
        nTempIndex := DeviceList.IndexOf(stNodeNo + stECUID);
        nAntiGroup := 0;
        if nTempIndex > -1 then
        begin
          if isDigit(cDoorNo) then
          begin
            nAntiGroup := TDevice(DeviceList.Objects[nTempIndex]).GetAntiGroup(strtoint(cDoorNo));
          end;
        end;
        if nAntiGroup > 0 then //��Ƽ�н��� ����ϴ� ����̴�.
        begin
          nAntiPassSendResult := AntiPassProcess(nAntiGroup,nTempIndex,stTimestr,inttostr(NodeNo),stECUID,cDoorNo,stCardNo,cReaderNo,cButton,cPosi,cInputType,ReceiveData[37],ReceiveData[36],cPermit);
          if nAntiPassSendResult = 1 then stClientSendData[17 + 39] := '1'
          else if nAntiPassSendResult = -2 then stClientSendData[17 + 39] := 'J';
          SendClientData(stClientSendData); //����͸��� ����;
          Exit;
        end;
      end;
    end;
    if G_nSpecialProgram = 5 then //��ȣ���б� �ļ� ����...
    begin
      if (cCardManageMode = '2') or (cCardManageMode = '3') or (cCardManageMode = '4') then  //Positive-Ack or Negative-ACK Or Positive-NAK ��� �ΰ��
      begin
        nTempIndex := DeviceList.IndexOf(stNodeNo + stECUID);
        if nTempIndex > -1 then
        begin
          if TDevice(DeviceList.Objects[nTempIndex]).FDtype = dtFD then
          begin
            if cCardManageMode <> '4' then   //Positive-NAK ���� ó�� ���� ���� ���� ������.
            begin
              cFoodResult := SonghoFoodProcess(nTempIndex,stTimestr,inttostr(NodeNo),stECUID,cDoorNo,stCardNo,cReaderNo,cButton,cPosi,cInputType,ReceiveData[37],cCardManageMode,cPermit);
              stClientSendData[17 + 39] := cFoodResult;
              SendClientData(stClientSendData); //����͸��� ����;

              if (cCardManageMode = '2') then FDSendClientData('P' + ';' + FoodCurrentFoodCode + ';' + stCardNo + ';' + stClientSendData);
            end;
            Exit;
          end;
        end;
      end;
    end;
    SendClientData(stClientSendData); //����͸��� ����;

    if G_bDeviceCardPermitSync then
    begin

      nCardCheck := -1;
      if (cPermit <> 'E')      //�������ѽð��� ���� üũ���� ����
         and ( cInputType <> 'P')    //��ȭ�� �� �����,
         and (cPermit <> 'G') then   //������ ���� üũ���� ����
      begin
        nCardCheck := MemoryCardGradeCheck(stCardNo,stNodeNo,stECUID,cDoorCheckNo,cPermit,stValidDate);
      end;


      if nCardCheck = -2 then   //�޸� ������ Ʋ��... ���� üũ ����.
      begin
        if dmAdoQuery.CheckPermit(stCardNo,NodeNo,stECUID,cDoorCheckNo,stRcvPositionNum,UseCardPosition,cACType,cPTType,cRegCode,cTimeCode,nPositionNum,
                                  stValidDate,stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode) then
        begin  // �������̺�� ������ �����ϴ�.
          if ( (cPermit <> '1') and ( cDoorCheckNo <> '0') ) or //���Թ��� ���ԺҰ��� ����̰ų�
             ( ( Not ((cPermit = '2') or (cPermit = '3') or (cPermit = '4')) ) and ( cDoorCheckNo = '0') ) or //��������� ����Ұ��� ���
             ( cDoorCheckNo = 'A' ) then //�̵��ī���� ���
          begin
          //if (cPermit <> #$31) and  (cPermit <> #$32) then    //�̽����̸�
          //begin
            {DBȮ�ΰ�� ����...}
            if (cACType = '1') AND (cPTType = '1') then cCardType := '2' //����+���
            else if (cACType = '1') then cCardType := '0' //��������
            else if (cPTType = '1') then cCardType := '1' //�������
            else cCardType := '3';
            if G_nSpecialProgram = 3 then
            begin
              nCardNo:= Hex2Dec64(stOrgCardNo);
              stCardNo:= FillZeroNumber2(nCardNo,10);
            end;
            TDevice(Sender).CD_DownLoad(stCardNo,stValidDate,cCardType,cRegCode,cTimeCode,'L',stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode,True,nPositionNum,UseCardPosition,'S',-1);  //���� �ٿ�ε�
          end else
          begin
            if cRegCode <> '5' then
            begin
              //�޸𸮿� ������ ���µ� DB�� �´´ٸ� �޸𸮿� ���� �ε� ����.
              TDevice(Sender).MemoryCardAdd(stCardNo,stValidDate,cCardType,cRegCode,cTimeCode,'L',stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode,True,nPositionNum,UseCardPosition,'Y');
              if G_bCardDownloadLogSave then
              begin
                LogSave(ExeFolder + '\..\log\MEMLOAD_'+ FormatDateTIme('yyyymmdd',Now)+'.log',stCardNo + stValidDate + cCardType + cRegCode + cTimeCode + 'L' + stAlarmAreaGrade + stDoorAreaGrade + stCardGroup + stCardTimeCode + stCardWeekCode + 'True' + inttostr(nPositionNum));
              end;
            end;
          end;
        end else //���� ���̺�� ������ �ȸ´�.
        begin
          if cRegCode = '4' then //���� ������ ��� ���� ���� ������.
          begin
            TDevice(Sender).CD_DownLoad(stCardNo,stValidDate,'0','0','0','N',stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode,True,nPositionNum,UseCardPosition);   //������ �ƿ� ���� ���
          end else if cRegCode <> '5' then //DB Select ������ �ƴϸ�
          begin
            if (cACType = '1') AND (cPTType = '1') then cCardType := '2' //����+���
            else if (cACType = '1') then cCardType := '0' //��������
            else if (cPTType = '1') then cCardType := '1' //�������
            else cCardType := '3';
            TDevice(Sender).CD_DownLoad(stCardNo,stValidDate,cCardType,cRegCode,cTimeCode,'L',stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode,True,nPositionNum,UseCardPosition);  //���� �ٿ�ε�
          end;
  (*     //20160628 ��ġ ���� ����ϴµ� ��ġ���� �ȸ´� ��쵵 ������ ź��.
         if ( (cPermit = '1') and ( cDoorCheckNo <> '0') ) or //���Թ��� ���Խ����� �����
             ( ((cPermit = '2') or (cPermit = '3') or (cPermit = '4')) and ( cDoorCheckNo = '0') ) or  //��������� ��������� �����
             ( (cPermit = 'A') and ( cRegCode = '3') ) then     //�̵�� ī�忡 ������Ѹ� �ִ� ���
          begin
          //if (cPermit = #$31) or (cPermit = #$32) then  //�����㰡�̸� ���ѻ���
          //begin
            if cRegCode = '4' then //���� ������ ��� ���� ���� ������.
            begin
              TDevice(Sender).CD_DownLoad(stCardNo,stValidDate,'0','0','0','N',stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode,True,nPositionNum,UseCardPosition);   //������ �ƿ� ���� ���
            end else if cRegCode <> '5' then //DB Select ������ �ƴϸ�
            begin
              if (cACType = '1') AND (cPTType = '1') then cCardType := '2' //����+���
              else if (cACType = '1') then cCardType := '0' //��������
              else if (cPTType = '1') then cCardType := '1' //�������
              else cCardType := '3';
              TDevice(Sender).CD_DownLoad(stCardNo,stValidDate,cCardType,cRegCode,cTimeCode,'L',stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode,True,nPositionNum,UseCardPosition);  //���� �ٿ�ε�
            end;
          end else
          begin
            //�޸𸮿� ������ ���µ� DB�� �´´ٸ� �޸𸮿� ���� �ε� ����.
            if cRegCode = '4' then //DB�� ���� �ϸ� �޸𸮷ε� -- KT ������� 01���� ���� �ǰ� ���� ���� ���� ���� �޸� ���� �Ǵ� �� ������ ������ ������ �ȳ������� ���� ����
            begin
              //TDevice(Sender).MemoryCardAdd(stCardNo,stValidDate,'0','0','0','N',stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode,True,nPositionNum,UseCardPosition);
              //if G_bCardDownloadLogSave then
              //begin
              //  LogSave(ExeFolder + '\..\log\MEMLOAD_'+ FormatDateTIme('yyyymmdd',Now)+'.log',stCardNo + stValidDate + '0' + '0' + '0' + 'N' + stAlarmAreaGrade + stDoorAreaGrade + stCardGroup + stCardTimeCode + stCardWeekCode + 'True' + inttostr(nPositionNum));
              //end;
            end;
          end;
          *)
        end;
      end;
    end;

    //cAttendCode:= cPosi;

    {����}
    // ī�� ������ ���� ������ ��������� Ȯ���Ѵ�.
    // ����/��� ī�嵥���� ����

    bUseACDevice := False;
    if TDevice(Sender).ACtype <> dtNothing then bUseACDevice := True;

    bUseATDevice := False;
    if TDevice(Sender).ATtype  = dtAt then bUseATDevice := True;

    bUseFoodDevice := False;
    if TDevice(Sender).Fdtype <> dtNothing then bUseFoodDevice := True;

    bUsePTDevice := False;
    if TDevice(Sender).PTtype <> dtNothing then bUsePTDevice := True;

    nCardCheck := -1;
    //if G_nEventDBType = 1 then  //�޸� DB Ÿ�Ը� �޸𸮿��� ������� �о� ����.
    nCardCheck := MemoryCardEmployeeInfoCheck(stCardNo,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,stAWCode); //20150310 ��������� �׻� DB���� �о� ������ ó������...
    if nCardCheck = -1 then
    begin
      if CommonModule.GetEmployeeInfo_AWCODE(stCardNo,False,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,stAWCode) then
      begin
        bGetEmployee := True;
        //(* �泲��� ���� ��뷮 ����Ʈ������ �޸� �ε��� ���� �ʴ´�.
        nTempIndex := CardEmployeeInfoList.IndexOf(stCardNo);
        if nTempIndex < 0 then
        begin
          oCardEmployeeInfo := TCardEmployeeInfo.Create(nil);
          oCardEmployeeInfo.CompanyCode := stCompanyCode;
          oCardEmployeeInfo.JijumCode := stJijumCode;
          oCardEmployeeInfo.DepartCode := stDepartCode;
          oCardEmployeeInfo.EMCode := stEmCode;
          oCardEmployeeInfo.EmName := stEmName;
          oCardEmployeeInfo.AWCode := stAWCode;
          oCardEmployeeInfo.LoadDate := FormatDateTime('yyyymmdd',now);
          CardEmployeeInfoList.AddObject(stCardNo,oCardEmployeeInfo);
        end else
        begin
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).CompanyCode := stCompanyCode;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).JijumCode := stJijumCode;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).DepartCode := stDepartCode;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).EMCode := stEmCode;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).EmName := stEmName;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).AWCode := stAWCode;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).LoadDate := FormatDateTime('yyyymmdd',now);
        end;  //*)
      end else bGetEmployee := False;
    end else bGetEmployee := True;

    if Not bGetEmployee then    //������� ã�� ���� ���
    begin
      LoadDeviceCardNo(stCardNo);
    end;

    if bUseFoodDevice then
    begin
      // ��⿡�� �ڵ� ���������
      cFoodCode:= '0';
      if G_nEventDBType = 0 then
      begin
        if UpperCase(FOODDEVICE) = 'READER' then
          ProcessFoodData(stTimestr, stCardNo, stECUID,NodeNo,cReaderNo,cFoodCode,cPermit,stJijumCode,stDepartCode,stEmName)   //����
        else
          ProcessFoodData(stTimestr, stCardNo, stECUID,NodeNo,cDoorNo,cFoodCode,cPermit,stJijumCode,stDepartCode,stEmName);    //���Թ�
      end else
      begin
        if UpperCase(FOODDEVICE) = 'READER' then
        begin
          stEvent := stTimestr + FillSpace(stCardNo,20) + FillZeroNumber(NodeNo,3) + stEcuID + cReaderNo +
                     cFoodCode + cPermit + FillZeroStrNum(stCompanyCode,3) + FillZeroStrNum(stJijumCode,3) +
                     FillZeroStrNum(stDepartCode,3) + FillSpace(stEmName,100);
        end else
        begin
          stEvent := stTimestr + FillSpace(stCardNo,20) + FillZeroNumber(NodeNo,3) + stEcuID + cDoorNo +
                     cFoodCode + cPermit + FillZeroStrNum(stCompanyCode,3) + FillZeroStrNum(stJijumCode,3) +
                     FillZeroStrNum(stDepartCode,3) + FillSpace(stEmName,100);
        end;
        FoodEventList.Add(stEvent);
      end;
    end;
  //  if TDevice(Sender).ACtype <> dtNothing then
  //  begin
      // ���Ե����� �� �α�ó�� ��� ������.
    if G_nEventDBType = 0 then
    begin
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
                          stCompanyCode,
                          stEmCode,
                          stJijumCode,
                          stDepartCode,
                          stEmName);
        //DataModule1.ProcessExecSQL(stSql);
        DataModule1.ProcessEventExecSQL(stSql);
      end else
      begin
        ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                     '�ߺ�������(��������):',ReceiveData);
      end;
      if bUseACDevice then
      begin
       if InOutCountUse then
       begin
        if isDigit(cPermit) then // = #$31) or (cPermit = #$32) then  //���� �㰡�̸�
        begin
          stInOutcode := FillZeroNumber(NodeNo,3);
          stInOutCode := stInOutCode + stECUID ;
          stInOutCode := stInOutCode + cReaderNo ;
          nInOutIndex := InOutCardReaderList.IndexOf(stInOutCode);
          if nInOutIndex > -1 then //����� ����ϴ� Count
          begin
            stInOutCount := InOutCountList.Strings[nInOutIndex];
            UpdateTB_INOUTCOUNT_Add(copy(stTimestr,1,8),inttostr(NodeNo),stECUID,cDoorNo,stInOutCount);
            stInOutGroupCode := InOutGroupReaderList.Strings[nInOutIndex];
            if isDigit(stInOutCount) then
            begin
              if strtoint(stInOutCount) < 0 then
              begin
                //���
                DeleteTB_INOUTGROUPLIST(stInOutGroupCode,stCardNo);
              end else
              begin
                //�Խ�
                if Not InsertTB_INOUTGROUPLIST(stInOutGroupCode,stCardNo,
                                               inttostr(NodeNo),stECUID,cReaderNo,stTimestr ) then
                       UpdateTB_INOUTGROUPLIST(stInOutGroupCode,stCardNo,
                                               inttostr(NodeNo),stECUID,cReaderNo,stTimestr );

              end;
            end;
          end;
         end;
        end;
      end;
      //ī�� ���� ������ڸ� ������.
      stSql := 'Update TB_CARD set ca_lastuse = ''' + FormatDateTIme('yyyymmdd',Now) + ''' ';
      stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND ca_cardno = ''' + stCardNo + ''' ';
      DataModule1.ProcessExecSQL(stSql);
    end else
    begin
      stEvent := stTimestr + FillZeroNumber(NodeNo,3) + stEcuID + cDoorNo + FillSpace(stCardNo,20) +
                 cReaderNo + cButton + cPosi + cInputType + ReceiveData[37] + ReceiveData[36] +
                 cPermit + FormatdateTime('yyyymmddHHMMSS',Now) + FillZeroStrNum(stCompanyCode,3) + FillSpace(stEmCode,30) +
                 FillZeroStrNum(stJijumCode,3) + FillZeroStrNum(stDepartCode,3) + FillSpace(stEmName,100);
      //AccessEventList.Add(stEvent);
      if Not FileAppend(ExeFolder + '\Logdb\CardAccessEvent' + FormatDateTime('yyyymmddhhnnss',now),stEvent,False) then
      begin
        //result := False;
      end;
    end;
      (*
    //end;

    *)

    if bUseATDevice then  //���� Ÿ�� ����̸�
    begin
      if Not bGetEmployee then
      begin
        stClientSendData := 'R' +
                            'E' +
                            FillZeroNumber(NodeNO,3) +
                            stECUID +
                            '00' +
                            FillZeroNumber(strtoint(cReaderNo),2) +
                            'AT' +
                            'C' +
                            FillZeroNumber(Length(stCardNo) + 15 ,3) +
                            stTimestr +
                            ' ' +
                            stCardNo;

        ATSendClientData(Self,stClientSendData,NodeNO);
      end else
      begin
        if Trim(stAWCode) = '' then stAWCode := '001';
        if G_nAttendWorkingType <> 3 then stAWCode := '001'; //ȥ���� �ƴѰ�� ������ '001'�� �ν�����.

        if G_nEventDBType = 0 then
        begin
          nWorkTypeIndex := WorkTypeList.IndexOf(stAWCode);
          if nWorkTypeIndex < 0 then
          begin
            stClientSendData := 'R' +
                                'E' +
                                FillZeroNumber(NodeNO,3) +
                                stECUID +
                                '00' +
                                FillZeroNumber(strtoint(cReaderNo),2) +
                                'AT' +
                                'C' +
                                FillZeroNumber(Length(stCardNo) + 15 ,3) +
                                stTimestr +
                                ' ' +
                                stCardNo;

            ATSendClientData(Self,stClientSendData,NodeNO);
          end else
          begin
            TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).Process_EmployeeATEvent(stTimestr,FillZeroNumber(NodeNo,3),stECUID,stCardNo,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,cDoorNo,cReaderNo,cButton,cPosi);
          end;
        end else
        begin
          stEvent := FillSpace(stAWCode,3) + stTimestr + FillZeroNumber(NodeNo,3) + stEcuID + FillZeroStrNum(stCardNo,20) +
                     cDoorNo + cReaderNo + cButton +
                     FillZeroStrNum(stCompanyCode,3) + FillZeroStrNum(stJijumCode,3) +
                     FillZeroStrNum(stDepartCode,3) + FillSpace(stEmCode,30) + cPosi + FillSpace(stEmName,100);
          ATEventList.Add(stEvent);
        end;
      end;
    end;

    if G_nSpecialProgram = 1 then  //KT����̸� ���⿡�� ������ ���� �� ����.
    begin
      if Not bGetEmployee then  //����� ������ �°�쿡�� üũ ����.
      begin
        if Length(stCardNO) = 11 then
        begin
          if (copy(stCardNO,1,1) = '3') and (copy(stCardNO,10,2) = '01') then
          begin
            //���⿡�� �ش� ����� ī�带 ��������.
            nTempIndex := CardEmployeeInfoList.IndexOf(stCardNo);
            if nTempIndex > -1 then
            begin
              TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).Free;
              CardEmployeeInfoList.Delete(nTempIndex);
            end;

            stEmCode := copy(stCardNo,2,8);
            if Not KTEmployeeCardChange(stEmCode) then
               EmployeeNewCardChange(stEmCode,stCardNO);
          end;
        end;
      end;
    end;

    if bUsePTDevice then
    begin
      //��� �����ʹ� ���� ��ƾ�� ��Ž...
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

//������ ���� ������ ó��
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
  //19�� ~
  //D20000504161543370000O D3

  if Length(ReceiveData) < 40 then    Exit;

  stECUID := Copy(ReceiveData,15,2);
  stDoorNo:= ReceiveData[21];

  cMsgNo:=    ReceiveData[18];
  cDoorState:= ReceiveData[40];    //������
  cDoorMode:=  ReceiveData[37];    //�/����
  cDoorMode2:= ReceiveData[36];    //Posi/Nega

  //UpdateTB_DOOR_State(inttostr(NODENO),stECUID,stDoorNo,cDoorMode,cDoorMode2,cDoorState);
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
  cDoorMode:=  ReceiveData[25];    //�/����
  cDoorState:= ReceiveData[26];    //������

//  UpdateTB_DOOR_State(inttostr(NODENO),stECUID,stDoorNo,cDoorMode,cDoorMode2,cDoorState);

end;

procedure TfmMain.DeviceRcvDoorSetup(Sender: TObject; ReceiveData: string;
  NodeNO: integer);
var
  nDoorNo : integer;
  stData : string;
  stEcuID : string;
  MSG_Code : string;
  stDoorType : string;
  stControlTime : string;
  stFire : string;
  stOpenMoni : string;
  stSendDoor : string;
  stAlarmLong : string;
  stDsOpen : string;
  stRemoteDoor : string;
  stClientSendData : string;
  stSchUse : string;
  stReceiveCheckData : string;
begin
//         1         2
//123456789012345678901234567
//a11  0040000000100000000095
  {��� ����ȣ}


  Try
    stEcuID:= Copy(ReceiveData,15,2);
    MSG_Code:= ReceiveData[19];

    stData := Copy(ReceiveData,19,Length(ReceiveData)-20);
    if isDigit(stData[3])  then
    begin
      nDoorNo := StrtoInt(stData[3]);
    end else Exit;

    stDoorType := stData[16];
    stControlTime := stData[8];
    stFire := stData[17];
    stOpenMoni := stData[9];
    stSchUse := stData[10];
    stSendDoor := stData[11];
    stAlarmLong := stData[14];
    stDsOpen := stData[19];
    stRemoteDoor := stData[20];


    if (upperCase(MSG_Code) = 'B') then  //��� ��ȸ - ������ ��� �� ��� ��ȸ �� ������ �����Ͽ� �����ϱ� ����
    begin
      if G_nScheduleUsePacket = 1 then   //�ű� ��Ŷ���� ��Ͻ� �� �������� �Ѿ�´�.
      begin
        dmDBFunction.UpdateTB_DOOR_SCHUSE_Ack(inttostr(NodeNO),stEcuID,inttostr(nDoorNo),'Y');
        dmDBFunction.updateTB_DOOR_RcvSetting(inttostr(NodeNO),stEcuID,inttostr(nDoorNo),
                               stDoorType,stControlTime,stFire,stOpenMoni,stSendDoor,
                               stAlarmLong,stDsOpen,stRemoteDoor,'');
      end else
      begin
        dmDBFunction.updateTB_DOOR_RcvSetting(inttostr(NodeNO),stEcuID,inttostr(nDoorNo),
                               stDoorType,stControlTime,stFire,stOpenMoni,stSendDoor,
                               stAlarmLong,stDsOpen,stRemoteDoor,'R');
      end;
    end else if (upperCase(MSG_Code) = 'G')  then  //STR ��⼳�� ���
    begin
      stReceiveCheckData := 'DOORSETTINGINFO' + inttostr(nDoorNo);
      Process_STRReceive(FillZeroNumber(NodeNO,3) + stEcuID + stReceiveCheckData);
      dmDBFunction.UpdateTB_DEVICESETTINGINFO(inttostr(NodeNO),stEcuID,stReceiveCheckData,'Y');

      updateTB_DOOR_Info(inttostr(NodeNO),stEcuID,inttostr(nDoorNo),
                               stDoorType,stControlTime,stSchUse,stFire,stOpenMoni,stSendDoor,
                               stAlarmLong,stDsOpen,stRemoteDoor,'Y');
      DataModule1.TB_SYSTEMLOGInsert(inttostr(NodeNO),stECUID,DOORTYPE,inttostr(nDoorNo),'0000000000' , '���Թ���������') ;
    end else if (upperCase(MSG_Code) = 'A')  then  //��⼳�� ���
    begin
      UpdateTB_DOOR_Ack(inttostr(NodeNO),stEcuID,inttostr(nDoorNo),'Y');
    end;
    
    stClientSendData:= 'R' +
           'E' + //���
           FillZeroNumber(NodeNO,3) +
           stECUID +
           '00' + //DOORNO
           '00' + //READERNO
           'ST' + //'ST' Setup
           'C' + // ī�嵥����
           FillZeroNumber(Length(ReceiveData ),3) +
           ReceiveData;
      //���⿡�� ���ӵǾ� �ִ� STRŬ���̾�Ʈ�� ������ �۽�
    SendSettingData(stClientSendData);

    if L_bShowDeviceSetting then
    begin
      fmDeviceSetting.DoorInfoSetting(inttostr(NodeNo),stEcuID,inttostr(nDoorNo),stData);
    end else Exit;  //��⼳������ ������ ������ �ƴϸ� Exit;
    //if stData[1] <> 'g' then Exit;  //�����α׷������� 'g' �� �����
    if stData[1] <> 'a' then Exit;

    if nDoorNo > DOORCOUNT then    Exit;
    bDoorInfoSet[nDoorNo - 1] := True;
    UpdateTB_DOOR_Ack(inttostr(NodeNO),stEcuID,inttostr(nDoorNo),'Y');
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

procedure TfmMain.DeviceErorData(Sender: TObject; aData: string;
  NodeNO: integer);
var
  stMcuID : string;
  stEcuId : string;
  cMsgCode : char;
  stGubun : string;
begin
//042 K1000000000E8T00 Undefined Command57
//042 K1000000000E5U00 Undefined Command59
  stMcuID := Copy(aData,8,G_nIDLength);
  stEcuId:= Copy(aData,G_nIDLength + 8,2);
  cMsgCode:= aData[G_nIDLength + 12];
  if (Pos('Undefined Command',aData) > 0) or (Pos('DATA ERROR',aData) > 0 ) then
  begin
    case cMsgCode of
      'D' : begin
        stGubun := copy(aData,G_nIDLength + 13,3);
        if stGubun = 'L04' then UpdateTB_JAVARASCHEDULE_Ack(inttostr(NodeNo),stECUID,'Y')
        else if stGubun = 'L09' then dmDBFunction.UpdateTB_ACCESSDEVICE_TimeAsync(inttostr(NodeNo),stECUID,'S','Y');
      end;
      't','u','T','U': begin                     // Ÿ���ڵ� ����
        stGubun := copy(aData,G_nIDLength + 13,2);
        if stGubun = '00' then UpdateTB_TIMECODEDEVICE_AckAllGroup(inttostr(NodeNo),stECUID,'S','Y');
      end;
    end;
  end;

end;

function TfmMain.ProcessFoodData(aTime, aCardNo,  aECUID: string;aNodeNO:integer;
  aReaderNo, aFoodCode, aPermit: char;aJijumCode,aDepartCode,aEmName:string): Boolean;
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
  bYesterDay : Boolean;
  dtYesterDay : TDatetime;
  stFoodTime : string;
begin
  if isDigit(aPermit) then cPermit:= 'Y'    //#31 �Ǵ� #32 �̸� ���� �ƴϸ� N
  else                     cPermit:= 'N';

  if Not isDigit(aTime) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ļ��ð� ����' + ':' + aTime);
    Exit;
  end;

  if Length(aTime) < 14 then
  begin
    ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ļ��ð� ����' + ':' + aTime);
    Exit;
  end;
  bYesterDay := False;
  if copy(aTime,9,4) < L_stFoodYesterDayTime then
  begin
    bYesterDay := True; //������ ������ ����.
  end;

  Try
    wYear  := StrtoInt(Copy(aTime,1,4));
    wMonth := StrtoInt(Copy(aTime,5,2));
    wDay   := StrtoInt(Copy(aTime,7,2));
    wHour  := StrtoInt(Copy(aTime,9,2));
    wMinute:= StrtoInt(Copy(aTime,11,2));
    wSecond:= StrtoInt(Copy(aTime,13,2));

    dtPresent:= EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, wSecond,00);
  Except
    ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ļ��ð� ����' + ':' + aTime);
    Exit;
  end;
  dtYesterDay := dtPresent - 1;

  stFoodTime := aTime;
  if bYesterDay then
  begin
    stFoodTime := FormatDateTime('yyyymmdd',dtYesterDay) + copy(aTime,9,6);
  end;

  stFoodCode := '000'; // ����Ʈ�ڵ�
  
//  if FoodConfigCodeList.Count < 1 then Exit; //FoodCount �� ������ �ļ�ȯ�� ������ �����Ƿ� �׸�����
  Try
    for i:= 0 to FoodConfigCodeList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      wHour := strtoInt(copy(FoodConfigStartList.Strings[i],1,2));
      wMinute := strtoInt(copy(FoodConfigStartList.Strings[i],3,2));
      dtStartTime := EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, 00,00);
      wHour := strtoInt(copy(FoodConfigEndList.Strings[i],1,2));
      wMinute := strtoInt(copy(FoodConfigEndList.Strings[i],3,2));
      dtEndTime := EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, 00,00);
      if dtStartTime < dtEndTime then
      begin
        if (dtPresent >=  dtStartTime ) And (dtPresent <=  dtEndTime ) then
        begin
           stFoodCode:= FoodConfigCodeList.Strings[i];
           break;
        end;
      end else    //24�ð� �Ѿ�� ���
      begin
        if (dtPresent >=  dtStartTime ) or (dtPresent <=  dtEndTime ) then
        begin
           stFoodCode:= FoodConfigCodeList.Strings[i];
           break;
        end;
      end;
    end;
  Except
    ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ļ�ȯ�� ����' + ':' + aTime);
    Exit;

  End;

  //���⼭ �ļ� ���� ���α׷��� ������ �۽�
  stFoodData:= 'F'+ ';' + stFoodTime+ ';' + FillZeroNumber(aNodeNO,3) + aEcuID+ ';' + aReaderNo + ';' + aCardNo + ';' + cPermit + ';' + #$0D;
  FDSendClientData(stFoodData);

  if Not CommonModule.GetEmCode(aCardNo,stCompanyCode,stEmCode) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�̵��ī��' + ':' + stFoodData);
                       
    FDSendClientData('E' + ';' + aCardNo + ';;�̵��ī��;');
    Exit;
  end;

  if L_nFoodDupEvent = 1 then
  begin
    //�ļ� �̺�Ʈ �ߺ� �Ұ� ó���� �ļ� �ڵ� Ȯ�� ����.
    if stFoodCode = '000' then
    begin
      ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ļ� �ð��� ������');
      FDSendClientData('E' + ';' + stCompanyCode + ';' + stEmCode +';�ļ��ð��ܵ�����;');
      Exit; //�ļ� �ð� �ܿ� ������ ��� �Ұ� ó��
    end;
    if dmAdoQuery.DupEventCodeFOODEVENT(stFoodTime,stFoodCode,stCompanyCode,stEmCode) then
    begin
      ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ߺ��Ļ�');
      FDSendClientData('E' + ';' + stCompanyCode + ';' + stEmCode +';�ߺ��Ļ�;');
      Exit; //�ش����ڿ� �ش� �ڵ�� �ѹ� �̻��� �� �Դ´�.
    end;
  end;

  stDateStr:= Copy(stFoodTime,1,8);

  if FOODGRADE = 1 then //�������� ���� ���� üũ �ϴ� ���
  begin
    //���⿡�� aPermit �� üũ����...
    cPermit := GetCheckFoodPermit(Fillzeronumber(wYear,4),Fillzeronumber(wMonth,2),Fillzeronumber(wDay,2),stFoodCode,aCardNo);
    DeviceIndex:= DeviceList.Indexof(FillZeroNumber(aNodeNO,3) + aEcuID);

    //������ ��ȣ ������.
    if DeviceIndex > -1 then
    begin
      if cPermit = 'Y' then
      begin
        stRelay := 'RY0001f01';
        Tdevice(DeviceList.Objects[DeviceIndex]).SendPacket('R',stRelay,True);
      end else if cPermit = 'D' then
      begin
        stRelay := 'RY0002f01';
        Tdevice(DeviceList.Objects[DeviceIndex]).SendPacket('R',stRelay,True);
      end else
      begin
        stRelay := 'RY0003f01';
        Tdevice(DeviceList.Objects[DeviceIndex]).SendPacket('R',stRelay,True);
      end;
    end;
  end;

  if G_nSpecialProgram = 8 then //GS�������� �ļ� ����...
  begin
    if(cPermit = 'Y') then
    begin
      if dmFoodSummary.GSdepFoodSummary(stDateStr,stCompanyCode,stEmCode,stFoodCode) then
      begin
        FDSendClientData('P' + ';' + stCompanyCode + ';' + stEmCode);
      end;
    end;
  end;

  if not dmAdoQuery.DupCheckTB_FOOD_EVENT(stFoodTime,aNodeNo,aECUID,aReaderNo,stCompanyCode,stEmCode) then
  begin
      stSql := stSql + 'Insert into TB_FOODEVENT';
      stSql := stSql + '(GROUP_CODE,FO_DATE,FO_TIME,AC_NODENO,AC_ECUID,';
      stSql := stSql + 'FO_DOORNO,CO_COMPANYCODE,EM_CODE,FO_FOODCODE,FO_PERMIT,FO_INSERTTIME, ';
      stSql := stSql + 'CO_JIJUMCODE,CO_DEPARTCODE,EM_NAME) ';
      stSql := stSql + 'Values ';
      stSql := stSql + '(';
      stSql := stSql + '''' + GROUPCODE + ''',';
      stSql := stSql + '''' + copy(stFoodTime,1,8) + ''',';
      stSql := stSql + '''' + copy(stFoodTime,9,6) + ''',';
      stSql := stSql + inttostr(aNodeNo) + ',';
      stSql := stSql + '''' + aECUID + ''',';
      stSql := stSql + '''' + aReaderNo + ''',';
      stSql := stSql + '''' + stCompanyCode + ''',';
      stSql := stSql + '''' + stEmCode + ''',';
      stSql := stSql + '''' + stFoodCode + ''',';
      stSql := stSql + '''' + cPermit + ''',';
      stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
      stSql := stSql + '''' + aJijumCode + ''',';
      stSql := stSql + '''' + aDepartCode + ''',';
      stSql := stSql + '''' + aEmName + ''') ';

      DataModule1.ProcessEventExecSQL(stSql);

  end else
  begin
      ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ߺ�������');
  end;
end;

function TfmMain.GetFoodConfig(aInit:Boolean=True): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    if aInit then
    begin
      FoodConfigCodeList.Clear;
      FoodConfigStartList.Clear;
      FoodConfigEndList.Clear;
    end;

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
        if G_bApplicationTerminate then Exit;
        if aInit then
        begin
          FoodConfigCodeList.Add(FindField('FO_FOODCODE').AsString);
          FoodConfigStartList.Add(FindField('FO_STARTTIME').AsString );
          FoodConfigEndList.Add(FindField('FO_ENDTIME').AsString );
        end else
        begin
          nIndex := FoodConfigCodeList.IndexOf(FindField('FO_FOODCODE').AsString);
          if nIndex > -1 then
          begin
            FoodConfigStartList.Strings[nIndex] := FindField('FO_STARTTIME').AsString;
            FoodConfigEndList.Strings[nIndex] := FindField('FO_ENDTIME').AsString;
          end else
          begin
            FoodConfigCodeList.Add(FindField('FO_FOODCODE').AsString);
            FoodConfigStartList.Add(FindField('FO_STARTTIME').AsString );
            FoodConfigEndList.Add(FindField('FO_ENDTIME').AsString );
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
  Result := True;
end;



function TfmMain.GetAttendConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  dmAttend : TdmAttendEvent;
  stWorkTypeCode : string;
  nWorkTypeIndex : integer;
  i : integer;
begin
  Result := False;
  if WorkTypeList.Count > 0 then WorkTypeListClear;

  WorkTypeList.Clear;

  G_nAttendWorkingType := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''ATTEND'' ';
  with AttendADOTemp do
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
      if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
      begin
        if isdigit(FindField('CO_CONFIGVALUE').AsString) then
           G_nAttendWorkingType := strtoint(FindField('CO_CONFIGVALUE').AsString);
      end else if FindField('CO_CONFIGCODE').AsString = 'IOTIMEUSE' then
      begin
        if isdigit(FindField('CO_CONFIGVALUE').AsString) then
           G_nAttendIOTimeUse := strtoint(FindField('CO_CONFIGVALUE').AsString);
      end else if FindField('CO_CONFIGCODE').AsString = 'IOTIME' then
      begin
        if isdigit(FindField('CO_CONFIGVALUE').AsString) then
           G_nAttendIOTime := strtoint(FindField('CO_CONFIGVALUE').AsString);
      end;
      Next;
    end;

  End;


  stSql := 'select * from TB_ATWORKTYPE ';
  stSql := stSql + ' Order by AW_CODE ';

  with AttendADOTemp do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    While Not Eof do
    begin
      if G_bApplicationTerminate then Exit;
      dmAttend:= TdmAttendEvent.Create(Self);
      dmAttend.OnSendEvent := ATSendClientData;
      dmAttend.StringListClear;
      dmAttend.AttendWorkTypeCode := FindField('AW_CODE').AsString;
      dmAttend.AttendWorkingType := G_nAttendWorkingType;
      dmAttend.AtYesterDayStandTime := FindField('AW_YESTERDAYTIME').AsString;
      if isDigit(FindField('AW_SATURDAYTYPE').AsString) then
        dmAttend.SaturdayType := strtoint(FindField('AW_SATURDAYTYPE').AsString)
      else dmAttend.SaturdayType := 0;
      if isDigit(FindField('AW_DEVICETYPE').AsString) then
        dmAttend.ATDeviceType := strtoint(FindField('AW_DEVICETYPE').AsString)
      else dmAttend.ATDeviceType := 0;
      if isDigit(FindField('AW_FIXATTYPE').AsString) then
        dmAttend.ATOutFixedType := strtoint(FindField('AW_FIXATTYPE').AsString)
      else dmAttend.ATOutFixedType := 0;
      if isDigit(FindField('AW_NOTBACKUPTYPE').AsString) then
        dmAttend.ATWorkNotBackupType := strtoint(FindField('AW_NOTBACKUPTYPE').AsString)
      else dmAttend.ATWorkNotBackupType := 0;
      dmAttend.ATStartWorkNo:= FindField('AW_ATSTARTBUTTON').AsString;
      dmAttend.ATOffWorkNo:= FindField('AW_ATOFFBUTTON').AsString;
      if isDigit(FindField('AW_INOUTDEVICETYPE').AsString) then
        dmAttend.ATInOutDeviceType := strtoint(FindField('AW_INOUTDEVICETYPE').AsString)
      else dmAttend.ATInOutDeviceType := 0;
      dmAttend.ATWorkOutsideNo:= FindField('AW_WORKOUTBUTTON').AsString;
      dmAttend.ATWorkInNo:= FindField('AW_WORKINBUTTON').AsString;

      WorkTypeList.AddObject(FindField('AW_CODE').AsString,dmAttend);
      Next;
    end;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;



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

      if recordCount < 1 then Exit;
      First;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        stWorkTypeCode := '001';
        if Not FindField('AW_CODE').IsNull then
        begin
          if FindField('AW_CODE').AsString <> '' then stWorkTypeCode := FindField('AW_CODE').AsString; 
        end;
        nWorkTypeIndex := WorkTypeList.IndexOf(stWorkTypeCode);
        if nWorkTypeIndex > -1 then
        begin
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigCodeList_Add(FindField('AT_ATCODE').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigInFromTimeList_Add(FindField('AT_INFROMTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigInToTimeList_Add(FindField('AT_INTOTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigWorkTimeList_Add(FindField('AT_WORKSTARTTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigOutTimeList_Add(FindField('AT_WORKENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigExtendTimeList_Add(FindField('AT_EXTENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigNightTimeList_Add(FindField('AT_NIGHTTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSInFromTimeList_Add(FindField('AT_SINFROMTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSInToTimeList_Add(FindField('AT_SINTOTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSWorkTimeList_Add(FindField('AT_SWORKSTARTTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSOutTimeList_Add(FindField('AT_SWORKENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSExtendTimeList_Add(FindField('AT_SEXTENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigSNightTimeList_Add(FindField('AT_SNIGHTTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHInFromTimeList_Add(FindField('AT_HINFROMTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHInToTimeList_Add(FindField('AT_HINTOTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHWorkTimeList_Add(FindField('AT_HWORKSTARTTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHOutTimeList_Add(FindField('AT_HWORKENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHExtendTimeList_Add(FindField('AT_HEXTENDTIME').AsString);
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).AttendConfigHNightTimeList_Add(FindField('AT_HNIGHTTIME').AsString);
        end;

        Next;
      end;

{      stSql := 'select * from TB_CONFIG ';
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
          if G_bApplicationTerminate then Exit;
          if FindField('CO_CONFIGCODE').AsString = 'YTIME' then
            dmAttendEvent.AtYesterDayStandTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then
            dmAttendEvent.SaturdayType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then
            dmAttendEvent.ATDeviceType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
            dmAttendEvent.AttendWorkingType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE1' then
            dmAttendEvent.ATOutFixedType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'OUTTIME' then
            dmAttendEvent.ATWorkNotBackupType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'STARTWKNO' then
            dmAttendEvent.ATStartWorkNo := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'OFFWKNO' then
            dmAttendEvent.ATOffWorkNo := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'INOUTTYPE' then
            dmAttendEvent.ATInOutDeviceType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'WKOUTNO' then
            dmAttendEvent.ATWorkOutsideNo := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'WKINNO' then
            dmAttendEvent.ATWorkInNo := FindField('CO_CONFIGVALUE').AsString;

          next;
        end;
      end;  }

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
  if L_bDaemonRestart then Exit;
  btnDaemonRestart.Enabled := False;
  L_bDaemonRestart := True;
  //Delay(500);
  Action_DaemonstopExecute(self);
  Delay(2000);
  if G_bApplicationTerminate then Exit;
  Action_DaemonstartExecute(self);

  //���⿡�� ������ Restart �ϴ� ������ Client �� ���� ������...
  if G_bApplicationTerminate then Exit;
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

  ATSendClientData(Sender,stClientSendData,0);
  L_bDaemonRestart := False;
  btnDaemonRestart.Enabled := True;
end;

function TfmMain.GetDaemonConfig: Boolean;
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

    CARDLENGTHTYPE := 0; //����Ʈ�� ���� 4Byte ���
    DUPCARDTYPE := 0; //1�δ� ������ ī�� ��� ��Ģ
    IsNumericCardNo := True; //ī���ȣ ����Ÿ�� ���/�̻��

    L_bSendClientSequence := False;
    L_nSendClientTimer := 5;

    L_stDaemonServerIP := '127.0.0.1';
    L_stDaemonServerPort := '1000'; //����Ʈ ��Ʈ
    L_stAttendServerPort := '3433';
    L_stFoodServerPort := '3432';
    L_stFTPServerPort := '3001';
    L_stLongTimeState := '';

    UseDeviceServer := True; //�⺻������ ��Ⱑ ������ �����̴�.
    L_nDeviceServerPort1 := 3000;
    L_nDeviceServerPort2 := 3001;
    L_nDeviceServerPort3 := 3002;

    UseCardPosition := False; //ī�� ��ġ���� ��� ����
    G_bACEventFull := True;   //�����̷��� ��ü ������.
    G_nFTPUse := 0;           //FTP���
    G_nMultiDaemon := 0;      //���� �ܵ� ����
    G_nMultiSocket := 0;      //�ܵ� ����
    G_bCommLogSave := False;
    G_bCardLogSave := False;
    G_nScheduleDeviceAsync := 0;
    G_nScheduleDevice := 0;
    G_nScheduleUsePacket := 0;
    G_nMonitorSockType := 0; //TCP_IP���
    G_nModBusPort := 502;
    AlarmEventLengthUse := False; //�˶� �̺�Ʈ ó���� �������� ó����(STX/KT/��Ÿ)
    AlarmEventLength := 10;
    G_bTimeCodeUse := False;
    G_nEventDBType := 0;
    G_stAlarmEventStartTime := '0000';
    G_stAlarmEventEndTime := '2459';
    G_bCardMemoryLoad := False;
    G_bGlobalAntiPass := False;
    G_bDeviceCardPermitSync := True;

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND (CO_CONFIGGROUP = ''DAEMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''KT'' ';
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
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'PORT' then  L_stDaemonServerPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'ARMAREAUSE' then  G_nArmAreaUse := FindField('CO_CONFIGVALUE').asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'FTPPORT' then L_stFTPServerPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'ATPORT' then L_stAttendServerPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'FOODPORT' then
              L_stFoodServerPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'CONTRLPORT' then L_stCONTROLPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'STATEPORT' then L_stStatePort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'EVENTPORT' then L_stEventPort := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'MULTISOCK' then G_nMultiSocket := strtoint(FindField('CO_CONFIGVALUE').asstring)
        else if FindField('CO_CONFIGCODE').AsString = 'MODBUSPORT' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').asstring) then
          begin
            G_nModBusPort := FindField('CO_CONFIGVALUE').AsInteger;
          end;
        end
        else if FindField('CO_CONFIGCODE').AsString = 'IP' then L_stDaemonServerIP := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString= 'CLIENTCNT' then L_nDaemonAccecptClientCount := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'LOGINTYPE' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'FALSE' then L_bLogined := True
          else L_bLogined := False;
        end
        else if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then
          CARDLENGTHTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'DUPCARD' then DUPCARDTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'CARDNUM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then IsNumericCardNo := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'DEVICESVER' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then UseDeviceServer := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'DTOSPORT1' then
        begin
          if IsDigit(FindField('CO_CONFIGVALUE').AsString) then L_nDeviceServerPort1 := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'DTOSPORT2' then
        begin
          if IsDigit(FindField('CO_CONFIGVALUE').AsString) then L_nDeviceServerPort2 := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'DTOSPORT3' then
        begin
          if IsDigit(FindField('CO_CONFIGVALUE').AsString) then L_nDeviceServerPort3 := strtoint(FindField('CO_CONFIGVALUE').AsString);
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
        end else if FindField('CO_CONFIGCODE').AsString = 'USEARMLEN' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'TRUE' then AlarmEventLengthUse := False
          else AlarmEventLengthUse := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'LINECHECK' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'TRUE' then G_bLineCheck := False
          else G_bLineCheck := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'ALARMLEN' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then AlarmEventLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'SPECIALCD' then G_nSpecialProgram := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'SCHASYNC' then G_nScheduleDeviceAsync := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'SCHDEVICE' then G_nScheduleDevice := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'SCHUSEPACK' then G_nScheduleUsePacket := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'COMMLOG' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bCommLogSave := False
          else G_bCommLogSave := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'CARDLOG' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bCardLogSave := False
          else G_bCardLogSave := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'CARDMEMORY' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bCardMemoryLoad := False
          else G_bCardMemoryLoad := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'CLIENTSEQ' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'Y' then L_bSendClientSequence := False
          else L_bSendClientSequence := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'CLIENTTIME' then
        begin
          if isdigit(FindField('CO_CONFIGVALUE').AsString) then L_nSendClientTimer := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'CSOCKTYPE' then
        begin
          if isdigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitorSockType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'GLANTIUSE' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bGlobalAntiPass := False
          else G_bGlobalAntiPass := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'GLINITUSE' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nGlobalAntiInitUse := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else G_nGlobalAntiInitUse := 0;
        end else if FindField('CO_CONFIGCODE').AsString = 'GLINITTIME' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nGlobalAntiInitTime := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else G_nGlobalAntiInitTime := 0;
        end else if FindField('CO_CONFIGCODE').AsString = 'GLINITSTM' then
        begin
          G_stGlobalAntiInitStartTime := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'GLINITETM' then
        begin
          G_stGlobalAntiInitEndTime := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMECD' then
        begin
          L_stLongTimeState := Trim(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'TIMEUSE' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then G_bTimeCodeUse := True
          else G_bTimeCodeUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'EVENTDB' then
        begin
          if isdigit(FindField('CO_CONFIGVALUE').AsString) then G_nEventDBType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'EVENTSTART' then
        begin
          G_stAlarmEventStartTime := Trim(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'EVENTEND' then
        begin
          G_stAlarmEventEndTime := Trim(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'PGUPDATE' then
        begin
          G_dtProgramUpdateDate := strtodate(copy(FindField('CO_CONFIGVALUE').AsString,1,4) + '-' + copy(FindField('CO_CONFIGVALUE').AsString,5,2) + '-' + copy(FindField('CO_CONFIGVALUE').AsString,7,2) );
        end else if FindField('CO_CONFIGCODE').AsString = 'OLDEMPDEL' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '0' then G_bOldEmployDelete := False
          else G_bOldEmployDelete := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'CARDDLTUSE' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '0' then G_bCardDeleteUse := False
          else G_bCardDeleteUse := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'CARDDELETE' then
        begin
          G_nCardDeleteDay :=FindField('CO_CONFIGVALUE').AsInteger;
        end else if FindField('CO_CONFIGCODE').AsString = 'PERMITSYNC' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '0' then G_bDeviceCardPermitSync := False
          else G_bDeviceCardPermitSync := True;
        end;

        Next;
      end;
    end;
    
    if G_nMonitorSockType = 0 then ClientDBSocketClearTimer.Enabled := False
    else
    begin
      dmMonitoringServer.DBSocketInitialize;
      ClientDBSocketClearTimer.Enabled := True;
    end;

    if G_nGlobalAntiInitUse = 0 then G_nGlobalAntiInitTime := 0;
    
    if G_nEventDBType = 0 then DBProcessTimer.Enabled := False
    else
    DBProcessTimer.Enabled := True;
    if G_nSpecialProgram = 6 then   //�̳�н� ��õ �� ����
    begin
      WebRelayTimer.Enabled := True;
    end else
    begin
      WebRelayTimer.Enabled := False;
    end;
    ModBusServer.Stop;
    if G_nSpecialProgram = 7 then  //������ ���� - ���� �ø�������
    begin
      ModBusServer.ServerPort := G_nModBusPort;
      ModBusServer.Start;
    end;

    if G_nSpecialProgram = 1 then
    begin
      CARDLENGTHTYPE := 2 ;// KT ��� ���α׷��� ���� ������ HEX<->ASCII
      //G_bCardDeleteUse := True;
    end else if G_nSpecialProgram = 2 then
    begin
//      CARDLENGTHTYPE := 0;
//      IsNumericCardNo := True;
    end else if G_nSpecialProgram = 3 then
    begin
      CARDLENGTHTYPE := 0;
      IsNumericCardNo := True;
    end;

    if CARDLENGTHTYPE <> 0 then IsNumericCardNo := False;  //���� 4����Ʈ �ƴ� ��쿡�� ����Ÿ�� ������� ����.
    
    if L_stDaemonServerIP = '127.0.0.1' then
    begin
      L_stDaemonServerIP := FindCharCopy(Get_Local_IPAddr,0,' ');
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if G_nMultiDaemon > 0 then // ��Ƽ �����ΰ��
  begin
    if Not GetMultiDaemonConfig(L_stDaemonServerIP,L_stDaemonServerPort,L_stAttendServerPort,L_stFoodServerPort,L_stFTPServerPort) then
      G_nMultiDaemon := 0;
  end;
  CardDeleteTimer.Enabled := G_bCardDeleteUse;
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

  if ServerSocket1.Socket.ActiveConnections > L_nDaemonAccecptClientCount then
  begin
    ClientSocket.SendText('E' + '000' + 'Sorry! Max Client Connected.' + LINEEND);
    ClientSocket.Close;
  end
  else
  begin
    SocketThread := TMyServerThread.Create(False, ClientSocket);
  end;

end;

procedure TfmMain.RcvFromClient(aClientIP, ast: string);
var
  nIndex : integer;
  stCMD : string;
  stDeviceID : string;
  stData : string;
  bSendAll : Boolean;
  stTemp : string;
begin
  stTemp := ast;
  nIndex := pos(DATADELIMITER,ast);
  stCMD := Trim(copy(ast,1,nIndex - 1));
  Delete(ast,1,nIndex);
  nIndex := pos(DATADELIMITER,ast);
  stDeviceID := copy(ast,1,nIndex - 1);
  Delete(ast,1,nIndex);
  nIndex := pos(DATADELIMITER,ast);
  stData := '';
  if nIndex > 1 then
    stData := copy(ast,1,nIndex - 1);

  if stCMD = 'ALARMCHECK' then Check_AlarmSTATE(stDeviceID,Not L_bNotDeviceStateCheck)      //�������Ȯ��
  else if stCMD = 'ALARMDISABLE' then Control_AlarmModeChange(stDeviceID,'0')  //�������
  else if stCMD = 'ALARMREFRESH' then MonitorAlarmRefresh
  else if stCMD = 'ALARMSETTING' then Control_AlarmModeChange(stDeviceID,'1')  //���
  else if stCMD = 'ARMAREASTATE' then DaemonArmAreaState(stDeviceID)           //��� ���� 
  else if stCMD = 'BROADCAST' then BroadCastMonitorClient(stData)
  else if stCMD = 'CARDDOWNLOAD' then  //ī����Ѵٿ�ε�
  begin
    if ast[1] = 'Y' then bSendAll := True
    else bSendAll := False;
    CardNoDownload(strtoint(copy(stDeviceID,1,3)),copy(stDeviceID,4,2),bSendAll);
  end
  else if stCMD = 'CLOSEMODE' then Control_DoorModeChange(stDeviceID,'2')  //�����
  else if stCMD = 'MASTERMODE' then Control_DoorModeChange(stDeviceID,'3')  //�����͸��
  else if stCMD = 'DEAMONRESTART' then
  begin
    DaemonRestartTimer.Enabled := True;
    //Action_DaemonRestartExecute(self);
  end
  else if stCMD = 'DEVICEALLSTATE_II' then Process_DeviceAllState_II_MemorySave            //����Ȯ��
  else if stCMD = 'DEVICEALLSTATE_III' then Process_DeviceAllState_III_MemorySave            //����Ȯ��
  else if stCMD = 'DEVICEALLSTATE_IV' then Process_DeviceAllState_IV_MemorySave            //����Ȯ��
  else if stCMD = 'DEVICEALARMSTATE' then Check_DEVICEALARMSTATE(stDeviceID)      //������ �������Ȯ��
  else if stCMD = 'DIRECT' then DirectSendPacket(stDeviceID,stData)
  else if stCMD = 'DOOROPEN' then Control_DoorOpen(stDeviceID)               //���Խ���
  else if stCMD = 'FIRERECOVERY' then Control_DeviceFireRecovery(stDeviceID)
  else if stCMD = 'FTPDOWNLOAD' then
  begin
    FTPSendTimer.Enabled := True;
  end
  else if stCMD = 'NSCLOSEMODE' then Control_ScheduleDoorModeChange(stDeviceID,'2','0')  //������ �̻�� / �����
  else if stCMD = 'NSMASTERMODE' then Control_ScheduleDoorModeChange(stDeviceID,'3','0')  //������ �̻�� / �����͸��
  else if stCMD = 'NSOPENMODE' then Control_ScheduleDoorModeChange(stDeviceID,'1','0')     //������ �̻�� / ������
  else if stCMD = 'NSOPERATEMODE' then Control_ScheduleDoorModeChange(stDeviceID,'0','0')  //������ �̻�� / ����
  else if stCMD = 'OPENMODE' then Control_DoorModeChange(stDeviceID,'1')     //������
  else if stCMD = 'OPERATEMODE' then Control_DoorModeChange(stDeviceID,'0')  //����
  else if stCMD = 'PORTSTATE' then Search_PortState(stDeviceID)
  else if stCMD = 'POSITIVE' then Control_POSINEGAModeChange(stDeviceID,'0')     //POSITIVE 0,NEGATIVE 1
  else if stCMD = 'NEGATIVE' then Control_POSINEGAModeChange(stDeviceID,'1')     //POSITIVE 0,NEGATIVE 1
  else if stCMD = 'REBOOT' then Control_DeviceReboot(stDeviceID)             //��� �����
  else if stCMD = 'SCHEDULETIMER' then
  begin
    //Send_UseDoorSchedule;
    if DeviceInfoSendTimer.Enabled then
    begin
      DeviceInfoSendTimer.Enabled := False;
      DeviceInfoSendTimer.Interval := 100;
      DeviceInfoSendTimer.Enabled := True   //��� ������ ������� ������
    end;
  end else if stCMD = 'STATECHECK' then Process_DeviceSTATECHECK(stDeviceID)
  else if stCMD = 'TIMESYNC' then Registration_DeviceTimeSync(stDeviceID)         //�ð�����ȭ
  else if stCMD = 'ZEPORTSTATE' then Search_ZoneExtendPortState(stDeviceID)
//  else if stCMD = 'HOLIDAY' then Send_DeviceHoliday(stDeviceID)  //������ �ٿ�ε�
;

end;

function TfmMain.GetDaemonLogConfig: Boolean;
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

    L_stDaemonLogFullData := 'N';
    L_nEventdeleteDaemonLogDay := 3;
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
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'FULLLOG' then  L_stDaemonLogFullData := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'DELETDAY' then L_nEventdeleteDaemonLogDay := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
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
  if G_bApplicationTerminate then Exit;
  if dtDaemonLogDeleteTime > Now then  Exit;
  StatusBar1.Panels[2].Text := 'LogDeleteTime';
  //Application.ProcessMessages;

  dtDaemonLogDeleteTime := dtDaemonLogDeleteTime + 1;

  dtDate := Now - L_nEventdeleteDaemonLogDay;
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

function TfmMain.GetDataBaseConfig: Boolean;
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

    L_stDataBaseAutoBackup := 'FALSE';
    L_stDataBaseBackupDir := 'c:\Backup';
    L_stDataBaseBackupTime := '0100';
    L_nDataBaseBackupCycle := 10;
    L_nEventdeleteAccessDay := 90;
    L_nEventdeleteAttendDay := 90;
    L_nEventdeleteFoodDay := 90;
    L_nEventdeletePatrolDay := 90;
    L_stDataBaseLastBackupDate := FormatDateTime('yyyymmdd',Now);

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
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'AUTO' then  L_stDataBaseAutoBackup := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'BACKDIR' then L_stDataBaseBackupDir := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'BACKTIME' then  L_stDataBaseBackupTime := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'BACKCYCLE' then  L_nDataBaseBackupCycle := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'AT_DELETE' then L_nEventdeleteAttendDay := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'FD_DELETE' then L_nEventdeleteFoodDay := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'AC_DELETE' then L_nEventdeleteAccessDay := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'PT_DELETE' then L_nEventdeletePatrolDay := strtoint(FindField('CO_CONFIGVALUE').AsString);
        Next;
      end;
    end;
    L_stDataBaseBackupDir := stringReplace(L_stDataBaseBackupDir,'\\','\',[rfReplaceAll]);

    stSql := 'select * from TB_CURRENTDAEMON ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
//    stSql := stSql + ' AND CU_STATECODE = ''LASTBACKUP'' ';

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
        if FindField('CU_STATECODE').AsString = 'LASTBACKUP' then
          L_stDataBaseLastBackupDate := FindField('CU_STATEVALUE').AsString
        else if FindField('CU_STATECODE').AsString = 'DEVICESORT' then
          L_stDeviceSortDate := FindField('CU_STATEVALUE').AsString;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  if FormatDateTime('hhnn',now) > '0600' then L_stDeviceSortDate := FormatDateTime('yyyymmdd',now);

  result := True;

end;

procedure TfmMain.DataBaseBackupTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  if dtDBBackupTime > Now then Exit;
  if L_bDataBaseBackup then Exit;
  L_bDataBaseBackup := True;
  dtDBBackupTime := dtDBBackupTime + L_nDataBaseBackupCycle;    //���� �ֱ⸦ ���� ����
  StatusBar1.Panels[2].Text := 'DataBaseBackupTimer';
  //Application.ProcessMessages;
  
  if FileDataBaseBackup(False) then
  begin
    DeleteEventTable;

    dmDBFunction.UpdateTB_CURRENTDAEMON_Field_StringValue('LASTBACKUP','CU_STATEVALUE',FormatDateTime('yyyymmdd',now));
  end;

  L_bDataBaseBackup := False;

end;

function TfmMain.DataBaseBackup(bFull:Boolean): Boolean;

begin
  Result := False;

  if not DirectoryExists(L_stDataBaseBackupDir) then
  begin
   if Not CreateDir(L_stDataBaseBackupDir) then
   begin
      DataBaseBackupTimer.Enabled := False;
      showmessage(L_stDataBaseBackupDir + ' �� �����Ҽ� ���� ���丮�Դϴ�. ȯ�漳���� Ȯ�� �� ��⵿�Ͽ� �ּ���. ');
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

function TfmMain.DeleteEventTable: Boolean;
var
  stSql : string;
  stDate : string; //������ ��¥
begin
  Result := False;
  if G_bApplicationTerminate then Exit;
  //���� ������ ����
  stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeleteAccessDay);
  stSql := ' Delete From TB_ACCESSEVENT ';
  stSql := stSql + ' where AC_DATE <= ''' + stDate + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //���� ������ ����
  stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeleteAttendDay);
  stSql := ' Delete From TB_ATEVENT ';
  stSql := stSql + ' where AT_DATE <= ''' + stDate + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //�ļ� ������ ����
  stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeleteFoodDay);
  stSql := ' Delete From TB_FOODEVENT ';
  stSql := stSql + ' where FO_DATE <= ''' + stDate + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //��� ������ ����
  stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeletePatrolDay);
  stSql := ' Delete From TB_ALARMEVENT ';
  stSql := stSql + ' where AL_DATE <= ''' + stDate + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //���Ѻ��� �̷� ������ ����
  stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeleteAccessDay);
  stSql := ' Delete From TB_DEVICECARDNO_HIS ';
  if DBTYPE = 'FB' then
    stSql := stSql + ' where substring(DE_UPDATETIME from 1 for 8) <= ''' + stDate + ''' '
  else
    stSql := stSql + ' where substring(DE_UPDATETIME,1,8) <= ''' + stDate + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //�ý��� �α� ������ ����
  stDate := FormatdateTime('yyyymmdd',Now - 90);
  stSql := ' Delete From TB_SYSTEMLOG ';
  stSql := stSql + ' where SY_DATE <= ''' + stDate + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  Result := True;
end;


procedure TfmMain.RecvTimeCheckTimer(Sender: TObject);
var
  tmpTime : Cardinal;
  stSql : string;
  i : integer;
begin
  if G_bApplicationTerminate then Exit;
  if  L_nCardSendCount <= L_nCardAckCount then
  Begin
    if Not L_bCardDownLoad then
    begin
      //�۽� ����
      L_nCardSendCount := 0;
      L_nCardAckCount := 0;

      RecvTimeCheck.enabled := False;
      dmDBFunction.UpdateTB_DEVICECARDNO_AllState('S','N');
    end;
    Exit;
  End;

  Try
    tmpTime := getTickCount;
    if (SendCardTime + 60000) < tmpTime then
    begin
      //���� �Ϸ� �� 3�ʰ� �����µ�... �۽� ������ �ȵǾ����� �۽����� ������ �̼۽����� ���� �� �ٿ�ε� ����
      if Not L_bCardDownLoad then
      begin
        L_nCardSendCount := 0;
        L_nCardAckCount := 0;

        RecvTimeCheck.enabled := False;
        for i := 0 to ComNodeList.Count - 1 do
        begin
          TCommnode(ComNodeList.Objects[i]).CardSendDataList.Clear; //���� ī�嵥���� �� ���� �� Clear ����
        end;
        dmDBFunction.UpdateTB_DEVICECARDNO_AllState('S','N');
      end;
      Exit;

    end;
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
               'RecvTimeCheckTimer','Memory Error' + inttostr(i));
  end;
end;

function TfmMain.GetMCUCommonConfig: Boolean;
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
        if G_bApplicationTerminate then Exit;
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

procedure TfmMain.CardAutoDownTimerTimer(Sender: TObject);
begin
  //Memo1.Lines.Add('CardAutoDownTimerStart');
  if G_bApplicationTerminate then Exit;
  if Not L_bDaemonStart then Exit;
  
  Try
    CardAutoDownTimer.Enabled := False;
    StatusBar1.Panels[2].Text := 'CardAutoDownTimer';
    //Application.ProcessMessages;
    CardAutoDownTimer.Interval := 2000;
    CardAutoDownTimer.Enabled := False;
    CardDownLoadCheckTimer.Enabled := True;
    CardNoDownload(0,'00',False); //������ ������ ����
    CardDownLoadCheckTimer.Enabled := False;
  Finally
    if Not G_bApplicationTerminate then CardAutoDownTimer.Enabled := True;
  End;
end;

procedure TfmMain.CommandArrayCommandsTCommand0Execute(Command: TCommand;
  Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['����'];
   if stResult = 'TRUE' then L_bShowCurrentState := True
   else L_bShowCurrentState := False;

end;

procedure TfmMain.GetMonitoringTypeConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stFileServerIP : string;
  stFileServerDir : string;
begin
  FileServerPath := '';
  stFileServerDir := '';
  L_nFoodDupEvent := 0;
  L_stFoodYesterDayTime := '0400';


  AccessUse := False;
  PatrolUse := False;
  AttendUse := False;
  FoodUse := False;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where (CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''FOOD'') ';
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
        if G_bApplicationTerminate then Exit;
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
        end else if (FindField('CO_CONFIGGROUP').AsString = 'FOOD') AND (FindField('CO_CONFIGCODE').AsString = 'DUPEVENT') then
        begin
          if isdigit(FindField('CO_CONFIGVALUE').AsString) then
            L_nFoodDupEvent := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if (FindField('CO_CONFIGGROUP').AsString = 'FOOD') AND (FindField('CO_CONFIGCODE').AsString = 'YSDAYTIME') then
        begin
          L_stFoodYesterDayTime := FindField('CO_CONFIGVALUE').AsString;
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
  //���Ѱ����ʿ��� ������ �׸��� ��������
  SetVisibleMenue;

end;

procedure TfmMain.Check_DoorState(aDeviceID: string);
var
  stNodeNo,stECUID,stDoorNo : string;
  i,j : integer;
  aDevice: TDevice;
  stTemp : string;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);
  stDoorNo := copy(aDeviceID,6,1);

  if (stNodeNo = '') or (stNodeNo = '000') then //��ü������ȸ
  begin
    for i := 0 to DeviceList.Count -1 do
    begin
      if G_bApplicationTerminate then Exit;
      aDevice:= GetDevice(DeviceList.Strings[i] );
      if aDevice <> nil then
      begin
        if aDevice.CommNode.SocketConnected = True then
        begin
          for j:=1 to con_nFIXMAXDOORNO do
          begin
            if aDevice.GetDoorUse(j) then
              aDevice.Check_DoorState(inttostr(j)[1]);
          end;
        end;
        (*   //�� ���� ������ ���� ����
        if aDevice.CommNode.SocketConnected = True then
        begin
          if aDevice.Door2Use then
            aDevice.Check_DoorState('2');
        end;
        *)
      end else
      begin
        Continue;
      end;
    end;
    Exit;
  end;

  if (stECUID = '00') and (stDoorNo = '0') then //�����ü������ȸ
  begin
    for i := 0 to DeviceList.Count -1 do
    begin
      if G_bApplicationTerminate then Exit;
      if stNodeNo <> copy(DeviceList.Strings[i],1,3) then Continue;
      aDevice:= GetDevice(DeviceList.Strings[i] );
      if aDevice <> nil then
      begin
        if aDevice.CommNode.SocketConnected = True then
        begin
          for j:=1 to con_nFIXMAXDOORNO do
          begin
            if aDevice.GetDoorUse(j) then
              aDevice.Check_DoorState(inttostr(j)[1]);
          end;
        end;
        (*
        if aDevice.CommNode.SocketConnected = True then
        begin
          if aDevice.Door2Use then
            aDevice.Check_DoorState('2');
        end;
        *)
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
    if aDevice.CommNode.SocketConnected = True then
    begin
      aDevice.Check_DoorState(stDoorNo[1],True);
      DoorModeChanged(aDevice,aDevice.NodeNo,aDevice.ECUID,stDoorNo[1],
                      aDevice.GetDoorManageMode(strtoint(stDoorNo)),
                      aDevice.GetDoorPNMode(strtoint(stDoorNo)),
                      aDevice.GetDoorState(strtoint(stDoorNo)),
                      aDevice.GetDoorLockMode(strtoint(stDoorNo)),
                      aDevice.GetDoorFire(strtoint(stDoorNo))
                      );
      (*if stDoorNo[1] = '1' then
      begin
        if aDevice.Door1Use then
          aDevice.Check_DoorState(stDoorNo[1],True);
      end else if stDoorNo[1] = '2' then
      begin
        if aDevice.Door2Use then
          aDevice.Check_DoorState(stDoorNo[1],True);
      end else
      begin
        aDevice.Check_DoorState(stDoorNo[1],True);
      end; *)
    end;
  end;


end;

procedure TfmMain.Control_DoorOpen(aDeviceID: string);
var
  stNodeNo,stECUID,stDoorNo : string;
  i : integer;
  aDevice: TDevice;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);
  stDoorNo := copy(aDeviceID,6,1);

  aDevice:= GetDevice(stNodeNo + stECUID  );
  if aDevice <> nil then
  begin
    if aDevice.CommNode.SocketConnected = True then aDevice.DoorExitButton(stDoorNo[1]);
  end;

end;

procedure TfmMain.Control_DoorModeChange(aDeviceID: string;aMode:Char);
var
  stNodeNo,stECUID,stDoorNo : string;
  i : integer;
  aDevice: TDevice;
  stTemp : string;
begin
  //LogSave(ExeFolder + '\..\log\ModeChange'+FormatDateTime('yyyymmdd',now)+'.log',aDeviceID + ':' + aMode);
  StatusBar1.Panels[2].Text := 'ModeChange(' + aDeviceID + ')';
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);
  stDoorNo := copy(aDeviceID,6,1);

  if stNodeNo = '000' then
  begin
    //������ �������� ��ü ��� ����
    stTemp:= 'C'+                                     //  Msg Code
       //InttoStr(CommNode.Send_MsgNo)+          // Message Count
       '0' +
       '1'+                                //  ��⳻ Door No
       #$30+                                   //  RecordCount(����)
       #$32+                                   //  RecordCount(��庯�� #$32)
       aMode;                                  //  '0':� ,'1':����
    MCUBroadDataSend('99','c',stTemp,True);
    stTemp:= 'C'+                                     //  Msg Code
       //InttoStr(CommNode.Send_MsgNo)+          // Message Count
       '0' +
       '2'+                                //  ��⳻ Door No
       #$30+                                   //  RecordCount(����)
       #$32+                                   //  RecordCount(��庯�� #$32)
       aMode;                                  //  '0':� ,'1':����
    MCUBroadDataSend('99','c',stTemp,True);
    Exit;
  end;
  aDevice:= GetDevice(stNodeNo + stECUID  );
  if aDevice <> nil then
  begin
    if aDevice.CommNode.SocketConnected = True then aDevice.Control_DoorModeChange(stDoorNo[1],aMode)
  end;
end;

procedure TfmMain.Control_DeviceReboot(aDeviceID: string);
var
  aDevice : TDevice;
begin
  aDevice := GetDevice(aDeviceID);
  if aDevice <> nil then aDevice.ReBoot;
end;

procedure TfmMain.Control_AlarmModeChange(aDeviceID, aMode: string);
var
  aDevice : TDevice;
  stSendData : string;
  stAlarmAreaCode : string;
begin
  stAlarmAreaCode := copy(aDeviceID,1,5);
  if copy(aDeviceID,1,3) = '000' then
  begin
    if aMode = '0' then stSendData := 'MC00D'
    else if aMode = '1' then stSendData := 'MC00A'
    else Exit;
    MCUBroadDataSend('99','R',stSendData,True);
    Exit;
  end;

  aDevice := GetDevice(stAlarmAreaCode);
  if aDevice <> nil then
  begin
    if aMode = '1' then aDevice.ChangewatchMode(copy(aDeviceID,6,1),cmArm)
    else if aMode = '0' then aDevice.ChangewatchMode(copy(aDeviceID,6,1),cmDisArm);
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
  if L_bFormActive then
    MDIChildShow('TfmMDIDeviceCode');
{  fmDeviceCode:= TfmDeviceCode.Create(Self);
  fmDeviceCode.WorkCode := 0;
  fmDeviceCode.IsInsertGrade := True;
  fmDeviceCode.IsUpdateGrade := True;
  fmDeviceCode.IsDeleteGrade := True;
  fmDeviceCode.SHowmodal;
  fmDeviceCode.Free;
  Delay(100);
  Action_DaemonRestartExecute(self);
  Delay(100);
  if G_bApplicationTerminate then Exit;
  DeviceInfoSendTimer.Enabled := True;
}
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
  if Application.MessageBox(PChar('��ŵ����� ������Ͻðڽ��ϱ�??'),'����',MB_OKCANCEL) = IDOK then
     RestartTimer.Enabled := True;
  GetSonghoConfig;
  FoodCurrentSemesterCode := GetFoodCurrentSemesterCode(FormatDatetime('yyyymmdd',Now)); //�б� �ڵ� üũ
end;

function TfmMain.PorcessAlaramData(aData: string): Boolean;
begin
//
end;

function TfmMain.InsertTB_ALARMEVENT(aTime, aNodeNo, aEcuID, aMsgNo,
  aSubClass, aSubAddr, aZoneCode, aMode, aPortNo, aStatus, aState,
  aOper,aNewStateCode,aAlarmView,aAlarmSound,aAlarmGrade,aCheckOk,
  aCardNo,aCompanyCode,aEmCode: string): Boolean;
var
  stSql : string;
  stAlNodeNo : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

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
  stSql := stSql + 'AL_STATUSCODE2, ';
  stSql := stSql + 'AL_ISALARM,';
  stSql := stSql + 'AL_SOUND,';
  stSql := stSql + 'AL_ALARMGRADE,';
  stSql := stSql + 'AL_INPUTTIME,';
  stSql := stSql + 'AL_CHECKOK, ';
  stSql := stSql + 'CA_CARDNO, ';
  stSql := stSql + 'CO_COMPANYCODE, ';
  stSql := stSql + 'EM_CODE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE +''',';
  stSql := stSql + '''' + copy(aTime,1,8) +''',';
  stSql := stSql + '''' + copy(aTime,9,6) +''',';
  stSql := stSql + aNodeNo +',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aMsgNo + ''',';
  stSql := stSql + '''' + aSubClass + ''',';
  stSql := stSql + '''' + aSubAddr + ''',';
  stSql := stSql + '''' + aZoneCode + ''',';
  stSql := stSql + '''' + aMode + ''',';
  stSql := stSql + '''' + aPortNo +''',';
  stSql := stSql + '''' + aState  +''',';
  stSql := stSql + '''' + aStatus +''',';
  stSql := stSql + '''' + aOper + ''',';
  stSql := stSql + '''' + aNewStateCode + ''',';
  stSql := stSql + '''' + aAlarmView[1] + ''',';
  stSql := stSql + '''' + aAlarmSound[1] + ''',';
  stSql := stSql + '' + aAlarmGrade + ',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',Now) + ''',';
  stSql := stSql + '''' + aCheckOk + ''', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aEmCode + ''') ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

procedure TfmMain.Send_DeviceHoliday(aYear: string);
var
  i,j,k : integer;
  aDevice : TDevice;
  //HolidayList : TStringList;
  nIndex : integer;
  aHoCmd : string;
  bHolidaySendSuccess : Boolean;
begin
  if G_nScheduleDevice = 1 then Exit;    //PC���� ������ ���� �ϴ� ��� �������� ����.

  if L_bHolidayChange then HolidayListDataCreate(aYear);

  for i:= HolidaySendDeviceList.Count - 1 downto 0 do
  begin
    if G_bApplicationTerminate then Exit;
    nIndex := DeviceList.IndexOf(HolidaySendDeviceList.Strings[i]);
    if nIndex < 0 then continue;
    aDevice := nil;
    aDevice := TDevice(DeviceList.Objects[nIndex]);
    if aDevice <> nil then
    begin
      //2011.05.15 Ư���� ������ ��� ���� �ÿ��� ���� ����.
      {if aDevice.Door1Use then
      begin
        if Not aDevice.Holiday('W','0100','1') then continue;  //��ü�� 0
      end;
      if aDevice.Door2Use then
      begin
        if Not aDevice.Holiday('W','0100','2') then continue;
      end; }
      if aDevice.Connected then
      begin
        if aDevice.HO1USE then //Ư���� ����� ������
        begin
          for j:=1 to 12 do
          begin
            if G_bApplicationTerminate then Exit;
            (*
            aHoCmd := 'A';
            bHolidaySendSuccess := False;
            if copy(HolidayList.Strings[j],1,1) = 'D' then aHoCmd := 'D';
            if aDevice.Door1Use then
            begin
              if Not aDevice.Holiday(aHoCmd[1],copy(HolidayList.Strings[j],2,4),'1') then break;
            end;
            if aDevice.Door2Use then
            begin
              if Not aDevice.Holiday(aHoCmd[1],copy(HolidayList.Strings[j],2,4),'2') then break;
            end;
            *)

            for k := 1 to aDevice.MaxLockCount do
            begin
              if aDevice.HolidaySendRecv[j][k] <> 0 then //���� �Ϸ� ���� �ʾ�����
                 aDevice.MonthHoliday(k,j,L_arrHolidayList[j]);  //������ ��������.
            end;
          end;
          bHolidaySendSuccess := True;
          for j:=1 to 12 do
          begin
            for k:= 1 to aDevice.MaxLockCount do
            begin
              if aDevice.HolidaySendRecv[j][k] <> 0 then
              begin
                bHolidaySendSuccess:= False;
                break;
              end;
            end;
          end;

          if bHolidaySendSuccess then
          begin
            dmDBFunction.UpdateTB_ACCESSDEVICE_HOSEND(copy(HolidaySendDeviceList.Strings[i],1,3),copy(HolidaySendDeviceList.Strings[i],4,2),'R','Y');
            HolidaySendDeviceList.Delete(i);
          end;
        end else if (aDevice.DeviceCode <> '') then  //Ư���� ����� ���� ����̸�
        begin
          dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(copy(HolidaySendDeviceList.Strings[i],1,3),copy(HolidaySendDeviceList.Strings[i],4,2),'HO_SEND','Y');
          HolidaySendDeviceList.Delete(i);
        end;
      end;
    end;
    Application.ProcessMessages;
  end;
end;

//�ǽð� �ۼ��� ��Ȳ�� ����Ʈ�� ��ȸ�Ѵ�.
procedure TfmMain.RealDataShow(aIp, aECUID, aGubun, aCmd, aData: string;aNodeno:integer);
var
  fmCurrentState :TForm;
begin
  if L_bShowCurrentState then
  begin
    fmCurrentState := MDIForm('TfmCurrentState');
    if fmCurrentState <> nil then
    begin
      TfmCurrentState(fmCurrentState).DisplayStringGrid(aCmd,aGubun,aIp,aECUID,aData,aNodeno);
    end;

    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['IP'] := aIp;
    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['ECUID'] := aECUID;
    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['TxRx'] := aGubun;
    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['Cmd'] := aCmd;
    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['Data'] := aData;
    //self.FindClassForm('TfmCurrentState').FindCommand('Message').Execute;


  end;

end;

procedure TfmMain.Check_AlarmSTATE(aDeviceID: string;aAllCheck:Boolean=TRUE);
var
  stNodeNo,stECUID,stArmAreaNo : string;
  i : integer;
  aDevice: TDevice;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);
  stArmAreaNo := copy(aDeviceID,6,1);

  if (stNodeNo = '') or (stNodeNo = '000') then //��ü������ȸ
  begin
    if Not aAllCheck then Exit; //���� ���� �̺�Ʈ �����Ұ�����
    //StateCheckList.Add('ALARMSTATE');

    for i := 0 to DeviceList.Count -1 do
    begin
      if G_bApplicationTerminate then Exit;
      aDevice:= GetDevice(DeviceList.Strings[i] );
      if aDevice <> nil then
      begin
        if aDevice.CommNode.SocketConnected = True then
        begin
          if aDevice.ECUID = '00' then aDevice.CheckWatchMode('0');
        end;
      end else
      begin
        Continue;
      end;
    end;
    Exit;
  end;

  //aDevice:= GetDevice(stNodeNo + '00');//stECUID ); //���� ��Ʈ�ѿ����� �ν���
  aDevice:= GetDevice(stNodeNo + stECUID ); //���� ��Ʈ�ѿ����� �ν���
  if aDevice <> nil then
  begin
    if aDevice.CommNode.SocketConnected = True then
    begin
      aDevice.CheckWatchMode(copy(aDeviceID,6,1));
    end;
  end;


end;

procedure TfmMain.N22Click(Sender: TObject);
begin
  DoorscheduleRegForm:= TDoorscheduleRegForm.Create(Self);
  DoorscheduleRegForm.Showmodal;
  DoorscheduleRegForm.Free;
//  Delay(1000);
//  DeviceInfoSendTimer.Enabled := True;

end;

procedure TfmMain.CommandArrayCommandsTCommand2Execute(Command: TCommand;
  Params: TStringList);
begin
  //ScheduleDataSend;
  Send_DoorScheduleInfo;
end;

//������ ������ ��� ó��
procedure TfmMain.DeviceRcvScheduleData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
var
  stSql : string;
  stECUID,stDoorNo : string;
  stDayCode : string;
begin
  Try
    stECUID := copy(ReceiveData,15,2);
    stDoorNo := copy(ReceiveData,21,1);
    stDayCode := copy(ReceiveData,23,1);

    UpdateTB_DEVICESCHEDULE_Ack(inttostr(NodeNo),stECUID,stDoorNO,stDayCode,'Y');
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
        if G_bApplicationTerminate then Exit;
        UpdateTB_PROTRAMID_Visible(FindField('CO_CONFIGCODE').AsString,FindField('CO_CONFIGVALUE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.UpdateTB_PROTRAMID_Visible(aCode, aValue: string): Boolean;
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
  if G_bApplicationTerminate then Exit;
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

  if G_bApplicationTerminate then Exit;

  result := False;
  if bFull then stBackupDBName := L_stDataBaseBackupDir + '\FULLEVENT' + FormatdateTime('yyyymmdd',now) + '.mdb'
  else stBackupDBName := L_stDataBaseBackupDir + '\EVENT' + FormatdateTime('yyyymmdd',now) + '.mdb' ;

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

    //MSSQL ���� �����͸� MDB�� ������
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeleteAccessDay);
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
          if G_bApplicationTerminate then
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

    //MSSQL ���� �����͸� MDB�� ������
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeleteAttendDay);
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
          if G_bApplicationTerminate then
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

    //MSSQL �ļ� �����͸� MDB�� ������
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeleteFoodDay);
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
          if G_bApplicationTerminate then
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

    //MSSQL ��� �����͸� MDB�� ������
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeletePatrolDay);
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
          if G_bApplicationTerminate then
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
    //MSSQL ���� �����͸� MDB�� ������
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeletePatrolDay);
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
          if G_bApplicationTerminate then
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

    // ī����� ���� �̷��� MDB�� ������
    if bFull then stDate := FormatdateTime('yyyymmdd',Now)
    else stDate := FormatdateTime('yyyymmdd',Now - L_nEventdeleteAccessDay);
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
          if G_bApplicationTerminate then
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
  stBackupDBName := L_stDataBaseBackupDir + '\LOMOS.mdb';
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

    //MSSQL ī�� �����͸� MDB�� ������
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
          if G_bApplicationTerminate then
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

    //MSSQL ��� �����͸� MDB�� ������
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
          if G_bApplicationTerminate then
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
    //MSSQL ȸ���ڵ带 MDB�� ������
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
          if G_bApplicationTerminate then
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

    //MSSQL �����ڵ带 MDB�� ������
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
          if G_bApplicationTerminate then
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

    //MSSQL  ����ڵ带 MDB�� ������
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
          if G_bApplicationTerminate then
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

    //MSSQL  �������� MDB�� ������
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
          if G_bApplicationTerminate then
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

    //MSSQL  ������ ������ MDB�� ������
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
          if G_bApplicationTerminate then
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

    //MSSQL  �ļ���� ������ MDB�� ������
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
          if G_bApplicationTerminate then
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

    //MSSQL  ī����� ������ MDB�� ������
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
          if G_bApplicationTerminate then
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

procedure TfmMain.GetRelayConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin


  IsCardReaderServer := False;
  L_bRelaySentenceUse := False;

  fdmsUses := 'FALSE';
  fdmsPath := '';
  fdmsPW   := 'tjdgus123!@';
  G_nFPUserIDLength := 4;
  fdmsEMCode := False;
  fdmsDBType := 0; //0:mdb,1:mssql
  fdmsDBIP := '127.0.0.1';
  fdmsDBPort := '1433';
  fdmsDBName := 'sh_fpsystem';
  fdmsDBUser := 'sa';
  fdmsDeleteCardUse := False;
  fdmsAsciiToHex := True;
  fdmsDepartCodeUse := False;
  fdmsDelete := False;

  G_nFdmsCardLength := 24;
  PersonRelayType := 0;
  SendPersonRelayType := 0;
  FACECOPRelayType := 0;
  FACECOPRelayServerIP := '127.0.0.1';
  FACECOPRelayCycleTime := 1;

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
        if G_bApplicationTerminate then Exit;
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
          G_nFPUserIDLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'cardServer' then
        begin
          if strtoint(FindField('CO_CONFIGVALUE').AsString) = 1 then
              IsCardReaderServer := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'SENT_RELAY' then
        begin
          if strtoint(FindField('CO_CONFIGVALUE').AsString) = 1 then
              L_bRelaySentenceUse := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'FACECOP' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then FACECOPRelayType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'FACECOPIP' then
        begin
          FACECOPRelayServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FALASTTIME' then
        begin
          FACECOPRelayLastTime := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FA_RETIME' then   //�����ֱ�
        begin
          FACECOPRelayCycleTime := FindField('CO_CONFIGVALUE').asinteger;
        end else if FindField('CO_CONFIGCODE').AsString = 'PER_RELAY' then
        begin
          PersonRelayType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'PER_SRELAY' then
        begin
          SendPersonRelayType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'FDMSCARDLN' then
        begin
          G_nFdmsCardLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'fdmsEMCODE' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'TRUE' then fdmsEMCode := TRUE
          else fdmsEMCode := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDBTYPE' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then fdmsDBType := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
        end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDBIP' then
        begin
          fdmsDBIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDBPORT' then
        begin
          fdmsDBPort := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FDMSUSER' then
        begin
          fdmsDBUser := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDBNAME' then
        begin
          fdmsDBName := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'DELCARDUSE' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then fdmsDeleteCardUse := True
          else fdmsDeleteCardUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'DCARDSTART' then
        begin
          fdmsDeleteCardStart := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'DELCARDLEN' then
        begin
          fdmsDeleteCardLength := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'ASCIITOHEX' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'N' then fdmsAsciiToHex := False
          else fdmsAsciiToHex := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDEPART' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then fdmsDepartCodeUse := True
          else fdmsDepartCodeUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'EMPSERVER' then
        begin
          G_nRelayServerUse := FindField('CO_CONFIGVALUE').AsInteger;
        end else if FindField('CO_CONFIGCODE').AsString = 'EMPSPORT' then
        begin
          G_nRelayServerPort := FindField('CO_CONFIGVALUE').AsInteger;
        end else if FindField('CO_CONFIGCODE').AsString = 'DOORCTIME' then
        begin
          L_nRelayDoorDelayControlTime := FindField('CO_CONFIGVALUE').AsInteger;
        end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDELETE' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then fdmsDelete := True
          else fdmsDelete := False;
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if Not isDigit(fdmsDeleteCardStart) then fdmsDeleteCardUse := False;
  if Not isDigit(fdmsDeleteCardLength) then fdmsDeleteCardUse := False;

  RelayEmployeeServer.Stop;
  if G_nRelayServerUse = 1 then
  begin
    RelayEmployeeServer.ServerPort := G_nRelayServerPort;
    RelayEmployeeServer.Start;
  end;
  //���Ѱ����ʿ��� ������ �׸��� ��������
  SetVisibleMenue;

end;

procedure TfmMain.fdmsRelyTimerTimer(Sender: TObject);
var
  stSql : string;
begin
  if G_bApplicationTerminate then Exit;
  //�����ν� �Ǵ� �ļ� ���� ��� ���� ���� �κ� ó������.
  if (fdmsDBType = 0) or (fdmsType = '1') then
  begin
    if Not FileExists(fdmsPath) then Exit;
  end;
  if Not ADOfdmsConnection.Connected then fdmsConnect;
  if Not ADOfdmsConnection.Connected then Exit;
  fdmsRelyTimer.Interval := 10000;
  StatusBar1.Panels[2].Text := 'fdmsRelyTimer';
  //Application.ProcessMessages;
  fdmsRelyTimer.Enabled := False;
  fdmsUserRelay;
  if fdmsType = '1' then fdmsGateRelay;
  if fdmsType = '2' then
  begin
    FingerDeviceRelay; //�������� ���� ����
    FingerSend;        //���� ����
  end;
  ADOfdmsConnection.Connected := False;
  Try
    if Not G_bApplicationTerminate then fdmsRelyTimer.Enabled := True;
  Except
  End;
end;

function TfmMain.fdmsConnect: Boolean;
var
  conStr : string;
begin
  result := False;
  if (fdmsDBType = 0) or (fdmsType = '1') then   //MDBŸ���̰ų� ���Ͽ��̸�
  begin
    if Not FileExists(fdmsPath) then
    begin
      LogSave(ExeFolder + '\..\log\FdmsError.log',fdmsPath + '  File Error ');
      Exit;
    end;
    conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ fdmsPath + ';Persist Security Info=True;';
    if fdmsType = '1' then
    begin
      if fdmsPW <> '' then conStr := constr + 'Jet OLEDB:Database Password=' + fdmsPW;
    end else
    begin
      conStr := constr + 'Jet OLEDB:Database Password=tjdgustltmxpa';
    end;
  end else
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + fdmsPW + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + fdmsDBUser + ';';
    conStr := constr + 'Initial Catalog=' + fdmsDBName + ';';
    conStr := constr + 'Data Source=' + fdmsDBIP  + ',' + fdmsDBPort;
  end;


  with ADOfdmsConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false;
    Try
      Connected := True;
    Except
      on E : EDatabaseError do
      begin
        LogSave(ExeFolder + '\..\log\FdmsError.log',E.Message );
        exit;
      end else
      begin
        Exit;
      end;
    End;
  end;

  result := True;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  G_bApplicationTerminate := True;
  Delay(1000);

  ATSERVER.Stop;
  FoodServer.Stop;
  IdFTPServer.Active := False;
  MonitorServerStop;
  RelayEmployeeServer.Stop;
  Action_DaemonStopExecute(self);

  if not DirectoryExists(ExeFolder + '\db') then
  begin
   if Not CreateDir(ExeFolder + '\db') then
   begin
      Exit;
   end;
  end;

  if AlarmEventList.Count > 0 then
  begin
    AlarmEventList.SaveToFile(ExeFolder + '\db\AlarmEvent' + FormatDateTime('yyyymmddhhnnss',now));
    AlarmEventList.Clear;
  end;
  if AccessEventList.Count > 0 then
  begin
    AccessEventList.SaveToFile(ExeFolder + '\db\AccessEvent' + FormatDateTime('yyyymmddhhnnss',now));
    AccessEventList.Clear;
  end;
  if ATEventList.Count > 0 then
  begin
    ATEventList.SaveToFile(ExeFolder + '\db\ATEvent' + FormatDateTime('yyyymmddhhnnss',now));
    ATEventList.Clear;
  end;
  if FoodEventList.Count > 0 then
  begin
    FoodEventList.SaveToFile(ExeFolder + '\db\FoodEvent' + FormatDateTime('yyyymmddhhnnss',now));
    FoodEventList.Clear;
  end;


  L_bDBProcessTimerStart := False;
  DBProcessTimer.Enabled := False;



  TimerFree;
  StringListClear;
  MultiSocketFree;
  CriticalSectionFree;
  Delay(1000);

  //if RSERVER.Active then
  //  RSERVER.Active := False;
  //RSERVER.Free;
  FoodServer.Free;
  //ServerSocket1.Active := False;
  //ServerSocket1.Free;
  Delay(100);
  FirmWareServer.Close;
  Delay(100);
  FirmWareServer.Free;
  
  DXUnicastDataQueue2.Free;
  DXUnicastDataQueue3.Free;
  DXUnicastDataQueue4.Free;
  //��� APRO
{  if  ComNodeList <> nil then
  begin
    for I:= 0 to ComNodeList.Count -1 do
    begin
      if Assigned(ComNodeList.Objects[I]) then
      begin
        TCommNode(ComNodeList.Objects[I]).Open:= False;
        //Delay(100);
        TCommNode(ComNodeList.Objects[I]).Free;
      end;

    end;
    ComNodeList.Free;
  end;   }

  ClientCommunication.Free;   //Thread �������϶��� Free ���� ����
  DeviceConnectList.Free;
  StringListFree;

  LogSave(ExeFolder + '\..\log\lomosHis.log','Daemon Program Close ');
  tbi.Visible := False;
end;

procedure TfmMain.SyncTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := 'SyncTimer';
  //Application.ProcessMessages;
  SyncTimer.Interval := 24 * 60 * 60 * 1000; //1�� �ֱ�
  Registration_DeviceTimeSync('');
end;

procedure TfmMain.DeviceConnected(Sender: TObject; Value: Boolean;
  NodeNo: integer; aECUID: string);
var
  nIndex : integer;
  stClientSendData : string;
  nAntiGroupCount : integer;
  nAntiDeviceGroup : integer;
  i : integer;
begin
  Try
    if Value then
    begin
      Check_DoorState(FillZeroNumber(NodeNo,3) + aECUID + '1'); //1�����Թ� ���� üũ ����
      Check_DoorState(FillZeroNumber(NodeNo,3) + aECUID + '2'); //2�����Թ� ���� üũ ����
      if aECUID = '00' then Check_AlarmSTATE(FillZeroNumber(NodeNo,3) + aECUID,TRUE);      //������� üũ ����
      Check_DeviceSkill(FillZeroNumber(NodeNo,3) + aECUID);     //�� ����� ��� üũ
      Check_DeviceVersion(FillZeroNumber(NodeNo,3) + aECUID);   //�� ����� ���� ���� üũ
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
        dmDBFunction.UpdateTB_DEVICECARDNO_CardNoState(inttostr(NodeNo),aECUID,'','D','N');
      end;
      nIndex := ComErrorList.IndexOf(FillZeroNumber(NodeNo,3) + aECUID);
      if nIndex > -1 then
      begin
        ComErrorList.Delete(nIndex);
      end;
      if aECUID = '00' then  //MCU �̸� �ð�����ȭ �ѹ� ������.
      begin
        TDevice(Sender).SendPacket('R','TM00'+ FormatDatetime('yyyymmddhhnnss',Now),True);
      end;
      STRTimer.Enabled := True;
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
    end;
    L_arrayNodeState[NodeNo] := L_arrayNodeState[NodeNo] + 1;

    SendClientData(stClientSendData);  //�� ���� �ִ��ž�... ����...
    {
    SendSettingData(stClientSendData);
    ATSendClientData(Sender,stClientSendData,NodeNo);
    FDSendClientData(stClientSendData);
    }
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   'DeviceConnected','Error');
  End;

  nAntiGroupCount := TDevice(Sender).GetAntiGroupCount;
  if nAntiGroupCount > 0 then
  begin
    for i := 0 to nAntiGroupCount - 1 do
    begin
      nAntiDeviceGroup := TDevice(Sender).GetDeviceAntiGroup(i);
      nIndex := AntiGroupList.IndexOf(inttostr(nAntiDeviceGroup));
      if nIndex > -1 then
      begin
        TAntiPassGroup(AntiGroupList.Objects[nIndex]).DeviceConnectChange;
      end;
    end;
  end;

  StatusBar1.Panels[3].Text := inttostr(ConnectDeviceList.Count) + '/' + inttostr(DeviceList.Count);
end;

procedure TfmMain.N23Click(Sender: TObject);
begin
  MDIChildShow('TfmDeviceConnectState');
end;

function TfmMain.GetAlarmConfig: Boolean;
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
  NodeNo,OldConnected: integer);
var
  stClientSendData : string;
begin
  if aConnected then
  begin
    //Check_DoorState(FillZeroNumber(NodeNo,3) + '00' + '0'); //ECU ���� üũ ����
    //Check_AlarmSTATE(FillZeroNumber(NodeNo,3) + '00');
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
    if OldConnected = 0 then NodeReConnectAlarmEvent(Sender,NodeNo);   //������ ���Ӳ�����¿����� NR �߻�
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
    //���⿡�� �˶� �߻� ����.
    if OldConnected = 1 then NodeDisConnectAlarmEvent(Sender,NodeNo);   //������ ���Ӽ��� ���¿����� 'NF' �߻�
  end;
  L_arrayNodeState[NodeNo] := L_arrayNodeState[NodeNo] + 1;

  SendClientData(stClientSendData); //�� ���� �ִ��ž�...
{  SendSettingData(stClientSendData);
  ATSendClientData(Sender,stClientSendData,NodeNo);
  FDSendClientData(stClientSendData);
}
end;


procedure TfmMain.N24Click(Sender: TObject);
begin
  Action_DaemonStopExecute(self);
  fmNetConfig:= TfmNetConfig.Create(Self);
  fmNetConfig.SHowmodal;
  fmNetConfig.Free;
  Action_DaemonStartExecute(self);
//  DeviceInfoSendTimer.Enabled :=True;

end;

procedure TfmMain.N26Click(Sender: TObject);
var
  stClientSendData : string;
begin
  if L_bFormActive then
    MDIChildShow('TfmMDIDoorAdmin');
{
  fmDoorAdmin:= TfmDoorAdmin.Create(Self);
  fmDoorAdmin.IsInsertGrade := True;
  fmDoorAdmin.IsUpdateGrade := True;
  fmDoorAdmin.IsDeleteGrade := True;
  fmDoorAdmin.SHowmodal;
  fmDoorAdmin.Free;
  Delay(100);
  //���⿡�� ���Թ� ������ �����ۺ� ������ ������ ����
  Action_DaemonRestartExecute(self);
  Delay(100);
  if G_bApplicationTerminate then Exit;
  DeviceInfoSendTimer.Enabled := True;  }
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
  if L_bFormActive then
    MDIChildShow('TfmMDIArmArea');
{  fmAlaramDeviceAdmin:= TfmAlaramDeviceAdmin.Create(Self);
  fmAlaramDeviceAdmin.SHowmodal;
  fmAlaramDeviceAdmin.Free;
  //���⿡�� ���Թ� ������ �����ۺ� ������ ������ ����
  Delay(100);
  Action_DaemonRestartExecute(self);
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  DeviceInfoSendTimer.Enabled := True;  }

end;

procedure TfmMain.mn_sensorClick(Sender: TObject);
begin
  if L_bFormActive then
    MDIChildShow('TfmMDIAlarmZoneAdmin');
{  fmAlarmZoneAdmin:= TfmAlarmZoneAdmin.Create(Self);
  fmAlarmZoneAdmin.SHowmodal;
  fmAlarmZoneAdmin.Free;
  //���⿡�� ���Թ� ������ �����ۺ� ������ ������ ����
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  DeviceInfoSendTimer.Enabled := True;
}
end;

procedure TfmMain.mn_FoodDeviceClick(Sender: TObject);
begin
  fmFoodAdmin:= TfmFoodAdmin.Create(Self);
  fmFoodAdmin.SHowmodal;
  fmFoodAdmin.Free;
  //���⿡�� ���Թ� ������ �����ۺ� ������ ������ ����
  Delay(100);
  Action_DaemonRestartExecute(self);
//  Delay(1000);
//  if G_bApplicationTerminate then Exit;
//  DeviceInfoSendTimer.Enabled := True;
end;


function TfmMain.UpdateTB_DOOR_State(aNodeNo, aECUID, aDoorNo: string;
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

procedure TfmMain.DeviceInfoSendTimerTimer(Sender: TObject);
var
  bNodeResult : Boolean;
  bEcuResult : Boolean;
  bDoorResult : Boolean;
  bReaderResult : Boolean;
  bPortResult : Boolean;
  bSchedule :Boolean;
begin
  if G_bApplicationTerminate then Exit;
  Try
    DeviceInfoSendTimer.Interval := 60000;
    DeviceInfoSendTimer.Enabled := False;
    StatusBar1.Panels[2].Text := 'DeviceInfoSendTimer';
    //Application.ProcessMessages;
    if G_nScheduleDevice = 0 then   //��⿡�� ������ ���� �ϴ� ���
    begin
      bSchedule := Send_DoorScheduleInfo;    //������ ������ ����
      if G_nScheduleDeviceAsync = 1 then   //���Թ� ������ ��� ������ ���� ����ȭ ��Ű�� ���
      begin
         bDoorResult := Send_UseDoorSchedule;    //���Թ� ���� ���� -- ������ ��� ���� ����
      end else bDoorResult := True;
    end;
    if G_bTimeCodeUse then  //Ÿ���ڵ� ����ϸ�...
    begin
       Send_RegistDoorTimeCodeUse;
       Send_RegistTimeCode;
    end;
  Finally
    DeviceInfoSendTimer.Enabled := Not G_bApplicationTerminate;
  End;

  Exit;
  {
  //������� ������ zRegT������ �����ϵ��� ó�� 2009.11.16
  if G_bApplicationTerminate then Exit; //�� ����ÿ��� �۾����� ����....
  DeviceInfoSendTimer.Enabled := False;
  if L_bSendDeviceInfo then Exit;
  L_bSendDeviceInfo := True;
  bNodeResult := Send_MainSettingInfo; // ECU ���� ����
  bDoorResult := DoorInfo_Send;    //���Թ� ���� ����
  bReaderResult := ReaderInfo_Send;  //���� ���� ����
  //2009 1106 ��� ��⼳�� �ȳ��� ����
//  bPortResult := PortInfo_Send;      //��Ʈ ���� ����
  L_bSendDeviceInfo := False;
  if bNodeResult and bEcuResult and bDoorResult and bReaderResult and L_bSendDeviceInfo then
  begin
    Check_DoorState('');
    Exit;
  end;
  DeviceInfoSendTimer.Enabled := True;  }
end;


function TfmMain.UpdateTB_DOOR_Ack(aNodeNO, aEcuID, aDoorNo,
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

function TfmMain.UpdateTB_READER_Ack(aNodeNO, aECUID, aReaderNo,
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



function TfmMain.DevicePacketSend(aDeviceID, aCmd,
  aSendData: string;aQuick:Boolean=False): Boolean;
var
  aDevice: TDevice;
begin
  result := False;
  if G_bApplicationTerminate then Exit;
  aDevice:= GetDevice(aDeviceID );
  if aDevice <> nil then
  begin
    if aDevice.CommNode.SocketConnected = True then
    begin
      aDevice.SendPacket(aCmd[1],aSendData,aQuick);
      result := True;
    end;
  end;
end;

procedure TfmMain.Receive_RegCardType(aNodeNO,aECUID,aData: string);
var
  stReceiveCheckData : string;
  stCardReaderType : string;
begin
  Delete(aData,1,1);

  stReceiveCheckData := 'CARDREADERTYPEINFO';
  Process_STRReceive(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + stReceiveCheckData);
  dmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,stReceiveCheckData,'Y');

  stCardReaderType := Copy(aData, 22, 10);
  if Length(stCardReaderType) < 9 then stCardReaderType := stCardReaderType[1];
  dmDBFunction.UpdateTB_ACCESSDEVICE_CardReaderType(aNodeNo,aEcuID,stCardReaderType);

  bCardReaderTypeCheck := True;
  if L_bShowReaderSetting then
  begin
    fmReaderSetting.Receive_RegCardType(aNodeNo,aEcuID,stCardReaderType);
  end;
end;

procedure TfmMain.Receive_RegCardReaderInfo(aNodeNO, aECUID, aData: String);
var
  st: String;
  nReaderNo : integer;
  stReceiveCheckData : string;
  stDoorNo : string;
  stReaderUse : string;
  stDoorPosi : string;
  stBuildPosi : string;
  stTemp : string;
begin
  Delete(aData,1,1); //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  st := Copy(aData,20,2);

  stTemp := copy(aData,22,22);

  if Not isdigit(st) then Exit;
  
  nReaderNo := StrtoInt(st);

  stReceiveCheckData := 'CARDREADERSETTINGINFO' + inttostr(nReaderNo);
  Process_STRReceive(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + stReceiveCheckData);
  dmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,stReceiveCheckData,'Y');


  stReaderUse := stTemp[1];
  stDoorPosi := stTemp[2];
  stDoorNo := stTemp[3];
  stBuildPosi := stTemp[22];

  UpdateTB_READER_Info(aNodeNo,aEcuID,inttostr(nReaderNo),stReaderUse,stDoorPosi,stDoorNo,stBuildPosi,'Y');

  bReaderInfoSet[nReaderNo-1] := True;
  if L_bShowReaderSetting then
  begin
    fmReaderSetting.RcvReaderState(aNodeNo,aEcuID,inttostr(nReaderNo),stReaderUse,stDoorPosi,stDoorNo,stBuildPosi);
  end;
  //UpdateTB_READER_Ack(aNodeNO,aECUID,inttostr(nReaderNo),'Y');
end;

procedure TfmMain.Receive_RegUsedDevice(aNodeNo,aEcuID, aPacketData, aRegGubun: String);
var
  stData : string;
  i : integer;
  stEcuID : string;
  stReceiveCheckData : string;
begin
  bCheckUsedDevice := True;
  //UpdateTB_ACCESSDEVICE_RCV(aNodeNo,'Y');
  if aRegGubun = '00' then
  begin
    stReceiveCheckData := 'ECUCOUNT';
  end else if aRegGubun = '02' then
  begin
    stReceiveCheckData := 'ECUTYPE';
    stData := Copy(aPacketData,19,Length(aPacketData)-20);
    stData := Copy(stData, 5, 100);
    //DeviceType�� üũ �Ѱ�� ����� ���� ������ DB�� �Է� ����.
    for i := 0 to DeviceList.Count - 1 do
    begin
      stEcuID := TDevice(DeviceList.Objects[i]).ECUID;
      TDevice(DeviceList.Objects[i]).DeviceType := stData[strtoint(stEcuID)+1];
    end;
  end;
  Process_STRReceive(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + stReceiveCheckData);
  dmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,stReceiveCheckData,'Y');

end;


procedure TfmMain.Receive_RegControllerID(aNodeNO,aECUID,aMcuID: string);
var
  stReceiveCheckData : string;
  stMcuID : string;
begin
  stReceiveCheckData := 'MCUID';
  Process_STRReceive(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + stReceiveCheckData);
  dmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,stReceiveCheckData,'Y');

  dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(aNodeNo,aEcuID,'AC_MCUID',aMcuID);
end;

procedure TfmMain.Receive_RegKTTelNumber(aNodeNO,aECUID,aData: string);
begin
//
end;

function TfmMain.GetSystemDelayInfo(aNodeNo, aEcuID: string; var nInDelay,
  nOutDelay: integer): Boolean;
var
  stSql : string;
begin
  result := False;
  nInDelay := 0;
  nOutDelay := 0;
  stSql := 'select AC_INDELAY,AC_OUTDELAY from TB_ACCESSDEVICE ';
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
      nInDelay := FindField('AC_INDELAY').AsInteger;
      nOutDelay := FindField('AC_OUTDELAY').AsInteger;
    Except
      Exit;
    End;
  end;
  result := True;
end;

procedure TfmMain.Receive_RegSysteminfo(aNodeNO,aECUID,aData: string);
var
  stReceiveCheckData : string;
  stPowerType,stOutDelay,stInDelay,stDoor1Type,stDoor2Type : string;
begin
  stReceiveCheckData := 'SYSTEMINFO';
  Process_STRReceive(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + stReceiveCheckData);
  dmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,stReceiveCheckData,'Y');

  stPowerType := aData[23];  {���� ���ÿ���}
  stOutDelay := Copy(aData, 24, 3);  {��������ð�}
  stDoor1Type := aData[28];  {Door1 �뵵}
  stDoor2Type := aData[29];  {Door2 �뵵}
  stInDelay := Trim(Copy(aData, 46, 3)); {�Խ������ð�}

  dmDBFunction.UpdateTB_ACCESSDEVICE_SystemInfo(aNodeNO,aECUID,stPowerType,stOutDelay,stInDelay,stDoor1Type,stDoor2Type);

  bSystemInfo := True;
  dmDBFunction.UpdateTB_ACCESSDEVICE_Ack(aNodeNo,aEcuID,'Y');
end;

procedure TfmMain.Receive_RegPort(aNodeNO, aECUID, aData: String);
var
  st: String;
  nPortNo : integer;
  stReceiveCheckData : string;
  stWatchTypeCode : string; //�������
  stAlarmType : string; //�˶��߻�����
  stRecoverType : string;   //��������
  stDelayUse :string;  //�����ð�����
  stPortLocate  :string;    //��Ʈ��ġ��
  stDetectTime : string;
begin
  Delete(aData,1,1); //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  st := Copy(aData,20,2);
  if Not isDigit(st) then Exit;
  nPortNo := StrtoInt(st);

  stWatchTypeCode := Copy(aData, 22, 2);
  stAlarmType := Copy(aData, 24, 1);
  stRecoverType := Copy(aData, 26, 1);
  stDelayUse := Copy(aData, 27, 1);
  stPortLocate := Copy(aData, 50, 16);
  stDetectTime := Copy(aData, 66, 4);

  stReceiveCheckData := 'PROTSETTINGINFO' + inttostr(nPortNo);
  Process_STRReceive(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + stReceiveCheckData);
  dmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,stReceiveCheckData,'Y');
  UpdateTB_ZONEDEVICE_Info(aNodeNo,aEcuID,inttostr(nPortNo),stAlarmType,stRecoverType,stDelayUse);

  bPortInfoSet[nPortNo-1] := True;
  UpdateTB_ZONEDEVICE_Ack(aNodeNO,aECUID,inttostr(nPortNo),'Y');
end;

function TfmMain.UpdateTB_ZONEDEVICE_Ack(aNodeNo, aEcuID, aPortNo,
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

procedure TfmMain.Receive_RegLinkusId(aNodeNO, aECUID, aLinkusID: string);
var
  stReceiveCheckData : string;
  stID : string;
begin
  stReceiveCheckData := 'TELECOPID';
  Process_STRReceive(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + stReceiveCheckData);
  dmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,stReceiveCheckData,'Y');

  if aLinkusID = 'AAAA' then stID := 'AAAA'
  else stID := FillZeroNumber(Hex2Dec64(aLinkusID),4);

  dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(aNodeNo,aEcuID,'AC_LINKUSID',stID);

  bLinKusID := True;
end;

procedure TfmMain.Receive_RegLinkusTelNumber(aNodeNO, aECUID, aData: string);
var
  stReceiveCheckData : string;
  stNo : string;
begin
  stNo := copy(aData,1,2);
  Delete(aData,1,2);
  if Not isDigit(stNo) then Exit;
  stReceiveCheckData := 'TELECOPTELNUM' + inttostr(strtoint(stNo) + 1);
  Process_STRReceive(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + stReceiveCheckData);
  dmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,stReceiveCheckData,'Y');

  if strtoint(stNo) = 0 then
  begin
    dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(aNodeNo,aEcuID,'AC_LINKUSTELNO',aData);
  end;



  bLinKusMuxTel := True;
end;

function TfmMain.Send_DoorScheduleInfo: Boolean;
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
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
begin
  result := True;

  Try
    stSql := 'SELECT a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO,a.DE_DAYCODE,a.DE_CELL1MODE,a.DE_CELL2MODE,a.DE_CELL3MODE,a.DE_CELL4MODE,a.DE_CELL5MODE, ';
    stSql := stSql + ' a.DE_CELL1TIME,a.DE_CELL2TIME,a.DE_CELL3TIME,a.DE_CELL4TIME,a.DE_CELL5TIME ';
    stSql := stSql + ' FROM TB_DEVICESCHEDULE a ';
    stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
    stSql := stSql + ' ON(a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
    stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.DE_RCVACK = ''N'' ' ;
    (*
    if ConnectDeviceList.Count > 0 then
    begin
      stSql := stSql + ' and ( ';
      for i := 0 to ConnectDeviceList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
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
    *)

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
    //      result := False;   //�۽� ������ ������ �ٽ� �ѹ� �� ���� ��� �� ����...
    //      aDeviceID:= FindField('DEVICE_ID').asString;
          First;
          While not eof do
          begin
            if G_bApplicationTerminate then Exit;
            stNodeNo := FillZeroNumber(FindField('AC_NODENO').AsInteger,3);
            stECUID := FindField('AC_ECUID').asString;
            cDoor:= FindField('DO_DOORNO').asString[1];
            cDay := FindField('DE_DAYCODE').asString[1];
           { stData:= FindField('DE_CELL5TIME').asString + FindField('DE_CELL1MODE').asString+
                    FindField('DE_CELL1TIME').asString + FindField('DE_CELL2MODE').asString+
                    FindField('DE_CELL2TIME').asString + FindField('DE_CELL3MODE').asString+
                    FindField('DE_CELL3TIME').asString + FindField('DE_CELL4MODE').asString+
                    FindField('DE_CELL4TIME').asString + FindField('DE_CELL5MODE').asString;  }
           //2012.05.07 ������ ������ 0000 �����̴�.
            stData:= '0000' + FindField('DE_CELL1MODE').asString+
                    FindField('DE_CELL1TIME').asString + FindField('DE_CELL2MODE').asString+
                    FindField('DE_CELL2TIME').asString + FindField('DE_CELL3MODE').asString+
                    FindField('DE_CELL3TIME').asString + FindField('DE_CELL4MODE').asString+
                    FindField('DE_CELL4TIME').asString + FindField('DE_CELL5MODE').asString;

             aDevice:= GetDevice(FillZeroNumber(strtoint(stNodeNo),3) + stECUID );
             if aDevice <> nil then
             begin
              if aDevice.Connected then
              begin
                if aDevice.ScheduleSkill then
                begin
                  aDevice.SendDoorSchadule(cDoor,cDay,stData);
                  Delay(200);
                end else
                begin
                  if aDevice.DeviceCode <> '' then //Device �� ������ ����� ������
                  begin
                    UpdateTB_DEVICESCHEDULE_Ack(stNodeNo,stECUID,'0','0','Y');
  LogSave(ExeFolder + '\..\log\Schedule.log',stNodeNo + stECUID + '������ ��� ����');
                  end;
                end;
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
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   'Send_DoorScheduleInfo','Error');
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

  if CommonModule.CheckHolidy(aYear,aMonth,aDay) then
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

  StartTime:=TimeCounter+ ClientConnectTime;
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
          if G_bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {���������� ���� ������ ó�� ��ƾ�߰�}
        if Ws <> '' then RcvFromFDClient(ClientThread.Socket.PeerIPAddress,ws);
        ws:='';
      end;
      StartTime:=TimeCounter+ ClientConnectTime;
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
                       '�����������Է¿���',aNodeNo + aEcuID +'DB���� ����');
      TempAdoQuery.Free;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '�����������Է¿���',aNodeNo + aEcuID +'�̵�� ���');
      RealDataShow('','','Er','',aNodeNo + aEcuID +'�̵�� ���[�����������Է¿���]');
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

  StartTime:=TimeCounter+ ClientConnectTime;
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
          if G_bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {���������� ���� ������ ó�� ��ƾ�߰�}
        if Ws <> '' then RcvFromFirmWareClient(ClientThread.Socket.PeerIPAddress,ws);
        //Ws:= Ws ;
        //ClientThread.Socket.WriteLn(ws);
        ws:='';
      end;
      StartTime:=TimeCounter+ ClientConnectTime;
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

  if stCMD = 'STATECHECK' then Check_DoorState(stDeviceID)            //����Ȯ��
  else if stCMD = 'ALARMCHECK' then Check_AlarmSTATE(stDeviceID)      //�������Ȯ��
  else if stCMD = 'DOOROPEN' then Control_DoorOpen(stDeviceID)               //���Խ���
  else if stCMD = 'OPENMODE' then Control_DoorModeChange(stDeviceID,'1')     //������
  else if stCMD = 'OPERATEMODE' then Control_DoorModeChange(stDeviceID,'0')  //����
  else if stCMD = 'TIMESYNC' then Registration_DeviceTimeSync(stDeviceID)         //�ð�����ȭ
  else if stCMD = 'REBOOT' then Control_DeviceReboot(stDeviceID)             //��� �����
  else if stCMD = 'ALARMSETTING' then Control_AlarmModeChange(stDeviceID,'1')  //���
  else if stCMD = 'ALARMDISABLE' then Control_AlarmModeChange(stDeviceID,'0')  //�������
  else if stCMD = 'HOLIDAY' then Send_DeviceHoliday(stDeviceID)  //������ �ٿ�ε�
  else if stCMD = 'CARDDOWNLOAD' then  //ī����Ѵٿ�ε�
  begin
    if ast[1] = 'Y' then bSendAll := True
    else bSendAll := False;
    CardNoDownload(strtoint(copy(stDeviceID,1,3)),copy(stDeviceID,4,2),bSendAll);
  end
  else if stCMD = 'DEAMONRESTART' then Action_DaemonRestartExecute(self);   //���������
}
end;

 
 {
function TfmMain.GetUpdateAttendType(aATDate,aNowTime, aCompanyCode,aEMCode: string;dtYesterDay:TDatetime): string;
var
  stDate : string;
  stTime : string;
begin
  stDate := copy(aTime,1,8);
  //���ؽð��� ������ ����°�?
  if copy(aTime,9,4) < L_stAtYesterDayStandTime then
  begin
    stDate := FormatDateTime('yyyymmdd',dtYesterDay); //������¥.
  end;

  result := dmAdoQuery.GetUpdateAttendType(aATDate,aNowTime,aCompanyCode,aEmCode);
//  if dmAdoQuery.DupCheckTB_AT_EVENT(stDate,aTime,aCompanyCode,aEMCode) then result := '2' //���
//  else result := '1'; //���

end;   }

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
    L_bClose := True;
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

  StartTime:=TimeCounter+ ClientConnectTime;
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
          if G_bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {���������� ���� ������ ó�� ��ƾ�߰�}
        if Ws <> '' then RcvFromATClient(ClientThread.Socket.PeerIPAddress,ws);
        //Ws:= Ws ;
        ClientThread.Socket.WriteLn(ws);
        ws:='';
      end;
      StartTime:=TimeCounter+ ClientConnectTime;
    End
    Else Begin
       DoSleepEx(1);
       //Application.ProcessMessages;
       ProcessWindowsMessageQueue;
    end;
  end;
  DXUnicastDataQueue4.DelSock(Sock);

end;

procedure TfmMain.RcvFromATClient(aClientIP, ast: string);
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

  if stCMD = 'DEAMONRESTART' then Action_DaemonRestartExecute(self) //���������
  else if stCMD = 'STATECHECK' then Process_DeviceSTATECHECK(stDeviceID)
  else if stCMD = 'DEVICEALLSTATE_II' then Process_DeviceAllState_II_MemorySave            //����Ȯ��
  else if stCMD = 'DEVICEALLSTATE_III' then Process_DeviceAllState_III_MemorySave            //����Ȯ��
  else if stCMD = 'ATTENDCONFIGREFRESH' then GetAttendConfig ;

end;

procedure TfmMain.Process_DeviceSTATECHECK(aDeviceID: string);
var
  i: integer;
  stClientSendData : string;
begin
  if copy(aDeviceID,1,5) = '00000' then  //��ü ���� ��ȸ
  begin
    if L_bNotDeviceStateCheck then Exit;
    FStateCheckTCS.Enter;
    if StateCheckList.IndexOf('ALLSTATECHECK') < 0 then
        StateCheckList.Add('ALLSTATECHECK');
    FStateCheckTCS.Leave;
  end else
  begin
    Check_DoorState(copy(aDeviceID,1,6));
  end;
end;

procedure TfmMain.ATSendClientData(Sender:TObject;aData : string;NodeNo:integer);
begin
  if Not ATServer.IsActive then Exit;
  DXUnicastDataQueue4.AddToQueue(aData + LINEEND);
end;

//�/������ ����
procedure TfmMain.DoorMangageModeChange(Sender: TObject; NodeNo: integer;
  aEcuID, aDoorNo: string; aDoorManageType: TDoorManageMode);
var
  stMode : string;
  stClientSendData : string;
  nIndex : integer;
begin
  nIndex := RelayControlDoorList.IndexOf(FillZeroNumber(NodeNo,3)+aEcuID+inttostr(strtoint(aDoorNo)));
  if nIndex > -1 then
  begin
    TdmRelayDoor(RelayControlDoorList.Objects[nIndex]).DoorManageMode :=aDoorManageType;
  end;
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

//�� ���� ���� ����
procedure TfmMain.DoorStateChanged(Sender: TObject; NodeNo: integer;
  aEcuID, aDoorNo: string; aDoorStateType: TDoorDSState);
var
//  stMode : string;
//  stClientSendData : string;
  stAlarmData : string;
  stDoorNo : string;
  nIndex : integer;
begin

  // ���⿡�� ���°� aDoorStateType �� dsLongTime �ΰ�� �˶� �߻� ��Ű��....
  if isDigit(aDoorNo) then
    stDoorNo := inttostr(strtoint(aDoorNo))
  else stDoorNo := '0';
  if aDoorStateType = dsLongTime then
  begin
    if Length(L_stLongTimeState) = 2 then
    begin
      stAlarmData := '058 K10000000' + aEcuID + 'AJn'+ FormatDateTime('yyyymmddhhnnss',now) +'D' + stDoorNo[1] +'0000n' + L_stLongTimeState + '*************B8';
      DeviceRcvAlarmData(Sender,'A',stAlarmData,NodeNo,'001');
    end;
  end;

  nIndex := RelayControlDoorList.IndexOf(FillZeroNumber(NodeNo,3)+aEcuID+inttostr(strtoint(aDoorNo)));
  if nIndex > -1 then
  begin
    TdmRelayDoor(RelayControlDoorList.Objects[nIndex]).DoorState :=aDoorStateType;
  end;

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

//Posi/Negative ��� ����
procedure TfmMain.DoorPNModeChange(Sender: TObject; NodeNo: integer;
  aEcuID, aDoorNo: string; aDoorPNType: TDoorPNMode);
var
  stMode : string;
  stClientSendData : string;
  nIndex : integer;
begin
  nIndex := RelayControlDoorList.IndexOf(FillZeroNumber(NodeNo,3)+aEcuID+inttostr(strtoint(aDoorNo)));
  if nIndex > -1 then
  begin
    TdmRelayDoor(RelayControlDoorList.Objects[nIndex]).DoorPNMode :=aDoorPNType;
  end;
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

//��� ��� ����
procedure TfmMain.DeviceWatchModeChange(Sender: TObject; NodeNo: integer;
  aEcuID,aArmArea: string; aWachMode: TWatchMode);
var
  stMode : string;
  stClientSendData : string;
  nIndex : integer;
  nNo : integer;
  stNodeNo : string;
begin
  stNodeNo := FillZeroNumber(NodeNo,3);

    Case aWachMode of
     cmArm : begin  stMode := 'A' end;
     cmDisarm : begin stMode := 'D' end;
     cmTest : begin stMode := 'T' end;
     cmInit : begin stMode := 'I' end;
     cmPatrol : begin stMode := 'P' end;
     cmJaejung : begin stMode := 'E' end;
     else begin Exit end;//begin stMode := 'E' end;
    end;
    stClientSendData := 'R' +
                        'A' +
                        stNodeNo +
                        aEcuID +
                        FillZeroStrNum(aArmArea,2) +
                        '00' +
                        'DV' +
                        'S' +
                        FillZeroNumber(1,3) +
                        stMode;
//    L_arrayNodeState[NodeNo] := L_arrayNodeState[NodeNo] + 1;
    SendClientData(stClientSendData);
    SendSettingData(stClientSendData);

    nIndex := ArmAreaRelayModeList.indexof(stNodeNo);
    if nIndex > -1 then
    begin
      nNo := GetArmAreaRelayNo(stNodeNo,aEcuID,aArmArea);
      TArmAreaRelayModeState(ArmAreaRelayModeList.Objects[nIndex]).SetArmAreaMode(nNo,aWachMode);
    end;
end;

procedure TfmMain.NodeStateAllCheckSend;
var
  i : integer;
  stClientSendData : string;
begin
  StatusBar1.Panels[6].Text := 'NodeStateAllCheckSend';
  //Application.ProcessMessages;
  for i:= 0 to ComNodeList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
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
    //Delay(AllSendClientDelayTime);
    Application.ProcessMessages;
  end; 
end;

procedure TfmMain.DeviceStateAllCheckSend;
var
  i : integer;
  stClientSendData : string;
begin
  StatusBar1.Panels[6].Text := 'DeviceStateAllCheckSend';
  //Application.ProcessMessages;
  for i:=0 to DeviceList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
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
    Application.ProcessMessages;
  end;

end;

procedure TfmMain.AlarmStateAllCheckSend;
var
  i : integer;
  stMode : string;
  stClientSendData : string;
begin
  StatusBar1.Panels[6].Text := 'AlarmStateAllCheckSend';
  for i:=0 to DeviceList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    {DeviceWatchModeChange(self,
                          TDevice(DeviceList.Objects[i]).NodeNo,
                          TDevice(DeviceList.Objects[i]).ECUID,
                          TDevice(DeviceList.Objects[i]).WatchMode); }
    Case TDevice(DeviceList.Objects[i]).GetArmAreaState(0) of
     cmArm : begin  stMode := 'A' end;
     cmDisarm : begin stMode := 'D' end;
     cmTest : begin stMode := 'T' end;
     cmInit : begin stMode := 'I' end;
     cmPatrol : begin stMode := 'P' end;
     cmJaejung : begin stMode := 'E' end;
     else begin Exit end;//begin stMode := 'E' end;
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
    SendClientData(stClientSendData);
    Application.ProcessMessages;
  end;

end;

procedure TfmMain.DoorStateAllCheckSend;
var
  i,j : integer;
  stPNMode,stManageMode,stOpenState:string;
begin
  StatusBar1.Panels[6].Text := 'DoorStateAllCheckSend';
  for i:=0 to DeviceList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    for j:=1 to con_nFIXMAXDOORNO do
    begin
      if TDevice(DeviceList.Objects[i]).GetDoorUse(j) then
      begin
        DoorModeChanged(self,
                          TDevice(DeviceList.Objects[i]).NodeNo,
                          TDevice(DeviceList.Objects[i]).ECUID,
                          FillZeroNumber(j,2),
                          TDevice(DeviceList.Objects[i]).GetDoorManageMode(j),
                          TDevice(DeviceList.Objects[i]).GetDoorPNMode(j),
                          TDevice(DeviceList.Objects[i]).GetDoorState(j),
                          TDevice(DeviceList.Objects[i]).GetDoorLockMode(j),
                          TDevice(DeviceList.Objects[i]).GetDoorFire(j)
                          );
      end;
    end;
    (*
    DoorModeChanged(self,
                          TDevice(DeviceList.Objects[i]).NodeNo,
                          TDevice(DeviceList.Objects[i]).ECUID,
                          '01',
                          TDevice(DeviceList.Objects[i]).DoorManageMode1,
                          TDevice(DeviceList.Objects[i]).DoorPNMode1,
                          TDevice(DeviceList.Objects[i]).DoorState1,
                          TDevice(DeviceList.Objects[i]).DoorLockMode1,
                          TDevice(DeviceList.Objects[i]).Door1Fire
                          );
    //Delay(AllSendClientDelayTime);
    if G_bApplicationTerminate then Exit;
    DoorModeChanged(self,
                          TDevice(DeviceList.Objects[i]).NodeNo,
                          TDevice(DeviceList.Objects[i]).ECUID,
                          '02',
                          TDevice(DeviceList.Objects[i]).DoorManageMode2,
                          TDevice(DeviceList.Objects[i]).DoorPNMode2,
                          TDevice(DeviceList.Objects[i]).DoorState2,
                          TDevice(DeviceList.Objects[i]).DoorLockMode2,
                          TDevice(DeviceList.Objects[i]).Door1Fire
                          );
    //Delay(AllSendClientDelayTime);
    Application.ProcessMessages;
    *)
  end;

end;

procedure TfmMain.DoorModeChanged(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorDSState;
                                  aDoorLockMode:TDoorLockState;
                                  aDoorFire:Boolean);
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
    dmMaster : begin stManageType := '3' end;
    else begin Exit end;//begin stManageType := 'E' end;        --��� ������Ʈ���� ICU ���Թ� ���µ� ���� �޽��� ó��
  end;

  Case aDoorPNType of
    pnNothing : begin stPNType := 'E' end;
    pnPositive : begin stPNType := '0' end;
    pnNegative : begin stPNType := '1' end;
    else begin Exit end;//begin stPNType := 'E' end;
  end;

  Case aDoorStateType of
    dsNothing : begin stDoorState := 'E' end;
    dsClose : begin stDoorState := 'C' end;
    dsOpen : begin stDoorState := 'O' end;
    dsLongTime : begin stDoorState := 'T' end;
    dsOpenErr : begin stDoorState := 'U' end;
    dsCloseErr : begin stDoorState := 'L' end;
    else begin Exit end;//begin stDoorState := 'E' end;
  end;
  stData :=  stManageType +
             stPNType +
             stDoorState;

  if Not isdigit(aDoorNo) then exit;

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
  L_arrayNodeState[NodeNo] := L_arrayNodeState[NodeNo] + 1;
  
  SendClientData(stClientSendData);   //�� ���� �־���? ������ ����͸����� ���� ��ȸ�� �ȵǴµ�....
  SendSettingData(stClientSendData);

  //UpdateTB_DOOR_State(inttostr(NODENO),aEcuID,aDoorNo,stManageType,stPNType,stDoorState);
end;

function TfmMain.FileDataBaseBackup(bFull: Boolean): Boolean;
var
  stBackupDir : string;
begin
  Result := False;

  if not DirectoryExists(L_stDataBaseBackupDir) then
  begin
   if Not CreateDir(L_stDataBaseBackupDir) then
   begin
      DataBaseBackupTimer.Enabled := False;
      StatusBar1.Panels[2].Text := L_stDataBaseBackupDir + ' �� �����Ҽ� ���� ���丮�Դϴ�. ȯ�漳���� Ȯ�� �� ��⵿�Ͽ� �ּ���. ';
      //showmessage(DataBaseBackupDir + ' �� �����Ҽ� ���� ���丮�Դϴ�. ȯ�漳���� Ȯ�� �� ��⵿�Ͽ� �ּ���. ');
      Exit;
   end;
  end;

  if bDBBackup then Exit;
  bDBBackup := True;
  tbi.Hint := 'DataBase �����...';
  StatusBar1.Panels[0].Text := 'DataBase �����...';
  stBackupDir := L_stDataBaseBackupDir + '\' + FormatDateTime('yyyymmdd',Now);

  if not DirectoryExists(stBackupDir) then
  begin
   if Not CreateDir(stBackupDir) then
   begin
      DataBaseBackupTimer.Enabled := False;
      //showmessage(stBackupDir + ' �� �����Ҽ� ���� ���丮�Դϴ�. ȯ�漳���� Ȯ�� �� ��⵿�Ͽ� �ּ���. ');
      Exit;
   end;
  end;

  CreateBackupInfo(stBackupDir + '\Backup.ini');
  if DBType = 'PG' then PGAllDataBackup(stBackupDir)
  else if DBType = 'MSSQL' then MSSQLAllDataBackup(stBackupDir)
  else if DBType = 'MDB' then MDBAllDataBackup(stBackupDir);
{
  TableFileBackup(stBackupDir,'TB_ACCESSDEVICE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ACCESSEVENT');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ADMIN');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ADMINALARMDEVICE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ADMINCOMPANY');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ADMINDOOR');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ADMINFOOD');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ALARMDEVICE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ALARMEVENT');
  Delay(1000);
  if G_bApplicationTerminate then Exit;

  TableFileBackup(stBackupDir,'TB_ATCARD');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATCODE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATDAYSUMMARY');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATEMPEXTRA');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATEVENT');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATINCODE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATMONTHEXTRA');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATMONTHSUMMARY');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATOUTCODE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATPASS');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATVACATION');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ATVACODE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_BASEPAY');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_CARD');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_COMPANY');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_CONFIG');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_DEVICECARDNO');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_DEVICECARDNO_PROMISE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_DEVICESCHEDULE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_DOOR');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_FOOD');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_FOODCODE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_FOODEVENT');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_FOODGRADE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_LOCATION');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_READER');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_SENSOREVENT');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ZONEDEVICE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_ZONESCHEDULE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;

  TableFileBackup(stBackupDir,'TB_EMPLOYEE');
  Delay(1000);
 if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_EMPHIS');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_GRADE');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_GRADEPROGRAM');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_HOLIDAY');
  Delay(1000);
  if bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_MONTHAT');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_POSI');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_PERRELAYCONFIG');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  TableFileBackup(stBackupDir,'TB_FORMNAME');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
}
  if G_nSpecialProgram = 4 then
  begin
    tbi.Hint := '�л�ȸ������ ����';
    StatusBar1.Panels[0].Text := '�л�ȸ������ ����';
    tbi.ImageIndex := 1;
  end else
  begin
    tbi.Hint := '�ۼ��ŵ��󼭹� ����';
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� ����';
    tbi.ImageIndex := 0;
  end;

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
  DeleteRestoreTable(targetName);
//  targetName := copy(targetName,9,Length(targetName) - 8);
  lbl_Table.Caption := '[' + targetName + '] ���̺� ������...';
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
      if G_bApplicationTerminate then Exit;
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
      if G_bApplicationTerminate then Exit;
       Application.ProcessMessages;
       For i := 0 to (TblImport.FieldCount - 1) do begin
        if G_bApplicationTerminate then Exit;
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
        //����
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
      //showmessage(stBackupDir + ' �� �����Ҽ� ���� ���丮�Դϴ�. ȯ�漳���� Ȯ�� �� ��⵿�Ͽ� �ּ���. ');
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
    Try
      if (DBTYPE = 'MSSQL') or (DBTYPE = 'MDB') then SaveToFile(stBackupDir + '\' + aTableName + '.BAK');
    Except
      Exit;
    End;
  end;
  result := True;
end;

procedure TfmMain.DB1Click(Sender: TObject);
var
  stDir:string;
begin
  if Application.MessageBox('�����ͺ����� ���� �����ʹ� ��� ���� �˴ϴ�. ��� �Ͻðڽ��ϱ�?','���',MB_OKCANCEL) = ID_CANCEL then Exit;
  FolderDialog1.Directory := L_stDataBaseBackupDir;
  if Not FolderDialog1.Execute then Exit;
  stDir := FolderDialog1.Directory;
  showmessage(stDir + ' ���丮�� �����͸� �����մϴ�.');

  tbi.Hint := 'DataBase ������...';
  pan_gauge.Visible := True;
  Ga_Tot.MaxValue := 44;
  Ga_Tot.Progress := 0;
  StatusBar1.Panels[0].Text := 'DataBase ������...';

  FileDBRestor(stDir + '\' + 'TB_PERRELAYCONFIG' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_FORMNAME' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_CONFIG' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_EMPLOYEE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_CARD' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_DEVICECARDNO' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ACCESSDEVICE' + '.BAK');
  Ga_Tot.Progress := Ga_Tot.Progress + 1;
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ADMIN' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ADMINCOMPANY' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATCARD' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATCODE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATDAYSUMMARY' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATEMPEXTRA' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATEVENT' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATINCODE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATMONTHEXTRA' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATMONTHSUMMARY' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATOUTCODE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATPASS' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATVACATION' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ATVACODE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_BASEPAY' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_COMPANY' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_GRADE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_GRADEPROGRAM' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_HOLIDAY' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_MONTHAT' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_POSI' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ADMINALARMDEVICE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ADMINDOOR' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ADMINFOOD' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ALARMDEVICE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ALARMEVENT' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_DEVICECARDNO_PROMISE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_DEVICESCHEDULE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_DOOR' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_FOOD' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_FOODCODE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_FOODEVENT' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_FOODGRADE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_LOCATION' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_READER' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_SENSOREVENT' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ZONEDEVICE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ZONESCHEDULE' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  FileDBRestor(stDir + '\' + 'TB_ACCESSEVENT' + '.BAK');
  Delay(1000);
  if G_bApplicationTerminate then Exit;
  pan_gauge.Visible := False;
  if G_nSpecialProgram = 4 then
  begin
    tbi.Hint := '�л�ȸ������ ����';
    StatusBar1.Panels[0].Text := '�л�ȸ������ ����';
    tbi.ImageIndex := 1;
  end else
  begin
    tbi.Hint := '�ۼ��ŵ��󼭹� ����';
    StatusBar1.Panels[0].Text := '�ۼ��ŵ��󼭹� ����';
    tbi.ImageIndex := 0;
  end;

end;

procedure TfmMain.DB2Click(Sender: TObject);
var
  stBackupDir : string;
begin
  if FolderDialog1.Execute then
  begin
    stBackupDir := FolderDialog1.Directory;
    CreateBackupInfo(stBackupDir + '\Backup.ini');
    if DBType = 'PG' then PGAllDataBackup(stBackupDir)
    else if DBType = 'MSSQL' then MSSQLAllDataBackup(stBackupDir)
    else if DBType = 'MDB' then MDBAllDataBackup(stBackupDir);
  end;
//  FileDataBaseBackup(False);
end;

procedure TfmMain.WritingDaemonConfig;
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

  stSql := ' select AL_DATE,AL_TIME from TB_ALARMEVENT ';
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


function TfmMain.fdmsUserRelaySend(aEmCode,aFDMS_ID, aEM_NAME,aHandPhone, aDEPART_NAME, aPO_NAME,
  aCA_CARDNO,aMode,aJijumCode: string): Boolean;
var
  stSql : string;
  stNowDate : string;
  bResult : Boolean;
  stFdmsKey : string;
  stFdmsCardNo : string;
begin
  Result := False;
  //Datamodule1.SQLErrorLog('FDMSLOG:fdmsUserRelaySend');
  if CheckFdmsUser(aFDMS_ID,stFdmsKey,stFdmsCardNo) then
  begin
    Result := UpdateFdmsUser(stFdmsKey,aEmCode,aFDMS_ID, aEM_NAME,aHandPhone, aDEPART_NAME, aPO_NAME,aCA_CARDNO,aMode,aJijumCode);
  end else
  begin
    Result := InsertFdmsUser(aEmCode,aFDMS_ID, aEM_NAME,aHandPhone, aDEPART_NAME, aPO_NAME,aCA_CARDNO,aMode,aJijumCode);
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

//showmessage('�����ν� ��ȸ');
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
//showmessage('�����ν� ������Ʈ');
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
//showmessage('�����ν� �μ�Ʈ');

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

  stSql := 'select AC_NODENO,AC_ECUID,DO_DOORNO,FDMS_ID,DO_DOORNONAME from TB_DOOR ';
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
      if G_bApplicationTerminate then Exit;
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
  stFdmsKey : string;
  stFdmsCardNo : string;
  stCardNo : string;
begin
  stSql := CommonSql.UpdateTB_EMPHISState1('N','R');
  DataModule1.ProcessExecSQL(stSql);

  { �ӵ��� ���ؼ� ���̺� ���� �ٲ� 
  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinCARDRelayBase
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinCARDRelayBase
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinCARDRelayBase
  else Exit;
  stSql := stSql + ' AND g.SEND_STATUS = ''R'' ';
  stSql := 'select a.seq,a.group_code,a.co_companycode,c.co_jijumcode,a.em_code,a.fdms_id,a.mode,';
  stSql := stSql + ' a.send_status,a.ca_cardtype,a.send_status2,a.em_name,a.em_handphone,a.company_name,a.jijum_name,a.depart_name,a.po_name,b.ca_cardno ';
  }
  stSql := ' select ';
  if DBTYPE = 'MSSQL' then stSql := stSql + ' top 200 ';
  stSql := stSql + ' a.seq,a.group_code,a.co_companycode,c.co_jijumcode,a.em_code,a.fdms_id,a.mode,';
  stSql := stSql + ' a.send_status,a.ca_cardtype,a.send_status2,a.em_name,a.em_handphone,a.company_name,a.jijum_name,a.depart_name,a.po_name, ';
  stSql := stSql + ' b.ca_cardno as cardNo,c.FDMS_ID as EM_FDMSID  ';
  stSql := stSql + ' from TB_EMPHIS a ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';         //�׷��ڵ� ���� ���� ��� Key ���̺��� �˻����� �ʾƼ� Ÿ�Ӿƿ� �߻�
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = c.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  //stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  //stSql := stSql + ' AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO  ';
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

    if recordcount < 1 then Exit;

    While Not Eof do
    begin
      if G_bApplicationTerminate then Exit;
      stFdmsID := '';
      if Not FindField('EM_FDMSID').IsNull then
      begin
        nFdmsID := FindField('EM_FDMSID').asInteger;

        if G_nSpecialProgram = 2 then //RUC ����
        begin
          if IsDigit(FindField('EM_CODE').AsString) then
          begin
            if Length(FindField('EM_CODE').AsString) = 4 then
              stFdmsID := FindField('EM_CODE').AsString
            else
            begin
              //stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
              //DataModule1.ProcessExecSQL(stSql);
              stFdmsID := '';
            end;
          end else
          begin
            //stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
            //DataModule1.ProcessExecSQL(stSql);
            stFdmsID := '';
          end;
        end else
          stFdmsID := inttostr(nFdmsID);

        if FindField('MODE').AsString = '3' then
        begin
          if stFdmsID <> '' then
          begin
            if fdmsUserRelayDeleteSend(stFdmsID,
                             FindField('Mode').AsString
                             )
            then
            begin
              stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
              DataModule1.ProcessExecSQL(stSql);
            end;
          end else
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
                               FindField('Mode').AsString,
                               FindField('co_jijumcode').Asstring
                               )
              then
              begin
                //if CheckFdmsUser(stFdmsID,stFdmsKey,stFdmsCardNo) then    //�ȿ��� �ִ��� üũ�ϰ� �Ѿ� �´�.
                begin
                  stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
                  DataModule1.ProcessExecSQL(stSql);
                end;
              end;
            end
            else
            begin
              if DUPCARDTYPE = 1 then   //ī�尡 2�� �̻��ΰ�� ������ ī���� �� �ִ�.
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
                //ī���ȣ�� �߸��Ȱ��� �����ʿ� �������� �ʴ´�.
                stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
                DataModule1.ProcessExecSQL(stSql);
              end;
            end;
          end else
          begin
            if (Trim(FindField('cardNo').AsString) <> '')  then
            begin
              stCardNo := FindField('cardNo').AsString;
              if fdmsDeleteCardUse then
              begin
                stCardNo := copy(stCardNo,1,strtoint(fdmsDeleteCardStart)-1) + copy(stCardNo,strtoint(fdmsDeleteCardStart) + strtoint(fdmsDeleteCardLength),Length(stCardNo) - (strtoint(fdmsDeleteCardStart) + strtoint(fdmsDeleteCardLength) - 1));
              end;
              if fdmsAsciiToHex then
                 stCardNo := Ascii2Hex(stCardNo);
              if fdmsUserRelaySend(FindField('EM_CODE').AsString,
                               stFdmsID,
                               FindField('EM_NAME').AsString,
                               FindField('em_handphone').AsString,
                               FindField('DEPART_NAME').AsString,
                               FindField('PO_NAME').AsString,
                               stCardNo,
                               FindField('Mode').AsString,
                               FindField('co_jijumcode').Asstring
                               )
              then
              begin
                if CheckFdmsUser(stFdmsID,stFdmsKey,stFdmsCardNo) then
                begin
                  stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
                  DataModule1.ProcessExecSQL(stSql);
                end;
              end;
            end
            else
            begin
              if DUPCARDTYPE = 1 then   //ī�尡 2�� �̻��ΰ�� ������ ī���� �� �ִ�.
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
                //ī���ȣ�� �߸��Ȱ��� �����ʿ� �������� �ʴ´�.
                stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
                DataModule1.ProcessExecSQL(stSql);
              end;
            end;
          end;
        end
        else
        begin
          //������ȣ�� �߸��Ȱ��� �����ʿ� �������� �ʴ´�.
          stSql := CommonSql.UpdateTB_EMPHISSendAck1(inttostr(FindField('seq').asinteger),'Y');
          DataModule1.ProcessExecSQL(stSql);
        end;
      end;
      StatusBar1.Panels[2].Text := FindField('EM_NAME').AsString;
      Application.ProcessMessages;
      Next;
    end;
    fdmsRelyTimer.Interval := 1000;
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

//showmessage('�����ν� ��ȸ');
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
//showmessage('�����ν� ������Ʈ');
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
//showmessage('�����ν� �μ�Ʈ');

    end;
  end;

  Result := True;
end;

procedure TfmMain.StateCheckTimerTimer(Sender: TObject);
var
  i : integer;
  j : integer;
  k : integer;
begin
  if G_bApplicationTerminate then Exit;
  if Not L_bDaemonStart then Exit;
  StateCheckTimer.Enabled := False;
  StatusBar1.Panels[2].Text := 'StateCheckTimer';
  for I:= 0 to DeviceList.Count -1 do
  begin
    if G_bApplicationTerminate then Exit;
    if TDevice(DeviceList.Objects[I]).Connected then
    begin
      for k:=1 to con_nFIXMAXDOORNO do
      begin
        if TDevice(DeviceList.Objects[I]).GetDoorUse(k) then
        begin
          if (TDevice(DeviceList.Objects[I]).GetDoorManageMode(k) = dmNothing) or
           (TDevice(DeviceList.Objects[I]).GetDoorState(k) = dsNothing) or
           (TDevice(DeviceList.Objects[I]).GetDoorPNMode(k) = pnNothing) then
          begin
            TDevice(DeviceList.Objects[I]).Check_DoorState(inttostr(j)[1],False);
          end;
        end;
      end;
      (*
      if (TDevice(DeviceList.Objects[I]).Door1Use) then
      begin
        if (TDevice(DeviceList.Objects[I]).DoorManageMode1 = dmNothing) or
           (TDevice(DeviceList.Objects[I]).DoorState1 = dsNothing) or
           (TDevice(DeviceList.Objects[I]).DoorPNMode1 = pnNothing) then
        begin
          TDevice(DeviceList.Objects[I]).Check_DoorState('1',False);
        end;
      end;
      if (TDevice(DeviceList.Objects[I]).Door2Use) then
      begin
        if (TDevice(DeviceList.Objects[I]).DoorManageMode2 = dmNothing) or
           (TDevice(DeviceList.Objects[I]).DoorState2 = dsNothing) or
           (TDevice(DeviceList.Objects[I]).DoorPNMode2 = pnNothing) then
        begin
          TDevice(DeviceList.Objects[I]).Check_DoorState('2',False);
        end;
      end;
      *)
      if (Not TDevice(DeviceList.Objects[I]).ArmAreaUsed and (TDevice(DeviceList.Objects[I]).GetArmAreaState(0) = cmNothing)) or
         (TDevice(DeviceList.Objects[I]).ArmAreaUsed and (TDevice(DeviceList.Objects[I]).GetArmAreaState(1) = cmNothing)) then
      begin
        if TDevice(DeviceList.Objects[I]).ECUID = '00' then
        begin
           TDevice(DeviceList.Objects[I]).CheckWatchMode('0');
           if TDevice(DeviceList.Objects[I]).ArmAreaUsed then TDevice(DeviceList.Objects[I]).CheckWatchMode('1');
        end else
        begin
          if TDevice(DeviceList.Objects[I]).ArmAreaUsed then
          begin
            TDevice(DeviceList.Objects[I]).CheckWatchMode('1');
          end else
          begin
            TDevice(DeviceList.Objects[I]).CheckWatchMode('0');
          end;
        end;
      end;
      //if TDevice(DeviceList.Objects[I]).Door1Use or TDevice(DeviceList.Objects[I]).Door2Use then   //�׻� ��� üũ ����.
      begin
        if Not TDevice(DeviceList.Objects[I]).DeviceSkillReceive  then  //��� üũ
        begin
          TDevice(DeviceList.Objects[I]).CheckSystemSkill;
        end;
      end;
    end;
  end;

  Try
    if Not G_bApplicationTerminate then  StateCheckTimer.Enabled := True;
  Except
  End;
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


function TfmMain.CheckFdmsUser(aFDMS_ID: string;var aFdmsKey,aFdmsCardNo:string): Boolean;
var
  stSql : string;
begin
  result := False;
  aFdmsKey := '';
  if (fdmsType = '0') or (fdmsType = '2')  then //����
  begin
    stSql := ' select * from tb_employe ';
    stSql := stSql + 'where str_emptmId = '''+ FillZeroNumber(strtoint(aFDMS_ID),G_nFPUserIDLength)+''' ';
    //stSql := stSql + ' Where str_empCode = ''' + 'ep_' + FillZeroNumber(strtoint(aFDMS_ID),7)  + ''' ';
  end else if fdmsType = '1' then //���Ͽ�
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
    if recordCount > 0 then
    begin
      result := True;
      if (fdmsType = '0') or (fdmsType = '2') then
      begin
        aFdmsKey := FindField('str_empCode').AsString;
        aFdmsCardNo := FindField('str_emptmCardnum').AsString ;
      end else if fdmsType = '1' then
      begin
        aFdmsKey := FindField('id').AsString;
        aFdmsCardNo := FindField('cardnum').AsString ;
      end;
(*    end else         //���̵� üũ�ؼ� ���̵� ������ Ű���� ���� ��������.
    begin
      if (fdmsType = '0') or (fdmsType = '2') then //����
      begin
        stSql := ' select * from tb_employe ';
        stSql := stSql + ' Where str_empCode = ''' + 'ep_' + FillZeroNumber(strtoint(aFDMS_ID),7)  + ''' ';
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
          result := True;
          aFdmsKey := FindField('str_empCode').AsString ;
          aFdmsCardNo := FindField('str_emptmCardnum').AsString ;
        end;
      end;
*)
    end;
  End;

end;

function TfmMain.InsertFdmsUser(aEmCode,aFDMS_ID, aEM_NAME, aHandPhone,
  aDEPART_NAME, aPO_NAME, aCA_CARDNO,aMode,aJijumCode: string): Boolean;
var
  stSql : string;
  stMode : string;
  stCardNo : string;
  stTemp1,stTemp2 : string;
  stFDMS_Key : string;
begin
  result := False;
  stCardNo := aCA_CARDNO;

  if (fdmsType = '0') or (fdmsType = '2') then //����
  begin
    stFDMS_Key := 'ep_' + FillZeroNumber(strtoint(aFDMS_ID),7) ;
    stFDMS_Key := GetFdmsUserKey(stFDMS_Key);
    if Length(stCardNo) > G_nFdmsCardLength then stCardNo := copy(stCardNo,1,G_nFdmsCardLength);
    stCardNo := FillCharString(stCardNo,'F',G_nFdmsCardLength);
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
    stSql := stSql + '''' + stFDMS_Key + ''',';
    stSql := stSql + '''' + aEM_NAME + ''',';
    if fdmsDepartCodeUse then stSql := stSql + '''' + 'pt_' + FillZeroStrNum(aJijumCode,3) + ''','
    else stSql := stSql + '''��������'',';
    stSql := stSql + '''��������'',';
    stSql := stSql + '''000000-0000000'',';
    stSql := stSql + '''' + aHandPhone + ''',';
    stSql := stSql + '''�⺻��'',';
    stSql := stSql + '''FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    stSql := stSql + 'FFFFFFFFFFFFFFFFFFFFFFF'',';
    stSql := stSql + ''''+ FillZeroNumber(strtoint(aFDMS_ID),G_nFPUserIDLength)+''',';
    stSql := stSql + '''' + stCardNo + ''',';
    stSql := stSql + '''' + stMode + ''',';
    if fdmsDBType = 0 then
    begin
      stSql := stSql + '''' + formatDateTime('yyyy-mm-dd AMPM HH:MM:SS',Now) + ''')' ;
    end else if fdmsDBType = 1 then
    begin
      stSql := stSql + '''' + formatDateTime('yyyy-mm-dd HH:MM:SS',Now) + ''')' ;
    end;
  end else if fdmsType = '1' then //���Ͽ�
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
    stSql := stSql + '''' + stCardNo + ''',';
    stSql := stSql + '''0'',';
    stSql := stSql + '''0'')';
  end else Exit;

  if SHF_ProcessExecSQL(stSql) > 0 then result := True;

  result := CheckFdmsUser(aFDMS_ID,stTemp1,stTemp2);

end;

function TfmMain.UpdateFdmsUser(aFdmsKey,aEmCode,aFDMS_ID, aEM_NAME, aHandPhone,
  aDEPART_NAME, aPO_NAME, aCA_CARDNO,aMode,aJijumCode: string): Boolean;
var
  stSql : string;
  stMode : string;
  stCardNo : string;
  stFdmsKey,stFdmsCardNo : string;
begin
  result := False;
  stCardNo := aCA_CARDNO;
  if (fdmsType = '0') or (fdmsType = '2') then //����
  begin
    if Trim(aHandPhone) = '' then aHandPhone := '000-000-0000';
    stMode := inttostr(strtoint(aMode) - 1);
    if Length(stCardNo) > G_nFdmsCardLength then stCardNo := copy(stCardNo,1,G_nFdmsCardLength);

    stCardNo := FillCharString(stCardNo,'F',G_nFdmsCardLength);
    stSql := ' Update tb_employe set ';
    stSql := stSql + 'str_empNum = ''' + aEmCode + ''',';
    stSql := stSql + 'str_empName = ''' + aEM_NAME + ''',';
    stSql := stSql + 'str_empTel = ''' + aHandPhone + ''',';
    stSql := stSql + 'str_emptmCardnum = ''' + stCardNo + ''', ';
    if fdmsDepartCodeUse then stSql := stSql + 'str_empPostCode = ''' + 'pt_' + FillZeroStrNum(aJijumCode,3) + ''',';
    stSql := stSql + 'byte_empMainControlModify = ''' + stMode + ''' ';
    //stSql := stSql + ' where str_empCode = ''' + 'ep_' + FillZeroNumber(strtoint(aFDMS_ID),7)  + ''' ';
    stSql := stSql + ' where str_empCode = ''' + aFdmsKey  + ''' ';
    stSql := stSql + ' AND str_emptmId = ''' + FillZeroNumber(strtoint(aFDMS_ID),G_nFPUserIDLength)  + ''' ';   //20180315 �߰� ������ ������ ���� ������Ʈ �Ǵ� ���� �߻�

  end else if fdmsType = '1' then //���Ͽ�
  begin
      stSql := 'update tuser set ';
      stSql := stSql + 'Name = ''' + aEM_NAME + ''',';
      stSql := stSql + 'datelimit = ''N0000000000000000'',' ;
      stSql := stSql + 'badmin = ''0'', ' ;
      stSql := stSql + 'company = ''' + aDEPART_NAME + ''',' ;
      stSql := stSql + 'dept = ''' + aPO_NAME + ''',';
      stSql := stSql + 'validtype = ''4'', ';
      stSql := stSql + 'cardnum = ''' + stCardNo + ''',';
      stSql := stSql + 'identify = ''0'',' ;
      stSql := stSql + ' seculevel = ''0'' ';
      stSql := stSql + ' Where id = ' + aFDMS_ID ;
  end else Exit;

  if SHF_ProcessExecSQL(stSql) > 0 then result := True;

  if CheckFdmsUser(aFDMS_ID,stFdmsKey,stFdmsCardNo) then
  begin
    if stFdmsCardNo = stCardNo then result := True;
  end;

  //result := True;
end;

function TfmMain.fdmsUserRelayDeleteSend(aFDMS_ID, aMode: string): Boolean;
var
  stSql : string;
  stMode : string;
begin
  result := True;
  if Not fdmsDelete then
  begin
    if (fdmsType = '0') or (fdmsType = '2') then //����
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
  end else
  begin
    DeleteFdmsUser(aFDMS_ID);
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

  StartTime:=TimeCounter+ ClientConnectTime;
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
          if G_bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {���������� ���� ������ ó�� ��ƾ�߰�}
        nIndex:= Pos(STX,Ws);
        if nIndex = 0 then Exit;
        if nIndex > 1 then Delete(Ws,1,nIndex-1);
        nIndex:= Pos(ETX,Ws);
        if nIndex = 0 then Exit;
        Ws := copy(Ws,1,nIndex);
        ClientThread.Socket.WriteLn(ws);   //STX + ETX �� �ִ� ��쿡�� ����

        if Ws <> '' then RcvCardReaderServer(ClientThread.Socket.PeerIPAddress,ws);
        if L_bShowCardServerState then
        begin
          self.FindClassForm('TfmCardReaderServerMonitor').FindCommand('Message').Params.Values['IP'] := ClientThread.Socket.PeerIPAddress;
          self.FindClassForm('TfmCardReaderServerMonitor').FindCommand('Message').Params.Values['Data'] := Ws;
          self.FindClassForm('TfmCardReaderServerMonitor').FindCommand('Message').Execute;
        end;

        //Ws:= Ws ;
        ws:='';
      end;
      StartTime:=TimeCounter+ ClientConnectTime;
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
begin
  if Not GetRelayNo(aRelayNo,stNodeNo,stECUID,stCardReaderNo) then Exit;

  aDevice := GetDevice(stNodeNo + stEcuID);
  if aDevice <> nil then
    aDevice.ServerCarDataSend(stCardReaderNo,aCardData);
end;

function TfmMain.GetRelayNo(aRelayNo: integer; var aNodeNo, aECUID,
  aCardReaderNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' select AC_NODENO,AC_ECUID,RE_READERNO from TB_SERVERCARDRELAY ';
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
   if UpperCase(stResult) = 'TRUE' then L_bShowCardServerState := True
   else L_bShowCardServerState := False;

end;

procedure TfmMain.FormShow(Sender: TObject);
//var
//  ini_fun : TiniFile;
//  LogoFile : string;
var
  stSql : string;
begin
  L_bShowCardServerState := False;
  L_bShowCurrentState := False;
  L_bShowDeviceSetting :=  False;
  L_stSendHolidayYear := GetSendHolidayYear;

  //DEBUG
  //LogSave(ExeFolder + '\..\log\lomosHis.log','FormShow ');
//  L_bFirstFire := False;

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','DAEMON_VER','10');
  DataModule1.ProcessExecSQL(stSql);
  
  //GroupPermitTimer.Enabled := True; => �����뿡�� ���ϸ� �ʹ� ���� �Ծ ������ ���� ����͸����α׷����� �۾��ϵ��� ó�� �Ұ�
end;

procedure TfmMain.DeviceRegisterClear(Sender: TObject; ReceiveData: string;
  NodeNO: integer);
var
  stECUID : string;
begin
  stEcuID := copy(ReceiveData,15,2);

  dmDBFunction.UpdateTB_ACCESSDEVICE_Ack(inttostr(NodeNo),stEcuID,'N'); //��������� �ٽ� ������.

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
                      'MC',
                      '0',
                      '0',
                      '0',
                      'Y',
                      '',
                      '',
                      '');

  //���⿡�� ī�� �ٽ� �ٿ�ε� ����
  if CheckTB_FTPLIST(inttostr(NodeNo),stEcuID) then
  begin
    UpdateTB_FTPLIST_FileName(inttostr(NodeNo),stEcuID,FillZeroNumber(NodeNo,3) + stEcuID,'N');
  end else
  begin
    InsertTB_FTPLIST(inttostr(NodeNo),stEcuID,FillZeroNumber(NodeNo,3) + stEcuID,'N');
  end;
  FTPSendTimer.Enabled := True;
end;

function TfmMain.UpdateTB_DEVICESCHEDULE_Ack(aNodeNo, aEcuID, aDoorNo,aDayCode,
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
  begin
    stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
    stSql := stSql + ' AND DE_DAYCODE = ''' + aDayCode + ''' ';
  end;

  result := DataModule1.ProcessExecSQL(stSql);
end;


procedure TfmMain.mn_AlarmReaderClick(Sender: TObject);
begin
  fmAlaramReader:= TfmAlaramReader.Create(Self);
  fmAlaramReader.SHowmodal;
  fmAlaramReader.Free;
//  DeviceInfoSendTimer.Enabled := True;

end;

procedure TfmMain.SentenceRelayTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  SentenceRelayTimer.Enabled := False;
  StatusBar1.Panels[2].Text := 'SentenceRelayTimer';
  Application.ProcessMessages;

  SentenceRelaySend;
  if G_bApplicationTerminate then Exit;

  Try
    if L_bRelaySentenceUse then SentenceRelayTimer.Enabled := True
    else SentenceRelayTimer.Enabled := False;
  Except
  End;
end;

function TfmMain.GetSentenceRelayConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  L_stRelaySentenceServerIP:='127.0.0.1';
  L_stRelaySentenceServerPort:='3000';
  L_bRelaySCardNoUse:=True;
  L_bRelaySSerialUse:=True;
  L_bRelaySCompanyCodeUse:=True;
  L_bRelaySEmpNoUse:=True;
  L_bRelaySEmpNameUse:=True;
  L_bRelaySCardStateUse:=True;
  L_bRelaySChangeStateUse:=True;
  L_stRelayDelimiter :=',';
  L_stRelaySentenceSendData:='';


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
        if G_bApplicationTerminate then Exit;
        if FindField('PC_CONFIGCODE').AsString = 'SCARDNO' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bRelaySCardNoUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SSERIAL' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bRelaySSerialUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SCOMPANYCODE' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bRelaySCompanyCodeUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SEMPNO' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bRelaySEmpNoUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SEMPNAME' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bRelaySEmpNameUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SCARDSTATE' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bRelaySCardStateUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SCHANGESTATE' then
        begin
          if strtoint(FindField('PC_CONFIGVALUE').AsString) = 0 then L_bRelaySChangeStateUse := False;
        end else if FindField('PC_CONFIGCODE').AsString = 'SDELIMITER' then
          L_stRelayDelimiter := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'SRELAYIP' then
          L_stRelaySentenceServerIP := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'SRELAYPORT' then
          L_stRelaySentenceServerPort := FindField('PC_CONFIGVALUE').AsString
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
  if G_bApplicationTerminate then Exit;

  stSql := commonSql.UpdateTB_EMPHISState2('N','S'); //�۽������� ����
  DataModule1.ProcessExecSQL(stSql);

  {//EMPHIS ���� �ʵ� �߰��� ������ �ʿ� ����
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
        if G_bApplicationTerminate then Exit;
        L_stRelaySentenceSendData := '';
        if L_bRelaySSerialUse then
        begin
          if L_stRelaySentenceSendData <> '' then L_stRelaySentenceSendData := L_stRelaySentenceSendData + L_stRelayDelimiter;
          L_stRelaySentenceSendData := L_stRelaySentenceSendData + inttostr(FindField('FDMS_ID').AsInteger);
        end;
        if L_bRelaySCompanyCodeUse then
        begin
          if L_stRelaySentenceSendData <> '' then L_stRelaySentenceSendData := L_stRelaySentenceSendData + L_stRelayDelimiter;
          L_stRelaySentenceSendData := L_stRelaySentenceSendData + FindField('CO_COMPANYCODE').AsString;
        end;
        if L_bRelaySEmpNoUse then
        begin
          if L_stRelaySentenceSendData <> '' then L_stRelaySentenceSendData := L_stRelaySentenceSendData + L_stRelayDelimiter;
          L_stRelaySentenceSendData := L_stRelaySentenceSendData + FindField('EM_CODE').AsString;
        end;
        if L_bRelaySEmpNameUse then
        begin
          if L_stRelaySentenceSendData <> '' then L_stRelaySentenceSendData := L_stRelaySentenceSendData + L_stRelayDelimiter;
          L_stRelaySentenceSendData := L_stRelaySentenceSendData + FindField('EM_NAME').AsString;
        end;
        if L_bRelaySCardStateUse then
        begin
          if L_stRelaySentenceSendData <> '' then L_stRelaySentenceSendData := L_stRelaySentenceSendData + L_stRelayDelimiter;
          L_stRelaySentenceSendData := L_stRelaySentenceSendData + FindField('CA_CARDTYPE').AsString;
        end;
        if L_bRelaySChangeStateUse then
        begin
          if L_stRelaySentenceSendData <> '' then L_stRelaySentenceSendData := L_stRelaySentenceSendData + L_stRelayDelimiter;
          L_stRelaySentenceSendData := L_stRelaySentenceSendData + FindField('MODE').AsString;
        end;
        if L_bRelaySCardNoUse then
        begin
          if L_stRelaySentenceSendData <> '' then L_stRelaySentenceSendData := L_stRelaySentenceSendData + L_stRelayDelimiter;
          L_stRelaySentenceSendData := L_stRelaySentenceSendData + FindField('CA_CARDNO').AsString;
        end;
        L_stRelaySentenceSendData := STX + L_stRelaySentenceSendData + ETX;

        L_bRelaySentenceSendResult := False;

        if Not SentenceSock.Open then break;
        SentenceSock.FlushInBuffer;
        SentenceSock.FlushOutBuffer;
        Delay(10);
        Try
          SentenceSock.PutString(L_stRelaySentenceSendData);
          StatusBar1.Panels[2].Text := '[TX]' + L_stRelaySentenceSendData ;
        Except
          Exit;
        End;

        PastTime := GetTickCount + 1000;
        While Not L_bRelaySentenceSendResult do
        begin
          Application.ProcessMessages;
          if GetTickCount > PastTime then Break;  //300�и����� ���� ������ ���з� ó����
        end;

        if L_bRelaySentenceSendResult then
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
    
    stSql := commonSql.UpdateTB_EMPHISState2('S','N'); //�۽Ž����Ѱ� �̼۽����� ����
    DataModule1.ProcessExecSQL(stSql);
  End;

end;

function TfmMain.SentenceServerConnect: Boolean;
begin
  result := False;
  Try
    SentenceSock.Open := False;
    SentenceSock.WsAddress := L_stRelaySentenceServerIP;
    SentenceSock.WsPort := L_stRelaySentenceServerPort;
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

  StatusBar1.Panels[2].Text := '[RX]' + st;
  
  if st = L_stRelaySentenceSendData then L_bRelaySentenceSendResult := True;
end;

procedure TfmMain.mn_FireRecoveryClick(Sender: TObject);
var
  i,j : integer;
  stClientSendData : string;
begin
  //L_bFirstFire := False;
  L_bFierDoorOpen := False;
  for i:= 0 to ComNodeList.Count - 1 do
  begin
    TCommnode(ComNodeList.Objects[i]).FireRecovery(True);
    if G_bFireRelayUse then
    begin
      TCommnode(ComNodeList.Objects[i]).AllRelayControl(G_nFireRelayNumber,G_nFireRelayTime);
    end;
  end;
  for i:=0 to DeviceList.Count - 1 do
  begin
    for j := 1 to con_nFIXMAXDOORNO do
    begin
      TDevice(DeviceList.Objects[I]).SetDoorFire(j,False);
    end;
    //TDevice(DeviceList.Objects[I]).Door1Fire := False;
    //TDevice(DeviceList.Objects[I]).Door2Fire := False;
  end;

  dmDBFunction.UpdateTB_CURRENTDAEMON_Field_StringValue('FIREORIGIN','CU_STATEVALUE','FALSE');
  stClientSendData := 'R' +
                        'S' +
                        '000' +
                        '00' +
                        '00' +
                        '00' +
                        'SV' +
                        'R' +
                        FillZeroNumber(Length('FIRERECOVERY'),3) +
                        'FIRERECOVERY';
  SendClientData(stClientSendData);
  DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','ȭ�纹��','DAEMON')

end;

procedure TfmMain.Control_DoorAllOpenMode;
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
       '1' + //aDoorNo+                                //  ��⳻ Door No
       #$30+                                   //  RecordCount(����)
       #$32+                                   //  RecordCount(��庯�� #$32)
       '1'; //aMode;                                  //  '0':� ,'1':����
  MCUBroadDataSend('99','c',stSendData);
  // Door2 All Open Mode Change
  stSendData:= 'C'+                                     //  Msg Code
       //InttoStr(CommNode.Send_MsgNo)+          // Message Count
       '0' +
       '2' + //aDoorNo+                                //  ��⳻ Door No
       #$30+                                   //  RecordCount(����)
       #$32+                                   //  RecordCount(��庯�� #$32)
       '1'; //aMode;                                  //  '0':� ,'1':����
  MCUBroadDataSend('99','c',stSendData);

  L_bAllDoorOpen := False;
end;

procedure TfmMain.GetFireConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  L_stFireStatus := 'FI'; //ȭ�簨�����°�
  L_bFireAllOpen := False; //ȭ��� ��ü��������
  L_bFireRecoverUse := False; //ȭ����ü���� �������
  G_bFireRelayUse := False;
  G_nFireRelayNumber :=6;        //ȭ�纹���� ������ ��ȣ
  G_nFireRelayTime :=2;          //ȭ�纹���� ������ ���� �ð�

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
        if G_bApplicationTerminate then Exit;
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
        end else if FindField('CO_CONFIGCODE').AsString = 'RELAYUSE' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFireRelayUse := True
          else G_bFireRelayUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'RELAYNO' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nFireRelayNumber := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'RELAYTIME' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nFireRelayTime := strtoint(FindField('CO_CONFIGVALUE').AsString);
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

procedure TfmMain.RcvFromFDClient(aClientIP, ast: string);
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

  if stCMD = 'STATECHECK' then Process_DeviceSTATECHECK(stDeviceID);

end;


procedure TfmMain.mn_DeviceSettingClick(Sender: TObject);
begin
  fmDeviceSetting:= TfmDeviceSetting.Create(Self);
  L_bShowDeviceSetting := True;
  fmDeviceSetting.Showmodal;
  L_bShowDeviceSetting := False;
  fmDeviceSetting.Free;

end;

function TfmMain.PubDoorInfo_Device_Serch(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stDeviceID : string;
  aDevice: TDevice;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  aDevice:= GetDevice(stDeviceID);
  if aDevice = nil then Exit;
  aDevice.DeviceDoorInfoSearch(aDoorNo);
  
  result := True;
end;

function TfmMain.PubDoorInfo_Device_Setting(aNodeNo, aEcuID, aDoorNo,
  aCardMode,aDoorMode,aDoorControlTime,aOpenMoni,aUseSch,aSendDoor,aAlarmLong,
  aFire,aLockType,aDSOpen,aRemoteDoor: string;aCmd:string = 'A'): Boolean;
var
  stDeviceID : string;
  aDevice: TDevice;
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

  aDevice:= GetDevice(stDeviceID);
  if aDevice = nil then Exit;


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
      //showmessage('�и��� ������ ���ÿ� ���ؼ��� �����մϴ�.');
      Exit;
    end;
    nMSec := strtoint(stMsec) div 100;
    if nMSec < 1 then
    begin
      //showmessage('�и��� ������ ���ÿ� ���ؼ��� �����մϴ�.');
      Exit;
    end;
    if nMSec > 9 then
    begin
      //showmessage('�и��� ������ ���ÿ� ���ؼ��� �����մϴ�.');
      Exit;
    end;
    nOrd := $20 + nMSec; //21~29 ���� MSEC;
    stDoorControlTime1 := Char(nOrd);
  end;

  if Not IsDigit(aCardMode) then aCardMode := '0';
  if Not IsDigit(aDoorMode) then aDoorMode := '0';
  if Not IsDigit(aOpenMoni) then aOpenMoni := '0';
  if Not IsDigit(aUseSch)   then aUseSch := '0';
  if Not IsDigit(aSendDoor)   then aSendDoor := '0';
  if Not IsDigit(aAlarmLong)   then aAlarmLong := '0';
  if Not IsDigit(aFire)   then aFire := '0';

  //���Թ�1
  //if strtoint(aLockType) < 4 then nLockType := strtoint(aLockType)
  //else nLockType := strtoint(aLockType) + 2;
  if isDigit(aLockType) then
  begin
    if strtoint(aLockType) < 4 then
        nLockType := ord('0') + strtoint(aLockType)
    else nLockType := ord('0') + strtoint(aLockType) + 2;
  end;
  if not isDigit(aDSOpen) then aDSOpen := '0';
  if not isDigit(aRemoteDoor) then aRemoteDoor := '0';

  aOpenMoni := char(strtoint(aOpenMoni) + $30);

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
                              aRemoteDoor,
                              aCmd);


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
  stIP : string;
begin
  if G_bApplicationTerminate then Exit;

  Try
    ClientInfo := Pointer(AThread.Data);
    if ClientInfo = nil then Exit;
    //nIndex := ClientConnectList.IndexOf(ClientInfo);
    //if nIndex > -1 then TClientInfo(ClientConnectList.Items[nIndex]).AliveTime := Now;
    stTemp:= Trim(AThread.Connection.ReadLn(LINEEND));
    stIP := AThread.Connection.Socket.Binding.PeerIP; //SocksInfo.LocalName;

    if stTemp <> '' then
    begin
      FClientReceive.Enter;
      ClientReceiveDataList.Add(stIP + DATADELIMITER + stTemp);
      FClientReceive.Leave;
    end;

{//    stTemp:= AThread.Connection.CurrentReadBuffer;
    if AThread <> nil then
    begin
      do_ClientProcessPacket(AThread,stTemp);
    end; }
  Except
    //�α�����
    AThread.Stop;
  End;

end;

procedure TfmMain.RSERVERConnect(AThread: TIdPeerThread);
var
  ClientInfo : TClientInfo;
begin
  if G_bApplicationTerminate then Exit;
  AThread.FreeOnTerminate := True;
  ClientInfo := TClientInfo.Create;
  ClientInfo.ClientIP := AThread.Connection.Socket.Binding.PeerIP;
  ClientInfo.ClientPort := AThread.Connection.Socket.Binding.PeerPort;
  ClientInfo.AThread := AThread;
  //ClientConnectList.Add(ClientInfo);
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
  //nIndex := ClientConnectList.IndexOf(ClientInfo);
  //if nIndex > -1 then ClientConnectList.Delete(nIndex);
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


function TfmMain.CaseSendClientData(stData: string;
  AThread: TIdPeerThread): Boolean;
begin
  AThread.Connection.WriteLn(stData);
end;

procedure TfmMain.CaseAlarmStateAllCheckSend(AThread: TIdPeerThread);
var
  i : integer;
  stMode : string;
  stClientSendData : string;
begin
  for i:=0 to DeviceList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;

    Case TDevice(DeviceList.Objects[i]).GetArmAreaState(0) of
     cmArm : begin  stMode := 'A' end;
     cmDisarm : begin stMode := 'D' end;
     cmTest : begin stMode := 'T' end;
     cmInit : begin stMode := 'I' end;
     cmPatrol : begin stMode := 'P' end;
     cmJaejung : begin stMode := 'E' end;
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


end;

procedure TfmMain.CaseDoorStateAllCheckSend(AThread: TIdPeerThread);
var
  i,j : integer;
  stManageType : string;
  stPNType : string;
  stDoorState : string;
  stData : string;
  stClientSendData : string;
begin

  for i:=0 to DeviceList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;

    for j := 1 to con_nFIXMAXDOORNO do
    begin
      if TDevice(DeviceList.Objects[i]).GetDoorUse(j) then
      begin
        Case TDevice(DeviceList.Objects[i]).GetDoorManageMode(j) of
          dmNothing : begin stManageType := 'E' end;
          dmManager : begin stManageType := '0' end;
          dmOpen : begin stManageType := '1' end;
          dmLock : begin stManageType := '2' end;
          dmMaster : begin stManageType := '3' end;
          else begin stManageType := 'E' end;
        end;
        Case TDevice(DeviceList.Objects[i]).GetDoorPNMode(j) of
          pnNothing : begin stPNType := 'E' end;
          pnPositive : begin stPNType := '0' end;
          pnNegative : begin stPNType := '1' end;
          else begin stPNType := 'E' end;
        end;
        Case TDevice(DeviceList.Objects[i]).GetDoorState(j) of
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
                          FillZeroNumber(j,2) +  //
                          '00' +
                          'DV' +
                          'S' +
                          FillZeroNumber(Length(stData),3) +
                          stData;
        CaseSendClientData(stClientSendData,AThread);
        //Application.ProcessMessages;
        //Delay(10);
      end;
    end;
  end;
(*
    Case TDevice(DeviceList.Objects[i]).DoorManageMode1 of
      dmNothing : begin stManageType := 'E' end;
      dmManager : begin stManageType := '0' end;
      dmOpen : begin stManageType := '1' end;
      dmLock : begin stManageType := '2' end;
      dmMaster : begin stManageType := '3' end;
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
      dmMaster : begin stManageType := '3' end;
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
*)
end;

procedure TfmMain.PC1Click(Sender: TObject);
begin
  if L_bFormActive then
    MDIChildShow('TfmMonitoringState');
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
  stData := '';
  if Not L_bSendClientSequence then
  begin
    if L_bDaemonStop then Exit;
    if L_bProcessStateCheckII then Exit;
    if L_bProcessStateCheckIII then Exit;
    if L_bProcessStateCheckIV then Exit;
  end;
  sendClientTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  Try
    if dmMonitoringServer.DXUnicastDataQueue1.WaitingQueues > 0 then
    begin
      StatusBar1.Panels[5].Text := 'QU' + inttostr(ClientSendList.Count);
      Exit; //���Ͽ� ������ �����Ұ� �������� ���´� ���߿� ��������.
    end else StatusBar1.Panels[5].Text := 'PC' + inttostr(ClientSendList.Count);
    if ClientSendList.Count < 1 then Exit;
    Try
      FClientSender.Enter;
      if ClientSendList.Count > 0 then
      begin
        stData := ClientSendList.Strings[0];
        ClientSendList.Delete(0);
      end;
    Finally
      FClientSender.Leave;
    End;
    if stData = '' then Exit;
    SendClientData(stData,True);
    SendSettingData(stData);
    ATSendClientData(Sender,stData,0);
    FDSendClientData(stData);
  Finally
    sendClientTimer.Enabled := True;
  End;
{
  Application.ProcessMessages;
  if ClientSendList.Count < 1 then Exit;
  StatusBar1.Panels[2].Text := 'sendClientTimer' + inttostr(ClientSendList.Count);
  sendClientTimer.Enabled := False;
  FClientSender.Enter;
  stData := ClientSendList.Strings[0];
  ClientSendList.Delete(0);
  FClientSender.Leave;
  for nConnection:=0 to ClientConnectList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    TClientInfo(ClientConnectList.Items[nConnection]).AThread.Connection.WriteLn(stData);
    Application.ProcessMessages;
  end;
  if mem_ComList.Visible then
  begin
    mem_ComList.Lines.Add('[TX]['+stData+']');
  end;
  //sendClientTimer.Enabled := True; }
end;

function TfmMain.LoadInOutReader: Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
  stInOutReader : string;
begin
  Result := False;

  InOutCardReaderList.Clear;
  InOutGroupReaderList.Clear;
  InOutCountList.Clear;

  stSql := 'Select AC_NODENO,AC_ECUID,RE_READERNO,RE_INOUTCOUNT,IO_GROUPCODE from TB_READER where RE_INOUTCOUNT <> 0 ';

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
        InOutGroupReaderList.Add(FindField('IO_GROUPCODE').AsString);
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

function TfmMain.UpdateTB_INOUTCOUNT_Add(aDate, aNodeNo, aECUID, aDoorNo,
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
  stSql := 'select IO_DATE,AC_NODENO,AC_ECUID,DO_DOORNO from TB_INOUTCOUNT ';
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

Function TfmMain.FTP_CardDataCreate(aNodeNo, aEcuID: string):Boolean;
var
  stSql : string;
//  CardList : TStringList;
  stFileName : string;
  nPositionNum : integer;
  stTemp : string;
  i : integer;
  TempAdoQuery : TADOQuery;
  nCardFixType : integer;
  nIndex : integer;
begin
  result := False;

  nCardFixType := CARDLENGTHTYPE ;
  nIndex := ComNodeList.Indexof('NODE'+InttoStr(strtoint(aNodeNo)));
  if nIndex > -1 then
  begin
    nCardFixType := TCommNode(ComNodeList.Objects[nIndex]).CardFixType;
  end;

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

  stSql := 'Update TB_DEVICECARDNO Set DE_RCVACK = ''C'' '; //FTP File Create ���·� ����
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
        if G_bApplicationTerminate then Exit;
        stSql := ' select ';
        if DBTYPE = 'MSSQL' then stSql := stSql + ' top 200 ';
        stSql := stSql + ' a.CA_CARDNO,a.DE_DOOR1,a.DE_DOOR2,a.DE_USEACCESS,a.DE_USEALARM,a.DE_TIMECODE,a.DE_PERMIT,';
        stSql := stSql + ' b.positionnum,b.ca_cardtype,c.EM_retiredate,a.AC_NODENO,a.AC_ECUID,a.GROUP_CODE, ';
        stSql := stSql + ' a.DE_DOOR3,a.DE_DOOR4,a.DE_DOOR5,a.DE_DOOR6,a.DE_DOOR7,a.DE_DOOR8, ';
        stSql := stSql + ' a.DE_ALARM0,a.DE_ALARM1,a.DE_ALARM2,a.DE_ALARM3,a.DE_ALARM4,a.DE_ALARM5,a.DE_ALARM6,a.DE_ALARM7,a.DE_ALARM8, ';
        stSql := stSql + ' c.DE_TIMECODEUSE,c.TC_GROUP,c.TC_TIME1,c.TC_TIME2,c.TC_TIME3 ,c.TC_TIME4,c.TC_WEEKCODE,c.EM_MASTER,d.WG_TYPE ';
        stSql := stSql + ' from TB_DEVICECARDNO a ';
        stSql := stSql + ' Left Join TB_CARD b ';
        stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
        stSql := stSql + ' Left Join TB_EMPLOYEE c ';
        stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
        stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
        stSql := stSql + ' AND b.EM_CODE = c.EM_CODE ) ';
        stSql := stSql + ' Left Join TB_WORKGUBUN d ';
        stSql := stSql + ' ON(c.GROUP_CODE = d.GROUP_CODE ';
        stSql := stSql + ' AND c.WG_CODE = d.WG_CODE) ';
        stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
        stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
        stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
        stSql := stSql + ' AND a.DE_RCVACK = ''C'' ';  //FTP����
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
          if G_bApplicationTerminate then Exit;
          Try
            nPositionNum := FindField('positionnum').AsInteger;
          Except
            nPositionNum := 0;
          End;
          FileAppend(stFileName,GetCardDownLoadData(FindField('CA_CARDNO').AsString,
                                           FindField('DE_DOOR1').AsString,
                                           FindField('DE_DOOR2').AsString,
                                           FindField('DE_DOOR3').AsString,
                                           FindField('DE_DOOR4').AsString,
                                           FindField('DE_DOOR5').AsString,
                                           FindField('DE_DOOR6').AsString,
                                           FindField('DE_DOOR7').AsString,
                                           FindField('DE_DOOR8').AsString,
                                           FindField('DE_USEACCESS').AsString,
                                           FindField('DE_USEALARM').AsString,
                                           FindField('DE_ALARM0').AsString,
                                           FindField('DE_ALARM1').AsString,
                                           FindField('DE_ALARM2').AsString,
                                           FindField('DE_ALARM3').AsString,
                                           FindField('DE_ALARM4').AsString,
                                           FindField('DE_ALARM5').AsString,
                                           FindField('DE_ALARM6').AsString,
                                           FindField('DE_ALARM7').AsString,
                                           FindField('DE_ALARM8').AsString,
                                           FindField('DE_TIMECODE').AsString,
                                           FindField('EM_retiredate').AsString, //�������
                                           FindField('DE_PERMIT').AsString,
                                           FindField('DE_TIMECODEUSE').AsString,
                                           FindField('TC_GROUP').AsString,
                                           FindField('TC_TIME1').AsString,
                                           FindField('TC_TIME2').AsString,
                                           FindField('TC_TIME3').AsString,
                                           FindField('TC_TIME4').AsString,
                                           FindField('TC_WEEKCODE').AsString,
                                           FindField('EM_MASTER').AsString,
                                           FindField('WG_TYPE').AsString,
                                           FindField('ca_cardtype').AsString,
                                           nPositionNum,
                                           UseCardPosition,
                                           nCardFixType
                                           ));
          dmDBFunction.UpdateTB_DEVICECARDNO_Field_StringValue(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,FindField('CA_CARDNO').AsString,'DE_RCVACK','F');
  {        CardList.Add(GetCardDownLoadData(FindField('CA_CARDNO').AsString,
                                           FindField('DE_DOOR1').AsString,
                                           FindField('DE_DOOR2').AsString,
                                           FindField('DE_USEACCESS').AsString,
                                           FindField('DE_USEALARM').AsString,
                                           FindField('DE_TIMECODE').AsString,
                                           FindField('EM_retiredate').AsString, //�������
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

function TfmMain.GetCardDownLoadData(aCardNo, aDoor1, aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8, aUseAccess,
  aUseAlarm,aAlarm0,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8,
  aTimeCode,aValidDate, func,aTIMECODEUSE,aTCGROUP,aTIME1,aTIME2,aTIME3,aTIME4,aTCWEEKCODE,aMaster,aWorkType,aCardGubun: String;
  aPositionNum:integer = 0;aCardPosition:Boolean = False;aCardFixType:integer=-1): string;
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
  stAlarmAreaGrade : string;
  stDoorAreaGrade : string;
  stCardTimeCode : string;
  stCardWeekCode : string;
begin
  if aCardFixType = -1 then aCardFixType := CARDLENGTHTYPE;

  if aPositionNum <> 0 then
  begin
    stCardPositionNum := FillZeroNumber(aPositionNum,5);
    if aCardPosition then
    begin
      if func = 'L' then func := 'J'; // ����� ��츸 J �� ���� �� ��
    end;
  end else
  begin
    aCardPosition := False; //��ġ������ ���� ��� ������ �Ϲ� �������� ����
    stCardPositionNum := '*****';
  end;
  if aWorkType <> '1' then func:='N';  //���� ���� �ƴϸ�...
  if aCardGubun <> '1' then func:='N';  //��ϵ� ī�尡 �ƴϸ�...

  if aCardFixType = 0 then
  begin
    if CARDLENGTHTYPE = 0 then
    begin
      if IsNumericCardNo then
      begin
        if Not Isdigit(aCardNo) then Exit;
        aCardNo := FillZeroStrNum(Trim(aCardNo),10);
        xCardNo:=  '00'+EncodeCardNo(aCardNo);
      end
      else xCardNo:= '00' + EncodeCardNo(aCardNo,True);
      xCardNo := FillZeroStrNum(Trim(xCardNo),10);
    end else if CARDLENGTHTYPE = 1 then
    begin
      xCardNo:= '00' + EncodeCardNo(copy(aCardNo,1,8),True);
      xCardNo := FillZeroStrNum(Trim(xCardNo),10);
    end else if CARDLENGTHTYPE = 2 then
    begin
      xCardNo:= '00' + EncodeCardNo(copy(aCardNo,1,8),True);
      xCardNo := FillZeroStrNum(Trim(xCardNo),10);
    end;
  end else if aCardFixType = 1 then   //���� ����
  begin
    if CARDLENGTHTYPE = 0 then        //������ ����
    begin
      if IsNumericCardNo then
      begin
        if Not Isdigit(aCardNo) then Exit;
        aCardNo := FillZeroStrNum(Trim(aCardNo),10);
        aCardNo := Dec2Hex64(StrtoInt64(aCardNo),8);
      end;
      xCardNo:=  FillCharString(aCardNo,'*',16);
    end else if CARDLENGTHTYPE = 1 then
    begin
      xCardNo:= aCardNo;
    end else if CARDLENGTHTYPE = 2 then
    begin
      if (aCardNo[9] = '0') and (aCardNo[10] = '*') then aCardNo[9] := '*'; //�ø���ī���̸� �ø��� Ÿ������ ��������.
      xCardNo:= aCardNo;
      xCardNo:=  FillCharString(xCardNo,'*',G_nCardFixedLength);
    end;
    nCardLength := Length(xCardNo);
    xCardNo := FillzeroNumber(nCardLength,2) + xCardNo;
  end else if aCardFixType = 2 then    //���� KT�����
  begin
    if CARDLENGTHTYPE = 0 then        //������ ����
    begin
      if IsNumericCardNo then
      begin
        if Not Isdigit(aCardNo) then Exit;
        aCardNo := FillZeroStrNum(Trim(aCardNo),10);
        aCardNo := Dec2Hex64(StrtoInt64(aCardNo),8);
      end;
      xCardNo:=  FillCharString(aCardNo + '0','*',11);
      xCardNo := Ascii2Hex(xCardNo,False,True);
    end else if CARDLENGTHTYPE = 1 then  //������ ����
    begin
      xCardNo:=  FillCharString(copy(aCardNo,1,8) + '0','*',11);
      xCardNo := Ascii2Hex(xCardNo,False,True);
    end else if CARDLENGTHTYPE = 2 then  //������ KT�����
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

  if (aDoor1 <> 'Y') and (aDoor2 <> 'Y') and (aDoor3 <> 'Y') and (aDoor4 <> 'Y')
     and (aDoor5 <> 'Y') and (aDoor6 <> 'Y') and (aDoor7 <> 'Y') and (aDoor8 <> 'Y') then aUseAccess := 'N'; //1��,2�� ���� ���� ��� ������ ���Ա��� ���°���... 2011.06.09 ����

  if func = 'L' then
  begin
    if aUseAccess = 'Y' then   //���� �㰡
    begin
      if (aUseAlarm = 'Y') or
         (aAlarm0 = 'Y') or
         (aAlarm1 = 'Y') or
         (aAlarm2 = 'Y') or
         (aAlarm3 = 'Y') or
         (aAlarm4 = 'Y') or
         (aAlarm5 = 'Y') or
         (aAlarm6 = 'Y') or
         (aAlarm7 = 'Y') or
         (aAlarm8 = 'Y')
      then aCardType:= '2' //ī��Ÿ�Լ���: 2=> ���� + ���
      else                 aCardType:= '0'; //ī��Ÿ�Լ���: 0=> ����

      if (aDoor1 = 'Y') and (aDoor2 = 'Y') then
      begin
        stRegCode:= '0';
      end else if  aDoor1 = 'Y' then
      begin
        stRegCode:= '1';
      end else if  aDoor2 = 'Y' then
      begin
        stRegCode:= '2';
      end else
      begin
        if (aDoor3 = 'Y') or
           (aDoor4 = 'Y') or
           (aDoor5 = 'Y') or
           (aDoor6 = 'Y') or
           (aDoor7 = 'Y') or
           (aDoor8 = 'Y') then
        begin
           stRegCode:= '3';
           if (aUseAlarm = 'Y') or
             (aAlarm0 = 'Y') or
             (aAlarm1 = 'Y') or
             (aAlarm2 = 'Y') or
             (aAlarm3 = 'Y') or
             (aAlarm4 = 'Y') or
             (aAlarm5 = 'Y') or
             (aAlarm6 = 'Y') or
             (aAlarm7 = 'Y') or
             (aAlarm8 = 'Y')
           then aCardType:= '2' //ī��Ÿ�Լ���: 2=> ���� + ���
           else                 aCardType:= '0'; //ī��Ÿ�Լ���: 0=> ����
        end else
        begin
           if (aUseAlarm = 'Y') or
             (aAlarm0 = 'Y') or
             (aAlarm1 = 'Y') or
             (aAlarm2 = 'Y') or
             (aAlarm3 = 'Y') or
             (aAlarm4 = 'Y') or
             (aAlarm5 = 'Y') or
             (aAlarm6 = 'Y') or
             (aAlarm7 = 'Y') or
             (aAlarm8 = 'Y')
          then aCardType:= '1' //ī��Ÿ�Լ���: 1=> ��� ����
          else
          begin
            stRegCode:= '0';
            func:= 'N';
          end;
        end;
      end;
    end else if (aUseAlarm = 'Y') or
             (aAlarm0 = 'Y') or
             (aAlarm1 = 'Y') or
             (aAlarm2 = 'Y') or
             (aAlarm3 = 'Y') or
             (aAlarm4 = 'Y') or
             (aAlarm5 = 'Y') or
             (aAlarm6 = 'Y') or
             (aAlarm7 = 'Y') or
             (aAlarm8 = 'Y')
    then  // ���� X ,����� OK
    begin
      //aRegCode:= '3';
      stRegCode:= '0';
      aCardType:= '1';
    end else
    begin
      aCardType:= '0';
      stRegCode:= '0';
      func:= 'N';
    end;
  end
  else
  begin
      aCardType:= '0';
      stRegCode:= '0';
      func:= 'N';
  end;

  stAlarmAreaGrade := CommonModule.GetAlarmAreaGrade(aUseAlarm,aAlarm0,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8,aMaster);
  stDoorAreaGrade := CommonModule.GetDoorAreaGrade(aUseAccess,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8);
  if Not isDigit(aTCGROUP) then aTCGROUP := '0'
  else aTCGROUP := aTCGROUP[1];
  stCardTimeCode := '0000';
  if aTIME1 = 'Y' then stCardTimeCode[4] := '1';
  if aTIME2 = 'Y' then stCardTimeCode[3] := '1';
  if aTIME3 = 'Y' then stCardTimeCode[2] := '1';
  if aTIME4 = 'Y' then stCardTimeCode[1] := '1';
  stCardTimeCode := BinaryToHex(stCardTimeCode);
  if Length(aTCWEEKCODE) = 7 then
  begin
    if aTIMECODEUSE = 'Y' then
     stCardWeekCode := '1' + aTCWEEKCODE
    else stCardWeekCode := '0' + aTCWEEKCODE;
  end else stCardWeekCode := '00000000';
  stCardWeekCode := BinaryToHex(stCardWeekCode);

  if func = 'D' then func := 'N';  //��ȿ�Ⱓ ���� �ΰ��

  aData:= func +
          '0'+
          stRegCode[1]+                  //����ڵ�(0:1,2   1:1����,  2:2����, 3:�������)
          '  '+                     //RecordCount #$20 #$20
          '0'+                      //����
          xCardNo+                  //ī���ȣ
          aValidDate+                 //��ȿ�Ⱓ
          '0'+                      //��� ���
          aCardType+                 //ī�����(0:��������,1:�������,2:���+����)
          aTimeCode +                //Ÿ������
          stCardPositionNum +                       //ī�� id ��ȣ
          stAlarmAreaGrade +                 //�����������
          stDoorAreaGrade +                  //���Թ� ����
          aTCGROUP +
          stCardTimeCode +
          stCardWeekCode;

(*


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
    if aUseAlarm = 'Y' then stCardAuth:= '2' //ī��Ÿ�Լ���: 2=> ���� + ���
    else
    begin
      stCardAuth:= '0'; //ī��Ÿ�Լ���: 0=> ����
      if stRegCode = '3' then func := 'N';  //������� ī���ε� ��������ϸ� ����
    end;
  end else
  begin
    if aUseAlarm = 'Y' then stCardAuth := '1'
    else func := 'N';  //ī�� ����
  end;

  aData:= '';
  aData:= func +
          '0' +
          stRegCode +                  //����ڵ�(0:1,2   1:1����,  2:2����, 3:�������)
          '  ' +                     //RecordCount #$20 #$20
          '0' +                      //����
          xCardNo +                  //ī���ȣ
          aValidDate +                 //��ȿ�Ⱓ
          '0' +                      //��� ���
          stCardAuth +                 //ī�����(0:��������,1:�������,2:���+����)
          aTimeCode;                //Ÿ������

    if aCardPosition then
    begin
      if func = 'J' then aData := aData + stCardPositionNum; // ����� ��� ��ġ ���� �߰�
    end;
*)
  //üũ��
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

function TfmMain.CheckTB_FTPLIST(aNodeNo, aEcuID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'select AC_NODENO,AC_ECUID from TB_FTPLIST ';
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

function TfmMain.InsertTB_FTPLIST(aNodeNo, aEcuID,aFileName,
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

function TfmMain.UpdateTB_FTPLIST_FileName(aNodeNo, aEcuID,aFileName,
  aSendStatus: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FTPLIST set ';
  stSql := stSql + ' FL_FILENAME = ''' + aFileName + ''',';
  stSql := stSql + ' FL_SENDSTATE = ''' + aSendStatus + ''', ';
  stSql := stSql + ' FL_RETRYCOUNT = 0 ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMain.FTPSendTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if Not L_bDaemonStart then Exit;
  FTPSendTimer.Interval := 10000;
  if L_bFTPSendProcess then Exit;   //FTP Sending
  FTPSendTimer.Enabled := False;
  StatusBar1.Panels[2].Text := 'FTPSendTimer';
  Application.ProcessMessages;
  L_bFTPSendProcess := True;
  if Not FTP_DownLoadListCheck then  //�ٿ�ε� ����Ʈ�� ������ �ߴ��ϰ� ���� ����.
  begin
    //FTPSendTimer.Enabled := True;
    L_bFTPSendProcess := False;
    Exit;
  end;


  if Not FTP_DownLoadStart then
  begin
    L_bFTPSendProcess := False; //���� ���� ������ ������
  end;
  Try
    FTPSendTimer.Enabled := True;
  Except
  End;
//
end;

function TfmMain.FTP_DownLoadListCheck: Boolean;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try
    stSql := 'Select a.FL_RETRYCOUNT,a.AC_NODENO,a.AC_ECUID,b.AC_DEVICECODE from TB_FTPLIST a';
    stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
    stSql := stSql + ' ON(a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID) ';
    stsql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stsql := stSql + ' AND a.FL_SENDSTATE = ''N'' ';
    if ConnectDeviceList.Count > 0 then
    begin
      stSql := stSql + ' AND (';
      for i:=0 to ConnectDeviceList.Count - 1 do
      begin
        if i <> 0 then stSql := stSql + ' OR ';
        stSql := stSql + '(a.AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
        stSql := stSql + ' AND a.AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''')';
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
        while Not Eof do
        begin
          if G_bApplicationTerminate then Exit;
          if (Trim(FindField('AC_DEVICECODE').AsString) <> 'ACC-104') and (Trim(FindField('AC_DEVICECODE').AsString) <> 'MCU-110') and (Trim(FindField('AC_DEVICECODE').AsString) <> 'ECU-110') then
          begin
            updateTB_FTPLIST_Cancel(inttostr(FindField('AC_NODENO').AsInteger),
                                FindField('AC_ECUID').AsString);
            dmDBFunction.UpdateTB_DEVICECARDNO_CardNoState(inttostr(FindField('AC_NODENO').AsInteger),FindField('AC_ECUID').AsString,'','Y','N'); //�۽ŵ����� �۽������� ó��

          end else
          begin
            if FindField('FL_RETRYCOUNT').AsInteger > FTPRETRYCOUNT then
            begin
              updateTB_FTPLIST_Cancel(inttostr(FindField('AC_NODENO').AsInteger),
                                  FindField('AC_ECUID').AsString);

            end else result := true;
          end;
          Next;
        end;

      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   'FTP_DownLoadListCheck','Error');
  End;
end;

Function TfmMain.FTP_DownLoadStart :Boolean;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  Try
    stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.FL_FILENAME,b.AC_DEVICECODE from TB_FTPLIST a ';
    stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
    stSql := stSql + ' ON(a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID) ';
    stsql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stsql := stSql + ' AND a.FL_SENDSTATE = ''N'' ';
    if ConnectDeviceList.Count > 0 then
    begin
      stSql := stSql + ' AND (';
      for i:=0 to ConnectDeviceList.Count - 1 do
      begin
        if i <> 0 then stSql := stSql + ' OR ';
        stSql := stSql + '(a.AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
        stSql := stSql + ' AND a.AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''')';
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
          if G_nFTPUse = 0 then  //FTP ���� ��� ���̸�...
          begin
            if (FindField('AC_DEVICECODE').AsString = 'ACC-104') or (FindField('AC_DEVICECODE').AsString = 'MCU-110') or (FindField('AC_DEVICECODE').AsString = 'ECU-110') then
            begin
              result := FTP_DevicePushStart(FindField('AC_NODENO').Asinteger,FindField('AC_ECUID').AsString,FindField('FL_FILENAME').AsString);
              if result then Exit; //��� ���������� ���� �Ϸ���� ���
            end else
            begin
              dmDBFunction.UpdateTB_DEVICECARDNO_Field_StringValue(inttostr(FindField('AC_NODENO').Asinteger),FindField('AC_ECUID').AsString,'','DE_RCVACK','N');
              UpdateTB_FTPLIST_State(inttostr(FindField('AC_NODENO').Asinteger),FindField('AC_ECUID').AsString,'Y');
            end;
          end else if G_nFTPUse = 1 then   //FTP �̻���̸�
          begin
            dmDBFunction.UpdateTB_DEVICECARDNO_Field_StringValue(inttostr(FindField('AC_NODENO').Asinteger),FindField('AC_ECUID').AsString,'','DE_RCVACK','N');
            UpdateTB_FTPLIST_State(inttostr(FindField('AC_NODENO').Asinteger),FindField('AC_ECUID').AsString,'Y');
          end;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   'FTP_DownLoadStart','Error');
  end;
end;

Function TfmMain.FTP_DevicePushStart(aNodeNo: integer; aEcuID,aFileName: string):Boolean;
var
  stData : string;
  stPath : string;
  clFileInfo : TFileInfo;
  aDevice:    TDevice;
begin
  result := False;
  if Not FTP_CardDataCreate(inttostr(aNodeNo),aEcuID) then Exit;

  updateTB_FTPLIST_RetryCountAdd(inttostr(aNodeNo),aEcuID); //�õ� Ƚ�� ����
  stPath := ExtractFileDir(Application.ExeName) + '\data';
  if Not FileExists(stPath + '\' + aFileName) then Exit;
  clFileInfo := TFileInfo.Create(stPath + '\' + aFileName);
  stData := 'fp02';       //CardData(All Clear)
  stData := stData + '1'; //����͸� ����(1: ����͸�,0:����)
  stData := stData + '1'; //������ ������ ���� ����

  stData := stData + 'pc' + ' ' + L_stDaemonServerIP;
  stData := stData + ' ' + L_stFTPServerPort;
  stData := stData + ' zeron' ;
  stData := stData + ' zeronpass';
  stData := stData + ' ' + aFileName;
  stData := stData + ' ' + inttostr(clFileInfo.FileSize);
  clFileInfo.Free;

  aDevice:= GetDevice(FillZeroNumber(aNodeNo,3) + aECUID );
  if aDevice = nil then Exit;
  aDevice.SendPacket('R','fp00'); //ftp stop
  delay(100);
  aDevice.SendPacket('R',stData);

  L_bFtpSendCheck := True;  //���ۻ��� üũ ����
  FTPSendProcessChckTimer.Enabled := True;
  result := True;
end;

function TfmMain.FTP_CardDataSendSuccess(aNodeNo: integer;
  aEcuID: string): Boolean;
begin
  UpdateTB_FTPLIST_State(inttostr(aNodeNo),aEcuID,'Y');
  dmDBFunction.UpdateTB_DEVICECARDNO_CardNoState(inttostr(aNodeNo),aEcuID,'','F','Y');
  L_bFTPSendProcess := False; //���� �Ϸ�
  FTPSendProcessChckTimer.Enabled := False;
end;


function TfmMain.UpdateTB_FTPLIST_State(aNodeNo, aEcuID,
  aState: string): Boolean;
var
  stsql : string;
begin
  stSql := ' Update TB_FTPLIST set FL_SENDSTATE = ''' + aState + ''', ';
  stSql := stSql + ' FL_RETRYCOUNT = 0 ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO  = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.FTP_UseDevice(aNodeNo, aEcuID: string): Boolean;
begin
  result := True; //�켱�� True;
end;

procedure TfmMain.FTPSendProcessChckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  FTPSendProcessChckTimer.Interval := 50000;
  //FTP ���� ���� �� 10�ʰ� �Ѿ��µ��� ������ ������ FTP�� �ٽ� ���� �Ѵ�.
  StatusBar1.Panels[2].Text := 'FTPSendProcessChckTimer';
  if L_bFtpSendCheck then //bFtpSendCheck �� # ������ ���� �� ������ ���� �Ѵ�.
  begin
    L_bFtpSendCheck := False;
    Exit;
  end;

  Application.ProcessMessages;
  Try
    FTPSendProcessChckTimer.Enabled := False;
  Except
  End;
  //FTPSendProcessChckTimer.Interval := 1000;
  L_bFTPSendProcess := False;
end;

procedure TfmMain.DeviceRcvFTPProcessData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
var
  stPer : string;
  nIndex : integer;
  stTemp : string;
  stEcuID : string;
  stClientSendData : string;
begin
  //FTP ���� ���� �����Ͱ� ���� ��...
  L_bFtpSendCheck := True;

  stEcuID := copy(ReceiveData,15,2);

  stTemp := ReceiveData;

  nIndex := Pos('(',stTemp);
  delete(stTemp,1,nIndex);
  nIndex := Pos(')',stTemp);
  stPer := copy(stTemp,1,nIndex -1);
  if isDigit(stPer) then
  begin
    UpdateTB_FTPLIST_Per(inttostr(NodeNo),stEcuID,stPer);
    stClientSendData:= 'R' +
           'E' + //ECU
           FillZeroNumber(NodeNO,3) +
           stECUID +
           '00' + //DOORNO
           '00' + //READERNO
           'DV' + //���
           'F' + // FTP������
           FillZeroNumber(Length(stPer),3) +
           stPer;
      //���⿡�� ���ӵǾ� �ִ� Ŭ���̾�Ʈ�� ������ �۽�
    SendClientData(stClientSendData);
    SendSettingData(stClientSendData);
  end;
end;

procedure TfmMain.FTP1Click(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stNodeNo,stEcuID:string;
begin
  stSql := 'Select AC_NODENO,AC_ECUID from TB_ACCESSDEVICE ';

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
        //���⿡�� FTP �ٿ�ε� ���� ������� üũ �Ͽ�
        if FTP_UseDevice(stNodeNo,stEcuID) then
        begin
          if CheckTB_FTPLIST(stNodeNo,stEcuID) then
          begin
            UpdateTB_FTPLIST_FileName(stNodeNo,stEcuID,FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + stEcuID,'N');
          end else
          begin
            InsertTB_FTPLIST(stNodeNo,stEcuID,FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + stEcuID,'N');
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


procedure TfmMain.N35Click(Sender: TObject);
begin
  fmReaderSetting:= TfmReaderSetting.Create(Self);
  L_bShowReaderSetting := True;
  fmReaderSetting.Showmodal;
  L_bShowReaderSetting := False;
  fmReaderSetting.Free;

end;

function TfmMain.PubCardTypeSearch(aNodeNo, aEcuID: string): Boolean;
var
  stDeviceID : string;
  aDevice: TDevice;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  aDevice:= GetDevice(stDeviceID);
  if aDevice = nil then Exit;
  aDevice.CardTypeSearch;
  result := True;
end;

procedure TfmMain.PersonRelayTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
//  PersonRelayTimer.Interval := 6000000;
  Try
    PersonRelayTimer.Enabled := False;
    if PersonRelayType = 2 then //���ʻ�� ���̺� ����
    begin
      //Delay(1000);
      if Not dmPersonRelay.RelayAdoConnect(G_stRelayDBType,
             G_stRelayDBServerIP,G_stRelayDBServerPort,G_stRelayDBServerName,
             G_stRelayDBServerUserID,G_stRelayDBServerUserPW)
             then Exit;
      StatusBar1.Panels[2].Text := 'PersonRelayTimer';
      Application.ProcessMessages;
      //LogSave(ExeFolder + '\..\log\Relay'+FormatDateTime('yyyymmdd',Now) + '.log','Relay Start');

      dmPersonRelay.UpdateTB_EMPHISSendReady;
      if dmPersonRelay.KT_ALLEHCAMPUSRelay then
      begin
        //���� �����Ͱ� �ִ� ��츸 ȸ���ڵ� �� �����ڵ� ��������
        dmPersonRelay.KTTB_COMPANYRelay;
        dmPersonRelay.KTTB_POSIRelay;
        LogSave(ExeFolder + '\..\log\Relay'+FormatDateTime('yyyymmdd',Now) + '.log','Relay End');
      end;
      {
      dmPersonRelay.UpdateTB_EMPHISSendReady;
      dmPersonRelay.KTTB_CARD_Relay;
      if dmPersonRelay.KTTB_EmployeeRelay then
      begin
        //���� �����Ͱ� �ִ� ��츸 ȸ���ڵ� �� �����ڵ� ��������
        dmPersonRelay.KTTB_COMPANYRelay;
        dmPersonRelay.KTTB_POSIRelay;
        LogSave(ExeFolder + '\..\log\Relay'+FormatDateTime('yyyymmdd',Now) + '.log','Relay End');
      end; }
    end else if SendPersonRelayType = 1 then //STX �ļ� ���� ����
    begin
      if Not dmPersonRelay.RelayAdoConnect(G_stRelayDBType2,
             G_stRelayDBServerIP2,G_stRelayDBServerPort2,G_stRelayDBServerName2,
             G_stRelayDBServerUserID2,G_stRelayDBServerUserPW2) then Exit;
      StatusBar1.Panels[2].Text := 'PersonRelayTimer';
      Application.ProcessMessages;
      dmPersonRelay.UpdateTB_EMPHISSend2Ready;
      if dmPersonRelay.STXFoodTB_EmployeeRelay then
      begin
        LogSave(ExeFolder + '\..\log\Relay'+FormatDateTime('yyyymmdd',Now) + '.log','Relay End');
      end;
    end;
  Finally
    PersonRelayTimer.Enabled := True;
  End;

  Try
    dmPersonRelay.RelayAdoDisConnect;
  Except
  End;
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
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := 'AdoConnectCheckTimer';
  AdoConnectCheckTimer.Enabled := False;
  if Not TDataBaseConfig.GetObject.DBConnected then Exit;
  //Application.ProcessMessages;
  //if AdoConnectCheck then Exit;


  if G_bApplicationTerminate then Exit;
  Visible := True;
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
  if G_bApplicationTerminate then Exit;
  DaemonRestartTimer.Enabled := False;
  Action_DaemonRestartExecute(self);

end;

procedure TfmMain.FireDoorOpenTimerTimer(Sender: TObject);
var
  stDeviceID : string;
  i : integer;
  stFireGroupCode : string;
begin
  if G_bApplicationTerminate then Exit;
  FireDoorOpenTimer.Enabled := False;
  StatusBar1.Panels[2].Text := 'FireDoorOpenTimer';
  for i := FireBreakGubunList.Count - 1 downto 0 do
  begin
    stFireGroupCode := FireBreakGubunList.Strings[i];
    FireBreakGubunList.Delete(i);
    Send_FireGroup(stFireGroupCode);
  end;
  Exit;

  for i:= 0 to DeviceList.Count - 1 do
  begin
    if TDevice(DeviceList.Objects[I]) = nil then continue;
    if TDevice(DeviceList.Objects[I]).ECUID <> '00' then continue;  //������Ʈ�Ѹ� ����
    TDevice(DeviceList.Objects[I]).FireOutbreak(True);
  end;

end;

procedure TfmMain.EST1Click(Sender: TObject);
begin
  L_bFierDoorOpen := True;
  Control_DoorAllOpenMode;

end;

procedure TfmMain.DoorAllOpenTimerTimer(Sender: TObject);
begin
  //DoorAllOpenTimer.Enabled := False;
  if Not L_bFierDoorOpen then
  begin
    L_bFierDoorOpen := True;
    Control_DoorAllOpenMode;
  end;
end;

procedure TfmMain.DataModuleAdoConnected(Sender: TObject;
  DBConnected: Boolean);
begin
  if Not DBConnected then
  begin
    AdoConnectCheckTimer.Enabled := True;
  end;
end;

procedure TfmMain.Control_DeviceFireRecovery(aDeviceID: string);
var
  NodeStr : string;
  NodeIndex : integer;
  stClientSendData : string;
  i,j : integer;
begin
  // �泲�� �۾� �� ����͸����� �˶� Ȯ�� �� ��ü ����͸��� �˶� Ȯ�� ó�� �ѷ� �ֱ� ���� ��ƾ
  if Not IsDigit(aDeviceID) then Exit;
  L_bFierDoorOpen := False;
  
  NodeStr:= 'NODE'+InttoStr(strtoint(aDeviceID));
  NodeIndex:= ComNodeList.IndexOf(NodeStr);
  if NodeIndex < 0 then Exit;
  TCommnode(ComNodeList.Objects[NodeIndex]).FireRecovery;
  if G_bFireRelayUse then
  begin
    TCommnode(ComNodeList.Objects[NodeIndex]).AllRelayControl(G_nFireRelayNumber,G_nFireRelayTime);
  end;

  for i:=0 to DeviceList.Count - 1 do
  begin
    if TDevice(DeviceList.Objects[I]).NodeNo = strtoint(aDeviceID) then
    begin
      for j := 1 to con_nFIXMAXDOORNO do
      begin
        TDevice(DeviceList.Objects[I]).SetDoorFire(j,False);
      end;
      //TDevice(DeviceList.Objects[I]).Door1Fire := False;
      //TDevice(DeviceList.Objects[I]).Door2Fire := False;
    end;
  end;

  dmDBFunction.UpdateTB_CURRENTDAEMON_Field_StringValue('FIREORIGIN','CU_STATEVALUE','FALSE');

  stClientSendData := 'R' +
                        'S' +
                        '000' +
                        '00' +
                        '00' +
                        '00' +
                        'SV' +
                        'R' +
                        FillZeroNumber(Length('FIRERECOVERY'),3) +
                        'FIRERECOVERY';
  SendClientData(stClientSendData);

end;


procedure TfmMain.HolidaySendTimerTimer(Sender: TObject);
var
  stNowYear : string;
begin
  if G_bApplicationTerminate then Exit;
  if Not L_bDaemonStart then Exit;
  if G_nScheduleDevice = 1 then
  begin
    HolidaySendTimer.Enabled := False;
    Exit;   //PC ������ �����̸� ������ �ʿ䰡 ����.
  end;
  Try
    HolidaySendTimer.Enabled := False;
    stNowYear := formatDateTime('yyyy',now);

    //Check_HolidayClear(stNowYear);


    if (L_stSendHolidayYear <> stNowYear) then
    begin
      dmDBFunction.UpdateTB_ACCESSDEVICE_HOSEND('','','','N');
      L_stSendHolidayYear := stNowYear;
    //  DeviceHolidayClear; //Ư���� ���� ����
    end;

    //if Not Check_HolidayDevice then Exit;
    Check_HolidayDevice;
    
    if HolidaySendDeviceList.Count > 0 then
    begin
      Send_DeviceHoliday(stNowYear);
      dmDBFunction.UpdateTB_CURRENTDAEMON_Field_StringValue('SEND_HOYY','CU_STATEVALUE',stNowYear);
    end;
  Finally
    if Not G_bApplicationTerminate then HolidaySendTimer.Enabled := True;
  End;
end;

function TfmMain.Check_HolidayDevice: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  i,j :integer;
  nTempIndex : integer;
begin
  result := False;
  Try
//    HolidaySendDeviceList.Clear;

    stSql := ' Select a.AC_NODENO,a.AC_ECUID from TB_ACCESSDEVICE a ';
//    stSql := stSql + ' Inner Join (select AC_NODENO,AC_ECUID from TB_DOOR where DO_SCHUSE = ''1'' group by AC_NODENO,AC_ECUID) b ';
//    stSql := stSql + ' ON(a.AC_NODENO = b.AC_NODENO ';
//    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.HO_SEND = ''N'' ';
//    stSql := stSql + ' AND (a.AC_DEVICECODE = ''ACC-104'' or a.AC_DEVICECODE = ''ACC-510'' or a.AC_DEVICECODE = ''MCU-110'') ';
(*    if ConnectDeviceList.Count > 0 then
    begin
      stSql := stSql + ' and ( ';
      for i := 0 to ConnectDeviceList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if i <> 0 then stSql := stSql + ' OR ';
        stSql := stSql + '( a.AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
        stSql := stSql + ' AND a.AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''' ) ';
      end;
      stSql := stSql + ' ) ';
    end else
    begin
      Exit;
    end;
*)
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
          nTempIndex := HolidaySendDeviceList.IndexOf(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString);
          if nTempIndex < 0 then HolidaySendDeviceList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString);
          nTempIndex := DeviceList.IndexOf(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString);
          if nTempIndex > -1 then
          begin
            for i := 1 to 12 do
            begin
              for j := 1 to 8 do TDevice(DeviceList.Objects[nTempIndex]).HolidaySendRecv[i][j]:=-1; //�ٽ� ���� �� �� �ְ� Ǯ��.
            end;
            L_bHolidayChange := True; //Ư���� ����Ǿ���.
          end;
          //���⿡�� HO_SEND = 'R'�� ��������.
          dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'HO_SEND','R');
          Application.ProcessMessages;
          Next;
        end;
      End;

    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   'Check_HolidayDevice','Error');
  End;
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
   if DataBaseAllBackup(filename) then showmessage('������ ��� �Ϸ�')
   else showmessage('������ ��� ����');
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
      // REGISTRY KEY ����
         regKey.Free;
      Exit;
    end;
    regKey.OpenKey ('\Software\PostgreSQL\Installations\postgresql-8.3',False);
    stKey := regKey.ReadString('Base Directory');
    if stKey = '' then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY ����
         regKey.Free;
      Exit;
    end;
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY ����
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY ����
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
        MSSQLTableLayoutCreate(aBackupDir,UpperCase(FindField('tablename').AsString));
        TableFileBackup(aBackupDir,UpperCase(FindField('tablename').AsString));
        Delay(1000);
        if G_bApplicationTerminate then Exit;
        Next;
      end;
    end;
  Finally
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
        PGTableLayoutCreate(aBackupDir,UpperCase(FindField('tablename').AsString));
        TableFileBackup(aBackupDir,UpperCase(FindField('tablename').AsString));
        Delay(1000);
        if G_bApplicationTerminate then Exit;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.Check_DEVICEALARMSTATE(aDeviceID: string);
var
  stNodeNo,stECUID,stArmAreaNo : string;
  i : integer;
  aDevice: TDevice;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);
  stArmAreaNo := copy(aDeviceID,6,1);
  if Not isDigit(stArmAreaNo) then stArmAreaNo := '0';

    if (stNodeNo = '') or (stNodeNo = '000') then //��ü������ȸ
    begin
      Try
        FStateCheckTCS.Enter;
        if StateCheckList.IndexOf('ALARMSTATE') < 0 then
            StateCheckList.Add('ALARMSTATE');
      Finally
        FStateCheckTCS.Leave;
      End;

      Exit;
    end;
    aDevice:= GetDevice(stNodeNo + stECUID );
    if aDevice <> nil then
    begin
      //if aDevice.CommNode.SocketConnected = True then aDevice.CheckWatchMode;
      DeviceWatchModeChange(self,
                            aDevice.NodeNo,
                            aDevice.ECUID,
                            stArmAreaNo,
                            aDevice.GetArmAreaState(strtoint(stArmAreaNo)));
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

  for i := 0 to ComNodeList.Count - 1 do
  begin
    if TCommNode(ComNodeList.Objects[i]).SocketConnected then
    begin
      if TCommNode(ComNodeList.Objects[i]).FDtype <> dtFd then
        TCommNode(ComNodeList.Objects[i]).SendPacket('00','R',stSendData,aQuick);
    end;
    Application.ProcessMessages;
  end;

end;

procedure TfmMain.Check_DeviceSkill(aDeviceID: string);
var
  stNodeNo,stECUID : string;
  i : integer;
  aDevice: TDevice;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);

  if (stNodeNo = '') or (stNodeNo = '000') then //��ü������ȸ
  begin
    for i := 0 to DeviceList.Count -1 do
    begin
      if G_bApplicationTerminate then Exit;
      aDevice:= GetDevice(DeviceList.Strings[i] );
      if aDevice <> nil then
      begin
        if aDevice.CommNode.SocketConnected = True then
        begin
          //if aDevice.Door1Use or aDevice.Door2Use then aDevice.CheckSystemSkill;
          if aDevice.DeviceSkillReceive then aDevice.CheckSystemSkill;
        end;
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
    if aDevice.CommNode.SocketConnected = True then
    begin
      //if aDevice.Door1Use or aDevice.Door2Use then  aDevice.CheckSystemSkill;
      if aDevice.DeviceSkillReceive then aDevice.CheckSystemSkill;
    end;
  end;

end;

function TfmMain.Check_JavaraClose(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stDeviceID : string;
  aDevice: TDevice;
begin
  result := False;
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  aDevice:= GetDevice(stDeviceID);
  if aDevice = nil then Exit;
  result := aDevice.JavaraCloseCommand;

end;

function TfmMain.Check_JavaraOpen(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stDeviceID : string;
  aDevice: TDevice;
begin
  result := False;
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  aDevice:= GetDevice(stDeviceID);
  if aDevice = nil then Exit;
  result := aDevice.JavaraOpenCommand;

end;

procedure TfmMain.Check_DeviceVersion(aDeviceID: string);
var
  stNodeNo,stECUID : string;
  i : integer;
  aDevice: TDevice;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);

  if (stNodeNo = '') or (stNodeNo = '000') then //��ü������ȸ
  begin
    for i := 0 to DeviceList.Count -1 do
    begin
      if G_bApplicationTerminate then Exit;
      aDevice:= GetDevice(DeviceList.Strings[i] );
      if aDevice <> nil then
      begin
        if aDevice.CommNode.SocketConnected = True then aDevice.Check_DeviceVersion;
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
    if aDevice.CommNode.SocketConnected = True then aDevice.Check_DeviceVersion;
  end;

end;

function TfmMain.UpdateTB_FTPLIST_Per(aNodeNo, aEcuID, aPer: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FTPLIST set ';
  stSql := stSql + ' FL_SENDPROGRASS = ''' + aPer + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMain.LogDirectoryDeleteTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  Try
    LogDirectoryDeleteTimer.Enabled := False;
    if G_bApplicationTerminate then Exit;

    L_stLogDirectory := ExtractFileDir(Application.ExeName) + '\..\log';

    // Sets FileFile properties
    FindFile.Threaded := True;
    // - Name & Location
    with FindFile.Criteria.Files do
    begin
      FileName := '*.*';
      Location := L_stLogDirectory;
      Subfolders := False;
    end;
    // - Containing Text
    with FindFile.Criteria.Content do
    begin
      Phrase := '';
      Options := [];
      if Self.CaseSenstitive.Checked then
        Options := Options + [csoCaseSensitive];
      if Self.WholeWord.Checked then
        Options := Options + [csoWholeWord];
    end;
    // - Attributes
    with FindFile.Criteria.Attributes do
    begin
      Archive := GetAttributeStatus(Self.Archive);
      Readonly := GetAttributeStatus(Self.Readonly);
      Hidden := GetAttributeStatus(Self.Hidden);
      System := GetAttributeStatus(Self.System);
      Directory := GetAttributeStatus(Self.Directory);
      Compressed := GetAttributeStatus(Self.Compressed);
      Encrypted := GetAttributeStatus(Self.Encrypted);
      Offline := GetAttributeStatus(Self.Offline);
      ReparsePoint := GetAttributeStatus(Self.ReparsePoint);
      SparseFile := GetAttributeStatus(Self.SparseFile);
      Temporary := GetAttributeStatus(Self.Temporary);
      Device := GetAttributeStatus(Self.Device);
      Normal := GetAttributeStatus(Self.Normal);
      Virtual := GetAttributeStatus(Self.Virtual);
      NotContentIndexed := GetAttributeStatus(Self.NotContentIndexed);
    end;
    // - Size ranges
    with FindFile.Criteria.Size do
    begin
      Min := Self.SizeMin.Position;
      case Self.SizeMinUnit.ItemIndex of
        1: Min := Min * 1024;
        2: Min := Min * 1024 * 1024;
        3: Min := Min * 1024 * 1024 * 1024;
      end;
      Max := Self.SizeMax.Position;
      case Self.SizeMaxUnit.ItemIndex of
        1: Max := Max * 1024;
        2: Max := Max * 1024 * 1024;
        3: Max := Max * 1024 * 1024 * 1024;
      end;
    end;
    // - TimeStamp ranges
    with FindFile.Criteria.TimeStamp do
    begin
      Clear;
      // Created on
      if Self.CBD.Checked then
        CreatedBefore := Self.CreatedBeforeDate.Date;
      if Self.CBT.Checked then
        CreatedBefore := CreatedBefore + Self.CreatedBeforeTime.Time;
      if Self.CAD.Checked then
        CreatedAfter := Self.CreatedAfterDate.Date;
      if Self.CAT.Checked then
        CreatedAfter := CreatedAfter + Self.CreatedAfterTime.Time;
      // Modified on
      if Self.MBD.Checked then
        ModifiedBefore := Self.ModifiedBeforeDate.Date;
      if Self.MBT.Checked then
        ModifiedBefore := ModifiedBefore + Self.ModifiedBeforeTime.Time;
      if Self.MAD.Checked then
        ModifiedAfter := Self.ModifiedAfterDate.Date;
      if Self.MAT.Checked then
        ModifiedAfter := ModifiedAfter + Self.ModifiedAfterTime.Time;
      // Accessed on
      if Self.ABD.Checked then
        AccessedBefore := Self.AccessedBeforeDate.Date;
      if Self.ABT.Checked then
        AccessedBefore := AccessedBefore + Self.AccessedBeforeTime.Time;
      if Self.AAD.Checked then
        AccessedAfter := Self.AccessedAfterDate.Date;
      if Self.AAT.Checked then
        AccessedAfter := AccessedAfter + Self.AccessedAfterTime.Time;
    end;
    // Begins search
    FindFile.Execute;
  Finally
    LogDirectoryDeleteTimer.Interval := 24 * 60 * 60 * 1000;
    if Not G_bApplicationTerminate then LogDirectoryDeleteTimer.Enabled := True;
  End;
end;

procedure TfmMain.FindFileFolderChange(Sender: TObject;
  const Folder: String; var IgnoreFolder: TFolderIgnore);
begin
  if not FindFile.Threaded then
    Application.ProcessMessages;

end;

procedure TfmMain.FindFileFileMatch(Sender: TObject;
  const FileInfo: TFileDetails);
var
  stFileName,stFullName,stFileSize:string;
  stCreateTime,stModifiedTime,stAccessedTime,stCreateDate:string;
  stAttribute : string;
begin
{  stFileName := FileInfo.Name;
  stFullName := FileInfo.Location;
  stFileSize := inttostr(FileInfo.Size);
  stCreateTime := formatDateTime('yyyymmddHHMMSS',FileInfo.CreatedTime);
  stModifiedTime := formatDateTime('yyyymmddHHMMSS',FileInfo.ModifiedTime);
  stAccessedTime := formatDateTime('yyyymmddHHMMSS',FileInfo.AccessedTime);
  stCreateDate := formatDateTime('yyyymmdd',FileInfo.ModifiedTime);
  stExifDate := '';
  stAttribute := ExtractFileExt( stFileName );
}
  if FileInfo.ModifiedTime < (now - 10) then
     DeleteFile(L_stLogDirectory + '\' + FileInfo.name);
end;

function TfmMain.updateTB_FTPLIST_RetryCountAdd(aNodeNo, aEcuID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_FTPLIST set FL_RETRYCOUNT = FL_RETRYCOUNT + 1 ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNO + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Send_UseDoorSchedule: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  bResult : Boolean;
  i : integer;
  aDevice: TDevice;
  stMode : string;
  stControlTime : string;
  stOpenMoni : string;
  stSchUse : string;
  stSendDoor : string;
  stAlarmLong : string;
  stFire : string;
  stDoorType : string;
  stDSOpen : string;
  stRemoteDoor : string;
  nLockType : integer;
begin
  result := True;
  Try
    stSql := 'select AC_NODENO,AC_ECUID,DO_DOORNO,DO_DOORNONAME,DO_LASTMODE,DO_VIEWSEQ,DO_TOTWIDTH,DO_TOTHEIGHT,';
    stSql := stSql + ' DO_CURX,DO_CURY,DO_LOCATEUSE,LO_DONGCODE,LO_FLOORCODE,LO_AREACODE,FPMS_ID,DO_LOCALRELAY,';
    stSql := stSql + ' DO_STATEREVERSE,Relay_Send,DO_DOORTYPE,DO_SCHUSE,DO_CONTROLTIME,DO_CARDREADERTYPE,DO_MODE,';
    stSql := stSql + ' DO_FIRE,DO_LASTSTATE,DO_LASTPOSI,SEND_ACK,FDMS_ID,FDMS_RELAY,DO_GUBUN,DO_UPDATE,DO_OPENMONI,';
    stSql := stSql + ' DO_SENDDOOR,DO_ALARMLONG,DO_DSOPEN,DO_REMOTEDOOR,REG_SEND,DO_TIMECODEUSE';
    stSql := stSql + ' from TB_DOOR ';
    stSql := stSql + ' where (SEND_ACK = ''N''  ';
    stSql := stSql + ' or SEND_ACK = ''R''  ';
    stSql := stSql + ' or SEND_ACK = ''S'')  ';
    stSql := stSql + ' AND (DO_SchIgnore is null or DO_SchIgnore <> ''Y'') ';    //������ �����ϴ� ��쿡�� �����ϸ� �ȵȴ�.
    if ConnectDeviceList.Count > 0 then
    begin
      stSql := stSql + ' and ( ';
      for i := 0 to ConnectDeviceList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
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
            if G_bApplicationTerminate then Exit;

            if G_nScheduleUsePacket = 1 then
            begin
              stSchUse := FindField('DO_SCHUSE').AsString;
              aDevice:= GetDevice(FillZeroNumber(strtoint(FindField('AC_NODENO').AsString),3) + FindField('AC_ECUID').AsString);
              if aDevice <> nil then
                aDevice.ScheduleDoorModeChange(FindField('DO_DOORNO').AsString,'*',stSchUse,'*');
              UpdateTB_DOOR_Ack(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,FindField('DO_DOORNO').AsString,'S');
            end else
            begin
              if FindField('SEND_ACK').AsString = 'R' then
              begin
                result := False;
                stMode := FindField('DO_MODE').AsString;
                stControlTime := FindField('DO_CONTROLTIME').AsString;
                stOpenMoni := FindField('DO_OPENMONI').AsString;
                stSchUse := FindField('DO_SCHUSE').AsString;
                stSendDoor := FindField('DO_SENDDOOR').AsString;
                stAlarmLong := FindField('DO_ALARMLONG').AsString;
                stFire := FindField('DO_FIRE').AsString;
                nLockType:= ord(FindField('DO_DOORTYPE').asstring[1]);// - ord('0');
                //stDoorType := inttostr(ord('0') + nLockType);
                stDoorType := inttostr(nLockType);//FindField('DO_DOORTYPE').asstring[1];
                stDSOpen := FindField('DO_DSOPEN').AsString;
                stRemoteDoor := FindField('DO_REMOTEDOOR').AsString;
                if Not IsDigit(stMode) then stMode := '0';
                if Not IsDigit(stOpenMoni) then stOpenMoni := '0';
                if Not IsDigit(stSchUse)   then stSchUse := '0';
                if Not IsDigit(stSendDoor)   then stSendDoor := '0';
                if Not IsDigit(stAlarmLong)   then stAlarmLong := '0';
                if Not IsDigit(stFire)   then stFire := '0';
                if not isDigit(stDSOpen) then stDSOpen := '0';
                if not isDigit(stRemoteDoor) then stRemoteDoor := '0';

                aDevice:= GetDevice(FillZeroNumber(strtoint(FindField('AC_NODENO').AsString),3) + FindField('AC_ECUID').AsString);
                if aDevice <> nil then
                  aDevice.DeviceDoorInfoSetting(FindField('DO_DOORNO').AsString,
                                            '0',stMode,stControlTime,stOpenMoni,
                                            stSchUse,stSendDoor,stAlarmLong,stFire,
                                            stDoorType,stDSOpen,stRemoteDoor,'G');

              end else
              begin
                PubDoorInfo_Device_Serch(FindField('AC_NODENO').AsString,
                         FindField('AC_ECUID').AsString,
                         FindField('DO_DOORNO').AsString);  //'N' �ΰ�쿡�� ��� ��ȸ����.
                DeviceInfoSendTimer.Interval := 1000;       //�ٽ� ��õ� �ϵ��� ó������.
                bResult := False;
              end;
            end;
            if Not bResult then result := False;
            Delay(500);
            Next;
          end;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   'Send_UseDoorSchedule','Error');
  End;
end;

function TfmMain.updateTB_FTPLIST_Cancel(aNodeNo, aEcuID: string): Boolean;
var
  aDevice:    TDevice;
begin
  //FTP Cancel�ϴ� ��� FTP STOP ���� ������ ��Ʈ�ѷ����� FTP ���۶����� ��� ���� �߻� 2012.09.12
  aDevice:= GetDevice(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID );
  if aDevice = nil then Exit;
  aDevice.SendPacket('R','fp00'); //ftp stop

  UpdateTB_FTPLIST_State(aNodeNo,aEcuID,'Y');
  dmDBFunction.UpdateTB_DEVICECARDNO_CardNoState(aNodeNo,aEcuID,'','F','N');
  updateTB_FTPLIST_RetryCountClear(aNodeNo,aEcuID);
end;

function TfmMain.updateTB_FTPLIST_RetryCountClear(aNodeNo,
  aEcuID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_FTPLIST set FL_RETRYCOUNT = 0 ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNO + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.DeleteRestoreTable(aTable: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From ' + aTable ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.mn_sequencechangeClick(Sender: TObject);
begin
  fmSequenceChange:= TfmSequenceChange.Create(Self);
  fmSequenceChange.SHowmodal;
  fmSequenceChange.Free;
//  Delay(100);
//  Action_DaemonRestartExecute(self);

end;

function TfmMain.LoadDoor(aFirst:Boolean=True): Boolean;
var
  stSql : String;
  NodeNo  : Integer;
  aDevice     : TDevice;
  TempAdoQuery : TADOQuery;
  DeviceIndex : integer;
  i : integer;
  nAntiGroupCode : integer;
  nAntiGroupIndex : integer;
begin
  Result := False;

  if aFirst then
  begin
    for i := 0 to DeviceList.Count - 1 do     //���Թ� �޸� �ʱ�ȭ
    begin
      TDevice(DeviceList.Objects[i]).DoorAntiGroupInitialize;
      TDevice(DeviceList.Objects[i]).DoorUseInitialize;
      TDevice(DeviceList.Objects[i]).DoorNameInitialize;
      TDevice(DeviceList.Objects[i]).DoorManageModeInitialize;
      TDevice(DeviceList.Objects[i]).DoorPNModeInitialize;
      TDevice(DeviceList.Objects[i]).DoorStateInitialize;
      TDevice(DeviceList.Objects[i]).DoorLockModeInitialize;
      TDevice(DeviceList.Objects[i]).DoorFireInitialize;
    end;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    // Door �ε�
    stSql := ' select * from TB_DOOR ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND ( (DO_MEMLOAD is NULL ) or (DO_MEMLOAD= ''N'') ) ';
    stSql := stSql + ' order by AC_NODENO,AC_ECUID ';

    // ���
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //����ó��
        Exit;
      End;
      First;
      while not eof do
      begin
        if G_bApplicationTerminate then Exit;
        NodeNo:= FindField('AC_NODENO').asInteger;
        DeviceIndex:= DeviceList.Indexof(FillZeroNumber(NodeNo,3) +  FindField('AC_ECUID').AsString);
        if DeviceIndex > -1 then
        begin
          TDevice(DeviceList.Objects[DeviceIndex]).SetDoorUse(FindField('DO_DOORNO').AsInteger,True);
          (*if FindField('DO_DOORNO').AsString = '1' then
            TDevice(DeviceList.Objects[DeviceIndex]).Door1Use := True
          else if FindField('DO_DOORNO').AsString = '2' then
            TDevice(DeviceList.Objects[DeviceIndex]).Door2Use := True;
          *)
          if FindField('DO_SCHUSE').AsString = '1' then
             TDevice(DeviceList.Objects[DeviceIndex]).DoorScheduleUse := True;

          nAntiGroupCode := 0;
          if Not FindField('AG_CODE').IsNull then
             nAntiGroupCode := FindField('AG_CODE').AsInteger ;
          if nAntiGroupCode > 0 then
          begin
            TDevice(DeviceList.Objects[DeviceIndex]).AntiPassGroup_Add(FindField('DO_DOORNO').AsInteger,nAntiGroupCode);
            nAntiGroupIndex := AntiGroupList.indexOf(inttostr(nAntiGroupCode));
            if nAntiGroupIndex > -1 then
            begin
              TAntiPassGroup(AntiGroupList.objects[nAntiGroupIndex]).AntiGroupDeviceAdd(FillZeroNumber(NodeNo,3) +  FindField('AC_ECUID').AsString);
            end;
          end;
        end;
        UpdateTB_DOOR_MEMLOAD(inttostr(NodeNo),FindField('AC_ECUID').AsString,FindField('DO_DOORNO').AsString,'Y');
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

procedure TfmMain.Control_MemoryClear(aNodeNo, aEcuID: string);
var
  stDeviceID : string;
  aDevice: TDevice;
begin
  Exit; //������� ����.
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  aDevice:= GetDevice(stDeviceID);
  if aDevice = nil then Exit;
  //if aDevice.Door1Use or aDevice.Door2Use then
  begin
    Exit;
  end;
  aDevice.MemoryClear;

end;



function TfmMain.ControlSendData(aSendData: string): Boolean;
begin
  dmMonitoringServer.ControlBroadCastData(aSendData);

end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
  tbi.Visible := False;
end;

procedure TfmMain.MultiSocketInitialize;
begin
//  ClientSenderProcessStart;
  ThreadCheckTimer.Enabled := True;
end;

procedure TfmMain.MultiSocketFree;
begin
//  ClientSenderProcessStop;
end;


procedure TfmMain.AllStateCheck(aData: string);
begin
  if aData = 'ALARMSTATE' then
  begin
    if L_bNotDeviceStateCheck then Exit;
    AlarmStateAllCheckSend;
  end else if aData = 'ALLSTATECHECK' then
  begin
    if L_bNotDeviceStateCheck then Exit;
    if G_bApplicationTerminate then Exit;
    NodeStateAllCheckSend;
    if G_bApplicationTerminate then Exit;
    DeviceStateAllCheckSend;
    if G_bApplicationTerminate then Exit;
    AlarmStateAllCheckSend;
    if G_bApplicationTerminate then Exit;
    DoorStateAllCheckSend;
  end else if aData = 'DEVICEALLSTATE_II' then
  begin
    if L_bNotDeviceStateCheck then Exit;
    if G_bApplicationTerminate then Exit;
    Process_DeviceAllState_II_CheckSend;
  end else if aData = 'DEVICEALLSTATE_III' then
  begin
    if G_bApplicationTerminate then Exit;
    Process_DeviceAllState_III_CheckSend;
  end;
end;

procedure TfmMain.MonitorAlarmRefresh;
var
  stClientSendData : string;
begin
    stClientSendData:= 'R' +
           'S' + //Server
           '000' +   //NodeNo
           '00' +    //EcuID
           '00' + //DOORNO
           '00' + //READERNO
           'SV' + //����
           'R' + // ����
           FillZeroNumber(Length('ALARMREFRESH'),3) +
           'ALARMREFRESH';
      //���⿡�� ���ӵǾ� �ִ� Ŭ���̾�Ʈ�� ������ �۽�
      SendClientData(stClientSendData);

end;

procedure TfmMain.ClientStateCheckTimerTimer(Sender: TObject);
var
  stTemp : string;
begin
  if G_bApplicationTerminate then Exit;
  if StateCheckList.Count < 1 then Exit;
  Try
    ClientStateCheckTimer.Enabled := False;
    StatusBar1.Panels[6].Text := 'StateCheck';
    Application.ProcessMessages;
    Try
      FStateCheckTCS.Enter;
      stTemp := StateCheckList.Strings[0];
      StateCheckList.Delete(0);
    Finally
      FStateCheckTCS.Leave;
    End;
    AllStateCheck(stTemp);
  Finally
    if Not G_bApplicationTerminate then
      ClientStateCheckTimer.Enabled := True;
    StatusBar1.Panels[6].Text := '';
  End;
end;

function TfmMain.GetStatusCode(aStatus: string; var aAlarmView,
  aAlarmSound,aAlarmGrade: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aAlarmView := '0';
  aAlarmSound := '0';
  aAlarmGrade := '0';
  stSql := 'select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' Where AL_ALARMSTATUSCODE = ''' + aStatus + '''';

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
      if recordCount < 1 then Exit;
      if FindField('AL_ALARMVIEW').AsInteger <> 0 then aAlarmView := '1';
      aAlarmGrade := inttostr(FindField('AL_ALARMGRADE').AsInteger);
      if FindField('AL_ALARMSOUND').AsInteger <> 0 then aAlarmSound := '1';

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

{ TClientSendThread }

procedure TClientSendThread.ClientSendDataProcess(aData: string);
var
  nConnection : integer;
begin
{  for nConnection:=0 to fmMain.ClientConnectList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    //TClientInfo(fmMain.ClientConnectList.Items[nConnection]).AThread.Connection.WriteLn(aData);
    Application.ProcessMessages;
  end;      }

end;

procedure TClientSendThread.Execute;
var
  stTemp : string;
begin
{  //�� �� ��ƾ �� Ÿ���� ����...
  while not (self.Terminated) do
  begin
    if fmMain.ClientSendList.Count > 0 then
    begin
      fmMain.FClientSender.Enter;
      stTemp := fmMain.ClientSendList.Strings[0];
      fmMain.ClientSendList.Delete(0);
      fmMain.FClientSender.Leave;
      ClientSendDataProcess(stTemp);
      fmMain.StatusBar1.Panels[5].Text := inttostr(fmMain.ClientSendList.Count);
      fmMain.ClientSendThreadTime := GetTickCount;
    end;
    sleep(AllSendClientDelayTime) ;
  end;
}
end;

procedure TfmMain.ClientSenderProcessStart;
begin
  if not(assigned(ClientSenderThread)) then
  begin
     ClientSenderThread := TClientSendThread.Create(true) ;
  end;
  if (assigned(ClientSenderThread)) and (ClientSenderThread.Suspended  = true) then
  begin
   ClientSenderThread.Resume ;
  end;

end;

procedure TfmMain.ClientSenderProcessStop;
begin

  Try
    if (assigned(ClientSenderThread)) and (ClientSenderThread.Suspended  = false) then
    begin
      ClientSenderThread.Suspend ;
    end;
    // ������ ��ü ���� Ȯ��
    if assigned(ClientSenderThread) then
    begin
      // �����尡 ��� suspend �� �̸�
      if ClientSenderThread.Suspended  = true then
      begin
        ClientSenderThread.Resume;
      end;
      //
      ClientSenderThread.Terminate ;
      ClientSenderThread.WaitFor ;
      ClientSenderThread.Free ;
      ClientSenderThread := nil ;
    end;
  Except
    ClientSenderThread := nil ;
  End;

end;

procedure TfmMain.ClientAckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  SendClientData('ACK');
end;


procedure TfmMain.ThreadCheckTimerTimer(Sender: TObject);
var
  nowGetTickCount : dword;
begin
{   //���� ��ƾ �� Ÿ����...����...
  if G_bApplicationTerminate then Exit;
//  ThreadCheckTimer.Enabled := False;
  Try
    nowGetTickCount := GetTickCount - 3000;

    if ClientReceiveThreadTime < nowGetTickCount then
    begin
      if ClientReceiveDataList.Count > 0 then
      begin
        statusBar1.Panels[6].Text := 'CRStop';
        ClientReceiveProcessStop;
        Delay(200);
        statusBar1.Panels[6].Text := 'CRStart';
      end;
    end;
    if ClientSendThreadTime < nowGetTickCount then
    begin
      if ClientSendList.Count > 0 then
      begin
        statusBar1.Panels[6].Text := 'CSStop';
        ClientSenderProcessStop;
        Delay(200);
        statusBar1.Panels[6].Text := 'CSStart';
        ClientSenderProcessStart;
      end;
    end;
  Finally
//    ThreadCheckTimer.Enabled := True;
  End;
// }
end;

procedure TfmMain.TimerFree;
begin
  ConnectTimer.Enabled := False;
  SendTimer.Enabled := False;
  sendClientTimer.Enabled := False;
  RecvTimeCheck.Enabled := False;
  LogDeleteTime.Enabled := False;
  DataBaseBackupTimer.Enabled := False;
  CardAutoDownTimer.Enabled := False;
  CardLoadTimer.Enabled := False;
  SyncTimer.Enabled := False;
  fdmsRelyTimer.Enabled := False;
  StateCheckTimer.Enabled := False;
  Timer1.Enabled := False;
  FoodTimer.Enabled := False;
  HolidaySendTimer.Enabled := False;
  DeviceInfoSendTimer.Enabled := False;
  SentenceRelayTimer.Enabled := False;
  FTPSendTimer.Enabled := False;
  FTPSendProcessChckTimer.Enabled := False;
  ThreadCheckTimer.Enabled := False;
  ClientAckTimer.Enabled := False;
  ClientStateCheckTimer.Enabled := False;
  FireDoorOpenTimer.Enabled := False;
  PersonRelayTimer.Enabled := False;
  LogDirectoryDeleteTimer.Enabled := False;
  DaemonRestartTimer.Enabled := False;
  AdoConnectCheckTimer.Enabled := False;
  PCScheduleTimer.Enabled := False;
  STRTimer.Enabled := False;
  WebRelayTimer.Enabled := False;
  CheckKTTSenderTimer.Enabled := False;
  CheckFPSystemTimer.Enabled := False;
  DeviceLoadTimer.Enabled := False;
  ValidExpiredTimer.Enabled := False;
  DaemonStateCheckTimer.Enabled := False;

  ConnectTimer.Free;
  SendTimer.Free;
  sendClientTimer.Free;
  RecvTimeCheck.Free;
  LogDeleteTime.Free;
  DataBaseBackupTimer.Free;
  CardAutoDownTimer.Free;
  SyncTimer.Free;
  fdmsRelyTimer.Free;
  StateCheckTimer.Free;
  Timer1.Free;
  FoodTimer.Free;
  HolidaySendTimer.Free;
  DeviceInfoSendTimer.Free;
  SentenceRelayTimer.Free;
  FTPSendTimer.Free;
  FTPSendProcessChckTimer.Free;
  ThreadCheckTimer.Free;
  ClientAckTimer.Free;
  ClientStateCheckTimer.Free;
  FireDoorOpenTimer.Free;
  PersonRelayTimer.Free;
  LogDirectoryDeleteTimer.Free;
  DaemonRestartTimer.Free;
  AdoConnectCheckTimer.Free;
  PCScheduleTimer.Free;
  STRTimer.Free;
  WebRelayTimer.Free;
  CheckKTTSenderTimer.Free;
  CheckFPSystemTimer.Free;
  DaemonStateCheckTimer.Free;
end;

procedure TfmMain.StringListClear;
var
  i : integer;
begin
  TRY
    FClientSender.Enter;
    if AlarmModeNotCardList.Count > 0 then
    begin
      for i := AlarmModeNotCardList.count - 1 downto 0 do
      begin
        TAlarmStatusCode(AlarmModeNotCardList.objects[i]).Free;
      end;
    end;
    AlarmModeNotCardList.Clear;
    if AntiGroupList.Count > 0 then
    begin
      for I := AntiGroupList.Count - 1 downto 0 do  TAntiPassGroup(AntiGroupList.Objects[i]).Free;
    end;
    AntiGroupList.Clear;

    if ArmAreaRelayModeList.count > 0 then
    begin
      for I := ArmAreaRelayModeList.Count - 1 downto 0 do  TArmAreaRelayModeState(ArmAreaRelayModeList.Objects[i]).Free;
    end;
    ArmAreaRelayModeList.clear;

    if FoodServerEmployeeList.Count > 0 then
    begin
      for i := FoodServerEmployeeList.count - 1 downto 0 do
      begin
        TFoodEmployee(FoodServerEmployeeList.objects[i]).Free;
      end;
    end;
    
    ClientReceiveDataList.Clear;
    ClientSendList.Clear;  //Ŭ���̾�Ʈ�� ���� �۽� ����Ʈ
    FireDoorOpenList.Clear; //ȭ��� ������ ��� ����Ʈ
    FoodConfigCodeList.Clear; //�ļ� �ڵ� ����Ʈ
    FoodConfigStartList.Clear; // �ļ��ڵ� ���۽ð�
    FoodConfigEndList.Clear;  //�ļ��ڵ� ���� �ð�
    HolidaySendDeviceList.Clear;   //������ ���� ��⸮��Ʈ
    InOutCountList.Clear; //����� ī��Ʈ -1(���) 1(�Խ�) 0(������)
    InOutCardReaderList.Clear; //����� ī��Ʈ ��� 000(����ȣ)00(ECUID)0(ReaderNo)
    InOutGroupReaderList.Clear;
    StateCheckList.Clear;
    STRSendList.Clear;       //STRTimer �� ���� ������ ����
    WorkTypeList.Clear;
    NodeStateList.Clear;
    FireBreakGubunList.Clear;
    if CardEmployeeInfoList.Count > 0 then
    begin
      for i := CardEmployeeInfoList.count - 1 downto 0 do
      begin
        TCardEmployeeInfo(CardEmployeeInfoList.Objects[i]).Free;
      end;
    end;
    CardEmployeeInfoList.Clear;
    InnoNixAlarmEventList.Clear;


    //��������
    ComNodeList.Clear;
    ConnectDeviceList.Clear;
    DeviceList.Clear;
  FINALLY
    FClientSender.Leave;
  END;
end;

procedure TfmMain.Process_DeviceAllState_II_MemorySave;
begin
  Try
    FStateCheckTCS.Enter;
    if StateCheckList.IndexOf('DEVICEALLSTATE_II') < 0 then
        StateCheckList.Add('DEVICEALLSTATE_II');
  Finally
    FStateCheckTCS.Leave;
  End;
end;

procedure TfmMain.Process_DeviceAllState_II_CheckSend;
var
  i : integer;
  stClientSendData : string;

  stDeviceConnect : string;
  stWatchMode : string;
  stDoorManager1 : string;
  stDoorManager2 : string;
  stDoorPNmode1 : string;
  stDoorPNmode2 : string;
  stDoorOpenState1 : string;
  stDoorOpenState2 : string;
  stDoorLockState1 : string;
  stDoorLockState2 : string;
  stDoorFireState1 : string;
  stDoorFireState2 : string;
  stRealData : string;
begin
  if L_bProcessStateCheckII then Exit;

  L_bProcessStateCheckII := True;
  Try
    for i:=0 to DeviceList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      if TDevice(DeviceList.Objects[i]).Connected then stDeviceConnect := 'C'
      else stDeviceConnect := 'D';
      case TDevice(DeviceList.Objects[i]).GetArmAreaState(0) of
          cmNothing : begin stWatchMode := 'N' end;
          cmArm     : begin stWatchMode := 'A' end;
          cmDisarm  : begin stWatchMode := 'D' end;
          cmPatrol  : begin stWatchMode := 'P' end;
          cmInit    : begin stWatchMode := 'I' end;
          cmTest    : begin stWatchMode := 'T' end;
          cmJaejung : begin stWatchMode := 'E' end;
          else  begin stWatchMode := 'N' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorManageMode(1) of
        dmNothing : begin stDoorManager1 := 'N' end;
        dmManager : begin stDoorManager1 := 'M' end;
        dmOpen    : begin stDoorManager1 := 'O' end;
        dmLock    : begin stDoorManager1 := 'L' end;
        dmMaster  : begin stDoorManager1 := 'S' end;
        else begin stDoorManager1 := 'N' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorManageMode(2) of
        dmNothing : begin stDoorManager2 := 'N' end;
        dmManager : begin stDoorManager2 := 'M' end;
        dmOpen    : begin stDoorManager2 := 'O' end;
        dmLock    : begin stDoorManager2 := 'L' end;
        dmMaster  : begin stDoorManager2 := 'S' end;
        else begin stDoorManager2 := 'N' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorPNMode(1) of
        pnNothing  : begin stDoorPNmode1 := 'N' end;
        pnPositive : begin stDoorPNmode1 := 'P' end;
        pnNegative : begin stDoorPNmode1 := 'O' end;
        else begin stDoorPNmode1 := 'N' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorPNMode(2) of
        pnNothing  : begin stDoorPNmode2 := 'N' end;
        pnPositive : begin stDoorPNmode2 := 'P' end;
        pnNegative : begin stDoorPNmode2 := 'O' end;
        else begin stDoorPNmode2 := 'N' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorState(1) of
        dsNothing : begin stDoorOpenState1 := 'N' end;
        dsClose   : begin stDoorOpenState1 := 'C' end;
        dsOpen    : begin stDoorOpenState1 := 'O' end;
        dsLongTime: begin stDoorOpenState1 := 'L' end;
        dsOpenErr : begin stDoorOpenState1 := 'P' end;
        dsCloseErr: begin stDoorOpenState1 := 'S' end;
        else begin stDoorOpenState1 := 'N' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorState(2) of
        dsNothing : begin stDoorOpenState2 := 'N' end;
        dsClose   : begin stDoorOpenState2 := 'C' end;
        dsOpen    : begin stDoorOpenState2 := 'O' end;
        dsLongTime: begin stDoorOpenState2 := 'L' end;
        dsOpenErr : begin stDoorOpenState2 := 'P' end;
        dsCloseErr: begin stDoorOpenState2 := 'S' end;
        else begin stDoorOpenState2 := 'N' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorLockMode(1) of
        lsNothing : begin stDoorLockState1 := 'N' end;
        lsClose   : begin stDoorLockState1 := 'C' end;
        lsOpen    : begin stDoorLockState1 := 'O' end;
        else begin stDoorLockState1 := 'N' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorLockMode(2) of
        lsNothing : begin stDoorLockState2 := 'N' end;
        lsClose   : begin stDoorLockState2 := 'C' end;
        lsOpen    : begin stDoorLockState2 := 'O' end;
        else begin stDoorLockState2 := 'N' end;
      end;
      if TDevice(DeviceList.Objects[i]).GetDoorFire(1) then stDoorFireState1 := 'F'
      else stDoorFireState1 := 'N';
      if TDevice(DeviceList.Objects[i]).GetDoorFire(2) then stDoorFireState2 := 'F'
      else stDoorFireState2 := 'N';

      stRealData := stDeviceConnect +
                    stWatchMode +
                    stDoorManager1 +
                    stDoorManager2 +
                    stDoorPNmode1 +
                    stDoorPNmode2 +
                    stDoorOpenState1 +
                    stDoorOpenState2 +
                    stDoorLockState1 +
                    stDoorLockState2 +
                    stDoorFireState1 +
                    stDoorFireState2;

      stClientSendData := 'R' +
                          'S' +   //Server ����
                          FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3) +
                          TDevice(DeviceList.Objects[i]).ECUID +
                          '00' +
                          '00' +
                          'SV' +
                          'S' +
                          FillZeroNumber(Length(stRealData),3) +
                          stRealData;

      SendClientData(stClientSendData);
      Application.ProcessMessages;
    end;
  Finally
    L_bProcessStateCheckII := False;
  End;
end;

procedure TfmMain.BroadCastMonitorClient(aData: string);
var
  stClientSendData : string;
begin
    stClientSendData:= 'R' +
           'S' + //TYPE
           '000' +
           '00' +
           '00' + //DOORNO
           '00' + //READERNO
           'BR' + //'BR' ��ε�
           'C' + // ī�嵥����
           FillZeroNumber(Length(aData),3) +
           aData;
      //���⿡�� ���ӵǾ� �ִ� Ŭ���̾�Ʈ�� ������ �۽�
      SendClientData(stClientSendData);
      SendSettingData(stClientSendData);

end;

//2011.03.29 ��� ���� ���� ���� ���� �߻� �˶� �߻� ó��
procedure TfmMain.NodeDisConnectAlarmEvent(Sender:TObject;NodeNo: integer);
var
  stAlarmData : string;
begin
  stAlarmData := '058 K1000000000AJn'+ FormatDateTime('yyyymmddhhnnss',now) +'MN0000nNF*************B8';
  DeviceRcvAlarmData(Sender,'A',stAlarmData,NodeNo,'001');
end;

procedure TfmMain.PCScheduleTimerTimer(Sender: TObject);
begin
  PCScheduleTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  if Not L_bDaemonStart then Exit;
  if G_nScheduleDevice <> 1 then Exit;
  StatusBar1.Panels[2].Text := 'PCScheduleTimerStart';

  Try
    PCScheduleStart;
  Finally
    if Not G_bApplicationTerminate then PCScheduleTimer.Enabled := True;
  End;
  StatusBar1.Panels[2].Text := 'PCScheduleTimerEnd';

end;

procedure TfmMain.PCScheduleStart;
var
  TempAdoQuery : TADOQuery;
  stSql : string;
  nWeekCode : integer;
  stTime : string;
  stDayCode : string;
  stNowScheduleMode : string;
  nNodeNo : integer;
  stEcuID : string;
  stDoorNo : string;
  stDeviceID : string;
  nIndex : integer;
  stTemp : string;
begin
  nWeekCode := 8;
  stTime := FormatDateTime('yyyymmddhhnnss',now);
  if CommonModule.CheckHolidy(Copy(stTime,1,4),Copy(stTime,5,2),Copy(stTime,7,2)) then nWeekCode := 0; //�������̸�
  if nWeekCode <> 0 then
    nWeekCode := DayOfWeek(now); //1: �Ͽ���,7:�����
  if nWeekCode = 0 then stDayCode := '3'   //Ư����
  else if nWeekCode = 1 then stDayCode := '2' //�Ͽ���
  else if nWeekCode = 7 then stDayCode := '1' //�����
  else stDayCode := '0';                   //����

  stSql := 'select b.AC_NODENO,b.AC_ECUID,b.DO_DOORNO,b.DE_DAYCODE,';
  stSql := stSql + ' b.DE_CELL1TIME,b.DE_CELL1MODE,b.DE_CELL2TIME,b.DE_CELL2MODE,b.DE_CELL3TIME,b.DE_CELL3MODE,b.DE_CELL4TIME,b.DE_CELL4MODE,b.DE_CELL5TIME,b.DE_CELL5MODE,';
  stSql := stSql + ' b.DE_UPDATETIME,b.DE_UPDATEOPERATOR,b.DE_RCVACK ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' INNER JOIN TB_DEVICESCHEDULE b ';
  stSql := stSql + 'ON (a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + 'AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + 'AND a.DO_DOORNO = b.DO_DOORNO) ';
  stSql := stSql + 'where a.DO_SCHUSE = ''1''  ';
  stSql := stSql + 'and de_daycode = ''' + stDayCode + ''' ';
  
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
      First;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        nNodeNo := FindField('AC_NODENO').AsInteger;
        stEcuID := FindField('AC_ECUID').AsString;
        stDoorNo := FindField('DO_DOORNO').AsString;
        stDeviceID := FillZeroNumber(nNodeNo,3) + stEcuID;

        nIndex := DeviceList.IndexOf(stDeviceID);
        if nIndex > -1 then
        begin
          stNowScheduleMode := GetDoorNowScheduleMode(FindField('DE_CELL1TIME').AsString,
                                                      FindField('DE_CELL1MODE').AsString,
                                                      FindField('DE_CELL2TIME').AsString,
                                                      FindField('DE_CELL2MODE').AsString,
                                                      FindField('DE_CELL3TIME').AsString,
                                                      FindField('DE_CELL3MODE').AsString,
                                                      FindField('DE_CELL4TIME').AsString,
                                                      FindField('DE_CELL4MODE').AsString,
                                                      FindField('DE_CELL5TIME').AsString,
                                                      FindField('DE_CELL5MODE').AsString,
                                                      copy(stTime,9,4));


          case stNowScheduleMode[1] of
            '0':    //����
              begin
                if TDevice(DeviceList.Objects[nIndex]).GetDoorManageMode(strtoint(stDoorNo)) <> dmManager then
                begin
                  if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange(stDoorNo[1],stNowScheduleMode[1]);
                end;
              end;
            '1':    //������
              begin
                if TDevice(DeviceList.Objects[nIndex]).GetDoorManageMode(strtoint(stDoorNo)) <> dmOpen then
                begin
                  if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange(stDoorNo[1],stNowScheduleMode[1]);
                end;
              end;
            '2':    //�����
              begin
                if TDevice(DeviceList.Objects[nIndex]).GetDoorManageMode(strtoint(stDoorNo)) <> dmLock then
                begin
                  if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange(stDoorNo[1],stNowScheduleMode[1]);
                end;
              end;
            '3':    //�����͸��
              begin
                if TDevice(DeviceList.Objects[nIndex]).GetDoorManageMode(strtoint(stDoorNo)) <> dmMaster then
                begin
                  if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange(stDoorNo[1],stNowScheduleMode[1]);
                end;
              end;
            else
              begin
              end;
          end;


          (*
          if stDoorNo = '1' then
          begin
            case stNowScheduleMode[1] of
              '0':    //����
                begin
                  if TDevice(DeviceList.Objects[nIndex]).DoorManageMode1 <> dmManager then
                  begin
                    if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange('1',stNowScheduleMode[1]);
                  end;
                end;
              '1':    //������
                begin
                  if TDevice(DeviceList.Objects[nIndex]).DoorManageMode1 <> dmOpen then
                  begin
                    if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange('1',stNowScheduleMode[1]);
                  end;
                end;
              '2':    //�����
                begin
                  if TDevice(DeviceList.Objects[nIndex]).DoorManageMode1 <> dmLock then
                  begin
                    if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange('1',stNowScheduleMode[1]);
                  end;
                end;
              '3':    //�����͸��
                begin
                  if TDevice(DeviceList.Objects[nIndex]).DoorManageMode1 <> dmMaster then
                  begin
                    if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange('1',stNowScheduleMode[1]);
                  end;
                end;
              else
                begin
                end;
            end;
          end else if stDoorNo = '2' then
          begin
            case stNowScheduleMode[1] of
              '0':    //����
                begin
                  if TDevice(DeviceList.Objects[nIndex]).DoorManageMode2 <> dmManager then
                  begin
                    if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange('2',stNowScheduleMode[1]);
                  end;
                end;
              '1':    //������
                begin
                  if TDevice(DeviceList.Objects[nIndex]).DoorManageMode2 <> dmOpen then
                  begin
                    if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange('2',stNowScheduleMode[1]);
                  end;
                end;
              '2':    //�����
                begin
                  if TDevice(DeviceList.Objects[nIndex]).DoorManageMode2 <> dmLock then
                  begin
                    if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange('2',stNowScheduleMode[1]);
                  end;
                end;
              '3':    //�����
                begin
                  if TDevice(DeviceList.Objects[nIndex]).DoorManageMode2 <> dmMaster then
                  begin
                    if TDevice(DeviceList.Objects[nIndex]).Connected = True then TDevice(DeviceList.Objects[nIndex]).Control_DoorModeChange('2',stNowScheduleMode[1]);
                  end;
                end;
              else
                begin
                end;
            end;
          end; //stDoorNo ��
          *)
        end;   //nIndex
        Application.ProcessMessages;
        Next;
      end;     //While
    end;
  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.GetDoorNowScheduleMode(a1Time, a1Mode, a2Time, a2Mode,
  a3Time, a3Mode, a4Time, a4Mode, a5Time, a5Mode,aTime: string): string;
begin
  Try
    result := a1Mode;
    if strtoint(aTime) < strtoint(a1Time) then Exit;
    result := a2Mode;
    if strtoint(aTime) < strtoint(a2Time) then Exit;
    result := a3Mode;
    if strtoint(aTime) < strtoint(a3Time) then Exit;
    result := a4Mode;
    if strtoint(aTime) < strtoint(a4Time) then Exit;
    result := a5Mode;
  Except
    Exit;
  End;

end;

procedure TfmMain.MonitorServerStart(ServerPort: integer);
begin
{  if MonitorSERVER = nil then
    MonitorSERVER:= TDXServerCore.Create(self);
  if MonitorQueue1 = nil then
    MonitorQueue1:= TDXUnicastDataQueue.Create(self);
  MonitorSERVER.OnNewConnect := RSERVER1NewConnect;

  MonitorSERVER.ServerPort := ServerPort;
  MonitorSERVER.Start; }
  dmMonitoringServer.ServerStart(ServerPort);
  if isDigit(L_stControlPort) then
  begin
    dmMonitoringServer.ControlServerStart(strtoint(L_stControlPort));
  end;

end;

procedure TfmMain.MonitorServerStop;
var
  i : integer;
begin
{  MonitorSERVER.Stop;
  MonitorSERVER.Close;
  MonitorSERVER := nil;}
  dmMonitoringServer.ServerStop;
  dmMonitoringServer.ControlServerStop;
end;

procedure TfmMain.DeviceSortTimerTimer(Sender: TObject);
var
  i : integer;
begin
  if L_stDeviceSortDate = FormatDateTime('yyyymmdd',now) then Exit;

  for i := 0 to DeviceList.Count - 1 do
  begin
    if TDevice(DeviceList.Objects[i]).Connected then
       TDevice(DeviceList.Objects[I]).SendPacket('R','st0000');
  end;
  L_stDeviceSortDate := FormatDateTime('yyyymmdd',now);
  dmDBFunction.UpdateTB_CURRENTDAEMON_Field_StringValue('DEVICESORT','CU_STATEVALUE',L_stDeviceSortDate);
end;


function TfmMain.CreateBackupInfo(aBackupini: string): Boolean;
var
  ini_fun : TiniFile;
begin
  Try
    ini_fun := TiniFile.Create(aBackupini);
    ini_fun.WriteString('Config','DBTYPE',DBTYPE);
    ini_fun.WriteInteger('Config','VER',1);
  Finally
    ini_fun.Free;
  End;

end;

function TfmMain.MSSQLTableLayoutCreate(aBackupDir,
  aTableName: string): Boolean;
var
  stSql : string;
  FileList : TStringList;
begin
  result := False;

  Try
    stSql := ' declare @table varchar(100) ';
    stSql := stSql + ' set @table = ''' + aTableName + ''' ';
    stSql := stSql + ' declare @sql table(s varchar(1000), id int identity)  ';
    stSql := stSql + ' insert into  @sql(s) values (''create table ['' + @table + ''] ('') ';
    stSql := stSql + ' insert into @sql(s) select      ''  [''+column_name+''] '' +      data_type + coalesce(''(''+cast(character_maximum_length as varchar)+'')'','''') + '' '' +   ';
    stSql := stSql + ' case when exists (   ';
    stSql := stSql + '  select id from syscolumns   ';
    stSql := stSql + '  where object_name(id)=@table   ';
    stSql := stSql + '  and name=column_name  ';
    stSql := stSql + '  and columnproperty(id,name,''IsIdentity'') = 1  ';
    stSql := stSql + ' ) then  ';
    stSql := stSql + '  ''IDENTITY('' +  ';
    stSql := stSql + '  cast(ident_seed(@table) as varchar) + '','' +   ';
    stSql := stSql + '  cast(ident_incr(@table) as varchar) + '')''  ';
    stSql := stSql + '  else ''''   ';
    stSql := stSql + '  end + '' '' +   ';
    stSql := stSql + '  ( case when IS_NULLABLE = ''No'' then ''NOT '' else '''' end ) + ''NULL '' +  ';
    stSql := stSql + '  coalesce(''DEFAULT ''+COLUMN_DEFAULT,'''') + '',''  ';
    stSql := stSql + ' from information_schema.columns where table_name = @table  ';
    stSql := stSql + ' order by ordinal_position  ';
    stSql := stSql + ' declare @pkname varchar(100)  ';
    stSql := stSql + ' select @pkname = constraint_name from information_schema.table_constraints  ';
    stSql := stSql + ' where table_name = @table and constraint_type=''PRIMARY KEY''  ';
    stSql := stSql + ' if ( @pkname is not null ) begin  ';
    stSql := stSql + '  insert into @sql(s) values(''  PRIMARY KEY ('')  ';
    stSql := stSql + '  insert into @sql(s)  ';
    stSql := stSql + '  select ''   [''+COLUMN_NAME+''],'' from information_schema.key_column_usage  ';
    stSql := stSql + '  where constraint_name = @pkname  ';
    stSql := stSql + '  order by ordinal_position  ';
    stSql := stSql + '  update @sql set s=left(s,len(s)-1) where id=@@identity  ';
    stSql := stSql + '  insert into @sql(s) values (''  )'')  ';
    stSql := stSql + ' end else begin  ';
    stSql := stSql + '  update @sql set s=left(s,len(s)-1) where id=@@identity  ';
    stSql := stSql + ' end  ';
    stSql := stSql + ' insert into @sql(s) values( '')'' )  ';
    stSql := stSql + ' select s as data from @sql order by id  ';

    FileList := TStringList.Create;
    with ADOBackupQuery do
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
      FileList.Clear;
      while Not Eof do
      begin
        FileList.Add(FindField('data').AsString);
        Next;
      end;
      FileList.Add(';');
    end;
    result := True;
  Finally
    FileList.SaveToFile(aBackupDir + '\' + aTableName + '.csql');
    FileList.Free;
  End;
end;

function TfmMain.PGTableLayoutCreate(aBackupDir,
  aTableName: string): Boolean;
var
  stSql : string;
  stType : string;
  stDefault : string;
  stCreateSql : string;
  FileList : TStringList;
  stTemp : string;
  bFirst : Boolean;
begin
  result := False;

  Try
    stSql := 'SELECT  attnum,attname , typname , atttypmod-4 as typmode , attnotnull ,atthasdef ,adsrc AS def ';
    stSql := stSql + ' FROM pg_attribute, pg_class, pg_type, pg_attrdef ';
    stSql := stSql + ' WHERE pg_class.oid=attrelid ';
    stSql := stSql + ' AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum ';
    stSql := stSql + ' AND atthasdef=''t'' AND lower(relname)=''' + lowerCase(aTableName) + ''' UNION ';
    stSql := stSql + ' SELECT attnum,attname , typname , atttypmod-4 , attnotnull , atthasdef ,'''' AS def ';
    stSql := stSql + ' FROM pg_attribute, pg_class, pg_type WHERE pg_class.oid=attrelid ';
    stSql := stSql + ' AND pg_type.oid=atttypid AND attnum>0 AND atthasdef=''f'' AND lower(relname)=''' + lowerCase(aTableName) + ''' ';
    stSql := stSql + ' order by attnum ';

    FileList := TStringList.Create;
    with ADOBackupQuery do
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

      stCreateSql := 'CREATE TABLE ' + aTableName;
      stCreateSql := stCreateSql + ' ( ';
      bFirst := True;
      While Not Eof do
      begin
        if Not bFirst then
          stCreateSql := stCreateSql + ',';
        bFirst := False;
        stCreateSql := stCreateSql + ' ' + FindField('attname').AsString;
        if UpperCase(FindField('typname').AsString) = 'INT4' then stType := 'INTEGER'
        else if UpperCase(FindField('typname').AsString) = 'BPCHAR' then stType := 'CHAR'
        else stType := UpperCase(FindField('typname').AsString);
        stCreateSql := stCreateSql + ' ' + stType;
        if UpperCase(FindField('typname').AsString) <> 'INT4' then
        begin
          stCreateSql := stCreateSql + '(' + FindField('typmode').AsString + ')';
        end;
        stTemp := UpperCase(FindField('attnotnull').AsString);
        if (stTemp = 'T') OR (stTemp = 'TRUE') OR (stTemp = '1') then
        begin
          stCreateSql := stCreateSql + ' NOT NULL ';
        end;
        stTemp := UpperCase(FindField('atthasdef').AsString);
        if (stTemp = 'T') OR (stTemp = 'TRUE') OR (stTemp = '1') then
        begin
          stCreateSql := stCreateSql + ' DEFAULT ';
          if UpperCase(FindField('typname').AsString) <> 'INT4' then
          begin
            stCreateSql := stCreateSql + ' ''';
            stDefault := FindField('def').AsString;
            stDefault:= FindCharCopy(stDefault,1,'''');
//          stDefault := StringReplace(stDefault,'''','',[rfReplaceAll]);
//          stDefault := StringReplace(stDefault,'::','',[rfReplaceAll]);
            stCreateSql := stCreateSql + stDefault;
            stCreateSql := stCreateSql + ''' ';
          end else stCreateSql := stCreateSql + FindField('def').AsString;
        end;
        Next;
      end;
      stCreateSql := stCreateSql + ' ); ';
      FileList.Add(stCreateSql);
    End;

    stSql := 'SELECT pg_index.indisprimary,';
    stSql := stSql + ' pg_catalog.pg_get_indexdef(pg_index.indexrelid) as pkey ';
    stSql := stSql + ' FROM pg_catalog.pg_class c, pg_catalog.pg_class c2,';
    stSql := stSql + ' pg_catalog.pg_index AS pg_index ';
    stSql := stSql + ' WHERE c.relname = ''' + lowerCase(aTableName) + ''' ';
    stSql := stSql + ' AND c.oid = pg_index.indrelid ';
    stSql := stSql + ' AND pg_index.indexrelid = c2.oid ';
    stSql := stSql + ' AND pg_index.indisprimary ';

    with ADOBackupQuery do
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
      while Not Eof do
      begin
        stCreateSql := ' ALTER TABLE ' + aTableName;
        stCreateSql := stCreateSql + '   ADD CONSTRAINT ' + aTableName +'_pkey PRIMARY KEY ';

        stTemp := FindField('pkey').AsString;

        stTemp := stringReplace(stTemp,'(',')',[rfReplaceAll]);
        stTemp := FindCharCopy(stTemp,1,')');

        stCreateSql := stCreateSql + '(' + stTemp + ');';
        FileList.Add(stCreateSql);

        Next;
      end;
    end;
    result := True;
  Finally
    FileList.SaveToFile(aBackupDir + '\' + aTableName + '.csql');
    FileList.Free;
  End;

end;

procedure TfmMain.DirectSendPacket(aDeviceID, aData: string);
var
  stNodeNo,stECUID,stDoorNo : string;
  i : integer;
  aDevice: TDevice;
  stCmd : string;
begin
  if aData = '' then Exit;
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);
  stDoorNo := copy(aDeviceID,6,1);
  stCmd := copy(aData,1,1);
  Delete(aData,1,1);

  aDevice:= GetDevice(stNodeNo + stECUID  );
  if aDevice <> nil then
  begin
    if aDevice.CommNode <> nil then
      if aDevice.CommNode.SocketConnected = True then
      begin
        aDevice.SendPacket(stCmd[1],aData,True);
      end;
  end;

end;

function TfmMain.SendSettingData(aSendData: string): Boolean;
begin
  if G_bApplicationTerminate then Exit;
  dmMonitoringServer.ControlBroadCastData(aSendData);
end;

procedure TfmMain.DeviceCodeChange(Sender: TObject; NodeNo: integer;
  aEcuID, aDeviceCode: string);
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE set AC_DEVICECODE = ''' + Trim(aDeviceCode) + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(NodeNo) + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeviceTypeChange(Sender: TObject; NodeNo: integer;
  aEcuID, aDeviceType: string);
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE set AC_DEVICETYPE = ''' + aDeviceType + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(NodeNo) + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMain.STRTimerTimer(Sender: TObject);
begin
  if L_bSTRDataSending then Exit;
  STRTimer.Enabled := False;
  L_bSTRDataSending := True;
  //STR���� ������ ������ ��������.
  STRDataSend;

  L_bSTRDataSending := False;
end;

procedure TfmMain.STRDataSend;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  Try
    stSql := 'select * from TB_DEVICESETTINGINFO ';
    stSql := stSql + ' Where DS_RCVACK = ''N'' ';
    if ConnectDeviceList.Count > 0 then
    begin
      stSql := stSql + ' and ( ';
      for i := 0 to ConnectDeviceList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if i <> 0 then stSql := stSql + ' OR ';
        stSql := stSql + '( AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
        stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''' ) ';
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
        SQL.Text := stSql;

        Try
          Open;
        Except
          Exit;
        End;

        if RecordCount > 0  then
        begin
          First;
          while not eof do
          begin
            if G_bApplicationTerminate then Exit;
            if UpperCase(copy(FindField('DS_COMMAND').AsString,1,Length('CARDREADERSETTINGINFO'))) = 'CARDREADERSETTINGINFO' then
            begin
              Send_CardReaderSetting(FindField('AC_NODENO').AsInteger,FindField('AC_ECUID').AsString,copy(FindField('DS_COMMAND').AsString,Length('CARDREADERSETTINGINFO') + 1,1));
            end else if UpperCase(FindField('DS_COMMAND').AsString) = 'CARDREADERTYPEINFO' then
            begin
              Send_CardReaderType(FindField('AC_NODENO').AsInteger,FindField('AC_ECUID').AsString);
            end else if UpperCase(copy(FindField('DS_COMMAND').AsString,1,Length('DOORSETTINGINFO'))) = 'DOORSETTINGINFO' then
            begin
              Send_DoorSetting(FindField('AC_NODENO').AsInteger,FindField('AC_ECUID').AsString,copy(FindField('DS_COMMAND').AsString,Length('DOORSETTINGINFO') + 1,1));
            end else if UpperCase(FindField('DS_COMMAND').AsString) = 'ECUCOUNT' then
            begin
              Send_UseEcuCount(FindField('AC_NODENO').AsInteger);
            end else if UpperCase(FindField('DS_COMMAND').AsString) = 'ECUTYPE' then
            begin
              Send_EcuType(FindField('AC_NODENO').AsInteger);
            end else if UpperCase(FindField('DS_COMMAND').AsString) = 'JAEJUNGINFO' then
            begin
              Send_JaejungDelay(FindField('AC_NODENO').AsInteger,FindField('AC_ECUID').AsString);
            end else if UpperCase(FindField('DS_COMMAND').AsString) = 'MCUID' then
            begin
              Send_McuID(FindField('AC_NODENO').AsInteger);
            end else if UpperCase(copy(FindField('DS_COMMAND').AsString,1,Length('PROTSETTINGINFO'))) = 'PROTSETTINGINFO' then
            begin
              Send_PortSetting(FindField('AC_NODENO').AsInteger,FindField('AC_ECUID').AsString,copy(FindField('DS_COMMAND').AsString,Length('PROTSETTINGINFO') + 1,1));
            end else if UpperCase(FindField('DS_COMMAND').AsString) = 'SYSTEMINFO' then
            begin
              Send_SystemInfo(FindField('AC_NODENO').AsInteger,FindField('AC_ECUID').AsString);
            end else if UpperCase(FindField('DS_COMMAND').AsString) = 'TELECOPID' then
            begin
              Send_TelecopID(FindField('AC_NODENO').AsInteger);
            end else if UpperCase(FindField('DS_COMMAND').AsString) = 'TELECOPTELCOUNT' then
            begin
              Send_TelecopTelCount(FindField('AC_NODENO').AsInteger);
            end else if UpperCase(FindField('DS_COMMAND').AsString) = 'TELECOPTELNUM1' then
            begin
              Send_TelecopTelNumber(FindField('AC_NODENO').AsInteger,'1');
            end;

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
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   'STRDataSend','Error');
  End;
end;

function TfmMain.Send_CardReaderSetting(aNodeNo: integer; aEcuID,
  aCardReaderNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stReaderUse : string;
  stReaderDoor : string;
  stDoorPosi : string;
  stBuildPosi : string;
begin
  Try
    stSql := 'select * from TB_READER ';
    stSql := stSql + ' Where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND RE_READERNO = ''' + aCardReaderNo + ''' ';

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
      if recordcount < 1 then Exit;

      First;
      if isDigit(FindField('RE_USE').AsString) then stReaderUse := FindField('RE_USE').AsString
      else stReaderUse := '0';
      if isDigit(FindField('DO_DOORNO').AsString) then stReaderDoor := FindField('DO_DOORNO').AsString
      else stReaderDoor := '0';
      if isDigit(FindField('DOOR_POSI').AsString) then stDoorPosi := FindField('DOOR_POSI').AsString
      else stDoorPosi := '0';
      if isDigit(FindField('build_posi').AsString) then stBuildPosi := FindField('build_posi').AsString
      else stBuildPosi := '0';

      Registration_CardReaderInfo(aNodeNo,aEcuID,aCardReaderNo,stReaderUse,stReaderDoor,stDoorPosi,stBuildPosi);

    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.Send_CardReaderType(aNodeNo: integer;
  aEcuID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stCardReaderType : string;
begin
  Try
    stSql := ' Select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' Where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

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
      if recordcount < 1 then Exit;
      First;

      if isDigit(FindField('AC_CARDREADERTYPE').AsString) then stCardReaderType := FindField('AC_CARDREADERTYPE').AsString
      else stCardReaderType := '0';

      Registration_CardReaderType(aNodeNo,aEcuID,stCardReaderType);

    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.Send_DoorSetting(aNodeNo: integer; aEcuID,
  aDoorNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stDoorControlTime : string;
  stOpenMoni : string;
  stSchUse : string;
  stSendDoor : string;
  stAlarmLong : string;
  stLockType : string;
  stControlFire : string;
  stDSOpenState : string;
  stRemoteDoorOpen : string;
begin
  Try
    stSql := ' Select * from TB_DOOR ';
    stSql := stSql + ' Where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo[1] + ''' ';

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
      if recordcount < 1 then Exit;
      First;
      if FindField('DO_CONTROLTIME').IsNull then stDoorControlTime := '5'
      else stDoorControlTime := FindField('DO_CONTROLTIME').AsString;
      if isDigit(FindField('DO_OPENMONI').AsString) then stOpenMoni := FindField('DO_OPENMONI').AsString
      else stOpenMoni := '0';
      if isDigit(FindField('DO_SCHUSE').AsString) then stSchUse := FindField('DO_SCHUSE').AsString
      else stSchUse := '0';
      if isDigit(FindField('DO_SENDDOOR').AsString) then stSendDoor := FindField('DO_SENDDOOR').AsString
      else stSendDoor := '0';
      if isDigit(FindField('DO_ALARMLONG').AsString) then stAlarmLong := FindField('DO_ALARMLONG').AsString
      else stAlarmLong := '0';
      if FindField('DO_DOORTYPE').IsNull then stLockType := '1'
      else stLockType := FindField('DO_DOORTYPE').AsString;
      if isDigit(FindField('DO_FIRE').AsString) then stControlFire := FindField('DO_FIRE').AsString
      else stControlFire := '0';
      if isDigit(FindField('DO_DSOPEN').AsString) then stDSOpenState := FindField('DO_DSOPEN').AsString
      else stDSOpenState := '1';
      if isDigit(FindField('DO_REMOTEDOOR').AsString) then stRemoteDoorOpen := FindField('DO_REMOTEDOOR').AsString
      else stRemoteDoorOpen := '1';


      result := Registration_DoorLockInfo(aNodeNo,aEcuID,aDoorNo,
                '0',      // ī�� ���� (0:Positive, 1:Negative)
                '0',      // ���Թ� ���� (0:�, 1:����)
                stDoorControlTime[1],           // Door ����ð�
                stOpenMoni[1],           // ��ð� ���� �溸
                stSchUse[1],            // ������ ���� ���� (0:������, 1:���)
                stSendDoor[1],    // ���Թ� ���� ����(0:������, 1:���)
                stAlarmLong[1],     // ��ð� ���� ���� ���(0:������, 1:���)
                stLockType[1],          // ������ Ÿ��
                stControlFire[1],  // ȭ�� �߻��� ������
                stDSOpenState[1],  //���Թ��������� (DS OPEN 0x30,DS CLOSE 0x31)
                stRemoteDoorOpen[1]);

    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Send_UseEcuCount(aNodeNo: integer): Boolean;
var
  stEcuList : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
//                       1         2         3         4         5
//              12345678901234567890123456789012345678901234567890
  stEcuList := '10000000000000000000000000000000000000000000000000'+
               '00000000000000000000000000000000000000000000000000';
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
  stSql := stSql + ' Order by AC_ECUID ';

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
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        if isDigit(FindField('AC_ECUID').AsString) then
        begin
          stEcuList[strtoint(FindField('AC_ECUID').AsString) + 1] := '1';
        end;
        Next;
      end;
    end;
    result := Registration_UsedDevice(aNodeNo,stEcuList);

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.Send_JaejungDelay(aNodeNo: integer; aEcuID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stJaejung : string;
begin
  Try
    stSql := ' Select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' Where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

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
      if recordcount < 1 then Exit;
      First;
      stJaejung := FindField('AC_JAEJUNG').AsString;


      result := Registration_JaejungDelayUse(aNodeNo,aEcuID,stJaejung);

    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Send_McuID(aNodeNo: integer): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stMCUID : string;
begin
  Try
    stSql := ' Select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' Where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''00'' ';

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
      if recordcount < 1 then Exit;
      First;
      stMCUID := FindField('AC_MCUID').AsString;
      if stMCUID = '' then stMCUID := '0000000';


      result := Registration_ControllerID(aNodeNo,stMCUID);

    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Send_PortSetting(aNodeNo: integer; aEcuID,
  aPortNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stWatchType : string;
  stZoneDelay : string;
  stPortRecovery : string;
begin
  Try
    stSql := ' Select * from TB_ZONEDEVICE ';
    stSql := stSql + ' Where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND AL_ZONENUM = ''' + aPortNo + ''' ';

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
      if recordcount < 1 then Exit;
      First;
      if isDigit(FindField('AL_WATCHTYPE').AsString) then stWatchType := FindField('AL_WATCHTYPE').AsString
      else stWatchType := '0';
      if isDigit(FindField('AL_DELAYUSE').AsString) then stZoneDelay := FindField('AL_DELAYUSE').AsString
      else stZoneDelay := '0';
      if isDigit(FindField('AL_PORTRECOVERY').AsString) then stPortRecovery := FindField('AL_PORTRECOVERY').AsString
      else stPortRecovery := '0';

      result := Registration_Port(aNodeNo,aEcuID,       // ����ȣ
              aPortNo,               // ��Ʈ��ȣ
              stWatchType,      // ��������
              stZoneDelay,       // �����ð�
              stPortRecovery,      // �����������
              '4',     // �����ð�
              '');

    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Send_SystemInfo(aNodeNo: integer; aEcuID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stPowerType : string;
  stOutDelay : string;
  stInDelay : string;
  stDoor1Type : string;
  stDoor2Type : string;
begin
  Try
    stSql := ' Select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' Where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

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
      if recordcount < 1 then Exit;
      First;
      if isDigit(FindField('AC_POWERTYPE').AsString) then stPowerType := FindField('AC_POWERTYPE').AsString
      else stPowerType := '0';
      if Not FindField('AC_OUTDELAY').IsNull then stOutDelay := inttostr(FindField('AC_OUTDELAY').AsInteger)
      else stOutDelay := '0';
      if Not FindField('AC_INDELAY').IsNull then stInDelay := inttostr(FindField('AC_INDELAY').AsInteger)
      else stInDelay := '0';
      if isDigit(FindField('AC_DOOR1TYPE').AsString) then stDoor1Type := FindField('AC_DOOR1TYPE').AsString
      else stDoor1Type := '2';
      if isDigit(FindField('AC_DOOR2TYPE').AsString) then stDoor2Type := FindField('AC_DOOR2TYPE').AsString
      else stDoor1Type := '2';

      result := Registration_SystemInfo(aNodeNo,aEcuID,stPowerType,stOutDelay,stInDelay,stDoor1Type,stDoor2Type);

    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Send_TelecopID(aNodeNo: integer): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stLinkusID : string;
begin
  Try
    stSql := ' Select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' Where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''00'' ';

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
      if recordcount < 1 then Exit;
      First;
      stLinkusID := FindField('AC_LINKUSID').AsString;

      result := Registration_LinkusID(aNodeNo,stLinkusID);

    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Send_TelecopTelNumber(aNodeNo: integer;
  aNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stLinkusTelNumber : string;
begin
  Try
    stSql := ' Select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' Where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''00'' ';

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
      if recordcount < 1 then Exit;
      First;
      stLinkusTelNumber := FindField('AC_LINKUSTELNO').AsString;

      result := Registration_LinkusTelNumber(aNodeNo,stLinkusTelNumber);

    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Send_EcuType(aNodeNo: integer): Boolean;
var
  stEcuType : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
//                       1         2         3         4         5
//              12345678901234567890123456789012345678901234567890
  stEcuType := '10000000000000000000000000000000000000000000000000'+
               '00000000000000000000000000000000000000000000000000';
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
  stSql := stSql + ' Order by AC_ECUID ';

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
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        if isDigit(FindField('AC_ECUID').AsString) then
        begin
          stEcuType[strtoint(FindField('AC_ECUID').AsString)+1] := FindField('ac_devicetype').AsString[1];
        end;
        Next;
      end;
    end;
    result := Registration_DeviceType(aNodeNo,stEcuType);

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.Send_TelecopTelCount(aNodeNo: integer): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stLinkusArmRing : string;
  stLinkusDisArmRing : string;
begin
  Try
    stSql := ' Select * from TB_ACCESSDEVICE ';
    stSql := stSql + ' Where AC_NODENO = ' + inttostr(aNodeNo) + ' ';
    stSql := stSql + ' AND AC_ECUID = ''00'' ';

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
      if recordcount < 1 then Exit;
      First;
      stLinkusArmRing := inttostr(FindField('AC_ARMRING').AsInteger);
      stLinkusDisArmRing := inttostr(FindField('AC_DISARMRING').AsInteger);

      result := Registration_RingCount(aNodeNo,stLinkusArmRing,stLinkusDisArmRing);

    end;

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Registration_CardReaderInfo(aNodeNo: integer; aEcuID,
  aCardReaderNo, aReaderUse, aReaderDoor, aDoorPosi,
  aBuildPosi: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stLocate : string;
  stCheckData : string;
  nTemp : integer;
begin
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+aEcuID);
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + aEcuID + 'CARDREADERSETTINGINFO' + aCardReaderNo;
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);

    stLocate := '';

    stData := 'CD' +                                      //COMMAND
      FillZeroNumber(strtoint(aCardReaderNo), 2) +                        //���� ��ȣ
      aReaderUse[1] +                                //���� ��� ����
      aDoorPosi[1] +                         //���� ��ġ
      aReaderDoor[1] +                               //Door No
      '00' +                                                //����ȣ
      SetlengthStr(stLocate, 16) +                              //��ġ��
      aBuildPosi[1];                      //�ǹ���ġ��ġ

      Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

      result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;

function TfmMain.Check_STRRespose(aCheckData: string;aDelay:integer): Boolean;
var
  FirstTickCount : double;
begin
  result := True;
  FirstTickCount := GetTickCount + aDelay;
  While STRSendList.IndexOf(aCheckData) > -1 do
  begin
    if G_bApplicationTerminate then Exit;
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then
    begin
      result := False; //TimeOut;
      Break;
    end;
  end;
end;

procedure TfmMain.Process_STRReceive(aCheckData: string);
var
  nTemp : integer;
begin
  nTemp := STRSendList.IndexOf(aCheckData);
  if nTemp > -1 then STRSendList.Delete(nTemp);
end;


function TfmMain.UpdateTB_READER_Info(aNodeNo, aEcuID,aReaderNo, aReaderUse,
  aDoorPosi, aDoorNo, aBuildPosi, aSendAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_READER Set ';
  stSql := stSql + ' RE_USE = ''' + aReaderUse[1] + ''', ';
  stSql := stSql + ' DOOR_POSI = ''' + aDoorPosi[1] + ''', ';
  stSql := stSql + ' DO_DOORNO = ''' + aDoorNo[1] + ''', ';
  stSql := stSql + ' BUILD_POSI = ''' + aBuildPosi[1] + ''', ';
  stSql := stSql + ' SEND_ACK = ''' + aSendAck[1] + '''  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stsql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Registration_CardReaderType(aNodeNo: integer; aEcuID,
  aCardReaderType: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stLocate : string;
  stCheckData : string;
  nTemp : integer;
begin
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+aEcuID);
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + aEcuID + 'CARDREADERTYPEINFO';
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);

    if Length(aCardReaderType) < 9 then
      stData := 'Ct00' + aCardReaderType[1]
    else stData := 'Ct00' + copy(aCardReaderType,1,9);                               //ī�帮�� Ÿ�� ���

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;

function TfmMain.GetDoorTime(aDoorControlTime: char): string;
var
  nDoorControlTime : integer;
  nOrd : integer;
  nMsec : integer;
begin
  if aDoorControlTime >= #$30 then
  begin
   if aDoorControlTime < #$40 then  result := aDoorControlTime
   else
   begin
      if (aDoorControlTime >= 'A') and (aDoorControlTime <= 'Z') then  nDoorControlTime := Ord(aDoorControlTime) - Ord('A')
      else nDoorControlTime := Ord(aDoorControlTime) - Ord('a') + 26;
      nDoorControlTime := nDoorControlTime * 5;
      result := inttostr( 10 + nDoorControlTime );
   end;
  end else
  begin
    nOrd := Ord(aDoorControlTime);
    nMsec := (nOrd - $20) * 100;
    result := inttostr(nMsec) + 'ms';
  end;

end;

function TfmMain.Registration_DoorLockInfo(aNodeNo:integer; aEcuID, aDoorNo, aCardMode,
  aDoorMode, aDoorControlTime, aOpenMoni, aSchUse, aSendDoor, aAlarmLong,
  aLockType, aControlFire, aDSOpenState, aRemoteDoorOpen: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stLocate : string;
  stCheckData : string;
  nTemp : integer;
begin
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+aEcuID);
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + aEcuID + 'DOORSETTINGINFO' + aDoorNo[1];
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);

    stData := 'G' +                       //MSG Code  'A' : ���� �κб��� ����, 'G' ���� �κ� ����
      '0' +                              //Msg Count(����)
      aDoorNo[1] +                //����ȣ
      #$20 + #$20 +                      // Record count
      aCardMode[1] +              //ī�����
      aDoorMode[1] +              //���Թ� ����
      aDoorControlTime[1] +          //Door���� �ð�
      aOpenMoni[1] +          //��ð� ���� �溸
      aSchUse[1] +           //������ ��������
      aSendDoor[1] +         //���Թ���������
      '0' +                              //����̻�� ���(������:����)
      '0' +                              //AntiPassBack(������:����)
      aAlarmLong[1] +          //��ð� ���� �������
      '0' +                              //��� �̻�� ���� ��� (������:����)
      aLockType[1] +              //������ Ÿ��
      aControlFire[1] +         //ȭ�� �߻��� ������
      '0' +                              //DS LS �˻�(������:����)
      aDSOpenState[1] +           //���Թ��������� (DS OPEN 0x30,DS CLOSE 0x31)
      aRemoteDoorOpen[1] +  //���������� (DoorOpen 0x30,DoorClose 0x31)
      '00000';                           //����

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('c',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;

function TfmMain.updateTB_DOOR_Info(aNodeNo, aEcuID, aDoorNo, aDoorType,
  aControlTime, aSchUse, aFire, aOpenMoni, aSendDoor, aAlarmLong, aDsOpen,
  aRemoteDoor, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  if Not IsDigit(aDoorNo) then Exit;

  stSql := ' Update TB_DOOR set ';
  stSql := stSql + ' DO_DOORTYPE = ''' + aDoorType + ''',';
  stSql := stSql + ' DO_CONTROLTIME = ''' + aControlTime + ''',';
  stSql := stSql + ' DO_SCHUSE = ''' + aSchUse + ''',';
  stSql := stSql + ' DO_FIRE = ''' + aFire + ''',';
  stSql := stSql + ' DO_OPENMONI = ''' + aOpenMoni + ''',';
  stSql := stSql + ' DO_SENDDOOR = ''' + aSendDoor + ''',';
  stSql := stSql + ' DO_ALARMLONG = ''' + aAlarmLong + ''',';
  stSql := stSql + ' DO_DSOPEN = ''' + aDsOpen + ''',';
  stSql := stSql + ' DO_REMOTEDOOR = ''' + aRemoteDoor + ''',';
  stSql := stSql + ' SEND_ACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + inttostr(strtoint(aDoorNo)) + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.Registration_UsedDevice(aNodeNo: integer;
  aEcuList: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stCheckData : string;
  nTemp : integer;
begin
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+'00');
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + '00' + 'ECUCOUNT';
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);

    stData := 'EX00' + aEcuList;

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;

function TfmMain.Registration_DeviceType(aNodeNo: integer;
  aEcuType: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stCheckData : string;
  nTemp : integer;
begin
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+'00');
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + '00' + 'ECUTYPE';
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);

    stData := 'EX02' + aEcuType;

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;

function TfmMain.Registration_JaejungDelayUse(aNodeNo: integer; aEcuID,
  aJaeJung: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stCheckData : string;
  nTemp : integer;
begin
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+ aEcuID );
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + aEcuID + 'JAEJUNGINFO';
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);

    stData := 'sy00';
    if aJaejung = 'Y' then stData := stData + '1'
    else stData := stData + '0';

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;

end;

procedure TfmMain.Receive_RegJaejungDelayUse(aNodeNO, aECUID, aJaejung: String);
var
  stReceiveCheckData : string;
  stJaejung : string;
begin
  stReceiveCheckData := 'JAEJUNGINFO';
  Process_STRReceive(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + stReceiveCheckData);
  dmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,stReceiveCheckData,'Y');

  if aJaejung = '1' then stJaejung := 'Y'
  else stJaejung := 'N';

  dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(aNodeNO,aEcuID,'AC_JAEJUNG',stJaejung);

end;

function TfmMain.Registration_ControllerID(aNodeNo: integer;
  aMCUID: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stCheckData : string;
  nTemp : integer;
begin
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+ '00' );
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + '00' + 'MCUID';
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);

    stData := 'ID00' + aMcuid;

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;


function TfmMain.Registration_Port(aNodeNo: integer; aEcuID, aPortNo, aWatchType,
  aZoneDelay, aPortRecovery, aWhatchTime, aLocate: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stCheckData : string;
  stStatusCode : string;
  nTemp : integer;
begin
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+ aEcuID );
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + aEcuID + 'PROTSETTINGINFO' + aPortNo;
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);

    stStatusCode := 'S' + aPortNo;
    if aWatchType = '1' then stStatuscode := 'FI'
    else if aWatchType = '2' then stStatuscode := 'G1'
    else if aWatchType = '3' then stStatuscode := 'E1'
    else if aWatchType = '4' then stStatuscode := 'Q1'
    else if aWatchType = '5' then stStatuscode := 'CL';


    stData := 'LP' +                              //COMMAND
      FillZeroNumber(strtoint(aPortNo), 2) +                               //��Ʈ��ȣ
      stStatuscode +                                     //�����ڵ�('SS' ����)
      aWatchType[1] +                     //��������
      '0' +                                      //�˶��߻� ���(����)
      aPortRecovery[1] +                                //������ȣ����(����)
      aZoneDelay[1] +                      //�����ð� �������
      '00' +                                     //����
      '00' +                                     //���̷�
      '00' +                                     //������1
      '00' +                                     //������2
      '00' +                                     //���Թ�����1
      '00' +                                     //���Թ�����2
      '00' +                                     //���η���
      '00' +                                     //���ν��̷�
      '00' +                                     //���θ�����1
      '00' +                                     //���θ�����2
      '00' +                                     //����ȣ
      SetLengthStr(aLocate, 16) +                   //��ġ��
      FillZeroNumber(strtoint(aWhatchTime), 2) +           //�����ð�
      '00';                                      //������

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;

function TfmMain.UpdateTB_ZONEDEVICE_Info(aNodeNo, aEcuID, aPortNo,
  aAlarmType, aRecoverType, aDelayUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_ZONEDEVICE set ';
  stSql := stSql + ' AL_WATCHTYPE = ''' + aAlarmType + ''', ';
  stSql := stSql + ' AL_DELAYUSE = ''' + aDelayUse + ''', ';
  stSql := stSql + ' AL_PORTRECOVERY = ''' + aRecoverType + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aPortNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.Registration_SystemInfo(aNodeNo: integer; aEcuID, aPowerType,
  aOutDelay, aInDelay, aDoor1Type, aDoor2Type: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stCheckData : string;
  nTemp : integer;
begin
  result := False;
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+ aEcuID );
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + aEcuID + 'SYSTEMINFO';
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);


    stData := 'SY00' +                                   // COMMAND
      aPowerType +                         // �������ÿ���
      FillZeroNumber(strtoint(aOutDelay), 3) +                     // ��������ð�
      '2' +                                             // ����
      aDoor1Type +                             // Door1
      aDoor2Type +                             //Door2
      SetlengthStr(' ', 16) +                           // ��ġ��
      FillZeroNumber(strtoint(aInDelay), 3) +                      // �Խ������ð�
      '1';                                              // ���� ��� ���(����)

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;

function TfmMain.Registration_LinkusID(aNodeNo: integer;
  aLinkusID: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stCheckData : string;
  nTemp : integer;
  nID : integer;
  stID : string;
begin
  result := False;
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+ '00' );
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + '00' + 'TELECOPID';
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);


    if aLinkusID <> 'AAAA' then
    begin
      if not isdigit(aLinkusId) then Exit;
      nID := StrToInt(aLinkusId);
      stID := Dec2Hex(nID, 4);
    end else stID := 'AAAA';

    stData := 'Id00' + stID;

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;


function TfmMain.Registration_RingCount(aNodeNo: integer; aLinkusArmRing,
  aLinkusDisArmRing: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stCheckData : string;
  nTemp : integer;
begin
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+ '00' );
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + '00' + 'TELECOPTELCOUNT';
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);

    stData := 'Rc00' + FillZeroNumber(strtoint(aLinkusArmRing), 2) + FillZeroNumber(strtoint(aLinkusDisArmRing),2);

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;

procedure TfmMain.Receive_RegRingCount(aNodeNO, aECUID, aData: string);
var
  stReceiveCheckData : string;
  stArmRingCount : string;
  stDisArmRingCount : string;
begin
  stReceiveCheckData := 'TELECOPTELCOUNT';
  Process_STRReceive(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + stReceiveCheckData);
  dmDBFunction.UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,stReceiveCheckData,'Y');

  stArmRingCount := copy(aData,1,2);
  stDisArmRingCount := copy(aData,3,2);

  dmDBFunction.UpdateTB_ACCESSDEVICE_Field_IntValue(aNodeNo,aEcuID,'AC_ARMRING',stArmRingCount);
  dmDBFunction.UpdateTB_ACCESSDEVICE_Field_IntValue(aNodeNo,aEcuID,'AC_DISARMRING',stDisArmRingCount);

end;

function TfmMain.Registration_LinkusTelNumber(aNodeNo: integer;
  aLinkusTelNumber: string): Boolean;
var
  nDeviceIndex : integer;
  stData : string;
  stCheckData : string;
  nTemp : integer;
begin
  nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(aNodeNo,3)+ '00' );
  if nDeviceIndex < 0 then Exit;

  Try
    stCheckData := FillZeroNumber(aNodeNo,3) + '00' + 'TELECOPTELNUM1';
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp < 0 then STRSendList.Add(stCheckData);

    stData := 'Tn0000' + SetlengthStr(aLinkusTelNumber, 20);

    Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stData,False);

    result := Check_STRRespose(stCheckData,DelayTime);
  Finally
    nTemp := STRSendList.IndexOf(stCheckData);
    if nTemp > -1 then STRSendList.Delete(nTemp);
  End;
end;


procedure TfmMain.FireStateChange(Sender: TObject; NodeNo: integer; aEcuID,
  aDoorNo: string; aFireState: Boolean);
var
  stClientSendData : string;
  stFire : string;
begin
  if aFireState then stFire := 'F'
  else stFire := 'N';

  stClientSendData := 'R' +
                      'D' +
                      FillZeroNumber(NodeNo,3) +
                      aEcuID +
                      FillZeroNumber(strtoint(aDoorNo),2) +  //
                      '00' +
                      'DV' +
                      'F' +
                      FillZeroNumber(Length(stFire),3) +
                      stFire;
  SendClientData(stClientSendData);

end;



procedure TfmMain.CaseNodeStateAllCheckSend(AThread: TIdPeerThread);
var
  i : integer;
  stClientSendData : string;
begin
  for i:= 0 to ComNodeList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
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

end;

procedure TfmMain.CaseDeviceStateAllCheckSend(AThread: TIdPeerThread);
var
  i : integer;
  stClientSendData : string;
begin
  for i:=0 to DeviceList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
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

end;

procedure TfmMain.Process_DeviceAllState_III_CheckSend;
var
  i,j : integer;
  stClientSendData : string;

  stDeviceConnect : string;
  stWatchMode : string;
  stDoorManager1 : string;
  stDoorManager2 : string;
  stDoorPNmode1 : string;
  stDoorPNmode2 : string;
  stDoorOpenState1 : string;
  stDoorOpenState2 : string;
  stDoorLockState1 : string;
  stDoorLockState2 : string;
  stDoorFireState1 : string;
  stDoorFireState2 : string;
  stRealData : string;
  tlNodeStateList : TStringList;
  lsLockState : TNodeLockState;
  nIndex : integer;

  stPacket : string;
begin
  if L_bProcessStateCheckIII then Exit;
  L_bProcessStateCheckIII := True;
  Try
    StatusBar1.Panels[6].Text := 'DeviceAllState_III';
    tlNodeStateList := TStringList.Create;

    for i:=0 to DeviceList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      if TDevice(DeviceList.Objects[i]).Connected then stDeviceConnect := '01'
      else stDeviceConnect := '00';
      case TDevice(DeviceList.Objects[i]).GetArmAreaState(0) of
          cmNothing : begin stWatchMode := '0000' end;
          cmArm     : begin stWatchMode := '0001' end;
          cmDisarm  : begin stWatchMode := '0010' end;
          cmPatrol  : begin stWatchMode := '0011' end;
          cmInit    : begin stWatchMode := '0100' end;
          cmTest    : begin stWatchMode := '0101' end;
          cmJaejung : begin stWatchMode := '0110'  end;
          else  begin stWatchMode := '0000' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorManageMode(1) of
        dmNothing : begin stDoorManager1 := '000' end;
        dmManager : begin stDoorManager1 := '001' end;
        dmOpen    : begin stDoorManager1 := '010' end;
        dmLock    : begin stDoorManager1 := '011' end;
        dmMaster  : begin stDoorManager1 := '100' end;
        else begin stDoorManager1 := '000' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorManageMode(2) of
        dmNothing : begin stDoorManager2 := '000' end;
        dmManager : begin stDoorManager2 := '001' end;
        dmOpen    : begin stDoorManager2 := '010' end;
        dmLock    : begin stDoorManager2 := '011' end;
        dmMaster  : begin stDoorManager2 := '100' end;
        else begin stDoorManager2 := '000' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorPNMode(1) of
        pnNothing  : begin stDoorPNmode1 := '00' end;
        pnPositive : begin stDoorPNmode1 := '01' end;
        pnNegative : begin stDoorPNmode1 := '10' end;
        else begin stDoorPNmode1 := '00' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorPNMode(2) of
        pnNothing  : begin stDoorPNmode2 := '00' end;
        pnPositive : begin stDoorPNmode2 := '01' end;
        pnNegative : begin stDoorPNmode2 := '10' end;
        else begin stDoorPNmode2 := '00' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorState(1) of
        dsNothing : begin stDoorOpenState1 := '000' end;
        dsClose   : begin stDoorOpenState1 := '001' end;
        dsOpen    : begin stDoorOpenState1 := '010' end;
        dsLongTime: begin stDoorOpenState1 := '011' end;
        dsOpenErr : begin stDoorOpenState1 := '100' end;
        dsCloseErr: begin stDoorOpenState1 := '101' end;
        else begin stDoorOpenState1 := '000' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorState(2) of
        dsNothing : begin stDoorOpenState2 := '000' end;
        dsClose   : begin stDoorOpenState2 := '001' end;
        dsOpen    : begin stDoorOpenState2 := '010' end;
        dsLongTime: begin stDoorOpenState2 := '011' end;
        dsOpenErr : begin stDoorOpenState2 := '100' end;
        dsCloseErr: begin stDoorOpenState2 := '101' end;
        else begin stDoorOpenState2 := '000' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorLockMode(1) of
        lsNothing : begin stDoorLockState1 := '00' end;
        lsClose   : begin stDoorLockState1 := '01' end;
        lsOpen    : begin stDoorLockState1 := '10' end;
        else begin stDoorLockState1 := '00' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorLockMode(2) of
        lsNothing : begin stDoorLockState2 := '00' end;
        lsClose   : begin stDoorLockState2 := '01' end;
        lsOpen    : begin stDoorLockState2 := '10' end;
        else begin stDoorLockState2 := '00' end;
      end;
      if TDevice(DeviceList.Objects[i]).GetDoorFire(1) then stDoorFireState1 := '1'
      else stDoorFireState1 := '0';
      if TDevice(DeviceList.Objects[i]).GetDoorFire(2) then stDoorFireState2 := '1'
      else stDoorFireState2 := '0';

      stRealData := stDeviceConnect +     //'01'
                    stWatchMode +         //'0000'
                    stDoorManager1 +      //'000'
                    stDoorManager2 +      //'000'
                    stDoorPNmode1 +       //'00'
                    stDoorPNmode2 +       //'00'
                    stDoorOpenState1 +    //'000'
                    stDoorOpenState2 +    //'000'
                    stDoorLockState1 +    //'00'
                    stDoorLockState2 +    //'00'
                    stDoorFireState1 +    //'0'
                    stDoorFireState2;     //'0'
      nIndex := tlNodeStateList.IndexOf(FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3));
      if nIndex < 0 then
      begin
        lsLockState := TNodeLockState.Create(self);
        lsLockState.EcuStateAdd(TDevice(DeviceList.Objects[i]).ECUID,stRealData);
        tlNodeStateList.AddObject(FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3),lsLockState);
      end else
      begin
        TNodeLockState(tlNodeStateList.Objects[nIndex]).EcuStateAdd(TDevice(DeviceList.Objects[i]).ECUID,stRealData);
      end;
      //tlNodeStateList.AddObject(FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3),object(stRealData));
      Application.ProcessMessages;
    end;
    
    for i := 0 to tlNodeStateList.Count - 1 do
    begin
      stPacket := '';
      for j:=0 to MAXECUCOUNT do
      begin
        if G_nMonitorSockType = 0 then
          stPacket := stPacket + TNodeLockState(tlNodeStateList.Objects[i]).GetEcuASCIIState(j)
        else stPacket := stPacket + TNodeLockState(tlNodeStateList.Objects[i]).GetEcuHexState(j);
        //stPacket := stPacket + TNodeLockState(tlNodeStateList.Objects[i]).GetEcuBinaryState(j);
        Application.ProcessMessages;
      end;
      stClientSendData := 'R' +
                          'S' +   //Server ����
                          tlNodeStateList.Strings[i] +
                          '00' +  //ECUID
                          '00' +
                          '00' +
                          'SV' +
                          'N' +
                          FillZeroNumber(Length(stPacket),3) +
                          stPacket;
      SendClientData(stClientSendData);
      if Not L_bSendClientSequence then ATSendClientData(self,stClientSendData,0);
      SendSettingData(stClientSendData);
      Application.ProcessMessages;
    end;

    if tlNodeStateList.Count > 0 then
    begin
      for i := tlNodeStateList.Count - 1 downto 0 do
        TNodeLockState(tlNodeStateList.Objects[i]).Free;
    end;
    tlNodeStateList.Clear;
    tlNodeStateList.Free;
  Finally
    L_bProcessStateCheckIII := False;
    StatusBar1.Panels[6].Text := 'END';
  End;
end;

procedure TfmMain.Process_DeviceAllState_III_MemorySave;
begin
  Try
    FStateCheckTCS.Enter;
    if StateCheckList.IndexOf('DEVICEALLSTATE_III') < 0 then
        StateCheckList.Add('DEVICEALLSTATE_III');
  Finally
    FStateCheckTCS.Leave;
  End;

end;


procedure TfmMain.Button1Click(Sender: TObject);
begin
  inherited;
  showmessage(inttostr(DeviceConnectList.Count));
//  Application.MessageBox(PChar('�ش�MCU�� �⺻ �׸����� ���Թ��� ����Ͻðڽ��ϱ�?'),'����',MB_OKCANCEL);
//  Registration_DeviceTimeSync('');
  //
end;

procedure TfmMain.MemoryInitialize;
var
  i : integer;
begin
    L_bAllDoorOpen := False;
    L_bCardDownLoad:= False; //ī�� �ٿ�ε� ����
    L_bClose := False;          //���� �޴� Ŭ����
    L_bDaemonStart := False;    //������ Start �� ����
    L_bDaemonStop := False;     //���� ����
    L_bDaemonRestart := False;  //���� �������
    L_bDataBaseBackup := False; //DataBase Backup
    L_bFireAllOpen := False; //ȭ��� ��ü��������
    L_bFierDoorOpen := False;   //ȭ��߻��� ���� ���Թ� ����
    L_bFireRecoverUse := False; //ȭ����ü���� �������
    L_bFormActive := False;     //Form �� Active �� ���¿����� �����ϴ� ��ƾ�� �ִ� ��� ���
    L_bFTPSendProcess := False;  //FTP �ٿ�ε� ���ΰ��
    L_bFtpSendCheck := False;    //FTP �ٿ�ε� ������ üũ
    L_bHolidayChange := False;
    L_bLogined := True;
    L_bNotDeviceStateCheck := False;
    L_bProcessStateCheckII := False;  //����Ȯ�� II ��...
    L_bProcessStateCheckIII := False; //����Ȯ�� III ��...
    L_bProcessStateCheckIV := False; //����Ȯ�� IV ��...
    L_bRelaySentenceUse:= False;//���������������
    L_bRelaySCardNoUse:= False; //ī���ȣ��������
    L_bRelaySCardStateUse:= False; //ī����¿�������
    L_bRelaySChangeStateUse:= False; //������¿�������
    L_bRelaySCompanyCodeUse:= False; //ȸ���ڵ忬������
    L_bRelaySEmpNameUse:= False; //�����Ī��������
    L_bRelaySEmpNoUse:= False; //�����ȣ��������
    L_bRelaySentenceSendResult := False; //�����۽��� ���
    L_bRelaySSerialUse:= False; //�Ϸù�ȣ��������
    L_bSendDeviceInfo := False;  //Device Info �۽� ��...
    L_bShowCardServerState := False; //ī�弭�� �ۼ��� ��Ȳ��ȸ ����
    L_bShowCurrentState := False;  //�ǽð� �ۼ��� ��Ȳ��ȸ ����
    L_bShowDeviceSetting := False;  //��⼳�� ȭ��
    L_bShowReaderSetting := False;  //���� ���� ȭ��
    L_bSTRDataSending := False;     //ServerToRegist

    L_nCardAckCount  := 0;  //ī�� ���� �Ǽ�
    L_nCardSendCount  := 0; //ī�� �۽� �Ǽ�
    L_nDataBaseBackupCycle  := 10; //��� ����Ŭ
    L_nDaemonAccecptClientCount  := 5;    //���󼭹��� ������ �� �ִ� Ŭ���̾�Ʈ ����(�̻��)
    L_nDeviceServerPort1  := 3000;           //��⺰ ������Ʈ 1
    L_nDeviceServerPort2  := 3001;           //��⺰ ������Ʈ 2
    L_nDeviceServerPort3 := 3002;           //��⺰ ������Ʈ 3
    L_nEventdeleteAccessDay  := 180;     //���� �̺�Ʈ ������ �����ϼ�
    L_nEventdeleteAttendDay  := 180;     //���� �̺�Ʈ ������ �����ϼ�
    L_nEventdeleteDaemonLogDay  := 30; //�α� ������ ������ �����͸� ����������
    L_nEventdeleteFoodDay := 180;       //�ļ� �̺�Ʈ ������ �����ϼ�
    L_nEventdeletePatrolDay  := 180;    //��� �̺�Ʈ ������ �����ϼ�
    L_nThreadRestartCount := 15;

    L_stAttendServerPort := '51003';            //���¼��� Port
    L_stClientComBuff := '';
    L_stCONTROLPort := '51004';             //������Ʈ
    L_stDaemonLogFullData := '';            //ACK ������ ���� �α� ���������(�̻��)
    L_stDaemonServerIP :='127.0.0.1';       //���󼭹� IP
    L_stDaemonServerPort :='50101';         //���󼭹� Port
    L_stDataBaseAutoBackup := 'TRUE';       //�ڵ���� �������
    L_stDataBaseBackupDir := 'c:\Backup';   //��� ���丮
    L_stDataBaseBackupTime := '0100';       //��� ���� �ð�
    L_stDataBaseLastBackupDate := '';       //������ ��� �ð�
    L_stDeviceSortDate := '0100';           //��� ��Ʈ ���� �ð�
    L_stEventPort := '51005';               //�̺�Ʈ��Ʈ(������)
    L_stFireStatus := 'FI';                 //ȭ�簨�����°�
    L_stFoodServerPort :='51006';           //�ļ�������Ʈ
    L_stFTPServerPort := '51007';           //FTP���� ��Ʈ
    L_stLogDirectory := 'c:\log';                 //�α� ����� ��� �α� ���丮
    L_stRelayDelimiter:=',';               //���������õ����ͱ�����
    L_stRelaySentenceSendData:=''; //���������� �۽ŵ�����
    L_stRelaySentenceServerIP:='127.0.0.1';//���� ���� IP
    L_stRelaySentenceServerPort:='51008';//���� ���� Port;
    L_stSendHolidayYear :='0000';      //Holiday Send Year
    L_stStatePort :='51009';                    //���� ��Ʈ(������)

    G_nProcessCount := 0;
    for i := 0 to NODECOUNT do
    begin
      L_arrayNodeState[i] := 0;
    end;
end;

procedure TfmMain.StringListCreate;
begin
  AccessEventList := TStringList.Create;
  AlarmEventList := TStringList.Create;
  AlarmModeNotCardList := TStringList.Create;  //ī�嵥���� �ƴ� ����Ʈ
  AntiGroupList := TstringList.create;
  ATEventList := TStringList.Create;
  ArmAreaRelayModeList := TStringList.Create;  //������� ��� ����Ʈ
  CardEmployeeInfoList := TStringList.Create;
  ClientReceiveDataList := TStringList.Create;
  ClientSendList := TStringList.Create;  //Ŭ���̾�Ʈ�� ���� �۽� ����Ʈ
  ComNodeList := TStringList.Create;
  ConnectDeviceList := TStringList.Create;
  DeviceList := TStringList.Create;
  FireBreakGubunList := TStringList.Create;
  FireDoorOpenList := TStringList.Create; //ȭ��� ������ ��� ����Ʈ
  FoodConfigCodeList := TStringList.Create; //�ļ� �ڵ� ����Ʈ
  FoodConfigStartList := TStringList.Create; // �ļ��ڵ� ���۽ð�
  FoodConfigEndList := TStringList.Create;  //�ļ��ڵ� ���� �ð�
  FoodEventList := TStringList.Create;
  FoodServerEmployeeList := TStringList.Create;
  HolidaySendDeviceList := TStringList.Create;   //������ ���� ��⸮��Ʈ
  InOutCountList := TStringList.Create; //����� ī��Ʈ -1(���) 1(�Խ�) 0(������)
  InOutCardReaderList := TStringList.Create; //����� ī��Ʈ ��� 000(����ȣ)00(ECUID)0(ReaderNo)
  InOutGroupReaderList := TStringList.Create;
  RelayControlDoorList := TStringList.Create;
  NodeStateList := TStringList.Create;
  StateCheckList := TStringList.Create;
  STRSendList := TStringList.Create;       //STRTimer �� ���� ������ ����
  WorkTypeList := TStringList.Create;
  ZoneDetectList := TStringList.Create;        //������ ���� �ڵ�
  InnoNixAlarmEventList := TStringList.Create; 
end;

procedure TfmMain.StringListFree;
begin
  AccessEventList.free;
  AlarmEventList.free;
  AlarmModeNotCardList.free;  //ī�嵥���� �ƴ� ����Ʈ
  AntiGroupList.free;
  ATEventList.free;
  ArmAreaRelayModeList.Free;  //������� ��� ����Ʈ
  CardEmployeeInfoList.free;
  ClientReceiveDataList.free;
  ClientSendList.free;  //Ŭ���̾�Ʈ�� ���� �۽� ����Ʈ
  ComNodeList.free;
  ConnectDeviceList.free;
  DeviceList.free;
  FireBreakGubunList.free;
  FireDoorOpenList.free; //ȭ��� ������ ��� ����Ʈ
  FoodConfigCodeList.free; //�ļ� �ڵ� ����Ʈ
  FoodConfigStartList.free; // �ļ��ڵ� ���۽ð�
  FoodConfigEndList.free;  //�ļ��ڵ� ���� �ð�
  FoodEventList.free;
  FoodServerEmployeeList.Free;
  HolidaySendDeviceList.free;   //������ ���� ��⸮��Ʈ
  InOutCountList.free; //����� ī��Ʈ -1(���) 1(�Խ�) 0(������)
  InOutCardReaderList.free; //����� ī��Ʈ ��� 000(����ȣ)00(ECUID)0(ReaderNo)
  InOutGroupReaderList.free;
  RelayControlDoorList.Free;
  NodeStateList.free;
  StateCheckList.free;
  STRSendList.free;       //STRTimer �� ���� ������ ����
  WorkTypeList.free;
  ZoneDetectList.free;        //������ ���� �ڵ�
  InnoNixAlarmEventList.Free;
end;

procedure TfmMain.CriticalSectionCreate;
begin
  FClientReceive := TCriticalSection.Create;
  FClientSender := TCriticalSection.Create;
  FStateCheckTCS := TCriticalSection.Create;
end;

procedure TfmMain.CriticalSectionFree;
begin
  FClientReceive.Free;
  FClientSender.Free;
  FStateCheckTCS.Free;

end;


function TfmMain.GetCardConfig: Boolean;
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

    G_bCardFixedUse := False;
    G_stCardFixedFillChar := '*';  //ī��������� ���� ä����
    G_nCardFixedPosition := 1; //ä������ġ 0:��,1:��
    G_nCardFixedLength := 16;  //ī��������� KT���� ó�� ����ؼ� ����Ʈ 11�ڸ�

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND (CO_CONFIGGROUP = ''CARD'') ';

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
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'CARDFIXED' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then G_bCardFixedUse := True
          else G_bCardFixedUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'FIXEDLEN' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then
          begin
            G_nCardFixedLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
        end else if FindField('CO_CONFIGCODE').AsString = 'FILLCHAR' then
        begin
          if FindField('CO_CONFIGVALUE').AsString <> '' then
            G_stCardFixedFillChar := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FILLPOSI' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then
            G_nCardFixedPosition := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end;

        Next;
      end;

      if CARDLENGTHTYPE <> 0 then
      begin
        if G_nCardFixedLength < 11 then G_nCardFixedLength := 16;
      end;
    end;
  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmMain.GetKTTControlConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  bDDNSUses : Boolean;
  bKTTSendEventServer : Boolean; //�۽� ���뼭��
begin
  dmKTTControl.SERVERUSES := False;
  dmKTTControl.KTTServerIP := '127.0.0.1';
  dmKTTControl.KTTServerPort := 9999;
  dmKTTControl.ClientServerPort := 9999;
  L_nKTTControlServerAlarmEventCount := 50;
  bDDNSUses := False;
  bKTTSendEventServer := False;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''KTT'' ';
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
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'KTTSUSES' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then
          begin
            G_bKTTEventServerUse := True; //KTT���� �������
          end else
          begin
            G_bKTTEventServerUse := False;
          end;
        end else if FindField('CO_CONFIGCODE').AsString = 'KTTSENDSER' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then
          begin
            bKTTSendEventServer := True; //KTT���� �۽� ���� ����
          end else
          begin
            bKTTSendEventServer := False;
          end;
        end else if FindField('CO_CONFIGCODE').AsString = 'KTTSIP' then
        begin
          dmKTTControl.KTTServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'KTTSPORT' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then dmKTTControl.KTTServerPort := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
        end else if FindField('CO_CONFIGCODE').AsString = 'KTTCPORT' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then dmKTTControl.ClientServerPort := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
        end else if FindField('CO_CONFIGCODE').AsString = 'ALARMCOUNT' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then L_nKTTControlServerAlarmEventCount := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
        end else if FindField('CO_CONFIGCODE').AsString = 'KTTPCYCLE' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then dmKTTControl.KTTPamCycle := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
        end else if FindField('CO_CONFIGCODE').AsString = 'DDNSUSES' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then
          begin
            bDDNSUses := True ;
          end else
          begin
            bDDNSUses := False ;
          end;
        end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_SIP' then
        begin
          dmKTTDDNS.DDNSServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_SPORT' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then dmKTTDDNS.DDNSServerPort := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
        end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_QIP' then
        begin
          dmKTTDDNS.DDNSQueryServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_QPORT' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then dmKTTDDNS.DDNSQueryServerPort := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
        end;

        Next;
      end;
      if Not bKTTSendEventServer then
      begin
        dmKTTControl.SERVERUSES := G_bKTTEventServerUse ;
        btnKTTMonitoring.Visible := G_bKTTEventServerUse;
        dmKTTDDNS.DDNSUSES := bDDNSUses; //���� ��� ��� ���� ���� �� ������ DDNS ����
        btnDDNSMonitoring.Visible := bDDNSUses;
        CheckKTTSenderTimer.Enabled := False;
      end else
      begin
        dmKTTControl.SERVERUSES := False ;
        btnKTTMonitoring.Visible := False;
        dmKTTDDNS.DDNSUSES := False; //���� ��� ��� ���� ���� �� ������ DDNS ����
        btnDDNSMonitoring.Visible := False;
        CheckKTTSenderTimer.Enabled := G_bKTTEventServerUse;
      end;
      mn_kttCodeAdmin.Visible := G_bKTTEventServerUse;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.KTTControlCenterAlarmListLoad(NodeNo: integer;
  aCommNode: TCommNode);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  stSql := 'select ';
  if DBTYPE = 'MSSQL' then stSql := stSql + ' top ' + inttostr(L_nKTTControlServerAlarmEventCount) + ' ';
  stSql := stSql + ' * from TB_ALARMEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + '''';
  if DBTYPE = 'PG' then stSql := stSql + ' LIMIT ' + inttostr(L_nKTTControlServerAlarmEventCount) + ' OFFSET 0 ';

end;

procedure TfmMain.btnKTTMonitoringClick(Sender: TObject);
begin
  if L_bFormActive then
    MDIChildShow('TfmKTTMonitoring');

end;

procedure TfmMain.CommandArrayCommandsTKTTMONITORINGExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['����'];
   if stResult = 'TRUE' then L_bShowKttMonitoring := True
   else L_bShowKttMonitoring := False;

end;

procedure TfmMain.KTTEventData(Sender: TObject; aGubun, aIP, aState,
  aTemp4: string);
var
  fmKTTMonitoring :TForm;
begin
  if Not L_bShowKttMonitoring then Exit;
  fmKTTMonitoring := MDIForm('TfmKTTMonitoring');
  if fmKTTMonitoring <> nil then
  begin
    TfmKTTMonitoring(fmKTTMonitoring).DisplayStringGrid(aGubun,aIP,aState,aTemp4);
  end;

end;

procedure TfmMain.DDNSEventData(Sender: TObject; aGubun, aIP, aState,
  aTemp4: string);
var
  fmDDNSMonitoring :TForm;
begin
  if Not L_bShowDDNSMonitoring then Exit;
  fmDDNSMonitoring := MDIForm('TfmDDNSMonitoring');
  if fmDDNSMonitoring <> nil then
  begin
    TfmDDNSMonitoring(fmDDNSMonitoring).DisplayStringGrid(aGubun,aIP,aState,aTemp4);
  end;
end;

procedure TfmMain.MonitorEventData(Sender: TObject; aGubun, aIP, aData,
  aTemp4: string);
var
  fmMonitoringState :TForm;
begin
  if UpperCase(aGubun) = 'RX' then
  begin
    RcvFromClient(aIP,aData);
  end;
  fmMonitoringState := MDIForm('TfmMonitoringState');
  if fmMonitoringState <> nil then
  begin
    TfmMonitoringState(fmMonitoringState).DisplayStringGrid(aGubun,aIP,aData,aTemp4);
  end;

end;

procedure TfmMain.btnDDNSMonitoringClick(Sender: TObject);
begin
  if L_bFormActive then
    MDIChildShow('TfmDDNSMonitoring');

end;

procedure TfmMain.CommandArrayCommandsTDDNSMINITORINGExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['����'];
   if stResult = 'TRUE' then L_bShowDDNSMonitoring := True
   else L_bShowDDNSMonitoring := False;

end;

procedure TfmMain.CommandArrayCommandsTMONITORINGSTATEExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['����'];
   if stResult = 'TRUE' then L_bShowMonitoringState := True
   else L_bShowMonitoringState := False;

end;

function TfmMain.CheckCardDownloadCount: integer;
var
  i : integer;
begin
  result := 0;
  //��� ���� ���·� ������ �ȳ��� ���� ��찡 �߻��� ������ ����...
  Exit;
  for I:= 0 to ComNodeList.Count -1 do
  begin
    if TCommnode(ComNodeList.Objects[i]).CardSendDataList.Count > 0 then
    begin
      result := TCommnode(ComNodeList.Objects[i]).CardSendDataList.Count;
      Exit;
    end;
  end;
end;

procedure TfmMain.mn_kttCodeAdminClick(Sender: TObject);
begin
  fmKTTCodeAdmin:= TfmKTTCodeAdmin.Create(Self);
  fmKTTCodeAdmin.SHowmodal;
  fmKTTCodeAdmin.Free;
end;

procedure TfmMain.CommandArrayCommandsTRESTARTExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  if Application.MessageBox(PChar('��ŵ����� ������Ͻðڽ��ϱ�??'),'����',MB_OKCANCEL) = IDOK then
     RestartTimer.Enabled := True;
end;

procedure TfmMain.RestartTimerTimer(Sender: TObject);
begin
  RestartTimer.Enabled := False;
  if L_bRestartingTimer then Exit;
  L_bRestartingTimer := True;
  Action_DaemonRestartExecute(self);
  Delay(100);
  if G_bApplicationTerminate then Exit;
//  DeviceInfoSendTimer.Enabled := True;
  L_bRestartingTimer := False;

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
      {����� Ʈ���� ���}

      tbi.Visible := False;
      tbi.Visible := True;
    end;
  end;//with
end;

procedure TfmMain.WorkTypeListClear;
var
  i : integer;
begin
  for i := 0 to WorkTypeList.Count - 1 do
  begin
    TdmAttendEvent(WorkTypeList.Objects[i]).Free;
  end;
  WorkTypeList.Clear;
end;

procedure TfmMain.StateSendTimerTimer(Sender: TObject);
var
  i : integer;
begin
  //Exit;
  StateSendTimer.Interval := 200;
  if ClientSendList.Count > 0 then Exit; //���۰Ǽ��� 1�� �̻��� ��쿡�� ���߿� ��������.
  Try
    StateSendTimer.Enabled := False;
    for i := 0 to L_nMaxNodeNo do
    begin
      if G_bApplicationTerminate then Exit;
      if L_arrayNodeState[i] > 0 then  //���º���� ������ ������
      begin
        GetNodeStateCheck; //���� ���¸� �޸𸮿� ������ ����.
        L_arrayNodeState[i] := L_arrayNodeState[i] - 1;
        ProcessNodeStateCheck(i);
        if L_arrayNodeState[i] > 1 then L_arrayNodeState[i] := 1;
      end;
    end;
  Finally
    if Not G_bApplicationTerminate then  StateSendTimer.Enabled := True;
  End;
end;

procedure TfmMain.ProcessNodeStateCheck(aNodeNo: integer);
var
  nIndex : integer;
  j : integer;
  stPacket : string;
  stClientSendData : string;
begin
  Try
    nIndex := NodeStateList.IndexOf(FillZeroNumber(aNodeNo,3));
    if nIndex < 0 then Exit;
    stPacket := '';
    for j:=0 to MAXECUCOUNT do
    begin
      if G_nMonitorSockType = 0 then
        stPacket := stPacket + TNodeLockState(NodeStateList.Objects[nIndex]).GetEcuASCIIState(j)
      else stPacket := stPacket + TNodeLockState(NodeStateList.Objects[nIndex]).GetEcuHEXState(j);
      Application.ProcessMessages;
    end;
    stClientSendData := 'R' +
                        'S' +   //Server ����
                        NodeStateList.Strings[nIndex] +
                        '00' +  //ECUID
                        '00' +
                        '00' +
                        'SV' +
                        'N' +
                        FillZeroNumber(Length(stPacket),3) +
                        stPacket;
    NodeStateListDelete(nIndex);
    SendClientData(stClientSendData);
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
               'ProcessNodeStateCheck','Memory Error' + inttostr(j));
  end;

end;

procedure TfmMain.GetNodeStateCheck;
var
  i,j : integer;
  stClientSendData : string;

  stDeviceConnect : string;
  stWatchMode : string;
  stDoorManager1 : string;
  stDoorManager2 : string;
  stDoorPNmode1 : string;
  stDoorPNmode2 : string;
  stDoorOpenState1 : string;
  stDoorOpenState2 : string;
  stDoorLockState1 : string;
  stDoorLockState2 : string;
  stDoorFireState1 : string;
  stDoorFireState2 : string;
  stRealData : string;
  tlNodeStateList : TStringList;
  lsLockState : TNodeLockState;
  nIndex : integer;

  stPacket : string;
begin
  NodeStateListClear;

  Try
    for i:=0 to DeviceList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      if TDevice(DeviceList.Objects[i]).Connected then stDeviceConnect := '01'
      else stDeviceConnect := '00';
      case TDevice(DeviceList.Objects[i]).GetArmAreaState(0) of
          cmNothing : begin stWatchMode := '0000' end;
          cmArm     : begin stWatchMode := '0001' end;
          cmDisarm  : begin stWatchMode := '0010' end;
          cmPatrol  : begin stWatchMode := '0011' end;
          cmInit    : begin stWatchMode := '0100' end;
          cmTest    : begin stWatchMode := '0101' end;
          cmJaejung : begin stWatchMode := '0110'  end;
          else  begin stWatchMode := '0000' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorManageMode(1) of
        dmNothing : begin stDoorManager1 := '000' end;
        dmManager : begin stDoorManager1 := '001' end;
        dmOpen    : begin stDoorManager1 := '010' end;
        dmLock    : begin stDoorManager1 := '011' end;
        dmMaster  : begin stDoorManager1 := '100' end;
        else begin stDoorManager1 := '000' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorManageMode(2) of
        dmNothing : begin stDoorManager2 := '000' end;
        dmManager : begin stDoorManager2 := '001' end;
        dmOpen    : begin stDoorManager2 := '010' end;
        dmLock    : begin stDoorManager2 := '011' end;
        dmMaster  : begin stDoorManager2 := '100' end;
        else begin stDoorManager2 := '000' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorPNMode(1) of
        pnNothing  : begin stDoorPNmode1 := '00' end;
        pnPositive : begin stDoorPNmode1 := '01' end;
        pnNegative : begin stDoorPNmode1 := '10' end;
        else begin stDoorPNmode1 := '00' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorPNMode(2) of
        pnNothing  : begin stDoorPNmode2 := '00' end;
        pnPositive : begin stDoorPNmode2 := '01' end;
        pnNegative : begin stDoorPNmode2 := '10' end;
        else begin stDoorPNmode2 := '00' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorState(1) of
        dsNothing : begin stDoorOpenState1 := '000' end;
        dsClose   : begin stDoorOpenState1 := '001' end;
        dsOpen    : begin stDoorOpenState1 := '010' end;
        dsLongTime: begin stDoorOpenState1 := '011' end;
        dsOpenErr : begin stDoorOpenState1 := '100' end;
        dsCloseErr: begin stDoorOpenState1 := '101' end;
        else begin stDoorOpenState1 := '000' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorState(2) of
        dsNothing : begin stDoorOpenState2 := '000' end;
        dsClose   : begin stDoorOpenState2 := '001' end;
        dsOpen    : begin stDoorOpenState2 := '010' end;
        dsLongTime: begin stDoorOpenState2 := '011' end;
        dsOpenErr : begin stDoorOpenState2 := '100' end;
        dsCloseErr: begin stDoorOpenState2 := '101' end;
        else begin stDoorOpenState2 := '000' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorLockMode(1) of
        lsNothing : begin stDoorLockState1 := '00' end;
        lsClose   : begin stDoorLockState1 := '01' end;
        lsOpen    : begin stDoorLockState1 := '10' end;
        else begin stDoorLockState1 := '00' end;
      end;
      case TDevice(DeviceList.Objects[i]).GetDoorLockMode(2) of
        lsNothing : begin stDoorLockState2 := '00' end;
        lsClose   : begin stDoorLockState2 := '01' end;
        lsOpen    : begin stDoorLockState2 := '10' end;
        else begin stDoorLockState2 := '00' end;
      end;
      if TDevice(DeviceList.Objects[i]).GetDoorFire(1) then stDoorFireState1 := '1'
      else stDoorFireState1 := '0';
      if TDevice(DeviceList.Objects[i]).GetDoorFire(2) then stDoorFireState2 := '1'
      else stDoorFireState2 := '0';

      stRealData := stDeviceConnect +     //'01'
                    stWatchMode +         //'0000'
                    stDoorManager1 +      //'000'
                    stDoorManager2 +      //'000'
                    stDoorPNmode1 +       //'00'
                    stDoorPNmode2 +       //'00'
                    stDoorOpenState1 +    //'000'
                    stDoorOpenState2 +    //'000'
                    stDoorLockState1 +    //'00'
                    stDoorLockState2 +    //'00'
                    stDoorFireState1 +    //'0'
                    stDoorFireState2;     //'0'
      nIndex := NodeStateList.IndexOf(FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3));
      if nIndex < 0 then
      begin
        lsLockState := TNodeLockState.Create(self);
        lsLockState.EcuStateAdd(TDevice(DeviceList.Objects[i]).ECUID,stRealData);
        NodeStateList.AddObject(FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3),lsLockState);
      end else
      begin
        TNodeLockState(NodeStateList.Objects[nIndex]).EcuStateAdd(TDevice(DeviceList.Objects[i]).ECUID,stRealData);
      end;
      Application.ProcessMessages;
    end;

  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
               'GetNodeStateCheck','Memory Error' + inttostr(i));
  End;

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
  LogSave(ExeFolder + '\..\log\DaemonApplication' + FormatDateTime('yyyymmdd',now) + '.log',sObj);

end;

procedure TfmMain.DeviceHolidayClear(aDeviceID:string='');
var
  i,j: integer;
  aDevice : TDevice;
  nIndex : integer;
  stNodeNo : string;
  stEcuID : string;
  bResult : Boolean;
begin
  bResult := False;
  if aDeviceID = '' then
  begin
    for i := 0 to DeviceList.Count - 1 do
    begin
      aDevice := TDevice(DeviceList.Objects[i]);
      stNodeNo := copy(DeviceList.strings[i],1,3);
      stEcuID := copy(DeviceList.strings[i],4,1);
      if aDevice <> nil then
      begin
        if aDevice.HO1USE then
        begin
          for j := 1 to aDevice.MaxLockCount do
          begin
            if aDevice.Holiday('W','0100',inttostr(j)) then bResult := True;  //��ü�� Ư���� ����
          end;
          if bResult then dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(stNodeNo,stEcuID,'HO_SEND','N');
          //if Not aDevice.Holiday('W','0100','1') then continue;  //��ü�� Ư���� ����
          //if Not aDevice.Holiday('W','0100','2') then continue;  //��ü�� Ư���� ����
        end;
      end;
    end;
  end else
  begin
    nIndex:= DeviceList.IndexOf(aDeviceID);
    if nIndex > -1 then
    begin
      aDevice := TDevice(DeviceList.Objects[i]);
      if aDevice <> nil then
      begin
        if aDevice.HO1USE then
        begin
          for j := 1 to aDevice.MaxLockCount do
          begin
            if aDevice.Holiday('W','0100',inttostr(j)) then bResult := True;  //��ü�� Ư���� ����
          end;
          if bResult then dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(stNodeNo,stEcuID,'HO_SEND','N');
          //if Not aDevice.Holiday('W','0100','1') then continue;  //��ü�� Ư���� ����
          //if Not aDevice.Holiday('W','0100','2') then continue;  //��ü�� Ư���� ����
        end;
      end;
    end;
  end;
end;

function TfmMain.LoadFireGroup: Boolean;
var
  i : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  for i := LOW(G_stFireGroupCode) to HIGH(G_stFireGroupCode) do
  begin
    G_stFireGroupCode[i] := '000';
  end;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    stSql := 'select * from TB_FIREGROUP ';
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        ErrorLogSave(ExeFolder + '\..\log\TB_FIREGROUP'+ FormatDateTIme('yyyymmddhh',Now)+'.log',
               '1253','TB_FIREGROUP Select Error');
        Exit;
      End;
      While Not Eof do
      begin
        G_stFireGroupCode[FindField('AC_NODENO').AsInteger] := FindField('FG_CODE').AsString;
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

function TfmMain.Send_FireGroup(aFireGroupCode: string): Boolean;
var
  i,j : integer;
  nIndex : integer;
  stNodeNo : string;
begin
  Try
    for i := LOW(G_stFireGroupCode) to HIGH(G_stFireGroupCode) do
    begin
      if G_stFireGroupCode[i] = aFireGroupCode then
      begin
        nIndex := ComNodeList.IndexOf('NODE'+InttoStr(i));
        if nIndex > -1 then
          TCommnode(ComNodeList.Objects[nIndex]).FireOutbreak(True);
      end;
    end;
  Except
    ErrorLogSave(ExeFolder + '\..\log\TB_FIREGROUP'+ FormatDateTIme('yyyymmddhh',Now)+'.log',
           '1253','Send_FireGroup');
  End;

end;

procedure TfmMain.N37Click(Sender: TObject);
begin
  inherited;
  fmFiregubunCode:= TfmFiregubunCode.Create(Self);
  fmFiregubunCode.SHowmodal;
  fmFiregubunCode.Free;

end;

procedure TfmMain.N38Click(Sender: TObject);
begin
  inherited;
  fmFireGroup:= TfmFireGroup.Create(Self);
  fmFireGroup.SHowmodal;
  fmFireGroup.Free;
  if Application.MessageBox(PChar('��ŵ����� ������Ͻðڽ��ϱ�??'),'����',MB_OKCANCEL) = IDOK then
     RestartTimer.Enabled := True;

end;

function TfmMain.NodeStateListClear: Boolean;
var
  i : integer;
  lsLockState : TNodeLockState;
begin
  if NodeStateList.Count < 1 then Exit;
  result := False;
  Try
    for i := NodeStateList.Count - 1 downto 0 do
    begin
      lsLockState := TNodeLockState(NodeStateList.Objects[i]);
      if lsLockState <> nil then
      begin
        lsLockState.Free;
        lsLockState := nil;
      end;
      NodeStateList.Delete(i);
    end;
  Except
    ErrorLogSave(ExeFolder + '\..\log\NodeStateList'+ FormatDateTIme('yyyymmddhh',Now)+'.log',
           '1253','NodeStateListClear Error');
    Exit;
  End;
  result := True;

end;

function TfmMain.NodeStateListDelete(aIndex: integer): Boolean;
var
  lsLockState : TNodeLockState;
begin
  result := False;
  Try
    lsLockState := TNodeLockState(NodeStateList.Objects[aIndex]);
    if lsLockState <> nil then
    begin
      lsLockState.Free;
      lsLockState := nil;
    end;
    NodeStateList.Delete(aIndex);
  Except
    ErrorLogSave(ExeFolder + '\..\log\NodeStateList'+ FormatDateTIme('yyyymmddhh',Now)+'.log',
           '1253','NodeStateListDelete Error');
    Exit;
  End;
  result := True;
end;

procedure TfmMain.ClientDBSocketClearTimerTimer(Sender: TObject);
begin
  inherited;
  if L_nOldDBSocketSeq <> 0 then
  begin
    dmMonitoringServer.DBSocketClear(L_nOldDBSocketSeq);
  end;
  L_nOldDBSocketSeq := dmMonitoringServer.GetLastDBSocketSerial;
end;

procedure TfmMain.JavarScheduleTimerTimer(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nDeviceIndex : integer;
  stSendData : string;
  i : integer;
begin
  inherited;
  JavarScheduleTimer.Enabled := False;
  StatusBar1.Panels[2].Text := 'JavarScheduleTimer';
  Try
    stSql := 'Select * from TB_JAVARASCHEDULE ';
    stSql := stSql + ' where SendState = ''N'' ';
    if ConnectDeviceList.Count > 0 then
    begin
      stSql := stSql + ' and ( ';
      for i := 0 to ConnectDeviceList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if i <> 0 then stSql := stSql + ' OR ';
        stSql := stSql + '( AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
        stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''' ) ';
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
        SQL.Text := stSql;

        Try
          Open;
        Except
          Exit;
        End;
        if recordcount < 1 then Exit;
        While Not Eof do
        begin
          nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').AsString);
          if nDeviceIndex < 0 then continue;
          if FindField('SchUse').AsString = '1' then
          begin
            stSendData := 'DL0400' + ' ' +
                        FindField('WeekStartTime').AsString + FindField('WeekEndTime').AsString + ' ' +
                        FindField('SaturdayStartTime').AsString + FindField('SaturdayEndTime').AsString + ' ' +
                        FindField('SundayStartTime').AsString + FindField('SundayEndTime').AsString + ' ' +
                        FindField('HolidayStartTime').AsString + FindField('HolidayEndTime').AsString ;
          end else
          begin
            stSendData := 'DL0400' + ' ' +
                        '00002400' + ' ' +
                        '00002400' + ' ' +
                        '00002400' + ' ' +
                        '00002400' ;
          end;

          Tdevice(DeviceList.Objects[nDeviceIndex]).SendPacket('I',stSendData,False);

          Next;
        end;
      End;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;

  Finally
    if Not G_bApplicationTerminate then JavarScheduleTimer.Enabled := True;
  End;
end;

procedure TfmMain.Receive_JavaraSchedule(aNodeNo, aEcuID,
  aPacketData: string);
begin
  //�ڹٶ� ������ ��� ����
  UpdateTB_JAVARASCHEDULE_Ack(aNodeNo,aEcuID,'Y');
end;

procedure TfmMain.mn_InOutGroupCodeClick(Sender: TObject);
begin
  inherited;
  fmInOutGroupCode:= TfmInOutGroupCode.Create(Self);
  Try
    fmInOutGroupCode.Caption := mn_InOutGroupCode.Caption;
    fmInOutGroupCode.SHowmodal;
  Finally
    fmInOutGroupCode.Free;
  End;
end;

function TfmMain.InsertTB_INOUTGROUPLIST(aInOutGroupCode,
  aCardNo,aNodeNo,aEcuID,aReaderNo,aTime: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_INOUTGROUPLIST(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'IO_GROUPCODE,';
  stSql := stSql + 'CA_CARDNO, ';
  stSql := stSql + 'AC_NODENO, ';
  stSql := stSql + 'AC_ECUID, ';
  stSql := stSql + 'RE_READERNO, ';
  stSql := stSql + 'IO_TIME ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aInOutGroupCode + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aReaderNo + ''',';
  stSql := stSql + '''' + aTime + ''')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.DeleteTB_INOUTGROUPLIST(aInOutGroupCode,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_INOUTGROUPLIST ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND IO_GROUPCODE = ''' + aInOutGroupCode + '''';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_INOUTGROUPLIST(aInOutGroupCode, aCardNo, aNodeNo,
  aEcuID, aReaderNo, aTime: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_INOUTGROUPLIST set ';
  stSql := stSql + 'AC_NODENO = ' + aNodeNo + ', ';
  stSql := stSql + 'AC_ECUID =''' + aEcuID + ''', ';
  stSql := stSql + 'RE_READERNO =''' + aReaderNo + ''', ';
  stSql := stSql + 'IO_TIME =''' + aTime + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND IO_GROUPCODE = ''' + aInOutGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.Process_DeviceAllState_IV_MemorySave;
begin
  Try
    FStateCheckTCS.Enter;
    if StateCheckList.IndexOf('DEVICEALLSTATE_IV') < 0 then
        StateCheckList.Add('DEVICEALLSTATE_IV');
  Finally
    FStateCheckTCS.Leave;
  End;
end;

procedure TfmMain.Process_DeviceAllState_IV_CheckSend;
begin

end;

procedure TfmMain.GroupPermitTimerTimer(Sender: TObject);
begin
  inherited;
  Try
    GroupPermitTimer.Enabled := False;
    if G_bApplicationTerminate then Exit;
    GroupPermitToEmCode;
    EmCodeToGroupPermit;
  Finally
    GroupPermitTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

procedure TfmMain.EmCodeToGroupPermit;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Update TB_EMPLOYEE set DG_APPLY = ''R'' ';
  stSql := stSql + ' Where DG_APPLY = ''N'' ';
  DataModule1.ProcessExecSQL(stSql); //�׷��ڵ� ���� �غ� ���·� ����

  stSql := ' Select a.CO_COMPANYCODE,a.EM_CODE,a.DG_CODE,b.CA_CARDNO,b.CA_CARDTYPE from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.DG_APPLY = ''R'' ';
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
      while Not Eof do
      begin
        if FindField('CA_CARDNO').AsString <> '' then
        begin
          if FindField('CA_CARDTYPE').AsString = '1' then
          begin
            CopyCardToGroupPermit(FindField('CA_CARDNO').AsString,FindField('DG_CODE').AsString);
          end;
        end;
        UpdateTB_EMPLOYEE_Apply(FindField('CO_COMPANYCODE').AsString,FindField('EM_CODE').AsString,'R','Y');
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.GroupPermitToEmCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Update TB_DEVICECARDGROUPCODE set DG_APPLY = ''R'' ';
  stSql := stSql + ' Where DG_APPLY = ''N'' ';
  DataModule1.ProcessExecSQL(stSql); //�׷��ڵ� �غ� ���·� ����

  stSql := ' Select DG_USE,DG_CODE from TB_DEVICECARDGROUPCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND DG_APPLY = ''R'' ';
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
      while Not Eof do
      begin
        if FindField('DG_USE').AsString = 'N' then //�׷��ڵ� ������ ���
          EmployeeGroupCodeDelete(FindField('DG_CODE').AsString)
        else
          GroupPermitCodeToEmployeeApply(FindField('DG_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;


end;

function TfmMain.EmployeeGroupCodeDelete(
  aGroupPermitCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPLOYEE set DG_CODE = '''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ' ;
  stSql := stSql + ' AND DG_CODE = ''' + aGroupPermitCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
  UpdateTB_DEVICECARDGROUPCODE_Apply(aGroupPermitCode,'R','Y'); //�׷��ڵ� ����
end;

function TfmMain.GroupPermitCodeToEmployeeApply(
  aGroupPermitCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := True;
  stSql := ' Select a.*,b.CA_CARDNO,b.CA_CARDTYPE from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
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
      result := True;
      if recordCount < 1 then Exit;
      While Not Eof do
      begin
        if FindField('CA_CARDTYPE').AsString = '1' then   //��� �����̸鼭
        begin
          if FindField('CA_CARDNO').AsString <> '' then
             CopyCardToGroupPermit(FindField('CA_CARDNO').AsString,aGroupPermitCode);
        end;
        Next;
      end;
      UpdateTB_DEVICECARDGROUPCODE_Apply(aGroupPermitCode,'R','Y');
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.CopyCardToGroupPermit(aCardNo,
  aGroupPermitCode: string): Boolean;
begin
  if aGroupPermitCode = '' then Exit;
  if aGroupPermitCode = '000' then Exit;
  UpdateTB_DEVICECARDNOExistCardGroupCode(aCardNo,aGroupPermitCode);
  InsertTB_DEVICECARDNONotExistCardGroupCode(aCardNo,aGroupPermitCode);
end;

function TfmMain.InsertTB_DEVICECARDNONotExistCardGroupCode(aCardNo,
  aGroupPermitCode: string): Boolean;
var
  stSql : string;
begin
  if Trim(aCardNo) = '' then Exit;
  stSql := ' Insert INTO TB_DEVICECARDNO (GROUP_CODE, ';
  stSql := stSql + ' AC_NODENO, ';
  stSql := stSql + ' AC_ECUID, ';
  stSql := stSql + ' CA_CARDNO, ';
  stSql := stSql + ' DE_DOOR1, ';
  stSql := stSql + ' DE_DOOR2, ';
  stSql := stSql + ' DE_USEACCESS, ';
  stSql := stSql + ' DE_USEALARM, ';
  stSql := stSql + ' DE_TIMECODE, ';
  stSql := stSql + ' DE_PERMIT, ';
  stSql := stSql + ' DE_RCVACK, ';
  stSql := stSql + ' DE_UPDATETIME, ';
  stSql := stSql + ' DE_UPDATEOPERATOR) ';
  stSql := stSql + ' select ''' + GROUPCODE + ''', ';
  stSql := stSql + ' b.AC_NODENO, ';
  stSql := stSql + ' b.AC_ECUID, ';
  stSql := stSql + ' ''' + aCardNO + ''', ';
  stSql := stSql + ' b.DE_DOOR1, ';
  stSql := stSql + ' b.DE_DOOR2, ';
  stSql := stSql + ' b.DE_USEACCESS, ';
  stSql := stSql + ' b.DE_USEALARM, ';
  stSql := stSql + ' b.DE_TIMECODE, ';
  stSql := stSql + ' b.DE_PERMIT, ';
  stSql := stSql + ' ''N'', ';
  stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' '''+ Master_ID + ''' ';
  stSql := stSql + ' From TB_DEVICECARDNOGROUP B  ';
  stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND B.CA_GROUP = ''' + aGroupPermitCode + ''' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
  stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
  stSql := stSql + ' AND A.CA_CARDNO = ''' + aCardNO + ''')  ';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_DEVICECARDNOExistCardGroupCode(aCardNo,
  aGroupPermitCode: string): Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MSSQL' then stSql := MSSQL.UpdateTB_DEVICECARDNOFromCardGroup(aGroupPermitCode,aCardNO)
  else if DBTYPE = 'PG' then stSql := PostGreSql.UpdateTB_DEVICECARDNOFromCardGroup(aGroupPermitCode,aCardNO)
  else if DBTYPE = 'MDB' then stSql := MDBSql.UpdateTB_DEVICECARDNOFromCardGroup(aGroupPermitCode,aCardNO)
  else if DBTYPE = 'FB' then stSql := FireBird.UpdateTB_DEVICECARDNOFromCardGroup(aGroupPermitCode,aCardNO)
  else Exit;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_DEVICECARDGROUPCODE_Apply(aGroupPermitCode,
  aOldApply, aNewApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICECARDGROUPCODE set DG_APPLY = ''' + aNewApply + ''' ';
  stSql := stSql + ' Where Group_Code = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND DG_CODE = ''' + aGroupPermitCode + ''' ';
  if aOldApply <> '' then stSql := stSql + ' AND DG_APPLY = ''' + aOldApply + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_EMPLOYEE_Apply(aCompanyCode,aEmCode, aOldApply,
  aNewApply: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPLOYEE set DG_APPLY = ''' + aNewApply + ''' ';
  stSql := stSql + ' Where Group_Code = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  if aOldApply <> '' then stSql := stSql + ' AND DG_APPLY = ''' + aOldApply + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.GetEmployeeInfoFromOper(aCardNo:string; var aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
  nLen : integer;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aCompanyCode := '';
  aEmCode := '';
  
  nLen := Length(aCardNo);
  stSql := 'Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if DBType = 'MSSQL' then stSql := stSql + ' AND substring(CA_CARDNO,1,' + inttostr(nLen)+ ') = ''' + aCardNo + ''' '
  else if DBType = 'MDB' then stSql := stSql + ' AND MID(CA_CARDNO,1,' + inttostr(nLen)+ ') = ''' + aCardNo + ''' '
  else stSql := stSql + ' AND substr(CA_CARDNO,1,' + inttostr(nLen)+ ') = ''' + aCardNo + ''' ';
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
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aEmCode := FindField('EM_CODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.Send_RegistDoorTimeCodeUse: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  oDevice : TDevice;
  stOldDeviceID : string;
  stDeviceID : string;
  stDoorTimeCodeUse : string;
begin
  result := False;
  stSql := 'Update TB_ACCESSDEVICE set TC_TIMECODEASYNC = ''S''' ;
  stSql := stSql + ' Where TC_TIMECODEASYNC = ''N'' ';
  stSql := stSql + ' AND AC_TIMETYPE = ''1'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO,a.DO_TIMECODEUSE from TB_DOOR a ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Where b.TC_TIMECODEASYNC = ''S'' ';
  stSql := stSql + ' AND b.AC_TIMETYPE = ''1'' ';
  stSql := stSql + ' Order by a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO ';

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
      stDeviceID := '';
      stOldDeviceID := '';
      stDoorTimeCodeUse := '00000000';
      While Not Eof do
      begin
        stDeviceID := FillZeroNumber(strtoint(FindField('AC_NODENO').AsString),3) + FindField('AC_ECUID').AsString;
        if stDeviceID <> stOldDeviceID then
        begin
          if stOldDeviceID <> '' then
          begin
            oDevice:= GetDevice(stOldDeviceID);
            if oDevice <> nil then
            begin
              if oDevice.Connected then
                oDevice.RegistDoorTimeCodeUse(stDoorTimeCodeUse,False);
            end;
          end;
          stOldDeviceID := stDeviceID;
          stDoorTimeCodeUse := '00000000';
        end;
        if FindField('DO_TIMECODEUSE').AsString = '1' then stDoorTimeCodeUse[strtoint(FindField('DO_DOORNO').AsString)] := '1';

        Next;
      end;
      if stOldDeviceID <> '' then
      begin
        oDevice:= GetDevice(stOldDeviceID);
        if oDevice <> nil then
        begin
          if oDevice.Connected then
            oDevice.RegistDoorTimeCodeUse(stDoorTimeCodeUse,False);
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure TfmMain.Receive_DoorTimeCodeUse(aNodeNo, aEcuID,
  aPacketData: string);
begin
  dmDBFunction.UpdateTB_ACCESSDEVICE_TimeAsync(aNodeNo, aEcuID,'S','Y');
  //���Թ� Ÿ���ڵ� ������� ����
end;

function TfmMain.Send_RegistTimeCode: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  oDevice : TDevice;
  stDeviceID : string;
begin
  result := False;
  stSql := 'Update TB_TIMECODEDEVICE set TC_SEND = ''S''' ;
  stSql := stSql + ' Where TC_SEND = ''N'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.TC_GROUP,a.TC_TIME1,a.TC_TIME2,a.TC_TIME3,a.TC_TIME4 from TB_TIMECODEDEVICE a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON ( a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND b.AC_TIMETYPE = ''1'') ';
  stSql := stSql + ' Where a.TC_SEND = ''S'' ';

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
      While Not Eof do
      begin
        stDeviceID := FillZeroNumber(strtoint(FindField('AC_NODENO').AsString),3) + FindField('AC_ECUID').AsString;
        oDevice:= GetDevice(stDeviceID);
        if oDevice <> nil then
        begin
          if oDevice.Connected then
            oDevice.RegistTimeCode(FindField('TC_GROUP').AsString,FindField('TC_TIME1').AsString,FindField('TC_TIME2').AsString,FindField('TC_TIME3').AsString,FindField('TC_TIME4').AsString,False);
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

procedure TfmMain.DeviceRcvRegTimeCodeData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
var
  stSql : string;
  stECUID,stTimeGroup : string;
begin
  Try
    stECUID := copy(ReceiveData,15,2);
    stTimeGroup := ReceiveData[24];
    UpdateTB_TIMECODEDEVICE_Ack(inttostr(NodeNo),stECUID,stTimeGroup,'S','Y');
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

function TfmMain.UpdateTB_TIMECODEDEVICE_Ack(aNodeNo, aEcuID, aTimeGroup,
  aOldAck, aAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_TIMECODEDEVICE set TC_SEND = ''' + aAck + ''' ';
  stSql := stSql + ' Where Group_Code = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND TC_GROUP = ''' + aTimeGroup + ''' ';
  stSql := stSql + ' AND TC_SEND = ''' + aOldAck + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_TIMECODEDEVICE_AckAllGroup(aNodeNo, aEcuID,
  aOldAck, aAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_TIMECODEDEVICE set TC_SEND = ''' + aAck + ''' ';
  stSql := stSql + ' Where Group_Code = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND TC_SEND = ''' + aOldAck + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_JAVARASCHEDULE_Ack(aNodeNo, aEcuID,
  aAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_JAVARASCHEDULE Set SendState = ''' + aAck + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.LoadArmArea(aFirst:Boolean=True): Boolean;
var
  stSql : String;
  nNodeNo  : Integer;
  aDevice     : TDevice;
  TempAdoQuery : TADOQuery;
  nDeviceIndex : integer;
  i : integer;
begin
  Result := False;
  if aFirst then
  begin
    for i := 0 to DeviceList.Count - 1 do     //������� �޸� �ʱ�ȭ
    begin
      TDevice(DeviceList.Objects[i]).ArmAreaUseInitialize;
      TDevice(DeviceList.Objects[i]).ArmAreaNameInitialize;
      TDevice(DeviceList.Objects[i]).ArmAreaStateInitialize;
    end;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    // ������� �ε�
//    stSql := ' select * from TB_ALARMDEVICE ';
//    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
//    stSql := stSql + ' order by AC_NODENO,AC_ECUID,AL_ZONENUM ';
    // ������� �ε�
    stSql := ' select * from TB_ARMAREA ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND AR_USE = ''Y'' ';
    stSql := stSql + ' AND ( (AR_MEMLOAD is NULL ) or (AR_MEMLOAD= ''N'') ) ';
    stSql := stSql + ' order by AR_VIEWSEQ,AC_NODENO,AC_ECUID,AR_AREANO ';

    // ���
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //����ó��
        Exit;
      End;
      First;
      while not eof do
      begin
        if G_bApplicationTerminate then Exit;
        nNodeNo:= FindField('AC_NODENO').asInteger;
        nDeviceIndex:= DeviceList.Indexof(FillZeroNumber(nNodeNo,3) +  FindField('AC_ECUID').AsString);
        if nDeviceIndex > -1 then
        begin
          TDevice(DeviceList.Objects[nDeviceIndex]).SetArmAreaUse(FindField('AR_AREANO').AsInteger,True);
          TDevice(DeviceList.Objects[nDeviceIndex]).SetArmAreaName(FindField('AR_AREANO').AsInteger,FindField('AR_NAME').AsString);
          TDevice(DeviceList.Objects[nDeviceIndex]).SetArmAreaDisArmCheckUse(FindField('AR_AREANO').AsInteger,FindField('AR_DISARMCHECKUSE').AsString);
          TDevice(DeviceList.Objects[nDeviceIndex]).SetArmAreaDisArmCheckTime1From(FindField('AR_AREANO').AsInteger,FindField('AR_DISARMCHECKTIME1FROM').AsString);
          TDevice(DeviceList.Objects[nDeviceIndex]).SetArmAreaDisArmCheckTime1To(FindField('AR_AREANO').AsInteger,FindField('AR_DISARMCHECKTIME1TO').AsString);
        end;
        dmDBFunction.UpdateTB_ARMAREA_Field_StringValue(inttostr(nNodeNo),FindField('AC_ECUID').AsString,FindField('AR_AREANO').AsString,'AR_MEMLOAD','Y');
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

procedure TfmMain.FaceCopRelayTimerTimer(Sender: TObject);
begin
  inherited;
  Try
    StatusBar1.Panels[2].Text := 'FaceCopRelaySTART-';
    FaceCopRelayTimer.Enabled := False;
    if CARDLENGTHTYPE <> 1 then Exit; //�������� Ÿ���� �ƴϸ� �����Ұ���
    StatusBar1.Panels[2].Text := 'FaceCopRelayTimerTimer-' + FACECOPRelayLastTime;
    if FACECOPRelayType = 1 then FaceCopRelayStart1
    else if FACECOPRelayType = 2 then FaceCopRelayStart2;
  Finally
    if Not G_bApplicationTerminate and (FACECOPRelayType <> 0) then FaceCopRelayTimer.Enabled := True;
  End;
end;

function TfmMain.FaceCopRelayStart1: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  
  stSql := ' Select ';
  if DBTYPE = 'MSSQL' then stSql := stSql + ' top 3 ';
  stSql := stSql + ' * from TB_FACECOP ';
  stSql := stSql + ' Where FA_UPDATE is Null ';
  stSql := stSql + ' OR FA_UPDATE = ''N'' ';
  stSql := stSql + ' Order by SEQ ';
  if DBTYPE = 'PG' then stSql := stSql + ' LIMIT 1 OFFSET 0 ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    //TCommmode �ε�
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //����ó��
        Exit;
      End;

      if recordCount < 1 then Exit;
      while Not Eof do
      begin
        if FacecopGetEmployee(FindField('FA_EMCODE').AsString,FindField('FA_REGTYPE').AsString,
           FillZeroStrNum(FindField('FA_CARDNO').AsString,10),FindField('FA_EMNAME').AsString,FindField('FA_JIJUMNAME').AsString,
           FindField('FA_DEPARTNAME').AsString,FindField('FA_DUTYNAME').AsString,FindField('FA_HANDPHONE').AsString,
           FindField('FA_PHONE').AsString,FindField('FA_JOINDATE').AsString,'99991231')
           then
        begin
          stSql := ' Update TB_FACECOP set FA_UPDATE = ''Y'' ';
          stSql := stSql + ' Where SEQ = ' + FindField('SEQ').AsString + '';
          DataModule1.ProcessExecSQL(stSql);
        end else
        begin
          stSql := ' Update TB_FACECOP set FA_UPDATE = ''E'' ';
          stSql := stSql + ' Where SEQ = ' + FindField('SEQ').AsString + '';
          DataModule1.ProcessExecSQL(stSql);
        end;
        Application.ProcessMessages;
        sleep(1);
        Next;
      end;       
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.FacecopGetEmployee(aEmCode, aRegType, aCardNo, aEmName,
  aJijumName, aDepartName, aPosiName, aHandPhone, aHomePhone,
  aJoinDate,aExpireDate: string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardNo : string;
  stFdmsID : string;
  stPositionNum : string;
  stSql : string;
begin
  result := False;
  stCompanyCode := '001';
  stFdmsID := '';
  if aRegType = '3' then
  begin
    stSql := 'Update TB_CARD set CA_CARDTYPE = ''3'' ';  //�н�
    stSql := stSql + ' Where CO_COMPANYCODE = ''' + stCompanyCode + ''' ';
    stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
//    stSql := stsql + ' AND EM_CODE = ''' + aEmCode + ''' ';
//    stSql := stSql + ' AND CA_GUBUN = ''3'' ';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'Update TB_DEVICECARDNO set DE_PERMIT = ''N'',DE_RCVACK=''N'' ';
    stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
    DataModule1.ProcessExecSQL(stSql);
//    stSql := 'Delete From TB_Employee ';
//    stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''' ';
//    DataModule1.ProcessExecSQL(stSql);
    CommonModule.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,stFdmsID,
                          '3',stCardNo,'3',aEmName,
                          '','',aJijumName,aDepartName,'');

    result := True;
    Exit;
  end;
  if Trim(aJijumName) = '' then
  begin
    if Trim(aDepartName) = '' then stJijumCode := '000'
    else stJijumCode := '001'
  end else
  begin
    if Not CommonModule.CheckJijumName(stCompanyCode,aJijumName,stJijumCode) then
    begin
      stJijumCode := CommonModule.GetNextJijumCode(stCompanyCode);
      stSql := CommonSql.InsertIntoTB_COMPANY(stCompanyCode,stJijumCode,'000',aJijumName,'2');
      DataModule1.ProcessExecSQL(stSql);
    end;
  end;
  if Trim(aDepartName) = '' then stDepartCode := '000'
  else
  begin
    if Not CommonModule.CheckDepartName(stCompanyCode,stJijumCode,aDepartName,stDepartCode) then
    begin
      stDepartCode := CommonModule.GetNextDepartCode(stCompanyCode,stJijumCode);
      stSql := CommonSql.InsertIntoTB_COMPANY(stCompanyCode,stJijumCode,stDepartCode,aDepartName,'3');
      DataModule1.ProcessExecSQL(stSql);
    end;
  end;
  if Trim(aPosiName) = '' then stPosiCode := '000'
  else
  begin
    if Not CommonModule.CheckPosiName(stCompanyCode,aPosiName,stPosiCode) then
    begin
      stPosiCode := CommonModule.GetNextPosiCode(stCompanyCode);
      stSql := CommonSql.InsertIntoTB_Posi(stCompanyCode,stPosiCode,aPosiName);
      DataModule1.ProcessExecSQL(stSql);
    end;
  end;

  if Not isDigit(aJoinDate) then aJoinDate := formatdatetime('yyyymmdd',now)
  else
  begin
    if Length(aJoinDate) <> 8 then aJoinDate := formatdatetime('yyyymmdd',now);
  end;

  stCardNo := FillCharString(aCardNo,'*',16,False); //16Byte ����

  if CommonModule.CheckTB_EMPLOYEE(stCompanyCode,aEmCode) then
  begin
    stSql := ' Update TB_EMPLOYEE set EM_NAME = ''' + aEmName + ''',';
    stSql := stSql + ' CO_JIJUMCODE = ''' + stJijumCode + ''',';
    stSql := stSql + ' CO_DEPARTCODE = ''' + stDepartCode + ''',';
    stSql := stSql + ' PO_POSICODE = ''' + stPosiCode + ''',';
    stSql := stSql + ' EM_HOMEPHONE = ''' + aHomePhone + ''',';
    stSql := stSql + ' EM_HANDPHONE = ''' + aHandPhone + ''' ';
    if Length(aExpireDate) = 8 then stSql := stSql + ' ,EM_RETIREDATE = ''' + aExpireDate + ''' ';
    stSql := stSql + ' Where CO_COMPANYCODE = ''' + stCompanyCode + ''' ';
    stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
    
    DataModule1.ProcessExecSQL(stSql);
    if CommonModule.CheckTB_CARD(stCardNo) then
    begin
      stSql := 'Update TB_CARD set CO_COMPANYCODE = ''' + stCompanyCode + ''',';
      stSql := stSql + ' EM_CODE = ''' + aEmCode + ''', ';
      stSql := stSql + ' CA_GUBUN = ''3'', ';
      stSql := stSql + ' CA_CARDTYPE = ''1'' ';
      stSql := stSql + ' Where CA_CARDNO = ''' + stCardNo + ''' ';
      DataModule1.ProcessExecSQL(stSql);
    end else
    begin
      stPositionNum := CommonModule.GetNextCardPositionNumber;
      stSql := 'Insert Into TB_CARD (GROUP_CODE,';
      stSql := stSql + 'CA_CARDNO,';
      stSql := stSql + 'CA_GUBUN,';
      stSql := stSql + 'CA_CARDTYPE,';
      stSql := stSql + 'CO_COMPANYCODE,';
      stSql := stSql + 'EM_CODE,';
      stSql := stSql + 'POSITIONNUM ) ';
      stSql := stSql + 'Values( ';
      stSql := stSql + '''' + GROUPCODE + ''', ';
      stSql := stSql + '''' + stCardNo + ''', ';
      stSql := stSql + '''3'', ';
      stSql := stSql + '''1'', ';
      stSql := stSql + '''' + stCompanyCode + ''', ';
      stSql := stSql + '''' + aEmCode + ''', ';
      stSql := stSql + '' + stPositionNum + ') ';
      DataModule1.ProcessExecSQL(stSql);
    end;
  end else
  begin
    stFdmsID := CommonModule.GetNextFdmsID;
    
    stSql := ' Insert Into TB_EMPLOYEE (';
    stSql := stSql + ' GROUP_CODE,';
    stSql := stSql + ' CO_COMPANYCODE,';
    stSql := stSql + ' EM_CODE,';
    stSql := stSql + ' EM_NAME,';
    stSql := stSql + ' CO_JIJUMCODE,';
    stSql := stSql + ' CO_DEPARTCODE,';
    stSql := stSql + ' PO_POSICODE,';
    stSql := stSql + ' EM_HOMEPHONE,';
    stSql := stSql + ' EM_HANDPHONE,';
    stSql := stSql + ' EM_JOINDATE,';
    stSql := stSql + ' EM_RETIREDATE,';
    stSql := stSql + ' FDMS_ID) ';
    stSql := stSql + ' VALUES(';
    stSql := stSql + '''' + GROUPCODE + ''',';
    stSql := stSql + '''' + stCompanyCode + ''',';
    stSql := stSql + '''' + aEmCode + ''',';
    stSql := stSql + '''' + aEmName + ''',';
    stSql := stSql + '''' + stJijumCode + ''',';
    stSql := stSql + '''' + stDepartCode + ''',';
    stSql := stSql + '''' + stPosiCode + ''',';
    stSql := stSql + '''' + aHomePhone + ''',';
    stSql := stSql + '''' + aHandPhone + ''', ';
    stSql := stSql + '''' + aJoinDate + ''', ';
    if Length(aExpireDate) = 8 then stSql := stSql + '''' + aExpireDate + ''', '
    else stSql := stSql + '''99991231'', ';
    stSql := stSql + '' + stFdmsID + ') ';
    DataModule1.ProcessExecSQL(stSql);
    
    if CommonModule.CheckTB_CARD(stCardNo) then
    begin
      stSql := 'Update TB_CARD set CO_COMPANYCODE = ''' + stCompanyCode + ''',';
      stSql := stSql + ' EM_CODE = ''' + aEmCode + ''', ';
      stSql := stSql + ' CA_GUBUN = ''3'', ';
      stSql := stSql + ' CA_CARDTYPE = ''1'' ';
      stSql := stSql + ' Where CA_CARDNO = ''' + stCardNo + ''' ';
      DataModule1.ProcessExecSQL(stSql);
    end else
    begin
      stPositionNum := CommonModule.GetNextCardPositionNumber;
      stSql := 'Insert Into TB_CARD (GROUP_CODE,';
      stSql := stSql + 'CA_CARDNO,';
      stSql := stSql + 'CA_GUBUN,';
      stSql := stSql + 'CA_CARDTYPE,';
      stSql := stSql + 'CO_COMPANYCODE,';
      stSql := stSql + 'EM_CODE,';
      stSql := stSql + 'POSITIONNUM ) ';
      stSql := stSql + 'Values( ';
      stSql := stSql + '''' + GROUPCODE + ''', ';
      stSql := stSql + '''' + stCardNo + ''', ';
      stSql := stSql + '''3'', ';
      stSql := stSql + '''1'', ';
      stSql := stSql + '''' + stCompanyCode + ''', ';
      stSql := stSql + '''' + aEmCode + ''', ';
      stSql := stSql + '' + stPositionNum + ') ';
      DataModule1.ProcessExecSQL(stSql);
    end;
  end;
  CommonModule.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,stFdmsID,
                          '3',stCardNo,'1',aEmName,
                          '','',aJijumName,aDepartName,'');
  result := True;
end;

procedure TfmMain.N40Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmDoorStateReport'); 
end;

function TfmMain.DeleteFdmsUser(aFDMS_ID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if (fdmsType = '0') or (fdmsType = '2') then //����
  begin
    stSql := ' Delete from tb_employe ';
    stSql := stSql + ' Where str_empCode = ''' + 'ep_' + FillZeroNumber(strtoint(aFDMS_ID),7)  + ''' ';
  end else if fdmsType = '1' then //���Ͽ�
  begin
    stSql := 'Delete from Tuser ';
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

procedure TfmMain.DBProcessTimerTimer(Sender: TObject);
var
  stTemp : string;
  stInOutcode : string;
  stInOutCount : string;
  stInOutGroupCode :string;
  stClientSendData : string;
  stSql : string;
  nInOutIndex : integer;
  nWorkTypeIndex : integer;
  bResult : Boolean;
begin
  inherited;
  DBProcessTimer.Enabled := False;
  Try
    if Not TDataBaseConfig.GetObject.DBConnected then
    begin
      StatusBar1.Panels[2].Text := ' DBConnected Fail';
      Exit;
    end;
    //FileToDBLoad;
    Try
      if AlarmEventList.Count > 0 then
      begin
  (*      stTemp := stTime + FillZeroNumber(NodeNo,3) + stEcuID + stMsgNo + stSubClass +
                  stSubAddr + stZoneCode + stMode[1] + stPortNo + stStatus + stState[1] +
                  FillCharString(stOper,20) + FillCharString(stNewStateCode,2) + stAlarmView[1] + stAlarmSound[1] +
                  stAlarmGrade[1] + stCheckOK[1] + FillCharString(stCardNo,20) + FillCharString(stCompanyCode,3) +
                  FillCharString(stEmCode,30);
        AlarmEventList.Add(stTemp); *)
        stTemp := AlarmEventList.Strings[0];
        bResult := True;
        if Not DupCheckTB_ALARMEVENT(copy(stTemp,1,14),
                            copy(stTemp,15,3),
                            copy(stTemp,18,2),
                            copy(stTemp,20,1)) then
        begin
          bResult := InsertTB_ALARMEVENT(copy(stTemp,1,14), //stTime
                            copy(stTemp,15,3),   //NodeNo
                            copy(stTemp,18,2),   //stEcuID
                            copy(stTemp,20,1),   //stMsgNo
                            copy(stTemp,21,2),   //stSubClass,
                            copy(stTemp,23,2),   //stSubAddr,
                            copy(stTemp,25,2),   //stZoneCode,
                            copy(stTemp,27,1),   //stMode,
                            copy(stTemp,28,2),   //stPortNo,
                            copy(stTemp,30,2),   //stStatus,
                            copy(stTemp,32,1),   //stState,
                            Trim(copy(stTemp,33,20)),  //stOper,
                            copy(stTemp,53,2),   //stNewStateCode,
                            copy(stTemp,55,1),   //stAlarmView,
                            copy(stTemp,56,1),   //stAlarmSound,
                            copy(stTemp,57,1),   //stAlarmGrade,
                            copy(stTemp,58,1),   //stCheckOK,
                            Trim(copy(stTemp,59,20)),  //stCardNo,
                            copy(stTemp,79,3),   //stCompanyCode,
                            Trim(copy(stTemp,82,30)) ); //stEmCode);
          dmKTTControl.AlarmEventProcess;
        end;
        if Not bResult then LogAdd(ExeFolder + '\db\ErrAlarmEvent.log',stTemp);
        AlarmEventList.Delete(0);
      end;
    Except
      LogAdd(ExeFolder + '\db\ErrAlarmEvent.log',stTemp);
    End;

    Try
      if AccessEventList.Count > 0 then
      begin
  (*      stEvent := stTimestr + FillZeroNumber(NodeNo,3) + stEcuID + cDoorNo + FillSpace(stCardNo,20) +
                   cReaderNo + cButton + cPosi + cInputType + ReceiveData[37] + ReceiveData[36] +
                   cPermit + FormatdateTime('yyyymmddHHMMSS',Now) + FillZeroStrNum(stCompanyCode,3) + FillSpace(stEmCode,30) +
                   FillZeroStrNum(stJijumCode,3) + FillZeroStrNum(stDepartCode,3) + FillSpace(stEmName,100);
        AccessEventList.Add(stEvent);  *)
        stTemp := AccessEventList.Strings[0];
        bResult := True;
        if Not dmAdoQuery.DupCheckTB_ACCESS_EVENT(copy(stTemp,1,14),strtoint(copy(stTemp,15,3)),copy(stTemp,18,2),copy(stTemp,20,1),Trim(copy(stTemp,21,20))) then
        begin
          stSql := CommonSql.InsertIntoTB_ACCEVENT(
                            copy(stTemp,1,8),    //stDate
                            copy(stTemp,9,6),    //stTime
                            copy(stTemp,15,3),   //inttostr(NodeNo),
                            copy(stTemp,18,2),   //stECUID,
                            copy(stTemp,20,1),   //cDoorNo,
                            Trim(copy(stTemp,21,20)), //stCardNo,
                            copy(stTemp,41,1), //cReaderNo,
                            copy(stTemp,42,1), //cButton,
                            copy(stTemp,43,1), //cPosi,
                            copy(stTemp,44,1), //cInputType,
                            copy(stTemp,45,1), //ReceiveData[37],
                            copy(stTemp,46,1), //ReceiveData[36],
                            copy(stTemp,47,1), //cPermit,
                            copy(stTemp,48,14), //FormatdateTime('yyyymmddHHMMSS',Now),
                            copy(stTemp,62,3), //stCompanyCode,
                            Trim(copy(stTemp,65,30)), //stEmCode,
                            copy(stTemp,95,3), //stJijumCode,
                            copy(stTemp,98,3), //stDepartCode,
                            Trim(copy(stTemp,101,100))); //stEmName);
          //DataModule1.ProcessExecSQL(stSql);
          bResult := DataModule1.ProcessEventExecSQL(stSql);

        end;
        if InOutCountUse then
        begin
        if isDigit(copy(stTemp,47,1)) then // = #$31) or (cPermit = #$32) then  //���� �㰡�̸�
        begin
          stInOutcode := copy(stTemp,15,5);
          stInOutCode := stInOutCode + copy(stTemp,41,1) ;
          nInOutIndex := InOutCardReaderList.IndexOf(stInOutCode);
          if nInOutIndex > -1 then //����� ����ϴ� Count
          begin
            stInOutCount := InOutCountList.Strings[nInOutIndex];
            UpdateTB_INOUTCOUNT_Add(copy(stTemp,1,8),copy(stTemp,15,3),copy(stTemp,18,2),copy(stTemp,20,1),stInOutCount);
            stInOutGroupCode := InOutGroupReaderList.Strings[nInOutIndex];
            if isDigit(stInOutCount) then
            begin
              if strtoint(stInOutCount) < 0 then
              begin
                //���
                DeleteTB_INOUTGROUPLIST(stInOutGroupCode,Trim(copy(stTemp,21,20)));
              end else
              begin
                //�Խ�
                if Not InsertTB_INOUTGROUPLIST(stInOutGroupCode,Trim(copy(stTemp,21,20)),
                                               copy(stTemp,15,3),copy(stTemp,18,2),copy(stTemp,41,1),copy(stTemp,1,14) ) then
                       UpdateTB_INOUTGROUPLIST(stInOutGroupCode,Trim(copy(stTemp,21,20)),
                                               copy(stTemp,15,3),copy(stTemp,18,2),copy(stTemp,41,1),copy(stTemp,1,14) );

              end;
            end;
          end;
         end;
        end;
        //ī�� ���� ������ڸ� ������.
        stSql := 'Update TB_CARD set ca_lastuse = ''' + FormatDateTIme('yyyymmdd',Now) + ''' ';
        stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
        stSql := stSql + ' AND ca_cardno = ''' + Trim(copy(stTemp,21,20)) + ''' ';
        DataModule1.ProcessExecSQL(stSql);
        if Not bResult then LogAdd(ExeFolder + '\db\ErrAccessEvent.log',stTemp);
        AccessEventList.Delete(0);
      end;
    Except
      LogAdd(ExeFolder + '\db\ErrAccessEvent.log',stTemp);
    End;

    Try
      if FoodEventList.Count > 0 then
      begin
  (*        stEvent := stTimestr + FillSpace(stCardNo,20) + FillZeroNumber(NodeNo,3) + stEcuID + cDoorNo +
                     cFoodCode + cPermit + FillZeroStrNum(stCompanyCode,3) + FillZeroStrNum(stJijumCode,3) +
                     FillZeroStrNum(stDepartCode,3) + FillSpace(stEmName,100);
        end;
        FoodEventList.Add(stEvent);
          ProcessFoodData(stTimestr, stCardNo, stECUID,NodeNo,cDoorNo,cFoodCode,cPermit,stJijumCode,stDepartCode,stEmName);    //���Թ�
  *)
        stTemp := FoodEventList.Strings[0];
        ProcessFoodData(copy(stTemp,1,14), Trim(copy(stTemp,15,20)), copy(stTemp,38,2),strtoint(copy(stTemp,35,3)),
                        stTemp[40],stTemp[41],stTemp[42],copy(stTemp,46,3),copy(stTemp,49,3),Trim(copy(stTemp,52,100)));
        FoodEventList.Delete(0);
      end;
    Except
      LogAdd(ExeFolder + '\db\ErrFoodEvent.log',stTemp);
    End;
    Try
      if ATEventList.Count > 0 then
      begin
        (*                                                                          21        23
          stEvent := FillSpace(stAWCode,3) + stTimestr + FillZeroNumber(NodeNo,3) + stEcuID + FillZeroStrNum(stCardNo,20) +
                     43         44         45
                     cDoorNo + cReaderNo + cButton +
                     46                                49
                     FillZeroStrNum(stCompanyCode,3) + FillZeroStrNum(stJijumCode,3) +
                     52                               55                       85
                     FillZeroStrNum(stDepartCode,3) + FillSpace(stEmCode,30) + FillSpace(stEmName,100);
          ATEventList.Add(stEvent);
        *)
        stTemp := ATEventList.Strings[0];

        nWorkTypeIndex := WorkTypeList.IndexOf(copy(stTemp,1,3));
        if nWorkTypeIndex < 0 then
        begin
          stClientSendData := 'R' +
                              'E' +
                              copy(stTemp,18,3) +
                              copy(stTemp,21,2) +
                              '00' +
                              FillZeroNumber(strtoint(copy(stTemp,44,1)),2) +
                              'AT' +
                              'C' +
                              FillZeroNumber(Length(Trim(copy(stTemp,23,20))) + 15 ,3) +
                              copy(stTemp,4,14) +
                              ' ' +
                              Trim(copy(stTemp,23,20));

          ATSendClientData(Self,stClientSendData,strtoint(copy(stTemp,18,3)));
        end else
        begin
          TdmAttendEvent(WorkTypeList.Objects[nWorkTypeIndex]).Process_EmployeeATEvent(copy(stTemp,4,14),copy(stTemp,18,3),copy(stTemp,21,2),Trim(copy(stTemp,23,20)),
                         copy(stTemp,46,3),Trim(copy(stTemp,55,30)),copy(stTemp,49,3),copy(stTemp,52,3),Trim(copy(stTemp,86,100)),copy(stTemp,43,1),copy(stTemp,44,1),copy(stTemp,45,1),copy(stTemp,85,1));
        end;
        ATEventList.Delete(0);
      end;
    Except
      LogAdd(ExeFolder + '\db\ErrATEvent.log',stTemp);
    end;
    
  Finally
    DBProcessTimer.Enabled := L_bDBProcessTimerStart;
  End;
end;

procedure TfmMain.DBLogLoad;
var
	iFindResult: integer;
	srSchRec : TSearchRec;
begin
	iFindResult := FindFirst(ExeFolder + '\db\*.*', faAnyFile - faDirectory, srSchRec);
	while iFindResult = 0 do
	begin
		if UpperCase(copy(srSchRec.Name,1,Length('AlarmEvent'))) = UpperCase('AlarmEvent') then
    begin
      AlarmEventList.LoadFromFile(ExeFolder + '\db\' + srSchRec.Name);
      DeleteFile(ExeFolder + '\db\' + srSchRec.Name);
    end else if UpperCase(copy(srSchRec.Name,1,Length('AccessEvent'))) = UpperCase('AccessEvent') then
    begin
      AccessEventList.LoadFromFile(ExeFolder + '\db\' + srSchRec.Name);
      DeleteFile(ExeFolder + '\db\' + srSchRec.Name);
    end else if UpperCase(copy(srSchRec.Name,1,Length('ATEvent'))) = UpperCase('ATEvent') then
    begin
      ATEventList.LoadFromFile(ExeFolder + '\db\' + srSchRec.Name);
      DeleteFile(ExeFolder + '\db\' + srSchRec.Name);
    end else if UpperCase(copy(srSchRec.Name,1,Length('FoodEvent'))) = UpperCase('FoodEvent') then
    begin
      FoodEventList.LoadFromFile(ExeFolder + '\db\' + srSchRec.Name);
      DeleteFile(ExeFolder + '\db\' + srSchRec.Name);
    end;
		iFindResult := FindNext(srSchRec);
	end;
  FindClose(srSchRec);
end;

procedure TfmMain.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  inherited;
   if Msg.message=WM_USER then
   begin
      if Msg.WParam = SC_MAXIMIZE then
      begin
        tbiDblClick(self);
      end else if Msg.WParam = SC_CLOSE then
      begin
        L_bClose := True;
        Close;
      end;
   end;

end;

function TfmMain.MemoryCardGradeCheck(aCardNo, aNodeNo, aECUID,
  aDoorCheckNo, aPermit,aValidDate: string): integer;
var
  nIndex : integer;
begin
  result := -1; //��� ã�� �� ����.
  nIndex := DeviceList.IndexOf(aNodeNo + aECUID);
  if nIndex < 0 then Exit;
  result := TDevice(DeviceList.Objects[nIndex]).CheckMemoryCardGrade(aCardNo, aDoorCheckNo, aPermit,aValidDate);
end;

function TfmMain.MemoryCardEmployeeInfoCheck(aCardNo: string;
  var aCompanyCode, aEMCode, aJijumCode, aDepartCode, aEmName,
  aAWCode: string): integer;
var
  nIndex : integer;
begin
  result := -1; //��� ã�� �� ����.
  nIndex := CardEmployeeInfoList.IndexOf(aCardNo);
  if nIndex < 0 then Exit;
  if TCardEmployeeInfo(CardEmployeeInfoList.Objects[nIndex]).LoadDate <> FormatDateTime('yyyymmdd',now) then Exit;   //�ε� ��¥�� ������ �ƴϸ� ���� ������.
  aCompanyCode := TCardEmployeeInfo(CardEmployeeInfoList.Objects[nIndex]).CompanyCode;
  aJijumCode := TCardEmployeeInfo(CardEmployeeInfoList.Objects[nIndex]).JijumCode;
  aDepartCode := TCardEmployeeInfo(CardEmployeeInfoList.Objects[nIndex]).DepartCode;
  aEMCode := TCardEmployeeInfo(CardEmployeeInfoList.Objects[nIndex]).EMCode;
  aEmName := TCardEmployeeInfo(CardEmployeeInfoList.Objects[nIndex]).EmName;
  aAWCode := TCardEmployeeInfo(CardEmployeeInfoList.Objects[nIndex]).AWCode;
  result := 1;
end;

procedure TfmMain.CardLoadTimerTimer(Sender: TObject);
begin
  inherited;
(*  StatusBar1.Panels[2].Text := 'CardLoadTimerTimer';
  CardLoadTimer.Enabled := False;
  Try
    if MemoryCardLoad then CardLoadTimer.Interval := 500
    else CardLoadTimer.Interval := 100000;
  Finally
    if Not G_bApplicationTerminate then CardLoadTimer.Enabled := True;
  End;
*)
end;

function TfmMain.MemoryCardLoad: Boolean;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
  oCardEmployeeInfo : TCardEmployeeInfo;
  nTempIndex : integer;
begin
  result := False;
  stSql := 'select ';
  if DBTYPE = 'MSSQL' then stSql := stSql + ' top 3 ';
  stSql := stSql + ' a.CA_CARDNO,a.CO_COMPANYCODE,a.EM_CODE,b.CO_JIJUMCODE,b.CO_DEPARTCODE,';
  stSql := stSql + ' b.EM_NAME,b.AW_CODE from TB_CARD a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_MEMLOAD = ''N'' ' ;
  if DBTYPE = 'PG' then stSql := stSql + ' LIMIT 3 OFFSET 0 ';

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
      While Not Eof do
      begin
        nTempIndex := CardEmployeeInfoList.IndexOf(FindField('CA_CARDNO').AsString);
        if nTempIndex < 0 then
        begin
          oCardEmployeeInfo := TCardEmployeeInfo.Create(nil);
          oCardEmployeeInfo.CompanyCode := FindField('CO_COMPANYCODE').AsString;
          oCardEmployeeInfo.JijumCode := FindField('CO_JIJUMCODE').AsString;
          oCardEmployeeInfo.DepartCode := FindField('CO_DEPARTCODE').AsString;
          oCardEmployeeInfo.EMCode := FindField('EM_CODE').AsString;
          oCardEmployeeInfo.EmName := FindField('EM_NAME').AsString;
          oCardEmployeeInfo.AWCode := FindField('AW_CODE').AsString;
          CardEmployeeInfoList.AddObject(FindField('CA_CARDNO').AsString,oCardEmployeeInfo);
        end else
        begin
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).CompanyCode := FindField('CO_COMPANYCODE').AsString;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).JijumCode := FindField('CO_JIJUMCODE').AsString;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).DepartCode := FindField('CO_DEPARTCODE').AsString;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).EMCode := FindField('EM_CODE').AsString;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).EmName := FindField('EM_NAME').AsString;
          TCardEmployeeInfo(CardEmployeeInfoList.Objects[nTempIndex]).AWCode := FindField('AW_CODE').AsString;
        end;
        dmDBFunction.UpdateTB_CARD_Field_StringValue(FindField('CA_CARDNO').Asstring,'CA_MEMLOAD','Y');
        Application.ProcessMessages;
        Next;
      end;
      First;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;


procedure TfmMain.DaemonArmAreaState(aDeviceID: string);
var
  stMode : string;
  stClientSendData : string;
  nIndex : integer;
  nArmAreaNo : integer;
begin
  nIndex := DeviceList.IndexOf(copy(aDeviceID,1,5));
  if nIndex < 0 then Exit;

  if Not isDigit(copy(aDeviceID,6,1)) then nArmAreaNo := 0
  else nArmAreaNo := strtoint(copy(aDeviceID,6,1));

  Case TDevice(DeviceList.Objects[nIndex]).GetArmAreaState(nArmAreaNo) of
   cmArm : begin  stMode := 'A' end;
   cmDisarm : begin stMode := 'D' end;
   cmTest : begin stMode := 'T' end;
   cmInit : begin stMode := 'I' end;
   cmPatrol : begin stMode := 'P' end;
   cmJaejung : begin stMode := 'E' end;
   else begin stMode := 'E' end;//begin stMode := 'E' end;
  end;
  stClientSendData := 'R' +
                        'A' +
                        copy(aDeviceID,1,5) + //FillZeroNumber(NodeNo,3) +
                                              //aEcuID +
                        FillZeroNumber(nArmAreaNo,2) +
                        '00' +
                        'DV' +
                        'S' +
                        FillZeroNumber(1,3) +
                        stMode;
  SendClientData(stClientSendData);

end;

function TfmMain.LoadMCUID: Boolean;
var
  i : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  for i := LOW(G_stMCUIDCode) to HIGH(G_stMCUIDCode) do
  begin
    G_stMCUIDCode[i] := '0000000';
  end;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    stSql := 'select * from TB_ACCESSDEVICE where AC_GUBUN = ''0'' ';
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        ErrorLogSave(ExeFolder + '\..\log\LOADMCUID'+ FormatDateTIme('yyyymmddhh',Now)+'.log',
               '1253','TB_ACCESSDEVICE Select Error');
        Exit;
      End;
      While Not Eof do
      begin
        G_stMCUIDCode[FindField('AC_NODENO').AsInteger] := FindField('AC_MCUID').AsString;
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

procedure TfmMain.DeviceServerStart;
begin
 dmNodeServerWinSock.ServerPort := L_nDeviceServerPort1; //
 dmNodeServerWinSock.ServerStart := True;
end;

procedure TfmMain.WinSockAccept(Sender: TObject; socket: tSocket;
  aConnectIP: string; aConnectPort: integer);
var
  DeviceSocket : TDeviceSocketInfo;
  nIndex : integer;
begin
  if G_bApplicationTerminate then Exit;
  DeviceSocket := TDeviceSocketInfo.Create;
  DeviceSocket.ClientIP := aConnectIP;
  DeviceSocket.ClientPort := aConnectPort;
  DeviceSocket.WinSocket := socket;
  DeviceSocket.Connected := True;
  DeviceSocket.OnWinSockNodePacket := WinSockNodePacket;
  DeviceSocket.OnWinSockNodeDisConnect := WinSockNodeDisConnect;
  DeviceSocket.SendPacket('00','Q','ID0000000',True,-1);
  nIndex := DeviceConnectList.IndexOf(inttostr(socket));
  if nIndex < 0 then
  begin
    DeviceConnectList.AddObject(inttostr(socket),DeviceSocket);
  end else
  begin
    TDeviceSocketInfo(DeviceConnectList.objects[nIndex]).Free;
    DeviceConnectList.Delete(nIndex);
    DeviceConnectList.AddObject(inttostr(socket),DeviceSocket);
  end;
end;

procedure TfmMain.WinSockReadEvent(Sender: TObject; socket: tSocket);
var
  nIndex : integer;
begin
  nIndex := DeviceConnectList.IndexOf(inttostr(socket));
  if nIndex > -1 then
  begin
    TDeviceSocketInfo(DeviceConnectList.objects[nIndex]).SocketRead;
  end;
end;

procedure TfmMain.WinSockNodePacket(Sender: TObject; aSocket: tSocket;
  aMcuID, ClientIP, ReceiveData: string);
var
  nNodeNo : integer;
  nIndex : integer;
begin
  nNodeNo := GetNodeNoFromMCUID(aMcuID);
  nIndex := ComNodeList.IndexOf('NODE'+InttoStr(nNodeNo));
  if nIndex > -1 then
  begin
    TCommNode(ComNodeList.Objects[nIndex]).WinSocket := aSocket;
    TCommNode(ComNodeList.Objects[nIndex]).ConnectIP := ClientIP;
    TCommNode(ComNodeList.Objects[nIndex]).Open := True;
    TCommNode(ComNodeList.Objects[nIndex]).SocketConnected := True;
    TCommNode(ComNodeList.Objects[nIndex]).MCUID := aMcuID;
    TCommnode(ComNodeList.Objects[nIndex]).LastConnectedTime := Now;
    TCommNode(ComNodeList.Objects[nIndex]).WinSockServerPacket := ReceiveData;
  end;
end;

function TfmMain.GetNodeNoFromMCUID(aMcuID: string): integer;
var
  i : integer;
begin
  result := -1;
  for i := LOW(G_stMCUIDCode) to HIGH(G_stMCUIDCode) do
  begin
    if G_stMCUIDCode[i] = aMcuID then
    begin
      result := i;
      break;
    end;
  end; 
end;

procedure TfmMain.WinSockStop(Sender: TObject; socket: tSocket);
var
  i : integer;
begin
  if DeviceConnectList.Count = 0 then Exit;
  for i := DeviceConnectList.Count - 1 downto 0 do
  begin
    TDeviceSocketInfo(DeviceConnectList.Objects[i]).Free;
  end;
  DeviceConnectList.Clear;
end;

procedure TfmMain.WinSockNodeDisConnect(Sender: TObject; aSocket: tSocket;aMcuID:string);
var
  nNodeNo : integer;
  nIndex : integer;
begin
  nNodeNo := GetNodeNoFromMCUID(aMcuID);
  nIndex := ComNodeList.IndexOf('NODE'+InttoStr(nNodeNo));
  if nIndex > -1 then
  begin
    TCommNode(ComNodeList.Objects[nIndex]).WinSocket := Invalid_Socket;
    TCommNode(ComNodeList.Objects[nIndex]).SocketConnected := False;
    TCommNode(ComNodeList.Objects[nIndex]).Open := False;
  end;
end;

procedure TfmMain.WinSockDisConnect(Sender: TObject; socket: tSocket);
var
  nIndex : integer;
begin
  nIndex := DeviceConnectList.IndexOf(inttostr(socket));
  if nIndex > -1 then
  begin
    TDeviceSocketInfo(DeviceConnectList.objects[nIndex]).Free;
    DeviceConnectList.Delete(nIndex);
  end; 
end;

procedure TfmMain.NodeReConnectAlarmEvent(Sender: TObject;
  NodeNo: integer);
var
  stAlarmData : string;
begin
  stAlarmData := '058 K1000000000AJn'+ FormatDateTime('yyyymmddhhnnss',now) +'MN0000nNR*************B8';
  DeviceRcvAlarmData(Sender,'A',stAlarmData,NodeNo,'001');
end;

function TfmMain.LoadDeviceCardNo(aCardNo:string=''): Boolean;
var
  stCardno: String;
  aDeviceID: String;
  aAccess: String[1];
  aAlarm: String[1];
  aDoor1: String[1];
  aDoor2: String[1];
  aTimeCode: Char;
  aSend: String[1];
  aPermit: Char;
  aDevice: TDevice;
  aCardType: Char;
  aRegCode: Char;
  DeviceIndex: Integer;
  aDownLoadData: String;
  stSql : String;
  TempAdoQuery : TADOQuery;
  i : integer;
  nPositionNum : integer;
  stValidDate : string;
  stAlarmAreaGrade : string;
  stDoorAreaGrade : string;
  stCardTimeCode : string;
  stCardWeekCode : string;
  stCardGroup : string;
  nCount : integer;
begin

  stSql := 'Select ';
  stSql := stSql + 'a.ac_nodeno,a.ac_ecuid,a.ca_cardno,';
  stSql := stSql + 'a.de_door1,a.de_door2,a.de_useaccess,a.de_usealarm,';
  stSql := stSql + 'a.de_timecode,a.de_permit,a.ac_mcuid,b.positionnum,c.em_retiredate,c.EM_CODE, ';
  stSql := stSql + 'a.DE_DOOR3,a.DE_DOOR4,a.DE_DOOR5,a.DE_DOOR6,a.DE_DOOR7,a.DE_DOOR8, ';
  stSql := stSql + 'a.DE_ALARM0,a.DE_ALARM1,a.DE_ALARM2,a.DE_ALARM3,a.DE_ALARM4,a.DE_ALARM5,a.DE_ALARM6,a.DE_ALARM7,a.DE_ALARM8, ';
  stSql := stSql + 'c.DE_TIMECODEUSE,c.TC_GROUP,c.TC_TIME1,c.TC_TIME2,c.TC_TIME3 ,c.TC_TIME4,c.TC_WEEKCODE,a.DE_RCVACK,c.EM_MASTER  ';
  stSql := stSql + ' from TB_DEVICECARDNO a';
  stSql := stsql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.ca_cardno = b.ca_cardno ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON( b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = c.EM_CODE )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ' ;
  if G_bCardFixedUse then
  begin
    if DBTYPE = 'PG' then stSql := stSql + ' AND Length(a.CA_CARDNO) = ' + inttostr(G_nCardFixedLength) + ' '
    else stSql := stSql + ' AND Len(a.CA_CARDNO) = ' + inttostr(G_nCardFixedLength) + ' ';
  end;
  if aCardNo <> '' then stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' order by a.de_permit,a.ca_cardno ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       'carddownload','Select Error');

        Exit;
      End;

      if RecordCount > 0  then
      begin
        First;
        Try
          fmMessage := TfmMessage.Create(nil);
          fmMessage.LabelText := 'ī�嵥���� �ε���...';
          fmMessage.TotCount := RecordCount;
          fmMessage.Show;
          fmMessage.Update;
          nCount := 0;
          Try
            while not eof do
            begin
              if G_bApplicationTerminate then Exit;
              inc(nCount);
              fmMessage.Count := nCount;
              stValidDate := Trim(FindField('em_retiredate').asString);
              if Length(stValidDate) <> 8 then stValidDate := '00000000';
              if Not IsDigit(stValidDate) then stValidDate := '00000000';
              stValidDate := copy(stValidDate,3,6); //��ȿ�Ⱓ

              stCardno:= FindField('CA_CARDNO').asString;
              aDeviceID:= FillZeroNumber(FindField('AC_NODENO').asInteger,3);
              aDeviceID:= aDeviceID + FindField('AC_ECUID').AsString;
              dmDBFunction.UpdateTB_DEVICECARDNO_Field_StringValue(inttostr(FindField('AC_NODENO').asInteger),FindField('AC_ECUID').AsString,stCardno,'DE_MEMLOAD','Y'); //�޸� �ε����� ó��
              Try
                nPositionNum :=  FindField('positionnum').AsInteger;
              Except
                nPositionNum := 0; //���ΰ��
              End;

              if (FindField('DE_DOOR1').IsNull) or (Trim(FindField('DE_DOOR1').asstring) = '')  then aDoor1:='N'
              else aDoor1:= FindField('DE_DOOR1').asString;

              if (FindField('DE_DOOR2').IsNull) or (Trim(FindField('DE_DOOR2').asstring) = '') then aDoor2:='N'
              else aDoor2:= FindField('DE_DOOR2').asString;

              if (FindField('DE_USEACCESS').IsNull) or (Trim(FindField('DE_USEACCESS').asstring) = '')  then aAccess:='N'
              else aAccess:= FindField('DE_USEACCESS').asString;

              if ((FindField('DE_DOOR1').IsNull) or (Trim(FindField('DE_DOOR1').asstring) = '') or (FindField('DE_DOOR1').asstring = 'N')) and
                 ((FindField('DE_DOOR2').IsNull) or (Trim(FindField('DE_DOOR2').asstring) = '') or (FindField('DE_DOOR2').asstring = 'N')) and
                 ((FindField('DE_DOOR3').IsNull) or (Trim(FindField('DE_DOOR3').asstring) = '') or (FindField('DE_DOOR3').asstring = 'N')) and
                 ((FindField('DE_DOOR4').IsNull) or (Trim(FindField('DE_DOOR4').asstring) = '') or (FindField('DE_DOOR4').asstring = 'N')) and
                 ((FindField('DE_DOOR5').IsNull) or (Trim(FindField('DE_DOOR5').asstring) = '') or (FindField('DE_DOOR5').asstring = 'N')) and
                 ((FindField('DE_DOOR6').IsNull) or (Trim(FindField('DE_DOOR6').asstring) = '') or (FindField('DE_DOOR6').asstring = 'N')) and
                 ((FindField('DE_DOOR7').IsNull) or (Trim(FindField('DE_DOOR7').asstring) = '') or (FindField('DE_DOOR7').asstring = 'N')) and
                 ((FindField('DE_DOOR8').IsNull) or (Trim(FindField('DE_DOOR8').asstring) = '') or (FindField('DE_DOOR8').asstring = 'N'))
              then aAccess := 'N'; //1��,2�� ���� ���� ��� ������ ���Ա��� ���°���... 2011.06.09 ����

              if (FindField('DE_USEALARM').IsNull) or (Trim(FindField('DE_USEALARM').asstring) = '')  then aAlarm:='N'
              else aAlarm:= FindField('DE_USEALARM').asString;
              if (FindField('DE_TIMECODE').IsNull) or (Trim(FindField('DE_TIMECODE').asstring) = '')  then aTimeCode:='0'
              else aTimeCode:= FindField('DE_TIMECODE').asstring[1];
              if (FindField('DE_PERMIT').IsNull) or (Trim(FindField('DE_PERMIT').asstring) = '')  then aPermit:='N'
              else aPermit:= FindField('DE_PERMIT').asString[1];
              if FindField('EM_CODE').IsNull then aPermit := 'N';

              if aPermit = 'L' then
              begin
                if aAccess = 'Y' then   //���� �㰡
                begin

                  if (aAlarm = 'Y') or
                     (FindField('DE_ALARM0').AsString = 'Y') or
                     (FindField('DE_ALARM1').AsString = 'Y') or
                     (FindField('DE_ALARM2').AsString = 'Y') or
                     (FindField('DE_ALARM3').AsString = 'Y') or
                     (FindField('DE_ALARM4').AsString = 'Y') or
                     (FindField('DE_ALARM5').AsString = 'Y') or
                     (FindField('DE_ALARM6').AsString = 'Y') or
                     (FindField('DE_ALARM7').AsString = 'Y') or
                     (FindField('DE_ALARM8').AsString = 'Y')
                  then aCardType:= '2' //ī��Ÿ�Լ���: 2=> ���� + ���
                  else                 aCardType:= '0'; //ī��Ÿ�Լ���: 0=> ����

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
                    if (FindField('DE_DOOR3').AsString = 'Y') or
                       (FindField('DE_DOOR4').AsString = 'Y') or
                       (FindField('DE_DOOR5').AsString = 'Y') or
                       (FindField('DE_DOOR6').AsString = 'Y') or
                       (FindField('DE_DOOR7').AsString = 'Y') or
                       (FindField('DE_DOOR8').AsString = 'Y') then
                    begin
                       aRegCode:= '3';
                       if (aAlarm = 'Y') or
                         (FindField('DE_ALARM0').AsString = 'Y') or
                         (FindField('DE_ALARM1').AsString = 'Y') or
                         (FindField('DE_ALARM2').AsString = 'Y') or
                         (FindField('DE_ALARM3').AsString = 'Y') or
                         (FindField('DE_ALARM4').AsString = 'Y') or
                         (FindField('DE_ALARM5').AsString = 'Y') or
                         (FindField('DE_ALARM6').AsString = 'Y') or
                         (FindField('DE_ALARM7').AsString = 'Y') or
                         (FindField('DE_ALARM8').AsString = 'Y')
                       then aCardType:= '2' //ī��Ÿ�Լ���: 2=> ���� + ���
                       else                 aCardType:= '0'; //ī��Ÿ�Լ���: 0=> ����
                    end else
                    begin
                      if (aAlarm = 'Y') or
                         (FindField('DE_ALARM0').AsString = 'Y') or
                         (FindField('DE_ALARM1').AsString = 'Y') or
                         (FindField('DE_ALARM2').AsString = 'Y') or
                         (FindField('DE_ALARM3').AsString = 'Y') or
                         (FindField('DE_ALARM4').AsString = 'Y') or
                         (FindField('DE_ALARM5').AsString = 'Y') or
                         (FindField('DE_ALARM6').AsString = 'Y') or
                         (FindField('DE_ALARM7').AsString = 'Y') or
                         (FindField('DE_ALARM8').AsString = 'Y')
                      then aCardType:= '1' //ī��Ÿ�Լ���: 1=> ��� ����
                      else
                      begin
                        aRegCode:= '0';
                        aPermit:= 'N';
                      end;
                    end;
                  end;
                end else if (aAlarm = 'Y') or
                         (FindField('DE_ALARM0').AsString = 'Y') or
                         (FindField('DE_ALARM1').AsString = 'Y') or
                         (FindField('DE_ALARM2').AsString = 'Y') or
                         (FindField('DE_ALARM3').AsString = 'Y') or
                         (FindField('DE_ALARM4').AsString = 'Y') or
                         (FindField('DE_ALARM5').AsString = 'Y') or
                         (FindField('DE_ALARM6').AsString = 'Y') or
                         (FindField('DE_ALARM7').AsString = 'Y') or
                         (FindField('DE_ALARM8').AsString = 'Y')
                then  // ���� X ,����� OK
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

              stAlarmAreaGrade := CommonModule.GetAlarmAreaGrade(aAlarm,FindField('DE_ALARM0').AsString,FindField('DE_ALARM1').AsString,FindField('DE_ALARM2').AsString,
                                                    FindField('DE_ALARM3').AsString,FindField('DE_ALARM4').AsString,FindField('DE_ALARM5').AsString,
                                                    FindField('DE_ALARM6').AsString,FindField('DE_ALARM7').AsString,FindField('DE_ALARM8').AsString,FindField('EM_MASTER').AsString);
              stDoorAreaGrade := CommonModule.GetDoorAreaGrade(aAccess,FindField('DE_DOOR1').AsString,FindField('DE_DOOR2').AsString,FindField('DE_DOOR3').AsString,
                                                  FindField('DE_DOOR4').AsString,FindField('DE_DOOR5').AsString,FindField('DE_DOOR6').AsString,
                                                  FindField('DE_DOOR7').AsString,FindField('DE_DOOR8').AsString);
              stCardGroup := '0';
              if Not FindField('TC_GROUP').IsNull then stCardGroup := FindField('TC_GROUP').AsString;
              stCardTimeCode := '0000';
              if FindField('TC_TIME1').AsString = 'Y' then stCardTimeCode[4] := '1';
              if FindField('TC_TIME2').AsString = 'Y' then stCardTimeCode[3] := '1';
              if FindField('TC_TIME3').AsString = 'Y' then stCardTimeCode[2] := '1';
              if FindField('TC_TIME4').AsString = 'Y' then stCardTimeCode[1] := '1';
              stCardTimeCode := BinaryToHex(stCardTimeCode);
              if Not FindField('TC_WEEKCODE').IsNull then
              begin
                if FindField('DE_TIMECODEUSE').AsString = 'Y' then
                 stCardWeekCode := '1' + FindField('TC_WEEKCODE').AsString
                else stCardWeekCode := '0' + FindField('TC_WEEKCODE').AsString;
              end else stCardWeekCode := '00000000';
              stCardWeekCode := BinaryToHex(stCardWeekCode);

              DeviceIndex:= DeviceList.IndexOf(aDeviceID);

              if DeviceIndex > -1 then
              begin
                aDevice:= TDevice(DeviceList.Objects[DeviceIndex]);
                if aDevice <> nil then
                begin
                  aDevice.MemoryCardAdd(stCardno,stValidDate, acardType, aRegCode, aTimeCode,aPermit,stAlarmAreaGrade,stDoorAreaGrade,stCardGroup,stCardTimeCode,stCardWeekCode,False,nPositionNum,UseCardPosition,FindField('DE_RCVACK').AsString);
                  StatusBar1.Panels[2].Text := 'LoadDeviceCardNo:'+ stCardno;
                end;
              end;
              Next;
              sleep(1);
              MyProcessMessage;
            end;
          Except
            ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                         'CardMemoryload','CardMemoryload Error');

          End;
        Finally
          fmMessage.Free;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.mn_AntipassCodeClick(Sender: TObject);
begin
  inherited;
  fmAntiPassGroupCode:= TfmAntiPassGroupCode.Create(Self);
  fmAntiPassGroupCode.SHowmodal;
  fmAntiPassGroupCode.Free;    
end;

procedure TfmMain.mn_AntipassDoorClick(Sender: TObject);
begin
  inherited;
  fmDoorAntiPass:= TfmDoorAntiPass.Create(Self);
  fmDoorAntiPass.SHowmodal;
  fmDoorAntiPass.Free;    
end;

function TfmMain.LoadAntiGroup: Boolean;
var
  stSql : string;
  i   : integer;
  TempAdoQuery : TAdoQuery;
  stAntiGroupCode : string;
  nIndex : integer;
  oAntiPassGroup : TAntiPassGroup;
begin
  if AntiGroupList.Count > 0 then
  begin
    for I := AntiGroupList.Count - 1 downto 0 do  TAntiPassGroup(AntiGroupList.Objects[i]).Free;
  end;
  AntiGroupList.Clear;
  
  stSql := ' Select * from TB_ANTIGROUPCODE ';
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
        //����ó��
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      while Not Eof do
      begin
        stAntiGroupCode := inttostr(FindField('AG_CODE').asInteger);
        oAntiPassGroup := TAntiPassGroup.Create(nil);
        oAntiPassGroup.AntiPassGroup := stAntiGroupCode;
        oAntiPassGroup.AntiPassNo := FindField('AG_ANTINO').asInteger;
        AntiGroupList.AddObject(stAntiGroupCode,oAntiPassGroup);
         
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.AntiPassProcess(aAntiGroup,aDeviceIndex:integer;aTime, aNodeNo, aECUID, aDoorNo, aCardNo,
  aReaderNo, aButton, aPosi, aInputType, aDoorMode, aPermitMode,
  aPermitCode: string): integer;
var
  stSql : string;
  nCardCheck : integer;
  nSCSResult : integer;
  nAntiInOut : integer;
  nAntiIndex : integer;
  cAuth : char;
  stVoice : string;
  stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,stAWCode : string;
begin
  result := -1;

  stSql :=  'Insert into TB_ACCESSEVENT';
  stSql := stSql + '(GROUP_CODE,AC_DATE,AC_TIME,AC_NODENO,AC_ECUID,';
  stSql := stSql + 'DO_DOORNO,CA_CARDNO,AC_READERNO,AC_BUTTONNO,AC_DOORPOSI,AC_INPUTTYPE,';
  stSql := stSql + 'AC_DOORMODE,AC_PERMITMODE,PE_PERMITCODE,AC_INSERTDATE)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + copy(aTime,1,8) + ''',';
  stSql := stSql + '''' + copy(aTime,9,6) + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aReaderNo + ''',';
  stSql := stSql + '''' + aButton + ''',';
  stSql := stSql + '''' + aPosi + ''',';
  stSql := stSql + '''' + aInputType + ''',';
  stSql := stSql + '''' + aDoorMode + ''',';    //�/����
  stSql := stSql + '''' + aPermitMode + ''',';  //Posi/Nega
  stSql := stSql + '''' + aPermitCode + ''',';
  stSql := stSql + '''' + formatDateTime('yyyymmddhhnnss',now) + ''')';

  DataModule1.ProcessEventExecSQL(stSql);  //�ϴ� ī�� �±� �Է�

  nCardCheck := TDevice(DeviceList.Objects[aDeviceIndex]).CheckDoorMemoryGrade(aCardNo,strtoint(aDoorNo));
  if nCardCheck = -2 then  //�޸� �ε��� �ȵ� ����̴�.
  begin
    LoadDeviceCardNo(aCardNo);
    nCardCheck := TDevice(DeviceList.Objects[aDeviceIndex]).CheckDoorMemoryGrade(aCardNo,strtoint(aDoorNo));
  end;
  cAuth := 'N';
  if nCardCheck = 1 then  //���Ա����� �ִ� ��� ��Ƽ �н� üũ ����.
  begin
    if isDigit(aReaderNo) then
    begin
      nAntiInOut := strtoint(aReaderNo) mod 2;
      nAntiIndex := AntiGroupList.IndexOf(inttostr(aAntiGroup));
      if nAntiIndex > -1 then
      begin
        nSCSResult := TAntiPassGroup(AntiGroupList.Objects[nAntiIndex]).AntiPassCardCheck(aCardNo,nAntiInOut);
        if nSCSResult = 0 then
        begin
          //cAuth := 'N';
          cAuth := 'A';
          stVoice := dec2Hex(28,2);      //��Ƽ�н� �������Դϴ�.
          result := -2;
        end else
        begin
          //cAuth := 'R';
          cAuth := 'P';
          stVoice := dec2Hex(14,2); //nVoice := 14;   //�����Ǿ����ϴ�.
        end;
        nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,cAuth,stVoice);
      end else
      begin
        cAuth := 'A';
        //nVoice := 10;
        stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
        nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,cAuth,stVoice);
      end;
    end;
  end else                //���Ա����� ���� ��� ���� �Ұ� �޽��� ��� ����..
  begin
    //cAuth := 'N';
    cAuth := 'A';
    //nVoice := 10;
    stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
    nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,cAuth,stVoice);
  end;

  if (nSCSResult = SUCCESSDEVICESEND) and ((cAuth = 'R') OR (cAuth='P')) then  //���� ���� �Ѱ�� ó������.
  begin
    result := 1;
    CommonModule.GetEmployeeInfo_AWCODE(aCardNo,False,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,stAWCode);


    stSql := ' Update TB_ACCESSEVENT set PE_PERMITCODE = ''1'', ';  //���Խ��� ����
    stSql := stSql + ' CO_COMPANYCODE = ''' + stCompanyCode + ''',';
    stSql := stSql + ' EM_CODE = ''' + stEMCode + ''',';
    stSql := stSql + ' CO_JIJUMCODE = ''' + stJijumCode + ''',';
    stSql := stSql + ' CO_DEPARTCODE = ''' + stDepartCode + ''',';
    stSql := stSql + ' EM_NAME = ''' + stEmName + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_DATE = ''' + copy(aTime,1,8) + ''' ';
    stSql := stSql + ' AND AC_TIME = ''' + copy(aTime,9,6) + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
    stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

    DataModule1.ProcessEventExecSQL(stSql);  //�ϴ� ī�� �±� �Է� 

  end else
  begin
    CommonModule.GetEmployeeInfo_AWCODE(aCardNo,False,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,stAWCode);

    if result = -2 then
      stSql := ' Update TB_ACCESSEVENT set PE_PERMITCODE = ''J'', '   //���Խ��� ����
    else stSql := ' Update TB_ACCESSEVENT set PE_PERMITCODE = ''A'', ';
    stSql := stSql + ' CO_COMPANYCODE = ''' + stCompanyCode + ''',';
    stSql := stSql + ' EM_CODE = ''' + stEMCode + ''',';
    stSql := stSql + ' CO_JIJUMCODE = ''' + stJijumCode + ''',';
    stSql := stSql + ' CO_DEPARTCODE = ''' + stDepartCode + ''',';
    stSql := stSql + ' EM_NAME = ''' + stEmName + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_DATE = ''' + copy(aTime,1,8) + ''' ';
    stSql := stSql + ' AND AC_TIME = ''' + copy(aTime,9,6) + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
    stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

    DataModule1.ProcessEventExecSQL(stSql);  //�ϴ� ī�� �±� �Է� 
  end;

end;

function TfmMain.FaceCopRelayStart2: Boolean;
var
  TempFaceAdoQuery : TAdoQuery;
  stSql : string;
  stCurrentTime : string;
  stType : string;
begin
  result := False;
  if Not dmRelayDB.FaceCopDBConnected then dmRelayDB.FaceCopDataBaseConnect(FACECOPRelayServerIP,L_stFaceCopPort,L_stFaceCopDBName,L_stFaceCopUserID,L_stFaceCopUserPW,False,FACEODBCType);
  if dmRelayDB.FaceCopDBConnected then
  begin
    Try
      CoInitialize(nil);
      TempFaceAdoQuery := TADOQuery.Create(nil);
      TempFaceAdoQuery.Connection := dmRelayDB.FaceCopADOConnection;
      TempFaceAdoQuery.DisableControls;

      stSql := 'select now() as curTime';
      with TempFaceAdoQuery do
      begin
        Close;
        Sql.Text := stSql;
        Try
          Open;
        Except
          dmRelayDB.FaceCopDBConnected := False;
          Exit;
        End;
        if Not Findfield('curTime').IsNull then
        begin
          stCurrentTime := formatDateTime('yyyymmddhhnnss',(Findfield('curTime').AsDateTime - (1/(24*60*60))) );
        end else
        begin
          stCurrentTime := formatDateTime('yyyymmddhhnnss',Now - (1/(24*60*60)) );
        end;

        stSql := ' Select * from facedb.tb_employee_811 ';
        if FACECOPRelayLastTime = '' then
        begin
          stSql := stSql + ' Where mdfy_dttm < ''' + stCurrentTime + ''' ';
        end else
        begin
          stSql := stSql + ' Where mdfy_dttm > ''' + FACECOPRelayLastTime + ''' ';
          stSql := stSql + ' AND mdfy_dttm < ''' + stCurrentTime + ''' ';
        end;

        Close;
        Sql.Text := stSql;
        Try
          Open;
        Except
          Memo1.Text := stSql;
          StatusBar1.Panels[2].Text := 'FaceCopRelayTimerTimer-SQL Open Error';
          dmRelayDB.FaceCopDBConnected := False;
          Exit;
        End;
        if recordcount < 1 then Exit;
        While Not Eof do
        begin
          stType := '1';
          if FindField('emp_stts').asstring = '9' then stType := '3';
          if Not FacecopGetEmployee(FindField('emp_no').AsString,stType,
             FillZeroStrNum(FindField('card_no').AsString,10),FindField('emp_name').AsString,FindField('dept_name').AsString,
             '',FindField('duty_name').AsString,FindField('mobil_num').AsString,
             FindField('phone_num').AsString,FindField('emp_reg_date').AsString,FindField('emp_exp_date').AsString) then
          begin
            stSql := CommonSql.UpdateTB_CONFIG('RELAY','FALASTTIME',FACECOPRelayLastTime);
            DataModule1.ProcessExecSQL(stSql);
            Exit;
          end;
          FACECOPRelayLastTime := FindField('mdfy_dttm').asstring;
          Application.ProcessMessages;
          sleep(1);
          Next;
        end;
        stSql := CommonSql.UpdateTB_CONFIG('RELAY','FALASTTIME',FACECOPRelayLastTime);
        DataModule1.ProcessExecSQL(stSql);
      end;
    Finally
      TempFaceAdoQuery.EnableControls;
      TempFaceAdoQuery.Free;
      CoUninitialize;
    End;
  end;
end;

function TfmMain.FileToDBLoad: Boolean;
var
	iFindResult: integer;
	srSchRec : TSearchRec;
  EventFileNameList : TStringList;
  i : integer;
  stFileName : string;
  bResult : Boolean;
begin
  Try
    EventFileNameList := TStringList.Create;
    iFindResult := FindFirst(ExeFolder + '\LogDB\*.*', faAnyFile - faDirectory, srSchRec);
    while iFindResult = 0 do
    begin
      if FormatDateTime('yyyymmddhhnnss',FileTimeToDateTime(srSchRec.FindData.ftCreationTime)) < FormatDateTime('yyyymmddhhnnss',Now)  then  //���� Add �ϰ� �ִ� ������ �ǵ帮�� �ȵ�...
      begin
        EventFileNameList.Add(srSchRec.Name);
      end;
      iFindResult := FindNext(srSchRec);
    end;
    FindClose(srSchRec);

    if EventFileNameList.Count < 1 then Exit;
    EventFileNameList.Sort;

    for i := 0 to EventFileNameList.Count - 1 do
    begin
      bResult := False;
      if UpperCase(copy(EventFileNameList.Strings[i],1,length('CardAccessEvent'))) = UpperCase('CardAccessEvent') then
      begin
        stFileName := ExeFolder + '\LogDB\' + EventFileNameList.Strings[i];
        bResult := FileToDBInsertCardAccessEvent(stFileName);
      end else if UpperCase(copy(EventFileNameList.Strings[i],1,length('AlarmEvent'))) = UpperCase('AlarmEvent') then
      begin
        stFileName := ExeFolder + '\LogDB\' + EventFileNameList.Strings[i];
        bResult := FileToDBInsertAlarmEvent(stFileName);
      end;
      if bResult then DeleteFile(stFileName);
      StatusBar1.Panels[2].Text := stFileName + ' Load Success';
      sleep(1);
      Application.ProcessMessages;
    end;

  Finally
    EventFileNameList.Free;
  End;
end;

function TfmMain.FileToDBInsertAlarmEvent(aFileName: string): Boolean;
var
  EventList : TStringList;
  stTemp : string;
  i : integer;
  bResult : Boolean;
begin
  result := False;
  Try
    EventList := TStringList.Create;
    EventList.LoadFromFile(aFileName);
    if EventList.Count > 0 then
    begin
      for i := 0 to EventList.Count - 1 do
      begin
        Try
          stTemp := EventList.Strings[i];
          bResult := True;
          if Not DupCheckTB_ALARMEVENT(copy(stTemp,1,14),
                              copy(stTemp,15,3),
                              copy(stTemp,18,2),
                              copy(stTemp,20,1)) then
          begin
            bResult := InsertTB_ALARMEVENT(copy(stTemp,1,14), //stTime
                              copy(stTemp,15,3),   //NodeNo
                              copy(stTemp,18,2),   //stEcuID
                              copy(stTemp,20,1),   //stMsgNo
                              copy(stTemp,21,2),   //stSubClass,
                              copy(stTemp,23,2),   //stSubAddr,
                              copy(stTemp,25,2),   //stZoneCode,
                              copy(stTemp,27,1),   //stMode,
                              copy(stTemp,28,2),   //stPortNo,
                              copy(stTemp,30,2),   //stStatus,
                              copy(stTemp,32,1),   //stState,
                              Trim(copy(stTemp,33,20)),  //stOper,
                              copy(stTemp,53,2),   //stNewStateCode,
                              copy(stTemp,55,1),   //stAlarmView,
                              copy(stTemp,56,1),   //stAlarmSound,
                              copy(stTemp,57,1),   //stAlarmGrade,
                              copy(stTemp,58,1),   //stCheckOK,
                              Trim(copy(stTemp,59,20)),  //stCardNo,
                              copy(stTemp,79,3),   //stCompanyCode,
                              Trim(copy(stTemp,82,30)) ); //stEmCode);
            dmKTTControl.AlarmEventProcess;
          end;
          if Not bResult then LogAdd(ExeFolder + '\db\ErrAlarmEvent.log',stTemp);
        Except
          LogAdd(ExeFolder + '\db\ErrAlarmEvent.log',stTemp);
        End;
      end;
    end;
  Finally
    EventList.Free;
  End;
  result := True;
end;

function TfmMain.FileToDBInsertCardAccessEvent(aFileName: string): Boolean;
var
  EventList : TStringList;
  stTemp : string;
  i : integer;
  bResult : Boolean;
  stSql : string;
  stInOutcode : string;
  nInOutIndex : integer;
  stInOutCount : string;
  stInOutGroupCode : string;
begin
  result := False;
  Try
    EventList := TStringList.Create;
    EventList.LoadFromFile(aFileName);
    Try
      if EventList.Count > 0 then
      begin
        for i := 0 to EventList.Count - 1 do
        begin
          stTemp := EventList.Strings[i];
          bResult := True;
          if Not dmAdoQuery.DupCheckTB_ACCESS_EVENT(copy(stTemp,1,14),strtoint(copy(stTemp,15,3)),copy(stTemp,18,2),copy(stTemp,20,1),Trim(copy(stTemp,21,20))) then
          begin
            stSql := CommonSql.InsertIntoTB_ACCEVENT(
                              copy(stTemp,1,8),    //stDate
                              copy(stTemp,9,6),    //stTime
                              copy(stTemp,15,3),   //inttostr(NodeNo),
                              copy(stTemp,18,2),   //stECUID,
                              copy(stTemp,20,1),   //cDoorNo,
                              Trim(copy(stTemp,21,20)), //stCardNo,
                              copy(stTemp,41,1), //cReaderNo,
                              copy(stTemp,42,1), //cButton,
                              copy(stTemp,43,1), //cPosi,
                              copy(stTemp,44,1), //cInputType,
                              copy(stTemp,45,1), //ReceiveData[37],
                              copy(stTemp,46,1), //ReceiveData[36],
                              copy(stTemp,47,1), //cPermit,
                              copy(stTemp,48,14), //FormatdateTime('yyyymmddHHMMSS',Now),
                              copy(stTemp,62,3), //stCompanyCode,
                              Trim(copy(stTemp,65,30)), //stEmCode,
                              copy(stTemp,95,3), //stJijumCode,
                              copy(stTemp,98,3), //stDepartCode,
                              Trim(copy(stTemp,101,100))); //stEmName);
            //DataModule1.ProcessExecSQL(stSql);
            bResult := DataModule1.ProcessEventExecSQL(stSql);

          end;
          if InOutCountUse then
          begin
          if isDigit(copy(stTemp,47,1)) then // = #$31) or (cPermit = #$32) then  //���� �㰡�̸�
          begin
            stInOutcode := copy(stTemp,15,5);
            stInOutCode := stInOutCode + copy(stTemp,41,1) ;
            nInOutIndex := InOutCardReaderList.IndexOf(stInOutCode);
            if nInOutIndex > -1 then //����� ����ϴ� Count
            begin
              stInOutCount := InOutCountList.Strings[nInOutIndex];
              UpdateTB_INOUTCOUNT_Add(copy(stTemp,1,8),copy(stTemp,15,3),copy(stTemp,18,2),copy(stTemp,20,1),stInOutCount);
              stInOutGroupCode := InOutGroupReaderList.Strings[nInOutIndex];
              if isDigit(stInOutCount) then
              begin
                if strtoint(stInOutCount) < 0 then
                begin
                  //���
                  DeleteTB_INOUTGROUPLIST(stInOutGroupCode,Trim(copy(stTemp,21,20)));
                end else
                begin
                  //�Խ�
                  if Not InsertTB_INOUTGROUPLIST(stInOutGroupCode,Trim(copy(stTemp,21,20)),
                                                 copy(stTemp,15,3),copy(stTemp,18,2),copy(stTemp,41,1),copy(stTemp,1,14) ) then
                         UpdateTB_INOUTGROUPLIST(stInOutGroupCode,Trim(copy(stTemp,21,20)),
                                                 copy(stTemp,15,3),copy(stTemp,18,2),copy(stTemp,41,1),copy(stTemp,1,14) );

                end;
              end;
            end;
           end;
          end;
          //ī�� ���� ������ڸ� ������.
          stSql := 'Update TB_CARD set ca_lastuse = ''' + FormatDateTIme('yyyymmdd',Now) + ''' ';
          stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
          stSql := stSql + ' AND ca_cardno = ''' + Trim(copy(stTemp,21,20)) + ''' ';
          DataModule1.ProcessExecSQL(stSql);
          if Not bResult then LogAdd(ExeFolder + '\db\ErrAccessEvent.log',stTemp);
        end;
      end;
    Except
      LogAdd(ExeFolder + '\db\ErrAccessEvent.log',stTemp);
    End;
  Finally
    EventList.Free;
  End;
  result := True;
end;

function TfmMain.DAEMON_LogServerExecute: Boolean;
var
  SEInfo: TShellExecuteInfo;
begin
  result := False;
  //���⿡�� ���α׷� ���� ��Ű��.
  if FileExists(ExeFolder + '\ZDAEMON_LogServer.exe') then
  begin
    (*
    FillChar(SEInfo,SizeOf(SEInfo),0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    with SEInfo do
    begin
      fMask        := SEE_MASK_NOCLOSEPROCESS;
      //fMask        := nil;
      Wnd          := 0;
      lpFile       := PChar('ZDAEMON_LogServer.exe');
      lpParameters := PChar('');
      lpDirectory  := PChar(ExeFolder + '\');
      lpVerb       := pchar('open');
      hInstApp     := 0;
      nShow        := SW_SHOWNORMAL;
    end;
    ShellExecuteEx(@SEInfo);
    *)
    //ShellExecute(0, 'runas', pchar(ExeFolder + '\ZDAEMON_LogServer.exe'),nil,nil, SW_SHOW);
    //ShellExecute(0, 'Open', pchar(ExeFolder + '\ZDAEMON_LogServer.exe'),nil,nil, SW_NORMAL);
    My_RunDosCommand(pchar(ExeFolder + '\ZDAEMON_LogServer.exe'),False,False,False);
    result := True;
  end;
end;

procedure TfmMain.LogServerTimerTimer(Sender: TObject);
var
  bLogServer : Boolean;
  ProcessList : TStringList;
  pSelfID : DWORD;
  i : integer;
begin
  inherited;
  Try
    bLogServer := False;
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('ZDAEMON_LogServer.exe') then  //���� �ǰ� ������
      begin
        bLogServer := True;
        Break;
      end;
    end;

    if Not bLogServer then
    begin
      DAEMON_LogServerExecute;
    end;
  Finally
    ProcessList.Clear;
    ProcessList.Free;
  End;
end;

function TfmMain.GetSonghoConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  L_nFoodDayLimitCount := 0;        //���� �ļ� ���� Ƚ��
  L_nFoodWeekLimitCount := 0;       //�ֺ� �ļ� ���� Ƚ��
  L_nFoodSemesterLimitCount := 0;   //�б⺰ �ļ� ���� Ƚ��

  stSql := 'Select * from TB_SONGHOFDCONFIG ';
  
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
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if FindField('SF_CODE').AsString = 'DAY' then
        begin
          if FindField('SF_USE').AsString = 'Y' then L_nFoodDayLimitCount := FindField('SF_COUNT').AsInteger
          else L_nFoodDayLimitCount := 0;
        end else if FindField('SF_CODE').AsString = 'WEEK' then
        begin
          if FindField('SF_USE').AsString = 'Y' then L_nFoodWeekLimitCount := FindField('SF_COUNT').AsInteger
          else L_nFoodWeekLimitCount := 0;
        end else if FindField('SF_CODE').AsString = 'SEMESTER' then
        begin
          if FindField('SF_USE').AsString = 'Y' then L_nFoodSemesterLimitCount := FindField('SF_COUNT').AsInteger
          else L_nFoodSemesterLimitCount := 0;
        end;
        Next;
        Application.ProcessMessages;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.SetNowDate(const Value: string);
var
  i : integer;
begin
  if FNowDate = Value then Exit;
  FNowDate := Value;

  //���⼭ ��� �ö�� �޸� ī�� ���� ����.
  for i := DeviceList.Count - 1 downto 0 do
  begin
    TDevice(DeviceList.Objects[i]).MemoryCardClear;
  end;

  //���⼭ ���� ����,����,�б� ��� ����.

//  FoodCurrentWeekDay := WeeksInYear(Now); //������ ���������� ����
  FoodCurrentWeekDay := WeekOf(Now); //������ ���������� ����
  FoodCurrentSemesterCode := GetFoodCurrentSemesterCode(Value);  //�б� �ڵ�
  for i := FoodServerEmployeeList.Count - 1 downto 0 do
    TFoodEmployee(FoodServerEmployeeList.Objects[i]).FoodDayCount := 0;
end;

function TfmMain.GetFoodCurrentSemesterCode(aDate:string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stDate : string;
begin
  stDate := copy(aDate,5,4);
  result := 0;
  stSql := 'Select * from TB_SEMESTER ';
  stSql := stSql + ' where SE_STARTDATE <= ''' + stDate + ''' ';
  stSql := stSql + ' AND SE_ENDDATE >= ''' + stDate + ''' ';
  stSql := stSql + ' AND SE_USE = ''Y'' ';
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
      if recordcount < 1 then Exit;
      result := FindField('SE_CODE').AsInteger;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.SetFoodCurrentWeekDay(const Value: integer);
var
  i : integer;
begin
  if FFoodCurrentWeekDay = Value then Exit;
  FFoodCurrentWeekDay := Value;
  //���⼭ �ε� �Ǿ� �ִ� �ļ� ���� Count �� Clear �Ѵ�
  for i := FoodServerEmployeeList.Count - 1 downto 0 do
    TFoodEmployee(FoodServerEmployeeList.Objects[i]).FoodWeekCount := 0;
end;

procedure TfmMain.SetFoodCurrentSemesterCode(const Value: integer);
var
  i : integer;
begin
  if FFoodCurrentSemesterCode = Value then Exit;
  FFoodCurrentSemesterCode := Value;
  //���⼭ �ε� �Ǿ� �ִ� �ļ� ���� Count �� Clear �Ѵ�
  for i := FoodServerEmployeeList.Count - 1 downto 0 do
    TFoodEmployee(FoodServerEmployeeList.Objects[i]).FoodSemesterCount := 0;
end;

procedure TfmMain.SetFoodCurrentFoodCode(const Value: string);
var
  i : integer;
begin
  if FFoodCurrentFoodCode = Value then Exit;
  FFoodCurrentFoodCode := Value;
  for i := FoodServerEmployeeList.Count - 1 downto 0 do
    TFoodEmployee(FoodServerEmployeeList.Objects[i]).FoodCodeCountInitialize;
end;

procedure TfmMain.FoodTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  if Not L_bDaemonStart then Exit;
  FoodTimer.Enabled := False;
  Try
    if G_bApplicationTerminate then Exit;
    FoodTimeSetting;
    StatusBar1.Panels[4].Text := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
  Finally
    FoodTimer.Enabled := True;
  End;
end;

procedure TfmMain.FoodTimeSetting;
var
  stNowTime : string;
begin
  NowDate := FormatDateTime('yyyymmdd',Now);
  stNowTime := FormatDateTime('hhnn',Now);
  FoodCurrentFoodCode := GetFoodCurrentCode(stNowTime);
end;

function TfmMain.SonghoFoodProcess(aDeviceIndex: integer; aTime, aNodeNo,
  aECUID, aDoorNo, aCardNo, aReaderNo, aButton, aPosi, aInputType,
  aDoorMode, aCardManageMode, aPermitCode: string): char;
var
  stSql : string;
  nCardCheck : integer;
  nSCSResult : integer;
  nAntiInOut : integer;
  nAntiIndex : integer;
  cAuth : char;
  stVoice : string;
  stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,stAWCode : string;
  nEmployeeIndex : integer;
  cResult : char;
  stCurrentFoodCode : string;
  nCurrentWeekDay : integer;
  nCurrentSemesterCode : integer;
  dtTempTime : TDateTime;
begin
  result := 'A';

  cResult := '1';

  stSql :=  'Insert into TB_ACCESSEVENT';
  stSql := stSql + '(GROUP_CODE,AC_DATE,AC_TIME,AC_NODENO,AC_ECUID,';
  stSql := stSql + 'DO_DOORNO,CA_CARDNO,AC_READERNO,AC_BUTTONNO,AC_DOORPOSI,AC_INPUTTYPE,';
  stSql := stSql + 'AC_DOORMODE,AC_PERMITMODE,PE_PERMITCODE,AC_INSERTDATE)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + copy(aTime,1,8) + ''',';
  stSql := stSql + '''' + copy(aTime,9,6) + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aReaderNo + ''',';
  stSql := stSql + '''' + aButton + ''',';
  stSql := stSql + '''' + aPosi + ''',';
  stSql := stSql + '''' + aInputType + ''',';
  stSql := stSql + '''' + aDoorMode + ''',';    //�/����
  stSql := stSql + '''' + aCardManageMode + ''',';  //Posi/Nega
  stSql := stSql + '''' + aPermitCode + ''',';
  stSql := stSql + '''' + formatDateTime('yyyymmddhhnnss',now) + ''')';

  DataModule1.ProcessEventExecSQL(stSql);  //�ϴ� ī�� �±� �Է�

  nCardCheck := TDevice(DeviceList.Objects[aDeviceIndex]).CheckDoorMemoryGrade(aCardNo,strtoint(aDoorNo));
  if nCardCheck = -2 then  //�޸� �ε��� �ȵ� ����̴�.
  begin
    LoadDeviceCardNo(aCardNo);
    nCardCheck := TDevice(DeviceList.Objects[aDeviceIndex]).CheckDoorMemoryGrade(aCardNo,strtoint(aDoorNo));
  end;

  if aCardManageMode = '2' then  //Positive-ACK�ΰ��
  begin
    cAuth := 'N';
    if FoodCurrentFoodCode <> '' then
    begin
      if nCardCheck = 1 then  //������ �ִ� ��� �Ϻ�/�ֺ�/�б⺰ ī��Ʈ üũ����.
      begin
        if CommonModule.GetEmployeeInfo_AWCODE(aCardNo,False,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,stAWCode) then //��������� ���� �ϸ�
        begin
          nEmployeeIndex := FoodServerEmployeeList.IndexOf(stCompanyCode + stEMCode);
          if nEmployeeIndex < 0 then
          begin
            AddFoodServerEmployeeList(stCompanyCode,stEMCode);
            nEmployeeIndex := FoodServerEmployeeList.IndexOf(stCompanyCode + stEMCode);
          end;
          if stCompanyCode <> '001' then
          begin
            if nEmployeeIndex > -1 then
            begin
              if L_nFoodDupEvent = 1 then //�ѳ� �Ļ翡 �ߺ� ����
              begin
                if TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).GetFoodCodeCount(strtoint(FoodCurrentFoodCode)) > 0 then  //2�� �̻� ���� ���
                begin
                  cAuth := 'A';
                  stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
                  TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('2');
                  nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
                  cResult := 'Z';
                end;
              end;
              if (cResult = '1') and (L_nFoodDayLimitCount > 0) then  //�Ϻ� Ƚ������ üũ
              begin
                if TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodDayCount >= L_nFoodDayLimitCount then  //���� �ܼ� �̻� ���� ���
                begin
                  cAuth := 'A';
                  stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
                  TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('2');
                  nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
                  cResult := 'Z';
                end;
              end;
              if (cResult = '1') and (L_nFoodWeekLimitCount > 0) then  //�ֺ� Ƚ������ üũ
              begin
                if TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodWeekCount >= L_nFoodWeekLimitCount then  //���� �ܼ� �̻� ���� ���
                begin
                  cAuth := 'A';
                  stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
                  TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('2');
                  nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
                  cResult := 'Z';
                end;
              end;
              if (cResult = '1') and (L_nFoodSemesterLimitCount > 0) then  //�б⺰ Ƚ������ üũ
              begin
                if FoodCurrentSemesterCode = 0 then  //�б����� �ƴ� ���
                begin
                  cAuth := 'A';
                  stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
                  TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('2');
                  nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
                  cResult := 'Z';
                end else if TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodSemesterCount >= L_nFoodSemesterLimitCount then  //���� �ܼ� �̻� ���� ���
                begin
                  cAuth := 'A';
                  stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
                  TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('2');
                  nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
                  cResult := 'Z';
                end;
              end;
              if cResult = '1' then
              begin
                cAuth := 'P';
                stVoice := dec2Hex(14,2); //nVoice := 14;   //�����Ǿ����ϴ�.
                //stVoice := dec2Hex(10,2); //nVoice := 14;   //�����Ǿ����ϴ�.
                TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('1');
                nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
              end;
            end else
            begin
              cAuth := 'A';
              stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
              TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('2');
              nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
              cResult := 'A'; //�̵��ī��
            end;
          end else
          begin
            if nEmployeeIndex > -1 then
            begin
              //�������� ������ �Ļ� ����.
//              cResult := '1';
              cAuth := 'P';
              stVoice := dec2Hex(14,2); //nVoice := 14;   //�����Ǿ����ϴ�.
              //stVoice := dec2Hex(10,2); //nVoice := 14;   //�����Ǿ����ϴ�.
              TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('1');
              nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
            end else
            begin
              cAuth := 'A';
              stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
              TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('2');
              nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
              cResult := 'A'; //�̵��ī��
            end;
          end;
        end else //��������� ���� ���� ������
        begin
          cAuth := 'A';
          stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
          TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('2');
          nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
          cResult := 'A'; //�̵��ī��
        end;
      end else                //���Ա����� ���� ��� ���� �Ұ� �޽��� ��� ����..
      begin
        cAuth := 'A';
        stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
        TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('2');
        nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
        cResult := 'A'; //�̵��ī��
      end;
    end else
    begin
      cAuth := 'A';
      stVoice := dec2Hex(10,2);               //�����ڿ��� �����ϼ���.
      TDevice(DeviceList.Objects[aDeviceIndex]).DoorExitButton('2');
      nSCSResult := TDevice(DeviceList.Objects[aDeviceIndex]).ServerDoorControl(aReaderNo,aDoorNo,aButton,aCardNo,'A',stVoice);
      cResult := 'A'; //�̵��ī��
    end;
    stSql := ' Update TB_ACCESSEVENT set PE_PERMITCODE = ''' + cResult + ''', ';  //���Խ��� ����
    stSql := stSql + ' CO_COMPANYCODE = ''' + stCompanyCode + ''',';
    stSql := stSql + ' EM_CODE = ''' + stEMCode + ''',';
    stSql := stSql + ' CO_JIJUMCODE = ''' + stJijumCode + ''',';
    stSql := stSql + ' CO_DEPARTCODE = ''' + stDepartCode + ''',';
    stSql := stSql + ' EM_NAME = ''' + stEmName + ''' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_DATE = ''' + copy(aTime,1,8) + ''' ';
    stSql := stSql + ' AND AC_TIME = ''' + copy(aTime,9,6) + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
    stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

    DataModule1.ProcessEventExecSQL(stSql);  //�ϴ� ī�� �±� �Է�
    if cResult = '1' then
    begin
      if nEmployeeIndex > -1 then
      begin
        TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodCodeCount_Inc(strtoint(FoodCurrentFoodCode));
        TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodDayCount := TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodDayCount + 1;
        TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodWeekCount := TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodWeekCount + 1;
        TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodSemesterCount := TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodSemesterCount + 1;

        if CheckTB_FoodCodeCount(NowDate,FoodCurrentFoodCode,stCompanyCode,stEMCode) = 1 then
        begin
          //���� �ϴ� ���
          stSql := CommonSql.UpdateTB_FOODCODECount_Inc(NowDate,FoodCurrentFoodCode,stCompanyCode,stEmCode);
          DataModule1.ProcessExecSQL(stSql);
        end else
        begin
          //�������� ������
          stSql := CommonSql.InsertIntoTB_FOODCODECount(NowDate,FoodCurrentFoodCode,stCompanyCode,stEmCode,inttostr(TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).GetFoodCodeCount(strtoint(FoodCurrentFoodCode))));
          DataModule1.ProcessExecSQL(stSql);
        end;

        if CheckTB_FoodDayCount(NowDate,stCompanyCode,stEMCode) = 1 then
        begin
          //���� �ϴ� ���
          stSql := CommonSql.UpdateTB_FoodDayCount_Inc(NowDate,stCompanyCode,stEmCode);
          DataModule1.ProcessExecSQL(stSql);
        end else
        begin
          //�������� ������
          stSql := CommonSql.InsertIntoTB_FoodDayCount(NowDate,stCompanyCode,stEmCode,inttostr(TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodDayCount));
          DataModule1.ProcessExecSQL(stSql);
        end;

        if CheckTB_FoodWeekCount(copy(NowDate,1,4),inttostr(FoodCurrentWeekDay),stCompanyCode,stEMCode) = 1 then
        begin
          //���� �ϴ� ���
          stSql := CommonSql.UpdateTB_FoodWeekCount_Inc(copy(NowDate,1,4),inttostr(FoodCurrentWeekDay),stCompanyCode,stEmCode);
          DataModule1.ProcessExecSQL(stSql);
        end else
        begin
          //�������� ������
          stSql := CommonSql.InsertIntoTB_FoodWeekCount(copy(NowDate,1,4),inttostr(FoodCurrentWeekDay),stCompanyCode,stEmCode,inttostr(TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodWeekCount));
          DataModule1.ProcessExecSQL(stSql);
        end;

        if CheckTB_FoodSemesterCount(copy(NowDate,1,4),inttostr(FoodCurrentSemesterCode),stCompanyCode,stEMCode) = 1 then
        begin
          //���� �ϴ� ���
          stSql := CommonSql.UpdateTB_FoodSemesterCount_Inc(copy(NowDate,1,4),inttostr(FoodCurrentSemesterCode),stCompanyCode,stEmCode);
          DataModule1.ProcessExecSQL(stSql);
        end else
        begin
          //�������� ������
          stSql := CommonSql.InsertIntoTB_FoodSemesterCount(copy(NowDate,1,4),inttostr(FoodCurrentSemesterCode),stCompanyCode,stEmCode,inttostr(TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodSemesterCount));
          DataModule1.ProcessExecSQL(stSql);
        end;
      end;
    end;
  end else      //Negative-ACK�ΰ��
  begin
    if nCardCheck = 1 then
    begin
      cResult := aPermitCode[1];
      if cResult = '1' then  //�ļ� ������ �� ��츸
      begin
        if CommonModule.GetEmployeeInfo_AWCODE(aCardNo,False,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName,stAWCode) then //��������� ���� �ϸ�
        begin
          stCurrentFoodCode := GetFoodCurrentCode(copy(aTime,9,4));
          dtTempTime := EncodeDateTime(strtoint(copy(aTime,1,4)),
                                             strtoint(copy(aTime,5,2)),
                                             strtoint(copy(aTime,7,2)),
                                             0,0,0,0);
          nCurrentWeekDay := WeekOf(dtTempTime);
          nCurrentSemesterCode := GetFoodCurrentSemesterCode(copy(aTime,1,8));

          nEmployeeIndex := FoodServerEmployeeList.IndexOf(stCompanyCode + stEMCode);
          if nEmployeeIndex < 0 then
          begin
            AddFoodServerEmployeeList(stCompanyCode,stEMCode);
            nEmployeeIndex := FoodServerEmployeeList.IndexOf(stCompanyCode + stEMCode);
          end;
          if copy(aTime,1,8) = NowDate then  //���� ��¥ �� ��츸 FoodServer �޸𸮿� �ε� ����.
          begin
            if nEmployeeIndex > -1 then
            begin
              TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodCodeCount_Inc(strtoint(stCurrentFoodCode));
              TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodDayCount := TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodDayCount + 1;
            end;
          end;

          if nCurrentWeekDay = FoodCurrentWeekDay then
              TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodWeekCount := TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodWeekCount + 1;
          if nCurrentSemesterCode = FoodCurrentSemesterCode then
              TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodSemesterCount := TFoodEmployee(FoodServerEmployeeList.Objects[nEmployeeIndex]).FoodSemesterCount + 1;


          if CheckTB_FoodCodeCount(copy(aTime,1,8),stCurrentFoodCode,stCompanyCode,stEMCode) = 1 then
          begin
            //���� �ϴ� ���
            stSql := CommonSql.UpdateTB_FOODCODECount_Inc(copy(aTime,1,8),stCurrentFoodCode,stCompanyCode,stEmCode);
            DataModule1.ProcessExecSQL(stSql);
          end else
          begin
            //�������� ������
            stSql := CommonSql.InsertIntoTB_FOODCODECount(copy(aTime,1,8),stCurrentFoodCode,stCompanyCode,stEmCode,'1');
            DataModule1.ProcessExecSQL(stSql);
          end;

          if CheckTB_FoodDayCount(copy(aTime,1,8),stCompanyCode,stEMCode) = 1 then
          begin
            //���� �ϴ� ���
            stSql := CommonSql.UpdateTB_FoodDayCount_Inc(copy(aTime,1,8),stCompanyCode,stEmCode);
            DataModule1.ProcessExecSQL(stSql);
          end else
          begin
            //�������� ������
            stSql := CommonSql.InsertIntoTB_FoodDayCount(copy(aTime,1,8),stCompanyCode,stEmCode,'1');
            DataModule1.ProcessExecSQL(stSql);
          end;

          if CheckTB_FoodWeekCount(copy(aTime,1,4),inttostr(nCurrentWeekDay),stCompanyCode,stEMCode) = 1 then
          begin
            //���� �ϴ� ���
            stSql := CommonSql.UpdateTB_FoodWeekCount_Inc(copy(aTime,1,4),inttostr(nCurrentWeekDay),stCompanyCode,stEmCode);
            DataModule1.ProcessExecSQL(stSql);
          end else
          begin
            //�������� ������
            stSql := CommonSql.InsertIntoTB_FoodWeekCount(copy(aTime,1,4),inttostr(nCurrentWeekDay),stCompanyCode,stEmCode,'1');
            DataModule1.ProcessExecSQL(stSql);
          end;

          if CheckTB_FoodSemesterCount(copy(aTime,1,4),inttostr(nCurrentSemesterCode),stCompanyCode,stEMCode) = 1 then
          begin
            //���� �ϴ� ���
            stSql := CommonSql.UpdateTB_FoodSemesterCount_Inc(copy(aTime,1,4),inttostr(nCurrentSemesterCode),stCompanyCode,stEmCode);
            DataModule1.ProcessExecSQL(stSql);
          end else
          begin
            //�������� ������
            stSql := CommonSql.InsertIntoTB_FoodSemesterCount(copy(aTime,1,4),inttostr(nCurrentSemesterCode),stCompanyCode,stEmCode,'1');
            DataModule1.ProcessExecSQL(stSql);
          end;
        end;
      end;
    end;
  end;

  ProcessFoodData(aTime, aCardNo, aECUID,strtoint(aNodeNo),aDoorNo[1],'0',cResult,stJijumCode,stDepartCode,stEmName);

  result := cResult;
end;

procedure TfmMain.AddFoodServerEmployeeList(aCompanyCode, aEMCode: string);
var
  oFoodEmployee : TFoodEmployee;
  nIndex : integer;
begin
  nIndex := FoodServerEmployeeList.IndexOf(aCompanyCode + aEMCode) ;
  if nIndex > -1 then Exit;
  oFoodEmployee := TFoodEmployee.Create(nil);
  oFoodEmployee.CompanyCode := aCompanyCode;
  oFoodEmployee.EMCODE := aEMCode;
  FoodServerEmployeeList.AddObject(aCompanyCode + aEMCode,oFoodEmployee);
  AddFoodCodeCount(aCompanyCode,aEMCode);
  AddFoodDayCount(aCompanyCode,aEMCode);
  AddFoodWeekCount(aCompanyCode,aEMCode);
  AddFoodSemesterCount(aCompanyCode,aEMCode);
end;

procedure TfmMain.AddFoodCodeCount(aCompanyCode, aEMCode: string);   //������� ���� ������ �ļ��ڵ庰 �̿� Ƚ��
var
  nIndex : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  nIndex := FoodServerEmployeeList.IndexOf(aCompanyCode + aEMCode) ;
  if nIndex < 0 then Exit;
  stSql := 'Select * from TB_FOODCODECOUNT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FC_DATE = ''' + NowDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

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
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        TFoodEmployee(FoodServerEmployeeList.objects[nIndex]).SetFoodCodeCount(FindField('FO_FOODCODE').AsInteger,FindField('FD_COUNT').AsInteger);
        Next;
        Application.ProcessMessages;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.AddFoodDayCount(aCompanyCode, aEMCode: string);     //������� ���� ������ �Ϻ� �̿� Ƚ��
var
  nIndex : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  nIndex := FoodServerEmployeeList.IndexOf(aCompanyCode + aEMCode) ;
  if nIndex < 0 then Exit;
  stSql := 'Select * from TB_FOODDAYCOUNT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FD_DATE = ''' + NowDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

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
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        TFoodEmployee(FoodServerEmployeeList.objects[nIndex]).FoodDayCount := FindField('FD_COUNT').AsInteger;
        Next;
        Application.ProcessMessages;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.AddFoodSemesterCount(aCompanyCode, aEMCode: string);  //������� ���� ������ �б⺰ �̿� Ƚ��
var
  nIndex : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  nIndex := FoodServerEmployeeList.IndexOf(aCompanyCode + aEMCode) ;
  if nIndex < 0 then Exit;
  stSql := 'Select * from TB_FOODSEMESTERCOUNT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FS_YEAR = ''' + copy(NowDate,1,4) + ''' ';
  stSql := stSql + ' AND SE_CODE = ' + inttostr(FoodCurrentSemesterCode) + ' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

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
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        TFoodEmployee(FoodServerEmployeeList.objects[nIndex]).FoodSemesterCount := FindField('FS_COUNT').AsInteger;
        Next;
        Application.ProcessMessages;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.AddFoodWeekCount(aCompanyCode, aEMCode: string);   //������� ���� ������ �ֺ� �̿� Ƚ��
var
  nIndex : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  nIndex := FoodServerEmployeeList.IndexOf(aCompanyCode + aEMCode) ;
  if nIndex < 0 then Exit;
  stSql := 'Select * from TB_FOODWEEKCOUNT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FW_YEAR = ''' + copy(NowDate,1,4) + ''' ';
  stSql := stSql + ' AND FW_WEEKDAY = ' + inttostr(FoodCurrentWeekDay) + ' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

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
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        TFoodEmployee(FoodServerEmployeeList.objects[nIndex]).FoodWeekCount := FindField('FW_COUNT').AsInteger;
        Next;
        Application.ProcessMessages;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckTB_FoodCodeCount(aDate, aFoodCode, aCompanyCode,
  aEMCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;
  stSql := 'Select * from TB_FoodCodeCount ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FC_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FO_FOODCODE = ''' + aFoodCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckTB_FoodDayCount(aDate, aCompanyCode,
  aEMCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;
  stSql := 'Select * from TB_FoodDayCount ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FD_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckTB_FoodWeekCount(aYear, aWeekDay, aCompanyCode,
  aEMCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;
  stSql := 'Select * from TB_FoodWeekCount ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FW_YEAR = ''' + aYear + ''' ';
  stSql := stSql + ' AND FW_WEEKDAY = ' + aWeekDay + ' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckTB_FoodSemesterCount(aYear, aSemesterCode,
  aCompanyCode, aEMCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;
  stSql := 'Select * from TB_FoodSemesterCount ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FS_YEAR = ''' + aYear + ''' ';
  stSql := stSql + ' AND SE_CODE = ' + aSemesterCode + ' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetFoodCurrentCode(aTime: string): string;
var
  i : integer;
begin
  result := '';

  for i:= 0 to FoodConfigCodeList.Count - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if FoodConfigStartList.Strings[i] < FoodConfigEndList.Strings[i] then
    begin
      if (aTime >=  FoodConfigStartList.Strings[i] ) And (aTime <=  FoodConfigEndList.Strings[i] ) then
      begin
         result:= FoodConfigCodeList.Strings[i];
         break;
      end;
    end else    //24�ð� �Ѿ�� ���
    begin
      if (aTime >=  FoodConfigStartList.Strings[i] ) or (aTime <=  FoodConfigEndList.Strings[i] ) then
      begin
         result:= FoodConfigCodeList.Strings[i];
         break;
      end;
    end;
  end;
end;

procedure TfmMain.DeviceInfoSearchTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  DeviceInfoSearch.Interval := 2000; //2�ʿ� �ѹ���...
  DeviceInfoSearch.Enabled := False;

  if L_nDeviceInfoSearchNo >= DeviceList.count - 1 then L_nDeviceInfoSearchNo := 0; 

  for i := L_nDeviceInfoSearchNo to DeviceList.count - 1 do
  begin
    L_nDeviceInfoSearchNo := i;
    if TDevice(DeviceList.Objects[i]).Connected and (TDevice(DeviceList.Objects[i]).DeviceCode = '') then
    begin
      TDevice(DeviceList.Objects[i]).SearchDevicecode;
      break;
    end;
    Application.ProcessMessages;
  end;
  if L_nDeviceInfoSearchNo = DeviceList.count - 1 then
  begin
    for i := 0 to DeviceList.count - 1 do
    begin
      if TDevice(DeviceList.Objects[i]).DeviceCode = '' then
      begin
        DeviceInfoSearch.Enabled := True;
        break;
      end;
      Application.ProcessMessages;
    end;
  end else
  begin
    DeviceInfoSearch.Enabled := True;
  end;
end;

procedure TfmMain.Control_POSINEGAModeChange(aDeviceID: string;
  aMode: Char);
var
  stNodeNo,stECUID,stDoorNo : string;
  i : integer;
  aDevice: TDevice;
  stTemp : string;
begin
  //LogSave(ExeFolder + '\..\log\ModeChange'+FormatDateTime('yyyymmdd',now)+'.log',aDeviceID + ':' + aMode);
  StatusBar1.Panels[2].Text := 'Posi/NegaChange(' + aDeviceID + ')';
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);
  stDoorNo := copy(aDeviceID,6,1);

  aDevice:= GetDevice(stNodeNo + stECUID  );
  if aDevice <> nil then
  begin
    if aDevice.CommNode.SocketConnected = True then aDevice.Control_DoorPNModeChange(stDoorNo[1],aMode)
  end;
end;

procedure TfmMain.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  inherited;
  L_bWebComplete := True;
end;

function TfmMain.InnoNixAlarmEventSend(aZoneNumber: string): Boolean;
var
  conStr : string;
  FirstTickCount : double;
begin
  result := False;
  conStr := 'http://172.16.200.123/project/lig/interface/sensorStatus.asp?SenID=' + aZoneNumber;
  L_bWebComplete := False;
  WebBrowser1.Navigate(conStr);
  FirstTickCount := GetTickCount + 1000;
  while Not L_bWebComplete do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Exit;
  end;
  result := L_bWebComplete;
end;

procedure TfmMain.WebRelayTimerTimer(Sender: TObject);
var
  stSendData : string;
begin
  inherited;
  if G_nSpecialProgram = 6 then
  begin
    if InnoNixAlarmEventList.Count < 1 then Exit;
    if L_bWebRelay then Exit;
    Try
      L_bWebRelay := True;
      stSendData := InnoNixAlarmEventList.Strings[0];
      InnoNixAlarmEventList.Delete(0);
      InnoNixAlarmEventSend(stSendData);
    Finally
      L_bWebRelay := False;
    End;
  end;
end;

procedure TfmMain.ModBusServerNewConnect(ClientThread: TDXClientThread);
Var
   stReadData : String;
   stData : string;
   stSendData : string;
   I: Integer;
   aIndex: Integer;
   ModbusStartTime:Comp;
   aLog: String;
   Sock: Integer;
begin
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;
  ModBusQue.AddSock(Sock);

  ModbusStartTime:=TimeCounter+ 60000; //1�е��� ��ȣ�� ������ ������ ����...
  stData :='';

  While ClientThread.Socket.Connected and (not DXString.Timeout (ModbusStartTime) ) do
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
          if G_bApplicationTerminate then Exit;
          stReadData:= ClientThread.Socket.Read ;
          stData := stData + Ascii2Hex(stReadData);
        end;
        {���������� ���� ������ ó�� ��ƾ�߰�}
        if stData <> '' then
        begin
          stSendData := RcvFromModBusClient(ClientThread.Socket.PeerIPAddress,stData);
          if stSendData <> '' then
          begin
            stSendData := Hex2Ascii(stSendData);
            ClientThread.Socket.Write(stSendData);
            //ClientThread.Socket.WriteLn(stSendData);
          end;
        end;
        stData:='';
      end;
      ModbusStartTime:=TimeCounter+ 60000;
    End
    Else Begin
       DoSleepEx(1);
       //Application.ProcessMessages;
       ProcessWindowsMessageQueue;
    end;
  end;
  ModBusQue.DelSock(Sock);

end;

function TfmMain.RcvFromModBusClient(aClientIP, aReadData: string):string;
var
  stLen : string;
  nLen : integer;
  stData : string;
  stNodeNo : string;
  stFunctionCode : string;
  stStartEcuID : string;
  stEndCount : string;
  nNodeNo : integer;
  nStartEcuID : integer;
  nEndCount : integer;
  nSendDataLength : integer;
  stSendData : string;
begin
  if copy(aReadData,1,8) <> '00000000' then Exit; //ó�� 4����Ʈ�� 00000000 �̴�.
  if Length(aReadData) < ( 12 * 2 ) then Exit;    //��û ������ ���� ���� ª��.
  stLen := copy(aReadData,(5 * 2) - 1,4);
  nLen := Hex2Dec(stLen);
  stData := copy(aReadData,(7 * 2) - 1,nLen * 2);
  stNodeNo := copy(stData,1,2);
  stFunctionCode := copy(stData,3,2);
  stStartEcuID := copy(stData,5,4);
  stEndCount := copy(stData,9,4);

  nNodeNo := Hex2Dec(stNodeNo);
  nStartEcuID := Hex2Dec(stStartEcuID);
  nEndCount := Hex2Dec(stEndCount);

  stSendData := GetModeBusAlarmStatus(nNodeNo,nStartEcuID,nEndCount);
  nSendDataLength := Length(stSendData) div 2 + 3;
  result := '00000000' + dec2Hex(nSendDataLength,4) + stNodeNo + stFunctionCode + dec2Hex(Length(stSendData) div 2,2) + stSendData;
end;

function TfmMain.GetModeBusAlarmStatus(aNodeNo, aStartEcuID,
  aEndCount: integer): string;
var
  nIndex : integer;
  i,j : integer;
  stData : string;
  nReminder : integer;
  stTempData : string;
  nCount : integer;
begin
  stData := '';
  nIndex := ArmAreaRelayModeList.indexof(FillZeroNumber(aNodeNo,3));
  nCount := 0;
  if nIndex > -1 then
  begin
    for i := aStartEcuID to aStartEcuID + (aEndCount - 1) do
    begin
      if nCount = 0 then
      begin
        stTempData := '';
        for j := 1 to 8 do
        begin
          stTempData :=  stTempData + '0';
        end;
      end;
      if TArmAreaRelayModeState(ArmAreaRelayModeList.Objects[nIndex]).GetArmAreaMode(i) = cmArm then
      begin
        stTempData[8-nCount] := '1';
        //stData := stData + '1';
      end else
      begin
        stTempData[8-nCount] := '0';
        //stData := stData + '0';
      end;
      nCount := nCount + 1;
      if nCount = 8 then
      begin
        stData := stData + stTempData;
        nCount := 0;
      end;
    end;
  end;
  if nCount <> 0 then stData := stData + stTempData;
  nReminder := length(stData) mod 8;
  if nReminder <> 0 then
  begin
    for i := nReminder to 7 do
    begin
      stData := stData + '0';
    end;
  end;
  if stData = '' then result := '00'
  else result := BinaryToHex(stData);
end;

function TfmMain.GetArmAreaRelayNo(aNodeNo, aEcuID,
  aArmArea: string): integer;
begin
  result := strtoint(aEcuID); //���⿡�� ������� ��ȣ üũ �Ͽ� �������...
end;

procedure TfmMain.CheckKTTSenderTimerTimer(Sender: TObject);
var
  bKTTSendDaemon : Boolean;
  ProcessList : TStringList;
  pSelfID : DWORD;
  i : integer;
begin
  inherited;
  //���⿡�� KTTSenderDaemon Check �Ͽ� ���� ��Ű��.
  Try
    bKTTSendDaemon := False;
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('KTTSendDaemon.exe') then  //���� �ǰ� ������
      begin
        bKTTSendDaemon := True;
        Break;
      end;
    end;

    if Not bKTTSendDaemon then
    begin
      KTTSenderDaemon_Execute;
    end;
  Finally
    ProcessList.Free;
  End;
end;

function TfmMain.KTTSenderDaemon_Execute: Boolean;
var
  SEInfo: TShellExecuteInfo;
begin
  result := False;
  //���⿡�� ���α׷� ���� ��Ű��.
  if FileExists(ExeFolder + '\KTTSendDaemon.exe') then
  begin
    (*
    FillChar(SEInfo,SizeOf(SEInfo),0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    with SEInfo do
    begin
      fMask        := SEE_MASK_NOCLOSEPROCESS;
      //fMask        := nil;
      Wnd          := 0;
      lpFile       := PChar('ZDAEMON_LogServer.exe');
      lpParameters := PChar('');
      lpDirectory  := PChar(ExeFolder + '\');
      lpVerb       := pchar('open');
      hInstApp     := 0;
      nShow        := SW_SHOWNORMAL;
    end;
    ShellExecuteEx(@SEInfo);
    *)
    //ShellExecute(0, 'runas', pchar(ExeFolder + '\ZDAEMON_LogServer.exe'),nil,nil, SW_SHOW);
    //ShellExecute(0, 'Open', pchar(ExeFolder + '\ZDAEMON_LogServer.exe'),nil,nil, SW_NORMAL);
    My_RunDosCommand(pchar(ExeFolder + '\KTTSendDaemon.exe'),False,False,False);
    result := True;
  end;
end;

procedure TfmMain.CheckFPSystemTimerTimer(Sender: TObject);
var
  bSH_FPDamon : Boolean;
  ProcessList : TStringList;
  pSelfID : DWORD;
  i : integer;
begin
  inherited;
  StatusBar1.Panels[1].Text := 'CheckFPSystemTimerTimer';
  //���⿡�� KTTSenderDaemon Check �Ͽ� ���� ��Ű��.
  Try
    bSH_FPDamon := False;
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('SH_FPDaemon.exe') then  //���� �ǰ� ������
      begin
        bSH_FPDamon := True;
        Break;
      end;
    end;

    if Not bSH_FPDamon then
    begin
      SHFPDamon_Execute;
    end;
  Finally
    ProcessList.Free;
  End;
end;

function TfmMain.SHFPDamon_Execute: Boolean;
var
  SEInfo: TShellExecuteInfo;
begin
  result := False;
  if (fdmsUses = 'TRUE') and (fdmsType = '2') then Exit; //���� DB������ ��� ���� ��Ű�� ����.
  //���⿡�� ���α׷� ���� ��Ű��.
  if FileExists(ExeFolder + '\SH_FPDaemon.exe') then
  begin
    My_RunDosCommand(pchar(ExeFolder + '\SH_FPDaemon.exe'),False,False,False);
    result := True;
  end else
  begin
    StatusBar1.Panels[2].Text := ExeFolder + '\SH_FPDaemon.exe' + '(Not File)';
  end;
end;

procedure TfmMain.DeviceLoadTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if L_bDeviceLoading then Exit;
  StatusBar1.Panels[1].Text := 'DeviceLoadTimerTimer';
  Try
    L_bDeviceLoading := True;
    LoadNode(False);      //��� ���� �ε�
    LoadECU(False);       //��� ���� �ε�
    LoadDoor(False);      //���Թ� ���� �ε�
    LoadArmArea(False);   //������� ���� �ε�
  Finally
    L_bDeviceLoading := False;
  End;
end;

function TfmMain.UpdateTB_DOOR_MEMLOAD(aNodeNO, aEcuID, aDoorNo,
  aMemload: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_DOOR set ';
  stSql := stSql + ' DO_MEMLOAD = ''' + aMemLoad + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.ValidExpiredTimerTimer(Sender: TObject);
begin
  inherited;
  StatusBar1.Panels[1].Text := 'ValidExpiredTimerTimer';
  if G_bApplicationTerminate then Exit;
  if L_bValidExpiredChecking then Exit;
  Try
    L_bValidExpiredChecking := True;
    EmployeeValidDateToExpired; //��ȿ�Ⱓ ���� ��� ī����� ����
    EmployeeExpireChangeToValid ; //��ȿ�Ⱓ�� �þ ��� ī����� ����
  Finally
    L_bValidExpiredChecking := False;
  End;
end;

procedure TfmMain.EmployeeExpireChangeToValid;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Delete From TB_EMPLOYEEEXPIRECHANGE where EM_OLDEXPIRE >= ''' + FormatDateTime('yyyymmdd',now) + ''' ';  //���� ��ȿ�Ⱓ�� ���ú��� ����ٸ� ���۾� �� �ʿ䰡 ����.
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Delete From TB_EMPLOYEEEXPIRECHANGE where EM_NEWEXPIRE < ''' + FormatDateTime('yyyymmdd',now) + ''' ';  //����� ��ȿ�Ⱓ�� ���ú��� �۴ٸ� ���� ���� ��ƾ���� �����Ѵ�.
  DataModule1.ProcessExecSQL(stSql);



  stSql := ' Select * from TB_EMPLOYEEEXPIRECHANGE ';
  stSql := stSql + ' Where EM_NEWEXPIRE >= ''' + FormatDateTime('yyyymmdd',now) + ''' ';  //���ο� ��ȿ�Ⱓ�� ���� �����̸�
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
        //����ó��
        Exit;
      End;


      First;
      while not eof do
      begin
        EmployeeCardValidateStart(FindField('CO_COMPANYCODE').AsString,FindField('EM_CODE').AsString);
        stSql := ' Delete From TB_EMPLOYEEEXPIRECHANGE ';
        stSql := stSql + ' where CO_COMPANYCODE = ''' + FindField('CO_COMPANYCODE').AsString + ''' ';
        stSql := stSql + ' AND EM_CODE = ''' + FindField('EM_CODE').AsString + ''' ';
        stSql := stSql + ' AND EM_OLDEXPIRE = ''' + FindField('EM_OLDEXPIRE').AsString + ''' ';
        stSql := stSql + ' AND EM_NEWEXPIRE = ''' + FindField('EM_NEWEXPIRE').AsString + ''' ';
        DataModule1.ProcessExecSQL(stSql);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.EmployeeValidDateToExpired;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where (EM_EXPIRUSE is null or EM_EXPIRUSE = ''N'') ' ;
  stSql := stSql + ' AND EM_RETIREDATE < ''' + FormatDateTime('yyyymmdd',now) + ''' ';
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
        //����ó��
        Exit;
      End;


      First;
      while not eof do
      begin
        EmployeeCardValidateStop(FindField('CO_COMPANYCODE').AsString,FindField('EM_CODE').AsString);
        dmAdoQuery.UpdateTB_EMPLOYEE_Field_StringValue(FindField('CO_COMPANYCODE').AsString,FindField('EM_CODE').AsString,'EM_EXPIRUSE','Y');
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.EmployeeCardValidateStop(aCompanyCode, aEmCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDTYPE = ''1'' ';
  stSql := stSql + ' AND CO_COMPANYCODE =  ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE =  ''' + aEmCode + ''' ';
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
        //����ó��
        Exit;
      End;


      First;
      while not eof do
      begin
        dmAdoQuery.UpdateTB_DEVICECARDNO_ValidExpire(FindField('CA_CARDNO').AsString);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.EmployeeCardValidateStart(aCompanyCode, aEmCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDTYPE = ''1'' ' ;
  stSql := stSql + ' AND CO_COMPANYCODE =  ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE =  ''' + aEmCode + ''' ';
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
        //����ó��
        Exit;
      End;


      First;
      while not eof do
      begin
        dmAdoQuery.UpdateTB_DEVICECARDNO_ValidChange(FindField('CA_CARDNO').AsString);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

//20160128 �Ǳ��뿡�� �̰��� �˶� �߻� ��û������ ó��
procedure TfmMain.DeviceArmAreaDisArmEvent(Sender: TObject;
  NodeNo: integer; aEcuID, aArmAreaNo: string);
var
  stAlarmData : string;
  stDeviceType : string;
begin
  if aEcuID = '00' then stDeviceType := 'MN'
  else stDeviceType := 'EX';
  stAlarmData := '058 K10000000' + aEcuID + 'AJn'+ FormatDateTime('yyyymmddhhnnss',now) + stDeviceType + '0000dNA***000000000000******B8';
  DeviceRcvAlarmData(Sender,'A',stAlarmData,NodeNo,'001');
end;

procedure TfmMain.mn_HolidayReSendClick(Sender: TObject);
begin
  inherited;
  L_stSendHolidayYear := '';
end;

function TfmMain.Check_HolidayClear(aNowYear: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  i :integer;
begin
  result := False;
  Try
    stSql := ' Select * from TB_ACCESSDEVICE a ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.HO_SENDYEAR <> ''' + aNowYear + '''';

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
          DeviceHolidayClear(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString); //Ư���� ���� ����
          Next;
        end;
      End;

    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   'Check_HolidayDevice','Error');
  End;
end;

function TfmMain.KTEmployeeCardChange(aEmCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := True;
  stSql := ' Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''' ';

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
      if FindField('EM_CARDCHANGE').AsString = 'Y' then result := True
      else result := False;
    End;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.EmployeeNewCardChange(aEmCode, aCardNO: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  stSql := 'select * from tb_card where em_code = ''' + aEmCode + ''' AND ca_cardtype = ''1'' ';
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
      KTOldCardChage(FindField('CA_CARDNO').AsString,aCardNO); //ó�� ������ ī���� ������ ���� ����.
      While Not Eof do
      begin
        DeleteOldCard(FindField('CA_CARDNO').AsString);
        Next;
      end;
    End;
    stSql := 'update TB_EMPLOYEE set EM_CARDCHANGE = ''Y'' where EM_CODE = ''' + aEmCode + ''' ';
    DataModule1.ProcessExecSQL(stSql);
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.KTOldCardChage(aOldCardNo, aNewCardNO: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  Result := False;
  if aOldCardNo = '' then Exit;
  if Trim(aOldCardNo) = Trim(aNewCardNo) then Exit;

  stSql := 'delete from TB_CARD ';
  stSql := stSql + ' where CA_CARDNO = ''' +  aNewCardNo + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //�ű�ī���� ���� ��� ����
  stSql := 'delete from TB_DEVICECARDNO ';
  stSql := stSql + ' where CA_CARDNO = ''' +  aNewCardNo + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  //����ī���� ������ ���� ����.
  stSql := ' Insert INTO TB_DEVICECARDNO (';
  stSql := stSql + ' AC_NODENO, ';
  stSql := stSql + ' AC_ECUID, ';
  stSql := stSql + ' CA_CARDNO, ';
  stSql := stSql + ' DE_DOOR1, ';
  stSql := stSql + ' DE_DOOR2, ';
  stSql := stSql + ' DE_USEACCESS, ';
  stSql := stSql + ' DE_USEALARM, ';
  stSql := stSql + ' DE_TIMECODE, ';
  stSql := stSql + ' DE_PERMIT, ';
  stSql := stSql + ' DE_RCVACK, ';
  stSql := stSql + ' DE_UPDATETIME, ';
  stSql := stSql + ' DE_UPDATEOPERATOR) ';
  stSql := stSql + ' select ';
  stSql := stSql + ' b.AC_NODENO, ';
  stSql := stSql + ' b.AC_ECUID, ';
  stSql := stSql + ' ''' + aNewCardNO + ''', ';
  stSql := stSql + ' b.DE_DOOR1, ';
  stSql := stSql + ' b.DE_DOOR2, ';
  stSql := stSql + ' b.DE_USEACCESS, ';
  stSql := stSql + ' b.DE_USEALARM, ';
  stSql := stSql + ' b.DE_TIMECODE, ';
  stSql := stSql + ' b.DE_PERMIT, ';
  stSql := stSql + ' ''N'', ';
  stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' ''System'' ';
  stSql := stSql + ' From TB_DEVICECARDNO B  ';
  stSql := stSql + ' where B.CA_CARDNO = ''' + aOldCardNO + ''' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
  stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
  stSql := stSql + ' AND A.CA_CARDNO = ''' + aNewCardNO + ''')  ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_CARD set CA_CARDNO = ''' + aNewCardNo + ''' ';
  stSql := stSql + ' where CA_CARDNO = ''' + aOldCardNO + ''' ';
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.DeleteOldCard(aCardNo: string): Boolean;
var
  stSql : string;
begin
  //���� ī���� ���� ����
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_PERMIT = ''N'', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' delete from  TB_CARD ';
  stSql := stSql + ' where CA_CARDNO = ''' +  aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

  //InsertTB_EMPHISCardStop(aCardNo);

end;

procedure TfmMain.CardDeleteTimerTimer(Sender: TObject);
begin
  inherited;
  Try
    CardDeleteTimer.Enabled := False;
    if G_nSpecialProgram = 1 then
    begin
      if G_bOldEmployDelete then
      begin
        if formatdatetime('yyyymm',Now) = '201609' then  //2016�� 9�� �߿��� ������� ���� ����. -- �ű� ����� ��Ͻ� �ɼǿ� ��ũ �Ϸ��� �ߴµ� ������� ����� �������� ����.
        begin
          KTOldEmployeeCardStop;
        end;
      end;
    end;

    //�̻��ī�� ��������.
    if G_stDeleteDate <> formatDateTime('yyyymmdd',now) then
    begin
      NotUsedCardDelete(FormatDateTime('yyyymmdd',now - G_nCardDeleteDay));
      G_stDeleteDate := formatDateTime('yyyymmdd',now);
    end;
  Finally
    CardDeleteTimer.Enabled := G_bCardDeleteUse;
  End;

end;

function TfmMain.KTOldEmployeeCardStop: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_CARDCHANGE is null or EM_CARDCHANGE = ''N'' ';
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
        //����ó��
        Exit;
      End;

      First;
      while not eof do
      begin
        KTOldCardStopFromEmCode(FindField('EM_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;


end;

function TfmMain.KTOldCardStopFromEmCode(aEmCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''' ';
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
        //����ó��
        Exit;
      End;

      First;
      while not eof do
      begin
        if isdigit(FindField('CA_CARDNO').AsString) and (Length(FindField('CA_CARDNO').AsString) = 11) then
        begin
          if Not((copy(FindField('CA_CARDNO').AsString,1,1) = '3') and (copy(FindField('CA_CARDNO').AsString,10,2) = '01')) then
          begin
            UpdateTB_CARD_Stop(FindField('CA_CARDNO').AsString);
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

function TfmMain.UpdateTB_CARD_Stop(aCardNo: string): Boolean;
var
  stSql : string;
begin
  //�ش� ī���� ���� ����
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_PERMIT = ''N'', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_CARD set CA_CARDTYPE = ''3'' ';
  stSql := stSql + ' where CA_CARDNO = ''' +  aCardNo + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);  
end;

function TfmMain.NotUsedCardDelete(aDate: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  stSql := 'Select * from TB_CARD a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' Where a.CA_LASTUSE is null ';
  stSql := stSql + ' AND a.CA_LASTUSE < ''' + aDate + ''' ';

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
        //����ó��
        Exit;
      End;

      First;
      while not eof do
      begin
        if ((FindField('EM_JOINDATE').AsString < aDate) or (FindField('EM_JOINDATE').AsString = '')) and (copy(FindField('CA_UPDATETIME').AsString,1,8)< aDate) then
        begin
          UpdateTB_CARD_Stop(FindField('CA_CARDNO').AsString);
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

procedure TfmMain.DaemonStateCheckTimerTimer(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  inherited;
  DaemonStateCheckTimer.Enabled := False;
  Try
    stSql := 'Select * from TB_CURRENTDAEMON ';
    stSql := stSql + ' Where CU_STATEVALUE = ''C'' ';

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
          //����ó��
          Exit;
        End;

        First;
        while not eof do
        begin
          if FindField('CU_STATECODE').AsString = 'FOODTIME' then
          begin
            GetFoodConfig(False);
            dmDBFunction.UpdateTB_CURRENTDAEMON_Field_StringValue('FOODTIME','CU_STATEVALUE','N');
          end;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
    DaemonStateCheckTimer.Enabled := Not G_bApplicationTerminate;
  End;

end;

function TfmMain.Search_PortState(aDeviceID: string): Boolean;
var
  stNodeNo,stECUID : string;
  aDevice: TDevice;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);


  aDevice:= GetDevice(stNodeNo + stECUID );
  if aDevice <> nil then
  begin
    if aDevice.CommNode.SocketConnected = True then
    begin
      aDevice.Search_PortState;
    end;
  end;

end;

function TfmMain.Search_ZoneExtendPortState(aDeviceID: string): Boolean;
var
  stNodeNo,stECUID : string;
  aDevice: TDevice;
begin
  stNodeNo := copy(aDeviceID,1,3);
  stECUID := copy(aDeviceID,4,2);

  aDevice:= GetDevice(stNodeNo + stECUID );
  if aDevice <> nil then
  begin
    if aDevice.CommNode.SocketConnected = True then
    begin
      aDevice.Search_ZoneExtendPortState;
    end;
  end;
end;

procedure TfmMain.Control_ScheduleDoorModeChange(aDeviceID: string; aMode,
  aSchUse: Char);
var
  aDevice: TDevice;
begin
    aDevice:= GetDevice(copy(aDeviceID,1,3) + copy(aDeviceID,4,2));
    if aDevice <> nil then
      aDevice.ScheduleDoorModeChange(copy(aDeviceID,6,1),aMode,aSchUse,'*');

end;

procedure TfmMain.RelayEmployeeServerNewConnect(
  ClientThread: TDXClientThread);
Var
   stReadData : String;
   stSendData : string;
   I: Integer;
   nPos: Integer;
   RelayStartTime:Comp;
   aLog: String;
   Sock: Integer;
begin
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;
  RelayEmployeeQueue.AddSock(Sock);

  RelayStartTime:=TimeCounter+ 60000 * 2; //2�е��� ��ȣ�� ������ ������ ����...
  stReadData :='';

  While ClientThread.Socket.Connected and (not DXString.Timeout (RelayStartTime) ) do
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
          if G_bApplicationTerminate then Exit;
          stReadData:= stReadData + ClientThread.Socket.Read ;
        end;
        ClientThread.Socket.Write(stReadData); //�� �����͸� ���� ����.
        {���������� ���� ������ ó�� ��ƾ�߰�}
        if Pos(UpperCase('SUCESS'),UpperCase(stReadData)) > 0 then
        begin
          //����Ƽ�� ����
          PositiveMode := pnPositive;
          dtRelayEmployeeSuccessTime := now;
          stReadData := '';
        end else
        begin
          while(pos(ETX,stReadData) > 0)  do
          begin
            nPos := pos(ETX,stReadData);
            Delete(stReadData,1,nPos);
          end;
        end;
        //stReadData:='';
      end;
      RelayStartTime:=TimeCounter+ 60000 * 2 ;
    End
    Else Begin
       DoSleepEx(1);
       //Application.ProcessMessages;
       ProcessWindowsMessageQueue;
    end;
  end;
  RelayEmployeeQueue.DelSock(Sock);

end;

procedure TfmMain.RelayControlTimerTimer(Sender: TObject);
var
  dtTimeOut : TDateTime;
  i : integer;
  nDeviceIndex : integer;
begin
  inherited;
  Try
    RelayControlTimer.Enabled  := False;
    //�����뺴�� ��Žð� �������� ���Թ� �װ�Ƽ�� ��� ��������.
    dtTimeOut:= IncTime(dtRelayEmployeeSuccessTime,0,L_nRelayDoorDelayControlTime,0,0);
    //dtTimeOut:= IncTime(dtRelayEmployeeSuccessTime,0,0,30,0);//�׽�Ʈ �뵵�� ������
    if dtTimeOut < now then
    begin
      dtRelayEmployeeSuccessTime := now;
      //�װ�Ƽ�� �����ϰ� ���α׷� ��⵿
      PositiveMode := pnNegative;

      Employee_ServerTerminate;

      Employee_ServerExecute;
    end else
    begin
      //����Ƽ�� ����
      //PositiveMode := pnPositive;
    end;
    if RelayControlDoorList.Count > 0 then
    begin
      for i := RelayControlDoorList.Count - 1 downto 0 do
      begin
        if TdmRelayDoor(RelayControlDoorList.Objects[i]).DoorPNMode <> PositiveMode then
        begin
          nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(TdmRelayDoor(RelayControlDoorList.Objects[i]).NodeNo,3)+TdmRelayDoor(RelayControlDoorList.Objects[i]).EcuID);
          if nDeviceIndex > -1 then
          begin
            if TDevice(DeviceList.Objects[nDeviceIndex]).Connected then
                TdmRelayDoor(RelayControlDoorList.Objects[i]).DoorPNModeChange(PositiveMode);
          end;
        end;
      end;
    end;
  Finally
    if G_nSpecialProgram = 9 then RelayControlTimer.Enabled  := Not G_bApplicationTerminate;
  End;
end;

function TfmMain.LoadTB_RELAYCONTROLDOOR: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  oRelayDoor   : TdmRelayDoor;
  i : integer;
  nDeviceIndex : integer;
begin
  if RelayControlDoorList.Count > 0 then
  begin
    for i := RelayControlDoorList.Count - 1 downto 0 do
    begin
      TdmRelayDoor(RelayControlDoorList.Objects[i]).Free;
    end;
  end;
  RelayControlDoorList.Clear;
  stSql := 'select * from TB_RELAYCONTROLDOOR ';
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
        //����ó��
        Exit;
      End;
      if recordCount < 1 then Exit;
      While Not Eof do
      begin
        oRelayDoor := TdmRelayDoor.Create(self);
        oRelayDoor.NodeNo := FindField('AC_NODENO').AsInteger;
        oRelayDoor.EcuID := FindField('AC_ECUID').AsString;
        oRelayDoor.DoorNO := FindField('DO_DOORNO').AsString[1];
        nDeviceIndex := DeviceList.IndexOf(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString);
        if nDeviceIndex > -1 then
        begin
          oRelayDoor.DoorManageMode := TDevice(DeviceList.Objects[nDeviceIndex]).GetDoorManageMode(FindField('DO_DOORNO').AsInteger);
          oRelayDoor.DoorPNMode := TDevice(DeviceList.Objects[nDeviceIndex]).GetDoorPNMode(FindField('DO_DOORNO').AsInteger);
          oRelayDoor.DoorState := TDevice(DeviceList.Objects[nDeviceIndex]).GetDoorState(FindField('DO_DOORNO').AsInteger);
          oRelayDoor.DoorLockMode := TDevice(DeviceList.Objects[nDeviceIndex]).GetDoorLockMode(FindField('DO_DOORNO').AsInteger);
        end else
        begin
          oRelayDoor.DoorManageMode := dmNothing;
          oRelayDoor.DoorPNMode := pnNothing;
          oRelayDoor.DoorState := dsNothing;
          oRelayDoor.DoorLockMode := lsNothing;
        end;

        RelayControlDoorList.AddObject(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString,oRelayDoor);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.SetPositiveMode(const Value: TDoorPNMode);
begin
  if FPositiveMode = Value then Exit;
  FPositiveMode := Value;
  if Value =  pnNegative then  //Negative ���� �ٲ�� �α� ������.
  begin
    DataModule1.TB_SYSTEMLOGInsert('0','00','0','0','0','Negative����');
  end else if Value = pnPositive then
  begin
    if L_bPositiveLog then DataModule1.TB_SYSTEMLOGInsert('0','00','0','0','0','Positive����');
  end;
end;

function TfmMain.Employee_ServerExecute: Boolean;
var
  hProcess:THandle;
begin
  result := False;
  //���⿡�� ���α׷� ���� ��Ű��.
  if FileExists(ExeFolder + '\EmployeeConversion.exe') then
  begin
    My_RunDosCommand(pchar(ExeFolder + '\EmployeeConversion.exe'),False,False,False);
    //ShellExecute(0, 'runas', pchar(ExeFolder + '\EmployeeConversion.exe'),'','', SW_Normal);
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar('"' +G_stExeFolder + '\GMS_DeviceServerManager' +inttostr(G_nDecoderNo) + '.exe"'),'', SW_HIDE);
    result := True;
  end;

  hProcess := OpenProcess(PROCESS_SET_QUOTA,false,GetCurrentProcessId);   //�޸� ������ ������ �ɱ�?
  try
    SetProcessWorkingSetSize(hProcess, $FFFFFFFF, $FFFFFFFF);
  finally
    CloseHandle(hProcess);
  end;
end;

function TfmMain.Employee_ServerTerminate: Boolean;
var
  hMutex : LongInt;
  DaemonGubun:string;
  FindHandle: THandle;
  ProcessList : TStringList;
  i : integer;
  ProcId: DWORD;
  hProcess: THandle;
  pSelfID : DWORD;
begin
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := ProcessList.Count - 1 downto 0 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('EmployeeConversion.exe') then  //���� �ǰ� ������
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            // ����� process�� ���� �����Ų��
            TerminateProcess(hProcess, 0);
          end;
        end;
//        TObject(ProcessList.Objects[i]).free;
      end;
    end;
  Finally
    ProcessList.Clear;
    ProcessList.Free;
  End;
end;

procedure TfmMain.mn_JNHospitalClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmJNHospitalDoorSetting');
end;

function TfmMain.FingerDeviceRelay: Boolean;
var
  stSql : string;
begin

  stSql := 'Update TB_FINGERDEVICE set FD_CHANGE = ''R'' where FD_CHANGE is NULL OR FD_CHANGE = ''Y'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' select * from TB_FINGERDEVICE  ';
  stSql := stSql + ' where FD_CHANGE = ''R'' ';
  stSql := stSql + ' Order by FD_DEVICEID ';
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
      if G_bApplicationTerminate then Exit;
      if FindField('FD_DEVICENO').AsString <> '' then
      begin
        if RelayFingerDevice(FindField('FD_DEVICEID').AsString,inttostr(FindField('FD_DEVICENO').asinteger - 1),
                             FindField('FD_DEVICEIP').AsString,FindField('FD_DEVICEPORT').AsString,
                             FindField('FD_DEVICENAME').AsString)
        then
        begin
          stSql := 'Update TB_FINGERDEVICE set FD_CHANGE = ''N'' where FD_DEVICEID = ' + FindField('FD_DEVICEID').AsString ;
          DataModule1.ProcessExecSQL(stSql);
        end;
      end;
      Next;
    end;
  end;

end;

function TfmMain.RelayFingerDevice(aDEVICESEQ,aFINGERDEVICEID, aDEVICEIP, aDEVICEPORT,
  aDEVICENAME: string): Boolean;
var
  stSql : string;
  stTermianalCode : string;
begin
  result := False;
  stTermianalCode := 'tm_' + FillZeroNumber(strtoint(aDEVICESEQ),4);

  if SHF_CheckTB_TERMINAL(stTermianalCode) = 1 then
  begin
    stSql := ' Update tb_terminal set ';
    stSql := stSql + 'int_terminalAddress = ' + aFINGERDEVICEID + ',';
    stSql := stSql + 'str_terminalIP = ''' + aDEVICEIP + ''',';
    stSql := stSql + 'int_terminalPort = ' + aDEVICEPORT + ',';
    stSql := stSql + 'str_terminalPlace = ''' + aDEVICENAME + ''', ';
    stSql := stSql + 'int_ipautoupdate = 0 ';
    stSql := stSql + ' where str_terminalCode = ''' + stTermianalCode + ''' ';
  end else
  begin
    stSql := ' Insert Into tb_terminal(str_terminalCode,int_terminalAddress,str_terminalIP,int_terminalPort,str_terminalPlace,int_ipautoupdate) ';
    stSql := stSql + ' Values(';
    stSql := stSql + ' ''' + stTermianalCode + ''', ';
    stSql := stSql + ' ' + aFINGERDEVICEID + ', ';
    stSql := stSql + ' ''' + aDEVICEIP + ''', ';
    stSql := stSql + ' ' + aDEVICEPORT + ', ';
    stSql := stSql + ' ''' + aDEVICENAME + ''', ';
    stSql := stSql + ' 0 ) ';
  end;
  if SHF_ProcessExecSQL(stSql) > 0 then result := True;
end;

function TfmMain.SHF_CheckTB_TERMINAL(aterminalid: string): integer;
var
  TempQuery :TADOQuery;
  stSql : string;
begin
  result := -1;
  stSql := 'Select * from tb_terminal where str_terminalCode = ''' + aterminalid + ''' ';
  Try
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := ADOfdmsConnection;
    TempQuery.DisableControls;
    with TempQuery do
    begin
      Close;
      SQL.Text:= stSql;
      try
        Open;
      except
      ON E: Exception do
        begin
          LogSave(ExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + stSql);

          Exit;
        end
      end;
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempQuery.EnableControls;
    TempQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.SHF_ProcessExecSQL(aSql: string): integer;
var
  TempQuery :TADOQuery;
begin
  result := -1;
  Try
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := ADOfdmsConnection;
    TempQuery.DisableControls;
    with TempQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        result := ExecSQL;
      except
      ON E: Exception do
        begin
          LogSave(ExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + aSql);

          Exit;
        end
      end;
    end;
  Finally
    TempQuery.EnableControls;
    TempQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.FingerSend: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stPermit : string;
  stTemp : string;
begin
  result := True;
  stSql := ' Update TB_FINGERDEVICECARD set FP_SEND = ''R'' Where FP_SEND = ''N'' OR FP_SEND is NULL ';

  DataModule1.ProcessExecSQL(stSql);

  if fdmsDBType = 0 then
  begin
    stSql := 'Select a.*,b.FD_DEVICEIP,b.FD_DEVICEPORT,b.FD_DEVICENAME,b.FD_DEVICENO,b.FD_DEVICETYPE,c.FP_CARDNO,c.FP_DATA,d.CA_CARDTYPE,e.EM_RETIREDATE,e.WG_CODE from ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_FINGERDEVICECARD a ';
    stSql := stSql + ' Inner Join TB_FINGERDEVICE b ';
    stSql := stSql + ' ON(a.FD_DEVICEID = b.FD_DEVICEID ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join TB_CARDFINGER c ';
    stSql := stSql + ' ON(a.FP_USERID = c.FP_USERID ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join TB_CARD d ';
    stSql := stSql + ' ON(c.FP_CARDNO = d.CA_CARDNO ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE e ';
    stSql := stSql + ' ON(d.CO_COMPANYCODE = e.CO_COMPANYCODE and d.EM_CODE = e.EM_CODE ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Where a.FP_SEND = ''R'' ';
    stSql := stSql + ' Order by a.FD_DEVICEID ';
  end else
  begin
    stSql := 'Select a.*,b.FD_DEVICEIP,b.FD_DEVICEPORT,b.FD_DEVICENAME,b.FD_DEVICENO,b.FD_DEVICETYPE,c.FP_CARDNO,c.FP_DATA,d.CA_CARDTYPE,e.EM_RETIREDATE,e.WG_CODE from TB_FINGERDEVICECARD a ';
    stSql := stSql + ' Inner Join TB_FINGERDEVICE b ';
    stSql := stSql + ' ON(a.FD_DEVICEID = b.FD_DEVICEID ) ';
    stSql := stSql + ' Inner Join TB_CARDFINGER c ';
    stSql := stSql + ' ON(a.FP_USERID = c.FP_USERID ) ';
    stSql := stSql + ' Left Join TB_CARD d ';
    stSql := stSql + ' ON(c.FP_CARDNO = d.CA_CARDNO ) ';
    stSql := stSql + ' Left Join TB_EMPLOYEE e ';
    stSql := stSql + ' ON(d.CO_COMPANYCODE = e.CO_COMPANYCODE and d.EM_CODE = e.EM_CODE ) ';
    stSql := stSql + ' Where a.FP_SEND = ''R'' ';
    stSql := stSql + ' Order by a.FD_DEVICEID ';
  end;

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
      result := False;
      if recordcount < 1 then Exit;

      First;
      while Not Eof do
      begin
        stPermit := FindField('FP_PERMIT').AsString;
        stTemp := FindField('EM_RETIREDATE').AsString;
        if FindField('EM_RETIREDATE').AsString < FormatDateTime('yyyymmdd',now)  then stPermit := '0';
        if FindField('WG_CODE').AsString <> '1'  then stPermit := '0';    //�������� �ƴϸ� ����
        if Trim(Findfield('CA_CARDTYPE').AsString) <> '1' then stPermit := '0';  //ī����°� ������ �ƴϸ� ����

        //DB�����ÿ��� ���⼭ ���� ���̺� �Ѱ� ����.
        if SHF_RelayFingerUserPermit(inttostr(FindField('FD_DEVICENO').asInteger-1),
                     FindField('FP_USERID').AsString,stPermit,FindField('FP_CARDNO').AsString) then
        begin
          stSql := ' Update TB_FINGERDEVICECARD set FP_SEND = ''Y'' ' ;   //�ٽ� �θ��� �ʰ�
          stSql := stSql + ' Where FD_DEVICEID = ' + FindField('FD_DEVICEID').AsString;
          stSql := stSql + ' AND FP_USERID = ' + FindField('FP_USERID').AsString ;

          DataModule1.ProcessExecSQL(stSql);
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

function TfmMain.SHF_RelayFingerUserPermit(aFINGERDEVICEID, aPOSITIONNUM,
  aPermit, aCardNo: string): Boolean;
var
  stSql : string;
  stPermit : string;
begin
  if aPermit = '0' then stPermit := 'D'
  else stPermit := 'I';

  if SHF_CheckSyncUserterminal(aPOSITIONNUM,aFINGERDEVICEID) = 1 then
  begin
    stSql := ' Update tb_syncuserterminal ';
    stSql := stSql + ' set str_mode = ''' + stPermit + ''',';
    stSql := stSql + ' str_result = ''F'' ';
    stSql := stSql + ' where str_emptmId = ''' + FillZeroNumber(strtoint(aPOSITIONNUM),G_nFPUserIDLength) + ''' ';
    stSql := stSql + ' and int_terminalAddress = ' + aFINGERDEVICEID + ' ';
  end else
  begin
    stSql := ' Insert Into tb_syncuserterminal( ';
    stSql := stSql + 'str_emptmId,';
    stSql := stSql + 'int_terminalAddress,';
    stSql := stSql + 'str_mode,';
    stSql := stSql + 'str_result,';
    stSql := stSql + 'regdate) ';
    stSql := stSql + ' values(';
    stSql := stSql + '''' + FillZeroNumber(strtoint(aPOSITIONNUM),G_nFPUserIDLength) + ''', ';
    stSql := stSql + '' + aFINGERDEVICEID + ', ';
    stSql := stSql + '''' + stPermit + ''', ';
    stSql := stSql + '''F'', ';
    stSql := stSql + 'getdate() ) ';
  end;
  if SHF_ProcessExecSQL(stSql) > 0 then result := True;
end;

function TfmMain.SHF_CheckSyncUserterminal(aPOSITIONNUM,
  aFINGERDEVICEID: string): integer;
var
  TempQuery :TADOQuery;
  stSql : string;
begin
  result := -1;
  stSql := 'Select * from tb_syncuserterminal ';
  stSql := stSql + ' where str_emptmId = ''' + FillZeroNumber(strtoint(aPOSITIONNUM),G_nFPUserIDLength) + ''' ';
  stSql := stSql + ' and int_terminalAddress = ' + aFINGERDEVICEID + ' ';

  Try
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := ADOfdmsConnection;
    TempQuery.DisableControls;
    with TempQuery do
    begin
      Close;
      SQL.Text:= stSql;
      try
        Open;
      except
      ON E: Exception do
        begin
          LogSave(ExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + stSql);
          Exit;
        end
      end;
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempQuery.EnableControls;
    TempQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.HolidayListDataCreate(aYear:string);
var
  i,j : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  L_bHolidayChange := False;
  for i := 1 to 12 do
  begin
    L_arrHolidayList[i] := '';
    for j := 1 to 31 do
        L_arrHolidayList[i] := L_arrHolidayList[i] + '0';
  end;
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
{    if ConnectDeviceList.Count > 0 then
    begin
      stSql := stSql + ' AND (';
      for i:=0 to ConnectDeviceList.Count - 1 do
      begin
        if i <> 0 then stSql := stSql + ' OR ';
        stSql := stSql + '(AC_NODENO = ' + inttostr(strtoint(copy(ConnectDeviceList.Strings[i],1,3))) ;
        stSql := stSql + ' AND AC_ECUID = ''' + copy(ConnectDeviceList.Strings[i],4,2) + ''')';
      end;
      stSql := stSql + ' ) ';
    end else Exit;   }

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
(*�������� ��� ���ذ� �ٲ�� ������ �Ѵ�.  //20171013 ����
      if RecordCount < 1 then
      begin
        UpdateTB_ACCESSDEVICE_HoSend('','','Y');
        Exit;
      end;
*)
      First;
      //HolidayList := TStringList.Create;
      //HolidayList.Clear;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('HO_STATE').AsString = 'I' then
        begin
          L_arrHolidayList[strtoint(copy(FindField('HO_DAY').AsString,5,2))][strtoint(copy(FindField('HO_DAY').AsString,7,2))] := FindField('HO_TYPE').asstring[1];
        end;
        //HolidayList.Add(FindField('HO_STATE').AsString + copy(FindField('HO_DAY').AsString,5,4));
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.GetFdmsUserKey(aFDMS_Key: string): string;
var
  stSql : string;
begin
  result := aFDMS_Key;
  stSql := ' select * from tb_employe ';
  stSql := stSql + ' Where str_empCode = ''' + aFDMS_Key  + ''' ';

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
    if recordCount < 1 then  Exit;
    result := NextFdmsUserKey;
  End;
end;

function TfmMain.NextFdmsUserKey: string;
var
  stSql : string;
begin

  result := 'ep_0000001';
  stSql := ' select Max(str_empCode) as Key from tb_employe ';
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
    if recordCount < 1 then  Exit;
    result := 'ep_' + FillZeroNumber(strtoint(copy(FindField('Key').AsString,4,7)),7);
  End;
end;

procedure TfmMain.CardDownLoadCheckTimerTimer(Sender: TObject);
begin
  inherited;
  //������ ī�� �ٿ�ε� ���α׷� ���� ��Ű��.
  L_bCardDownLoad := False;
  CardAutoDownTimer.Enabled := Not G_bApplicationTerminate;
  CardDownLoadCheckTimer.Enabled := False;
end;

end.



