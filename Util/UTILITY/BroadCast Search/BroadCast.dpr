program BroadCast;

uses
  Forms,
  uBroadCast in 'uBroadCast.pas' {fmMain},
  uLomosUtil in '..\..\..\Lib\uLomosUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
