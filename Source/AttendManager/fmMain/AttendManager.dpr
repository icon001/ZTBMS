program AttendManager;

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
  uPerFdState in '..\fmPerFdState\uPerFdState.pas' {fmPerFdState},
  uFDStateCalc in '..\fmFDStateCalc\uFDStateCalc.pas' {fmFDStateCalc},
  uLomosUtil in '..\..\..\Lib\uLomosUtil.pas',
  uTheZoneAtFileSave in '..\fmTheZoneAtFile\uTheZoneAtFileSave.pas' {fmTheZonAtFileSave},
  uDepartATReport in '..\fmDepartATReport\uDepartATReport.pas' {fmDepartAtReport},
  uATIncode in '..\fmATIncode\uATIncode.pas' {fmATIncode},
  uATOutcode in '..\fmATOutcode\uATOutcode.pas' {fmATOutcode},
  uATConfig in '..\fmATConfig\uATConfig.pas' {fmATConfig},
  uATTypeAdmin in '..\fmATTypeAdmin\uATTypeAdmin.pas' {fmATTypeAdmin},
  uCompanyCodeLoad in '..\..\..\Lib\uCompanyCodeLoad.pas',
  uGradeCode in '..\fmGradeCode\uGradeCode.pas' {fmGradeCode},
  uGradeProgram in '..\fmGradeProgram\uGradeProgram.pas' {fmGradeProgram},
  uCompanyGrade in '..\fmAdmin\uCompanyGrade.pas' {fmCompanyGrade},
  uAdmin in '..\fmAdmin\uAdmin.pas' {fmAdmin},
  uAdminGrade in '..\fmAdminGrade\uAdminGrade.pas' {fmAdminGrade},
  uVacation in '..\fmVacation\uVacation.pas' {fmVacation},
  uHoliday in '..\fmHoliday\uHoliday.pas' {fmHoliday},
  uZipCode in '..\fmZipCode\uZipCode.pas' {fmZipCode},
  uEmploy in '..\fmEmploy\uEmploy.pas' {fmEmploy},
  uATVAcode in '..\fmATVAcode\uATVAcode.pas' {fmATVAcode},
  udmAdoQuery in '..\..\..\Lib\udmAdoQuery.pas' {dmAdoQuery: TDataModule},
  uDaySummary in '..\fmDaySummary\uDaySummary.pas' {fmDaySummary},
  uATD2DStatReport in '..\fmATD2DStatReport\uATD2DStatReport.pas' {fmATD2DStatReport},
  uExtraCodeAdmin in '..\fmExtraCodeAdmin\uExtraCodeAdmin.pas' {fmExtraCodeAdmin},
  uEmployExtraAdmin in '..\fmEmployExtraAdmin\uEmployExtraAdmin.pas' {fmEmployExtraAdmin},
  uBatchEmployee in '..\fmBatchEmployee\uBatchEmployee.pas' {fmBatchEmployee},
  uCompanyCode in '..\fmCompanyCode\uCompanyCode.pas' {fmCompanyCode},
  uMonitoring in '..\fmMointoring\uMonitoring.pas' {fmMonitoring},
  uD2DATHistoryReport in '..\fmD2DATHistoryReport\uD2DATHistoryReport.pas' {fmD2DATHistoryReport},
  uD2DNonProcessReport in '..\fmD2DNonProcessReport\uD2DNonProcessReport.pas' {fmD2DNonProcessReport},
  uDepartATAdmin in '..\fmDepartATAdmin\uDepartATAdmin.pas' {fmDepartATAdmin},
  uSummary in '..\fmSummary\uSummary.pas' {fmSummary},
  uReAtInsert_New in '..\fmReAtInsert\uReAtInsert_New.pas' {fmReAtInsert},
  uAttendCommon in '..\..\..\Lib\uAttendCommon.pas',
  uAttendUpdate in '..\fmDepartATAdmin\fmAttendUpdate\uAttendUpdate.pas' {fmAttendUpdate},
  systeminfos in '..\..\..\Lib\systeminfos.pas',
  uDataBaseConfig in '..\..\..\..\[LIB]\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCommonSql in '..\..\..\..\[LIB]\Query\uCommonSql.pas' {CommonSql: TDataModule},
  uFireBird in '..\..\..\..\[LIB]\Query\uFireBird.pas' {FireBird: TDataModule},
  uMDBSql in '..\..\..\..\[LIB]\Query\uMDBSql.pas' {MDBSql: TDataModule},
  uMssql in '..\..\..\..\[LIB]\Query\uMssql.pas' {Mssql: TDataModule},
  uPostGreSql in '..\..\..\..\[LIB]\Query\uPostGreSql.pas' {PostGreSql: TDataModule},
  uDataModule1 in '..\..\..\..\[LIB]\uDataModule1.pas' {DataModule1: TDataModule},
  udmAttendEvent in '..\..\..\Lib\udmAttendEvent.pas' {dmAttendEvent: TDataModule},
  UCommonModule in '..\..\..\Lib\UCommonModule.pas' {CommonModule: TDataModule},
  uAtFileSave in '..\fmAtFileSave\uAtFileSave.pas' {fmAtFileSave},
  uWorkCodeType in '..\fmWorkCodeType\uWorkCodeType.pas' {fmWorkCodeType},
  uZTBMSFunction in '..\..\..\Lib\uZTBMSFunction.pas',
  udmDaySummary in '..\..\..\Lib\Attend\udmDaySummary.pas' {dmDaySummary: TDataModule},
  uRealD2DATReport in '..\fmRealD2DATReport\uRealD2DATReport.pas' {fmRealD2DATReport},
  uRealATListReport in '..\fmRealATListReport\uRealATListReport.pas' {fmRealATListReport},
  uExcelSave in '..\..\..\Lib\Excel\uExcelSave.pas' {dmExcelSave: TDataModule},
  uEmployeeBranch in '..\fmEmployeeBranch\uEmployeeBranch.pas' {fmEmployeeBranch},
  uEmCodeChange in '..\..\ZMOS\fmEmCodeChange\uEmCodeChange.pas' {fmEmCodeChange},
  uRealATReport in '..\fmRealATReport\uRealATReport.pas' {fmRealATReport},
  uAceAtFileSave in '..\fmAceAtFileSave\uAceAtFileSave.pas' {fmAceAtFileSave},
  uDBCreate in '..\..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uSTXAtFileSend in '..\fmSTXAtFileSend\uSTXAtFileSend.pas' {fmSTXAtFileSend},
  uRelayDB in '..\..\..\Lib\DataBase\uRelayDB.pas' {dmRelayDB: TDataModule},
  uHizAtFileSave in '..\fmHizAtFileSave\uHizAtFileSave.pas' {fmHizAtFileSave},
  uOption in '..\fmTheZoneAtFile\uOption.pas' {fmTheZoneOption},
  uDBFunction in '..\..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  uMonthATReport in '..\fmMonthATReport\uMonthATReport.pas' {fmMonthATReport};

{$R *.res}
{$R manifest.RES}

begin
  Application.Initialize;
  Application.Title := '근태보고서';
  Application.CreateForm(TdmDaySummary, dmDaySummary);
  Application.CreateForm(TdmAttendEvent, dmAttendEvent);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmDBCreate, dmDBCreate);
  Application.CreateForm(TdmRelayDB, dmRelayDB);
  Application.CreateForm(TdmDBFunction, dmDBFunction);
  Application.Run;
end.
