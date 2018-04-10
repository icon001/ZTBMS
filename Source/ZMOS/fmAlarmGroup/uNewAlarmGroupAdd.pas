unit uNewAlarmGroupAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmNewAlarmGroupName = class(TForm)
    Label1: TLabel;
    ed_GroupName: TEdit;
    btn_Add: TButton;
    btn_Cancel: TButton;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    L_stGroupName : string;
  end;

var
  fmNewAlarmGroupName: TfmNewAlarmGroupName;

implementation

{$R *.dfm}

procedure TfmNewAlarmGroupName.btn_CancelClick(Sender: TObject);
begin
  L_stGroupName := '';
  Close;
end;

procedure TfmNewAlarmGroupName.btn_AddClick(Sender: TObject);
begin
  L_stGroupName := ed_GroupName.Text;
  Close;
end;

end.
