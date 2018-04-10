program zReg;

uses
  Forms,
  uMain in 'uMain.pas' {MainForm},
  uLomosUtil in 'uLomosUtil.pas',
  systeminfos in 'systeminfos.pas',
  uComParsing in 'uComParsing.pas',
  uComSentence in 'uComSentence.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
