program TelNumberServer;

uses
  Forms,
  uTelNumberSearch in 'uTelNumberSearch.pas' {Form1},
  uSearchConfig in 'uSearchConfig.pas' {fmConfig},
  uDataBaseConfig in 'DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDataModule1 in 'LIB\uDataModule1.pas' {DataModule1: TDataModule},
  uLomosUtil in 'LIB\uLomosUtil.pas',
  DIMime in 'LIB\DIMime.pas',
  uMSDEsql in 'LIB\uMSDEsql.pas',
  uPhoneCall in 'uPhoneCall.pas' {fmPhoneCall};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmPhoneCall, fmPhoneCall);
  Application.Run;
end.
