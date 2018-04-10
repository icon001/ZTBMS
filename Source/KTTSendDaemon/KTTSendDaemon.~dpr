program KTTSendDaemon;

{%File '수정목록.txt'}

uses
  FastMM4 in '..\..\..\[컴포넌트]\FastMM\FastMM4.pas',
  FastMM4Messages in '..\..\..\[컴포넌트]\FastMM\FastMM4Messages.pas',
  Forms,
  WinProcs,
  Classes,
  iniFiles,
  SysUtils,
  Messages,
  uServerDaemon in '데몬트레이\uServerDaemon.pas' {fmMain},
  uLomosUtil in '..\..\Lib\uLomosUtil.pas',
  uMSDEsql in '..\..\Lib\uMSDEsql.pas',
  DIMime in '..\..\Lib\DIMime.pas',
  uSubForm in '..\..\Lib\uSubForm.pas' {fmASubForm},
  uAttendConfig in '환경설정\uAttendConfig.pas' {fmAttendConfig},
  udmAdoQuery in '..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uCardReaderServer in 'fmCardReaderServer\uCardReaderServer.pas' {fmCardReaderServer},
  uCardReaderServerMonitor in 'fmCardReaderServerMonitor\uCardReaderServerMonitor.pas' {fmCardReaderServerMonitor},
  uAlaramReader in 'fmAlaramReader\uAlaramReader.pas' {fmAlaramReader},
  uClientInfo in '..\..\Lib\Socket\uClientInfo.pas',
  uDataBase in '..\..\Lib\DataBase\uDataBase.pas',
  FileInfo in '..\..\Lib\FileInfo.pas',
  systeminfos in '..\..\Lib\systeminfos.pas',
  UCommonModule in '..\..\Lib\UCommonModule.pas' {CommonModule: TDataModule},
  uDataBaseConfig in '..\..\..\[LIB]\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCommonSql in '..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uDataModule1 in '..\..\..\[LIB]\uDataModule1.pas' {DataModule1: TDataModule},
  uKTTControl in 'Lib\uKTTControl.pas' {dmKTTControl: TDataModule},
  uKTTDDNS in 'Lib\uKTTDDNS.pas' {dmKTTDDNS: TDataModule},
  uKTTMonitoring in 'fmKTTMonitoring\uKTTMonitoring.pas' {fmKTTMonitoring},
  uDDNSMonitoring in 'fmDDNSMonitoring\uDDNSMonitoring.pas' {fmDDNSMonitoring},
  uKTTCodeAdmin in 'fmKTTCodeAdmin\uKTTCodeAdmin.pas' {fmKTTCodeAdmin},
  uWinSocket in '..\..\Lib\Socket\uWinSocket.pas' {dmSocket: TDataModule},
  u_c_log in '..\..\Lib\Socket\Winsockclasses\u_c_log.pas',
  u_c_basic_object in '..\..\Lib\Socket\Winsockclasses\u_c_basic_object.pas',
  u_c_byte_buffer in '..\..\Lib\Socket\Winsockclasses\u_c_byte_buffer.pas',
  u_c_display in '..\..\Lib\Socket\Winsockclasses\u_c_display.pas',
  u_types_constants in '..\..\Lib\Socket\Winsockunits\u_types_constants.pas',
  u_characters in '..\..\Lib\Socket\Winsockunits\u_characters.pas',
  u_dir in '..\..\Lib\Socket\Winsockunits\u_dir.pas',
  u_display_hex_2 in '..\..\Lib\Socket\Winsockunits\u_display_hex_2.pas',
  u_file in '..\..\Lib\Socket\Winsockunits\u_file.pas',
  u_strings in '..\..\Lib\Socket\Winsockunits\u_strings.pas';

{$R *.res}
{$R manifest.RES}

var
  hMutex : LongInt;
  ini_fun : TiniFile;
  DaemonGubun:string;
  FindHandle: THandle;
  ProcessList : TStringList;
  i : integer;
  ProcId: DWORD;
  hProcess: THandle;
  //TermSucc: BOOL;
  pSelfID : DWORD;
begin
(*  ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\zmos.INI');
  DaemonGubun := ini_fun.ReadString('DAEMON','GUBUN','0');
  ini_fun.free;
  hMutex := OpenMutex( MUTEX_ALL_ACCESS, False, pchar('ZDAEMON'+DaemonGubun) );
  If hMutex <> 0 Then
  Begin
  CloseHandle( hMutex );
  Exit;
  End;
  hMutex := CreateMutex( Nil, False, pchar('ZDAEMON'+DaemonGubun) );
*)
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
        hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
        if hProcess <> 0 then
        begin
          // 명시한 process를 강제 종료시킨다
          //TermSucc := TerminateProcess(hProcess, 0);
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
        end;
      end;
    end;
  end;

  Application.Initialize;

  Application.Title := 'KTTSendDaemon';
  Application.CreateForm(TdmKTTControl, dmKTTControl);
  Application.CreateForm(TdmKTTDDNS, dmKTTDDNS);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TdmAdoQuery, dmAdoQuery);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
{
begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TComModule, ComModule);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.   }
