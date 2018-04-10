program EmergencyControl;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uSocket in 'uSocket.pas' {dmSocket: TDataModule},
  DIMime in 'DIMime.pas',
  uCheckValiable in 'uCheckValiable.pas',
  uLomosUtil in 'uLomosUtil.pas',
  uCommon in 'uCommon.pas' {dmCommon: TDataModule},
  uConnectStatusMsg in 'fmConnectStatusMsg\uConnectStatusMsg.pas' {fmConnectStatusMsg};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmSocket, dmSocket);
  Application.CreateForm(TdmCommon, dmCommon);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
