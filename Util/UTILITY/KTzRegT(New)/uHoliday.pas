unit uHoliday;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, PlannerMonthView, StdCtrls, DB, dbisamtb, RzButton,
  RzRadChk, RzDBChk, Mask, RzEdit, RzDBEdit, Grids, DBGrids, RzDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDCustomHeaderPanel,
  LMDHeaderPanel, LMDControl, LMDBaseControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, RzCmboBx, ComCtrls;

type
  TForm_Holiday = class(TForm)
    Label21: TLabel;
    ComboBox_ECU: TRzComboBox;
    btnSend: TRzBitBtn;
    btnClose: TRzBitBtn;
    btn_Delete: TRzBitBtn;
    btn_DeleteAll: TRzBitBtn;
    btn_Search: TRzBitBtn;
    Label1: TLabel;
    dt_Month: TDateTimePicker;
    Month: TPlannerMonthView;
    rd_Door: TRadioGroup;
    Label2: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure dt_MonthChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MonthDateChange(Sender: TObject; origDate,
      newDate: TDateTime);
    procedure MonthDaySelect(Sender: TObject; SelDate: TDateTime);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_DeleteAllClick(Sender: TObject);
    procedure MonthDayChange(Sender: TObject; origDate,
      newDate: TDateTime);
  private
    { Private declarations }
    Function Holiday_DownLoad(aCmd,aDevice,aDoorNo,aHoliday:string):Boolean;
    procedure HolidayShow(aDate:string);
    procedure HolidaySearch(aDevice,aDoorNo,aDate:string);
  public
    ECUList : TStringList;
    DeviceID : String;
    { Public declarations }
    Procedure LoadHoliday(aData:String);
  end;

var
  Form_Holiday: TForm_Holiday;

implementation

uses uNewMain,uLomosUtil;

{$R *.dfm}

procedure TForm_Holiday.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Holiday.btnSendClick(Sender: TObject);
var
  aDevice:string;
  j : integer;
  stDoorNo : string;
begin
    if rd_Door.ItemIndex = 0 then stDoorNo := '1'
    else stDoorNo := inttostr(rd_Door.ItemIndex);

    btnSend.Enabled := False;
    if ComboBox_ECU.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
    begin
      for j:=1 to ComboBox_ECU.Count - 1 do
      begin
        aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[j],1,2);
        Sleep(100);
        if rd_Door.ItemIndex = 0 then
        begin
          Holiday_DownLoad('A',aDevice,'1',FormatDateTime('MMdd',dt_Month.Date));
          Holiday_DownLoad('A',aDevice,'2',FormatDateTime('MMdd',dt_Month.Date));
        end
        else
        Holiday_DownLoad('A',aDevice,inttostr(rd_Door.ItemIndex),FormatDateTime('MMdd',dt_Month.Date));     //aDevice, aCardNo,aRegCode,aCardAuth,aInOutMode,aYYMMDD
      end;
      HolidaySearch(aDevice,stDoorNo,FormatDateTime('MMdd',dt_Month.Date));
    end else
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.ItemIndex],1,2);
      if rd_Door.ItemIndex = 0 then
      begin
        Holiday_DownLoad('A',aDevice,'1',FormatDateTime('MMdd',dt_Month.Date));
        Holiday_DownLoad('A',aDevice,'2',FormatDateTime('MMdd',dt_Month.Date));
      end
      else
        Holiday_DownLoad('A',aDevice,inttostr(rd_Door.ItemIndex),FormatDateTime('MMdd',dt_Month.Date)) ;
      HolidaySearch(aDevice,stDoorNo,FormatDateTime('MMdd',dt_Month.Date));
    end;
end;

function TForm_Holiday.Holiday_DownLoad(aCMD,aDevice,aDoorNo,
  aHoliday: string): Boolean;
var
  stData :string;
begin
  result := False;

  stData := 'Q' + //조회'R'
            '0' + //정상 0 에러 1
            aDoorNo + //0:전체,1:1번문,2:2번문
            ' ' + //스페이스
            aCMD + //A:추가,D삭제,W:전체삭제
            aHoliday + //MMDD
            '3';  //'3' : 특정일

  fmMain.SendPacket(aDevice,'c',stData,True);

end;

procedure TForm_Holiday.dt_MonthChange(Sender: TObject);
begin
  Month.Date := dt_Month.Date;
end;

procedure TForm_Holiday.FormShow(Sender: TObject);
Var
  i : Integer;

begin
  ComboBox_ECU.Clear;
  for i := 0 to ECUList.Count - 1 do
  begin
    ComboBox_ECU.Add(ECUList.Strings[i]);
  end;
  ComboBox_ECU.ItemIndex := 1;

end;

procedure TForm_Holiday.FormActivate(Sender: TObject);
begin
  fmMain.bHolidayShow := True;
  Month.Date := Now;
end;

procedure TForm_Holiday.HolidayShow(aDate: string);
var
  i : integer;
  stDate : string;
begin
  stDate := FormatDateTime('yyyy-MM',Month.Date);
  stDate := stDate + '-' + aDate;
  with Month.CreateItem do
  begin
    ItemStartTime :=  strToDate(stDate);
    ItemEndTime := strToDate(stDate);
    Text.Text := '특정일';
  end;

  for i:= 0 to Month.Items.Count - 1 do
  begin
    Month.Items.Items[i].Color := clRed;
  end;


end;

procedure TForm_Holiday.MonthDateChange(Sender: TObject; origDate,
  newDate: TDateTime);
begin
  dt_Month.Date := Month.Date ;
end;

procedure TForm_Holiday.MonthDaySelect(Sender: TObject;
  SelDate: TDateTime);
begin
  //Edit_HoliDay.Text := FormatDateTime('DD',Month.Date);
end;

procedure TForm_Holiday.btn_SearchClick(Sender: TObject);
var
  aDevice : string;
begin
  if ComboBox_ECU.ItemIndex = 0 then
  begin
    showmessage('전체기기에 대해서는 조회가 불가능합니다.');
    Exit;
  end;
  if rd_Door.itemIndex = 0 then
  begin
    showmessage('조회는 각 문별에 한해서 조회 가능합니다.');
    Exit;
  end;
  btn_Search.Enabled := False;
  aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.ItemIndex],1,2);
  HolidaySearch(aDevice,inttostr(rd_Door.itemIndex),FormatDateTime('MMDD',dt_Month.Date));

end;

procedure TForm_Holiday.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmMain.bHolidayShow := False;

end;

procedure TForm_Holiday.HolidaySearch(aDevice, aDoorNo, aDate: string);
var
  stData : string;
begin
  stData := 'R' + //조회'R'
            '0' + //정상 0 에러 1
            aDoorNo + //0:전체,1:1번문,2:2번문
            ' ' + //스페이스
            ' ' + //A:추가,D삭제,W:전체삭제
            aDate + //MMDD
            '3';  //'3' : 특정일
  fmMain.SendPacket(aDevice,'c',stData,True);
end;

procedure TForm_Holiday.btn_DeleteClick(Sender: TObject);
var
  aDevice:string;
  j : integer;
  stDoorNo : string;
begin
    if rd_Door.ItemIndex = 0 then stDoorNo := '1'
    else stDoorNo := inttostr(rd_Door.ItemIndex);
    btn_Delete.Enabled := False;

    if ComboBox_ECU.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
    begin
      for j:=1 to ComboBox_ECU.Count - 1 do
      begin
        aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[j],1,2);
        Sleep(100);
        if rd_Door.ItemIndex = 0 then
        begin
          Holiday_DownLoad('D',aDevice,'1',FormatDateTime('MMdd',dt_Month.Date));
          Holiday_DownLoad('D',aDevice,'2',FormatDateTime('MMdd',dt_Month.Date));
        end
        else
        Holiday_DownLoad('D',aDevice,inttostr(rd_Door.ItemIndex),FormatDateTime('MMdd',dt_Month.Date));     //aDevice, aCardNo,aRegCode,aCardAuth,aInOutMode,aYYMMDD
      end;
      HolidaySearch(aDevice,stDoorNo,FormatDateTime('MMdd',dt_Month.Date));
    end else
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.ItemIndex],1,2);
      if rd_Door.ItemIndex = 0 then
      begin
        Holiday_DownLoad('D',aDevice,'1',FormatDateTime('MMdd',dt_Month.Date));
        Holiday_DownLoad('D',aDevice,'2',FormatDateTime('MMdd',dt_Month.Date));
      end
      else
        Holiday_DownLoad('D',aDevice,inttostr(rd_Door.ItemIndex),FormatDateTime('MMdd',dt_Month.Date)) ;
      HolidaySearch(aDevice,stDoorNo,FormatDateTime('MMdd',dt_Month.Date));
    end;
end;

procedure TForm_Holiday.btn_DeleteAllClick(Sender: TObject);
var
  aDevice:string;
  j : integer;
  stDoorNo : string;
begin
    if rd_Door.ItemIndex = 0 then stDoorNo := '1'
    else stDoorNo := inttostr(rd_Door.ItemIndex);
    btn_DeleteAll.Enabled := False;

    if ComboBox_ECU.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
    begin
      for j:=1 to ComboBox_ECU.Count - 1 do
      begin
        aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[j],1,2);
        Sleep(100);
        if rd_Door.ItemIndex = 0 then
        begin
          Holiday_DownLoad('W',aDevice,'1',FormatDateTime('MMdd',dt_Month.Date));
          Holiday_DownLoad('W',aDevice,'2',FormatDateTime('MMdd',dt_Month.Date));
        end
        else
        Holiday_DownLoad('W',aDevice,inttostr(rd_Door.ItemIndex),FormatDateTime('MMdd',dt_Month.Date));     //aDevice, aCardNo,aRegCode,aCardAuth,aInOutMode,aYYMMDD
      end;
      HolidaySearch(aDevice,stDoorNo,FormatDateTime('MMdd',dt_Month.Date));
    end else
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.ItemIndex],1,2);
      if rd_Door.ItemIndex = 0 then
      begin
        Holiday_DownLoad('W',aDevice,'1',FormatDateTime('MMdd',dt_Month.Date));
        Holiday_DownLoad('W',aDevice,'2',FormatDateTime('MMdd',dt_Month.Date));
      end
      else
        Holiday_DownLoad('W',aDevice,inttostr(rd_Door.ItemIndex),FormatDateTime('MMdd',dt_Month.Date)) ;
      HolidaySearch(aDevice,stDoorNo,FormatDateTime('MMdd',dt_Month.Date));
    end;
end;

procedure TForm_Holiday.LoadHoliday(aData: String);
var
  stDate : string;
  i : integer;
begin
  //r01  0110000000001000000000000000000000
  Month.Items.Clear;
  stDate := copy(aData,8,31);
  for i:= 1 to 31 do
  begin
    if Copy(stDate,i,1) = '1' then HolidayShow(FillzeroNumber(i,2));
  end;
  btn_Search.Enabled := True;
  btnSend.Enabled := True;
  btn_Delete.Enabled := True;
  btn_DeleteAll.Enabled := True;
end;

procedure TForm_Holiday.MonthDayChange(Sender: TObject; origDate,
  newDate: TDateTime);
begin
  dt_Month.Date := Month.Date ;
end;

end.
