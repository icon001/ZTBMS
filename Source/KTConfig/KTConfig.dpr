program KTConfig;

uses
  Forms,
  uktConfig in 'uktConfig.pas' {Form1},
  uDataBaseConfig in '..\..\Lib\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDataModule1 in '..\..\Lib\uDataModule1.pas' {DataModule1: TDataModule},
  uLomosUtil in '..\..\Lib\uLomosUtil.pas',
  DIMime in '..\..\Lib\DIMime.pas',
  uMSDEsql in '..\..\Lib\uMSDEsql.pas',
  uPostGreSql in '..\..\Lib\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uCommonSql in '..\..\Lib\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uMDBSql in '..\..\Lib\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\Lib\Query\uMssql.pas' {Mssql: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TPostGreSql, PostGreSql);
  Application.CreateForm(TCommonSql, CommonSql);
  Application.CreateForm(TMDBSql, MDBSql);
  Application.CreateForm(TMssql, Mssql);
  Application.Run;
end.
