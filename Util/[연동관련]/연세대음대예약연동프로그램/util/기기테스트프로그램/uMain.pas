unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, OoMisc, AdPort, AdWnPort;
const
  STX = #$2;
  ETX = #$3;

type
  TForm1 = class(TForm)
    WinsockPort1: TApdWinsockPort;
    btn_Send: TSpeedButton;
    ed_cardNo: TEdit;
    Memo1: TMemo;
    procedure btn_SendClick(Sender: TObject);
    procedure WinsockPort1TriggerAvail(CP: TObject; Count: Word);
  private
    L_stSendData : string;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn_SendClick(Sender: TObject);
begin
    WinsockPort1.Open := False;
    WinsockPort1.WsAddress := '127.0.0.1';
    WinsockPort1.WsPort := '7777';
    WinsockPort1.Open := True;

    L_stSendData := STX + 'C' + FormatDateTime('yyyymmddhhnnss',now) + ed_cardNo.Text + ETX;
    WinsockPort1.PutString(L_stSendData);
end;

procedure TForm1.WinsockPort1TriggerAvail(CP: TObject; Count: Word);
var
  st:String;
  I: Integer;
  aData:String;
  nIndex : integer;
  stTemp : string;
begin
  st:= '';
  for I := 1 to Count do st := st + WinsockPort1.GetChar;
  memo1.Lines.Add(st);
end;

end.
