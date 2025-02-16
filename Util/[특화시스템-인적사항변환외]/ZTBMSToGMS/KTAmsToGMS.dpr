program KTAmsToGMS;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fmMain},
  uMIAMSDataBase in 'uMIAMSDataBase.pas' {dmMIAMSDataBase: TDataModule},
  uKTAMSDataBase in 'uKTAMSDataBase.pas' {dmKTAMSDataBase: TDataModule},
  uCommonVariable in 'uCommonVariable.pas',
  uCommonFunction in 'uCommonFunction.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmMIAMSDataBase, dmMIAMSDataBase);
  Application.CreateForm(TdmKTAMSDataBase, dmKTAMSDataBase);
  Application.Run;
end.
