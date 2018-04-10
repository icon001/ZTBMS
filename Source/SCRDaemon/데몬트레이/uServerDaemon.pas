unit uServerDaemon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, antTaskbarIcon, StdCtrls, ExtCtrls, ComCtrls,
  ToolWin, ActnList, jpeg, ScktComp, DateUtils,DB,iniFiles,
  DXServerCore, DXString, DXUnicastDataQueue, uSubForm,
  CommandArray, ADODB, LMDCustomComponent, LMDFileCtrl,AdPort,
  uSerialModule, Buttons, LMDContainerComponent, LMDBaseDialog, LMDDirDlg,
  FolderDialog, Gauges,ActiveX;

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
    Timer1: TTimer;
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
    Timer2: TTimer;
    ServerSocket1: TServerSocket;
    Action_DaemonStop: TAction;
    DXUnicastDataQueue1: TDXUnicastDataQueue;
    DataBaseBackupTimer: TTimer;
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
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    PollingTimer: TTimer;
    ATLOADTimer: TTimer;
    ADOBackupQuery: TADOQuery;
    TblImport: TADOQuery;
    QryInsert: TADOQuery;
    N33: TMenuItem;
    DB1: TMenuItem;
    FolderDialog1: TFolderDialog;
    pan_gauge: TPanel;
    Ga_Tot: TGauge;
    Label1: TLabel;
    ga_Table: TGauge;
    lbl_Table: TLabel;
    ATServer: TDXServerCore;
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
    procedure Action_CurrentStateExecute(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ServerSocket1Accept(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1GetThread(Sender: TObject;
      ClientSocket: TServerClientWinSocket;
      var SocketThread: TServerClientThread);
    procedure ATSERVERNewConnect(ClientThread: TDXClientThread);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure N18Click(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure Action_AttendConfigExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);

    procedure Action_DaemonStartExecute(Sender: TObject);
    procedure Action_DaemonStopExecute(Sender: TObject);
    procedure Action_DaemonRestartExecute(Sender: TObject);
    procedure PollingTimerTimer(Sender: TObject);
    procedure ATLOADTimerTimer(Sender: TObject);
    procedure DataBaseBackupTimerTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DB1Click(Sender: TObject);
  private
    { Private declarations }
    bDaemonRestart : Boolean; //데몬 재시작중
    bClose : Boolean;
    bStop : Boolean;
    bDeviceInfoSend : Boolean;  //Device Info 송신 중...
    FLogined: Boolean;
    //AttendChangeCount : integer; //근무 교대 건수
    ATCardList:TStringList;
    ATPassList:TStringList;
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

    DaemonServerIP : string;               //데몬서버 IP
    DaemonServerPort : string;             //데몬서버 Port
    AttendServerPort : string;             //근태서버 Port
    DaemonAccecptClientCount : integer;    //데몬서버에 접속할 수 있는 클라이언트 갯수
    DaemonLogFullData : string;  //ACK 데이터 까지 로그 남길것인지
    DaemonLogDeleteDay : integer; //로그 데이터 몇일전 데이터를 날릴것인지
    DataBaseAutoBackup : string;  //자동백업 사용유무
    CardDownloadAutoBackup : string; //카드데이터 자동 다운로드 사용유무
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

    FoodConfigCodeList : TStringList; //식수 코드 리스트
    FoodConfigStartList : TStringList; // 식수코드 시작시간
    FoodConfigEndList : TStringList;  //식수코드 종료 시간

    bCURRENTSTATE : Boolean;   //실시간 송수신 현황조회 여부
    bAutoCardDownLoad: Boolean; //카드 다운로드 유무
    
    fdmsUses : String;   //유니온 지문인식 사용 유무
    fdmsPath : string;   //유니온 지문인식 DB Path
    fdmsPW   : string;   //유니온 지문인식 접속 Pw

    procedure DaemonConfigWriting;
    //procedure RealDataShow(aIp,aECUID,aGubun,aCmd,aData:string);    //실시간 송수신 내역 확인
    procedure RealDataShow(aRxTx,aECUID,aMsgNo,aCMD,aLength,aData:string);
    procedure SetLogined(const Value: Boolean);
    Procedure MDIChildShow(FormName:String);
    Function DeleteTB_LOWDATA(aDate:string):Boolean;
    Function DataBaseBackup(bFull:Boolean):Boolean;
    Function FileDataBaseBackup(bFull:Boolean):Boolean;
    Function TableFileBackup(aTableName:string):Boolean;
    Function FileDBRestor(aImportFileName:string):Boolean;
    Function MSSQLDBBackup(bFull:Boolean):Boolean;
    Function MDBBackup:Boolean;
    Function MSSQLLOMOSTOFILE:Boolean;
    Function MSSQLEVENTTOFILE(bFull:Boolean):Boolean;


    Function DeleteTable :Boolean;
    Function UpdateTB_CURRENTDAEMON(aCode,aValue:String):Boolean;

    Function UpdateTB_ACCESSDEVICE_Connect(aNodeNo,aECUID,aConnected:string):Boolean;

    //**************************************
    // 환경설정
    //**************************************
    Function LoadAttendConfig : Boolean;
    Function DaemonConfigSet : Boolean;
    Function DaemonLogConfigSet : Boolean;
    Function DataBaseConfigSet : Boolean;
    Function MCUCommonConfigSet : Boolean;
    procedure InitConfigSet;
    procedure RelayConfigSet;
    procedure SetVisibleMenue;
    Function  UpdateTB_PROGRAMIDVisible(aCode,aValue:string):Boolean;
    procedure ATCardLoading(bFull:Boolean);
    procedure ATPassLoading(bFull:Boolean);
    Function UpdateTB_ATCARDLOAD(aTarget,aData:string):Boolean;
    Function UpdateTB_ATPASSLOAD(aTarget,aData:string):Boolean;


    //**************************************
    //기기정보 메모리 로드
    //**************************************
    Function LoadNode :Boolean;  //노드를 로드 한다.
    Function UnLoadNode :Boolean;  //노드를 언로드 한다.
    Function LoadECU : Boolean; //ECU를 로드한다.
    Function UnLoadECU : Boolean; //ECU를 언로드한다.



    //***************************************
    //MCU와 통신처리 하기 위한 송신함수
    //***************************************
    Procedure CommNodeSend(Sender: TObject;  SendData: string;NodeNO : integer);  //MCU에 Send 되는 모든 데이터를 실시간으로 조회 할 수 있도록 처리
    Procedure NodeConnected(Sender:TObject;  aConnected:Boolean;NodeNo:integer);

    //***************************************
    //MCU와 통신처리 하기 위한 수신 함수
    //***************************************
    Procedure CommNodeReceve(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //MCU에서 Recv 되는 모든 데이터를 접속되어 있는 클라이언트에 전송

    //****************************************
    //MCU에서 수신한 데이터 파싱 처리 함수
    //****************************************
    Procedure DeviceRcvCardReadData(Sender: TObject;  ReceiveData: string;NodeNO : integer); // 카드 리딩 데이타
    Procedure DeviceRcvButtonReadData(Sender: TObject;  ReceiveData: string;NodeNO : integer); // 카드 리딩 데이타
    procedure DeviceConnected(Sender: TObject;  Value:Boolean; NodeNo : integer;aECUID:string);

    Function CheckTB_CardNo(aCardNo:string):Boolean;
    Function CheckTB_PASS(aPassNo:string):Boolean;

    //*****************************************
    //수신한 데이터  DB에 데이터 처리 함수
    //*****************************************
    //근태처리 함수
    Function GetATInCode(aAttendCode,aTime:string;nWeekCode:integer):string; //출근타입에 대한 출근코드 가져오기
    Function GetATOutCode(aAttendCode,aTime:string;nWeekCode:integer;bYesterDay:Boolean):string; //출근타입에 대한 출근코드 가져오기
    Function GetAttendCode(aTime,aCompanyCode,aEMCode:string;nWeekCode:integer;bPass:Boolean):string; //해당일자의 출근타입 가져오자
    Function GetOutAttendCode(aDate,aCompanyCode,aEMCode:string):string; //해당근태일자의 출근 근태 타입을 가져오자.
    Function GetEMPLOYEEATCode(aCompanyCode,aEMCode:string):string;
    Function GetChangeATCode(aTime:string;nWeekCode:integer):string;
    Function GetUpdateAttendType(aTime,aCompanyCode,aEMCode:string;dtYesterDay:TDatetime):string;
    Function GetEmployeeInfo(aCardNo:string;bPassNo:Boolean; var aCompanyCode,aEMCode:string ):Boolean;

    Function InsertATTENDINCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;bPass:Boolean):Boolean;
    Function InsertATTENDOutCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;
    Function InsertATTENDLEAVECode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;
    Function InsertATTENDBACKCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;

    Function ProcessAttendData1(aTime:String;aCardNo:String;bPassNo:Boolean = False):Boolean; // 업데이트 방식
    Function ProcessAttendData2(aTime:String;aCardNo:String;aAttendCode:Char;bPassNo:Boolean = False):Boolean; // 리더기 번호 또는 버튼 방식 처리




    //*****************************************
    //APPLICATION 과 통신하기 위한 함수
    //*****************************************
    procedure RcvFromClient(aClientIP,ast:string);   //클라이언트에서 수신된 데이터 처리
    procedure DeviceSTATECHECK(aDeviceID:string);
    
    Function DevicePacketSend(aDeviceID,aCmd,aSendData:string):Boolean;

    Function CheckHolidy(aYear,aMonth,aDay:string):Boolean;


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

    procedure CenterPanel;

  public
    { Public declarations }
     SendTime : Cardinal;    //마지막 송신시간
     SyncTime : TDateTime;   //Time Sync 시간
     DaemonLogDeleteTime : TDateTime; //데몬 로그 삭제 시간
     DBBackupTime : TDateTime;  //데이터 베이스 백업 동작 시간
     bDataBaseBackup : Boolean; //DataBase Backup


     Function GetDevice(aDeviceNO:String):TSerialECU;    //Device 번호로 Device 객체를 찾는 Function
     Function SendClientData(stData : string):Boolean;
     Property Logined : Boolean read FLogined write  SetLogined; //프로퍼티를 생성함으로 Logined라는 변수가 바뀌면 SetLogined 라는 함수가 실행됨
  end;

var
  fmMain: TfmMain;
  L_bPollingState:Boolean;

implementation
uses
  uLogin,
  uPwChange,
  uDataBaseConfig,
  uDataModule1,
  uLomosUtil,
  uCurrentState, uDeviceCode, uAttendConfig, 
  udmAdoQuery, uNetConfig,
  uCommonSql,
  uPostGreSql,
  uMSsql,
  uMDBSql;
  
{$R *.dfm}

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
  TLogin.GetObject.ShowLoginDlg;
  Logined := TLogin.GetObject.Logined;

  if Not FLogined then Exit;

  Visible := True;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  stKey : string;
  stSaupId : string;
  bResult : Boolean;
  stDate : string;
  LogoFile : string;

begin
  NETTYPE :='RS232';

  Self.ModuleID := 'Main';
  ExeFolder  := ExtractFileDir(Application.ExeName);
  bApplicationTerminate := False;
  bAutoCardDownLoad := False;

{    //여기서 인증 키값을 확인하자.
  stKey := GetAuthKey('1');
  if stKey = '' then
  begin
    showMessage('프로그램 설치후 프로그램 인증을 받으셔야 사용 가능 합니다.');
    ExecFileAndWait(ExeFolder + '\KeyZen.exe 1',true,true);
    stKey := GetAuthKey('1');
  end;
  if stKey = '' then
  begin
    Application.Terminate;
    bApplicationTerminate := True;
    Exit;
  end;

  stSaupId := GetSaupId('');
  bResult := False;

  if stSaupId <> '' then bResult := CompareKey(stSaupId,stKey);
  if Not bResult then
  begin
    showmessage('인증키값이 틀립니다.');
    Application.Terminate;
    bApplicationTerminate := True;
    Exit;
  end;

  if stSaupId = '0000000000' then
  begin
    stDate := GetInstallDate('1');
    stDate := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
    if Not IsDate(stDate) then
    begin
      showmessage('인증키의 유효기간이 만료되었습니다.');
      Application.Terminate;
      bApplicationTerminate := True;
      Exit;
    end;
    if stDate < formatDateTime('yyyy-mm-dd',now) then
    begin
      showmessage('인증키의 유효기간이 만료되었습니다.');
      Application.Terminate;
      bApplicationTerminate := True;
      Exit;
    end;
  end;    }

  LogSave(ExeFolder + '\..\log\lomosHis.log','Daemon Program Start ');

  tbi.Visible := True;
  tbi.Hint := '송수신데몬서버 정지';
  StatusBar1.Panels[0].Text := '송수신데몬서버 정지';

  ComNodeList := TStringList.Create;
  ComNodeList.Clear;
  DeviceList := TStringList.Create;
  DeviceList.Clear;
  ConnectDeviceList := TStringList.Create;
  ConnectDeviceList.Clear;

  ATCardList := TStringList.Create;
  ATCardList.Clear;
  ATPassList := TStringList.Create;
  ATPassList.Clear;
  
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

  
  SyncTime:= Trunc(Tomorrow) + EncodeTime(0,0,1,0);
  DaemonLogDeleteTime := Now;  //Trunc(Tomorrow) + EncodeTime(0,0,1,0);
  L_nCardSendCount := 0;  //송신건수
  L_nCardAckCount  := 0;  //CardAck Count
  bDaemonRestart := False;

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

  LogoFile := ExeFolder + '\..\image\DaemonLogo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);
  DaemonConfigSet;

  Action_DaemonStartExecute(Self);

  Timer1.Enabled := True;
  ATCardLoading(True);
  ATPassLoading(True);
  ATLOADTimer.Enabled := True;

end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if bClose = False then
  Begin
    Visible := False;
    CanClose := False;
    ShowWindow( Application.Handle, SW_HIDE );
    Exit;
  End;

end;

procedure TfmMain.miShowClick(Sender: TObject);
begin
  TLogin.GetObject.ShowLoginDlg;
  Logined := TLogin.GetObject.Logined;

  if Not FLogined then Exit;

  Visible := True;
end;

procedure TfmMain.bt_HideClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if bApplicationTerminate then Exit;
  //bt_Hide.Click;





  //Self.Hide;
end;

//데몬 폼 HIDE
procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  if bClose then Exit;
  Visible:=False;
  Timer1.Enabled:=False;
end;

procedure TfmMain.mn_FormHideClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Action_ExitExecute(Sender: TObject);
begin
  TLogin.GetObject.ShowLoginDlg;
  Logined := TLogin.GetObject.Logined;

  if Not FLogined then Exit;
  bClose := True;
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
begin
  Action_DaemonStart.Enabled := False;
  bStop := False;
  StatusBar1.Panels[0].Text := '송수신데몬서버 기동중...';
  tbi.Hint := '송수신데몬서버 기동중...';
  InitConfigSet;
  LoadAttendConfig; //근태환경설정로드

  DaemonLogConfigSet;   //데몬로그 환경설정
  RelayConfigSet;     //연동관련 환경설정
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


  if LoadNode then      //노드 정보 로드
  begin
    LoadECU;       //기기 정보 로드
    SerialModule.ApdSLController1.Monitoring := True;
    SerialModule.WinsockPort.Open := True;
  end;

//  ConnectTimer.Enabled:= True;
//  SendTimer.Enabled:= True;

  tbi.Hint := '송수신데몬서버 정상';
  StatusBar1.Panels[0].Text := '송수신데몬서버 정상';

  MCUCommonConfigSet;


  ATSERVER.ServerPort := strtoint(AttendServerPort);
  ATSERVER.Start;
  L_bPollingState := True;
  PollingTimer.Enabled := True;

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
  if bClose then Exit;
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

function TfmMain.SendClientData(stData: string): Boolean;
//var
//  nConnection : integer;
begin
  DXUnicastDataQueue1.AddToQueue(stData + LINEEND);
{  for nConnection:=0 to ServerSocket1.Socket.ActiveConnections - 1 do
  begin
    ServerSocket1.Socket.Connections[nConnection].SendText(stData);
    Application.ProcessMessages;
  end;   }

end;


procedure TfmMain.Action_DaemonStopExecute(Sender: TObject);
var
  i : integer;
begin
  ATSERVER.Stop;

  StatusBar1.Panels[0].Text := '송수신데몬서버 중지 중...';
  tbi.Hint := '송수신데몬서버 중지 중...';
  bStop := True;

  UnLoadECU;
  UnLoadNode;

  DeviceList.Clear;
  ComNodeList.Clear;
  FoodConfigCodeList.Clear;
  FoodConfigStartList.Clear;
  FoodConfigEndList.Clear;

  Action_DaemonStart.Enabled := True;
  StatusBar1.Panels[0].Text := '송수신데몬서버 중지';
  tbi.Hint := '송수신데몬서버 중지';
  
  L_bPollingState := False;
  PollingTimer.Enabled := False;
end;


procedure TfmMain.FormResize(Sender: TObject);
begin
  if bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - statusBar1.Panels[1].Width - statusbar1.Panels[3].Width - statusbar1.Panels[4].Width;
  CenterPanel;
end;

function TfmMain.GetDevice(aDeviceNO: String): TSerialECU;
var
  DeviceIndex: Integer;
begin
  DeviceIndex:= DeviceList.Indexof(aDeviceNO);
  if DeviceIndex > -1 then Result:= TSerialECU(DeviceList.Objects[DeviceIndex])
  else Result:= nil;

end;

Function TfmMain.LoadNode : Boolean;
var
  st          : string;
  NodeCount   : Integer;
  ArrayNode   : Array of String;
  I           : Integer;

  aNodeStr : String;
  NodeNo,OldNodeNo    : Integer;
  IPStr       : String;
  nPort : integer;

  stSql : String;
  nNodeCnt : integer;
  TempAdoQuery : TADOQuery;

begin

  Result := False;
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  if ComNodeList = nil then ComNodeList := TStringList.Create;
  ComNodeList.Clear;

  // NODE List 만 추출
  stSql := CommonSql.GetNodeTypeSelect(NETTYPE);
  //TCommmode 로드
  with TempAdoQuery do
  begin
    Close;
    sql.Clear;
    sql.Text := stSql;

    Try
      Open;
    Except
      //에러처리
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    NodeCount:= RecordCount;
    system.SetLength(ArrayNode,NodeCount+1);

    First;
    if recordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    SerialModule.No :=  FindField('AC_NODENO').asInteger;
    SerialModule.WinsockPort.DeviceLayer:= dlWin32;
    SerialModule.WinsockPort.Baud:= 38400;
    SerialModule.WinsockPort.ComNumber := FindField('AC_COMPORT').asinteger;
    SerialModule.OnRcvData:=           CommNodeReceve;
    SerialModule.OnSendData :=         CommNodeSend;
    SerialModule.OnConnected := NodeConnected;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  Result := True;
end;

Function TfmMain.UnLoadNode :Boolean;
begin
  SerialModule.WinsockPort.Open := False;
  SerialModule.OnRcvData := Nil;
  SerialModule.OnSendData := Nil;
  SerialModule.OnConnected := Nil;
end;

function TfmMain.LoadECU: Boolean;
var
  stSql : String;
  aDeviceType : CHAR;
  TempAdoQuery : TADOQuery;
  aSerialEcu : TSerialECU;
  stDeviceID : string;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  Result := False;

  DeviceList.Clear;

  // ECU List 전체 추출
  stSql := commonSql.GetECUAllSelect(NETTYPE);
  // 기기
  with TempAdoQuery do
  begin
    Close;
    sql.Clear;
    sql.Text := stSql;

    Try
      Open;
    Except
      //에러처리
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    First;
    while not eof do
    begin
      stDeviceID := FillZeroNumber(FindField('AC_NodeNo').AsInteger,3) + FindField('AC_ECUID').asString;

      aSerialEcu := TSerialECU.Create(self);
      aSerialEcu.SerialPort := SerialModule.WinsockPort;
      aSerialEcu.NodeNo := FindField('AC_NodeNo').AsInteger;
      aSerialEcu.ErrorCount:= 0;
      aSerialEcu.ATtype:= dtAt;
      aSerialEcu.ECUID := FindField('AC_ECUID').asString;
      aSerialEcu.OnRcvCardReadData   := DeviceRcvCardReadData;      //카드 리딩 데이터
      aSerialEcu.OnRcvButtonReadData   := DeviceRcvButtonReadData;      //버튼 리딩 데이터
      aSerialEcu.OnConnected         := DeviceConnected;

      DeviceList.AddObject(stDeviceID,aSerialEcu);
      SerialModule.Devices.AddObject(stDeviceID,aSerialEcu);

      next;
    end;
    close;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  if DeviceList.Count = 1 then PollingTimer.Interval := 30
  else PollingTimer.Interval := 5;
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
  stRxTx: string;
  stECUID : string;
  stMsgNo : string;
  stCMD : string;
  stLength : string;
  stData : string;
begin
  if bApplicationTerminate then Exit;
  stRxTx := '[RX]';
  stECUID := Dec2Hex(Ord(ReceiveData[2]),2);
  stMsgNo := Dec2Hex(Ord(ReceiveData[3]),2);
  stCMD := Dec2Hex(Ord(ReceiveData[4]),2);
  stLength := Dec2Hex(Ord(ReceiveData[5]),2);
  stData := copy(ReceiveData,6,strtoint(stLength));

  if (stCMD <> '05') and (stCMD <> '06') then
    LogSave(ExeFolder + '\..\log\Comm'+ FormatDateTIme('yyyymmdd',Now)+ FillZeroNumber(NodeNO,3) + '.log','[RX]' + ReceiveData);
  //실시간송수신화면에 디스플레이{TO DO}
  RealDataShow(stRxTx,stECUID,stMsgNo,stCMD,stLength,stData);

end;

procedure TfmMain.CommNodeSend(Sender: TObject; SendData: string;NodeNO : integer);
var
  stRxTx: string;
  stECUID : string;
  stMsgNo : string;
  stCMD : string;
  stLength : string;
  stData : string;
begin
  stRxTx := '[TX]';
  stECUID := Dec2Hex(Ord(SendData[2]),2);
  stMsgNo := Dec2Hex(Ord(SendData[3]),2);
  stCMD := Dec2Hex(Ord(SendData[4]),2);
  stLength := Dec2Hex(Ord(SendData[5]),2);
  stData := copy(SendData,6,strtoint(stLength));

  if (stCMD <> '05') and (stCMD <> '06') then
    LogSave(ExeFolder + '\..\log\Comm'+ FormatDateTIme('yyyymmdd',Now)+ FillZeroNumber(NodeNO,3) + '.log','[TX]' + SendData);
  //실시간송수신화면에 디스플레이{TO DO}
  RealDataShow(stRxTx,stECUID,stMsgNo,stCMD,stLength,stData);


end;


procedure TfmMain.DeviceRcvCardReadData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
Var
  stData : string;
  stCardNo : string;
  nLength : integer;
  cAtType : char;
  stTimestr : string;
  stEcuID : string;
  stClientSendData:string;
  nIndex : integer;
  stSql : string;
begin
  stEcuID := Dec2Hex(Ord(ReceiveData[2]),2);
  //여기에서 등록된 데이터 인지 체크하자.
  stTimestr := FormatDateTime('yyyymmddHHMMSS',now);
  nLength := strtoint(Dec2Hex(Ord(ReceiveData[5]),2));
  stData := copy(ReceiveData,6,nLength);
  cAtType := stData[1];
  Delete(stData,1,1);
  stCardNo := Ascii2Hex(stData);
  nIndex := ATCardList.IndexOf(stCardNo);
  if nIndex > -1 then
  begin
    //등록되어 있으면
    SerialModule.SendPacket(stEcuID,REGISTERCMD,'');
    //AccessEventProcess(stCardNo);
    if L_nDeviceType = 0 then
      ProcessAttendData1(stTimestr,stCardNo) //찍을때마다 업데이트
    else
      ProcessAttendData2(stTimestr,stCardNo,cAtType);
  end else
  begin
    //미등록되어 있으면
    SerialModule.SendPacket(stEcuID,NOTREGISTERCMD,'');
  end;
  stClientSendData := 'R' +
                      'E' +
                      FillZeroNumber(NodeNo,3) +
                      stEcuID +
                      '00' +
                      '00' +
                      'AT' +
                      'C' +
                      FillZeroNumber(Length(stCardNo) + 15 ,3) +
                      FormatDateTime('yyyymmddHHMMSS',Now) +
                      cAtType +
                      stCardNo;

  SendClientData(stClientSendData);

  if Not dmAdoQuery.DupCheckTB_ACCESS_EVENT(stTimestr,NodeNO,stECUID,'0',stCardNo) then
  begin
    stSql :=  'Insert into TB_ACCESSEVENT';
    stSql := stSql + '(GROUP_CODE,AC_DATE,AC_TIME,AC_NODENO,AC_ECUID,';
    stSql := stSql + 'DO_DOORNO,CA_CARDNO,AC_READERNO,AC_BUTTONNO)';
    stSql := stSql + ' Values(';
    stSql := stSql + '''' + GROUPCODE + ''',';
    stSql := stSql + '''' + copy(stTimestr,1,8) + ''',';
    stSql := stSql + '''' + copy(stTimestr,9,6) + ''',';
    stSql := stSql + inttostr(NodeNo) + ',';
    stSql := stSql + '''' + stECUID + ''',';
    stSql := stSql + '''0'',';
    stSql := stSql + '''' + stCardNo + ''',';
    stSql := stSql + '''' + cAtType + ''',';
    stSql := stSql + '''C'')';

    //DataModule1.ProcessExecSQL(stSql);
    DataModule1.ProcessEventExecSQL(stSql);

  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '중복데이터(출입통제):',ReceiveData);
  end;

  G_bPackageEND := True;
end;


//업데이트 방식의 근태 처리로 2교대 이상의 상황에서는 사용 불가
function TfmMain.ProcessAttendData1(aTime, aCardNo: String;bPassNo:Boolean = False): Boolean;
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
  if Not GetEmployeeInfo(aCardNo,bPassNo,stCompanyCode,stEMCode) then
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
    InsertATTENDINCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,bPassNo);
  end else if stAttendType = '2' then //퇴근
  begin
    InsertATTENDOUTCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '근태 데이터 저장 오류[근태코드]',aTime+':'+aCardNo+':'+stAttendType);
    Exit;
  end;

end;

function TfmMain.ProcessAttendData2(aTime, aCardNo: String;
  aAttendCode: Char;bPassNo:Boolean = False): Boolean;
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
  if Not GetEmployeeInfo(aCardNo,bPassNo,stCompanyCode,stEMCode) then
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

  if aAttendCode = INBUTTON then //출근
  begin
    InsertATTENDINCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,bPassNo);
  end else if aAttendCode = OUTBUTTON then //퇴근
  begin
    InsertATTENDOUTCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
  end else if aAttendCode = LEAVEBUTTON then //외출
  begin
    InsertATTENDLEAVECode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
    //여기에서 외출시 현재 퇴근이면...
    if L_nNonBackType = 0 then //미복귀시 현재 시간으로 퇴근 처리
      InsertATTENDOUTCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay)
    else if L_nNonBackType = 1 then //미복귀시 정상 퇴근 처리
    begin
      dmAdoQuery.TB_ATEVENTOuttimeUpdate(stDate,stCompanyCode,stEMCode,aTime,'001');
    end;
  end else if aAttendCode = BACKBUTTON then //복귀
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
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  Result := False;
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

  stSql := CommonSql.GetTB_ATCODEAllSelect;
  
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
    while Not Eof do
    begin
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
    
    stSql := commonSql.GetTB_CONFIGGroupSelect('ATTEND');
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
    if RecordCount > 0 then
    begin
      while Not Eof do
      begin
        if FindField('CO_CONFIGCODE').AsString = 'YTIME' then
          L_YesterDayStandTime := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'TTIME' then
          L_ToDayStandTime := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then
          L_nSaturday := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then
          L_nDeviceType := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
          L_nATType := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'OUTTIME' then
          L_nNonBackType := FindField('CO_CONFIGVALUE').Asinteger;

        next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  Result := True;
end;

procedure TfmMain.Action_DaemonRestartExecute(Sender: TObject);
var
  stClientSendData : string;
begin
  if bDaemonRestart then Exit;
  bDaemonRestart := True;
  Action_DaemonstopExecute(self);
  Delay(1000);
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
  bDaemonRestart := False;
end;

function TfmMain.DaemonConfigSet: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  result := False;
  DaemonServerIP := '127.0.0.1';
  DaemonServerPort := '3431'; //디폴트 포트
  AttendServerPort := '3433'; //디폴트 포트

  stSql := CommonSql.GetTB_CONFIGGroupSelect('DAEMON');

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

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    while Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'PORT' then  DaemonServerPort := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'ATPORT' then AttendServerPort := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'IP' then DaemonServerIP := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString= 'CLIENTCNT' then DaemonAccecptClientCount := FindField('CO_CONFIGVALUE').AsInteger ;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
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

procedure TfmMain.ATSERVERNewConnect(ClientThread: TDXClientThread);
Var
   Ws:String;
   I: Integer;
   aIndex: Integer;
   StartTime:Comp;
   aLog: String;
   Sock: Integer;
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
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {원격지에서 받은 데이터 처리 루틴추가}
        if Ws <> '' then RcvFromClient(ClientThread.Socket.PeerIPAddress,ws);
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

procedure TfmMain.RcvFromClient(aClientIP, ast: string);
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

//
end;

function TfmMain.DaemonLogConfigSet: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  result := False;
  DaemonLogFullData := 'N';
  DaemonLogDeleteDay := 3;

  stSql := CommonSql.GetTB_CONFIGGroupSelect('DAEMONLOG');

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

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    while Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'FULLLOG' then  DaemonLogFullData := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'DELETDAY' then DaemonLogDeleteDay := FindField('CO_CONFIGVALUE').AsInteger ;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  result := True;
end;

function TfmMain.DeleteTB_LOWDATA(aDate: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := CommonSql.DeleteTB_LOWDATAToDate(aDate);

  Result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMain.DataBaseConfigSet: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  result := False;
  DataBaseAutoBackup := 'FALSE';
  DataBaseBackupDir := 'c:\Backup';
  DataBaseBackupTime := '0100';
  DataBaseBackupCycle := 10;
  L_nAccessDeleteDay := 90;
  L_nAttendDeleteDay := 90;
  L_nFoodDeleteDay := 90;
  L_nPatrolDeleteDay := 90;
  DataBaseLastBackupDate := FormatDateTime('yyyymmdd',Now);

  stSql := commonSql.GetTB_CONFIGGroupSelect('DATABASE');

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

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    while Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'AUTO' then  DataBaseAutoBackup := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'BACKDIR' then DataBaseBackupDir := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'BACKTIME' then  DataBaseBackupTime := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'BACKCYCLE' then  DataBaseBackupCycle := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'AT_DELETE' then L_nAttendDeleteDay := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'FD_DELETE' then L_nFoodDeleteDay := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'AC_DELETE' then L_nAccessDeleteDay := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'PT_DELETE' then L_nPatrolDeleteDay := FindField('CO_CONFIGVALUE').AsInteger;
      Next;
    end;
  end;

  stSql := commonSql.GetTB_CURRENTDAEMONStateSelect('LASTBACKUP');

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

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    DataBaseLastBackupDate := FindField('CU_STATEVALUE').AsString;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  result := True;

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
    Sql.Clear;
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
  stSql := CommonSql.DeleteTB_ACCESSEVENTToDate(stDate);
  DataModule1.ProcessEventExecSQL(stSql);

  //근태 데이터 삭제
  stDate := FormatdateTime('yyyymmdd',Now - L_nAttendDeleteDay);
  stSql := CommonSql.DeleteTB_ATEVENTToDate(stDate);
  DataModule1.ProcessEventExecSQL(stSql);

  Result := True;
end;

function TfmMain.UpdateTB_CURRENTDAEMON(aCode, aValue: String): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := commonSql.UpdateTB_CURRENTDAEMONKey(aCode,aValue);
  Result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.MCUCommonConfigSet: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  result := False;
  CardDownloadAutoBackup := 'FALSE';

  stSql := CommonSql.GetTB_CONFIGGroupSelect('MCUCOMM');

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

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    while Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'CARDAUTO' then  CardDownloadAutoBackup := FindField('CO_CONFIGVALUE').AsString ;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
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
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  AccessUse := False;
  PatrolUse := False;
  AttendUse := False;
  FoodUse := False;

  stSql := commonSql.GetTB_CONFIGGroupSelect('MOSTYPE');

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
      end else if FindField('CO_CONFIGCODE').AsString = 'FOODDEVICE' then
      begin
        FOODDEVICE := FindField('CO_CONFIGVALUE').AsString;
      end else if FindField('CO_CONFIGCODE').AsString = 'FOODGRADE' then
      begin
        FOODGRADE := FindField('CO_CONFIGVALUE').AsInteger;
      end;

      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  //권한관리쪽에서 보여줄 항목을 셋팅하자
  SetVisibleMenue;

end;

procedure TfmMain.N18Click(Sender: TObject);
begin
  Action_DaemonStopExecute(self);
  fmDeviceCode:= TfmDeviceCode.Create(Self);
  fmDeviceCode.WorkCode := 0;
  fmDeviceCode.IsInsertGrade := True;
  fmDeviceCode.IsUpdateGrade := True;
  fmDeviceCode.IsDeleteGrade := True;
  fmDeviceCode.SHowmodal;
  fmDeviceCode.Free;
  Action_DaemonRestartExecute(self);

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


//실시간 송수신 현황을 리스트에 조회한다.
procedure TfmMain.RealDataShow(aRxTx,aECUID,aMsgNo,aCMD,aLength,aData:string);
begin
  if bCURRENTSTATE then
  begin
    self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['RXTX'] := aRxTx;
    self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['ECUID'] := aECUID;
    self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['MSGNO'] := aMsgNo;
    self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['CMD'] := aCmd;
    self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['LENGTH'] := aLength;
    self.FindClassForm('TfmCurrentState').FindCommand('Message').Params.Values['DATA'] := aData;
    self.FindClassForm('TfmCurrentState').FindCommand('Message').Execute;
  end;

end;



procedure TfmMain.SetVisibleMenue;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  stSql := CommonSql.GetVisibleGradeSelect;

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if recordCount < 1 then Exit;

    while Not Eof do
    begin
      UpdateTB_PROGRAMIDVisible(FindField('CO_CONFIGCODE').AsString,FindField('CO_CONFIGVALUE').AsString);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmMain.UpdateTB_PROGRAMIDVisible(aCode, aValue: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := CommonSql.UpdateTB_PROGRAMIDVisible(aCode, aValue);
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
{
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

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  //MSSQL 출입 데이터를 MDB에 내리자
  if bFull then stDate := FormatdateTime('yyyymmdd',Now)
  else stDate := FormatdateTime('yyyymmdd',Now - L_nAccessDeleteDay);

  stSql := CommonSql.GetTB_ACCESSEVENTToDateSelect(stDate);
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
          CoUninitialize;
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

  stSql := CommonSql.GetTB_ATEVENTToDateSelect(stDate);
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
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

  TempAdoQuery.Free;
  CoUninitialize;
  result := True;    }
  
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

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  //MSSQL 카드 데이터를 MDB에 내리자
  stSql := CommonSql.GetTB_CardAllSelect;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
          CoUninitialize;
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
  stSql := commonSql.GetTB_EMPLOYEEAllSelect;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
          CoUninitialize;
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
  stSql := commonSql.GetTB_COMPANYAllSelect;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
          CoUninitialize;
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
  stSql := commonSql.GetTB_POSIAllSelect;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
          CoUninitialize;
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
  stSql := CommonSql.GetTB_ACCESSDEVICEAllSelect;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
          CoUninitialize;
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
  stSql := commonSql.GetTB_DOORAllSelect;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
          CoUninitialize;
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
  stSql := commonSql.GetTB_ALARMDEVICEAllSelect;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
          CoUninitialize;
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
  stSql := commonSql.GetTB_FOODAllSelect;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
          CoUninitialize;
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
  stSql := commonSql.GetTB_DEVICECARDNOAllSelect;
  with TempAdoQuery do
  begin

    Close;
    Sql.Clear;
    sql.Text := stSql;
    try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        if bApplicationTerminate then
        begin
          TempAdoQuery.Free;
          CoUninitialize;
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
  TempAdoQuery.Free;
  CoUninitialize;
  result := True;
end;

procedure TfmMain.RelayConfigSet;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  fdmsUses := 'FALSE';
  fdmsPath := '';
  fdmsPW   := '';

  stSql := CommonSql.GetTB_CONFIGGroupSelect('RELAY');

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
      if FindField('CO_CONFIGCODE').AsString = 'fdmsUSE' then
      begin
        fdmsUses := UpperCase(FindField('CO_CONFIGVALUE').AsString);
      end else if FindField('CO_CONFIGCODE').AsString = 'fdmsPath' then
      begin
        fdmsPath := UpperCase(FindField('CO_CONFIGVALUE').AsString);
      end else if FindField('CO_CONFIGCODE').AsString = 'fdmsPW' then
      begin
        fdmsPW := UpperCase(FindField('CO_CONFIGVALUE').AsString);
      end;

      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  //권한관리쪽에서 보여줄 항목을 셋팅하자
  SetVisibleMenue;

end;


procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  bApplicationTerminate := True;
  Action_DaemonStopExecute(self);

  DataBaseBackupTimer.Enabled := False;
  Timer1.Enabled := False;
  Timer2.Enabled := False;

  DataBaseBackupTimer.Free;
  Timer1.Free;
  Timer2.Free;

  ATSERVER.Close;
  ATSERVER.Free;
  DXUnicastDataQueue1.Free;
  DeviceList.free;
  ConnectDeviceList.Free;
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
  LogSave(ExeFolder + '\..\log\lomosHis.log','Daemon Program Close ');

end;

procedure TfmMain.DeviceConnected(Sender: TObject; Value: Boolean;
  NodeNo: integer; aECUID: string);
var
  nIndex : integer;
  st : string;
  stClientSendData : string;
begin
  if Value then
  begin
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

    if ConnectDeviceList.IndexOf(FillZeroNumber(NodeNo,3) + aECUID) < 0 then
    begin
      ConnectDeviceList.Add(FillZeroNumber(NodeNo,3) + aECUID);
    end;
    UpdateTB_ACCESSDEVICE_Connect(FillZeroNumber(NodeNo,3),aECUID,'C');
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
    UpdateTB_ACCESSDEVICE_Connect(FillZeroNumber(NodeNo,3),aECUID,'D');
  end;
  SendClientData(stClientSendData);
  StatusBar1.Panels[3].Text := inttostr(ConnectDeviceList.Count) + '/' + inttostr(DeviceList.Count);
end;

procedure TfmMain.N23Click(Sender: TObject);
begin
  MDIChildShow('TfmDeviceConnectState');
end;


procedure TfmMain.NodeConnected(Sender: TObject; aConnected: Boolean;
  NodeNo: integer);
var
  stClientSendData : string;
begin
  if aConnected then
  begin
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
  end;
  SendClientData(stClientSendData);

end;

function TfmMain.UpdateTB_ACCESSDEVICE_Connect(aNodeNo, aECUID,
  aConnected: string): Boolean;
var
  stSql :string;
begin
  stSql := CommonSql.UpdateTB_ACCESSDEVICEConnected(aNodeNo,aEcuid,aConnected);

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.N24Click(Sender: TObject);
begin
  Action_DaemonStopExecute(self);
  fmNetConfig:= TfmNetConfig.Create(Self);
  fmNetConfig.SHowmodal;
  fmNetConfig.Free;
  Action_DaemonStartExecute(self);

end;


function TfmMain.DevicePacketSend(aDeviceID, aCmd,
  aSendData: string): Boolean;
var
  aDevice: TSerialECU;
begin
  result := False;
  if bClose then Exit;
  aDevice:= GetDevice(aDeviceID );
  if aDevice <> nil then
  begin
    if SerialModule.SocketConnected = True then
    begin
      aDevice.SendPacket(aCmd[1],aSendData);
      result := True;
    end;
  end;

end;


function TfmMain.CheckHolidy(aYear, aMonth, aDay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := commonSql.GetTB_HOLIDAYequalDate(aYear + aMonth + aDay);
  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
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

function TfmMain.GetAttendCode(aTime, aCompanyCode,aEMCode: string;nWeekCode:integer;bPass:Boolean): string;
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


  if nWeekCode = 1 then //일요일 데이터에서 찾자
  begin
    stSql := commonSql.GetTB_ATCODEHolidayFromToTimeSelect(stTime);
  end else if nWeekCode = 7 then
  begin
    stSql := CommonSql.GetTB_ATCODESaturdayFromToTimeSelect(stTime);
  end else
  begin
    stSql := commonSql.GetTB_ATCODEWeekFromToTimeSelect(stTime);
  end;

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql ;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    Result := FindField('AT_ATCODE').AsString;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmMain.GetEMPLOYEEATCode(aCompanyCode,aEMCode: string): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ' ;

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql ;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    if FindField('AT_ATCODE').IsNull then Result := '000'
    else if Trim(FindField('AT_ATCODE').AsString) = '' then Result := '000'
    else Result := FindField('AT_ATCODE').AsString;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
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
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnectionEVENT;


  stSql := 'select * from TB_ATEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ' ;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ' ;

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql ;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    if FindField('AT_ATCODE').IsNull then Result := '000'
    else if Trim(FindField('AT_ATCODE').AsString) = '' then Result := '000'
    else Result := FindField('AT_ATCODE').AsString;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
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

function TfmMain.InsertATTENDINCode(aDate, aTime,aCompanyCode,aEMCode: String;
  nWeekCode: integer;bPass:Boolean): Boolean;
var
  stAttendCode : string;
  stATInCode : string;
  nIndex : integer;
begin
  result := False;

  //근태적용일 오늘 출근하면서 전일자 출근 표시 할일이 있을까? 없을것이다. 고로 오늘날짜가 근태일이다.
  stAttendCode := GetAttendCode(aTime,aCompanyCode,aEMCode,nWeekCode,bPass);
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

procedure TfmMain.PollingTimerTimer(Sender: TObject);
var
  i : integer;
  FirstTickCount: Longint;
begin
  PollingTimer.Enabled := False;

  for i := 0 to DeviceList.Count - 1 do
  begin
    if bClose then Exit;
    if SerialModule.WinsockPort.Open then
    begin
      G_bPackageEND := False;
      TSerialECU(DeviceList.Objects[I]).SendPacket(ENQCMD,'');
      FirstTickCount := GetTickCount + 30; //50mm초 대기
      While Not G_bPackageEND do
      begin
        AppliCation.ProcessMessages;
        if GetTickCount > FirstTickCount then Break;  //50밀리동안 응답 없으면 실패로 처리함
      end;
    end;
  end;

  if L_bPollingState then PollingTimer.Enabled := True;
end;

procedure TfmMain.DeviceRcvButtonReadData(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
Var
  stData : string;
  stPassNo : string;
  nLength : integer;
  cAtType : char;
  stTimestr : string;
  stEcuID : string;
  stClientSendData:string;
  nIndex : integer;
  stSql : string;
begin
  stEcuID := Dec2Hex(Ord(ReceiveData[2]),2);
  //여기에서 등록된 데이터 인지 체크하자.
  stTimestr := FormatDateTime('yyyymmddHHMMSS',now);
  nLength := strtoint(Dec2Hex(Ord(ReceiveData[5]),2));
  stData := copy(ReceiveData,6,nLength);
  cAtType := stData[1];
  Delete(stData,1,1);
  stPassNo := stData;
  nIndex := ATCardList.IndexOf(stPassNo);
  if nIndex > -1 then
  begin
    //등록되어 있으면
    SerialModule.SendPacket(stEcuID,REGISTERCMD,'');
    //AccessEventProcess(stCardNo);
    if L_nDeviceType = 0 then
      ProcessAttendData1(stTimestr,stPassNo,True) //찍을때마다 업데이트
    else
      ProcessAttendData2(stTimestr,stPassNo,cAtType,True);
  end else
  begin
    //미등록되어 있으면
    SerialModule.SendPacket(stEcuID,NOTREGISTERCMD,'');
  end;

  stClientSendData := 'R' +
                      'E' +
                      FillZeroNumber(NodeNo,3) +
                      stEcuID +
                      '00' +
                      '00' +
                      'AT' +
                      'B' +
                      FillZeroNumber(Length(stPassNo) + 15,3) +
                      FormatDateTime('yyyymmddHHMMSS',Now) +
                      cAtType +
                      stPassNo;
  SendClientData(stClientSendData);

  if Not dmAdoQuery.DupCheckTB_ACCESS_EVENT(stTimestr,NodeNO,stECUID,'0',stPassNo) then
  begin
    stSql :=  'Insert into TB_ACCESSEVENT';
    stSql := stSql + '(GROUP_CODE,AC_DATE,AC_TIME,AC_NODENO,AC_ECUID,';
    stSql := stSql + 'DO_DOORNO,CA_CARDNO,AC_READERNO,AC_BUTTONNO)';
    stSql := stSql + ' Values(';
    stSql := stSql + '''' + GROUPCODE + ''',';
    stSql := stSql + '''' + copy(stTimestr,1,8) + ''',';
    stSql := stSql + '''' + copy(stTimestr,9,6) + ''',';
    stSql := stSql + inttostr(NodeNo) + ',';
    stSql := stSql + '''' + stECUID + ''',';
    stSql := stSql + '''0'',';
    stSql := stSql + '''' + stPassNo + ''',';
    stSql := stSql + '''' + cAtType + ''',';
    stSql := stSql + '''B'')';

    //DataModule1.ProcessExecSQL(stSql);
    DataModule1.ProcessEventExecSQL(stSql);

  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '중복데이터(출입통제):',ReceiveData);
  end;

  G_bPackageEND := True;
end;

function TfmMain.CheckTB_CardNo(aCardNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Result := False;
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  stSql := CommonSql.GetTB_CARDequalCardNoSelect(aCardNo,'2','1');

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
    if recordCount > 0 then result := True;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmMain.CheckTB_PASS(aPassNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Result := False;
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  stSql := commonSql.GetTB_EMPLOYEEequalEmPassSelect(aPassNo);

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
    if recordCount > 0 then result := True;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
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
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;


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

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql ;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    aCompanyCode := FindField('CO_COMPANYCODE').AsString;
    aEMCode := FindField('EM_CODE').AsString;
  end;
  result := True;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMain.ATCardLoading(bFull:Boolean);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  if bFull then UpdateTB_ATCARDLOAD('A','L')
  else UpdateTB_ATCARDLOAD('N','L');

  stSql := commonSql.getTB_ATCARDLodingTypeSelect('L');

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    While Not Eof do
    begin
      if FindField('AT_REG').AsString = 'Y' then
      begin
        nIndex := ATCardList.IndexOf(FindField('CA_CARDNO').AsString);
        if nIndex < 0 then ATCardList.Add(FindField('CA_CARDNO').AsString);
      end else
      begin
        nIndex := ATCardList.IndexOf(FindField('CA_CARDNO').AsString);
        if nIndex > -1 then ATCardList.Delete(nIndex);
      end;
      Next;
    end;
  end;

  UpdateTB_ATCARDLOAD('L','Y');
  TempAdoQuery.free;
  CoUninitialize;
end;

procedure TfmMain.ATPassLoading(bFull:Boolean);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  if bFull then UpdateTB_ATPASSLOAD('A','L')
  else UpdateTB_ATPASSLOAD('N','L');

  stSql := CommonSql.GetTB_ATPASSLodingTypeSelect('L');
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    While Not Eof do
    begin
      if FindField('AT_REG').AsString = 'Y' then
      begin
        nIndex := ATPASSList.IndexOf(FindField('EM_PASS').AsString);
        if nIndex < 0 then ATPASSList.Add(FindField('EM_PASS').AsString);
      end else
      begin
        nIndex := ATPASSList.IndexOf(FindField('EM_PASS').AsString);
        if nIndex > -1 then ATPASSList.Delete(nIndex);
      end;
      Next;
    end;
  end;

  UpdateTB_ATPASSLOAD('L','Y');
  TempAdoQuery.free;
  CoUninitialize;
end;

function TfmMain.UpdateTB_ATCARDLOAD(aTarget, aData: string): Boolean;
var
  stSql : string;
begin
  if aTarget = 'A' then stSql := CommonSql.UpdateTB_ATCARDAllLoadType(aData)
  else stSql := commonSql.UpdateTB_ATCARDLoadTypeFromTarget(aTarget,aData);
  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.ATLOADTimerTimer(Sender: TObject);
begin
  if bClose then Exit;
  ATLOADTimer.Enabled := False;
  ATCardLoading(False);
  ATPassLoading(False);
  ATLOADTimer.Enabled := True;
end;

function TfmMain.UpdateTB_ATPASSLOAD(aTarget, aData: string): Boolean;
var
  stSql : string;
begin
  if aTarget = 'A' then stSql := commonSql.UpdateTB_ATPASSAllLoadType(aData)
  else stSql := commonSql.UpdateTB_ATPASSLoadTypeFromTarget(aTarget,aData);
  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.DeviceSTATECHECK(aDeviceID: string);
var
  i: integer;
begin
  if copy(aDeviceID,1,5) = '00000' then  //전체 상태 조회
  begin
    NodeConnected(self,SerialModule.SocketConnected,SerialModule.No);
    Delay(100);
    for i:=0 to DeviceList.Count - 1 do
    begin
      DeviceConnected(self,TSerialECU(DeviceList.Objects[i]).Connected,
                           TSerialECU(DeviceList.Objects[i]).NodeNo,
                           TSerialECU(DeviceList.Objects[i]).ECUID);
      Delay(100);
    end;
  end;
end;

procedure TfmMain.DataBaseBackupTimerTimer(Sender: TObject);
begin
  if bClose then Exit;
  if DBBackupTime > Now then Exit;
  if bDataBaseBackup then Exit;

  if FileDataBaseBackup(False) then
  begin
    DeleteTable;

    UpdateTB_CURRENTDAEMON('LASTBACKUP',FormatDateTime('yyyymmdd',now));
  end;

  bDataBaseBackup := False;

end;

function TfmMain.FileDataBaseBackup(bFull: Boolean): Boolean;
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
  tbi.Hint := 'DataBase 백업중...';
  StatusBar1.Panels[0].Text := 'DataBase 백업중...';
  TableFileBackup('TB_ACCESSDEVICE');
  Delay(1000);
  TableFileBackup('TB_ACCESSEVENT');
  Delay(1000);
  TableFileBackup('TB_ADMIN');
  Delay(1000);
  TableFileBackup('TB_ADMINCOMPANY');
  Delay(1000);
  TableFileBackup('TB_ATCARD');
  Delay(1000);
  TableFileBackup('TB_ATCODE');
  Delay(1000);
  TableFileBackup('TB_ATDAYSUMMARY');
  Delay(1000);
  TableFileBackup('TB_ATEMPEXTRA');
  Delay(1000);
  TableFileBackup('TB_ATEVENT');
  Delay(1000);
  TableFileBackup('TB_ATINCODE');
  Delay(1000);
  TableFileBackup('TB_ATMONTHEXTRA');
  Delay(1000);
  TableFileBackup('TB_ATMONTHSUMMARY');
  Delay(1000);
  TableFileBackup('TB_ATOUTCODE');
  Delay(1000);
  TableFileBackup('TB_ATPASS');
  Delay(1000);
  TableFileBackup('TB_ATVACATION');
  Delay(1000);
  TableFileBackup('TB_ATVACODE');
  Delay(1000);
  TableFileBackup('TB_BASEPAY');
  Delay(1000);
  TableFileBackup('TB_CARD');
  Delay(1000);
  TableFileBackup('TB_COMPANY');
  Delay(1000);
  TableFileBackup('TB_CONFIG');
  Delay(1000);
  TableFileBackup('TB_EMPLOYEE');
  Delay(1000);
  TableFileBackup('TB_GRADE');
  Delay(1000);
  TableFileBackup('TB_GRADEPROGRAM');
  Delay(1000);
  TableFileBackup('TB_HOLIDAY');
  Delay(1000);
  TableFileBackup('TB_MONTHAT');
  Delay(1000);
  TableFileBackup('TB_POSI');
  Delay(1000);
  tbi.Hint := '송수신데몬서버 정상';
  StatusBar1.Panels[0].Text := '송수신데몬서버 정상';

  bDBBackup := False;
  result := True;

end;

procedure TfmMain.SpeedButton1Click(Sender: TObject);
begin
  FileDataBaseBackup(False);

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
       fldStr := fldStr + delStr+ '['+TblImport.Fields[i].FieldName+']';
       delStr :=',';
    end; // for
    //QryList.Append('TRUNCATE TABLE ['+targetName+']');
    QryList.Append('INSERT INTO [dbo].['+targetName+']');
    fldStr := '('+fldStr+')';
    QryList.Append(fldStr);
    QryList.Append('VALUES');
    //    MainForm.LogMessage(targetName+' - Records:'+IntToStr(QryMain.RecordCount),True);
    delstr := '';
    TblImport.First();
    WHILE (NOT(TblImport.Eof)) do begin
       Application.ProcessMessages;
       For i := 0 to (TblImport.FieldCount - 1) do begin
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
       QryInsert.SQL.Clear;
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
      Sql.Clear;
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

procedure TfmMain.SpeedButton2Click(Sender: TObject);
begin
  FileDBRestor('c:\TB_CARD.BAK');

end;

function TfmMain.TableFileBackup(aTableName: string): Boolean;
var
  stBackupDir : string;
  stSql : string;
begin
  stBackupDir := DataBaseBackupDir + '\' + FormatDateTime('yyyymmdd',Now);
  if not DirectoryExists(stBackupDir) then
  begin
   if Not CreateDir(stBackupDir) then
   begin
      DataBaseBackupTimer.Enabled := False;
      showmessage(stBackupDir + ' 은 생성할수 없는 디렉토리입니다. 환경설정을 확인 후 재기동하여 주세요. ');
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
    SQL.Clear;
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
  showmessage(stDir + ' 디렉토리의 데이터를 백업합니다.');

  tbi.Hint := 'DataBase 복구중...';
  pan_gauge.Visible := True;
  Ga_Tot.MaxValue := 26;
  Ga_Tot.Progress := 0;
  StatusBar1.Panels[0].Text := 'DataBase 복구중...';
  FileDBRestor(stDir + '\' + 'TB_ACCESSDEVICE' + '.BAK');
  Ga_Tot.Progress := Ga_Tot.Progress + 1;
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ACCESSEVENT' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ADMIN' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ADMINCOMPANY' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATCARD' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATCODE' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATDAYSUMMARY' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATEMPEXTRA' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATEVENT' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATINCODE' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATMONTHEXTRA' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATMONTHSUMMARY' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATOUTCODE' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATPASS' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATVACATION' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_ATVACODE' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_BASEPAY' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_CARD' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_COMPANY' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_CONFIG' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_EMPLOYEE' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_GRADE' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_GRADEPROGRAM' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_HOLIDAY' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_MONTHAT' + '.BAK');
  Delay(1000);
  FileDBRestor(stDir + '\' + 'TB_POSI' + '.BAK');
  Delay(1000);
  pan_gauge.Visible := False;
  tbi.Hint := '송수신데몬서버 정상';
  StatusBar1.Panels[0].Text := '송수신데몬서버 정상';

end;

procedure TfmMain.CenterPanel;
var
  nTotW,nTotH,nPanW,nPanH:integer;
  nTop,nLeft : integer;
  nStartH,nStartW : integer;
begin
  nStartH := 65;
  nStartW := 0;
  nTotW := Image1.Width;
  nTotH := Image1.Height;
  nPanW := pan_gauge.Width;
  nPanH := pan_gauge.Height;
  nTop := nStartH + (nTotH div 2) - (nPanH div 2);
  nLeft := nStartW + (nTotW div 2) - (nPanW div 2);
  pan_gauge.Top := nTop;
  pan_gauge.Left := nLeft;
end;

procedure TfmMain.DaemonConfigWriting;
var
  stSql : string;
begin
  stSql := CommonSql.UpdateTB_CONFIG('ATTEND','CARDTYPE','2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('ATTEND','DEVICETYPE','2');   //0:UPDATE,1:카드리더,2:버튼방식
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('DAEMON','NETTYPE','RS232');
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then
  begin
    stSql := CommonSql.UpdateTB_CONFIG('MOSTYPE','FILEDIR',ExeFolder + '\..\Resource');
    DataModule1.ProcessExecSQL(stSql);
    stSql := CommonSql.UpdateTB_CONFIG('DAEMON','IP','127.0.0.1');
    DataModule1.ProcessExecSQL(stSql);

  end;
end;

end.
