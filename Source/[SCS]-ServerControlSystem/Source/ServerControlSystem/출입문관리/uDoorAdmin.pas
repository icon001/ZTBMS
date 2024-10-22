unit uDoorAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls,
  Spin, RzPanel, RzRadGrp, DB, ADODB, uSubForm, CommandArray,ActiveX;

type
  TfmDoorAdmin = class(TfmASubForm)
    pan_header: TPanel;
    GroupBox4: TGroupBox;
    Splitter2: TSplitter;
    Panel6: TPanel;
    GroupBox10: TGroupBox;
    Label7: TLabel;
    Label22: TLabel;
    Label10: TLabel;
    ed_regDoorName: TEdit;
    ed_regDoorNo: TSpinEdit;
    cmb_regDeviceCode: TComboBox;
    Panel5: TPanel;
    GroupBox11: TGroupBox;
    Label9: TLabel;
    cmb_DeviceCode: TComboBox;
    sg_Door: TAdvStringGrid;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    Group_CardReaderNo: TRzCheckGroup;
    Label1: TLabel;
    cmb_regDoorType: TComboBox;
    Label2: TLabel;
    ed_DoorControlTime: TSpinEdit;
    rg_ScheduleUse: TRadioGroup;
    Label3: TLabel;
    ADOQuery: TADOQuery;
    Label4: TLabel;
    cmb_CardReaderType: TComboBox;
    Label5: TLabel;
    cmb_Fire: TComboBox;
    Label6: TLabel;
    cmb_DoorMode: TComboBox;
    btn_Cancel: TSpeedButton;
    ed_regDoorSeq: TSpinEdit;
    Label13: TLabel;
    cmb_sBuildingCode: TComboBox;
    Label15: TLabel;
    cmb_sFloorCode: TComboBox;
    Label23: TLabel;
    cmb_sAreaCode: TComboBox;
    Label12: TLabel;
    ed_TotWidth: TEdit;
    ed_TotHeight: TEdit;
    ed_CurX: TEdit;
    ed_CurY: TEdit;
    btnDoorPosition: TBitBtn;
    chk_DoorReg: TCheckBox;
    ADOfdmsQuery: TADOQuery;
    chk_DoorUpdate: TCheckBox;
    Label8: TLabel;
    ed_BizMekaCode: TEdit;
    lb_soundip: TLabel;
    ed_SoundIP: TEdit;
    ed_SoundPort: TEdit;
    lb_soundport: TLabel;
    Label11: TLabel;
    ed_Volume: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure cmb_DeviceCodeChange(Sender: TObject);
    procedure sg_DoorClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure cmb_regDeviceCodeChange(Sender: TObject);
    procedure cmb_sBuildingCodeChange(Sender: TObject);
    procedure cmb_sFloorCodeChange(Sender: TObject);
    procedure btnDoorPositionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_regDoorTypeChange(Sender: TObject);
    procedure ed_DoorControlTimeChange(Sender: TObject);
    procedure cmb_FireChange(Sender: TObject);
    procedure cmb_DoorModeChange(Sender: TObject);
    procedure rg_ScheduleUseClick(Sender: TObject);
    procedure Group_CardReaderNoChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure ed_regDoorNoChange(Sender: TObject);
    procedure cmb_sAreaCodeChange(Sender: TObject);
  private
    L_nTopRow : integer;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure GridInit;
    procedure DeviceLoad(cmb_Box:TComboBox;aType:string);
    procedure LockTypeSet;
    function FormCheck : Boolean;
    function DupCheckCardReaderDoor(aNodeNo,aEcuID,aReaderNo,aDoorNo:string):Boolean;
    function DupCheckCardReader(aNodeNo,aEcuID,aReaderNo:string):Boolean;
    function CardReaderTypeCheck(aNodeNo,aEcuID,aReaderType:string; var aDoorNo:string):Boolean;
    procedure DoorSeach(aDoorID:string;aTop :integer = 0);
    procedure SetCardReader(aNodeNo,aEcuID,aDoorNo:string);
    function GetDoorSeq:integer;
    function GetDoorNumber(aNodeNo,aEcuID:string):integer;
    function GetFdmsDoorID:string;

    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);

  public
    { Public declarations }
    function InsertIntoTB_DOOR(aNodeNo,
                                 aEcuID,
                                 aDoorNo,
                                 aDoorName,
                                 aDoorType,
                                 aScheduleUse,
                                 aDoorControlTime,
                                 aDoorSeq,
                                 aReaderType,
                                 aFire,
                                 aDoorMode,
                                 aSendAck,
                                 aBuildingCode,
                                 aFloorCode,
                                 aAreaCode,
                                 aRegState,
                                 aTotWidth,
                                 aTotHeight,
                                 aCurX,
                                 aCurY,
                                 aSoundIP,
                                 aSoundPort,
                                 aVolume:string):Boolean;
    function DupCheckTB_DOOR(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    function UpdateTB_DOOR(aNodeNo,
                                 aEcuID,
                                 aDoorNo,
                                 aDoorName,
                                 aDoorType,
                                 aScheduleUse,
                                 aDoorControlTime,
                                 aDoorSeq,
                                 aReaderType,
                                 aFire,
                                 aDoorMode,
                                 aSendAck,
                                 aBuildingCode,
                                 aFloorCode,
                                 aAreaCode,
                                 aRegState,
                                 aTotWidth,
                                 aTotHeight,
                                 aCurX,
                                 aCurY,
                                 aSoundIP,
                                 aSoundPort,
                                 aVolume:string):Boolean;
    function UpdateTB_DOORInfo(aNodeNo,
                                 aEcuID,
                                 aDoorNo,
                                 aDoorName,
                                 aDoorSeq,
                                 aBuildingCode,
                                 aFloorCode,
                                 aAreaCode,
                                 aRegState,
                                 aTotWidth,
                                 aTotHeight,
                                 aCurX,
                                 aCurY,
                                 aSoundIP,
                                 aSoundPort,
                                 aVolume:string):Boolean;
    function InsertTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function UpdateTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function UpdateTB_DoorReader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function DeleteTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo:string):Boolean;
    function DeleteTB_DOOR(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    function UpdateTB_DOORReaderType(aNodeNo,aEcuID,aReaderType,aSendAck:string):Boolean;
    function DeleteTB_KTBIZMEKADOOR(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    function InsertIntoTB_KTBIZMEKADOOR(aNodeNo,aEcuID,aDoorNo,aBizMekacode:string):Boolean;
    function UpdateTB_KTBIZMEKADOOR(aNodeNo,aEcuID,aDoorNo,aBizMekacode:string):Boolean;

  end;

var
  fmDoorAdmin: TfmDoorAdmin;
  DeviceIDList : TStringList;
  LockTypeList : TStringList;
  sBuildingCodeList : TStringList;
  sFloorCodeList : TStringList;
  sAreaCodeList :TStringList;
  State : string;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uServerDaemon, uPositionSet;
{$R *.dfm}

procedure TfmDoorAdmin.btn_CloseClick(Sender: TObject);
begin
  close;
end;

procedure TfmDoorAdmin.GridInit;
var
  nCol : integer;
begin
  with sg_Door do
  begin
    RowCount := 2;
    for nCol := 0 to ColCount - 1 do
    begin
      Cells[nCol,1] := '';
    end;
    for nCol := 4 to ColCount - 1 do
    begin
      ColWidths[nCol] := 0;
    end;
  end;
end;

procedure TfmDoorAdmin.FormCreate(Sender: TObject);
begin
  L_nTopRow := 1;

  sBuildingCodeList := TStringList.Create ;
  sFloorCodeList := TStringList.Create;
  sAreaCodeList := TStringList.Create;

  ed_regDoorNo.MaxValue := DOORCOUNT;
  DeviceIDList := TStringList.Create;
  LockTypeList := TStringList.Create;

  if G_nSCSRelayServer = 4 then
  begin
    lb_soundip.Visible := True;
    lb_soundport.Visible := True;
    ed_SoundIP.Visible := True;
    ed_SoundPort.Visible := True;
  end else
  begin
    lb_soundip.Visible := False;
    lb_soundport.Visible := False;
    ed_SoundIP.Visible := False;
    ed_SoundPort.Visible := False;
  end;
end;

procedure TfmDoorAdmin.DeviceLoad(cmb_Box: TComboBox; aType: string);
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
  stSql := stSql + ' AND AC_ACTYPE = ''1'' ';
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

procedure TfmDoorAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceIDList.Clear;
  LockTypeList.Clear;
  sBuildingCodeList.Clear ;
  sFloorCodeList.Clear;
  sAreaCodeList.Clear;
  
  DeviceIDList.Free;
  LockTypeList.Free;
  sBuildingCodeList.Free ;
  sFloorCodeList.Free;
  sAreaCodeList.Free;
end;

procedure TfmDoorAdmin.FormClear;
var
  i :integer;
begin
//  cmb_regDeviceCode.ItemIndex := 0;
  chk_DoorUpdate.Checked := false;
  ed_regDoorNo.Value := 1;
  ed_regDoorName.Text := '';
  ed_regDoorSeq.Value := 0;
  cmb_regDoorType.ItemIndex := 0;
  cmb_CardReaderType.ItemIndex := 0;
  ed_DoorControlTime.Value := 3;
  rg_ScheduleUse.ItemIndex := 0;
  for i:= 1 to CARDREADERCOUNT do
  begin
    Group_CardReaderNo.ItemChecked[I-1]:= False;
  end;
  cmb_sBuildingCode.ItemIndex := 0;
  cmb_sFloorCode.Clear;
  cmb_sAreaCode.Clear;
  ed_CurX.Text := '0';
  ed_CurY.Text:= '0';
  ed_TotWidth.Text:= '0';
  ed_TotHeight.Text:= '0';
  ed_BizMekaCode.Text := '';
  ed_SoundIP.Text := '';
  ed_SoundPort.Text := '';

end;

procedure TfmDoorAdmin.LockTypeSet;
begin
  LockTypeList.Clear;
  cmb_regDoorType.Clear;
  with cmb_regDoorType do
  begin
    Items.Add('�Ϲ���(������ ����)');
    Items.Add('���庼Ʈ(������ ����)');
    Items.Add('�Ϲ���(������ ���)');
    Items.Add('���庼Ʈ(������ ���)');
    Items.Add('�ڵ���/����');
  end;
  LockTypeList.Add('1');
  LockTypeList.Add('3');
  LockTypeList.Add('0');
  LockTypeList.Add('2');
  LockTypeList.Add('6');
end;

procedure TfmDoorAdmin.btn_InsertClick(Sender: TObject);
var
  stDeviceID : string;
  nDoorNo : integer;
  i : integer;
begin
  L_nTopRow := sg_Door.TopRow;
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  cmb_regDeviceCode.ItemIndex := cmb_DeviceCode.ItemIndex;
//  if cmb_DeviceCode.ItemIndex > 0 then  cmb_regDeviceCode.ItemIndex := cmb_DeviceCode.ItemIndex;

  nDoorNo := 1;
  if cmb_regDeviceCode.ItemIndex > 0 then
  begin
    stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.ItemIndex];
    nDoorNo := GetDoorNumber(copy(stDeviceID,1,3),Copy(stDeviceID,4,2));
    if ( nDoorNo < 0) or (nDoorNo > DOORCOUNT) then
    begin
      showmessage('�ش� ����� ���Թ� ������ �ʰ� �Ǿ����ϴ�.');
      Exit;
    end;
  end;

  with sg_Door do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 5 then TopRow := RowCount - 5;
      Enabled := False;
    end;
  end;

  ed_regDoorNo.Value := nDoorNo;
  ed_regDoorSeq.Value := GetDoorSeq;
  Group_CardReaderNo.ItemChecked[nDoorNo - 1] := True;

  cmb_regDeviceCode.SetFocus;
end;

procedure TfmDoorAdmin.btn_UpdateClick(Sender: TObject);
begin
  chk_DoorUpdate.Checked := False;
  
  L_nTopRow := sg_Door.TopRow;
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

  ed_regDoorName.SetFocus;
end;

procedure TfmDoorAdmin.btn_SaveClick(Sender: TObject);
var
  stDeviceID :string;
  stNodeNo : string;
  stEcuID : string;
  stReaderType : string;
  i : integer;
  bResult : Boolean;
  stDoorNo : string;

  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stRegState : string;
  stTotWidth,stTotHeight,stCurX,stCurY : string;
  stVolume : string;
begin
  if Not FormCheck then Exit;
  btn_Cancel.Enabled := False;
  stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  stNodeNo := copy(stDeviceID,1,3);
  stEcuID := copy(stDeviceID,4,2);
  stReaderType := copy(cmb_CardReaderType.Text,1,1);
  stDoorNo := inttostr(ed_regDoorNo.Value);
  stVolume := ed_Volume.Text;
  if Not isDigit(stVolume) then stVolume := '112';
  if strtoint(stVolume) > 130 then stVolume := '130';

  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_sBuildingCode.itemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode.itemIndex];
  if cmb_sFloorCode.itemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode.itemIndex];
  if cmb_sAreaCode.itemIndex > 0 then  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.itemIndex];
  if chk_DoorReg.Checked then  stRegState := 'Y'
  else stRegState := 'N' ;
  if Trim(ed_TotWidth.text) <> '' then stTotWidth := Trim(ed_TotWidth.text)
  else stTotWidth := '0';
  if Trim(ed_TotHeight.text) <> '' then stTotHeight := Trim(ed_TotHeight.text)
  else stTotHeight := '0';
  if Trim(ed_CurX.text) <> '' then stCurX := Trim(ed_CurX.text)
  else stCurX := '0';
  if Trim(ed_CurY.text) <> '' then stCurY := Trim(ed_CurY.text)
  else stCurY := '0';
  {
  if CardReaderTypeCheck(stNodeNo,stEcuID,stReaderType,stDoorNo) then
  begin
    if MessageDlg(stDoorNo + '�� ���Թ��� ī�帮�� Ÿ���� Ʋ���ϴ�.' + #13 +
                  stDoorNo + '�� ���Թ��� ī�帮�� Ÿ���� ���� Ÿ������ �����Ͻðڽ��ϱ�?', mtConfirmation, [mbYes, mbNo],0) <> mrYes then
    begin
      Exit;
    end;
    UpdateTB_DOORReaderType(stNodeNo,stEcuID,stReaderType,'N');
  end;    }

  for i := 1 to CARDREADERCOUNT do
  begin
    if Group_CardReaderNo.ItemChecked[i-1] then
    begin
      if DupCheckCardReaderDoor(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value)) then
      begin
        if MessageDlg(inttostr(i) + '�� �����Ⱑ �̹� ��� ���Դϴ�.' + #13 +
                      inttostr(i) + '�� �����⸦ ���� ���Թ� ��� ��� �Ͻðڽ��ϱ�?', mtConfirmation, [mbYes, mbNo],0) <> mrYes then
        begin
          Exit;
        end;
      end;
    end;
  end;

  if Uppercase(State) = 'INSERT' then
  begin
    if DupCheckTB_DOOR(stNodeNo,stEcuID,inttostr(ed_regDoorNo.Value)) then
    begin
      showmessage('�ߺ��� ����ȣ �Դϴ�.');
      btn_Save.Enabled := True;
      Exit;
    end;
    bResult := InsertIntoTB_DOOR(stNodeNo,
                                 stEcuID,
                                 inttostr(ed_regDoorNo.Value),
                                 ed_regDoorName.Text,
                                 LockTypeList.Strings[cmb_regDoorType.ItemIndex],
                                 inttostr(rg_ScheduleUse.ItemIndex),
                                 inttostr(ed_DoorControlTime.Value),
                                 inttostr(ed_regDoorSeq.value),
                                 stReaderType,
                                 inttostr(cmb_Fire.itemIndex),
                                 inttostr(cmb_DoorMode.ItemIndex),
                                 'N',
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 ed_SoundIP.text,
                                 ed_SoundPort.Text,
                                 stVolume
                                  );
  end else
  begin
    if chk_DoorUpdate.Checked then
    begin
      bResult := UpdateTB_DOOR(stNodeNo,
                                 stEcuID,
                                 inttostr(ed_regDoorNo.Value),
                                 ed_regDoorName.Text,
                                 LockTypeList.Strings[cmb_regDoorType.ItemIndex],
                                 inttostr(rg_ScheduleUse.ItemIndex),
                                 inttostr(ed_DoorControlTime.Value),
                                 inttostr(ed_regDoorSeq.Value),
                                 stReaderType,
                                 inttostr(cmb_Fire.itemIndex),
                                 inttostr(cmb_DoorMode.ItemIndex),
                                 'N',
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 ed_SoundIP.text,
                                 ed_SoundPort.Text,
                                 stVolume
                                  );
    end else
    begin
      bResult := UpdateTB_DOORInfo(stNodeNo,
                                 stEcuID,
                                 inttostr(ed_regDoorNo.Value),
                                 ed_regDoorName.Text,
                                 inttostr(ed_regDoorSeq.Value),
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 ed_SoundIP.text,
                                 ed_SoundPort.Text,
                                 stVolume
                                  );
    end;
  end;
  if Not bResult then
  begin
    showmessage('���Թ� ������ ���忡 ���� �߽��ϴ�.');
    btn_Save.Enabled := True;
    Exit;
  end;

  if Trim(ed_BizMekaCode.Text) = '' then
  begin
    DeleteTB_KTBIZMEKADOOR(stNodeNo,stEcuID,inttostr(ed_regDoorNo.Value));
  end else
  begin
    if Not InsertIntoTB_KTBIZMEKADOOR(stNodeNo,stEcuID,inttostr(ed_regDoorNo.Value),ed_BizMekaCode.Text) then
        UpdateTB_KTBIZMEKADOOR(stNodeNo,stEcuID,inttostr(ed_regDoorNo.Value),ed_BizMekaCode.Text);
  end;

  if (Uppercase(State) = 'INSERT') or (chk_DoorUpdate.Checked) then
  begin
    for i := 1 to CARDREADERCOUNT do
    begin
      if Group_CardReaderNo.ItemChecked[i-1] then //ī�帮�� ��ȣ üũ �Ǿ� ������
      begin
        if DupCheckCardReader(stNodeNo,stEcuID,inttostr(i)) then
        begin
          UpdateTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value),'N','Y');
        end else
        begin
          InsertTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value),'N','Y');
        end;
      end else      //ī�帮�� ��ȣ üũ �Ǿ� ���� ������
      begin
        if Not DupCheckCardReaderDoor(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value)) then //����ϴ� ���� ������
        begin
          UpdateTB_DoorReader(stNodeNo,stEcuID,inttostr(i),'0','N','N');
        end;
        //DeleteTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value));
      end;
    end;
  end;

  if Uppercase(State) = 'UPDATE' then
    DoorSeach(FillZeroNumber(strtoint(stNodeNo),3) +
            stEcuID +
            inttostr(ed_regDoorNo.Value),sg_Door.topRow)
  else
    DoorSeach(FillZeroNumber(strtoint(stNodeNo),3) +
            stEcuID +
            inttostr(ed_regDoorNo.Value));
end;

function TfmDoorAdmin.FormCheck: Boolean;
var
 nCardReader : integer;
 i : integer;
begin
  result := False;
  if cmb_regDeviceCode.ItemIndex < 1 then
  begin
    showmessage('���� �ݵ�� ���� �ϼž� �մϴ�.');
    cmb_regDeviceCode.SetFocus;
    Exit;
  end;
  if ed_regDoorNo.Value > DOORCOUNT then
  begin
    showmessage('���� ��⿡���� ���Թ��� ' + inttostr(DOORCOUNT) + '�� ������ ���� �˴ϴ�.');
    ed_regDoorNo.SetFocus;
    Exit;
  end;
  if ed_regDoorName.Text = '' then
  begin
    showmessage('�ν� �� �� �ִ� ���Թ� ��Ī�� ���� �Ͽ� �ּ���.');
    ed_regDoorName.SetFocus;
    Exit;
  end;
  //if ed_regDoorSeq.Text = '' then ed_regDoorSeq.Text := '0';
  if ed_DoorControlTime.Value < 3 then
  begin
    if MessageDlg('���Թ� ����ð��� 3�� ������ ��� ���Թ��� ������ ���� �� �ֽ��ϴ�. ��� �Ͻðڽ��ϱ�?', mtConfirmation, [mbYes, mbNo],0) <> mrYes then
    begin
      ed_DoorControlTime.SetFocus;
      Exit;
    end;
  end;
  nCardReader := 0;
  for i := 0 to CARDREADERCOUNT - 1 do
  begin
    if Group_CardReaderNo.ItemChecked[i] = true then inc(nCardReader);
  end;
{  if nCardReader = 0 then
  begin
    showmessage('ī�帮���� �Ѱ� �̻� ��� �� �ּž� �մϴ�.');
    Exit;
  end;  }
  result := True;
end;

function TfmDoorAdmin.DupCheckCardReaderDoor(aNodeNo,aEcuID,aReaderNo,aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_READER ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND DO_DOORNO <> ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND RE_USE = ''Y'' ';
  with ADOQuery do
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
  end;

  result := True;
end;

function TfmDoorAdmin.DupCheckCardReader(aNodeNo, aEcuID,
  aReaderNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_READER ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';
  with ADOQuery do
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
  end;

  result := True;
end;

function TfmDoorAdmin.InsertIntoTB_DOOR(aNodeNo, aEcuID, aDoorNo,
  aDoorName, aDoorType, aScheduleUse, aDoorControlTime, aDoorSeq,
  aReaderType,aFire,aDoorMode,aSendAck,aBuildingCode,aFloorCode,
  aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,aCurY,aSoundIP,aSoundPort,aVolume:string):Boolean;
var
  stSql :string;
  stFdmsID : string;
begin
  stFdmsID := GetFdmsDoorID;

  stSql := 'Insert Into TB_DOOR( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + 'DO_DOORNONAME,';
  stSql := stSql + 'DO_DOORTYPE,';
  stSql := stSql + 'DO_SCHUSE,';
  stSql := stSql + 'DO_CONTROLTIME,';
  stSql := stSql + 'DO_VIEWSEQ,';
  stSql := stSql + 'DO_CARDREADERTYPE,';
  stSql := stSql + 'DO_MODE,';
  stSql := stSql + 'DO_FIRE,';
  stSql := stSql + 'SEND_ACK, ';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'DO_LOCATEUSE,';
  stSql := stSql + 'DO_TOTWIDTH,';
  stSql := stSql + 'DO_TOTHEIGHT,';
  stSql := stSql + 'DO_CURX,';
  stSql := stSql + 'DO_CURY,';
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'FDMS_RELAY,';
  stSql := stSql + 'DO_SOUNDIP,';
  stSql := stSql + 'DO_SOUNDPORT,';
  stSql := stSql + 'DO_SOUNDVOLUME)';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + inttostr(strtoint(aNodeNo)) + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aDoorName + ''',';
  stSql := stSql + '''' + aDoorType + ''',';
  stSql := stSql + '''' + aScheduleUse + ''',';
  stSql := stSql + aDoorControlTime + ',';
  stSql := stSql + aDoorSeq + ',';
  stSql := stSql + '''' + aReaderType + ''',';
  stSql := stSql + '''' + aDoorMode + ''',';
  stSql := stSql + '''' + aFire + ''',';
  stSql := stSql + '''' + aSendAck + ''',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aRegState + ''',';
  stSql := stSql + aTotWidth + ',';
  stSql := stSql + aTotHeight + ',';
  stSql := stSql + aCurX + ',';
  stSql := stSql + aCurY + ',';
  stSql := stSql + stFdmsID + ',';
  stSql := stSql + '''N'', ';
  stSql := stSql + '''' + aSoundIP + ''',';
  stSql := stSql + '''' + aSoundPort + ''', ';
  stSql := stSql + '''' + aVolume + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDoorAdmin.UpdateTB_DOOR(aNodeNo, aEcuID, aDoorNo, aDoorName,
  aDoorType, aScheduleUse, aDoorControlTime, aDoorSeq,aReaderType,
  aFire,aDoorMode,aSendAck,aBuildingCode,aFloorCode,
  aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,aCurY,aSoundIP,aSoundPort,aVolume:string):Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_DOOR set ';
  stSql := stSql + 'DO_DOORNONAME = ''' + aDoorName + ''',';
  stSql := stSql + 'DO_DOORTYPE = ''' + aDoorType + ''',';
  stSql := stSql + 'DO_SCHUSE = ''' + aScheduleUse + ''',';
  stSql := stSql + 'DO_CONTROLTIME = ' + aDoorControlTime + ',';
  stSql := stSql + 'DO_VIEWSEQ = ' + aDoorSeq + ',';
  stSql := stSql + 'DO_CARDREADERTYPE = ''' + aReaderType + ''',';
  stSql := stSql + 'DO_MODE = ''' + aDoorMode + ''',';
  stSql := stSql + 'DO_FIRE = ''' + aFire + ''',';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''', ';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'DO_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'DO_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'DO_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'DO_CURX = ' + aCurX + ',';
  stSql := stSql + 'DO_CURY = ' + aCurY + ',';
  stSql := stSql + 'FDMS_RELAY = ''N'', ';
  stSql := stSql + 'DO_SOUNDIP = ''' + aSoundIP + ''',';
  stSql := stSql + 'DO_SOUNDPORT = ''' + aSoundPort + ''', ';
  stSql := stSql + 'DO_SOUNDVOLUME = ''' + aVolume + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDoorAdmin.DeleteTB_Reader(aNodeNo, aEcuID,
  aReaderNo,aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_READER ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDoorAdmin.InsertTB_Reader(aNodeNo, aEcuID, aReaderNo, aDoorNo,
  aSendAck,aUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_READER(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'RE_READERNO,';
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + 'SEND_ACK,';
  stSql := stSql + 'RE_USE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + inttostr(strtoint(aNodeNo)) + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aReaderNo + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aSendAck + ''',';
  stSql := stSql + '''' + aUse + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDoorAdmin.UpdateTB_Reader(aNodeNo, aEcuID, aReaderNo, aDoorNo,
  aSendAck,aUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_READER set ';
  stSql := stSql + 'DO_DOORNO = ''' + aDoorNo + ''',';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''', ';
  stSql := stSql + 'RE_USE = ''' + aUse + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDoorAdmin.btn_DeleteClick(Sender: TObject);
var
  stDeviceID : string;
  stNodeNo : string;
  stEcuID : string;
  i : integer;
begin
  if (Application.MessageBox(PChar('�����͸� �����Ͻðڽ��ϱ�?'),'����',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  stNodeNo := copy(stDeviceID,1,3);
  stEcuID := copy(stDeviceID,4,2);
  for i := 1 to CARDREADERCOUNT do
  begin
    DeleteTB_READER(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value));
  end;

  DeleteTB_DOOR(stNodeNo,stEcuID,inttostr(ed_regDoorNo.Value));
  DoorSeach('',sg_Door.TopRow);
end;

function TfmDoorAdmin.DeleteTB_DOOR(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Delete from TB_DOOR ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDoorAdmin.CardReaderTypeCheck(aNodeNo, aEcuID,
  aReaderType: string; var aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := false;
  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stsql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_CARDREADERTYPE <> ''' + aReaderType + ''' ';
  stSql := stSql + ' AND DO_DOORNO <> ''' + aDoorNo + ''' ';

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
    aDoorNo := FindField('DO_DOORNO').AsString;
  end;
  result := True;
end;

function TfmDoorAdmin.UpdateTB_DOORReaderType(aNodeNo, aEcuID,
  aReaderType,aSendAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DOOR set ';
  stSql := stSql + 'DO_CARDREADERTYPE = ''' + aReaderType + ''', ';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDoorAdmin.cmb_DeviceCodeChange(Sender: TObject);
begin
//  cmb_regDeviceCode.Text := cmb_regDeviceCode.Items.Strings[cmb_regDeviceCode.ItemIndex];
  DoorSeach('');
  cmb_regDeviceCode.ItemIndex := cmb_DeviceCode.ItemIndex;

end;

procedure TfmDoorAdmin.DoorSeach(aDoorID:string;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
  stDeviceName : string;
begin
  GridInit;
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select b.AC_DEVICENAME,b.AC_MCUIP,a.AC_NODENO,';
  stSql := stSql + ' a.AC_ECUID,a.DO_DOORNONAME,a.DO_DOORNO,';
  stSql := stSql + ' a.DO_DOORTYPE,a.DO_SCHUSE,a.DO_CONTROLTIME,';
  stSql := stSql + ' a.DO_VIEWSEQ,a.DO_CARDREADERTYPE,a.DO_FIRE,a.DO_MODE, ';
  stSql := stSql + ' a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.DO_LOCATEUSE, ';
  stSql := stSql + ' a.DO_TOTWIDTH,a.DO_TOTHEIGHT,a.DO_CURX,a.DO_CURY,c.KD_DOORNO, ';
  stSql := stSql + ' a.DO_SOUNDIP,a.DO_SOUNDPORT,a.DO_SOUNDVOLUME ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' Left Join TB_KTBIZMEKADOOR c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  ';
  stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO ) ';
  stSql := stSql + ' INNER Join (select * from TB_ACCESSDEVICE where AC_ACTYPE = ''1'' ) b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if cmb_DeviceCode.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(DeviceIDList.Strings[cmb_DeviceCode.ItemIndex],1,3)));
    stSql := stSql + ' AND a.AC_ECUID = ''' + copy(DeviceIDList.Strings[cmb_DeviceCode.ItemIndex],4,2) + ''' ';
    stSql := stSql + ' Order by a.DO_DOORNO ';
  end else
    stSql := stSql + ' Order by a.DO_VIEWSEQ';

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
    if RecordCount < 1 then exit;
    nRow := 1;
    sg_Door.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      if FindField('AC_DEVICENAME').AsString = '' then stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_MCUIP').AsString
      else stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_DEVICENAME').AsString;
      with sg_Door do
      begin
        Cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
        Cells[1,nRow] := stDeviceName;
        Cells[2,nRow] := FindField('DO_DOORNO').AsString;
        if FindField('DO_FIRE').AsString = '1' then Cells[3,nRow] := '���'
        else Cells[3,nRow] := '����';
        Cells[4,nRow] := FindField('DO_FIRE').AsString;
        Cells[5,nRow] := FindField('DO_MODE').AsString;
        Cells[6,nRow] := FindField('DO_DOORTYPE').AsString;
        Cells[7,nRow] := FindField('DO_SCHUSE').AsString;
        Cells[8,nRow] := FindField('DO_CONTROLTIME').AsString;
        Cells[9,nRow] := FindField('DO_VIEWSEQ').AsString;
        Cells[10,nRow] := FindField('AC_NODENO').AsString;
        Cells[11,nRow] := FindField('AC_ECUID').AsString;
        Cells[12,nRow] := FindField('DO_CARDREADERTYPE').AsString;
        cells[13,nRow] := FindField('LO_DONGCODE').AsString;
        cells[14,nRow] := FindField('LO_FLOORCODE').AsString;
        cells[15,nRow] := FindField('LO_AREACODE').AsString;
        cells[16,nRow] := FindField('DO_LOCATEUSE').AsString;
        cells[17,nRow] := FindField('DO_TOTWIDTH').AsString;
        cells[18,nRow] := FindField('DO_TOTHEIGHT').AsString;
        cells[19,nRow] := FindField('DO_CURX').AsString;
        cells[20,nRow] := FindField('DO_CURY').AsString;
        cells[21,nRow] := FindField('KD_DOORNO').AsString;
        cells[22,nRow] := FindField('DO_SOUNDIP').AsString;
        cells[23,nRow] := FindField('DO_SOUNDPORT').AsString;
        cells[24,nRow] := FindField('DO_SOUNDVOLUME').AsString;

        if aDoorID = (FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +
                      FindField('AC_ECUID').AsString +
                      FindField('DO_DOORNO').AsString) then
        begin
          SelectRows(nRow,1);
        end;
      end;
      Next;
      inc(nRow);
    end;
  end;
  sg_DoorClick(sg_Door);
  if aTop <> 0 then
    sg_Door.topRow := aTop
  else
  begin
    if sg_Door.row > 17 then sg_Door.TopRow := sg_Door.row - 16;
  end;

end;

procedure TfmDoorAdmin.sg_DoorClick(Sender: TObject);
var
  stECUID : string;
  stNODENO : string;
  stDoorNo : string;
  nReaderType : integer;
  stBuildingCode,stFloorCode : string;
begin
  with sg_Door do
  begin
    if Cells[0,Row] = '' then Exit;
    FormClear;
    stNodeNo := FillZeronumber(strtoint(Cells[10,Row]),3);
    stEcuID := Cells[11,Row];
    cmb_regDeviceCode.ItemIndex := DeviceIDList.IndexOf(stNodeNo + stEcuid);
    stDoorNo := Cells[2,Row];
    ed_regDoorNo.Value := strtoint(stDoorNo);
    ed_regDoorName.Text := Cells[0,Row];
    if Not IsDigit(Cells[9,Row]) then Cells[9,Row] := '0';
    ed_regDoorSeq.value := strtoint(Cells[9,Row]);
    if Not IsDigit(Cells[12,Row]) then Cells[12,Row] := '0';
    nReaderType := strtoint(Cells[12,Row]);
    cmb_CardReaderType.ItemIndex := nReaderType;
    if Not IsDigit(Cells[6,Row]) then Cells[6,Row] := '0';
    cmb_regDoorType.ItemIndex := LockTypeList.IndexOf(Cells[6,Row]);
    if Not IsDigit(Cells[8,Row]) then Cells[8,Row] := '3';
    ed_DoorControlTime.Value := strtoint(Cells[8,Row]);
    if Not IsDigit(Cells[7,Row]) then Cells[7,Row] := '0';
    rg_ScheduleUse.ItemIndex := strtoint(Cells[7,Row]);
    if Not IsDigit(Cells[4,Row]) then Cells[4,Row] := '0';
    cmb_Fire.ItemIndex := strtoint(Cells[4,Row]);
    if Not IsDigit(Cells[5,Row]) then Cells[5,Row] := '0';
    cmb_DoorMode.ItemIndex := strtoint(Cells[5,Row]);

    LoadsBuildingCode(cmb_sBuildingCode);
    if (cells[13,Row] = '') or (cells[13,Row] = '000') then cmb_sBuildingCode.ItemIndex := 0
    else cmb_sBuildingCode.ItemIndex := sBuildingCodeList.IndexOf(cells[13,Row]);
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];

    LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
    if (cells[14,Row] = '') or (cells[14,Row] = '000') then cmb_sFloorCode.ItemIndex := 0
    else cmb_sFloorCode.ItemIndex := sFloorCodeList.IndexOf(cells[14,Row]);
    stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];

    LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);;
    if (cells[15,Row] = '') or (cells[15,Row] = '000') then cmb_sAreaCode.ItemIndex := 0
    else cmb_sAreaCode.ItemIndex := sAreaCodeList.IndexOf(cells[15,Row]);

    if cells[16,Row] = 'Y' then chk_DoorReg.Checked := True
    else chk_DoorReg.Checked := False;
    ed_TotWidth.Text := cells[17,Row];
    ed_TotHeight.Text := cells[18,Row];
    ed_CurX.Text := cells[19,Row];
    ed_CurY.Text := cells[20,Row];
    ed_BizMekaCode.Text := cells[21,Row];
    ed_SoundIP.Text := cells[22,Row];
    ed_SoundPort.Text := cells[23,Row];
    ed_Volume.Text := cells[24,Row];

    SetCardReader(stNodeNo,stEcuID,stDoorNo);

  end;
  btn_Update.Enabled := True;
  btn_Delete.Enabled := True;
end;

procedure TfmDoorAdmin.SetCardReader(aNodeNo, aEcuID, aDoorNo: string);
var
  stSql :string;
begin
  stSql := 'select * from TB_READER ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND RE_USE = ''Y'' ';
  with AdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text:= stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    While Not Eof do
    begin
      Group_CardReaderNo.ItemChecked[strtoint(FindField('RE_READERNO').AsString) - 1] := True;
      Next;
    end;
  end;
end;

function TfmDoorAdmin.DupCheckTB_DOOR(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
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
    if RecordCount < 1 then Exit;
    result := True;
  end;
end;

procedure TfmDoorAdmin.btn_CancelClick(Sender: TObject);
var
  stEcuID : string;
begin
  stEcuID := '';
  if cmb_regDeviceCode.itemIndex > -1 then stEcuID := DeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  DoorSeach( stEcuID +
            inttostr(ed_regDoorNo.Value),L_nTopRow);

end;

function TfmDoorAdmin.UpdateTB_DoorReader(aNodeNo, aEcuID, aReaderNo,
  aDoorNo, aSendAck, aUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_READER set ';
  stSql := stSql + 'DO_DOORNO = ''' + aDoorNo + ''', ';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''', ';
  stSql := stSql + 'RE_USE = ''' + aUse + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDoorAdmin.GetDoorSeq: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select Max(DO_VIEWSEQ) as DO_VIEWSEQ from TB_DOOR ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

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
    if FindField('DO_VIEWSEQ').IsNull then result := 1
    else result := FindField('DO_VIEWSEQ').AsInteger + 1;
  end;

end;

function TfmDoorAdmin.GetDoorNumber(aNodeNo, aEcuID: string): integer;
var
  stSql : string;
  stDoorNo : string;
begin
  result := 1;
  stSql := 'select Max(DO_DOORNO) as DO_DOORNO from TB_DOOR ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';

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
    if Trim(FindField('DO_DOORNO').AsString) = '' then result := 1
    else
    begin
      stDoorNo := FindField('DO_DOORNO').AsString;
      result := strtoint(stDoorNo) + 1;
    end;
  end;

end;

procedure TfmDoorAdmin.cmb_regDeviceCodeChange(Sender: TObject);
var
 nDoorNo : integer;
 stDeviceID : string;
 i : integer;
begin
  nDoorNo := 1;
  if cmb_regDeviceCode.ItemIndex > 0 then
  begin
    stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.ItemIndex];
    nDoorNo := GetDoorNumber(copy(stDeviceID,1,3),Copy(stDeviceID,4,2));
    if ( nDoorNo < 0) or (nDoorNo > DOORCOUNT) then
    begin
      showmessage('�ش� ����� ���Թ� ������ �ʰ� �Ǿ����ϴ�.');
      Exit;
    end;
  end;
  ed_regDoorNo.Value := nDoorNo;
  for i:= 1 to CARDREADERCOUNT do
  begin
    Group_CardReaderNo.ItemChecked[I-1]:= False;
  end;
  Group_CardReaderNo.ItemChecked[nDoorNo - 1] := True;
end;

procedure TfmDoorAdmin.LoadsAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sAreaCodeList.Clear;

  cmb_Box.Items.Add('');
  sAreaCodeList.Add('000');
  cmb_Box.ItemIndex := 0;
  if (aBuildingCode = '') or (aBuildingCode = '000')  then  Exit;
  if (aFloorCode = '') or (aFloorCode = '000')  then Exit;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
  stSql := stsql + ' order by LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        sAreaCodeList.Add(FindField('LO_AREACODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorAdmin.LoadsBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sBuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';
  
  cmb_Box.Items.Add('');
  sBuildingCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        sBuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorAdmin.LoadsFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sFloorCodeList.Clear;

  cmb_Box.Items.Add('');
  sFloorCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  if (aBuildingCode = '') or (aBuildingCode = '000')  then Exit;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        sFloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorAdmin.cmb_sBuildingCodeChange(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_sBuildingCode.itemindex < 0 then
  begin
    cmb_sBuildingCode.Text := '';
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
  LoadsAreaCode(stBuildingCode,'000',cmb_sAreaCode);
end;

procedure TfmDoorAdmin.cmb_sFloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  if cmb_sBuildingCode.itemindex < 0 then
  begin
    cmb_sBuildingCode.Text := '';
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  if cmb_sFloorCode.itemindex < 0 then
  begin
    cmb_sFloorCode.Text := '';
    Exit;
  end;
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);

end;

procedure TfmDoorAdmin.btnDoorPositionClick(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_sBuildingCode.itemIndex < 0 then
  begin
    stBuildingCode := '';
  end else
  begin
    stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode.itemIndex];
  end;
  if cmb_sFloorCode.itemIndex < 0 then
  begin
    stFloorCode := '';
  end else
  begin
    stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode.itemIndex];
  end;
  if cmb_sAreaCode.itemIndex < 0 then
  begin
    stAreaCode := '';
  end else
  begin
    stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.itemIndex];
  end;

  fmPositionSet:= TfmPositionSet.Create(Self);
  fmPositionSet.FormName := 'fmDoorAdmin';
  fmPositionSet.DeviceType := '3';
  fmPositionSet.DeviceName := ed_regDoorName.Text;
  fmPositionSet.X_Position := ed_CurX.Text;
  fmPositionSet.Y_Position := ed_CurY.Text;
  fmPositionSet.X_Size := ed_TotWidth.Text;
  fmPositionSet.Y_Size := ed_TotHeight.Text;

  fmPositionSet.BuildingCode := stBuildingCode;
  fmPositionSet.FloorCode := stFloorCode;
  fmPositionSet.SectorCode := stAreaCode;
  fmPositionSet.SHowmodal;
  fmPositionSet.Free;
end;

procedure TfmDoorAdmin.FormShow(Sender: TObject);
begin
  DeviceLoad(cmb_DeviceCode,'Y');
  DeviceLoad(cmb_regDeviceCode,'N');
  LoadsBuildingCode(cmb_sBuildingCode);
  LockTypeSet;
  GridInit;
  FormClear;
  DoorSeach('');

  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;
end;

procedure TfmDoorAdmin.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    if IsInsertGrade then  btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    if IsInsertGrade then  btn_Insert.Enabled := True;
    if IsUpdateGrade then btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmDoorAdmin.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Door.Enabled := False;
    cmb_regDeviceCode.Enabled := True;
    ed_regDoorNo.Enabled := True;
    ed_regDoorName.Enabled := True;
    ed_regDoorSeq.Enabled := True;
    cmb_regDoorType.Enabled := True;
    cmb_CardReaderType.Enabled := True;
    ed_DoorControlTime.Enabled := True;
    rg_ScheduleUse.Enabled := True;
    Group_CardReaderNo.Enabled := True;
    cmb_Fire.Enabled := True;
    cmb_DoorMode.Enabled := True;
    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    btnDoorPosition.Enabled := True;
    ed_BizMekaCode.Enabled := True;
    ed_SoundIP.Enabled := True;
    ed_SoundPort.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Door.Enabled := True;
    cmb_regDeviceCode.Enabled := False;
    ed_regDoorNo.Enabled := False;
    ed_regDoorName.Enabled := False;
    ed_regDoorSeq.Enabled := False;
    cmb_regDoorType.Enabled := False;
    cmb_CardReaderType.Enabled := False;
    ed_DoorControlTime.Enabled := False;
    rg_ScheduleUse.Enabled := False;
    Group_CardReaderNo.Enabled := False;
    cmb_Fire.Enabled := False;
    cmb_DoorMode.Enabled := False;
    cmb_sBuildingCode.Enabled := False;
    cmb_sFloorCode.Enabled := False;
    cmb_sAreaCode.Enabled := False;
    btnDoorPosition.Enabled := False;
    ed_BizMekaCode.Enabled := False;
    ed_SoundIP.Enabled := False;
    ed_SoundPort.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Door.Enabled := True;
    cmb_regDeviceCode.Enabled := False;
    ed_regDoorNo.Enabled := False;
    ed_regDoorName.Enabled := False;
    ed_regDoorSeq.Enabled := False;
    cmb_regDoorType.Enabled := False;
    cmb_CardReaderType.Enabled := False;
    ed_DoorControlTime.Enabled := False;
    rg_ScheduleUse.Enabled := False;
    Group_CardReaderNo.Enabled := False;
    cmb_Fire.Enabled := False;
    cmb_DoorMode.Enabled := False;
    cmb_sBuildingCode.Enabled := False;
    cmb_sFloorCode.Enabled := False;
    cmb_sAreaCode.Enabled := False;
    btnDoorPosition.Enabled := False;
    ed_BizMekaCode.Enabled := False;
    ed_SoundIP.Enabled := False;
    ed_SoundPort.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Door.Enabled := False;
    cmb_regDeviceCode.Enabled := False;
    ed_regDoorNo.Enabled := False;
    ed_regDoorName.Enabled := True;
    ed_regDoorSeq.Enabled := True;
    cmb_regDoorType.Enabled := True;
    cmb_CardReaderType.Enabled := True;
    ed_DoorControlTime.Enabled := True;
    rg_ScheduleUse.Enabled := True;
    Group_CardReaderNo.Enabled := True;
    cmb_Fire.Enabled := True;
    cmb_DoorMode.Enabled := True;
    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    btnDoorPosition.Enabled := True;
    ed_BizMekaCode.Enabled := True;
    ed_SoundIP.Enabled := True;
    ed_SoundPort.Enabled := True;
  end;
end;

function TfmDoorAdmin.GetFdmsDoorID: string;
var
  stSql : string;
begin
  result := '1';
  stSql := 'select Max(FDMS_ID) as FDMS_ID from TB_DOOR ';
  with ADOfdmsQuery do
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
    if FindField('FDMS_ID').AsInteger = 0 then Exit;
    result := inttostr(FindField('FDMS_ID').AsInteger + 1);
  end;
end;

procedure TfmDoorAdmin.cmb_regDoorTypeChange(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;

end;

procedure TfmDoorAdmin.ed_DoorControlTimeChange(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;

end;

procedure TfmDoorAdmin.cmb_FireChange(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;

end;

procedure TfmDoorAdmin.cmb_DoorModeChange(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;

end;

procedure TfmDoorAdmin.rg_ScheduleUseClick(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;
end;

procedure TfmDoorAdmin.Group_CardReaderNoChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
begin
  chk_DoorUpdate.Checked := True;
end;

procedure TfmDoorAdmin.ed_regDoorNoChange(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;
end;

function TfmDoorAdmin.UpdateTB_DOORInfo(aNodeNo, aEcuID, aDoorNo,
  aDoorName, aDoorSeq, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY,aSoundIP,aSoundPort,aVolume: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_DOOR set ';
  stSql := stSql + 'DO_DOORNONAME = ''' + aDoorName + ''',';
  stSql := stSql + 'DO_VIEWSEQ = ' + aDoorSeq + ',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'DO_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'DO_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'DO_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'DO_CURX = ' + aCurX + ',';
  stSql := stSql + 'DO_CURY = ' + aCurY + ',';
  stSql := stSql + 'FDMS_RELAY = ''N'', ';
  stSql := stSql + 'DO_SOUNDIP = ''' + aSoundIP + ''',';
  stSql := stSql + 'DO_SOUNDPORT = ''' + aSoundPort + ''', ';
  stSql := stSql + 'DO_SOUNDVOLUME = ''' + aVolume + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDoorAdmin.cmb_sAreaCodeChange(Sender: TObject);
begin
  if cmb_sAreaCode.itemindex < 0 then
  begin
    cmb_sAreaCode.Text := '';
    Exit;
  end;
end;

function TfmDoorAdmin.DeleteTB_KTBIZMEKADOOR(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_KTBIZMEKADOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDoorAdmin.InsertIntoTB_KTBIZMEKADOOR(aNodeNo, aEcuID, aDoorNo,
  aBizMekacode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_KTBIZMEKADOOR (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID, ';
  stSql := stSql + ' DO_DOORNO, ';
  stSql := stSql + ' KD_DOORNO) ';
  stSql := stsql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stsql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aBizMekacode + ''')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDoorAdmin.UpdateTB_KTBIZMEKADOOR(aNodeNo, aEcuID, aDoorNo,
  aBizMekacode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_KTBIZMEKADOOR Set ';
  stSql := stSql + ' KD_DOORNO = ''' + aBizMekacode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

end.
