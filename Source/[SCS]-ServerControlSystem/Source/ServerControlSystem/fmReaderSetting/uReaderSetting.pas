unit uReaderSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfmReaderSetting = class(TForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    cmb_DeviceCode: TComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ADOQuery: TADOQuery;
    cmb_readerUse1: TComboBox;
    cmb_Door1: TComboBox;
    cmb_DoorPosi1: TComboBox;
    cmb_BuildingPosi1: TComboBox;
    cmb_readerUse2: TComboBox;
    cmb_Door2: TComboBox;
    cmb_DoorPosi2: TComboBox;
    cmb_BuildingPosi2: TComboBox;
    cmb_readerUse3: TComboBox;
    cmb_Door3: TComboBox;
    cmb_DoorPosi3: TComboBox;
    cmb_BuildingPosi3: TComboBox;
    cmb_readerUse4: TComboBox;
    cmb_Door4: TComboBox;
    cmb_DoorPosi4: TComboBox;
    cmb_BuildingPosi4: TComboBox;
    cmb_readerUse5: TComboBox;
    cmb_Door5: TComboBox;
    cmb_DoorPosi5: TComboBox;
    cmb_BuildingPosi5: TComboBox;
    cmb_readerUse6: TComboBox;
    cmb_Door6: TComboBox;
    cmb_DoorPosi6: TComboBox;
    cmb_BuildingPosi6: TComboBox;
    cmb_readerUse7: TComboBox;
    cmb_Door7: TComboBox;
    cmb_DoorPosi7: TComboBox;
    cmb_BuildingPosi7: TComboBox;
    cmb_readerUse8: TComboBox;
    cmb_Door8: TComboBox;
    cmb_DoorPosi8: TComboBox;
    cmb_BuildingPosi8: TComboBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    GroupBox3: TGroupBox;
    Label20: TLabel;
    cmb_ReaderType: TComboBox;
    btn_Setting: TSpeedButton;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_DeviceCodeChange(Sender: TObject);
    procedure cmb_readerUse1Change(Sender: TObject);
    procedure btn_SettingClick(Sender: TObject);
  private
    DeviceIDList : TStringList;
    { Private declarations }
    procedure DeviceLoad(cmb_Box:TComboBox;aType:string);
    Function CardTypeSearch(aNodeNo,aEcuID:string):Boolean;
    Function ReaderInfoSearch(aNodeNo,aEcuID:string;aReaderNo:integer):Boolean;
    Function CardTypeReg(aNodeNo,aEcuID:string):Boolean;
    Function RegCardReader(aNodeNo,aEcuID:string;  // ����ȣ
                aReaderNo,aUsed,aDoor,aDoorPosi,nBuildingPosi:integer;
                aLocate:string):Boolean;
  private
    procedure FormClear;
    procedure FormColorWhite; //������Ʈ ���� White �� ����
    //ComboBox ã�� �Լ�
    Function TravelComboBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TComboBox;

  public
    { Public declarations }
    procedure RcvCardType(aNodeNo,aEcuID,aData:string);
    procedure RcvReaderState(aNodeNo,aEcuID,aData:string);
  end;

var
  fmReaderSetting: TfmReaderSetting;

implementation
uses
  uDataModule1,
  uLomosUtil, uServerDaemon;

{$R *.dfm}

procedure TfmReaderSetting.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmReaderSetting.DeviceLoad(cmb_Box: TComboBox; aType: string);
var
  stSql : string;
  stDeviceName : string;
begin
  DeviceIDList.Clear;
  cmb_Box.Clear;
  DeviceIDList.Add('');
  if aType = 'Y' then
  begin
    cmb_Box.Items.Add('��ü');
  end else
  begin
    cmb_Box.Items.Add('');
  end;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
  stSql := stSql + ' order by AC_NODENO,AC_ECUID ';
  with AdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    while Not Eof do
    begin
      if FindField('AC_DEVICENAME').AsString = '' then stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_MCUIP').AsString
      else stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_DEVICENAME').AsString;
      cmb_Box.Items.Add(stDeviceName);
      DeviceIDList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString );
      Next;
    end;
  end;

end;

procedure TfmReaderSetting.FormShow(Sender: TObject);
begin
  DeviceIDList := TStringList.Create;
  
  DeviceLoad(cmb_DeviceCode,'Y');
end;

procedure TfmReaderSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceIDList.Free;
end;

procedure TfmReaderSetting.FormClear;
var
  i : integer;
begin
  cmb_ReaderType.ItemIndex := -1;
  cmb_ReaderType.Color := clWhite;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox2,'cmb_readerUse',i) do
    begin
      ItemIndex := -1;
      Color := clWhite;
    end;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox2,'cmb_Door',i) do
    begin
      ItemIndex := -1;
      Color := clWhite;
    end;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox2,'cmb_DoorPosi',i) do
    begin
      ItemIndex := -1;
      Color := clWhite;
    end;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox2,'cmb_BuildingPosi',i) do
    begin
      ItemIndex := -1;
      Color := clWhite;
    end;
  end;
end;

function TfmReaderSetting.TravelComboBoxItem(GroupBox: TGroupBox;
  stName: string; no: Integer): TComboBox;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TComboBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

procedure TfmReaderSetting.cmb_DeviceCodeChange(Sender: TObject);
var
  stDeviceID : string;
  i : integer;
  nIndex : integer;
begin
  FormClear;
  stDeviceID := DeviceIDList.Strings[cmb_DeviceCode.ItemIndex];
  nIndex := ConnectDeviceList.IndexOf(stDeviceID);
  if nIndex < 0 then
  begin
    showmessage('���� ���� ����� �ȵ˴ϴ�.');
    Exit;
  end;
  if Not CardTypeSearch(copy(stDeviceID,1,3), copy(stDeviceID,4,2)) then
  begin
    showmessage('���� Ÿ���� �������� ���߽��ϴ�.');
    Exit;
  end;
  for i:= 1 to 8 do
  begin
    ReaderInfoSearch(copy(stDeviceID,1,3), copy(stDeviceID,4,2),i);
    Application.ProcessMessages;
  end;

end;

function TfmReaderSetting.CardTypeSearch(aNodeNo, aEcuID: string): Boolean;
var
  stSendData: string;
  nTime : integer;
  PastTime : dword;
begin
  bCardReaderTypeCheck :=False;
  fmMain.PubCardTypeSearch(aNodeNo,aEcuID);

  nTime := 0;
  PastTime := GetTickCount + DelayTime;
  while Not bCardReaderTypeCheck do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //300�и����� ���� ������ ���з� ó����
  end;

  Result := bCardReaderTypeCheck;
end;

procedure TfmReaderSetting.RcvCardType(aNodeNo, aEcuID, aData: string);
var
  stDeviceID : string;
  stCardType : string;
begin
  stDeviceID := FillZeronumber(strtoint(aNodeno),3) + aEcuID;
  if stDeviceID <> DeviceIDList.Strings[cmb_DeviceCode.ItemIndex] then Exit;   //���� ���õǾ� �ִ� ��Ⱑ �ƴϸ� ���� ������.
  stCardType := Copy(aData, 22, 1);
  if IsDigit(stCardType) then cmb_ReaderType.ItemIndex := strtoint(stCardType) + 1;
  cmb_ReaderType.Color := clYellow;
  
end;

function TfmReaderSetting.ReaderInfoSearch(aNodeNo, aEcuID: string;
  aReaderNo: integer): Boolean;
var
  stDeviceID : string;
  stSendData : string;
  PastTime : dword;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  stSendData := 'CD' + FillZeroNumber(aReaderNo, 2);

  bReaderInfoSet[aReaderNo - 1] := False;
  fmMain.DevicePacketSend(stDeviceID, 'Q', stSendData, True);

  PastTime := GetTickCount + DelayTime;
  while Not bReaderInfoSet[aReaderNo - 1] do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //300�и����� ���� ������ ���з� ó����
  end;
  result := bReaderInfoSet[aReaderNo - 1];

end;

procedure TfmReaderSetting.RcvReaderState(aNodeNo, aEcuID, aData: string);
var
  stReaderNo : string;
  nReaderNo : integer;
  stTemp : string;
  cmb_Box : TComboBox;
begin
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  stReaderNo := Copy(aData, 20, 2);
  if Not isDigit(stReaderNo) then Exit;
  nReaderNo := strtoint(stReaderNo);

  stTemp := copy(aData,22,22);

  cmb_Box := TravelComboBoxItem(GroupBox2,'cmb_readerUse',nReaderNo);
  if cmb_Box <> nil then
  begin
    if isDigit(stTemp[1]) then cmb_Box.ItemIndex := strtoint(stTemp[1]) // ī�帮�� ��뿩��
    else cmb_Box.ItemIndex := 0;
    cmb_Box.Color := clYellow;
  end;

  cmb_Box := TravelComboBoxItem(GroupBox2,'cmb_Door',nReaderNo);
  if cmb_Box <> nil then
  begin
    if isDigit(stTemp[3]) then cmb_Box.ItemIndex := strtoint(stTemp[3]) //���Թ� ��ȣ
    else cmb_Box.ItemIndex := 0;
    cmb_Box.Color := clYellow;
  end;

  cmb_Box := TravelComboBoxItem(GroupBox2,'cmb_DoorPosi',nReaderNo);
  if cmb_Box <> nil then
  begin
    if isDigit(stTemp[2]) then cmb_Box.ItemIndex := strtoint(stTemp[2]) // �� ��ġ
    else cmb_Box.ItemIndex := 0;
    cmb_Box.Color := clYellow;
  end;

  cmb_Box := TravelComboBoxItem(GroupBox2,'cmb_BuildingPosi',nReaderNo);
  if cmb_Box <> nil then
  begin
    if isDigit(stTemp[22]) then cmb_Box.ItemIndex := strtoint(stTemp[22]) //���� ��ġ
    else cmb_Box.ItemIndex := 0;
    cmb_Box.Color := clYellow;
  end;

end;

procedure TfmReaderSetting.cmb_readerUse1Change(Sender: TObject);
begin
//  btn_Setting.Enabled := True;
end;

procedure TfmReaderSetting.btn_SettingClick(Sender: TObject);
var
  stDeviceID : string;
  i : integer;
  cmb_Box : TComboBox;
  nUsed : integer; //ī�帮�� �������
  nDoor : integer; //���� ���Թ� ��ȣ
  nDoorPosi : integer; // ���Թ� ��ġ ��ġ
  nBuildingPosi : integer; //�ǹ� ��ġ ��ġ
  bResult : Boolean;
begin
  FormColorWhite;
  stDeviceID := DeviceIDList.Strings[cmb_DeviceCode.ItemIndex];
  if Not CardTypeReg(copy(stDeviceID,1,3),copy(stDeviceID,4,2)) then
  begin
    showmessage('ī��Ÿ�� ������ �����Ͽ����ϴ�.');
    Exit;
  end;
  for i := 1 to 8 do
  begin
    cmb_Box := TravelComboBoxItem(GroupBox2,'cmb_readerUse',i);
    nUsed := 0;
    if cmb_Box <> nil then
    begin
      nUsed := cmb_Box.ItemIndex;
      if nUsed < 0 then nUsed := 0;
    end;
    nDoor := 0;
    cmb_Box := TravelComboBoxItem(GroupBox2,'cmb_Door',i);
    if cmb_Box <> nil then
    begin
      nDoor := cmb_Box.ItemIndex;
      if nDoor < 0 then nDoor := 0;
    end;
    nDoorPosi := 0;
    cmb_Box := TravelComboBoxItem(GroupBox2,'cmb_DoorPosi',i);
    if cmb_Box <> nil then
    begin
      nDoorPosi := cmb_Box.ItemIndex;
      if nDoorPosi < 0 then nDoorPosi := 0;
    end;
    nBuildingPosi := 0;
    cmb_Box := TravelComboBoxItem(GroupBox2,'cmb_BuildingPosi',i);
    if cmb_Box <> nil then
    begin
      nBuildingPosi := cmb_Box.ItemIndex;
      if nBuildingPosi < 0 then nBuildingPosi := 0;
    end;
    bResult := RegCardReader(copy(stDeviceID,1,3),copy(stDeviceID,4,2),  // ����ȣ
                I,          // ī�帮�� ��ȣ
                nUsed,      //  ��뿩��
                nDoor,    // ���� ����ȣ
                nDoorPosi,     //����ġ��ġ
                nBuildingPosi, //�ǹ���ġ��ġ
                '');   // ��ġ��

  end;
end;

Function TfmReaderSetting.CardTypeReg(aNodeNo,aEcuID:string):Boolean;
var
  stSendData: string;
  nTime : integer;
  PastTime : dword;
  stDeviceID : string;
begin
  Result := false;
  if (cmb_ReaderType.ItemIndex < 1) or (cmb_ReaderType.ItemIndex > 4) then Exit;


  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  stSendData := 'Ct00' + inttostr(cmb_ReaderType.ItemIndex - 1);                               //ī�帮�� Ÿ�� ���

  bCardReaderTypeCheck :=False;
  fmMain.DevicePacketSend(stDeviceID, 'I', stSendData, True);

  nTime := 0;
  PastTime := GetTickCount + DelayTime;
  while Not bCardReaderTypeCheck do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //300�и����� ���� ������ ���з� ó����
  end;

  Result := bCardReaderTypeCheck;

end;

procedure TfmReaderSetting.FormColorWhite;
var
  i : integer;
begin
  cmb_ReaderType.Color := clWhite;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox2,'cmb_readerUse',i) do
    begin
      Color := clWhite;
    end;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox2,'cmb_Door',i) do
    begin
      Color := clWhite;
    end;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox2,'cmb_DoorPosi',i) do
    begin
      Color := clWhite;
    end;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox2,'cmb_BuildingPosi',i) do
    begin
      Color := clWhite;
    end;
  end;
end;

function TfmReaderSetting.RegCardReader(aNodeNo, aEcuID: string; aReaderNo,
  aUsed, aDoor, aDoorPosi, nBuildingPosi: integer;
  aLocate: string): Boolean;
var
  stDeviceID : string;
  FirstTickCount : Double;
  stSendData : string;
  PastTime : dword;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  stSendData:= 'CD'+FillZeroNumber(aReaderNo,2) +
          inttostr(aUsed) +   //���� ��� ����
          inttostr(aDoorPosi) +         //���� ��ġ
          inttostr(aDoor) +         //Door No
          '00' +                //����ȣ
          Setlengthstr(aLocate,16) +           //��ġ��
          inttostr(nBuildingPosi) +  //�ǹ� ��ġ ��ġ
          '0';       //Wigand Card Bit

  bReaderInfoSet[aReaderNo - 1] := False;

  fmMain.DevicePacketSend(stDeviceID, 'I', stSendData, True);

  PastTime := GetTickCount + DelayTime;
  while Not bReaderInfoSet[aReaderNo - 1] do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //300�и����� ���� ������ ���з� ó����
  end;
  result := bReaderInfoSet[aReaderNo - 1];

end;

end.
