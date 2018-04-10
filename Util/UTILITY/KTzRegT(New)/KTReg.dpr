program KTReg;



uses
  Forms,
  uwinzet in 'uwinzet.pas' {Form_wiznet},
  uAppendECU in 'uAppendECU.pas' {Form_AddECU},
  uSetcomm in 'uSetcomm.pas' {Form_SetComPort},
  uCardReg in 'uCardReg.pas',
  DoorSchReg in 'DoorSchReg.pas' {DoorscheduleRegForm},
  uTotalComCheck in 'uTotalComCheck.pas' {fmTotalComCheck},
  uDeviceComChk in 'uDeviceComChk.pas' {fmDeviceComChk},
  uInfo in 'uInfo.pas' {fmInfo},
  uTimeSync in 'uTimeSync.pas' {fmTimeSync},
  uConfig in 'uConfig.pas' {fmConfig},
  uLogin in 'uLogin.pas' {fmLogin},
  uCopy in 'uCopy.pas' {fmCopy},
  uHoliday in 'uHoliday.pas' {Form_Holiday},
  uLomosUtil in 'uLomosUtil.pas',
  uNewMain in 'uNewMain.pas' {fmMain},
  uProgConfig in 'uProgConfig.pas' {fmProgConfig},
  uPCommon in 'uPCommon.pas' {DataModule2: TDataModule};

{Form_RegCard}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmProgConfig, fmProgConfig);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
