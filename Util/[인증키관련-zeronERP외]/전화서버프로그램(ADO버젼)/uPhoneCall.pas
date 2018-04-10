unit uPhoneCall;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmPhoneCall = class(TForm)
    ed_PhoneNum: TEdit;
    Label1: TLabel;
    btn_call: TButton;
    btn_Cancel: TButton;
    procedure ed_PhoneNumKeyPress(Sender: TObject; var Key: Char);
    procedure btn_callClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPhoneCall: TfmPhoneCall;

implementation

uses
  uTelNumberSearch;
{$R *.dfm}

procedure TfmPhoneCall.ed_PhoneNumKeyPress(Sender: TObject; var Key: Char);
begin
  ed_PhoneNum.text := StringReplace(ed_PhoneNum.text,'-','',[rfReplaceAll]);
  if key = #13 then
  begin
    Form1.SendSocketData('ATDT'+ ed_PhoneNum.text +#13+#10);
    Close;
  end;
end;

procedure TfmPhoneCall.btn_callClick(Sender: TObject);
begin
  Form1.SendSocketData('ATDT'+ ed_PhoneNum.text +#13+#10);
  Close;
end;

procedure TfmPhoneCall.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

end.
