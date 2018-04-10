(*
  Copyright (C) 2004 NeoNetSoft Corp. All rights reserved.
  Kwak Chung-Youl : Director & Chief Architect
  url:  http://www.neonetsoft.com
  mail: misoin@hanmail.net
  ----------------------------------------------------------
  < Modify > (format: name, date, comments)


  ** SSL 을 사용하기 위해 libeay32.dll, libssl32.dll, ssleay32.dll 필요함
*)

unit MHttpWorker;

interface

uses
  Classes, SysUtils, Windows, Messages, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdAuthentication,
  IdHeaderList, IdAntiFreezeBase, IdAntiFreeze, SyncObjs,
  IdIOHandlerSocket, IdSSLOpenSSL, IdURI;

const
  UPLOAD_SUCCESS = '201';  // HTTP/1.1 201 Created

type
  EHttpWorker = class(Exception);

  TMHttpWorker = class;

  TWorkerType = (wtUpload, wtDownload);
  TCompleteAction = (caNull, caFail, caSuccess);

  TWorkCompleteEvent = procedure(Worker: TMHttpWorker; CompleteAction: TCompleteAction) of object;
  TWorkChangeFileNameEvent = procedure(Worker: TMHttpWorker; const OldFileName: string; const NewFileName: string) of object;
  TWorkHttpConnectedEvent = procedure(Worker: TMHttpWorker) of object;
  TWorkHttpDisconnectedEvent = procedure(Worker: TMHttpWorker) of object;
  TWorkHttpStatusEvent = procedure(Worker: TMHttpWorker; const AStatus: TIdStatus; const AStatusText: String) of object;
  TWorkHttpProgressEvent = procedure(Worker: TMHttpWorker; AWorkMode: TWorkMode; const AWorkCount: Integer) of object;
  TWorkHttpBeginEvent = procedure(Worker: TMHttpWorker; AWorkMode: TWorkMode; const AWorkCountMax: Integer) of object;
  TWorkHttpEndEvent = procedure(Worker: TMHttpWorker; AWorkMode: TWorkMode) of object;
  TWorkHttpExceptionEvent = procedure(Worker: TMHttpWorker; const Msg: string; AHelpContext: Integer) of object;
              
  TMHttpWorker = class(TComponent)
  private
    FCurrentIndex: Integer;
    FFileList: TStringList;
  public
    procedure ClearFile;
    procedure AddFile(const ServerFile, LocalFile: string);
    property CurrentIndex: Integer read FCurrentIndex write FCurrentIndex;
    property FileList: TStringList read FFileList;
  private
    { Private declarations }
    FWorkType: TWorkerType;
    FUserName, FUserPassword: string;
    FIsChangeFileNameDuplicate: boolean;
    FThread: TThread;
    FWindow: HWND;
    FCancellationPending: boolean;
    FIsCancelled: boolean;
    FPriority: TThreadPriority;
    FCountPerSleep: Integer;
    FOnWorkComplete: TWorkCompleteEvent;
    FOnWorkChangeFileName: TWorkChangeFileNameEvent;
    FOnWorkHttpConnected: TWorkHttpConnectedEvent;
    FOnWorkHttpDisconnected: TWorkHttpDisconnectedEvent;
    FOnWorkHttpStatus: TWorkHttpStatusEvent;
    FOnWorkHttpProgress: TWorkHttpProgressEvent;
    FOnWorkHttpBegin: TWorkHttpBeginEvent;
    FOnWorkHttpEnd: TWorkHttpEndEvent;
    FOnWorkHttpException: TWorkHttpExceptionEvent;
    procedure WindowCallback(var Message: TMessage);
    function GetWorking: boolean;
    function GetThreadID: DWORD;
  protected
    { Protected declarations }
    property Thread: TThread read FThread;
    property Window: HWND read FWindow;
    procedure DoWorkComplete(CompleteAction: TCompleteAction); virtual;
    procedure DoWorkChangeFileName(const OldFileName: string; const NewFileName: string); virtual;
    procedure DoWorkHttpConnected; virtual;
    procedure DoWorkHttpDisconnected; virtual;
    procedure DoWorkHttpStatus(const AStatus: TIdStatus; const AStatusText: String); virtual;
    procedure DoWorkHttpProgress(AWorkMode: TWorkMode; const AWorkCount: Integer); virtual;
    procedure DoWorkHttpBegin(AWorkMode: TWorkMode; const AWorkCountMax: Integer); virtual;
    procedure DoWorkHttpEnd(AWorkMode: TWorkMode); virtual;
    procedure DoWorkHttpException(const Msg: string; AHelpContext: Integer); virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure Execute;
    procedure Cancel;
    procedure WaitFor;
    procedure ReportProgress(AWorkMode: TWorkMode; const AWorkCount: Integer);
    procedure AcceptCancellation;
    property CancellationPending: boolean read FCancellationPending;
    property IsCancelled: boolean read FIsCancelled;
    property IsWorking: boolean read GetWorking;
    property ThreadID: DWORD read GetThreadID;
  published
    { Published declarations }
    property WorkType: TWorkerType read FWorkType write FWorkType;// default wtDownload;
    property UserName: string read FUserName write FUserName;
    property UserPassword: string read FUserPassword write FUserPassword;
    property IsChangeFileNameDuplicate: boolean read FIsChangeFileNameDuplicate write FIsChangeFileNameDuplicate;// default True;
    property Priority: TThreadPriority read FPriority write FPriority;// default tpNormal;
    property CountPerSleep: Integer read FCountPerSleep write FCountPerSleep;
    property OnWorkComplete: TWorkCompleteEvent read FOnWorkComplete write FOnWorkComplete;
    property OnWorkChangeFileName: TWorkChangeFileNameEvent read FOnWorkChangeFileName write FOnWorkChangeFileName;
    property OnWorkHttpConnected: TWorkHttpConnectedEvent read FOnWorkHttpConnected write FOnWorkHttpConnected;
    property OnWorkHttpDisconnected: TWorkHttpDisconnectedEvent read FOnWorkHttpDisconnected write FOnWorkHttpDisconnected;
    property OnWorkHttpStatus: TWorkHttpStatusEvent read FOnWorkHttpStatus write FOnWorkHttpStatus;
    property OnWorkHttpProgress: TWorkHttpProgressEvent read FOnWorkHttpProgress write FOnWorkHttpProgress;
    property OnWorkHttpBegin: TWorkHttpBeginEvent read FOnWorkHttpBegin write FOnWorkHttpBegin;
    property OnWorkHttpEnd: TWorkHttpEndEvent read FOnWorkHttpEnd write FOnWorkHttpEnd;
    property OnWorkHttpException: TWorkHttpExceptionEvent read FOnWorkHttpException write FOnWorkHttpException;
  end;

procedure Register;

implementation

{$IF NOT DECLARED(AllocateHWnd)}
uses Forms;
{$IFEND}

procedure Register;
begin
  RegisterComponents('Misoin', [TMHttpWorker]);
end;

const
  SInvalidCall = 'You must call ''%s.%s'' only inside the OnWork event handler';
  SInvalidExit = 'Before closing the application, ''%s'' must be stopped';
  SInvalidRun = 'The HttpWorker named ''%s'' is already running';

const
  WM_WORK_COMPLETE = WM_USER + 1;
  WM_WORK_CHANGEFILENAME = WM_USER + 2;
  WM_WORK_HTTP_CONNECTED = WM_USER + 3;
  WM_WORK_HTTP_DISCONNECTED = WM_USER + 4;
  WM_WORK_HTTP_STATUS = WM_USER + 5;
  WM_WORK_HTTP_PROGRESS = WM_USER + 6;
  WM_WORK_HTTP_BEGIN = WM_USER + 7;
  WM_WORK_HTTP_END = WM_USER + 8;
  WM_WORK_HTTP_EXCEPTION = WM_USER + 9;

type
  PWinHttpCurrentUserIeProxyConfig = ^TWinHttpCurrentUserIeProxyConfig;
  TWinHttpCurrentUserIeProxyConfig = record
    fAutoDetect: boolean;
    lpszAutoConfigUrl: PWideChar;
    lpszProxy: PWideChar;
    lpszProxyBypass: PWideChar;
  end;     

function GetIEProxy(out ProxyConfig: TWinHttpCurrentUserIeProxyConfig): boolean;
type
  TWinHttpGetIeProxyConfigForCurrentUser = function (pProxyConfig: PWinHttpCurrentUserIeProxyConfig): boolean; stdcall;
var
  H: Cardinal;
  WinHttpGetIeProxyConfigForCurrentUser: TWinHttpGetIeProxyConfigForCurrentUser;
begin
  Result := False;
  H := LoadLibrary('winhttp.dll');
  if H = 0 then Exit;
  try
    @WinHttpGetIeProxyConfigForCurrentUser := GetProcAddress(H, 'WinHttpGetIEProxyConfigForCurrentUser');
    if Assigned (WinHttpGetIeProxyConfigForCurrentUser) then begin
      Result := WinHttpGetIeProxyConfigForCurrentUser(@ProxyConfig);
    end;
  finally
    FreeLibrary (H);
  end;
end;

const
  EQUAL = '=';                      // =
  EQUAL_ENCODE = '%61';             // EQUAL와 같은 문자에 대한 대체값
  PERCENT = '%';                    // %
  PERCENT_ENCODE = '%25';           // PERCENT와 같은 문자에 대한 대체값

procedure ReplaceString(var S: string; OldPattern, NewPattern: string);
var
  TmpStr: string;
  TmpPos, TmpLenMinus1 : Integer;
begin
  TmpPos := Pos(OldPattern, S);
  if TmpPos = 0 then Exit;
  TmpStr := S;
  S := '';
  TmpLenMinus1 := Length(OldPattern) - 1;
  while TmpPos > 0 do begin
    S := S + Copy(TmpStr, 1, TmpPos - 1) + NewPattern;
    Delete(TmpStr, 1, TmpPos + TmpLenMinus1);
    TmpPos := Pos(OldPattern, TmpStr);
    if TmpPos = 0 then begin
      S := S + TmpStr;
      Break;
    end;
  end;
end;

function EncodeEQUAL(const AStr: string): string;
begin
  Result := AStr;
  ReplaceString(Result, PERCENT, PERCENT_ENCODE);
  ReplaceString(Result, EQUAL, EQUAL_ENCODE);
end;

function DecodeEQUAL(const AStr: string): string;
begin
  Result := AStr;
  ReplaceString(Result, EQUAL_ENCODE, EQUAL);
  ReplaceString(Result, PERCENT_ENCODE, PERCENT);
end;

function FileNameChangeDuplicate(FName: TFileName): TFileName;
var
  I : Integer;
  TmpFileName, TmpFileExt : String;
begin
  I:= 1;
  Result:= FName;
  TmpFileExt := ExtractFileExt(FName);
  while FileExists(Result) do begin
    TmpFileName := Copy(FName, 0, Pos(TmpFileExt, FName)-1);
    Result := Concat(TmpFileName,'(',IntToStr(I),')',TmpFileExt);
    I := I + 1;
  end;
end;

{ THttpWorkerThread }

type
  THttpWorkerThread = class(TThread)
  private
    FOwner: TMHttpWorker;
  private
    FIdHttp: TIdHTTP;
    FIdSSLIOHandlerSocket: TIdSSLIOHandlerSocket;   // libeay32.dll, libssl32.dll, ssleay32.dll 필요함
    //FIdAntiFreeze: TIdAntiFreeze;
    FWorkCount: Integer;
    procedure OnIdHttpConnected(Sender: TObject);
    procedure OnIdHttpDisconnected(Sender: TObject);
    procedure OnIdHttpAuthorization(Sender: TObject;
      Authentication: TIdAuthentication; var Handled: Boolean);
    procedure OnIdHttpProxyAuthorization(Sender: TObject;
      Authentication: TIdAuthentication; var Handled: Boolean);
    procedure OnIdHttpRedirect(Sender: TObject; var dest: String;
      var NumRedirect: Integer; var Handled: Boolean;
      var VMethod: TIdHTTPMethod);
    procedure OnIdHttpSelectAuthorization(Sender: TObject;
      var AuthenticationClass: TIdAuthenticationClass;
      AuthInfo: TIdHeaderList);
    procedure OnIdHttpSelectProxyAuthorization(Sender: TObject;
      var AuthenticationClass: TIdAuthenticationClass;
      AuthInfo: TIdHeaderList);
    procedure OnIdHttpStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure OnIdHttpWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure OnIdHttpWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure OnIdHttpWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
    procedure DoWorkComplete(CompleteAction: TCompleteAction);
    procedure DoWorkChangeFileName(const OldFileName: string; const NewFileName: string); 
    procedure DoWorkHttpException(const Msg: string; AHelpContext: Integer); virtual;
  protected
    procedure DoWork; virtual; abstract;
  public
    constructor CreateWorker(AOwner: TMHttpWorker);
    procedure Execute; override;
    destructor Destroy; override;
  end;

constructor THttpWorkerThread.CreateWorker(AOwner: TMHttpWorker);
var
  ProxyConfig: TWinHttpCurrentUserIeProxyConfig;
  Index: Integer;
  ProxyUser, ProxyPasswd, ProxyServer: WideString;
  ProxyPort: Integer;
  IsProxy: Boolean;
begin
  FOwner := AOwner;
  Create(True);
  Priority := FOwner.Priority;
  FreeOnTerminate := True;
  ProxyUser := '';
  ProxyPasswd := '';
  ProxyServer := '';
  ProxyPort := 80;
  IsProxy := False;
  if GetIEProxy(ProxyConfig) and (not ProxyConfig.fAutoDetect) and (ProxyConfig.lpszProxy <> '') then begin
    Index := Pos(':', ProxyConfig.lpszProxy);
    if Index <> 0 then begin
      ProxyServer := Copy(ProxyConfig.lpszProxy, 1, Index-1);
      ProxyPort := StrToIntDef(Copy(ProxyConfig.lpszProxy, Index+1, Length(ProxyConfig.lpszProxy)), 80);
      ProxyUser := '';
      ProxyPasswd := '';
      IsProxy := True;
    end;
  end;
  //FIdAntiFreeze := TIdAntiFreeze.Create(FOwner);
  FIdSSLIOHandlerSocket := TIdSSLIOHandlerSocket.Create(FOwner);
  FIdHttp := TIdHTTP.Create(FOwner);
  with FIdHttp do begin
    AllowCookies := False;
    Request.Username := FOwner.UserName;
    Request.Password := FOwner.UserPassword;
    Request.BasicAuthentication := (Request.Username <> '') and (Request.Password <> '');
    Request.UserAgent := 'Mozilla/4.0';//'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)';
    Request.Accept := '*/*';
    if IsProxy then begin
      with ProxyParams do begin
        ProxyServer := ProxyServer;
        ProxyPort := ProxyPort;
        ProxyUsername := ProxyUser;
        ProxyPassword := ProxyPassword;
        BasicAuthentication := (ProxyUsername <> '') and (ProxyPassword <> '');
      end;
    end;
    OnConnected := OnIdHttpConnected;
    OnDisconnected := OnIdHttpDisconnected;
    OnAuthorization := OnIdHttpAuthorization;
    OnProxyAuthorization := OnIdHttpProxyAuthorization;
    OnSelectAuthorization := OnIdHttpSelectAuthorization;
    OnSelectProxyAuthorization := OnIdHttpSelectProxyAuthorization;
    OnRedirect := OnIdHttpRedirect;
    OnStatus := nil;//OnIdHttpStatus;
    OnWork := OnIdHttpWork;
    OnWorkBegin := OnIdHttpWorkBegin;
    OnWorkEnd := OnIdHttpWorkEnd;
  end;
  FWorkCount := 0;
end;

destructor THttpWorkerThread.Destroy;
begin
  if Assigned(FIdHttp) then begin
    FIdHttp.Disconnect;
    FIdHttp.Free;
    FIdHttp := nil;
  end;
  if Assigned(FIdSSLIOHandlerSocket) then begin
    FIdSSLIOHandlerSocket.Free;
    FIdSSLIOHandlerSocket := nil;
  end;
  //if Assigned(FIdAntiFreeze) then begin
  //  FIdAntiFreeze.Free;
  //  FIdAntiFreeze := nil;
  //end;
  inherited;
end;

procedure THttpWorkerThread.Execute;
var
  CA: TCompleteAction;
begin
  inherited;
  try
    try
      DoWork;
    except
      on E: Exception do begin
        if Pos('201 Created', E.Message) = 0 then begin  // 201 Created
          FOwner.AcceptCancellation;
          DoWorkHttpException(E.Message, E.HelpContext);
          //ShowException(ExceptObject, ExceptAddr);
        end;
      end;
    end;
  finally
    if FOwner.IsCancelled then CA := caFail
    else CA := caSuccess;
    DoWorkComplete(CA); //PostMessage(FOwner.Window, WM_WORK_COMPLETE, Integer(Ord(CA)), 0);
  end;
end;

procedure THttpWorkerThread.DoWorkComplete(
  CompleteAction: TCompleteAction);
begin
  PostMessage(FOwner.Window, WM_WORK_COMPLETE, Integer(Ord(CompleteAction)), 0);
end;

procedure THttpWorkerThread.DoWorkChangeFileName(const OldFileName,
  NewFileName: string);
var
  wP, lP: PChar;
begin
  wP := StrNew(PChar(OldFileName));
  lP := StrNew(PChar(NewFileName));
  PostMessage(FOwner.Window, WM_WORK_CHANGEFILENAME, Integer(wP), Integer(lP));
end;

procedure THttpWorkerThread.DoWorkHttpException(const Msg: string;
  AHelpContext: Integer);
var
  wP: PChar;
begin
  wP := StrNew(PChar(Msg));
  PostMessage(FOwner.Window, WM_WORK_HTTP_EXCEPTION, Integer(wP), Integer(AHelpContext));
end;

procedure THttpWorkerThread.OnIdHttpAuthorization(Sender: TObject;
  Authentication: TIdAuthentication; var Handled: Boolean);
begin
//
end;

procedure THttpWorkerThread.OnIdHttpConnected(Sender: TObject);
begin
  PostMessage(FOwner.Window, WM_WORK_HTTP_CONNECTED, 0, 0);
end;

procedure THttpWorkerThread.OnIdHttpDisconnected(Sender: TObject);
begin
  PostMessage(FOwner.Window, WM_WORK_HTTP_DISCONNECTED, 0, 0);
end;

procedure THttpWorkerThread.OnIdHttpProxyAuthorization(Sender: TObject;
  Authentication: TIdAuthentication; var Handled: Boolean);
begin
//
end;

procedure THttpWorkerThread.OnIdHttpRedirect(Sender: TObject;
  var dest: String; var NumRedirect: Integer; var Handled: Boolean;
  var VMethod: TIdHTTPMethod);
begin
//
end;

procedure THttpWorkerThread.OnIdHttpSelectAuthorization(Sender: TObject;
  var AuthenticationClass: TIdAuthenticationClass;
  AuthInfo: TIdHeaderList);
begin
//
end;

procedure THttpWorkerThread.OnIdHttpSelectProxyAuthorization(
  Sender: TObject; var AuthenticationClass: TIdAuthenticationClass;
  AuthInfo: TIdHeaderList);
begin
//
end;

procedure THttpWorkerThread.OnIdHttpStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
var
  wP, lP: PChar;
begin
  wP := StrNew(PChar(AStatus));
  lP := StrNew(PChar(AStatusText));
  PostMessage(FOwner.Window, WM_WORK_HTTP_STATUS, Integer(wP), Integer(lP));
end;

procedure THttpWorkerThread.OnIdHttpWork(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
  if FOwner.CountPerSleep > 0 then begin
    Inc(FWorkCount);
    if FWorkCount mod FOwner.CountPerSleep = 0 then begin
      FWorkCount := 0;
      Sleep(1);  // CPU 점유를 낮추기 위해..
    end;
  end
  else begin
    Sleep(1);
  end;
  if FOwner.CancellationPending then begin
    FOwner.AcceptCancellation;
    Exit;
  end;
  PostMessage(FOwner.Window, WM_WORK_HTTP_PROGRESS, Integer(Ord(AWorkMode)), Integer(AWorkCount));
end;

procedure THttpWorkerThread.OnIdHttpWorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  PostMessage(FOwner.Window, WM_WORK_HTTP_BEGIN, Integer(Ord(AWorkMode)), Integer(AWorkCountMax));
end;

procedure THttpWorkerThread.OnIdHttpWorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
  PostMessage(FOwner.Window, WM_WORK_HTTP_END, Integer(Ord(AWorkMode)), 0);
end;

{ THttpUploadWorkerThread }

type
  THttpUploadWorkerThread = class(THttpWorkerThread)
  protected
    procedure DoWork; override;
  public
    constructor CreateWorker(AOwner: TMHttpWorker);
  end;

constructor THttpUploadWorkerThread.CreateWorker(AOwner: TMHttpWorker);
begin
  inherited CreateWorker(AOwner);
end;

procedure THttpUploadWorkerThread.DoWork;
var
  TmpServerFileName, TmpFileName: string;
  FS: TFileStream;
  LURI: TIdURI;
begin
  while not Terminated do begin
    with FOwner do begin
      if CurrentIndex = FileList.Count then Exit;
      with FIdHttp do begin
        TmpFileName := DecodeEQUAL(FileList.ValueFromIndex[CurrentIndex]);
        if FileExists(TmpFileName) then begin
          FS := TFileStream.Create(TmpFileName, fmOpenRead+fmShareDenyNone);
          try
            TmpServerFileName := DecodeEQUAL(FileList.Names[CurrentIndex]);
            LURI := TIdURI.Create(TmpServerFileName);
            try
              if AnsiSameText(LURI.Protocol, 'https') then IOHandler := FIdSSLIOHandlerSocket
              else IOHandler := nil;
              Put(TmpServerFileName, FS);
            finally
              LURI.Free;
            end;
          finally
            FS.Free;
          end;
        end;
        CurrentIndex := CurrentIndex + 1;
      end;
    end;
  end;
end;

{ THttpDownloadWorkerThread }

type
  THttpDownloadWorkerThread = class(THttpWorkerThread)
  private
    FIsChangeFileNameDuplicate: boolean;
  protected
    procedure DoWork; override;
  public
    constructor CreateWorker(AOwner: TMHttpWorker; AIsChangeFileNameDuplicate: boolean);
  end;

constructor THttpDownloadWorkerThread.CreateWorker(AOwner: TMHttpWorker; AIsChangeFileNameDuplicate: boolean);
begin
  inherited CreateWorker(AOwner);
  FIsChangeFileNameDuplicate := AIsChangeFileNameDuplicate;
end;

procedure THttpDownloadWorkerThread.DoWork;
var
  TmpServerFileName, TmpFileName: string;
  FS: TFileStream;
  LURI: TIdURI;
begin
  while not Terminated do begin
    with FOwner do begin
      if CurrentIndex = FileList.Count then Exit;
      with FIdHttp do begin
        if FIsChangeFileNameDuplicate then TmpFileName := FileNameChangeDuplicate(DecodeEQUAL(FileList.ValueFromIndex[CurrentIndex]))
        else TmpFileName := DecodeEQUAL(FileList.ValueFromIndex[CurrentIndex]);
        //if TmpFileName <> DecodeEQUAL(FileList.ValueFromIndex[CurrentIndex]) then
          DoWorkChangeFileName(DecodeEQUAL(FileList.ValueFromIndex[CurrentIndex]), TmpFileName);
        FS := TFileStream.Create(TmpFileName, fmCreate);
        try
          TmpServerFileName := DecodeEQUAL(FileList.Names[CurrentIndex]);
          LURI := TIdURI.Create(TmpServerFileName);
          try
            if AnsiSameText(LURI.Protocol, 'https') then IOHandler := FIdSSLIOHandlerSocket
            else IOHandler := nil;
            Get(TmpServerFileName, FS);
          finally
            LURI.Free;
          end;
        finally
          FS.Free;
        end;
        CurrentIndex := CurrentIndex + 1;
      end;
    end;
  end;
end;

{ TMHttpWorker }

procedure TMHttpWorker.AcceptCancellation;
begin
  if ThreadID = GetCurrentThreadId then begin
    FIsCancelled := True;
    FCancellationPending := False;
    if Assigned(THttpWorkerThread(FThread).FIdHttp) and THttpWorkerThread(FThread).FIdHttp.Connected then THttpWorkerThread(FThread).FIdHttp.Disconnect;
  end
  else
    raise EHttpWorker.CreateFmt(SInvalidCall, [Name, 'AcceptCancellation']);
end;

procedure TMHttpWorker.AddFile(const ServerFile, LocalFile: string);
begin
  if not Assigned(FFileList) then FFileList := TStringList.Create;
  FFileList.Add(EncodeEQUAL(ServerFile)+'='+EncodeEQUAL(LocalFile));
end;

procedure TMHttpWorker.Cancel;
begin
  if IsWorking then
    FCancellationPending := True;
end;

procedure TMHttpWorker.ClearFile;
begin
  if not IsWorking then
    if Assigned(FFileList) then begin
      CurrentIndex := 0;
      FFileList.Clear;
    end;
end;

constructor TMHttpWorker.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPriority := tpNormal;
  FWorkType := wtDownload;
  FIsChangeFileNameDuplicate := True;
  FCurrentIndex := 0;
  FFileList := TStringList.Create;
  FCountPerSleep := 5;
end;

destructor TMHttpWorker.Destroy;
begin
  if IsWorking then begin
    TerminateThread(FThread.Handle, 0);
    raise EHttpWorker.CreateFmt(SInvalidExit, [Name]); 
  end;
  if Assigned(FFileList) then begin
    FFileList.Free;
    FFileList := nil;
  end;  
  inherited;
end;

procedure TMHttpWorker.DoWorkChangeFileName(const OldFileName,
  NewFileName: string);
begin
  if Assigned(FOnWorkChangeFileName) then
    FOnWorkChangeFileName(Self, OldFileName, NewFileName);
end;

procedure TMHttpWorker.DoWorkComplete(CompleteAction: TCompleteAction);
begin
  if Assigned(FOnWorkComplete) then
    FOnWorkComplete(Self, CompleteAction);
end;

procedure TMHttpWorker.DoWorkHttpBegin(AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  if Assigned(FOnWorkHttpBegin) then
    FOnWorkHttpBegin(Self, AWorkMode, AWorkCountMax);
end;

procedure TMHttpWorker.DoWorkHttpConnected;
begin
  if Assigned(FOnWorkHttpConnected) then
    FOnWorkHttpConnected(Self);
end;

procedure TMHttpWorker.DoWorkHttpDisconnected;
begin
  if Assigned(FOnWorkHttpDisconnected) then
    FOnWorkHttpDisconnected(Self);
end;

procedure TMHttpWorker.DoWorkHttpEnd(AWorkMode: TWorkMode);
begin
  if Assigned(FOnWorkHttpEnd) then
    FOnWorkHttpEnd(Self, AWorkMode);
end;

procedure TMHttpWorker.DoWorkHttpException(const Msg: string;
  AHelpContext: Integer);
begin
  if Assigned(FOnWorkHttpException) then
    FOnWorkHttpException(Self, Msg, AHelpContext);
end;

procedure TMHttpWorker.DoWorkHttpProgress(AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  if Assigned(FOnWorkHttpProgress) then
    FOnWorkHttpProgress(Self, AWorkMode, AWorkCount);
end;

procedure TMHttpWorker.DoWorkHttpStatus(const AStatus: TIdStatus;
  const AStatusText: String);
begin
  if Assigned(FOnWorkHttpStatus) then
    FOnWorkHttpStatus(Self, AStatus, AStatusText);
end;

procedure TMHttpWorker.Execute;
begin
  if not IsWorking then begin
    FIsCancelled := False;
    FCancellationPending := False;
    FWindow := AllocateHWnd(WindowCallback);
    try
      if FWorkType = wtUpload then
        FThread := THttpUploadWorkerThread.CreateWorker(Self)
      else
        FThread := THttpDownloadWorkerThread.CreateWorker(Self, FIsChangeFileNameDuplicate);
      FThread.Resume;
    except
      DeallocateHWnd(FWindow);
      FWindow := 0;
      FThread := nil;
    end;
  end
  else
    raise EHttpWorker.CreateFmt(SInvalidRun, [Name]);
end;

function TMHttpWorker.GetThreadID: DWORD;
begin
  if Assigned(FThread) then Result := FThread.ThreadID
  else Result := 0;
end;

function TMHttpWorker.GetWorking: boolean;
begin
  Result := Assigned(FThread);
end;

procedure TMHttpWorker.ReportProgress(AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  if ThreadID = GetCurrentThreadId then
    PostMessage(FWindow, WM_WORK_HTTP_PROGRESS, Integer(Ord(AWorkMode)), Integer(AWorkCount))
  else
    raise EHttpWorker.CreateFmt(SInvalidCall, [Name, 'ReportProgress']);
end;

procedure TMHttpWorker.WaitFor;
var
  Msg: TMSG;
begin
  while IsWorking do begin
    if PeekMessage(Msg, FWindow, 0, 0, PM_REMOVE) then begin
      if Msg.message <> WM_WORK_HTTP_PROGRESS then begin
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;
    end;
  end;
end;

{
var
  wP, lP: PChar;
begin
  wP := StrNew(PChar(wParam));
  lP := StrNew(PChar(lParam));
  PostMessage(Handle, WM_THREAD_MESSAGEBOX, Integer(wP), Integer(lP));
  ..
  ..
  try
    TmpStr := PChar(WParam);
    TmpStr := PChar(LParam);
  finally
    if wParam <> 0 then StrDispose(PChar(wParam));
    if lParam <> 0 then StrDispose(PChar(lParam));
  end;
}
procedure TMHttpWorker.WindowCallback(var Message: TMessage);
begin
  case Message.Msg of
    WM_WORK_COMPLETE: begin
      DeallocateHWnd(FWindow);
      FWindow := 0;
      FThread := nil;
      DoWorkComplete(TCompleteAction(Message.WParam));
    end;
    WM_WORK_CHANGEFILENAME: begin
      try
        DoWorkChangeFileName(PChar(Message.WParam), PChar(Message.LParam));
      finally
        if Message.WParam <> 0 then StrDispose(PChar(Message.WParam));
        if Message.LParam <> 0 then StrDispose(PChar(Message.LParam));
      end;
    end;
    WM_WORK_HTTP_CONNECTED:
      DoWorkHttpConnected;
    WM_WORK_HTTP_DISCONNECTED:
      DoWorkHttpDisconnected;
    WM_WORK_HTTP_STATUS: begin
      try
        DoWorkHttpStatus(TIdStatus(Message.WParam), PChar(Message.LParam));
      finally
        if Message.LParam <> 0 then StrDispose(PChar(Message.LParam));
      end;
    end;
    WM_WORK_HTTP_PROGRESS:
      DoWorkHttpProgress(TWorkMode(Message.WParam), Message.LParam);
    WM_WORK_HTTP_BEGIN:
      DoWorkHttpBegin(TWorkMode(Message.WParam), Message.LParam);
    WM_WORK_HTTP_END:
      DoWorkHttpEnd(TWorkMode(Message.WParam));
    WM_WORK_HTTP_EXCEPTION: begin
      try
        DoWorkHttpException(PChar(Message.WParam), Message.LParam);
      finally
        if Message.WParam <> 0 then StrDispose(PChar(Message.WParam));
      end;
    end;
  else
    with Message do Result := DefWindowProc(FWindow, Msg, WParam, LParam);
  end;
end;



end.
 