unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs,IniFiles, StdCtrls, AdvGroupBox,ShellAPI,
  Buttons, ExtCtrls, ImgList, Menus,ActiveX,AdoDB,DateUtils,
  DB, ComCtrls,TlHelp32, antTaskbarIcon;

const
  con_MaxCount = 13;

type
  TServerState = class(TComponent)
    ServerPanel : TPanel;
  private
    DeviceServerCheckTimer : TTimer;
    DeviceServerManagerCheckTimer : TTimer;
    FDeviceServerManagerStart: Boolean;
    FDeviceServerStart: Boolean;
    FDecoderNumber: integer;
    FStart: Boolean;
    procedure SetDeviceServerStart(const Value: Boolean);
    procedure SetStart(const Value: Boolean);
    procedure DeviceServerCheckTimerTimer(Sender:TObject);
    procedure DeviceServerManagerCheckTimerTimer(Sender:TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    property Start : Boolean read FStart write SetStart;
    property DecoderNumber : integer read FDecoderNumber write FDecoderNumber;
    property DeviceServerStart : Boolean read FDeviceServerStart write SetDeviceServerStart;
  end;

  TfmMain = class(TForm)
    AdvGroupBox1: TAdvGroupBox;
    pm_TrayMenu: TPopupMenu;
    mn_trayVisible: TMenuItem;
    N2: TMenuItem;
    mn_trayClose: TMenuItem;
    TrayImageList: TImageList;
    TrayTimer: TTimer;
    btn_DataBaseBackupConfig: TSpeedButton;
    ADOBackupQuery: TADOQuery;
    DateTimer1: TTimer;
    MemoryClearTimer: TTimer;
    tbi: TantTaskbarIcon;
    btn_ServerRestart: TSpeedButton;
    ZDaemonServerCheck: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btn_Stop1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ServerRestartClick(Sender: TObject);
    procedure TrayTimerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mn_trayVisibleClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure mn_trayCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DateTimer1Timer(Sender: TObject);
    procedure MemoryClearTimerTimer(Sender: TObject);
    procedure ZDaemonServerCheckTimer(Sender: TObject);
  private
    L_bClose : Boolean;
    L_bDataBaseBackupLock : Boolean;
    L_bEmployeePermitLoad : Boolean;
    L_bFormActive : Boolean;
    L_bProgramAllStop : Boolean;
    L_dtDBBackupTime : TDateTime;  //데이터 베이스 백업 동작 시간
    L_stDataBaseLastBackupDate : string;
    L_stDeleteDir : string;

    ServerStateList : TStringList;
    FDate: string;
    { Private declarations }
    Function LoadIniConfig:Boolean;

    Function DataBaseTableToFileBackup(aBackupDir,aTableName:string):Boolean;
    procedure ProgramAllStart;
    procedure ProgramAllStop;
    procedure ProgramAllUpdate;
    function ProcessAllStopCheck:Boolean;
    procedure WndProc(var Message: TMessage); override;
    procedure SetDate(const Value: string);
  public
    { Public declarations }
    property Date : string read FDate write SetDate;
  end;

var
  fmMain: TfmMain;
  G_stExeFolder : string;
  G_bApplicationTerminate : Boolean;
  G_bDaemonServerRestart : Boolean;
  G_nServerStartNumber : integer;
  G_nServerEndNumber : integer;

implementation

uses
  uSharedMemory;
{$R *.dfm}


function Delay(MSecs: Longint):Boolean;
var
  Tick: DWORD;
  Event: THandle;
begin
  result := False;
  Event := CreateEvent(nil, False, False, nil);
  try
    Tick := GetTickCount + DWORD(MSecs);
    while (MSecs > 0) and
      (MsgWaitForMultipleObjects(1, Event, False, MSecs,
      QS_ALLINPUT) <> WAIT_TIMEOUT) do
    begin
      sleep(1);
      //MyProcessMessage;
      Try
        Application.ProcessMessages;
        MSecs := Tick - GetTickCount;
      Except
        Exit;
      End;
    end;
  finally
    CloseHandle(Event);
  end;
  result := True;
end;

procedure Process32List(Slist: TStringList);
var
  Process32: TProcessEntry32;
  SHandle: THandle; // the handle of the Windows object
  Next: BOOL;
begin
  Process32.dwSize := SizeOf(TProcessEntry32);
  SHandle := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);

  if Process32First(SHandle, Process32) then
  begin
    // 실행화일명과 process object 저장
    Slist.AddObject(Process32.szExeFile, TObject(Process32.th32ProcessID));
    repeat
      Next := Process32Next(SHandle, Process32);
      if Next then
        Slist.AddObject(Process32.szExeFile, TObject(Process32.th32ProcessID));
    until not Next;
  end;
  CloseHandle(SHandle); // closes an open object handle
end;


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
  //여기에서 프로그램 실행 시키자.
  if FileExists(G_stExeFolder + '\Zdaemon.exe') then
  begin
    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\Zdaemon.exe'),'','', SW_Normal);
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar(G_stExeFolder + '\GMS_AFServer.exe'),'', SW_HIDE);
//    ShellExecute(0, 'runas', pchar(G_stExeFolder + '\MyExec.exe'),pchar('"' +G_stExeFolder + '\GMS_AFServer.exe"'),'', SW_HIDE);
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



function TravelLabelItem(aPanel: TPanel; stName: string;
  no: Integer): TLabel;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to aPanel.ControlCount-1 do
  Begin
    If LowerCase(aPanel.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TLabel(aPanel.Controls[Loop]);
      exit;
    End;
  End;

end;


procedure TfmMain.btn_ServerRestartClick(Sender: TObject);
begin
  ProgramAllStop;
  ProgramAllStart;
end;

procedure TfmMain.btn_Stop1Click(Sender: TObject);
var
  nIndex : integer;
begin
  TSpeedButton(Sender).Enabled := False;
  nIndex := ServerStateList.IndexOf(inttostr(TSpeedButton(Sender).Tag));
  if nIndex > -1 then TServerState(ServerStateList.Objects[nIndex]).Start := False;
end;


procedure TfmMain.DateTimer1Timer(Sender: TObject);
begin
//  StatusBar1.Panels[0].Text := 'DateTimer1Timer';
  Date := FormatDateTime('yyyymmdd',now);
end;


procedure TfmMain.FormActivate(Sender: TObject);
begin
  L_bFormActive := True;
  DateTimer1.Enabled := True;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbi.Visible := False;
  tbi.Hint := '데몬Manager Stop';
  G_bApplicationTerminate := True;    //프로그램 Stop 후 종료

  ProgramAllStop;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if L_bClose = False then
  begin
    CanClose := False;
    Hide();
    WindowState := wsMinimized;
  end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  G_bApplicationTerminate := False;
  L_bFormActive := False;
  L_bDataBaseBackupLock := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  LoadIniConfig;
  ServerStateList := TStringList.Create;

 
  LoadIniConfig;

  TrayTimer.Enabled := True;
end;

function TfmMain.LoadIniConfig: Boolean;
var
  ini_fun : TiniFile;
begin
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Config.INI');

  Finally
    ini_fun.Free;
  End;

end;


procedure TfmMain.MemoryClearTimerTimer(Sender: TObject);
var
  hProcess:THandle;
begin
  inherited;
//워킹 셋 메모리 Clear;
  hProcess := OpenProcess(PROCESS_SET_QUOTA,false,GetCurrentProcessId);   //메모리 누수에 도움이 될까?
  try
    SetProcessWorkingSetSize(hProcess, $FFFFFFFF, $FFFFFFFF);
  finally
    CloseHandle(hProcess);
  end;

end;

procedure TfmMain.mn_trayCloseClick(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.mn_trayVisibleClick(Sender: TObject);
begin
  TrayIcon1DblClick(self);
end;


function TfmMain.ProcessAllStopCheck: Boolean;
var
  i : integer;
begin
  result := True;
  if ServerStateList.Count < 1 then
  begin
    Exit;
  end;
  for i := 0 to ServerStateList.Count - 1 do
  begin
    if TServerState(ServerStateList.Objects[i]).DeviceServerManagerStart then
    begin
      result := False;
      Exit;
    end;
  end;
end;

procedure TfmMain.ProgramAllStart;
var
  nCount : integer;
  i : integer;
begin
  ZDaemonProcessStart;
  if G_nServerStartNumber = 0 then Exit;

  nCount := G_nServerEndNumber - G_nServerStartNumber + 1;

  if nCount < 1 then Exit;

  if nCount > con_MaxCount then nCount := con_MaxCount;
  for i := 0 to ServerStateList.Count - 1 do
  begin
    TServerState(ServerStateList.Objects[i]).Start := True;
    while Not TServerState(ServerStateList.Objects[i]).DeviceServerManagerStart do
    begin
      if G_bApplicationTerminate then Exit;

      Delay(10);
      Application.ProcessMessages;
    end;
    Delay(3000);
  end;
end;

procedure TfmMain.ProgramAllStop;
var
  nCount : integer;
  i : integer;
begin
  ZDaemonProcessStop;

  nCount := G_nServerEndNumber - G_nServerStartNumber + 1;

  if nCount < 1 then Exit;

  if nCount > con_MaxCount then nCount := con_MaxCount;
  for i := 0 to ServerStateList.Count - 1 do
  begin
    TServerState(ServerStateList.Objects[i]).Start := False;
  end;
  while Not ProcessAllStopCheck do
  begin
    if G_bApplicationTerminate then Exit;
    sleep(100);
    Application.ProcessMessages;
  end;

end;

procedure TfmMain.ProgramAllUpdate;
var
  i : integer;
  ini_fun : TiniFile;
begin
  if ServerStateList.Count < 1 then Exit;
  for i := 0 to ServerStateList.Count - 1 do
  begin
    if not DirectoryExists(G_stExeFolder + '\' + ServerStateList.Strings[i]) then
    begin
     if Not CreateDir(G_stExeFolder + '\' + ServerStateList.Strings[i]) then
     begin
     end;
    end;
    if CopyFile(pchar(G_stExeFolder + '\GMS_DeviceServer.exe'), pchar(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\GMS_DeviceServer' + ServerStateList.Strings[i] + '.exe' ), False) then
    begin

    end;
    if CopyFile(pchar(G_stExeFolder + '\GMS_DeviceServerManager.exe'), pchar(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\GMS_DeviceServerManager' + ServerStateList.Strings[i] + '.exe' ), False) then
    begin

    end;
    if CopyFile(pchar(G_stExeFolder + '\MyExec.exe'), pchar(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\MyExec.exe' ), False) then
    begin

    end;
    if CopyFile(pchar(G_stExeFolder + '\Config.ini'), pchar(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\Config.ini' ), False) then
    begin
      Try
        ini_fun := TiniFile.Create(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\Config.ini');
        ini_fun.WriteInteger('DECODER','NO',strtoint(ServerStateList.Strings[i]));
      Finally
        ini_fun.Free;
      End;

    end;
    if CopyFile(pchar(G_stExeFolder + '\MIAMS.INI'), pchar(G_stExeFolder + '\' + ServerStateList.Strings[i] + '\MIAMS.INI' ), False) then
    begin

    end;

  end;

end;


procedure TfmMain.SetDate(const Value: string);
begin
  if FDate = Value then Exit;

  FDate := Value;
  if G_bDaemonServerRestart then btn_ServerRestartClick(btn_ServerRestart);
end;

procedure TfmMain.trayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  Show();
  WindowState := wsNormal;
  Application.BringToFront();

end;

procedure TfmMain.trayTimerTimer(Sender: TObject);
var
  nCount : integer;
begin
  if G_bApplicationTerminate then Exit;
  if Not L_bFormActive then Exit;

  TrayTimer.Enabled := False;
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  tbi.Visible := True;
  tbi.Show;

  L_bProgramAllStop := False;

  ProgramAllStop;
  ProgramAllUpdate;
  Date := FormatDateTime('yyyymmdd',now);
  if Not G_bDaemonServerRestart then
  begin
    btn_ServerRestartClick(btn_ServerRestart);
  end;
(*  while Not L_bProgramAllStop do
  begin
    if L_bApplicationTerminate then Exit;
    sleep(1);
    Application.ProcessMessages;
  end;
*)
  //btn_PGUpdateClick(btn_PGUpdate);
  //btn_ServerRestartClick(btn_PGUpdate);
end;

procedure TfmMain.WndProc(var Message: TMessage);
begin
  inherited;
  if Message.Msg=WM_ENDSESSION then begin
    if Not G_bApplicationTerminate then
    begin
      L_bClose := True;
      Close;
    end;
  end else if Message.Msg = WM_QUERYENDSESSION then begin
    if Not G_bApplicationTerminate then
    begin
      L_bClose := True;
      Close;
    end;
    Message.Result := 1;
  end;
end;

{ TServerState }

constructor TServerState.Create(AOwner: TComponent);
begin
  inherited;
  DeviceServerCheckTimer := TTimer.Create(nil);
  DeviceServerCheckTimer.Interval := 1000;
  DeviceServerCheckTimer.OnTimer := DeviceServerCheckTimerTimer;
  DeviceServerCheckTimer.Enabled := True;

  DeviceServerManagerCheckTimer := TTimer.Create(nil);
  DeviceServerManagerCheckTimer.Interval := 1000;
  DeviceServerManagerCheckTimer.OnTimer := DeviceServerManagerCheckTimerTimer;
  DeviceServerManagerCheckTimer.Enabled := True;

end;

destructor TServerState.Destroy;
begin
  DeviceServerCheckTimer.Enabled := False;
  DeviceServerManagerCheckTimer.Enabled := False;
  inherited;
end;

procedure TServerState.DeviceServerCheckTimerTimer(Sender: TObject);
begin
end;

procedure TServerState.DeviceServerManagerCheckTimerTimer(Sender: TObject);
begin

end;

procedure TServerState.SetDeviceServerStart(const Value: Boolean);
begin
  FDeviceServerStart := Value;
end;

procedure TServerState.SetStart(const Value: Boolean);
begin
  FStart := Value;
  if Not Value then
  begin
    DeviceServerManagerProcessStop(DecoderNumber);
    DeviceServerProcessStop(DecoderNumber);
  end
  else
  begin
    //DeviceServerManagerProcessStart(DecoderNumber);
    DeviceServerProcessStart(DecoderNumber);
  end;
end;

procedure TfmMain.ZDaemonServerCheckTimer(Sender: TObject);
begin
  if Not ZDaemonCheck then
  begin
    ZDaemonProcessStart;
  end;
end;

end.
