unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmMain = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  public
  end;

var
  fmMain: TfmMain;

implementation
uses
  u3MPserver;
{$R *.dfm}

{ TForm1 }


procedure TfmMain.Button1Click(Sender: TObject);
begin
  dm3MPServer.KTServerIP := '220.90.216.90';
  dm3MPServer.KTServerPort := '10020';
  dm3MPServer.SocketOpen := True;

  if dm3MPServer.KTServerConnected then
  begin
    dm3MPServer.KTServerChannelAuth('OPEN_TCP_001PTL001_1000000976','icon00D1445413486732','51eph0ot3');
  end;
end;

end.
