unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, ExtCtrls, Menus, jpeg, ActnList,
  uSubForm,  OoMisc, AdPort, AdWnPort, StdCtrls,iniFiles,
  vCal, PlannerCal, Planner, PlanSimpleEdit, Grids, CommandArray, Gauges,ADODB,
  DB,ActiveX, LMDCustomComponent, LMDIniCtrl,
  uServerConnectModule,systeminfos, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, MHttpWorker, OleCtrls, SHDocVw,
  SyncObjs,
  uDeviceState,uMonitoringCommonVariable,uMonitoringDataProcess,uDataModule1,
  MPlayer,mmSystem, Buttons, AdPacket,ShellAPI, ScktComp, AdvAppStyler,
  Registry;

//{$DEFINE TClientSocket}
{$DEFINE TApdWinsockport}

const con_AccessMapMonitoring = 1;
const con_AccessReport = 2;
const con_AccessTypeMonitoring = 3;
const con_AdminChangeReport = 4;
const con_AlarmAccessReport = 5;
const con_AlarmAdminReport = 6;
const con_AlarmMapMonitoring = 7;
const con_AlarmTypeMonitoring = 8;
const con_ArmGradeReport = 9;
const con_BuildingAccessReport = 10;
const con_BuildingAccessTypeMonitoring = 11;
const con_BuildingAlarmReport = 12;
const con_CardAccessTime = 20;
const con_CardAdminReport = 21;
const con_CardList = 22;
const con_CardValidDate = 23;
const con_ChangeAccessReport = 24;
const con_ComMonitoring = 25;
const con_DeviceGradeSearch = 30;
const con_DeviceListReport = 31;
const con_DeviceVerInfo = 32;
const con_DoorAdminReport = 33;
const con_DoorGradeReport = 34;
const con_DoorTypeMonitor = 35;
const con_DupCardEmployShow = 36;
const con_EmployShow = 50;
const con_InOutReport = 51;
const con_InOutStateList = 52;
const con_KTCardCreateShow = 53;
const con_KTCardRegShow = 54;
const con_KTIssusNReg = 55;
const con_KTTypeMonitoring = 56;
const con_LargeAccessReport = 60;
const con_MDIAlarmGrade = 70;
const con_MDICardAdminShow = 71;
const con_MDIDeviceGrade = 72;
const con_MDIDoorGrade = 73;
const con_Monitoring = 74;
const con_NewAlarmReport =  75;
const con_NotCardReport = 76;
const con_NotPTListReport = 77;
const con_PerAtReport = 80;
const con_PersonStateReport = 81;
const con_ReaderState = 82;
const con_RemoteSupport = 83;
const con_ScheduleForm = 88;
const con_SystemLoginReport = 89;
const con_TimeAccessReport = 90;
const con_TimeNotAccessReport = 91;
const con_TreeEmployeeShow = 92;
const con_ZoneStateReport = 93;

type
  TControlSendThread = class(TThread)
  private
  protected
    procedure Execute; override;
    procedure ControlDataSend(aData:string) ;
  public
  end;
  TReceiveMonitorThread = class(TThread)
  private
  protected
    procedure Execute; override;
    procedure MonitorProcess(aData:string) ;
  public
  end;


  TfmMain = class(TfmASubForm)
    MainMenu1: TMainMenu;
    mn_PG: TMenuItem;
    mn_Login: TMenuItem;
    Mn_LogOff: TMenuItem;
    N2: TMenuItem;
    mn_Close: TMenuItem;
    N3: TMenuItem;
    mn_PGInfo: TMenuItem;
    MN_BasicCode: TMenuItem;
    MN_CompanyCode: TMenuItem;
    mn_DepartCode: TMenuItem;
    mn_Posicode: TMenuItem;
    mn_Device: TMenuItem;
    mn_AccessCode: TMenuItem;
    mn_AlarmCode: TMenuItem;
    mn_DeviceConfig: TMenuItem;
    mn_Manager: TMenuItem;
    mn_Employee: TMenuItem;
    mn_AcceesGrade: TMenuItem;
    mn_PersonGradeSearch: TMenuItem;
    mn_DeviceGradeSearch: TMenuItem;
    mn_ProgramConfig: TMenuItem;
    mn_AttendConfigSetting: TMenuItem;
    mn_ZipCode: TMenuItem;
    N23: TMenuItem;
    mn_AccessDeviceTypeCode: TMenuItem;
    mn_AccessStateCode: TMenuItem;
    mn_AlarmStateCode: TMenuItem;
    mn_AlarmManageCode: TMenuItem;
    mn_AlarmDeviceTypeCode: TMenuItem;
    mn_AlarmModeCode: TMenuItem;
    mn_GradeDownload: TMenuItem;
    mn_FoodConfigSetting: TMenuItem;
    mn_InitConfigSetting: TMenuItem;
    mn_ProgramConfigSetting: TMenuItem;
    mn_DataBase: TMenuItem;
    mn_DBBackup: TMenuItem;
    mn_DataDelete: TMenuItem;
    mn_System: TMenuItem;
    mn_GradeAdmin: TMenuItem;
    mn_GradeProgramAdmin: TMenuItem;
    mn_SystemUserAdmin: TMenuItem;
    mn_Report: TMenuItem;
    mn_AccessReport: TMenuItem;
    mn_Alarm: TMenuItem;
    Image1: TImage;
    ToolBar1: TToolBar;
    btnDaemonConnect: TToolButton;
    btnEmploy: TToolButton;
    btnAccessAdmin: TToolButton;
    BtnDeviceAdmin: TToolButton;
    Menu_ImageList: TImageList;
    btnMonitor: TToolButton;
    ActionList1: TActionList;
    Action_Monitoring: TAction;
    Action_Login: TAction;
    StatusBar1: TStatusBar;
    mn_LocateAdmin: TMenuItem;
    mn_DeviceAdmin: TMenuItem;
    mn_Monitoring: TMenuItem;
    mn_CurrentState: TMenuItem;
    mn_DoorControl: TMenuItem;
    mn_TotClose: TMenuItem;
    mn_TotOpen: TMenuItem;
    mn_AlarmControl: TMenuItem;
    mn_TotAlarm: TMenuItem;
    mn_TotCancel: TMenuItem;
    Action_LogOut: TAction;
    Action_Employ: TAction;
    Action_CardAdmin: TAction;
    Action_DeviceGradeSearch: TAction;
    Action_TotClose: TAction;
    btn_CurrentState: TToolButton;
    Action_StateSearch: TAction;
    Action_TotOpen: TAction;
    Action_TotAlarm: TAction;
    Action_TotCancel: TAction;
    mn_DepartGradeAdmin: TMenuItem;
    WinsockPort1: TApdWinsockPort;
    SendDaemonTimer: TTimer;
    Action_DeviceCard: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    Action_CardDownLoad: TAction;
    Action1: TAction;
    SaveDialog1: TSaveDialog;
    SimpleItemEditor1: TSimpleItemEditor;
    N7: TMenuItem;
    mn_ComState: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Pan_Gauge: TPanel;
    Gauge1: TGauge;
    StaticText1: TStaticText;
    N10: TMenuItem;
    ServerConnectTimer: TTimer;
    N11: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    mn_BatchEmployee: TMenuItem;
    ADOQuery: TADOQuery;
    FTP1: TMenuItem;
    mn_JijumCode: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    mn_PerEmployee: TMenuItem;
    N24: TMenuItem;
    N1: TMenuItem;
    mn_cardDownLoad: TMenuItem;
    N25: TMenuItem;
    LiveTimer: TTimer;
    NowTimer: TTimer;
    mn_RelaySamyukEmploy: TMenuItem;
    StateCheckTimer: TTimer;
    mn_readerState: TMenuItem;
    mn_readerHistory: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    LMDIniCtrl1: TLMDIniCtrl;
    PeronRelayTimer1: TTimer;
    mn_InOutReport: TMenuItem;
    mn_KTCard: TMenuItem;
    mn_KTLine: TMenuItem;
    N19: TMenuItem;
    mn_EmpType: TMenuItem;
    N20: TMenuItem;
    Action_GroupMonitoring: TAction;
    pan_Message: TPanel;
    StaticText2: TStaticText;
    st_Message: TStaticText;
    MessageTimer: TTimer;
    N26: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N34: TMenuItem;
    N27: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    mn_EmployeeBranch: TMenuItem;
    Action_DoorTypeMonitoring: TAction;
    Action_KTTypeMonitoring: TAction;
    mn_KHUEmployee: TMenuItem;
    mn_KHUEmpInitial: TMenuItem;
    test1: TMenuItem;
    mn_Fireline: TMenuItem;
    mn_FireRecover: TMenuItem;
    AdoConnectCheckTimer: TTimer;
    mn_LOMOSEmployee: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    IdFTP1: TIdFTP;
    mn_KTIssusNReg: TMenuItem;
    mn_DeviceVerInfo: TMenuItem;
    N40: TMenuItem;
    N39: TMenuItem;
    N41: TMenuItem;
    N33: TMenuItem;
    N42: TMenuItem;
    mn_NotCardReport: TMenuItem;
    mn_TimeAccessReport: TMenuItem;
    N43: TMenuItem;
    mn_CardList: TMenuItem;
    mn_cardValidDate: TMenuItem;
    mn_lomosLine: TMenuItem;
    mn_LOMOSBackup: TMenuItem;
    Action_AlarmTypeMonitoring: TAction;
    ControlSocketPort: TApdWinsockPort;
    MediaPlayer1: TMediaPlayer;
    DaemonReceiveTimer: TTimer;
    AlarmSound: TTimer;
    Action_AccessTypeMonitoring: TAction;
    N44: TMenuItem;
    N45: TMenuItem;
    mn_empChangeReport: TMenuItem;
    DaemonLiveCheckTimer: TTimer;
    DaemonLiveRecvTimer: TTimer;
    DaemonMessageVisibleTimer1: TTimer;
    mn_cardReport: TMenuItem;
    btn_message: TSpeedButton;
    mn_AlarmReport: TMenuItem;
    mn_buildingAlarmReport: TMenuItem;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    Action_BuildingAccessTypeMonitoring: TAction;
    Action_AlarmMapMonitoring: TAction;
    mn_AtReport: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    Action_AccessMapMonitoring: TAction;
    N48: TMenuItem;
    mn_Remote: TMenuItem;
    mn_NotPTReport: TMenuItem;
    mn_MJUEmployee: TMenuItem;
    Gauge2: TGauge;
    mn_AlarmAccessReport: TMenuItem;
    N49: TMenuItem;
    mn_DoorGradeReport: TMenuItem;
    mn_ArmGradeReport: TMenuItem;
    mn_alarmAreaGubun: TMenuItem;
    mn_MonitoringUpgrade: TMenuItem;
    N51: TMenuItem;
    WinsockPort: TClientSocket;
    mn_KTCardCreate: TMenuItem;
    mn_KTCardInitialize: TMenuItem;
    mn_KTCardReg: TMenuItem;
    CardCreatePort: TApdWinsockPort;
    mn_alarmGroup: TMenuItem;
    DBSocketReceiveTimer: TTimer;
    mn_JavaraSchedule: TMenuItem;
    mn_InOut: TMenuItem;
    N50: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    Action_DoorGradeSearch: TAction;
    Action_AlarmGardeSearch: TAction;
    mn_TimeNotAccessReport: TMenuItem;
    mn_emCodeChange: TMenuItem;
    mn_BuildingAccessReport: TMenuItem;
    mn_TimeCode: TMenuItem;
    mn_CardAccessTime: TMenuItem;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    mn_PWChange: TMenuItem;
    N55: TMenuItem;
    ArmAreaStateTimer: TTimer;
    AutoLogOutTimer: TTimer;
    N54: TMenuItem;
    mn_zonestatereport: TMenuItem;
    MediaPlayer2: TMediaPlayer;
    DoorStateCheckTimer1: TTimer;
    N56: TMenuItem;
    mn_SystemLoginReport: TMenuItem;
    mn_AdminChangeReport: TMenuItem;
    MediaPlayer3: TMediaPlayer;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Action_LoginExecute(Sender: TObject);
    procedure Action_LogOutExecute(Sender: TObject);
    procedure Action_MonitoringExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Action_StateSearchExecute(Sender: TObject);
    procedure Action_TotCloseExecute(Sender: TObject);
    procedure Action_TotOpenExecute(Sender: TObject);
    procedure Action_TotAlarmExecute(Sender: TObject);
    procedure Action_TotCancelExecute(Sender: TObject);
    procedure MN_CompanyCodeClick(Sender: TObject);
    procedure mn_DepartCodeClick(Sender: TObject);
    procedure mn_PosicodeClick(Sender: TObject);
    procedure mn_ZipCodeClick(Sender: TObject);
    procedure mn_GradeAdminClick(Sender: TObject);
    procedure mn_GradeProgramAdminClick(Sender: TObject);
    procedure mn_SystemUserAdminClick(Sender: TObject);
    procedure mn_DepartGradeAdminClick(Sender: TObject);
    procedure mn_AccessStateCodeClick(Sender: TObject);
    procedure mn_AlarmStateCodeClick(Sender: TObject);
    procedure mn_AlarmManageCodeClick(Sender: TObject);
    procedure mn_AlarmDeviceTypeCodeClick(Sender: TObject);
    procedure mn_DeviceAdminClick(Sender: TObject);
    procedure mn_LocateAdminClick(Sender: TObject);
    procedure Action_EmployExecute(Sender: TObject);
    procedure WinsockPort1TriggerAvail(CP: TObject; Count: Word);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WinsockPort1WsConnect(Sender: TObject);
    procedure WinsockPort1WsError(Sender: TObject; ErrCode: Integer);
    procedure WinsockPort1WsDisconnect(Sender: TObject);
    procedure btnDaemonConnectClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure SendDaemonTimerTimer(Sender: TObject);
    procedure Action_CardAdminExecute(Sender: TObject);
    procedure Action_CardDownLoadExecute(Sender: TObject);
    procedure CommandArrayCommandsTCommand2Execute(Command: TCommand;
      Params: TStringList);
    procedure Action_DeviceGradeSearchExecute(Sender: TObject);
    procedure mn_DBBackupClick(Sender: TObject);
    procedure mn_ProgramConfigSettingClick(Sender: TObject);
    procedure mn_AccessReportClick(Sender: TObject);
    procedure mn_AlarmReportClick(Sender: TObject);
    procedure mn_ComStateClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StaticText1Click(Sender: TObject);
    procedure CommandArrayCommandsTCommand4Execute(Command: TCommand;
      Params: TStringList);
    procedure ServerConnectTimerTimer(Sender: TObject);
    procedure Action_DeviceCardExecute(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure mn_BatchEmployeeClick(Sender: TObject);
    procedure LiveTimerTimer(Sender: TObject);
    procedure mn_JijumCodeClick(Sender: TObject);
    procedure NowTimerTimer(Sender: TObject);
    procedure mn_RelaySamyukEmployClick(Sender: TObject);
    procedure StateCheckTimerTimer(Sender: TObject);
    procedure mn_readerHistoryClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure PeronRelayTimer1Timer(Sender: TObject);
    procedure mn_InOutReportClick(Sender: TObject);
    procedure mn_KTCardClick(Sender: TObject);
    procedure mn_EmpTypeClick(Sender: TObject);
    procedure Action_GroupMonitoringExecute(Sender: TObject);
    procedure CommandArrayCommandsTGroupMonitoringExecute(
      Command: TCommand; Params: TStringList);
    procedure StaticText2Click(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure btnMonitorClick(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure CommandArrayCommandsTMulitServerSendExecute(
      Command: TCommand; Params: TStringList);
    procedure CommandArrayCommandsTSERVERSTATEExecute(Command: TCommand;
      Params: TStringList);
    procedure N32Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure mn_EmployeeBranchClick(Sender: TObject);
    procedure Action_DoorTypeMonitoringExecute(Sender: TObject);
    procedure Action_KTTypeMonitoringExecute(Sender: TObject);
    procedure mn_KHUEmployeeClick(Sender: TObject);
    procedure mn_KHUEmpInitialClick(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure mn_FireRecoverClick(Sender: TObject);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);
    procedure mn_LOMOSEmployeeClick(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure mn_KTIssusNRegClick(Sender: TObject);
    procedure mn_DeviceVerInfoClick(Sender: TObject);
    procedure mn_TimeAccessReportClick(Sender: TObject);
    procedure mn_NotCardReportClick(Sender: TObject);
    procedure FTP1Click(Sender: TObject);
    procedure mn_CardListClick(Sender: TObject);
    procedure mn_cardValidDateClick(Sender: TObject);
    procedure mn_LOMOSBackupClick(Sender: TObject);
    procedure Action_AlarmTypeMonitoringExecute(Sender: TObject);

    procedure ControlSocketPortWsConnect(Sender: TObject);
    procedure ControlSocketPortWsDisconnect(Sender: TObject);
    procedure ControlSocketPortWsError(Sender: TObject; ErrCode: Integer);
    procedure ControlSocketPortTriggerAvail(CP: TObject; Count: Word);
    procedure CommandArrayCommandsTAlarmSoundExecute(Command: TCommand;
      Params: TStringList);
    procedure DaemonReceiveTimerTimer(Sender: TObject);
    procedure AlarmSoundTimer(Sender: TObject);
    procedure Action_AccessTypeMonitoringExecute(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure CommandArrayCommandsTAlarmReportExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTLOCATIONMAPExecute(Command: TCommand;
      Params: TStringList);
    procedure mn_empChangeReportClick(Sender: TObject);
    procedure DaemonLiveCheckTimerTimer(Sender: TObject);
    procedure DaemonLiveRecvTimerTimer(Sender: TObject);
    procedure DaemonMessageVisibleTimer1Timer(Sender: TObject);
    procedure mn_cardReportClick(Sender: TObject);
    procedure btn_messageClick(Sender: TObject);
    procedure mn_buildingAlarmReportClick(Sender: TObject);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
    procedure CommandArrayCommandsTFORMSHOWExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCARDSHOWExecute(Command: TCommand;
      Params: TStringList);
    procedure Action_BuildingAccessTypeMonitoringExecute(Sender: TObject);
    procedure Action_AlarmMapMonitoringExecute(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure Action_AccessMapMonitoringExecute(Sender: TObject);
    procedure mn_RemoteClick(Sender: TObject);
    procedure mn_NotPTReportClick(Sender: TObject);
    procedure mn_AlarmAccessReportClick(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure mn_DoorGradeReportClick(Sender: TObject);
    procedure mn_ArmGradeReportClick(Sender: TObject);
    procedure mn_alarmAreaGubunClick(Sender: TObject);
    procedure mn_MonitoringUpgradeClick(Sender: TObject);
    procedure IndyTimerTimer(Sender: TObject);
    procedure WinsockPortConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure WinsockPortDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure WinsockPortError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure WinsockPortRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure mn_KTCardCreateClick(Sender: TObject);
    procedure ApdDataPacket2StringPacket(Sender: TObject; Data: String);
    procedure CardCreatePortTriggerAvail(CP: TObject; Count: Word);
    procedure mn_KTCardInitializeClick(Sender: TObject);
    procedure mn_KTCardRegClick(Sender: TObject);
    procedure mn_alarmGroupClick(Sender: TObject);
    procedure CommandArrayCommandsTSTATUSExecute(Command: TCommand;
      Params: TStringList);
    procedure DBSocketReceiveTimerTimer(Sender: TObject);
    procedure mn_JavaraScheduleClick(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure Action_DoorGradeSearchExecute(Sender: TObject);
    procedure Action_AlarmGardeSearchExecute(Sender: TObject);
    procedure mn_TimeNotAccessReportClick(Sender: TObject);
    procedure mn_emCodeChangeClick(Sender: TObject);
    procedure mn_BuildingAccessReportClick(Sender: TObject);
    procedure mn_TimeCodeClick(Sender: TObject);
    procedure mn_CardAccessTimeClick(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure mn_PWChangeClick(Sender: TObject);
    procedure ArmAreaStateTimerTimer(Sender: TObject);
    procedure AutoLogOutTimerTimer(Sender: TObject);
    procedure mn_zonestatereportClick(Sender: TObject);
    procedure DoorStateCheckTimer1Timer(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure mn_SystemLoginReportClick(Sender: TObject);
    procedure mn_AdminChangeReportClick(Sender: TObject);
  private
    FLogined: Boolean;
    FPrivileges: String;
    FMonitoring: Boolean;
    stPrivileges:String;
    ServerComBuff: String;
    CreateCardBuff: String;
    ControlComBuff: String; //제어 명령 수신부
    DaemonServerIP : string;
    DaemonServerPort : string;
    ControlPort : string;
    StatePort : string;
    EventPort : string;
    L_bMessageFlag : Boolean;
    L_nArmAreaStateCount : integer;
    L_nRecvPacketCount : integer;
    L_nWebContentLength : integer;
    L_nKeyCheck : integer;
    L_bWebComplete : Boolean;
    L_bZeronConnected : Boolean;
    L_bShowModalVisible : Boolean;  //showmodal 로 뜨는 경우 데몬 통신 에러 메시지 출력 부분 때문에 추가 2011.04.19
    L_nCurrentAlarmCnt : integer;
    L_nDaemonReciveFailCount : integer;
    L_nOldDBSocketSeq : integer; //최종 가져온 DBSocketSequence
    L_dtActiveTime : TDateTime;

    SendData : string;

    FailCount : integer; //송신실패 횟수
    IsFormShow : Boolean;
    bSending : Boolean;    //데이터 전송중
    L_bSound : Boolean;
    FGroupMonitoring: Boolean; //폼닫기
    L_bFireRecoverUse : Boolean;
    FFTPDownLoadShow: Boolean;
    FDaemonServerConnected: Boolean;
    FControlSocketConnected: Boolean;
    L_bDaemonLiveReceive : Boolean;
    FAlarmPlayStop: Boolean;

    { Private declarations }
    Function  AuthSiteConnect: Boolean;
    Function  ChildFormClose:Boolean;
    Function  MDIForm(FormName:string):TForm;
    Procedure MDIChildShow(FormName:String);
    Procedure MDIChildGradeShow(FormName:String;aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
    procedure SetLogined(const Value: Boolean);
    procedure SetPrivileges(const Value: String);
    Procedure TravelMenuItem(MenuItem:TMenuItem;ProgIDs:String);
    Procedure TravelMenuView(MenuItem:TMenuItem;ProgIDs:String);
    Procedure TravelToolBar(ToolBar:TToolBar;ProgIDs:String);
    Procedure TravelToolButton(ToolButton:TToolButton;ProgIDs:String);
    procedure SetMonitoring(const Value: Boolean);
    procedure InitConfigSet;
    procedure RelayConfigSet;
    Procedure MenuViewSetting;
    procedure FormNameSet;
    procedure MenuNameSet;
    Procedure SendDaemon(aData:string);
    Function  DBBackup(aDBName,aBackupFile:string):Boolean;
    procedure CenterPanel;
    procedure DeviceRcvRegCardData(aData:string);
    procedure GetProgramGrade(aProgID:string;var aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
    procedure ClientConfigRead;
    procedure SetGroupMonitoring(const Value: Boolean);

    procedure MonitorStart;
    procedure DaemonRestart;
    procedure MonitoringDataProcess(aData:string;aDaemonNo:integer=0);
    procedure SetFTPDownLoadShow(const Value: Boolean);
    procedure SetFDaemonServerConnected(const Value: Boolean);
    procedure SetFControlSocketConnected(const Value: Boolean);
    procedure ShowPWChange;
    function CheckArmAreaState : Boolean;
    procedure WriteRegistryKey(aCustomerID,aInstallDate:string);
    Function RegistryKeyCheck(var aCustomerID:string):Boolean;
  private
    //Table Check
    Function CheckTB_CARD(aCardNo:string;var aCompanyCode,aEmCode : string):Boolean;
    Function CheckTB_CARDEmCode(aCompanyCode,aEmCode:string):Boolean;
    Function CheckTB_CARDEmCodeMungJi(aCompanyCode,aEmCode:string;var aCardNo:string):Boolean;
    Function CheckTB_CARDEmCodeMungJiSerial(aCompanyCode,aEmCode:string;var aCardNo:string):Boolean;
    Function CheckTB_COMPANYJijumCode(aCompanyCode,aJijumCode:string):Boolean;
    Function CheckTB_COMPANYJijumName(aCompanyCode,aJijumName:string):Boolean;
    Function CheckTB_COMPANYDepartCode(aCompanyCode,aJijumCode,aDepartCode:string):Boolean;
    Function CheckTB_COMPANYDepartName(aCompanyCode,aJijumCode,aDepartName:string):Boolean;
    Function CheckTB_POSICode(aCompanyCode,aPosiCode:string):Boolean;
    Function CheckTB_POSIName(aCompanyCode,aPosiName:string):Boolean;
    Function CheckTB_Employee(aCompanyCode,aEmCode:string):Boolean;
  private
    //Table Insert
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,aName,aGubun:string):Boolean;
    Function InsertTB_EMPLOYEEBasic(aEmpID,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmpNM,aCompanyPhone,
                                 aHomePhone,aHandphone,aZipcode,aAddr1,aAddr2,aJoinDate,aRetireDate:string):Boolean;
    Function InsertTB_POSI(aCompanyCode,aPosiCode,aName:string):Boolean;
  private
    //Table Update
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdateTB_EMPLOYEEBasic(aEmpID,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmpNM,aCompanyPhone,
                                 aHomePhone,aHandphone,aZipcode,aAddr1,aAddr2,aJoinDate,aRetireDate:string):Boolean;
    Function UpdateTB_DEVICECARDNO(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함

    Function CopyGradeOldCard(aOldCard,aNewCard:string):Boolean;
  private
    //Table Delete
    Function DeleteTB_CARD(aCardNo:string):Boolean;
    Function DeleteTB_CARDEMPLOYEE(aCompanyCode,aEmCode:string):Boolean; //카드 삭제 및 권한 삭제
    Function DeleteTB_Employee(aCompanyCode,aEmCode:string):Boolean;
    Function DeleteTB_DEVICECARDNOCardNo(aCardNo:string):Boolean;
  private
    Function GetMaxJijumCode(aCompanyCode:string):integer;
    Function GetMaxDepartCode(aCompanyCode,aJijumCode:string):integer;
    Function GetMaxPositionNum : integer;
    Function GetMaxPosiCode(aCompanyCode:string):integer;
    Function GetJijumCodeFromName(aCompanyCode,aJijumName:string):string;
    Function GetDepartCodeFromName(aCompanyCode,aJijumCode,aDepartName:string):string;
    Function GetPosiCodeFromName(aCompanyCode,aPosiName:string):string;
  private
    ServerList : TStringList;
    DeviceList : TStringList;
    L_stRegReaderType : string;
    L_bNewRegReaderType : Boolean; //신규 등록기 타입(KT사옥과 범용 같이 있는 등록기)
    Function LoadMultiServer :Boolean;  //멀티서버를 로드 한다.
    Function LoadMultiDevice :Boolean;  //멀티서버에 해당하는 기기를 로드한다.
    Procedure CommNodeReceve(Sender: TObject;  ReceiveData: string;DaemonNO : integer);  //서버에서 Recv 되는 데이터
    Procedure CommNodeSend(Sender: TObject;  SendData: string;DaemonNO : integer);  //MCU에 Send 되는 모든 데이터를 실시간으로 조회 할 수 있도록 처리
    Procedure ServerConnected(Sender:TObject;  aConnected:Boolean;DaemonNO,aConnectedNo:integer);
    Function FindCommServer(aDaemonNo:Integer):TdServerConnectModule; // 데몬번호로 TdServerConnectModule를 찾는 function

    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected

    procedure RcvCardDataByReader(aData:string);
    procedure CardReadProcess(aCardNo:string);
    procedure RcvCreateCardDataByReader(aData:string);
    procedure CardReaderFormatChange(aType:string);
  private
    //삼육대학교 관련 모듈
    L_bPersonRelayCheck : boolean;
    procedure checkRelayPeronData; //인적사항 연동 데이터 체크
    procedure GetRelayConfig; //삼육대학교 DB서버 연동 관련 환경 설정
    procedure ReleaySamyukCheck;
    procedure ReleayKyngHeeCheck;
    procedure ReleayMungJiCheck;
    //Function CheckTBL_CARD:Boolean;
    Function CheckTRN_MEMBERS_FOR_TELECOP:Boolean;
    Function CheckTBL_CARDINFO : Boolean;  //카드 정보 변경 내역 체크
    //Function CheckTBL_CARDDEL:Boolean;
    Function RelayMunjiCodeCreate:Boolean;
    Function RelayMunjiPersonData(aRelayDateTime:string):Boolean; //명지대학교 인적사항 연동
    Function RelayMunjiEmployeePersonData(aRelayDateTime:string):Boolean; //명지대학교 교직원 연동 TEST
    Function RelayMunjiPersonDataTest(aRelayDateTime:string):Boolean; //명지대학교 인적사항 연동 TEST
    procedure CreateMungJiJijumCode;
    procedure CreateMungJiDepartCode;
    procedure CreateMungJiPosiCode;


  private //데이터 연동 관련
    Function GetEmployeeFdmsID(aCompanyCode,aEmpID:string):string;
    Function GetCardNo(aCompanyCode,aEmpID:string):string;

  private //Zeron Server FTP File Transfer
    L_stCustomerID : string;
    Function CreateZmosConfig:string;
    Function FTPZeronServerSend:Boolean;
    Function HTTPZeronServerSend(aContent:string):Boolean;

  public
    DownLoadCardList : TStringList;
    bCardDownLoad : Boolean;
    { Public declarations }
    procedure CardDownLoad(aDeviceID,aACK:string);
  Published
    Property Logined : Boolean read FLogined write  SetLogined; //프로퍼티를 생성함으로 Logined라는 변수가 바뀌면 SetLogined 라는 함수가 실행됨
    Property Privileges : String read FPrivileges write SetPrivileges;
    Property Monitoring : Boolean read FMonitoring write SetMonitoring;

    Property GroupMonitoring : Boolean read FGroupMonitoring write SetGroupMonitoring;
    Property FTPDownLoadShow : Boolean read FFTPDownLoadShow write SetFTPDownLoadShow;

    property DaemonServerConnected : Boolean read FDaemonServerConnected write SetFDaemonServerConnected;
    property ControlSocketConnected : Boolean read FControlSocketConnected write SetFControlSocketConnected;
    property AlarmPlayStop : Boolean read FAlarmPlayStop write FAlarmPlayStop;
  public
    //Thread 처리
    FControlSend : TCriticalSection;
    FReceiveTCS : TCriticalSection;  //메모리 증가때문에 테스트
    FDataProcessTCS : TCriticalSection;
    SendDaemonDataList : TStringList;
    SendStateDataList : TStringList;
    ReceiveDataList : TStringList;
    ControlSendThread :TControlSendThread;
    ReceiveThread :TReceiveMonitorThread;
    procedure ControlDataSendStart;
    procedure ControlDataSendStop;
    procedure ReceiveThreadStart;
    procedure ReceiveThreadStop;
    procedure MemoryCreate;
    procedure MemoryClear;
    procedure MemoryFree;
    procedure TimerStopAndFree;
    procedure MonitorHeaderNameCreate;

  private
    procedure BuildingSectorDeviceLoad;
    procedure LoadArmArea;
    procedure LoadNode;
    procedure LoadDevice;
    procedure LoadDoor;

  public
    //빌딩별 처리 위해서 처리
    procedure BuildingListAddDevice(aBuildingCode,aBuildingName:string);

    procedure AlarmEventViewStatusCodeLoad; //알람발생 코드 로드
    procedure AlarmEventSoundStatusCodeLoad; //알람발생 코드 로드

    procedure BuildingAlarmEventProcess(Sender:TObject;aBuildingCode:string;aAlaramState:TAlarmEventState);
    procedure BuildingAlarmModeProcess(Sender:TObject;aBuildingCode:string;aAlramMode:TWatchMode);

    //기기별 상태변경 이벤트
    procedure DoorFireStateChange(Sender:TObject;NodeNo:integer;aEcuID,aDoorNo:string;aFireState:Boolean); //출입문 화재 발생
    procedure DoorStateChange(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorDSState;
                                  aDoorLockType:TDoorLockState;
                                  aDoorFire:Boolean);
    procedure DeviceConnected(Sender: TObject;  Value:Boolean; NodeNo : integer;aEcuID:string);
    procedure ArmAreaAlarmEventState(Sender:TObject;NodeNo:integer;aECUID,aArmAreaNo:string;aAlaramState:TAlarmEventState);//방범구역 이벤트 발생
    procedure AlarmModeChanged(Sender: TObject; NodeNo : integer;aEcuID,aAlarmArea:string;aWachMode:TWatchMode); //경해 모드 변경
    procedure DeviceAlarmEventProcess(Sender:TObject;NodeNo:integer;ECUID,aArmAreaNo:string;aAlaramState:TAlarmEventState);
    procedure AlarmEventAnalysis(Sender:TObject;NodeNo:integer;ECUID,aArmAreaNo:string;
                                  aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aZoneCode,aMode,aStatusCode,aPortNo,aState,
                                  aOperator,aNewStateCode:string;
                                  aAlarmView,aAlarmSound:Boolean;
                                  aColor:string);
    procedure ExitButtonPress(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo,aTime,aInputType:string);
    procedure AccessEventProcess(Sender:TObject;NodeNo:integer;aEcuID,aDoorNo,aReaderNo,aCardNo,aTime,aPermit,aInputType,aButton,aArmAreaNo:string);
    procedure RcvDeviceSetupData(Sender:TObject;NodeNo:integer;aEcuID,aPacketData:string);

    //노드별 상태변경 이벤트
    procedure NodeConnectState(Sender:TObject;NodeNo:integer;aConnectState:TNodeCurrentState); //노드 Connected State

    //빌딩 상태변경 이벤트

    //데몬 상태변경 이벤트
    procedure RestartServer(Sender:TObject); //데몬 재시작시 수행됨
    procedure DaemonLive(Sender:TObject);
    procedure AlarmRefresh(Sender:TObject); //알람 상태 리프레쉬
    procedure FireRecovery(Sender:TObject); //화재복구
    procedure DeviceChange; //리더 변경발생
//    procedure ServerConnectEvent(Sender:TObject;aValue:Boolean); //Daemon Server Connected Event

  private
    L_bSendResult :Boolean;
    L_bWait :Boolean;
    L_stCardNo :string;
    function InialzeKTCard:Boolean;
    Function WriteCardInfo(aCardNo:string):Boolean; //카드 정보 Writer
    Function SearchCardInfo(aCardNo:string;aCheck:Boolean=True):Boolean; //카드 정보 Search
    procedure MessageEvent(var Msg: TMsg; var Handled: Boolean);
  end;

var
  fmMain: TfmMain;

implementation
uses
  udmAdoRelay, //연동 DB Connection 을 가지고 있다.
  uDataBaseConfig,
  uLogin,
  uLomosUtil, uCompanyCode, uGradeCode, uGradeProgram, uAdmin, uAdminGrade,
  uAccessStateCode1, uAlarmStateCode, uAlarmManageCode,
  uAlarmDeviceTypeCode, uLocateCode, uEmploy, 
  uProgramConfig, uHoliday, uImageTest,  
  uPromiseGrade, uPromiseGradeAdmin, uBatchEmployee, 
  uCommonSql,uMDBSql,uMssql,uPostGreSql, uRelayEmploy,uDupCardEmploy,
  uMonitoring, uClientConfig, uKTCardCreate, uEmType,
  uDeviceCode, uDoorAdmin, uAlaramDeviceAdmin,
  DoorSchReg, uDoorGubunCode, uEmployeeBranch,
  uDoorTypeMonitoring,uKTTypeMonitoring, uKHUEmployee, uKHUEmpInitialize,
  uLOMOSEmployee, uTestCardCreate, uFireBird, UCommonModule, uFTPDownLoad,
  uMDICardAdmin, uLOMOSEmployeeBackup,uAlarmTypeMonitoring,
  uAccessTypeMonitoring,uNewAlarmReport,uLocationMap,
  uBuildingAccessTypeMonitoring, uReAtInsert_New,
  uAlarmMapMonitoring,uAccessMapMonitoring, ArmGubunCode,uKTCardReg,
  uAlarmGroup,uJavara, uJavaraschedule,uTreeEmployee, uEmCodeChange,
  uTimeCode,uMDIDeviceGrade,uMDIDoorGrade,uMDIAlarmGrade,
  uPWChange, udmAdoQuery,uSHFDBRelay;

{$R *.dfm}

procedure TfmMain.FormShow(Sender: TObject);
var
  LogoFile : string;
begin

  if G_bApplicationTerminate then Exit;

  FailCount := 0;
  IsFormShow := False;
  bSending := False;
  IsMaster := False;
  L_bSound := False;
  L_bPersonRelayCheck := False; //인적사항 연동 체크중유무

  LogoFile := ExeFolder + '\..\image\KTMOSLogo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);

  StatusBar1.Panels[1].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - StatusBar1.Panels[2].Width - StatusBar1.Panels[3].Width - StatusBar1.Panels[4].Width - StatusBar1.Panels[5].Width;

  Monitoring := False;
  GroupMonitoring := False;
  CenterPanel;



  TDataBaseConfig.GetObject.DataBaseConnect;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('데이터베이스 접속 실패입니다. 데이터베이스 환경설정을 확인하여 주세요.');
    G_bApplicationTerminate := True;
    Application.Terminate;
    Exit;
  end;
  
(*  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      Application.Terminate;
      G_bApplicationTerminate := True;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;
*)

  InitConfigSet;
  ClientConfigRead;


  AlarmEventViewStatusCodeLoad;     //알람 발생 코드 로딩

  AlarmEventSoundStatusCodeLoad;
  CommonModule.LoadAlarmModeNotCard(AlarmModeNotCardList);
  CommonModule.LoadZoneDetectList(ZoneDetectList);

  BuildingSectorDeviceLoad;         //빌딩별 방범 구역 로딩
  LoadNode;                         //노드로딩
  LoadDevice;                       //노드별 기기별 장치 로딩
  LoadDoor;                         //출입문 사용 유무 체크
  LoadArmArea;                      //방범구역 상태 로딩

  dmJavara.JavaraLoad; //자바라 타입 로드

  if G_nDaemonServerVersion < 11 then
  begin
    showmessage('통신 데몬을 업데이트 하셔야 합니다.');
    Exit;
  end;
  if G_nDaemonServerVersion > 11 then
  begin
    if (Application.MessageBox(PChar('모니터링 프로그램을 업데이트 하셔야 합니다. 지금 업데이트 하시겠습니까?'),'정보',MB_OKCANCEL) <> IDCANCEL)  then
    begin
      mn_MonitoringUpgradeClick(mn_MonitoringUpgrade);
    end;
  end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  mn_AdminChangeReport.Visible := False;
  Application.OnMessage := MessageEvent;
  NETTYPE :='TCPIP';
  self.ModuleID := 'Main';
  G_bApplicationTerminate := False;
  bCardDownLoad := False;
  ExeFolder  := ExtractFileDir(Application.ExeName);

  MemoryCreate;
  MemoryClear;


  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  fmMain.Width :=   ini_fun.ReadInteger('Form','Width',1024);
  fmMain.Height :=   ini_fun.ReadInteger('Form','Height',734);
  fmMain.Left :=   ini_fun.ReadInteger('Form','Left',0);
  fmMain.Top :=    ini_fun.ReadInteger('Form','Top',0);
  L_nKeyCheck := ini_fun.ReadInteger('Key','Check',0);
  if ini_fun.ReadInteger('Form','Maximized',1) = 0 then fmMain.WindowState := wsNormal
  else fmMain.WindowState := wsMaximized;
  if UpperCase(ini_fun.ReadString('상황표시기','사용','FALSE') )= 'TRUE' then
    UseStateShow := True
  else UseStateShow := False;
  if UpperCase(ini_fun.ReadString('KT','카드발급','FALSE') )= 'TRUE' then UseKTCardReg := True
  else UseKTCardReg := False;

  BuildingStep := ini_fun.ReadString('Config','Building','0');

  if UpperCase(ini_fun.ReadString('Config','FTPZERONSERVER','TRUE')) = 'TRUE' then UseFTPZeronServer := True
  else UseFTPZeronServer := False;
  L_nWebContentLength := ini_fun.ReadInteger('Config','WebContentLength',650);

  ini_fun.Free;

  if UseStateShow then
  begin
    fmMain.Caption := '모니터링S/W';
    MN_BasicCode.Visible := False;
    mn_System.Visible := False;
    N4.Visible := False;
  end;

  fmMain.Caption := fmMain.Caption + '[' + strBuildInfo + ']';

  G_bAlarmRefreshStart := False;
  L_bDaemonLiveReceive := False;

  L_nRecvPacketCount := 0;
  L_nDaemonReciveFailCount := 0;
  G_nAlarmRefreshDate := 2;
  L_nArmAreaStateCount := 0;
  Panel1.Left := -1000;

  //========================================================== 자동 로그인 추가(2024.04)
  //if G_bAutoLoginUse = True then Action_LoginExecute(Self);
end;

procedure TfmMain.mn_CloseClick(Sender: TObject);
begin
  Close;
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
  {  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        //(screen.forms[i] as TForm).show;
        {Screen.Forms[i].CloseQuery;
        Screen.Forms[i].Destroy;
        break;}
{        if Screen.ActiveForm = Screen.Forms[i] then
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
  end;    }
end;

procedure TfmMain.FormActivate(Sender: TObject);
var
  stKey1 : string;
  stKey2 : string;
  stSaupId : string;
  bResult : Boolean;
  stDate : string;
  stContent : string;
  ini_fun : TiniFile;
  nRandomNum : integer;
  bAuthConnect : Boolean;
  bOffLineAuth : Boolean;
  bRegistryKeyCheck : Boolean;
begin
  if G_bApplicationTerminate then Exit;
  if IsFormShow then Exit;
  IsFormShow := True; // 한번만 Activate 실행 되도록 막아줌

  Master_ID := '';
  Logined := False;
  Privileges := '';

  bAuthConnect := AuthSiteConnect;

  bRegistryKeyCheck := RegistryKeyCheck(L_stCustomerID);
  if Not bRegistryKeyCheck then
  begin
    bRegistryKeyCheck := GetKeyIniCheck();  //Key.ini 에서 체크 할건지 여부
  end;
  if Not bRegistryKeyCheck then
  begin

    if G_nSpecialProgram <> 6 then  //김천 이노닉스 에서는 체크하지 말자.
    begin

      bOffLineAuth := GetOffLineAuthState('2');
        //여기서 인증 키값을 확인하자.
      stKey1 := GetAuthKey('2');
      if stKey1 = '' then
      begin
        showMessage('프로그램 설치후 프로그램 인증을 받으셔야 사용 가능 합니다.');
        ExecFileAndWait(ExeFolder + '\KeyZen.exe 2',true,true);
        stKey1 := GetAuthKey('2');
      end;
      if stKey1 = '' then
      begin
        Application.Terminate;
        G_bApplicationTerminate := True;
        Exit;
      end;

      stSaupId := GetSaupId('');
      bResult  := False;

      if bAuthConnect or Not bOffLineAuth then   //인터넷 연결 되었거나 온라인 인증 받은 경우
      begin
        if stSaupId <> '' then
        begin
          bResult := CompareKey(stSaupId,stKey1);
          if Not bResult then bResult := CompareKey2(stSaupId,stKey1);
          if Not bResult then bResult := CompareKey3(stSaupId,stKey1);
          if Not bResult then
          begin
            stKey2 := GetAuthKey1('2');
            if stKey2 <> '' then
            begin
              bResult := CompareKey(stSaupId,stKey2);
              if Not bResult then bResult := CompareKey2(stSaupId,stKey2);
              if Not bResult then bResult := CompareKey3(stSaupId,stKey2);
            end;
          end;
        end;
      end;


      if Not bResult then
      begin
        bOffLineAuth := GetOffLineAuthState('2');
        if Not bAuthConnect and bOffLineAuth then   //OffLine 모드에서 인증 받은 경우
        begin
          bResult := CompareOffLineKey(stSaupId,stKey1,'2');
        end;
        if Not bResult then
        begin
          if bAuthConnect and bOffLineAuth then
          begin
            showmessage('인증키값을 온라인으로 다시 한번 인증받으세요.');
            ExecFileAndWait(ExeFolder + '\KeyZen.exe 2',true,true);
          end else
          begin
            showmessage('인증키값이 틀립니다.');
            if FileExists(ExtractFileDir(Application.ExeName) + '\' + 'Key.ini') then
            begin
              //DeleteFile(ExtractFileDir(Application.ExeName) + '\' + 'Key.ini');
            end;
            Application.Terminate;
            G_bApplicationTerminate := True;
            Close;
            Exit;
          end;
        end;
      end;

      L_stCustomerID := stSaupId;

      if stSaupId = 'Z-00000000' then
      begin
        stDate := GetInstallDate('2');
        stDate := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
        if Not IsDate(stDate) then
        begin
          showmessage('인증키의 유효기간이 만료되었습니다.');
          Application.Terminate;
          G_bApplicationTerminate := True;
          Close;
          Exit;
        end;
        if stDate < formatDateTime('yyyy-mm-dd',now) then
        begin
          showmessage('인증키의 유효기간이 만료되었습니다.');
          Application.Terminate;
          G_bApplicationTerminate := True;
          Close;
          Exit;
        end;
      end;
    end;
    if Not bRegistryKeyCheck then
    begin
      WriteRegistryKey(L_stCustomerID,stDate);
    end;

  end;

  if G_nSpecialProgram = 1 then
  begin
    CARDLENGTHTYPE := 2;
  end else if G_nSpecialProgram = 2 then   //RUC
  begin
    //CARDLENGTHTYPE := 0;
    //IsNumericCardNo := True;
  end else if G_nSpecialProgram = 3 then
  begin
    CARDLENGTHTYPE := 0;
    IsNumericCardNo := True;
  end;

  RelayConfigSet;
  MenuViewSetting;

  if G_nSpecialProgram = 1 then
  begin
    mn_KTCard.Visible := UseKTCardReg;
    mn_KTIssusNReg.Visible := UseKTCardReg;
    mn_KTLine.Visible := UseKTCardReg;
    mn_JavaraSchedule.Visible := True;
  end else
  begin
    mn_KTCard.Visible := False;
    mn_KTIssusNReg.Visible := False;
    mn_KTLine.Visible := False;
    mn_JavaraSchedule.Visible := False;
  end;

  mn_KHUEmployee.Visible := False;
  mn_KHUEmpInitial.Visible := False;
  mn_lomosLine.Visible := False;
  mn_LOMOSEmployee.Visible := False;
  mn_LOMOSBackup.Visible := False;
  mn_MJUEmployee.Visible := False;
  mn_Fireline.Visible := L_bFireRecoverUse;
  mn_FireRecover.Visible := L_bFireRecoverUse;
  mn_TimeCode.Visible := G_bTimeCodeUse;


  if PersonRelayType = 3 then
  begin
    mn_KHUEmployee.Visible := True;
    mn_KHUEmpInitial.Visible := True;
  end;
  if PersonRelayType = 4 then
  begin
    mn_lomosLine.Visible := True;
    mn_LOMOSEmployee.Visible := True;
    mn_LOMOSBackup.Visible := True;
  end;
  if PersonRelayType = 5 then
  begin
    //mn_MJUEmployee.Visible := True;
  end;

  mn_RelaySamyukEmploy.Visible := False;
  if Not UseStateShow then mn_BatchEmployee.Visible := True;
  GetRelayConfig;

  if PersonRelayType = 0 then
  begin
    PeronRelayTimer1.Enabled := False;
  end else if PersonRelayType = 1 then //삼육대학교 연동
  begin
    mn_BatchEmployee.Visible := False;
    if dmAdoRelay.AdoRelayConnected(inttostr(G_nRelayDataBaseType), G_stRelayServerIP, G_stRelayServerPort,
                      G_stRelayUserID, G_stRelayUserPW, G_stRelayDataBaseName) then
    begin
      PeronRelayTimer1.Interval := 1000 * 60 * 60 * 24; //1일마다 체크함
      PeronRelayTimer1.Enabled := True;
    end;
  end else if PersonRelayType = 3 then //경희대학교 연동
  begin
    if dmAdoRelay.AdoRelayConnected(inttostr(G_nRelayDataBaseType), G_stRelayServerIP, G_stRelayServerPort,
                      G_stRelayUserID, G_stRelayUserPW, G_stRelayDataBaseName) then
    begin
      if dmAdoRelay.AdoRelayConnected2(inttostr(G_nRelayDataBaseType2), G_stRelayServerIP2, G_stRelayServerPort2,
                        G_stRelayUserID2, G_stRelayUserPW2, G_stRelayDataBaseName2) then
      begin
        PeronRelayTimer1.Interval := 1000 * 60 * 60 * 24; //1일마다 체크함
        PeronRelayTimer1.Enabled := True;
      end;
    end;
  end else if PersonRelayType = 5 then //명지대학교 연동
  begin
    if IsMaster then
    begin
      if dmAdoRelay.AdoRelayConnected(inttostr(G_nRelayDataBaseType), G_stRelayServerIP, G_stRelayServerPort,
                        G_stRelayUserID, G_stRelayUserPW, G_stRelayDataBaseName) then
      begin
        PeronRelayTimer1.Interval := 1000 * 60 * 60 * 24; //1일마다 체크함
        PeronRelayTimer1.Enabled := True;
      end;
    end;
  end;
  if PatrolUse then
  begin
    mn_AlarmControl.Visible := True;
    mn_AlarmCode.Visible := True;
  end else
  begin
    mn_AlarmControl.Visible := False;
    mn_AlarmCode.Visible := False;
  end;
  if CardAutoDownLoadUse then
  begin
    //N6.Visible := True;
    mn_GradeDownload.Visible := False;
  end else
  begin
    //N6.Visible := True;
    mn_GradeDownload.Visible := True;
  end;

  //randomize;
  //nRandomNum := random(10);
  //if nRandomNum < 1 then nRandomNum := 5;
  //ServerConnectTimer.Interval := nRandomNum * 1000;

  ServerConnectTimer.Enabled := True;
  if Trim(DaemonServerIP) = '' then DaemonServerIP := '127.0.0.1';
  if Trim(DaemonServerPort) = '' then DaemonServerPort := '1024';
  if Trim(ControlPort) = '' then ControlPort := '10001';
  if Trim(StatePort) = '' then StatePort := '10011';
  if Trim(EventPort) = '' then EventPort := '10021';
  if G_nMultiDaemon = 0 then
  begin
{$IFDEF TApdWinsockport}
    WinsockPort1.WsAddress := DaemonServerIP;
    WinsockPort1.WsPort := DaemonServerPort;
    WinsockPort1.Open := True;
{$ELSE}
    //WinsockPort.Address := DaemonServerIP;
    WinsockPort.Host := DaemonServerIP;
    WinsockPort.Port := strtoint(DaemonServerPort);
    Try
      WinsockPort.Active := True;
    Except
    End;
{$ENDIF}
    DaemonReceiveTimer.Enabled := True;
    //ReceiveThreadStart;
    if G_nMultiSocket = 1 then
    begin
      ControlSocketPort.WsAddress := DaemonServerIP;
      ControlSocketPort.WsPort := ControlPort;
      ControlSocketPort.Open := True;
      ControlDataSendStart;
    end;
  end else
  begin
    LoadMultiServer;
    LoadMultiDevice;
  end;


  FormNameSet;
  MenuNameSet;
  MonitorHeaderNameCreate;

  //========================================================== 자동 로그인 추가(2024.04)
  if G_bAutoLoginUse = True then Action_LoginExecute(nil);
  //========================================================== 자동 로그인 추가(2024.04)
  
  AlarmSound.Enabled := True;
  stContent := CreateZmosConfig;
  if stContent <> '' then
  begin
    if FileExists('c:\'+ L_stCustomerID + '.INI') then
    begin
      //여기에서 FTP 전송하자.
      // if UseFTPZeronServer then FTPZeronServerSend;
      HTTPZeronServerSend(stContent);
    end;
  end;

  if G_nMonitoringAttendReport = 1 then mn_AtReport.Visible := True
  else mn_AtReport.Visible := False;
end;

procedure TfmMain.Action_LoginExecute(Sender: TObject);
begin
   StatusBar1.Panels[1].Text := '로그인 중입니다.' ;

   TLogin.GetObject.ShowLoginDlg;

   Master_ID := TLogin.GetObject.UserID;
   Master_Name := TLogin.GetObject.UserName;
   AdminGrade := Trim(TLogin.GetObject.Grade);
   stPrivileges :=TLogin.GetObject.ProgIDs; //권한설정
   Privileges:=stPrivileges; //권한설정
   Logined := TLogin.GetObject.Logined;  //Master_ID가 먼저 설정 되어야 함 --로그 기록 남기기 위함
   //CompanyCode := Trim(TLogin.getobject.CompanyCode);
   //DepartCode := Trim(TLogin.getobject.DepartCode);;

end;

procedure TfmMain.SetLogined(const Value: Boolean);
var
  stUpdateTime : string;
  bPWChange : Boolean;
  dtUpdateTime : TDateTime;
begin
  mn_Login.Enabled := not Value;
  Mn_LogOff.Enabled := value;
  mn_PWChange.Enabled := Value;
  if FLogined = Value then Exit;
  FLogined := Value;

  if FLogined then
  begin
   StatusBar1.Panels[0].Text := Master_Name;
   StatusBar1.Panels[1].Text := '로그인 완료.';
   stUpdateTime := TLogin.GetObject.UpdateTime;
   AutoLogOutTimer.Enabled := G_bAutoLogOut;
   if G_bPWLengthUse then
   begin
      bPWChange := False;
      if stUpdateTime = '' then bPWChange := True
      else
      begin
        stUpdateTime := FillZeroStrNum(stUpdateTime,14,False);
        dtUpdateTime := strToDate(copy(stUpdateTime,1,4) + '-' + copy(stUpdateTime,5,2) + '-' + copy(stUpdateTime,7,2)) + G_nPWUpdateTime;

        if dtUpdateTime < now then bPWChange := True;
      end;
      if bPWChange then
      begin
        ShowPWChange;
      end;
      L_dtActiveTime := Now;
   end;
   if G_nLoginMoitorStart = 0 then  //로그인시 모니터링 시작 하도록 셋팅되어 있으면...
   begin
    if btnMonitor.Enabled then MonitorStart;
   end;
   if PersonRelayType = 1 then  //삼육대 로그인 하면 삼육대 서버 체크해볼것
   begin
    PeronRelayTimer1.Enabled := False;
    PeronRelayTimer1.Interval := 1000;
    PeronRelayTimer1.Enabled := True;
   end else if PersonRelayType = 3 then  //경희대 로그인 하면 경희대 서버 체크해볼것
   begin
    PeronRelayTimer1.Enabled := False;
    PeronRelayTimer1.Interval := 1000;
    PeronRelayTimer1.Enabled := True;
   end else if PersonRelayType = 5 then  //명지대 로그인 하면 경희대 서버 체크해볼것
   begin
    if IsMaster then
    begin
      PeronRelayTimer1.Enabled := False;
      PeronRelayTimer1.Interval := 1000;
      PeronRelayTimer1.Enabled := True;
    end;
   end;
   DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000','로그인 성공');

  end else
  begin
   DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000','로그아웃');
   AutoLogOutTimer.Enabled := False;
   StatusBar1.Panels[0].Text := '';
   StatusBar1.Panels[1].Text := '로그아웃.';
   ChildFormClose;
  end;

end;

procedure TfmMain.SetPrivileges(const Value: String);
begin
  //showmessage(Value);
  FPrivileges := Value;
  TravelMenuItem(MN_BasicCode,Value); //코드관리
  TravelMenuItem(mn_Manager,Value); //운영관리
  TravelMenuItem(mn_Monitoring,Value); //모니터링
  TravelMenuItem(mn_System,Value); //시스템운영자관리
  TravelMenuItem(mn_Report,Value); //시스템보고서
  TravelMenuItem(mn_DeviceConfig,Value); //기기관리

  //ToolBar 관리
  TravelToolBar(ToolBar1,Value);

//  if IsMaster then mn_readerState.Visible := True
//  else mn_readerState.Visible := False;

end;


Procedure TfmMain.TravelMenuItem(MenuItem:TMenuItem;ProgIDs:String);
var
  Loop : Integer;
begin

  For Loop:=0 to Menuitem.Count - 1 do
      TravelmenuItem(MenuITem.Items[Loop],ProgIDs);

  If Pos(MenuItem.Hint,ProgIDs) > 0 then MenuItem.Enabled := True
  Else If MenuItem.Tag = 0 then MenuItem.Enabled:=False;
end;

Procedure TfmMain.TravelMenuView(MenuItem:TMenuItem;ProgIDs:String);
var
  Loop : Integer;
begin
  For Loop:=0 to Menuitem.Count - 1 do
      TravelMenuView(MenuITem.Items[Loop],ProgIDs);

  If Pos(MenuItem.Hint,ProgIDs) > 0 then MenuItem.Visible := True
  Else If MenuItem.Tag = 0 then MenuItem.Visible:=False;
end;
Procedure TfmMain.TravelToolBar(ToolBar:TToolBar;ProgIDs:String);
var
  Loop : Integer;
begin
  For Loop:=0 to ToolBar.ButtonCount - 1 do
      TravelToolButton(ToolBar.Buttons[Loop],ProgIDs);
end;
Procedure TfmMain.TravelToolButton(ToolButton:TToolButton;ProgIDs:String);
begin
  If Pos(ToolButton.Hint,ProgIDs) > 0 then ToolButton.Enabled := True
  Else If ToolButton.Tag = 0 then ToolButton.Enabled:=False;
end;


procedure TfmMain.Action_LogOutExecute(Sender: TObject);
begin
  Logined := False; //Master_ID가 나중에 설정 되어야 함 --로그 기록 남기기 위함
  Master_ID := '';
  Privileges := '';

end;

procedure TfmMain.Action_MonitoringExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_Monitoring.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  if G_nMultiDaemon = 0 then
  begin
    MDIChildGradeShow('TfmMonitoring',bInsertGrade,bUpdateGrade,bDeleteGrade);
    self.FindClassForm('TfmMonitoring').FindCommand('GRADEREFRESH').Execute;
  end else if G_nMultiDaemon = 1 then
  begin
//    MDIChildGradeShow('TfmMultiMonitoring',bInsertGrade,bUpdateGrade,bDeleteGrade);
//    self.FindClassForm('TfmMultiMonitoring').FindCommand('GRADEREFRESH').Execute;
  end;
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[1].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - StatusBar1.Panels[2].Width - StatusBar1.Panels[3].Width- StatusBar1.Panels[4].Width- StatusBar1.Panels[5].Width;
  CenterPanel;
end;

procedure TfmMain.SetMonitoring(const Value: Boolean);
begin
  FMonitoring := Value;
  //Privileges:=stPrivileges; //권한설정

  btn_CurrentState.Enabled := value;
  mn_CurrentState.Enabled := value;
  mn_DoorControl.Enabled := value;
  mn_AlarmControl.Enabled := value;
  Action_TotClose.Enabled := value;
  mn_TotClose.Enabled := value;
  Action_TotOpen.Enabled := value;
  mn_TotOpen.Enabled := value;
  Action_TotAlarm.Enabled := value;
  mn_TotAlarm.Enabled := value;
  Action_TotCancel.Enabled := value;
  mn_TotCancel.Enabled := value;


  if Value then
  begin
//    Action_StateSearchExecute(Self);
    StateCheckTimer.Enabled := True;
    LiveTimer.Enabled := True;
    TravelMenuItem(mn_Monitoring,FPrivileges); //모니터링

  end else LiveTimer.Enabled := False;

  if G_nMonitorSockType = 1 then
  begin
    DBSocketReceiveTimer.Enabled := Value;
    L_nOldDBSocketSeq := 0;
  end;

end;

procedure TfmMain.Action_StateSearchExecute(Sender: TObject);
var
  stSendData : string;
  bButtonState : Boolean;
  nDeviceIndex : integer;
  i : integer;
begin
  Try
    bButtonState := btn_CurrentState.Enabled;
    //btn_CurrentState.Enabled := False;
    //여기에서 기기의 모든 상태 정보를 Clear 한다...

    (*
    for nDeviceIndex := 0 to DeviceStateList.Count - 1 do
    begin
      if TDeviceState(DeviceStateList.Objects[nDeviceIndex]) <> nil then
        TDeviceState(DeviceStateList.Objects[nDeviceIndex]).AlaramEventClear;
      Application.ProcessMessages;
    end;
    *)
(*  상태 확인 시 알람 데이터를 다시 로딩 해야 하는데 그렇게 하지 않으므로 처리 하면 안됨
    for i := 0 to ArmAreaStateList.Count - 1 do
    begin
      TArmAreaState(ArmAreaStateList.Objects[i]).AlarmEventState := aeNormal;
      Application.ProcessMessages;
    end;
*)
    if G_nDaemonServerVersion < 3 then
    begin
      stSendData := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
      SendDaemonDataList.Add(stSendData);
      //SendStateDataList.Add(stSendData);
    end else if G_nDaemonServerVersion < 7 then
    begin
      stSendData := 'DEVICEALLSTATE_II'+ DATADELIMITER;
      SendDaemonDataList.Add(stSendData);
      //SendStateDataList.Add(stSendData);
      stSendData := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
      SendDaemonDataList.Add(stSendData);
      //SendStateDataList.Add(stSendData);
    end else //if G_nDaemonServerVersion < 9 then
    begin
      stSendData := 'DEVICEALLSTATE_III'+ DATADELIMITER;
      SendDaemonDataList.Add(stSendData);
      //SendStateDataList.Add(stSendData);
    end;
    SendDaemonTimer.Enabled := True;
    if G_bFormEnabled[con_Monitoring] then
    begin
      if G_nMultiDaemon = 0 then
      begin
        self.FindClassForm('TfmMonitoring').FindCommand('REFRESH').Execute;
      end else if G_nMultiDaemon = 1 then
      begin
//        self.FindClassForm('TfmMultiMonitoring').FindCommand('REFRESH').Execute;
      end;
    end;
    (*if GroupMonitoring then
    begin
      self.FindClassForm('TfmGroupMonitoring').FindCommand('REFRESH').Execute;
    end; *)
    if G_bFormEnabled[con_DoorTypeMonitor] then
    begin
      self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('REFRESH').Execute;
    end;
    if G_bFormEnabled[con_KTTypeMonitoring] then
    begin
      self.FindClassForm('TfmKTTypeMonitoring').FindCommand('REFRESH').Execute;
    end;

    if G_bFormEnabled[con_AlarmTypeMonitoring] then
    begin
      self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('REFRESH').Execute;
    end;
    if G_bFormEnabled[con_AccessTypeMonitoring] then
    begin
      self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('REFRESH').Execute;
    end;
    if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
    begin
      self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('REFRESH').Execute;
    end;
    if G_bFormEnabled[con_AlarmMapMonitoring] then
    begin
      self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('REFRESH').Execute;
    end;
    if G_bFormEnabled[con_AccessMapMonitoring] then
    begin
      self.FindClassForm('TfmAccessMapMonitoring').FindCommand('REFRESH').Execute;
    end;
    //btn_CurrentState.Enabled := True;
  Except
    Exit;
  End;
  DoorStateCheckTimer1.Enabled := True;
  ArmAreaStateTimer.Enabled := True;
end;

procedure TfmMain.Action_TotCloseExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar('전체출입문을 운영모드로 변경하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    showmessage('화재발생시에는 화재 복구 완료 후에 운영모드 가능합니다.');
    Exit;
  end;
  if G_bFormEnabled[con_Monitoring] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('OPERATEMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체운영');
        Exit;
      end;
    end;
    if G_nMultiDaemon = 0 then
    begin
      self.FindClassForm('TfmMonitoring').FindCommand('MODECHANGE').Params.Values['Data'] := 'OPERATEMODE';
      self.FindClassForm('TfmMonitoring').FindCommand('MODECHANGE').Execute;
    end else if G_nMultiDaemon = 1 then
    begin
//      self.FindClassForm('TfmMultiMonitoring').FindCommand('MODECHANGE').Params.Values['Data'] := 'OPERATEMODE';
//      self.FindClassForm('TfmMultiMonitoring').FindCommand('MODECHANGE').Execute;
    end;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체운영')
  end else if G_bFormEnabled[con_DoorTypeMonitor] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('OPERATEMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체운영');
        Exit;
      end;
    end;
    self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('MODECHANGE').Params.Values['Data'] := 'OPERATEMODE';
    self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('MODECHANGE').Execute;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체운영')
  end else if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('OPERATEMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체운영');
        Exit;
      end;
    end;
    self.FindClassForm('TfmKTTypeMonitoring').FindCommand('MODECHANGE').Params.Values['Data'] := 'OPERATEMODE';
    self.FindClassForm('TfmKTTypeMonitoring').FindCommand('MODECHANGE').Execute;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체운영')
  end else if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    showmessage('방범전용 화면에서는 출입제어를 할 수 없습니다.');
    Exit;
  end else if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    if Not IsMaster then Exit;
    SendDaemonDataList.Add('OPERATEMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체운영')
  end else if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    if Not IsMaster then Exit;
    SendDaemonDataList.Add('OPERATEMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체운영')
  end else 
  begin
    if Not IsMaster then Exit;
    SendDaemonDataList.Add('OPERATEMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체운영')
  end;

end;

procedure TfmMain.Action_TotOpenExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar('전체출입문을 개방모드로 변경하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;
  if G_bFormEnabled[con_Monitoring] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('OPENMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체개방');
        Exit;
      end;
    end;
    if G_nMultiDaemon = 0 then
    begin
      self.FindClassForm('TfmMonitoring').FindCommand('MODECHANGE').Params.Values['Data'] := 'OPENMODE';
      self.FindClassForm('TfmMonitoring').FindCommand('MODECHANGE').Execute;
    end else if G_nMultiDaemon = 1 then
    begin
//      self.FindClassForm('TfmMultiMonitoring').FindCommand('MODECHANGE').Params.Values['Data'] := 'OPENMODE';
//      self.FindClassForm('TfmMultiMonitoring').FindCommand('MODECHANGE').Execute;
    end;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체개방');
  end else if G_bFormEnabled[con_DoorTypeMonitor] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('OPENMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체개방');
        Exit;
      end;
    end;
    self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('MODECHANGE').Params.Values['Data'] := 'OPENMODE';
    self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('MODECHANGE').Execute;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체개방');
  end else if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('OPENMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체개방');
        Exit;
      end;
    end;
    self.FindClassForm('TfmKTTypeMonitoring').FindCommand('MODECHANGE').Params.Values['Data'] := 'OPENMODE';
    self.FindClassForm('TfmKTTypeMonitoring').FindCommand('MODECHANGE').Execute;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체개방');
  end else if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    showmessage('방범전용 화면에서는 출입제어를 할 수 없습니다.');
    Exit;
  end else if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    if Not IsMaster then Exit;
    SendDaemonDataList.Add('OPENMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체개방');
  end else if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    if Not IsMaster then Exit;
    SendDaemonDataList.Add('OPENMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체개방');
  end else 
  begin
    if Not IsMaster then Exit;
    SendDaemonDataList.Add('OPENMODE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','전체개방');
  end;

end;

procedure TfmMain.Action_TotAlarmExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar('전체방범구역을 경계모드로 변경하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;
  if G_bFormEnabled[con_Monitoring] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('ALARMSETTING'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체경계');
        Exit;
      end;
    end;
    if G_nMultiDaemon = 0 then
    begin
      self.FindClassForm('TfmMonitoring').FindCommand('AlarmMode').Params.Values['Data'] := 'ALARMSETTING';
      self.FindClassForm('TfmMonitoring').FindCommand('AlarmMode').Execute;
    end else if G_nMultiDaemon = 1 then
    begin
//      self.FindClassForm('TfmMultiMonitoring').FindCommand('AlarmMode').Params.Values['Data'] := 'ALARMSETTING';
//      self.FindClassForm('TfmMultiMonitoring').FindCommand('AlarmMode').Execute;
    end;
    DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체경계');
  end else if G_bFormEnabled[con_DoorTypeMonitor] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('ALARMSETTING'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체경계');
        Exit;
      end;
    end;
    self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('AlarmMode').Params.Values['Data'] := 'ALARMSETTING';
    self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('AlarmMode').Execute;
    DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체경계');
  end else if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('ALARMSETTING'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체경계');
        Exit;
      end;
    end;
    self.FindClassForm('TfmKTTypeMonitoring').FindCommand('AlarmMode').Params.Values['Data'] := 'ALARMSETTING';
    self.FindClassForm('TfmKTTypeMonitoring').FindCommand('AlarmMode').Execute;
    DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체경계');
  end else if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    if Not IsMaster then Exit;
    SendDaemonDataList.Add('ALARMSETTING'+ DATADELIMITER + '0000000000' + DATADELIMITER);
    DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체경계');
  end else if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    showmessage('출입전용 화면에서는 방범 제어를 할 수 없습니다.');
    Exit;
  end else if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    showmessage('출입전용 화면에서는 방범 제어를 할 수 없습니다.');
    Exit;
  end;
end;

procedure TfmMain.Action_TotCancelExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar('전체방범구역을 해제모드로 변경하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;
  if G_bFormEnabled[con_Monitoring] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('ALARMDISABLE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체해제');
        Exit;
      end;
    end;
    if G_nMultiDaemon = 0 then
    begin
      self.FindClassForm('TfmMonitoring').FindCommand('AlarmMode').Params.Values['Data'] := 'ALARMDISABLE';
      self.FindClassForm('TfmMonitoring').FindCommand('AlarmMode').Execute;
    end else if G_nMultiDaemon = 1 then
    begin
//      self.FindClassForm('TfmMultiMonitoring').FindCommand('AlarmMode').Params.Values['Data'] := 'ALARMDISABLE';
//      self.FindClassForm('TfmMultiMonitoring').FindCommand('AlarmMode').Execute;
    end;
    DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체해제');
  end else if G_bFormEnabled[con_DoorTypeMonitor] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('ALARMDISABLE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체해제');
        Exit;
      end;
    end;
    self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('AlarmMode').Params.Values['Data'] := 'ALARMDISABLE';
    self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('AlarmMode').Execute;
    DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체해제');
  end else if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    if G_nDaemonServerVersion > 2 then
    begin
      if IsMaster then
      begin
        SendDaemonDataList.Add('ALARMDISABLE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
        DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체해제');
        Exit;
      end;
    end;
    self.FindClassForm('TfmKTTypeMonitoring').FindCommand('AlarmMode').Params.Values['Data'] := 'ALARMDISABLE';
    self.FindClassForm('TfmKTTypeMonitoring').FindCommand('AlarmMode').Execute;
    DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체해제');
  end else if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    if Not IsMaster then Exit;
    SendDaemonDataList.Add('ALARMDISABLE'+ DATADELIMITER + '0000000000' + DATADELIMITER);
    DataModule1.TB_SYSTEMLOGInsert('000','00',ALARMTYPE,'0','0000000000','전체해제');
  end else if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    showmessage('출입전용 화면에서는 방범 제어를 할 수 없습니다.');
    Exit;
  end else if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    showmessage('출입전용 화면에서는 방범 제어를 할 수 없습니다.');
    Exit;
  end;

end;

procedure TfmMain.MN_CompanyCodeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 0 then
    begin
      showmessage('회사코드 관리 권한이 없습니다.');
      Exit;
    end;
  end;
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  Try
    fmCompanyCode.Caption := MN_CompanyCode.Caption;
    fmCompanyCode.WorkCode := 0;
    fmCompanyCode.IsInsertGrade := bInsertGrade;
    fmCompanyCode.IsUpdateGrade := bUpdateGrade;
    fmCompanyCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmCompanyCode.SHowmodal;
  Finally
    fmCompanyCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_DepartCodeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  Try
    fmCompanyCode.Caption := mn_DepartCode.Caption;
    fmCompanyCode.WorkCode := 2;
    fmCompanyCode.IsInsertGrade := bInsertGrade;
    fmCompanyCode.IsUpdateGrade := bUpdateGrade;
    fmCompanyCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmCompanyCode.SHowmodal;
  Finally
    fmCompanyCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_PosicodeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  Try
    fmCompanyCode.Caption := mn_Posicode.Caption;
    fmCompanyCode.WorkCode := 3;
    fmCompanyCode.IsInsertGrade := bInsertGrade;
    fmCompanyCode.IsUpdateGrade := bUpdateGrade;
    fmCompanyCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmCompanyCode.SHowmodal;
  Finally
    fmCompanyCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_ZipCodeClick(Sender: TObject);
begin
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  Try
    fmCompanyCode.WorkCode := 4;
    L_bShowModalVisible := True;
    fmCompanyCode.SHowmodal;
  Finally
    fmCompanyCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_GradeAdminClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmGradeCode:= TfmGradeCode.Create(Self);
  Try
    fmGradeCode.Caption := TMenuItem(Sender).Caption;
    fmGradeCode.IsInsertGrade := bInsertGrade;
    fmGradeCode.IsUpdateGrade := bUpdateGrade;
    fmGradeCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmGradeCode.SHowmodal;
  Finally
    fmGradeCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_GradeProgramAdminClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmGradeProgram:= TfmGradeProgram.Create(Self);
  Try
    fmGradeProgram.Caption := TMenuItem(Sender).Caption;
    fmGradeProgram.IsInsertGrade := bInsertGrade;
    fmGradeProgram.IsUpdateGrade := bUpdateGrade;
    fmGradeProgram.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmGradeProgram.SHowmodal;
  Finally
    fmGradeProgram.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_SystemUserAdminClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmAdmin:= TfmAdmin.Create(Self);
  Try
    fmAdmin.Caption := TMenuItem(Sender).Caption;
    fmAdmin.IsInsertGrade := bInsertGrade;
    fmAdmin.IsUpdateGrade := bUpdateGrade;
    fmAdmin.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmAdmin.SHowmodal;
  Finally
    fmAdmin.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.InitConfigSet;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stFileServerIP : string;
  stFileServerDir :string;
  ini_fun : TiniFile;
begin
  AccessUse := False;
  PatrolUse := False;
  AttendUse := False;
  FoodUse := False;
  SensorUse := False;
  bALARMSHORT := True;
  bALARMDOWN := True;
  CARDLENGTHTYPE := 0; //디폴트로 고정 4Byte 사용
  IsNumericCardNo := True; //카드번호 숫자타입 사용/미사용
  PersonRelayType := 0; //사원연동안함
  DUPCARDTYPE := 0; //1인당 한장의 카드 사용 원칙
  CardAutoDownLoadUse := False; //카드 자동 다운로드
  G_nMultiDaemon := 0; //기본은 단독 데몬 사용
  L_bFireRecoverUse := False;
  G_bFireRelayUse := False;
  G_nFireRelayNumber :=6;        //화재복구시 릴레이 번호
  G_nFireRelayTime :=2;          //화재복구시 릴레이 제어 시간
  G_bCardFixedUse := False; //카드고정길이 사용 안함
  G_stCardFixedFillChar := '*';  //카드고정길이 사용시 채움문자
  G_nCardFixedPosition := 1; //채움문자위치 0:앞,1:뒤
  G_nCardFixedLength := 16;  //카드고정길이 KT에서 처음 사용해서 디폴트 11자리
  G_nDaemonServerVersion := 0; //데몬서버 버젼이 디폴트 0 이다.
  G_nMultiSocket := 0; //단독 소켓 사용
  G_nMonitorSockType := 0; //소켓 사용
  G_nCardReaderType := 0; //0.범용,1.스마트원
  G_bTimeCodeUse := False; //타임코드 사용유무
  G_bPWLengthUse := False; //비밀번호 길이사용
  G_nPWLength := 8;        //비밀번호 길일
  G_bPWCharUse := False;   //특수문자 사용유무
  G_nPWUpdateTime := 30;   //비밀번호 변경 기간
  UseCardPosition := False; //카드 위치정보 사용 유무
  G_bEmployeeCophoneEncrypt := False;
  G_bAutoLogOut := False;
  G_bLoginLimitUse := False;
  G_nAutoLogOutTime := 5;
  G_nLoginLimitTime := 5;


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
  G_bCardFullUse := False;

  UseDeviceServer := True; //기본적으로 기기가 서버인 구조이다.

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND ( CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''ALARM'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''MCUCOMM'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''FIRE'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''CARD'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''EMPLOYEE'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''DAEMON'')';

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

      First;
      While Not Eof do
      begin
        if FindField('CO_CONFIGCODE').AsString = 'ARMAREAUSE' then
        begin
          G_nArmAreaUse := FindField('CO_CONFIGVALUE').asinteger;
        end else if FindField('CO_CONFIGCODE').AsString = 'FIRERECUSE' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then  L_bFireRecoverUse := True
          else L_bFireRecoverUse := False;
        end else if (FindField('CO_CONFIGGROUP').AsString = 'FIRE') and (FindField('CO_CONFIGCODE').AsString = 'RELAYUSE') then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then G_bFireRelayUse := True
          else G_bFireRelayUse := False;
        end else if (FindField('CO_CONFIGGROUP').AsString = 'FIRE') and (FindField('CO_CONFIGCODE').AsString = 'RELAYNO') then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nFireRelayNumber := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if (FindField('CO_CONFIGGROUP').AsString = 'FIRE') and  (FindField('CO_CONFIGCODE').AsString = 'RELAYTIME') then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nFireRelayTime := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'ACCESS' then
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
        end else if FindField('CO_CONFIGCODE').AsString = 'IP' then
        begin
          DaemonServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'PORT' then
        begin
          DaemonServerPort := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'CONTRLPORT' then
        begin
          ControlPort := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'STATEPORT' then
        begin
          StatePort := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'EVENTPORT' then
        begin
          EventPort := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'MULTISOCK' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then
            G_nMultiSocket := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'SHORT' then
        begin
          if FindField('CO_CONFIGVALUE').AsString <> '1' then bALARMSHORT := FALSE;
        end else if FindField('CO_CONFIGCODE').AsString = 'DOWN' then
        begin
          if FindField('CO_CONFIGVALUE').AsString <> '1' then bALARMDOWN := FALSE;
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
        end else if FindField('CO_CONFIGCODE').AsString = 'FILEIP' then
        begin
          stFileServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FILEDIR' then
        begin
          stFileServerDir := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'ALARMVIEW' then
        begin
          ALARMVIEW := UpperCase(FindField('CO_CONFIGVALUE').AsString);
        end
        else if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then CARDLENGTHTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'DUPCARD' then DUPCARDTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'CARDNUM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then IsNumericCardNo := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'PER_RELAY' then
        begin
          PersonRelayType := StrtoInt(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'CARDAUTO' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then CardAutoDownLoadUse := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'CARDFULL' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then G_bCardFullUse := False
          else G_bCardFullUse := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'SPECIALCD' then
        begin
          G_nSpecialProgram := StrtoInt(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'DEVICESVER' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then UseDeviceServer := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'MULTI' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMultiDaemon := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'KHUADDDAY' then
        begin
          G_stRelayKHUAddDate := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'KHUDELDAY' then
        begin
          G_stRelayKHUDelDate := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'CARDADDDAY' then  //카드연동일자
        begin
          G_stRelayKHUCARDDate := FindField('CO_CONFIGVALUE').AsString;
        end else if (FindField('CO_CONFIGGROUP').AsString = 'CARD') then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'CARDFIXED' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then G_bCardFixedUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'FILLCHAR' then
          begin
            if FindField('CO_CONFIGVALUE').AsString <> '' then
              G_stCardFixedFillChar := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FILLPOSI' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
              G_nCardFixedPosition := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'FIXEDLEN' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
              G_nCardFixedLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if ( FindField('CO_CONFIGCODE').AsString = 'READERTYPE') then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
              G_nCardReaderType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
        end else if (FindField('CO_CONFIGGROUP').AsString = 'MOSTYPE') then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'PWLENUSE' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then G_bPWLengthUse := True ;
          end else if FindField('CO_CONFIGCODE').AsString = 'PWLENGTH' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
               G_nPWLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'PWCHAR' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then G_bPWCharUse := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'PWCHANGE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then
               G_nPWUpdateTime := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
        end else if FindField('CO_CONFIGCODE').AsString = 'DAEMON_VER' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then
            G_nDaemonServerVersion := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if (FindField('CO_CONFIGGROUP').AsString = 'DAEMON') and ( FindField('CO_CONFIGCODE').AsString = 'USEARMLEN') then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'TRUE' then AlarmEventLengthUse := False
          else AlarmEventLengthUse := True;
        end else if (FindField('CO_CONFIGGROUP').AsString = 'DAEMON') and ( FindField('CO_CONFIGCODE').AsString = 'ALARMLEN') then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then AlarmEventLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if (FindField('CO_CONFIGGROUP').AsString = 'DAEMON') and ( FindField('CO_CONFIGCODE').AsString = 'CSOCKTYPE') then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitorSockType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if (FindField('CO_CONFIGGROUP').AsString = 'DAEMON') and ( FindField('CO_CONFIGCODE').AsString = 'TIMEUSE') then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then G_bTimeCodeUse := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'CAPOSINUM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then UseCardPosition := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'ENCCOTEL' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then G_bEmployeeCophoneEncrypt := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'AUTOLOGOUT' then
        begin
          if FindField('CO_CONFIGVALUE').AsInteger = 1 then G_bAutoLogOut := True
          else G_bAutoLogOut := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'AUTOLOTIME' then
        begin
          G_nAutoLogOutTime := FindField('CO_CONFIGVALUE').AsInteger;
        end else if FindField('CO_CONFIGCODE').AsString = 'LOGINLIMIT' then
        begin
          if FindField('CO_CONFIGVALUE').AsInteger = 1 then G_bLoginLimitUse := True
          else G_bLoginLimitUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'LOGINCOUNT' then
        begin
          G_nLoginLimitTime := FindField('CO_CONFIGVALUE').AsInteger;
        end else if (FindField('CO_CONFIGGROUP').AsString = 'RELAY') then
        begin
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
          end else if FindField('CO_CONFIGCODE').AsString = 'FACECOP' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then FACECOPRelayType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'FACECOPIP' then
          begin
            FACECOPRelayServerIP := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FALASTTIME' then
          begin
            FACECOPRelayLastTime := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FA_RETIME' then   //연동주기
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
          end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDELETE' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then fdmsDelete := True
            else fdmsDelete := False;
          end;

        end;

        Next;
   //     Application.ProcessMessages;
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

  Try
    ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
    DaemonServerIP := ini_fun.ReadString('Server','IP',DaemonServerIP);
  Finally
    ini_fun.Free;
  End;

  mn_Fireline.Visible := L_bFireRecoverUse;
  mn_FireRecover.Visible := L_bFireRecoverUse;
  mn_TimeCode.Visible := G_bTimeCodeUse;

  with DataModule1.GetObject.ADOExecQuery do
  begin
    //권한관리쪽에서 보여줄 항목을 셋팅하자
    if DBType = 'MSSQL' then
    begin
      stSql := Mssql.UpdateTB_PROGRAMIDSetVisible;
    end else if DBType = 'PG' then
    begin
      stSql := PostGreSql.UpdateTB_PROGRAMIDSetVisible;
    end else if DBType = 'FB' then
    begin
      stSql := FireBird.UpdateTB_PROGRAMIDSetVisible;
    end else if DBType = 'MDB' then
    begin
      stSql := MDBsql.UpdateTB_PROGRAMIDSetVisible;
    end;
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      //무시
    End;

  end;
{  with TempAdoQuery do
  begin
    //권한관리쪽에서 보여줄 항목을 셋팅하자
    stSql := 'update TB_PROGRAMID  Set PR_VISIBLE = TB_CONFIG.CO_CONFIGVALUE ' ;
    stSql := stSql + ' FROM TB_PROGRAMID  ';
    stSql := stSql + ' INNER JOIN TB_CONFIG ';
    stSql := stSql + ' ON (TB_PROGRAMID.CO_CONFIGCODE = TB_CONFIG.CO_CONFIGCODE';
    stSql := stSql + ' AND TB_CONFIG.CO_CONFIGGROUP = ''MOSTYPE'' )';
    stSql := stSql + ' where TB_PROGRAMID.PR_VISIBLE <> ''D'' ';
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      //무시
    End;

  end;   }

end;

procedure TfmMain.MenuViewSetting;
var
  stSql : string;
  ViewMenu : string;
begin
  stSql := ' Select * from TB_PROGRAMID ';
  stSql := stSql + ' Where PR_VISIBLE <> ''N'' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      exit;
    End;
    ViewMenu := '';
    while Not Eof do
    begin
      ViewMenu := ViewMenu + Trim(FieldByName('PR_PROGRAMID').AsString) + ';';
      Next;
    end; //while
    
  end;

  if ViewMenu <> '' then    //여기에서 메뉴를 보여주자.
  begin

    TravelMenuView(MN_BasicCode,ViewMenu); //기초자료관리
    TravelMenuView(mn_Manager,ViewMenu); //운영관리
    TravelMenuView(mn_Monitoring,ViewMenu); //모니터링
    if Not UseStateShow then
      TravelMenuView(mn_System,ViewMenu); //시스템운영자관리
    //TravelMenuView(mn_CardGrade,ViewMenu); //카드권한관리
    //TravelMenuView(mn_ProgramConfig,ViewMenu); //프로그램환경설정
    //TravelMenuView(mn_DataBase,ViewMenu); //데이터베이스관리
    //TravelMenuView(mn_UserAdmin,ViewMenu); //시스템사용자관리
    TravelMenuView(mn_Report,ViewMenu); //시스템보고서
  end;
  if UseStateShow then
  begin
    N8.Visible := False;
    mn_Device.Visible := False;
    N15.Visible := False;
    N9.Visible := False;
    MN_CompanyCode.Visible := False;
    mn_JijumCode.Visible := False;
    mn_Posicode.Visible := False;
    N23.Visible := False;
    N19.Visible := False;
    mn_ZipCode.Visible := False;
    mn_EmpType.Visible := False;
    mn_BatchEmployee.Visible := False;
    mn_EmployeeBranch.Visible := False;
    N1.Visible := False;
    N16.Visible := False;
  end;

  mn_InOutReport.Visible := InOutCountUse;
  mn_InOut.Visible := InOutCountUse;

end;

procedure TfmMain.mn_DepartGradeAdminClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmAdminGrade:= TfmAdminGrade.Create(Self);
  Try
    fmAdminGrade.Caption := TMenuItem(Sender).Caption;
    fmAdminGrade.IsInsertGrade := bInsertGrade;
    fmAdminGrade.IsUpdateGrade := bUpdateGrade;
    fmAdminGrade.IsDeleteGrade := bDeleteGrade;
  //  fmAdminGrade.WorkCode := 3;
    L_bShowModalVisible := True;
    fmAdminGrade.SHowmodal;
  Finally
    fmAdminGrade.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_AccessStateCodeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmAccessStateCode:= TfmAccessStateCode.Create(Self);
  Try
    fmAccessStateCode.IsInsertGrade := bInsertGrade;
    fmAccessStateCode.IsUpdateGrade := bUpdateGrade;
    fmAccessStateCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmAccessStateCode.SHowmodal;
  Finally
    fmAccessStateCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_AlarmStateCodeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmAlarmStateCode:= TfmAlarmStateCode.Create(Self);
  Try
    fmAlarmStateCode.IsInsertGrade := bInsertGrade;
    fmAlarmStateCode.IsUpdateGrade := bUpdateGrade;
    fmAlarmStateCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmAlarmStateCode.SHowmodal;
  Finally
    fmAlarmStateCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_AlarmManageCodeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmAlarmManageCode:= TfmAlarmManageCode.Create(Self);
  Try
    fmAlarmManageCode.Caption := mn_AlarmManageCode.Caption;
    fmAlarmManageCode.IsInsertGrade := bInsertGrade;
    fmAlarmManageCode.IsUpdateGrade := bUpdateGrade;
    fmAlarmManageCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmAlarmManageCode.SHowmodal;
  Finally
    fmAlarmManageCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_AlarmDeviceTypeCodeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmAlarmDeviceTypeCode:= TfmAlarmDeviceTypeCode.Create(Self);
  Try
    fmAlarmDeviceTypeCode.IsInsertGrade := bInsertGrade;
    fmAlarmDeviceTypeCode.IsUpdateGrade := bUpdateGrade;
    fmAlarmDeviceTypeCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmAlarmDeviceTypeCode.SHowmodal;
  Finally
    fmAlarmDeviceTypeCode.Free;
    L_bShowModalVisible := False;
  End;
end;

procedure TfmMain.mn_DeviceAdminClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
  bDeviceUpdate : Boolean;
begin
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then     //출입문별 권한을 가진 사람은 기기관련 권한을 부여 하지 말자.
    begin
      showmessage('컨트롤러 관리 권한이 없습니다.');
      Exit;
    end
  end;

  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmDeviceCode:= TfmDeviceCode.Create(Self);
  Try
    fmDeviceCode.WorkCode := 0;
    fmDeviceCode.IsInsertGrade := bInsertGrade;
    fmDeviceCode.IsUpdateGrade := bUpdateGrade;
    fmDeviceCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmDeviceCode.SHowmodal;
    bDeviceUpdate := fmDeviceCode.L_bDeviceUpdate;
  Finally
    fmDeviceCode.Free;
    L_bShowModalVisible := False;
  End;
//  if bDeviceUpdate then DaemonRestart;

end;

procedure TfmMain.mn_LocateAdminClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmLocateCode:= TfmLocateCode.Create(Self);
  Try
    fmLocateCode.WorkCode := 0;
    fmLocateCode.IsInsertGrade := bInsertGrade;
    fmLocateCode.IsUpdateGrade := bUpdateGrade;
    fmLocateCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmLocateCode.SHowmodal;
  Finally
    fmLocateCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.Action_EmployExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_Employ.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  if G_nEmployeeAdminType = 0 then
  begin
    if DUPCARDTYPE = 1 then   //1인 2장이상 카드 등록시
    begin
      MDIChildGradeShow('TfmDupCardEmploy',bInsertGrade,bUpdateGrade,bDeleteGrade);
  {    fmDupCardEmploy:= TfmDupCardEmploy.Create(Self);
      fmDupCardEmploy.Caption := Action_Employ.Caption;
      fmDupCardEmploy.IsInsertGrade := bInsertGrade;
      fmDupCardEmploy.IsUpdateGrade := bUpdateGrade;
      fmDupCardEmploy.IsDeleteGrade := bDeleteGrade;
      fmDupCardEmploy.SHowmodal;
      fmDupCardEmploy.Free; }
    end else
    begin
      MDIChildGradeShow('TfmEmploy',bInsertGrade,bUpdateGrade,bDeleteGrade);
  {    fmEmploy:= TfmEmploy.Create(Self);
      fmEmploy.Caption := Action_Employ.Caption;
      fmEmploy.IsInsertGrade := bInsertGrade;
      fmEmploy.IsUpdateGrade := bUpdateGrade;
      fmEmploy.IsDeleteGrade := bDeleteGrade;
      fmEmploy.SHowmodal;
      fmEmploy.Free; }
    end;
  end else if G_nEmployeeAdminType = 1 then
  begin
    MDIChildGradeShow('TfmTreeEmployee',bInsertGrade,bUpdateGrade,bDeleteGrade);
  end;
end;


// 데몬에서 들어온 데이터 처리
procedure TfmMain.WinsockPort1TriggerAvail(CP: TObject; Count: Word);
var
  st:String;
  I: Integer;
  aData:String;
  nIndex : integer;
  stTemp : string;
begin
  st:= '';
  DaemonServerConnected := True;
  Try
    for I := 1 to Count do st := st + WinsockPort1.GetChar;
  Except
    Exit;
  End;
  ServerComBuff:= ServerComBuff + st ;

  repeat
    if G_bApplicationTerminate then Exit;
    aData:= Copy(ServerComBuff,1,Pos(LINEEND,ServerComBuff));
    Delete(ServerComBuff,1,Pos(LINEEND,ServerComBuff));
{    if Trim(aData) = Trim(SendData) then   //데몬에 명령 내린 부분을 수신했는지 ACK임
    begin
      RecvAck := True;
      if SendDaemonDataList.count > 0 then SendDaemonDataList.Delete(0);
      if Trim(aData) = 'ALARMREFRESH' then   //알람 정보 변경 후 Refresh 요청 데이터
      begin
        if G_bFormEnabled[con_Monitoring] then
        begin
          self.FindClassForm('TfmMonitoring').FindCommand('Message').Params.Values['Data'] := Trim(aData);
          self.FindClassForm('TfmMonitoring').FindCommand('Message').Execute;
        end;
      end;
      continue;
    end;  }
    nIndex := Pos('R',aData);
    if nIndex < 0 then      continue;
    if nIndex > 1 then Delete(aData,1,nIndex - 1);
    if Length(Trim(aData)) < 2 then continue;
    inc(L_nRecvPacketCount);
    Try
      FReceiveTCS.Enter;
      ReceiveDataList.Add(aData);
      StatusBar1.Panels[4].Text := '[RX]' + inttostr(ReceiveDataList.Count);
    Finally
      FReceiveTCS.Leave;
    End;
    //MonitoringDataProcess(aData);

    Application.ProcessMessages;
  until pos(LINEEND,ServerComBuff) = 0;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin
  Logined := False;
  Try
    G_bApplicationTerminate := True;
    MediaPlayer1.Close;
    MediaPlayer2.Close;
    Delay(1000);
    if G_nMultiSocket = 1 then ControlDataSendStop;
    //ReceiveThreadStop;
    if G_bFormEnabled[con_Monitoring] then
    begin
      if G_nMultiDaemon = 0 then
      begin
        self.FindClassForm('TfmMonitoring').FindCommand('Close').Execute;
      end else if G_nMultiDaemon = 1 then
      begin
  //      self.FindClassForm('TfmMultiMonitoring').FindCommand('Close').Execute;
      end;
      Delay(200);
    End;

    if G_bFormEnabled[con_DoorTypeMonitor] then
    begin
      self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('Close').Execute;
    end;
    if G_bFormEnabled[con_KTTypeMonitoring] then
    begin
      self.FindClassForm('TfmKTTypeMonitoring').FindCommand('Close').Execute;
    end;
    if G_bFormEnabled[con_AlarmTypeMonitoring] then
    begin
      self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('Close').Execute;
    end;
    if G_bFormEnabled[con_AccessTypeMonitoring] then
    begin
      self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('Close').Execute;
    end;
    if G_bFormEnabled[con_AdminChangeReport] then
    begin
      self.FindClassForm('TfmAdminChangeReport').FindCommand('Close').Execute;
    end;

    if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
    begin
      self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('Close').Execute;
    end;


    if G_nMultiDaemon = 0 then
    begin
      Try
  {$IFDEF TApdWinsockport}
        WinsockPort1.Open := False;
  {$ELSE}
        WinsockPort.Active := False;
  {$ENDIF}
        if G_nMultiSocket = 1 then
        begin
          ControlSocketPort.Open := False;
        end;
      Except
      End;
    end;
    //WinsockPort.Free;
    //WinsockPort1.Free;


    ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
    ini_fun.WriteInteger('Form','Width',fmMain.Width);
    ini_fun.WriteInteger('Form','Height',fmMain.Height);
    ini_fun.WriteInteger('Form','Left',fmMain.Left);
    ini_fun.WriteInteger('Form','Top',fmMain.Top);
    if fmMain.WindowState = wsMaximized then ini_fun.WriteInteger('Form','Maximized',1)
    else ini_fun.WriteInteger('Form','Maximized',0);
    ini_fun.Free;

  //  MemoryClear;
    MemoryFree;

    Try
      ApdDataPacket1.Enabled := False;
      if ReaderPort.Open then ReaderPort.Open := False;
    Except
    End;

    Try
  //    ApdDataPacket2.Enabled := False;
      if CardCreatePort.Open then CardCreatePort.Open := False;
  //    Delay(200);
    Except
    End;
  //  Delay(1000);
    TimerStopAndFree;
  Except
    Exit;
  End;
end;

procedure TfmMain.WinsockPort1WsConnect(Sender: TObject);
begin
  bSeverConnected := True;
  DaemonServerConnected := True;
end;

procedure TfmMain.WinsockPort1WsError(Sender: TObject; ErrCode: Integer);
begin
  bSeverConnected := False;
  DaemonServerConnected := False;
  ErrCode := 0;
//  if WinsockPort.Open then WinsockPort.Open := False;
end;

procedure TfmMain.WinsockPort1WsDisconnect(Sender: TObject);
begin
  bSeverConnected := False;
  DaemonServerConnected := False;
end;

procedure TfmMain.btnDaemonConnectClick(Sender: TObject);
var
  i : integer;
  stServerIP : string;
  stPort : string;
begin
  Try
    if G_nMultiDaemon = 0 then
    begin
{$IFDEF TApdWinsockport}
      if WinsockPort1.Open then WinsockPort1.Open := False;
{$ELSE}
      if WinsockPort.Active then WinsockPort.Active := False;
{$ENDIF}
      Delay(100);
      if G_bApplicationTerminate then Exit;
{$IFDEF TApdWinsockport}
      WinsockPort1.WsAddress := DaemonServerIP;
      WinsockPort1.WsPort := DaemonServerPort;
      WinsockPort1.Open := True;
{$ELSE}
      //WinsockPort.Address := DaemonServerIP;
      WinsockPort.Host := DaemonServerIP;
      WinsockPort.Port := strtoint(DaemonServerPort);
      Try
        WinsockPort.Active := True;
      Except
      End;
{$ENDIF}
      if G_nMultiSocket = 1 then
      begin
        ControlSocketPort.Open := False;
        Delay(100);
        ControlSocketPort.WsAddress := DaemonServerIP;
        ControlSocketPort.WsPort := ControlPort;
        ControlSocketPort.Open := True;
      end;
    end else
    begin
      for i:= 0 to ServerList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        if Not TdServerConnectModule(ServerList.Objects[i]).SocketConnected then
        begin
          TdServerConnectModule(ServerList.Objects[i]).Open := False;
          Delay(50);
          //stServerIP := TdServerConnectModule(ServerList.Objects[i]).WsAddress;
          //stPort := TdServerConnectModule(ServerList.Objects[i]).WsPort;
          TdServerConnectModule(ServerList.Objects[i]).Open := True;
        end;
      end;
    end;
  Except
    Exit;
  End;
end;

procedure TfmMain.SendDaemon(aData: string);
begin
  if G_bApplicationTerminate then Exit;
  if G_nMultiDaemon = 0 then
  begin
{$IFDEF TApdWinsockport}
    if WinsockPort1.Open then WinsockPort1.PutString(aData);
{$ELSE}
    if WinsockPort.Active then WinsockPort.Socket.SendText(aData);
{$ENDIF}
  end;
end;

procedure TfmMain.CommandArrayCommandsTCommand1Execute(Command: TCommand;
  Params: TStringList);
var
  stSendData : string;
begin
  if G_bApplicationTerminate then Exit;
  Try
    stSendData := Params.Values['VALUE'];
    SendDaemonDataList.Add(stSendData);
  Finally
    SendDaemonTimer.Enabled := True;
    //SendDaemonTimer.Enabled := False;
  End;
end;

procedure TfmMain.SendDaemonTimerTimer(Sender: TObject);
var
  PastTime : dword;
  i : integer;
begin
  if G_bApplicationTerminate then Exit;
  if G_nMultiDaemon = 0 then
  begin
    if G_nMultiSocket = 1 then   //멀티소켓 사용 중이면 이 소켓을 사용하지 말자.
    begin
      SendDaemonTimer.Enabled := False;
      Exit;
    end;
    if SendDaemonDataList.Count  > 0 then
    begin
      StatusBar1.Panels[3].Text := '[TX]' + inttostr(SendDaemonDataList.Count);
  {$IFDEF TApdWinsockport}
      if Not WinsockPort1.Open then
      begin
        DaemonServerConnected := False;
        Exit;
      end;
  {$ELSE}
      if Not WinsockPort.Active then
      begin
        DaemonServerConnected := False;
        Exit;
      end;
  {$ENDIF}
      if bSending then Exit;
      bSending := True;
      SendData := sendDaemonDataList.Strings[0] + LINEEND;
      sendDaemonDataList.Delete(0);

      RecvAck := False;
      SendDaemon(SendData);
      if G_bFormEnabled[con_ComMonitoring] then   //통신상태 확인 중이면
      begin
        self.FindClassForm('TfmComMonitoring').FindCommand('Message').Params.Values['RXTX'] := 'TX';
        self.FindClassForm('TfmComMonitoring').FindCommand('Message').Params.Values['Data'] := SendData;
        self.FindClassForm('TfmComMonitoring').FindCommand('Message').Execute;
      end;
  {    if pos('DEAMONRESTART',SendData) > 0 then
      begin
        WinsockPort.Open := False;
      end;   }

      PastTime := GetTickCount + DelayTime;
      while Not RecvAck do
      begin
        if G_bApplicationTerminate then Exit;
        Application.ProcessMessages;
        if GetTickCount > PastTime then Break;  //300밀리동안 응답 없으면 실패로 처리함
      end;
      bSending := False;
    end else if sendStateDataList.count > 0 then
    begin
  {$IFDEF TApdWinsockport}
      if Not WinsockPort1.Open then
      begin
        DaemonServerConnected := False;
        Exit;
      end;
  {$ELSE}
      if Not WinsockPort.Active then
      begin
        DaemonServerConnected := False;
        Exit;
      end;
  {$ENDIF}
      if bSending then Exit;
      bSending := True;
      SendData := sendStateDataList.Strings[0] + LINEEND;
      sendStateDataList.Delete(0);

      RecvAck := False;
      SendDaemon(SendData);
      if G_bFormEnabled[con_ComMonitoring] then   //통신상태 확인 중이면
      begin
        self.FindClassForm('TfmComMonitoring').FindCommand('Message').Params.Values['RXTX'] := 'TX';
        self.FindClassForm('TfmComMonitoring').FindCommand('Message').Params.Values['Data'] := SendData;
        self.FindClassForm('TfmComMonitoring').FindCommand('Message').Execute;
      end;
  {    if pos('DEAMONRESTART',SendData) > 0 then
      begin
        WinsockPort.Open := False;
      end;   }

      PastTime := GetTickCount + DelayTime;
      while Not RecvAck do
      begin
        if G_bApplicationTerminate then Exit;
        Application.ProcessMessages;
        if GetTickCount > PastTime then Break;  //300밀리동안 응답 없으면 실패로 처리함
      end;
      bSending := False;
    end;
  end else if G_nMultiDaemon = 1 then
  begin
    SendDaemonTimer.Enabled := False;
    for i := 0 to ServerList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;

      if (TdServerConnectModule(ServerList.Objects[I]).QuickSendDataList.Count > 0)
         or (TdServerConnectModule(ServerList.Objects[I]).ReserveSendDataList.Count > 0) then
      begin
        Try
          if TdServerConnectModule(ServerList.Objects[I]).Open then TdServerConnectModule(ServerList.Objects[I]).ExecSendPacket;
        Except
          //무시
        End;
      end;
    end;
    SendDaemonTimer.Enabled := Not G_bApplicationTerminate;
  end;


{  if Not RecvAck then inc(FailCount) ;

  if FailCount > RETRYCOUNT then
  begin
    FailCount := 0;
    if SendDaemonDataList.Count > 0 then SendDaemonDataList.Delete(0);
  end; }

end;

procedure TfmMain.Action_CardAdminExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
  fmMDICardAdmin : TForm;
begin
  GetProgramGrade(Action_CardAdmin.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmMDICardAdmin',bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmMDICardAdmin := MDIForm('TfmMDICardAdmin');
  TfmMDICardAdmin(fmMDICardAdmin).GradeSetting(bInsertGrade,bUpdateGrade,bDeleteGrade);
{  fmCardAdmin:= TfmCardAdmin.Create(Self);
  Try
    fmCardAdmin.Caption := Action_CardAdmin.Caption;
    fmCardAdmin.IsInsertGrade := bInsertGrade;
    fmCardAdmin.IsUpdateGrade := bUpdateGrade;
    fmCardAdmin.IsDeleteGrade := bDeleteGrade;
    fmCardAdmin.SHowmodal;
  Finally
    fmCardAdmin.Free;
  End; }

end;

procedure TfmMain.Action_CardDownLoadExecute(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + '000000000000' + DATADELIMITER + 'N' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  CardDownLoad('000000000000','N');
end;

procedure TfmMain.CommandArrayCommandsTCommand2Execute(Command: TCommand;
  Params: TStringList);
begin
  //여기에서 화면 리프레쉬
  if G_bFormEnabled[con_Monitoring] then
  begin
    if G_nMultiDaemon = 0 then
    begin
      self.FindClassForm('TfmMonitoring').FindCommand('REFRESH').Execute;
    end else if G_nMultiDaemon = 1 then
    begin
//      self.FindClassForm('TfmMultiMonitoring').FindCommand('REFRESH').Execute;
    end;
  end;
  if G_bFormEnabled[con_DoorTypeMonitor] then
  begin
    self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('REFRESH').Execute;
  end;
  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    self.FindClassForm('TfmKTTypeMonitoring').FindCommand('REFRESH').Execute;
  end;
  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('REFRESH').Execute;
  end;
  if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('REFRESH').Execute;
  end;
  if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('REFRESH').Execute;
  end;
  if G_bFormEnabled[con_AlarmMapMonitoring] then
  begin
    self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('REFRESH').Execute;
  end;
  if G_bFormEnabled[con_AccessMapMonitoring] then
  begin
    self.FindClassForm('TfmAccessMapMonitoring').FindCommand('REFRESH').Execute;
  end;

  //데몬 재시작 하자...
//  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DEAMONRESTART'+ DATADELIMITER + '000000000000' + DATADELIMITER ;
//  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMain.Action_DeviceGradeSearchExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_DeviceGradeSearch.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDeviceGradeSearch',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmDeviceGradeSearch').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.mn_DBBackupClick(Sender: TObject);
var
  stBackFile: String;
  ini_fun : TiniFile;
  stDBName : String;
begin
  SaveDialog1.DefaultExt:= 'Dat';
  SaveDialog1.Filter := 'Data files (*.Dat)|*.Dat';
  SaveDialog1.FileName := FormatDateTime('yyyymmdd',Now);
  if SaveDialog1.Execute then
  begin
    stBackFile := SaveDialog1.FileName;
  end;

  ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\zmos.INI');

  stDBName := ini_fun.ReadString('DBConfig','DBNAME','ZMOS');
  ini_fun.Free;

  if MessageDlg('DB를 백업 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if Not DBBackup(stDBName, stBackFile) then showmessage('백업 실패')
    else  SHowMessage(stBackFile +'에 백업 했습니다.');
  end;

end;

function TfmMain.DBBackup(aDBName, aBackupFile: string): Boolean;
var
  stSql :string;
begin
    Result := False;
    with Datamodule1.GetObject.ADOExecQuery do
    begin
      stSql := 'BACKUP DATABASE ' + aDBName + ' TO disk = ''' + aBackupFile + '''';
      Close;
      Sql.Clear;
      Sql.Text := stSql ;
      Try
        ExecSQL;
      Except
        Exit;
      End;
      Result := True;
    end;

end;

procedure TfmMain.mn_ProgramConfigSettingClick(Sender: TObject);
begin
  fmProgramConfig:= TfmProgramConfig.Create(Self);
  Try
    L_bShowModalVisible := True;
    fmProgramConfig.SHowmodal;
  Finally
    fmProgramConfig.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_AccessReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  if G_nSearchIndex = 0 then
  begin
    MDIChildShow('TfmAccessReport');
    self.FindClassForm('TfmAccessReport').FindCommand('GRADEREFRESH').Execute;
  end else
  begin
    MDIChildShow('TfmLargeAccessReport');
    self.FindClassForm('TfmLargeAccessReport').FindCommand('GRADEREFRESH').Execute;
  end;

end;

procedure TfmMain.mn_AlarmReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmNewAlarmReport');
  self.FindClassForm('TfmNewAlarmReport').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.mn_ComStateClick(Sender: TObject);
begin
  MDIChildShow('TfmComMonitoring');

end;

procedure TfmMain.N9Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmHoliday:= TfmHoliday.Create(Self);
  Try
    fmHoliday.IsInsertGrade := bInsertGrade;
    fmHoliday.IsUpdateGrade := bUpdateGrade;
    fmHoliday.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmHoliday.SHowmodal;
  Finally
    fmHoliday.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.Button1Click(Sender: TObject);
begin
  if CardCreatePort.Open then
     CardCreatePort.PutString('R' + #$5D);

end;

procedure TfmMain.StaticText1Click(Sender: TObject);
begin
  Pan_Gauge.Visible := False;
end;

procedure TfmMain.CenterPanel;
var
  nTotW,nTotH,nPanW,nPanH:integer;
  nTop,nLeft : integer;
  nStartH,nStartW : integer;
begin
  nStartH := 65;
  nStartW := 0;
  nTotW := Width;
  nTotH := Height;
  nPanW := Pan_Gauge.Width;
  nPanH := Pan_Gauge.Height;
  nTop := nStartH + (nTotH div 2) - (nPanH div 2);
  nLeft := nStartW + (nTotW div 2) - (nPanW div 2);
  Pan_Gauge.Top := nTop;
  Pan_Gauge.Left := nLeft;

  nStartH := 65;
  nStartW := 0;
  nTotW := Width;
  nTotH := Height;
  nPanW := pan_Message.Width;
  nPanH := pan_Message.Height;
  nTop := nStartH + (nTotH div 2) - (nPanH div 2);
  nLeft := nStartW + (nTotW div 2) - (nPanW div 2);
  pan_Message.Top := nTop;
  pan_Message.Left := nLeft;

//  pan_Message.Visible := True;
//  Pan_Gauge.Visible := True;
end;

procedure TfmMain.CardDownLoad(aDeviceID,aACK: string);
var
  stSql : string;
  stCardNo : string;
  TempAdoQuery : TADOQuery;
begin
  if bCardDownLoad then Exit;
  bCardDownLoad := True;
  Pan_Gauge.Visible := False;
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if aACK <> 'A' then
    stSql := stSql + ' AND DE_RCVACK = ''' + aACK +''' ';
  if aDeviceID <> '000000000000' then
  begin
    //기기별 다운로드
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(Copy(aDeviceID,1,3)));
    stSql := stSql + ' AND AC_ECUID = ''' + Copy(aDeviceID,4,2) + ''' ';
  end;

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if recordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    While Not Eof do
    begin
      stCardNo := FillZeroNumber(FindField('AC_NODENO').asinteger,3) +
                              FindField('AC_ECUID').AsString +
                              FindField('CA_CARDNO').AsString;
      if DownLoadCardList.IndexOf(stCardNo) < 0 then
        DownLoadCardList.Add(stCardNo);
      Next;
    end;
  end;
  Pan_Gauge.Visible := True;
  Gauge1.MaxValue := DownLoadCardList.Count;
  Gauge1.Progress := 0;
  TempAdoQuery.Free;
  CoUninitialize;
  bCardDownLoad := True;
end;

procedure TfmMain.CommandArrayCommandsTCommand4Execute(Command: TCommand;
  Params: TStringList);
var
  stDeviceID : string;
  stAck : string;
begin
  stDeviceID := Params.Values['VALUE'];
  stAck := Copy(stDeviceID,13,1);
  stDeviceID := copy(stDeviceID,1,13);
  CardDownLoad(stDeviceID,stAck);
end;

procedure TfmMain.ServerConnectTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  ServerConnectTimer.Enabled := False;
  if btnDaemonConnect.Enabled then
  begin
    btnDaemonConnectClick(self);
  end;
  ServerConnectTimer.Enabled := Not G_bApplicationTerminate;
{  if WinSockPort.Open then Exit;
  WinsockPort.Open := True;
}
end;

procedure TfmMain.DeviceRcvRegCardData(aData: string);
var
  cCommand: Char;
  MSG_Code: Char;
  bResult : boolean;
  stNodeNo : string;
  stDeviceID : string;
  stCardNo : string;
  nIndex : integer;
  stEcuID : string;
  nLength : integer;
begin
  //RE001000000CRC0101231231231
  if copy(aData,12,2) <> 'CR' then Exit;
  stNodeNo := Copy(aData,3,3);
  stEcuID := copy(aData,6,2);
  if Not IsDigit(copy(aData,15,3)) then Exit;
  nLength := strtoint(copy(aData,15,3));
  stCardNo := copy(aData,18,nLength);
  nIndex := DownLoadCardList.IndexOf(stNodeNo+stEcuID+stCardNo);
  if nIndex > -1 then
  begin
    Gauge1.Progress := Gauge1.Progress + 1;
    DownLoadCardList.Delete(nIndex);
    if DownLoadCardList.Count = 0 then Pan_Gauge.Visible := False;
  end;
{
  stNodeNo := Copy(aData,2,3);
  Delete(aData,1,4); //R노드번호
  if Length(aData) < 34 then Exit;
  cCommand:= aData[17];

  if cCommand <> 'c' then Exit; //카드 데이터 아님
  MSG_Code:= aData[19];
  bResult := False;
  if MSG_Code = 'l' then bResult := True;
  if MSG_Code = 'm' then bResult := True;
  if Msg_Code = 'n' then bResult := True;

  if Not bResult then Exit; //카드 등록 데이터 아님

  stDeviceID := copy(aData,8,9);
  stCardNo:= Copy(aData,27,8);
  stCardNo:= DecodeCardNo(stCardNo);

  nIndex := DownLoadCardList.IndexOf(stNodeNo+stDeviceID+stCardNo);
  if nIndex > -1 then
  begin
    Gauge1.Progress := Gauge1.Progress + 1;
    DownLoadCardList.Delete(nIndex);
    if DownLoadCardList.Count = 0 then Pan_Gauge.Visible := False;
  end;
         }
end;

procedure TfmMain.Action_DeviceCardExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
  fmMDIDeviceGrade : TForm;
begin
  GetProgramGrade(Action_DeviceCard.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmMDIDeviceGrade',bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmMDIDeviceGrade := MDIForm('TfmMDIDeviceGrade');
  TfmMDIDeviceGrade(fmMDIDeviceGrade).GradeSetting(bInsertGrade,bUpdateGrade,bDeleteGrade);
{  fmDeviceGrade:= TfmDeviceGrade.Create(Self);
  Try
    fmDeviceGrade.Caption := Action_DeviceCard.Caption;
    fmDeviceGrade.IsInsertGrade := bInsertGrade;
    fmDeviceGrade.IsUpdateGrade := bUpdateGrade;
    fmDeviceGrade.IsDeleteGrade := bDeleteGrade;
    fmDeviceGrade.SHowmodal;
  Finally
    fmDeviceGrade.Free;
  End;  }

end;

procedure TfmMain.N11Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmPromiseGrade:= TfmPromiseGrade.Create(Self);
  Try
    fmPromiseGrade.Caption := TMenuItem(Sender).Caption;
    fmPromiseGrade.IsInsertGrade := bInsertGrade;
    fmPromiseGrade.IsUpdateGrade := bUpdateGrade;
    fmPromiseGrade.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmPromiseGrade.SHowmodal;
  Finally
    fmPromiseGrade.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.N13Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmPromiseGradeAdmin:= TfmPromiseGradeAdmin.Create(Self);
  Try
    fmPromiseGradeAdmin.IsInsertGrade := bInsertGrade;
    fmPromiseGradeAdmin.IsUpdateGrade := bUpdateGrade;
    fmPromiseGradeAdmin.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmPromiseGradeAdmin.SHowmodal;
  Finally
    fmPromiseGradeAdmin.Free;
    L_bShowModalVisible := False;
  End;
end;

procedure TfmMain.N17Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmDoorAdminReport');
  self.FindClassForm('TfmDoorAdminReport').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.N18Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmAlarmAdminReport');
  self.FindClassForm('TfmAlarmAdminReport').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.mn_BatchEmployeeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmBatchEmployee:= TfmBatchEmployee.Create(Self);
  Try
    fmBatchEmployee.Caption := mn_BatchEmployee.Caption;
    fmBatchEmployee.IsInsertGrade := bInsertGrade;
    fmBatchEmployee.IsUpdateGrade := bUpdateGrade;
    fmBatchEmployee.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmBatchEmployee.SHowmodal;
  Finally
    fmBatchEmployee.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.GetProgramGrade(aProgID: string;
  var aInsertGrade, aUpdateGrade, aDeleteGrade: Boolean);
var
  stSql : string;
begin
  if IsMaster then
  begin
    aInsertGrade := True;
    aUpdateGrade := True;
    aDeleteGrade := True;
    Exit;
  end;
  aInsertGrade := False;
  aUpdateGrade := False;
  aDeleteGrade := False;

  stSql := 'select * from TB_GRADEPROGRAM ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND GR_GRADECODE = ''' + AdminGrade + ''' ';
  stSql := stSql + ' AND PR_PROGRAMID = ''' + aProgID + ''' ';
  with ADOQuery do
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
    if FindField('GR_INSERT').AsString = 'Y' then aInsertGrade := True;
    if FindField('GR_UPDATE').AsString = 'Y' then aUpdateGrade := True;
    if FindField('GR_DELETE').AsString = 'Y' then aDeleteGrade := True;
  end;
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
{
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
    TfmASubForm(tmpForm).IsInsertGrade := aInsertGrade;
    TfmASubForm(tmpForm).IsUpdateGrade := aUpdateGrade;
    TfmASubForm(tmpForm).IsDeleteGrade := aDeleteGrade;
    tmpForm.Show;
  end;
{  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        //(screen.forms[i] as TForm).show;
        {Screen.Forms[i].CloseQuery;
        Screen.Forms[i].Destroy;
        break;}
{        if Screen.ActiveForm = Screen.Forms[i] then
        begin
          Screen.Forms[i].WindowState := wsMaximized;
          Exit;
        end;
        SetWindowPos(Screen.Forms[i].Handle, 0, 0, 0, 0, 0,
        HWND_TOP );   //WS_EX_TOPMOST
        TfmASubForm(Screen.Forms[i]).IsInsertGrade := aInsertGrade;
        TfmASubForm(Screen.Forms[i]).IsUpdateGrade := aUpdateGrade;
        TfmASubForm(Screen.Forms[i]).IsDeleteGrade := aDeleteGrade;
        Screen.Forms[i].Show;
        Screen.Forms[i].WindowState := wsMaximized;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    TfmASubForm(tmpForm).IsInsertGrade := aInsertGrade;
    TfmASubForm(tmpForm).IsUpdateGrade := aUpdateGrade;
    TfmASubForm(tmpForm).IsDeleteGrade := aDeleteGrade;
    tmpForm.Show;
    tmpForm.WindowState := wsMaximized;
  end; }
end;

procedure TfmMain.LiveTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  if G_nMultiSocket = 0 then
  begin
    SendDaemonTimer.Enabled := True;
  end else if G_nMultiSocket = 1 then
  begin
{$IFDEF TApdWinsockport}
    if WinsockPort1.Open then WinsockPort1.PutString('WINSOCKALIVE' + LINEEND);
{$ELSE}
    if WinsockPort.Active then WinsockPort.Socket.SendText('WINSOCKALIVE' + LINEEND);
{$ENDIF}
  end;
  SendDaemonDataList.Add('CONTROLSOCKALIVE');

end;

procedure TfmMain.FormNameSet;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  FM001 := '회사코드';
  FM002 := '회사명';
  FM011 := '지점코드';
  FM012 := '지점명';
  FM021 := '부서코드';
  FM022 := '부서명';
  FM031 := '직위코드';
  FM032 := '직위명';
  FM040 := '직원구분';
  FM041 := '직원코드';
  FM042 := '직원코드명칭';
  FM101 := '사번';
  FM102 := '이름';
  FM103 := '사내전화번호';
  FM104 := '입사일';
  FM105 := '퇴사일';
  FM106 := '사원';
  FM107 := '핸드폰';
  FM108 := '주소1';
  FM109 := '주소2';
  FM110 := '재직구분';
  FM901 := '빌딩코드';
  FM902 := '빌딩명칭';
  FM903 := '빌딩권한';
  FM911 := '층코드';
  FM912 := '층명칭';
  FM913 := '층권한';
  FM921 := '구역코드';
  FM922 := '구역명칭';
  FM923 := '구역권한';
  FM923 := '출입문권한';


  stSql := 'select * from TB_FORMNAME ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + '''';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    First;
    While Not Eof do
    begin
      if FindField('FM_CODE').AsString = '001' then
      begin
        FM001 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '002' then
      begin
        FM002 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '011' then
      begin
        FM011 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '012' then
      begin
        FM012 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '021' then
      begin
        FM021 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '022' then
      begin
        FM022 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '031' then
      begin
        FM031 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '032' then
      begin
        FM032 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '040' then
      begin
        FM040 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '041' then
      begin
        FM041 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '042' then
      begin
        FM042 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '101' then
      begin
        FM101 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '102' then
      begin
        FM102 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '103' then
      begin
        FM103 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '104' then
      begin
        FM104 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '105' then
      begin
        FM105 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '106' then
      begin
        FM106 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '107' then
      begin
        FM107 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '108' then
      begin
        FM108 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '109' then
      begin
        FM109 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '110' then
      begin
        FM110 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '901' then
      begin
        FM901 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '902' then
      begin
        FM902 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '903' then
      begin
        FM903 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '911' then
      begin
        FM911 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '912' then
      begin
        FM912 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '913' then
      begin
        FM913 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '921' then
      begin
        FM921 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '922' then
      begin
        FM922 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '923' then
      begin
        FM923 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '933' then
      begin
        FM933 := FindField('FM_NAME').asstring;
      end;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMain.MenuNameSet;
begin
  MN_CompanyCode.Caption := FM001 + '관리';
  mn_JijumCode.Caption := FM011 + '관리';
  mn_DepartCode.Caption := FM021 + '관리';
  mn_Posicode.Caption := FM031 + '관리';
  mn_EmpType.Caption := FM040 + '관리';

  Action_Employ.Caption := '개별' + FM106 + '관리';

  mn_Employee.Caption := FM106 + '관리';
  mn_PerEmployee.Caption := '개별' + FM106 + '관리';
  mn_BatchEmployee.Caption := '일괄' + FM106 + '관리';
  mn_EmployeeBranch.Caption := FM106 + '분류';
end;

procedure TfmMain.mn_JijumCodeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 1 then
    begin
      showmessage('지점코드 관리 권한이 없습니다.');
      Exit;
    end;
  end;
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  Try
    fmCompanyCode.Caption := mn_JijumCode.Caption;
    fmCompanyCode.WorkCode := 1;
    fmCompanyCode.IsInsertGrade := bInsertGrade;
    fmCompanyCode.IsUpdateGrade := bUpdateGrade;
    fmCompanyCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmCompanyCode.SHowmodal;
  Finally
    fmCompanyCode.Free;
    L_bShowModalVisible := False;
  End;
end;

procedure TfmMain.NowTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
end;

procedure TfmMain.mn_RelaySamyukEmployClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmRelayEmploy:= TfmRelayEmploy.Create(Self);
  Try
    fmRelayEmploy.Caption := mn_RelaySamyukEmploy.Caption;
    fmRelayEmploy.IsInsertGrade := bInsertGrade;
    fmRelayEmploy.IsUpdateGrade := bUpdateGrade;
    fmRelayEmploy.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmRelayEmploy.SHowmodal;
  Finally
    fmRelayEmploy.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.StateCheckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StateCheckTimer.Enabled := False;
  Action_StateSearchExecute(Self);
  ArmAreaStateTimer.Enabled := True;
end;

procedure TfmMain.mn_readerHistoryClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(mn_readerHistory.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmReaderState',bInsertGrade,bUpdateGrade,bDeleteGrade);
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

procedure TfmMain.N12Click(Sender: TObject);
begin
  Try
    ApdDataPacket1.Enabled := False;
    ReaderPort.Open := False;
  Except
  End;
  Try
//    ApdDataPacket2.Enabled := False;
    CardCreatePort.Open := False;
  Except
  End;

  fmClientConfig:= TfmClientConfig.Create(Self);
  Try
    L_bShowModalVisible := True;
    fmClientConfig.SHowmodal;
  Finally
    fmClientConfig.Free;
    L_bShowModalVisible := False;
  End;
  ClientConfigRead;
  if G_nMonitoringAttendReport = 1 then mn_AtReport.Visible := True
  else mn_AtReport.Visible := False;
end;

procedure TfmMain.ClientConfigRead;
var
  i : integer;
  stType : string;
begin

  if LMDIniCtrl1.ReadString('환경설정','개방모드열림상태','N') = 'Y' then OpenModeDoorOpen := True
  else OpenModeDoorOpen := False;
  if LMDIniCtrl1.ReadString('환경설정','사번수정','N') = 'Y' then G_bUpdateEmCode := True
  else G_bUpdateEmCode := False;
  if LMDIniCtrl1.ReadString('환경설정','알람발생','N') = 'Y' then ACAlarmUse := True
  else ACAlarmUse := False;
  if LMDIniCtrl1.ReadString('환경설정','장시간열림알람발생','N') = 'Y' then LongDoorOpenAlarmUse := True
  else LongDoorOpenAlarmUse := False;
  if LMDIniCtrl1.ReadString('환경설정','출입문열림알람발생','N') = 'Y' then G_bDoorOpenAlarmUse := True
  else G_bDoorOpenAlarmUse := False;
  if LMDIniCtrl1.ReadString('환경설정','출입전용알람발생','N') = 'Y' then ACAlarmEventUse := True
  else ACAlarmEventUse := False;
  ACAlarmEventCode := LMDIniCtrl1.ReadString('환경설정','출입전용알람코드','NF,AF');
  ACAlaramFile := LMDIniCtrl1.ReadString('환경설정','알람파일','');
  if LMDIniCtrl1.ReadString('환경설정','방범알람발생','N') = 'Y' then PTAlarmUse := True
  else PTAlarmUse := False;
  if LMDIniCtrl1.ReadString('환경설정','알람메시지','N') = 'Y' then PTAlarmMessageUse := True
  else PTAlarmMessageUse := False;
  if LMDIniCtrl1.ReadString('환경설정','알람확인이벤트','N') = 'Y' then PTAlarmConfirmEvent := True
  else PTAlarmConfirmEvent := False;
  if LMDIniCtrl1.ReadString('환경설정','빌딩별경해','N') = 'Y' then BuildingAlarmShow := True
  else BuildingAlarmShow := False;

  if LMDIniCtrl1.ReadString('환경설정','경해모드음성','N') = 'Y' then G_bModeChangSound := True
  else G_bModeChangSound := False;
  G_stModeChangeArmSound := LMDIniCtrl1.ReadString('환경설정','경계모드음성','');
  G_stModeChangeDisArmSound := LMDIniCtrl1.ReadString('환경설정','해제모드음성','');
  G_nAlarmMessageFontSize := LMDIniCtrl1.ReadInteger('Message','FONT',28);
  G_nAlarmCount := LMDIniCtrl1.ReadInteger('환경설정','AlarmCount',1);

  PTAlaramFile := LMDIniCtrl1.ReadString('환경설정','방범알람파일','');
  G_stDoorOpenAlaramFile := LMDIniCtrl1.ReadString('환경설정','출입문열림파일','');
  IsCardGradCopy := False;
  if LMDIniCtrl1.ReadInteger('환경설정','카드권한복사',0) = 1  then IsCardGradCopy := True;
  G_nAccessEventSearch := LMDIniCtrl1.ReadInteger('환경설정','출입이벤트',1);

  if LMDIniCtrl1.ReadString('환경설정','범례표시','Y') = 'Y' then G_bACIntroView := True
  else G_bACIntroView := False;
  if LMDIniCtrl1.ReadString('환경설정','폐쇄모드','N') = 'Y' then G_bColseModeView := True
  else G_bColseModeView := False;
  if LMDIniCtrl1.ReadString('환경설정','POSINEGA','N') = 'Y' then G_bPosiNega := True
  else G_bPosiNega := False;
  if LMDIniCtrl1.ReadString('환경설정','화재메시지','Y') = 'Y' then G_bFireMessageView := True
  else G_bFireMessageView := False;
  G_nFireTime := LMDIniCtrl1.ReadInteger('환경설정','화재표시시간',30);

  G_stFireState := LMDIniCtrl1.ReadString('환경설정','화재상태','FI');
  G_nLoginMoitorStart:= LMDIniCtrl1.ReadInteger('환경설정','로그인모니터시작',0); //로그인시 모니터링 시작
  G_nMonitorGubun := LMDIniCtrl1.ReadInteger('환경설정','모니터방법',0); //모니터링 시 전체모니터링 0,그룹별모니터링 1
  G_nBuildingVisible := LMDIniCtrl1.ReadInteger('Monitoring','BuildingVisible',0);
  G_nAlarmMapPopup := LMDIniCtrl1.ReadInteger('Monitoring','AlarmMap',0);
  G_nZoneMapPopup := LMDIniCtrl1.ReadInteger('Monitoring','ZoneMap',0);
  G_nSearchIndex := LMDIniCtrl1.ReadInteger('환경설정','조회방법',0); //기본값조회 0,조회안함 1
  G_nCompanySearchIndex := LMDIniCtrl1.ReadInteger('환경설정','회사정보조회순서',0); //회사정보조회시 코드순 0,명칭순 1
  G_nBuildingSearchIndex := LMDIniCtrl1.ReadInteger('환경설정','위치정보조회순서',0); //위치정보조회시 코드순 0,명칭순 1
  if LMDIniCtrl1.ReadString('환경설정','카드중복발급','N') = 'Y' then G_bKTDupCardReg := True
  else G_bKTDupCardReg := False;
  G_stRelayDefaultCode := LMDIniCtrl1.ReadString('환경설정','연동코드','001');

  G_nCardRegisterPort := LMDIniCtrl1.ReadInteger('환경설정','등록기포트',0);
  G_nCardCreatePort := LMDIniCtrl1.ReadInteger('CARDCREATE','COMPORT',0);
  G_nFingerDeviceType := LMDIniCtrl1.ReadInteger('지문등록기','타입',0);
  G_stFingerReaderIP := LMDIniCtrl1.ReadString('지문등록기','IP','127.0.0.1');
  G_stFingerReaderID := LMDIniCtrl1.ReadString('지문등록기','ID','1');
  G_nFingerDeviceVer := LMDIniCtrl1.ReadInteger('지문등록기','ver',0);
  if G_nFingerDeviceType = 2 then //만약 지문등록기 타입이 IF1000 타입이면
  begin
    if fdmsDBType = 0 then
    begin
      if Not dmSHFDBRelay.DataBaseConnect(fdmsDBType,fdmsDBIP,fdmsDBPort,fdmsDBUser,fdmsPW,fdmsPath,0,False) then
      begin
        G_nFingerDeviceType := 0;
      end;
    end else if fdmsDBType = 1 then
    begin
      if Not dmSHFDBRelay.DataBaseConnect(fdmsDBType,fdmsDBIP,fdmsDBPort,fdmsDBUser,fdmsPW,fdmsDBName,0,False) then
      begin
        G_nFingerDeviceType := 0;
      end;
    end;
  end;

  G_nMonitoringAttendReport := LMDIniCtrl1.ReadInteger('환경설정','근태보고서',0);
  G_nMultiDeleteCard := LMDIniCtrl1.ReadInteger('환경설정','멀티삭제',0);
  G_nEmployeeAdminType := LMDIniCtrl1.ReadInteger('환경설정','사원관리',0);
  G_nFileFormat := LMDIniCtrl1.ReadInteger('환경설정','파일포맷',0);

  //========================================================== 자동 로그인 추가(2024.04)
  if LMDIniCtrl1.ReadString('환경설정','자동로그인사용','N') = 'Y' then G_bAutoLoginUse := True
  else G_bAutoLoginUse := False;
  G_stAutoLoginUserID := LMDIniCtrl1.ReadString('환경설정','자동로그인사용자아이디','1234');
  G_stAutoLoginUserPW := LMDIniCtrl1.ReadString('환경설정','자동로그인패스워드','1234');
  //========================================================== 자동 로그인 추가(2024.04)

  if LMDIniCtrl1.ReadInteger('사원정보','기본퇴사일사용유무',0) = 1 then  G_bRetireDateUse := True
  else G_bRetireDateUse := False;
  G_nRetireDate := LMDIniCtrl1.ReadInteger('사원정보','기본퇴사일',0);

  for i := 0 to ACCESSEVENTMAXCELL do
  begin
    if (i = 3) or (i = 11) then
      AccessEventShowTable[i] := LMDIniCtrl1.Readinteger('출입이벤트',inttostr(i),0)
    else
      AccessEventShowTable[i] := LMDIniCtrl1.Readinteger('출입이벤트',inttostr(i),1);
    if (i = 0) or (i = 2) then
    begin
      Access1SizeTable[i] := LMDIniCtrl1.Readinteger('출입이벤트1사이즈',inttostr(i),140);
      Access2SizeTable[i] := LMDIniCtrl1.Readinteger('출입이벤트2사이즈',inttostr(i),140);
      Access3SizeTable[i] := LMDIniCtrl1.Readinteger('출입이벤트3사이즈',inttostr(i),140);
    end else
    begin
      Access1SizeTable[i] := LMDIniCtrl1.Readinteger('출입이벤트1사이즈',inttostr(i),90);
      Access2SizeTable[i] := LMDIniCtrl1.Readinteger('출입이벤트2사이즈',inttostr(i),90);
      Access3SizeTable[i] := LMDIniCtrl1.Readinteger('출입이벤트3사이즈',inttostr(i),90);
    end;

  end;
  for i := 0 to ALARMEVENTMAXCELL do
  begin
    if (i = 5) or (i = 7) then
      AlarmEventShowTable[i] := LMDIniCtrl1.Readinteger('알람이벤트',inttostr(i),0)
    else
      AlarmEventShowTable[i] := LMDIniCtrl1.Readinteger('알람이벤트',inttostr(i),1);
    if (i = 0) or (i = 2) then
    begin
      Alarm1SizeTable[i] := LMDIniCtrl1.Readinteger('알람이벤트1사이즈',inttostr(i),140);
      Alarm2SizeTable[i] := LMDIniCtrl1.Readinteger('알람이벤트2사이즈',inttostr(i),140);
    end else
    begin
      Alarm1SizeTable[i] := LMDIniCtrl1.Readinteger('알람이벤트1사이즈',inttostr(i),90);
      Alarm2SizeTable[i] := LMDIniCtrl1.Readinteger('알람이벤트2사이즈',inttostr(i),90);
    end;
  end;
  for i := 0 to MAPALARMEVENTMAXCELL do
  begin
    if (i = 3) then
    begin
      MapAlarm1SizeTable[i] := LMDIniCtrl1.Readinteger('맵알람이벤트1사이즈',inttostr(i),300);
    end else
    begin
      MapAlarm1SizeTable[i] := LMDIniCtrl1.Readinteger('맵알람이벤트1사이즈',inttostr(i),150);
    end;
  end;
  BuildingStep := LMDIniCtrl1.ReadString('Config','Building','0');

  if G_nCardRegisterPort <> 0 then
  begin
    try
      ApdDataPacket1.AutoEnable := false;
      ApdDataPacket1.StartCond := scString;
      ApdDataPacket1.StartString := #$02;
      ApdDataPacket1.EndCond := [ecString];
      ApdDataPacket1.EndString := #$03;
      ApdDataPacket1.Timeout := 0;
      ReaderPort.ComNumber := G_nCardRegisterPort;
      ReaderPort.Open := true;
      ApdDataPacket1.Enabled := True;
      StatusBar1.Panels[1].Text := '등록기 포트 오픈 성공';
      stType := 'C';
      if G_nSpecialProgram = 1 then stType := 'K';  //등록기 포트 Change
      CardReaderFormatChange(stType);
    except
      StatusBar1.Panels[1].Text := '등록기 포트 오픈 실패';
      //Exit;
    end;
  end;
  if G_nCardCreatePort <> 0 then
  begin
    try
      //ApdDataPacket2.AutoEnable := false;
      //ApdDataPacket2.StartCond := scString;
      //ApdDataPacket2.StartString := #$02;
      //ApdDataPacket2.EndCond := [ecString];
      //ApdDataPacket2.EndString := #$03;
      //ApdDataPacket2.Timeout := 0;
      CardCreatePort.DeviceLayer := dlWin32;
      CardCreatePort.Baud := 9600;
      CardCreatePort.ComNumber := G_nCardCreatePort;
      CardCreatePort.Open := UseKTCardReg;
      //StatusBar1.Panels[1].Text := '발급기 포트 오픈 성공';
    except
      StatusBar1.Panels[1].Text := '발급기 포트 오픈 실패';
      Exit;
    end;
  end;

  st_Message.Font.Size := G_nAlarmMessageFontSize;
end;

procedure TfmMain.PeronRelayTimer1Timer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  //대학교 연동 데이터가 있는지 체크함
  PeronRelayTimer1.Enabled := False;
  PeronRelayTimer1.Interval := 1000 * 60 * 60 * 24;  //한번 체크 했으면 24시간 후에 체크 함.
  checkRelayPeronData;
  PeronRelayTimer1.Enabled := Not G_bApplicationTerminate;
end;

procedure TfmMain.checkRelayPeronData;
var
  stSql : string;
  stMessage : string;
begin
  if L_bPersonRelayCheck then Exit;

  L_bPersonRelayCheck := True;
  if PersonRelayType = 1 then  //삼육대 연동 체크
  begin
    ReleaySamyukCheck;
  end else if PersonRelayType = 3 then  //경희대 연동 체크
  begin
    ReleayKyngHeeCheck;
  end else if PersonRelayType = 5 then  //명지대 연동 체크
  begin
    ReleayMungJiCheck;
    PeronRelayTimer1.Interval := 1000 * 60 * 60 * 1;  //한번 체크 했으면 1시간 후에 체크 함. - 명지대
  end;
  L_bPersonRelayCheck := False;

end;

procedure TfmMain.GetRelayConfig;
var
  stSql : string;
begin
//  result := False;

  G_nRelayDataBaseType := 1; //1.MSSQL 연동 ,2.PostGreSql Server,3.Oracle
  G_stRelayServerIP := '210.94.230.2';
  G_stRelayServerPort := '1433';
  G_stRelayUserID := 'SA';
  G_stRelayUserPW := 'lotecs@9240';
  G_stRelayDataBaseName := 'UMCS';
  G_stRelayDateTime := '00000000000000';

  G_nRelayDataBaseType2 := 3; //1.MSSQL 연동 ,2.PostGreSql Server,3.Oracle
  G_stRelayServerIP2 := '210.94.230.2';
  G_stRelayServerPort2 := '1433';
  G_stRelayUserID2 := 'SA';
  G_stRelayUserPW2 := 'lotecs@9240';
  G_stRelayDataBaseName2 := 'UMCS';


  stSql := 'select * from TB_PERRELAYCONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    while Not Eof do
    begin
      if FindField('PC_CONFIGCODE').AsString = 'DBTYPE' then
        G_nRelayDataBaseType := strtoint(FindField('PC_CONFIGVALUE').AsString)
      else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERIP' then
        G_stRelayServerIP := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERPORT' then
        G_stRelayServerPort := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBUSERID' then
        G_stRelayUserID := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBUSERPW' then
        G_stRelayUserPW := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBNAME' then
        G_stRelayDataBaseName := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBTYPE2' then
        G_nRelayDataBaseType2 := strtoint(FindField('PC_CONFIGVALUE').AsString)
      else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERIP2' then
        G_stRelayServerIP2 := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERPORT2' then
        G_stRelayServerPort2 := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBUSERID2' then
        G_stRelayUserID2 := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBUSERPW2' then
        G_stRelayUserPW2 := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBNAME2' then
        G_stRelayDataBaseName2 := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'GETDATETIME' then
        G_stRelayDateTime := FindField('PC_CONFIGVALUE').AsString;

      Next;
    end;
//    result := True;
  end;
end;


procedure TfmMain.RelayConfigSet;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  IsCardReaderServer := False;

  fdmsUses := 'FALSE';
  fdmsPath := '';
  fdmsPW   := '';
  fdmsNoAuto := True;
  G_bAutoFdmsCardNo := False;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  with TempAdoQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
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
      end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDBTYPE' then
      begin
        if isDigit(FindField('CO_CONFIGVALUE').AsString) then fdmsDBType := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
      end else if FindField('CO_CONFIGCODE').AsString = 'cardServer' then
      begin
        if strtoint(FindField('CO_CONFIGVALUE').AsString) = 1 then
            IsCardReaderServer := True;
      end else if FindField('CO_CONFIGCODE').AsString = 'FDMSNOAUTO' then
      begin
        if FindField('CO_CONFIGVALUE').AsString = 'N' then fdmsNoAuto := False;
      end else if FindField('CO_CONFIGCODE').AsString = 'FDMSNO' then
      begin
        G_nFPUserIDLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
      end else if FindField('CO_CONFIGCODE').AsString = 'AUTOFCARD' then
      begin
        if FindField('CO_CONFIGVALUE').AsString = 'Y' then G_bAutoFdmsCardNo := True;
      end;

      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure TfmMain.mn_InOutReportClick(Sender: TObject);
begin
  MDIChildShow('TfmInOutReport');
end;

procedure TfmMain.mn_KTCardClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
{  GetProgramGrade(mn_KTCardCreate.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmKTCardCreate');
  fmKTCardCreate:= TfmKTCardCreate.Create(Self);
  fmKTCardCreate.Caption := mn_KTCardCreate.Caption;
  fmKTCardCreate.IsInsertGrade := bInsertGrade;
  fmKTCardCreate.IsUpdateGrade := bUpdateGrade;
  fmKTCardCreate.IsDeleteGrade := bDeleteGrade;
  fmKTCardCreate.SHowmodal;
  fmKTCardCreate.Free; }

end;

procedure TfmMain.mn_EmpTypeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmEmType := TfmEmType.Create(Self);
  Try
    fmEmType.Caption := mn_EmpType.Caption;
    fmEmType.IsInsertGrade := bInsertGrade;
    fmEmType.IsUpdateGrade := bUpdateGrade;
    fmEmType.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmEmType.SHowmodal;
  Finally
    fmEmType.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.SetGroupMonitoring(const Value: Boolean);
begin
(*  FGroupMonitoring := Value;
  btn_CurrentState.Enabled := value;
  mn_CurrentState.Enabled := value;

  if Value then
  begin
    StateCheckTimer.Enabled := True;
    LiveTimer.Enabled := True;
  end else LiveTimer.Enabled := False;
  if G_nMonitorSockType = 1 then
  begin
    DBSocketReceiveTimer.Enabled := Value;
    L_nOldDBSocketSeq := 0;
  end;
*)
end;

procedure TfmMain.Action_GroupMonitoringExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
(*  GetProgramGrade(Action_GroupMonitoring.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmGroupMonitoring',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmGroupMonitoring').FindCommand('GRADEREFRESH').Execute;
*)
end;

procedure TfmMain.CommandArrayCommandsTGroupMonitoringExecute(
  Command: TCommand; Params: TStringList);
var
  stGroupMonitor : string;
begin
  stGroupMonitor := Params.Values['VALUE'];

  if stGroupMonitor = 'TRUE' then GroupMonitoring := True
  else GroupMonitoring := False;

end;

procedure TfmMain.StaticText2Click(Sender: TObject);
begin
  MessageTimer.Enabled := False;
  pan_Message.Visible := False;
end;

procedure TfmMain.MessageTimerTimer(Sender: TObject);
begin

  if G_bApplicationTerminate then Exit;
  pan_Message.Visible := Not pan_Message.Visible;
{  if GetTickCount > G_dtFireMessageTime then
  begin
    MessageTimer.Enabled := false;
    pan_Message.Visible := False;
  end; }
end;

procedure TfmMain.MonitorStart;
begin
  if G_nMonitorGubun = 0 then
  begin
    Action_MonitoringExecute(self);
  end else if G_nMonitorGubun = 1 then  //그룹모니터링
  begin
//    Action_GroupMonitoringExecute(self);
  end else if G_nMonitorGubun = 2 then  // KT타입 모니터링
  begin
    Action_KTTypeMonitoringExecute(self);
  end else if G_nMonitorGubun = 3 then  // 알람타입 모니터링
  begin
    if IsMaster or (BuildingGrade = 0) then
      Action_AlarmTypeMonitoringExecute(self)  //마스터 권한인경우만 로딩 하도록 처리 함
    else Action_MonitoringExecute(self);
  end else if G_nMonitorGubun = 4 then  // 출입타입 모니터링
  begin
    if IsMaster or (BuildingGrade = 0)  then
      Action_AccessTypeMonitoringExecute(self)  //마스터 권한인경우만 로딩 하도록 처리 함
    else Action_MonitoringExecute(self);
  end else if G_nMonitorGubun = 5 then  // 빌딩출입타입 모니터링
  begin
    if IsMaster or (BuildingGrade = 0)  then
      Action_BuildingAccessTypeMonitoringExecute(self)  //마스터 권한인경우만 로딩 하도록 처리 함
    else Action_MonitoringExecute(self);
  end else if G_nMonitorGubun = 6 then  // 알람맵타입 모니터링
  begin
    if IsMaster or (BuildingGrade = 0)  then
      Action_AlarmMapMonitoringExecute(self)  //마스터 권한인경우만 로딩 하도록 처리 함
    else Action_MonitoringExecute(self);
  end else if G_nMonitorGubun = 7 then  // 출입맵타입 모니터링
  begin
    if IsMaster or (BuildingGrade = 0)  then
      Action_AccessMapMonitoringExecute(self)  //마스터 권한인경우만 로딩 하도록 처리 함
    else Action_MonitoringExecute(self);
  end;
end;

procedure TfmMain.N20Click(Sender: TObject);
begin
  MonitorStart;
end;

procedure TfmMain.btnMonitorClick(Sender: TObject);
begin
  MonitorStart;
end;

procedure TfmMain.N28Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
  bDeviceUpdate : Boolean;
begin
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then     //출입문별 권한을 가진 사람은 기기관련 권한을 부여 하지 말자.
    begin
      showmessage('방범구역 관리 권한이 없습니다.');
      Exit;
    end
  end;

  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmAlaramDeviceAdmin:= TfmAlaramDeviceAdmin.Create(Self);
  Try
    fmAlaramDeviceAdmin.IsInsertGrade := bInsertGrade;
    fmAlaramDeviceAdmin.IsUpdateGrade := bUpdateGrade;
    fmAlaramDeviceAdmin.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmAlaramDeviceAdmin.SHowmodal;
    bDeviceUpdate := fmAlaramDeviceAdmin.L_bDeviceUpdate;
  Finally
    fmAlaramDeviceAdmin.Free;
    L_bShowModalVisible := False;
  End;
//  if bDeviceUpdate then DaemonRestart;

end;

procedure TfmMain.DaemonRestart;
begin
  SendDaemonDataList.Add('DEAMONRESTART'+ DATADELIMITER + '0000000000000' + DATADELIMITER );
end;

procedure TfmMain.N29Click(Sender: TObject);
begin
  DaemonRestart;
end;

function TfmMain.LoadMultiServer: Boolean;
var
  aCommNode   : TdServerConnectModule;
  DaemonNo   : Integer;
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

    if ServerList = nil then ServerList := TStringList.Create;
    ServerList.Clear;
    stSql := ' select * from TB_DAEMONMULTI ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';

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
        DaemonNo:= FindField('DM_GUBUN').asInteger;
        IPStr:=  Trim(FindField('DM_SERVERIP').asString);
        if Not IsDigit(FindField('DM_SERVERPORT').asString) then nPort := 3001
        else nPort:= strtoint(FindField('DM_SERVERPORT').asString);
        Next;

        aCommNode:= TdServerConnectModule.Create(Self);
        aCommNode.No:= DaemonNo;
        aCommNode.WsAddress:=           IPStr;
        aCommNode.wsPort:=              inttostr(nPort);
        aCommNode.OnRcvData:=           CommNodeReceve;
        aCommNode.OnSendData :=         CommNodeSend;
        aCommNode.OnConnected :=        ServerConnected;
        if Trim(IPStr) <> '' then
        begin
          ServerList.AddObject(InttoStr(DaemonNo),aCommNode);
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

procedure TfmMain.CommNodeReceve(Sender: TObject; ReceiveData: string;
  DaemonNO: integer);
begin
  MonitoringDataProcess(ReceiveData,DaemonNO);
end;

procedure TfmMain.MonitoringDataProcess(aData: string;aDaemonNo:integer=0);
var
  fmMonitor :TForm;
  fmGroupMonitor :TForm;
  fmDoorTypeMonitoring :TForm;
  fmKTTypeMonitoring :TForm;
  fmAlarmTypeMonitoring :TForm;
  fmAccessTypeMonitoring :TForm;
  fmBuildingAccessTypeMonitoring :TForm;
  stTemp : string;
  stSendData : string;
begin
  Try
    FDataProcessTCS.Enter;
    if G_bApplicationTerminate then Exit;
    DaemonReceiveDataProcess(aData,self);  

    if G_bFormEnabled[con_ComMonitoring] then   //통신상태 확인 중이면
    begin
      self.FindClassForm('TfmComMonitoring').FindCommand('Message').Params.Values['RXTX'] := 'RX';
      self.FindClassForm('TfmComMonitoring').FindCommand('Message').Params.Values['Data'] := aData;
      self.FindClassForm('TfmComMonitoring').FindCommand('Message').Execute;
    end;

    Try
      {//여기에서 데이터 뿌려줌
      if G_bFormEnabled[con_Monitoring] then
      begin
        if aData[1] = 'R' then     //기기에서 올라온 데이터 이면
        begin
          //Memo1.Lines.Insert(0,aData);
          if G_nMultiDaemon = 0 then
          begin
            fmMonitor := MDIForm('TfmMonitoring');
          end else if G_nMultiDaemon = 1 then
          begin
            fmMonitor := MDIForm('TfmMultiMonitoring');
          end;
          if fmMonitor <> nil then
          begin
            if G_nMultiDaemon = 0 then
              TfmMonitoring(fmMonitor).ShowMessage(aData)
            else if G_nMultiDaemon = 1 then
              TfmMultiMonitoring(fmMonitor).ShowMessage(aData,aDaemonNo);
          end;
   //       self.FindClassForm('TfmMonitoring').FindCommand('Message').Params.Values['Data'] := aData;
   //       self.FindClassForm('TfmMonitoring').FindCommand('Message').Execute;
        end;
      end; }
(*      if GroupMonitoring then
      begin
        if aData[1] = 'R' then     //기기에서 올라온 데이터 이면
        begin
          //Memo1.Lines.Insert(0,aData);
          fmGroupMonitor := MDIForm('TfmGroupMonitoring');
          if fmGroupMonitor <> nil then
          begin
            TfmGroupMonitoring(fmGroupMonitor).ShowMessage(aData);
          end;
        end;
      end; *)
      if G_bFormEnabled[con_DoorTypeMonitor] then
      begin
        if aData[1] = 'R' then     //기기에서 올라온 데이터 이면
        begin
          //Memo1.Lines.Insert(0,aData);
          fmDoorTypeMonitoring := MDIForm('TfmDoorTypeMonitoring');
          if fmDoorTypeMonitoring <> nil then
          begin
            TfmDoorTypeMonitoring(fmDoorTypeMonitoring).ShowMessage(aData);
          end;
        end;
      end;
      {
      if G_bFormEnabled[con_KTTypeMonitoring] then
      begin
        if aData[1] = 'R' then     //기기에서 올라온 데이터 이면
        begin
          //Memo1.Lines.Insert(0,aData);
          fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
          if fmKTTypeMonitoring <> nil then
          begin
            TfmKTTypeMonitoring(fmKTTypeMonitoring).ShowMessage(aData);
          end;
        end;
      end;
      }
      if FTPDownLoadShow then
      begin
        if aData[14] = 'F' then
          fmFTPDownLoad.ShowMessage(aData);
      end;

    Except
      //
    End;
    DeviceRcvRegCardData(aData);  //카드등록응답데이터 처리

    if Length(aData) < 34 then Exit;

    if aData[17 + 17] = 'A' then    //실제 알람데이터
    begin
      stTemp := copy(aData,17 + 41,2); //17 서버에서 붙여서 넘어온 데이터값
      if stTemp = G_stFireState then //화재 발생시
      begin
        if G_bFireMessageView then
        begin
          G_dtFireMessageTime := GetTickCount + (G_nFireTime * 1000);
          st_Message.Caption := '화재 발생 !!!';
          MessageTimer.Enabled := True;
          if G_bFormEnabled[con_Monitoring] then
          begin
            self.FindClassForm('TfmMonitoring').FindCommand('AlarmMode').Params.Values['Data'] := 'FIRE';
            self.FindClassForm('TfmMonitoring').FindCommand('AlarmMode').Execute;
          end;
        end;
      end;
    end;  
  Finally
    FDataProcessTCS.Leave;
  End;
end;

procedure TfmMain.CommNodeSend(Sender: TObject; SendData: string;
  DaemonNO: integer);
begin

end;

procedure TfmMain.ServerConnected(Sender: TObject; aConnected: Boolean;
  DaemonNO,aConnectedNo: integer);
var
  stState : string;
begin
  if aConnected then  stState := 'CONNECTED'
  else stState := 'DISCONNECTED';
  if G_bFormEnabled[con_Monitoring] then
  begin
(*    if G_nMultiDaemon = 1 then
    begin
      self.FindClassForm('TfmMultiMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmMultiMonitoring').FindCommand('STATE').Params.Values['VALUE'] := stState;
      self.FindClassForm('TfmMultiMonitoring').FindCommand('STATE').Params.Values['ID'] := FillZeroNumber(DaemonNO,5);
      self.FindClassForm('TfmMultiMonitoring').FindCommand('STATE').Execute;
    end;
*)
//    Action_StateSearchExecute(Sender);
    //여기서 상태확인 하자.
  end;
  SendDaemonTimer.Enabled := True;

end;

function TfmMain.LoadMultiDevice: Boolean;
var
  stSql : String;
  DaemonNo,OldDaemonNo    : Integer;
  aCommNode   : TdServerConnectModule;
  stDeviceStr : string;
  aDevice     : TDevice;
  TempAdoQuery : TADOQuery;

begin
  Result := False;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    DeviceList.Clear;
    stSql := ' select a.*,b.AC_DAEMONGUBUN as DaemonNo from TB_ACCESSDEVICE a ';
    stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND b.AC_GUBUN = ''0'' ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND a.AC_NETTYPE = ''' + NETTYPE + ''' ';
    stSql := stSql + ' order by b.AC_DAEMONGUBUN,a.AC_NODENO,a.AC_ECUID ';

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
      OldDaemonNo:= 0;
      First;
      while not eof do
      begin
        DaemonNo:= FindField('DaemonNo').asInteger;
        if OldDaemonNo <> DaemonNo then
        begin
          aCommnode:= FindCommServer(DaemonNo);
        end;
        stDeviceStr := FillzeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').asString;
        aDevice:= TDevice.Create(Self);
        aDevice.DaemonNo := DaemonNo;
        aDevice.NodeNo := FindField('AC_NODENO').AsInteger;
        aDevice.EcuID := FindField('AC_ECUID').asString;

        if aCommnode <> nil then
        begin
          aDevice.CommServer            := aCommnode;
          DeviceList.AddObject( stDeviceStr,aDevice);
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

function TfmMain.FindCommServer(aDaemonNo: Integer): TdServerConnectModule;
var
  Index: Integer;
begin
  Result:= nil;
  Index:= ServerList.IndexOf(inttostr(aDaemonNo));
  if Index > -1 then
    Result:= TdServerConnectModule(ServerList.Objects[Index]);

end;

procedure TfmMain.CommandArrayCommandsTMulitServerSendExecute(
  Command: TCommand; Params: TStringList);
var
  stDaemonGubun : string;
  stNodeNo : string;
  stECUID : string;
  stDoorID : string;
  stCmd : string;
  stData : string;
  i : integer;
  nIndex : integer;
  bQuick : Boolean;
begin
  stDaemonGubun := Params.Values['DAEMON'];
  stNodeNo := Params.Values['NODENO'];
  stECUID := Params.Values['ECUID'];
  stDoorID := Params.Values['DOORID'];
  stCmd := Params.Values['COMMAND'];
  stData := Params.Values['DATA'];
  if UpperCase(Params.Values['QUICK']) = 'TRUE' then bQuick := True
  else bQuick := False;
  if Not isDigit(stDaemonGubun) then Exit;
  if Not isDigit(stNodeNo) then Exit;

  if strtoint(stDaemonGubun) = 0 then  //전체 서버에 권한 전송
  begin
    for i:=0 to ServerList.Count - 1 do
    begin
      if TdServerConnectModule(ServerList.Objects[i]).SocketConnected then
      begin
        TdServerConnectModule(ServerList.Objects[i]).SendPacket(strtoint(stNodeNo),stECUID,stDoorID,stCmd,stData,bQuick);
      end;
    end;
    Exit;
  end;
  nIndex := ServerList.IndexOf(inttostr(strtoint(stDaemonGubun)));
  if nIndex < 0 then Exit;
  if TdServerConnectModule(ServerList.Objects[nIndex]).SocketConnected then
  begin
    TdServerConnectModule(ServerList.Objects[nIndex]).SendPacket(strtoint(stNodeNo),stECUID,stDoorID,stCmd,stData,bQuick);
  end;

end;

procedure TfmMain.CommandArrayCommandsTSERVERSTATEExecute(
  Command: TCommand; Params: TStringList);
var
  i : integer;
  stState : string;
  DaemonNo : integer;
begin
  for i := 0 to ServerList.Count - 1 do
  begin
    if TdServerConnectModule(ServerList.Objects[i]).SocketConnected then stState := 'CONNECTED'
    else stState := 'DISCONNECTED';
    DaemonNo := TdServerConnectModule(ServerList.Objects[i]).No;
    
    if G_bFormEnabled[con_Monitoring] then
    begin
(*      if G_nMultiDaemon = 1 then
      begin
        self.FindClassForm('TfmMultiMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
        self.FindClassForm('TfmMultiMonitoring').FindCommand('STATE').Params.Values['VALUE'] := stState;
        self.FindClassForm('TfmMultiMonitoring').FindCommand('STATE').Params.Values['ID'] := FillZeroNumber(DaemonNO,5);
        self.FindClassForm('TfmMultiMonitoring').FindCommand('STATE').Execute;
      end;
      *)
    end;

  end;
end;

procedure TfmMain.N32Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TDoorscheduleRegForm');
  self.FindClassForm('TDoorscheduleRegForm').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.N34Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
  bDeviceUpdate : Boolean;
  stSendData : string;
begin
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then     //출입문별 권한을 가진 사람은 기기관련 권한을 부여 하지 말자.
    begin
      showmessage('출입문 관리 권한이 없습니다.');     
      Exit;
    end
  end;

  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmDoorAdmin:= TfmDoorAdmin.Create(Self);
  Try
    fmDoorAdmin.IsInsertGrade := bInsertGrade;
    fmDoorAdmin.IsUpdateGrade := bUpdateGrade;
    fmDoorAdmin.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmDoorAdmin.SHowmodal;
    bDeviceUpdate := fmDoorAdmin.L_bDeviceUpdate;
  Finally
    fmDoorAdmin.Free;
    L_bShowModalVisible := False;
  End;
  stSendData := 'SCHEDULETIMER'+ DATADELIMITER + '000000000000' + DATADELIMITER + 'N' + DATADELIMITER;
  SendDaemonDataList.Add(stSendData);
  SendDaemonTimer.Enabled := True;

end;

procedure TfmMain.N27Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmDoorGubunCode:= TfmDoorGubunCode.Create(Self);
  Try
    fmDoorGubunCode.IsInsertGrade := bInsertGrade;
    fmDoorGubunCode.IsUpdateGrade := bUpdateGrade;
    fmDoorGubunCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmDoorGubunCode.SHowmodal;
  Finally
    fmDoorGubunCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.N35Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmPersonStateReport');
  self.FindClassForm('TfmPersonStateReport').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.ReleaySamyukCheck;
var
  stSql : string;
  stMessage : string;
begin
  if Not dmAdoRelay.ADOConnection.Connected then
  begin
    if Not dmAdoRelay.AdoRelayConnected(inttostr(G_nRelayDataBaseType), G_stRelayServerIP, G_stRelayServerPort,
                      G_stRelayUserID, G_stRelayUserPW, G_stRelayDataBaseName) then Exit;
  end;

  stSql := ' Select chto_bdcd,count(*) as cnt ';
  stSql := stSql + ' From UMCS_CHTO ';
  stSql := stSql + ' Where chto_reis = ''N'' ';
  stSql := stSql + ' Group by chto_bdcd ';

  With dmAdoRelay.ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    stMessage := '';
    if recordCount > 0 then
    begin
      While Not Eof do
      begin
        if FindField('chto_bdcd').AsString = '01' then
          stMessage := stMessage + '시온관:' + FindField('cnt').AsString + ' 건' + #10 + #13
        else if FindField('chto_bdcd').AsString = '02' then
          stMessage := stMessage + '에덴관:' + FindField('cnt').AsString + ' 건' + #10 + #13
        else if FindField('chto_bdcd').AsString = '03' then
          stMessage := stMessage + '살렘관:' + FindField('cnt').AsString + ' 건' + #10 + #13
        else
          stMessage := stMessage + FindField('chto_bdcd').AsString + ':' + FindField('cnt').AsString + ' 건' + #10 + #13;
        Next;
      end;
      stMessage := stMessage + '의 신규 데이터가 있습니다. 연동화면으로 바로 가시겠습니까?';
    end;
    if stMessage <> '' then
    begin
      if (Application.MessageBox(PChar(stMessage),'정보',MB_OKCANCEL) = IDOK)  then
      begin
        mn_RelaySamyukEmployClick(mn_RelaySamyukEmploy);
      end;
    end;
  end;

end;

procedure TfmMain.ReleayKyngHeeCheck;
begin
  if Not dmAdoRelay.ADOConnection.Connected then
  begin
    if Not dmAdoRelay.AdoRelayConnected(inttostr(G_nRelayDataBaseType), G_stRelayServerIP, G_stRelayServerPort,
                      G_stRelayUserID, G_stRelayUserPW, G_stRelayDataBaseName) then Exit;
  end;
  if Not dmAdoRelay.ADOConnection2.Connected then
  begin
    if Not dmAdoRelay.AdoRelayConnected2(inttostr(G_nRelayDataBaseType2), G_stRelayServerIP2, G_stRelayServerPort2,
                      G_stRelayUserID2, G_stRelayUserPW2, G_stRelayDataBaseName2) then Exit;
  end;
  if CheckTRN_MEMBERS_FOR_TELECOP then   //경희대 인적사항 변경 내역 처리 함
  begin
  end;
  if CheckTBL_CARDINFO then
  begin
  end;    
end;
{
function TfmMain.CheckTBL_CARD: Boolean;
var
  stSql : string;
  stMessage : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  nErrCount : integer;
  stVarCompanyCode,stVarEmCode : string;
begin
  stCompanyCode := '001';
  stJijumCode := '000';
  stDepartCode := '000';
  nErrCount := 0;

  result := False;

  stSql := 'select * from TBL_CARD ';
  if Trim(G_stRelayKHUAddDate) <> '' then
    stSql := stSql + ' Where WRKDT > ''' + G_stRelayKHUAddDate + ''' ';
  stSql := stSql + ' order by WRKDT ';

  With dmAdoRelay.ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    if recordCount < 1 then Exit;

    stMessage := inttostr(recordCount) + '의 신규 데이터가 있습니다. 데이터를 추가하시겠습니까?';

    if (Application.MessageBox(PChar(stMessage),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;

    While Not Eof do
    begin
      if CheckTB_Employee(stCompanyCode,FindField('CARD_ID').AsString) then
      begin
        if Not UpdateTB_EMPLOYEEBasic(FindField('CARD_ID').AsString, stCompanyCode, stJijumCode,
                stDepartCode, '000', FindField('CARD_NAME').AsString, '', '', '',
                '', '', '', '', '99991231') then
        begin
          inc(nErrCount);
        end;
      end else
      begin
        if Not InsertTB_EMPLOYEEBasic(FindField('CARD_ID').AsString, stCompanyCode, stJijumCode,
            stDepartCode, '000', FindField('CARD_NAME').AsString, '', '', '',
            '', '', '', '', '99991231') then
        begin
          inc(nErrCount);
        end;
      end;

      if CheckTB_CARD(FindField('CARD_DATA').AsString,stVarCompanyCode,stVarEmCode) then
      begin
        if Not UpdateTB_CARD(FindField('CARD_DATA').AsString,'1','1',FindField('CARD_ID').AsString,stCompanyCode) then
        begin
          inc(nErrCount);
        end;
      end else
      begin
        if Not InsertTB_CARD(FindField('CARD_DATA').AsString,'1','1',FindField('CARD_ID').AsString,stCompanyCode) then
        begin
          inc(nErrCount);
        end;
      end;
      G_stRelayKHUAddDate := FindField('WRKDT').AsString;
      Application.ProcessMessages;
      Next;
    end;
  end;

  if nErrCount > 0 then
  begin
    showmessage(inttostr(nErrCount) + '건의 입력 오류가 발생 했습니다.');
  end;

  stSql := CommonSql.UpdateTB_CONFIG('RELAY','KHUADDDAY',G_stRelayKHUAddDate);
  DataModule1.ProcessExecSQL(stSql);

end;   }
{
function TfmMain.CheckTBL_CARDDEL: Boolean;
var
  stSql : string;
  stMessage : string;
  stCompanyCode : string;
  stEmCode : string;
begin
  stCompanyCode := '001';
  result := False;
  stSql := 'Update TBL_CARD_DEL set ACRELAY = ''R'' ';
  stSql := stSql + ' where ACRELAY IS NULL ';
  stSql := stSql + ' OR ACRELAY <> ''Y'' ';

  dmAdoRelay.ProcessExecSQL(stSql);


  stSql := 'select * from TBL_CARD_DEL  where ACRELAY = ''R'' ';
{  if Trim(G_stRelayKHUDelDate) <> '' then
    stSql := stSql + ' Where INS_DT > ''' + G_stRelayKHUDelDate + ''' ';
  stSql := stSql + ' Order by INS_DT';  //

  With dmAdoRelay.ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    if recordCount < 1 then Exit;

    stMessage := inttostr(recordCount) + '의 삭제 데이터가 있습니다. 데이터를 삭제하시겠습니까?';

    if (Application.MessageBox(PChar(stMessage),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;

    While Not Eof do
    begin
      if CheckTB_CARD(FindField('CARD_DATA').AsString,stCompanyCode,stEmCode) then
      begin
        DeleteTB_CARD(FindField('CARD_DATA').AsString);
      end;
      if stEmCode <> '' then
      begin
        if Not CheckTB_CARDEmCode(stCompanyCode,stEmCode) then  //카드 데이터 중에 사번 정보가 없으면 사번 삭제
        begin
          DeleteTB_Employee(stCompanyCode,stEmCode);
        end;
      end;
      UpdateTB_DEVICECARDNO(FindField('CARD_DATA').AsString,'N');
      Application.ProcessMessages;
      Next;
      G_stRelayKHUDelDate := FindField('INS_DT').AsString;
    end;


  end;
  stSql := CommonSql.UpdateTB_CONFIG('RELAY','KHUDELDAY',G_stRelayKHUDelDate);
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TBL_CARD_DEL set ACRELAY = ''Y'' ';
  stSql := stSql + ' where ACRELAY = ''R'' ';

  dmAdoRelay.ProcessExecSQL(stSql);

end;    }

function TfmMain.InsertTB_EMPLOYEEBasic(aEmpID, aCompanyCode, aJijumCode,
  aDepartCode, aPosiCode, aEmpNM, aCompanyPhone, aHomePhone, aHandphone,
  aZipcode, aAddr1, aAddr2, aJoinDate, aRetireDate: string): Boolean;
var
  stSql : string;
  aFdmsID : string;
begin
  aFdmsID := CommonModule.GetNextFdmsID;//GetFdmsID;
  stSql := 'Insert Into TB_EMPLOYEE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  if Trim(aJijumCode) <> '' then
    stSql := stSql + 'CO_JIJUMCODE,';
  if Trim(aDepartCode) <> '' then
    stSql := stSql + 'CO_DEPARTCODE,';
  if Trim(aPosiCode) <> '' then
    stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  if Trim(aCompanyPhone) <> '' then
    stSql := stSql + 'EM_COPHONE,';
  if Trim(aHomePhone) <> '' then
    stSql := stSql + 'EM_HOMEPHONE,';
  if Trim(aHandphone) <> '' then
    stSql := stSql + 'EM_HANDPHONE,';
  if Trim(aZipcode) <> '' then
    stSql := stSql + 'ZI_ZIPCODE,';
  if Trim(aAddr1) <> '' then
    stSql := stSql + 'EM_ADDR1,';
  if Trim(aAddr2) <> '' then
    stSql := stSql + 'EM_ADDR2,';
  if Trim(aJoinDate) <> '' then
    stSql := stSql + 'EM_JOINDATE,';
  if Trim(aRetireDate) <> '' then
    stSql := stSql + 'EM_RETIREDATE,';
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'AT_ATCODE,';
  stSql := stSql + 'EM_UPDATETIME,';
  stSql := stSql + 'EM_UPDATEOPERATOR ) ';
  stSql := stSql + 'VALUES ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  if Trim(aJijumCode) <> '' then
    stSql := stSql + '''' + aJijumCode + ''',';
  if Trim(aDepartCode) <> '' then
    stSql := stSql + '''' + aDepartCode + ''',';
  if Trim(aPosiCode) <> '' then
    stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aEmpNM + ''',';
  if Trim(aCompanyPhone) <> '' then
    stSql := stSql + '''' + aCompanyPhone + ''',';
  if Trim(aHomePhone) <> '' then
    stSql := stSql + '''' + aHomePhone + ''',';
  if Trim(aHandphone) <> '' then
    stSql := stSql + '''' + aHandphone + ''',';
  if Trim(aZipcode) <> '' then
    stSql := stSql + '''' + aZipcode + ''',';
  if Trim(aAddr1) <> '' then
    stSql := stSql + '''' + aAddr1 + ''',';
  if Trim(aAddr2) <> '' then
    stSql := stSql + '''' + aAddr2 + ''',';
  if Trim(aJoinDate) <> '' then
    stSql := stSql + '''' + aJoinDate + ''',';
  if Trim(aRetireDate) <> '' then
    stSql := stSql + '''' + aRetireDate + ''',';
  stSql := stSql + '''' + aFdmsID + ''',';
  stSql := stSql + '''001'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''' )';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_EMPLOYEEBasic(aEmpID, aCompanyCode, aJijumCode,
  aDepartCode, aPosiCode, aEmpNM, aCompanyPhone, aHomePhone, aHandphone,
  aZipcode, aAddr1, aAddr2, aJoinDate, aRetireDate: string): Boolean;
var
  stSql : string;
  stCompanyName : string;
  stJijumName : string;
  stDepartName : string;
  stPosiName : string;
  stFdmsID : string;
begin
  stSql := 'Update TB_EMPLOYEE set ';
  if Trim(aJijumCode) <> '' then
    stSql := stSql + 'CO_JIJUMCODE = ''' + aJijumCode + ''',';
  if Trim(aDepartCode) <> '' then
    stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  if Trim(aPosiCode) <> '' then
    stSql := stSql + 'PO_POSICODE = ''' + aPosiCode + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmpNM + ''',';
  if Trim(aCompanyPhone) <> '' then
    stSql := stSql + 'EM_COPHONE = ''' + aCompanyPhone + ''',';
  if Trim(aHomePhone) <> '' then
    stSql := stSql + 'EM_HOMEPHONE = ''' + aHomePhone + ''',';
  if Trim(aHandphone) <> '' then
    stSql := stSql + 'EM_HANDPHONE = ''' + aHandphone + ''',';
  if Trim(aZipcode) <> '' then
    stSql := stSql + 'ZI_ZIPCODE = ''' + aZipcode + ''',';
  if Trim(aAddr1) <> '' then
    stSql := stSql + 'EM_ADDR1 = ''' + aAddr1 + ''',';
  if Trim(aAddr2) <> '' then
    stSql := stSql + 'EM_ADDR2 = ''' + aAddr2 + ''',';
  if Trim(aJoinDate) <> '' then
    stSql := stSql + 'EM_JOINDATE = ''' + aJoinDate + ''',';
  if Trim(aRetireDate) <> '' then
    stSql := stSql + 'EM_RETIREDATE = ''' + aRetireDate + ''',';
  stSql := stSql + 'EM_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'EM_UPDATEOPERATOR = ''' + Master_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql,True);

{  stCompanyName := DataModule1.GetCompanyName(aCompanyCode);
  stJijumName := DataModule1.GetJijumName(aCompanyCode,aJijumCode);
  stDepartName := DataModule1.GetDepartName(aCompanyCode,aJijumCode,aDepartCode);
  stPosiName := DataModule1.GetPosiName(aCompanyCode,aPosiCode);
  stFdmsID := DataModule1.GetFdmsID(aCompanyCode,aEmpID);

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,aFdmsID,'2',aCardNo,aRegGubun,
           aEmpNM,aHandphone,stCompanyName,stJijumName,stDepartName,stPosiName);//수정
  result := DataModule1.ProcessExecSQL(stSql);  }

end;

function TfmMain.CheckTB_Employee(aCompanyCode, aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmcode + ''' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.CheckTB_CARD(aCardNo: string;var aCompanyCode,aEmCode : string): Boolean;
var
  stSql : string;
begin
  result := False;
  aCompanyCode := '000';
  aEmCode := '';
  stSql := 'Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  with DataModule1.ADOTmpQuery do
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
    result := True;
  end;
end;

function TfmMain.InsertTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  result := False;
  if Length(aCardNo) = 0 then Exit;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  nPositionNum := GetMaxPositionNum;

  stSql := 'Insert Into TB_CARD(GROUP_CODE,CA_CARDNO,CA_GUBUN,CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,CO_COMPANYCODE,CA_UPDATETIME,POSITIONNUM,CA_UPDATEOPERATOR) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' +  GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',' ;
  stSql := stSql + '''' + aCardGubun + ''',' ;
  stSql := stSql + '''' + aCardType + ''',' ;
  stSql := stSql + '''' + aEmpID + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + inttostr(nPositionNum) + ',' ;
  stSql := stSql + '''' + MASTER_ID + ''')' ;

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ';
  if Trim(aCardGubun) <> '' then
    stSql := stSql + 'CA_GUBUN = ''' + aCardGubun + ''',';
  if Trim(aCardType) <> '' then
    stSql := stSql + 'CA_CARDTYPE = ''' + aCardType + ''',';
  if Trim(aEmpID) <> '' then
    stSql := stSql + 'EM_CODE = ''' + aEmpID + ''',';
  if Trim(aCompanyCode) <> '' then
    stSql := stSql + 'CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + 'CA_MEMLOAD = ''N'',';
  stSql := stSql + 'CA_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'CA_UPDATEOPERATOR = ''' + MASTER_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' +  GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ' ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      if Not IsDigit(FindField('MaxPosition').AsString) then
      begin
        Exit;
      end;
      result := FindField('MaxPosition').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.UpdateTB_DEVICECARDNO(aCardNo, aPermit: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_PERMIT = ''' + aPermit + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.mn_EmployeeBranchClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmEmployeeBranch:= TfmEmployeeBranch.Create(Self);
  Try
    fmEmployeeBranch.Caption := mn_EmployeeBranch.Caption;
    fmEmployeeBranch.IsInsertGrade := bInsertGrade;
    fmEmployeeBranch.IsUpdateGrade := bUpdateGrade;
    fmEmployeeBranch.IsDeleteGrade := bDeleteGrade;
    fmEmployeeBranch.SHowmodal;
  Finally
    fmEmployeeBranch.Free;
  End;
end;

procedure TfmMain.Action_DoorTypeMonitoringExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_DoorTypeMonitoring.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDoorTypeMonitoring',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('GRADEREFRESH').Execute;

end;


procedure TfmMain.Action_KTTypeMonitoringExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_KTTypeMonitoring.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmKTTypeMonitoring',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmKTTypeMonitoring').FindCommand('GRADEREFRESH').Execute;

end;

function TfmMain.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' +  GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ' ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.CheckTB_CARDEmCode(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.DeleteTB_Employee(aCompanyCode, aEmCode: string): Boolean;
var
  stSql : string;
  stFdmsId : string;
begin
  stFdmsId := GetEmployeeFdmsID(aCompanyCode,aEmCode);
  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,stFdmsId,'3','','2',
           '','','','','','');//삭제
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := 'Delete From TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmCode,'','Main','3');
  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMain.mn_KHUEmployeeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_Employ.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmKHUEmployee:= TfmKHUEmployee.Create(Self);
  fmKHUEmployee.IsInsertGrade := bInsertGrade;
  fmKHUEmployee.IsUpdateGrade := bUpdateGrade;
  fmKHUEmployee.IsDeleteGrade := bDeleteGrade;
  fmKHUEmployee.SHowmodal;
  fmKHUEmployee.Free;

end;

procedure TfmMain.mn_KHUEmpInitialClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_Employ.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmKHUEmpInitialize:= TfmKHUEmpInitialize.Create(Self);
  fmKHUEmpInitialize.IsInsertGrade := bInsertGrade;
  fmKHUEmpInitialize.IsUpdateGrade := bUpdateGrade;
  fmKHUEmpInitialize.IsDeleteGrade := bDeleteGrade;
  fmKHUEmpInitialize.SHowmodal;
  fmKHUEmpInitialize.Free;

end;

function TfmMain.CheckTRN_MEMBERS_FOR_TELECOP: Boolean;
var
  stSql : string;
  stMessage : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  nErrCount : integer;
  stVarCompanyCode,stVarEmCode : string;
begin
  stCompanyCode := '001';
  stJijumCode := '000';
  stDepartCode := '000';
  nErrCount := 0;

  result := False;

  stSql := 'select * from TRN_MEMBERS_FOR_TELECOP ';
  if Trim(G_stRelayKHUAddDate) <> '' then
    stSql := stSql + ' Where UPDATE_DATE > ''' + G_stRelayKHUAddDate + ''' ';
  stSql := stSql + ' order by UPDATE_DATE ASC ';

  With dmAdoRelay.ADOQuery2 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    if recordCount < 1 then Exit;

    stMessage := inttostr(recordCount) + '의 변경 데이터가 있습니다. 데이터를 처리하시겠습니까?';

    if (Application.MessageBox(PChar(stMessage),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;

    While Not Eof do
    begin
      if (FindField('ING_STAT').AsString = '0') or (FindField('ING_STAT').AsString = '1') then
      begin   //정상이거나 휴학이면
        if Trim(FindField('CAMP_ID').AsString) = '2' then  //수원캠퍼스만 업로드하자
        begin
          if CheckTB_Employee(stCompanyCode,FindField('ID_NUM').AsString) then
          begin
            if Not UpdateTB_EMPLOYEEBasic(FindField('ID_NUM').AsString, stCompanyCode, '',
                    '', '', FindField('NAME_KOR').AsString, '', '', '',
                    '', '', '', '', '99991231') then
            begin
              //inc(nErrCount);
            end;
          end else
          begin
            if Not InsertTB_EMPLOYEEBasic(FindField('ID_NUM').AsString, stCompanyCode, stJijumCode,
                stDepartCode, '000', FindField('NAME_KOR').AsString, '', '', '',
                '', '', '', '', '99991231') then
            begin
              inc(nErrCount);
            end;
          end;
        end;
      end else
      begin
        DeleteTB_CARDEMPLOYEE(stCompanyCode,FindField('ID_NUM').AsString); //카드 삭제 및 권한 삭제
        DeleteTB_EMPLOYEE(stCompanyCode,FindField('ID_NUM').AsString); //사원 정보 삭제
      end;

      G_stRelayKHUAddDate := FindField('UPDATE_DATE').AsString;
      Application.ProcessMessages;
      Next;
    end;
  end;

  if nErrCount > 0 then
  begin
    //showmessage(inttostr(nErrCount) + '건의 입력 오류가 발생 했습니다.');
  end;

  stSql := CommonSql.UpdateTB_CONFIG('RELAY','KHUADDDAY',G_stRelayKHUAddDate);
  DataModule1.ProcessExecSQL(stSql);
  result := True;
end;

function TfmMain.DeleteTB_CARDEMPLOYEE(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;

  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmcode  + ''' ';

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
      result := True;
      if recordCount < 1 then Exit;
      While Not Eof do
      begin
        UpdateTB_DEVICECARDNO(FindField('CA_CARDNO').AsString,'N'); //권한 삭제 후
        DeleteTB_CARD(FindField('CA_CARDNO').AsString);             //카드 삭제
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.CheckTBL_CARDINFO: Boolean;
var
  stSql : string;
  stMessage : string;
  stCompanyCode : string;
  stVarCompanyCode : string;
  stVarEmCode : string;
  stJijumCode : string;
  stDepartCode : string;
  nErrCount : integer;
  stCardNo : string;
begin
  stCompanyCode := '001';
  stJijumCode := '000';
  stDepartCode := '000';
  nErrCount := 0;

  result := False;

  stSql := 'select * from VW_CARD_TELECOP ';
  stSql := stSql + ' Where WRTDATE > ''' + G_stRelayKHUCARDDate + ''' ';
  stSql := stSql + ' order by WRTDATE ASC ';

  With dmAdoRelay.ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    if recordCount < 1 then Exit;

    stMessage := inttostr(recordCount) + '의 카드 변경 데이터가 있습니다. 데이터를 처리하시겠습니까?';

    if (Application.MessageBox(PChar(stMessage),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;

    While Not Eof do
    begin
      if CheckTB_EMPLOYEE('001',Trim(FindField('IDNUM').AsString)) then    //있는 경우만 Insert 하자
      begin
        stCardNo := copy(Trim(FindField('CAMPUSID').AsString),1,1) +
                FillCharString(Trim(FindField('CARDID').AsString),'N',12) +
                FillCharString(Trim(FindField('ISSUNO').AsString),'N',2,True) +
                'N';
        if (FindField('cardflag').AsString <> '2') then //분실 카드가 아니면 인서트 하자
        begin
          if Not CheckTB_Card(stCardNo,stVarCompanyCode,stVarEmCode) then
          begin
            InsertTB_CARD(stCardNo, '1', '1', Trim(FindField('IDNUM').AsString),stCompanyCode);
          end else
          begin
            UpdateTB_CARD(stCardNo, '1', '1', Trim(FindField('IDNUM').AsString),stCompanyCode);
          end;
          //여기에서 연동 하자.
        end else
        begin
          UpdateTB_DEVICECARDNO(stCardNo,'N'); //권한 삭제 후
          DeleteTB_CARD(stCardNo);             //카드 삭제
        end;
      end;

      G_stRelayKHUCARDDate := FindField('WRTDATE').AsString;
      Application.ProcessMessages;
      Next;
    end;
  end;

  if nErrCount > 0 then
  begin
    showmessage(inttostr(nErrCount) + '건의 입력 오류가 발생 했습니다.');
  end;

  stSql := CommonSql.UpdateTB_CONFIG('RELAY','CARDADDDAY',G_stRelayKHUCARDDate);
  DataModule1.ProcessExecSQL(stSql);
  result := True;
end;


function TfmMain.GetEmployeeFdmsID(aCompanyCode, aEmpID: string): string;
var
  stSql : string;
  nFdms_id : integer;
  TempAdoQuery :TADOQuery;
begin
  result := '0';
  stSql := 'select fdms_id from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';

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
      Try
        nFdms_id := FindField('fdms_id').AsInteger;
        if nFdms_id = 0 then Exit;
      Except
        Exit;
      End;
      result := inttostr(nFdms_id);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.test1Click(Sender: TObject);
var
  stSql : string;
  nFdms_id : integer;
  TempAdoQuery :TADOQuery;
  stCardNo : string;
  i : integer;
  aAlarmStateList : TStringList;
  oAlarmState : TAlarmState;
  aAccessStateList : TStringList;
  oAccessState : TAccessState;
  stKey : string;
  stState : string;
  nAlarmTotCnt : integer;
  nAlarmErrcnt : integer;
  nIndex : integer;
  nAccessErrcnt : integer;
  nMainCnt : integer;
  nExtCnt : integer;
  stTemp : string;
begin
  for i := 0 to DeviceStateList.Count - 1 do
  begin
    if TDeviceState(DeviceStateList.Objects[i]) <> nil then
    begin
      stTemp := FillZeroNumber(TDeviceState(DeviceStateList.Objects[i]).NodeNo,3) + TDeviceState(DeviceStateList.Objects[i]).EcuId;
      if TDeviceState(DeviceStateList.Objects[i]).CardBufferFull then stTemp := stTemp + ':1'
      else stTemp := stTemp + ':0';
      memo1.Lines.Add(stTemp);
    end;
    Application.ProcessMessages;
  end;
(*
  nMainCnt := 0;
  nExtCnt := 0;
  nAlarmTotCnt := 0;
  nAlarmErrcnt :=0;
  nAccessErrcnt := 0;
  aAlarmStateList := TStringList.Create;
  aAccessStateList := TStringList.Create;
  memo1.Lines.Clear;
  memo2.Lines.Clear;

  stSql := 'select * from TB_ALARMEVENT where AL_INPUTTIME >= ''20240709130000000'' order by al_date,al_time';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While Not Eof do
      begin
        stKey := FindField('AC_NODENO').AsString +  FindField('AC_ECUID').AsString +  FindField('AL_ZONECODE').AsString;
        nIndex := aAlarmStateList.indexOf(stKey);
        if nIndex < 0 then
        begin
          if (FindField('AL_ALARMSTATUSCODE').AsString = '00') then
          begin
            oAlarmState := TAlarmState.create(self);
            oAlarmState.NodeNo := FindField('AC_NODENO').AsInteger;
            oAlarmState.EcuID := FindField('AC_ECUID').AsString;
            oAlarmState.AlarmAreaNo := FindField('AL_ZONECODE').AsInteger;
            oAlarmState.State := FindField('AL_ALARMMODECODE').AsString;
            aAlarmStateList.AddObject(stKey,oAlarmState);
          end;
        end else
        begin
          if ( FindField('AL_ALARMMODECODE').AsString = 'A') or (FindField('AL_ALARMMODECODE').AsString = 'D') then
          begin
            nAlarmTotCnt := nAlarmTotCnt +1;
            if (TAlarmState(aAlarmStateList.Objects[nIndex]).State =  FindField('AL_ALARMMODECODE').AsString) and (FindField('AL_ALARMSTATUSCODE').AsString = '00')  then
            begin
              nAlarmErrcnt := nAlarmErrcnt + 1;
              memo1.Lines.Add(FindField('AL_INPUTTIME').AsString);
            end;
            TAlarmState(aAlarmStateList.Objects[nIndex]).State := FindField('AL_ALARMMODECODE').AsString ;
          end;   
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
    stSql := 'select * from TB_ACCESSEVENT where AC_INSERTDATE >= ''202407091320000000'' order by ac_date,ac_time,AC_INSERTDATE' ;
    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While Not Eof do
      begin
        stKey := FindField('AC_ECUID').AsString +  FindField('CA_CARDNO').AsString;
        nIndex := aAccessStateList.indexOf(stKey);
        if nIndex < 0 then
        begin
          oAccessState := TAccessState.create(self);
          oAccessState.NodeNo := FindField('AC_NODENO').AsInteger;
          oAccessState.EcuID := FindField('AC_ECUID').AsString;
          if FindField('AC_ECUID').AsString = '00' then
          begin
            oAccessState.Number := nMainCnt;
            nMainCnt := nMainCnt + 1;
          end else
          begin
            oAccessState.Number := nExtCnt;
            nExtCnt := nExtCnt + 1;
          end;
          aAccessStateList.AddObject(stKey,oAccessState);
        end else
        begin
          if FindField('AC_ECUID').AsString = '00' then
          begin
            if(TAccessState(aAccessStateList.Objects[nIndex]).Number <> (nMainCnt mod 4)) then
            begin
              nAccessErrcnt := nAccessErrcnt + 1;
              stTemp := FindField('AC_INSERTDATE').AsString;
              memo2.Lines.Add(FindField('AC_INSERTDATE').AsString);
//              Exit;
              if (TAccessState(aAccessStateList.Objects[nIndex]).Number) = ( (nMainCnt-1) mod 4) then nMainCnt:=nMainCnt-1;
              if (TAccessState(aAccessStateList.Objects[nIndex]).Number) = ( (nMainCnt+1) mod 4) then nMainCnt:=nMainCnt+1;
            end;
            nMainCnt := nMainCnt + 1;
          end else
          begin
            if(TAccessState(aAccessStateList.Objects[nIndex]).Number <> (nExtCnt mod 4)) then
            begin
              nAccessErrcnt := nAccessErrcnt + 1;
              stTemp := FindField('AC_INSERTDATE').AsString;
              memo2.Lines.Add(FindField('AC_INSERTDATE').AsString);
              if (TAccessState(aAccessStateList.Objects[nIndex]).Number) = ( (nExtCnt-1) mod 4) then nExtCnt:=nExtCnt-1;
              if (TAccessState(aAccessStateList.Objects[nIndex]).Number) = ( (nExtCnt+1) mod 4) then nExtCnt:=nExtCnt+1;
            end;
            nExtCnt := nExtCnt + 1;
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  showmessage('방범 에러 갯수 : ' +inttostr(nAlarmErrcnt) + '/' + inttostr(nAlarmTotCnt) + '\n'+ '카드 에러 갯수 : ' +inttostr(nAccessErrcnt) + '/' + inttostr(nMainCnt + nExtCnt) + '\n');
*)
end;

function TfmMain.GetCardNo(aCompanyCode, aEmpID: string): string;
var
  stSql : string;
  nFdms_id : integer;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select CA_CARDNO from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';

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
      Try
        result := FindField('CA_CARDNO').AsString;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.mn_FireRecoverClick(Sender: TObject);
var
  i : integer;
begin
  if (Application.MessageBox(PChar('전체기기의 화재복구 명령을 전송 하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;
  (*
  if G_bFormEnabled[con_Monitoring] then
  begin
    if G_nMultiDaemon = 0 then
    begin
      self.FindClassForm('TfmMonitoring').FindCommand('FIRERECOVER').Execute;
    end else if G_nMultiDaemon = 1 then
    begin
//      self.FindClassForm('TfmMultiMonitoring').FindCommand('FIRERECOVER').Execute;
    end;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','화재복구')
  end else if G_bFormEnabled[con_DoorTypeMonitor] then
  begin
    self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('FIRERECOVER').Execute;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','화재복구')
  end else if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    self.FindClassForm('TfmKTTypeMonitoring').FindCommand('FIRERECOVER').Execute;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','화재복구')
  end else if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    for i:=0 to NodeList.Count - 1 do
    begin
      SendDaemonDataList.Add('FIRERECOVERY'+ DATADELIMITER + NodeList.Strings[i] + DATADELIMITER);
    end;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','화재복구')
  end else if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    for i:=0 to NodeList.Count - 1 do
    begin
      SendDaemonDataList.Add('FIRERECOVERY'+ DATADELIMITER + NodeList.Strings[i] + DATADELIMITER);
    end;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','화재복구')
  end else if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    for i:=0 to NodeList.Count - 1 do
    begin
      SendDaemonDataList.Add('FIRERECOVERY'+ DATADELIMITER + NodeList.Strings[i] + DATADELIMITER);
    end;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','화재복구');
  end else
  begin
    for i:=0 to NodeList.Count - 1 do
    begin
      SendDaemonDataList.Add('FIRERECOVERY'+ DATADELIMITER + NodeList.Strings[i] + DATADELIMITER);
    end;
    DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','화재복구');
  end;
  *)
  SendDaemonDataList.Add('FIRERECOVERY'+ DATADELIMITER + '000' + DATADELIMITER);
  DataModule1.TB_SYSTEMLOGInsert('000','00',DOORTYPE,'0','0000000000','화재복구');
end;

procedure TfmMain.DataModuleAdoConnected(Sender: TObject;
  DBConnected: Boolean);
begin
  if Not DBConnected then
  begin
    AdoConnectCheckTimer.Enabled := True;
  end;

end;

procedure TfmMain.AdoConnectCheckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  
  //StatusBar1.Panels[2].Text := 'AdoConnectCheckTimer';
  AdoConnectCheckTimer.Enabled := False;
  if Not TDataBaseConfig.GetObject.DBConnected then Exit;

  TDataBaseConfig.GetObject.DBConnected := False;
  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      Application.Terminate;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;

end;

procedure TfmMain.mn_LOMOSEmployeeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_Employ.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmLOMOSEmployee:= TfmLOMOSEmployee.Create(Self);
//  fmLOMOSEmployee.IsInsertGrade := bInsertGrade;
//  fmLOMOSEmployee.IsUpdateGrade := bUpdateGrade;
//  fmLOMOSEmployee.IsDeleteGrade := bDeleteGrade;
  fmLOMOSEmployee.SHowmodal;
  fmLOMOSEmployee.Free;

end;

procedure TfmMain.N37Click(Sender: TObject);
begin
  fmImageTest:= TfmImageTest.Create(Self);
  Try
    fmImageTest.SHowmodal;
  Finally
    fmImageTest.Free;
  End;

end;

procedure TfmMain.N38Click(Sender: TObject);
begin

  fmTestCardCreate:= TfmTestCardCreate.Create(Self);
  Try
    fmTestCardCreate.SHowmodal;
  Finally
    fmTestCardCreate.Free;
  End;
end;

function TfmMain.CreateZmosConfig: string;
var
  ini_fun : TiniFile;
  stSql : string;
  TempAdoQuery :TADOQuery;
  stCompanyCode : string;
  stCompanyName : string;
  stResult : string;
begin
  result := '';
  stResult := '';

  Try
    ini_fun := TiniFile.Create('c:\'+ L_stCustomerID + '.INI');
  Except
    Exit;
  End;
  Try
    ini_fun.WriteString('ZMOS','DBTYPE',DBType);
    stResult := 'DBTYPE' + ':' + DBType;
    ini_fun.WriteString('ZMOS','DBNAME',DBName);
    stResult := stResult + ';' + 'DBNAME' + ':' + DBName;
    ini_fun.WriteString('ZMOS','DBSERVER',DBServer);
    stResult := stResult + ';' + 'DBSERVER' + ':' + DBServer;
    ini_fun.WriteString('ZMOS','DBUSER',DBUser);
    stResult := stResult + ';' + 'DBUSER' + ':' + DBUser;
    ini_fun.WriteString('ZMOS','DBUSERPW',DBUserPw);
    stResult := stResult + ';' + 'DBUSERPW' + ':' + DBUserPw;
    ini_fun.WriteString('ZMOS','DBPORT',DBPort);
    stResult := stResult + ';' + 'DBPORT' + ':' + DBPort;
  Except
    ini_fun.Free;    //Window 7 에서 권한 부분에 의해 write가 안됨
    Exit;
  End;

  Try

    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      stSql := 'Select * from TB_CONFIG ';
      stSql := stSql + ' where CO_CONFIGGROUP = ''COMMON'' ';
      stSql := stSql + ' AND CO_CONFIGCODE = ''TABLE_VER'' ';

      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      while Not Eof do
      begin
        ini_fun.WriteString('CUSTOMER','TABLEVER',FindField('CO_CONFIGVALUE').AsString);
        stResult := stResult + ';' + 'TABLEVER' + ':' + FindField('CO_CONFIGVALUE').AsString;
        Next;
      end;

      stSql := 'Select * from TB_COMPANY ';
      stSql := stSql + ' where CO_GUBUN = ''1'' ';
      stSql := stSql + ' Or CO_GUBUN = ''2'' ';

      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      while Not Eof do
      begin
        stCompanyCode := FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString;
        stCompanyName := FindField('CO_NAME').AsString;
        ini_fun.WriteString('CUSTOMER',stCompanyCode,stCompanyName);
        stResult := stResult + ';' + stCompanyCode + ':' + stCompanyName;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
    ini_fun.Free;
  End;
  result := stResult;
end;

function TfmMain.FTPZeronServerSend: Boolean;
begin
  result := False;
  IdFTP1.Host := 'zeron.co.kr';
  IdFTP1.Username := 'zeron';
  IdFTP1.Password := 'zeronpass';
  IdFTP1.Connect(True,100);
  if IdFTP1.Connected then
  begin
    IdFTP1.ChangeDir('zmosconfig');
    IdFTP1.Put('c:\'+ L_stCustomerID + '.INI',L_stCustomerID + '.INI',False);
    result := True;
  end;
end;

function TfmMain.HTTPZeronServerSend(aContent:string): Boolean;
var
  stUrl : string;
begin
  Try
    stUrl := 'http://zeron.co.kr/zmosconfig/write.php?filename=' + L_stCustomerID + '.INI' + '&content='+aContent;
    if Length(stUrl) > L_nWebContentLength then stUrl := copy(stUrl,1,L_nWebContentLength);
    WebBrowser1.Navigate(stUrl);
  Except
    Exit;
  End;
end;

procedure TfmMain.mn_KTIssusNRegClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(mn_KTIssusNReg.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmKTIssusNReg');

end;

procedure TfmMain.mn_DeviceVerInfoClick(Sender: TObject);
begin
  MDIChildShow('TfmDeviceVerInfo');
end;

procedure TfmMain.mn_TimeAccessReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmTimeAccessReport');
  //self.FindClassForm('TfmTimeAccessReport').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.mn_NotCardReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmNotCardReport');
  //self.FindClassForm('TfmNotCardReport').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.FTP1Click(Sender: TObject);
begin
  fmFTPDownLoad := TfmFTPDownLoad.create(self);
  fmFTPDownLoad.Caption := FTP1.Caption;
  fmFTPDownLoad.SHowmodal;
end;

procedure TfmMain.SetFTPDownLoadShow(const Value: Boolean);
begin
  FFTPDownLoadShow := Value;
end;

procedure TfmMain.mn_CardListClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(mn_CardList.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCardList',bInsertGrade,bUpdateGrade,bDeleteGrade);

end;

procedure TfmMain.mn_cardValidDateClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(mn_cardValidDate.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCardValidDate',bInsertGrade,bUpdateGrade,bDeleteGrade);

end;

procedure TfmMain.mn_LOMOSBackupClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_Employ.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmLOMOSEmployeeBackup:= TfmLOMOSEmployeeBackup.Create(Self);
  fmLOMOSEmployeeBackup.IsInsertGrade := bInsertGrade;
  fmLOMOSEmployeeBackup.IsUpdateGrade := bUpdateGrade;
  fmLOMOSEmployeeBackup.IsDeleteGrade := bDeleteGrade;
  fmLOMOSEmployeeBackup.SHowmodal;
  fmLOMOSEmployeeBackup.Free;

end;

procedure TfmMain.Action_AlarmTypeMonitoringExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_AlarmTypeMonitoring.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAlarmTypeMonitoring',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.SetFDaemonServerConnected(const Value: Boolean);
var
  i : integer;
begin
  if G_nDaemonServerVersion > 3 then
  begin
    DaemonLiveCheckTimer.Interval := 100000;
    DaemonLiveCheckTimer.Enabled := Value;
    if Value then
    begin
      DaemonMessageVisibleTimer1.Enabled := False;
      StatusBar1.Panels[1].Text := '통신데몬 접속' ;
    end else
    begin
      StatusBar1.Panels[1].Text := '통신데몬 접속 연결 해제' ;
      DaemonMessageVisibleTimer1.Enabled := True;
    end;
  end;
  if FDaemonServerConnected = Value then Exit;
  FDaemonServerConnected := Value;
  if G_nMultiSocket = 1 then
  begin
    if FDaemonServerConnected and FControlSocketConnected then
    begin
      btnDaemonConnect.Enabled := False;
    end else btnDaemonConnect.Enabled := True;
  end else btnDaemonConnect.Enabled := Not Value;

  if Not Value then
  begin
    if G_nMultiSocket = 0 then
      SendDaemonDataList.Clear;

    for i := 0 to NodeList.Count - 1 do
    begin
      TNodeState(NodeList.Objects[i]).NodeConnected := False;
    end;

    if G_bFormEnabled[con_Monitoring] then
    begin
      if G_nMultiDaemon = 0 then
      begin
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Execute;
      end;
    end;
    if G_bFormEnabled[con_DoorTypeMonitor] then
    begin
      self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
      self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('STATE').Execute;
    end;
    if G_bFormEnabled[con_KTTypeMonitoring] then
    begin
      self.FindClassForm('TfmKTTypeMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmKTTypeMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
      self.FindClassForm('TfmKTTypeMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmKTTypeMonitoring').FindCommand('STATE').Execute;
    end;
    if G_bFormEnabled[con_AlarmTypeMonitoring] then
    begin
      self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
      self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('STATE').Execute;
    end;
    if G_bFormEnabled[con_AccessTypeMonitoring] then
    begin
      self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
      self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('STATE').Execute;
    end;
    if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
    begin
      self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
      self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('STATE').Execute;
    end;
    if G_bFormEnabled[con_AlarmMapMonitoring] then
    begin
      self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
      self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('STATE').Execute;
    end;
    if G_bFormEnabled[con_AccessMapMonitoring] then
    begin
      self.FindClassForm('TfmAccessMapMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmAccessMapMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
      self.FindClassForm('TfmAccessMapMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmAccessMapMonitoring').FindCommand('STATE').Execute;
    end;

  end else
  begin
    if G_bFormEnabled[con_Monitoring] then
    begin
      if G_nMultiDaemon = 0 then
      begin
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'CONNECTED';
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Execute;
      end;
    end;
    if G_bFormEnabled[con_DoorTypeMonitor] then
    begin
      self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'CONNECTED';
      self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('STATE').Execute;
    end;
    if G_bFormEnabled[con_KTTypeMonitoring] then
    begin
      self.FindClassForm('TfmKTTypeMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmKTTypeMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'CONNECTED';
      self.FindClassForm('TfmKTTypeMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmKTTypeMonitoring').FindCommand('STATE').Execute;
    end;

    if G_bFormEnabled[con_AlarmTypeMonitoring] then
    begin
      self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'CONNECTED';
      self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('STATE').Execute;
    end;
    
    if G_bFormEnabled[con_AccessTypeMonitoring] then
    begin
      self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'CONNECTED';
      self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('STATE').Execute;
    end;

    if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
    begin
      self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'CONNECTED';
      self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('STATE').Execute;
    end;
    
    if G_bFormEnabled[con_AlarmMapMonitoring] then
    begin
      self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'CONNECTED';
      self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('STATE').Execute;
    end;
    
    if G_bFormEnabled[con_AccessMapMonitoring] then
    begin
      self.FindClassForm('TfmAccessMapMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
      self.FindClassForm('TfmAccessMapMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'CONNECTED';
      self.FindClassForm('TfmAccessMapMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
      self.FindClassForm('TfmAccessMapMonitoring').FindCommand('STATE').Execute;
    end;

    Action_StateSearchExecute(self);
    //여기서 상태확인 하자.
//    SendDaemonTimer.Enabled := True;
  end;
end;

procedure TfmMain.ControlSocketPortWsConnect(Sender: TObject);
begin
  ControlSocketConnected := True;
end;

procedure TfmMain.ControlSocketPortWsDisconnect(Sender: TObject);
begin
  ControlSocketConnected := False;
end;

procedure TfmMain.ControlSocketPortWsError(Sender: TObject;
  ErrCode: Integer);
begin
  ControlSocketConnected := False;
end;


procedure TfmMain.ControlSocketPortTriggerAvail(CP: TObject; Count: Word);
var
  stTemp : string;
  stPacketData : string;
  i : integer;
begin
  stTemp:= '';
  G_bControlSocketConnected := True;
  Try
    for i := 1 to Count do stTemp := stTemp + ControlSocketPort.GetChar;
  Except
    Exit;
  End;
  ControlComBuff:= ControlComBuff + stTemp ;
  repeat
    if G_bApplicationTerminate then Exit;
    stPacketData:= Copy(ControlComBuff,1,Pos(LINEEND,ControlComBuff));
    Delete(ControlComBuff,1,Pos(LINEEND,ControlComBuff));

{    if ControlDataList.Strings[0] = stPacketData then
    begin
      ControlDataList.Delete(0);
      G_bControlReceive := True;
    end; }

    Application.ProcessMessages;
  until pos(LINEEND,ServerComBuff) = 0;

end;

procedure TfmMain.ControlDataSendStart;
begin
  if not(assigned(ControlSendThread)) then begin
     ControlSendThread := TControlSendThread.Create(true) ;
  end;
  if (assigned(ControlSendThread)) and (ControlSendThread.Suspended  = true) then
  begin
   ControlSendThread.Resume ;
  end;
end;


procedure TfmMain.ControlDataSendStop;
begin
   if (assigned(ControlSendThread)) and (ControlSendThread.Suspended  = false) then
   begin
      Try
        ControlSendThread.Suspend ;
      Except
      End;
   end;
   // 쓰레드 객체 존재 확인
   if assigned(ControlSendThread) then
   begin
     // 스레드가 잠시 suspend 증 이면
     if ControlSendThread.Suspended  = true then
     begin
      ControlSendThread.Resume;
     end;
     //
     ControlSendThread.Terminate ;
     ControlSendThread.WaitFor ;
     ControlSendThread.Free ;
     ControlSendThread := nil ;
   end;
end;

{ TControlSendThread }

procedure TControlSendThread.ControlDataSend(aData: string);
begin
  if fmMain.ControlSocketPort.Open then
  begin
    fmMain.ControlSocketPort.PutString(aData);
  end;
end;

procedure TControlSendThread.Execute;
begin
  inherited;
  while not (self.Terminated) do
  begin
    if fmMain.SendDaemonDataList.Count > 0 then
    begin
      if G_bApplicationTerminate then Exit;
      fmMain.FControlSend.Enter;
      ControlDataSend(fmMain.SendDaemonDataList.Strings[0] + LINEEND );
      fmMain.SendDaemonDataList.Delete(0);
      fmMain.StatusBar1.Panels[3].Text := '[TX]' + inttostr(fmMain.SendDaemonDataList.Count);
      fmMain.FControlSend.Leave;
    end;
    sleep(1) ;
  end;

end;

procedure TfmMain.SetFControlSocketConnected(const Value: Boolean);
begin
  if FControlSocketConnected = Value then Exit;
  FControlSocketConnected := Value;
  if G_nMultiSocket = 1 then
  begin
    if FDaemonServerConnected and FControlSocketConnected then
    begin
      btnDaemonConnect.Enabled := False;
    end else btnDaemonConnect.Enabled := True;
  end;// else btnDaemonConnect.Enabled := Not Value;

  if Not Value then
  begin
    if G_nMultiSocket = 1 then
    begin
      SendDaemonDataList.Clear;
      pan_Message.Visible := True;
      st_Message.Caption := '전송 소켓 끊김';
    end;
  end else
  begin
    pan_Message.Visible := False;
  end;
end;

{ TReceiveMonitorThread }

procedure TReceiveMonitorThread.Execute;
var
  stTemp : string;
begin
  inherited;
  while not (self.Terminated) do
  begin
    if fmMain.ReceiveDataList.Count > 0 then
    begin
      if G_bApplicationTerminate then Exit;
      Try
        fmMain.FReceiveTCS.Enter;
        stTemp := fmMain.ReceiveDataList.Strings[0];
        fmMain.ReceiveDataList.Delete(0);
        //fmMain.StatusBar1.Panels[4].Text := inttostr(fmMain.ReceiveDataList.Count);
      Finally
        fmMain.FReceiveTCS.Leave;
      End;
      MonitorProcess(stTemp);
    end;
    sleep(1) ;
  end;
  //showmessage('Thread 종료');

end;

procedure TReceiveMonitorThread.MonitorProcess(aData: string);
begin
  fmMain.MonitoringDataProcess(aData);
end;

procedure TfmMain.ReceiveThreadStart;
begin
  if not(assigned(ReceiveThread)) then begin
     ReceiveThread := TReceiveMonitorThread.Create(true) ;
  end;
  if (assigned(ReceiveThread)) and (ReceiveThread.Suspended  = true) then
  begin
   ReceiveThread.Resume ;
  end;
end;

procedure TfmMain.ReceiveThreadStop;
begin
   if (assigned(ReceiveThread)) and (ReceiveThread.Suspended  = false) then
   begin
      Try
        ReceiveThread.Suspend ;
      Except
      End;
   end;
   // 쓰레드 객체 존재 확인
   if assigned(ReceiveThread) then
   begin
     // 스레드가 잠시 suspend 증 이면
     if ReceiveThread.Suspended  = true then
     begin
      ReceiveThread.Resume;
     end;
     //
     ReceiveThread.Terminate ;
     ReceiveThread.WaitFor ;
     ReceiveThread.Free ;
     ReceiveThread := nil ;
   end;
end;

procedure TfmMain.BuildingSectorDeviceLoad;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stBuildingCode : string;
begin
  BuildingList.Clear;
  BuildingNameList.Clear;
  BuildingListAddDevice('000000000','전체');

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''' + BuildingStep + ''' ';
  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

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
      While Not Eof do
      begin
        stBuildingCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString + FindField('LO_AREACODE').AsString;
        BuildingListAddDevice(stBuildingCode, FindField('LO_NAME').AsString);
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



procedure TfmMain.BuildingListAddDevice(aBuildingCode,aBuildingName: string);
var
  stSql : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  TempAdoQuery :TADOQuery;
  TempBuilding : TBuildingState;
  stDeviceID : string;
  stBuildingListID : string;
  stTemp : string;
begin
  stBuildingCode := copy(aBuildingCode,1,3);
  stFloorCode := copy(aBuildingCode,4,3);
  stAreaCode := copy(aBuildingCode,7,3);

  if BuildingStep = '0' then stBuildingListID := copy(aBuildingCode,1,3)
  else if BuildingStep = '1' then stBuildingListID := copy(aBuildingCode,1,6)
  else if BuildingStep = '2' then stBuildingListID := copy(aBuildingCode,1,9);

  stSql := ' select * from TB_ARMAREA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AR_USE = ''Y'' ';
  if aBuildingCode <> '000000000' then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + stBuildingCode + ''' ';
    if BuildingStep = '1' then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + stFloorCode + ''' ';
    end else if BuildingStep = '2' then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + stFloorCode + ''' ';
      stSql := stSql + ' AND LO_AREACODE = ''' + stAreaCode + ''' ';
    end;
  end;
  //stSql := stSql + ' Order by AL_VIEWSEQ,AC_NODENO,AC_ECUID ';
  stSql := stSql + ' order by AR_VIEWSEQ,AC_NODENO,AC_ECUID,AR_AREANO ';

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

      TempBuilding := TBuildingState.Create(self);
      TempBuilding.DeviceCount := recordCount;
      While Not Eof do
      begin

        TempBuilding.DeviceAdd(FindField('AC_NODENO').AsInteger,FindField('AC_ECUID').AsString,inttostr(FindField('AR_AREANO').AsInteger),FindField('AR_NAME').AsString);
        TempBuilding.BuildingCode := stBuildingListID;

        TempBuilding.OnBuildingAlarmEvent := BuildingAlarmEventProcess;
        TempBuilding.OnBuildingAlarmMode := BuildingAlarmModeProcess;
        Next;
        Application.ProcessMessages;
      end;
      if TempBuilding <> nil then
      begin
        if BuildingList.IndexOf(stBuildingListID) < 0 then
        begin
           BuildingList.AddObject(stBuildingListID,TempBuilding);
           BuildingNameList.Add(aBuildingName);
        end;
      end;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;


procedure TfmMain.LoadDevice;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  TempNodeState : TNodeState;
  TempDeviceState : TDeviceState;
  stNodeNo : string;
  stEcuID : string;
  stDeviceID : string;
  nIndex : integer;
  i : integer;
begin
  if DeviceStateList.Count > 0 then
  begin
    for i := DeviceStateList.Count - 1 downto 0 do TDeviceState(DeviceStateList.Objects[i]).Free;
  end;
  DeviceStateList.Clear;    //기기별 상태 정보

  stSql := 'Select *';
  stSql := stSql + ' from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order by AC_VIEWSEQ, AC_NODENO,AC_ECUID ';

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
      While Not Eof do
      begin
        stNodeNo := FillZeroNumber(FindField('AC_NODENO').asInteger,3);
        stEcuID := FindField('AC_ECUID').AsString;
        stDeviceID := stNodeNo + stEcuID;

        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNodeState(NodeList.Objects[nIndex]).DeviceAdd(stEcuID);
        end;
        TempDeviceState := TDeviceState.Create(self);
//        TempDeviceState.BuildingCode := FindField('BuildingCode').asstring;
//        TempDeviceState.FloorCode := FindField('FloorCode').AsString;
//        TempDeviceState.AreaCode := FindField('AreaCode').AsString;
        TempDeviceState.NodeNo := FindField('AC_NODENO').AsInteger;
        TempDeviceState.ECUID := stEcuID;
        TempDeviceState.DeviceName := FindField('AC_DEVICENAME').asstring;
        TempDeviceState.Connected := False;
        if FindField('AC_CARDFULL').asstring = '1' then
          TempDeviceState.CardBufferFull := True
        else TempDeviceState.CardBufferFull := False;
        
        TempDeviceState.OnDeviceConnected := DeviceConnected;
        TempDeviceState.OnAlarmModeChanged := AlarmModeChanged;
        TempDeviceState.OnExitButton := ExitButtonPress;
        TempDeviceState.OnAlarmEventAnalysis := AlarmEventAnalysis;
        TempDeviceState.OnAccessEvent := AccessEventProcess;
        TempDeviceState.OnDeviceAlarmEvent := DeviceAlarmEventProcess;
        TempDeviceState.OnDeviceSetupData := RcvDeviceSetupData;

        //nIndex := DeviceStateList.IndexOf(stDeviceID);
        DeviceStateList.AddObject(stDeviceID,TempDeviceState);
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

procedure TfmMain.LoadDoor;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stDoorID : string;
  nTempIndex : integer;
  stBuildingID : string;
  TempDoorState : TDoorState;
  i : integer;
begin
  if DoorStateList.Count > 0 then
  begin
    for i := DoorStateList.Count - 1 downto 0 do
      TDoorState(DoorStateList.objects[i]).free;
  end;
  DoorStateList.Clear;
  
  stSql := ' Select * from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
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
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        stDoorID := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString;

        TempDoorState := TDoorState.Create(self);
        TempDoorState.BuildingCode := FindField('LO_DONGCODE').asstring;
        TempDoorState.FloorCode := FindField('LO_FLOORCODE').AsString;
        TempDoorState.AreaCode := FindField('LO_AREACODE').AsString;
        TempDoorState.NodeNo := FindField('AC_NODENO').AsInteger;
        TempDoorState.ECUID := FindField('AC_ECUID').AsString ;
        TempDoorState.DoorNo := FindField('DO_DOORNO').AsInteger;
        TempDoorState.DoorName := FindField('DO_DOORNONAME').asstring;

        TempDoorState.OnDoorStateChange := DoorStateChange;

        DoorStateList.AddObject(stDoorID,TempDoorState);

        stBuildingID := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString + FindField('LO_AREACODE').AsString ;
        if BuildingStep = '0' then stBuildingID := copy(stBuildingID,1,3)
        else if BuildingStep = '1' then stBuildingID := copy(stBuildingID,1,6)
        else if BuildingStep = '2' then stBuildingID := copy(stBuildingID,1,9);
        
        nTempIndex := BuildingList.IndexOf(stBuildingID);
        if nTempIndex > -1 then
        begin
          TBuildingState(BuildingList.Objects[nTempIndex]).DoorAdd(FindField('AC_NODENO').AsInteger,FindField('AC_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('DO_DOORNONAME').AsString);
        end;
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


procedure TfmMain.DoorFireStateChange(Sender: TObject; NodeNo: integer;
  aEcuID, aDoorNo: string; aFireState: Boolean);
var
  fmAccessTypeMonitoring :TForm;
  fmBuildingAccessTypeMonitoring :TForm;
  fmMonitor :TForm;
  fmKTTypeMonitoring : TForm;
begin
  if G_bApplicationTerminate then Exit;
  //모니터링에 출입문 화재 발생 및 복구 처리
  if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    fmAccessTypeMonitoring := MDIForm('TfmAccessTypeMonitoring');
    if fmAccessTypeMonitoring <> nil then
    begin
      TfmAccessTypeMonitoring(fmAccessTypeMonitoring).DoorFireStateChange(NodeNo,
          aEcuID, aDoorNo, aFireState);
    end;
  end;

  if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    fmBuildingAccessTypeMonitoring := MDIForm('TfmBuildingAccessTypeMonitoring');
    if fmBuildingAccessTypeMonitoring <> nil then
    begin
      TfmBuildingAccessTypeMonitoring(fmBuildingAccessTypeMonitoring).DoorFireStateChange(NodeNo,
          aEcuID, aDoorNo, aFireState);
    end;
  end;

  if G_bFormEnabled[con_Monitoring] then
  begin
    if G_nMultiDaemon = 0 then
    begin
      fmMonitor := MDIForm('TfmMonitoring');
    end else if G_nMultiDaemon = 1 then
    begin
//      fmMonitor := MDIForm('TfmMultiMonitoring');
    end;
    if fmMonitor <> nil then
    begin
      if G_nMultiDaemon = 0 then
        TfmMonitoring(fmMonitor).DoorFireStateChange(NodeNo,aEcuID, aDoorNo, aFireState);
//      else if G_nMultiDaemon = 1 then
//        TfmMultiMonitoring(fmMonitor).DoorFireStateChange(NodeNo,aEcuID, aDoorNo, aFireState);
    end;
  end;

  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
    if fmKTTypeMonitoring <> nil then
    begin
      TfmKTTypeMonitoring(fmKTTypeMonitoring).DoorFireStateChange(NodeNo,aEcuID, aDoorNo, aFireState);
    end;
  end;

end;

procedure TfmMain.MemoryCreate;
begin
  FControlSend := TCriticalSection.Create;
  FReceiveTCS := TCriticalSection.Create;
  FDataProcessTCS := TCriticalSection.Create;

  SendDaemonDataList := TStringList.Create;
  SendStateDataList := TStringList.Create;
  ReceiveDataList := TStringList.Create;
  DownLoadCardList := TStringList.Create;
  ServerList := TStringList.Create;
  DeviceList := TStringList.Create;
  AlarmModeNotCardList := TStringList.Create;  //카드데이터 아닌 리스트
  ZoneDetectList := TStringList.Create;        //존감지 상태 코드
  BuildingList := TStringList.Create;
  BuildingNameList := TStringList.Create;
  NodeList := TStringList.Create;
  ArmAreaStateList := TStringList.Create;
  DoorStateList := TStringList.Create;
  DeviceStateList := TStringList.Create;
  AlarmEventViewStatusCode := TStringList.Create;
  AlarmEventSoundStatusCode := TStringList.Create;
  AlarmEventSoundColor := TStringList.Create;
  AlarmEventArmStateEvent := TStringList.Create;
  AlarmSoundFileList := TStringList.Create;
  LocationMapList := TStringList.Create;

  //모니터링 이벤트 헤더 메모리
  AccessHeaderNameList := TStringList.Create;
  AlarmHeaderNameList := TStringList.Create;

  SetLength(AccessEventShowTable,ACCESSEVENTMAXCELL + 1);
  SetLength(AlarmEventShowTable,ALARMEVENTMAXCELL + 1);

  SetLength(Access1SizeTable,ACCESSEVENTMAXCELL + 1);
  SetLength(Access2SizeTable,ACCESSEVENTMAXCELL + 1);
  SetLength(Access3SizeTable,ACCESSEVENTMAXCELL + 1);
  SetLength(Alarm1SizeTable,ALARMEVENTMAXCELL + 1);
  SetLength(Alarm2SizeTable,ALARMEVENTMAXCELL + 1);
  SetLength(MapAlarm1SizeTable,MAPALARMEVENTMAXCELL + 1);


  DaemonState := TDaemonState.Create(self);
  DaemonState.OnDaemonRestart := RestartServer;
  DaemonState.OnDaemonLive := DaemonLive;
  DaemonState.OnAlarmRefresh := AlarmRefresh;
  DaemonState.OnFireRecovery := FireRecovery;
//  DaemonState.OnServerConnected := ServerConnectEvent;

  DataModule1.OnAdoConnected := DataModuleAdoConnected;

end;

procedure TfmMain.MemoryClear;
var
  i : integer;
begin
  ServerComBuff := '';
  SendDaemonDataList.Clear;
  SendStateDataList.Clear;
  ReceiveDataList.Clear;
  DownLoadCardList.Clear;
  AlarmEventViewStatusCode.Clear;
  AlarmEventSoundStatusCode.Clear;
  AlarmEventSoundColor.Clear;
  AlarmEventArmStateEvent.Clear;
  AlarmSoundFileList.Clear;
  LocationMapList.Clear;

  for i:= ServerList.Count - 1 downto 0 do
  begin
    Try
      TdServerConnectModule(ServerList.Objects[i]).Free;
    Except
      break;
    End;
  end;
  ServerList.Clear;
  for i:= DeviceList.Count - 1 downto 0 do
  begin
    Try
      TDevice(DeviceList.Objects[i]).Free;
    Except
      continue;
    End;
  end;
  DeviceList.Clear;
  AlarmModeNotCardList.Clear;  //카드데이터 아닌 리스트
  ZoneDetectList.Clear;        //존감지 상태 코드
  BuildingNameList.Clear;
  for i := DeviceStateList.Count - 1 downto 0 do
  begin
    Try
      TDeviceState(DeviceStateList.Objects[i]).Free;
    Except
      break;
    End;
  end; 
  DeviceStateList.Clear;
  for i := BuildingList.Count - 1 downto 0 do
  begin
    Try
      TBuildingState(BuildingList.Objects[i]).Free;
    Except
      continue;
    End;
  end;
  BuildingList.Clear;
  for i := NodeList.Count - 1 downto 0 do
  begin
    Try
      //if TNodeState(NodeList.Objects[i]) <> nil then
        TNodeState(NodeList.Objects[i]).Free;
    Except
      break;
    End;
  end;
  NodeList.Clear;

end;

procedure TfmMain.MemoryFree;
begin
  AccessHeaderNameList.Free;
  AlarmHeaderNameList.Free;
  
  FControlSend.Free;
  FReceiveTCS.Free;
  FDataProcessTCS.Free;

  SendDaemonDataList.Free;
  SendStateDataList.Free;
  ReceiveDataList.Free;
  DownLoadCardList.Free;
  ServerList.Free;
  DeviceList.Free;
  AlarmModeNotCardList.Free;  //카드데이터 아닌 리스트
  ZoneDetectList.Free;        //존감지 상태 코드
  BuildingList.Free;
  BuildingNameList.Free;
  NodeList.Free;
  ArmAreaStateList.Free;
  DoorStateList.Free;
  DeviceStateList.Free;
  AlarmEventViewStatusCode.Free;
  AlarmEventSoundStatusCode.Free;
  AlarmEventSoundColor.Free;
  AlarmEventArmStateEvent.Free;
  AlarmSoundFileList.Free;

  LocationMapList.Free;

end;

procedure TfmMain.RestartServer(Sender: TObject);
begin
  Exit;
  if G_bApplicationTerminate then Exit;
{$IFDEF TApdWinsockport}
  WinsockPort1.Open := False;
{$ELSE}
  WinsockPort.Active := False;
{$ENDIF}
  //데몬 재시작시 수행
  //기기 재 로딩 후 모니터링 화면 재 로딩 및 상태 확인
end;

procedure TfmMain.TimerStopAndFree;
begin
  Try
    AdoConnectCheckTimer.Enabled := False;
    AlarmSound.Enabled := False;
    ArmAreaStateTimer.Enabled := False;
    DaemonReceiveTimer.Enabled := False;
    DaemonLiveCheckTimer.Enabled := False;
    DaemonLiveRecvTimer.Enabled := False;
    DaemonMessageVisibleTimer1.Enabled := False;
    DBSocketReceiveTimer.Enabled := False;
    LiveTimer.Enabled := False;
    MessageTimer.Enabled := False;
    NowTimer.Enabled := False;
    PeronRelayTimer1.Enabled := False;
    SendDaemonTimer.Enabled := False;
    ServerConnectTimer.Enabled := False;
    StateCheckTimer.Enabled := False;

    //Delay(300);
    AdoConnectCheckTimer.Free;
    AlarmSound.Free;
    ArmAreaStateTimer.Free;
    DaemonReceiveTimer.free;
    DaemonLiveCheckTimer.Free;
    DaemonLiveRecvTimer.Free;
    DaemonMessageVisibleTimer1.Free;
    DBSocketReceiveTimer.Free;
    LiveTimer.Free;
    MessageTimer.Free;
    NowTimer.Free;
    PeronRelayTimer1.Free;
    SendDaemonTimer.Free;
    ServerConnectTimer.Free;
    StateCheckTimer.Free;
  Except
    Exit;
  End;
end;

procedure TfmMain.NodeConnectState(Sender: TObject; NodeNo: integer;
  aConnectState: TNodeCurrentState);
var
  fmAlarmTypeMonitoring :TForm;
  fmAccessTypeMonitoring :TForm;
  fmBuildingAccessTypeMonitoring :TForm;
  fmMonitor : TForm;
  fmKTTypeMonitoring : TForm;
  fmAlarmMapMonitoring : TForm;
  fmAccessMapMonitoring : TForm;
begin
  if G_bApplicationTerminate then Exit;
  //여기에서 노드 컨넥션 상태값 변경 될때 모니터링 상태값 변경 해 주자.
  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    fmAlarmTypeMonitoring := MDIForm('TfmAlarmTypeMonitoring');
    if fmAlarmTypeMonitoring <> nil then
    begin
      TfmAlarmTypeMonitoring(fmAlarmTypeMonitoring).NodeConnectState(NodeNo,aConnectState);
    end;
  end;
  if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    fmAccessTypeMonitoring := MDIForm('TfmAccessTypeMonitoring');
    if fmAccessTypeMonitoring <> nil then
    begin
      TfmAccessTypeMonitoring(fmAccessTypeMonitoring).NodeConnectState(NodeNo,aConnectState);
    end;
  end;
  if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    fmBuildingAccessTypeMonitoring := MDIForm('TfmBuildingAccessTypeMonitoring');
    if fmBuildingAccessTypeMonitoring <> nil then
    begin
      TfmBuildingAccessTypeMonitoring(fmBuildingAccessTypeMonitoring).NodeConnectState(NodeNo,aConnectState);
    end;
  end;
  if G_bFormEnabled[con_Monitoring] then
  begin
//    if G_nMultiDaemon = 0 then
//    begin
      fmMonitor := MDIForm('TfmMonitoring');
//    end else if G_nMultiDaemon = 1 then
//    begin
//      fmMonitor := MDIForm('TfmMultiMonitoring');
//    end;
    if fmMonitor <> nil then
    begin
//      if G_nMultiDaemon = 0 then
        TfmMonitoring(fmMonitor).NodeConnectState(NodeNo,aConnectState);
//      else if G_nMultiDaemon = 1 then
//        TfmMultiMonitoring(fmMonitor).NodeConnectState(NodeNo,aConnectState);
    end;
  end;
  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
    if fmKTTypeMonitoring <> nil then
    begin
      TfmKTTypeMonitoring(fmKTTypeMonitoring).NodeConnectState(NodeNo,aConnectState);
    end;
  end;
  if G_bFormEnabled[con_AlarmMapMonitoring] then
  begin
    fmAlarmMapMonitoring := MDIForm('TfmAlarmMapMonitoring');
    if fmAlarmMapMonitoring <> nil then
    begin
      TfmAlarmMapMonitoring(fmAlarmMapMonitoring).NodeConnectState(NodeNo,aConnectState);
    end;
  end;
  if G_bFormEnabled[con_AccessMapMonitoring] then
  begin
    fmAccessMapMonitoring := MDIForm('TfmAccessMapMonitoring');
    if fmAccessMapMonitoring <> nil then
    begin
      TfmAccessMapMonitoring(fmAccessMapMonitoring).NodeConnectState(NodeNo,aConnectState);
    end;
  end;
end;

procedure TfmMain.DeviceConnected(Sender: TObject; Value: Boolean;
  NodeNo: integer; aEcuID: string);
var
  fmAlarmTypeMonitoring :TForm;
  fmAccessTypeMonitoring :TForm;
  fmBuildingAccessTypeMonitoring :TForm;
  fmMonitor : TForm;
  fmKTTypeMonitoring : TForm;
  fmAlarmMapMonitoring : TForm;
  fmAccessMapMonitoring : TForm;
begin
  if G_bApplicationTerminate then Exit;
  //기기별 접속상태가 변경 되면 이쪽 루틴으로 여기서 모니터링 디스플레이 하자
  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    fmAlarmTypeMonitoring := MDIForm('TfmAlarmTypeMonitoring');
    if fmAlarmTypeMonitoring <> nil then
    begin
      TfmAlarmTypeMonitoring(fmAlarmTypeMonitoring).DeviceConnected(NodeNo,aEcuID,Value);
    end;
  end;
  if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    fmAccessTypeMonitoring := MDIForm('TfmAccessTypeMonitoring');
    if fmAccessTypeMonitoring <> nil then
    begin
      TfmAccessTypeMonitoring(fmAccessTypeMonitoring).DeviceConnected(NodeNo,aEcuID,Value);
    end;
  end;
  if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    fmBuildingAccessTypeMonitoring := MDIForm('TfmBuildingAccessTypeMonitoring');
    if fmBuildingAccessTypeMonitoring <> nil then
    begin
      TfmBuildingAccessTypeMonitoring(fmBuildingAccessTypeMonitoring).DeviceConnected(NodeNo,aEcuID,Value);
    end;
  end;
  if G_bFormEnabled[con_AlarmMapMonitoring] then
  begin
    fmAlarmMapMonitoring := MDIForm('TfmAlarmMapMonitoring');
    if fmAlarmMapMonitoring <> nil then
    begin
      TfmAlarmMapMonitoring(fmAlarmMapMonitoring).DeviceConnected(NodeNo,aEcuID,Value);
    end;
  end;
  if G_bFormEnabled[con_AccessMapMonitoring] then
  begin
    fmAccessMapMonitoring := MDIForm('TfmAccessMapMonitoring');
    if fmAccessMapMonitoring <> nil then
    begin
      TfmAccessMapMonitoring(fmAccessMapMonitoring).DeviceConnected(NodeNo,aEcuID,Value);
    end;
  end;

  if G_bFormEnabled[con_Monitoring] then
  begin
//    if G_nMultiDaemon = 0 then
//    begin
      fmMonitor := MDIForm('TfmMonitoring');
//    end else if G_nMultiDaemon = 1 then
//    begin
//      fmMonitor := MDIForm('TfmMultiMonitoring');
//    end;
    if fmMonitor <> nil then
    begin
//      if G_nMultiDaemon = 0 then
        TfmMonitoring(fmMonitor).DeviceConnected(NodeNo,aEcuID,Value);
//      else if G_nMultiDaemon = 1 then
//        TfmMultiMonitoring(fmMonitor).DeviceConnected(NodeNo,aEcuID,Value);
    end;
  end;
  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
    if fmKTTypeMonitoring <> nil then
    begin
      TfmKTTypeMonitoring(fmKTTypeMonitoring).DeviceConnected(NodeNo,aEcuID,Value);
    end;
  end;

end;

procedure TfmMain.DoorStateChange(Sender: TObject; NodeNo: integer; aEcuID,
  aDoorNo: string; aDoorManageType: TDoorManageMode;
  aDoorPNType: TDoorPNMode; aDoorStateType: TDoorDSState;
  aDoorLockType:TDoorLockState;aDoorFire:Boolean);
var
  fmAccessTypeMonitoring :TForm;
  fmBuildingAccessTypeMonitoring :TForm;
  fmMonitor :TForm;
  fmKTTypeMonitoring : TForm;
  fmAccessMapMonitoring : TForm;
  i : integer;
begin
  if G_bApplicationTerminate then Exit;
  //출입문 상태가 변경 됨
  if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    fmAccessTypeMonitoring := MDIForm('TfmAccessTypeMonitoring');
    if fmAccessTypeMonitoring <> nil then
    begin
      TfmAccessTypeMonitoring(fmAccessTypeMonitoring).DoorStateChange(NodeNo,
          aEcuID, aDoorNo, aDoorManageType,aDoorPNType,aDoorStateType,aDoorLockType,aDoorFire);
    end;
  end;
  if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    fmBuildingAccessTypeMonitoring := MDIForm('TfmBuildingAccessTypeMonitoring');
    if fmBuildingAccessTypeMonitoring <> nil then
    begin
      TfmBuildingAccessTypeMonitoring(fmBuildingAccessTypeMonitoring).DoorStateChange(NodeNo,
          aEcuID, aDoorNo, aDoorManageType,aDoorPNType,aDoorStateType,aDoorLockType,aDoorFire);
    end;
  end;

  if G_bFormEnabled[con_Monitoring] then
  begin
//    if G_nMultiDaemon = 0 then
//    begin
      fmMonitor := MDIForm('TfmMonitoring');
//    end else if G_nMultiDaemon = 1 then
//    begin
//      fmMonitor := MDIForm('TfmMultiMonitoring');
//    end;
    if fmMonitor <> nil then
    begin
//      if G_nMultiDaemon = 0 then
        TfmMonitoring(fmMonitor).DoorStateChange(NodeNo,
          aEcuID, aDoorNo, aDoorManageType,aDoorPNType,aDoorStateType,aDoorLockType,aDoorFire);
//      else if G_nMultiDaemon = 1 then
//        TfmMultiMonitoring(fmMonitor).DoorStateChange(NodeNo,
//          aEcuID, aDoorNo, aDoorManageType,aDoorPNType,aDoorStateType,aDoorLockType);
    end;
  end;
  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
    if fmKTTypeMonitoring <> nil then
    begin
      TfmKTTypeMonitoring(fmKTTypeMonitoring).DoorStateChange(NodeNo,
          aEcuID, aDoorNo, aDoorManageType,aDoorPNType,aDoorStateType,aDoorLockType,aDoorFire);
    end;
  end;

  if G_bFormEnabled[con_AccessMapMonitoring] then
  begin
    fmAccessMapMonitoring := MDIForm('TfmAccessMapMonitoring');
    if fmAccessMapMonitoring <> nil then
    begin
      TfmAccessMapMonitoring(fmAccessMapMonitoring).DoorStateChange(NodeNo,
          aEcuID, aDoorNo, aDoorManageType,aDoorPNType,aDoorStateType,aDoorLockType,aDoorFire);
    end;
  end;

  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(NodeNo,
          aEcuID, aDoorNo, aDoorManageType,aDoorPNType,aDoorStateType,aDoorLockType,aDoorFire);
  end;

  if G_bDoorOpenAlarmUse and FileExists(G_stDoorOpenAlaramFile) then 
  begin
    MediaPlayer3.Close;
    MediaPlayer3.FileName := G_stDoorOpenAlaramFile;
    MediaPlayer3.Open;
    MediaPlayer3.play;
  end;
end;

procedure TfmMain.AlarmEventSoundStatusCodeLoad;
var
  stSql : string;
  TempAdoQuery :TADOQuery;

begin
  AlarmEventSoundStatusCode.Clear;
  AlarmEventSoundColor.Clear;

  stSql := ' Select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' Where AL_ALARMSOUND = 1 ';

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

      While Not Eof do
      begin
        AlarmEventSoundStatusCode.Add(FindField('AL_ALARMSTATUSCODE').AsString);
        AlarmEventSoundColor.Add(inttostr(FindField('AL_COLOR').AsInteger));
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;


end;

procedure TfmMain.AlarmEventViewStatusCodeLoad;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin

  AlarmEventArmStateEvent.Clear;

  AlarmEventViewStatusCode.Clear;

  stSql := ' Select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' Where AL_ALARMVIEW = 1 ';

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

      While Not Eof do
      begin
        AlarmEventViewStatusCode.Add(FindField('AL_ALARMSTATUSCODE').AsString);
        AlarmEventArmStateEvent.Add(FindField('AL_ARMEVENT').AsString);
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.AlarmModeChanged(Sender: TObject; NodeNo: integer;
  aEcuID,aAlarmArea: string; aWachMode: TWatchMode);
var
  fmAlarmTypeMonitoring :TForm;
  fmMonitor :TForm;
  fmKTTypeMonitoring :TForm;
  fmAlarmMapMonitoring : TForm;
  i : integer;
begin
  if G_bApplicationTerminate then Exit;
  //AlarmMode Change = 경 해 변경 
  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    fmAlarmTypeMonitoring := MDIForm('TfmAlarmTypeMonitoring');
    if fmAlarmTypeMonitoring <> nil then
    begin
      TfmAlarmTypeMonitoring(fmAlarmTypeMonitoring).AlarmModeChanged(NodeNo,aEcuID,aAlarmArea,aWachMode);
    end;
  end;

  if G_bFormEnabled[con_Monitoring] then
  begin
//    if G_nMultiDaemon = 0 then
//    begin
      fmMonitor := MDIForm('TfmMonitoring');
//    end else if G_nMultiDaemon = 1 then
//    begin
//      fmMonitor := MDIForm('TfmMultiMonitoring');
//    end;
    if fmMonitor <> nil then
    begin
//      if G_nMultiDaemon = 0 then
        TfmMonitoring(fmMonitor).AlarmModeChanged(NodeNo,aEcuID,aAlarmArea,aWachMode);
//      else if G_nMultiDaemon = 1 then
//        TfmMultiMonitoring(fmMonitor).AlarmModeChanged(NodeNo,aEcuID,aWachMode);
    end;
  end;
  
  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
    if fmKTTypeMonitoring <> nil then
    begin
      TfmKTTypeMonitoring(fmKTTypeMonitoring).AlarmModeChanged(NodeNo,aEcuID,aAlarmArea,aWachMode);
    end;
  end;

  if G_bFormEnabled[con_AlarmMapMonitoring] then
  begin
    fmAlarmMapMonitoring := MDIForm('TfmAlarmMapMonitoring');
    if fmAlarmMapMonitoring <> nil then
    begin
      TfmAlarmMapMonitoring(fmAlarmMapMonitoring).AlarmModeChanged(NodeNo,aEcuID,aAlarmArea,aWachMode);
    end;
  end;

  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).AlarmModeChanged(NodeNo,aEcuID,aAlarmArea,aWachMode);
  end;

end;

procedure TfmMain.ExitButtonPress(Sender: TObject; NodeNo: integer; aEcuID,
  aDoorNo, aTime,aInputType: string);
var
  fmAccessTypeMonitoring :TForm;
  fmBuildingAccessTypeMonitoring :TForm;
  fmMonitor : TForm;
  fmKTTypeMonitoring : TForm;
  fmAccessMapMonitoring : TForm;
  stUserName : string;
  stPermit : string;
  stPermitCode : string;
begin
  if G_nAccessEventSearch = 1 then Exit;  //카드이벤트만 조회시 빠져 나감
  if G_bApplicationTerminate then Exit;
    //퇴실 버튼 누른 경우
  stPermitCode := '0';
  case aInputType[1] of
  'R': begin
       stUserName :=  '원격제어';
       stPermit := '원격제어열림';
       end;
  'P': begin
       stUserName :=  '전화';
       stPermit := '전화제어열림';
       end;
  'B': begin
       stUserName := '퇴실버튼';
       stPermit := '퇴실버튼열림';
       end;
  'S': begin
       stUserName := '스케줄';
       stPermit := '스케줄열림';
       end;
  'F': begin
       stUserName := '화재발생';
       stPermit := '화재열림';
       end;
  'f': begin
       stUserName := '원격화재';
       stPermit := '원격화재열림';
       end;
  'C': begin
       stUserName := '카드';
       stPermit := '카드열림';
       end;
  else stUserName:= aInputType;
  end;
  if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    fmAccessTypeMonitoring := MDIForm('TfmAccessTypeMonitoring');
    if fmAccessTypeMonitoring <> nil then
    begin
      TfmAccessTypeMonitoring(fmAccessTypeMonitoring).ExitButtonPress(NodeNo,aEcuID,aDoorNo,aTime,aInputType,stUserName,stPermitCode,stPermit);
    end;
  end;
  if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    fmBuildingAccessTypeMonitoring := MDIForm('TfmBuildingAccessTypeMonitoring');
    if fmBuildingAccessTypeMonitoring <> nil then
    begin
      TfmBuildingAccessTypeMonitoring(fmBuildingAccessTypeMonitoring).ExitButtonPress(NodeNo,aEcuID,aDoorNo,aTime,aInputType,stUserName,stPermitCode,stPermit);
    end;
  end;

  if G_bFormEnabled[con_Monitoring] then
  begin
//    if G_nMultiDaemon = 0 then
//    begin
      fmMonitor := MDIForm('TfmMonitoring');
//    end else if G_nMultiDaemon = 1 then
//    begin
//      fmMonitor := MDIForm('TfmMultiMonitoring');
//    end;
    if fmMonitor <> nil then
    begin
//      if G_nMultiDaemon = 0 then
        TfmMonitoring(fmMonitor).ExitButtonPress(NodeNo,aEcuID,aDoorNo,aTime,aInputType,stUserName,stPermitCode,stPermit);
//      else if G_nMultiDaemon = 1 then
//        TfmMultiMonitoring(fmMonitor).ExitButtonPress(NodeNo,aEcuID,aDoorNo,aTime,aInputType,stUserName,stPermitCode,stPermit);
    end;
  end;
  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
    if fmKTTypeMonitoring <> nil then
    begin
      TfmKTTypeMonitoring(fmKTTypeMonitoring).ExitButtonPress(NodeNo,aEcuID,aDoorNo,aTime,aInputType,stUserName,stPermitCode,stPermit);
    end;
  end;
  if G_bFormEnabled[con_AccessMapMonitoring] then
  begin
    fmAccessMapMonitoring := MDIForm('TfmAccessMapMonitoring');
    if fmAccessMapMonitoring <> nil then
    begin
      TfmAccessMapMonitoring(fmAccessMapMonitoring).ExitButtonPress(NodeNo,aEcuID,aDoorNo,aTime,aInputType,stUserName,stPermitCode,stPermit);
    end;
  end;


end;

procedure TfmMain.AlarmEventAnalysis(Sender: TObject; NodeNo: integer;
  ECUID,aArmAreaNo, aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode,
  aStatusCode, aPortNo, aState, aOperator, aNewStateCode: string;
  aAlarmView, aAlarmSound: Boolean;aColor:string);
var
  fmAlarmTypeMonitoring :TForm;
  fmMonitor : TForm;
  fmKTTypeMonitoring : TForm;
  fmAlarmMapMonitoring : TForm;
  nIndex : integer;
  stDeviceName : string;
begin
  if G_bApplicationTerminate then Exit;
  //Alarm Event 발생시 이벤트 발생

  if ACAlarmEventUse then    //출입전용 모니터링 에서 알람 발생 필요 한경우
  begin
    nIndex := DeviceStateList.IndexOf(FillZeroNumber(NodeNo,3) + ECUID);
    if nIndex > -1 then
    begin
      stDeviceName := TDeviceState(DeviceStateList.Objects[nIndex]).DeviceName;
    end;
    if Pos(aStatusCode,ACAlarmEventCode) > 0 then
    begin
      pan_Message.Visible := True;
      st_Message.Caption :=  stDeviceName + ' 이상 발생';
      MessageTimer.Enabled := True;
      self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
      self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
    end;
  end;

  if G_bModeChangSound then
  begin
    if Not L_bSound then
    begin
      if (aNewStateCode = 'A1') or (aNewStateCode = 'A2') or (aNewStateCode = 'A3') or (aNewStateCode = 'A4') then
      begin
        if FileExists(G_stModeChangeArmSound) then
        begin
          MediaPlayer2.Close;
          MediaPlayer2.FileName := G_stModeChangeArmSound;
          MediaPlayer2.Open;
          MediaPlayer2.play;
        end;
      end else if (aNewStateCode = 'C1') or (aNewStateCode = 'C2') or (aNewStateCode = 'C3') or (aNewStateCode = 'C4') then
      begin
        if FileExists(G_stModeChangeDisArmSound) then
        begin
          MediaPlayer2.Close;
          MediaPlayer2.FileName := G_stModeChangeDisArmSound;
          MediaPlayer2.Open;
          MediaPlayer2.play;
        end;
      end;
    end;
  end;

  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    fmAlarmTypeMonitoring := MDIForm('TfmAlarmTypeMonitoring');
    if fmAlarmTypeMonitoring <> nil then
    begin
      TfmAlarmTypeMonitoring(fmAlarmTypeMonitoring).AlarmEventProcess(NodeNo,
        ECUID,aArmAreaNo, aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode,
        aStatusCode, aPortNo, aState, aOperator, aNewStateCode,
        aAlarmView, aAlarmSound,aColor);
    end;
  end;
  if G_bFormEnabled[con_Monitoring] then
  begin
//    if G_nMultiDaemon = 0 then
//    begin
      fmMonitor := MDIForm('TfmMonitoring');
//    end else if G_nMultiDaemon = 1 then
//    begin
//      fmMonitor := MDIForm('TfmMultiMonitoring');
//    end;
    if fmMonitor <> nil then
    begin
//      if G_nMultiDaemon = 0 then
        TfmMonitoring(fmMonitor).AlarmEventProcess(NodeNo,
        ECUID,aArmAreaNo, aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode,
        aStatusCode, aPortNo, aState, aOperator, aNewStateCode,
        aAlarmView, aAlarmSound,aColor) ;
//      else if G_nMultiDaemon = 1 then
//        TfmMultiMonitoring(fmMonitor).AlarmEventProcess(NodeNo,
//        ECUID, aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode,
//        aStatusCode, aPortNo, aState, aOperator, aNewStateCode,
//        aAlarmView, aAlarmSound,aColor);
    end;
  end;
  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
    if fmKTTypeMonitoring <> nil then
    begin
      TfmKTTypeMonitoring(fmKTTypeMonitoring).AlarmEventProcess(NodeNo,
        ECUID,aArmAreaNo, aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode,
        aStatusCode, aPortNo, aState, aOperator, aNewStateCode,
        aAlarmView, aAlarmSound,aColor);
    end;
  end;
  if G_bFormEnabled[con_AlarmMapMonitoring] then
  begin
    fmAlarmMapMonitoring := MDIForm('TfmAlarmMapMonitoring');
    if fmAlarmMapMonitoring <> nil then
    begin
      TfmAlarmMapMonitoring(fmAlarmMapMonitoring).AlarmEventProcess(NodeNo,
        ECUID,aArmAreaNo, aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode,
        aStatusCode, aPortNo, aState, aOperator, aNewStateCode,
        aAlarmView, aAlarmSound,aColor);
    end;
  end;
end;

procedure TfmMain.AccessEventProcess(Sender: TObject; NodeNo: integer;
  aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
  aButton,aArmAreaNo: string);
var
  fmAlarmTypeMonitoring :TForm;
  fmAccessTypeMonitoring :TForm;
  fmBuildingAccessTypeMonitoring :TForm;
  fmKTTypeMonitoring : TForm;
  fmMonitor : TForm;
  fmAlarmMapMonitoring : TForm;
  fmAccessMapMonitoring : TForm;
begin
  if G_bApplicationTerminate then Exit;
  //출입 데이터 발생시
  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    fmAlarmTypeMonitoring := MDIForm('TfmAlarmTypeMonitoring');
    if fmAlarmTypeMonitoring <> nil then
    begin
      TfmAlarmTypeMonitoring(fmAlarmTypeMonitoring).AccessEventProcess(NodeNo,
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo);
    end;
  end;
  if G_bFormEnabled[con_AccessTypeMonitoring] then
  begin
    fmAccessTypeMonitoring := MDIForm('TfmAccessTypeMonitoring');
    if fmAccessTypeMonitoring <> nil then
    begin
      TfmAccessTypeMonitoring(fmAccessTypeMonitoring).AccessEventProcess(NodeNo,
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo);
    end;
  end;
  if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then
  begin
    fmBuildingAccessTypeMonitoring := MDIForm('TfmBuildingAccessTypeMonitoring');
    if fmBuildingAccessTypeMonitoring <> nil then
    begin
      TfmBuildingAccessTypeMonitoring(fmBuildingAccessTypeMonitoring).AccessEventProcess(NodeNo,
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo);
    end;
  end;
  if G_bFormEnabled[con_Monitoring] then
  begin
//    if G_nMultiDaemon = 0 then
//    begin
      fmMonitor := MDIForm('TfmMonitoring');
//    end else if G_nMultiDaemon = 1 then
//    begin
//      fmMonitor := MDIForm('TfmMultiMonitoring');
//    end;
    if fmMonitor <> nil then
    begin
//      if G_nMultiDaemon = 0 then
        TfmMonitoring(fmMonitor).AccessEventProcess(NodeNo,
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo);
//      else if G_nMultiDaemon = 1 then
//        TfmMultiMonitoring(fmMonitor).AccessEventProcess(NodeNo,
//          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
//          aButton);
    end;
  end;
  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
    if fmKTTypeMonitoring <> nil then
    begin
      TfmKTTypeMonitoring(fmKTTypeMonitoring).AccessEventProcess(NodeNo,
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo);
    end;
  end; 
  if G_bFormEnabled[con_AlarmMapMonitoring] then
  begin
    fmAlarmMapMonitoring := MDIForm('TfmAlarmMapMonitoring');
    if fmAlarmMapMonitoring <> nil then
    begin
      TfmAlarmMapMonitoring(fmAlarmMapMonitoring).AccessEventProcess(NodeNo,
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo);
    end;
  end;
  if G_bFormEnabled[con_AccessMapMonitoring] then
  begin
    fmAccessMapMonitoring := MDIForm('TfmAccessMapMonitoring');
    if fmAccessMapMonitoring <> nil then
    begin
      TfmAccessMapMonitoring(fmAccessMapMonitoring).AccessEventProcess(NodeNo,
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo);
    end;
  end;
end;

procedure TfmMain.CommandArrayCommandsTAlarmSoundExecute(Command: TCommand;
  Params: TStringList);
var
  stAlarmSoundFile : string;
begin
  stAlarmSoundFile := Params.Values['VALUE'];
  AlarmSoundFileList.Add(stAlarmSoundFile);
  L_nCurrentAlarmCnt := G_nAlarmCount;

end;

procedure TfmMain.AlarmRefresh(Sender: TObject);
var
  fmForm :TForm;
  stSql : string;
  stDeviceID : string;
  nDeviceIndex : integer;
  i : integer;
begin
  if G_bApplicationTerminate then Exit;

  (*
  for i := 0 to DeviceStateList.Count - 1 do
  begin
    TDeviceState(DeviceStateList.Objects[i]).AlaramEventClear;
    //TDeviceState(DeviceStateList.Objects[i]).AlarmEventState := aeNormal;
  end; *)
  
  for i := 0 to ArmAreaStateList.Count - 1 do
  begin
    TArmAreaState(ArmAreaStateList.Objects[i]).AlarmEventState := aeNormal;
    Application.ProcessMessages;
  end;

  //알람 조회
  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    fmForm := MDIForm('TfmAlarmTypeMonitoring');
    if fmForm <> nil then
    begin
      TfmAlarmTypeMonitoring(fmForm).AlarmListClear;
    end;
  end;

  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmForm := MDIForm('TfmKTTypeMonitoring');
    if fmForm <> nil then
    begin
      TfmKTTypeMonitoring(fmForm).AlarmListClear;
    end;
  end;

  G_bAlarmRefreshStart := False;
end;

procedure TfmMain.BuildingAlarmEventProcess(Sender: TObject;
  aBuildingCode: string; aAlaramState: TAlarmEventState);
var
  fmAlarmTypeMonitoring :TForm;
begin
  if G_bApplicationTerminate then Exit;

  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    fmAlarmTypeMonitoring := MDIForm('TfmAlarmTypeMonitoring');
    if fmAlarmTypeMonitoring <> nil then
    begin
      TfmAlarmTypeMonitoring(fmAlarmTypeMonitoring).BuildingAlarmEventProcess(aBuildingCode,aAlaramState);
    end;
  end;

end;

procedure TfmMain.DeviceAlarmEventProcess(Sender: TObject; NodeNo: integer;
  ECUID,aArmAreaNo: string; aAlaramState: TAlarmEventState);
var
  fmAlarmTypeMonitoring :TForm;
  fmMonitor : TForm;
  fmKTTypeMonitoring : TForm;
  fmAlarmMapMonitoring : TForm;
  i : integer;
begin
  if G_bApplicationTerminate then Exit;

  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    fmAlarmTypeMonitoring := MDIForm('TfmAlarmTypeMonitoring');
    if fmAlarmTypeMonitoring <> nil then
    begin
      TfmAlarmTypeMonitoring(fmAlarmTypeMonitoring).DeviceAlarmEventProcess(NodeNo,ECUID,aArmAreaNo,aAlaramState);
    end;
  end;
  if G_bFormEnabled[con_Monitoring] then
  begin
//    if G_nMultiDaemon = 0 then
//    begin
      fmMonitor := MDIForm('TfmMonitoring');
//    end else if G_nMultiDaemon = 1 then
//    begin
//      fmMonitor := MDIForm('TfmMultiMonitoring');
//    end;
    if fmMonitor <> nil then
    begin
//      if G_nMultiDaemon = 0 then
        TfmMonitoring(fmMonitor).DeviceAlarmEventProcess(NodeNo,ECUID,aArmAreaNo,aAlaramState);
//      else if G_nMultiDaemon = 1 then
//        TfmMultiMonitoring(fmMonitor).DeviceAlarmEventProcess(NodeNo,ECUID,aAlaramState);
    end;
  end;
  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
    if fmKTTypeMonitoring <> nil then
    begin
      TfmKTTypeMonitoring(fmKTTypeMonitoring).DeviceAlarmEventProcess(NodeNo,ECUID,aArmAreaNo,aAlaramState);
    end;
  end;

  if G_bFormEnabled[con_AlarmMapMonitoring] then
  begin
    fmAlarmMapMonitoring := MDIForm('TfmAlarmMapMonitoring');
    if fmAlarmMapMonitoring <> nil then
    begin
      TfmAlarmMapMonitoring(fmAlarmMapMonitoring).DeviceAlarmEventProcess(NodeNo,ECUID,aArmAreaNo,aAlaramState);
    end;
  end;

  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).DeviceAlarmEventProcess(NodeNo,ECUID,aArmAreaNo,aAlaramState);
  end;

end;

procedure TfmMain.DaemonReceiveTimerTimer(Sender: TObject);
var
  stTemp : string;
begin
  if G_bApplicationTerminate then Exit;
  Try
    DaemonReceiveTimer.Enabled := False;
    Try
      FReceiveTCS.Enter;
      if ReceiveDataList.Count < 1 then Exit;
      stTemp := ReceiveDataList.Strings[0];
      fmMain.ReceiveDataList.Delete(0);
    Finally
      FReceiveTCS.Leave;
    End;
    MonitoringDataProcess(stTemp)
  Finally
    if Not G_bApplicationTerminate then
    DaemonReceiveTimer.Enabled := True;
  End;
end;

procedure TfmMain.AlarmSoundTimer(Sender: TObject);
var
  stAlarmSoundFile : string;
begin
  if G_bApplicationTerminate then Exit;

  //StatusBar1.Panels[2].Text := 'AlarmSoundTimer Start';
  if AlarmSoundFileList.Count < 1 then Exit;
  Try
    AlarmSound.Enabled := False;

    stAlarmSoundFile := AlarmSoundFileList.Strings[0];
    if G_nAlarmCount <> 0 then
    begin
      L_nCurrentAlarmCnt := L_nCurrentAlarmCnt -1;
      if(L_nCurrentAlarmCnt <=0) then AlarmSoundFileList.Delete(0); 
    end;

    //AlarmSoundFileList.Delete(0);
    //if L_bSound then Exit;
    if FileExists(stAlarmSoundFile) then
    begin
      if G_bApplicationTerminate then exit;
      StatusBar1.Panels[2].Text := stAlarmSoundFile + 'AlarmSound';
      //SndPlaySound(PChar(stAlarmSoundFile),snd_Async);
      Try
        //L_bSound := True;
        AlarmPlayStop := False;
        MediaPlayer2.Close;
        MediaPlayer1.Close;
        MediaPlayer1.FileName := stAlarmSoundFile;
        MediaPlayer1.Open;
        MediaPlayer1.play;
        while Not AlarmPlayStop  do
        begin
          if G_bApplicationTerminate then Exit;
          Application.ProcessMessages;
        end;
      Finally
        //L_bSound := False;
      End;
      //StatusBar1.Panels[2].Text := 'AlarmSoundTimer Start';

    end;
  Finally
    AlarmSound.Enabled := Not G_bApplicationTerminate;
  End;

end;


procedure TfmMain.Action_AccessTypeMonitoringExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_AccessTypeMonitoring.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAccessTypeMonitoring',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.N45Click(Sender: TObject);
begin
  MDIChildShow('TfmDeviceListReport');

end;

procedure TfmMain.LoadNode;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  TempNodeState : TNodeState;
  stNodeNo : string;
  nCardType : integer;
begin
  NodeList.Clear;      //노드별 기기 정보

  stSql := 'Select * from TB_ACCESSDEVICE  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  stSql := stSql + ' Order by AC_VIEWSEQ, AC_NODENO ';

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
      While Not Eof do
      begin
        nCardType := CARDLENGTHTYPE ; //0-고정(4Byte),1-가변(G_nCardFixedLength 에 따름)
        if Not FindField('AC_CARDBYTE').IsNull then nCardType := FindField('AC_CARDBYTE').AsInteger; //0-고정(4Byte),1-가변(G_nCardFixedLength 에 따름)
        stNodeNo := FillZeroNumber(FindField('AC_NODENO').asInteger,3);
//        stEcuID := FindField('AC_ECUID').AsString;
          //노드 정보 생성
        TempNodeState := TNodeState.Create(self);
        TempNodeState.NodeNo := FindField('AC_NODENO').asInteger;
        TempNodeState.NodeIP := FindField('AC_MCUIP').asstring;
        TempNodeState.NodeName := FindField('AC_DEVICENAME').asstring;
        TempNodeState.CardFixType := nCardType;
        TempNodeState.NodeConnected := False;

        TempNodeState.OnNodeConnectState := NodeConnectState;

        NodeList.AddObject(stNodeNo,TempNodeState);

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

procedure TfmMain.FireRecovery(Sender: TObject);
begin
  MessageTimer.Enabled := False;
  pan_Message.Visible := False;

end;
{
procedure TfmMain.ServerConnectEvent(Sender: TObject; aValue: Boolean);
begin

end;
 }
procedure TfmMain.CommandArrayCommandsTAlarmReportExecute(
  Command: TCommand; Params: TStringList);
var
  stAlarmID : string;
  fmAlarmReport : TForm;
begin
  stAlarmID := Params.Values['ALARMID'];
  MDIChildShow('TfmNewAlarmReport');
  fmAlarmReport := MDIForm('TfmNewAlarmReport');
  if fmAlarmReport <> nil then
  begin
    TfmNewAlarmReport(fmAlarmReport).AlarmIDView(stAlarmID);
  end;

end;

procedure TfmMain.CommandArrayCommandsTLOCATIONMAPExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
  stID : string;
begin
  stValue := Params.Values['VALUE'];
  stID := Params.Values['ID'];
  if UpperCase(stValue) = 'FALSE' then
  begin
    if LocationMapList.IndexOf(stID) > -1 then LocationMapList.Delete(LocationMapList.IndexOf(stID));
  end;
  
end;

procedure TfmMain.mn_empChangeReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmChangeAccessReport');
  self.FindClassForm('TfmChangeAccessReport').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.BuildingAlarmModeProcess(Sender: TObject;
  aBuildingCode: string; aAlramMode: TWatchMode);
var
  fmAlarmTypeMonitoring :TForm;
begin
  if G_bApplicationTerminate then Exit;

  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    fmAlarmTypeMonitoring := MDIForm('TfmAlarmTypeMonitoring');
    if fmAlarmTypeMonitoring <> nil then
    begin
      TfmAlarmTypeMonitoring(fmAlarmTypeMonitoring).BuildingAlarmModeProcess(aBuildingCode,aAlramMode);
    end;
  end;

end;

procedure TfmMain.DaemonLiveCheckTimerTimer(Sender: TObject);
var
  stSendData : string;
begin
  if G_bApplicationTerminate then Exit;
  DaemonLiveCheckTimer.Enabled := False;
  L_nRecvPacketCount := 0;
  Try
{$IFDEF TApdWinsockport}
    if Not WinsockPort1.Open then Exit;
{$ELSE}
    if Not WinsockPort.Active then Exit;
{$ENDIF}
    if ReceiveDataList.Count > 0 then
    begin
      Exit;
    end;
    stSendData := 'BROADCAST'+ DATADELIMITER + '000000000'+ DATADELIMITER + 'DAEMONLIVE' + DATADELIMITER;
    SendDaemonDataList.Add(stSendData);
  Finally
    if G_nMonitorSockType = 0 then DaemonLiveRecvTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

procedure TfmMain.DaemonLiveRecvTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  DaemonLiveRecvTimer.Enabled := False;
  Try
    if L_bShowModalVisible then
    begin
      L_bDaemonLiveReceive := False;
      DaemonMessageVisibleTimer1.Enabled := False;
      Exit;
    end;
    //if Not WinsockPort.Open then Exit;
    if L_nRecvPacketCount > 0 then
    begin
      L_bDaemonLiveReceive := False;
      DaemonMessageVisibleTimer1.Enabled := False;
      Exit;
    end;
    if L_bDaemonLiveReceive then
    begin
      L_bDaemonLiveReceive := False;
      DaemonMessageVisibleTimer1.Enabled := False;
      Exit;
    end;
    //StatusBar1.Panels[2].Text := 'DaemonLiveRecvTimerTimer WinSock Close';
{$IFDEF TApdWinsockport}
    WinsockPort1.Open := False;
{$ELSE}
    WinsockPort.Active := False;
{$ENDIF}
    LogSave(ExeFolder + '\..\log\Monitor'+ FormatDateTIme('yyyymmdd',Now)+'.log','DAEMON COM ERROR ');
    if PTAlarmUse then
    begin
      self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := PTAlaramFile;
      self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
    end;
  Finally
    DaemonLiveCheckTimer.Enabled := Not G_bApplicationTerminate;
  End;

end;

procedure TfmMain.DaemonLive(Sender: TObject);
begin
  L_bDaemonLiveReceive := True;
  L_nRecvPacketCount := 0;
  //DaemonLiveRecvTimer.Enabled := False;
  DaemonMessageVisibleTimer1.Enabled := False;
  //DaemonLiveCheckTimer.Enabled := False;
  //Randomize;
  //Delay(Random(500));
  //DaemonLiveCheckTimer.Enabled := True;
end;

procedure TfmMain.DaemonMessageVisibleTimer1Timer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  L_bMessageFlag := Not L_bMessageFlag;

  if L_bMessageFlag then
    StatusBar1.Panels[1].Text := '통신데몬 접속 연결 해제'
  else
    StatusBar1.Panels[1].Text := '';

{  inc(L_nDaemonReciveFailCount);
  if L_nDaemonReciveFailCount > 10 then
  begin
    L_nDaemonReciveFailCount := 0;
    if WinsockPort.Open then WinsockPort.Open := False;
  end;
}
end;

procedure TfmMain.mn_cardReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmCardAdminReport');
  self.FindClassForm('TfmCardAdminReport').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.btn_messageClick(Sender: TObject);
begin
  if MediaPlayer1.Mode = mpPlaying then MediaPlayer1.Stop;
  if MediaPlayer2.Mode = mpPlaying then MediaPlayer2.Stop;
  AlarmSoundFileList.Clear;
  MessageTimer.Enabled := False;
  pan_Message.Visible := False;
end;

procedure TfmMain.mn_buildingAlarmReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  if Not IsMaster then
  begin
    showmessage('빌딩별 방범이력 조회 권한이 없습니다.');
    Exit;
  end;
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmBuildingAlarmReport');
  self.FindClassForm('TfmBuildingAlarmReport').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;

end;

procedure TfmMain.RcvCardDataByReader(aData: string);
var
  aIndex: Integer;
  aCardNo:String;
  bCardNo: int64;
  stMsg : string;
  stReaderType : string;
begin
  //STX 삭제
  aIndex:= Pos(#$2,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);
  //ETX삭제
  aIndex:= Pos(#$3,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);

  if aData = 'F' then    //포맷 요청
  begin
    stReaderType := 'C';
    if G_nSpecialProgram = 1 then stReaderType := 'K';
    CardReaderFormatChange(stReaderType);
    Exit;
  end;
  if (aData = 'Y') OR (aData = 'N') then Exit;
  
  aCardNo := aData;
  if G_nCardReaderType = 1 then  //스마트원카드 이면
  begin
    aCardNo := copy(aCardNo,1,6);
    aCardNo := '00' + copy(aCardNo,5,2) + copy(aCardNo,3,2) + copy(aCardNo,1,2);
  end;
  if CARDLENGTHTYPE = 0 then  //고정길이 타입이면
  begin
    if IsNumericCardNo then  //숫자변환이면
    begin
      if G_nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
      begin
        bCardNo:= Hex2Dec64(copy(aCardNo,1,6) + '00');
        aCardNo := inttostr(bCardNo);
      end else
      begin
        bCardNo:= Hex2Dec64(aCardNo);
        aCardNo := inttostr(bCardNo);
      end;
    end;
  end
  else
  begin
    if CARDLENGTHTYPE = 1 then
    begin
      if IsNumericCardNo then  //숫자변환이면
      begin
        if G_nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
        begin
          bCardNo:= Hex2Dec64(copy(aCardNo,1,6) + '00');
          aCardNo := inttostr(bCardNo);
        end else
        begin
          bCardNo:= Hex2Dec64(aCardNo);
          aCardNo := inttostr(bCardNo);
        end;
      end;
    end else if CARDLENGTHTYPE = 2 then
    begin
      aCardNo := aCardNo;  //ASCII 로 데이터를 받으니까 그냥 처리
    end;
  end;

  if (CARDLENGTHTYPE = 0) and IsNumericCardNo then  //고정이며 숫자변환이면
     aCardNo:= FillZeroNumber2(bCardNo,10);

  aCardNo := GetFixedCardNoCheck(aCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);
  if Trim(aCardNo) <> '' then CardReadProcess(aCardNo);

end;

procedure TfmMain.CardReadProcess(aCardNo: string);
var
  fmDupCardEmploy : TForm;
  fmEmploy : TForm;
  fmMDICardAdmin : TForm;
  fmTreeEmployee : TForm;
begin
  if G_bFormEnabled[con_DupCardEmployShow] then
  begin
    fmDupCardEmploy := MDIForm('TfmDupCardEmploy');
    if fmDupCardEmploy <> nil then
    begin
      TfmDupCardEmploy(fmDupCardEmploy).CardReadProcess(aCardNo);
    end;
  end;
  if G_bFormEnabled[con_EmployShow] then
  begin
    fmEmploy := MDIForm('TfmEmploy');
    if fmEmploy <> nil then
    begin
      TfmEmploy(fmEmploy).CardReadProcess(aCardNo);
    end;
  end;
  if G_bFormEnabled[con_MDICardAdminShow] then
  begin
    fmMDICardAdmin := MDIForm('TfmMDICardAdmin');
    if fmMDICardAdmin <> nil then
    begin
      TfmMDICardAdmin(fmMDICardAdmin).CardReadProcess(aCardNo);
    end;
  end;
  if G_bFormEnabled[con_TreeEmployeeShow] then
  begin
    fmTreeEmployee := MDIForm('TfmTreeEmployee');
    if fmTreeEmployee <> nil then
    begin
      TfmTreeEmployee(fmTreeEmployee).CardReadProcess(aCardNo);
    end;
  end;
end;


procedure TfmMain.CommandArrayCommandsTFORMSHOWExecute(Command: TCommand;
  Params: TStringList);
var
  stValue : string;
  stShow : string;
begin
  stValue := Params.Values['VALUE'];
  stShow := Params.Values['SHOW'];

  if UpperCase(stValue) = UpperCase('AccessMapMonitoring') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_AccessMapMonitoring] := True
    else G_bFormEnabled[con_AccessMapMonitoring] := False;
    Monitoring := G_bFormEnabled[con_AccessMapMonitoring];
  end else if UpperCase(stValue) = UpperCase('AccessReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_AccessReport] := True
    else G_bFormEnabled[con_AccessReport] := False;
  end else if UpperCase(stValue) = UpperCase('AccessTypeMonitoring') then      
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_AccessTypeMonitoring] := True
    else G_bFormEnabled[con_AccessTypeMonitoring] := False;
    Monitoring := G_bFormEnabled[con_AccessTypeMonitoring];
  end else if UpperCase(stValue) = UpperCase('AdminChangeReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_AdminChangeReport] := True
    else G_bFormEnabled[con_AdminChangeReport] := False;
  end else if UpperCase(stValue) = UpperCase('AlarmAccessReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_AlarmAccessReport] := True
    else G_bFormEnabled[con_AlarmAccessReport] := False;
  end else if UpperCase(stValue) = UpperCase('AlarmAdminReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_AlarmAdminReport] := True
    else G_bFormEnabled[con_AlarmAdminReport] := False;
  end else if UpperCase(stValue) = UpperCase('AlarmMapMonitoring') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_AlarmMapMonitoring] := True
    else G_bFormEnabled[con_AlarmMapMonitoring] := False;
    Monitoring := G_bFormEnabled[con_AlarmMapMonitoring];
  end else if UpperCase(stValue) = UpperCase('AlarmTypeMonitoring') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_AlarmTypeMonitoring] := True
    else G_bFormEnabled[con_AlarmTypeMonitoring] := False;
    Monitoring := G_bFormEnabled[con_AlarmTypeMonitoring];
  end else if UpperCase(stValue) = UpperCase('ArmGradeReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_ArmGradeReport] := True
    else G_bFormEnabled[con_ArmGradeReport] := False;
  end else if UpperCase(stValue) = UpperCase('BuildingAccessReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_BuildingAccessReport] := True
    else G_bFormEnabled[con_BuildingAccessReport] := False;
  end else if UpperCase(stValue) = UpperCase('BuildingAccessTypeMonitoring') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_BuildingAccessTypeMonitoring] := True
    else G_bFormEnabled[con_BuildingAccessTypeMonitoring] := False;
    Monitoring := G_bFormEnabled[con_BuildingAccessTypeMonitoring];
  end else if UpperCase(stValue) = UpperCase('BuildingAlarmReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_BuildingAlarmReport] := True
    else G_bFormEnabled[con_BuildingAlarmReport] := False;
  end else if UpperCase(stValue) = UpperCase('CardAccessTime') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_CardAccessTime] := True
    else G_bFormEnabled[con_CardAccessTime] := False;
  end else if UpperCase(stValue) = UpperCase('CardAdminReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_CardAdminReport] := True
    else G_bFormEnabled[con_CardAdminReport] := False;
  end else if UpperCase(stValue) = UpperCase('CardList') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_CardList] := True
    else G_bFormEnabled[con_CardList] := False;
  end else if UpperCase(stValue) = UpperCase('CardValidDate') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_CardValidDate] := True
    else G_bFormEnabled[con_CardValidDate] := False;
  end else if UpperCase(stValue) = UpperCase('ChangeAccessReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_ChangeAccessReport] := True
    else G_bFormEnabled[con_ChangeAccessReport] := False;
  end else if UpperCase(stValue) = UpperCase('ComMonitoring') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_ComMonitoring] := True
    else G_bFormEnabled[con_ComMonitoring] := False;
  end else if UpperCase(stValue) = UpperCase('DeviceGradeSearch') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_DeviceGradeSearch] := True
    else G_bFormEnabled[con_DeviceGradeSearch] := False;
  end else if UpperCase(stValue) = UpperCase('DeviceListReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_DeviceListReport] := True
    else G_bFormEnabled[con_DeviceListReport] := False;
  end else if UpperCase(stValue) = UpperCase('DeviceVerInfo') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_DeviceVerInfo] := True
    else G_bFormEnabled[con_DeviceVerInfo] := False;
  end else if UpperCase(stValue) = UpperCase('DoorAdminReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_DoorAdminReport] := True
    else G_bFormEnabled[con_DoorAdminReport] := False;
  end else if UpperCase(stValue) = UpperCase('DoorGradeReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_DoorGradeReport] := True
    else G_bFormEnabled[con_DoorGradeReport] := False;
  end else if UpperCase(stValue) = UpperCase('DoorTypeMonitor') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_DoorTypeMonitor] := True
    else G_bFormEnabled[con_DoorTypeMonitor] := False;
    Monitoring := G_bFormEnabled[con_DoorTypeMonitor];
  end else if UpperCase(stValue) = 'DUPCARDEMPLOY' then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_DupCardEmployShow] := True
    else G_bFormEnabled[con_DupCardEmployShow] := False;
  end else if UpperCase(stValue) = 'EMPLOY' then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_EmployShow] := True
    else G_bFormEnabled[con_EmployShow] := False;
  end else if UpperCase(stValue) = UpperCase('InOutReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_InOutReport] := True
    else G_bFormEnabled[con_InOutReport] := False;
  end else if UpperCase(stValue) = UpperCase('InOutStateList') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_InOutStateList] := True
    else G_bFormEnabled[con_InOutStateList] := False;
  end else if UpperCase(stValue) = 'KTCARDCREATE' then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_KTCardCreateShow] := True
    else G_bFormEnabled[con_KTCardCreateShow] := False;
  end else if UpperCase(stValue) = 'KTCARDREG' then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_KTCardRegShow] := True
    else G_bFormEnabled[con_KTCardRegShow] := False;
  end else if UpperCase(stValue) = UpperCase('KTIssusNReg') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_KTIssusNReg] := True
    else G_bFormEnabled[con_KTIssusNReg] := False;
  end else if UpperCase(stValue) = UpperCase('KTTypeMonitoring') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_KTTypeMonitoring] := True
    else G_bFormEnabled[con_KTTypeMonitoring] := False;
    Monitoring := G_bFormEnabled[con_KTTypeMonitoring];
  end else if UpperCase(stValue) = UpperCase('LargeAccessReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_LargeAccessReport] := True
    else G_bFormEnabled[con_LargeAccessReport] := False;
  end else if UpperCase(stValue) = UpperCase('MDIAlarmGrade') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_MDIAlarmGrade] := True
    else G_bFormEnabled[con_MDIAlarmGrade] := False;
  end else if UpperCase(stValue) = 'MDICARDADMIN' then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_MDICardAdminShow] := True
    else G_bFormEnabled[con_MDICardAdminShow] := False;
  end else if UpperCase(stValue) = UpperCase('MDIDeviceGrade') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_MDIDeviceGrade] := True
    else G_bFormEnabled[con_MDIDeviceGrade] := False;
  end else if UpperCase(stValue) = UpperCase('MDIDoorGrade') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_MDIDoorGrade] := True
    else G_bFormEnabled[con_MDIDoorGrade] := False;
  end else if UpperCase(stValue) = UpperCase('Monitoring') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_Monitoring] := True
    else G_bFormEnabled[con_Monitoring] := False;
    Monitoring := G_bFormEnabled[con_Monitoring];
  end else if UpperCase(stValue) = UpperCase('NewAlarmReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_NewAlarmReport] := True
    else G_bFormEnabled[con_NewAlarmReport] := False;
  end else if UpperCase(stValue) = UpperCase('NotCardReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_NotCardReport] := True
    else G_bFormEnabled[con_NotCardReport] := False;
  end else if UpperCase(stValue) = UpperCase('NotPTListReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_NotPTListReport] := True
    else G_bFormEnabled[con_NotPTListReport] := False;
  end else if UpperCase(stValue) = UpperCase('PerAtReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_PerAtReport] := True
    else G_bFormEnabled[con_PerAtReport] := False;
  end else if UpperCase(stValue) = UpperCase('PersonStateReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_PersonStateReport] := True
    else G_bFormEnabled[con_PersonStateReport] := False;
  end else if UpperCase(stValue) = UpperCase('ReaderState') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_ReaderState] := True
    else G_bFormEnabled[con_ReaderState] := False;
  end else if UpperCase(stValue) = UpperCase('RemoteSupport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_RemoteSupport] := True
    else G_bFormEnabled[con_RemoteSupport] := False;
  end else if UpperCase(stValue) = UpperCase('DoorscheduleRegForm') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_ScheduleForm] := True
    else G_bFormEnabled[con_ScheduleForm] := False;
  end else if UpperCase(stValue) = UpperCase('SystemLoginReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_SystemLoginReport] := True
    else G_bFormEnabled[con_SystemLoginReport] := False;
  end else if UpperCase(stValue) = UpperCase('TimeAccessReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_TimeAccessReport] := True
    else G_bFormEnabled[con_TimeAccessReport] := False;
  end else if UpperCase(stValue) = UpperCase('TimeNotAccessReport') then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_TimeNotAccessReport] := True
    else G_bFormEnabled[con_TimeNotAccessReport] := False;
  end else if UpperCase(stValue) = 'TREEEMPLOYEE' then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_TreeEmployeeShow] := True
    else G_bFormEnabled[con_TreeEmployeeShow] := False;
  end else if UpperCase(stValue) = 'ZONESTATEREPORT' then
  begin
    if UpperCase(stShow) = 'TRUE' then G_bFormEnabled[con_ZoneStateReport] := True
    else G_bFormEnabled[con_ZoneStateReport] := False;     
  end;

end;

procedure TfmMain.CommandArrayCommandsTCARDSHOWExecute(
  Command: TCommand; Params: TStringList);
var
  fmDupCardEmploy : TForm;
  fmEmploy : TForm;
  fmMDICardAdmin : TForm;

  stValue : string;
  stCardNo : string;
begin
  stValue := Params.Values['VALUE'];
  stCardNo := Params.Values['CARDNO'];
  if UpperCase(stValue) = 'EMPLOYEE' then
  begin
    Action_EmployExecute(self);
    Delay(1000);
    if G_bFormEnabled[con_DupCardEmployShow] then
    begin
      fmDupCardEmploy := MDIForm('TfmDupCardEmploy');
      if fmDupCardEmploy <> nil then
      begin
        TfmDupCardEmploy(fmDupCardEmploy).CardReadProcess(stCardNo,False);
      end;
    end;
    if G_bFormEnabled[con_EmployShow] then
    begin
      fmEmploy := MDIForm('TfmEmploy');
      if fmEmploy <> nil then
      begin
        TfmEmploy(fmEmploy).CardReadProcess(stCardNo,False);
      end;
    end;
  end else if UpperCase(stValue) = 'CARDADMIN' then
  begin
    Action_CardAdminExecute(self);
    Delay(1000);
    
    if G_bFormEnabled[con_MDICardAdminShow] then
    begin
      fmMDICardAdmin := MDIForm('TfmMDICardAdmin');
      if fmMDICardAdmin <> nil then
      begin
        TfmMDICardAdmin(fmMDICardAdmin).CardReadProcess(stCardNo,False);
      end;
    end;

  end;



end;

procedure TfmMain.Action_BuildingAccessTypeMonitoringExecute(
  Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_BuildingAccessTypeMonitoring.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmBuildingAccessTypeMonitoring',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.Action_AlarmMapMonitoringExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_AlarmMapMonitoring.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAlarmMapMonitoring',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('GRADEREFRESH').Execute;
end;


procedure TfmMain.N46Click(Sender: TObject);
begin
  MDIChildShow('TfmPerATReport');
end;

procedure TfmMain.N47Click(Sender: TObject);
begin
  fmReAtInsert:= TfmReAtInsert.Create(Self);
  fmReAtInsert.SHowmodal;
  fmReAtInsert.Free;

end;


procedure TfmMain.MonitorHeaderNameCreate;
begin
  AccessHeaderNameList.Clear;
  AccessHeaderNameList.Add('발생일자');
  AccessHeaderNameList.Add('위치');
  AccessHeaderNameList.Add('출입문');
  AccessHeaderNameList.Add('승인코드');
  AccessHeaderNameList.Add('승인상태');
  AccessHeaderNameList.Add('카드번호');
  AccessHeaderNameList.Add('출입자명');
  AccessHeaderNameList.Add(FM002);
  AccessHeaderNameList.Add(FM012);
  AccessHeaderNameList.Add(FM022);
  AccessHeaderNameList.Add(FM101);
  AccessHeaderNameList.Add('출입문ID');
  AccessHeaderNameList.Add(FM107);
  AccessHeaderNameList.Add(FM103);
  AccessHeaderNameList.Add(FM108);
  AccessHeaderNameList.Add(FM109);
//  AccessHeaderNameList.Add(FM110);

  AlarmHeaderNameList.clear;
  AlarmHeaderNameList.Add('발생일자');
  AlarmHeaderNameList.Add('위치');
  AlarmHeaderNameList.Add('방범구역');
  AlarmHeaderNameList.Add('기기번호');
  AlarmHeaderNameList.Add('기기타입');
  AlarmHeaderNameList.Add('발생코드');
  AlarmHeaderNameList.Add('이벤트내용');
  AlarmHeaderNameList.Add('알람코드');
end;


procedure TfmMain.Action_AccessMapMonitoringExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(Action_AccessMapMonitoring.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmAccessMapMonitoring',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmAccessMapMonitoring').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.mn_RemoteClick(Sender: TObject);
var
  regKey : TRegistry;
  stPath : string;
  stUrl : string;
begin
//  ShellExecute(0, 'open', pchar('http://zeron.co.kr/help'), '','', SW_Normal);
//  MDIChildShow('TfmRemoteSupport');
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_CURRENT_USER;
    if (not regKey.KeyExists('\Software\Zeron\Seetrol')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;

      ShellExecute(0, 'open', pchar(ExtractFileDir(Application.ExeName) + '\seetrol_Setup.exe'),'','', SW_Normal);

      Exit;
    end;
    regKey.OpenKey ('\Software\Zeron\Seetrol',False);
    stPath := regKey.ReadString('path');
    if stPath = '' then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      ShellExecute(0, 'open', pchar(ExtractFileDir(Application.ExeName) + '\seetrol_Setup.exe'),'','', SW_Normal);
      Exit;
    end;
    ShellExecute(0, 'open', pchar(stPath + 'SeetrolClient.exe'), pchar('-' + L_stCustomerID + FormatDateTime('zzz',now) + ' -zeron.co.kr -8081 -8082 -8083 -auto'),'', SW_Normal)
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY 해제
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY 해제
     regKey.Free;
end;

procedure TfmMain.mn_NotPTReportClick(Sender: TObject);
begin
  MDIChildShow('TfmNotPTListReport');

end;

procedure TfmMain.ReleayMungJiCheck;
var
  stRelayDateTime : string;
begin
  stRelayDateTime := G_stRelayDateTime;
  if Not dmAdoRelay.ADOConnection.Connected then
  begin
    if Not dmAdoRelay.AdoRelayConnected(inttostr(G_nRelayDataBaseType), G_stRelayServerIP, G_stRelayServerPort,
                      G_stRelayUserID, G_stRelayUserPW, G_stRelayDataBaseName) then Exit;
  end;

  RelayMunjiCodeCreate;
  RelayMunjiPersonData(stRelayDateTime);
  RelayMunjiEmployeePersonData(stRelayDateTime);
end;

function TfmMain.RelayMunjiPersonData(aRelayDateTime: string): Boolean;
var
  stSql : string;
  stMessage : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  nErrCount : integer;
  stCardNo : string;
  stVarCompanyCode : string;
  stVarEmpID : string;
  stVarCardNo : string;
begin
  stCompanyCode := '001';
  stJijumCode := '000';
  stDepartCode := '000';
  stPosiCode := '000';
  nErrCount := 0;

  result := False;

  stSql := 'select * from vw_Security_KtTeleCop ';
  if aRelayDateTime <> '00000000000000' then
    stSql := stSql + ' Where UpdateDate > ''' + aRelayDateTime + ''' ';
  stSql := stSql + ' order by UpdateDate ASC ';

  With dmAdoRelay.ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    if recordCount < 1 then Exit;

    stMessage := inttostr(recordCount) + '의 변경 데이터가 있습니다. 데이터를 처리하시겠습니까?';

    //if (Application.MessageBox(PChar(stMessage),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;

    Gauge2.Visible := True;
    Gauge2.MaxValue := recordCount + 1;
    Gauge2.Progress := 0;
    While Not Eof do
    begin
      Gauge2.Progress := Gauge2.Progress + 1;
      stCardNo := FillCharString(Trim(FindField('IDNo').AsString),'N',14) +
              FillCharString(Trim(FindField('IssueDegree').AsString),'0',2,True);
        //여기에서 연동 하자.
      if (FindField('LostFlag').AsString = '0') then //정상 카드이면
      begin   //정상이거나 휴학이면
        if (Trim(FindField('ConditionCode').AsString) = '01')   //재학
           OR (Trim(FindField('ConditionCode').AsString) = '02')   //휴학
           OR (Trim(FindField('ConditionCode').AsString) = '1') //재직
           OR (Trim(FindField('ConditionCode').AsString) = '3') //휴직
           OR (Trim(FindField('ConditionCode').AsString) = '7') then  //연구원
        begin
          stJijumCode := GetJijumCodeFromName('001',FindField('DepartmentName').AsString);
          stDepartCode := GetDepartCodeFromName('001',stJijumCode,FindField('MajorName').AsString);
          stPosiCode := GetPosiCodeFromName('001',FindField('IdentityName').AsString);
          if CheckTB_Employee(stCompanyCode,FindField('IDNo').AsString) then
          begin
            if Not UpdateTB_EMPLOYEEBasic(FindField('IDNo').AsString, stCompanyCode, stJijumCode,
                    stDepartCode, stPosiCode, FindField('Name').AsString, '', '', '',
                    '', '', '', '', '99991231') then
            begin
              //inc(nErrCount);
            end;
          end else
          begin
            if Not InsertTB_EMPLOYEEBasic(FindField('IDNo').AsString, stCompanyCode, stJijumCode,
                stDepartCode, stPosiCode, FindField('Name').AsString, '', '', '',
                '', '', '', '', '99991231') then
            begin
              inc(nErrCount);
            end;
          end;
          //현재 카드가 있는지 체크 후 지금 들어오는 카드와 동일한지 체크
          if CheckTB_Card(stCardNo,stVarCompanyCode,stVarEmpID) then
          begin
            if stVarCompanyCode <> stCompanyCode then
            begin
              UpdateTB_CARD(stCardNo,'1','1',FindField('IDNo').AsString,stCompanyCode);
            end else
            begin
              if stVarEmpID <> FindField('IDNo').AsString then
              begin
                UpdateTB_CARD(stCardNo,'1','1',FindField('IDNo').AsString,stCompanyCode);
              end;
            end;
          end else
          begin
            //현재 사원정보에 등록된 카드가 있는지 체크
            if CheckTB_CARDEmCodeMungJi(stCompanyCode,FindField('IDNo').AsString,stVarCardNo) then
            begin
              DeleteTB_DEVICECARDNOCardNo(stCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
              CopyGradeOldCard(stVarCardNo,stCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
              UpdateTB_DEVICECARDNO(stVarCardNo,'N');//기존 카드 권한 삭제
              DeleteTB_CARD(stVarCardNo);//기존 카드 삭제
            end;
            InsertTB_CARD(stCardNo, '1', '1', Trim(FindField('IDNo').AsString),stCompanyCode);
          end;
        end else  //졸업 한 경우 인적 사항도 지우자...
        begin
          DeleteTB_CARDEMPLOYEE(stCompanyCode,FindField('IDNo').AsString); //카드 삭제 및 권한 삭제
          DeleteTB_EMPLOYEE(stCompanyCode,FindField('IDNo').AsString); //사원 정보 삭제
          UpdateTB_DEVICECARDNO(stCardNo,'N'); //권한 삭제 후
          DeleteTB_CARD(stCardNo);             //카드 삭제
        end;
      end else  //분실 카드이면
      begin
        UpdateTB_DEVICECARDNO(stCardNo,'N'); //권한 삭제 후
        DeleteTB_CARD(stCardNo);             //카드 삭제
      end;

      G_stRelayDateTime := Formatdatetime('yyyy-mm-dd hh:nn:ss.zzz',FindField('UpdateDate').AsDateTime);

      stSql := 'Update TB_PERRELAYCONFIG set PC_CONFIGVALUE = ''' + G_stRelayDateTime + ''' ';
      stSql := stSql + ' Where PC_CONFIGCODE = ''GETDATETIME'' ';
      DataModule1.ProcessExecSQL(stSql);
      Application.ProcessMessages;
      Next;
    end;
  end;
  Gauge2.Visible := False;

  if nErrCount > 0 then
  begin
    //showmessage(inttostr(nErrCount) + '건의 입력 오류가 발생 했습니다.');
  end;

  result := True;
end;

function TfmMain.RelayMunjiCodeCreate: Boolean;
begin
  CreateMungJiJijumCode;
  CreateMungJiDepartCode;
  CreateMungJiPosiCode;
end;

procedure TfmMain.CreateMungJiJijumCode;
var
  stSql : string;
  nMaxJijumCode : integer;
begin
  nMaxJijumCode := GetMaxJijumCode('001');
  stSql := ' Select DepartmentName from vw_Security_KtTeleCop ';
  if G_stRelayDateTime <> '00000000000000' then
    stSql := stSql + ' Where UpdateDate > ''' + G_stRelayDateTime + ''' ';
  stSql := stSql + ' GROUP BY DepartmentName ';

  With dmAdoRelay.ADOQuery1 do
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
      if Not FindField('DepartmentName').IsNull then
      begin
        if Trim(FindField('DepartmentName').AsString) <> '' then
        begin
          if Not CheckTB_COMPANYJijumName('001',Trim(FindField('DepartmentName').AsString)) then
          begin
            InsertTB_COMPANY('001',FillZeroNumber(nMaxJijumCode,3),'000',Trim(FindField('DepartmentName').AsString),'2'); //지점 코드
            inc(nMaxJijumCode);
          end;
        end;
      end;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

procedure TfmMain.CreateMungJiDepartCode;
var
  stSql : string;
  stJijumCode : string;
  nMaxDepartCode : integer;
begin
  stSql := ' Select DepartmentName,MajorName from vw_Security_KtTeleCop ';
  if G_stRelayDateTime <> '00000000000000' then
    stSql := stSql + ' Where UpdateDate > ''' + G_stRelayDateTime + ''' ';
  stSql := stSql + ' GROUP BY DepartmentName,MajorName ';

  With dmAdoRelay.ADOQuery1 do
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
      if Not FindField('DepartmentName').IsNull then
      begin
        if Trim(FindField('DepartmentName').AsString) <> '' then
        begin
          stJijumCode := GetJijumCodeFromName('001',FindField('DepartmentName').AsString);
          if Not FindField('MajorName').IsNull then
          begin
            if Trim(FindField('MajorName').AsString) <> '' then
            begin
              nMaxDepartCode := GetMaxDepartCode('001',stJijumCode);
              if Not CheckTB_COMPANYDepartName('001',stJijumCode,Trim(FindField('MajorName').AsString)) then
              begin
                InsertTB_COMPANY('001',stJijumCode,FillZeroNumber(nMaxDepartCode,3),Trim(FindField('MajorName').AsString),'3'); //지점 코드
              end;
            end;
          end;
        end;
      end;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

procedure TfmMain.CreateMungJiPosiCode;
var
  stSql : string;
  nMaxPosiCode : integer;
begin
  nMaxPosiCode := GetMaxPosiCode('001');

  stSql := ' Select IdentityName from vw_Security_KtTeleCop ';
  if G_stRelayDateTime <> '00000000000000' then
    stSql := stSql + ' Where UpdateDate > ''' + G_stRelayDateTime + ''' ';
  stSql := stSql + ' GROUP BY IdentityName ';

  With dmAdoRelay.ADOQuery1 do
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
      if Not FindField('IdentityName').IsNull then
      begin
        if Trim(FindField('IdentityName').AsString) <> '' then
        begin
          if Not CheckTB_POSIName('001',Trim(FindField('IdentityName').AsString)) then
          begin
            InsertTB_POSI('001',FillZeroNumber(nMaxPosiCode,3),Trim(FindField('IdentityName').AsString));
            inc(nMaxPosiCode);
          end;
        end;
      end;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

function TfmMain.CheckTB_COMPANYJijumCode(aCompanyCode,
  aJijumCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.InsertTB_COMPANY(aCompanyCode, aJijumCode, aDepartCode,
  aName, aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Insert Into TB_COMPANY(';
  stSql := stSql + ' GROUP_CODE, ';
  stSql := stSql + ' CO_COMPANYCODE, ';
  stSql := stSql + ' CO_JIJUMCODE, ';
  stSql := stSql + ' CO_DEPARTCODE, ';
  stSql := stSql + ' CO_NAME, ';
  stSql := stSql + ' CO_GUBUN) ';
  stSql := stSql + ' Values( ';
  stSql := stsql + ' ''' + GROUPCODE + ''',';
  stSql := stsql + ' ''' + aCompanyCode + ''',';
  stSql := stsql + ' ''' + aJijumCode + ''',';
  stSql := stsql + ' ''' + aDepartCode + ''',';
  stSql := stsql + ' ''' + aName + ''',';
  stSql := stsql + ' ''' + aGubun + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.CheckTB_COMPANYDepartCode(aCompanyCode, aJijumCode,
  aDepartCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.CheckTB_POSICode(aCompanyCode,
  aPosiCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_POSI ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ''' + aPosiCode + ''' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.CheckTB_CARDEmCodeMungJi(aCompanyCode, aEmCode: string;
  var aCardNo: string): Boolean;
var
  stSql : string;
  stCardNo : string;
  Seq : string;
begin
  result := False;
  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  with DataModule1.ADOTmpQuery do
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
      stCardNo := FindField('CA_CARDNO').AsString ;
      Seq := copy(stCardNo,Length(stCardNo) - 1,2);
      if IsDigit(Seq) then
      begin
        aCardNo := stCardNo;
        result := True;
        Exit;
      end;
      Next;
    end;
  end;
end;

function TfmMain.InsertTB_POSI(aCompanyCode, aPosiCode, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_POSI(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' PO_NAME)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + ' ''' + GROUPCODE + ''',';
  stSql := stSql + ' ''' + aCompanyCode + ''',';
  stSql := stSql + ' ''' + aPosiCode + ''',';
  stSql := stSql + ' ''' + aName + ''')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.DeleteTB_DEVICECARDNOCardNo(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.CopyGradeOldCard(aOldCard, aNewCard: string): Boolean;
var
  stSql : string;
begin
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
    stSql := stSql + ' ''' + aNewCard + ''', ';
    stSql := stSql + ' b.DE_DOOR1, ';
    stSql := stSql + ' b.DE_DOOR2, ';
    stSql := stSql + ' b.DE_USEACCESS, ';
    stSql := stSql + ' b.DE_USEALARM, ';
    stSql := stSql + ' b.DE_TIMECODE, ';
    stSql := stSql + ' b.DE_PERMIT, ';
    stSql := stSql + ' ''N'', ';
    stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + ' '''+ Master_ID + ''' ';
    stSql := stSql + ' From TB_DEVICECARDNO B  ';
    stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND B.CA_CARDNO = ''' + aOldCard + ''' ';
    stSql := stSql + ' AND NOT EXISTS ';
    stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
    stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
    stSql := stSql + ' AND A.CA_CARDNO = ''' + aNewCard + ''')  ';

    result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.GetMaxJijumCode(aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(CO_JIJUMCODE) as MaxJIJUMCODE From TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      if Not IsDigit(FindField('MaxJIJUMCODE').AsString) then
      begin
        Exit;
      end;
      result := strtoint(FindField('MaxJIJUMCODE').asstring) + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetMaxDepartCode(aCompanyCode,
  aJijumCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(CO_DEPARTCODE) as MaxDEPARTCODE From TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      if Not IsDigit(FindField('MaxDEPARTCODE').AsString) then
      begin
        Exit;
      end;
      result := strtoint(FindField('MaxDEPARTCODE').asstring) + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckTB_COMPANYJijumName(aCompanyCode,
  aJijumName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aJijumName + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.GetJijumCodeFromName(aCompanyCode,
  aJijumName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';

  stSql := 'Select CO_JIJUMCODE From TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aJijumName + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      result := FindField('CO_JIJUMCODE').asstring;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckTB_COMPANYDepartName(aCompanyCode, aJijumCode,
  aDepartName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aDepartName + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.GetMaxPosiCode(aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PO_POSICODE) as MaxPOSICODE From TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      if Not IsDigit(FindField('MaxPOSICODE').AsString) then
      begin
        Exit;
      end;
      result := strtoint(FindField('MaxPOSICODE').asstring) + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckTB_POSIName(aCompanyCode,
  aPosiName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_POSI ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_NAME = ''' + aPosiName + ''' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.GetDepartCodeFromName(aCompanyCode, aJijumCode,
  aDepartName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';

  stSql := 'Select CO_DEPARTCODE From TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aDepartName + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      result := FindField('CO_DEPARTCODE').asstring;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetPosiCodeFromName(aCompanyCode,
  aPosiName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';

  stSql := 'Select PO_POSICODE From TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_NAME = ''' + aPosiName + ''' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      result := FindField('PO_POSICODE').asstring;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.mn_AlarmAccessReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmAlarmAccessReport');
  self.FindClassForm('TfmAlarmAccessReport').FindCommand('GRADEREFRESH').Execute;

end;

function TfmMain.RelayMunjiEmployeePersonData(
  aRelayDateTime: string): Boolean;
var
  stSql : string;
  stMessage : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  nErrCount : integer;
  stCardNo : string;
  stVarCompanyCode : string;
  stVarEmpID : string;
  stVarCardNo : string;
begin
  stCompanyCode := '001';
  stJijumCode := '000';
  stDepartCode := '000';
  stPosiCode := '000';
  nErrCount := 0;

  result := False;

  stSql := 'select * from vw_Security_KtTeleCop ';
  stSql := stSql + ' WHERE IdentityCode <> ''01'' ';
  stSql := stSql + ' AND IdentityCode <> ''02'' ';
  stSql := stSql + ' AND IdentityCode <> ''05'' ';
  stSql := stSql + ' AND IdentityCode <> ''00'' ';
  if aRelayDateTime <> '00000000000000' then
    stSql := stSql + ' AND UpdateDate > ''' + aRelayDateTime + ''' ';
  stSql := stSql + ' order by UpdateDate ASC ';

  With dmAdoRelay.ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    if recordCount < 1 then Exit;

    stMessage := inttostr(recordCount) + '의 변경 데이터가 있습니다. 데이터를 처리하시겠습니까?';

    //if (Application.MessageBox(PChar(stMessage),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;

    Gauge2.Visible := True;
    Gauge2.MaxValue := recordCount + 1;
    Gauge2.Progress := 0;
    While Not Eof do
    begin
      Gauge2.Progress := Gauge2.Progress + 1;
      stCardNo := FillCharString(Trim(FindField('ChipSerial').AsString),'0',14) + '**';
        //여기에서 연동 하자.
      if (FindField('LostFlag').AsString = '0') then //정상 카드이면
      begin   //정상이거나 휴학이면
        if (Trim(FindField('ConditionCode').AsString) = '01')   //재학
           OR (Trim(FindField('ConditionCode').AsString) = '02')   //휴학
           OR (Trim(FindField('ConditionCode').AsString) = '1') //재직
           OR (Trim(FindField('ConditionCode').AsString) = '3') //휴직
           OR (Trim(FindField('ConditionCode').AsString) = '7') then  //연구원
        begin
          stJijumCode := GetJijumCodeFromName('001',FindField('DepartmentName').AsString);
          stDepartCode := GetDepartCodeFromName('001',stJijumCode,FindField('MajorName').AsString);
          stPosiCode := GetPosiCodeFromName('001',FindField('IdentityName').AsString);
          if CheckTB_Employee(stCompanyCode,FindField('IDNo').AsString) then
          begin
            if Not UpdateTB_EMPLOYEEBasic(FindField('IDNo').AsString, stCompanyCode, stJijumCode,
                    stDepartCode, stPosiCode, FindField('Name').AsString, '', '', '',
                    '', '', '', '', '99991231') then
            begin
              //inc(nErrCount);
            end;
          end else
          begin
            if Not InsertTB_EMPLOYEEBasic(FindField('IDNo').AsString, stCompanyCode, stJijumCode,
                stDepartCode, stPosiCode, FindField('Name').AsString, '', '', '',
                '', '', '', '', '99991231') then
            begin
              inc(nErrCount);
            end;
          end;
          //현재 카드가 있는지 체크 후 지금 들어오는 카드와 동일한지 체크
          if CheckTB_Card(stCardNo,stVarCompanyCode,stVarEmpID) then
          begin
            if stVarCompanyCode <> stCompanyCode then
            begin
              UpdateTB_CARD(stCardNo,'1','1',FindField('IDNo').AsString,stCompanyCode);
            end else
            begin
              if stVarEmpID <> FindField('IDNo').AsString then
              begin
                UpdateTB_CARD(stCardNo,'1','1',FindField('IDNo').AsString,stCompanyCode);
              end;
            end;
          end else
          begin
            //현재 사원정보에 등록된 카드가 있는지 체크
            if CheckTB_CARDEmCodeMungJiSerial(stCompanyCode,FindField('IDNo').AsString,stVarCardNo) then
            begin
              DeleteTB_DEVICECARDNOCardNo(stCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
              CopyGradeOldCard(stVarCardNo,stCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
              UpdateTB_DEVICECARDNO(stVarCardNo,'N');//기존 카드 권한 삭제
              DeleteTB_CARD(stVarCardNo);//기존 카드 삭제
            end;
            InsertTB_CARD(stCardNo, '1', '1', Trim(FindField('IDNo').AsString),stCompanyCode);
          end;
        end else  //졸업 한 경우 인적 사항도 지우자...
        begin
          DeleteTB_CARDEMPLOYEE(stCompanyCode,FindField('IDNo').AsString); //카드 삭제 및 권한 삭제
          DeleteTB_EMPLOYEE(stCompanyCode,FindField('IDNo').AsString); //사원 정보 삭제
          UpdateTB_DEVICECARDNO(stCardNo,'N'); //권한 삭제 후
          DeleteTB_CARD(stCardNo);             //카드 삭제
        end;
      end else  //분실 카드이면
      begin
        UpdateTB_DEVICECARDNO(stCardNo,'N'); //권한 삭제 후
        DeleteTB_CARD(stCardNo);             //카드 삭제
      end;

      Application.ProcessMessages;
      Next;
    end;
  end;
  Gauge2.Visible := False;

  if nErrCount > 0 then
  begin
    //showmessage(inttostr(nErrCount) + '건의 입력 오류가 발생 했습니다.');
  end;

  result := True;
end;

function TfmMain.CheckTB_CARDEmCodeMungJiSerial(aCompanyCode,
  aEmCode: string; var aCardNo: string): Boolean;
var
  stSql : string;
  stCardNo : string;
  Seq : string;
begin
  result := False;
  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  with DataModule1.ADOTmpQuery do
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
      stCardNo := FindField('CA_CARDNO').AsString ;
      Seq := copy(stCardNo,Length(stCardNo) - 1,2);
      if Seq = '**' then
      begin
        aCardNo := stCardNo;
        result := True;
        Exit;
      end;
      Next;
    end;
  end;
end;

procedure TfmMain.N49Click(Sender: TObject);
begin
  if Not dmAdoRelay.ADOConnection.Connected then
  begin
    if Not dmAdoRelay.AdoRelayConnected(inttostr(G_nRelayDataBaseType), G_stRelayServerIP, G_stRelayServerPort,
                      G_stRelayUserID, G_stRelayUserPW, G_stRelayDataBaseName) then Exit;
  end;
  //RelayMunjiEmployeePersonData('00000000000000');
  RelayMunjiPersonDataTest('00000000000000');
end;

function TfmMain.RelayMunjiPersonDataTest(aRelayDateTime: string): Boolean;
var
  stSql : string;
  stMessage : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  nErrCount : integer;
  stCardNo : string;
  stVarCompanyCode : string;
  stVarEmpID : string;
  stVarCardNo : string;
begin
  stCompanyCode := '001';
  stJijumCode := '000';
  stDepartCode := '000';
  stPosiCode := '000';
  nErrCount := 0;

  result := False;

  stSql := 'select * from vw_Security_KtTeleCop ';
  stSql := stSql + ' WHERE IdentityCode <> ''01'' ';
  stSql := stSql + ' AND IdentityCode <> ''02'' ';
  stSql := stSql + ' AND IdentityCode <> ''05'' ';
  stSql := stSql + ' AND IdentityCode <> ''00'' ';
  if aRelayDateTime <> '00000000000000' then
    stSql := stSql + ' AND UpdateDate > ''' + aRelayDateTime + ''' ';
  stSql := stSql + ' order by UpdateDate ASC ';

  With dmAdoRelay.ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    if recordCount < 1 then Exit;

    stMessage := inttostr(recordCount) + '의 변경 데이터가 있습니다. 데이터를 처리하시겠습니까?';

    //if (Application.MessageBox(PChar(stMessage),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;

    Gauge2.Visible := True;
    Gauge2.MaxValue := recordCount + 1;
    Gauge2.Progress := 0;
    While Not Eof do
    begin
      Gauge2.Progress := Gauge2.Progress + 1;
      stCardNo := FillCharString(Trim(FindField('IDNo').AsString),'N',14) +
              FillCharString(Trim(FindField('IssueDegree').AsString),'0',2,True);
        //여기에서 연동 하자.
      if (FindField('LostFlag').AsString = '0') then //정상 카드이면
      begin   //정상이거나 휴학이면
        if (Trim(FindField('ConditionCode').AsString) = '01')   //재학
           OR (Trim(FindField('ConditionCode').AsString) = '02')   //휴학
           OR (Trim(FindField('ConditionCode').AsString) = '1') //재직
           OR (Trim(FindField('ConditionCode').AsString) = '3') //휴직
           OR (Trim(FindField('ConditionCode').AsString) = '7') then  //연구원
        begin
          stJijumCode := GetJijumCodeFromName('001',FindField('DepartmentName').AsString);
          stDepartCode := GetDepartCodeFromName('001',stJijumCode,FindField('MajorName').AsString);
          stPosiCode := GetPosiCodeFromName('001',FindField('IdentityName').AsString);
          if CheckTB_Employee(stCompanyCode,FindField('IDNo').AsString) then
          begin
            if Not UpdateTB_EMPLOYEEBasic(FindField('IDNo').AsString, stCompanyCode, stJijumCode,
                    stDepartCode, stPosiCode, FindField('Name').AsString, '', '', '',
                    '', '', '', '', '99991231') then
            begin
              //inc(nErrCount);
            end;
          end else
          begin
            if Not InsertTB_EMPLOYEEBasic(FindField('IDNo').AsString, stCompanyCode, stJijumCode,
                stDepartCode, stPosiCode, FindField('Name').AsString, '', '', '',
                '', '', '', '', '99991231') then
            begin
              inc(nErrCount);
            end;
          end;
          //현재 카드가 있는지 체크 후 지금 들어오는 카드와 동일한지 체크
          if CheckTB_Card(stCardNo,stVarCompanyCode,stVarEmpID) then
          begin
            if stVarCompanyCode <> stCompanyCode then
            begin
              UpdateTB_CARD(stCardNo,'1','1',FindField('IDNo').AsString,stCompanyCode);
            end else
            begin
              if stVarEmpID <> FindField('IDNo').AsString then
              begin
                UpdateTB_CARD(stCardNo,'1','1',FindField('IDNo').AsString,stCompanyCode);
              end;
            end;
          end else
          begin
            //현재 사원정보에 등록된 카드가 있는지 체크
            if CheckTB_CARDEmCodeMungJi(stCompanyCode,FindField('IDNo').AsString,stVarCardNo) then
            begin
              DeleteTB_DEVICECARDNOCardNo(stCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
              CopyGradeOldCard(stVarCardNo,stCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
              UpdateTB_DEVICECARDNO(stVarCardNo,'N');//기존 카드 권한 삭제
              DeleteTB_CARD(stVarCardNo);//기존 카드 삭제
            end;
            InsertTB_CARD(stCardNo, '1', '1', Trim(FindField('IDNo').AsString),stCompanyCode);
          end;
        end else  //졸업 한 경우 인적 사항도 지우자...
        begin
          DeleteTB_CARDEMPLOYEE(stCompanyCode,FindField('IDNo').AsString); //카드 삭제 및 권한 삭제
          DeleteTB_EMPLOYEE(stCompanyCode,FindField('IDNo').AsString); //사원 정보 삭제
          UpdateTB_DEVICECARDNO(stCardNo,'N'); //권한 삭제 후
          DeleteTB_CARD(stCardNo);             //카드 삭제
        end;
      end else  //분실 카드이면
      begin
        UpdateTB_DEVICECARDNO(stCardNo,'N'); //권한 삭제 후
        DeleteTB_CARD(stCardNo);             //카드 삭제
      end;

      G_stRelayDateTime := Formatdatetime('yyyy-mm-dd hh:nn:ss.zzz',FindField('UpdateDate').AsDateTime);

      stSql := 'Update TB_PERRELAYCONFIG set PC_CONFIGVALUE = ''' + G_stRelayDateTime + ''' ';
      stSql := stSql + ' Where PC_CONFIGCODE = ''GETDATETIME'' ';
      DataModule1.ProcessExecSQL(stSql);
      Application.ProcessMessages;
      Next;
    end;
  end;
  Gauge2.Visible := False;

  if nErrCount > 0 then
  begin
    //showmessage(inttostr(nErrCount) + '건의 입력 오류가 발생 했습니다.');
  end;

  result := True;
end;

procedure TfmMain.mn_DoorGradeReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmDoorGradeReport');
  self.FindClassForm('TfmDoorGradeReport').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.mn_ArmGradeReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmArmGradeReport');
  self.FindClassForm('TfmArmGradeReport').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.mn_alarmAreaGubunClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmArmGubunCode:= TfmArmGubunCode.Create(Self);
  Try
    fmArmGubunCode.IsInsertGrade := bInsertGrade;
    fmArmGubunCode.IsUpdateGrade := bUpdateGrade;
    fmArmGubunCode.IsDeleteGrade := bDeleteGrade;
    L_bShowModalVisible := True;
    fmArmGubunCode.SHowmodal;
  Finally
    fmArmGubunCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_MonitoringUpgradeClick(Sender: TObject);
begin
  if Not FileExists(ExeFolder + '\ZMOS\SmartUpdate.exe') then
  begin
    showmessage('업데이트 도구가 설치되어 있지 않습니다.');
    Exit;
  end;

  My_RunDosCommand(ExeFolder + '\ZMOS\SmartUpdate.exe',False,False);
  Close;
end;

procedure TfmMain.IndyTimerTimer(Sender: TObject);
var
  stTemp : string;
  I: Integer;
  aData:String;
  nIndex : integer;
begin
{  if Not WinsockPort.Connected then Exit;
  if WinsockPort.InputBuffer.Size <=0 then Exit;

  IndyTimer.Enabled := False;
  Try
    DaemonServerConnected := True;

    stTemp := WinsockPort.ReadLn(LINEEND,1);

    ServerComBuff:= ServerComBuff + stTemp ;

    repeat
      if G_bApplicationTerminate then Exit;
      aData:= Copy(ServerComBuff,1,Pos(LINEEND,ServerComBuff));
      Delete(ServerComBuff,1,Pos(LINEEND,ServerComBuff));
      nIndex := Pos('R',aData);
      if nIndex < 0 then      continue;
      if nIndex > 1 then Delete(aData,1,nIndex - 1);
      if Length(Trim(aData)) < 2 then continue;
      inc(L_nRecvPacketCount);
      Try
        FReceiveTCS.Enter;
        ReceiveDataList.Add(aData);
        StatusBar1.Panels[4].Text := inttostr(ReceiveDataList.Count);
      Finally
        FReceiveTCS.Leave;
      End;
      //MonitoringDataProcess(aData);

      Application.ProcessMessages;
    until pos(LINEEND,ServerComBuff) = 0;
  Finally
    IndyTimer.Enabled := True;
  End;   }
end;

procedure TfmMain.WinsockPortConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  bSeverConnected := True;
  DaemonServerConnected := True;

end;

procedure TfmMain.WinsockPortDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  bSeverConnected := False;
  DaemonServerConnected := False;
end;

procedure TfmMain.WinsockPortError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  Try
    bSeverConnected := False;
    DaemonServerConnected := False;
    ErrorCode := 0;
  Except
    Exit;
  End;
end;

procedure TfmMain.WinsockPortRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  nReturnCode : integer;
  //szBuffer: array[0..MAXBUFFSIZE] of Char;
  aData:String;
  nIndex : integer;
  szBuffer : string;
begin
  nReturnCode := 1;

{  while (nReturnCode > 0) do
  begin
    FillChar(szBuffer, SizeOf(szBuffer), 0);
    szBuffer := Socket.ReceiveText;
    nReturnCode := Socket.ReceiveBuf(szBuffer, SizeOf(szBuffer));
    if nReturnCode > 0 then
      ServerComBuff := ServerComBuff + szBuffer;
  end;
  }
  szBuffer := Socket.ReceiveText;

  ServerComBuff := ServerComBuff + szBuffer;

  repeat
    if G_bApplicationTerminate then Exit;
    aData:= Copy(ServerComBuff,1,Pos(LINEEND,ServerComBuff));
    Delete(ServerComBuff,1,Pos(LINEEND,ServerComBuff));

    nIndex := Pos('R',aData);
    if nIndex < 0 then      continue;
    if nIndex > 1 then Delete(aData,1,nIndex - 1);
    if Length(Trim(aData)) < 2 then continue;
    inc(L_nRecvPacketCount);
    Try
      FReceiveTCS.Enter;
      ReceiveDataList.Add(aData);
      StatusBar1.Panels[4].Text := '[RX]' + inttostr(ReceiveDataList.Count);
    Finally
      FReceiveTCS.Leave;
    End;

    //MonitoringDataProcess(aData);

    Application.ProcessMessages;
  until pos(LINEEND,ServerComBuff) = 0;

end;

procedure TfmMain.mn_KTCardCreateClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(mn_KTCardCreate.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmKTCardCreate');

end;

procedure TfmMain.ApdDataPacket2StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCreateCardDataByReader(Data);
//  ApdDataPacket2.Enabled := True;

end;

procedure TfmMain.RcvCreateCardDataByReader(aData: string);
var
  fmKTCardCreate : TForm;
  fmKTCardReg : TForm;
  nPos : integer;
begin
  if G_bFormEnabled[con_KTCardCreateShow] then
  begin
    fmKTCardCreate := MDIForm('TfmKTCardCreate');
    if fmKTCardCreate <> nil then
    begin
      TfmKTCardCreate(fmKTCardCreate).RcvCardDataByReader(aData);
    end;
  end;
  if G_bFormEnabled[con_KTCardRegShow] then
  begin
    fmKTCardReg := MDIForm('TfmKTCardReg');
    if fmKTCardReg <> nil then
    begin
      TfmKTCardReg(fmKTCardReg).RcvCardDataByReader(aData);
    end;
  end;

  nPos := Pos(STX,aData);
  if nPos = 0 then Exit;
  Delete(aData,1,nPos);
  L_bWait := True;

  if Pos(#$06,aData) > 0  then
  begin
    L_bSendResult := True;
    Exit;
  end else if Pos(#$07,aData) > 0  then
  begin
    L_bSendResult := False;
    Exit;
  end;
  L_stCardNo :=  copy(aData,1,Pos(ETX,aData) - 1);
end;

procedure TfmMain.CardCreatePortTriggerAvail(CP: TObject; Count: Word);
var
  st:String;
  I: Integer;
  aData:String;
  nIndex : integer;
  stTemp : string;
begin
  st:= '';
  for I := 1 to Count do st := st + CardCreatePort.GetChar;
  CreateCardBuff:= CreateCardBuff + st ;

  repeat
    if G_bApplicationTerminate then Exit;
    aData:= Copy(CreateCardBuff,1,Pos(ETX,CreateCardBuff));
    if aData = '' then exit;
    Delete(CreateCardBuff,1,Pos(ETX,CreateCardBuff));
    nIndex := Pos(STX,aData);
    if nIndex = 0 then      continue;
    if nIndex > 2 then Delete(aData,1,nIndex - 1);
    RcvCreateCardDataByReader(aData);
    Application.ProcessMessages;
  until pos(ETX,CreateCardBuff) = 0;

end;

procedure TfmMain.mn_KTCardInitializeClick(Sender: TObject);
var
  stInitializeCardNo : string;
begin
  if (Application.MessageBox(PChar('카드 초기화를 하시면 카드가 공장 초기화 상태로 변경 되어 더이상 사용이 불가능합니다. 계속하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;
  if (Application.MessageBox(PChar('카드 초기화를 하시면 타 시스템에서 사용이 불가능합니다. 계속하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;

  if CardCreatePort.Open then CardCreatePort.Open := False;
  Delay(200);
  Try
    CardCreatePort.Open := True;
  Except
    showmessage('포트오픈 실패');
    Exit;
  End;

  if Not CardCreatePort.Open then
  begin
    showmessage('포트가 오픈되지 않았습니다.');
    Exit;
  end;
  if Not InialzeKTCard then
    if Not InialzeKTCard then
      if Not InialzeKTCard then
      begin
        showmessage('카드 초기화에 실패 하였습니다.');
        Exit;
      end;

  stInitializeCardNo := '           ';
  if Not WriteCardInfo(stInitializeCardNo) then
    if Not WriteCardInfo(stInitializeCardNo) then
      if Not WriteCardInfo(stInitializeCardNo) then
      begin
        showmessage('카드 초기화에 실패 하였습니다.');
        Exit;
      end;

  if Not SearchCardInfo(stInitializeCardNo) then
  begin
    showmessage('카드 초기화에 실패 하였습니다.');
    Exit;
  end;

  showmessage('카드 초기화성공.');
end;

function TfmMain.InialzeKTCard: Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  stSendData :=   #$51 + #$5D;
  L_bSendResult := False;
  L_bWait := False;
  CardCreatePort.PutString(stSendData);

  PastTime := GetTickCount + 3000;
  while Not L_bWait do
  begin
    if Not fmMain.CardCreatePort.Open then Exit;
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //3000밀리동안 응답 없으면 실패로 처리함
  end;
  if L_bSendResult then Result := true;

end;

function TfmMain.WriteCardInfo(aCardNo: string): Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  L_stCardNo := '';
  result := False;
  stSendData :=   'W' + aCardNo + #$5D;
  L_bSendResult := False;
  L_bWait := False;
  CardCreatePort.PutString(stSendData);
  PastTime := GetTickCount + 3000;
  while Not L_bWait do
  begin
    if Not fmMain.CardCreatePort.Open then Exit;
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //3000밀리동안 응답 없으면 실패로 처리함
  end;

  if L_bSendResult then Result := true;

end;

function TfmMain.SearchCardInfo(aCardNo: string; aCheck: Boolean): Boolean;
var
  stSendData : string;
  PastTime : dword;
  stCardNo : string;
begin
  L_stCardNo := '';
  result := False;
  stSendData :=   'R' + #$5D;
  L_bSendResult := False;
  L_bWait := False;
  CardCreatePort.PutString(stSendData);

  PastTime := GetTickCount + 3000;
  while Not L_bWait do
  begin
    if Not fmMain.CardCreatePort.Open then Exit;
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //3000밀리동안 응답 없으면 실패로 처리함
  end;


  if L_stCardNo = aCardNo then Result := true
  else result := False;

end;

procedure TfmMain.mn_KTCardRegClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(mn_KTCardCreate.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmKTCardReg');

end;

procedure TfmMain.mn_alarmGroupClick(Sender: TObject);
begin
  fmAlarmGroup:= TfmAlarmGroup.Create(Self);
  Try
    fmAlarmGroup.SHowmodal;
  Finally
    fmAlarmGroup.Free;
  End;

end;

procedure TfmMain.CommandArrayCommandsTSTATUSExecute(Command: TCommand;
  Params: TStringList);
var
  stMessage : string;
  stPanel : string;
begin
  stMessage := Params.Values['MESSAGE'];
  stPanel := Params.Values['PANEL'];
  if Not isDigit(stPanel) then stPanel := '2';

  StatusBar1.Panels[strtoint(stPanel)].Text := stMessage;
end;

procedure TfmMain.DBSocketReceiveTimerTimer(Sender: TObject);
var
  stSql : string;
begin
  if G_bApplicationTerminate then Exit;
  Try
    DBSocketReceiveTimer.Enabled := False;
    stSql := ' Select * from TB_CLIENTSOCK ';
    stSql := stSql + ' Where seq > ' + inttostr(L_nOldDBSocketSeq);

    with DataModule1.ADODBSocketQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 0 then Exit;
      while Not Eof do
      begin
        L_nOldDBSocketSeq := FindField('SEQ').AsInteger;
        Try
          FReceiveTCS.Enter;
          ReceiveDataList.Add(FindField('CSDATA').AsString);
          StatusBar1.Panels[4].Text := '[RX]' + inttostr(ReceiveDataList.Count);
        Finally
          FReceiveTCS.Leave;
        End;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    if G_nMonitorSockType = 1 then DBSocketReceiveTimer.Enabled := Not G_bApplicationTerminate;
  End;


end;

procedure TfmMain.mn_JavaraScheduleClick(Sender: TObject);
var
  fmJavaraschedule : TForm;
begin
  fmJavaraschedule:= TfmJavaraschedule.Create(Self);
  Try
    fmJavaraschedule.SHowmodal;
  Finally
    fmJavaraschedule.Free;
  End;

end;

procedure TfmMain.N50Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmInOutStateList');

end;

procedure TfmMain.Action_DoorGradeSearchExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
  fmMDIDoorGrade : TForm;
begin
  GetProgramGrade(Action_DoorGradeSearch.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmMDIDoorGrade',bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmMDIDoorGrade := MDIForm('TfmMDIDoorGrade');
  TfmMDIDoorGrade(fmMDIDoorGrade).GradeSetting(bInsertGrade,bUpdateGrade,bDeleteGrade); 
end;

procedure TfmMain.Action_AlarmGardeSearchExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
  fmMDIAlarmGrade : TForm;
begin
  GetProgramGrade(Action_AlarmGardeSearch.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmMDIAlarmGrade',bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmMDIAlarmGrade := MDIForm('TfmMDIAlarmGrade');
  TfmMDIAlarmGrade(fmMDIAlarmGrade).GradeSetting(bInsertGrade,bUpdateGrade,bDeleteGrade);

end;

procedure TfmMain.CardReaderFormatChange(aType: string);
begin
  if ReaderPort.Open then
    ReaderPort.PutString(STX + aType + ETX);
end;


procedure TfmMain.mn_TimeNotAccessReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmTimeNotAccessReport');

end;

procedure TfmMain.mn_emCodeChangeClick(Sender: TObject);
begin
  fmEmCodeChange:= TfmEmCodeChange.Create(Self);
  Try
    fmEmCodeChange.Caption := mn_emCodeChange.Caption;
    fmEmCodeChange.SHowmodal;
  Finally
    fmEmCodeChange.Free;
  End;

end;

procedure TfmMain.mn_BuildingAccessReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmBuildingAccessReport');
  self.FindClassForm('TfmBuildingAccessReport').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.mn_TimeCodeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmTimeCode:= TfmTimeCode.Create(Self);
  Try
    L_bShowModalVisible := True;
    fmTimeCode.SHowmodal;
  Finally
    fmTimeCode.Free;
    L_bShowModalVisible := False;
  End;

end;

procedure TfmMain.mn_CardAccessTimeClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(mn_cardValidDate.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmCardAccessTime',bInsertGrade,bUpdateGrade,bDeleteGrade);
end;

function TfmMain.AuthSiteConnect: Boolean;
var
  conStr : string;
  FirstTickCount : double;
begin
  result := False;
  conStr := 'http://zeron.co.kr/ztbmskey/connectcheck.html';
  L_bWebComplete := False;
  L_bZeronConnected := False;
  WebBrowser1.Navigate(conStr);
  FirstTickCount := GetTickCount + 1000;
  while Not L_bWebComplete do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Exit;
  end;

  result := L_bZeronConnected;
end;

procedure TfmMain.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  stHTML : string;
begin
  inherited;
  If LowerCase(URL) = LowerCase('http://zeron.co.kr/ztbmskey/connectcheck.html') Then
  Begin
    stHTML := WebBrowser1.OleObject.Document.Body.InnerHTML;
    if UpperCase(stHTML) = 'OK' then
      L_bZeronConnected := True;
  end;
  L_bWebComplete := True;
end;

procedure TfmMain.ShowPWChange;
begin
  fmPWChange := TfmPWChange.Create(nil);
  fmPWChange.ActiveTap := 0;
  fmPWChange.LoginID := TLogin.GetObject.UserID;
  fmPWChange.UpdateTime := FillZeroStrNum(TLogin.GetObject.UpdateTime,14,False);
  fmPWChange.ShowModal;
  fmPWChange.Free;
end;

procedure TfmMain.mn_PWChangeClick(Sender: TObject);
begin
  inherited;
  fmPWChange := TfmPWChange.Create(nil);
  fmPWChange.ActiveTap := 1;
  fmPWChange.LoginID := TLogin.GetObject.UserID;
  fmPWChange.UpdateTime := FillZeroStrNum(TLogin.GetObject.UpdateTime,14,False);
  fmPWChange.ShowModal;
  fmPWChange.Free; 
end;

procedure TfmMain.LoadArmArea;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  TempArmAreaState : TArmAreaState;
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stArmAreaID : string;
  nIndex : integer;
  i : integer;
begin
  if ArmAreaStateList.Count > 0 then
  begin
    for i := ArmAreaStateList.Count - 1 downto 0 do TArmAreaState(ArmAreaStateList.Objects[i]).Free;
  end;
  ArmAreaStateList.Clear;    //방범구역별 상태 정보

  stSql := 'Select *';
  stSql := stSql + ' from TB_ARMAREA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AR_USE = ''Y'' ';
  stSql := stSql + ' Order by AR_VIEWSEQ,AC_NODENO,AC_ECUID,AR_AREANO ';

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
      While Not Eof do
      begin
        stNodeNo := FillZeroNumber(FindField('AC_NODENO').asInteger,3);
        stEcuID := FindField('AC_ECUID').AsString;
        stArmAreaNo := inttostr(FindField('AR_AREANO').AsInteger);
        stArmAreaID := stNodeNo + stEcuID + stArmAreaNo;

        TempArmAreaState := TArmAreaState.Create(self);
        TempArmAreaState.BuildingCode := FindField('LO_DONGCODE').asstring;
        TempArmAreaState.FloorCode := FindField('LO_FLOORCODE').AsString;
        TempArmAreaState.AreaCode := FindField('LO_AREACODE').AsString;
        TempArmAreaState.NodeNo := FindField('AC_NODENO').AsInteger;
        TempArmAreaState.ECUID := stEcuID;
        TempArmAreaState.ArmAreaNo := stArmAreaNo;
        TempArmAreaState.ArmAreaName := FindField('AR_NAME').asstring;
        TempArmAreaState.AlarmMode := cmNothing;
        TempArmAreaState.AlarmEventState := aeNothing;

        TempArmAreaState.OnAlarmModeChanged := AlarmModeChanged;
        TempArmAreaState.OnArmAreaAlarmEventState := ArmAreaAlarmEventState;

        ArmAreaStateList.AddObject(stArmAreaID,TempArmAreaState);
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

procedure TfmMain.ArmAreaAlarmEventState(Sender: TObject; NodeNo: integer;
  aECUID, aArmAreaNo: string; aAlaramState: TAlarmEventState);
var
  fmAlarmTypeMonitoring :TForm;
  fmMonitor : TForm;
  fmKTTypeMonitoring : TForm;
  fmAlarmMapMonitoring : TForm;
  i : integer;
begin
  if G_bApplicationTerminate then Exit;

  if G_bFormEnabled[con_AlarmTypeMonitoring] then
  begin
    fmAlarmTypeMonitoring := MDIForm('TfmAlarmTypeMonitoring');
    if fmAlarmTypeMonitoring <> nil then
    begin
      TfmAlarmTypeMonitoring(fmAlarmTypeMonitoring).DeviceAlarmEventProcess(NodeNo,aECUID,aArmAreaNo,aAlaramState);
    end;
  end;
  if G_bFormEnabled[con_Monitoring] then
  begin
//    if G_nMultiDaemon = 0 then
//    begin
      fmMonitor := MDIForm('TfmMonitoring');
//    end else if G_nMultiDaemon = 1 then
//    begin
//      fmMonitor := MDIForm('TfmMultiMonitoring');
//    end;
    if fmMonitor <> nil then
    begin
//      if G_nMultiDaemon = 0 then
        TfmMonitoring(fmMonitor).DeviceAlarmEventProcess(NodeNo,aECUID,aArmAreaNo,aAlaramState);
//      else if G_nMultiDaemon = 1 then
//        TfmMultiMonitoring(fmMonitor).DeviceAlarmEventProcess(NodeNo,aECUID,aAlaramState);
    end;
  end;
  if G_bFormEnabled[con_KTTypeMonitoring] then
  begin
    fmKTTypeMonitoring := MDIForm('TfmKTTypeMonitoring');
    if fmKTTypeMonitoring <> nil then
    begin
      TfmKTTypeMonitoring(fmKTTypeMonitoring).DeviceAlarmEventProcess(NodeNo,aECUID,aArmAreaNo,aAlaramState);
    end;
  end;

  if G_bFormEnabled[con_AlarmMapMonitoring] then
  begin
    fmAlarmMapMonitoring := MDIForm('TfmAlarmMapMonitoring');
    if fmAlarmMapMonitoring <> nil then
    begin
      TfmAlarmMapMonitoring(fmAlarmMapMonitoring).DeviceAlarmEventProcess(NodeNo,aECUID,aArmAreaNo,aAlaramState);
    end;
  end;

  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).DeviceAlarmEventProcess(NodeNo,aECUID,aArmAreaNo,aAlaramState);
  end;

end;

procedure TfmMain.ArmAreaStateTimerTimer(Sender: TObject);
begin
  inherited;
  ArmAreaStateTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  ArmAreaStateTimer.Enabled := CheckArmAreaState;
end;

function TfmMain.CheckArmAreaState: Boolean;
var
  i : integer;
  stDeviceID : string;
  nIndex : integer;
  stSendData : string;
begin
  result := False;
  if SendStateDataList.Count > 0 then
  begin
    result := True; //상태 체크가 안 넘어간게 있으면 넘기지 말자...
    Exit;
  end;

  Try
    for i := L_nArmAreaStateCount to ArmAreaStateList.Count - 1 do
    begin
      if TArmAreaState(ArmAreaStateList.Objects[i]).AlarmMode = cmNothing then
      begin
        result := True;
        stDeviceID := FillZeroNumber(TArmAreaState(ArmAreaStateList.Objects[i]).NodeNo,3) + TArmAreaState(ArmAreaStateList.Objects[i]).ECUID;
        nIndex := DeviceStateList.IndexOf(stDeviceID);
        if nIndex > -1 then
        begin
          if TDeviceState(DeviceStateList.Objects[nIndex]).Connected then
          begin
            stSendData := 'ARMAREASTATE'+ DATADELIMITER + ArmAreaStateList.strings[i] + DATADELIMITER;
            SendStateDataList.Add(stSendData);
            break;
          end;
        end;
      end;
    end;
  Finally
    if L_nArmAreaStateCount > 0 then result := True;
    L_nArmAreaStateCount := i + 1;
    if L_nArmAreaStateCount > (ArmAreaStateList.Count - 1) then L_nArmAreaStateCount := 0;
  End;
end;

function TfmMain.RegistryKeyCheck(var aCustomerID: string): Boolean;
var
  FReg : TRegistry;
  stInstallDate : string;
begin

  FReg := TRegistry.Create;
  try
    FReg.RootKey := HKEY_LOCAL_MACHINE;
    if FReg.OpenKey('Software\Zeron\ZTBMS',True) then
    begin
      aCustomerID := FReg.ReadString('CustomerID');
      stInstallDate := FReg.ReadString('InstallDate');
      if aCustomerID = 'Z-00000000' then
      begin
        stInstallDate := copy(stInstallDate,1,4) + '-' + copy(stInstallDate,5,2) + '-' + copy(stInstallDate,7,2);
        if Not IsDate(stInstallDate) then result := False
        else
        begin
          if stInstallDate < formatDateTime('yyyy-mm-dd',now) then result := False
          else result := True;
        end;
      end else
      begin
        if aCustomerID <> '' then result := True;
      end;
    end else
    begin
      result := False;
    end;
    FReg.CloseKey;
  Finally
    FReg.Free;
  end;

  if L_nKeyCheck = 1 then result := True;
end;

procedure TfmMain.WriteRegistryKey(aCustomerID, aInstallDate: string);
var
  FReg : TRegistry;
begin
  if aInstallDate = '' then aInstallDate := formatDateTime('yyyymmdd' ,Now + 30);

  FReg := TRegistry.Create;
  try
    FReg.RootKey := HKEY_LOCAL_MACHINE;
    FReg.OpenKey('Software\Zeron\ZTBMS',True);
    FReg.WriteString('CustomerID',aCustomerID);
    FReg.WriteString('InstallDate',aInstallDate);
    FReg.CloseKey;
  Finally
    FReg.Free;
  end;

end;

procedure TfmMain.MessageEvent(var Msg: TMsg; var Handled: Boolean);
begin

  if (Msg.message = WM_KEYDOWN) or (Msg.message = WM_KEYUP) or (Msg.message = WM_LBUTTONDOWN) or (Msg.message = WM_RBUTTONDOWN) then
  begin
    L_dtActiveTime := Now;
  end;
end;

procedure TfmMain.AutoLogOutTimerTimer(Sender: TObject);
begin
  inherited;
  if L_dtActiveTime < now - (1.0/(24 * 60))* G_nAutoLogOutTime then
  begin
    Logined := False;  //Master_ID가 나중에 설정되어야 함. 로그 정보 기록
    Master_ID := '';
    Privileges := '';
  end;
end;

function TfmMain.ChildFormClose: Boolean;
begin
   if G_bFormEnabled[con_AccessMapMonitoring] then self.FindClassForm('TfmAccessMapMonitoring').FindCommand('Close').Execute;
   if G_bFormEnabled[con_AccessReport] then self.FindClassForm('TfmAccessReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_AccessTypeMonitoring] then self.FindClassForm('TfmAccessTypeMonitoring').FindCommand('Close').Execute;
   if G_bFormEnabled[con_AlarmAccessReport] then self.FindClassForm('TfmAlarmAccessReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_AlarmAdminReport] then self.FindClassForm('TfmAlarmAdminReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_AlarmMapMonitoring] then self.FindClassForm('TfmAlarmMapMonitoring').FindCommand('Close').Execute;
   if G_bFormEnabled[con_AlarmTypeMonitoring] then self.FindClassForm('TfmAlarmTypeMonitoring').FindCommand('Close').Execute;
   if G_bFormEnabled[con_ArmGradeReport] then self.FindClassForm('TfmArmGradeReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_BuildingAccessReport] then self.FindClassForm('TfmBuildingAccessReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_BuildingAccessTypeMonitoring] then self.FindClassForm('TfmBuildingAccessTypeMonitoring').FindCommand('Close').Execute;
   if G_bFormEnabled[con_BuildingAlarmReport] then self.FindClassForm('TfmBuildingAlarmReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_CardAccessTime] then self.FindClassForm('TfmCardAccessTime').FindCommand('Close').Execute;
   if G_bFormEnabled[con_CardAdminReport] then self.FindClassForm('TfmCardAdminReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_CardList] then self.FindClassForm('TfmCardList').FindCommand('Close').Execute;
   if G_bFormEnabled[con_CardValidDate] then self.FindClassForm('TfmCardValidDate').FindCommand('Close').Execute;
   if G_bFormEnabled[con_ChangeAccessReport] then self.FindClassForm('TfmChangeAccessReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_ComMonitoring] then self.FindClassForm('TfmComMonitoring').FindCommand('Close').Execute;
   if G_bFormEnabled[con_DeviceGradeSearch] then self.FindClassForm('TfmDeviceGradeSearch').FindCommand('Close').Execute;
   if G_bFormEnabled[con_DeviceListReport] then self.FindClassForm('TfmDeviceListReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_DeviceVerInfo] then self.FindClassForm('TfmDeviceVerInfo').FindCommand('Close').Execute;
   if G_bFormEnabled[con_DoorAdminReport] then self.FindClassForm('TfmDoorAdminReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_DoorGradeReport] then self.FindClassForm('TfmDoorGradeReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_DoorTypeMonitor] then self.FindClassForm('TfmDoorTypeMonitoring').FindCommand('Close').Execute;
   if G_bFormEnabled[con_DupCardEmployShow] then self.FindClassForm('TfmDupCardEmploy').FindCommand('Close').Execute;
   if G_bFormEnabled[con_EmployShow] then self.FindClassForm('TfmEmploy').FindCommand('Close').Execute;
   if G_bFormEnabled[con_InOutReport] then self.FindClassForm('TfmInOutReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_InOutStateList] then self.FindClassForm('TfmInOutStateList').FindCommand('Close').Execute;
   if G_bFormEnabled[con_KTCardCreateShow] then self.FindClassForm('TfmKTCardCreate').FindCommand('Close').Execute;
   if G_bFormEnabled[con_KTCardRegShow] then self.FindClassForm('TfmKTCardReg').FindCommand('Close').Execute;
   if G_bFormEnabled[con_KTIssusNReg] then self.FindClassForm('TfmKTIssusNReg').FindCommand('Close').Execute;
   if G_bFormEnabled[con_KTTypeMonitoring] then self.FindClassForm('TfmKTTypeMonitoring').FindCommand('Close').Execute;
   if G_bFormEnabled[con_LargeAccessReport] then self.FindClassForm('TfmLargeAccessReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_MDIAlarmGrade] then self.FindClassForm('TfmMDIAlarmGrade').FindCommand('Close').Execute;
   if G_bFormEnabled[con_MDICardAdminShow] then self.FindClassForm('TfmMDICardAdmin').FindCommand('Close').Execute;
   if G_bFormEnabled[con_MDIDeviceGrade] then self.FindClassForm('TfmMDIDeviceGrade').FindCommand('Close').Execute;
   if G_bFormEnabled[con_MDIDoorGrade] then self.FindClassForm('TfmMDIDoorGrade').FindCommand('Close').Execute;
   if G_bFormEnabled[con_Monitoring] then self.FindClassForm('TfmMonitoring').FindCommand('Close').Execute;
   if G_bFormEnabled[con_NewAlarmReport] then self.FindClassForm('TfmNewAlarmReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_NotCardReport] then self.FindClassForm('TfmNotCardReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_NotPTListReport] then self.FindClassForm('TfmNotPTListReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_PerAtReport] then self.FindClassForm('TfmPerAtReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_PersonStateReport] then self.FindClassForm('TfmPersonStateReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_ReaderState] then self.FindClassForm('TfmReaderState').FindCommand('Close').Execute;
   if G_bFormEnabled[con_RemoteSupport] then self.FindClassForm('TfmRemoteSupport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_ScheduleForm] then self.FindClassForm('TDoorscheduleRegForm').FindCommand('Close').Execute;
   if G_bFormEnabled[con_TimeAccessReport] then self.FindClassForm('TfmTimeAccessReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_TimeNotAccessReport] then self.FindClassForm('TfmTimeNotAccessReport').FindCommand('Close').Execute;
   if G_bFormEnabled[con_TreeEmployeeShow] then self.FindClassForm('TfmTreeEmployee').FindCommand('Close').Execute;
   if G_bFormEnabled[con_ZoneStateReport] then self.FindClassForm('TfmZoneStateReport').FindCommand('Close').Execute;


end;

procedure TfmMain.mn_zonestatereportClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmZoneStateReport');
end;

procedure TfmMain.RcvDeviceSetupData(Sender: TObject; NodeNo: integer;
  aEcuID, aPacketData: string);
begin
  if G_bFormEnabled[con_ZoneStateReport] then
  begin
    self.FindClassForm('TfmZoneStateReport').FindCommand('REMOTE').Params.Values['DEVICEID'] := FillZeroNumber(NodeNo,3) + aEcuID;
    self.FindClassForm('TfmZoneStateReport').FindCommand('REMOTE').Params.Values['DATA'] := aPacketData;
    self.FindClassForm('TfmZoneStateReport').FindCommand('REMOTE').Execute;
  end;
end;

procedure TfmMain.DoorStateCheckTimer1Timer(Sender: TObject);
var
  i : integer;
  stSendData : string;
  nIndex : integer;
begin
  inherited;
  DoorStateCheckTimer1.Enabled := False;
  for i:= 0 to DoorStateList.Count - 1 do
  begin
    if (TDoorState(DoorStateList.objects[i]).DoorCardMode = pnNothing) or
       (TDoorState(DoorStateList.objects[i]).DoorManageMode = dmNothing) or
       (TDoorState(DoorStateList.objects[i]).DoorDSState = dsNothing) then
    begin
      stSendData := 'STATECHECK'+ DATADELIMITER + FillZeroNumber(TDoorState(DoorStateList.objects[i]).NodeNo,3) + TDoorState(DoorStateList.objects[i]).ECUID + inttostr(TDoorState(DoorStateList.objects[i]).DoorNo) + DATADELIMITER;
      nIndex := SendStateDataList.IndexOf(stSendData);
      if (nIndex < 0) then SendStateDataList.Add(stSendData);
    end;
  end;
end;

procedure TfmMain.N56Click(Sender: TObject);
begin
  MDIChildShow('TfmReaderManager');
end;

procedure TfmMain.DeviceChange;
begin

end;

procedure TfmMain.MediaPlayer1Notify(Sender: TObject);
begin
  inherited;
  if (MediaPlayer1.NotifyValue = nvSuccessful) then AlarmPlayStop := True;
  if (MediaPlayer1.Mode = mpStopped) then AlarmPlayStop := True;

end;

procedure TfmMain.mn_SystemLoginReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmSystemLoginReport');
  self.FindClassForm('TfmSystemLoginReport').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.mn_AdminChangeReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildShow('TfmAdminChangeReport');
  self.FindClassForm('TfmAdminChangeReport').FindCommand('GRADEREFRESH').Execute;

end;

end.
