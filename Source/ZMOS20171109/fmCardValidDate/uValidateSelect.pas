unit uValidateSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TfmValidateSelect = class(TForm)
    dt_Date: TDateTimePicker;
    Label1: TLabel;
    sbChange: TSpeedButton;
    sbCancel: TSpeedButton;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure sbChangeClick(Sender: TObject);
  private
    FOnValidDate: string;
    { Private declarations }
  public
    { Public declarations }
    property ValidDate:string read FOnValidDate write FOnValidDate;
  end;

var
  fmValidateSelect: TfmValidateSelect;

implementation

{$R *.dfm}

procedure TfmValidateSelect.FormCreate(Sender: TObject);
begin
  ValidDate := '';
  dt_Date.Date := Now;
end;

procedure TfmValidateSelect.sbCancelClick(Sender: TObject);
begin
  ValidDate := '';
  Close;
end;

procedure TfmValidateSelect.sbChangeClick(Sender: TObject);
begin
  ValidDate := FormatDateTime('yyyymmdd',dt_Date.date);
  Close;
end;

end.
