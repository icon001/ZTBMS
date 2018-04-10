program ServerSetup;

uses
  Forms,
  uMain in 'uMain.pas' {Form1},
  uLomosUtil in '..\..\..\Lib\uLomosUtil.pas',
  DIMime in '..\..\..\Lib\DIMime.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
