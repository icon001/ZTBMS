program ZTBMSToGMS;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uMIAMSDataBase in 'uMIAMSDataBase.pas' {dmGMSDataBase: TDataModule},
  uKTAMSDataBase in 'uKTAMSDataBase.pas' {dmZTBMSDataBase: TDataModule},
  uCommonFunction in 'uCommonFunction.pas',
  uCommonVariable in 'uCommonVariable.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmGMSDataBase, dmGMSDataBase);
  Application.CreateForm(TdmZTBMSDataBase, dmZTBMSDataBase);
  Application.Run;
end.
