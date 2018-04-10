program KTAtReport;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uPerATAdmin in '..\fmPerATAdmin\uPerATAdmin.pas' {fmPerATAdmin},
  uDataModule1 in '..\..\..\Lib\uDataModule1.pas' {DataModule1: TDataModule},
  uSubForm in '..\..\..\Lib\uSubForm.pas' {fmASubForm},
  uMSDEsql in '..\..\..\Lib\uMSDEsql.pas',
  uDataBaseConfig in '..\..\..\Lib\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  DIMime in '..\..\..\Lib\DIMime.pas',
  uLogin in '..\..\..\Lib\Login\uLogin.pas' {fmLogin},
  uDataBaseUtil in '..\..\..\Lib\uDataBaseUtil.pas' {DataBaseUtil: TDataModule},
  uMsg in '..\..\..\Lib\uMsg.pas',
  uPerAtReport in '..\fmPerAtReport\uPerAtReport.pas' {fmPerAtReport},
  uJikakReport in '..\fmJikakReport\uJikakReport.pas' {fmJikakReport},
  uJotaeReport in '..\fmJotaeReport\uJotaeReport.pas' {fmJotaeReport},
  uD2DATReport in '..\fmD2DATReport\uD2DATReport.pas' {fmD2DATReport},
  uNonATReport in '..\fmNonATReport\uNonATReport.pas' {fmNonATReport},
  uATStateCalc in '..\fmATStateCalc\uATStateCalc.pas' {fmATStateCalc},
  uMonATState in '..\fmMonATState\uMonATState.pas' {fmMonATState},
  uPerATState in '..\fmPerATState\uPerATState.pas' {fmPerATState},
  uFoodAdmin in '..\fmFoodAdmin\uFoodAdmin.pas' {fmFoodAdmin},
  uPersonFdReport in '..\fmPersonFdReport\uPersonFdReport.pas' {fmPersonFdReport},
  uD2DFdReport in '..\fmD2DFdReport\uD2DFdReport.pas' {fmD2DFdReport},
  uPerFdState in '..\fmPerFdState\uPerFdState.pas' {fmPerFdState},
  uFDStateCalc in '..\fmFDStateCalc\uFDStateCalc.pas' {fmFDStateCalc},
  uLomosUtil in '..\..\..\Lib\uLomosUtil.pas',
  uDepartATAdmin in '..\fmDepartATAdmin\uDepartATAdmin.pas' {fmDepartATAdmin},
  uDepartATReport in '..\fmDepartATReport\uDepartATReport.pas' {fmDepartAtReport},
  uATIncode in '..\fmATIncode\uATIncode.pas' {fmATIncode},
  uATOutcode in '..\fmATOutcode\uATOutcode.pas' {fmATOutcode},
  uATConfig in '..\fmATConfig\uATConfig.pas' {fmATConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmATConfig, fmATConfig);
  Application.Run;
end.
