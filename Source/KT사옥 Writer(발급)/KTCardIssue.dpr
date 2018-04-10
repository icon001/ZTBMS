program KTCardIssue;

uses
  Forms,
  uComTest in 'uComTest.pas' {Form1},
  uLomosUtil in 'uLomosUtil.pas',
  DIMime in 'DIMime.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
