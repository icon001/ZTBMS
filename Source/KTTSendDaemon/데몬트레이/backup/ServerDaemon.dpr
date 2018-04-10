program ServerDaemon;

uses
  Forms,
  WinProcs,
  uServerDaemon in 'uServerDaemon.pas' {fmMain},
  uLogin in '..\비밀번호체크\uLogin.pas' {fmLogin},
  uDataModule1 in '..\..\..\Lib\uDataModule1.pas' {DataModule1: TDataModule},
  uLomosUtil in '..\..\..\Lib\uLomosUtil.pas',
  uMSDEsql in '..\..\..\Lib\uMSDEsql.pas',
  DIMime in '..\..\..\Lib\DIMime.pas',
  uPwChange in '..\비밀번호변경\uPwChange.pas' {fmPwChange},
  uDevicemodule in '..\..\..\Lib\uDevicemodule.pas' {ComModule: TDataModule},
  uDataBaseConfig in '..\..\..\Lib\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCurrentState in '..\실시간송수신현황조회\uCurrentState.pas' {fmCurrentState},
  uSubForm in '..\..\..\Lib\uSubForm.pas' {fmASubForm},
  uDeviceCode in '..\..\KTMOS\fmDeviceCode\uDeviceCode.pas' {fmDeviceCode},
  uLocateCode in '..\..\KTMOS\fmLocateCode\uLocateCode.pas' {fmLocateCode},
  uAttendConfig in '..\환경설정\uAttendConfig.pas' {fmAttendConfig},
  uPositionSet in '..\기기위치등록\uPositionSet.pas' {fmPositionSet},
  DoorSchReg in '..\스케줄등록\DoorSchReg.pas' {DoorscheduleRegForm},
  uSchadule in '..\스케줄등록\uSchadule.pas' {fmSchadule},
  udmAdoQuery in '..\..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uDeviceConnectState in '..\기기접속현황\uDeviceConnectState.pas' {fmDeviceConnectState},
  uNetConfig in '..\통신환경설정\uNetConfig.pas' {fmNetConfig},
  uDoorAdmin in '..\출입문관리\uDoorAdmin.pas' {fmDoorAdmin},
  uAlaramDeviceAdmin in '..\방범기기관리\uAlaramDeviceAdmin.pas' {fmAlaramDeviceAdmin},
  uAlarmZoneAdmin in '..\방범존관리\uAlarmZoneAdmin.pas' {fmAlarmZoneAdmin},
  uFoodAdmin in '..\식수기기관리\uFoodAdmin.pas' {fmFoodAdmin};

{$R *.res}
var
hMutex : LongInt;
begin
  hMutex := OpenMutex( MUTEX_ALL_ACCESS, False, 'KTMOS_DAEMON' );
  If hMutex <> 0 Then
  Begin
  CloseHandle( hMutex );
  Exit;
  End;
  hMutex := CreateMutex( Nil, False, 'KTMOS_DAEMON' );
  Application.Initialize;

  Application.CreateForm(TDataModule1, DataModule1);
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
