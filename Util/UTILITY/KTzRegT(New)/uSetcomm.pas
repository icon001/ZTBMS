unit uSetcomm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, ExtCtrls, RzPanel;

type
  TForm_SetComPort = class(TForm)
    RzPanel1: TRzPanel;
    Label1: TLabel;
    ComboBox_ComNo: TRzComboBox;
    btnOK: TRzBitBtn;
    btnCancel: TRzBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_SetComPort: TForm_SetComPort;

implementation

{$R *.dfm}

end.
