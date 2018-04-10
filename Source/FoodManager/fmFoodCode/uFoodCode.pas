unit uFoodCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, CommandArray, ComCtrls, Buttons, StdCtrls, ExtCtrls,
  Grids, BaseGrid, AdvGrid;

type
  TfmFoodCode = class(TfmASubForm)
    Panel12: TPanel;
    GroupBox6: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    sg_FoodCode: TAdvStringGrid;
    Label1: TLabel;
    ed_foodCode: TEdit;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    ed_foodcodeName: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    ed_hBreakfast: TEdit;
    Label4: TLabel;
    ed_hlunch: TEdit;
    Label5: TLabel;
    ed_hdinner: TEdit;
    Label6: TLabel;
    ed_hmidnight: TEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ed_sBreakfast: TEdit;
    ed_slunch: TEdit;
    ed_sdinner: TEdit;
    ed_smidnight: TEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    ed_wBreakfast: TEdit;
    ed_wlunch: TEdit;
    ed_wdinner: TEdit;
    ed_wmidnight: TEdit;
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFoodCode: TfmFoodCode;

implementation

{$R *.dfm}

procedure TfmFoodCode.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

end.
