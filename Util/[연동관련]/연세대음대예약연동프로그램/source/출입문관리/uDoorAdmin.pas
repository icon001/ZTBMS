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
    Panel5: TPanel;
    GroupBox11: TGroupBox;
    Label9: TLabel;
    cmb_DeviceCode: TComboBox;
    sg_Door: TAdvStringGrid;
    Panel1: TPanel;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    ADOQuery: TADOQuery;
    ADOfdmsQuery: TADOQuery;
    lb_Building1: TLabel;
    cmb_BuildingCode1: TComboBox;
    cmb_FloorCode1: TComboBox;
    cmb_AreaCode1: TComboBox;
    lb_AreaCode1: TLabel;
    lb_FloorCode1: TLabel;
    Label1: TLabel;
    ed_DoorName: TEdit;
    Label2: TLabel;
    ed_YSDoorCode: TEdit;
    ed_NodeNo: TEdit;
    ed_DoorNo: TEdit;
    ed_ecuid: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_DeviceCodeChange(Sender: TObject);
    procedure sg_DoorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_regDoorNameEnter(Sender: TObject);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    L_nTopRow : integer;
    L_bScheduleChange : Boolean;
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
    Function UpdateTB_DOOR_YRDOORNO(aNodeNo,aEcuID,aDoorNO,aYRDoorNo:string) : Boolean;
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
                                 aCurY:string):Boolean;
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
                                 aCurY:string):Boolean;
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
                                 aCurY:string):Boolean;
    function InsertTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function UpdateTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function UpdateTB_DoorReader(aNodeNo,aEcuID,aReaderNo,aDoorNo,aSendAck,aUse:string):Boolean;
    function DeleteTB_Reader(aNodeNo,aEcuID,aReaderNo,aDoorNo:string):Boolean;
    function UpdateTB_DOORReaderType(aNodeNo,aEcuID,aReaderType,aSendAck:string):Boolean;
  end;

var
  fmDoorAdmin: TfmDoorAdmin;
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
  uDBModule,
  uLomosUtil;
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

procedure TfmDoorAdmin.DeviceLoad(aList:TStringList;aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box: TComboBox; aType: string);
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
  stSql := stSql + ' WHERE AC_ACTYPE = ''1'' ';

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
begin

end;

procedure TfmDoorAdmin.LockTypeSet;
begin

end;

function TfmDoorAdmin.FormCheck: Boolean;
begin

end;

function TfmDoorAdmin.DupCheckCardReaderDoor(aNodeNo,aEcuID,aReaderNo,aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_READER ';
  stSql := stSql + ' WHERE AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
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
  stSql := stSql + ' WHERE AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
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
  aDoorName, {aDoorType, aDoorControlTime,} aScheduleUse, aDoorSeq,
  {aReaderType,aFire,aDoorMode,}aSendAck,aBuildingCode,aFloorCode,
  aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,aCurY:string):Boolean;
var
  stSql :string;
  stFdmsID : string;
begin
  stFdmsID := GetFdmsDoorID;

  stSql := 'Insert Into TB_DOOR( ';
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
  stSql := stSql + 'DO_UPDATE)';
  stSql := stSql + ' Values ( ';
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
  stSql := stSql + '''Y'') ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmDoorAdmin.UpdateTB_DOOR(aNodeNo, aEcuID, aDoorNo, aDoorName,
  {aDoorType,  aDoorControlTime,}aScheduleUse, aDoorSeq,{aReaderType,
  aFire,aDoorMode,}aSendAck,aBuildingCode,aFloorCode,
  aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,aCurY:string):Boolean;
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
  stSql := stSql + 'DO_UPDATE = ''Y'' ';
  stSql := stSql + ' WHERE AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmDoorAdmin.DeleteTB_Reader(aNodeNo, aEcuID,
  aReaderNo,aDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_READER ';
  stSql := stSql + ' WHERE AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmDoorAdmin.InsertTB_Reader(aNodeNo, aEcuID, aReaderNo, aDoorNo,
  aSendAck,aUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_READER(';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'RE_READERNO,';
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + 'SEND_ACK,';
  stSql := stSql + 'RE_USE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + inttostr(strtoint(aNodeNo)) + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aReaderNo + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aSendAck + ''',';
  stSql := stSql + '''' + aUse + ''') ';

  result := dmDBModule.ProcessExecSQL(stSql);

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
  stSql := stSql + ' WHERE AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmDoorAdmin.CardReaderTypeCheck(aNodeNo, aEcuID,
  aReaderType: string; var aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := false;
  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' WHERE AC_NODENO = ' + inttostr(strtoint(aNodeNo));
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
  stSql := stSql + ' WHERE AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
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
  //cmb_regDeviceCode.ItemIndex := cmb_DeviceCode.ItemIndex;

end;

procedure TfmDoorAdmin.DoorSeach(aBuildingCode,aFloorCode,aAreaCode,aDoorID:string;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
  stDeviceName : string;
begin
  L_bScheduleChange := False;
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
  stSql := stSql + ' a.DO_TOTWIDTH,a.DO_TOTHEIGHT,a.DO_CURX,a.DO_CURY,a.DO_GUBUN,a.YR_DOORNO ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' INNER Join (select * from TB_ACCESSDEVICE where AC_ACTYPE = ''1'' ) b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''1234567890'' ';
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
        Cells[3,nRow] := FindField('YR_DOORNO').AsString;
        Cells[4,nRow] := FindField('AC_NODENO').AsString;
        Cells[5,nRow] := FindField('AC_ECUID').AsString;

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
  if aTop <> 0 then sg_Door.TopRow := aTop;
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
  nDoorNo : integer;
begin
  with sg_Door do
  begin
    ed_DoorName.Text := cells[0,Row];
    ed_YSDoorCode.Text := cells[3,Row];
    ed_NodeNo.Text := cells[4,Row];
    ed_EcuID.Text := cells[5,Row];
    ed_DoorNo.Text := cells[2,Row];
  end;
  btn_Save.Enabled := True;
end;

function TfmDoorAdmin.UpdateTB_DoorReader(aNodeNo, aEcuID, aReaderNo,
  aDoorNo, aSendAck, aUse: string): Boolean;

begin

end;

function TfmDoorAdmin.GetDoorSeq: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select Max(DO_VIEWSEQ) as DO_VIEWSEQ from TB_DOOR ';

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
  stSql := stSql + ' where AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
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
  stSql := stSql + ' where LO_GUBUN = ''2'' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
  stSql := stsql + ' order by LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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
  stSql := stSql + ' where LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';
  
  cmb_Box.Items.Add('');
  sBuildingCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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
  stSql := stSql + ' where LO_GUBUN = ''1'' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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

  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_DeviceCode,'Y');
  LockTypeSet;
  GridInit;
  FormClear;
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);

  L_bScheduleChange := False;
end;

procedure TfmDoorAdmin.ButtonEnable(aState: string);
begin

end;

procedure TfmDoorAdmin.FormEnable(aState: string);
begin

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

function TfmDoorAdmin.UpdateTB_DOORInfo(aNodeNo, aEcuID, aDoorNo,
  aDoorName,aScheduleUse, aDoorSeq, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY: string): Boolean;
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
  stSql := stSql + 'DO_UPDATE = ''Y'' ';
  stSql := stSql + ' WHERE AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
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

procedure TfmDoorAdmin.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  cmb_Box.Clear;
  cmb_Box.Enabled := True;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';

  cmb_Box.Items.Add('전체');
  BuildingCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
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

procedure TfmDoorAdmin.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery:TADOQuery;
begin
  cmb_Box.Clear;
  FloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where LO_GUBUN = ''1'' ';
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
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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

procedure TfmDoorAdmin.LoadAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  AreaCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where LO_GUBUN = ''2'' ';

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
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_DeviceCode,'Y');
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
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,'',cmb_DeviceCode,'Y');
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
  DeviceLoad(DeviceIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_DeviceCode,'Y');
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);
end;

procedure TfmDoorAdmin.btn_SaveClick(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stDoorID : string;
begin
  inherited;
  if Not isDigit(ed_NodeNo.Text) then Exit;
  if Not isDigit(ed_EcuID.Text) then Exit;
  if Not isDigit(ed_DoorNo.Text) then Exit;

  UpdateTB_DOOR_YRDOORNO(ed_NodeNo.Text,ed_EcuID.Text,ed_DoorNo.Text,ed_YSDoorCode.Text);
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stDoorID := FillZeroNumber(strtoint(ed_NodeNo.Text),3) + ed_EcuID.Text + ed_DoorNo.Text;
  if cmb_BuildingCode1.ItemIndex > 0 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];;
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,stDoorID,sg_Door.TopRow);
end;

function TfmDoorAdmin.UpdateTB_DOOR_YRDOORNO(aNodeNo, aEcuID, aDoorNO,
  aYRDoorNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DOOR set YR_DOORNO = ''' + aYRDoorNo + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNO + ''' ';
  
  result := dmDBModule.ProcessExecSQL(stSql);

end;

end.
