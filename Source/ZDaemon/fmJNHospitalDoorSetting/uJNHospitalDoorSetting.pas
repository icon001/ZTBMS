unit uJNHospitalDoorSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls,
  Spin, RzPanel, RzRadGrp, DB, ADODB, uSubForm, CommandArray,ActiveX,Imm,
  AdvObj;

type
  TfmJNHospitalDoorSetting = class(TfmASubForm)
    pan_header: TPanel;
    GroupBox4: TGroupBox;
    Splitter2: TSplitter;
    Panel5: TPanel;
    GroupBox11: TGroupBox;
    Label9: TLabel;
    cmb_DeviceCode: TComboBox;
    sg_Door: TAdvStringGrid;
    StatusBar1: TStatusBar;
    ADOQuery: TADOQuery;
    ADOfdmsQuery: TADOQuery;
    lb_Building1: TLabel;
    cmb_BuildingCode1: TComboBox;
    cmb_FloorCode1: TComboBox;
    cmb_AreaCode1: TComboBox;
    lb_AreaCode1: TLabel;
    lb_FloorCode1: TLabel;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    btn_Add: TSpeedButton;
    btn_Delete: TSpeedButton;
    Panel6: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    cmb_sBuildingCode: TComboBox;
    cmb_sFloorCode: TComboBox;
    cmb_sAreaCode: TComboBox;
    sg_RelayControlDoor: TAdvStringGrid;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_DeviceCodeChange(Sender: TObject);
    procedure cmb_sBuildingCodeChange(Sender: TObject);
    procedure cmb_sFloorCodeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_sAreaCodeChange(Sender: TObject);
    procedure ed_regDoorNameEnter(Sender: TObject);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure rg_TimeCodeClick(Sender: TObject);
    procedure sg_DoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_RelayControlDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    L_nTopRow : integer;
    L_bScheduleChange : Boolean;
    L_bTimeCodeChange : Boolean;
    { Private declarations }
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure DeviceLoad(aList:TStringList;aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box: TComboBox; aType: string);
    function DupCheckCardReaderDoor(aNodeNo,aEcuID,aReaderNo,aDoorNo:string):Boolean;
    function DupCheckCardReader(aNodeNo,aEcuID,aReaderNo:string):Boolean;
    function CardReaderTypeCheck(aNodeNo,aEcuID,aReaderType:string; var aDoorNo:string):Boolean;
    procedure DoorSeach(aBuildingCode,aFloorCode,aAreaCode,aDoorID:string;aTop :integer = 0);
    procedure RelayControlDoorSearch(aBuildingCode,aFloorCode,aAreaCode,aDoorID:string;aTop :integer = 0);

    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);

  public
    { Public declarations }
  end;

var
  fmJNHospitalDoorSetting: TfmJNHospitalDoorSetting;
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
  uServerDaemon, uPositionSet, uDBFunction;
{$R *.dfm}

procedure TfmJNHospitalDoorSetting.btn_CloseClick(Sender: TObject);
begin
  close;
end;


procedure TfmJNHospitalDoorSetting.FormCreate(Sender: TObject);
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

procedure TfmJNHospitalDoorSetting.DeviceLoad(aList:TStringList;aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box: TComboBox; aType: string);
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

procedure TfmJNHospitalDoorSetting.FormClose(Sender: TObject;
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


function TfmJNHospitalDoorSetting.DupCheckCardReaderDoor(aNodeNo,aEcuID,aReaderNo,aDoorNo: string): Boolean;
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

function TfmJNHospitalDoorSetting.DupCheckCardReader(aNodeNo, aEcuID,
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


function TfmJNHospitalDoorSetting.CardReaderTypeCheck(aNodeNo, aEcuID,
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

procedure TfmJNHospitalDoorSetting.cmb_DeviceCodeChange(Sender: TObject);
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

procedure TfmJNHospitalDoorSetting.DoorSeach(aBuildingCode,aFloorCode,aAreaCode,aDoorID:string;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
  stDeviceName : string;
begin
  L_bScheduleChange := False;
  L_bTimeCodeChange := False;
  GridInit(sg_Door,2,2,True);
  State := 'SEARCH';

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
        AddCheckBox(0,nRow,False,False);
        Cells[1,nRow] := FindField('DO_DOORNONAME').AsString;
        Cells[2,nRow] := stDeviceName;
        Cells[3,nRow] := FindField('DO_DOORNO').AsString;
        if FindField('DO_FIRE').AsString = '1' then Cells[4,nRow] := '사용'
        else Cells[4,nRow] := '안함';
        Cells[5,nRow] := FindField('DO_FIRE').AsString;
        Cells[6,nRow] := FindField('DO_MODE').AsString;
        Cells[7,nRow] := FindField('DO_DOORTYPE').AsString;
        Cells[8,nRow] := FindField('DO_SCHUSE').AsString;
        Cells[9,nRow] := FindField('DO_CONTROLTIME').AsString;
        Cells[10,nRow] := FindField('DO_VIEWSEQ').AsString;
        Cells[11,nRow] := FindField('AC_NODENO').AsString;
        Cells[12,nRow] := FindField('AC_ECUID').AsString;
        Cells[13,nRow] := FindField('DO_CARDREADERTYPE').AsString;
        cells[14,nRow] := FindField('LO_DONGCODE').AsString;
        cells[15,nRow] := FindField('LO_FLOORCODE').AsString;
        cells[16,nRow] := FindField('LO_AREACODE').AsString;
        cells[17,nRow] := FindField('DO_LOCATEUSE').AsString;
        cells[18,nRow] := FindField('DO_TOTWIDTH').AsString;
        cells[19,nRow] := FindField('DO_TOTHEIGHT').AsString;
        cells[20,nRow] := FindField('DO_CURX').AsString;
        cells[21,nRow] := FindField('DO_CURY').AsString;
        cells[22,nRow] := FindField('DO_GUBUN').AsString;
        cells[23,nRow] := FindField('DO_TIMECODEUSE').AsString;

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
  if aTop <> 0 then
    sg_Door.topRow := aTop
  else
  begin
    if sg_Door.row > 17 then sg_Door.TopRow := sg_Door.row - 16;
  end;


end;


procedure TfmJNHospitalDoorSetting.LoadsAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sAreaCodeList.Clear;
  if (aBuildingCode = '') or (aBuildingCode = '000')  then  Exit;
  if (aFloorCode = '') or (aFloorCode = '000')  then Exit;

  cmb_Box.Items.Add('전체');
  sAreaCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

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

procedure TfmJNHospitalDoorSetting.LoadsBuildingCode(cmb_Box: TComboBox);
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
  
  cmb_Box.Items.Add('전체');
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

procedure TfmJNHospitalDoorSetting.LoadsFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sFloorCodeList.Clear;
  if (aBuildingCode = '') or (aBuildingCode = '000')  then Exit;

  cmb_Box.Items.Add('전체');
  sFloorCodeList.Add('000');
  cmb_Box.ItemIndex := 0;


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

procedure TfmJNHospitalDoorSetting.cmb_sBuildingCodeChange(Sender: TObject);
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

  RelayControlDoorSearch(stBuildingCode,'','',
            '',sg_RelayControlDoor.TopRow);

end;

procedure TfmJNHospitalDoorSetting.cmb_sFloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  if cmb_sBuildingCode.itemindex < 0 then
  begin
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  if cmb_sFloorCode.itemindex < 0 then
  begin
    Exit;
  end;
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);

  RelayControlDoorSearch(stBuildingCode,stFloorCode,'',
            '',sg_RelayControlDoor.TopRow);

end;

procedure TfmJNHospitalDoorSetting.FormShow(Sender: TObject);
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
  LoadsBuildingCode(cmb_sBuildingCode);
  DoorSeach(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_Door.TopRow);

  L_bScheduleChange := False;
  L_bTimeCodeChange := False;
end;


procedure TfmJNHospitalDoorSetting.cmb_sAreaCodeChange(Sender: TObject);
var
  stAreaCode : string;
  stBuildingCode : string;
  stFloorCode : string;
begin
  if cmb_sAreaCode.itemindex < 0 then
  begin
    Exit;
  end;
  if cmb_sBuildingCode.itemindex < 0 then
  begin
    Exit;
  end;
  if cmb_sFloorCode.itemindex < 0 then
  begin
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.itemIndex ];
  RelayControlDoorSearch(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_RelayControlDoor.TopRow);
end;

procedure TfmJNHospitalDoorSetting.ed_regDoorNameEnter(Sender: TObject);
var
  TIMC: HIMC;
  dwSentence : DWORD; dwConversion : DWORD;
begin
  TIMC := ImmGetContext(TEdit(Sender).Handle);
  ImmGetConversionStatus(TIMC, dwConversion, dwSentence);
  ImmSetConversionStatus(TIMC, IME_CMODE_NATIVE, dwSentence);
  ImmReleaseContext(TEdit(Sender).Handle, TIMC);
end;

procedure TfmJNHospitalDoorSetting.LoadBuildingCode(cmb_Box: TComboBox);
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

procedure TfmJNHospitalDoorSetting.LoadFloorCode(aBuildingCode: string;
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

procedure TfmJNHospitalDoorSetting.LoadAreaCode(aBuildingCode, aFloorCode: string;
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

procedure TfmJNHospitalDoorSetting.cmb_BuildingCode1Change(Sender: TObject);
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

procedure TfmJNHospitalDoorSetting.cmb_FloorCode1Change(Sender: TObject);
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

procedure TfmJNHospitalDoorSetting.cmb_AreaCode1Change(Sender: TObject);
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

procedure TfmJNHospitalDoorSetting.Panel1Resize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := Panel1.Width;
  nBlock := (nWidth - 200) div 6; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;

end;

procedure TfmJNHospitalDoorSetting.rg_TimeCodeClick(Sender: TObject);
begin
  inherited;
  L_bTimeCodeChange := True;
end;


procedure TfmJNHospitalDoorSetting.sg_DoorCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;
end;

procedure TfmJNHospitalDoorSetting.sg_RelayControlDoorCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;
end;

procedure TfmJNHospitalDoorSetting.AdvStrinGridSetAllCheck(Sender: TObject;bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmJNHospitalDoorSetting.RelayControlDoorSearch(aBuildingCode,
  aFloorCode, aAreaCode, aDoorID: string; aTop: integer);
var
  stSql : string;
  nRow : integer;
  stDeviceName : string;
begin
  GridInit(sg_RelayControlDoor,2,2,True);

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
  stSql := stSql + ' Inner Join TB_RELAYCONTROLDOOR c ';
  stSql := stSql + ' ON( a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  ';
  stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';

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
    sg_RelayControlDoor.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      if FindField('AC_DEVICENAME').AsString = '' then stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_MCUIP').AsString
      else stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_DEVICENAME').AsString;
      with sg_RelayControlDoor do
      begin
        AddCheckBox(0,nRow,False,False);
        Cells[1,nRow] := FindField('DO_DOORNONAME').AsString;
        Cells[2,nRow] := stDeviceName;
        Cells[3,nRow] := FindField('DO_DOORNO').AsString;
        if FindField('DO_FIRE').AsString = '1' then Cells[4,nRow] := '사용'
        else Cells[4,nRow] := '안함';
        Cells[5,nRow] := FindField('DO_FIRE').AsString;
        Cells[6,nRow] := FindField('DO_MODE').AsString;
        Cells[7,nRow] := FindField('DO_DOORTYPE').AsString;
        Cells[8,nRow] := FindField('DO_SCHUSE').AsString;
        Cells[9,nRow] := FindField('DO_CONTROLTIME').AsString;
        Cells[10,nRow] := FindField('DO_VIEWSEQ').AsString;
        Cells[11,nRow] := FindField('AC_NODENO').AsString;
        Cells[12,nRow] := FindField('AC_ECUID').AsString;
        Cells[13,nRow] := FindField('DO_CARDREADERTYPE').AsString;
        cells[14,nRow] := FindField('LO_DONGCODE').AsString;
        cells[15,nRow] := FindField('LO_FLOORCODE').AsString;
        cells[16,nRow] := FindField('LO_AREACODE').AsString;
        cells[17,nRow] := FindField('DO_LOCATEUSE').AsString;
        cells[18,nRow] := FindField('DO_TOTWIDTH').AsString;
        cells[19,nRow] := FindField('DO_TOTHEIGHT').AsString;
        cells[20,nRow] := FindField('DO_CURX').AsString;
        cells[21,nRow] := FindField('DO_CURY').AsString;
        cells[22,nRow] := FindField('DO_GUBUN').AsString;
        cells[23,nRow] := FindField('DO_TIMECODEUSE').AsString;

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
  if aTop <> 0 then
    sg_RelayControlDoor.topRow := aTop
  else
  begin
    if sg_RelayControlDoor.row > 17 then sg_RelayControlDoor.TopRow := sg_RelayControlDoor.row - 16;
  end;

end;

procedure TfmJNHospitalDoorSetting.btn_AddClick(Sender: TObject);
var
  bchkState : Boolean;
  DoorLoop : integer;
  stNodeNo,stECUID,stDoorNO : string;
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  inherited;
  btn_Add.Enabled := False;

  for DoorLoop := 1 to sg_Door.RowCount - 1 do   //체크되어 있는 출입문을 모두 추가함
  begin
    sg_Door.GetCheckBoxState(0,DoorLoop, bchkState);
    if bChkState then
    begin
      stNodeNo:= sg_Door.Cells[11,DoorLoop];
      stECUID:= sg_Door.Cells[12,DoorLoop];
      stDoorNO := sg_Door.Cells[3,DoorLoop];
      dmDBFunction.InsertIntoTB_RELAYCONTROLDOOR_Value(stNodeNo,stECUID,stDoorNO);
    end;
  end;

  if cmb_sBuildingCode.itemindex > 0 then stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  if cmb_sFloorCode.itemindex > 0 then  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
  if cmb_sAreaCode.itemindex > 0 then  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.itemIndex ];
  RelayControlDoorSearch(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_RelayControlDoor.TopRow);

  btn_Add.Enabled := True;
end;

procedure TfmJNHospitalDoorSetting.btn_DeleteClick(Sender: TObject);
var
  bchkState : Boolean;
  DoorLoop : integer;
  stNodeNo,stECUID,stDoorNO : string;
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  inherited;
  btn_Add.Enabled := False;

  for DoorLoop := 1 to sg_RelayControlDoor.RowCount - 1 do   //체크되어 있는 출입문을 모두 추가함
  begin
    sg_RelayControlDoor.GetCheckBoxState(0,DoorLoop, bchkState);
    if bChkState then
    begin
      stNodeNo:= sg_RelayControlDoor.Cells[11,DoorLoop];
      stECUID:= sg_RelayControlDoor.Cells[12,DoorLoop];
      stDoorNO := sg_RelayControlDoor.Cells[3,DoorLoop];
      dmDBFunction.DeleteTB_RELAYCONTROLDOOR_Key(stNodeNo,stECUID,stDoorNO);
    end;
  end;


  if cmb_sBuildingCode.itemindex > 0 then stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  if cmb_sFloorCode.itemindex > 0 then  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
  if cmb_sAreaCode.itemindex > 0 then  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.itemIndex ];
  RelayControlDoorSearch(stBuildingCode,stFloorCode,stAreaCode,
            '',sg_RelayControlDoor.TopRow);

  btn_Add.Enabled := True;
end;

initialization
  RegisterClass(TfmJNHospitalDoorSetting);
Finalization
  UnRegisterClass(TfmJNHospitalDoorSetting);

end.
