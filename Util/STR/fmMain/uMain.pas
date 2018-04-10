unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ComCtrls, ToolWin, ImgList, Menus,IniFiles, OoMisc,
  AdPort, AdWnPort,ADODB,ActiveX, ExtCtrls,
  uDataModule1,
  uDeviceState, uSubForm, CommandArray,
  SyncObjs, StdCtrls;

type
  TReceiveMonitorThread = class(TThread)
  private
  protected
    procedure Execute; override;
    procedure MonitorProcess(aData:string) ;
  public
  end;

  TfmMain = class(TfmASubForm)
    MainMenu1: TMainMenu;
    mn_program: TMenuItem;
    mn_Connect: TMenuItem;
    mn_DisConnect: TMenuItem;
    N5: TMenuItem;
    mn_LanModule: TMenuItem;
    N21: TMenuItem;
    mn_PWChange: TMenuItem;
    N1: TMenuItem;
    mn_Exit: TMenuItem;
    mn_Setting: TMenuItem;
    N2: TMenuItem;
    N16: TMenuItem;
    mn_State: TMenuItem;
    Menu_ImageList: TImageList;
    ToolBar1: TToolBar;
    btnDeviceConnect: TToolButton;
    btnDeviceDisConnect: TToolButton;
    ToolButton1: TToolButton;
    btnDeviceSetting: TToolButton;
    ActionList1: TActionList;
    Action_DeviceConnect: TAction;
    Action_DeviceDisConnect: TAction;
    Action_DeviceSetting: TAction;
    ToolButton2: TToolButton;
    Action_ComMonitoring: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Action_DeviceRefresh: TAction;
    N3: TMenuItem;
    mn_login: TMenuItem;
    mn_logout: TMenuItem;
    N7: TMenuItem;
    WinsockPort: TApdWinsockPort;
    daemonConnect: TTimer;
    SendDaemonTimer: TTimer;
    StatusBar1: TStatusBar;
    DaemonReceiveTimer: TTimer;
    procedure mn_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mn_loginClick(Sender: TObject);
    procedure mn_logoutClick(Sender: TObject);
    procedure mn_PWChangeClick(Sender: TObject);
    procedure Action_DeviceConnectExecute(Sender: TObject);
    procedure WinsockPortWsConnect(Sender: TObject);
    procedure WinsockPortWsDisconnect(Sender: TObject);
    procedure WinsockPortWsError(Sender: TObject; ErrCode: Integer);
    procedure Action_DeviceDisConnectExecute(Sender: TObject);
    procedure daemonConnectTimer(Sender: TObject);
    procedure mn_LanModuleClick(Sender: TObject);
    procedure Action_DeviceSettingExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCommandExecute(Command: TCommand;
      Params: TStringList);
    procedure Action_DeviceRefreshExecute(Sender: TObject);
    procedure CommandArrayCommandsTDaemonSendExecute(Command: TCommand;
      Params: TStringList);
    procedure SendDaemonTimerTimer(Sender: TObject);
    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure DaemonReceiveTimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CommandArrayCommandsTSendDataExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTRefreshExecute(Command: TCommand;
      Params: TStringList);
  private
    FLogined: Boolean;
    L_stDaemonServerIP : string;
    L_stDaemonControlPort : string;
    SendDaemonDataList : TStringList;
    ReceiveDataList : TStringList;
    FDaemonConnected: Boolean;
    FDEVICESETView: Boolean;
    ServerComBuff : String;
    L_nRecvPacketCount : integer;
    FReceiveTCS : TCriticalSection;

    ReceiveThread :TReceiveMonitorThread;
    
    { Private declarations }
    Function  MDIForm(FormName:string):TForm;
    Procedure MDIChildShow(FormName:String);
    procedure SetLogined(const Value: Boolean);
    procedure SetDaemonConnected(const Value: Boolean);
    procedure SetDEVICESETView(const Value: Boolean);

    procedure ReceiveThreadStart;
    procedure ReceiveThreadStop;
  private
    procedure AllDeviceStateCheck;
  private
    procedure MemoryCreate;
    procedure MemoryFree;
    procedure DB_InitializeConfig;
    procedure LoadDevice;
    procedure LoadNode;
    procedure LoadEcu;
    procedure LoadDoor;
    procedure LoadReader;
    procedure LoadPort;
    procedure UnLoadDevice;
    procedure AlarmEventViewStatusCodeLoad; //알람발생 코드 로드
    procedure AlarmEventSoundStatusCodeLoad; //알람발생 코드 로드
  private
    //노드별 상태변경 이벤트
    procedure NodeConnectState(Sender:TObject;NodeNo:integer;aConnectState:TNodeCurrentState); //노드 Connected State

    //기기별 상태변경 이벤트
    procedure DoorFireStateChange(Sender:TObject;NodeNo:integer;aEcuID,aDoorNo:string;aFireState:Boolean); //출입문 화재 발생
    procedure DoorStateChange(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorState;
                                  aDoorLockType:TDoorLockState);
    procedure DeviceConnected(Sender: TObject;  Value:Boolean; NodeNo : integer;aEcuID:string);
    procedure AlarmModeChanged(Sender: TObject; NodeNo : integer;aEcuID:string;aWachMode:TWatchMode); //경해 모드 변경
    procedure DeviceAlarmEventProcess(Sender:TObject;NodeNo:integer;ECUID:string;aAlaramState:TAlarmEventState);
    procedure AlarmEventAnalysis(Sender:TObject;NodeNo:integer;ECUID:string;
                                  aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aZoneCode,aMode,aStatusCode,aPortNo,aState,
                                  aOperator,aNewStateCode:string;
                                  aAlarmView,aAlarmSound:Boolean;
                                  aAlarmColor:string);
    procedure ExitButtonPress(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo,aTime,aInputType:string);
    procedure AccessEventProcess(Sender:TObject;NodeNo:integer;aEcuID,aDoorNo,aReaderNo,aCardNo,aTime,aPermit,aInputType,aButton:string);
    procedure DeviceSetupData(Sender:TObject;NodeNo:integer;aEcuID,aPacketData:string);
    procedure DeviceTypeChange(Sender:TObject;NodeNo:integer;aEcuID,aDeviceType:string);
    procedure DaemonLive(Sender:TObject);

    procedure MonitoringDataProcess(aData:string;aDaemonNo:integer=0);
  private
    procedure DeviceRcvAlarmData(NodeNo:integer;aEcuID,aPacketData:string);
    procedure RegDataProcess(NodeNo:integer;aEcuID,aPacketData:string);
    procedure RemoteDataProcess(NodeNo:integer;aEcuID,aPacketData:string);
    procedure AccessDataProcess(NodeNo:integer;aEcuID,aPacketData:string);
    procedure FirmwareProcess(NodeNo:integer;aEcuID,aPacketData:string);
    procedure FirmwareProcess2(NodeNo:integer;aEcuID,aPacketData:string);
    procedure PTMonitoringProcess(NodeNo:integer;aEcuID,aPacketData:string);
    procedure ErrorDataProcess(NodeNo:integer;aEcuID,aPacketData:string);
  private
    procedure RcvDeviceID(NodeNo:integer;aEcuID,aData:string);
    procedure RcvCardReader(NodeNo:integer;aEcuID,aData:string);
    procedure RcvSysinfo(NodeNo:integer;aEcuID,aData:string);
    procedure RcvJaejungDelayUse(NodeNo:integer;aEcuID,aData:string);
    procedure RcvRelay(NodeNo:integer;aEcuID,aData:string);
    procedure RcvPort(NodeNo:integer;aEcuID,aData:string);
    procedure RcvUsedAlarmdisplay(NodeNo:integer;aEcuID,aData:string);
    procedure RcvUsedDevice(NodeNo:integer;aEcuID,aData:string);
    procedure RcvDeviceType(NodeNo:integer;aEcuID,aData:string);
    procedure RcvLinkusTelNo(NodeNo:integer;aEcuID,aData:string);
    procedure RcvWiznetInfo(NodeNo:integer;aEcuID,aData:string);
    procedure RcvControlDialInfo(NodeNo:integer;aEcuID,aData:string);
    procedure RcvLinkusId(NodeNo:integer;aEcuID,aData:string);
    procedure RcvLinkusPt(NodeNo:integer;aEcuID,aData:string);
    procedure RcvCardType(NodeNo:integer;aEcuID,aData:string);
    procedure RcvRingCount(NodeNo:integer;aEcuID,aData:string);
    procedure DeviceState1Show(NodeNo:integer;aEcuID,aData:string);
    procedure ZoneStateShow(NodeNo:integer;aEcuID,aData:string);
    procedure DeviceState2Show(NodeNo:integer;aEcuID,aData:string);
    procedure DeviceExceptShow(NodeNo:integer;aEcuID,aData:string);
    procedure RcvArmDsCheck(NodeNo:integer;aEcuID,aData:string);
    procedure RcvCDMASettingData(NodeNo:integer;aEcuID,aData:string);
    procedure RcvDVRSettingData(NodeNo:integer;aEcuID,aData:string);
    procedure RcvDeviceVersion(NodeNo:integer;aEcuID,aVersion:string);
    procedure RcvDeviceCode(NodeNo:integer;aEcuID,aCode:string);
    procedure RcvTime(NodeNo:integer;aEcuID,aTime:string);
    procedure RcvCardReaderVersion(NodeNo:integer;aEcuID,aData:string);
    procedure RcvAlarmState(NodeNo:integer;aEcuID,aData:string);
    procedure RcvDoorinfo2(NodeNo:integer;aEcuID,aData:string);
  protected
    Property Logined : Boolean read FLogined write  SetLogined; //프로퍼티를 생성함으로 Logined라는 변수가 바뀌면 SetLogined 라는 함수가 실행됨
    property DaemonConnected : Boolean read FDaemonConnected write SetDaemonConnected;
    property DEVICESETView : Boolean read FDEVICESETView write SetDEVICESETView;
  public
    { Public declarations }
    procedure DaemonSendPacket(aNodeNo:integer;aEcuID,aNo,aCmd,aData:string);
  public
    function UsedDevice_Registration(aNodeNo,aEcuList:string):Boolean;
    function RegistDeviceType(aNodeNo,aEcuType:string):Boolean;
    function ControllerID_Registration(aNodeNo,aMcuid:string):Boolean;
    function LinkusID_Registration(aNodeNo,aLinkusID:string):Boolean;
    function LinkusTelNumber_Registration(aNodeNo,aLinkusTel:string):Boolean;
    function RingCount_Registration(aNodeNo,aRingCount,aCancelRingCount:string):Boolean;
    function SystemInfo_Registration(aNodeNo,aEcuID,aWatchPowerOff, aOutDelay, aInDelay, aDoorType1, aDoorType2:string):Boolean;
    function JaejungDelayUse_Registration(aNodeNo,aEcuID,aJaeJung:string):Boolean;
    function TelLineCheck_Registration(aNodeNo,aEcuID,aTime:string):Boolean;
    function RegistDoorLockInfo(aNodeNo,aEcuID: string;        // 기기번호
                         aDoorNo: Integer;         // 문번호
                          aCardMode: Integer;      // 카드 운영모드 (0:Positive, 1:Negative)
                          aDoorMode: Integer;      // 출입문 운영모드 (0:운영, 1:개방)
                          aDoorOpenTime: string;   // Door 제어시간
                          aOpenMoniTime: Integer;   // 장시간 열림 경보
                          aUseSchedule: Integer;    // 스케줄 적용 여부 (0:사용안함, 1:사용)
                          aSendDoorState: Integer;  // 출입문 상태 전송(0:사용안함, 1:사용)
                          aUseOpenalarm: Integer;   // 장시간 열림 부저 출력(0:사용안함, 1:사용)
                          aLockType: Integer;       // 전기정 타입
                          aControledFire: Integer;   // 화재 발생시 문제어
                          aDsOpenState:integer;
                          aRemoteCancelDoorOpen:integer ): Boolean;
    function RegistCardReaderInfo(aNodeNo,aEcuID: string;
             aReaderNo,aReaderuse,aReaderDoor,aReaderDoorLocate,aReaderBuildingLocate:integer):Boolean;
    function RegistCardType(aNodeNo,aEcuID:string;aCardType:integer):Boolean;
    function RegistPort(aNodeNo,aEcuID:string;       // 기기번호
              aPortNo,aWhatchType,aZoneDelay,aRecorver,aWhatchTime:integer;
              aLocate:string):Boolean;
  public
    function ControllerIDSearch(aNodeNo:string):Boolean;
    function DeviceUseStateSearch(aNodeNo:string): Boolean;
    function DeviceTypeSearch(aNodeNo:string):Boolean;
    function TelecopIDSearch(aNodeNo:string):Boolean;
    function TelecopTelNumSearch(aNodeNo:string):Boolean;
    function TelecopRingCountSearch(aNodeNo:string):Boolean;
    function TimeCheck(aNodeNo:string):Boolean;
    function ArmStateSearch(aNodeNo,aEcuID:string):Boolean;
    function ZoneabnormalCheck(aNodeNo,aEcuID:string):Boolean;
    function SystemInfoSearch(aNodeNo,aEcuID:string):Boolean;
    function  DoorLockInfoSearch(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    function  DoorLockStateSearch(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    function CardReaderInfoSearch(aNodeNo,aEcuID,aCardReaderNo:string):Boolean;
    function  CardReaderTypeSearch(aNodeNo,aEcuID:string):Boolean;
    function CardReaderVerSearch(aNodeNo,aEcuID,aCardReaderNo:string):Boolean;
    function PortInfoSearch(aNodeNo,aEcuID,aPortNo:string):Boolean;
    function PortStateSearch(aNodeNo,aEcuID:string):Boolean;
    function ChangeArmMode(aNodeNo,aEcuID,aMode : string):Boolean;
    function CardReaderVersionCheck(aNodeNo,aEcuID,aCardReaderNo:string):Boolean;
    function DeviceVersion_Check(aNodeNo,aEcuID:string):Boolean;
    function DeviceCode_Check(aNodeNo,aEcuID:string):Boolean;
  public
    procedure DeviceReboot(aNodeNo,aEcuID:string);

  end;

var
  fmMain: TfmMain;

implementation

uses
  uLomosUtil,
  uDataBaseConfig,
  systeminfos,
  uLogin,
  uPwChange,
  uNetConfig,
  uMonitoringCommonVariable,
  uDeviceSetting,
  uDeviceSettingValiable,
  uDeviceSettingUtil,
  uMonitoringDataProcess;
{$R *.dfm}

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

procedure TfmMain.mn_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  self.ModuleID := 'Main';
  NETTYPE :='TCPIP';
  ExeFolder  := ExtractFileDir(Application.ExeName);

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

  Try
    ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');

  Finally
    ini_fun.free;
  End;

  MemoryCreate;
  SendDaemonTimer.Enabled := True;
  DB_InitializeConfig;

  if G_nDaemonServerVersion < 6 then
  begin
    showmessage('데몬을 업그레이드 하셔야 합니다.');
    Application.Terminate;
    Exit;
  end;

  Logined := False;
  L_nRecvPacketCount := 0;

  fmMain.Caption := fmMain.Caption + '[' + strBuildInfo + ']';

end;

procedure TfmMain.mn_loginClick(Sender: TObject);
begin
  TLogin.GetObject.ShowLoginDlg;
  Logined := TLogin.GetObject.Logined;

end;

procedure TfmMain.SetLogined(const Value: Boolean);
begin
  FLogined := Value;

  mn_login.Enabled := Not Value;
  mn_logout.Enabled := Value;

  mn_LanModule.Enabled := Value;
  mn_PWChange.Enabled := Value;
  mn_Setting.Enabled := Value;

  ToolBar1.Enabled := Value;
end;

procedure TfmMain.mn_logoutClick(Sender: TObject);
begin
  Logined := False;
end;

procedure TfmMain.mn_PWChangeClick(Sender: TObject);
begin
  fmPwChange:= TfmPwChange.Create(Self);
  fmPwChange.SHowModal;
  fmPwChange.Free;
  Logined := False;
end;

procedure TfmMain.Action_DeviceConnectExecute(Sender: TObject);
begin
  WinsockPort.Open := False;
  Delay(100);
  WinsockPort.WsAddress := L_stDaemonServerIP;
  WinsockPort.WsPort := L_stDaemonControlPort;
  WinsockPort.Open := True;

  daemonConnect.Enabled := True;
end;

procedure TfmMain.DB_InitializeConfig;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND ';
  stSql := stSql + ' ( ';
  stSql := stSql + ' CO_CONFIGGROUP = ''DAEMON'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' ) ';

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
        if FindField('CO_CONFIGCODE').AsString = 'IP' then
        begin
          L_stDaemonServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'CONTRLPORT' then
        begin
          L_stDaemonControlPort := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'DAEMON_VER' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then
            G_nDaemonServerVersion := strtoint(FindField('CO_CONFIGVALUE').AsString);
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
end;

procedure TfmMain.WinsockPortWsConnect(Sender: TObject);
begin
  DaemonConnected := True;
end;

procedure TfmMain.WinsockPortWsDisconnect(Sender: TObject);
begin
  DaemonConnected := False;
end;

procedure TfmMain.WinsockPortWsError(Sender: TObject; ErrCode: Integer);
begin
  DaemonConnected := False;
end;

procedure TfmMain.SetDaemonConnected(const Value: Boolean);
var
  fmDeviceSetting :TForm;
  i : integer;
begin
  if G_bApplicationTerminate then Exit;
  if FDaemonConnected = Value then Exit;
  FDaemonConnected := Value;
  Action_DeviceConnect.Enabled := Not Value;
  Action_DeviceDisConnect.Enabled := Value;

  if Not Value then
  begin
    ReceiveDataList.Clear;
    for i := 0 to NodeList.Count - 1 do
    begin
      TNodeState(NodeList.Objects[i]).NodeConnected := False;
    end;
    if DEVICESETView then
    begin
      fmDeviceSetting := MDIForm('TfmDeviceSetting');
      if TfmDeviceSetting <> nil then
      begin
        TfmDeviceSetting(fmDeviceSetting).ServerDisConnect;
      end;
    end;
  end else
  begin
    AllDeviceStateCheck;
  end;
end;

procedure TfmMain.Action_DeviceDisConnectExecute(Sender: TObject);
begin
  daemonConnect.Enabled := False;
  WinsockPort.Open := False;
end;

procedure TfmMain.daemonConnectTimer(Sender: TObject);
begin
//
  if DaemonConnected then Exit;
  WinsockPort.Open := False;
  Delay(100);
  WinsockPort.WsAddress := L_stDaemonServerIP;
  WinsockPort.WsPort := L_stDaemonControlPort;
  WinsockPort.Open := True;

end;

procedure TfmMain.mn_LanModuleClick(Sender: TObject);
begin
  fmNetConfig:= TfmNetConfig.Create(Self);
  fmNetConfig.SHowmodal;
  fmNetConfig.Free;

end;

procedure TfmMain.Action_DeviceSettingExecute(Sender: TObject);
begin
  MDIChildShow('TfmDeviceSetting');
end;

procedure TfmMain.LoadNode;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  TempNodeState : TNodeState;
  stNodeNo : string;
begin
  NodeList.Clear;      //노드별 기기 정보

  stSql := 'Select * from TB_ACCESSDEVICE  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  stSql := stSql + ' Order by AC_NODENO ';

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
//        stEcuID := FindField('AC_ECUID').AsString;
          //노드 정보 생성
        TempNodeState := TNodeState.Create(self);
        TempNodeState.NodeNo := FindField('AC_NODENO').asInteger;
        TempNodeState.NodeIP := FindField('AC_MCUIP').asstring;
        TempNodeState.NodeName := FindField('AC_DEVICENAME').asstring;
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

procedure TfmMain.MemoryCreate;
begin
  SendDaemonDataList := TStringList.Create;
  NodeList := TStringList.Create;
  DeviceStateList := TStringList.Create;
  ReceiveDataList := TStringList.Create;
  BuildingList := TStringList.Create;
  AlarmEventViewStatusCode := TStringList.Create;
  AlarmEventSoundStatusCode := TStringList.Create;

  FReceiveTCS := TCriticalSection.Create;

end;

procedure TfmMain.MemoryFree;
begin
  SendDaemonDataList.Free;
  NodeList.Free;
  DeviceStateList.Free;
  ReceiveDataList.Free;
  BuildingList.Free;
  AlarmEventViewStatusCode.Free;
  AlarmEventSoundStatusCode.Free;

  FReceiveTCS.Free;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  G_bApplicationTerminate := True;
  MemoryFree;
end;

procedure TfmMain.NodeConnectState(Sender: TObject; NodeNo: integer;
  aConnectState: TNodeCurrentState);
var
  fmDeviceSetting :TForm;
begin
  if G_bApplicationTerminate then Exit;
  //여기에서 노드 컨넥션 상태값 변경 될때 모니터링 상태값 변경 해 주자.
  if DEVICESETView then
  begin
    fmDeviceSetting := MDIForm('TfmDeviceSetting');
    if TfmDeviceSetting <> nil then
    begin
      TfmDeviceSetting(fmDeviceSetting).NodeConnectState(NodeNo,aConnectState);
    end;
  end;

end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  Action_DeviceRefreshExecute(self);
  Action_DeviceConnectExecute(self);
end;

procedure TfmMain.LoadEcu;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  TempNodeState : TNodeState;
  TempEcuState : TDeviceState;
  stNodeNo : string;
  stEcuID : string;
  stDeviceID : string;
  nIndex : integer;
  ParenNodeState : TNodeState;
begin
  DeviceStateList.Clear;    //기기별 상태 정보

  stSql := 'Select a.*,b.AL_ZONENAME,b.LO_DONGCODE as BuildingCode,';
  stSql := stSql + ' b.LO_FLOORCODE as FloorCode,b.LO_AREACODE as AreaCode ';
  stSql := stSql + ' from TB_ACCESSDEVICE a ';
  stSql := stSql + ' Left Join TB_ALARMDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order by a.AC_NODENO,a.AC_ECUID ';

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
          ParenNodeState := TNodeState(NodeList.Objects[nIndex]);
        end else ParenNodeState := nil;

        TempEcuState := TDeviceState.Create(self);
        TempEcuState.ParentNode := ParenNodeState;
        TempEcuState.BuildingCode := FindField('BuildingCode').asstring;
        TempEcuState.FloorCode := FindField('FloorCode').AsString;
        TempEcuState.AreaCode := FindField('AreaCode').AsString;
        TempEcuState.NodeNo := FindField('AC_NODENO').AsInteger;
        TempEcuState.ECUID := stEcuID;
        TempEcuState.DeviceName := FindField('AC_DEVICENAME').asstring;
        TempEcuState.AlarmName := FindField('AL_ZONENAME').asstring;
        TempEcuState.Connected := False;
        TempEcuState.AlarmMode := cmNothing;
        TempEcuState.AlarmEventState := aeNothing;
        TempEcuState.Door1Use := False;
        TempEcuState.Door2Use := False;
        TempEcuState.Door1CardMode := pnNothing;
        TempEcuState.Door1ManageMode := dmNothing;
        TempEcuState.Door1State := dsNothing;
        TempEcuState.Door1LockState := lsNothing;
        TempEcuState.Door1Fire := False;
        TempEcuState.Door2CardMode := pnNothing;
        TempEcuState.Door2ManageMode := dmNothing;
        TempEcuState.Door2State := dsNothing;
        TempEcuState.Door2LockState := lsNothing;
        TempEcuState.Door2Fire := False;
        TempEcuState.DeviceCode := FindField('AC_DEVICECODE').AsString;
        TempEcuState.DeviceType := FindField('AC_DEVICETYPE').AsString;

        TempEcuState.OnFireStateChange := DoorFireStateChange;
        TempEcuState.OnDeviceConnected := DeviceConnected;
        TempEcuState.OnDoorStateChange := DoorStateChange;
        TempEcuState.OnAlarmModeChanged := AlarmModeChanged;
        TempEcuState.OnExitButton := ExitButtonPress;
        TempEcuState.OnAlarmEventAnalysis := AlarmEventAnalysis;
        TempEcuState.OnAccessEvent := AccessEventProcess;
        TempEcuState.OnDeviceAlarmEvent := DeviceAlarmEventProcess;
        TempEcuState.OnDeviceSetupData := DeviceSetupData;
        TempEcuState.OnDeviceTypeChange := DeviceTypeChange;

        //nIndex := DeviceStateList.IndexOf(stDeviceID);
        DeviceStateList.AddObject(stDeviceID,TempEcuState);
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

procedure TfmMain.LoadDevice;
begin
  LoadNode;
  LoadEcu;
  LoadDoor;
  LoadReader;
  LoadPort;

end;

procedure TfmMain.DoorFireStateChange(Sender: TObject; NodeNo: integer;
  aEcuID, aDoorNo: string; aFireState: Boolean);
begin

end;

procedure TfmMain.AccessEventProcess(Sender: TObject; NodeNo: integer;
  aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
  aButton: string);
begin

end;

procedure TfmMain.AlarmEventAnalysis(Sender:TObject;NodeNo:integer;ECUID:string;
                                  aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aZoneCode,aMode,aStatusCode,aPortNo,aState,
                                  aOperator,aNewStateCode:string;
                                  aAlarmView,aAlarmSound:Boolean;
                                  aAlarmColor:string);
begin

end;

procedure TfmMain.AlarmModeChanged(Sender: TObject; NodeNo: integer;
  aEcuID: string; aWachMode: TWatchMode);
var
  fmDeviceSetting :TForm;
begin
  if G_bApplicationTerminate then Exit;
  //AlarmMode Change = 경 해 변경
  if DEVICESETView then
  begin
    fmDeviceSetting := MDIForm('TfmDeviceSetting');
    if TfmDeviceSetting <> nil then
    begin
      TfmDeviceSetting(fmDeviceSetting).AlarmModeChanged(NodeNo,aEcuID,aWachMode);
    end;
  end;
end;

procedure TfmMain.DeviceAlarmEventProcess(Sender: TObject; NodeNo: integer;
  ECUID: string; aAlaramState: TAlarmEventState);
begin

end;

procedure TfmMain.DeviceConnected(Sender: TObject; Value: Boolean;
  NodeNo: integer; aEcuID: string);
var
  fmDeviceSetting :TForm;
begin
  if G_bApplicationTerminate then Exit;
  //기기별 접속상태가 변경 되면 이쪽 루틴으로 여기서 모니터링 디스플레이 하자
  if DEVICESETView then
  begin
    fmDeviceSetting := MDIForm('TfmDeviceSetting');
    if TfmDeviceSetting <> nil then
    begin
      TfmDeviceSetting(fmDeviceSetting).DeviceConnected(NodeNo,aEcuID,Value);
    end;
  end;

end;

procedure TfmMain.DoorStateChange(Sender: TObject; NodeNo: integer; aEcuID,
  aDoorNo: string; aDoorManageType: TDoorManageMode;
  aDoorPNType: TDoorPNMode; aDoorStateType: TDoorState;
  aDoorLockType: TDoorLockState);
var
  fmDeviceSetting :TForm;
begin
  if G_bApplicationTerminate then Exit;
  //출입문 상태가 변경 됨
  if DEVICESETView then
  begin
    fmDeviceSetting := MDIForm('TfmDeviceSetting');
    if TfmDeviceSetting <> nil then
    begin
      TfmDeviceSetting(fmDeviceSetting).DoorStateChange(NodeNo,
          aEcuID, aDoorNo, aDoorManageType,aDoorPNType,aDoorStateType,aDoorLockType);
    end;
  end;
end;

procedure TfmMain.ExitButtonPress(Sender: TObject; NodeNo: integer; aEcuID,
  aDoorNo, aTime, aInputType: string);
begin

end;

procedure TfmMain.LoadReader;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stNodeNo : string;
  stEcuID : string;
  stDeviceID : string;
  nIndex : integer;
begin

  stSql := 'Select * From TB_READER ';
  stSql := stSql + ' Order by AC_NODENO,AC_ECUID,RE_READERNO ';

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
        nIndex := DeviceStateList.IndexOf(stDeviceID);
        if nIndex > -1 then
        begin
          TDeviceState(DeviceStateList.Objects[nIndex]).ReaderInforSet(FindField('RE_READERNO').AsString,FindField('RE_USE').AsString,FindField('DOOR_POSI').AsString,FindField('BUILD_POSI').AsString);
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

procedure TfmMain.LoadPort;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stNodeNo : string;
  stEcuID : string;
  stDeviceID : string;
  nIndex : integer;
begin

  stSql := 'Select * From TB_ZONEDEVICE ';
  stSql := stSql + ' Order by AC_NODENO,AC_ECUID,AL_ZONENUM ';

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
        nIndex := DeviceStateList.IndexOf(stDeviceID);
        if nIndex > -1 then
        begin
          TDeviceState(DeviceStateList.Objects[nIndex]).PortInforSet(FindField('AL_ZONENUM').AsString,FindField('AL_WATCHTYPE').AsString,FindField('AL_DELAYUSE').AsString,FindField('AL_PORTRECOVERY').AsString);
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

procedure TfmMain.CommandArrayCommandsTCommandExecute(Command: TCommand;
  Params: TStringList);
var
  stCMD : string;
  stData : string;
begin
  stCMD := Params.Values['cmd'];
  stData := Params.Values['data'];

  if Uppercase(stCMD) = 'DEVICESETTING' then
  begin
    if Uppercase(stData) = 'TRUE' then
        DEVICESETView := True
    else DEVICESETView := False;
  end;

end;

procedure TfmMain.SetDEVICESETView(const Value: Boolean);
begin
  if FDEVICESETView = Value then exit;
  FDEVICESETView := Value;
  if Value then
  begin
    // 여기에서 상태조회하자
    AllDeviceStateCheck;
  end;
end;

procedure TfmMain.LoadDoor;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stDeviceID : string;
  nTempIndex : integer;
  stBuildingID : string;
begin
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
        stDeviceID := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString;
        nTempIndex := DeviceStateList.IndexOf(stDeviceID);
        if nTempIndex > -1 then
        begin
          if FindField('DO_DOORNO').AsString = '1' then
          begin
            TDeviceState(DeviceStateList.Objects[nTempIndex]).Door1Use := True;
            TDeviceState(DeviceStateList.Objects[nTempIndex]).Door1Name := FindField('DO_DOORNONAME').AsString;
          end else if FindField('DO_DOORNO').AsString = '2' then
          begin
            TDeviceState(DeviceStateList.Objects[nTempIndex]).Door2Use := True;
            TDeviceState(DeviceStateList.Objects[nTempIndex]).Door2Name := FindField('DO_DOORNONAME').AsString;
          end
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

procedure TfmMain.Action_DeviceRefreshExecute(Sender: TObject);
var
  fmDeviceSetting : TForm;
begin
  LoadDevice;
  if DEVICESETView then
  begin
    fmDeviceSetting := MDIForm('TfmDeviceSetting');
    TfmDeviceSetting(fmDeviceSetting).DeviceRefresh;
  end;
  AllDeviceStateCheck;
end;

procedure TfmMain.DaemonSendPacket(aNodeNo: integer; aEcuID, aNo, aCmd,
  aData: string);
var
  stData : string;
begin
  stData := aCmd + DATADELIMITER + FillZeroNumber(aNodeNo,3) + aEcuID + aNo + DATADELIMITER + aData + DATADELIMITER;
  SendDaemonDataList.Add(stData);
end;

procedure TfmMain.CommandArrayCommandsTDaemonSendExecute(Command: TCommand;
  Params: TStringList);
var
  stNodeNo : string;
  stEcuID : string;
  stNO : string;
  stCmd : string;
  stData : string;
begin
  stNodeNo := Params.Values['NODENO'];
  if Not IsDigit(stNodeNo) then Exit;
  stEcuID := Params.Values['ECUID'];
  stNO := Params.Values['NO'];
  stCmd := Params.Values['CMD'];
  stData := Params.Values['DATA'];

  DaemonSendPacket(strtoint(stNodeNo),stEcuID,stNo,stCmd,stData);
end;

function TfmMain.UsedDevice_Registration(aNodeNo,
  aEcuList: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX00' + aEcuList;

  G_bDeviceResponse[USEDEVICECHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'I' + stData);
  result := ResponseCheck(USEDEVICECHECK,G_nSetDelayTime);

end;

function TfmMain.ControllerID_Registration(aNodeNo,
  aMcuid: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'ID00' + aMcuid;

  G_bDeviceResponse[IDCHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'I' + stData);
  result := ResponseCheck(IDCHECK,G_nSetDelayTime);

end;

function TfmMain.LinkusID_Registration(aNodeNo,
  aLinkusID: string): Boolean;
var
  stData : string;
  nID : integer;
  stID : string;
begin
  Result := false;
  if aLinkusID <> 'AAAA' then
  begin
    if not isdigit(aLinkusId) then Exit;
    nID := StrToInt(aLinkusId);
    stID := Dec2Hex(nID, 4);
  end else stID := 'AAAA';

  stData := 'Id00' + stID;

  G_bDeviceResponse[LINKUSID] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'I' + stData);
  result := ResponseCheck(LINKUSID,G_nSetDelayTime);

end;

function TfmMain.LinkusTelNumber_Registration(aNodeNo,
  aLinkusTel: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'Tn0000' + SetlengthStr(aLinkusTel, 20);

  G_bDeviceResponse[LINKUSTEL] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'I' + stData);
  result := ResponseCheck(LINKUSTEL,G_nSetDelayTime);

end;

function TfmMain.RingCount_Registration(aNodeNo, aRingCount,
  aCancelRingCount: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'Rc00' + FillZeroNumber(strtoint(aRingCount), 2) + FillZeroNumber(strtoint(aCancelRingCount),2);

  G_bDeviceResponse[RINGCOUNT] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'I' + stData);
  result := ResponseCheck(RINGCOUNT,G_nSetDelayTime);

end;

function TfmMain.SystemInfo_Registration(aNodeNo, aEcuID, aWatchPowerOff,
  aOutDelay, aInDelay, aDoorType1, aDoorType2: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'SY00' +                                   // COMMAND
    aWatchPowerOff +                         // 정전감시여부
    FillZeroNumber(strtoint(aOutDelay), 3) +                     // 퇴실지연시간
    '2' +                                             // 예비
    aDoorType1 +                             // Door1
    aDoorType2 +                             //Door2
    SetlengthStr(' ', 16) +                           // 위치명
    FillZeroNumber(strtoint(aInDelay), 3) +                      // 입실지연시간
    '1';                                              // 관제 통신 방식(고정)

  G_bDeviceResponse[SYSINFOCHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'I' + stData);
  result := ResponseCheck(SYSINFOCHECK,G_nSetDelayTime);


end;

function TfmMain.JaejungDelayUse_Registration(aNodeNo, aEcuID,
  aJaeJung: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'sy00';
  if aJaejung = 'Y' then stData := stData + '1'
  else stData := stData + '0';

  G_bDeviceResponse[JAEJUNG] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'I' + stData);
  result := ResponseCheck(JAEJUNG,G_nSetDelayTime);

end;

function TfmMain.TelLineCheck_Registration(aNodeNo, aEcuID,
  aTime: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'Pt00' + FillZeroNumber(strtoint(aTime),2);

  G_bDeviceResponse[TELLINE] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
  result := ResponseCheck(TELLINE,G_nSetDelayTime);

end;

procedure TfmMain.SendDaemonTimerTimer(Sender: TObject);
var
  stData : string;
begin
  if G_bApplicationTerminate then Exit;
  if SendDaemonDataList.Count  < 1 then Exit;
  StatusBar1.Panels[3].Text := inttostr(SendDaemonDataList.Count);
  Try
    SendDaemonTimer.Enabled := False;
    stData := sendDaemonDataList.Strings[0] + LINEEND;
    sendDaemonDataList.Delete(0);

    if WinsockPort.Open then WinsockPort.PutString(stData);
{    if ComMonitoring then   //통신상태 확인 중이면
    begin
      self.FindClassForm('TfmComMonitoring').FindCommand('Message').Params.Values['RXTX'] := 'TX';
      self.FindClassForm('TfmComMonitoring').FindCommand('Message').Params.Values['Data'] := SendData;
      self.FindClassForm('TfmComMonitoring').FindCommand('Message').Execute;
    end;
}
  Finally
    SendDaemonTimer.Enabled := True;
  End;

end;

procedure TfmMain.AllDeviceStateCheck;
var
  stSendData : string;
begin
  stSendData := 'DEVICEALLSTATE_III'+ DATADELIMITER;
  if SendDaemonDataList.IndexOf(stSendData) < 0 then
     SendDaemonDataList.Add(stSendData);
end;

procedure TfmMain.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  st:String;
  I: Integer;
  stData:String;
  nIndex : integer;
  stTemp : string;
begin
  st:= '';
  DaemonConnected := True;
  for I := 1 to Count do st := st + WinsockPort.GetChar;
  ServerComBuff:= ServerComBuff + st ;

  repeat
    if G_bApplicationTerminate then Exit;
    stData:= Copy(ServerComBuff,1,Pos(LINEEND,ServerComBuff));
    Delete(ServerComBuff,1,Pos(LINEEND,ServerComBuff));
    nIndex := Pos('R',stData);
    if nIndex < 0 then      continue;
    if nIndex > 1 then Delete(stData,1,nIndex - 1);
    if Length(Trim(stData)) < 2 then continue;
    inc(L_nRecvPacketCount);
    FReceiveTCS.Enter;
    ReceiveDataList.Add(stData);
    FReceiveTCS.Leave;
    StatusBar1.Panels[4].Text := inttostr(ReceiveDataList.Count);

    Application.ProcessMessages;
  until pos(LINEEND,ServerComBuff) = 0;

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
      fmMain.FReceiveTCS.Enter;
      stTemp := fmMain.ReceiveDataList.Strings[0];
      fmMain.ReceiveDataList.Delete(0);
      //fmMain.StatusBar1.Panels[5].Text := inttostr(fmMain.ReceiveDataList.Count);
      fmMain.FReceiveTCS.Leave;
      MonitorProcess(stTemp);
    end;
    sleep(1) ;
  end;

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

procedure TfmMain.DaemonReceiveTimerTimer(Sender: TObject);
var
  stTemp : string;
begin
  if G_bApplicationTerminate then Exit;
  Try
    DaemonReceiveTimer.Enabled := False;
    FReceiveTCS.Enter;
    if ReceiveDataList.Count < 1 then Exit;
    stTemp := ReceiveDataList.Strings[0];
    fmMain.ReceiveDataList.Delete(0);
    FReceiveTCS.Leave;
    MonitoringDataProcess(stTemp)
  Finally
    if Not G_bApplicationTerminate then
    DaemonReceiveTimer.Enabled := True;
  End;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  inherited;
  DaemonReceiveTimer.Enabled := True;

end;

procedure TfmMain.MonitoringDataProcess(aData: string; aDaemonNo: integer);
begin
  DaemonReceiveDataProcess(aData,self);
end;

procedure TfmMain.CommandArrayCommandsTSendDataExecute(Command: TCommand;
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
  End;

end;

function TfmMain.ControllerIDSearch(aNodeNo: string): Boolean;
var
  stData : string;
begin
  stData := 'ID000000000';

  G_bDeviceResponse[IDCHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'Q' + stData);
  result := ResponseCheck(IDCHECK,G_nSetDelayTime);

end;

function TfmMain.DeviceTypeSearch(aNodeNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX02';

  G_bDeviceResponse[DEVICETYPECHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'Q' + stData);
  result := ResponseCheck(DEVICETYPECHECK,G_nSetDelayTime);

end;

function TfmMain.TelecopIDSearch(aNodeNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Id00' ;

  G_bDeviceResponse[LINKUSID] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'Q' + stData);
  result := ResponseCheck(LINKUSID,G_nSetDelayTime);

end;

function TfmMain.TelecopTelNumSearch(aNodeNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Tn0000' ;        //1번째 전화 번호 인덱스

  G_bDeviceResponse[LINKUSTEL] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'Q' + stData);
  result := ResponseCheck(LINKUSTEL,G_nSetDelayTime);

end;

function TfmMain.TelecopRingCountSearch(aNodeNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Rc00' ;

  G_bDeviceResponse[RINGCOUNT] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'Q' + stData);
  result := ResponseCheck(RINGCOUNT,G_nSetDelayTime);

end;

function TfmMain.TimeCheck(aNodeNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'TM00' +   // COMMAND
            '20999999999999';         // 시간데이터

  G_bDeviceResponse[TIME] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'R' + stData);
  result := ResponseCheck(TIME,G_nSetDelayTime);

end;

function TfmMain.ArmStateSearch(aNodeNo, aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'RD00';

  //G_bDeviceResponse[ALARMSTATECHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
  //result := ResponseCheck(ALARMSTATECHECK,G_nSetDelayTime);
  result := True;

end;

function TfmMain.SystemInfoSearch(aNodeNo, aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SY00';

  G_bDeviceResponse[SYSINFOCHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'Q' + stData);
  result := ResponseCheck(SYSINFOCHECK,G_nSetDelayTime);

end;

function TfmMain.DoorLockInfoSearch(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'B' + '0' +                             //MSG Code
            aDoorNo +               //문번호
            #$20 + #$20 + '00000000000000000000';          //조회는 전체를 '0'으로 마킹

  G_bDeviceResponse[DOORSYSTEMCHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'c' + stData);
  result := ResponseCheck(DOORSYSTEMCHECK,G_nSetDelayTime);

end;

function TfmMain.DoorLockStateSearch(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SM20';

  G_bDeviceResponse[LOCKSTATECHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
  result := ResponseCheck(LOCKSTATECHECK,G_nSetDelayTime);

end;

function TfmMain.CardReaderInfoSearch(aNodeNo, aEcuID,
  aCardReaderNo: string): Boolean;
var
  stData : string;
  nReaderPoint : integer;
begin
  Result := false;
  stData := 'CD' + FillZeroNumber(strtoint(aCardReaderNo), 2);
  nReaderPoint := (strtoint(aEcuID) * CardReaderMaxNum ) + strtoint(aCardReaderNo);

  G_bCardReaderResponse[nReaderPoint] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'Q' + stData);
  result := CardReaderResponseCheck(nReaderPoint,G_nSetDelayTime);

end;

function TfmMain.CardReaderTypeSearch(aNodeNo, aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Ct00';

  G_bDeviceResponse[CARDREADERTYPE] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'Q' + stData);
  result := ResponseCheck(CARDREADERTYPE,G_nSetDelayTime);

end;

function TfmMain.CardReaderVerSearch(aNodeNo, aEcuID,
  aCardReaderNo: string): Boolean;
var
  stData : string;
  nReaderPoint : integer;
begin
  Result := false;
  stData := 'CV' + FillZeroNumber(strtoint(aCardReaderNo), 2);

  nReaderPoint := (strtoint(aEcuID) * CardReaderMaxNum ) + strtoint(aCardReaderNo);

  G_bCardReaderVersionResponse[nReaderPoint] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
  result := CardReaderVersionResponseCheck(nReaderPoint,G_nSetDelayTime);

end;

function TfmMain.PortInfoSearch(aNodeNo, aEcuID, aPortNo: string): Boolean;
var
  stData : string;
  nPortPoint : integer;
begin
  Result := false;
  stData := 'LP' + FillZeroNumber(strtoint(aPortNo), 2);

  nPortPoint := (strtoint(aEcuID) * PortMaxNum ) + strtoint(aPortNo);

  G_bPortResponse[nPortPoint] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'Q' + stData);
  result := PortResponseCheck(nPortPoint,G_nSetDelayTime);

end;

function TfmMain.PortStateSearch(aNodeNo, aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SM10';

  G_bDeviceResponse[PORTSTATE] := False;

  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
  result := ResponseCheck(PORTSTATE,G_nSetDelayTime);

end;

function TfmMain.RegistDoorLockInfo(aNodeNo, aEcuID: string; aDoorNo,
  aCardMode, aDoorMode: Integer; aDoorOpenTime: string; aOpenMoniTime,
  aUseSchedule, aSendDoorState, aUseOpenalarm, aLockType, aControledFire,
  aDsOpenState, aRemoteCancelDoorOpen: integer): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'G' +                       //MSG Code  'A' : 운영모드 부분까지 적용, 'G' 운영모드 부분 제외
    '0' +                              //Msg Count(고정)
    IntToStr(aDoorNo) +                //문번호
    #$20 + #$20 +                      // Record count
    IntToStr(aCardMode) +              //카드운영모드
    IntToStr(aDoorMode) +              //출입문 운영모드
    aDoorOpenTime +          //Door제어 시간
    IntToStr(aOpenMoniTime) +          //장시간 열림 경보
    IntToStr(aUseSchedule) +           //스케줄 적용유무
    IntToStr(aSendDoorState) +         //출입문상태전송
    '0' +                              //통신이상시 기기운영(사용안함:고정)
    '0' +                              //AntiPassBack(사용안함:고정)
    IntToStr(aUseOpenalarm) +          //장시간 열림 부저출력
    '0' +                              //통신 이상시 부저 출력 (사용안함:고정)
    char(aLockType) +              //전기정 타입
    IntToStr(aControledFire) +         //화재 발생시 문제어
    '0' +                              //DS LS 검사(사용안함:고정)
    InttoStr(aDsOpenState) +           //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
    InttoStr(aRemoteCancelDoorOpen) +  //원격해제시 (DoorOpen 0x30,DoorClose 0x31)
    '00000';                           //예비

  G_bDeviceResponse[DOORSYSTEMCHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'c' + stData);
  result := ResponseCheck(DOORSYSTEMCHECK,G_nSetDelayTime);

end;

function TfmMain.RegistCardReaderInfo(aNodeNo, aEcuID: string;
  aReaderNo,aReaderuse, aReaderDoor, aReaderDoorLocate,
  aReaderBuildingLocate: integer): Boolean;
var
  stData : string;
  stLocate : string;
  nReaderPoint : integer;
begin
  Result := false;
  stData := 'CD' +                                      //COMMAND
    FillZeroNumber(aReaderNo, 2) +                        //리더 번호
    IntToStr(aReaderUse) +                                //리더 사용 유무
    IntToStr(aReaderDoorLocate) +                         //리더 위치
    IntToStr(aReaderDoor) +                               //Door No
    '00' +                                                //존번호
    SetlengthStr(stLocate, 16) +                              //위치명
    IntToStr(aReaderBuildingLocate);                      //건물설치위치

  nReaderPoint := (strtoint(aEcuID) * CardReaderMaxNum ) + aReaderNo;

  G_bCardReaderResponse[nReaderPoint] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'I' + stData);
  result := CardReaderResponseCheck(nReaderPoint,G_nSetDelayTime);
end;

function TfmMain.RegistCardType(aNodeNo, aEcuID: string;
  aCardType: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Ct00' + inttostr(aCardType);                               //카드리더 타입 등록

  G_bDeviceResponse[CARDREADERTYPE] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'I' + stData);
  result := ResponseCheck(CARDREADERTYPE,G_nSetDelayTime);
end;

function TfmMain.RegistPort(aNodeNo, aEcuID: string; aPortNo, aWhatchType,
  aZoneDelay, aRecorver, aWhatchTime: integer; aLocate: string): Boolean;
var
  stData : string;
  nPortPoint : integer;
  stStatusCode : string;
begin
  Result := false;

  stStatusCode := 'S' + inttostr(aPortNo);
  if aWhatchType = 1 then stStatuscode := 'FI'
  else if aWhatchType = 2 then stStatuscode := 'G1'
  else if aWhatchType = 3 then stStatuscode := 'E1'
  else if aWhatchType = 4 then stStatuscode := 'Q1'
  else if aWhatchType = 5 then stStatuscode := 'CL';

  nPortPoint := (strtoint(aEcuID) * PortMaxNum ) + aPortNo;

  stData := 'LP' +                              //COMMAND
    FillZeroNumber(aPortNo, 2) +                               //포트번호
    stStatuscode +                                     //상태코드('SS' 고정)
    IntToStr(aWhatchType) +                     //감시형태
    '0' +                                      //알람발생 방식(고정)
    inttostr(aRecorver) +                                //복구신호전송(고정)
    IntToStr(aZoneDelay) +                      //지연시간 사용유무
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
    SetLengthStr(aLocate, 16) +                   //위치명
    FillZeroNumber(aWhatchTime, 2) +           //감지시간
    '00';                                      //사용안함

  G_bPortResponse[nPortPoint] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'I' + stData);
  result := PortResponseCheck(nPortPoint,G_nSetDelayTime);
end;

function TfmMain.RegistDeviceType(aNodeNo, aEcuType: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX02' + aEcuType;

  G_bDeviceResponse[DEVICETYPECHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'I' + stData);
  result := ResponseCheck(DEVICETYPECHECK,G_nSetDelayTime);

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

procedure TfmMain.DeviceSetupData(Sender: TObject; NodeNo: integer; aEcuID,
  aPacketData: string);
var
  stCntID : string;
  cCommand : char;
  stSetupCmd : string;
begin
  stCntID := Copy(aPacketData, 8, 9);
  cCommand := aPacketData[17];
  stSetupCmd := Copy(aPacketData, 20, 2);

  case cCommand of
    'A','o':{알람}          begin  DeviceRcvAlarmData(NodeNo,aEcuID,aPacketData) end;
    'i':{Initial}       begin  RegDataProcess(NodeNo,aEcuID,aPacketData)    end;
    'R':{Remote}        begin  RemoteDataProcess(NodeNo,aEcuID,aPacketData) end;
    'r':{Remote Answer} begin  RemoteDataProcess(NodeNo,aEcuID,aPacketData) end;
    'c':{출입통제}      begin  AccessDataProcess(NodeNo,aEcuID,aPacketData) end;
    'f':{펌웨어}        begin  FirmwareProcess(NodeNo,aEcuID,aPacketData)   end;
    'F':{펌웨어}        begin  FirmwareProcess2(NodeNo,aEcuID,aPacketData)  end;
    'm':{관제데이터 모니터링 } begin PTMonitoringProcess(NodeNo,aEcuID,aPacketData) end;
    'e':{ERROR}         begin ErrorDataProcess(NodeNo,aEcuID,aPacketData) end;
    else {error 발생: [E003]정의 되지 않은 커맨드}  begin ErrorDataProcess(NodeNo,aEcuID,aPacketData) end;
  end;

end;

procedure TfmMain.DeviceRcvAlarmData(NodeNo: integer; aEcuID,
  aPacketData: string);
begin
//알람 데이터
end;

procedure TfmMain.AccessDataProcess(NodeNo: integer; aEcuID,
  aPacketData: string);
var
  chCMD : char;
  stCode: String;
  stGubun : string;
  stData : string;
  stTemp : string;
begin
  //037 K1123456700r1TM00050107180637EF
  chCMD:= aPacketData[19];
  stGubun := Copy(aPacketData,21,2);
  stData := Copy(aPacketData,19,Length(aPacketData)-21);
  case chCMD of
    'a','b','g': RcvDoorinfo2(NodeNo,aECUID,stData);        //출입문 등록 응답
    //'c': RcvAccControl(NodeNo,aECUID,stData);      //기기 제어 응답
  end;

end;

procedure TfmMain.ErrorDataProcess(NodeNo: integer; aEcuID,
  aPacketData: string);
begin
//에러 데이터
end;

procedure TfmMain.FirmwareProcess(NodeNo: integer; aEcuID,
  aPacketData: string);
begin

end;

procedure TfmMain.FirmwareProcess2(NodeNo: integer; aEcuID,
  aPacketData: string);
begin

end;

procedure TfmMain.PTMonitoringProcess(NodeNo: integer; aEcuID,
  aPacketData: string);
begin
//방범 관제 모니터링
end;

procedure TfmMain.RegDataProcess(NodeNo: integer; aEcuID,
  aPacketData: string);
var
  stRegCode : string;
  stGubun : string;
  stData : string;
begin
//등록 데이터
  stRegCode:= Copy(aPacketData,19,2);
  stGubun:= Copy(aPacketData,21,2);
  stData := Copy(aPacketData,19,Length(aPacketData)-20);


  if stRegCode = 'ID' then
  begin
    RcvDeviceID(NodeNo,aEcuID,stData);
  end else if stRegCode = 'CD' then
  begin
    RcvCardReader(NodeNo,aEcuID,stData);
  end else if stRegCode = 'SY' then
  begin
    RcvSysinfo(NodeNo,aEcuID,stData);
  end else if stRegCode = 'sy' then
  begin
    if stGubun = '00' then
      RcvJaejungDelayUse(NodeNo,aEcuID,stData[5]);
  end else if stRegCode = 'RY' then
  begin
    RcvRelay(NodeNo,aEcuID,stData);
  end else if stRegCode = 'LP' then
  begin
    RcvPort(NodeNo,aEcuID,stData);
  end else if stRegCode = 'AD' then
  begin
    RcvUsedAlarmdisplay(NodeNo,aEcuID,stData);
  end else if stRegCode = 'EX' then
  begin
    if stGubun = '00' then
      RcvUsedDevice(NodeNo,aEcuID,stData)
    else if stGubun = '02' then
      RcvDeviceType(NodeNo,aEcuID,stData);
  end else if stRegCode = 'TN' then
  begin
    RcvLinkusTelNo(NodeNo,aEcuID,stData);
  end else if stRegCode = 'CT' then
  begin
    //RcvCallTime(NodeNo,aEcuID,stData);
  end else if stRegCode = 'BT' then
  begin
    //RcvbroadcastTime(NodeNo,aEcuID,stData);
  end else if stRegCode = 'DI' then
  begin
    //RcvDialInfo(NodeNo,aEcuID,stData);
  end else if stRegCode = 'NW' then
  begin
    RcvWiznetInfo(NodeNo,aEcuID,stData);
  end else if stRegCode = 'DT' then
  begin
    RcvControlDialInfo(NodeNo,aEcuID,stData);
  end else if stRegCode = 'VC' then
  begin
    //RcvVoiceTime(aData);
  end else if stRegCode = 'Id' then
  begin
    RcvLinkusId(NodeNo,aEcuID,stData);
  end else if stRegCode = 'Tn' then
  begin
    RcvLinkusTelNo(NodeNo,aEcuID,stData);
  end else if stRegCode = 'Pt' then
  begin
    RcvLinkusPt(NodeNo,aEcuID,stData);
  end else if stRegCode = 'Ct' then
  begin
    RcvCardType(NodeNo,aEcuID,stData);
  end else if stRegCode = 'Rc' then
  begin
    RcvRingCount(NodeNo,aEcuID,stData);
  end else if stRegCode = 'SM' then
  begin
    if stGubun = '00' then
    begin
      DeviceState1Show(NodeNo,aEcuID,stData);
    end else if stGubun = '10' then
    begin
      ZoneStateShow(NodeNo,aEcuID,stData);
    end else if stGubun = '20' then
    begin
      DeviceState2Show(NodeNo,aEcuID,stData);
    end else if stGubun = '24' then
    begin
      DeviceExceptShow(NodeNo,aEcuID,stData);
    end;
  end else if stRegCode = 'DL' then
  begin
    if stGubun = '00' then
    begin
    end else if stGubun = '01' then
    begin
      RcvArmDsCheck(NodeNo,aEcuID,stData);
    end;
  end else if stRegCode = 'WL' then
  begin
    RcvCDMASettingData(NodeNo,aEcuID,stData);
  end else if stRegCode = 'DV' then
  begin
    RcvDVRSettingData(NodeNo,aEcuID,stData);
  end;
end;

procedure TfmMain.RemoteDataProcess(NodeNo: integer; aEcuID,
  aPacketData: string);
var
  stCode: String;
  stGubun : string;
  stData : string;
  stTemp : string;
begin
  //037 K1123456700r1TM00050107180637EF
  stCode:= Copy(aPacketData,19,2);
  stGubun := Copy(aPacketData,21,2);
  stData := Copy(aPacketData,19,Length(aPacketData)-20);
  if stCode = 'Pt' then
  begin
    RcvLinkusPt(NodeNo,aEcuID,stData);
  end else if stCode = 'TM' then
  begin
    //시간설정
    stTemp :=  Copy(aPacketData,23,4)+'-'+  //년
           Copy(aPacketData,27,2)+'-'+  //월
           Copy(aPacketData,29,2)+' '+  //일
           Copy(aPacketData,31,2)+':'+  //시
           Copy(aPacketData,33,2)+':'+  //분
           Copy(aPacketData,35,2);      //초
    RcvTime(NodeNo,aEcuID,stTemp);
  end else if stCode = 'VR' then
  begin
    //기기 버젼확인
    if stGubun = '00' then //기기버젼이면
    begin
      stTemp := Copy(aPacketData,23,Length(aPacketData)-24);
      RcvDeviceVersion(NodeNo,aEcuID,stTemp);
    end else if stGubun = '01' then //기기코드이면
    begin
      stTemp := Copy(aPacketData,23,Length(aPacketData)-24);
      RcvDeviceCode(NodeNo,aEcuID,stTemp);
    end else if stGubun = '90' then
    begin
      //GetSystemFunction(copy(aData,15,2),Copy(aData,23,Length(aData)-25));
      Exit;
    end;
  end else if stCode = 'CV' then
  begin
    RcvCardReaderVersion(NodeNo,aEcuID,stData);
  end else if stCode = 'RS' then //Reset
  begin
    MessageDlg('ECUID:' + copy(aPacketData,15,2) + ' 리셋 되었습니다.', mtInformation, [mbOK], 0);
  end else if stCode = 'MC' then   //Change mode
  begin
    RcvAlarmState(NodeNo,aEcuID,stData);
  end else if stCode = 'cs' then //통신상태체크
  begin
  end else if stCode = 'CD' then //카드데이터
  begin
    if stGubun = '11' then
    begin
      //CardListSearch(aDeviceID,aGubun,aData);
    end
    else if stGubun = '20' then
    begin
    end
    else if stGubun = '21' then
    begin
    end;

  end else if stCode = 'SM' then
  begin
    if stGubun = '00' then
    begin
      DeviceState1Show(NodeNo,aEcuID,stData);
    end else if stGubun = '10' then
    begin
      ZoneStateShow(NodeNo,aEcuID,stData);
    end else if stGubun = '20' then
    begin
      DeviceState2Show(NodeNo,aEcuID,stData)
    end else if stGubun = '24' then
    begin
      DeviceExceptShow(NodeNo,aEcuID,stData);
    end;
  end;
end;

procedure TfmMain.DeviceExceptShow(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).DeviceExceptShow(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.DeviceState1Show(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).DeviceState1Show(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.DeviceState2Show(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).DeviceState2Show(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvArmDsCheck(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvArmDsCheck(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvCardReader(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvCardReader(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvCardType(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvCardType(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvCDMASettingData(NodeNo: integer; aEcuID,
  aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvCDMASettingData(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvControlDialInfo(NodeNo: integer; aEcuID,
  aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvControlDialInfo(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvDeviceID(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvDeviceID(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvDeviceType(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvDeviceType(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvDVRSettingData(NodeNo: integer; aEcuID,
  aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvDVRSettingData(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvJaejungDelayUse(NodeNo: integer; aEcuID,
  aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvJaejungDelayUse(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvLinkusId(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvLinkusId(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvLinkusPt(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvLinkusPt(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvLinkusTelNo(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvLinkusTelNo(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvPort(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvPort(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvRelay(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvRelay(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvRingCount(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvRingCount(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvSysinfo(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvSysinfo(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvUsedAlarmdisplay(NodeNo: integer; aEcuID,
  aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvUsedAlarmdisplay(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvUsedDevice(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvUsedDevice(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvWiznetInfo(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvWiznetInfo(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.ZoneStateShow(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).ZoneStateShow(NodeNo,aEcuID,aData);
  end;

end;

function TfmMain.DeviceUseStateSearch(aNodeNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX00';

  G_bDeviceResponse[USEDEVICECHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),'00','0','DIRECT', 'Q' + stData);
  result := ResponseCheck(USEDEVICECHECK,G_nSetDelayTime);

end;

procedure TfmMain.RcvDeviceVersion(NodeNo: integer; aEcuID,
  aVersion: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvDeviceVersion(NodeNo,aEcuID,aVersion);
  end;

end;

procedure TfmMain.RcvTime(NodeNo: integer; aEcuID, aTime: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvTime(NodeNo,aEcuID,aTime);
  end;

end;

procedure TfmMain.RcvCardReaderVersion(NodeNo: integer; aEcuID,
  aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvCardReaderVersion(NodeNo,aEcuID,aData);
  end;

end;

procedure TfmMain.RcvAlarmState(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvAlarmState(NodeNo,aEcuID,aData);
  end;

end;

function TfmMain.ChangeArmMode(aNodeNo, aEcuID, aMode: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'MC' +         //COMMAND
            '00' +                //ZONE 고정
            aMode;                //A:경계, D:해제, P:순회

  G_bDeviceResponse[ALARMCONTROL] := False;

  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
  result := ResponseCheck(ALARMCONTROL,G_nSetDelayTime);

end;

procedure TfmMain.RcvDoorinfo2(NodeNo: integer; aEcuID, aData: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvDoorinfo2(NodeNo,aEcuID,aData);
  end;

end;

function TfmMain.ZoneabnormalCheck(aNodeNo, aEcuID: string): Boolean;
var
  stData : string;
begin
  stData := 'SM24';

  G_bDeviceResponse[ZONESENSECHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
  result := ResponseCheck(ZONESENSECHECK,G_nSetDelayTime);
end;

function TfmMain.CardReaderVersionCheck(aNodeNo, aEcuID,
  aCardReaderNo: string): Boolean;
var
  stData : string;
  nReaderPoint : integer;
begin
  Result := false;
  stData := 'CV' + FillZeroNumber(strtoint(aCardReaderNo), 2);
  nReaderPoint := (strtoint(aEcuID) * CardReaderMaxNum ) + strtoint(aCardReaderNo);

  G_bCardReaderResponse[nReaderPoint] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
  result := CardReaderVersionResponseCheck(nReaderPoint,G_nSetDelayTime);

end;

procedure TfmMain.DeviceTypeChange(Sender: TObject; NodeNo: integer;
  aEcuID, aDeviceType: string);
var
  fmDeviceSetting :TForm;
begin
  if G_bApplicationTerminate then Exit;

  if DEVICESETView then
  begin
    fmDeviceSetting := MDIForm('TfmDeviceSetting');
    if TfmDeviceSetting <> nil then
    begin
      TfmDeviceSetting(fmDeviceSetting).DeviceTypeChange(NodeNo,aEcuID,aDeviceType);
    end;
  end;

end;

procedure TfmMain.UnLoadDevice;
begin
  DeviceStateList.Clear;
end;

procedure TfmMain.CommandArrayCommandsTRefreshExecute(Command: TCommand;
  Params: TStringList);
begin
  Action_DeviceDisConnectExecute(self);
  Action_DeviceRefreshExecute(self);
  Action_DeviceConnectExecute(self);   
end;

procedure TfmMain.DeviceReboot(aNodeNo, aEcuID: string);
var
  stData : string;
begin
  stData := 'RS00Reset';
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
end;

function TfmMain.DeviceVersion_Check(aNodeNo, aEcuID: string): Boolean;
var
  stData : string;
begin
  stData := 'VR00';
  G_bDeviceResponse[DEVICEVERSIONCHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
  result := ResponseCheck(DEVICEVERSIONCHECK,G_nSetDelayTime);
end;

function TfmMain.DeviceCode_Check(aNodeNo, aEcuID: string): Boolean;
var
  stData : string;
begin
  stData := 'VR01';
  G_bDeviceResponse[DEVICECODECHECK] := False;
  DaemonSendPacket(strtoint(aNodeNo),aEcuID,'0','DIRECT', 'R' + stData);
  result := ResponseCheck(DEVICECODECHECK,G_nSetDelayTime);

end;

procedure TfmMain.RcvDeviceCode(NodeNo: integer; aEcuID, aCode: string);
var
  fmDeviceSetting : TForm;
begin
  if Not DEVICESETView then Exit;
  fmDeviceSetting := MDIForm('TfmDeviceSetting');
  if TfmDeviceSetting <> nil then
  begin
    TfmDeviceSetting(fmDeviceSetting).RcvDeviceCode(NodeNo,aEcuID,aCode);
  end;

end;

procedure TfmMain.DaemonLive(Sender: TObject);
begin

end;

end.
