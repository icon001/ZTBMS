unit uMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TfmMessage = class(TForm)
    lb_Message: TLabel;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
  private
    FCount: integer;
    FTotCount: integer;
    FLabelText: string;
    procedure SetCount(const Value: integer);
    procedure SetLabelText(const Value: string);
    procedure SetTotCount(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property TotCount : integer read FTotCount write SetTotCount;
    property Count : integer read FCount write SetCount;
    property LabelText : string read FLabelText write SetLabelText;
  end;

var
  fmMessage: TfmMessage;

implementation

{$R *.dfm}

procedure TfmMessage.FormCreate(Sender: TObject);
begin
  TotCount := 0;
end;

procedure TfmMessage.SetCount(const Value: integer);
begin
  if Value > TotCount then Exit;
  FCount := Value;
  ProgressBar1.Position := Value; // (Value * 100) div TotCount;
end;

procedure TfmMessage.SetLabelText(const Value: string);
begin
  FLabelText := Value;
  lb_Message.Caption := Value;
end;

procedure TfmMessage.SetTotCount(const Value: integer);
begin
  FTotCount := Value;
  ProgressBar1.Max := Value;
end;

end.
