program SmartPhoneList;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  DIMime in '..\lib\DIMime.pas',
  uCommonVariable in '..\lib\uCommonVariable.pas',
  uDBModule in '..\lib\uDBModule.pas' {dmDBModule: TDataModule},
  uLomosUtil in '..\lib\uLomosUtil.pas',
  uDataBaseConfig in '..\lib\DBConnect\uDataBaseConfig.pas' {fmDataBaseConfig},
  uConfig in 'fmConfig\uConfig.pas' {fmConfig},
  uEmployee in 'fmEmployee\uEmployee.pas' {fmEmploy},
  uSubForm in '..\lib\uSubForm.pas' {fmASubForm},
  uMonitor in 'fmMonitor\uMonitor.pas' {fmMonitor};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '스마트폰 통신프로그램';
  Application.CreateForm(TdmDBModule, dmDBModule);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmASubForm, fmASubForm);
  Application.Run;
end.
