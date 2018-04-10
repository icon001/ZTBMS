program KTCardWriter;

uses
  Forms,
  uComTest in 'uComTest.pas' {fmMain},
  uLomosUtil in 'uLomosUtil.pas',
  DIMime in 'DIMime.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
