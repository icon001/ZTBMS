unit uMapSensor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,ADODB,ActiveX, Buttons, Mask, RzEdit, ExtDlgs;

type
  TfmMapSensor = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    cmb_Type: TComboBox;
    gb_alarm: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    cmb_Main: TComboBox;
    cmb_Local: TComboBox;
    Label3: TLabel;
    cmb_Zone: TComboBox;
    gb_Map: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    ce_Normalcolor: TRzColorEdit;
    ce_AlertColor: TRzColorEdit;
    gb_Image: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    btn_NormalIcon: TSpeedButton;
    btn_Alert: TSpeedButton;
    Panel2: TPanel;
    NormalImage: TImage;
    Panel3: TPanel;
    AlertImage: TImage;
    btn_Cancel: TSpeedButton;
    btn_Apply: TSpeedButton;
    OpenPictureDialog: TOpenPictureDialog;
    ed_NormalImage: TEdit;
    ed_AlertImage: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_MainChange(Sender: TObject);
    procedure cmb_LocalChange(Sender: TObject);
    procedure cmb_TypeChange(Sender: TObject);
    procedure btn_ApplyClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_NormalIconClick(Sender: TObject);
    procedure btn_AlertClick(Sender: TObject);
  private
    FSensorType: integer;
    NodeList : TStringList;
    DeviceList : TStringList;
    ZoneList : TStringList;
    FAreaCode: string;
    FFloorCode: string;
    FRealName: string;
    FMapType: string;
    FAlertImageName: string;
    FEcuID: string;
    FNormalImageName: string;
    FBuildingCode: string;
    FMapName: string;
    FNodeNo: string;
    FNormalColor: TColor;
    FAlertColor: TColor;
    FZoneNum: string;
    procedure SetSenSorType(const Value: integer);
    { Private declarations }
    procedure MCULoad(cmb_Box:TComboBox);
    procedure DeviceLoad(aNodeNo:string;cmb_Box:TComboBox);
    procedure ZoneLoad(aNodeNo,aEcuID:string;cmb_Box:TComboBox);
  public
    { Public declarations }
    property SensorType :integer read FSensorType write SetSenSorType;
    property NormalColor:TColor read FNormalColor write FNormalColor;
    property AlertColor:TColor read FAlertColor write FAlertColor;
    property NormalImageName : string read FNormalImageName write FNormalImageName;
    property AlertImageName : string read FAlertImageName write FAlertImageName;
    property MapType:string read FMapType write FMapType;
    property RealBuildingCode:string read FBuildingCode write FBuildingCode;
    property RealFloorCode:string read FFloorCode write FFloorCode;
    property RealAreaCode:string read FAreaCode write FAreaCode;
    property RealName:string read FRealName write FRealName;
    property MapName : string read FMapName write FMapName;
    property NodeNo : string read FNodeNo write FNodeNo;
    property EcuID : string read FEcuID write FEcuID;
    property ZoneNum : string read FZoneNum write FZoneNum;
  end;

var
  fmMapSensor: TfmMapSensor;

implementation
uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TfmMapSensor.SetSenSorType(const Value: integer);
begin
  FSensorType := Value;
  if cmb_Type.ItemIndex <> (Value - 5) then
    cmb_Type.ItemIndex := Value - 5;
    
  case Value - 5 of
    0 :
      begin
        gb_Map.Visible := True;
        gb_Image.Visible := False;
      end;
    1 :
      begin
        gb_Map.Visible := False;
        gb_Image.Visible := True;
      end;
    else
      begin
        gb_Map.Visible := True;
        gb_Image.Visible := False; 
      end;
  end;
end;

procedure TfmMapSensor.FormCreate(Sender: TObject);
begin
  NodeList := TStringList.Create;
  DeviceList := TStringList.Create;
  ZoneList := TStringList.Create;
  MCULoad(cmb_Main);
  if cmb_Main.Items.Count > 0 then
  begin
    DeviceLoad(NodeList.Strings[cmb_Main.itemIndex],cmb_Local);
  end;
  if cmb_Local.Items.Count > 0 then
  begin
    ZoneLoad(copy(DeviceList.Strings[cmb_Local.itemIndex],1,3),copy(DeviceList.Strings[cmb_Local.itemIndex],4,2),cmb_Zone);
  end;
  NormalImage.Picture.LoadFromFile('..\Image\1.bmp');
  ed_NormalImage.Text := '..\Image\1.bmp';
  AlertImage.Picture.LoadFromFile('..\Image\2.bmp');
  ed_AlertImage.Text := '..\Image\2.bmp';

end;

procedure TfmMapSensor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  NodeList.Free;
  DeviceList.Free;
  ZoneList.Free;
end;

procedure TfmMapSensor.DeviceLoad(aNodeNo: string; cmb_Box: TComboBox);
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

procedure TfmMapSensor.MCULoad(cmb_Box: TComboBox);
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

procedure TfmMapSensor.ZoneLoad(aNodeNo, aEcuID: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  stDeviceName : string;
  stDeviceID : string;
  TempAdoQuery :TADOQuery;
begin
  ZoneList.Clear;
  cmb_Box.Clear;

  stSql := 'select * from TB_ZONEDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' order by AC_NODENO,AC_ECUID,AL_ZONENUM ';
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
        stDeviceID := FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString + FindField('AL_ZONENUM').AsString;
        ZoneList.Add(stDeviceID);
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

procedure TfmMapSensor.cmb_MainChange(Sender: TObject);
begin
  if cmb_Main.Items.Count > 0 then
  begin
    DeviceLoad(NodeList.Strings[cmb_Main.itemIndex],cmb_Local);
  end;
  if cmb_Local.Items.Count > 0 then
  begin
    ZoneLoad(copy(DeviceList.Strings[cmb_Local.itemIndex],1,3),copy(DeviceList.Strings[cmb_Local.itemIndex],4,2),cmb_Zone);
  end;

end;

procedure TfmMapSensor.cmb_LocalChange(Sender: TObject);
begin
  if cmb_Local.Items.Count > 0 then
  begin
    ZoneLoad(copy(DeviceList.Strings[cmb_Local.itemIndex],1,3),copy(DeviceList.Strings[cmb_Local.itemIndex],4,2),cmb_Zone);
  end;

end;

procedure TfmMapSensor.cmb_TypeChange(Sender: TObject);
begin
  SenSorType := cmb_Type.ItemIndex + 5;
end;

procedure TfmMapSensor.btn_ApplyClick(Sender: TObject);
begin
  if cmb_Zone.Items.Count = 0 then
  begin
    showmessage('감지기 추가시 실제 감지기를 선택해 주셔야 합니다.');
    Exit;
  end;
  NormalColor := ce_Normalcolor.Color;
  AlertColor := ce_AlertColor.Color;
  NormalImageName := ed_NormalImage.Text;
  AlertImageName := ed_AlertImage.Text;
  MapType := inttostr(SensorType);
  RealBuildingCode := '';
  RealFloorCode := '';
  RealAreaCode := '';
  MapName := cmb_Zone.Text;

  NodeNo := copy(ZoneList.Strings[cmb_Zone.ItemIndex],1,3);
  EcuID := copy(ZoneList.Strings[cmb_Zone.ItemIndex],4,2);
  ZoneNum := copy(ZoneList.Strings[cmb_Zone.ItemIndex],6,1);

  Close;
end;

procedure TfmMapSensor.btn_CancelClick(Sender: TObject);
begin
  SensorType := -1;
  Close;

end;

procedure TfmMapSensor.btn_NormalIconClick(Sender: TObject);
begin
  OpenPictureDialog.Filter := 'BMP files (*.bmp)|*.bmp';
  if OpenPictureDialog.Execute then
  begin
    //NormalImage.Stretch := False;
    ed_NormalImage.Text := OpenPictureDialog.FileName;
    NormalImage.Picture.LoadFromFile(ed_NormalImage.Text);
    //NormalImage.Stretch := True;
    //NormalImage.Repaint;
  end;

end;

procedure TfmMapSensor.btn_AlertClick(Sender: TObject);
begin
  OpenPictureDialog.Filter := 'BMP files (*.bmp)|*.bmp';
  if OpenPictureDialog.Execute then
  begin
    ed_AlertImage.Text := OpenPictureDialog.FileName;
    AlertImage.Picture.LoadFromFile(ed_AlertImage.Text);
    AlertImage.Stretch := True;
  end;

end;

end.
