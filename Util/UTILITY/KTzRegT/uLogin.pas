unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TfmLogin = class(TForm)
    Label1: TLabel;
    ed_OrgPw: TEdit;
    Bevel1: TBevel;
    sbLogin: TSpeedButton;
    sbCancel: TSpeedButton;
    procedure sbCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bLogined:Boolean;
    OrgPW:string;
  end;

var
  fmLogin: TfmLogin;

implementation

{$R *.dfm}

procedure TfmLogin.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLogin.FormCreate(Sender: TObject);
begin
  bLogined := False;
end;

procedure TfmLogin.sbLoginClick(Sender: TObject);
begin
  if ed_OrgPw.Text = OrgPW then
  begin
    bLogined := True;
    Close;
    Exit;
  end;
  showmessage('비밀번호가 틀렸습니다');
  ed_OrgPw.SetFocus;
end;

end.
