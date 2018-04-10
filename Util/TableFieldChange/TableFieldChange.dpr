program TableFieldChange;

uses
  Forms,
  uTableFieldChange in 'uTableFieldChange.pas' {Form1},
  uDataBaseConfig in '..\..\..\[LIB]\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDataModule1 in '..\..\Lib\uDataModule1.pas' {DataModule1: TDataModule},
  uLomosUtil in '..\..\Lib\uLomosUtil.pas',
  DIMime in '..\..\Lib\DIMime.pas',
  uMSDEsql in '..\..\Lib\uMSDEsql.pas',
  uPostGreSql in '..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uCommonSql in '..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmDataBaseConfig, fmDataBaseConfig);
  Application.Run;
end.
