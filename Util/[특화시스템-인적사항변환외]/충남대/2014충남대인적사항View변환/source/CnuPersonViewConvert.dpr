program CnuPersonViewConvert;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  DIMime in '..\Lib\DIMime.pas',
  uLomosUtil in '..\Lib\uLomosUtil.pas',
  uSubForm in '..\Lib\uSubForm.pas' {fmASubForm},
  uAdoRelay in 'uAdoRelay.pas' {dmAdoRelay: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmASubForm, fmASubForm);
  Application.CreateForm(TdmAdoRelay, dmAdoRelay);
  Application.Run;
end.
