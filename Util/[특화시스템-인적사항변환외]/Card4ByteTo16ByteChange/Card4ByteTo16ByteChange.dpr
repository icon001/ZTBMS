program Card4ByteTo16ByteChange;

uses
  Forms,
  uCard4ByteTo16ByteChange in 'uCard4ByteTo16ByteChange.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Card04To16';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
