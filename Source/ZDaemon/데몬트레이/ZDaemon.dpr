program ZDaemon;

{%File '..\수정목록.txt'}

uses
  Forms,
  WinProcs,
  iniFiles,
  SysUtils,
  uServerDaemon in 'uServerDaemon.pas' {fmMain},
  uLogin in '..\비밀번호체크\uLogin.pas' {fmLogin},
  uLomosUtil in '..\..\..\Lib\uLomosUtil.pas',
  uMSDEsql in '..\..\..\Lib\uMSDEsql.pas',
  DIMime in '..\..\..\Lib\DIMime.pas',
  uPwChange in '..\비밀번호변경\uPwChange.pas' {fmPwChange},
  uDevicemodule in '..\..\..\Lib\uDevicemodule.pas' {ComModule: TDataModule},
  uMonitoringState in '..\fmMonitoringState\uMonitoringState.pas' {fmMonitoringState},
  uSubForm in '..\..\..\Lib\uSubForm.pas' {fmASubForm},
  uAttendConfig in '..\환경설정\uAttendConfig.pas' {fmAttendConfig},
  uPositionSet in '..\기기위치등록\uPositionSet.pas' {fmPositionSet},
  DoorSchReg in '..\스케줄등록\DoorSchReg.pas' {DoorscheduleRegForm},
  uSchadule in '..\스케줄등록\uSchadule.pas' {fmSchadule},
  udmAdoQuery in '..\..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uDeviceConnectState in '..\기기접속현황\uDeviceConnectState.pas' {fmDeviceConnectState},
  uNetConfig in '..\통신환경설정\uNetConfig.pas' {fmNetConfig},
  uMDIDoorAdmin in '..\fmMDIAdmin\uMDIDoorAdmin.pas' {fmMDIDoorAdmin},
  uMDIAlaramDeviceAdmin in '..\fmMDIAlaramDeviceAdmin\uMDIAlaramDeviceAdmin.pas' {fmMDIAlaramDeviceAdmin},
  uMDIAlarmZoneAdmin in '..\fmMDIAlarmZoneAdmin\uMDIAlarmZoneAdmin.pas' {fmMDIAlarmZoneAdmin},
  uFoodAdmin in '..\식수기기관리\uFoodAdmin.pas' {fmFoodAdmin},
  uCardReaderServer in '..\fmCardReaderServer\uCardReaderServer.pas' {fmCardReaderServer},
  uCardReaderServerMonitor in '..\fmCardReaderServerMonitor\uCardReaderServerMonitor.pas' {fmCardReaderServerMonitor},
  uPerRelayConfig in '..\환경설정\uPerRelayConfig.pas' {fmperRelayConfig},
  uRelaysentence in '..\환경설정\uRelaysentence.pas' {fmRelaysentence},
  uInOutReader in '..\fmInOutReader\uInOutReader.pas' {fmInOutReader},
  uDeviceSetting in '..\fmDeviceSetting\uDeviceSetting.pas' {fmDeviceSetting},
  uAlaramReader in '..\fmAlaramReader\uAlaramReader.pas' {fmAlaramReader},
  uInOutGroup in '..\fmInOutGroup\uInOutGroup.pas' {fmInOutGroup},
  uInOutGroupName in '..\fmInOutGroupName\uInOutGroupName.pas' {fmInOutGroupName},
  uMoPacketList in '..\..\..\Lib\Socket\uMoPacketList.pas',
  uClientInfo in '..\..\..\Lib\Socket\uClientInfo.pas',
  uMoPacketItem in '..\..\..\Lib\Socket\uMoPacketItem.pas',
  uClientComThread in '..\..\..\Lib\Socket\uClientComThread.pas',
  uClientCommunication in '..\..\..\Lib\Socket\uClientCommunication.pas',
  uDataBase in '..\..\..\Lib\DataBase\uDataBase.pas',
  FileInfo in '..\..\..\Lib\FileInfo.pas',
  uMcusocket in '..\..\..\Lib\DeviceServer\uMcusocket.pas',
  uReaderSetting in '..\fmReaderSetting\uReaderSetting.pas' {fmReaderSetting},
  uPersonRelay in '..\PersonRelayModule\uPersonRelay.pas' {dmPersonRelay: TDataModule},
  uLocateCode in '..\fmLocateCode\uLocateCode.pas' {fmLocateCode},
  uMDIDeviceCode in '..\fmMDIDeviceCode\uMDIDeviceCode.pas' {fmMDIDeviceCode},
  uEcuCount in '..\fmDeviceCode\uEcuCount.pas' {fmEcuCount},
  systeminfos in '..\..\..\Lib\systeminfos.pas',
  UCommonModule in '..\..\..\Lib\UCommonModule.pas' {CommonModule: TDataModule},
  uSequenceChange in '..\fmSequenceChange\uSequenceChange.pas' {fmSequenceChange},
  uDataBaseConfig in '..\..\..\..\[LIB]\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCommonSql in '..\..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uDataModule1 in '..\..\..\..\[LIB]\uDataModule1.pas' {DataModule1: TDataModule},
  udmServerToMonitor in '..\..\..\Lib\udmServerToMonitor.pas' {dmServerToMonitor: TDataModule},
  uKTTControl in '..\Lib\uKTTControl.pas' {dmKTTControl: TDataModule},
  udmAttendEvent in '..\..\..\Lib\udmAttendEvent.pas' {dmAttendEvent: TDataModule},
  uCurrentState in '..\실시간송수신현황조회\uCurrentState.pas' {fmCurrentState},
  uKTTDDNS in '..\Lib\uKTTDDNS.pas' {dmKTTDDNS: TDataModule},
  uMonitoringServer in '..\Lib\uMonitoringServer.pas' {dmMonitoringServer: TDataModule},
  uKTTMonitoring in '..\fmKTTMonitoring\uKTTMonitoring.pas' {fmKTTMonitoring},
  uDDNSMonitoring in '..\fmDDNSMonitoring\uDDNSMonitoring.pas' {fmDDNSMonitoring},
  uKTTCodeAdmin in '..\fmKTTCodeAdmin\uKTTCodeAdmin.pas' {fmKTTCodeAdmin},
  uFiregubunCode in '..\fmFiregubunCode\uFiregubunCode.pas' {fmFiregubunCode},
  uFireGroup in '..\fmFireGroup\uFireGroup.pas' {fmFireGroup};

{$R *.res}
var
hMutex : LongInt;
ini_fun : TiniFile;
DaemonGubun:string;
begin
  ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\zmos.INI');
  DaemonGubun := ini_fun.ReadString('DAEMON','GUBUN','0');
  ini_fun.free;
  hMutex := OpenMutex( MUTEX_ALL_ACCESS, False, pchar('ZDAEMON'+DaemonGubun) );
  If hMutex <> 0 Then
  Begin
  CloseHandle( hMutex );
  Exit;
  End;
  hMutex := CreateMutex( Nil, False, pchar('ZDAEMON'+DaemonGubun) );
  Application.Initialize;

  Application.Title := '통신데몬';
  Application.CreateForm(TdmMonitoringServer, dmMonitoringServer);
  Application.CreateForm(TdmKTTControl, dmKTTControl);
  Application.CreateForm(TdmKTTDDNS, dmKTTDDNS);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TdmPersonRelay, dmPersonRelay);
  Application.CreateForm(TdmAdoQuery, dmAdoQuery);
  Application.CreateForm(TComModule, ComModule);
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
