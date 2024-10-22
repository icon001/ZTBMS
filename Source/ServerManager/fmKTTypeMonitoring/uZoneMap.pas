unit uZoneMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, uSubForm, CommandArray, StdCtrls, ImgList,
  ToolPanels, Shader, ActnList, Menus, Grids, BaseGrid, AdvGrid,Clipbrd,
  Buttons,ADODB,ActiveX, DB,iniFiles, MPlayer,uDataModule1, RzButton,
  DBGrids, RXDBCtrl, RzTabs, RzLabel, RzPanel, RzSplit,GIFImage, AdvObj;


type
  TfmZoneMap = class(TfmASubForm)
    ActionList1: TActionList;
    Action_LoctionLoad: TAction;
    Action_DeviceLoad: TAction;
    Action_DoorLoad: TAction;
    Action_AlarmLoad: TAction;
    Action_FoodLoad: TAction;
    toolslist: TImageList;
    Action_RecvData: TAction;
    Action_Reload: TAction;
    Action_SensorLoad: TAction;
    ADOAlarmQuery: TADOQuery;
    Action_intAlarmHistory: TAction;
    Action_AlarmHistory: TAction;
    MessageTimer: TTimer;
    ADOQuery1: TADOQuery;
    pan_Message: TPanel;
    btn_AlarmConfirm: TSpeedButton;
    st_Message: TStaticText;
    PageControl2: TPageControl;
    BuildingTab: TTabSheet;
    pan_Map: TPanel;
    ImageMap: TImage;
    Image104: TImage;
    Image103: TImage;
    Image101: TImage;
    Image102: TImage;
    Image78: TImage;
    Image52: TImage;
    Image51: TImage;
    Image49: TImage;
    Image50: TImage;
    Image77: TImage;
    Image76: TImage;
    Image48: TImage;
    Image47: TImage;
    Image23: TImage;
    Image46: TImage;
    Image75: TImage;
    Image100: TImage;
    Image74: TImage;
    Image45: TImage;
    Image22: TImage;
    Image21: TImage;
    Image44: TImage;
    Image73: TImage;
    Image99: TImage;
    Image98: TImage;
    Image72: TImage;
    Image43: TImage;
    Image20: TImage;
    Image19: TImage;
    Image42: TImage;
    Image71: TImage;
    Image97: TImage;
    Image96: TImage;
    Image70: TImage;
    Image41: TImage;
    Image18: TImage;
    Image17: TImage;
    Image40: TImage;
    Image69: TImage;
    Image95: TImage;
    Image94: TImage;
    Image68: TImage;
    Image39: TImage;
    Image16: TImage;
    Image15: TImage;
    Image38: TImage;
    Image67: TImage;
    Image93: TImage;
    Image92: TImage;
    Image66: TImage;
    Image37: TImage;
    Image14: TImage;
    Image13: TImage;
    Image36: TImage;
    Image65: TImage;
    Image91: TImage;
    Image90: TImage;
    Image64: TImage;
    Image35: TImage;
    Image12: TImage;
    Image11: TImage;
    Image34: TImage;
    Image63: TImage;
    Image89: TImage;
    Image88: TImage;
    Image62: TImage;
    Image33: TImage;
    Image10: TImage;
    Image9: TImage;
    Image32: TImage;
    Image61: TImage;
    Image87: TImage;
    Image86: TImage;
    Image60: TImage;
    Image31: TImage;
    Image8: TImage;
    Image7: TImage;
    Image30: TImage;
    Image59: TImage;
    Image85: TImage;
    Image84: TImage;
    Image58: TImage;
    Image29: TImage;
    Image6: TImage;
    Image5: TImage;
    Image28: TImage;
    Image57: TImage;
    Image83: TImage;
    Image82: TImage;
    Image56: TImage;
    Image27: TImage;
    Image4: TImage;
    Image3: TImage;
    Image26: TImage;
    Image55: TImage;
    Image81: TImage;
    Image80: TImage;
    Image54: TImage;
    Image25: TImage;
    Image2: TImage;
    Image1: TImage;
    Image24: TImage;
    Image53: TImage;
    Image79: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mn_FullMapClick(Sender: TObject);
    procedure mn_BasicMapClick(Sender: TObject);
    procedure mn_DisArmModeChangeClick(Sender: TObject);
    procedure mn_AlarmConfirmClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
  private
    L_bFirst : Boolean;
    L_stSelectNodeNO : string;
    L_stSelectECUID : string;
    L_stSelectNO : string;
    L_nLocationPer : integer;
    L_nStatePer : integer;
    L_stMapHeigh : string;
    L_stMapwidth : string;
    FBuildingCode: String;
    procedure SetBuildingCode(const Value: String);
  private
    procedure MemoryCreate;
    procedure MemoryDestory;
    procedure iniConfigRead;
    procedure MapSize;

  public
    DeviceCodeList : TStringList; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
    DeviceCaptionList : TStringList; //기기명을 가지고 있다.
    DeviceLastTimeList : TStringList; //마지막 접속시간을 가지고 있다.
    DoorCodeList : TStringList;   // Door코드를 가지고 있다
    intDoorCodeList : TStringList;   // Door코드를 가지고 있다
    DoorLocateList : TStringList; // Door의 위치정보를 가지고 있다. (000000000위치정보)
    AlarmCodeList : TStringList;  //방범 코드를 가지고 있다.
    intAlarmCodeList : TStringList;  //방범 코드를 가지고 있다.
    AlarmNoList : TStringList;
    SensorCodeList : TStringList;  //센서 코드를 가지고 있다.
    AlarmLocateList : TStringList; //방범기기의 위치정보를 가지고 있다. (000000000위치정보)
    FoodCodeList : TStringList;   //식수 코드를 가지고 있다.
    FoodCodeNameList : TStringList; //식수명을 가지고 있다.
    FoodLocateList : TStringList;  //식수기기의 위치정보를 가지고 있다.(000000000위치정보)
    CompanyCodeList : TStringList; //회사코드를 가지고 있다.
    CompanyNameList : TStringList; //회사명칭을 가지고 있다.
    JijumCodeList : TStringList; //지점코드를 가지고 있다.
    JijumNameList : TStringList; //지점명칭을 가지고 있다.
    DepartCodeList : TStringList; //부서코드를 가지고 있다.
    DepartNameList : TStringList; //부서명칭을 가지고 있다.

    DoorIndexArray: Array of integer; //출입문 리스트 순서 배열
    relDoorIndexArray:Array of integer; //실제 위치
    IntDoorIndexArray:Array of integer; //통합 출입문 리스트 순서 배열
    relIntDoorIndexArray:Array of integer; //통합 출입문 실제 위치
    AlarmDoorIndexArray:Array of integer; //방범 출입문 리스트 순서 배열
    relAlarmDoorIndexArray:Array of integer; //방범 출입문 실제 위치

    AlarmIndexArray: Array of integer; //알람 리스트 순서 배열
    relAlarmIndexArray:Array of integer; //실제 위치
    IntAlarmIndexArray:Array of integer; //통합 알람 리스트 순서 배열
    relIntAlarmIndexArray:Array of integer; //통합 알람 실제 위치
    
  private
    { Private declarations }
    DeviceNameList:TStringList;
    LocationDeviceList:TStringList;
    LocationImageList : TStringList;
    AlarmZoneList : TStringList;
    L_stSelectBuildingName : string;


    Function MapLoad(aBuildingCode, aFloorCode,aSectorCode:string):Boolean;
    procedure SetDevice(aImage:TImage;aType,aName,aXPosition,aYPosition,aXSize,aYSize:string;
                        dmDeviceManageMode : TDoorManageMode;
                        dsDoorState        : TDoorDSState;
                        dlDoorLockState    : TDoorLockState;
                        dpDoorPNMode       : TDoorPNMode;
                        wmDeviceWatchmode  : TWatchMode;
                        aeDeviceAlarmEvent : TAlarmEventState;
                        nDevicePos:integer;bFirst :Boolean = True);
    procedure ImageStateChange(aImage:TImage;aType,aLastMode,aLastState,aLastPosi:string);
    Function TravelImageItem(aImage:string):TImage;
    procedure LocationMapShow(aBuildingCode, aFloorCode,aSectorCode:string;bFirst:Boolean= True);
    procedure ImageMapHide;
    procedure AlarmModeChanged(aNodeNo,aEcuID,aPortNo:string);
  public
    { Public declarations }
    bLocationMapShow : Boolean;
    bDeviceMapShow : Boolean;
    property BuildingCode : String read FBuildingCode write SetBuildingCode;
    procedure Add_AlarmArea(aNodeNo,aEcuID,aPortNo:string);
  end;

var
  fmZoneMap: TfmZoneMap;


implementation

uses
  uLomosUtil,
  uLocationMap,
  uDeviceMap,
  uDeviceInfo,
  uZonePosition, uMDBSql, uPostGreSql, uMssql, uAlarmSet, uAlarmHistory,
  uFireBird,UCommonModule,
  uMonitoringCommonVariable,
  uDeviceState, uAlarmConfirm,
  uMain;
{$R *.dfm}




procedure TfmZoneMap.FormCreate(Sender: TObject);
var
  i : integer;
begin
  MemoryCreate;
  iniConfigRead;
  MapSize;

  L_bFirst := True;

end;

procedure TfmZoneMap.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindClassForm('TfmKTTypeMonitoring').FindCommand('ZONEMAPCLOSE').Params.Values['Data'] := BuildingCode;
  self.FindClassForm('TfmKTTypeMonitoring').FindCommand('ZONEMAPCLOSE').Execute;
  MemoryDestory;
end;

procedure TfmZoneMap.FormShow(Sender: TObject);
begin


  bLocationMapShow := False;
  bDeviceMapShow := False;

  Application.ProcessMessages;

end;


procedure TfmZoneMap.FormActivate(Sender: TObject);
begin
  st_Message.Font.Size := G_nAlarmMessageFontSize;

end;


procedure TfmZoneMap.FormResize(Sender: TObject);
begin
  LocationMapShow(copy(BuildingCode,1,3),copy(BuildingCode,4,3),copy(BuildingCode,7,3),False);
  CenterPanel;
end;


function TfmZoneMap.MapLoad(aBuildingCode, aFloorCode,
  aSectorCode: string): Boolean;
var
  stSql : string;
  stImage : string;
  TempAdoQuery :TADOQuery;
begin

  result := False;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' Where LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' AND LO_AREACODE = ''' + aSectorCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if recordCount < 1 then exit;
      if FindField('LO_IMAGEUSE').AsString <> 'Y' then Exit;

      if DBType = 'MSSQL' then
      begin
        JPEGLoadFromDB(FieldByName('LO_CADIMAGE'), ImageMap);
      end else
      begin
        stImage := FindField('LO_CADIMAGE').AsString;
        if FileExists(stImage) then
          ImageMap.Picture.LoadFromFile(stImage);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  result := True;
end;


procedure TfmZoneMap.SetDevice(aImage: TImage; aType, aName,
  aXPosition, aYPosition, aXSize, aYSize: string;
  dmDeviceManageMode: TDoorManageMode; dsDoorState: TDoorDSState;
  dlDoorLockState: TDoorLockState; dpDoorPNMode: TDoorPNMode;
  wmDeviceWatchmode: TWatchMode; aeDeviceAlarmEvent: TAlarmEventState;
  nDevicePos: integer; bFirst: Boolean);
var
  stImage : string;
  nCurTotWidth,nCurTotHeight : integer;
  nCurX,nCurY :integer;
  gif :TGifImage;
begin
  if bFirst then
  begin
    stImage := ExeFolder + '\..\Resource\';
    if aType = '1' then stImage := stImage + MCUBMP;
    if aType = '2' then stImage := stImage + ECUBMP;
    if aType = '3' then
    begin
      case dmDeviceManageMode of
        dmManager :
          begin
            if dsDoorState = dsClose then stImage := stImage + DOOROPERCLOSE
            else if dsDoorState = dsOpen then stImage := stImage + DOOROPEROPEN
            else stImage := stImage + QUESTION;
          end;
        dmOpen :
          begin
            if dsDoorState = dsClose then stImage := stImage + DOORNOTOPERCLOSE
            else if dsDoorState = dsOpen then stImage := stImage + DOORNOTOPEROPEN
            else stImage := stImage + QUESTION;
          end;
        dmLock :
          begin
            if dsDoorState = dsClose then stImage := stImage + SHUTCLOSE
            else if dsDoorState = dsOpen then stImage := stImage + SHUTOPEN
            else stImage := stImage + QUESTION;
          end;
        else
          begin
            stImage := stImage + QUESTION;
          end;
      end;
    end;
    if aType = '4' then
    begin
(*      if (aeDeviceAlarmEvent = aeAlarmEvent) then
      begin
        stImage := stImage + MAPALARM;
      end else
      begin
        case  wmDeviceWatchmode of
          cmArm : begin stImage := stImage + MAPARM end;
          cmDisarm : begin stImage := stImage + MAPDISARM end;
          else begin stImage := stImage + MAPQUESTION end;
        end;
      end;
*)
      if aeDeviceAlarmEvent = aeAlarmEvent then stImage := stImage + MAPALARM
      else stImage := stImage + MAPDISARM;
    end;

    if aType = '5' then stImage := stImage + FOODBMP;
    if FileExists(stImage) then
    begin
      if aType = '4' then   //Gif Load
      begin
        Try
          gif := TGifImage.Create;
          gif.LoadFromFile(stImage);
          aImage.Picture.Assign(gif);
        Finally
          gif.Free;
        End;
      end else
        aImage.Picture.LoadFromFile(stImage);
    end;
    aImage.Visible := True;
  end;

  if Trim(aXPosition) = '' then aXPosition := '0';
  if Trim(aYPosition) = '' then aYPosition := '0';
  aImage.Top := 0;
  aImage.Left := 0;

  nCurTotWidth := ImageMap.Width;
  nCurTotHeight := ImageMap.Height;

  if (aXSize = '') or (aXSize = '0') then nCurX := 0
  else  nCurX := (strtoint(aXPosition) * nCurTotWidth ) Div  strtoint(aXSize) ;
  if (aYSize = '') or (aYSize = '0') then nCurY := 0
  else nCurY := (strtoint(aYPosition) * nCurTotHeight ) Div strtoint(aYSize);

  aImage.Top := nCurY;
  aImage.Left := nCurX;
  aImage.Hint := aName;
  aImage.Tag := nDevicePos;

end;

procedure TfmZoneMap.ImageStateChange(aImage: TImage; aType,
  aLastMode, aLastState, aLastPosi: string);
var
  stImage : string;
begin
  stImage := ExeFolder + '\..\Resource\';

  if aType = '3' then
  begin
    //stImage := stImage + DOORBMP;
    if aLastMode = '0' then   //운영모드이면
    begin
      if aLastState = 'C' then stImage := stImage + DOOROPERCLOSE
      else stImage := stImage + DOOROPEROPEN;
    end else
    begin
      if aLastState = 'C' then stImage := stImage + DOORNOTOPERCLOSE
      else stImage := stImage + DOORNOTOPEROPEN;
    end;
  end;
  if aType = '4' then
  begin
    //stImage := stImage + ALARMBMP;
    if aLastMode = 'A' then
    begin
      if aLastState = '1' then stImage := stImage + WARNINGALARM
      else stImage := stImage + WATCHALARM;
    end
    else  stImage := stImage + NOTWATCHALARM;
  end;
  if FileExists(stImage) then
  aImage.Picture.LoadFromFile(stImage);
  aImage.Visible := True;
  aImage.Refresh;
end;

function TfmZoneMap.TravelImageItem(aImage: string): TImage;
var
  Loop:integer;
begin
  Result:= Nil;
  For Loop:=0 to pan_Map.ControlCount-1 do
  Begin
    If LowerCase(pan_Map.Controls[Loop].name) = LowerCase(aImage) then
    Begin
      Result:=TImage(pan_Map.Controls[Loop]);
      exit;
    End;
  End;

end;

procedure TfmZoneMap.Image1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  nDevicePos : integer;
  stType : string;
begin
  nDevicePos := TImage(Sender).Tag;
  stType := copy(LocationDeviceList.Strings[nDevicePos],1,1);
  L_stSelectNodeNO := copy(LocationDeviceList.Strings[nDevicePos],2,3);
  L_stSelectECUID := copy(LocationDeviceList.Strings[nDevicePos],5,2);
  L_stSelectNO := copy(LocationDeviceList.Strings[nDevicePos],7,3);
end;

procedure TfmZoneMap.LocationMapShow(aBuildingCode, aFloorCode,aSectorCode:string;bFirst: Boolean);
var
  stSql : string;
  bResult :boolean;
  nRow : integer;
  aImage : TImage;
  stSeq : string;
  stDeviceID : string;
  nArmAreaIndex : integer;
  nDoorIndex : integer;
  dmDeviceManageMode : TDoorManageMode;
  dsDoorState        : TDoorDSState;
  dlDoorLockState    : TDoorLockState;
  dpDoorPNMode       : TDoorPNMode;
  wmDeviceWatchmode  : TWatchMode;
  aeDeviceAlarmEvent : TAlarmEventState;
begin
  if bFirst then
  begin
    bResult := MapLoad(aBuildingCode, aFloorCode,aSectorCode);
    if Not bResult then
    begin
      showmessage('해당위치에 Map이 등록되어 있지 않습니다.');
      //Close;
      exit;
    end;
    ImageMapHide;
  end;

  stSql := '';
  //해당위치의 존 찾자
  stSql := stSql + ' select ''4'' as TYPE,a.AC_NODENO,a.AC_ECUID,a.AL_ZONENUM as SEQ, '; //a.AL_DEVICENO as SEQ, ';
  stSql := stSql + ' a.AL_ZONENAME as NAME,a.AL_TOTWIDTH as TOTW,a.AL_TOTHEIGHT as TOTH,';
  stSql := stSql + ' a.AL_CURX as CURX,a.AL_CURY as CURY,''0'' as LASTMODE, ';
  stSql := stSql + ' ''0'' as LASTSTATE,''0'' as LASTPOSI ';
  stSql := stSql + ' FROM TB_ZONEDEVICE a ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' AND a.LO_AREACODE = ''' + aSectorCode + ''' ';
  stSql := stSql + ' AND a.al_locateuse = ''Y'' ';
  //stSql := stSql + ' AND a.AR_USE = ''Y'' ';
  with AdoQuery1 do
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
    nRow := 1;
    DeviceNameList.Clear;
    LocationDeviceList.Clear;
    LocationImageList.Clear;
    while Not Eof do
    begin
      if nRow > 104 then
      begin
        if L_bFirst then
          showmessage('한층의 최대 표현 갯수는 104개입니다.');
        
        Break;
      end;
      DeviceNameList.Add(FindField('NAME').AsString);
      stSeq := FindField('SEQ').asString;
      if Not IsDigit(stSeq) then stSeq := '0';
      stDeviceID := FillZeroNumber(FindField('AC_NODENO').asInteger,3) + FindField('AC_ECUID').AsString;
      LocationDeviceList.Add(FindField('TYPE').AsString
                             + stDeviceID
                             + FillZeroNumber(strtoint(stSeq),3));

      if FindField('TYPE').AsString = '3' then //출입문
      begin
        nDoorIndex := DoorStateList.IndexOf(stDeviceID + inttostr(strtoint(stSeq)));
        if nDoorIndex > -1 then
        begin
          dmDeviceManageMode := TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode;
          dsDoorState := TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState;
          dlDoorLockState := TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState;
          dpDoorPNMode := TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode;
        end;
        wmDeviceWatchmode := cmNothing;
        aeDeviceAlarmEvent := aeNothing;
      end else if FindField('TYPE').AsString = '4' then //방범구역
      begin
        dmDeviceManageMode := dmNothing;
        dsDoorState := dsNothing;
        dlDoorLockState := lsNothing;
        dpDoorPNMode := pnNothing;
        if AlarmZoneList.IndexOf(FindField('TYPE').AsString
                             + stDeviceID
                             + inttostr(strtoint(stSeq))) > -1 then
        begin
          aeDeviceAlarmEvent := aeAlarmEvent;
        end;
      end;

      LocationImageList.Add('Image'+inttostr(nRow));
      aImage := TravelImageItem('Image' + inttostr(nRow));
      if aImage <> nil then
      begin
        SetDevice(aImage,
                  FindField('TYPE').AsString,
                  FindField('NAME').AsString,
                  FindField('CURX').AsString,
                  FindField('CURY').AsString,
                  FindField('TOTW').AsString,
                  FindField('TOTH').AsString,
                  dmDeviceManageMode,
                  dsDoorState,
                  dlDoorLockState,
                  dpDoorPNMode,
                  wmDeviceWatchmode,
                  aeDeviceAlarmEvent,
                  LocationDeviceList.Count - 1,bFirst);
      end;
      inc(nRow);
      Next;
    end;
  end;
end;



procedure TfmZoneMap.mn_FullMapClick(Sender: TObject);
begin
  fmMain.ToolBar1.Visible := False;
  fmMain.Menu := nil;
  fmMain.StatusBar1.Visible := False;

end;

procedure TfmZoneMap.mn_BasicMapClick(Sender: TObject);
begin
  fmMain.ToolBar1.Visible := True;
  fmMain.Menu := fmMain.MainMenu1;
  fmMain.StatusBar1.Visible := True;

end;

procedure TfmZoneMap.ImageMapHide;
var
  nRow : integer;
  aImage : TImage;
begin
  for nRow := 1 to 104 do
  begin                   
    aImage := TravelImageItem('Image' + inttostr(nRow));
    if aImage <> nil then
    begin
      aImage.Visible := False;
    end;
  end;

end;

procedure TfmZoneMap.mn_DisArmModeChangeClick(Sender: TObject);
var
  stAlarmID : string;
begin
  stAlarmID:= L_stSelectNodeNO + L_stSelectECUID + inttostr(strtoint(L_stSelectNO));

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmZoneMap.mn_AlarmConfirmClick(Sender: TObject);
var
  stDeviceID : string;
  nDeviceIndex : integer;
begin
  stDeviceID:= L_stSelectNodeNO + L_stSelectECUID ;

  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then Exit;
  TDeviceState(DeviceStateList.Objects[nDeviceIndex]).AlaramEventClear;
  AlarmModeChanged(L_stSelectNodeNO,L_stSelectECUID,L_stSelectNo);
end;

procedure TfmZoneMap.MemoryCreate;
begin
  DeviceCodeList := TStringList.Create;
  DeviceCaptionList := TStringList.Create;
  DeviceLastTimeList := TStringList.Create;
  DoorCodeList := TStringList.Create;
  intDoorCodeList := TStringList.Create;
  DoorLocateList := TStringList.Create;
  AlarmCodeList := TStringList.Create;
  intAlarmCodeList := TStringList.Create;
  AlarmNoList := TStringList.Create;
  AlarmLocateList := TStringList.Create;
  SensorCodeList := TStringList.Create;
  FoodCodeList := TStringList.Create;
  FoodCodeNameList := TStringList.Create;
  FoodLocateList := TStringList.Create;
  CompanyCodeList := TStringList.Create;
  CompanyNameList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  JijumNameList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  DepartNameList := TStringList.Create;
  DeviceNameList := TStringList.Create;
  LocationDeviceList := TStringList.Create;
  LocationImageList := TStringList.Create;
  AlarmZoneList := TStringList.Create;

end;

procedure TfmZoneMap.MemoryDestory;
begin
  DeviceCodeList.Free;
  DeviceCaptionList.Free;
  DeviceLastTimeList.Free;
  DoorCodeList.Free;
  intDoorCodeList.Free;
  DoorLocateList.Free;
  AlarmCodeList.Free;
  intAlarmCodeList.Free;
  AlarmNoList.Free;
  AlarmLocateList.Free;
  SensorCodeList.Free;
  FoodCodeList.Free;
  FoodCodeNameList.Free;
  FoodLocateList.Free;
  CompanyCodeList.Free;
  CompanyNameList.Free;
  JijumCodeList.Free;
  JijumNameList.Free;
  DepartCodeList.Free;
  DepartNameList.Free;
  DeviceNameList.Free;
  LocationDeviceList.Free;
  LocationImageList.Free;
  AlarmZoneList.Free;

end;

procedure TfmZoneMap.Image1DblClick(Sender: TObject);
var
  stDeviceID : string;
  nDeviceIndex : integer;
begin
  stDeviceID:= L_stSelectNodeNO + L_stSelectECUID ;

  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then Exit;
  TDeviceState(DeviceStateList.Objects[nDeviceIndex]).AlaramEventClear;

end;

procedure TfmZoneMap.iniConfigRead;
var
  ini_fun : TiniFile;
begin

  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  L_stMapHeigh := ini_fun.ReadString('맵환경','높이','32');
  L_stMapwidth := ini_fun.ReadString('맵환경','넓이','32');

  ini_fun.Free;

end;


procedure TfmZoneMap.MapSize;
var
  aImage : TImage;
  i : integer;
begin
  for i :=1 to 104 do
  begin
    aImage := TravelImageItem('Image' + inttostr(i));
    if aImage <> nil then
    begin
      if Not isDigit(L_stMapHeigh) then L_stMapHeigh := '20';
      if Not isDigit(L_stMapwidth) then L_stMapwidth := '20';
      aImage.Width := strtoint(L_stMapwidth);
      aImage.Height := strtoint(L_stMapHeigh);
    end;
  end;

end;

procedure TfmZoneMap.SetBuildingCode(const Value: String);
begin
  FBuildingCode := Value;
  MapLoad(copy(Value,1,3),copy(Value,4,3),copy(Value,7,3));
  LocationMapShow(copy(Value,1,3),copy(Value,4,3),copy(Value,7,3));
end;

procedure TfmZoneMap.Add_AlarmArea(aNodeNo, aEcuID, aPortNo: string);
begin
  AlarmModeChanged(aNodeNo,aEcuID,aPortNo);
end;

procedure TfmZoneMap.AlarmModeChanged(aNodeNo,aEcuID,aPortNo: string);
var
  stDeviceID : string;
  nAlarmIndex : integer;
  stImageObjectName : string;
  aImage : TImage;
  stImageDir : string;
  stImage : string;
  nTempIndex : integer;
  gif :TGifImage;
begin
  aPortNo := inttostr(strtoint(aPortNo));
  stDeviceID := FillZeroStrNum(aNodeNo,3) + aEcuID + FillZeroStrNum(aPortNo,3);
  nAlarmIndex := LocationDeviceList.IndexOf('4' + stDeviceID);
  if nAlarmIndex < 0 then Exit;
  nTempIndex := AlarmZoneList.IndexOf(stDeviceID);
  if nTempIndex < 0 then AlarmZoneList.Add(stDeviceID);

  stImageObjectName := LocationImageList.Strings[nAlarmIndex];
  aImage := TravelImageItem(stImageObjectName);
  if aImage = nil then Exit;

  stImageDir := ExeFolder + '\..\Resource\';

  stImage := stImageDir + MAPALARM;

  if FileExists(stImage) then
  begin
    gif := TGifImage.Create;
    try
      gif.LoadFromFile(stImage);
      aImage.Picture.Assign(gif);
    finally
      gif.Free;
    End;
  end;
  aImage.Visible := True;
  aImage.Refresh;

end;

initialization
  RegisterClass(TfmZoneMap);
Finalization
  UnRegisterClass(TfmZoneMap);

end.
