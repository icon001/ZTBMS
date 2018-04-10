program KeyZen;

uses
  Forms,
  uKeyzen in 'uKeyzen.pas' {Form1},
  DIMime in '..\..\..\Lib\DIMime.pas',
  uLomosUtil in '..\..\..\Lib\uLomosUtil.pas';

{$R *.res}
{$R manifest.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
