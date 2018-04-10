unit uKTReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, Grids, RzGrids, ComCtrls;

const
  KTDelimiter = '}';
  
type
  TfmKTReg = class(TForm)
    PageControl1: TPageControl;
    LanConfig: TTabSheet;
    Device: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ed_MasterNum: TEdit;
    Label2: TLabel;
    ed_AssistNum: TEdit;
    Label3: TLabel;
    ed_Cycle: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ed_ImagerIP: TEdit;
    ed_ImagePort: TEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ed_ControlIP: TEdit;
    ed_ControlPort: TEdit;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ed_TimeOut: TEdit;
    ed_SaveTime: TEdit;
    Label11: TLabel;
    cb_Image: TComboBox;
    Label12: TLabel;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    ed_TranceTime: TEdit;
    Label14: TLabel;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    ed_RcvTimeOut: TEdit;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    ed_TranceCnt: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    ed_CRCount: TEdit;
    Label21: TLabel;
    GroupBox8: TGroupBox;
    sgDevice: TRzStringGrid;
    cbDevice: TRzComboBox;
    GroupBox9: TGroupBox;
    chk_Emr: TCheckBox;
    chk_Siren: TCheckBox;
    chk_Light: TCheckBox;
    chk_Door1: TCheckBox;
    chk_Door2: TCheckBox;
    GroupBox10: TGroupBox;
    chk_Camera1: TCheckBox;
    chk_Camera2: TCheckBox;
    chk_Camera3: TCheckBox;
    chk_Camera4: TCheckBox;
    btnDeviceSearch: TRzBitBtn;
    btnDeviceReg: TRzBitBtn;
    btnConfigSearch: TRzBitBtn;
    btnConfigReg: TRzBitBtn;
    btnClose: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfigRegClick(Sender: TObject);
    procedure btnConfigSearchClick(Sender: TObject);
    procedure sgDeviceSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbDeviceExit(Sender: TObject);
    procedure btnDeviceRegClick(Sender: TObject);
    procedure btnDeviceSearchClick(Sender: TObject);
  private
    { Private declarations }
    procedure sgDeviceSet;
  public
    { Public declarations }
    procedure KTConfigRecv(aData:string);
    procedure KTDeviceRecv(aData:string);
  end;

var
  fmKTReg: TfmKTReg;

implementation

uses uMain,uLomosUtil;

{$R *.dfm}

procedure TfmKTReg.RzBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmKTReg.btnCloseClick(Sender: TObject);
begin
  Form_Main.bKTRegShow := False;
  Close;
end;

procedure TfmKTReg.FormShow(Sender: TObject);
begin
  Form_Main.bKTRegShow := True;
  sgDeviceSet;
end;

procedure TfmKTReg.KTConfigRecv(aData: string);
var
  stRcvData:string;
  aIndex : integer;
  stTemp : string;
begin
//         1         2         3         4
//12345678901234567890123456789012345678901234567
//046 K1111111100ihCD010010011111111        DC

  stRcvData:= Copy(aData, 22, length(aData)-22); //환경정보
  aIndex := Pos(KTDelimiter,stRcvData);
  ed_MasterNum.Text := copy(stRcvData,1,aIndex - 1);
  ed_MasterNum.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_AssistNum.Text := copy(stRcvData,1,aIndex - 1);
  ed_AssistNum.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_Cycle.Text := copy(stRcvData,1,aIndex - 1);
  ed_Cycle.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  stTemp := copy(stRcvData,1,aIndex - 1);
  if stTemp = 'O' then cb_Image.ItemIndex := 0
  else cb_Image.ItemIndex := 1;
  cb_Image.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_TimeOut.Text := copy(stRcvData,1,aIndex - 1);
  ed_TimeOut.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_ImagerIP.Text := copy(stRcvData,1,aIndex - 1);
  ed_ImagerIP.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_ImagePort.Text := copy(stRcvData,1,aIndex - 1);
  ed_ImagePort.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_ControlIP.Text := copy(stRcvData,1,aIndex - 1);
  ed_ControlIP.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_ControlPort.Text := copy(stRcvData,1,aIndex - 1);
  ed_ControlPort.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_SaveTime.Text := copy(stRcvData,1,aIndex - 1);
  ed_SaveTime.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_TranceTime.Text := copy(stRcvData,1,aIndex - 1);
  ed_TranceTime.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_RcvTimeOut.Text := copy(stRcvData,1,aIndex - 1);
  ed_RcvTimeOut.Color := clYellow;
  Delete(stRcvData,1,aIndex);


  aIndex := Pos(KTDelimiter,stRcvData);
  ed_TranceCnt.Text := copy(stRcvData,1,aIndex - 1);
  ed_TranceCnt.Color := clYellow;
  Delete(stRcvData,1,aIndex);

end;

procedure TfmKTReg.KTDeviceRecv(aData: string);
var
  stRcvData:string;
  aIndex : integer;
  useZone : string;
  emgZone : string;
  parzone : string;
  delzone : string;
  viszone : string;
  camzone : string;
  entrdly : string;
  exitdly : string;
  usecam : string;
  usedev : string;
  sensortype : string;
  sensorcontact : string;
  i : integer;
begin
//         1         2         3         4
//12345678901234567890123456789012345678901234567
//046 K1111111100ihCD010010011111111        DC
  stRcvData:= Copy(aData, 22, length(aData)-22); //구성정보

  aIndex := Pos(KTDelimiter,stRcvData);
  ed_CRCount.Text := copy(stRcvData,1,aIndex - 1);
  ed_CRCount.Color := clYellow;
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  useZone := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  emgZone := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  parzone := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  delzone := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  viszone := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  camzone := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);
 {
  aIndex := Pos(KTDelimiter,stRcvData);
  useZone := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);
 }
  aIndex := Pos(KTDelimiter,stRcvData);
  entrdly := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  exitdly := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  usecam := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  usedev := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  sensortype := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  aIndex := Pos(KTDelimiter,stRcvData);
  sensorcontact := copy(stRcvData,1,aIndex - 1);
  Delete(stRcvData,1,aIndex);

  for i := 1 to 10 do
  begin
    with sgDevice do
    begin
      Cells[i,1] := useZone[i];
      Cells[i,2] := emgZone[i];
      Cells[i,3] := parZone[i];
      Cells[i,4] := delZone[i];
      Cells[i,5] := visZone[i];
      Cells[i,6] := camZone[i];
      case SensorType[i] of
        '1': Cells[i,7] := '1.자석';
        '2': Cells[i,7] := '2.열선';
        '3': Cells[i,7] := '3.유리';
        '4': Cells[i,7] := '4.금고';
        '5': Cells[i,7] := '5.진동';
        '6': Cells[i,7] := '6.적외선';
        '7': Cells[i,7] := '7.화재';
        '8': Cells[i,7] := '8.가스';
        '9': Cells[i,7] := '9.비상';
        'A': Cells[i,7] := 'A.기타';
      end;
      Cells[i,8] := inttostr(strtoint(copy(entrdly,4 *(i-1),3)));
      Cells[i,9] := inttostr(strtoint(copy(exitdly,4 *(i-1),3)));
      Cells[i,10] := Sensorcontact[i];
    end;
  end;
  sgDevice.Color := clYellow;
  if usecam[1] = 'O' then chk_Camera1.Checked := True
  else chk_Camera1.Checked := False;
  if usecam[2] = 'O' then chk_Camera2.Checked := True
  else chk_Camera2.Checked := False;
  if usecam[3] = 'O' then chk_Camera3.Checked := True
  else chk_Camera3.Checked := False;
  if usecam[4] = 'O' then chk_Camera4.Checked := True
  else chk_Camera4.Checked := False;

  if usedev[1] = 'O' then chk_Emr.Checked := True
  else chk_Emr.Checked := False;
  if usedev[2] = 'O' then chk_Siren.Checked := True
  else chk_Siren.Checked := False;
  if usedev[3] = 'O' then chk_Light.Checked := True
  else chk_Light.Checked := False;
  if usedev[4] = 'O' then chk_Door1.Checked := True
  else chk_Door1.Checked := False;
  if usedev[5] = 'O' then chk_Door2.Checked := True
  else chk_Door2.Checked := False;


end;

procedure TfmKTReg.btnConfigRegClick(Sender: TObject);
var
  stSendData : string;
begin
  stSendData := '';
  stSendData := stSendData + ed_MasterNum.Text + KTDelimiter;
  stSendData := stSendData + ed_AssistNum.Text + KTDelimiter;
  stSendData := stSendData + ed_Cycle.Text + KTDelimiter;
  if cb_Image.Text = 'ON' then  stSendData := stSendData + 'O' + KTDelimiter
  else stSendData := stSendData + 'X' + KTDelimiter;
  stSendData := stSendData + ed_TimeOut.Text + KTDelimiter;
  stSendData := stSendData + ed_ImagerIP.Text + KTDelimiter;
  stSendData := stSendData + ed_ImagePort.Text + KTDelimiter;
  stSendData := stSendData + ed_ControlIP.Text + KTDelimiter;
  stSendData := stSendData + ed_ControlPort.Text + KTDelimiter;
  stSendData := stSendData + ed_SaveTime.Text + KTDelimiter;
  stSendData := stSendData + ed_TranceTime.Text + KTDelimiter;
  stSendData := stSendData + ed_RcvTimeOut.Text + KTDelimiter;
  stSendData := stSendData + ed_TranceCnt.Text + KTDelimiter;
  stSendData := stSendData + formatdatetime('yyyymmddHHMMSS',Now) + KTDelimiter;

  Form_Main.KTConfigReg('I',stSendData);
end;

procedure TfmKTReg.btnConfigSearchClick(Sender: TObject);
begin
  Form_Main.KTConfigReg('Q','');
end;

procedure TfmKTReg.sgDeviceSet;
var
  I : integer;
begin

  with sgDevice do
  begin
    ColCount := 11;
    ColWidths[0] := 100;
    Cells[0, 0] := '';
    Cells[1, 0] := '1';
    Cells[2, 0] := '2';
    Cells[3, 0] := '3';
    Cells[4, 0] := '4';
    Cells[5, 0] := '5';
    Cells[6, 0] := '6';
    Cells[7, 0] := '7';
    Cells[8, 0] := '8';
    Cells[9, 0] := '9';
    Cells[10, 0] := '10';

    RowCount := 11;
    Cells[0, 0] := '';
    Cells[0, 1] := '설치존';
    Cells[0, 2] := '비상존';
    Cells[0, 3] := '재중경계존';
    Cells[0, 4] := '지연처리존';
    Cells[0, 5] := '방문존';
    Cells[0, 6] := '카메라존';
    Cells[0, 7] := '센서정보';
    Cells[0, 8] := '입실지연';
    Cells[0, 9] := '퇴실지연';
    Cells[0, 10] := '접점종류';
    FixedColor := clWhite;
    Color := clWhite;

    for I := 1 to 10 do
    begin
      Cells[I, 1] := 'X';
      Cells[I, 2] := 'X';
      Cells[I, 3] := 'X';
      Cells[I, 4] := 'X';
      Cells[I, 5] := 'X';
      Cells[I, 6] := 'X';
      Cells[I, 7] := '1.자석';
      Cells[I, 8] := '10';
      Cells[I, 9] := '10';
      Cells[I, 10] := 'O';
    end;
  end;

end;

procedure TfmKTReg.sgDeviceSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  Rect: TRect;
begin
  Rect := sgDevice.CellRect(ACol, ARow);

  case ARow of
    1..5:
    begin
      with cbDevice do
      begin
        Clear;
        Items.Add('O');
        Items.Add('X');
        ItemIndex := 0;
        Visible := true;
        Left := sgDevice.Left + Rect.Left + 2;
        Top := sgDevice.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgDevice.Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end;
    6:
    begin
      with cbDevice do
      begin
        Clear;
        Items.Add('1');
        Items.Add('2');
        Items.Add('3');
        Items.Add('4');
        Items.Add('X');
        ItemIndex := 0;
        Visible := true;
        Left := sgDevice.Left + Rect.Left + 2;
        Top := sgDevice.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgDevice.Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end;
    7:
    begin
      with cbDevice do
      begin
        Clear;
        Items.Add('1.자석');
        Items.Add('2.열선');
        Items.Add('3.유리');
        Items.Add('4.금고');
        Items.Add('5.진동');
        Items.Add('6.적외선');
        Items.Add('7.화재');
        Items.Add('8.가스');
        Items.Add('9.비상');
        Items.Add('A.기타');

        ItemIndex := 0;
        Visible := true;
        Left := sgDevice.Left + Rect.Left + 2;
        Top := sgDevice.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left + 18;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgDevice.Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end;
    10:
    begin
      with cbDevice do
      begin
        Clear;
        Items.Add('O');
        Items.Add('C');

        ItemIndex := 0;
        Visible := true;
        Left := sgDevice.Left + Rect.Left + 2;
        Top := sgDevice.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgDevice.Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end;
  end;
end;

procedure TfmKTReg.cbDeviceExit(Sender: TObject);
var
  st: string;
begin
  with Sender as TRzCombobox do
  begin
    hide;
    if ItemIndex >= 0 then
    begin
      with sgDevice do
      begin
        st := Items[ItemIndex];
        Cells[Col, row] := st;
      end;
    end;
  end;
  cbDevice.Visible := False;
end;

procedure TfmKTReg.btnDeviceRegClick(Sender: TObject);
var
  stSendData : string;
  useZone : string;
  emgZone : string;
  parZone : string;
  delZone : string;
  visZone : string;
  camZone : string;
  entrdly : string;
  exitdly : string;
  usecam : string;
  usedev : string;
  SensorType : string;
  Sensorcontact : string;
  i : integer;
begin
  useZone := '';
  emgZone := '';
  parZone := '';
  delZone := '';
  visZone := '';
  camZone := '';
  entrdly := '';
  exitdly := '';
  usecam := '';
  usedev := '';
  SensorType := '';
  Sensorcontact := '';
  for i := 1 to 10 do
  begin
    with sgDevice do
    begin
      useZone := useZone + Cells[i, 1];
      emgZone := emgZone + Cells[i, 2];
      parZone := parZone + Cells[i, 3];
      delZone := delZone + Cells[i, 4];
      visZone := visZone + Cells[i, 5];
      camZone := camZone + Cells[i, 6];
      entrdly := entrdly + FillZeroNumber(strtoint(Cells[i, 8]),3) + ' ';
      exitdly := exitdly + FillZeroNumber(strtoint(Cells[i, 9]),3) + ' ';
      SensorType := SensorType + copy(Cells[i, 7],1,1);
      Sensorcontact := Sensorcontact + Cells[i, 10];
    end;
  end;
  if chk_Emr.Checked then usecam := 'O'
  else usecam := 'X';
  if chk_Siren.Checked then usecam := usecam + 'O'
  else usecam := usecam + 'X';
  if chk_Light.Checked then usecam := usecam + 'O'
  else usecam := usecam + 'X';
  if chk_Door1.Checked then usecam := usecam + 'O'
  else usecam := usecam + 'X';
  if chk_Door2.Checked then usecam := usecam + 'O'
  else usecam := usecam + 'X';

  if chk_Camera1.Checked then usedev := 'O'
  else usedev := 'X';
  if chk_Camera2.Checked then usedev := usedev +'O'
  else usedev := usedev + 'X';
  if chk_Camera3.Checked then usedev := usedev +'O'
  else usedev := usedev + 'X';
  if chk_Camera4.Checked then usedev := usedev +'O'
  else usedev := usedev + 'X';

  stSendData := '';
  stSendData := stSendData + ed_CRCount.Text + KTDelimiter;
  stSendData := stSendData + useZone + KTDelimiter;
  stSendData := stSendData + emgZone + KTDelimiter;
  stSendData := stSendData + parZone + KTDelimiter;
  stSendData := stSendData + delZone + KTDelimiter;
  stSendData := stSendData + visZone + KTDelimiter;
  stSendData := stSendData + camZone + KTDelimiter;
  stSendData := stSendData + entrdly + KTDelimiter;
  stSendData := stSendData + exitdly + KTDelimiter;
  stSendData := stSendData + usecam + KTDelimiter;
  stSendData := stSendData + usedev + KTDelimiter;
  stSendData := stSendData + SensorType + KTDelimiter;
  stSendData := stSendData + Sensorcontact + KTDelimiter;

  Form_Main.KTDeviceReg('I',stSendData);


end;

procedure TfmKTReg.btnDeviceSearchClick(Sender: TObject);
begin
  Form_Main.KTDeviceReg('Q','');
end;

end.
