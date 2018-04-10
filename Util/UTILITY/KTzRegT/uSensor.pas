unit uSensor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzListVw, RzTabs, StdCtrls, Mask, RzEdit, RzButton,
  RzLabel, ExtCtrls, RzPanel, RzCmboBx, Grids, RzGrids, ImgList;

type
  TfmSensor = class(TForm)
    RzGroupBox6: TRzGroupBox;
    RzLabel1: TRzLabel;
    btnECUAdd: TRzBitBtn;
    btnECUErase: TRzBitBtn;
    Edit_EcuNo: TRzEdit;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    lvECU: TRzListView;
    RzGroupBox4: TRzGroupBox;
    Label6: TLabel;
    sgPort: TRzStringGrid;
    cbPort: TRzComboBox;
    Label1: TLabel;
    ComboBox_Sensor: TRzComboBox;
    btnRefresh: TRzBitBtn;
    btnReg: TRzBitBtn;
    toolslist: TImageList;
    procedure btnECUAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnECUEraseClick(Sender: TObject);
    procedure sgPortSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbPortExit(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnRegClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //포트 초기정보 등록
    procedure MakePortInfo;
    Function GetSensor:String;
  public
    { Public declarations }
    stECUNO : string;
    DeviceID : string;
    function ListviewBinarySearch(listview: TRzListview;
      const Item: string; var Index: Integer): Boolean;
    procedure SensorInfoShow(stSensorNO,stPortNo,stAlarmType,stTime:string);
    procedure SensorSetShow(stSensorNO:string);

  end;

var
  fmSensor: TfmSensor;

implementation

uses
uAddSensor,uMain,uLomosUtil;

{$R *.dfm}

procedure TfmSensor.btnECUAddClick(Sender: TObject);
var
  i : integer;
  st : string;
begin
  fmAddSensor := TfmAddSensor.Create(Self);
  fmAddSensor.ShowModal;
  fmAddSensor.Free;

  ComboBox_Sensor.Clear;
  for i:= 0 to lvECU.Items.Count - 1 do
  begin
    st:= lvECU.Items[I].Caption + '.'+ lvECU.Items[I].SubItems.Strings[0];
    ComboBox_Sensor.Add(st);
  end;
  if ComboBox_Sensor.Count > 0 then ComboBox_Sensor.ItemIndex := 0;


end;

procedure TfmSensor.FormShow(Sender: TObject);
begin
  Edit_EcuNo.Text := stECUNO;
//  cbPort.Visible := False;
  MakePortInfo;
  Form_Main.bSensorShow := True;

end;

function TfmSensor.ListviewBinarySearch(listview: TRzListview;
  const Item: string; var Index: Integer): Boolean;
var
  First, last, pivot, res: Integer;
begin
  Assert(Assigned(listview));
  Assert(Length(item) > 0);

  Result := false;
  Index := 0;
  if listview.Items.Count = 0 then Exit;

  First := 0;
  last := listview.Items.Count - 1;
  repeat
    pivot := (First + last) div 2;
    res   := lstrcmp(PChar(item), PChar(listview.Items[pivot].Caption));
    if res = 0 then
    begin
      { Found the item, return its index and exit. }
      Index := pivot;
      Result := true;
      Break;
    end { If }
    else if res > 0 then
    begin
      { Item is larger than item at pivot }
      First := pivot + 1;
    end { If }
    else
    begin
      { Item is smaller than item at pivot }
      last := pivot - 1;
    end;
  until last < First;
  Index := First;
end;

procedure TfmSensor.btnECUEraseClick(Sender: TObject);
var
  stSensorID : string;
  st : string;
begin
  if lvECU.Selected = nil then Exit;
  stSensorID := lvECU.Selected.Caption;
  st := lvECU.Selected.Caption + '.'+ lvECU.Selected.SubItems.Strings[0];
  if lvECU.Selected <> nil then lvECU.Selected.Delete;

  ComboBox_Sensor.Delete(ComboBox_Sensor.IndexOf(st));
  if ComboBox_Sensor.Count > 0 then ComboBox_Sensor.ItemIndex := 0
  else ComboBox_Sensor.Text := '';
end;

procedure TfmSensor.sgPortSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  Rect: TRect;
begin
  Rect := sgPort.CellRect(ACol, ARow);
  case ACol of
    1: // 감시형태
    begin
      with cbPort do
      begin
        Clear;
        Items.Add('0.방범');
        Items.Add('1.화재');
        Items.Add('2.가스');
        Items.Add('3.비상');
        Items.Add('4.설비');
        ItemIndex := 0;
        Visible := true;
        Left := sgPort.Left + Rect.Left + 2;
        Top := sgPort.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgPort.Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end;
    2: //감지시간
    begin
      with cbPort do
      begin
        Clear;
        Items.Add('400');
        Items.Add('600');
        Items.Add('800');
        Items.Add('1000');

        ItemIndex := 0;
        Visible := true;
        Left := sgPort.Left + Rect.Left + 2;
        Top := sgPort.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgPort.Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end;
  end;
end;

procedure TfmSensor.MakePortInfo;
var
  I: Integer;
begin
  sgPort.Cells[0, 0] := '포트번호';
  sgPort.Cells[1, 0] := '감시형태';
  sgPort.Cells[2, 0] := '감지시간';
  sgPort.FixedColor := clWhite;
  sgPort.Color := clWhite;

  for I := 1 to 8 do
  begin
    sgPort.Cells[0, I] := IntToStr(I);
    if I = 7 then sgPort.Cells[1, I] := '1.화재'
    else if I = 8 then sgPort.Cells[1, I] := '3.비상'
    else sgPort.Cells[1, I] := '0.방범';
    sgPort.Cells[2, I] := '400';
  end;
end;

procedure TfmSensor.cbPortExit(Sender: TObject);
var
  st: string;
begin
  with Sender as TRzCombobox do
  begin
    hide;
    if ItemIndex >= 0 then
    begin
      with sgPort do
      begin
        st := Items[ItemIndex];
        Cells[Col, row] := st;
      end;
    end;
  end;
end;

procedure TfmSensor.btnRefreshClick(Sender: TObject);
var
  aDeviceID : string;
  aSensorNo : string;
  i : integer;
begin

  aDeviceID := DeviceID + stECUNO ;

  if Not Form_Main.CheckSensorSet(aDeviceID) then
  begin
    showmessage('응답이 없습니다.');
    Exit;
  end;

  if ComboBox_Sensor.Text = '' then
  begin
    Showmessage('감지기 번호를 선택하셔야 합니다.');
    Exit;
  end;

  aSensorNo := copy(ComboBox_Sensor.Text,1,2);

  for i:= 1 to 8 do
  begin
    Form_Main.CheckSensorInfo(aDeviceID,aSensorNo,inttostr(i));
  end;
end;

procedure TfmSensor.btnRegClick(Sender: TObject);
var
  aDeviceID : string;
  aSensorNo : string;
  aData : string;
  i : integer;
  st : string;
  aAlarmType : string;
  aDetectTime : string;
begin
  if ComboBox_Sensor.Text = '' then
  begin
    Showmessage('감지기 번호를 선택하셔야 합니다.');
    Exit;
  end;

  aDeviceID := DeviceID + stECUNO ;
  aSensorNo := copy(ComboBox_Sensor.Text,1,2);
  aData := GetSensor;

  if Not Form_Main.RegSensorSet(aDeviceID,aData) then
  begin
    showmessage('응답이 없습니다.');
    Exit;
  end;
  for i:= 1 to 8 do
  begin
    st:= sgPort.Cells[1, i];
    aAlarmType:=  copy(st,1,1);
    aDetectTime := sgPort.Cells[2, i];
    Form_Main.RegSensorInfo(aDeviceID,aSensorNo,inttostr(i),aAlarmType,aDetectTime);
  end;

end;

procedure TfmSensor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Main.bSensorShow := False;
end;

procedure TfmSensor.SensorInfoShow(stSensorNO, stPortNo, stAlarmType,
  stTime: string);
var
  aIndex: Integer;
  aWatchCode: Integer;
  aWatchStr: string;
begin

  aIndex := StrToInt(stPortNo);

  //감시형태
  aWatchCode := StrToInt(stAlarmType);


  //감시형태
  case aWatchCode of
    0: aWatchStr := '0.방범';
    1: aWatchStr := '1.화재';
    2: aWatchStr := '2.가스';
    3: aWatchStr := '3.비상';
    4: aWatchStr := '4.설비';
    else aWatchStr := '0.방범';
  end;

  //포트번호
  sgPort.Cells[0, aIndex] := IntToStr(aIndex);

  //감시형태
  sgPort.Cells[1, aIndex] := aWatchStr;

  //감지시간
  sgPort.Cells[2, aIndex] := inttostr(strtoint(stTime));


  sgPort.Color := clYellow;
end;

procedure TfmSensor.SensorSetShow(stSensorNO: string);
var
  i : integer;
  SensorNo : string;
  aIndex: Integer;
  alist: TListItem;
begin

  lvECU.Clear;
  ComboBox_Sensor.Clear;
  for i := 1 to 16 do  // 1번째는 메인임
  begin
    if stSensorNO[i] = '1' then
    begin
      SensorNo := FillZeroNumber(i , 2);
      if ListviewBinarySearch(lvECU, SensorNo, aIndex) then
      begin
        // 이미등록되어 있음
      end else
      begin
        // ECU 추가
        aList := lvECU.Items.Add;
        aList.Caption := SensorNo; //ECU 번호
        aList.ImageIndex := 0;
        aList.SubItems.Add('Sensor');
        ComboBox_Sensor.Add(SensorNo +'.Sensor');
      end;
    end;
  end;
  if ComboBox_Sensor.Count > 0 then ComboBox_Sensor.ItemIndex := 0;
  lvECU.Color := clYellow;
end;

function TfmSensor.GetSensor: String;
var
  I: Integer;
  aNo: Integer;
  aData: String[17];
begin
//                   1
//         01234567890123456
  aData:= '00000000000000000';

  for I:= 0 to lvECU.Items.Count - 1  do
  begin
    aNo:= StrtoInt(lvECU.Items[I].Caption);
    aData[aNo + 1]:= '1';
  end;
  Result:= aData;
end;

end.
