unit uConnectStatusMsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons;

type
  TfmConnectStatusMsg = class(TForm)
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    WaitTimer: TTimer;
    procedure WaitTimerTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConnectStatusMsg: TfmConnectStatusMsg;

implementation

{$R *.dfm}

procedure TfmConnectStatusMsg.WaitTimerTimer(Sender: TObject);
begin
  Close;
end;

procedure TfmConnectStatusMsg.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
