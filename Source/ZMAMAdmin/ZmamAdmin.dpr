program ZmamAdmin;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  DIMime in '..\..\Lib\DIMime.pas',
  uLomosUtil in '..\..\Lib\uLomosUtil.pas',
  uMSDEsql in '..\..\Lib\uMSDEsql.pas',
  uMapAdd in 'fmMapAdd\uMapAdd.pas' {fmMapAdd},
  uMapArea in 'fmMapArea\uMapArea.pas' {fmMapArea},
  GR32_GausianBlur in '..\..\Lib\gr32\GR32_GausianBlur.pas',
  GR32_Lines in '..\..\Lib\gr32\GR32_Lines.pas',
  GR32_Misc2 in '..\..\Lib\gr32\GR32_Misc2.pas',
  GR32_Misc in '..\..\Lib\gr32\GR32_Misc.pas',
  GR32_Objects in '..\..\Lib\gr32\GR32_Objects.pas',
  GR32_ObjStore in '..\..\Lib\gr32\GR32_ObjStore.pas',
  GR32_StackBlur in '..\..\Lib\gr32\GR32_StackBlur.pas',
  GR32_Text in '..\..\Lib\gr32\GR32_Text.pas',
  GDIPAPI in '..\..\Lib\gr32\GDIPAPI.pas',
  gr32Util in '..\..\Lib\gr32\gr32Util.pas',
  uMapSensor in 'fmMapSensor\uMapSensor.pas' {fmMapSensor},
  uDataBaseConfig in '..\..\..\[LIB]\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCommonSql in '..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uDataModule1 in '..\..\..\[LIB]\uDataModule1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
