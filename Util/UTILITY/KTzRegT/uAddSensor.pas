unit uAddSensor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzSpnEdt,ComCtrls;


type
  TfmAddSensor = class(TForm)
    Label13: TLabel;
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
  fmAddSensor: TfmAddSensor;

implementation

uses uSensor;

{$R *.dfm}

procedure TfmAddSensor.btnAddClick(Sender: TObject);
var
  aNo:Integer;
  bNo:Integer;
  strNo: String;
  alist: TListItem;

begin
  aNo:= seDeviceNo.IntValue;
  if aNo < 10 then strNo:= '0'+InttoStr(aNo)
  else             strNo:= InttoStr(aNo);

  if fmSensor.ListviewBinarySearch(fmSensor.lvECU,StrNo,bNo) then
  begin
    MessageDlg('이미 등록된 감지기 입니다.', mtWarning, [mbOK], 0);
    Exit;
  end else if aNo > 16 then
  begin
    MessageDlg('등록 가능한 감지기 번호가 16를 넘을 수 없습니다.', mtWarning, [mbOK], 0);
    Exit;
  end;

  aList:= fmSensor.lvECU.Items.Add;
  aList.Caption:= strNo; //기기 번호
  aList.ImageIndex:= 0;
  aList.SubItems.Add('SENSOR');
  Inc(aNo);
  if aNo > 16 then
  begin
    MessageDlg('더이상 감지기를 등록 할수 없습니다.', mtWarning, [mbOK], 0);
    Exit;
  end;

  seDeviceNo.IntValue:= aNo;

end;

procedure TfmAddSensor.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
