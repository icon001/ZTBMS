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
  IdFTPServer,IdFTPList,IdGlobal,IdHashCRC,FileInfo,
  uDataModule1,systeminfos,Registry, FindFile,
  SyncObjs, Buttons,Contnrs, AppEvnts,WinSock,ShellAPI, OleCtrls, SHDocVw  ;

//{$DEFINE TApdWinsockport}
//{$DEFINE TClientSocket}
{$DEFINE TWinSocket}
//{$DEFINE DEBUG}  //

const
  ClientConnectTime = 600000;
  AllSendClientDelayTime = 10;

type


  TfmMain = class(TfmASubForm)
    tbi: TantTaskbarIcon;
    imlstIcons: TImageList;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    miExit: TMenuItem;
    N3: TMenuItem;
    Ver011: TMenuItem;

    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mn_FormHide: TMenuItem;
    N4: TMenuItem;
    mn_Exit: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    btnDaemonStart: TToolButton;
    ActionList1: TActionList;
    Action_Exit: TAction;
    N5: TMenuItem;
    N7: TMenuItem;
    Action_PWChange: TAction;
    Action_DaemonStart: TAction;
    Action_DaemonRestart: TAction;
    Menu_ImageList: TImageList;
    Image1: TImage;
    Action_CurrentState: TAction;
    StatusBar1: TStatusBar;
    ServerSocket1: TServerSocket;
    Action_DaemonStop: TAction;
    N19: TMenuItem;
    N20: TMenuItem;
    Action_AttendConfig: TAction;
    N21: TMenuItem;
    FileCtrl: TLMDFileCtrl;
    ADOfdmsConnection: TADOConnection;
    ADOfdms: TADOQuery;
    ADOBackupQuery: TADOQuery;
    TblImport: TADOQuery;
    QryInsert: TADOQuery;
    FolderDialog1: TFolderDialog;
    pan_gauge: TPanel;
    Ga_Tot: TGauge;
    Label1: TLabel;
    ga_Table: TGauge;
    lbl_Table: TLabel;
    ADOfdmsExec: TADOQuery;
    RelayCardServerQuery: TADOQuery;
    ADOQuery1: TADOQuery;
    SentenceSock: TApdWinsockPort;
    sentenceADOQuery: TADOQuery;
    IdFTPServer: TIdFTPServer;
    AdoConnectCheckTimer: TTimer;
    ADOfdmsQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
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
    btnKTTMonitoring: TToolButton;
    btnDDNSMonitoring: TToolButton;
    AttendADOTemp: TADOQuery;
    CardDownLoadADOQuery: TADOQuery;
    Memo1: TMemo;
    ApplicationEvents1: TApplicationEvents;
    Timer1: TTimer;
    mn_kttCodeAdmin: TMenuItem;
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
    procedure Action_DaemonStartExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Action_AttendConfigExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnKTTMonitoringClick(Sender: TObject);
    procedure btnDDNSMonitoringClick(Sender: TObject);
    procedure mn_kttCodeAdminClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure CommandArrayCommandsTKTTMONITORINGExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTDDNSMINITORINGExecute(Command: TCommand;
      Params: TStringList);

  public
    L_bClose : Boolean;
    L_bShowKttMonitoring : Boolean;
    L_bShowDDNSMonitoring : Boolean;
    L_nKTTControlServerAlarmEventCount : integer; //관제 서버 전송 알람 카운터

    procedure  AppException( Sender:  TObject;  E:  Exception) ;
  private
    FLogined: Boolean;
    //폼관련 함수
    Function  AdoConnectCheck:Boolean;
    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    Procedure MDIChildShow(FormName:String);
    Function  MDIForm(FormName:string):TForm;
  private
    Function  GetKTTControlConfig : Boolean;
    procedure KTTEventData(Sender:TObject;aGubun,aIP,aState,aTemp4 : string);
    procedure DDNSEventData(Sender:TObject;aGubun,aIP,aState,aTemp4 : string);
    Function LoadNode :Boolean;  //노드를 로드 한다.

  public
    //**************************************
    //기기정보 조회
    //**************************************
//    Function FindCommNode(aNodeNo:Integer):TCommNode; // 노드번호로 TCommnode를 찾는 function


  protected
    function TransLatePath( const APathname, homeDir: string ) : string;

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
    procedure DefaultHandler(var Message);override;  //데몬트레이 사라짐 방지
  end;

var
  fmMain: TfmMain;


implementation
uses
  uDataBaseConfig,
  uLomosUtil,
  udmAdoQuery,uCommonSql, uMDBSql, uPostGreSql, uMssql,
  UCommonModule,
  uKTTControl,
  uKTTMonitoring,
  uKTTDDNS,
  uDDNSMonitoring,
  uKTTCodeAdmin, uFireBird
  , uAttendConfig;



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





procedure TfmMain.miExitClick(Sender: TObject);
begin
  L_bClose := True;
  Close;

end;

procedure TfmMain.tbiDblClick(Sender: TObject);
begin

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
  Master_ID := 'SYSTEM';

  Application.OnException := AppException;

  NETTYPE :='TCPIP';

  Self.ModuleID := 'Main';
  ExeFolder  := ExtractFileDir(Application.ExeName);
  G_bApplicationTerminate := False;

  LogSave(ExeFolder + '\..\log\lomosHis.log','Daemon Program Start ');

  tbi.Visible := True;
  tbi.Hint := 'KTTSenderDaemon 정지';
  StatusBar1.Panels[0].Text := 'KTTSenderDaemon 정지';
  Timer1.Enabled := False;

  if G_bApplicationTerminate then Exit;



  Action_DaemonStartExecute(Self);

  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    self.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  LogoFile := ExeFolder + '\..\image\DaemonLogo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);
  DataModule1.OnAdoConnected := DataModuleAdoConnected;
  dmKTTControl.OnEvent := KTTEventData;
  dmKTTDDNS.OnEvent := DDNSEventData;

  tbi.Hint := 'FormCreate';
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

    Exit;
  End;

end;

procedure TfmMain.miShowClick(Sender: TObject);
begin

  Visible := True;
end;

procedure TfmMain.bt_HideClick(Sender: TObject);
begin
  Visible := False;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;

  Timer1.Enabled := True;

  Ver011.Caption := 'Ver ' + strBuildInfo ;


end;

//데몬 폼 HIDE
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
  L_bClose := True;
  Close;
end;

procedure TfmMain.Action_DaemonStartExecute(Sender: TObject);
var
  i : integer;
begin
  if G_bApplicationTerminate then Exit;
  Action_DaemonStart.Enabled := False;
  StatusBar1.Panels[0].Text := 'KTTSenderDaemon 기동중...';
  tbi.Hint := 'KTTSenderDaemon 기동중...';
  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('데이터베이스 접속 실패입니다. 데이터베이스 환경설정을 확인하여 주세요.');
    L_bClose := True;
    Application.Terminate;
    Exit;
  end;

  GetKTTControlConfig; //KTT관제 환경 설정 로드
  LoadNode;
  
  StatusBar1.Panels[0].Text := 'KTTSenderDaemon START';
  tbi.Hint := 'KTTSenderDaemon START';

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

(*
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
*)

procedure TfmMain.FormResize(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - statusBar1.Panels[1].Width - statusbar1.Panels[3].Width - statusbar1.Panels[4].Width - statusbar1.Panels[5].Width - statusbar1.Panels[6].Width;
end;


procedure TfmMain.Action_AttendConfigExecute(Sender: TObject);
begin
  fmAttendConfig:= TfmAttendConfig.Create(Self);
  fmAttendConfig.SHowmodal;
  fmAttendConfig.Free;
end;


procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  G_bApplicationTerminate := True;
  Delay(1000);
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


procedure TfmMain.AdoConnectCheckTimerTimer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := 'AdoConnectCheckTimer';
  AdoConnectCheckTimer.Enabled := False;
  if Not TDataBaseConfig.GetObject.DBConnected then Exit;
  if G_bApplicationTerminate then Exit;
  Visible := True;
  TDataBaseConfig.GetObject.DBConnected := False;
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

procedure TfmMain.DataModuleAdoConnected(Sender: TObject;
  DBConnected: Boolean);
begin
  if Not DBConnected then
  begin
    AdoConnectCheckTimer.Enabled := True;
  end;
end;


procedure TfmMain.FormDestroy(Sender: TObject);
begin
  tbi.Visible := False;
end;

function TfmMain.GetKTTControlConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  bDDNSUses : Boolean;
begin
  dmKTTControl.SERVERUSES := False;
  dmKTTControl.KTTServerIP := '127.0.0.1';
  dmKTTControl.KTTServerPort := 9999;
  dmKTTControl.ClientServerPort := 9999;
  L_nKTTControlServerAlarmEventCount := 50;
  bDDNSUses := False;

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
            btnDDNSMonitoring.Visible := True;
          end else
          begin
            bDDNSUses := False ;
            btnDDNSMonitoring.Visible := False;
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
      //항상 수행
      dmKTTControl.SERVERUSES := True ;
      btnKTTMonitoring.Visible := True;
      mn_kttCodeAdmin.Visible := True;
      dmKTTDDNS.DDNSUSES := bDDNSUses; //관제 통신 사용 유무 설정 후 마지막 DDNS 설정
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;


procedure TfmMain.btnKTTMonitoringClick(Sender: TObject);
begin
    MDIChildShow('TfmKTTMonitoring');

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


procedure TfmMain.btnDDNSMonitoringClick(Sender: TObject);
begin
    MDIChildShow('TfmDDNSMonitoring');

end;

procedure TfmMain.mn_kttCodeAdminClick(Sender: TObject);
begin
  fmKTTCodeAdmin:= TfmKTTCodeAdmin.Create(Self);
  fmKTTCodeAdmin.SHowmodal;
  fmKTTCodeAdmin.Free;
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
  LogSave(ExeFolder + '\..\log\DaemonApplication' + FormatDateTime('yyyymmdd',now) + '.log',sObj);

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


procedure TfmMain.CommandArrayCommandsTKTTMONITORINGExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['상태'];
   if stResult = 'TRUE' then L_bShowKttMonitoring := True
   else L_bShowKttMonitoring := False;

end;

procedure TfmMain.CommandArrayCommandsTDDNSMINITORINGExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['상태'];
   if stResult = 'TRUE' then L_bShowDDNSMonitoring := True
   else L_bShowDDNSMonitoring := False;

end;

function TfmMain.LoadNode: Boolean;
var
  stKTTID : string;

  stSql : String;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    dmKTTControl.ListClear;

    // MCU List 만 추출
    stSql := ' select a.*,b.FG_CODE from TB_ACCESSDEVICE a ';
    stSql := stSql + ' Left Join TB_FIREGROUP b ';
    stSql := stSql + ' ON( a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ) ';
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' AND a.AC_GUBUN = ''0'' ';
    stSql := stSql + ' AND a.AC_NETTYPE = ''' + NETTYPE + ''' ';
    if G_nMultiDaemon > 0 then //멀티데몬이면
    begin
      stSql := stSql + ' AND a.AC_DAEMONGUBUN = ' + inttostr(G_nDaemonGubun) + ' ';
    end;
    stSql := stSql + ' Order by a.AC_NODENO ';

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
        if G_bApplicationTerminate then Exit;
        stKTTID := FindField('AC_MUXID').AsString + FindField('AC_DECODERID').AsString + FindField('AC_LINKUSID').AsString;
        if Trim(stKTTID) <> '' then
          dmKTTControl.DeviceAdd(stKTTID,FillZeroNumber(FindField('AC_NODENO').asInteger,3));


        Next;
      end;
      dmKTTControl.LoadLastnSeq;
      close;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Result := True;
end;

end.



