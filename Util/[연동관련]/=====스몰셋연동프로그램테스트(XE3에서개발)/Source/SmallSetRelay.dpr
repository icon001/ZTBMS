program SmallSetRelay;

uses
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  u3MPserver in '..\lib\3MP\u3MPserver.pas' {dm3MPServer: TDataModule},
  uLomosUtil in '..\..\..\..\Lib\uLomosUtil.pas',
  DIMime in '..\..\..\..\Lib\DIMime.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(Tdm3MPServer, dm3MPServer);
  Application.Run;
end.
