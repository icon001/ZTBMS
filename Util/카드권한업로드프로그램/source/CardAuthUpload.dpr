program CardAuthUpload;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {Form1},
  uDataModule1 in '..\..\..\Lib\uDataModule1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
