unit uSMSUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, StdCtrls, Buttons;

type
  TfmSMSUser = class(TForm)
    sg_smsuser: TAdvStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    ed_jijumname: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    btn_Insert: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSMSUser: TfmSMSUser;

implementation

{$R *.dfm}

procedure TfmSMSUser.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

end.
