unit uUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TfmUser = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnOk: TSpeedButton;
    btnCancel: TSpeedButton;
    ed_name: TEdit;
    ed_Phone: TEdit;
    st_msg: TStaticText;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    L_bOK : Boolean;
    { Public declarations }
  end;

var
  fmUser: TfmUser;

implementation

{$R *.dfm}

procedure TfmUser.btnCancelClick(Sender: TObject);
begin
  L_bOK := False;
  Close;
end;

procedure TfmUser.btnOkClick(Sender: TObject);
begin
  if Length(ed_name.Text) < 3 then
  begin
    showmessage('�̸��� ��Ȯ�� �Է� �ϼ���.');
    ed_name.SetFocus;
    Exit;
  end;
  if Length(ed_Phone.Text) < 10 then
  begin
    showmessage('��ȭ��ȣ�� ��Ȯ�� �Է� �ϼ���.');
    ed_Phone.SetFocus;
    Exit;
  end;
  L_bOK := True;
  Close;
end;

end.