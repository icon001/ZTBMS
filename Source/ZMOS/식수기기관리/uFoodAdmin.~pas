unit uFoodAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, Grids, BaseGrid, AdvGrid, Mask, RzEdit,
  RzSpnEdt, StdCtrls, Spin, ExtCtrls, DB, ADODB, RzPanel, RzRadGrp,ActiveX;

type
  TfmFoodAdmin = class(TForm)
    pan_header: TPanel;
    GroupBox4: TGroupBox;
    Splitter2: TSplitter;
    Panel6: TPanel;
    GroupBox10: TGroupBox;
    Label7: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label23: TLabel;
    Label12: TLabel;
    cmb_regDeviceCode: TComboBox;
    cmb_sBuildingCode: TComboBox;
    cmb_sFloorCode: TComboBox;
    cmb_sAreaCode: TComboBox;
    ed_TotWidth: TEdit;
    ed_TotHeight: TEdit;
    ed_CurX: TEdit;
    ed_CurY: TEdit;
    btnFoodPosition: TBitBtn;
    chk_FoodReg: TCheckBox;
    Panel5: TPanel;
    GroupBox11: TGroupBox;
    Label9: TLabel;
    cmb_DeviceCode: TComboBox;
    Panel1: TPanel;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    Label10: TLabel;
    ed_regReaderNo: TSpinEdit;
    Label22: TLabel;
    ed_regFoodName: TEdit;
    Label4: TLabel;
    cmb_CardReaderType: TComboBox;
    sg_Food: TAdvStringGrid;
    ADOQuery: TADOQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    ed_BreakAmt: TEdit;
    ed_LunchAmt: TEdit;
    ed_EveningAmt: TEdit;
    ed_MidNightAmt: TEdit;
    Group_CardReaderNo: TRzCheckGroup;
    chk_foodUpdate: TCheckBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure sg_FoodClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure cmb_DeviceCodeChange(Sender: TObject);
    procedure cmb_sBuildingCodeChange(Sender: TObject);
    procedure cmb_sFloorCodeChange(Sender: TObject);
    procedure btnFoodPositionClick(Sender: TObject);
    procedure cmb_regDeviceCodeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Group_CardReaderNoChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure cmb_sAreaCodeChange(Sender: TObject);
  private
    sBuildingCodeList : TStringList;
    sFloorCodeList : TStringList;
    sAreaCodeList : TStringList;
    DeviceIDList : TStringList;
    State : string;
    { Private declarations }
    procedure GridInit;
    procedure DeviceLoad(cmb_Box:TComboBox;aType:string);
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);

    function FormCheck : Boolean;
    procedure FoodSearch(aFoodID:string);
    function GetFoodReader(aNodeNo,aEcuID:string):integer;
    procedure SetCardReader(aNodeNo,aEcuID,aDoorNo:string);
    function DupCheckCardReaderDoor(aNodeNo,aEcuID,aReaderNo,aDoorNo:string):Boolean;
    function DupCheckCardReader(aNodeNo,aEcuID,aReaderNo:string):Boolean;
  public
    { Public declarations }
    function DupCheckTB_FOOD(aNodeNo,aEcuID,aReaderNo:string):Boolean;
    function DeleteTB_FOOD(aNodeNo,aEcuID,aReaderNo:string):Boolean;
    function InsertIntoTB_FOOD(aNodeNo,
                                 aEcuID,
                                 aReaderNo,
                                 aFoodName,
                                 aSendAck,
                                 aBuildingCode,
                                 aFloorCode,
                                 aAreaCode,
                                 aRegState,
                                 aTotWidth,
                                 aTotHeight,
                                 aCurX,
                                 aCurY,
                                 aAmtPer,
                                 aBreakAmt,
                                 aLunchAmt,
                                 aEveningAmt,
                                 aMidNightAmt : string
                                 ):Boolean;
    function UpdateTB_FOOD(aNodeNo,
                                 aEcuID,
                                 aReaderNo,
                                 aFoodName,
                                 aSendAck,
                                 aBuildingCode,
                                 aFloorCode,
                                 aAreaCode,
                                 aRegState,
                                 aTotWidth,
                                 aTotHeight,
                                 aCurX,
                                 aCurY,
                                 aAmtPer,
                                 aBreakAmt,
                                 aLunchAmt,
                                 aEveningAmt,
                                 aMidNightAmt : string
                                 ):Boolean;
    function UpdateTB_FOODInfo(aNodeNo,
                                 aEcuID,
                                 aReaderNo,
                                 aFoodName,
                                 aBuildingCode,
                                 aFloorCode,
                                 aAreaCode,
                                 aRegState,
                                 aTotWidth,
                                 aTotHeight,
                                 aCurX,
                                 aCurY,
                                 aAmtPer,
                                 aBreakAmt,
                                 aLunchAmt,
                                 aEveningAmt,
                                 aMidNightAmt : string
                                 ):Boolean;
    function UpdateTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function UpdateTB_DoorReader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function InsertTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
  end;

var
  fmFoodAdmin: TfmFoodAdmin;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uPositionSet;
{$R *.dfm}

procedure TfmFoodAdmin.btn_CloseClick(Sender: TObject);
begin
  close;
end;

procedure TfmFoodAdmin.GridInit;
var
  nCol : integer;
begin
  with sg_Food do
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

procedure TfmFoodAdmin.FormCreate(Sender: TObject);
begin
  sBuildingCodeList := TStringList.Create ;
  sFloorCodeList := TStringList.Create;
  sAreaCodeList := TStringList.Create;
  DeviceIDList := TStringList.Create;

  if UpperCase(FOODDEVICE) = 'READER' then ed_regReaderNo.MaxValue := CARDREADERCOUNT
  else ed_regReaderNo.MaxValue := DOORCOUNT;
  DeviceLoad(cmb_DeviceCode,'Y');
  DeviceLoad(cmb_regDeviceCode,'N');
  LoadsBuildingCode(cmb_sBuildingCode);

  GridInit;
  FormClear;
  FoodSearch('');
end;

procedure TfmFoodAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sBuildingCodeList.Free;
  sFloorCodeList.Free;
  sAreaCodeList.Free;
  DeviceIDList.Free;

end;

procedure TfmFoodAdmin.DeviceLoad(cmb_Box: TComboBox; aType: string);
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
  stSql := stSql + ' AND AC_FDTYPE = ''1'' ';
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

procedure TfmFoodAdmin.LoadsAreaCode(aBuildingCode, aFloorCode: string;
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

procedure TfmFoodAdmin.LoadsBuildingCode(cmb_Box: TComboBox);
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

procedure TfmFoodAdmin.LoadsFloorCode(aBuildingCode: string;
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


procedure TfmFoodAdmin.FormClear;
var
  i : integer;
begin
  chk_foodUpdate.Checked := False;
  cmb_regDeviceCode.ItemIndex := 0;
  ed_regReaderNo.Value := 1;
  ed_regFoodName.Text := '';
  cmb_CardReaderType.ItemIndex := 0;

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
  
  ed_BreakAmt.Text:= '0';
  ed_LunchAmt.Text:= '0';
  ed_EveningAmt.Text:= '0';
  ed_MidNightAmt.Text:= '0';
end;

procedure TfmFoodAdmin.ButtonEnable(aState: string);
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

procedure TfmFoodAdmin.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Food.Enabled := False;
    cmb_regDeviceCode.Enabled := True;
    ed_regReaderNo.Enabled := True;
    ed_regFoodName.Enabled := True;
    cmb_CardReaderType.Enabled := True;
    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    btnFoodPosition.Enabled := True;
    ed_BreakAmt.Enabled := True;
    ed_LunchAmt.Enabled := True;
    ed_EveningAmt.Enabled := True;
    ed_MidNightAmt.Enabled := True;
    Group_CardReaderNo.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Food.Enabled := True;
    cmb_regDeviceCode.Enabled := False;
    ed_regReaderNo.Enabled := False;
    ed_regFoodName.Enabled := False;
    cmb_CardReaderType.Enabled := False;
    cmb_sBuildingCode.Enabled := False;
    cmb_sFloorCode.Enabled := False;
    cmb_sAreaCode.Enabled := False;
    btnFoodPosition.Enabled := False;
    ed_BreakAmt.Enabled := False;
    ed_LunchAmt.Enabled := False;
    ed_EveningAmt.Enabled := False;
    ed_MidNightAmt.Enabled := False;
    Group_CardReaderNo.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Food.Enabled := False;
    cmb_regDeviceCode.Enabled := False;
    ed_regReaderNo.Enabled := False;
    ed_regFoodName.Enabled := True;
    cmb_CardReaderType.Enabled := True;
    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    btnFoodPosition.Enabled := True;
    ed_BreakAmt.Enabled := True;
    ed_LunchAmt.Enabled := True;
    ed_EveningAmt.Enabled := True;
    ed_MidNightAmt.Enabled := True;
    Group_CardReaderNo.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Food.Enabled := True;
    cmb_regDeviceCode.Enabled := False;
    ed_regReaderNo.Enabled := False;
    ed_regFoodName.Enabled := False;
    cmb_CardReaderType.Enabled := False;
    cmb_sBuildingCode.Enabled := False;
    cmb_sFloorCode.Enabled := False;
    cmb_sAreaCode.Enabled := False;
    btnFoodPosition.Enabled := False;
    ed_BreakAmt.Enabled := False;
    ed_LunchAmt.Enabled := False;
    ed_EveningAmt.Enabled := False;
    ed_MidNightAmt.Enabled := False;
    Group_CardReaderNo.Enabled := False;
  end;

end;

procedure TfmFoodAdmin.FoodSearch(aFoodID: string);
var
  stSql : string;
  nRow : integer;
  stDeviceName : string;
begin
  FormClear;
  GridInit;
  State := 'SEARCH';
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select b.AC_DEVICENAME,b.AC_MCUIP,a.*';
  stSql := stSql + ' from TB_FOOD a ';
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
  stSql := stSql + ' order by a.AC_NODENO,a.AC_ECUID,a.FO_DOORNO ';
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
    sg_Food.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_Food do
      begin
        Cells[0,nRow] := FindField('FO_NAME').AsString;
        Cells[1,nRow] := FindField('AC_DEVICENAME').AsString;
        Cells[2,nRow] := FindField('FO_DOORNO').AsString;
        Cells[3,nRow] := FindField('AC_NODENO').AsString;
        Cells[4,nRow] := FindField('AC_ECUID').AsString;
        Cells[5,nRow] := FindField('FO_CARDREADERTYPE').AsString;
        cells[6,nRow] := FindField('LO_DONGCODE').AsString;
        cells[7,nRow] := FindField('LO_FLOORCODE').AsString;
        cells[8,nRow] := FindField('LO_AREACODE').AsString;
        cells[9,nRow] := FindField('FO_LOCATEUSE').AsString;
        cells[10,nRow] := FindField('FO_TOTWIDTH').AsString;
        cells[11,nRow] := FindField('FO_TOTHEIGHT').AsString;
        cells[12,nRow] := FindField('FO_CURX').AsString;
        cells[13,nRow] := FindField('FO_CURY').AsString;
        cells[14,nRow] := FindField('FO_AMTPER').AsString;
        cells[15,nRow] := FindField('FO_BREAKAMT').AsString;
        cells[16,nRow] := FindField('FO_LUNCHAMT').AsString;
        cells[17,nRow] := FindField('FO_EVENINGAMT').AsString;
        cells[18,nRow] := FindField('FO_MIDNIGHTAMT').AsString;

        if aFoodID = (FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +
                      FindField('AC_ECUID').AsString +
                      FindField('FO_DOORNO').AsString) then
        begin
          SelectRows(nRow,1);
        end;
      end;
      Next;
      inc(nRow);
    end;
  end;
  sg_FoodClick(sg_Food);
end;

procedure TfmFoodAdmin.btn_InsertClick(Sender: TObject);
var
  stDeviceID : string;
  nReaderNo : integer;
  i : integer;
  nMaxReaderNo : integer;
begin
  FormClear;
  cmb_regDeviceCode.ItemIndex := cmb_DeviceCode.ItemIndex;
  nReaderNo := 1;
  if UpperCase(FOODDEVICE) = 'READER' then nMaxReaderNo := CARDREADERCOUNT
  else nMaxReaderNo := DOORCOUNT;

  if cmb_regDeviceCode.ItemIndex > 0 then
  begin
    stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.ItemIndex];
    nReaderNo := GetFoodReader(copy(stDeviceID,1,3),Copy(stDeviceID,4,2));
    if ( nReaderNo < 0) or (nReaderNo > nMaxReaderNo) then
    begin
      if UpperCase(FOODDEVICE) = 'READER' then
        showmessage('해당 기기의 카드리더 갯수가 초과 되었습니다.')
      else showmessage('해당 기기의 식수구역 문 갯수가 초과 되었습니다.');
      Exit;
    end;
    ed_regReaderNo.Value :=  nReaderNo;
  end;

  if UpperCase(FOODDEVICE) <> 'READER' then Group_CardReaderNo.ItemChecked[nReaderNo - 1] := True;


  State := 'INSERT';
  FormEnable(State);
  ButtonEnable(State);
  with sg_Food do
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
end;

function TfmFoodAdmin.GetFoodReader(aNodeNo, aEcuID: string): integer;
var
  stSql : string;
begin
  result := 1;
  stSql := 'select Max(FO_DOORNO) as FO_DOORNO from TB_FOOD ';
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
    if Trim(FindField('FO_DOORNO').AsString) = '' then result := 1
    else result := strtoint(FindField('FO_DOORNO').AsString) + 1;
  end;

end;

procedure TfmFoodAdmin.btn_UpdateClick(Sender: TObject);
begin
  chk_foodUpdate.Checked := False;
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmFoodAdmin.sg_FoodClick(Sender: TObject);
var
  stECUID : string;
  stNODENO : string;
  stReaderNo : string;
  nReaderType : integer;
  stBuildingCode,stFloorCode : string;
  nIndex : integer;
begin
  with sg_Food do
  begin
    if Cells[0,Row] = '' then Exit;
    FormClear;
    State := 'CLICK';
    FormEnable(State);
    ButtonEnable(State);

    stNodeNo := FillZeronumber(strtoint(Cells[3,Row]),3);
    stEcuID := Cells[4,Row];
    stReaderNo := Cells[2,Row];
    nIndex := DeviceIDList.IndexOf(stNodeNo + stEcuid);
    if nIndex < 1 then
    begin
      if (Application.MessageBox(PChar('해당식수구역의 기기는 식수 타입이 아닙니다.식수구역을 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
      DeleteTB_FOOD(stNodeNo,stEcuID,stReaderNo);
      FoodSearch('');
      Exit;
    end;

    cmb_regDeviceCode.ItemIndex := nIndex;
    ed_regReaderNo.Value := strtoint(stReaderNo);
    ed_regFoodName.Text := Cells[0,Row];

    if (cells[6,Row] = '') or (cells[6,Row] = '000') then cmb_sBuildingCode.ItemIndex := 0
    else cmb_sBuildingCode.ItemIndex := sBuildingCodeList.IndexOf(cells[6,Row]);
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];

    LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
    if (cells[7,Row] = '') or (cells[7,Row] = '000') then cmb_sFloorCode.ItemIndex := 0
    else cmb_sFloorCode.ItemIndex := sFloorCodeList.IndexOf(cells[7,Row]);
    stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];

    LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);;
    if (cells[8,Row] = '') or (cells[8,Row] = '000') then cmb_sAreaCode.ItemIndex := 0
    else cmb_sAreaCode.ItemIndex := sAreaCodeList.IndexOf(cells[8,Row]);

    if cells[9,Row] = 'Y' then chk_FoodReg.Checked := True
    else chk_FoodReg.Checked := False;
    ed_TotWidth.Text := cells[10,Row];
    ed_TotHeight.Text := cells[11,Row];
    ed_CurX.Text := cells[12,Row];
    ed_CurY.Text := cells[13,Row];
    ed_BreakAmt.Text := cells[15,Row];
    ed_LunchAmt.Text := cells[16,Row];
    ed_EveningAmt.Text := cells[17,Row];
    ed_MidNightAmt.Text := cells[18,Row];

    if UpperCase(FOODDEVICE) <> 'READER' then SetCardReader(stNodeNo,stEcuID,stReaderNo);

  end;


end;

function TfmFoodAdmin.DeleteTB_FOOD(aNodeNo, aEcuID,
  aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_FOOD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmFoodAdmin.btn_DeleteClick(Sender: TObject);
var
  stDeviceID : string;
  stNodeNo : string;
  stEcuID : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  stNodeNo := copy(stDeviceID,1,3);
  stEcuID := copy(stDeviceID,4,2);

  DeleteTB_FOOD(stNodeNo,stEcuID,inttostr(ed_regReaderNo.Value));
  FoodSearch('');

end;

procedure TfmFoodAdmin.btn_CancelClick(Sender: TObject);
var
  stDeviceID : string;
  stNodeNo : string;
  stEcuID : string;
begin
  stDeviceID := '';
  if cmb_regDeviceCode.itemIndex > -1 then
  begin
    stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
    stNodeNo := copy(stDeviceID,1,3);
    stEcuID := copy(stDeviceID,4,2);
  end;
  FoodSearch(stDeviceID + inttostr(ed_regReaderNo.Value));
end;

procedure TfmFoodAdmin.btn_SaveClick(Sender: TObject);
var
  stDeviceID :string;
  stNodeNo : string;
  stEcuID : string;
  i : integer;
  bResult : Boolean;
  stReaderNo : string;

  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stRegState : string;
  stTotWidth,stTotHeight,stCurX,stCurY : string;
  stAmtPer : string;
  stBreakAmt,stLunchAmt,stEveningAmt,stMidNightAmt : string;
begin
  if Not FormCheck then Exit;

  stAmtPer := '0';
  stBreakAmt := '0';
  stLunchAmt := '0';
  stEveningAmt := '0';
  stMidNightAmt := '0';

  stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.itemIndex];
  stNodeNo := copy(stDeviceID,1,3);
  stEcuID := copy(stDeviceID,4,2);
  stReaderNo := inttostr(ed_regReaderNo.Value);

  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_sBuildingCode.itemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode.itemIndex];
  if cmb_sFloorCode.itemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode.itemIndex];
  if cmb_sAreaCode.itemIndex > 0 then  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.itemIndex];
  if chk_FoodReg.Checked then  stRegState := 'Y'
  else stRegState := 'N' ;
  if Trim(ed_TotWidth.text) <> '' then stTotWidth := Trim(ed_TotWidth.text)
  else stTotWidth := '0';
  if Trim(ed_TotHeight.text) <> '' then stTotHeight := Trim(ed_TotHeight.text)
  else stTotHeight := '0';
  if Trim(ed_CurX.text) <> '' then stCurX := Trim(ed_CurX.text)
  else stCurX := '0';
  if Trim(ed_CurY.text) <> '' then stCurY := Trim(ed_CurY.text)
  else stCurY := '0';
  if IsDigit(ed_BreakAmt.Text) then stBreakAmt := ed_BreakAmt.Text;
  if IsDigit(ed_LunchAmt.Text) then stLunchAmt := ed_LunchAmt.Text;
  if IsDigit(ed_EveningAmt.Text) then stEveningAmt := ed_EveningAmt.Text;
  if IsDigit(ed_MidNightAmt.Text) then stMidNightAmt := ed_MidNightAmt.Text;

  if UpperCase(FOODDEVICE) <> 'READER' then
  begin
    for i := 1 to CARDREADERCOUNT do
    begin
      if Group_CardReaderNo.ItemChecked[i-1] then
      begin
        if DupCheckCardReaderDoor(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regReaderNo.Value)) then
        begin
          if MessageDlg(inttostr(i) + '번 리더기가 이미 사용 중입니다.' + #13 +
                        inttostr(i) + '번 리더기를 현재 문 제어에 사용 하시겠습니까?', mtConfirmation, [mbYes, mbNo],0) <> mrYes then
          begin
            Exit;
          end;
        end;
      end;
    end;
  end;

  if State = 'INSERT' then
  begin
    if DupCheckTB_FOOD(stNodeNo,stEcuID,stReaderNo) then
    begin
      showmessage('중복된 식수구역 입니다.');
      btn_Save.Enabled := True;
      Exit;
    end;
    bResult := InsertIntoTB_FOOD(stNodeNo,
                                 stEcuID,
                                 stReaderNo,
                                 ed_regFoodName.Text,
                                 'N',
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 stAmtPer,
                                 stBreakAmt,
                                 stLunchAmt,
                                 stEveningAmt,
                                 stMidNightAmt
                                 );
  end else
  begin
    if chk_foodUpdate.Checked then
    begin
      bResult := UpdateTB_FOOD(stNodeNo,
                                 stEcuID,
                                 stReaderNo,
                                 ed_regFoodName.Text,
                                 'N',
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 stAmtPer,
                                 stBreakAmt,
                                 stLunchAmt,
                                 stEveningAmt,
                                 stMidNightAmt
                                 );
    end else
    begin
      bResult := UpdateTB_FOODInfo(stNodeNo,
                                 stEcuID,
                                 stReaderNo,
                                 ed_regFoodName.Text,
                                 stBuildingCode,
                                 stFloorCode,
                                 stAreaCode,
                                 stRegState,
                                 stTotWidth,
                                 stTotHeight,
                                 stCurX,
                                 stCurY,
                                 stAmtPer,
                                 stBreakAmt,
                                 stLunchAmt,
                                 stEveningAmt,
                                 stMidNightAmt
                                 );
    end;
  end;
  if Not bResult then
  begin
    showmessage('식수구역 저장에 실패 했습니다.');
    btn_Save.Enabled := True;
    Exit;
  end;

  if UpperCase(FOODDEVICE) = 'READER' then
  begin
    UpdateTB_Reader(stNodeNo,stEcuID,inttostr(ed_regReaderNo.value),'0','N','Y');  //사용하지만 출입문 제어 없음
  end else
  begin
    for i := 1 to CARDREADERCOUNT do
    begin
      if Group_CardReaderNo.ItemChecked[i-1] then
      begin
        if DupCheckCardReader(stNodeNo,stEcuID,inttostr(i)) then
        begin
          UpdateTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regReaderNo.Value),'N','Y');
        end else
        begin
          InsertTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regReaderNo.Value),'N','Y');
        end;
      end else
      begin
        if Not DupCheckCardReaderDoor(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regReaderNo.Value)) then //사용하는 문이 없으면
        begin
          UpdateTB_DoorReader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regReaderNo.Value),'N','N');
        end;
        //DeleteTB_Reader(stNodeNo,stEcuID,inttostr(i),inttostr(ed_regDoorNo.Value));
      end;
    end;
  end;

  FoodSearch(FillZeroNumber(strtoint(stNodeNo),3) +
            stEcuID +
            stReaderNo);
end;

function TfmFoodAdmin.InsertIntoTB_FOOD(aNodeNo, aEcuID, aReaderNo,
  aFoodName, aSendAck, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY, aAmtPer, aBreakAmt, aLunchAmt,
  aEveningAmt, aMidNightAmt: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Insert Into TB_FOOD( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'FO_DOORNO,';
  stSql := stSql + 'FO_NAME,';
  stSql := stSql + 'SEND_ACK, ';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'FO_LOCATEUSE,';
  stSql := stSql + 'FO_TOTWIDTH,';
  stSql := stSql + 'FO_TOTHEIGHT,';
  stSql := stSql + 'FO_CURX,';
  stSql := stSql + 'FO_CURY,';
  stSql := stSql + 'FO_AMTPER,';
  stSql := stSql + 'FO_BREAKAMT,';
  stSql := stSql + 'FO_LUNCHAMT,';
  stSql := stSql + 'FO_EVENINGAMT,';
  stSql := stSql + 'FO_MIDNIGHTAMT) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + inttostr(strtoint(aNodeNo)) + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aReaderNo + ''',';
  stSql := stSql + '''' + aFoodName + ''',';
  stSql := stSql + '''' + aSendAck + ''',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aRegState + ''',';
  stSql := stSql + aTotWidth + ',';
  stSql := stSql + aTotHeight + ',';
  stSql := stSql + aCurX + ',';
  stSql := stSql + aCurY + ',';
  stSql := stSql + aAmtPer + ',';
  stSql := stSql + aBreakAmt + ',';
  stSql := stSql + aLunchAmt + ',';
  stSql := stSql + aEveningAmt + ',';
  stSql := stSql + aMidNightAmt + ') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmFoodAdmin.UpdateTB_FOOD(aNodeNo, aEcuID, aReaderNo, aFoodName,
  aSendAck, aBuildingCode, aFloorCode, aAreaCode, aRegState, aTotWidth,
  aTotHeight, aCurX, aCurY, aAmtPer, aBreakAmt, aLunchAmt, aEveningAmt,
  aMidNightAmt: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_FOOD set ';
  stSql := stSql + 'FO_NAME = ''' + aFoodName + ''',';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'FO_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'FO_TOTWIDTH = ' + aTotWidth + ',';
  stSql := stSql + 'FO_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'FO_CURX = ' + aCurX + ',';
  stSql := stSql + 'FO_CURY = ' + aCurY + ',';
  stSql := stSql + 'FO_AMTPER = ' + aAmtPer + ',';
  stSql := stSql + 'FO_BREAKAMT = ' + aBreakAmt + ',';
  stSql := stSql + 'FO_LUNCHAMT = ' + aLunchAmt + ',';
  stSql := stSql + 'FO_EVENINGAMT = ' + aEveningAmt + ',';
  stSql := stSql + 'FO_MIDNIGHTAMT = '+ aMidNightAmt ;
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmFoodAdmin.DupCheckTB_FOOD(aNodeNo, aEcuID,
  aReaderNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_FOOD ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';
  With AdoQuery do
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

function TfmFoodAdmin.FormCheck: Boolean;
var
  nMaxReaderNo : integer;
begin
  result := False;
  if UpperCase(FOODDEVICE) = 'READER' then  nMaxReaderNo := CARDREADERCOUNT
  else nMaxReaderNo := DOORCOUNT;

  if cmb_regDeviceCode.ItemIndex < 1 then
  begin
    showmessage('기기는 반드시 선택 하셔야 합니다.');
    cmb_regDeviceCode.SetFocus;
    Exit;
  end;
  if ed_regReaderNo.Value > nMaxReaderNo then
  begin
    if UpperCase(FOODDEVICE) = 'READER' then showmessage('현재 기기에서는 카드리더를 ' + inttostr(nMaxReaderNo) + '개 까지만 지원 됩니다.')
    else showmessage('현재 기기에서는 식수구역 문갯수를 ' + inttostr(nMaxReaderNo) + '개 까지만 지원 됩니다.');
    ed_regReaderNo.SetFocus;
    Exit;
  end;
  if ed_regFoodName.Text = '' then
  begin
    showmessage('인식 할 수 있는 식수구역 명칭을 기재 하여 주세요.');
    ed_regFoodName.SetFocus;
    Exit;
  end;
  result := True;
end;

procedure TfmFoodAdmin.cmb_DeviceCodeChange(Sender: TObject);
begin
  FoodSearch('');
end;

procedure TfmFoodAdmin.cmb_sBuildingCodeChange(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_sBuildingCode.ItemIndex < 0 then
  begin
    cmb_sBuildingCode.Text := '';
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
  cmb_sAreaCode.Clear;

end;

procedure TfmFoodAdmin.cmb_sFloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  if cmb_sBuildingCode.ItemIndex < 0 then
  begin
    cmb_sBuildingCode.Text := '';
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  if cmb_sFloorCode.ItemIndex < 0 then
  begin
    cmb_sFloorCode.Text := '';
    Exit;
  end;
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);

end;

procedure TfmFoodAdmin.btnFoodPositionClick(Sender: TObject);
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
  fmPositionSet.FormName := 'fmFoodAdmin';
  fmPositionSet.DeviceType := '5';
  fmPositionSet.DeviceName := ed_regFoodName.Text;
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

procedure TfmFoodAdmin.cmb_regDeviceCodeChange(Sender: TObject);
var
  stDeviceID : string;
  nReaderNo : integer;
  nMaxReaderNo : integer;
  i : integer;
begin
  if UpperCase(FOODDEVICE) = 'READER' then  nMaxReaderNo := CARDREADERCOUNT
  else nMaxReaderNo := DOORCOUNT;
  if cmb_regDeviceCode.ItemIndex > 0 then
  begin
    stDeviceID := DeviceIDList.Strings[cmb_regDeviceCode.ItemIndex];
    nReaderNo := GetFoodReader(copy(stDeviceID,1,3),Copy(stDeviceID,4,2));
    if ( nReaderNo < 0) or (nReaderNo > nMaxReaderNo) then
    begin
      if UpperCase(FOODDEVICE) = 'READER' then showmessage('해당 기기의 카드리더 갯수가 초과 되었습니다.')
      else showmessage('해당 기기의 식수구역 문 갯수가 초과 되었습니다.');
      Exit;
    end;
    ed_regReaderNo.Value :=  nReaderNo;
  end;
  if UpperCase(FOODDEVICE) <> 'READER' then
  begin
    for i:= 1 to CARDREADERCOUNT do
    begin
      Group_CardReaderNo.ItemChecked[I-1]:= False;
    end;
    Group_CardReaderNo.ItemChecked[nReaderNo - 1] := True;
  end;

end;

procedure TfmFoodAdmin.FormShow(Sender: TObject);
begin
  if UpperCase(FOODDEVICE) = 'READER' then
  begin
    Label10.Caption := '카드리더 번호';
    ed_regReaderNo.MaxValue := CARDREADERCOUNT;
    Group_CardReaderNo.Visible:= False;
    sg_Food.Cells[2,0] := '카드리더';
  end else
  begin
    Label10.Caption := '식수구역 문번호';
    ed_regReaderNo.MaxValue := DOORCOUNT;
    //Group_CardReaderNo.Visible := True;
    sg_Food.Cells[2,0] := '문번호';
  end;

end;

procedure TfmFoodAdmin.SetCardReader(aNodeNo, aEcuID, aDoorNo: string);
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
      Group_CardReaderNo.ItemChecked[strtoint(FindField('RE_READERNO').AsString) - 1] := True;
      Next;
    end;
  end;
end;

function TfmFoodAdmin.DupCheckCardReaderDoor(aNodeNo, aEcuID, aReaderNo,
  aDoorNo: string): Boolean;
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

function TfmFoodAdmin.UpdateTB_Reader(aNodeNo, aEcuID, aReaderNo, aDoorNo,
  aSendAck, aUse: string): Boolean;
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

function TfmFoodAdmin.DupCheckCardReader(aNodeNo, aEcuID,
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

function TfmFoodAdmin.InsertTB_Reader(aNodeNo, aEcuID, aReaderNo, aDoorNo,
  aSendAck, aUse: string): Boolean;
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

function TfmFoodAdmin.UpdateTB_DoorReader(aNodeNo, aEcuID, aReaderNo,
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

procedure TfmFoodAdmin.Group_CardReaderNoChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
begin
  chk_foodUpdate.Checked := True;
end;

function TfmFoodAdmin.UpdateTB_FOODInfo(aNodeNo, aEcuID, aReaderNo,
  aFoodName, aBuildingCode, aFloorCode, aAreaCode, aRegState, aTotWidth,
  aTotHeight, aCurX, aCurY, aAmtPer, aBreakAmt, aLunchAmt, aEveningAmt,
  aMidNightAmt: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_FOOD set ';
  stSql := stSql + 'FO_NAME = ''' + aFoodName + ''',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'FO_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'FO_TOTWIDTH = ' + aTotWidth + ',';
  stSql := stSql + 'FO_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'FO_CURX = ' + aCurX + ',';
  stSql := stSql + 'FO_CURY = ' + aCurY + ',';
  stSql := stSql + 'FO_AMTPER = ' + aAmtPer + ',';
  stSql := stSql + 'FO_BREAKAMT = ' + aBreakAmt + ',';
  stSql := stSql + 'FO_LUNCHAMT = ' + aLunchAmt + ',';
  stSql := stSql + 'FO_EVENINGAMT = ' + aEveningAmt + ',';
  stSql := stSql + 'FO_MIDNIGHTAMT = '+ aMidNightAmt ;
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmFoodAdmin.cmb_sAreaCodeChange(Sender: TObject);
begin
  if cmb_sAreaCode.ItemIndex < 0 then
  begin
    cmb_sAreaCode.Text := '';
    Exit;
  end;

end;

end.
