unit uInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmInfo = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInfo: TfmInfo;

implementation
uses
  uMain;
{$R *.dfm}

procedure TfmInfo.FormActivate(Sender: TObject);
begin
label3.Caption := datetimetostr(Form_Main.getfilelastwritetime(Application.ExeName));
end;

end.
