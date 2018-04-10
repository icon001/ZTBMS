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




//ECU 추가
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
    MessageDlg('이미 등록된 ECU/ICU 입니다.', mtWarning, [mbOK], 0);
    Exit;
  end else if aNo > 99 then
  begin
    MessageDlg('등록 가능한 ECU/ICU 번호가 99를 넘을 수 없습니다.', mtWarning, [mbOK], 0);
    Exit;
  end;

  // ECU 등록 버튼을 Enable 시킨다.
  if not Form_Main.ToolButton_ECU.Enabled then Form_Main.ToolButton_ECU.Enabled:= True;
  aList:= Form_Main.lvECU.Items.Add;
  aList.Caption:= strNo; //기기 번호
  aList.ImageIndex:= 4;
  aList.SubItems.Add(cbDeviceType.Text);
  Inc(aNo);
  if aNo > 99 then
  begin
    MessageDlg('더이상 ECU/ICU를 등록 할수 없습니다.', mtWarning, [mbOK], 0);
  end;

  seDeviceNo.IntValue:= aNo;


end;

procedure TForm_AddECU.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
