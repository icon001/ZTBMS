program SCRDaemon;

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
  uDataBaseConfig in '..\..\..\Lib\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCurrentState in '..\�ǽð��ۼ�����Ȳ��ȸ\uCurrentState.pas' {fmCurrentState},
  uSubForm in '..\..\..\Lib\uSubForm.pas' {fmASubForm},
  uAttendConfig in '..\ȯ�漳��\uAttendConfig.pas' {fmAttendConfig},
  udmAdoQuery in '..\..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uDeviceConnectState in '..\���������Ȳ\uDeviceConnectState.pas' {fmDeviceConnectState},
  uNetConfig in '..\���ȯ�漳��\uNetConfig.pas' {fmNetConfig},
  uDeviceCode in '..\fmDeviceCode\uDeviceCode.pas' {fmDeviceCode},
  uSerialModule in '..\�ø�����Ÿ��\uSerialModule.pas' {SerialModule: TDataModule},
  uCommonSql in '..\..\..\Lib\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uMDBSql in '..\..\..\Lib\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\Lib\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\Lib\Query\uPostGreSql.pas' {PostGreSql: TDataModule};

{$R *.res}
var
hMutex : LongInt;
begin
  hMutex := OpenMutex( MUTEX_ALL_ACCESS, False, 'SCRMOS_DAEMON' );
  If hMutex <> 0 Then
  Begin
  CloseHandle( hMutex );
  Exit;
  End;
  hMutex := CreateMutex( Nil, False, 'SCRMOS_DAEMON' );
  Application.Initialize;

  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TSerialModule, SerialModule);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TCommonSql, CommonSql);
  Application.CreateForm(TMDBSql, MDBSql);
  Application.CreateForm(TMssql, Mssql);
  Application.CreateForm(TPostGreSql, PostGreSql);
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
