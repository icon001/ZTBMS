unit uConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,iniFiles;

type
  TfmConfig = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    sbLogin: TSpeedButton;
    sbCancel: TSpeedButton;
    Bevel1: TBevel;
    ed_OrgPw: TEdit;
    ed_Newpw1: TEdit;
    ed_Newpw2: TEdit;
    Label3: TLabel;
    procedure sbLoginClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OrgPW:string;
  end;

var
  fmConfig: TfmConfig;

implementation

{$R *.dfm}

procedure TfmConfig.sbLoginClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  if ed_OrgPw.Text <> OrgPW then
  begin
    showmessage('기존비밀번호가 틀립니다.');
    ed_orgpw.SetFocus;
    exit;
  end;
  if ed_Newpw1.Text <> ed_Newpw2.Text then
  begin
    showmessage('신규 비밀번호가 서로 다릅니다.');
    exit;
  end;
  ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\zRegT.INI');
  ini_fun.Writestring('Config','PW',ed_Newpw1.Text);
  Close;
end;

procedure TfmConfig.sbCancelClick(Sender: TObject);
begin
Close;
end;

end.
