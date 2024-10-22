unit uStartReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmStartReg = class(TForm)
    Label1: TLabel;
    ed_exec: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmStartReg: TfmStartReg;

implementation

uses
  uMain;
{$R *.dfm}

procedure TfmStartReg.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfmStartReg.Button2Click(Sender: TObject);
begin
  fmMain.CreateWindowStartRegKey(ExtractFileName(ed_exec.Text) ,ed_exec.Text);
end;

end.
