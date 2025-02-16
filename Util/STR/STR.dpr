program STR;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  DIMime in '..\..\Lib\DIMime.pas',
  uLomosUtil in '..\..\Lib\uLomosUtil.pas',
  uMSDEsql in '..\..\Lib\uMSDEsql.pas',
  systeminfos in '..\..\Lib\systeminfos.pas',
  uDataBaseConfig in '..\..\..\[LIB]\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDataModule1 in '..\..\..\[LIB]\uDataModule1.pas' {DataModule1: TDataModule},
  uCommonSql in '..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uPwChange in '비밀번호변경\uPwChange.pas' {fmPwChange},
  uLogin in '비밀번호체크\uLogin.pas' {fmLogin},
  uNetConfig in 'fmNetConfig\uNetConfig.pas' {fmNetConfig},
  uNetCheckValiable in 'fmNetConfig\uNetCheckValiable.pas',
  uNetUtil in 'fmNetConfig\uNetUtil.pas',
  uDeviceSetting in 'fmDeviceSetting\uDeviceSetting.pas' {fmDeviceSetting},
  uDeviceState in '..\..\Lib\uDeviceState.pas' {dmDeviceState: TDataModule},
  UCommonModule in '..\..\Lib\UCommonModule.pas' {CommonModule: TDataModule},
  uMonitoringCommonVariable in '..\..\Lib\Monitoring\uMonitoringCommonVariable.pas' {dmMonitoringCommonVariable: TDataModule},
  uSubForm in '..\..\..\[LIB]\uSubForm.pas' {fmASubForm},
  uFunction in '..\..\..\[LIB]\uFunction.pas',
  uDeviceSettingValiable in 'lib\uDeviceSettingValiable.pas',
  uDeviceSettingUtil in 'lib\uDeviceSettingUtil.pas',
  uMonitoringDataProcess in '..\..\Lib\Monitoring\uMonitoringDataProcess.pas',
  uNetCommon in 'fmNetConfig\uNetCommon.pas' {dmCommon: TDataModule},
  udmAdoQuery in '..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  udmServerToMonitor in '..\..\Lib\udmServerToMonitor.pas' {dmServerToMonitor: TDataModule};

{$R *.res}
{$R manifest.RES}

begin
  Application.Initialize;
  Application.Title := '기기설정프로그램';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
