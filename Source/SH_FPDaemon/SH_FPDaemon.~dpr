program SH_FPDaemon;

uses
  Classes,
  Forms,
  IniFiles,
  SysUtils,
  Windows,
  uMain in 'fmMain\uMain.pas' {fmMain},
  DIMime in '..\..\Lib\DIMime.pas',
  uLomosUtil in '..\..\Lib\uLomosUtil.pas',
  uMSDEsql in '..\..\Lib\uMSDEsql.pas',
  uPostGreSql in '..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uCommonSql in '..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule},
  uDataModule1 in '..\..\..\[LIB]\uDataModule1.pas' {DataModule1: TDataModule},
  udmAdoQuery in '..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  UCommonModule in '..\..\Lib\UCommonModule.pas' {CommonModule: TDataModule},
  uDataBaseConfig in 'Lib\uDataBaseConfig.pas' {fmDataBaseConfig},
  uReaderManager in 'fmReaderManager\uReaderManager.pas' {fmReaderManager},
  uSubForm in '..\..\Lib\uSubForm.pas' {fmASubForm},
  u_c_log in '..\..\Lib\Socket\Winsockclasses\u_c_log.pas',
  u_c_basic_object in '..\..\Lib\Socket\Winsockclasses\u_c_basic_object.pas',
  u_c_byte_buffer in '..\..\Lib\Socket\Winsockclasses\u_c_byte_buffer.pas',
  u_c_display in '..\..\Lib\Socket\Winsockclasses\u_c_display.pas',
  u_winsock in '..\..\Lib\Socket\Winsocket\u_winsock.pas',
  u_types_constants in '..\..\Lib\Socket\Winsockunits\u_types_constants.pas',
  u_characters in '..\..\Lib\Socket\Winsockunits\u_characters.pas',
  u_dir in '..\..\Lib\Socket\Winsockunits\u_dir.pas',
  u_display_hex_2 in '..\..\Lib\Socket\Winsockunits\u_display_hex_2.pas',
  u_file in '..\..\Lib\Socket\Winsockunits\u_file.pas',
  u_strings in '..\..\Lib\Socket\Winsockunits\u_strings.pas',
  uReaderMonitoring in 'fmReaderMonitoring\uReaderMonitoring.pas' {fmReaderMonitoring},
  uSHComModule in '..\..\..\[LIB]\SHFinger\uSHComModule.pas' {dmSHComModule: TDataModule},
  uSyFpReaderFunction in '..\..\..\[LIB]\SHFinger\uSyFpReaderFunction.pas';

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
        hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
        if hProcess <> 0 then
        begin
          TerminateProcess(hProcess, 0);
        end;
      end;
    end;
  end;
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
