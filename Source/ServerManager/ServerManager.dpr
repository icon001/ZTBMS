program ServerManager;



uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uSubForm in '..\..\Lib\uSubForm.pas' {fmASubForm},
  cDateTime in '..\..\Lib\cDateTime.pas',
  DIMime in '..\..\Lib\DIMime.pas',
  DIMimeStreams in '..\..\Lib\DIMimeStreams.pas',
  systeminfos in '..\..\Lib\systeminfos.pas',
  uDataBaseUtil in '..\..\Lib\uDataBaseUtil.pas' {DataBaseUtil: TDataModule},
  uLomosUtil in '..\..\Lib\uLomosUtil.pas',
  uMSDEsql in '..\..\Lib\uMSDEsql.pas',
  uMsg in '..\..\Lib\uMsg.pas',
  uLogin in '..\..\Lib\Login\uLogin.pas' {fmLogin},
  uProgramConfig in 'fmProgramConfig\uProgramConfig.pas' {fmProgramConfig},
  uRelayEmploy in 'fmRelayEmploy\uRelayEmploy.pas' {fmRelayEmploy},
  uReaderState in 'fmReaderState\uReaderState.pas' {fmReaderState},
  udmAdoRelay in '..\..\Lib\udmAdoRelay.pas' {dmAdoRelay: TDataModule},
  uServerConnectModule in 'ServerConnectModule\uServerConnectModule.pas' {dServerConnectModule: TDataModule},
  uTestCardCreate in 'TEST\uTestCardCreate.pas' {fmTestCardCreate},
  UCommonModule in '..\..\Lib\UCommonModule.pas' {CommonModule: TDataModule},
  uValidateSelect in 'fmCardValidDate\uValidateSelect.pas' {fmValidateSelect},
  uMonitoringCommonVariable in '..\..\Lib\Monitoring\uMonitoringCommonVariable.pas' {dmMonitoringCommonVariable: TDataModule},
  uMonitoringDataProcess in '..\..\Lib\Monitoring\uMonitoringDataProcess.pas',
  uUser in 'fmUser\uUser.pas' {fmUser},
  uDataBaseConfig in '..\..\..\[LIB]\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCommonSql in '..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uDataModule1 in '..\..\..\[LIB]\uDataModule1.pas' {DataModule1: TDataModule},
  udmAdoQuery in '..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uRemoteSupport in 'fmRemoteSupport\uRemoteSupport.pas' {fmRemoteSupport},
  udmServerToMonitor in '..\..\Lib\udmServerToMonitor.pas' {dmServerToMonitor: TDataModule},
  uNewAlarmGroupAdd in 'fmAlarmGroup\uNewAlarmGroupAdd.pas' {fmNewAlarmGroupName},
  uReAtInsert_New in 'fmReAtInsert\uReAtInsert_New.pas' {fmReAtInsert},
  udmAttendEvent in '..\..\Lib\udmAttendEvent.pas' {dmAttendEvent: TDataModule},
  uTimeCode in 'fmTimeCode\uTimeCode.pas' {fmTimeCode},
  uPWChange in 'fmPWChange\uPWChange.pas' {fmPWChange},
  u_c_byte_buffer in '..\..\Lib\Socket\Winsockclasses\u_c_byte_buffer.pas',
  u_c_log in '..\..\Lib\Socket\Winsockclasses\u_c_log.pas',
  u_c_basic_object in '..\..\Lib\Socket\Winsockclasses\u_c_basic_object.pas',
  u_c_display in '..\..\Lib\Socket\Winsockclasses\u_c_display.pas',
  u_types_constants in '..\..\Lib\Socket\Winsockunits\u_types_constants.pas',
  u_characters in '..\..\Lib\Socket\Winsockunits\u_characters.pas',
  u_dir in '..\..\Lib\Socket\Winsockunits\u_dir.pas',
  u_display_hex_2 in '..\..\Lib\Socket\Winsockunits\u_display_hex_2.pas',
  u_file in '..\..\Lib\Socket\Winsockunits\u_file.pas',
  u_strings in '..\..\Lib\Socket\Winsockunits\u_strings.pas',
  uSHFingerRegistDevice in '..\..\..\[LIB]\SHFinger\fmSHFingerRegistDevice\uSHFingerRegistDevice.pas' {fmSHFingerRegistDevice},
  FINGERAPI22 in '..\..\..\[LIB]\SHFinger\FINGERAPI22.PAS',
  uSHComModule in '..\..\..\[LIB]\SHFinger\uSHComModule.pas' {dmSHComModule: TDataModule},
  uSyFpReaderFunction in '..\..\..\[LIB]\SHFinger\uSyFpReaderFunction.pas',
  uDBCreate in '..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uDBFunction in '..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  udmFormFunction in '..\..\Lib\udmFormFunction.pas' {dmFormFunction: TDataModule},
  uSHFingerDeviceReg in 'fmEmploy\uSHFingerDeviceReg.pas' {fmSHFingerDeviceReg},
  uSHFDBRelay in '..\..\Lib\SHFDBRelay\uSHFDBRelay.pas' {dmSHFDBRelay: TDataModule},
  uSystemLoginReport in 'fmSystemLoginReport\uSystemLoginReport.pas' {fmSystemLoginReport},
  uDeviceState in '..\..\Lib\uDeviceState.pas' {dmDeviceState: TDataModule};

{$R *.res}
{$R manifest.RES}

begin
  Application.Initialize;
  Application.Title := '서버모니터링';
  Application.CreateForm(TdmAdoRelay, dmAdoRelay);
  Application.CreateForm(TdmAdoQuery, dmAdoQuery);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TdmDBFunction, dmDBFunction);
  Application.CreateForm(TdmSHFDBRelay, dmSHFDBRelay);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmDeviceState, dmDeviceState);
  Application.Run;
end.
