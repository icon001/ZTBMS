program OldDataBaseRecovery;

uses
  Forms,
  uDataBaseConvert in 'uDataBaseConvert.pas' {Form1},
  DIMime in '..\..\Lib\DIMime.pas',
  uLomosUtil in '..\..\Lib\uLomosUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
