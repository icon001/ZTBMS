program CnuPersonConvert;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  DIMime in '..\Lib\DIMime.pas',
  uLomosUtil in '..\Lib\uLomosUtil.pas',
  uSubForm in '..\Lib\uSubForm.pas' {fmASubForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmASubForm, fmASubForm);
  Application.Run;
end.
