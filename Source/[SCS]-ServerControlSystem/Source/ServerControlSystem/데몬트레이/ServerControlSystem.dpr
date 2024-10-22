program ServerControlSystem;

uses
  Forms,
  WinProcs,
  iniFiles,
  SysUtils,
  uServerDaemon in 'uServerDaemon.pas' {fmMain},
  uLogin in '..\��й�ȣüũ\uLogin.pas' {fmLogin},
  uDataModule1 in '..\..\..\Lib\uDataModule1.pas' {DataModule1: TDataModule},
  uLomosUtil in '..\..\..\Lib\uLomosUtil.pas',
  uMSDEsql in '..\..\..\Lib\uMSDEsql.pas',
  DIMime in '..\..\..\Lib\DIMime.pas',
  uPwChange in '..\��й�ȣ����\uPwChange.pas' {fmPwChange},
  uDevicemodule in '..\..\..\Lib\uDevicemodule.pas' {ComModule: TDataModule},
  uDataBaseConfig in '..\..\..\Lib\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCurrentState in '..\�ǽð��ۼ�����Ȳ��ȸ\uCurrentState.pas' {fmCurrentState},
  uSubForm in '..\..\..\Lib\uSubForm.pas' {fmASubForm},
  uAttendConfig in '..\ȯ�漳��\uAttendConfig.pas' {fmAttendConfig},
  uPositionSet in '..\�����ġ���\uPositionSet.pas' {fmPositionSet},
  DoorSchReg in '..\�����ٵ��\DoorSchReg.pas' {DoorscheduleRegForm},
  uSchadule in '..\�����ٵ��\uSchadule.pas' {fmSchadule},
  udmAdoQuery in '..\..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uDeviceConnectState in '..\���������Ȳ\uDeviceConnectState.pas' {fmDeviceConnectState},
  uNetConfig in '..\���ȯ�漳��\uNetConfig.pas' {fmNetConfig},
  uDoorAdmin in '..\���Թ�����\uDoorAdmin.pas' {fmDoorAdmin},
  uAlaramDeviceAdmin in '..\���������\uAlaramDeviceAdmin.pas' {fmAlaramDeviceAdmin},
  uSound in '..\fmSound\uSound.pas' {fmSound},
  uFoodAdmin in '..\�ļ�������\uFoodAdmin.pas' {fmFoodAdmin},
  uCommonSql in '..\..\..\Lib\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uMDBSql in '..\..\..\Lib\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\Lib\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\Lib\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uCardReaderServer in '..\fmCardReaderServer\uCardReaderServer.pas' {fmCardReaderServer},
  uCardReaderServerMonitor in '..\fmCardReaderServerMonitor\uCardReaderServerMonitor.pas' {fmCardReaderServerMonitor},
  uPerRelayConfig in '..\ȯ�漳��\uPerRelayConfig.pas' {fmperRelayConfig},
  uRelaysentence in '..\ȯ�漳��\uRelaysentence.pas' {fmRelaysentence},
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
  uDeviceCode in '..\fmDeviceCode\uDeviceCode.pas' {fmDeviceCode},
  uEcuCount in '..\fmDeviceCode\uEcuCount.pas' {fmEcuCount},
  systeminfos in '..\..\..\Lib\systeminfos.pas',
  uFireBird in '..\..\..\Lib\Query\uFireBird.pas' {FireBird: TDataModule},
  UCommonModule in '..\..\..\Lib\UCommonModule.pas' {CommonModule: TDataModule},
  uMonitoring in '..\fmMointoring\uMonitoring.pas' {fmMonitoring},
  uOracleRelay in '..\..\..\Lib\uOracleRelay.pas' {dmOracleRelay: TDataModule},
  uAccessReport in '..\fmAccessReport\uAccessReport.pas' {fmAccessReport},
  uNotUseCardDelete in '..\fmNotUseCardDelete\uNotUseCardDelete.pas' {fmNotUseCardDelete},
  uMSSQLRelay in '..\..\..\Lib\uMSSQLRelay.pas' {dmMSSQLRelay: TDataModule},
  uEmploy in '..\fmEmploy\uEmploy.pas' {fmEmploy},
  uZipCode in '..\fmZipCode\uZipCode.pas' {fmZipCode},
  uCompanyCodeLoad in '..\..\..\Lib\uCompanyCodeLoad.pas',
  uZTBMSFunction in '..\..\..\Lib\uZTBMSFunction.pas',
  uCompanyCode in '..\fmCompanyCode\uCompanyCode.pas' {fmCompanyCode},
  uMDICardAdmin in '..\fmMDICardAdmin\uMDICardAdmin.pas' {fmMDICardAdmin},
  uDisplaymodule in '..\..\..\Lib\uDisplaymodule.pas' {dmDisplay: TDataModule},
  uDisplayAdmin in '..\fmDisplayAdmin\uDisplayAdmin.pas' {fmDisplayAdmin},
  uBarCode in '..\fmBarCode\uBarCode.pas' {fmBarCode},
  udmBarCode in '..\..\..\Lib\udmBarCode.pas' {dmBarCode: TDataModule},
  uAlarmZoneAdmin in '..\���������\uAlarmZoneAdmin.pas' {fmAlarmZoneAdmin};

{$R *.res}
var
hMutex : LongInt;
DaemonGubun:string;
begin
  hMutex := OpenMutex( MUTEX_ALL_ACCESS, False, pchar('SCS') );
  If hMutex <> 0 Then
  Begin
  CloseHandle( hMutex );
  Exit;
  End;
  hMutex := CreateMutex( Nil, False, pchar('SCS') );
  Application.Initialize;

  Application.CreateForm(TdmBarCode, dmBarCode);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TdmMSSQLRelay, dmMSSQLRelay);
  Application.CreateForm(TdmOracleRelay, dmOracleRelay);
  Application.CreateForm(TdmPersonRelay, dmPersonRelay);
  Application.CreateForm(TdmAdoQuery, dmAdoQuery);
  Application.CreateForm(TComModule, ComModule);
  Application.CreateForm(TdmDisplay, dmDisplay);
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
