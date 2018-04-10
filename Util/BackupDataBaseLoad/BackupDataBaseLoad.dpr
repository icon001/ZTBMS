program BackupDataBaseLoad;

uses
  Forms,
  uBackupDataBaseLoad in 'uBackupDataBaseLoad.pas' {Form1},
  uDataBaseConfig in '..\..\Lib\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDataModule1 in '..\..\Lib\uDataModule1.pas' {DataModule1: TDataModule},
  DIMime in '..\..\Lib\DIMime.pas',
  uLomosUtil in '..\..\Lib\uLomosUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmDataBaseConfig, fmDataBaseConfig);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
