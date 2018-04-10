program ServerDaemon;

uses
  Forms,
  WinProcs,
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
  uDeviceCode in '..\..\KTMOS\fmDeviceCode\uDeviceCode.pas' {fmDeviceCode},
  uLocateCode in '..\..\KTMOS\fmLocateCode\uLocateCode.pas' {fmLocateCode},
  uAttendConfig in '..\ȯ�漳��\uAttendConfig.pas' {fmAttendConfig},
  uPositionSet in '..\�����ġ���\uPositionSet.pas' {fmPositionSet},
  DoorSchReg in '..\�����ٵ��\DoorSchReg.pas' {DoorscheduleRegForm},
  uSchadule in '..\�����ٵ��\uSchadule.pas' {fmSchadule},
  udmAdoQuery in '..\..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uDeviceConnectState in '..\���������Ȳ\uDeviceConnectState.pas' {fmDeviceConnectState},
  uNetConfig in '..\���ȯ�漳��\uNetConfig.pas' {fmNetConfig},
  uDoorAdmin in '..\���Թ�����\uDoorAdmin.pas' {fmDoorAdmin},
  uAlaramDeviceAdmin in '..\���������\uAlaramDeviceAdmin.pas' {fmAlaramDeviceAdmin},
  uAlarmZoneAdmin in '..\���������\uAlarmZoneAdmin.pas' {fmAlarmZoneAdmin},
  uFoodAdmin in '..\�ļ�������\uFoodAdmin.pas' {fmFoodAdmin};

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
