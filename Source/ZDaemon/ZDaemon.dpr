program ZDaemon;

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
  uLogin in '비밀번호체크\uLogin.pas' {fmLogin},
  uLomosUtil in '..\..\Lib\uLomosUtil.pas',
  uMSDEsql in '..\..\Lib\uMSDEsql.pas',
  DIMime in '..\..\Lib\DIMime.pas',
  uPwChange in '비밀번호변경\uPwChange.pas' {fmPwChange},
  uDevicemodule in '..\..\Lib\uDevicemodule.pas' {ComModule: TDataModule},
  uMonitoringState in 'fmMonitoringState\uMonitoringState.pas' {fmMonitoringState},
  uSubForm in '..\..\Lib\uSubForm.pas' {fmASubForm},
  uAttendConfig in '환경설정\uAttendConfig.pas' {fmAttendConfig},
  uPositionSet in '기기위치등록\uPositionSet.pas' {fmPositionSet},
  DoorSchReg in '스케줄등록\DoorSchReg.pas' {DoorscheduleRegForm},
  uSchadule in '스케줄등록\uSchadule.pas' {fmSchadule},
  udmAdoQuery in '..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uDoorStateReport in 'fmDoorStateReport\uDoorStateReport.pas' {fmDoorStateReport},
  uNetConfig in '통신환경설정\uNetConfig.pas' {fmNetConfig},
  uJNHospitalDoorSetting in 'fmJNHospitalDoorSetting\uJNHospitalDoorSetting.pas' {fmJNHospitalDoorSetting},
  uMDIAlarmZoneAdmin in 'fmMDIAlarmZoneAdmin\uMDIAlarmZoneAdmin.pas' {fmMDIAlarmZoneAdmin},
  uFoodAdmin in '식수기기관리\uFoodAdmin.pas' {fmFoodAdmin},
  uCardReaderServer in 'fmCardReaderServer\uCardReaderServer.pas' {fmCardReaderServer},
  uCardReaderServerMonitor in 'fmCardReaderServerMonitor\uCardReaderServerMonitor.pas' {fmCardReaderServerMonitor},
  uPerRelayConfig in '환경설정\uPerRelayConfig.pas' {fmperRelayConfig},
  uRelaysentence in '환경설정\uRelaysentence.pas' {fmRelaysentence},
  uInOutReader in 'fmInOutReader\uInOutReader.pas' {fmInOutReader},
  uDeviceSetting in 'fmDeviceSetting\uDeviceSetting.pas' {fmDeviceSetting},
  uAlaramReader in 'fmAlaramReader\uAlaramReader.pas' {fmAlaramReader},
  uInOutGroup in 'fmInOutGroup\uInOutGroup.pas' {fmInOutGroup},
  uInOutGroupName in 'fmInOutGroupName\uInOutGroupName.pas' {fmInOutGroupName},
  uClientInfo in '..\..\Lib\Socket\uClientInfo.pas',
  uMoPacketItem in '..\..\Lib\Socket\uMoPacketItem.pas',
  uClientComThread in '..\..\Lib\Socket\uClientComThread.pas',
  uClientCommunication in '..\..\Lib\Socket\uClientCommunication.pas',
  uDataBase in '..\..\Lib\DataBase\uDataBase.pas',
  FileInfo in '..\..\Lib\FileInfo.pas',
  uReaderSetting in 'fmReaderSetting\uReaderSetting.pas' {fmReaderSetting},
  uPersonRelay in 'PersonRelayModule\uPersonRelay.pas' {dmPersonRelay: TDataModule},
  uLocateCode in 'fmLocateCode\uLocateCode.pas' {fmLocateCode},
  uMDIDeviceCode in 'fmMDIDeviceCode\uMDIDeviceCode.pas' {fmMDIDeviceCode},
  uEcuCount in 'fmDeviceCode\uEcuCount.pas' {fmEcuCount},
  systeminfos in '..\..\Lib\systeminfos.pas',
  UCommonModule in '..\..\Lib\UCommonModule.pas' {CommonModule: TDataModule},
  uSequenceChange in 'fmSequenceChange\uSequenceChange.pas' {fmSequenceChange},
  uDataBaseConfig in '..\..\..\[LIB]\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCommonSql in '..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uDataModule1 in '..\..\..\[LIB]\uDataModule1.pas' {DataModule1: TDataModule},
  udmServerToMonitor in '..\..\Lib\udmServerToMonitor.pas' {dmServerToMonitor: TDataModule},
  uKTTControl in 'Lib\uKTTControl.pas' {dmKTTControl: TDataModule},
  udmAttendEvent in '..\..\Lib\udmAttendEvent.pas' {dmAttendEvent: TDataModule},
  uCurrentState in '실시간송수신현황조회\uCurrentState.pas' {fmCurrentState},
  uKTTDDNS in 'Lib\uKTTDDNS.pas' {dmKTTDDNS: TDataModule},
  uMonitoringServer in 'Lib\uMonitoringServer.pas' {dmMonitoringServer: TDataModule},
  uKTTMonitoring in 'fmKTTMonitoring\uKTTMonitoring.pas' {fmKTTMonitoring},
  uDDNSMonitoring in 'fmDDNSMonitoring\uDDNSMonitoring.pas' {fmDDNSMonitoring},
  uKTTCodeAdmin in 'fmKTTCodeAdmin\uKTTCodeAdmin.pas' {fmKTTCodeAdmin},
  uFiregubunCode in 'fmFiregubunCode\uFiregubunCode.pas' {fmFiregubunCode},
  uFireGroup in 'fmFireGroup\uFireGroup.pas' {fmFireGroup},
  uInOutGroupCode in 'fmInOutGroupCode\uInOutGroupCode.pas' {fmInOutGroupCode},
  uMoPacketList in '..\..\Lib\Socket\uMoPacketList.pas',
  uDeviceConnectState in '기기접속현황\uDeviceConnectState.pas' {fmDeviceConnectState},
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
  u_strings in '..\..\Lib\Socket\Winsockunits\u_strings.pas',
  uMDIArmAreaAdmin in 'fmArmAreaAdmin\uMDIArmAreaAdmin.pas' {fmMDIArmArea},
  uNodeServerWinSocket in '..\..\Lib\Socket\uNodeServerWinSocket.pas' {dmNodeServerWinSock: TDataModule},
  uAntiPassGroupCode in 'fmAntiPassGroupCode\uAntiPassGroupCode.pas' {fmAntiPassGroupCode},
  uDoorAntiPass in 'fmDoorAntiPass\uDoorAntiPass.pas' {fmDoorAntiPass},
  uCompanyCodeLoad in '..\..\Lib\uCompanyCodeLoad.pas',
  uAntiPassGroup in '..\..\Lib\AntiPassGroup\uAntiPassGroup.pas' {dmAntiPassGroup: TDataModule},
  uMessage in 'fmMessage\uMessage.pas' {fmMessage},
  uRelayDB in '..\..\Lib\DataBase\uRelayDB.pas' {dmRelayDB: TDataModule},
  uFoodEmployee in '..\..\Lib\Food\uFoodEmployee.pas' {dmFoodEmployee: TDataModule},
  uZTBMSFunction in '..\..\Lib\uZTBMSFunction.pas',
  uDBCreate in '..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uDBFunction in '..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  uFoodSummary in 'Lib\uFoodSummary.pas' {dmFoodSummary: TDataModule},
  uRelayDoor in 'Lib\uRelayDoor.pas' {dmRelayDoor: TDataModule},
  uMDIDoorAdmin in 'fmMDIAdmin\uMDIDoorAdmin.pas' {fmMDIDoorAdmin},
  uRelay in 'Lib\uRelay.pas' {dmRelay: TDataModule},
  uTimerIni in 'uTimerIni.pas' {dtmTimerIni: TDataModule};

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

  Application.Title := '통신데몬';
  Application.CreateForm(TdmRelayDB, dmRelayDB);
  Application.CreateForm(TdmMonitoringServer, dmMonitoringServer);
  Application.CreateForm(TdmKTTControl, dmKTTControl);
  Application.CreateForm(TdmKTTDDNS, dmKTTDDNS);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TdmPersonRelay, dmPersonRelay);
  Application.CreateForm(TdmAdoQuery, dmAdoQuery);
  Application.CreateForm(TComModule, ComModule);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmRelay, dmRelay);
  Application.CreateForm(TdtmTimerIni, dtmTimerIni);
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
