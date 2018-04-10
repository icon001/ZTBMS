program EmployeeConversion;

uses
  Forms,
  Windows,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uCommonVariable in '..\lib\uCommonVariable.pas',
  DIMime in '..\lib\DIMime.pas',
  uLomosUtil in '..\lib\uLomosUtil.pas',
  uDBModule in '..\lib\uDBModule.pas' {dmDBModule: TDataModule},
  uDataBaseConfig in '..\lib\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uMappingCode in 'fmMappingCode\uMappingCode.pas' {fmMappingCode},
  uSubForm in '..\lib\uSubForm.pas' {fmASubForm},
  uConfig in 'fmConfig\uConfig.pas' {fmConfig},
  uKTBundangCurrentState in 'fmKTBundangCurrentState\uKTBundangCurrentState.pas' {fmKTBundangCurrentState},
  uServerCurrentState in 'fmServerCurrentState\uServerCurrentState.pas' {fmServerCurrentState},
  udmAdoRelay in '..\lib\udmAdoRelay.pas' {dmAdoRelay: TDataModule},
  uCommonSql in '..\lib\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\lib\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\lib\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\lib\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\lib\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uDeviceCurrentState in 'fmDeviceCurrentState\uDeviceCurrentState.pas' {fmDeviceCurrentState},
  uChungNamCurrentState in 'fmChungNamCurrentState\uChungNamCurrentState.pas' {fmChungNamCurrentState},
  uJUNNAMCurrentState in 'fmJUNNAMCurrentState\uJUNNAMCurrentState.pas' {fmJUNNAMCurrentState},
  uQueryTest in 'fmConfig\uQueryTest.pas' {fmQueryTest};

{$R *.res}
var
hMutex : LongInt;
begin
  hMutex := OpenMutex( MUTEX_ALL_ACCESS, False, pchar('DEVICECHANGE') );
  If hMutex <> 0 Then
  Begin
  CloseHandle( hMutex );
  Exit;
  End;
  hMutex := CreateMutex( Nil, False, pchar('DEVICECHANGE') );
  Application.Initialize;
  Application.Title := '사원연동 시스템';
  Application.CreateForm(TdmDBModule, dmDBModule);
  Application.CreateForm(TdmAdoRelay, dmAdoRelay);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmQueryTest, fmQueryTest);
  Application.Run;
end.
