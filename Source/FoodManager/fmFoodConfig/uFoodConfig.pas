unit uFoodConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls;

type
  TfmFoodConfig = class(TForm)
    Panel12: TPanel;
    Panel1: TPanel;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFoodConfig: TfmFoodConfig;

implementation

{$R *.dfm}

procedure TfmFoodConfig.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

end.
