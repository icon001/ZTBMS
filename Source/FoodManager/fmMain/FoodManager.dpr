program FoodManager;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uPerATAdmin in '..\fmPerATAdmin\uPerATAdmin.pas' {fmPerATAdmin},
  uSubForm in '..\..\..\Lib\uSubForm.pas' {fmASubForm},
  uMSDEsql in '..\..\..\Lib\uMSDEsql.pas',
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
  uD2DDepartFDState in '..\fmD2DDepartFDState\uD2DDepartFDState.pas' {fmD2DDepartFDState},
  uFDStateCalc in '..\fmFDStateCalc\uFDStateCalc.pas' {fmFDStateCalc},
  uLomosUtil in '..\..\..\Lib\uLomosUtil.pas',
  uDepartATAdmin in '..\fmDepartATAdmin\uDepartATAdmin.pas' {fmDepartATAdmin},
  uDepartATReport in '..\fmDepartATReport\uDepartATReport.pas' {fmDepartAtReport},
  uATIncode in '..\fmATIncode\uATIncode.pas' {fmATIncode},
  uATOutcode in '..\fmATOutcode\uATOutcode.pas' {fmATOutcode},
  uATConfig in '..\fmATConfig\uATConfig.pas' {fmATConfig},
  uFoodState in '..\식수현황조회\uFoodState.pas' {fmFoodState},
  uFoodGradeAdmin in '..\fmFoodGradeAdmin\uFoodGradeAdmin.pas' {fmFoodGradeAdmin},
  uCardAdmin in '..\fmCardAdmin\uCardAdmin.pas' {fmCardAdmin},
  uCompanyCodeLoad in '..\..\..\Lib\uCompanyCodeLoad.pas',
  uAdmin in '..\fmAdmin\uAdmin.pas' {fmAdmin},
  uCompanyGrade in '..\fmAdmin\uCompanyGrade.pas' {fmCompanyGrade},
  uGradeCode in '..\fmGradeCode\uGradeCode.pas' {fmGradeCode},
  uGradeProgram in '..\fmGradeProgram\uGradeProgram.pas' {fmGradeProgram},
  uCompanyCode in '..\fmCompanyCode\uCompanyCode.pas' {fmCompanyCode},
  uZipCode in '..\fmZipCode\uZipCode.pas' {fmZipCode},
  uEmploy in '..\fmEmploy\uEmploy.pas' {fmEmploy},
  uFoodCode in '..\fmFoodCode\uFoodCode.pas' {fmFoodCode},
  uFoodConfig in '..\fmFoodConfig\uFoodConfig.pas' {fmFoodConfig},
  uDataBaseConfig in '..\..\..\..\[LIB]\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDataModule1 in '..\..\..\..\[LIB]\uDataModule1.pas' {DataModule1: TDataModule},
  uCommonSql in '..\..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  udmAdoQuery in '..\..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uZTBMSFunction in '..\..\..\Lib\uZTBMSFunction.pas',
  uPerFdState in '..\fmPerFdState\uPerFdState.pas' {fmPerFdState},
  uD2DFdState in '..\fmD2DFdState\uD2DFdState.pas' {fmD2DFdState};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '식수보고서';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmAdoQuery, dmAdoQuery);
  Application.Run;
end.
