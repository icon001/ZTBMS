program Calendar;

{$R '�׸�\cursor.res' '�׸�\cursor.rc'}

uses
  Forms,
  Main_Frm in 'Main_Frm.pas' {Main_Form},
  Memo_Frm in 'Memo_Frm.pas' {Memo_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '����';
  Application.CreateForm(TMain_Form, Main_Form);
  Application.Run;
end.
