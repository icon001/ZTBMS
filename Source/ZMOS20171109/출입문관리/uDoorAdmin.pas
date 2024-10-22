unit uDoorAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls,
  Spin, RzPanel, RzRadGrp, DB, ADODB, uSubForm, CommandArray,ActiveX,Imm,
  AdvObj;

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
    btn_Cancel: TSpeedButton;
    ed_regDoorSeq: TSpinEdit;
    lb_sBuilding1: TLabel;
    cmb_sBuildingCode1: TComboBox;
    lb_sFloorCode1: TLabel;
    cmb_sFloorCode1: TComboBox;
    lb_sAreaCode1: TLabel;
    cmb_sAreaCode1: TComboBox;
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
    lb_FloorCode1: TLabel;
    lb_AreaCode1: TLabel;
    cmb_AreaCode1: TComboBox;
    Label8: TLabel;
    cmb_DoorGubun: TComboBox;
    rg_TimeCode: TRadioGroup;
    cmb_DoorMode: TComboBox;
    cmb_regDoorType: TComboBox;
    lb_SchIgnore: TLabel;
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
    procedure cmb_sBuildingCode1Change(Sender: TObject);
    procedure cmb_sFloorCode1Change(Sender: TObject);
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
    procedure cmb_sAreaCode1Change(Sender: TObject);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure ed_regDoorNameEnter(Sender: TObject);
    procedure rg_TimeCodeClick(Sender: TObject);
  private
    L_nTopRow : integer;
    L_bScheduleChange : Boolean;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure GridInit;
    procedure DeviceLoad(aBuildingCode,aFloorCode,aAreaCode:string;StringList:TStringList;cmb_Box:TComboBox;aType:string);
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

    procedure LoadDoorGubunCode(cmb_Box:TComboBox);

    procedure FormNameSet;
  public
    L_bDeviceUpdate : Boolean;
    L_bTimeCodeChange : Boolean;
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
                                 aDoorGubunCode,
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
                                 aDoorGubunCode,
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
                                 aDoorGubunCode,
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
  fmDoorAdmin: TfmDoorAdmin;
  DeviceIDList : TStringList;
  regDeviceIDList : TStringList;
  LockTypeList : TStringList;
  BuildingCodeList : TStringList;
  FloorCodeList : TStringList;
  AreaCodeList :TStringList;
  sBuildingCodeList : TStringList;
  sFloorCodeList : TStringList;
  sAreaCodeList :TStringList;
  sDoorGubunCodeList : TStringList;
  State : string;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uPositionSet, uDBFunction;
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
    for nCol := 3 to ColCount - 1 do
    begin
      ColWidths[nCol] := 0;
    end;
  end;
end;

procedure TfmDoorAdmin.FormCreate(Sender: TObject);
begin
  L_nTopRow := 1;

  BuildingCodeList := TStringList.Create ;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  sBuildingCodeList := TStringList.Create ;
  sFloorCodeList := TStringList.Create;
  sAreaCodeList := TStringList.Create;
  sDoorGubunCodeList := TStringList.Create;

  DeviceIDList := TStringList.Create;
  regDeviceIDList := TStringList.Create;
  LockTypeList := TStringList.Create;

  L_bScheduleChange := False;
end;

procedure TfmDoorAdmin.DeviceLoad(aBuildingCode,aFloorCode,aAreaCode:string;StringList:TStringList;cmb_Box: TComboBox; aType: string);
var
  stSql : string;
  stDeviceName : string;
  stDeviceID : string;
begin
  StringList.Clear;
  cmb_Box.Clear;
  StringList.Add('');
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
//  stSql := stSql + ' AND AC_ACTYPE = ''1'' ';  //식수구역도 조회
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' '
      else
        stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
  end;
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
      StringList.Add(stDeviceID);
      Next;
    end;
  end;

end;

procedure TfmDoorAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceIDList.Clear;
  regDeviceIDList.Clear;
  LockTypeList.Clear;
  sBuildingCodeList.Clear ;
  sFloorCodeList.Clear;
  sAreaCodeList.Clear;
  sDoorGubunCodeList.Clear;

  DeviceIDList.Free;
  regDeviceIDList.Free;
  LockTypeList.Free;
  BuildingCodeList.Free ;
  FloorCodeList.Free;
  AreaCodeList.Free;
  sBuildingCodeList.Free ;
  sFloorCodeList.Free;
  sAreaCodeList.Free;
  sDoorGubunCodeList.Free;
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
  cmb_DoorGubun.ItemIndex := -1;
  cmb_sBuildingCode1.ItemIndex := 0;
  cmb_sFloorCode1.Clear;
  cmb_sAreaCode1.Clear;
  ed_CurX.Text := '0';
  ed_CurY.Text:= '0';
  ed_TotWidth.Text:= '0';
  ed_TotHeight.Text:= '0';

end;

procedure TfmDoorAdmin.LockTypeSet;
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

procedure TfmDoorAdmin.btn_InsertClick(Sender: TObject);
var
  stDeviceID : string;
  nDoorNo : integer;
  i : integer;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
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
    stDeviceID := regDeviceIDList.Strings[cmb_regDeviceCode.ItemIndex];
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

  cmb_sBuildingCode1.Clear;
  cmb_sFloorCode1.Clear;
  cmb_sAreaCode1.Clear;
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  LoadsBuildingCode(cmb_sBuildingCode1);
  if cmb_BuildingCode1.ItemIndex > 0 then  cmb_sBuildingCode1.ItemIndex := cmb_BuildingCode1.ItemIndex;
  if cmb_sBuildingCode1.ItemIndex > 0 then
  begin
    stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode1.ItemIndex];
    LoadsFloorCode(stBuildingCode,cmb_sFloorCode1);
    if cmb_FloorCode1.ItemIndex > 0 then  cmb_sFloorCode1.ItemIndex := cmb_FloorCode1.ItemIndex;
    if cmb_sFloorCode1.ItemIndex > 0 then
    begin
      stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode1.ItemIndex];
      LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode1);
      if cmb_AreaCode1.ItemIndex > 0 then  cmb_sAreaCode1.ItemIndex := cmb_AreaCode1.ItemIndex;
      if cmb_sAreaCode1.ItemIndex > 0 then stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode1.ItemIndex];
    end;
  end;

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
  stDoorGubunCode : string;
begin
  if Not FormCheck then Exit;
  btn_Cancel.Enabled := False;
  stDeviceID := regDeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  stNodeNo := copy(stDeviceID,1,3);
  stEcuID := copy(stDeviceID,4,2);
  stReaderType := copy(cmb_CardReaderType.Text,1,1);
  stDoorNo := inttostr(ed_regDoorNo.Value);
  stDoorGubunCode := '000';
  if cmb_DoorGubun.ItemIndex > 0 then stDoorGubunCode := sDoorGubunCodeList.Strings[cmb_DoorGubun.ItemIndex];

  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_sBuildingCode1.itemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode1.itemIndex];
  if cmb_sFloorCode1.itemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode1.itemIndex];
  if cmb_sAreaCode1.itemIndex > 0 then  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode1.itemIndex];
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
                                 {LockTypeList.Strings[cmb_regDoorType.ItemIndex],

                                 inttostr(ed_DoorControlTime.Value),}
                                 inttostr(rg_ScheduleUse.ItemIndex),
                                 inttostr(ed_regDoorSeq.value),
                                 {stReaderType,
                                 inttostr(cmb_Fire.itemIndex),
                                 inttostr(cmb_DoorMode.ItemIndex),}
                                 'N',
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 stDoorGubunCode,
                                 inttostr(rg_TimeCode.ItemIndex)
                                  );
    UpdateTB_ACCESSDEVICE_DoorTimeAsync(stNodeNo,stEcuID,'N');
    L_bDeviceUpdate := True;
  end else
  begin
    if chk_DoorUpdate.Checked then
    begin
      bResult := UpdateTB_DOOR(stNodeNo,
                                 stEcuID,
                                 inttostr(ed_regDoorNo.Value),
                                 ed_regDoorName.Text,
                                 {LockTypeList.Strings[cmb_regDoorType.ItemIndex],

                                 inttostr(ed_DoorControlTime.Value),}
                                 inttostr(rg_ScheduleUse.ItemIndex),
                                 inttostr(ed_regDoorSeq.Value),
                                 {stReaderType,
                                 inttostr(cmb_Fire.itemIndex),
                                 inttostr(cmb_DoorMode.ItemIndex),}
                                 'N',
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 stDoorGubunCode,
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
                                 stDoorGubunCode,
                                 inttostr(rg_TimeCode.ItemIndex)
                                  );
    end;
  end;
  if Not bResult then
  begin
    showmessage('출입문 데이터 저장에 실패 했습니다.');
    btn_Save.Enabled := True;
    Exit;
  end;
  if L_bTimeCodeChange then UpdateTB_ACCESSDEVICE_DoorTimeAsync(stNodeNo,stEcuID,'N');
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

function TfmDoorAdmin.FormCheck: Boolean;
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
  end;}
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
  aDoorName, {aDoorType,  aDoorControlTime,}aScheduleUse, aDoorSeq,
  {aReaderType,aFire,aDoorMode,}aSendAck,aBuildingCode,aFloorCode,
  aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,aCurY,aDoorGubunCode,aTimeCodeUse:string):Boolean;
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
  if L_bScheduleChange then stSql := stSql + 'SEND_ACK, ';
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
  stSql := stSql + 'DO_GUBUN,';
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
  //stSql := stSql + aDoorControlTime + ',';
  stSql := stSql + aDoorSeq + ',';
  //stSql := stSql + '''' + aReaderType + ''',';
  //stSql := stSql + '''' + aDoorMode + ''',';
  //stSql := stSql + '''' + aFire + ''',';
  if L_bScheduleChange then stSql := stSql + '''' + aSendAck + ''',';
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
  stSql := stSql + '''' + aDoorGubunCode + ''', ';
  stSql := stSql + '''Y'', ';
  stSql := stSql + '''' + aTimeCodeUse + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDoorAdmin.UpdateTB_DOOR(aNodeNo, aEcuID, aDoorNo, aDoorName,
  {aDoorType, aDoorControlTime,}aScheduleUse, aDoorSeq,{aReaderType,
  aFire,aDoorMode,}aSendAck,aBuildingCode,aFloorCode,
  aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,aCurY,aDoorGubunCode,aTimeCodeUse:string):Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_DOOR set ';
  stSql := stSql + 'DO_DOORNONAME = ''' + aDoorName + ''',';
  //stSql := stSql + 'DO_DOORTYPE = ''' + aDoorType + ''',';
  stSql := stSql + 'DO_SCHUSE = ''' + aScheduleUse + ''',';
  //stSql := stSql + 'DO_CONTROLTIME = ' + aDoorControlTime + ',';
  stSql := stSql + 'DO_VIEWSEQ = ' + aDoorSeq + ',';
  //stSql := stSql + 'DO_CARDREADERTYPE = ''' + aReaderType + ''',';
  //stSql := stSql + 'DO_MODE = ''' + aDoorMode + ''',';
  //stSql := stSql + 'DO_FIRE = ''' + aFire + ''',';
  if L_bScheduleChange then stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''', ';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'DO_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'DO_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'DO_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'DO_CURX = ' + aCurX + ',';
  stSql := stSql + 'DO_CURY = ' + aCurY + ',';
  stSql := stSql + 'FDMS_RELAY = ''N'', ';
  stSql := stSql + 'DO_GUBUN = ''' + aDoorGubunCode + ''', ';
  stSql := stSql + 'DO_UPDATE = ''Y'', ';
  stSql := stSql + 'DO_TIMECODEUSE = ''' + aTimeCodeUse + ''' ';
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
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  stDeviceID := regDeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
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
  cmb_regDeviceCode.ItemIndex := cmb_DeviceCode.ItemIndex;

end;

procedure TfmDoorAdmin.DoorSeach(aBuildingCode,aFloorCode,aAreaCode,aDoorID:string;aTop :integer = 0);
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
  stSql := stSql + ' ,a.DO_SchIgnore ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' INNER Join TB_ACCESSDEVICE b ';       //식수구역도 모두 조회
//  stSql := stSql + ' INNER Join (select * from TB_ACCESSDEVICE where AC_ACTYPE = ''1'' ) b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' '
      else
        stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else
    begin
      if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
  end else
  begin
    if cmb_DeviceCode.ItemIndex = 0 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
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
        cells[23,nRow] := FindField('DO_SchIgnore').AsString;


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
  nIndex : integer;
begin
  with sg_Door do
  begin
    if Cells[0,Row] = '' then Exit;
    FormClear;
    stNodeNo := FillZeronumber(strtoint(Cells[10,Row]),3);
    stEcuID := Cells[11,Row];
    cmb_regDeviceCode.ItemIndex := regDeviceIDList.IndexOf(stNodeNo + stEcuid);
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

    LoadsBuildingCode(cmb_sBuildingCode1);
    if (cells[13,Row] = '') or (cells[13,Row] = '000') then cmb_sBuildingCode1.ItemIndex := 0
    else cmb_sBuildingCode1.ItemIndex := sBuildingCodeList.IndexOf(cells[13,Row]);
    if cmb_sBuildingCode1.itemindex > -1 then
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode1.itemindex ];

    LoadsFloorCode(stBuildingCode,cmb_sFloorCode1);
    if (cells[14,Row] = '') or (cells[14,Row] = '000') then cmb_sFloorCode1.ItemIndex := 0
    else cmb_sFloorCode1.ItemIndex := sFloorCodeList.IndexOf(cells[14,Row]);
    if cmb_sFloorCode1.itemindex > -1 then
    stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode1.itemindex ];

    LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode1);;
    if (cells[15,Row] = '') or (cells[15,Row] = '000') then cmb_sAreaCode1.ItemIndex := 0
    else cmb_sAreaCode1.ItemIndex := sAreaCodeList.IndexOf(cells[15,Row]);

    if cells[16,Row] = 'Y' then chk_DoorReg.Checked := True
    else chk_DoorReg.Checked := False;
    ed_TotWidth.Text := cells[17,Row];
    ed_TotHeight.Text := cells[18,Row];
    ed_CurX.Text := cells[19,Row];
    ed_CurY.Text := cells[20,Row];
    if isDigit(cells[22,Row]) then rg_TimeCode.ItemIndex := strtoint(cells[22,Row])
    else rg_TimeCode.ItemIndex := 0;

    if cells[23,Row] = 'Y' then lb_SchIgnore.Caption := '스케줄무시중'
    else lb_SchIgnore.Caption := '';


    rg_TimeCode.visible := dmDBFunction.UseDeviceTimeCode(stNodeNo,stEcuID);

    nIndex := sDoorGubunCodeList.IndexOf(cells[21,Row]);
    if nIndex > -1 then cmb_DoorGubun.ItemIndex := nIndex;

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
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stEcuID := '';
  if cmb_regDeviceCode.itemIndex > -1 then stEcuID := regDeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode1.ItemIndex > 0 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];;
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            stEcuID + inttostr(ed_regDoorNo.Value),L_nTopRow);

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
    stDeviceID := regDeviceIDList.Strings[cmb_regDeviceCode.ItemIndex];
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

procedure TfmDoorAdmin.LoadsAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sAreaCodeList.Clear;

  cmb_Box.Items.Add('');
  sAreaCodeList.Add('');
  cmb_Box.ItemIndex := 0;


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

  if Not IsMaster then
  begin
    if BuildingGrade > 2 then
    begin
      stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_AREACODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

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
      if Not IsMaster then
      begin
        if BuildingGrade > 2 then
        begin
          if sAreaCodeList.IndexOf(MasterAreaCode) > 0 then
          begin
            cmb_Box.ItemIndex := sAreaCodeList.IndexOf(MasterAreaCode);
            cmb_Box.Enabled := False;
          end;
        end
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

  cmb_Box.Items.Add('');
  sBuildingCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  if Not IsMaster then
  begin
    if BuildingGrade <> 0 then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_DONGCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;
  

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
      if Not IsMaster then
      begin
        if BuildingGrade <> 0 then
        begin
          if sBuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
          begin
            cmb_Box.ItemIndex := sBuildingCodeList.IndexOf(MasterBuildingCode);
            cmb_Box.Enabled := False;
          end;
        end
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

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if Not IsMaster then
  begin
    if BuildingGrade > 1 then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_FLOORCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

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
      if Not IsMaster then
      begin
        if BuildingGrade > 1 then
        begin
          if sFloorCodeList.IndexOf(MasterFloorCode) > 0 then
          begin
            cmb_Box.ItemIndex := sFloorCodeList.IndexOf(MasterFloorCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorAdmin.cmb_sBuildingCode1Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_sBuildingCode1.itemindex < 0 then
  begin
    cmb_sBuildingCode1.Text := '';
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode1.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode1);
  LoadsAreaCode(stBuildingCode,'000',cmb_sAreaCode1);
end;

procedure TfmDoorAdmin.cmb_sFloorCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  if cmb_sBuildingCode1.itemindex < 0 then
  begin
    cmb_sBuildingCode1.Text := '';
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode1.itemindex ];
  if cmb_sFloorCode1.itemindex < 0 then
  begin
    cmb_sFloorCode1.Text := '';
    Exit;
  end;
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode1.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode1);

end;

procedure TfmDoorAdmin.btnDoorPositionClick(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_sBuildingCode1.itemIndex < 0 then
  begin
    stBuildingCode := '';
  end else
  begin
    stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode1.itemIndex];
  end;
  if cmb_sFloorCode1.itemIndex < 0 then
  begin
    stFloorCode := '';
  end else
  begin
    stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode1.itemIndex];
  end;
  if cmb_sAreaCode1.itemIndex < 0 then
  begin
    stAreaCode := '';
  end else
  begin
    stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode1.itemIndex];
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

  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;
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
  LoadsBuildingCode(cmb_sBuildingCode1);
  ed_regDoorNo.MaxValue := DOORCOUNT;
  DeviceLoad(stBuildingCode,stFloorCode,stAreaCode,DeviceIDList,cmb_DeviceCode,'Y');
  DeviceLoad('000','000','000',regDeviceIDList,cmb_regDeviceCode,'N');
  LockTypeSet;
  GridInit;
  FormClear;
  FormNameSet;
  LoadDoorGubunCode(cmb_DoorGubun);
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,'');
  L_bDeviceUpdate := False;
  L_bTimeCodeChange := False;
  rg_TimeCode.Visible := G_bTimeCodeUse;
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
    cmb_DoorGubun.Enabled := True;
    cmb_DoorMode.Enabled := True;
    cmb_sBuildingCode1.Enabled := True;
    cmb_sFloorCode1.Enabled := True;
    cmb_sAreaCode1.Enabled := True;
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
    ed_DoorControlTime.Enabled := False;
    rg_ScheduleUse.Enabled := False;
    Group_CardReaderNo.Enabled := False;
    cmb_Fire.Enabled := False;
    cmb_DoorGubun.Enabled := False;
    cmb_DoorMode.Enabled := False;
    cmb_sBuildingCode1.Enabled := False;
    cmb_sFloorCode1.Enabled := False;
    cmb_sAreaCode1.Enabled := False;
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
    ed_DoorControlTime.Enabled := False;
    rg_ScheduleUse.Enabled := False;
    Group_CardReaderNo.Enabled := False;
    cmb_Fire.Enabled := False;
    cmb_DoorGubun.Enabled := False;
    cmb_DoorMode.Enabled := False;
    cmb_sBuildingCode1.Enabled := False;
    cmb_sFloorCode1.Enabled := False;
    cmb_sAreaCode1.Enabled := False;
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
    ed_DoorControlTime.Enabled := True;
    rg_ScheduleUse.Enabled := True;
    Group_CardReaderNo.Enabled := True;
    cmb_Fire.Enabled := True;
    cmb_DoorGubun.Enabled := True;
    cmb_DoorMode.Enabled := True;
    cmb_sBuildingCode1.Enabled := True;
    cmb_sFloorCode1.Enabled := True;
    cmb_sAreaCode1.Enabled := True;
    btnDoorPosition.Enabled := True;
    rg_TimeCode.Enabled := True;
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
  L_bScheduleChange := True;
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
  aDoorName, aScheduleUse,aDoorSeq, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY,aDoorGubunCode,aTimeCodeUse: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_DOOR set ';
  stSql := stSql + 'DO_DOORNONAME = ''' + aDoorName + ''',';
  stSql := stSql + 'DO_SCHUSE = ''' + aScheduleUse + ''',';
  stSql := stSql + 'DO_VIEWSEQ = ' + aDoorSeq + ',';
  if L_bScheduleChange then stSql := stSql + 'SEND_ACK = ''N'', ';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'DO_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'DO_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'DO_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'DO_CURX = ' + aCurX + ',';
  stSql := stSql + 'DO_CURY = ' + aCurY + ',';
  stSql := stSql + 'FDMS_RELAY = ''N'', ';
  stSql := stSql + 'DO_GUBUN = ''' + aDoorGubunCode + ''', ';
  stSql := stSql + 'DO_UPDATE = ''Y'', ';
  stSql := stSql + 'DO_TIMECODEUSE = ''' + aTimeCodeUse + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDoorAdmin.cmb_sAreaCode1Change(Sender: TObject);
begin
  if cmb_sAreaCode1.itemindex < 0 then
  begin
    cmb_sAreaCode1.Text := '';
    Exit;
  end;
end;

procedure TfmDoorAdmin.LoadBuildingCode(cmb_Box: TComboBox);
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
  if Not IsMaster then
  begin
    if BuildingGrade <> 0 then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_DONGCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;
  

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
      if Not IsMaster then
      begin
        if BuildingGrade <> 0 then
        begin
          if BuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
          begin
            cmb_Box.ItemIndex := BuildingCodeList.IndexOf(MasterBuildingCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorAdmin.LoadFloorCode(aBuildingCode: string;
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

  if Not IsMaster then
  begin
    if BuildingGrade > 1 then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_FLOORCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;
  

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
      if Not IsMaster then
      begin
        if BuildingGrade > 1 then
        begin
          if FloorCodeList.IndexOf(MasterFloorCode) > 0 then
          begin
            cmb_Box.ItemIndex := FloorCodeList.IndexOf(MasterFloorCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorAdmin.LoadAreaCode(aBuildingCode, aFloorCode: string;
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

  if Not IsMaster then
  begin
    if BuildingGrade > 2 then
    begin
      stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_AREACODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

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
      if Not IsMaster then
      begin
        if BuildingGrade > 2 then
        begin
          if AreaCodeList.IndexOf(MasterAreaCode) > 0 then
          begin
            cmb_Box.ItemIndex := AreaCodeList.IndexOf(MasterAreaCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorAdmin.cmb_BuildingCode1Change(Sender: TObject);
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
  DeviceLoad(stBuildingCode,stFloorCode,stAreaCode,DeviceIDList,cmb_DeviceCode,'Y');
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);

end;

procedure TfmDoorAdmin.cmb_FloorCode1Change(Sender: TObject);
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
  DeviceLoad(stBuildingCode,stFloorCode,'',DeviceIDList,cmb_DeviceCode,'Y');
//  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];;
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);

end;

procedure TfmDoorAdmin.cmb_AreaCode1Change(Sender: TObject);
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
  DeviceLoad(stBuildingCode,stFloorCode,stAreaCode,DeviceIDList,cmb_DeviceCode,'Y');
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);

end;

procedure TfmDoorAdmin.FormNameSet;
begin
  lb_Building1.Caption := FM901;
  lb_sBuilding1.Caption := FM901;
  lb_FloorCode1.Caption := FM911;
  lb_sFloorCode1.Caption := FM911;
  lb_AreaCode1.Caption := FM921;
  lb_sAreaCode1.Caption := FM921;

end;

procedure TfmDoorAdmin.LoadDoorGubunCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sAreaCodeList.Clear;

  cmb_Box.Items.Add('');
  sDoorGubunCodeList.Add('');
  cmb_Box.ItemIndex := 0;


  stSql := 'select * from TB_DOORGUBUN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stsql + ' order by DG_CODE ';

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
        cmb_Box.Items.Add(FindField('DG_NAME').AsString );
        sDoorGubunCodeList.Add(FindField('DG_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorAdmin.ed_regDoorNameEnter(Sender: TObject);
var
  TIMC: HIMC;
  dwSentence : DWORD; dwConversion : DWORD;
begin
  TIMC := ImmGetContext(TEdit(Sender).Handle);
  ImmGetConversionStatus(TIMC, dwConversion, dwSentence);
  ImmSetConversionStatus(TIMC, IME_CMODE_NATIVE, dwSentence);
  ImmReleaseContext(TEdit(Sender).Handle, TIMC);

end;

function TfmDoorAdmin.UpdateTB_ACCESSDEVICE_DoorTimeAsync(aNodeNo, aEcuID,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE set TC_TIMECODEASYNC = ''' + aValue + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmDoorAdmin.rg_TimeCodeClick(Sender: TObject);
begin
  inherited;
  L_bTimeCodeChange := True;

end;

end.
