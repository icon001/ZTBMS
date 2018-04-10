unit uDoorAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls,
  Spin, RzPanel, RzRadGrp, DB, ADODB, uSubForm, CommandArray;

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
  private
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
    procedure DoorSeach(aDoorID:string);
    procedure SetCardReader(aNodeNo,aEcuID,aDoorNo:string);
    function GetDoorSeq:integer;
    function GetDoorNumber(aNodeNo,aEcuID:string):integer;

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
                                 aCurY:string):Boolean;
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
                                 aCurY:string):Boolean;
    function InsertTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function UpdateTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function UpdateTB_DoorReader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function DeleteTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo:string):Boolean;
    function DeleteTB_DOOR(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    function UpdateTB_DOORReaderType(aNodeNo,aEcuID,aReaderType,aSendAck:string):Boolean;
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
  sBuildingCodeList := TStringList.Create ;
  sFloorCodeList := TStringList.Create;
  sAreaCodeList := TStringList.Create;

  ed_regDoorNo.MaxValue := DOORCOUNT;
  DeviceIDList := TStringList.Create;
  LockTypeList := TStringList.Create;
  DeviceLoad(cmb_DeviceCode,'Y');
  DeviceLoad(cmb_regDeviceCode,'N');
  LoadsBuildingCode(cmb_sBuildingCode);
  LockTypeSet;
  GridInit;
  FormClear;
  DoorSeach('');
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
    cmb_Box.Items.Add('전체');
  end else
  begin
    cmb_Box.Items.Add('');
  end;

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

procedure TfmDoorAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceIDList.Destroy;
  LockTypeList.Destroy;
  sBuildingCodeList.Free ;
  sFloorCodeList.Free;
  sAreaCodeList.Free;
end;

procedure TfmDoorAdmin.FormClear;
var
  i :integer;
begin
//  cmb_regDeviceCode.ItemIndex := 0;
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
begin
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

  cmb_regDeviceCode.SetFocus;
end;

procedure TfmDoorAdmin.btn_UpdateClick(Sender: TObject);
begin
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
begin
  if Not FormCheck then Exit;
  btn_Cancel.Enabled := False;
  stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
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

  if State = 'INSERT' then
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
                                 stCurY
                                  );
  end else
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
                                 stCurY
                                  );
  end;
  if Not bResult then
  begin
    showmessage('출입문 데이터 저장에 실패 했습니다.');
    btn_Save.Enabled := True;
    Exit;
  end;

  for i := 1 to CARDREADERCOUNT do
  begin
    if Group_CardReaderNo.ItemChecked[i-1] then
    begin
      if DupCheckCardReader(stNodeNo,stEcuID,inttostr(i)) then
      begin
        UpdateTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value),'N','Y');
      end else
      begin
        InsertTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value),'N','Y');
      end;
    end else
    begin
      if Not DupCheckCardReaderDoor(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value)) then //사용하는 문이 없으면
      begin
        UpdateTB_DoorReader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value),'N','N');
      end;
      //DeleteTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value));
    end;
  end;

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
  if nCardReader = 0 then
  begin
    showmessage('카드리더를 한개 이상 등록 해 주셔야 합니다.');
    Exit;
  end;
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
  aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,aCurY:string):Boolean;
var
  stSql :string;
begin
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
  stSql := stSql + 'DO_CURY) ';
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
  stSql := stSql + aCurY + ')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDoorAdmin.UpdateTB_DOOR(aNodeNo, aEcuID, aDoorNo, aDoorName,
  aDoorType, aScheduleUse, aDoorControlTime, aDoorSeq,aReaderType,
  aFire,aDoorMode,aSendAck,aBuildingCode,aFloorCode,
  aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,aCurY:string):Boolean;
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
  stSql := stSql + 'DO_CURY = ' + aCurY + ' ';
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
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  stNodeNo := copy(stDeviceID,1,3);
  stEcuID := copy(stDeviceID,4,2);
  for i := 1 to CARDREADERCOUNT do
  begin
    DeleteTB_READER(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value));
  end;

  DeleteTB_DOOR(stNodeNo,stEcuID,inttostr(ed_regDoorNo.Value));
  DoorSeach('');
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

procedure TfmDoorAdmin.DoorSeach(aDoorID:string);
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
  stSql := stSql + ' a.DO_TOTWIDTH,a.DO_TOTHEIGHT,a.DO_CURX,a.DO_CURY ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if cmb_DeviceCode.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(DeviceIDList.Strings[cmb_DeviceCode.ItemIndex],1,3)));
    stSql := stSql + ' AND a.AC_ECUID = ''' + copy(DeviceIDList.Strings[cmb_DeviceCode.ItemIndex],4,2) + ''' ';
  end;

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
      Group_CardReaderNo.ItemChecked[FindField('RE_READERNO').AsInteger - 1] := True;
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
            inttostr(ed_regDoorNo.Value));

end;

function TfmDoorAdmin.UpdateTB_DoorReader(aNodeNo, aEcuID, aReaderNo,
  aDoorNo, aSendAck, aUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_READER set ';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''', ';
  stSql := stSql + 'RE_USE = ''' + aUse + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

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
    else result := FindField('DO_DOORNO').AsInteger + 1;
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
      TempAdoQuery.Free;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
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
  TempAdoQuery.Free;
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
      TempAdoQuery.Free;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
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
  TempAdoQuery.Free;
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
      TempAdoQuery.Free;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
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
  TempAdoQuery.Free;
end;

procedure TfmDoorAdmin.cmb_sBuildingCodeChange(Sender: TObject);
var
  stBuildingCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
  cmb_sAreaCode.Clear;
end;

procedure TfmDoorAdmin.cmb_sFloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);

end;

procedure TfmDoorAdmin.btnDoorPositionClick(Sender: TObject);
begin
  if cmb_sBuildingCode.itemIndex < 0 then cmb_sBuildingCode.itemIndex := 0;
  if cmb_sFloorCode.itemIndex < 0 then cmb_sFloorCode.itemIndex := 0;
  if cmb_sAreaCode.itemIndex < 0 then cmb_sAreaCode.itemIndex := 0;

  fmPositionSet:= TfmPositionSet.Create(Self);
  fmPositionSet.FormName := 'fmDoorAdmin';
  fmPositionSet.DeviceType := '3';
  fmPositionSet.DeviceName := ed_regDoorName.Text;
  fmPositionSet.X_Position := ed_CurX.Text;
  fmPositionSet.Y_Position := ed_CurY.Text;
  fmPositionSet.X_Size := ed_TotWidth.Text;
  fmPositionSet.Y_Size := ed_TotHeight.Text;
  fmPositionSet.BuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode.itemIndex];
  fmPositionSet.FloorCode := sFloorCodeList.Strings[cmb_sFloorCode.itemIndex];
  fmPositionSet.SectorCode := sAreaCodeList.Strings[cmb_sAreaCode.itemIndex];
  fmPositionSet.SHowmodal;
  fmPositionSet.Free;
end;

procedure TfmDoorAdmin.FormShow(Sender: TObject);
begin
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
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Door.Enabled := False;
    cmb_regDeviceCode.Enabled := False;
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
  end;
end;

end.
