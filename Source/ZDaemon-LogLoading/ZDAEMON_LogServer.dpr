program ZDAEMON_LogServer;

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
  udmAdoQuery in '..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uDataBase in '..\..\Lib\DataBase\uDataBase.pas',
  systeminfos in '..\..\Lib\systeminfos.pas',
  UCommonModule in '..\..\Lib\UCommonModule.pas' {CommonModule: TDataModule},
  uDataBaseConfig in '..\..\..\[LIB]\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCommonSql in '..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uDataModule1 in '..\..\..\[LIB]\uDataModule1.pas' {DataModule1: TDataModule},
  uZeronEventDBFunction in 'Lib\ZeronEventDataBase\uZeronEventDBFunction.pas' {dmZeronEventDBFunction: TDataModule},
  uZeronEventDataBase in 'Lib\ZeronEventDataBase\uZeronEventDataBase.pas' {dmZeronEventDataBase: TDataModule},
  uCommonVariable in 'Lib\ZeronEventDataBase\uCommonVariable.pas',
  uDBVariable in 'Lib\ZeronEventDataBase\uDBVariable.pas',
  uDeviceFunction in 'Lib\ZeronEventDataBase\uDeviceFunction.pas' {dmDeviceFunction: TDataModule},
  uZeronEventDataBaseConfig in 'Lib\ZeronEventDataBase\uZeronEventDataBaseConfig.pas' {fmZeronEventDataBaseConfig},
  uZeronEventDBCreate in 'Lib\ZeronEventDataBase\uZeronEventDBCreate.pas' {dmZeronEventDBCreate: TDataModule},
  uDBCreate in '..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule};

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

  Application.Title := '통신로그서버';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TdmAdoQuery, dmAdoQuery);
  Application.CreateForm(TdmZeronEventDataBase, dmZeronEventDataBase);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmDBCreate, dmDBCreate);
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
