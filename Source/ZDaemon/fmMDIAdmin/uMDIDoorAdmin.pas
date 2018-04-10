unit uMDIDoorAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls,
  Spin, RzPanel, RzRadGrp, DB, ADODB, uSubForm, CommandArray,ActiveX,Imm,
  AdvObj;

type
  TfmMDIDoorAdmin = class(TfmASubForm)
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
    lb_Building1: TLabel;
    cmb_BuildingCode1: TComboBox;
    cmb_FloorCode1: TComboBox;
    cmb_AreaCode1: TComboBox;
    lb_AreaCode1: TLabel;
    lb_FloorCode1: TLabel;
    rg_TimeCode: TRadioGroup;
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
    procedure ed_regDoorNameEnter(Sender: TObject);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure rg_TimeCodeClick(Sender: TObject);
  private
    L_nTopRow : integer;
    L_bScheduleChange : Boolean;
    L_bTimeCodeChange : Boolean;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure GridInit;
    procedure DeviceLoad(aList:TStringList;aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box: TComboBox; aType: string);
    procedure LockTypeSet;
    function FormCheck : Boolean;
    function DupCheckCardReaderDoor(aNodeNo,aEcuID,aReaderNo,aDoorNo:string):Boolean;
    function DupCheckCardReader(aNodeNo,aEcuID,aReaderNo:string):Boolean;
    function CardReaderTypeCheck(aNodeNo,aEcuID,aReaderType:string; var aDoorNo:string):Boolean;
    procedure DoorSeach(aBuildingCode,aFloorCode,aAreaCode,aDoorID:string;aTop :integer = 0);
    procedure SetCardReader(aNodeNo,aEcuID,aDoorNo:string);
    function GetDoorSeq:integer;
    function GetDoorNumber(aNodeNo,aEcuID:string):integer;
    function GetFdmsDoorID:string;

    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);

  public
    { Public declarations }
    function InsertIntoTB_DOOR(aNodeNo,
                                 aEcuID,
                                 aDoorNo,
                                 aDoorName,
                                 {aDoorType,
                                 aDoorControlTime,}
                                 aScheduleUse,
                                 aDoorSeq,
                                 {aReaderType,
                                 aFire,
                                 aDoorMode,}
                                 aSendAck,
                                 aBuildingCode,
                                 aFloorCode,
                                 aAreaCode,
                                 aRegState,
                                 aTotWidth,
                                 aTotHeight,
                                 aCurX,
                                 aCurY,
                                 aTimeCodeUse:string):Boolean;
    function DupCheckTB_DOOR(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    function UpdateTB_DOOR(aNodeNo,
                                 aEcuID,
                                 aDoorNo,
                                 aDoorName,
                                 {aDoorType,

                                 aDoorControlTime,}
                                 aScheduleUse,
                                 aDoorSeq,
                                 {aReaderType,
                                 aFire,
                                 aDoorMode,}
                                 aSendAck,
                                 aBuildingCode,
                                 aFloorCode,
                                 aAreaCode,
                                 aRegState,
                                 aTotWidth,
                                 aTotHeight,
                                 aCurX,
                                 aCurY,
                                 aTimeCodeUse:string):Boolean;
    function UpdateTB_DOORInfo(aNodeNo,
                                 aEcuID,
                                 aDoorNo,
                                 aDoorName,
                                 aScheduleUse,
                                 aDoorSeq,
                                 aBuildingCode,
                                 aFloorCode,
                                 aAreaCode,
                                 aRegState,
                                 aTotWidth,
                                 aTotHeight,
                                 aCurX,
                                 aCurY,
                                 aTimeCodeUse:string):Boolean;
    function InsertTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function UpdateTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function UpdateTB_DoorReader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function DeleteTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo:string):Boolean;
    function DeleteTB_DOOR(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    function UpdateTB_DOORReaderType(aNodeNo,aEcuID,aReaderType,aSendAck:string):Boolean;
    function UpdateTB_ACCESSDEVICE_DoorTimeAsync(aNodeNo,aEcuID,aValue:string):Boolean;
  end;

var
  fmMDIDoorAdmin: TfmMDIDoorAdmin;
  DeviceIDList : TStringList;
  LockTypeList : TStringList;
  BuildingCodeList : TStringList;
  FloorCodeList : TStringList;
  AreaCodeList :TStringList;
  sDeviceIDList : TStringList;
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

procedure TfmMDIDoorAdmin.btn_CloseClick(Sender: TObject);
begin
  close;
end;

procedure TfmMDIDoorAdmin.GridInit;
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
    for nCol := 3 to ColCount - 1 do
    begin
      ColWidths[nCol] := 0;
    end;
  end;
end;

procedure TfmMDIDoorAdmin.FormCreate(Sender: TObject);
begin
  L_nTopRow := 1;

  BuildingCodeList := TStringList.Create ;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  sBuildingCodeList := TStringList.Create ;
  sFloorCodeList := TStringList.Create;
  sAreaCodeList := TStringList.Create;

  DeviceIDList := TStringList.Create;
  sDeviceIDList := TStringList.Create;
  LockTypeList := TStringList.Create;
end;

procedure TfmMDIDoorAdmin.DeviceLoad(aList:TStringList;aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box: TComboBox; aType: string);
var
  stSql : string;
  stDeviceName : string;
  stDeviceID : string;
begin
  aList.Clear;
  cmb_Box.Clear;
  aList.Add('');
  if aType = 'Y' then
  begin
    cmb_Box.Items.Add('전체');
  end else
  begin
    cmb_Box.Items.Add('');
  end;
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
  stSql := stSql + ' AND AC_ACTYPE = ''1'' ';

  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';

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
      stDeviceID := FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString;
      aList.Add(stDeviceID);
      Next;
    end;
  end;


end;

procedure TfmMDIDoorAdmin.FormClose(Sender: TObject;
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

  self.FindSubForm('Main').FindCommand('RESTART').Execute;

  Action := caFree;
end;

procedure TfmMDIDoorAdmin.FormClear;
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

end;

procedure TfmMDIDoorAdmin.LockTypeSet;
begin
  LockTypeList.Clear;
  cmb_regDoorType.Clear;
  with cmb_regDoorType do
  begin
    Items.Add('일반형(정전시 열림)');
    Items.Add('데드볼트(정전시 열림)');
    Items.Add('일반형(정전시 잠김)');
    Items.Add('데드볼트(정전시 잠김)');
    Items.Add('자동문/주차');
  end;
  LockTypeList.Add('1');
  LockTypeList.Add('3');
  LockTypeList.Add('0');
  LockTypeList.Add('2');
  LockTypeList.Add('6');
end;

procedure TfmMDIDoorAdmin.btn_InsertClick(Sender: TObject);
var
  stDeviceID : string;
  nDoorNo : integer;
  i : integer;
  stSelectDeviceCode : string;
  stBuildingCode : string;
  stFloorCode : string;
begin
  L_nTopRow := sg_Door.TopRow;
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSelectDeviceCode := DeviceIDList.Strings[cmb_DeviceCode.ItemIndex];
  cmb_regDeviceCode.ItemIndex := sDeviceIDList.IndexOf(stSelectDeviceCode);
//  if cmb_DeviceCode.ItemIndex > 0 then  cmb_regDeviceCode.ItemIndex := cmb_DeviceCode.ItemIndex;

  nDoorNo := 1;
  if cmb_regDeviceCode.ItemIndex > 0 then
  begin
    stDeviceID := sDeviceIDList.Strings[cmb_regDeviceCode.ItemIndex];
    nDoorNo := GetDoorNumber(copy(stDeviceID,1,3),Copy(stDeviceID,4,2));
    if ( nDoorNo < 0) or (nDoorNo > DOORCOUNT) then
    begin
      showmessage('해당 기기의 출입문 갯수가 초과 되었습니다.');
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

  cmb_sBuildingCode.ItemIndex := cmb_BuildingCode1.ItemIndex;
  if cmb_sBuildingCode.ItemIndex > 0 then
  begin
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
    LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
    cmb_sFloorCode.ItemIndex := cmb_FloorCode1.ItemIndex;
    if cmb_sFloorCode.ItemIndex > 0 then
    begin
      stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
      LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);
      cmb_sAreaCode.ItemIndex := cmb_AreaCode1.ItemIndex;
    end;
  end;

  cmb_regDeviceCode.SetFocus;
end;

procedure TfmMDIDoorAdmin.btn_UpdateClick(Sender: TObject);
begin
  chk_DoorUpdate.Checked := False;
  
  L_nTopRow := sg_Door.TopRow;
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

  ed_regDoorName.SetFocus;
end;

procedure TfmMDIDoorAdmin.btn_SaveClick(Sender: TObject);
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
begin
  if Not FormCheck then Exit;
  btn_Cancel.Enabled := False;
  stDeviceID := sDeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  stNodeNo := copy(stDeviceID,1,3);
  stEcuID := copy(stDeviceID,4,2);
  stReaderType := copy(cmb_CardReaderType.Text,1,1);
  stDoorNo := inttostr(ed_regDoorNo.Value);

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
    if MessageDlg(stDoorNo + '번 출입문의 카드리더 타입이 틀립니다.' + #13 +
                  stDoorNo + '번 출입문의 카드리더 타입을 현재 타입으로 변경하시겠습니까?', mtConfirmation, [mbYes, mbNo],0) <> mrYes then
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
        if MessageDlg(inttostr(i) + '번 리더기가 이미 사용 중입니다.' + #13 +
                      inttostr(i) + '번 리더기를 현재 출입문 제어에 사용 하시겠습니까?', mtConfirmation, [mbYes, mbNo],0) <> mrYes then
        begin
          Exit;
        end;
      end;
    end;
  end;

  if rg_TimeCode.ItemIndex < 0 then rg_TimeCode.ItemIndex := 0;

  if Uppercase(State) = 'INSERT' then
  begin
    if DupCheckTB_DOOR(stNodeNo,stEcuID,inttostr(ed_regDoorNo.Value)) then
    begin
      showmessage('중복된 문번호 입니다.');
      btn_Save.Enabled := True;
      Exit;
    end;
    bResult := InsertIntoTB_DOOR(stNodeNo,
                                 stEcuID,
                                 inttostr(ed_regDoorNo.Value),
                                 ed_regDoorName.Text,
                                 //LockTypeList.Strings[cmb_regDoorType.ItemIndex],
                                 //
                                 //inttostr(ed_DoorControlTime.Value),
                                 inttostr(rg_ScheduleUse.ItemIndex),
                                 inttostr(ed_regDoorSeq.value),
                                 //stReaderType,
                                 //inttostr(cmb_Fire.itemIndex),
                                 //inttostr(cmb_DoorMode.ItemIndex),
                                 'N',
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 inttostr(rg_TimeCode.ItemIndex)
                                  );
    UpdateTB_ACCESSDEVICE_DoorTimeAsync(stNodeNo,stEcuID,'N');
  end else
  begin
    if chk_DoorUpdate.Checked then
    begin
      bResult := UpdateTB_DOOR(stNodeNo,
                                 stEcuID,
                                 inttostr(ed_regDoorNo.Value),
                                 ed_regDoorName.Text,
                                 //LockTypeList.Strings[cmb_regDoorType.ItemIndex],
                                 //
                                 //inttostr(ed_DoorControlTime.Value),
                                 inttostr(rg_ScheduleUse.ItemIndex),
                                 inttostr(ed_regDoorSeq.Value), 
                                 //stReaderType,
                                 //inttostr(cmb_Fire.itemIndex),
                                 //inttostr(cmb_DoorMode.ItemIndex),
                                 'N',
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 inttostr(rg_TimeCode.ItemIndex)
                                  );
    end else
    begin
      bResult := UpdateTB_DOORInfo(stNodeNo,
                                 stEcuID,
                                 inttostr(ed_regDoorNo.Value),
                                 ed_regDoorName.Text,
                                 inttostr(rg_ScheduleUse.ItemIndex),
                                 inttostr(ed_regDoorSeq.Value),
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 inttostr(rg_TimeCode.ItemIndex)
                                  );
    end;
    if L_bTimeCodeChange then UpdateTB_ACCESSDEVICE_DoorTimeAsync(stNodeNo,stEcuID,'N');
  end;
  if Not bResult then
  begin
    showmessage('출입문 데이터 저장에 실패 했습니다.');
    btn_Save.Enabled := True;
    Exit;
  end;
  DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,DOORTYPE,inttostr(ed_regDoorNo.Value),'0000000000' , '출입문정보변경') ;
  
  if (Uppercase(State) = 'INSERT') or (chk_DoorUpdate.Checked) then
  begin
    for i := 1 to CARDREADERCOUNT do
    begin
      if Group_CardReaderNo.ItemChecked[i-1] then //카드리더 번호 체크 되어 있으면
      begin
        if DupCheckCardReader(stNodeNo,stEcuID,inttostr(i)) then
        begin
          UpdateTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value),'N','Y');
        end else
        begin
          InsertTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value),'N','Y');
        end;
      end else      //카드리더 번호 체크 되어 있지 않으면
      begin
        if Not DupCheckCardReaderDoor(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value)) then //사용하는 문이 없으면
        begin
          UpdateTB_DoorReader(stNodeNo,stEcuID,inttostr(i),'0','N','N');
        end;
        //DeleteTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value));
      end;
    end;
  end;
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode1.ItemIndex > 0 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];;

  if Uppercase(State) = 'UPDATE' then
    DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            FillZeroNumber(strtoint(stNodeNo),3) +
            stEcuID +
            inttostr(ed_regDoorNo.Value),sg_Door.topRow)
  else
    DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            FillZeroNumber(strtoint(stNodeNo),3) +
            stEcuID +
            inttostr(ed_regDoorNo.Value));

end;

function TfmMDIDoorAdmin.FormCheck: Boolean;
var
 nCardReader : integer;
 i : integer;
begin
  result := False;
  if cmb_regDeviceCode.ItemIndex < 1 then
  begin
    showmessage('기기는 반드시 선택 하셔야 합니다.');
    cmb_regDeviceCode.SetFocus;
    Exit;
  end;
  if ed_regDoorNo.Value > DOORCOUNT then
  begin
    showmessage('현재 기기에서는 출입문을 ' + inttostr(DOORCOUNT) + '개 까지만 지원 됩니다.');
    ed_regDoorNo.SetFocus;
    Exit;
  end;
  if ed_regDoorName.Text = '' then
  begin
    showmessage('인식 할 수 있는 출입문 명칭을 기재 하여 주세요.');
    ed_regDoorName.SetFocus;
    Exit;
  end;
  //if ed_regDoorSeq.Text = '' then ed_regDoorSeq.Text := '0';
  if ed_DoorControlTime.Value < 3 then
  begin
    if MessageDlg('출입문 제어시간이 3초 이하인 경우 출입문이 열리지 않을 수 있습니다. 계속 하시겠습니까?', mtConfirmation, [mbYes, mbNo],0) <> mrYes then
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
    showmessage('카드리더를 한개 이상 등록 해 주셔야 합니다.');
    Exit;
  end;  }
  result := True;
end;

function TfmMDIDoorAdmin.DupCheckCardReaderDoor(aNodeNo,aEcuID,aReaderNo,aDoorNo: string): Boolean;
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

function TfmMDIDoorAdmin.DupCheckCardReader(aNodeNo, aEcuID,
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

function TfmMDIDoorAdmin.InsertIntoTB_DOOR(aNodeNo, aEcuID, aDoorNo,
  aDoorName, {aDoorType, aDoorControlTime,} aScheduleUse, aDoorSeq,
  {aReaderType,aFire,aDoorMode,}aSendAck,aBuildingCode,aFloorCode,
  aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,aCurY,aTimeCodeUse:string):Boolean;
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
  //stSql := stSql + 'DO_DOORTYPE,';
  stSql := stSql + 'DO_SCHUSE,';
  //stSql := stSql + 'DO_CONTROLTIME,';
  stSql := stSql + 'DO_VIEWSEQ,';
  //stSql := stSql + 'DO_CARDREADERTYPE,';
  //stSql := stSql + 'DO_MODE,';
  //stSql := stSql + 'DO_FIRE,';
  if L_bScheduleChange then  stSql := stSql + 'SEND_ACK, ';
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
  stSql := stSql + 'DO_UPDATE,';
  stSql := stSql + 'DO_TIMECODEUSE)';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + inttostr(strtoint(aNodeNo)) + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aDoorName + ''',';
  //stSql := stSql + '''' + aDoorType + ''',';
  stSql := stSql + '''' + aScheduleUse + ''',';
  //stSql := stSql + '''' + aDoorControlTime + ''',';
  stSql := stSql + aDoorSeq + ',';
  //stSql := stSql + '''' + aReaderType + ''',';
  //stSql := stSql + '''' + aDoorMode + ''',';
  //stSql := stSql + '''' + aFire + ''',';
  if L_bScheduleChange then  stSql := stSql + '''' + aSendAck + ''',';
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
  stSql := stSql + '''Y'',';
  stSql := stSql + '''' + aTimeCodeUse + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMDIDoorAdmin.UpdateTB_DOOR(aNodeNo, aEcuID, aDoorNo, aDoorName,
  {aDoorType,  aDoorControlTime,}aScheduleUse, aDoorSeq,{aReaderType,
  aFire,aDoorMode,}aSendAck,aBuildingCode,aFloorCode,
  aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,aCurY,aTimeCodeUse:string):Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_DOOR set ';
  stSql := stSql + 'DO_DOORNONAME = ''' + aDoorName + ''',';
  //stSql := stSql + 'DO_DOORTYPE = ''' + aDoorType + ''',';
  stSql := stSql + 'DO_SCHUSE = ''' + aScheduleUse + ''',';
  //stSql := stSql + 'DO_CONTROLTIME = ''' + aDoorControlTime + ''',';
  stSql := stSql + 'DO_VIEWSEQ = ' + aDoorSeq + ',';
 // stSql := stSql + 'DO_CARDREADERTYPE = ''' + aReaderType + ''',';
 // stSql := stSql + 'DO_MODE = ''' + aDoorMode + ''',';
 // stSql := stSql + 'DO_FIRE = ''' + aFire + ''',';
  if L_bScheduleChange then  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''', ';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'DO_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'DO_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'DO_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'DO_CURX = ' + aCurX + ',';
  stSql := stSql + 'DO_CURY = ' + aCurY + ',';
  stSql := stSql + 'FDMS_RELAY = ''N'', ';
  stSql := stSql + 'DO_UPDATE = ''Y'', ';
  stSql := stSql + 'DO_TIMECODEUSE = ''' + aTimeCodeUse + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMDIDoorAdmin.DeleteTB_Reader(aNodeNo, aEcuID,
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

function TfmMDIDoorAdmin.InsertTB_Reader(aNodeNo, aEcuID, aReaderNo, aDoorNo,
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

function TfmMDIDoorAdmin.UpdateTB_Reader(aNodeNo, aEcuID, aReaderNo, aDoorNo,
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

procedure TfmMDIDoorAdmin.btn_DeleteClick(Sender: TObject);
var
  stDeviceID : string;
  stNodeNo : string;
  stEcuID : string;
  i : integer;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  stDeviceID := sDeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  stNodeNo := copy(stDeviceID,1,3);
  stEcuID := copy(stDeviceID,4,2);
  for i := 1 to CARDREADERCOUNT do
  begin
    DeleteTB_READER(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value));
  end;

  DeleteTB_DOOR(stNodeNo,stEcuID,inttostr(ed_regDoorNo.Value));
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode1.ItemIndex > 0 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];;
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);
end;

function TfmMDIDoorAdmin.DeleteTB_DOOR(aNodeNo, aEcuID,
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

function TfmMDIDoorAdmin.CardReaderTypeCheck(aNodeNo, aEcuID,
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

function TfmMDIDoorAdmin.UpdateTB_DOORReaderType(aNodeNo, aEcuID,
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

procedure TfmMDIDoorAdmin.cmb_DeviceCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
//  cmb_regDeviceCode.Text := cmb_regDeviceCode.Items.Strings[cmb_regDeviceCode.ItemIndex];
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode1.ItemIndex > 0 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];;
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,'');
  //cmb_regDeviceCode.ItemIndex := cmb_DeviceCode.ItemIndex;

end;

procedure TfmMDIDoorAdmin.DoorSeach(aBuildingCode,aFloorCode,aAreaCode,aDoorID:string;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
  stDeviceName : string;
begin
  L_bScheduleChange := False;
  L_bTimeCodeChange := False;
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
  stSql := stSql + ' a.DO_TOTWIDTH,a.DO_TOTHEIGHT,a.DO_CURX,a.DO_CURY,a.DO_GUBUN,a.DO_TIMECODEUSE ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' INNER Join (select * from TB_ACCESSDEVICE where AC_ACTYPE = ''1'' ) b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if cmb_DeviceCode.ItemIndex = 0 then
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  end;
  if cmb_DeviceCode.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(DeviceIDList.Strings[cmb_DeviceCode.ItemIndex],1,3)));
    stSql := stSql + ' AND a.AC_ECUID = ''' + copy(DeviceIDList.Strings[cmb_DeviceCode.ItemIndex],4,2) + ''' ';
    //stSql := stSql + ' Order by a.DO_DOORNO ';
  end ;
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO';

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
        if FindField('DO_FIRE').AsString = '1' then Cells[3,nRow] := '사용'
        else Cells[3,nRow] := '안함';
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
        cells[21,nRow] := FindField('DO_GUBUN').AsString;
        cells[22,nRow] := FindField('DO_TIMECODEUSE').AsString;

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

procedure TfmMDIDoorAdmin.sg_DoorClick(Sender: TObject);
var
  stECUID : string;
  stNODENO : string;
  stDoorNo : string;
  nReaderType : integer;
  stBuildingCode,stFloorCode : string;
  nDoorNo : integer;
  nIndex : integer;
begin
  with sg_Door do
  begin
    if Cells[0,Row] = '' then Exit;
    FormClear;
    stNodeNo := FillZeronumber(strtoint(Cells[10,Row]),3);
    stEcuID := Cells[11,Row];
    nIndex := sDeviceIDList.IndexOf(stNodeNo + stEcuid);

    cmb_regDeviceCode.ItemIndex := nIndex;
    stDoorNo := Cells[2,Row];
    nDoorNo := strtoint(stDoorNo);
    ed_regDoorNo.Value := nDoorNo;
    ed_regDoorName.Text := Cells[0,Row];
    if Not IsDigit(Cells[9,Row]) then Cells[9,Row] := '0';
    ed_regDoorSeq.value := strtoint(Cells[9,Row]);
    if Not IsDigit(Cells[12,Row]) then Cells[12,Row] := '0';
    nReaderType := strtoint(Cells[12,Row]);
    cmb_CardReaderType.ItemIndex := nReaderType;
    if Not IsDigit(Cells[6,Row]) then Cells[6,Row] := '0';
    cmb_regDoorType.ItemIndex := LockTypeList.IndexOf(Cells[6,Row]);
    if Not IsDigit(Cells[8,Row]) then Cells[8,Row] := '3';
    //ed_DoorControlTime.Value := strtoint(Cells[8,Row]);
    if Not IsDigit(Cells[7,Row]) then Cells[7,Row] := '0';
    rg_ScheduleUse.ItemIndex := strtoint(Cells[7,Row]);
    if Not IsDigit(Cells[4,Row]) then Cells[4,Row] := '0';
    cmb_Fire.ItemIndex := strtoint(Cells[4,Row]);
    if Not IsDigit(Cells[5,Row]) then Cells[5,Row] := '0';
    cmb_DoorMode.ItemIndex := strtoint(Cells[5,Row]);

    LoadsBuildingCode(cmb_sBuildingCode);
    if (cells[13,Row] = '') or (cells[13,Row] = '000') then cmb_sBuildingCode.ItemIndex := 0
    else cmb_sBuildingCode.ItemIndex := sBuildingCodeList.IndexOf(cells[13,Row]);
    if cmb_sBuildingCode.itemindex > -1 then
      stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];

    LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
    if (cells[14,Row] = '') or (cells[14,Row] = '000') then cmb_sFloorCode.ItemIndex := 0
    else cmb_sFloorCode.ItemIndex := sFloorCodeList.IndexOf(cells[14,Row]);
    if cmb_sFloorCode.itemindex > -1 then
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
    if isDigit(cells[22,Row]) then rg_TimeCode.ItemIndex := strtoint(cells[22,Row])
    else rg_TimeCode.ItemIndex := 0;

    SetCardReader(stNodeNo,stEcuID,stDoorNo);

  end;
  btn_Update.Enabled := True;
  btn_Delete.Enabled := True;
end;

procedure TfmMDIDoorAdmin.SetCardReader(aNodeNo, aEcuID, aDoorNo: string);
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

function TfmMDIDoorAdmin.DupCheckTB_DOOR(aNodeNo, aEcuID,
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

procedure TfmMDIDoorAdmin.btn_CancelClick(Sender: TObject);
var
  stEcuID : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stEcuID := '';
  if cmb_regDeviceCode.itemIndex > -1 then stEcuID := sDeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode1.ItemIndex > 0 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];;
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            stEcuID + inttostr(ed_regDoorNo.Value),L_nTopRow);

end;

function TfmMDIDoorAdmin.UpdateTB_DoorReader(aNodeNo, aEcuID, aReaderNo,
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

function TfmMDIDoorAdmin.GetDoorSeq: integer;
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

function TfmMDIDoorAdmin.GetDoorNumber(aNodeNo, aEcuID: string): integer;
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

procedure TfmMDIDoorAdmin.cmb_regDeviceCodeChange(Sender: TObject);
var
 nDoorNo : integer;
 stDeviceID : string;
 i : integer;
begin
  nDoorNo := 1;
  if cmb_regDeviceCode.ItemIndex > 0 then
  begin
    stDeviceID := sDeviceIDList.Strings[cmb_regDeviceCode.ItemIndex];
    nDoorNo := GetDoorNumber(copy(stDeviceID,1,3),Copy(stDeviceID,4,2));
    if ( nDoorNo < 0) or (nDoorNo > DOORCOUNT) then
    begin
      showmessage('해당 기기의 출입문 갯수가 초과 되었습니다.');
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

procedure TfmMDIDoorAdmin.LoadsAreaCode(aBuildingCode, aFloorCode: string;
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

procedure TfmMDIDoorAdmin.LoadsBuildingCode(cmb_Box: TComboBox);
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

procedure TfmMDIDoorAdmin.LoadsFloorCode(aBuildingCode: string;
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

procedure TfmMDIDoorAdmin.cmb_sBuildingCodeChange(Sender: TObject);
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

procedure TfmMDIDoorAdmin.cmb_sFloorCodeChange(Sender: TObject);
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

procedure TfmMDIDoorAdmin.btnDoorPositionClick(Sender: TObject);
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
  fmPositionSet.FormName := 'fmMDIDoorAdmin';
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
  if fmPositionSet.L_bSave then chk_DoorReg.Checked := True;
  ed_CurX.Text := inttostr(fmPositionSet.L_nImageLeft);
  ed_CurY.Text := inttostr(fmPositionSet.L_nImageTop);
  ed_TotWidth.Text := inttostr(fmPositionSet.L_nImageWidth);
  ed_TotHeight.Text := inttostr(fmPositionSet.L_nImageHeight);
  fmPositionSet.Free;
end;

procedure TfmMDIDoorAdmin.FormShow(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  stBuildingCode := '000';
  stFloorCode    := '000';
  stAreaCode     := '000';
  stNodeNo       := '000';

  LoadBuildingCode(cmb_BuildingCode1);
  if cmb_BuildingCode1.ItemIndex > 0 then
  begin
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex];
    LoadFloorCode(stBuildingCode,cmb_FloorCode1);
    if cmb_FloorCode1.ItemIndex > 0 then
    begin
      stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.ItemIndex];
      LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
      if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.ItemIndex];
    end;
  end;

  ed_regDoorNo.MaxValue := DOORCOUNT;
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_DeviceCode,'Y');
  DeviceLoad(sDeviceIDList,'000','000','000',cmb_regDeviceCode,'N');
  LoadsBuildingCode(cmb_sBuildingCode);
  LockTypeSet;
  GridInit;
  FormClear;
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);

  L_bScheduleChange := False;
  L_bTimeCodeChange := False;
end;

procedure TfmMDIDoorAdmin.ButtonEnable(aState: string);
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
    btn_Insert.Enabled := True;
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
    btn_Insert.Enabled := True;
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmMDIDoorAdmin.FormEnable(aState: string);
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
    //ed_DoorControlTime.Enabled := True;
    rg_ScheduleUse.Enabled := True;
    Group_CardReaderNo.Enabled := True;
    cmb_Fire.Enabled := True;
    cmb_DoorMode.Enabled := True;
    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    btnDoorPosition.Enabled := True;
    rg_TimeCode.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Door.Enabled := True;
    cmb_regDeviceCode.Enabled := False;
    ed_regDoorNo.Enabled := False;
    ed_regDoorName.Enabled := False;
    ed_regDoorSeq.Enabled := False;
    cmb_regDoorType.Enabled := False;
    cmb_CardReaderType.Enabled := False;
    //ed_DoorControlTime.Enabled := False;
    rg_ScheduleUse.Enabled := False;
    Group_CardReaderNo.Enabled := False;
    cmb_Fire.Enabled := False;
    cmb_DoorMode.Enabled := False;
    cmb_sBuildingCode.Enabled := False;
    cmb_sFloorCode.Enabled := False;
    cmb_sAreaCode.Enabled := False;
    btnDoorPosition.Enabled := False;
    rg_TimeCode.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Door.Enabled := True;
    cmb_regDeviceCode.Enabled := False;
    ed_regDoorNo.Enabled := False;
    ed_regDoorName.Enabled := False;
    ed_regDoorSeq.Enabled := False;
    cmb_regDoorType.Enabled := False;
    cmb_CardReaderType.Enabled := False;
    //ed_DoorControlTime.Enabled := False;
    rg_ScheduleUse.Enabled := False;
    Group_CardReaderNo.Enabled := False;
    cmb_Fire.Enabled := False;
    cmb_DoorMode.Enabled := False;
    cmb_sBuildingCode.Enabled := False;
    cmb_sFloorCode.Enabled := False;
    cmb_sAreaCode.Enabled := False;
    btnDoorPosition.Enabled := False;
    rg_TimeCode.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Door.Enabled := False;
    cmb_regDeviceCode.Enabled := False;
    ed_regDoorNo.Enabled := False;
    ed_regDoorName.Enabled := True;
    ed_regDoorSeq.Enabled := True;
    cmb_regDoorType.Enabled := True;
    cmb_CardReaderType.Enabled := True;
    //ed_DoorControlTime.Enabled := True;
    rg_ScheduleUse.Enabled := True;
    Group_CardReaderNo.Enabled := True;
    cmb_Fire.Enabled := True;
    cmb_DoorMode.Enabled := True;
    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    btnDoorPosition.Enabled := True;
    rg_TimeCode.Enabled := True;
  end;
end;

function TfmMDIDoorAdmin.GetFdmsDoorID: string;
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

procedure TfmMDIDoorAdmin.cmb_regDoorTypeChange(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;

end;

procedure TfmMDIDoorAdmin.ed_DoorControlTimeChange(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;

end;

procedure TfmMDIDoorAdmin.cmb_FireChange(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;

end;

procedure TfmMDIDoorAdmin.cmb_DoorModeChange(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;

end;

procedure TfmMDIDoorAdmin.rg_ScheduleUseClick(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;
  L_bScheduleChange := True;
end;

procedure TfmMDIDoorAdmin.Group_CardReaderNoChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
begin
  chk_DoorUpdate.Checked := True;
end;

procedure TfmMDIDoorAdmin.ed_regDoorNoChange(Sender: TObject);
begin
  chk_DoorUpdate.Checked := True;
end;

function TfmMDIDoorAdmin.UpdateTB_DOORInfo(aNodeNo, aEcuID, aDoorNo,
  aDoorName,aScheduleUse, aDoorSeq, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY,aTimeCodeUse: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_DOOR set ';
  stSql := stSql + 'DO_DOORNONAME = ''' + aDoorName + ''',';
  stSql := stSql + 'DO_SCHUSE = ''' + aScheduleUse + ''',';
  stSql := stSql + 'DO_VIEWSEQ = ' + aDoorSeq + ',';
  if L_bScheduleChange then  stSql := stSql + 'SEND_ACK = ''N'', ';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'DO_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'DO_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'DO_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'DO_CURX = ' + aCurX + ',';
  stSql := stSql + 'DO_CURY = ' + aCurY + ',';
  stSql := stSql + 'FDMS_RELAY = ''N'', ';
  stSql := stSql + 'DO_UPDATE = ''Y'', ';
  stSql := stSql + 'DO_TIMECODEUSE = ''' + aTimeCodeUse + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMDIDoorAdmin.cmb_sAreaCodeChange(Sender: TObject);
begin
  if cmb_sAreaCode.itemindex < 0 then
  begin
    cmb_sAreaCode.Text := '';
    Exit;
  end;
end;

procedure TfmMDIDoorAdmin.ed_regDoorNameEnter(Sender: TObject);
var
  TIMC: HIMC;
  dwSentence : DWORD; dwConversion : DWORD;
begin
  TIMC := ImmGetContext(TEdit(Sender).Handle);
  ImmGetConversionStatus(TIMC, dwConversion, dwSentence);
  ImmSetConversionStatus(TIMC, IME_CMODE_NATIVE, dwSentence);
  ImmReleaseContext(TEdit(Sender).Handle, TIMC);
end;

procedure TfmMDIDoorAdmin.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  cmb_Box.Clear;
  cmb_Box.Enabled := True;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';

  cmb_Box.Items.Add('전체');
  BuildingCodeList.Add('');
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
        BuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDoorAdmin.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery:TADOQuery;
begin
  cmb_Box.Clear;
  FloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';
  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE';

  cmb_Box.Items.Add('전체');
  FloorCodeList.Add('');
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
        FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDoorAdmin.LoadAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  AreaCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if (aFloorCode <> '') And (aFloorCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
  end else Exit;
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE ';

  cmb_Box.Items.Add('전체');
  AreaCodeList.Add('');
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
        AreaCodeList.Add(FindField('LO_AREACODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDoorAdmin.cmb_BuildingCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';

  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode1);
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];;
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_DeviceCode,'Y');
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);

end;

procedure TfmMDIDoorAdmin.cmb_FloorCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  if cmb_AreaCode1.itemindex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemindex];
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,'',cmb_DeviceCode,'Y');
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);
end;

procedure TfmMDIDoorAdmin.cmb_AreaCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex < 0 then Exit;
  stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_DeviceCode,'Y');
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);
end;

procedure TfmMDIDoorAdmin.Panel1Resize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := Panel1.Width;
  nBlock := (nWidth - 200) div 6; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 100 + nLeft;
  btn_Update.Left := 100 + nBlock + nLeft;
  btn_Save.Left := 100 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 100 + (nBlock * 3) + nLeft;
  btn_Cancel.Left := 100 + (nBlock * 4) + nLeft;
  btn_Close.Left := 100 + (nBlock * 5) + nLeft;

end;

procedure TfmMDIDoorAdmin.rg_TimeCodeClick(Sender: TObject);
begin
  inherited;
  L_bTimeCodeChange := True;
end;

function TfmMDIDoorAdmin.UpdateTB_ACCESSDEVICE_DoorTimeAsync(aNodeNo,
  aEcuID,aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE set TC_TIMECODEASYNC = ''' + aValue + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

initialization
  RegisterClass(TfmMDIDoorAdmin);
Finalization
  UnRegisterClass(TfmMDIDoorAdmin);

end.
