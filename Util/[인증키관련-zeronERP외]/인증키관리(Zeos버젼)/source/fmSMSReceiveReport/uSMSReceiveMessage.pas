unit uSMSReceiveMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmSMSReceiveMessage = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mem_Message: TMemo;
    Button1: TButton;
    ed_Telnumber: TEdit;
    ed_UserName: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSMSReceiveMessage: TfmSMSReceiveMessage;

implementation

{$R *.dfm}

procedure TfmSMSReceiveMessage.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
