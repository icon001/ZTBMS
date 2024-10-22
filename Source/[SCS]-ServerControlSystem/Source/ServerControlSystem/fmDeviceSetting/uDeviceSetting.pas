unit uDeviceSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzSpnEdt, RzCmboBx, DB, ADODB, Buttons;

type
  TfmDeviceSetting = class(TForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    cmb_DeviceCode: TComboBox;
    Label1: TLabel;
    cmb_DoorCode: TComboBox;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    ComboBox_CardModeType1: TRzComboBox;
    Label23: TLabel;
    ComboBox_DoorModeType1: TRzComboBox;
    Label24: TLabel;
    cmb_DoorControlTime1: TRzComboBox;
    Label12: TLabel;
    Label42: TLabel;
    SpinEdit_OpenMoni1: TRzSpinEdit;
    Label47: TLabel;
    ComboBox_UseSch1: TRzComboBox;
    Label48: TLabel;
    ComboBox_SendDoorStatus1: TRzComboBox;
    Label51: TLabel;
    ComboBox_AlarmLongOpen1: TRzComboBox;
    Label54: TLabel;
    ComboBox_ControlFire1: TRzComboBox;
    Label53: TLabel;
    ComboBox_LockType1: TRzComboBox;
    Label313: TLabel;
    cmb_DsOpenState1: TRzComboBox;
    cmb_RemoteDoorOpen1: TRzComboBox;
    Label26: TLabel;
    Label46: TLabel;
    btn_Close: TSpeedButton;
    btn_Setting: TSpeedButton;
    ADOQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_DeviceCodeChange(Sender: TObject);
    procedure cmb_DoorCodeChange(Sender: TObject);
    procedure btn_SettingClick(Sender: TObject);
  private
    DeviceIDList : TStringList;
    DoorIDList : TStringList;
    { Private declarations }
    procedure DeviceLoad(cmb_Box:TComboBox;aType:string);
    procedure DoorLoad(aDeviceCode:string;cmb_Box:TComboBox;aType:string);

    procedure FormClear;
    procedure FormInitialize;
  public
    { Public declarations }
    procedure DoorInfoSetting(aNodeNo,aEcuID,aDoorNo,aData:string);
  end;

var
  fmDeviceSetting: TfmDeviceSetting;

implementation
uses
  uDataModule1,
  uLomosUtil, uServerDaemon;
{$R *.dfm}

procedure TfmDeviceSetting.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeviceSetting.DeviceLoad(cmb_Box: TComboBox; aType: string);
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
  cmb_Box.ItemIndex := 0;
  
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
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

procedure TfmDeviceSetting.FormCreate(Sender: TObject);
begin
  DeviceIDList := TStringList.Create;
  DoorIDList := TStringList.Create;

  DeviceLoad(cmb_DeviceCode,'Y');
  DoorLoad('',cmb_DoorCode,'N');

  FormInitialize;
  FormClear;
end;

procedure TfmDeviceSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceIDList.Free;
  DoorIDList.Free;

end;

procedure TfmDeviceSetting.DoorLoad(aDeviceCode: string;
  cmb_Box: TComboBox; aType: string);
var
  stSql : string;
  stDoorName : string;
begin
  DoorIDList.Clear;
  cmb_Box.Clear;
  DoorIDList.Add('');
  if aType = 'Y' then
  begin
    cmb_Box.Items.Add('��ü');
  end else
  begin
    cmb_Box.Items.Add('');
  end;
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aDeviceCode <> '') and (copy(aDeviceCode,1,3) <> '000') then
  begin
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aDeviceCode,1,3))) ;
    stSql := stSql + ' AND AC_ECUID = ''' + copy(aDeviceCode,4,2) + ''' ';
  end;
  stSql := stSql + ' order by DO_VIEWSEQ,AC_NODENO,AC_ECUID,DO_DOORNO ';
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
      if FindField('DO_DOORNONAME').AsString = '' then stDoorName := inttostr(FindField('AC_NODENO').AsInteger) + ':' + FindField('AC_ECUID').AsString + '-' + FindField('DO_DOORNO').AsString
      else stDoorName := FindField('DO_DOORNONAME').AsString;
      cmb_Box.Items.Add(stDoorName);
      DoorIDList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString);
      Next;
    end;
  end;
end;

procedure TfmDeviceSetting.cmb_DeviceCodeChange(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := DeviceIDList.Strings[cmb_DeviceCode.itemIndex];
  DoorLoad(stDeviceID,cmb_DoorCode,'N');
  FormClear;
end;

procedure TfmDeviceSetting.FormClear;
begin
  ComboBox_CardModeType1.ItemIndex := -1;
  ComboBox_DoorModeType1.ItemIndex := -1;
  cmb_DoorControlTime1.ItemIndex := -1;
  SpinEdit_OpenMoni1.Value := 0;
  ComboBox_UseSch1.ItemIndex := -1;
  ComboBox_SendDoorStatus1.ItemIndex := -1;
  ComboBox_AlarmLongOpen1.ItemIndex := -1;
  ComboBox_ControlFire1.ItemIndex := -1;
  ComboBox_LockType1.ItemIndex := -1;
  cmb_DsOpenState1.ItemIndex := -1;
  cmb_RemoteDoorOpen1.ItemIndex := -1;

  ComboBox_CardModeType1.Color := clWhite;
  ComboBox_DoorModeType1.Color := clWhite;
  cmb_DoorControlTime1.Color := clWhite;
  SpinEdit_OpenMoni1.Color := clWhite;
  ComboBox_UseSch1.Color := clWhite;
  ComboBox_SendDoorStatus1.Color := clWhite;
  ComboBox_AlarmLongOpen1.Color := clWhite;
  ComboBox_ControlFire1.Color := clWhite;
  ComboBox_LockType1.Color := clWhite;
  cmb_DsOpenState1.Color := clWhite;
  cmb_RemoteDoorOpen1.Color := clWhite;

  btn_Setting.Enabled := False;

end;

procedure TfmDeviceSetting.cmb_DoorCodeChange(Sender: TObject);
var
  stDoorID : string;
  nIndex : integer;
begin
  FormClear;
  if cmb_DoorCode.ItemIndex < 1 then Exit;
  stDoorID := DoorIDList.Strings[cmb_DoorCode.ItemIndex];
  nIndex := ConnectDeviceList.IndexOf(copy(stDoorID,1,5));
  if nIndex < 0 then
  begin
    showmessage('���� ���Թ��� ����� �ȵ˴ϴ�.');
    Exit;
  end;
  fmMain.PubDoorInfo_Device_Serch(copy(stDoorID,1,3), copy(stDoorID,4,2),copy(stDoorID,6,1));
end;

procedure TfmDeviceSetting.DoorInfoSetting(aNodeNo, aEcuID, aDoorNo,
  aData: string);
var
  SelectDoorID : string;
  stDoorID : string;

  nCardMode: Integer;
  nDoorMode: Integer;
  cDoorOPen: Char;
  cOpenMoni: Char;
  nUseSch:    Integer;
  nSendDoorStatus: Integer;
  nAlarmLongOpen: Integer;
  nLockType: Integer;
  nControlFire: Integer;
  StatusStr: String;

  nDoorControlTime : integer;
  nOrd : integer;
  nMsec : integer;
begin
  if cmb_DoorCode.ItemIndex < 1 then Exit;
  SelectDoorID := DoorIDList.Strings[cmb_DoorCode.ItemIndex];
  stDoorID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + aDoorNo;

  if SelectDoorID <> stDoorID then Exit;


  {ī�����}
  if aData[6] >= #$30 then
  begin
    nCardMode:= StrtoInt(aData[6]);
  end;

  {���Թ� ����}
  if aData[7] >= #$30 then
  begin
    nDoorMode:= StrtoInt(aData[7]);
  end;

  {DOOR����ð�}
  cDoorOPen:= aData[8];

  {��ð� ���� �溸}
  if aData[9] >= #$30 then
  begin
    cOpenMoni:= aData[9];
  end;
  {������ ���� ����}
  if aData[10] >= #$30 then
  begin
   nUseSch:= StrtoInt(aData[10]);
  end;
  {���Թ� ���� ����}
  if aData[11] >= #$30 then
  begin
    nSendDoorStatus:= StrtoInt(aData[11]);
  end;
  {��� �̻�� ��� }
  if aData[12] >= #$30 then
  begin
    // ���� ������
  end;
  {Antipassback}
  if aData[13] >= #$30 then
  begin
    //���� ��� ����
  end;
  {��ð� ���� ���� ���}
  if aData[14] >= #$30 then
  begin
    nAlarmLongOpen:= StrtoInt(aData[14]);
  end;
  {��� �̻�� ���� ���}
  if aData[15] >= #$30 then
  begin
    //���� ��� ����
  end;
  {������ Ÿ��}
  if aData[16] >= #$30 then
  begin
    nLockType:= StrtoInt(aData[16]);
  end;
  {ȭ�� �߻��� ������}
  if aData[17] >= #$30 then
  begin
   nControlFire:= StrtoInt(aData[17]);
  end;

  ComboBox_CardModeType1.ItemIndex:=     nCardMode;
  ComboBox_CardModeType1.Color := clYellow;

  ComboBox_DoorModeType1.ItemIndex:=     nDoorMode;
  ComboBox_DoorModeType1.Color := clYellow;

  if cDoorOPen >= #$30 then
  begin
   if cDoorOPen < #$40 then  cmb_DoorControlTime1.Text := cDoorOPen
   else
   begin
      if (cDoorOPen >= 'A') and (cDoorOPen <= 'Z') then  nDoorControlTime := Ord(cDoorOPen) - Ord('A')
      else nDoorControlTime := Ord(cDoorOPen) - Ord('a') + 26;
      nDoorControlTime := nDoorControlTime * 5;
      cmb_DoorControlTime1.Text := inttostr( 10 + nDoorControlTime );
   end;
  end else
  begin
    nOrd := Ord(cDoorOPen);
    nMsec := (nOrd - $20) * 100;
    cmb_DoorControlTime1.Text := inttostr(nMsec) + 'ms';
  end;
  cmb_DoorControlTime1.Color := clYellow;

  SpinEdit_OpenMoni1.IntValue:=          Ord(cOpenMoni) - $30;
  SpinEdit_OpenMoni1.Color := clYellow;

  ComboBox_UseSch1.ItemIndex:=           nUseSch;
  ComboBox_UseSch1.Color := clYellow;

  ComboBox_SendDoorStatus1.ItemIndex:=   nSendDoorStatus;
  ComboBox_SendDoorStatus1.Color := clYellow;

  ComboBox_AlarmLongOpen1.ItemIndex:=    nAlarmLongOpen;
  ComboBox_AlarmLongOpen1.Color := clYellow;

  if nLockType < 4 then
    ComboBox_LockType1.ItemIndex:=         nLockType
  else ComboBox_LockType1.ItemIndex:=         nLockType - 2;
  ComboBox_LockType1.Color := clYellow;

  ComboBox_ControlFire1.ItemIndex:=      nControlFire;
  ComboBox_ControlFire1.Color := clYellow;

  //���Թ���������
  if IsDigit(aData[19]) then
  begin
    cmb_DsOpenState1.ItemIndex := strtoint(aData[19]);
    cmb_DsOpenState1.Color := clYellow;
  end;
  //���������� Door Open
  if IsDigit(aData[20]) then
  begin
    cmb_RemoteDoorOpen1.ItemIndex := strtoint(aData[20]);
    cmb_RemoteDoorOpen1.Color := clYellow;
  end;

  btn_Setting.Enabled := True;
end;

procedure TfmDeviceSetting.FormInitialize;
begin
  with ComboBox_CardModeType1 do     //���Թ�1 ī�� ���
  begin
    Clear;
    Items.Add('Positive');
    Items.Add('Negative');
    ItemIndex := 0;
  end;
  with ComboBox_DoorModeType1 do     //���Թ�1 � ���
  begin
    Clear;
    Items.Add('����');
    Items.Add('������');
    Items.Add('�����');
    ItemIndex := 0;
  end;

  with ComboBox_UseSch1 do     //���Թ�1 ������
  begin
    Clear;
    Items.Add('����');
    Items.Add('����');
    ItemIndex := 0;
  end;

  with ComboBox_SendDoorStatus1 do     //���Թ�1 ���� ���ۿ���
  begin
    Clear;
    Items.Add('������');
    Items.Add('���Թ�����');
    Items.Add('���������');
    Items.Add('���Թ�+���������');
    ItemIndex := 1;
  end;

  with ComboBox_AlarmLongOpen1 do     //���Թ�1��ð� ���� ���� ���
  begin
    Clear;
    Items.Add('����');
    Items.Add('���');
    ItemIndex := 0;
  end;

  with ComboBox_ControlFire1 do     //���Թ�1 ȭ�� �߻��� ������
  begin
    Clear;
    Items.Add('����');
    Items.Add('���');
    ItemIndex := 0;
  end;

  with ComboBox_LockType1 do       //���Թ�1 ������ Ÿ��
  begin
    Clear;
    Items.Add('�Ϲ���(������ ���)');
//    Items.Add('�ڵ���');
    Items.Add('�Ϲ���(������ ����)');
//    Items.Add('�����/EM��/��Ʈ����Ŀ');
    Items.Add('���庼Ʈ(������ ���)');
    Items.Add('���庼Ʈ(������ ����)');
//    Items.Add('��Ʈ����ũ(������ ���)');
//    Items.Add('0x35 ����');
//    Items.Add('��Ʈ����ũ(���Ž� ����)');
//    Items.Add('0x36 ����');
    Items.Add('�ڵ���/����');
//    Items.Add('0x37 �Ĵ�');
    Items.Add('�Ĵ�(����/��������)');
    Items.Add('SPEED GATE');
//    Items.Add('����Ÿ��');
    ItemIndex := 1;
  end;



end;

procedure TfmDeviceSetting.btn_SettingClick(Sender: TObject);
var
  stDoorID : string;
begin
  if cmb_DoorCode.ItemIndex < 1 then Exit;

  stDoorID := DoorIDList.Strings[cmb_DoorCode.ItemIndex];
  fmMain.PubDoorInfo_Device_Setting(copy(stDoorID,1,3),
                                    copy(stDoorID,4,2),
                                    copy(stDoorID,6,1),
                                    inttostr(ComboBox_CardModeType1.ItemIndex),
                                    inttostr(ComboBox_DoorModeType1.ItemIndex),
                                    cmb_DoorControlTime1.Text,
                                    inttostr(SpinEdit_OpenMoni1.IntValue),
                                    inttostr(ComboBox_UseSch1.ItemIndex),
                                    inttostr(ComboBox_SendDoorStatus1.ItemIndex),
                                    inttostr(ComboBox_AlarmLongOpen1.ItemIndex),
                                    inttostr(ComboBox_ControlFire1.ItemIndex),
                                    inttostr(ComboBox_LockType1.ItemIndex),
                                    inttostr(cmb_DsOpenState1.ItemIndex),
                                    inttostr(cmb_RemoteDoorOpen1.ItemIndex)
                                     );

  FormClear;
end;

end.
