unit uAppendECU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzSpnEdt, RzCmboBx, RzButton,ComCtrls;

type
  TForm_AddECU = class(TForm)
    Label13: TLabel;
    Label1: TLabel;
    cbDeviceType: TRzComboBox;
    seDeviceNo: TRzSpinEdit;
    btnAdd: TRzBitBtn;
    btnClose: TRzBitBtn;
    procedure btnAddClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_AddECU: TForm_AddECU;

implementation
uses
  uMain;
{$R *.dfm}




//ECU �߰�
procedure TForm_AddECU.btnAddClick(Sender: TObject);
var
  aNo:Integer;
  bNo:Integer;
  strNo: String;
  alist: TListItem;

begin
  aNo:= seDeviceNo.IntValue;
  if aNo < 10 then strNo:= '0'+InttoStr(aNo)
  else             strNo:= InttoStr(aNo);

  if Form_Main.ListviewBinarySearch(Form_Main.lvECU,StrNo,bNo) then
  begin
    MessageDlg('�̹� ��ϵ� ECU/ICU �Դϴ�.', mtWarning, [mbOK], 0);
    Exit;
  end else if aNo > 99 then
  begin
    MessageDlg('��� ������ ECU/ICU ��ȣ�� 99�� ���� �� �����ϴ�.', mtWarning, [mbOK], 0);
    Exit;
  end;

  // ECU ��� ��ư�� Enable ��Ų��.
  if not Form_Main.ToolButton_ECU.Enabled then Form_Main.ToolButton_ECU.Enabled:= True;
  aList:= Form_Main.lvECU.Items.Add;
  aList.Caption:= strNo; //��� ��ȣ
  aList.ImageIndex:= 4;
  aList.SubItems.Add(cbDeviceType.Text);
  Inc(aNo);
  if aNo > 99 then
  begin
    MessageDlg('���̻� ECU/ICU�� ��� �Ҽ� �����ϴ�.', mtWarning, [mbOK], 0);
  end;

  seDeviceNo.IntValue:= aNo;


end;

procedure TForm_AddECU.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
