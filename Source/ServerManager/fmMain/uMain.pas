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
  Registry, antTaskbarIcon;

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
    Image1: TImage;
    Menu_ImageList: TImageList;
    ActionList1: TActionList;
    Action_Monitoring: TAction;
    Action_Login: TAction;
    StatusBar1: TStatusBar;
    Action_LogOut: TAction;
    Action_Employ: TAction;
    Action_CardAdmin: TAction;
    Action_DeviceGradeSearch: TAction;
    Action_TotClose: TAction;
    Action_StateSearch: TAction;
    Action_TotOpen: TAction;
    Action_TotAlarm: TAction;
    Action_TotCancel: TAction;
    WinsockPort1: TApdWinsockPort;
    SendDaemonTimer: TTimer;
    Action_DeviceCard: TAction;
    Action_CardDownLoad: TAction;
    Action1: TAction;
    SaveDialog1: TSaveDialog;
    SimpleItemEditor1: TSimpleItemEditor;
    ServerConnectTimer: TTimer;
    ADOQuery: TADOQuery;
    LiveTimer: TTimer;
    NowTimer: TTimer;
    LMDIniCtrl1: TLMDIniCtrl;
    Action_GroupMonitoring: TAction;
    Action_DoorTypeMonitoring: TAction;
    Action_KTTypeMonitoring: TAction;
    AdoConnectCheckTimer: TTimer;
    Action_AlarmTypeMonitoring: TAction;
    ControlSocketPort: TApdWinsockPort;
    DaemonReceiveTimer: TTimer;
    Action_AccessTypeMonitoring: TAction;
    DaemonLiveCheckTimer: TTimer;
    DaemonLiveRecvTimer: TTimer;
    pan_DaemonReceve: TPanel;
    DaemonMessageVisibleTimer1: TTimer;
    Action_BuildingAccessTypeMonitoring: TAction;
    Action_AlarmMapMonitoring: TAction;
    Action_AccessMapMonitoring: TAction;
    WinsockPort: TClientSocket;
    DBSocketReceiveTimer: TTimer;
    Action_DoorGradeSearch: TAction;
    Action_AlarmGardeSearch: TAction;
    tbi: TantTaskbarIcon;
    TrayTimer: TTimer;
    pm_TrayMenu: TPopupMenu;
    mn_trayVisible: TMenuItem;
    N2: TMenuItem;
    mn_trayClose: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Action_LoginExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure WinsockPort1TriggerAvail(CP: TObject; Count: Word);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WinsockPort1WsConnect(Sender: TObject);
    procedure WinsockPort1WsError(Sender: TObject; ErrCode: Integer);
    procedure WinsockPort1WsDisconnect(Sender: TObject);
    procedure btnDaemonConnectClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure SendDaemonTimerTimer(Sender: TObject);
    procedure CommandArrayCommandsTCommand4Execute(Command: TCommand;
      Params: TStringList);
    procedure ServerConnectTimerTimer(Sender: TObject);
    procedure LiveTimerTimer(Sender: TObject);
    procedure NowTimerTimer(Sender: TObject);
    procedure mn_InOutReportClick(Sender: TObject);
    procedure mn_KTCardClick(Sender: TObject);
    procedure CommandArrayCommandsTMulitServerSendExecute(
      Command: TCommand; Params: TStringList);
    procedure CommandArrayCommandsTSERVERSTATEExecute(Command: TCommand;
      Params: TStringList);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);

    procedure ControlSocketPortWsConnect(Sender: TObject);
    procedure ControlSocketPortWsDisconnect(Sender: TObject);
    procedure ControlSocketPortWsError(Sender: TObject; ErrCode: Integer);
    procedure ControlSocketPortTriggerAvail(CP: TObject; Count: Word);
    procedure CommandArrayCommandsTAlarmSoundExecute(Command: TCommand;
      Params: TStringList);
    procedure DaemonReceiveTimerTimer(Sender: TObject);
    procedure Action_AccessTypeMonitoringExecute(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure CommandArrayCommandsTLOCATIONMAPExecute(Command: TCommand;
      Params: TStringList);
    procedure mn_empChangeReportClick(Sender: TObject);
    procedure DaemonLiveCheckTimerTimer(Sender: TObject);
    procedure DaemonLiveRecvTimerTimer(Sender: TObject);
    procedure DaemonMessageVisibleTimer1Timer(Sender: TObject);
    procedure mn_cardReportClick(Sender: TObject);
    procedure WinsockPortConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure WinsockPortDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure WinsockPortError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure WinsockPortRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure CommandArrayCommandsTSTATUSExecute(Command: TCommand;
      Params: TStringList);
    procedure DBSocketReceiveTimerTimer(Sender: TObject);
    procedure TrayTimerTimer(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure mn_trayVisibleClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mn_trayCloseClick(Sender: TObject);
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
    L_bClose : Boolean;
    L_nArmAreaStateCount : integer;
    L_nRecvPacketCount : integer;
    L_nWebContentLength : integer;
    L_nKeyCheck : integer;
    L_bWebComplete : Boolean;
    L_bZeronConnected : Boolean;
    L_nCurrentAlarmCnt : integer;
    L_nDaemonReciveFailCount : integer;
    L_nOldDBSocketSeq : integer; //최종 가져온 DBSocketSequence
    L_dtActiveTime : TDateTime;
    L_nNotReceviceCount : integer;
    L_nConnectTryCount : integer; //접속 시도 count

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
    Function  MDIForm(FormName:string):TForm;
    Procedure MDIChildShow(FormName:String);
    Procedure MDIChildGradeShow(FormName:String;aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
    Procedure TravelMenuItem(MenuItem:TMenuItem;ProgIDs:String);
    Procedure TravelMenuView(MenuItem:TMenuItem;ProgIDs:String);
    Procedure TravelToolBar(ToolBar:TToolBar;ProgIDs:String);
    Procedure TravelToolButton(ToolButton:TToolButton;ProgIDs:String);
    procedure InitConfigSet;
    procedure RelayConfigSet;
    procedure FormNameSet;
    Procedure SendDaemon(aData:string);
    Function  DBBackup(aDBName,aBackupFile:string):Boolean;
    procedure GetProgramGrade(aProgID:string;var aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
    procedure ClientConfigRead;
    procedure DaemonRestart;
    procedure MonitoringDataProcess(aData:string;aDaemonNo:integer=0);
    procedure SetFDaemonServerConnected(const Value: Boolean);
    procedure SetFControlSocketConnected(const Value: Boolean);
    procedure ProgramAllStart;
    procedure ProgramAllStop;
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
  private //Zeron Server FTP File Transfer
    L_stCustomerID : string;
    Function CreateZmosConfig:string;
    Function FTPZeronServerSend:Boolean;

  public
    DownLoadCardList : TStringList;
    bCardDownLoad : Boolean;
    { Public declarations }
  Published
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

  public
    procedure AlarmEventViewStatusCodeLoad; //알람발생 코드 로드
    procedure AlarmEventSoundStatusCodeLoad; //알람발생 코드 로드


    //데몬 상태변경 이벤트
    procedure RestartServer(Sender:TObject); //데몬 재시작시 수행됨
    procedure DaemonLive(Sender:TObject);
//    procedure ServerConnectEvent(Sender:TObject;aValue:Boolean); //Daemon Server Connected Event
  private
    L_bSendResult :Boolean;
    L_bWait :Boolean;
    L_stCardNo :string;
    procedure MessageEvent(var Msg: TMsg; var Handled: Boolean);
  end;

var
  fmMain: TfmMain;

implementation
uses
  udmAdoRelay, //연동 DB Connection 을 가지고 있다.
  uDataBaseConfig,
  uLogin,
  uLomosUtil,
  uProgramConfig,
  uCommonSql,uMDBSql,uMssql,uPostGreSql,
  uFireBird, UCommonModule, udmAdoQuery;

{$R *.dfm}


function ZDaemonCheck: Boolean;
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
  result := False;
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('ZDaemon.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            result := True;
            break;
          end;
        end;
      end;
    end;
  Finally
    ProcessList.Clear;
    ProcessList.Free;
  End;
end;

function ZDaemonProcessStart: Boolean;
begin
  result := False;
  TDataBaseConfig.GetObject.DataBaseConnect;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    LogSave(ExeFolder + '\..\log\ServerManager'+ FormatDateTIme('yyyymmdd',Now)+'.log','DBConnected Error!! ');
    Exit;
  end;

  //여기에서 프로그램 실행 시키자.
  if FileExists(ExeFolder + '\Zdaemon.exe') then
  begin
    //ShellExecute(0, 'open', pchar(ExeFolder + '\Zdaemon.exe'),'','', SW_Normal);
    WinExec(pchar(ExeFolder + '\Zdaemon.exe'),SW_Show);
    LogSave(ExeFolder + '\..\log\ServerManager'+ FormatDateTIme('yyyymmdd',Now)+'.log','Zdaemon.exe Start ');
//    ShellExecute(0, 'runas', pchar(ExeFolder + '\MyExec.exe'),pchar(ExeFolder + '\GMS_AFServer.exe'),'', SW_HIDE);
//    ShellExecute(0, 'runas', pchar(ExeFolder + '\MyExec.exe'),pchar('"' +ExeFolder + '\GMS_AFServer.exe"'),'', SW_HIDE);
//    Winexec(pAnsiChar('GMS_AFServer.exe'),SW_SHOW);
    result := True;
  end;
end;


function ZDaemonProcessStop: Boolean;
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
//  Exit;
  Try
    ProcessList := TStringList.Create;
    ProcessList.Clear;
    Process32List(ProcessList);
    GetWindowThreadProcessId(Application.Handle, @pSelfID);
    for i := 0 to ProcessList.Count - 1 do
    begin
      if UpperCase(ProcessList.Strings[i]) = UpperCase('Zdaemon.exe') then  //실행 되고 있으면
      begin
        ProcId := DWORD(ProcessList.Objects[i]);
        if ProcID <> pSelfID then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          if hProcess <> 0 then
          begin
            // 명시한 process를 강제 종료시킨다
            TerminateProcess(hProcess, 0);
          end;
        end;
      end;
    end;
  Finally
    ProcessList.clear;
    ProcessList.Free;
  End;
end;


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

  LogoFile := ExeFolder + '\..\image\KTMOSLogo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);

  StatusBar1.Panels[1].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - StatusBar1.Panels[2].Width - StatusBar1.Panels[3].Width - StatusBar1.Panels[4].Width - StatusBar1.Panels[5].Width;


  TDataBaseConfig.GetObject.DataBaseConnect;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('데이터베이스 접속 실패입니다. 데이터베이스 환경설정을 확인하여 주세요.');
    G_bApplicationTerminate := True;
    Application.Terminate;
    Exit;
  end;

  InitConfigSet;
  ClientConfigRead;


end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
  i : integer;
begin
  Application.OnMessage := MessageEvent;
  NETTYPE :='TCPIP';
  self.ModuleID := 'Main';
  G_bApplicationTerminate := False;
  bCardDownLoad := False;
  ExeFolder  := ExtractFileDir(Application.ExeName);

  MemoryCreate;
  MemoryClear;


  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  L_nKeyCheck := ini_fun.ReadInteger('Key','Check',0);
  ini_fun.Free;

  G_bAlarmRefreshStart := False;
  L_bDaemonLiveReceive := False;

  L_nRecvPacketCount := 0;
  L_nDaemonReciveFailCount := 0;
  G_nAlarmRefreshDate := 2;
  L_nArmAreaStateCount := 0;
  L_nNotReceviceCount := 0;
  L_nConnectTryCount := 0;
  SendDaemonTimer.Enabled := True;
  TrayTimer.Enabled := True;
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
end;

procedure TfmMain.Action_LoginExecute(Sender: TObject);
begin
   StatusBar1.Panels[1].Text := '로그인 중입니다.' ;

   TLogin.GetObject.ShowLoginDlg;
   Master_ID := TLogin.GetObject.UserID;
   Master_Name := TLogin.GetObject.UserName;
   AdminGrade := Trim(TLogin.GetObject.Grade);
   stPrivileges :=TLogin.GetObject.ProgIDs; //권한설정

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


procedure TfmMain.FormResize(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[1].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - StatusBar1.Panels[2].Width - StatusBar1.Panels[3].Width- StatusBar1.Panels[4].Width- StatusBar1.Panels[5].Width;
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
  L_bDaemonLiveReceive := True;
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
  Try
    G_bApplicationTerminate := True;
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

    MemoryFree;

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

procedure TfmMain.CommandArrayCommandsTCommand4Execute(Command: TCommand;
  Params: TStringList);
var
  stDeviceID : string;
  stAck : string;
begin
  stDeviceID := Params.Values['VALUE'];
  stAck := Copy(stDeviceID,13,1);
  stDeviceID := copy(stDeviceID,1,13);
end;

procedure TfmMain.ServerConnectTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  ServerConnectTimer.Enabled := False;
  if Not DaemonServerConnected then
  begin
    btnDaemonConnectClick(self);
    inc(L_nConnectTryCount);
    if(L_nConnectTryCount > 5) then
    begin
      ProgramAllStop;
      ProgramAllStart;
      L_nConnectTryCount := 0;
    end;
  end;
  ServerConnectTimer.Enabled := Not G_bApplicationTerminate;
{  if WinSockPort.Open then Exit;
  WinsockPort.Open := True;
}
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


procedure TfmMain.NowTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
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

  G_nMonitoringAttendReport := LMDIniCtrl1.ReadInteger('환경설정','근태보고서',0);
  G_nMultiDeleteCard := LMDIniCtrl1.ReadInteger('환경설정','멀티삭제',0);
  G_nEmployeeAdminType := LMDIniCtrl1.ReadInteger('환경설정','사원관리',0);
  G_nFileFormat := LMDIniCtrl1.ReadInteger('환경설정','파일포맷',0);

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

procedure TfmMain.DaemonRestart;
begin
  SendDaemonDataList.Add('DEAMONRESTART'+ DATADELIMITER + '0000000000000' + DATADELIMITER );
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
      pan_DaemonReceve.Visible := False;
    end else
    begin
      pan_DaemonReceve.Visible := True;
      DaemonMessageVisibleTimer1.Enabled := True;
    end;        
  end;
  if FDaemonServerConnected = Value then Exit;
  FDaemonServerConnected := Value;

  //LiveTimer.Enabled := Value;
  if Not Value then
  begin
    if G_nMultiSocket = 0 then
      SendDaemonDataList.Clear;

    for i := 0 to NodeList.Count - 1 do
    begin
      TNodeState(NodeList.Objects[i]).NodeConnected := False;
    end;

  end else
  begin
    //여기서 연결 처음 시작

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
  end;// else btnDaemonConnect.Enabled := Not Value;

  if Not Value then
  begin
    if G_nMultiSocket = 1 then
    begin
      SendDaemonDataList.Clear;
    end;
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
//  DaemonState.OnAlarmRefresh := AlarmRefresh;
//  DaemonState.OnFireRecovery := FireRecovery;
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

procedure TfmMain.AlarmEventSoundStatusCodeLoad;
var
  stSql : string;
  TempAdoQuery :TADOQuery;

begin
  AlarmEventSoundStatusCode.Clear;

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
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
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
  //데몬과 연결이 되어 있는지 체크하자.
  if G_bApplicationTerminate then Exit;
  DaemonLiveRecvTimer.Enabled := False;
  Try
    if L_nRecvPacketCount > 0 then
    begin
      L_nNotReceviceCount := 0;
      //수신데이터가 있다는 것은 연결이 되어 있다는 말...
      L_bDaemonLiveReceive := False;
      DaemonMessageVisibleTimer1.Enabled := False;
      pan_DaemonReceve.Visible := False;
      Exit;
    end;
    if L_bDaemonLiveReceive then
    begin
      L_nNotReceviceCount := 0;
      //해당 시간 안에 수신 데이터가 있었다는 얘기는 연결이 되어 있다는 얘기 임
      L_bDaemonLiveReceive := False;
      DaemonMessageVisibleTimer1.Enabled := False;
      pan_DaemonReceve.Visible := False;
      Exit;
    end;

    inc(L_nNotReceviceCount);
    if(L_nNotReceviceCount > 3) then
    begin
      L_nNotReceviceCount := 0;
      ProgramAllStop;
      ProgramAllStart;
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
  pan_DaemonReceve.Visible := False;
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
  pan_DaemonReceve.Visible := Not pan_DaemonReceve.Visible;

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

procedure TfmMain.MessageEvent(var Msg: TMsg; var Handled: Boolean);
begin

  if (Msg.message = WM_KEYDOWN) or (Msg.message = WM_KEYUP) or (Msg.message = WM_LBUTTONDOWN) or (Msg.message = WM_RBUTTONDOWN) then
  begin
    L_dtActiveTime := Now;
  end;
end;


procedure TfmMain.ProgramAllStart;
begin
  ZDaemonProcessStart;
end;

procedure TfmMain.ProgramAllStop;
begin
  ZDaemonProcessStop;
end;

procedure TfmMain.TrayTimerTimer(Sender: TObject);
var
  nCount : integer;
begin
  TrayTimer.Enabled := False;
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  tbi.Hint := '통신서버매니져';
  tbi.Visible := True;
  tbi.Show;

end;

procedure TfmMain.tbiDblClick(Sender: TObject);
begin
  inherited;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();

end;

procedure TfmMain.mn_trayVisibleClick(Sender: TObject);
begin
  inherited;
  tbiDblClick(self);
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if L_bClose = False then
  begin
    CanClose := False;
    Hide();
    WindowState := wsMinimized;
  end;

end;

procedure TfmMain.mn_trayCloseClick(Sender: TObject);
begin
  inherited;
  L_bClose := True;
  Close;

end;

end.
