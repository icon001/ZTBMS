unit uProgConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton;

type
  TfmProgConfig = class(TForm)
    Label1: TLabel;
    ed_DelayTime: TEdit;
    Label2: TLabel;
    ed_LoopCount: TEdit;
    Label3: TLabel;
    ed_LanTime: TEdit;
    Label4: TLabel;
    ed_LANLoop: TEdit;
    btnSave: TRzBitBtn;
    btnClose: TRzBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProgConfig: TfmProgConfig;

//  {$I zRegT.INC}

implementation
uses
uPCommon;

{$R *.dfm}

procedure TfmProgConfig.FormActivate(Sender: TObject);
begin
  ed_DelayTime.Text := inttostr(DelayTime);
  ed_LoopCount.Text := inttostr(LoopCount);
  ed_LanTime.Text := inttostr(LANTime);
  ed_LANLoop.Text := inttostr(LANLoop);
end;

procedure TfmProgConfig.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProgConfig.btnSaveClick(Sender: TObject);
begin
  DelayTime := strtoint(ed_DelayTime.Text);
  LoopCount := strtoint(ed_LoopCount.Text);
  LANTime := strtoint(ed_LanTime.Text);
  LANLoop := strtoint(ed_LANLoop.Text);
  Close;

end;

end.
