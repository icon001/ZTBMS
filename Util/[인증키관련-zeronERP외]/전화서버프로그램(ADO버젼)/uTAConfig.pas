unit uTAConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TfmTAConfig = class(TForm)
    GroupBox1: TGroupBox;
    Chk_WindowsStart: TCheckBox;
    chk_AutoVisible: TCheckBox;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTAConfig: TfmTAConfig;

implementation

{$R *.dfm}

end.
