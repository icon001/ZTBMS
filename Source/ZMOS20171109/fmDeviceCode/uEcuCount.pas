unit uEcuCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, RzButton;

type
  TfmEcuCount = class(TForm)
    Label1: TLabel;
    ed_regDoor: TSpinEdit;
    btnAdd: TRzBitBtn;
    btnClose: TRzBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    L_nEcuCount : integer;
    { Public declarations }
  end;

var
  fmEcuCount: TfmEcuCount;

implementation

{$R *.dfm}

procedure TfmEcuCount.btnCloseClick(Sender: TObject);
begin
  L_nEcuCount := 0;
  close;
end;

procedure TfmEcuCount.btnAddClick(Sender: TObject);
begin
  L_nEcuCount := ed_regDoor.Value;
  close;

end;

procedure TfmEcuCount.FormShow(Sender: TObject);
begin
  L_nEcuCount := 0;
end;

end.
