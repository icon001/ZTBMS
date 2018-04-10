program Setup;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uLomosUtil in '..\..\..\..\Lib\uLomosUtil.pas',
  DIMime in '..\..\..\..\Lib\DIMime.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
