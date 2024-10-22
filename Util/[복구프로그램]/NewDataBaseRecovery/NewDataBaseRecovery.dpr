program NewDataBaseRecovery;

uses
  Forms,
  uDataBaseConvert in 'uDataBaseConvert.pas' {Form1},
  uLomosUtil in '..\..\..\Lib\uLomosUtil.pas',
  DIMime in '..\..\..\Lib\DIMime.pas',
  systeminfos in '..\..\..\Lib\systeminfos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
