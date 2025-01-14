program ZTBMS_ServerManager;

uses
  Forms,
  Classes,
  SysUtils,
  Windows,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uSharedMemory in '..\..\Lib\SharedMemory\uSharedMemory.pas';

{$R *.res}

{$R manifest.RES}

var
hMutex : LongInt;
DaemonGubun:string;
FindHandle: THandle;
ProcessList : TStringList;
i : integer;
ProcId: DWORD;
hProcess: THandle;
//TermSucc: BOOL;
pSelfID : DWORD;
begin
  ProcessList := TStringList.Create;
  ProcessList.Clear;
  Process32List(ProcessList);
  GetWindowThreadProcessId(Application.Handle, @pSelfID);
  for i := 0 to ProcessList.Count - 1 do
  begin
    if ProcessList.Strings[i] = ExtractFileName(Application.ExeName) then  //실행 되고 있으면
    begin
      ProcId := DWORD(ProcessList.Objects[i]);
      if ProcID <> pSelfID then
      begin
        Application.Terminate;
        Exit;
        (*hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
        if hProcess <> 0 then
        begin
          // 명시한 process를 강제 종료시킨다
          TerminateProcess(hProcess, 0);
        end;
        FindHandle := GetWinHandle(ProcID);
        //FindHandle := GetWinHandle(pi.dwProcessId);
        //FindHandle := WindowFromProcessID(ProcID);
        If FindHandle <> 0 then
        begin
           //GetWindowText(FindHandle, strCaption[0], 255);
           //SendMessage(FindHandle,WM_USER,SC_MAXIMIZE,0);
           //SendMessage(FindHandle,WM_USER,SC_CLOSE,0);
           PostMessage(FindHandle,WM_USER,SC_CLOSE,0);
        end; *)
      end;
    end;
  end;
  Application.Initialize;
  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmDBCardPermit, dmDBCardPermit);
  Application.Run;
end.
