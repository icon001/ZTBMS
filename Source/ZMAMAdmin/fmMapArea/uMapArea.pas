unit uMapArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, RzEdit, Buttons,ADODB,ActiveX;

type
  TfmMapArea = class(TForm)
    Panel1: TPanel;
    cmb_Type: TComboBox;
    Label2: TLabel;
    gb_Location: TGroupBox;
    lb_sbuildingcode3: TLabel;
    cmb_BuildingCode: TComboBox;
    cmb_FloorCode: TComboBox;
    lb_sFloorCode3: TLabel;
    lb_Area: TLabel;
    cmb_AreaCode: TComboBox;
    gb_Map: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ce_Normalcolor: TRzColorEdit;
    ce_AlertColor: TRzColorEdit;
    btn_Apply: TSpeedButton;
    btn_Cancel: TSpeedButton;
    gb_alarm: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    cmb_Main: TComboBox;
    cmb_Local: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_TypeChange(Sender: TObject);
    procedure cmb_BuildingCodeChange(Sender: TObject);
    procedure cmb_FloorCodeChange(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_ApplyClick(Sender: TObject);
    procedure cmb_MainChange(Sender: TObject);
  private
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    NodeList : TStringList;
    DeviceList : TStringList;
    FPositionCode: string;
    FNormalColor: TColor;
    FAlertColor: TColor;
    FMapType: string;
    FAreaCode: string;
    FFloorCode: string;
    FBuildingCode: string;
    FRealName: string;
    FMapName: string;
    FNodeNo: string;
    FEcuID: string;
    FAlertImageName: string;
    FNormalImageName: string;
    FMaxPositionCode: string;
    { Private declarations }
    procedure LoadBuildingCode;
    procedure LoadFloorCode(aBuildingCode:string);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string);
    procedure MCULoad(cmb_Box:TComboBox);
    procedure DeviceLoad(aNodeNo:string;cmb_Box:TComboBox);
    Function GetNewPositionCode:string;
  public
    { Public declarations }
    property MaxPositionCode:string read FMaxPositionCode write FMaxPositionCode;
    property PositionCode:string read FPositionCode write FPositionCode;
    property NormalColor:TColor read FNormalColor write FNormalColor;
    property AlertColor:TColor read FAlertColor write FAlertColor;
    property NormalImageName : string read FNormalImageName write FNormalImageName;
    property AlertImageName : string read FAlertImageName write FAlertImageName;
    property MapType:string read FMapType write FMapType;
    property RealBuildingCode:string read FBuildingCode write FBuildingCode;
    property RealFloorCode:string read FFloorCode write FFloorCode;
    property RealAreaCode:string read FAreaCode write FAreaCode;
    property MapName : string read FMapName write FMapName;
    property NodeNo : string read FNodeNo write FNodeNo;
    property EcuID : string read FEcuID write FEcuID;
  end;

var
  fmMapArea: TfmMapArea;

implementation
uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

{ TfmMapArea }

procedure TfmMapArea.LoadBuildingCode;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_BuildingCode.Items.Clear;
  BuildingCodeList.Clear;

  stSql := 'Select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        cmb_BuildingCode.Items.Add(FindField('LO_NAME').AsString);
        BuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
      cmb_BuildingCode.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMapArea.FormCreate(Sender: TObject);
begin
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  NodeList := TStringList.Create;
  DeviceList := TStringList.Create;

  LoadBuildingCode;
  if cmb_BuildingCode.ItemIndex > -1 then LoadFloorCode(BuildingCodeList.Strings[cmb_BuildingCode.ItemIndex]);
  if cmb_FloorCode.ItemIndex > -1 then LoadAreaCode(BuildingCodeList.Strings[cmb_BuildingCode.ItemIndex],FloorCodeList.Strings[cmb_FloorCode.ItemIndex]);

  MCULoad(cmb_Main);
  if cmb_Main.Items.Count > 0 then
  begin
    DeviceLoad(NodeList.Strings[cmb_Main.itemIndex],cmb_Local);
  end;
  MapType := '';
end;

procedure TfmMapArea.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  NodeList.Free;
  DeviceList.Free;

end;

procedure TfmMapArea.LoadFloorCode(aBuildingCode: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_FloorCode.Items.Clear;
  FloorCodeList.Clear;

  stSql := 'Select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        cmb_FloorCode.Items.Add(FindField('LO_NAME').AsString);
        FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
      cmb_FloorCode.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMapArea.LoadAreaCode(aBuildingCode, aFloorCode: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_AreaCode.Items.Clear;
  AreaCodeList.Clear;

  stSql := 'Select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        cmb_AreaCode.Items.Add(FindField('LO_NAME').AsString);
        AreaCodeList.Add(FindField('LO_AREACODE').AsString);
        Next;
      end;
      cmb_AreaCode.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMapArea.cmb_TypeChange(Sender: TObject);
begin

  case cmb_Type.ItemIndex of
    0 :
      begin
        cmb_FloorCode.Visible := False;
        lb_sFloorCode3.Visible := False;
        cmb_AreaCode.Visible := False;
        lb_Area.Visible := False;
        gb_Location.Visible := True;
        gb_Map.Visible := True;
        gb_alarm.Visible := False;
      end;
    1 :
      begin
        cmb_FloorCode.Visible := True;
        lb_sFloorCode3.Visible := True;
        cmb_AreaCode.Visible := False;
        lb_Area.Visible := False;
        gb_Location.Visible := True;
        gb_Map.Visible := True;
        gb_alarm.Visible := False;
      end;
    2 :
      begin
        cmb_FloorCode.Visible := True;
        lb_sFloorCode3.Visible := True;
        cmb_AreaCode.Visible := True;
        lb_Area.Visible := True;
        gb_Location.Visible := True;
        gb_Map.Visible := True;
        gb_alarm.Visible := False;
      end;
    3 :
      begin
        gb_Location.Visible := False;
        //gb_Map.Visible := False;
        gb_Map.Align := alBottom;
        gb_alarm.Visible := True;
        gb_Map.Visible := True;
        gb_Map.Align := alTop;
      end;
    else
      begin
      end;
  end;
end;

procedure TfmMapArea.cmb_BuildingCodeChange(Sender: TObject);
begin  if cmb_BuildingCode.ItemIndex > -1 then LoadFloorCode(BuildingCodeList.Strings[cmb_BuildingCode.ItemIndex]);
  if cmb_FloorCode.ItemIndex > -1 then LoadAreaCode(BuildingCodeList.Strings[cmb_BuildingCode.ItemIndex],FloorCodeList.Strings[cmb_FloorCode.ItemIndex]);

end;

procedure TfmMapArea.cmb_FloorCodeChange(Sender: TObject);
begin
  if cmb_FloorCode.ItemIndex > -1 then LoadAreaCode(BuildingCodeList.Strings[cmb_BuildingCode.ItemIndex],FloorCodeList.Strings[cmb_FloorCode.ItemIndex]);

end;

procedure TfmMapArea.btn_CancelClick(Sender: TObject);
begin
  MapType := '';
  Close;
end;

procedure TfmMapArea.btn_ApplyClick(Sender: TObject);
begin
  if cmb_Type.ItemIndex = 0 then
  begin
    if cmb_BuildingCode.Items.Count < 1 then
    begin
      showmessage('실제 사용되는 빌딩코드를 입력 하셔야 합니다.');
      Exit;
    end;
    MapName := cmb_BuildingCode.Text;
  end else if cmb_Type.ItemIndex = 1 then
  begin
    if cmb_FloorCode.Items.Count < 1 then
    begin
      showmessage('실제 사용되는 층코드를 입력 하셔야 합니다.');
      Exit;
    end;
    MapName := cmb_FloorCode.Text;
  end else if cmb_Type.ItemIndex = 2 then
  begin
    if cmb_AreaCode.Items.Count < 1 then
    begin
      showmessage('실제 사용되는 구역코드를 입력 하셔야 합니다.');
      Exit;
    end;
    MapName := cmb_AreaCode.Text;
  end else if cmb_Type.ItemIndex = 3 then
  begin
    if cmb_Local.Items.Count < 1 then
    begin
      showmessage('방범구역 기기를 선택 하셔야 합니다.');
      Exit;
    end;
    MapName := cmb_Local.Text;
    NodeNo := inttostr(strtoint(copy(DeviceList.Strings[cmb_Local.ItemIndex],1,3)));
    EcuID := copy(DeviceList.Strings[cmb_Local.ItemIndex],4,2);
  end;
  Try
    PositionCode := GetNewPositionCode;
    NormalColor := ce_Normalcolor.SelectedColor;
    AlertColor := ce_AlertColor.SelectedColor;
    MapType := inttostr(cmb_Type.ItemIndex + 1);
    RealBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemindex];
    if cmb_Type.ItemIndex < 1 then Exit;
    RealFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemindex];
    if cmb_Type.ItemIndex < 2 then Exit;
    RealAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemindex];

  Finally
    Close;
  End;
end;

function TfmMapArea.GetNewPositionCode: string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  nPositionCode : integer;
begin
  if isDigit(MaxPositionCode) then
  begin
    result := inttostr(strtoint(MaxPositionCode) + 1);
    Exit;
  end;
  stSql := 'Select Max(mp_seq) as mp_seq from TB_MAPPOSITION ';
  nPositionCode := 0;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      nPositionCode := FindField('mp_seq').asInteger;
    end;
  Finally
    result := inttostr(nPositionCode + 1);
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMapArea.DeviceLoad(aNodeNo: string; cmb_Box: TComboBox);
var
  stSql : string;
  stDeviceName : string;
  stDeviceID : string;
  TempAdoQuery :TADOQuery;
begin
  DeviceList.Clear;
  cmb_Box.Clear;

  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' order by AC_NODENO,AC_ECUID ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        stDeviceName := FindField('AL_ZONENAME').AsString;
        cmb_Box.Items.Add(stDeviceName);
        stDeviceID := FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString;
        DeviceList.Add(stDeviceID);
        Next;
      end;
      cmb_Box.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;


end;

procedure TfmMapArea.MCULoad(cmb_Box: TComboBox);
var
  stSql : string;
  stDeviceName : string;
  TempAdoQuery :TADOQuery;
begin
  NodeList.Clear;
  cmb_Box.Clear;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  stSql := stSql + ' order by AC_NODENO,AC_ECUID ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        if FindField('AC_DEVICENAME').AsString = '' then stDeviceName := FindField('AC_MCUIP').AsString
        else stDeviceName := FindField('AC_DEVICENAME').AsString;
        cmb_Box.Items.Add(stDeviceName);
        NodeList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3));
        Next;
      end;
      cmb_Box.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMapArea.cmb_MainChange(Sender: TObject);
begin
  if cmb_Main.Items.Count > 0 then
  begin
    DeviceLoad(NodeList.Strings[cmb_Main.itemIndex],cmb_Local);
  end;

end;

end.
