unit uNotUseCardDelete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TfmNotUseCardDelete = class(TForm)
    Label1: TLabel;
    ed_DeleteDay: TEdit;
    Label2: TLabel;
    btn_CardDelete: TButton;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_CardDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNotUseCardDelete: TfmNotUseCardDelete;

implementation
uses
  uLomosUtil,
  uDataModule1;

{$R *.dfm}

procedure TfmNotUseCardDelete.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmNotUseCardDelete.btn_CardDeleteClick(Sender: TObject);
var
  stSql : string;
  stDate : string;
begin
  if Not isDigit(ed_DeleteDay.Text) then
  begin
    showmessage('�̻���ϼ��� ���ڸ� �Է��ϼ���.');
    Exit;
  end;
  if strtoint(ed_DeleteDay.Text) < 60 then
  begin
    showmessage('�̻���ϼ��� 60�� �̻����� �Է��ϼ���.');
    Exit;
  end;
  stDate := FormatDateTime('yyyymmdd',Now - strtoint(ed_DeleteDay.Text));

  stSql := ' Delete From SEAT_USER_VIEW ';
  stSql := stSql + ' Where LAST_USEDATE < ''' + stDate + ''' ';

  if DataModule1.ProcessExecSQL(stSql) then
  begin
    showmessage('������ �����۾� �Ϸ�');
  end else
  begin
    showmessage('������ �����۾� ����');
  end;
  
end;

end.
