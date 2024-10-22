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
  uSTXChangWonCurrentState in 'fmSTXChangWonCurrentState\uSTXChangWonCurrentState.pas' {fmSTXChangWonCurrentState},
  uServerCurrentState in 'fmServerCurrentState\uServerCurrentState.pas' {fmServerCurrentState},
  udmAdoRelay in '..\lib\udmAdoRelay.pas' {dmAdoRelay: TDataModule},
  uCommonSql in '..\lib\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\lib\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\lib\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\lib\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\lib\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uDeviceCurrentState in 'fmDeviceCurrentState\uDeviceCurrentState.pas' {fmDeviceCurrentState},
  uCHOSUNCurrentState in 'fmCHOSUNCurrentState\uCHOSUNCurrentState.pas' {fmCHOSUNCurrentState},
  uQuery in 'fmQuery\uQuery.pas' {fmQuery},
  uYoungGwangCurrentState in 'fmYoungGwangCurrentState\uYoungGwangCurrentState.pas' {fmYoungGwangCurrentState},
  uKTBundangCurrentState in 'fmKTBundangCurrentState\uKTBundangCurrentState.pas' {fmKTBundangCurrentState},
  uSSANGYONGCurrentState in 'fmSSANGYONGCurrentState\uSSANGYONGCurrentState.pas' {fmSSANGYONGCurrentState},
  uDongyangUniversityCurrentState in 'fmDongyangUniversityCurrentState\uDongyangUniversityCurrentState.pas' {fmDongyangUniversityCurrentState},
  uHizeAirCurrentState in 'fmHizeAirCurrentState\uHizeAirCurrentState.pas' {fmHizeAirCurrentState},
  uGroupCode in 'fmGroupCode\uGroupCode.pas' {fmGroupCode},
  uGroupGrade in 'fmGroupGrade\uGroupGrade.pas' {fmGroupGrade},
  uMapping in 'fmMapping\uMapping.pas' {fmMapping},
  uQueryTest in 'fmConfig\uQueryTest.pas' {fmQueryTest},
  uData in '..\lib\uData.pas' {dmData: TDataModule},
  uDBFunction in 'Lib\uDBFunction.pas' {dmDBFunction: TDataModule},
  uYounseUniversityCurrentState in 'fmYounseUniversityCurrentState\uYounseUniversityCurrentState.pas' {fmYounseUniversityCurrentState},
  uHongikCurrentState in 'fmHongikCurrentState\uHongikCurrentState.pas' {fmHongikCurrentState},
  uJUNNAMCurrentState in 'fmJUNNAMCurrentState\uJUNNAMCurrentState.pas' {fmJUNNAMCurrentState},
  uDBRelayFunction in 'Lib\uDBRelayFunction.pas' {dmDBRelayFunction: TDataModule},
  uHoniK in 'Lib\uHoniK.pas' {dmHoniK: TDataModule},
  uCommon in 'Lib\uCommon.pas' {dmCommon: TDataModule};

{$R *.res}
{$R manifest.RES}

var
hMutex : LongInt;
begin
  hMutex := OpenMutex( MUTEX_ALL_ACCESS, False, pchar('EMPLOYEECHANGE') );
  If hMutex <> 0 Then
  Begin
  CloseHandle( hMutex );
  Exit;
  End;
  hMutex := CreateMutex( Nil, False, pchar('EMPLOYEECHANGE') );
  Application.Initialize;
  Application.Title := '사원연동 시스템';
  Application.CreateForm(TdmDBModule, dmDBModule);
  Application.CreateForm(TdmAdoRelay, dmAdoRelay);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmGroupCode, fmGroupCode);
  Application.CreateForm(TfmGroupGrade, fmGroupGrade);
  Application.CreateForm(TfmMapping, fmMapping);
  Application.CreateForm(TfmQueryTest, fmQueryTest);
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TdmDBFunction, dmDBFunction);
  Application.CreateForm(TdmDBRelayFunction, dmDBRelayFunction);
  Application.CreateForm(TdmHoniK, dmHoniK);
  Application.CreateForm(TdmCommon, dmCommon);
  Application.Run;
end.
