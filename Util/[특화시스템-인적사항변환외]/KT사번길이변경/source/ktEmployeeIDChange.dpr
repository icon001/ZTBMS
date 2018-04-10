program ktEmployeeIDChange;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uDataBaseConfig in '..\lib\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  udmAdoQuery in '..\lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  DIMime in '..\lib\DIMime.pas',
  uDataModule1 in '..\lib\uDataModule1.pas' {DataModule1: TDataModule},
  uPostGreSql in '..\lib\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uCommonSql in '..\lib\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\lib\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\lib\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\lib\Query\uMssql.pas' {Mssql: TDataModule},
  uLomosUtil in '..\lib\uLomosUtil.pas',
  uMSDEsql in '..\lib\Query\uMSDEsql.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'KT사원번호변경프로그램';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
