program SMSServer;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uDataBaseConfig in '..\..\lib\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uLomosUtil in '..\..\lib\Function\uLomosUtil.pas',
  uPostGreSql in '..\..\lib\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uCommonSql in '..\..\lib\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\lib\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\lib\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMSDEsql in '..\..\lib\Query\uMSDEsql.pas',
  uMssql in '..\..\lib\Query\uMssql.pas' {Mssql: TDataModule},
  DIMimeStreams in '..\..\lib\DIMimeStreams.pas',
  DIMime in '..\..\lib\DIMime.pas',
  uDataModule1 in '..\..\lib\DBConnect\uDataModule1.pas' {DataModule1: TDataModule},
  udmAdoQuery in '..\..\lib\Query\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uLogin in 'fmLogin\uLogin.pas' {fmLogin},
  systeminfos in '..\..\lib\systeminfos.pas',
  uCommonVariable in '..\..\lib\Variable\uCommonVariable.pas' {dmMonitoringCommonVariable: TDataModule},
  uCardReader in '..\..\lib\Device\uCardReader.pas' {dmCardReader: TDataModule},
  uDeviceState in '..\..\lib\Device\uDeviceState.pas' {dmDeviceState: TDataModule},
  UCommonModule in '..\..\lib\UCommonModule.pas' {CommonModule: TDataModule},
  uDataBaseUtil in '..\..\lib\DBConnect\uDataBaseUtil.pas' {DataBaseUtil: TDataModule},
  uSMSConfig in 'fmSMSConfig\uSMSConfig.pas' {fmSMSConfig},
  uSMSZoneSetting in 'fmSMSZoneSetting\uSMSZoneSetting.pas' {fmSMSZoneSetting},
  uSubForm in '..\..\..\..\Lib\uSubForm.pas' {fmASubForm},
  uSMSAlarmCodeSetting in 'fmSMSAlarmCodeSetting\uSMSAlarmCodeSetting.pas' {fmSMSAlarmCodeSetting},
  uSMSModule in '..\..\lib\SMSModule\uSMSModule.pas' {dmSMSModule: TDataModule},
  uSMSMonitoring in 'fmSMSMonitoring\uSMSMonitoring.pas' {fmSMSMonitoring},
  uSMSLogin in 'fmSMSLogin\uSMSLogin.pas' {fmSMSLogin},
  uSMSUser in 'fmSMSUser\uSMSUser.pas' {fmSMSUser};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SMS¼­¹ö';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TdmSMSModule, dmSMSModule);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmSMSLogin, fmSMSLogin);
  Application.CreateForm(TfmSMSUser, fmSMSUser);
  Application.Run;
end.
