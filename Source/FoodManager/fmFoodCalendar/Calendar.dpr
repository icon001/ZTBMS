program Calendar;

{$R '그림\cursor.res' '그림\cursor.rc'}

uses
  Forms,
  Main_Frm in 'Main_Frm.pas' {Main_Form},
  Memo_Frm in 'Memo_Frm.pas' {Memo_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '고구마';
  Application.CreateForm(TMain_Form, Main_Form);
  Application.Run;
end.
