program CardReg;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uLomosUtil in '..\Lib\uLomosUtil.pas',
  DIMime in '..\Lib\DIMime.pas',
  uSubForm in '..\..\..\..\Lib\uSubForm.pas' {fmASubForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmASubForm, fmASubForm);
  Application.Run;
end.
