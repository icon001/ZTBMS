program CnuCardNoInitialize;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  DIMime in '..\Lib\DIMime.pas',
  uLomosUtil in '..\Lib\uLomosUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
