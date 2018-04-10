unit uExtraCodeAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid;

type
  TfmExtraCodeAdmin = class(TForm)
    Panel11: TPanel;
    sg_Code: TAdvStringGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ed_code: TEdit;
    ed_name: TEdit;
    GroupBox2: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmExtraCodeAdmin: TfmExtraCodeAdmin;

implementation

{$R *.dfm}

procedure TfmExtraCodeAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

end.
