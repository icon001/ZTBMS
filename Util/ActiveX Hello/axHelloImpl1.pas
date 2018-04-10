unit axHelloImpl1;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, axHelloProj1_TLB, StdVcl, StdCtrls,Registry,WinInet,
  Buttons;

type
  TaxHello = class(TActiveForm, IaxHello)
    btn_GuestReserv: TSpeedButton;
    procedure btn_GuestReservClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: IaxHelloEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    Function GestProgramSetupCheck(var aExecPath:string):Boolean;
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ;

{$R *.DFM}
{ TaxHello }
function GetInetFile(const fileURL, FileName: String): boolean;
const BufferSize = 1024; 
var 
  hSession, hURL: HInternet; 
  Buffer: array[1..BufferSize] of Byte; 
  BufferLen: DWORD; 
  f: File;
  sAppName: String;
  nFileSize : integer;
begin
  nFileSize := 7061504;

//  fmStart.Gauge1.MaxValue := nFileSize;
//  fmStart.Gauge1.Progress := 0;
  Result := False;

  sAppName := ExtractFileName(Application.ExeName);
  hSession := InternetOpen(PChar(sAppName), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    hURL := InternetOpenURL(hSession, PChar(fileURL), nil,0,0,0);
    try
      AssignFile(f, FileName);
      Rewrite(f,1);
      repeat
        InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
        BlockWrite(f, Buffer, BufferLen);
//        fmStart.Gauge1.Progress := fmStart.Gauge1.Progress + BufferLen;
      until BufferLen = 0;
      CloseFile(f);
      Result := True;
    finally
     InternetCloseHandle(hURL)
    end
  finally
    InternetCloseHandle(hSession)
  end; 
end;

// 도스 명령 실행 함수/프로시져

function MyF_UsingWinNT: Boolean;
var
  OS: TOSVersionInfo; 
begin 
  OS.dwOSVersionInfoSize := Sizeof(OS); 
  GetVersionEx(OS);
  if OS.dwPlatformId = VER_PLATFORM_WIN32_NT then Result:= True 
  else Result:= False; 
end;
// 도스 명령 실행 프로시져
procedure My_RunDosCommand(Command : string;  nShow : Boolean = False; bWait:Boolean = True);
var 
  hReadPipe : THandle; 
  hWritePipe : THandle; 
  SI : TStartUpInfo; 
  PI : TProcessInformation; 
  SA : TSecurityAttributes; 
  SD : TSecurityDescriptor; 
  BytesRead : DWORD; 
  Dest : array[0..1023] of char; 
  CmdLine : array[0..512] of char;
  TmpList : TStringList; 
  S, Param : string; 
  Avail, ExitCode, wrResult : DWORD; 
begin
  if MyF_UsingWinNT then begin
    InitializeSecurityDescriptor(@SD, SECURITY_DESCRIPTOR_REVISION); 
    SetSecurityDescriptorDacl(@SD, True, nil, False); 
    SA.nLength := SizeOf(SA); 
    SA.lpSecurityDescriptor := @SD; 
    SA.bInheritHandle := True; 
    Createpipe(hReadPipe, hWritePipe, @SA, 1024); 
  end else begin 
    Createpipe(hReadPipe, hWritePipe, nil, 1024); 
  end; 
  try
     //Screen.Cursor := crHourglass; 
     FillChar(SI, SizeOf(SI), 0); 
     SI.cb := SizeOf(TStartUpInfo); 
     if nShow then begin 
       SI.wShowWindow := SW_SHOWNORMAL 
     end else begin 
       SI.wShowWindow := SW_HIDE; 
     end;
     SI.dwFlags := STARTF_USESHOWWINDOW;
     SI.dwFlags := SI.dwFlags or STARTF_USESTDHANDLES; 
     SI.hStdOutput := hWritePipe; 
     SI.hStdError := hWritePipe; 
     StrPCopy(CmdLine, Command); 
     //if CreateProcess(nil,CmdLine , nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, SI, PI) then begin
     if CreateProcess(nil,pchar(Command) , nil, nil, True,  DETACHED_PROCESS, nil, nil, SI, PI) then begin
       if bWait then
       begin
         ExitCode := 0;
         while ExitCode = 0 do begin
           wrResult := WaitForSingleObject(PI.hProcess, 50);
           if PeekNamedPipe(hReadPipe, nil, 0, nil, @Avail, nil) then begin 
             if Avail > 0 then begin 
               TmpList := TStringList.Create; 
               try 
                 FillChar(Dest, SizeOf(Dest), 0); 
                 ReadFile(hReadPipe, Dest, Avail, BytesRead, nil); 
               finally
                 TmpList.Free; 
               end; 
             end; 
           end;
           if wrResult <> WAIT_TIMEOUT then begin
             ExitCode := 1;
           end; 
           Application.ProcessMessages;
         end; 
         GetExitCodeProcess(PI.hProcess, ExitCode); 
         CloseHandle(PI.hProcess); 
         CloseHandle(PI.hThread);
       end;
     end; 
  finally 
     CloseHandle(hReadPipe); 
     CloseHandle(hWritePipe); 
     Screen.Cursor := crDefault; 
  end;
end;

procedure TaxHello.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_axHelloPage); }
end;

procedure TaxHello.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IaxHelloEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TaxHello.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TaxHello.Get_Active: WordBool;
begin
  Result := Active;
end;

function TaxHello.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TaxHello.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TaxHello.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TaxHello.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TaxHello.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TaxHello.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TaxHello.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TaxHello.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TaxHello.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TaxHello.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TaxHello.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TaxHello.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TaxHello.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TaxHello.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TaxHello.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TaxHello.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TaxHello.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TaxHello.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TaxHello.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TaxHello._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TaxHello.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TaxHello.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TaxHello.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TaxHello.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TaxHello.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TaxHello.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TaxHello.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TaxHello.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TaxHello.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TaxHello.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TaxHello.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TaxHello.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TaxHello.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TaxHello.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TaxHello.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TaxHello.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TaxHello.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TaxHello.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TaxHello.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TaxHello.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TaxHello.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TaxHello.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TaxHello.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TaxHello.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TaxHello.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function TaxHello.GestProgramSetupCheck(var aExecPath: string): Boolean;
var
  regKey : TRegistry;
  stKey : string;
begin
  result := False;
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_LOCAL_MACHINE;
    if (not regKey.KeyExists('\Software\ZERON')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
    regKey.OpenKey ('\Software\ZERON',False);
    stKey := regKey.ReadString('GUEST');
    if Trim(stKey)='' then
    begin
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
  aExecPath := stKey;
  result := True;
end;

procedure TaxHello.btn_GuestReservClick(Sender: TObject);
var
  stExecPath : string;
begin
  if GestProgramSetupCheck(stExecPath) then
  begin
    My_RunDosCommand(stExecPath,True,False);
  end else
  begin
    //프로그램 다운로드 하여 설치하자
    stExecPath := 'Guest_Setup.exe';
    if GetInetFile('http://zeron.co.kr/Guest_Setup.exe', stExecPath) then
      My_RunDosCommand(stExecPath,True,False);
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TaxHello,
    Class_axHello,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
