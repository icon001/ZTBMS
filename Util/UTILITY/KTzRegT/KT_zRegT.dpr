program KT_zRegT;

{%File 'zRegT.inc'}

uses
  Forms,
  uMain in 'uMain.pas' {Form_Main},
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
  uSensor in 'uSensor.pas' {fmSensor},
  uAddSensor in 'uAddSensor.pas' {fmAddSensor},
  uKTReg in 'uKTReg.pas' {fmKTReg},
  uLomosUtil in 'uLomosUtil.pas';

{Form_RegCard}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TfmTimeSync, fmTimeSync);
  Application.CreateForm(TfmConfig, fmConfig);
  Application.CreateForm(TfmLogin, fmLogin);
  Application.CreateForm(TfmCopy, fmCopy);
  Application.CreateForm(TfmSensor, fmSensor);
  Application.CreateForm(TfmAddSensor, fmAddSensor);
  Application.CreateForm(TfmKTReg, fmKTReg);
  Application.Run;
end.
