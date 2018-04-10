unit uFoodReInsert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ComCtrls;

type
  TfmFoodReInsert = class(TForm)
    StaticText1: TStaticText;
    dt_Fromdate: TDateTimePicker;
    StaticText2: TStaticText;
    dt_todate: TDateTimePicker;
    Gauge1: TGauge;
    btn_AtReInsert: TSpeedButton;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFoodReInsert: TfmFoodReInsert;

implementation

{$R *.dfm}

procedure TfmFoodReInsert.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFoodReInsert.FormCreate(Sender: TObject);
begin
  dt_Fromdate.Date := now;
  dt_todate.Date := now;
end;

end.
