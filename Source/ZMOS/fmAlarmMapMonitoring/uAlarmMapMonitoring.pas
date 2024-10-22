unit uAlarmMapMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, uSubForm, CommandArray, StdCtrls, ImgList,
  ToolPanels, Shader, ActnList, Menus, Grids, BaseGrid, AdvGrid,Clipbrd,
  Buttons,ADODB,ActiveX, DB,iniFiles, MPlayer,uDataModule1, RzButton,
  DBGrids, RXDBCtrl, RzTabs, RzLabel, RzPanel, RzSplit,GIFImage, AdvObj;


type
  TfmAlarmMapMonitoring = class(TfmASubForm)
    ActionList1: TActionList;
    Action_LoctionLoad: TAction;
    Action_DeviceLoad: TAction;
    Action_DoorLoad: TAction;
    Action_AlarmLoad: TAction;
    Action_FoodLoad: TAction;
    toolslist: TImageList;
    Action_RecvData: TAction;
    Popup_Device: TPopupMenu;
    MenuItem7: TMenuItem;
    Menu_DeviceAllCardDown: TMenuItem;
    Menu_DeviceCardDown: TMenuItem;
    Menu_DeviceTimeSync: TMenuItem;
    Menu_DeviceReboot: TMenuItem;
    Popup_Locate: TPopupMenu;
    Menu_CurLocate: TMenuItem;
    Action_Reload: TAction;
    mn_LocationMap: TMenuItem;
    Action_SensorLoad: TAction;
    ADOAlarmQuery: TADOQuery;
    Action_intAlarmHistory: TAction;
    Action_AlarmHistory: TAction;
    MessageTimer: TTimer;
    RzSplitter1: TRzSplitter;
    RzPanel3: TRzPanel;
    sp_Location: TRzSplitter;
    RzPanel2: TRzPanel;
    sp_State: TRzSplitter;
    RzLabel1: TRzLabel;
    Label_CurentIp: TRzLabel;
    RzPanel4: TRzPanel;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    PageControl1: TPageControl;
    tbLOCATE: TTabSheet;
    GroupBox2: TGroupBox;
    Shader2: TShader;
    TreeView_LocationCode: TTreeView;
    BuildingListView: TListView;
    tbDEVICE: TTabSheet;
    GroupBox3: TGroupBox;
    TreeView_Device: TTreeView;
    Shader3: TShader;
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
    PopupMenu_Alarm: TPopupMenu;
    mn_AlarmConfirm: TMenuItem;
    N2: TMenuItem;
    mn_ArmModeChange: TMenuItem;
    mn_DisArmModeChange: TMenuItem;
    PopupMenu_Door: TPopupMenu;
    pm_modechange: TMenuItem;
    pm_OpenMode: TMenuItem;
    pm_OperateMode: TMenuItem;
    pm_StateCheck: TMenuItem;
    pm_DoorOpen: TMenuItem;
    ADOQuery1: TADOQuery;
    pm_mapsize: TPopupMenu;
    mn_FullMap: TMenuItem;
    mn_BasicMap: TMenuItem;
    sg_Alarm: TAdvStringGrid;
    pan_Message: TPanel;
    btn_AlarmConfirm: TSpeedButton;
    st_Message: TStaticText;
    mn_FireRecovery: TMenuItem;
    N1: TMenuItem;
    mn_DeviceChange: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action_LoctionLoadExecute(Sender: TObject);
    procedure Action_DeviceLoadExecute(Sender: TObject);
    procedure SocketWatchTimerTimer(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure Menu_CurLocateClick(Sender: TObject);
    procedure TreeView_DeviceClick(Sender: TObject);
    procedure Menu_DeviceTimeSyncClick(Sender: TObject);
    procedure Menu_DeviceRebootClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand2Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand3Execute(Command: TCommand;
      Params: TStringList);
    procedure Menu_DeviceAllCardDownClick(Sender: TObject);
    procedure Menu_DeviceCardDownClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand4Execute(Command: TCommand;
      Params: TStringList);
    procedure Action_ReloadExecute(Sender: TObject);
    procedure sg_IntAccessKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CommandArrayCommandsTCommand5Execute(Command: TCommand;
      Params: TStringList);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCommand6Execute(Command: TCommand;
      Params: TStringList);
    procedure FormActivate(Sender: TObject);
    procedure sg_AccessColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_IntAccessColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_IntAlarmColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_AlarmColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure CommandArrayCommandsTFIRERECOVERExecute(Command: TCommand;
      Params: TStringList);
    procedure MessageTimerTimer(Sender: TObject);
    procedure btn_AlarmConfirmClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BuildingListViewDblClick(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mn_FullMapClick(Sender: TObject);
    procedure mn_BasicMapClick(Sender: TObject);
    procedure mn_ArmModeChangeClick(Sender: TObject);
    procedure mn_DisArmModeChangeClick(Sender: TObject);
    procedure mn_AlarmConfirmClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure mn_FireRecoveryClick(Sender: TObject);
    procedure mn_DeviceChangeClick(Sender: TObject);
  private
    L_bFirst : Boolean;
    L_bClose : Boolean;
    L_stSelectNodeNO : string;
    L_stSelectECUID : string;
    L_stSelectNO : string;
    L_nLocationPer : integer;
    L_nStatePer : integer;
    L_stMapHeigh : string;
    L_stMapwidth : string;
  private
    procedure MemoryCreate;
    procedure MemoryDestory;
    procedure iniConfigWrite;
    procedure iniConfigRead;
    procedure CellHide;
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
    L_stSelectBuildingCode : string;
    L_stSelectFloorCode : string;
    L_stSelectAreaCode : string;
    L_stSelectBuildingName : string;


    procedure LoadingBuilding;
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
  private
    procedure DisConnectServer;
    procedure ConnectServer;
    procedure DisConnectNode(aNodeNo:string);
    procedure ConnectNode(aNodeNo:string);
    procedure DisConnectECU(aECUID:string);
    procedure ConnectECU(aECUID:string);
    procedure DisConnectDoor(aDoorID:string);
    procedure DisConnectAlarm(aAlarmID:string);
    procedure RcvCardReadData(aNodeNo,aReceiveData:string); //카드리딩 데이터 처리
    procedure RcvChangeDoorData(aNodeNo,aReceiveData:string); //상태변경 데이터 처리
    procedure RcvDoorControl(aNodeNo,aReceiveData:string);
    Function GetBuildingName(aBuildingCode:string):string;
    Function GetFloorName(aBuildingCode,aFloorCode:string):string;
    Function GetAreaName(aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetPermitState(aPermit:string):string;
    Function GetUserInfo(aCardNo:string; var stUserName,stCompanyName,stJijumName,stDepartName,stEmID,stHandPhone,stCompanyPhone,stAddr1,stAddr2:string):Boolean;
    procedure LoadCompanyCode;
    procedure LoadJijumCode;
    procedure LoadDepartCode;
    procedure InsertDOORList(aPermitCode,aPermit,aTime,aLocationName,aDoorName,aCardNo,aUserName,
    aCompanyName,aJijumName,aDepartName,aEmID,aDoorID,aHandPhone,aCompanyPhone,aAddr1,aAddr2:string;List:TAdvStringGrid);
    procedure   InsertAlarmList(aTime, //시간
                  aAlarmName, //경계구역명칭
                  aType,
                  aStatusName:string;
                  aAlarmSound:Boolean;
                  aColor:string;
                  List:TAdvStringGrid);  //이벤트 내용
    procedure Insertsg_SensorList(aTime,aNodeNo,aECUID,aPortNo,aDeviceType,aStatusCode,aStatusName,aPortName:string;List:TAdvStringGrid);

    Function GetStatusCode(aStatusCode:string;var aStatusName :string;aAlarmSound:integer) : integer;
    Function GetDeviceType(aSubClass:string):string;
    procedure Form_Initialize;
    procedure DeviceConnectStatus(aReceiveData:string);
    procedure NodeConnectStatus(aReceiveData:string);

    function GetAlarmNO(aNodeNo,aEcuID:string):integer;
    Function updateTB_ZONEDEVICEState(aAlarmNo,aZoneNum,aState:string):Boolean;
    function CheckSchedule(aNodeNo, aECUID,aPortNo:string):Boolean;
    function GetPortName(aNodeNo,aECUID,aPortNo:string):String;

    procedure NODEDataProcess(aNodeNo,aTYPE,aACTION,aData:string);
    procedure ECUDataProcess(aNodeNo,aECUID,aTYPE,aACTION,aData:string);
    procedure ACDataProcess(aNodeNo,aECUID,aData:string); //출입데이터
    procedure DEVICEDataProcess(aNodeNo,aECUID,aData:string);
    procedure DoorDataProcess(aNodeNo,aEcuID,aDoorNo,aType,aACTION,aData:string);
    procedure AlarmDataProcess(aNodeNo,aEcuID,aType,aACTION,aData:string);
    procedure SearchAlarmList;
    
  private
    procedure ChangeDoorIndex(FromIndex,ToIndex:integer);
    procedure ChangeIntDoorIndex(FromIndex,ToIndex:integer);
    procedure ChangeAlarmIndex(FromIndex,ToIndex:integer);
    procedure ChangeIntAlarmIndex(FromIndex,ToIndex:integer);

    procedure CenterPanel;
    procedure AlarmListClear; //알람 리스트 Clear 후 재 로딩
  private
    function GetBuildingIndex(aBuildingID:string):integer;
  public
    { Public declarations }
    bLocationMapShow : Boolean;
    bDeviceMapShow : Boolean;
//    procedure ShowMessage(aMessage:string);
    procedure DoorFireStateChange(NodeNo:integer;aEcuID, aDoorNo:string; aFireState:Boolean);
    procedure DoorStateChange(NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorDSState;
                                  aDoorLockType:TDoorLockState);
    procedure DeviceConnected(NodeNo:integer;aEcuID:string;aConnected:Boolean);
    procedure AlarmModeChanged(NodeNo:integer;aEcuID,aAlarmArea:string;aWachMode:TWatchMode);
    procedure DeviceAlarmEventProcess(NodeNo:integer;ECUID,aArmAreaNo:string;aAlaramState:TAlarmEventState);
    procedure AlarmEventProcess(NodeNo:integer;
        ECUID,aArmAreaNo, aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode,
        aStatusCode, aPortNo, aState, aOperator, aNewStateCode:string;
        aAlarmView, aAlarmSound:Boolean;aColor:string);
    procedure ExitButtonPress(NodeNo : integer;aEcuID,aDoorNo,aTime,aInputType,aUserName,aPermitCode,aPermit:string);
    procedure AccessEventProcess(NodeNo:integer;
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo :string);
    procedure NodeConnectState(NodeNo:integer;aConnectState:TNodeCurrentState);

  end;

var
  fmAlarmMapMonitoring: TfmAlarmMapMonitoring;


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
  uMain, uDBFunction;
{$R *.dfm}




procedure TfmAlarmMapMonitoring.FormCreate(Sender: TObject);
var
  i : integer;
begin
  MemoryCreate;
  iniConfigRead;
  CellHide;
  MapSize;

  L_bFirst := True;
  L_bClose := False;

  TreeView_Device.Items.Clear;

  for i:=0 to sg_Alarm.ColCount - 1 do
  begin
    AlarmIndexArray[i] := i;
    relAlarmIndexArray[i] := i;
  end;

  mn_FireRecovery.Visible := G_bFireRelayUse;

end;

procedure TfmAlarmMapMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  L_bClose := True;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'AlarmMapMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  iniConfigWrite;
  MemoryDestory;



  Action := caFree;

end;

procedure TfmAlarmMapMonitoring.Action_LoctionLoadExecute(Sender: TObject);
begin
  if L_bClose then Exit;
  LoadingBuilding;
end;

procedure TfmAlarmMapMonitoring.Action_DeviceLoadExecute(Sender: TObject);
var
  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
  stSql : string;
  stParentCode : string;
  stLocationCaption : string;
  nIndex : integer;
  stDeviceID : string;
  stNodeNo : string;
  nNodeIndex : integer;
  nDeviceIndex :integer;
begin
  aTreeView := TreeView_Device;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  DeviceCodeList.Clear;
//  DeviceStateList.Clear;
  DeviceCaptionList.Clear;
  DeviceLastTimeList.Clear;

  aNode:= aTreeView.Items.Add(nil,'서버');
  if bSeverConnected then
  begin
    aNode.ImageIndex := ServerConnectImageIndex;
    aNode.SelectedIndex := ServerConnectImageIndex;
  end else
  begin
    aNode.ImageIndex := ServerDisConnectImageIndex;
    aNode.SelectedIndex := ServerDisConnectImageIndex;
  end;
  aNode.StateIndex:= NothingStateIndex;
  DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));
  DeviceCodeList.Add('00000');
  DeviceCaptionList.Add('서버');

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectMCUDeviceLoad
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectMCUDeviceLoad
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectMCUDeviceLoad
  else if DBTYPE = 'FB' then stSql := FireBird.SelectMCUDeviceLoad
  else Exit;

  with DataModule1.GetObject.ADOQuery do
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
    First;
    While Not Eof do
    begin
      if L_bClose then Exit;
      stNodeNo := FillZeroNumber(FindField('AC_NODENO').AsInteger,3);
      stLocationCaption := stNodeNo + ':' + FindField('AC_MCUIP').AsString + ':' + FindField('AC_MCUPORT').AsString;
      DeviceCodeList.Add('N' + stNodeNo);
      DeviceCaptionList.Add(stLocationCaption);
      DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //LAN의 접속시간 체크하자...
      bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
      nNodeIndex := NodeList.IndexOf(stNodeNo);
      if nNodeIndex > -1 then
      begin
        if TNodeState(NodeList.Objects[nNodeIndex]).NodeConnected then
        begin
          bNode.ImageIndex:=NodeConnectImageIndex;
          bNode.SelectedIndex:=NodeConnectImageIndex;
        end else
        begin
          bNode.ImageIndex:=NodeDisConnectImageIndex;
          bNode.SelectedIndex:=NodeDisConnectImageIndex;
        end;
      end else
      begin
        bNode.ImageIndex:=NodeDisConnectImageIndex;
        bNode.SelectedIndex:=NodeDisConnectImageIndex;
      end;
      bNode.StateIndex:= NothingStateIndex;

      Application.ProcessMessages;
      Next;
    end;
  end;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectECUDeviceLoad
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectECUDeviceLoad
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectECUDeviceLoad
  else if DBTYPE = 'FB' then stSql := FireBird.SelectECUDeviceLoad
  else Exit;


  with DataModule1.GetObject.ADOQuery do
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
    First;
    While Not Eof do
    begin
      if L_bClose then Exit;
      stNodeNo := FillZeroNumber(FindField('AC_NODENO').AsInteger,3);
      stDeviceID := stNodeNo + FindField('AC_ECUID').asstring;
      stLocationCaption := FindField('AC_ECUID').asstring + ':' + FindField('AC_DEVICENAME').asstring;
      DeviceCodeList.Add('E' + stDeviceID);
      DeviceCaptionList.Add(stLocationCaption);
      DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //ECU의 접속시간 체크하자...
      nIndex := DeviceCodeList.IndexOf('N' + stNodeNo);
      if nIndex > -1 then
      begin
        stParentCode := DeviceCaptionList.Strings[nIndex] ;
        bNode:= GetNodeByText(aTreeView,stParentCode,True);
        if bNode <> nil then
        begin
          cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
          nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
          if nDeviceIndex > -1 then
          begin
            if TDeviceState(DeviceStateList.Objects[nDeviceIndex]).Connected then
            begin
              cNode.ImageIndex:=DeviceConnectImageIndex;
              cNode.SelectedIndex:=DeviceConnectImageIndex;
            end else
            begin
              cNode.ImageIndex:=DeviceDisConnectImageIndex;
              cNode.SelectedIndex:=DeviceDisConnectImageIndex;
            end;
          end else
          begin
            cNode.ImageIndex:=DeviceDisConnectImageIndex;
            cNode.SelectedIndex:=DeviceDisConnectImageIndex;
          end;
          cNode.StateIndex:= NothingStateIndex;
        end;
      end;
      Application.ProcessMessages;
      Next;
    end;
  end;

  if AccessUse then
  begin
    if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_DOORJoinAdmin('','','',False)
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_DOORJoinAdmin('','','',False)
    else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectTB_DOORJoinAdmin('','','',False)
    else if DBTYPE = 'FB' then stSql := FireBird.SelectTB_DOORJoinAdmin('','','',False)
    else Exit;
{    //Door정보 로딩
    stSql := ' Select a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME';
    stSql := stSql + ' From TB_DOOR a ';
    if Not IsMaster then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    end;
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    if Not IsMaster then
      stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
    stSql := stSql + ' Group by a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME ';
    stSql := stSql + ' Order by a.AC_NODENO '; }

    with DataModule1.GetObject.ADOQuery do
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
      First;
      While Not Eof do
      begin
        if L_bClose then Exit;
        stLocationCaption := FindField('DO_DOORNO').asstring + ':' + FindField('DO_DOORNONAME').asstring;
        DeviceCodeList.Add('D' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring + FindField('DO_DOORNO').asstring);
//        DeviceStateList.Add('D');
        DeviceCaptionList.Add(stLocationCaption);
        nIndex := DeviceCodeList.IndexOf('E' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').asstring);
        if nIndex > -1 then
        begin
          stParentCode := DeviceCaptionList.Strings[nIndex] ;
          bNode:= GetNodeByText(aTreeView,stParentCode,True);
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=12;
            cNode.SelectedIndex:=12;
            cNode.StateIndex:= -1;
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  end;

  if PatrolUse then
  begin
    //경비구역 로딩
    if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_ARMAREAJoinAdmin('','','')
    else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_ARMAREAJoinAdmin('','','')
    else if DBTYPE = 'MSSQL' then stSql := MSSql.selectTB_ARMAREAJoinAdmin('','','')
    else if DBTYPE = 'FB' then stSql := FireBird.selectTB_ARMAREAJoinAdmin('','','')
    else Exit;

{    stSql := ' Select a.AC_NODENO,a.AC_ECUID,a.AL_ZONENAME';
    stSql := stSql + ' From TB_ALARMDEVICE a ';
    if Not IsMaster then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
    end;
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    if Not IsMaster then
      stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
    stSql := stSql + ' Group by a.AC_NODENO,a.AC_ECUID,a.AL_ZONENAME ';
    stSql := stSql + ' Order by a.AC_NODENO,a.AC_ECUID ';
}
    with DataModule1.GetObject.ADOQuery do
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
      First;
      While Not Eof do
      begin
        if L_bClose then Exit;
        stLocationCaption :=  FindField('AR_NAME').asstring;
        DeviceCodeList.Add('D' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring + inttostr(FindField('AR_AREANO').AsInteger));
//        DeviceStateList.Add('D');
        DeviceCaptionList.Add(stLocationCaption);
        nIndex := DeviceCodeList.IndexOf('E' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').asstring);
        if nIndex > -1 then
        begin
          stParentCode := DeviceCaptionList.Strings[nIndex] ;
          bNode:= GetNodeByText(aTreeView,stParentCode,True);
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=13;
            cNode.SelectedIndex:=13;
            cNode.StateIndex:= -1;
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  end;

  if FoodUse then
  begin
    //식수구역 로딩
    stSql := ' Select a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO,a.FO_NAME ';
    stSql := stSql + ' From TB_FOOD a ';
    if Not IsMaster then
    begin
      if BuildingGrade = 4 then
      begin
        stSql := stSql + ' Inner Join TB_ADMINFOOD b ';
        stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
        stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
      end;
    end;
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    if Not IsMaster then
    begin
      if BuildingGrade = 1 then
      begin
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      end else if BuildingGrade = 2 then
      begin
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end else if BuildingGrade = 3 then
      begin
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
        stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
      end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
    end;
    stSql := stSql + ' Group by  a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO,a.FO_NAME ';
    stSql := stSql + ' Order by a.AC_NODENO ';

    with DataModule1.GetObject.ADOQuery do
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
      First;
      While Not Eof do
      begin
        if L_bClose then Exit;
        stLocationCaption := FindField('FO_DOORNO').asstring + ':' + FindField('FO_NAME').asstring;
        DeviceCodeList.Add('D' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring + FindField('FO_DOORNO').asstring );
//        DeviceStateList.Add('D');
        DeviceCaptionList.Add(stLocationCaption);
        stParentCode := DeviceCaptionList.Strings[DeviceCodeList.IndexOf('E' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').asstring)] ;
        bNode:= GetNodeByText(aTreeView,stParentCode,True);
        if bNode <> nil then
        begin
          cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
          cNode.ImageIndex:=14;
          cNode.SelectedIndex:=14;
          cNode.StateIndex:= -1;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  end;

end;

procedure TfmAlarmMapMonitoring.SocketWatchTimerTimer(Sender: TObject);
var
  i : integer;
  dtLastTime : TDatetime;
  dtTimeOut : TDatetime;
  stNodeNo : string;
begin
// 소켓의 마지막 접속시간을 계산하자.
  for i:= 1 to DeviceLastTimeList.Count - 1 do
  begin
    dtLastTime := strToDateTime(DeviceLastTimeList.Strings[i]);
    dtTimeOut:= IncTime(dtLastTime,0,0,15,0);
    if Now > dtTimeOut then
    begin
      // 여기에서 해당 노드의 이미지를 변경해 주자.
      stNodeNo := DeviceCodeList.Strings[i];
      if (stNodeNo[1] = 'N') then
        DisConnectNode(stNodeNo);
//      else if stNodeNo[1] = 'E' then
//        DisConnectECU(stNodeNo);
    end;
  end;

end;

procedure TfmAlarmMapMonitoring.DisConnectNode(aNodeNo: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  i : integer;
  stECUCode : string;
  stDoorCode : string;
  stAlarmCode : string;
  nIndex : integer;
  bRefresh : Boolean;
begin
{  if TreeView_Device.Items.Count < 1 then Exit;
  bRefresh := False;
  nIndex := DeviceCodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
//  if DeviceStateList.Strings[nIndex] = 'D' then exit;
  
  aTreeView := TreeView_Device;
//  DeviceStateList.Strings[nIndex] := 'D';
  stCaption := DeviceCaptionList.Strings[nIndex];
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode.ImageIndex <> 3 then
  begin
    aNode.ImageIndex:=3;
    bRefresh := True;
  end;
  if aNode.SelectedIndex <> 3 then
  begin
    aNode.SelectedIndex:=3;
    bRefresh := True;
  end;
  aNode.StateIndex:= -1;

  for i:=0 to DeviceCodeList.Count - 1 do
  begin
    stECUCode := DeviceCodeList.Strings[i];
    if copy(stECUCode,1,1) = 'E' then //ECU코드이면
    begin
      //해당노드의 ECU인지 체크해서 해당 ECU이면 이미지 변경
      if copy(stECUCode,2,3) = copy(aNodeNo,2,3) then
      begin
        DisConnectECU(stECUCode);

      end;
    end;
  end;
  if bRefresh then aTreeView.Refresh;

  {
  for i:=0 to DoorCodeList.Count - 1 do
  begin
    stDoorCode := DoorCodeList.Strings[i];
    if copy(stDoorCode,1,3) = copy(aNodeNo,2,3) then //해당노드의 도어이면 모두 물음표처리
    begin
      DisConnectDoor(stDoorCode);
    end;
  end;  
  for i:=0 to AlarmCodeList.Count - 1 do
  begin
    stAlarmCode := AlarmCodeList.Strings[i];
    if copy(stAlarmCode,1,3) = copy(aNodeNo,2,3) then //해당노드의 도어이면 모두 물음표처리
    begin
      DisConnectAlarm(stAlarmCode);
    end;
  end;  }

end;

procedure TfmAlarmMapMonitoring.ConnectNode(aNodeNo: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  nIndex : integer;
begin
{  nIndex := DeviceCodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
//  if DeviceStateList.Strings[nIndex] = 'C' then Exit;
  stCaption := DeviceCaptionList.Strings[nIndex];
//  DeviceStateList.Strings[nIndex] := 'C';

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  aNode.ImageIndex:=2;
  aNode.SelectedIndex:=2;
  aNode.StateIndex:= -1;
  aTreeView.Refresh; }
end;


procedure TfmAlarmMapMonitoring.ConnectECU(aECUID: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  stDoorID : string;
  nIndex : integer;
begin
{  nIndex := DeviceCodeList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
//  if DeviceStateList.Strings[nIndex] = 'C' then exit;
{  stDoorID:= aECUID + '1';
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  sleep(1);
  stDoorID:= aECUID + '2';
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

  stCaption := DeviceCaptionList.Strings[nIndex];
//  DeviceStateList.Strings[nIndex] := 'C';
  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;

  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  if aNode.ImageIndex <> 4 then aNode.ImageIndex:=4;
  if aNode.SelectedIndex <> 4 then aNode.SelectedIndex:=4;
  aNode.StateIndex:= -1;
  aTreeView.Refresh;  }
end;

procedure TfmAlarmMapMonitoring.DisConnectECU(aECUID: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  i : integer;
  stDoorCode : string;
  stAlarmCode : string;
  nIndex : integer;
  bRefresh : Boolean;
begin
{  bRefresh := False;
  nIndex := DeviceCodeList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
//  if DeviceStateList.Strings[nIndex] = 'D' then exit;
//  DeviceStateList.Strings[nIndex] := 'D';
  stCaption := DeviceCaptionList.Strings[nIndex];

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;

  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode.ImageIndex <> 5 then
  begin
    aNode.ImageIndex:=5;
    bRefresh := True;
  end;
  if aNode.SelectedIndex <> 5 then
  begin
    aNode.SelectedIndex:=5;
    bRefresh := True;
  end;
  aNode.StateIndex:= -1;

  for i:=0 to DoorCodeList.Count - 1 do
  begin
    stDoorCode := DoorCodeList.Strings[i];
    if copy(stDoorCode,1,5) = copy(aECUID,2,5) then //해당ECU의 도어이면 모두 물음표처리
    begin
      DisConnectDoor(stDoorCode);
    end;
  end;

  for i:=0 to AlarmCodeList.Count -1 do
  begin
    stAlarmCode := AlarmCodeList.Strings[i];
    if Copy(stAlarmCode,1,5) = copy(aECUID,2,5) then //해당ECU의 Alam이면 물음표
    begin
      DisConnectAlarm(stAlarmCode);
    end;
  end;
  if bRefresh then aTreeView.Refresh;  }
end;

procedure TfmAlarmMapMonitoring.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stReceiveData: string;
  stNodeNo,stECUID,stDoorNo,stReaderNo : string;
  aCommand : char;
  MSG_Code: Char;
  stDevice : string; //S:서버,E:ECU,D:Door,
  stTYPE : string;
  stACTION : string;
  nLength : integer;
  stData : string;
begin
  stReceiveData := Params.Values['Data'];
//  ShowMessage(stReceiveData);
{  //Delete(stReceiveData,1,1); //처음 맨 앞자리는 R
  if stReceiveData = 'ALARMREFRESH' then
  begin
    SearchAlarmList;
    Exit;
  end;
  stDevice := stReceiveData[2];
  stNodeNo := copy(stReceiveData,3,3);
  stECUID := copy(stReceiveData,6,2);
  stDoorNo := copy(stReceiveData,8,2);
  stReaderNo := copy(stReceiveData,10,2);
  if Not Isdigit(stNodeNo) then Exit;
  if Not Isdigit(stEcuID) then Exit;
  if Not Isdigit(stDoorNo) then Exit;
  if Not Isdigit(stReaderNo) then Exit;
  if Not Isdigit(copy(stReceiveData,15,3)) then Exit;

  stTYPE := copy(stReceiveData,12,2);
  stACTION := copy(stReceiveData,14,1);
  nLength := strtoint(copy(stReceiveData,15,3));
  stData := copy(stReceiveData,18,nLength);

  if stDevice = 'S' then     //서버에서 주는 데이터 처리
  begin
    if UpperCase(stData) = 'RESTART' then
    begin
      Action_ReloadExecute(Self);
      Exit;
    end;
  end else if stDevice = 'N' then //노드 데이터 처리
  begin
    NODEDataProcess(stNodeNo,stTYPE,stACTION,stData);
  end else if stDevice = 'E' then //기기 데이터 처리
  begin
    ECUDataProcess(stNodeNo,stECUID,stTYPE,stACTION,stData);
  end else if stDevice = 'D' then //출입문 데이터 처리
  begin
    DoorDataProcess(stNodeNo,stEcuID,stDoorNo,stType,stACTION,stData);
  end else if stDevice = 'R' then //리더 데이터 처리
  begin
  end else if stDevice = 'A' then //알람 데이터 처리
  begin
    AlarmDataProcess(stNodeNo,stEcuID,stType,stACTION,stData);
  end; }
{
  if stReceiveData[1] = 'C' then
  begin
    if stReceiveData[2] = 'N' then
      NodeConnectStatus(stReceiveData)
    else
      DeviceConnectStatus(stReceiveData);
    Exit;
  end;
  if Length(stReceiveData) < 17 then Exit;
  stNodeNo := copy(stReceiveData,1,3);
  Delete(stReceiveData,1,3); //데몬에서 붙여온 Node 번호
  if Not Isdigit(stNodeNo) then Exit;

  aCommand:= stReceiveData[17];

//  stMCUID:=    Copy(stReceiveData,8,7);
  stECUID:=    Copy(stReceiveData,15,2);
  stDoorNo:=     stReceiveData[21];


  if Pos('COMM ERROR',stReceiveData) > 0 then
    DisConnectECU('E' + stNodeNo + stECUID )
  else if Pos('UNUSED',stReceiveData) > 0 then DisConnectECU('E' + stNodeNo + stECUID )
  else if aCommand <> 'A' then
  begin
    ConnectNode('N' + stNodeNo);
    ConnectECU('E' + stNodeNo + stECUID );
  end;

  // 여기에서 화면에 디스플레이 해 주자... 전문을 분석해서...^^

  case aCommand of
    'A': begin // 알람 데이터
           DeviceRcvAlarmData(stNodeNo,stReceiveData);
         end;

    'c': begin      //카드데이터 처리
           //Connected:= True;
           MSG_Code:= stReceiveData[19];
           case MSG_Code of
             'E' ://카드 데이터(출입) 처리
                begin
                   RcvCardReadData(stNodeNo,stReceiveData);
                end;
             'D' ://문 상태 변경 처리
                begin
                  RcvChangeDoorData(stNodeNo,stReceiveData);
                end;
             'c' ://문제어 응답
                begin
                  RcvDoorControl(stNodeNo,stReceiveData);
                end;
             'a','b'://출입통제 등록 웅답
                begin
                  //RcvDoorSetup(Self,aData);
                end;
             'l','m','n':// 카드 데이터 등록 응답
                begin
                  //RcvRegCardData(Self,aData);
                end;
           end;
         end;
  end;   }
end;



procedure TfmAlarmMapMonitoring.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd: string;
  i : integer;
begin
  stCmd := Params.Values['Data'];

  for i:=0 to DoorCodeList.Count - 1 do
  begin
    if stCmd = 'OPENMODE' then  //전체개방
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPENMODE'+ DATADELIMITER + DoorCodeList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end else if stCmd = 'OPERATEMODE' then  //전체운영
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + DoorCodeList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end;
  end;


end;

procedure TfmAlarmMapMonitoring.Menu_CurLocateClick(Sender: TObject);
var
  stLocateID : string;
begin

end;

procedure TfmAlarmMapMonitoring.TreeView_DeviceClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
  nIndex : integer;
begin
  if TreeView_Device.Selected = nil then Exit;
  
  stCaption := TreeView_Device.Selected.Text;
  nIndex := DeviceCaptionList.IndexOf(stCaption);
  if nIndex < 0 then Exit;
  stDeviceID := DeviceCodeList.Strings[nIndex];
  if stDeviceID[1] = 'E' then
  begin
    TreeView_Device.PopupMenu:= Popup_Device;
  end
  else TreeView_Device.PopupMenu:= nil;

end;

procedure TfmAlarmMapMonitoring.Menu_DeviceTimeSyncClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'TIMESYNC'+ DATADELIMITER + stDeviceID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmAlarmMapMonitoring.Menu_DeviceRebootClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'REBOOT'+ DATADELIMITER + stDeviceID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmAlarmMapMonitoring.CommandArrayCommandsTCommand2Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmAlarmMapMonitoring.CommandArrayCommandsTCommand3Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd: string;
  i : integer;
begin
  stCmd := Params.Values['Data'];

  for i:=0 to AlarmCodeList.Count - 1 do
  begin
    if stCmd = 'ALARMSETTING' then  //전체경계
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + AlarmCodeList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end else if stCmd = 'ALARMDISABLE' then  //전체해제
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + AlarmCodeList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end else if stCmd = 'FIRE' then
    begin
      self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
      self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
{      if FileExists(ACAlaramFile) then
      begin
        MediaPlayer1.FileName := ACAlaramFile;
        MediaPlayer1.Open;
        MediaPlayer1.play;
      end; }
    end;
  end;

end;

procedure TfmAlarmMapMonitoring.RcvCardReadData(aNodeNo, aReceiveData: string);
var
  stECUID,stDoorNo,stReaderNo : string;
  stPermit,stPermitCode,stLocate : string;
  stDeviceID : string;
  stMosGubun : string;
  stDoorName,stLocationName : string;
  nIndex : integer;
  stTime : string;
  stTemp : string;
  stCardNo : string;
  stUserName,stCompanyName,stJijumName,stDepartName,stEmID : string;
  stHandPhone,stCompanyPhone,stAddr1,stAddr2 : string;
  nCardNoLen : integer;
  bExitButton : Boolean;
  cInputType : char;
  nCardNo : int64;
begin
  if Length(aReceiveData) < 49 then Exit;

  stUserName := '';
  stCompanyName := '';
  stJijumName := '';
  stDepartName := '';
  stEmID := '';
  bExitButton := False;
//  stMCUID :=    Copy(aReceiveData,8,7);
  stECUID :=    Copy(aReceiveData,15,2);
  stDoorNo:=     aReceiveData[21];
  stReaderNo:=   aReceiveData[22];
  cInputType:=   aReceiveData[38];
  stTime:= Copy(aReceiveData,24,12);
  stTime:= copy(FormatDateTime('yyyymmdd',Now),1,2) + stTime;

  nCardNoLen := strtoint(Copy(aReceiveData,42,2));
  if CARDLENGTHTYPE = 0 then  //고정길이 타입이면
  begin
    stTemp := Copy(aReceiveData,44,8);
    if G_nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
    begin
      stCardNo := DecodeCardNo(stTemp,8,True);
      stCardNo := copy(stCardNo,1,6) + '00';
      nCardNo:= Hex2Dec64(stCardNo);
      stCardNo:= FillZeroNumber2(nCardNo,10);
      if stCardNo = '0000000000' then bExitButton := True;
    end else
    begin
      if IsNumericCardNo then
      begin
        stCardNo:= DecodeCardNo(stTemp);
        if stCardNo = '0000000000' then bExitButton := True;
      end
      else
      begin
        stCardNo:= DecodeCardNo(stTemp,8,True);
        if FillZeroNumber(Hex2Dec64(stCardNo),10) = '0000000000' then bExitButton := True;
      end;
    end;
  end else
  begin
    if nCardNoLen = 0 then Exit;
    stCardNo:= Copy(aReceiveData,44,nCardNoLen);
    stTemp := FillZeroNumber(0,nCardNoLen);
    if stCardNo = stTemp then bExitButton := True; //Exit 버튼 눌른것임

    if Not bExitButton then
    begin
      if CARDLENGTHTYPE = 1 then
      begin
        if IsNumericCardNo then stCardNo:= inttostr(Hex2Dec64(stCardNo));
      end else if CARDLENGTHTYPE = 2 then   //KT사옥이면
      begin
        stCardNo := Hex2Ascii(stCardNo);
      end;
    end;
  end;

//  if stCardNo = '0000000000' then Exit;

  if not IsDigit(stTime) then Exit;
  stTime:= Copy(stTime,1,4)+'-'+
          Copy(stTime,5,2)+'-'+
          Copy(stTime,7,2)+' '+
          Copy(stTime,9,2)+':'+
          Copy(stTime,11,2)+':'+
          Copy(stTime,13,2);

  if Not bExitButton then GetUserInfo(stCardNo,stUserName,stCompanyName,stJijumName,stDepartName,stEmID,stHandPhone,stCompanyPhone,stAddr1,stAddr2);


  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + stECUID + stDoorNo;
  nIndex := DoorCodeList.IndexOf(stDeviceID);
  if nIndex < 0 then //식수 데이터 이거나 출입관제 권한이 없음
  begin
    nIndex := FoodCodeList.IndexOf(copy(stDeviceID,1,12));
    if nIndex < 0 then
    begin
      if Not IsMaster then Exit;
      stMosGubun := 'DOOR';
    end else
    begin
      stMosGubun := 'FOOD';
      stDoorName := FoodCodeNameList.Strings[nIndex];
      stLocationName := FoodLocateList.Strings[nIndex];
    end;
  end;
  //카드승인유무체크
  stPermitCode:= aReceiveData[39];
  stPermit := GetPermitState(stPermitCode);

  if stMosGubun = 'DOOR' then
  begin
    if ACAlarmUse then
    begin
      if Not Isdigit(stPermitCode) then
      begin
        self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
        self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
{        if FileExists(ACAlaramFile) then
        begin
          MediaPlayer1.FileName := ACAlaramFile;
          MediaPlayer1.Open;
          MediaPlayer1.play;
        end;  }
      end;
    end;
    if bExitButton then
    begin
      if G_nAccessEventSearch = 1 then Exit;  //카드 이벤트만 조회시 빠져 나감
      case cInputtype of
        'R': begin
             stUserName :=  '원격제어';
             stPermit := '원격제어열림';
             end;
        'P': begin
             stUserName :=  '전화';
             stPermit := '전화제어열림';
             end;
        'B': begin
             stUserName := '퇴실버튼';
             stPermit := '퇴실버튼열림';
             end;
      else stUserName:= cInputType;
      end;
    end;
  end;

end;

procedure TfmAlarmMapMonitoring.Menu_DeviceAllCardDownClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  if (Application.MessageBox(PChar('전체권한 전송시 현재 기기의 권한이 모두 삭제 됩니다. 전체권한 전송하시겠습니까?'),'전송',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + stDeviceID + DATADELIMITER + 'Y' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert('0','00','0','0',stDeviceID , '권한재전송');

{
  self.FindSubForm('Main').FindCommand('CARDDOWNLOAD').Params.Values['VALUE'] := stDeviceID + 'A';
  self.FindSubForm('Main').FindCommand('CARDDOWNLOAD').Execute;
}
end;

procedure TfmAlarmMapMonitoring.Menu_DeviceCardDownClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + stDeviceID + DATADELIMITER + 'N' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

function TfmAlarmMapMonitoring.GetAreaName(aBuildingCode, aFloorCode,
  aAreaCode: string): string;
var
  stSql : string;
begin
  Result := '';

  stSql := ' select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';

  with DataModule1.ADOTmpQuery do
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
    Result :=  FindField('LO_NAME').AsString;
  end;
end;

function TfmAlarmMapMonitoring.GetBuildingName(aBuildingCode: string): string;
var
  stSql : string;
begin
  Result := '';

  stSql := ' select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';

  with DataModule1.ADOTmpQuery do
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
    Result :=  FindField('LO_NAME').AsString;
  end;
end;

function TfmAlarmMapMonitoring.GetFloorName(aBuildingCode,
  aFloorCode: string): string;
var
  stSql : string;
begin
  Result := '';

  stSql := ' select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  with DataModule1.ADOTmpQuery do
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
    Result :=  FindField('LO_NAME').AsString;
  end;
end;

function TfmAlarmMapMonitoring.GetPermitState(aPermit: string): string;
var
  stSql : string;
begin
  Result := '미등록코드';
  stSql := ' Select * from TB_PERMITCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND PE_PERMITCODE = ''' + aPermit + ''' ';

  with DataModule1.ADOTmpQuery do
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

    Result := FindField('PE_PERMITNAME').AsString;
  end;
end;

function TfmAlarmMapMonitoring.GetUserInfo(aCardNo: string; var stUserName,
  stCompanyName, stJijumName,stDepartName, stEmID,stHandPhone,stCompanyPhone,stAddr1,stAddr2: string): Boolean;
var
  stSql : string;
  nIndex : integer;
begin
  Result := False;
  stUserName := '';
  stCompanyName := '';
  stJijumName := '';
  stDepartName := '';
  stEmID := '';

  stSql := ' select b.EM_NAME,b.CO_COMPANYCODE,b.CO_JIJUMCODE,b.CO_DEPARTCODE,b.PO_POSICODE,b.EM_CODE,b.EM_COPHONE,b.EM_HANDPHONE,b.EM_ADDR1,b.EM_ADDR2 from TB_CARD a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    if Recordcount < 1 then Exit;
    stUserName := FindField('EM_NAME').AsString ;
    nIndex := CompanyCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString);
    if nIndex > -1 then
      stCompanyName := CompanyNameList.Strings[nIndex] ;
    nIndex := JijumCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString);
    if nIndex > -1 then
      stJijumName := JijumNameList.Strings[nIndex] ;
    nIndex := DepartCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString + FindField('CO_DEPARTCODE').AsString);
    if nIndex > -1 then
      stDepartName := DepartNameList.Strings[nIndex] ;
    stEmID := FindField('EM_CODE').AsString ;
    stHandPhone := FindField('EM_HANDPHONE').AsString ;
    stCompanyPhone := FindField('EM_COPHONE').AsString ;
    stAddr1 := FindField('EM_ADDR1').AsString ;
    stAddr2 := FindField('EM_ADDR2').AsString ;
  end;

  Result := True;
end;

procedure TfmAlarmMapMonitoring.LoadCompanyCode;
var
  stSql : string;
begin
  CompanyCodeList.Clear;
  CompanyNameList.Clear;

  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by CO_COMPANYCODE ';
  end else
  begin
    stSql := stSql + ' Order by CO_NAME ';
  end;

  with DataModule1.ADOTmpQuery do
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
    First;
    While Not Eof do
    begin
      CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
      CompanyNameList.Add(FindField('CO_NAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmAlarmMapMonitoring.LoadDepartCode;
var
  stSql : string;
begin
  DepartCodeList.Clear;
  DepartNameList.Clear;

  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by CO_COMPANYCODE,CO_JIJUMCODE,CO_DEPARTCODE ';
  end else
  begin
    stSql := stSql + ' Order by CO_NAME ';
  end;

  with DataModule1.ADOTmpQuery do
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
    First;
    While Not Eof do
    begin
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString + FindField('CO_DEPARTCODE').AsString );
      DepartNameList.Add(FindField('CO_NAME').AsString);
      Next;
    end;
  end;
end;

procedure TfmAlarmMapMonitoring.CommandArrayCommandsTCommand4Execute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
end;

procedure TfmAlarmMapMonitoring.InsertDOORList(aPermitCode,aPermit, aTime, aLocationName,
  aDoorName, aCardNo, aUserName, aCompanyName, aJijumName,aDepartName, aEmID,aDoorID,aHandPhone,aCompanyPhone,aAddr1,aAddr2: string;List:TAdvStringGrid);
var
  nCol: integer;

begin

  with List do
  begin
    //ColWidths[10] := 0;  //상태코드
    if List.Name = 'sg_Access' then
      if Cells[DoorIndexArray[5],1] <> '' then   InsertRows(1,1);
    if List.Name = 'sg_IntAccess' then
      if Cells[IntDoorIndexArray[5],1] <> '' then   InsertRows(1,1);
    if List.Name = 'sg_alarmAccess' then
      if Cells[AlarmDoorIndexArray[5],1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    List.SelectedCells[1,1];
    if Not Isdigit(aPermitCode) then
    begin
      RowColor[1] := clFuchsia;
    end;
    Cells[IntDoorIndexArray[0],1] := MakeDatetimeStr(aTime);   //발생시간
    Cells[IntDoorIndexArray[1],1] := copy(aLocationName,10,length(aLocationName)-9); //위치
    Cells[IntDoorIndexArray[2],1] := aDoorName; //출입문
    Cells[IntDoorIndexArray[3],1] := aPermitCode; //승인상태 코드
    Cells[IntDoorIndexArray[4],1] := aPermit; //승인상태
    Cells[IntDoorIndexArray[5],1] := aCardNo; //카드번호
    Cells[IntDoorIndexArray[6],1] := aUserName; //이름
    Cells[IntDoorIndexArray[7],1] := aCompanyName ; //회사명
    Cells[IntDoorIndexArray[8],1] := aJijumName ; //부서명
    Cells[IntDoorIndexArray[9],1] := aDepartName ; //부서명
    Cells[IntDoorIndexArray[10],1] := aEmID; //사번
    Cells[IntDoorIndexArray[11],1] := aDoorID; //출입문아이디
    Cells[IntDoorIndexArray[12],1] := aHandPhone; //핸드폰
    Cells[IntDoorIndexArray[13],1] := aCompanyPhone; //사내전화번호
    Cells[IntDoorIndexArray[14],1] := aAddr1; //주소1
    Cells[IntDoorIndexArray[15],1] := aAddr2; //주소2

  end;

end;


function TfmAlarmMapMonitoring.GetStatusCode(aStatusCode: string;
  var aStatusName: string;aAlarmSound:integer): integer;
var
  stSql : string;
begin
  Result:= -1;
  aStatusName := '';
  aAlarmSound := 0;

  stSql := 'select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND  AL_ALARMSTATUSCODE = ''' + aStatusCode + ''' ';

  with DataModule1.ADOTmpQuery do
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
    aStatusName := FindField('AL_ALARMNAME').AsString ;
    if FindField('AL_ALARMVIEW').AsInteger > 0 then Result := 1
    else Result := 0;
    if FindField('AL_ALARMSOUND').AsInteger > 0 then aAlarmSound := 1
    else aAlarmSound := 0;
  end;

end;

procedure TfmAlarmMapMonitoring.InsertAlarmList(aTime, aAlarmName,
  aType,aStatusName: string;aAlarmSound:Boolean;aColor:string;List: TAdvStringGrid);
begin

  with List do
  begin
    //if Cells[0,1] <> '' then   InsertRows(1,1);

    if Cells[AlarmIndexArray[0],1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    List.SelectedCells[1,1];
    if aAlarmSound  then
    begin
      if isDigit(aColor) then RowColor[1] := strtoint(aColor)
      else RowColor[1] := clRed;
    end;
    Cells[AlarmIndexArray[0],1] := MakeDatetimeStr(aTime);   //발생시간
    Cells[AlarmIndexArray[1],1] := aAlarmName; //경계구역
    Cells[AlarmIndexArray[2],1] := aType;
    Cells[AlarmIndexArray[3],1] := aStatusName;

  end;

end;

procedure TfmAlarmMapMonitoring.Action_ReloadExecute(Sender: TObject);
begin
  Action_DeviceLoadExecute(Self);

  LoadCompanyCode;
  LoadJijumCode;

  LoadDepartCode;
  Action_LoctionLoadExecute(Self);

end;

procedure TfmAlarmMapMonitoring.RcvChangeDoorData(aNodeNo, aReceiveData: string);
Var
  st: String;
  stECUID: String;
  stDoorNo: String;
  cMsgNo: Char;
  nIndex  : Integer;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;
  stTimeStr: String;
  stTime: String;
  i : integer;
  bRefresh : Boolean;
begin
  //0434K1123456700c6
  //19쨰 ~
  //D20000504161543370000O D3

  bRefresh := False;
  if Length(aReceiveData) < 40 then    Exit;

//  stMCUID := Copy(aReceiveData,8,7);
  stECUID := Copy(aReceiveData,15,2);
  stDoorNo:= aReceiveData[21];
  nIndex:= DoorCodeList.IndexOf(FillzeroNumber(strtoint(aNodeNo),3) + stECUID + stDoorNo);
  //SHowMessage(DeviceID+aDoorNo + #13 + InttoStr(aINdex));
  if nIndex < 0 then    Exit;

  cMsgNo:=    aReceiveData[18];
  cDoorState:= aReceiveData[40];    //문상태
  cDoorMode:=  aReceiveData[37];    //운영/개방
  cDoorMode2:= aReceiveData[36];    //Posi/Nega
  stTime:=     Copy(aReceiveData,24,12);

  if cDoorMode2 <> '1' then
  begin
    Case cDoorMode of
      '0':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
      '2': //폐쇄모드
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= 5;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
      '2':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= 5;
      end;
    end;

  end;

  case cDoorState of
    'C': //닫힘
      begin
//        IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
//        IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
    'T','D'://장시간 열림
      begin
        stTimeStr:= '20'+ Copy(stTime,1,2)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
//        IntdoorListView.Items[nIndex].ImageIndex:=3;
        if LongDoorOpenAlarmUse then
        begin
          self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
          self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
        end;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '장시간 열림');
      end;
    'U'://해정이상
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
      end;
    'L'://시정이상
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
      end;
  end;

end;

procedure TfmAlarmMapMonitoring.RcvDoorControl(aNodeNo, aReceiveData: string);
var
  stECUID: String;
  stDoorNo: String;
  cMsgNo: Char;
  nIndex  : Integer;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;
  stState : string;
  i : integer;
  bRefresh : Boolean;
begin
  //SHowMessage(ReceiveData);

  bRefresh := False;

//  stMCUID := Copy(aReceiveData,8,7);
  stECUID := Copy(aReceiveData,15,2);
  stDoorNo:= aReceiveData[21];
  nIndex:= DoorCodeList.IndexOf(FillzeroNumber(strtoint(aNodeNo),3) + stECUID + stDoorNo);
  //SHowMessage(DeviceID+aDoorNo + #13 + InttoStr(aINdex));
  if nIndex < 0 then    Exit;

  cDoorMode2:= aReceiveData[24];    //Posi/Nega
  cDoorMode:=  aReceiveData[25];    //운영/개방
  cDoorState:= aReceiveData[26];    //문상태
  stState := cDoorMode + cDoorState ;
//  MapAction('3',aNodeNo,stECUID,stDoorNo,stState);

  if cDoorMode2 <> '1' then
  begin
    Case cDoorMode of
      '0':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
      '2':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= 5;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
      '2':
      begin
//        IntdoorListView.Items[nIndex].StateIndex:= 5;
      end;
    end;

  end;

  case cDoorState of
    'C': //닫힘
      begin
//        IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
//        IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
  end;


end;



procedure TfmAlarmMapMonitoring.sg_IntAccessKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  st: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      if TAdvStringGrid(sender).Name = 'sg_Access' then st:= Cells[DoorIndexArray[5],Row]
      else if TAdvStringGrid(sender).Name = 'sg_IntAccess' then  st:= Cells[IntDoorIndexArray[5],Row]
      else if TAdvStringGrid(sender).Name = 'sg_alarmAccess' then
           st:= Cells[AlarmDoorIndexArray[5],Row];

//      st:= Cells[5,Row];
      if st <> '' then ClipBoard.SetTextBuf(PChar(st));
    end;
  end;

end;

procedure TfmAlarmMapMonitoring.DisConnectDoor(aDoorID: string);
var
  bRefresh:Boolean;
begin
//
end;

procedure TfmAlarmMapMonitoring.DisConnectAlarm(aAlarmID: string);
begin
  if AlarmCodeList.IndexOf(aAlarmID) < 0 then Exit;

end;

procedure TfmAlarmMapMonitoring.CommandArrayCommandsTCommand5Execute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
  stCmd : string;
  stID : string;
begin
  stCmd := Params.Values['COMMAND'];
  stValue := Params.Values['VALUE'];

  if stCmd = 'DeviceMap' then
  begin
    if stValue = 'TRUE' Then
      bDeviceMapShow := True
    else bDeviceMapShow := False;
  end;

//
end;

procedure TfmAlarmMapMonitoring.FormShow(Sender: TObject);
begin


  bLocationMapShow := False;
  bDeviceMapShow := False;



  //Form_Initialize;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'AlarmMapMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Application.ProcessMessages;

end;


procedure TfmAlarmMapMonitoring.Form_Initialize;
var
  stSql : string;
  DeviceTabList : TStringList;
  WacthTabList : TStringList;
  i: integer;
  nIndex : integer;
begin

  stSql := ' select * from TB_USERCONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' AND US_CONFGROUP = ''MapTypeMonitor''';

  with DataModule1.ADOTmpQuery do
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

    DeviceTabList := TStringList.Create;
    DeviceTabList.Clear;
    for i:= 0 to PageControl1.PageCount-1 do
    begin
      DeviceTabList.AddObject(PageControl1.Pages[i].Name,
        PageControl1.Pages[i]);
    end;
    WacthTabList := TStringList.Create;
    WacthTabList.Clear;
    for i:= 0 to PageControl2.PageCount-1 do
    begin
      WacthTabList.AddObject(PageControl2.Pages[i].Name,
        PageControl2.Pages[i]);
    end;
    
    First;
    While Not Eof do
    begin
      if FindField('US_CONFIGID').AsString = 'DEVICETAB' then
      begin
        nIndex :=  DeviceTabList.IndexOf(FindField('US_VALUE').AsString);
        if nIndex > -1 then
          PageControl1.ActivePage := TTabSheet(DeviceTabList.Objects[nIndex]) ;
      end else if FindField('US_CONFIGID').AsString = 'WATCHTAB' then
      begin
        nIndex :=  WacthTabList.IndexOf(FindField('US_VALUE').AsString);
        if nIndex > -1 then
          PageControl2.ActivePage := TTabSheet(WacthTabList.Objects[nIndex]) ;
      end else if FindField('US_CONFIGID').AsString = 'INTEGH' then
      begin
        pan_Map.Height := FindField('US_VALUE').AsInteger;
      end;
      Next;
    end;
  end;
  DeviceTabList.Free;
  WacthTabList.Free;
end;

procedure TfmAlarmMapMonitoring.DeviceConnectStatus(aReceiveData: string);
var
  stNodeNo : string;
  stECUID : string;
  stDoorNo : string;

begin
  Delete(aReceiveData,1,1); //처음 맨 앞자리는 R OR C
  stNodeNo := copy(aReceiveData,1,3);
  Delete(aReceiveData,1,3); //데몬에서 붙여온 Node 번호
  if Not Isdigit(stNodeNo) then Exit;

//  stMCUID:=    Copy(aReceiveData,1,7);
  stECUID:=    Copy(aReceiveData,8,2);

  if Pos('DisConnected',aReceiveData) > 0 then
  begin
    if stECUID = '00' then DisConnectNode('N' + stNodeNo)
    else DisConnectECU('E' + stNodeNo + stECUID );
  end else
  begin
    if stECUID = '00' then ConnectNode('N' + stNodeNo)
    else ConnectECU('E' + stNodeNo + stECUID );
  end;

end;

procedure TfmAlarmMapMonitoring.NodeConnectStatus(aReceiveData: string);
var
  stNodeNo : string;
begin
  Delete(aReceiveData,1,2); //처음 맨 앞자리는 CN
  stNodeNo := copy(aReceiveData,1,3);
  if Not Isdigit(stNodeNo) then Exit;

  if Pos('DISCONNECTED',UpperCase(aReceiveData)) > 0 then
  begin
    DisConnectNode('N' + stNodeNo);
  end else
  begin
    ConnectNode('N' + stNodeNo);
  end;

end;

procedure TfmAlarmMapMonitoring.CommandArrayCommandsTCommand6Execute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
  stCmd : string;
  stID : string;
begin
  stCmd := Params.Values['COMMAND'];
  stValue := Params.Values['VALUE'];
  stID := Params.Values['ID'];

  if UpperCase(stCmd) = 'SERVER' then
  begin
    if pos('DISCONNECTED',upperCase(stValue)) > 0 then
    begin
      DisConnectServer;
    end else if pos('CONNECTED',upperCase(stValue)) > 0 then
    begin
      ConnectServer;
    end;
  end else if UpperCase(stCmd) = 'NODE' then
  begin
    if pos('DISCONNECTED',upperCase(stValue)) > 0 then
    begin
      DisConnectNode('N' + copy(stID,1,3));
    end else if pos('CONNECTED',upperCase(stValue)) > 0 then
    begin
      ConnectNode('N' + copy(stID,1,3));
    end;
  end else if UpperCase(stCmd) = 'DEVICE' then
  begin
    if pos('DISCONNECTED',upperCase(stValue)) > 0 then
    begin
      DisConnectECU('E'+ copy(stID,1,5));
    end else if pos('CONNECTED',upperCase(stValue)) > 0 then
    begin
      ConnectECU('E'+ copy(stID,1,5));
    end;
  end;
end;

procedure TfmAlarmMapMonitoring.ConnectServer;
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
begin
  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode := aTreeView.Items[0];
  if aNode.ImageIndex <> ServerConnectImageIndex then
  begin
    aNode.ImageIndex:=ServerConnectImageIndex;
    aNode.StateIndex:=ServerConnectImageIndex;
  end;
  aTreeView.Refresh;

end;

procedure TfmAlarmMapMonitoring.DisConnectServer;
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
  i : integer;
begin
  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode := aTreeView.Items[0];
  if aNode.ImageIndex <> ServerDisConnectImageIndex then
  begin
    aNode.ImageIndex:=ServerDisConnectImageIndex;
    aNode.SelectedIndex := ServerDisConnectImageIndex;
    aNode.StateIndex:=-1;
  end;
  aTreeView.Refresh;

end;

function TfmAlarmMapMonitoring.GetAlarmNO(aNodeNo, aEcuID: string): integer;
var
  stSql : string;
begin
{  result := 0;
  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';

  with DataModule1.ADOTmpQuery do
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
    result := FindField('AL_DEVICENO').AsInteger;
  end;  }
end;

function TfmAlarmMapMonitoring.updateTB_ZONEDEVICEState(aAlarmNo, aZoneNum,
  aState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ZONEDEVICE set AL_ZONESTOP = ''' + aState + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3))) ;
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aZoneNum + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;


function TfmAlarmMapMonitoring.CheckSchedule(aNodeNo, aECUID,
  aPortNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;

  stSql := ' select a.* from TB_ZONESCHEDULE a ';
  //stSql := stSql + ' Inner Join TB_ALARMDEVICE b ';
  //stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  //stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  //stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND a.AC_ECUID = ''' + aECUID + '''  ';
  stSql := stSql + ' AND a.AL_ZONENUM = ''' + inttostr(strtoint(aPortNo)) + ''' ';
  stSql := stSql + ' AND a.ZO_STARTTIME <= ''' + FormatDateTime('HHSS',Now) + ''' ';
  stSql := stSql + ' AND a.ZO_ENDTIME >= ''' + FormatDateTime('HHSS',Now) + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if recordCount > 0  then result := True;

  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

function TfmAlarmMapMonitoring.GetPortName(aNodeNo, aECUID,
  aPortNo: string): String;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '' ;

  stSql := 'select a.AL_ZONENAME from TB_ZONEDEVICE a ';
//  stSql := stSql + ' Inner Join TB_ALARMDEVICE b ';
//  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
//  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
//  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND a.AC_ECUID = ''' + aECUID + '''  ';
  stSql := stSql + ' AND a.AL_ZONENUM = ''' + inttostr(strtoint(aPortNo)) + ''' ';

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
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      End;
      if recordCount > 0  then result := FindField('AL_ZONENAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmAlarmMapMonitoring.Insertsg_SensorList(aTime,aNodeNo, aECUID, aPortNo,
  aDeviceType,aStatusCode, aStatusName, aPortName: string; List: TAdvStringGrid);
var
  stLocateName : string;
begin

  with List do
  begin
    if Cells[0,1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    Cells[0,1] := aTime;   //발생시간
    Cells[1,1] := stLocateName;
    Cells[2,1] := aPortName ; //센서명칭
    Cells[3,1] := aECUID; //주장치번호
    Cells[4,1] := aDeviceType; //
    Cells[5,1] := aStatusCode + '/' + aPortNo; //
    Cells[6,1] := aStatusName; //

  end;

end;

procedure TfmAlarmMapMonitoring.ECUDataProcess(aNodeNo, aECUID, aTYPE, aACTION,
  aData: string);
begin
  if aTYPE = 'DV' then
  begin
    if Pos('DISCONNECTED',UpperCase(aData)) > 0 then
    begin
      DisConnectECU('E' + FillZeroNumber(strtoint(aNodeNo),3) + aECUID);
    end else if Pos('CONNECTED',UpperCase(aData)) > 0 then
    begin
      ConnectECU('E' + FillZeroNumber(strtoint(aNodeNo),3) + aECUID);
    end;
  end else if aTYPE = 'AC' then //출입 데이터
  begin
    ACDataProcess(aNodeNo,aECUID,aData);
  end else if aTYPE = 'AL' then //전체 데이터
  begin
    DEVICEDataProcess(aNodeNo,aECUID,aData);
  end;

end;

procedure TfmAlarmMapMonitoring.NODEDataProcess(aNodeNo, aTYPE, aACTION,
  aData: string);
begin
  if aTYPE = 'DV' then
  begin
    if Pos('DISCONNECTED',UpperCase(aData)) > 0 then
    begin
      DisConnectNode('N' + aNodeNo);
    end else if Pos('CONNECTED',UpperCase(aData)) > 0 then
    begin
      ConnectNode('N' + aNodeNo);
    end;
  end;

end;

procedure TfmAlarmMapMonitoring.DEVICEDataProcess(aNodeNo, aECUID, aData: string);
var
  cCMD :char;
  MSG_Code : char;
  stDoorNo : string;
begin
  cCMD:= aData[17];
  stDoorNo:= aData[21];


  if Pos('COMM ERROR',aData) > 0 then
    DisConnectECU('E' + aNodeNo + aECUID )
  else if Pos('UNUSED',aData) > 0 then DisConnectECU('E' + aNodeNo + aECUID )
  else if cCMD <> 'A' then
  begin
    ConnectNode('N' + aNodeNo);
    ConnectECU('E' + aNodeNo + aECUID );
  end;

  // 여기에서 화면에 디스플레이 해 주자... 전문을 분석해서...^^

  case cCMD of
    'A': begin // 알람 데이터
//           DeviceRcvAlarmData(aNodeNo,aData);
         end;

    'c': begin      //카드데이터 처리
           //Connected:= True;
           MSG_Code:= aData[19];
           case MSG_Code of
             'E' ://카드 데이터(출입) 처리
                begin
                   RcvCardReadData(aNodeNo,aData);
                end;
             'D' ://문 상태 변경 처리
                begin
                  RcvChangeDoorData(aNodeNo,aData);
                end;
             'c' ://문제어 응답
                begin
                  RcvDoorControl(aNodeNo,aData);
                end;
             'a','b'://출입통제 등록 웅답
                begin
                  //RcvDoorSetup(Self,aData);
                end;
             'l','m','n':// 카드 데이터 등록 응답
                begin
                  //RcvRegCardData(Self,aData);
                end;
           end;
         end;
  end;
end;

procedure TfmAlarmMapMonitoring.DoorDataProcess(aNodeNo, aEcuID, aDoorNo, aType,
  aACTION, aData: string);
var
  nIndex : integer;
  cDoorMode : char;
  cDoorMode2 : char;
  cDoorState : char;
  i : integer;
  bRefresh : Boolean;
begin
  bRefresh := False;

  nIndex := DoorCodeList.IndexOf(FillzeroNumber(strtoint(aNodeNo),3) + aEcuID + inttostr(strtoint(aDoorNo)));

  if nIndex < 0 then Exit; // 관제 권한이 없음
  if aType = 'DV' then
  begin
    if aAction = 'S' then
    begin
      cDoorMode := aData[1];
      cDoorMode2 := aData[2];
      cDoorState := aData[3];

      if cDoorMode2 = '0' then    // Positive 이면
      begin
        Case cDoorMode of
          '0':       //운영모드
          begin
//            IntdoorListView.Items[nIndex].StateIndex:= 0;
          end;
          '2':       //폐쇄모드
          begin
//            IntdoorListView.Items[nIndex].StateIndex:= 5;
          end;
          else
          begin
//            IntdoorListView.Items[nIndex].StateIndex:= -1;
          end;
        end;
      end else
      begin
        Case cDoorMode of
          '0':
          begin
//            IntdoorListView.Items[nIndex].StateIndex:= 1;
          end;
          '2':  //폐쇄
          begin
//            IntdoorListView.Items[nIndex].StateIndex:= 5;
          end;
          else
          begin
//            IntdoorListView.Items[nIndex].StateIndex:= -1;
          end;
        end;

      end;

      case cDoorState of
        'C': //닫힘
          begin
//            IntdoorListView.Items[nIndex].ImageIndex:=0;
          end;
        'O': //열림
          begin
//            IntdoorListView.Items[nIndex].ImageIndex:=1;
          end;
        'E': //에러
          begin
//            IntdoorListView.Items[nIndex].ImageIndex:=2;
          end;
        'T','D'://장시간 열림
          begin
//            IntdoorListView.Items[nIndex].ImageIndex:=3;
          end;
        'U'://해정이상
          begin
          end;
        'L'://시정이상
          begin
          end;
      end;
    end;
  end;  
end;

procedure TfmAlarmMapMonitoring.AlarmDataProcess(aNodeNo, aEcuID, aType, aACTION,
  aData: string);
var
  nImageIndex : integer;
  nIndex : integer;
begin
  nIndex := AlarmCodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID );

  if nIndex < 0 then Exit;// 관제 권한이 없음

  if aType = 'DV' then //기기정보
  begin
    if aAction = 'S' then //상태정보
    begin
      nImageIndex := 2;
      case aData[1] of
       'A': begin nImageIndex:= 4; end;
       'D': begin nImageIndex:= 3; end;
       'T': begin nImageIndex:= 6; end;
       'I': begin nImageIndex:= 7; end;
       'P': begin nImageIndex:= 8; end;
      else  begin nImageIndex:= 2; end;
      end;

//      IntAlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
    end;
  end else if aType = 'PT' then  //Alarm 발생 전체전문
  begin
//    DeviceRcvAlarmData(aNodeNo,aData);
  end else if aType = 'AL' then  //전체전문
  begin
//    DeviceRcvAlarmData(aNodeNo,aData);
  end;

end;

procedure TfmAlarmMapMonitoring.ACDataProcess(aNodeNo, aECUID, aData: string);
begin
  RcvCardReadData(aNodeNo,aData);
end;

procedure TfmAlarmMapMonitoring.FormActivate(Sender: TObject);
begin
  st_Message.Font.Size := G_nAlarmMessageFontSize;
  if L_bFirst then
  begin
    L_bFirst := False;
    if ALARMVIEW = 'QUERY' then
    begin
      SearchAlarmList;
    end;
  end;

end;

procedure TfmAlarmMapMonitoring.SearchAlarmList;
begin

end;

procedure TfmAlarmMapMonitoring.sg_AccessColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeDoorIndex(FromIndex,ToIndex);
end;

procedure TfmAlarmMapMonitoring.ChangeDoorIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := relDoorIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      relDoorIndexArray[i] := relDoorIndexArray[i - 1];
    end;
    relDoorIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      relDoorIndexArray[i] := relDoorIndexArray[i + 1];
    end;
    relDoorIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(relDoorIndexArray) to HIGH(relDoorIndexArray) do
  begin
    DoorIndexArray[relDoorIndexArray[i]] := i;
  end;

end;

procedure TfmAlarmMapMonitoring.ChangeIntDoorIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := relIntDoorIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      relIntDoorIndexArray[i] := relIntDoorIndexArray[i - 1];
    end;
    relIntDoorIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      relIntDoorIndexArray[i] := relIntDoorIndexArray[i + 1];
    end;
    relIntDoorIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(relIntDoorIndexArray) to HIGH(relIntDoorIndexArray) do
  begin
    IntDoorIndexArray[relIntDoorIndexArray[i]] := i;
  end;

end;

procedure TfmAlarmMapMonitoring.sg_IntAccessColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeIntDoorIndex(FromIndex,ToIndex);
end;

procedure TfmAlarmMapMonitoring.ChangeAlarmIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := relAlarmIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      relAlarmIndexArray[i] := relAlarmIndexArray[i - 1];
    end;
    relAlarmIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      relAlarmIndexArray[i] := relAlarmIndexArray[i + 1];
    end;
    relAlarmIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(relAlarmIndexArray) to HIGH(relAlarmIndexArray) do
  begin
    AlarmIndexArray[relAlarmIndexArray[i]] := i;
  end;

end;

procedure TfmAlarmMapMonitoring.ChangeIntAlarmIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := relIntAlarmIndexArray[FromIndex];
  if FromIndex > ToIndex then   //뒤에 있는 놈이 앞으로 오는 경우
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      relIntAlarmIndexArray[i] := relIntAlarmIndexArray[i - 1];
    end;
    relIntAlarmIndexArray[ToIndex] := nChangData;
  end else   //앞에 있는 놈이 뒤로 가는 경우
  begin
    for i := FromIndex to ToIndex - 1 do
    begin
      relIntAlarmIndexArray[i] := relIntAlarmIndexArray[i + 1];
    end;
    relIntAlarmIndexArray[ToIndex] := nChangData;
  end;

  for i := LOW(relIntAlarmIndexArray) to HIGH(relIntAlarmIndexArray) do
  begin
    IntAlarmIndexArray[relIntAlarmIndexArray[i]] := i;
  end;

end;

procedure TfmAlarmMapMonitoring.sg_IntAlarmColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeIntAlarmIndex(FromIndex,ToIndex);
end;

procedure TfmAlarmMapMonitoring.sg_AlarmColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeAlarmIndex(FromIndex,ToIndex);

end;


procedure TfmAlarmMapMonitoring.LoadJijumCode;
var
  stSql : string;
begin
  JijumCodeList.Clear;
  JijumNameList.Clear;

  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by CO_COMPANYCODE,CO_JIJUMCODE ';
  end else
  begin
    stSql := stSql + ' Order by CO_NAME ';
  end;

  with DataModule1.ADOTmpQuery do
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
    First;
    While Not Eof do
    begin
      JijumCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString );
      JijumNameList.Add(FindField('CO_NAME').AsString);
      Next;
    end;

  end;
end;


procedure TfmAlarmMapMonitoring.CommandArrayCommandsTFIRERECOVERExecute(
  Command: TCommand; Params: TStringList);
var
  i : integer;
begin
  for i:=0 to DeviceCodeList.Count - 1 do
  begin
    if DeviceCodeList.Strings[i][1] = 'N' then
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'FIRERECOVERY'+ DATADELIMITER + copy(DeviceCodeList.Strings[i],2,3) + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end;
  end;
  //

end;

procedure TfmAlarmMapMonitoring.DoorFireStateChange(NodeNo:integer;
          aEcuID, aDoorNo:string; aFireState:Boolean);
var
  stDoorID : string;
  nDoorIndex : integer;
begin
  if Not aFireState then Exit;
  stDoorID := FillZeroNumber(NodeNo,3) + aEcuID + aDoorNo;
  nDoorIndex:= DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then Exit;

end;

procedure TfmAlarmMapMonitoring.DoorStateChange(NodeNo: integer; aEcuID,
  aDoorNo: string; aDoorManageType: TDoorManageMode;
  aDoorPNType: TDoorPNMode; aDoorStateType: TDoorDSState;
  aDoorLockType: TDoorLockState);
var
  stDoorID : string;
  nDoorIndex : integer;
begin
  stDoorID := FillZeroNumber(NodeNo,3) + aEcuID + aDoorNo;
  nDoorIndex:= DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then Exit;


  if aDoorStateType = dsClose then
  begin
//    IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorCloseStateImageIndex;
  end else if aDoorStateType = dsOpen then
  begin
//    IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorOpenStateImageIndex;
  end else if aDoorStateType = dsLongTime then
  begin
//    IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorLongTimeStateImageIndex;
  end else
  begin
//    IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorNothingStateImageIndex;
  end;

  if aDoorPNType = pnPositive then
  begin
    if  aDoorManageType = dmManager then
    begin
//      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorPosiManageStateIndex;
    end else if aDoorManageType = dmOpen then
    begin
//      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
    end else if aDoorManageType = dmLock then
    begin
//      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorCloseModeStateIndex;
    end else if aDoorManageType = dmMaster then
    begin
//      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorMasterModeStateIndex;
    end else
    begin
//      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
    end;
  end else if aDoorPNType = pnNegative then
  begin
    if  aDoorManageType = dmManager then
    begin
//      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorNegaManageStateIndex;
    end else if aDoorManageType = dmOpen then
    begin
//      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
    end else if aDoorManageType = dmLock then
    begin
//      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorCloseModeStateIndex;
    end else if aDoorManageType = dmMaster then
    begin
//      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorMasterModeStateIndex;
    end else
    begin
//      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
    end;
  end else
  begin
//    IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
  end;

end;

procedure TfmAlarmMapMonitoring.DeviceConnected(NodeNo: integer; aEcuID: string;
  aConnected: Boolean);
var
  aTreeView   : TTreeview;
  aNode       : TTreeNode;
  nDeviceIndex : integer;
  nNodeIndex : integer;
  stDeviceID : string;
  stCaption : string;
begin
  stDeviceID := 'E' + FillZeroNumber(NodeNo,3) + aEcuID;
  nDeviceIndex := DeviceCodeList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nDeviceIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
  stCaption := DeviceCaptionList.Strings[nDeviceIndex];

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;

  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  if aConnected then
  begin
    if aNode.ImageIndex <> DeviceConnectImageIndex then aNode.ImageIndex:=DeviceConnectImageIndex;
    if aNode.SelectedIndex <> DeviceConnectImageIndex then aNode.SelectedIndex:=DeviceConnectImageIndex;
  end else
  begin
    if aNode.ImageIndex <> DeviceDisConnectImageIndex then aNode.ImageIndex:=DeviceDisConnectImageIndex;
    if aNode.SelectedIndex <> DeviceDisConnectImageIndex then aNode.SelectedIndex:=DeviceDisConnectImageIndex;
  end;

  aNode.StateIndex:= -1;
  aTreeView.Refresh;

end;

procedure TfmAlarmMapMonitoring.AlarmModeChanged(NodeNo: integer; aEcuID,aAlarmArea: string;
  aWachMode: TWatchMode);
var
  stDeviceID : string;
  stAlarmID : string;
  nAlarmIndex : integer;
  stImageObjectName : string;
  aImage : TImage;
  stImageDir : string;
  stImage : string;
  nTempIndex : integer;
  gif :TGifImage;
begin
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID + FillZeroStrNum(aAlarmArea,3);
  stAlarmID := FillZeroNumber(NodeNo,3) + aEcuID + aAlarmArea;
  nAlarmIndex := LocationDeviceList.IndexOf('4' + stDeviceID);
  if nAlarmIndex < 0 then Exit;

  stImageObjectName := LocationImageList.Strings[nAlarmIndex];
  aImage := TravelImageItem(stImageObjectName);
  if aImage = nil then Exit;

  stImageDir := ExeFolder + '\..\Resource\';

  nTempIndex := ArmAreaStateList.IndexOf(stAlarmID);
  if nTempIndex < 0 then exit;

  if (TArmAreaState(ArmAreaStateList.Objects[nTempIndex]).AlarmEventState = aeAlarmEvent) then
  begin
    stImage := stImageDir + MAPALARM;
  end else
  begin
    case  aWachMode of
      cmArm : begin stImage := stImageDir + MAPARM end;
      cmJaejung : begin stImage := stImageDir + MAPARM end;
      cmDisarm : begin stImage := stImageDir + MAPDISARM end;
      else begin stImage := stImageDir + MAPQUESTION end;
    end;
  end;
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

procedure TfmAlarmMapMonitoring.DeviceAlarmEventProcess(NodeNo: integer;
  ECUID,aArmAreaNo: string; aAlaramState: TAlarmEventState);
var
  stDeviceID : string;
  nDeviceIndex : integer;
  stImageObjectName : string;
  aImage : TImage;
  stImageDir : string;
  stImage : string;
  nTempIndex : integer;
  gif :TGifImage;
  nArmAreaNo : integer;
begin
  stDeviceID := FillZeroNumber(NodeNo,3) + ECUID ;
  nArmAreaNo := 0;
  if isDigit(aArmAreaNo) then nArmAreaNo := strtoint(aArmAreaNo);

  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then
  begin
    //등록되지 않은 기기 데이터
    Exit;
  end;


  nDeviceIndex := LocationDeviceList.IndexOf('4' + stDeviceID + FillZeroNumber(nArmAreaNo,3));
  if nDeviceIndex < 0 then Exit;

  stImageObjectName := LocationImageList.Strings[nDeviceIndex];
  aImage := TravelImageItem(stImageObjectName);
  if aImage = nil then Exit;

  stImageDir := ExeFolder + '\..\Resource\';

  nTempIndex := DeviceStateList.IndexOf(stDeviceID);
  if nTempIndex < 0 then Exit;
  if (aAlaramState = aeAlarmEvent) then
  begin
    stImage := stImageDir + MAPALARM;
  end else
  begin
    case  TDeviceState(DeviceStateList.Objects[nTempIndex]).GetAlarmMode(nArmAreaNo) of
      cmArm : begin stImage := stImageDir + MAPARM end;
      cmDisarm : begin stImage := stImageDir + MAPDISARM end;
      else begin stImage := stImageDir + MAPQUESTION end;
    end;
  end;
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

procedure TfmAlarmMapMonitoring.AlarmEventProcess(NodeNo: integer; ECUID,aArmAreaNo, aCmd,
  aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode, aStatusCode,
  aPortNo, aState, aOperator, aNewStateCode: string; aAlarmView,
  aAlarmSound: Boolean;aColor:string);
var
  stDeviceID : string;
  stAlarmName : string;
  nArmAreaIndex : integer;
  nDeviceIndex : integer;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stBuildingID : string;
  stBuildingName : string;
  nBuildingIndex : integer;
  nResult : integer;
  nAlarmSound : integer;

  stStatusName : string;
  stPortName : string;
  stModeStr : string;
  stType : string;
  stDeviceType : string;
begin
  stType := '이벤트';
  stDeviceID := FillZeroNumber(NodeNo,3) + ECUID;
  nArmAreaIndex := ArmAreaStateList.IndexOf(stDeviceID + aArmAreaNo);
  if nArmAreaIndex > -1 then
  begin
    stAlarmName := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).ArmAreaName;
    stBuildingCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).BuildingCode;
    stFloorCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).FloorCode;
    stAreaCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AreaCode;
  end else
  begin
    nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
    if nDeviceIndex > -1 then
    begin
      stAlarmName := TDeviceState(DeviceStateList.Objects[nDeviceIndex]).DeviceName;
    end;
  end;

  if BuildingStep = '0' then stBuildingID := stBuildingCode + '000000'
  else if BuildingStep = '1' then stBuildingID := stBuildingCode + stFloorCode + '000'
  else if BuildingStep = '2' then stBuildingID := stBuildingCode + stFloorCode + stAreaCode;
  if aAlarmSound then
  begin
    if (L_stSelectBuildingCode + L_stSelectFloorCode + L_stSelectAreaCode) <> stBuildingID then
    begin
      nBuildingIndex := GetBuildingIndex(stBuildingID);
      if nBuildingIndex > -1 then
      begin
        BuildingListView.ItemIndex := nBuildingIndex;
        BuildingListViewDblClick(BuildingListView);
      end;
    end;
  end;

  stDeviceType := GetDeviceType(aSubClass);
  stDeviceType := '[' + stDeviceType + '-' + aSubAddr + ']';
  nResult:= GetStatusCode(aStatusCode,stStatusName,nAlarmSound);
  if aPortNo <> '**' then
  begin
    if aState <> 'N' then
    begin
      stType := '침입';
      stDeviceType := '';
      //stPortName := GetPortName(FillZeroNumber(NodeNo,3),ECUID,aPortNo);
      if aSubCLass <> 'EL' then stPortName := GetPortName(FillZeroNumber(NodeNo,3),ECUID,aPortNo)
      else stPortName := dmDBFunction.GetDeviceName(FillZeroNumber(NodeNo,3),ECUID) + '_' + aSubAddr;
      if stStatusName = '' then
      begin
        stStatusName := '' + aPortNo + '번 침입' + '  ' + stPortName;// + stStatusName; //+ stPortNo +'번존 감지'; //stStatusName;    //어떤 조건으로 감지 되었는지 표시
      end else
      begin
        stStatusName := '' + stStatusName + '  ' + stPortName ;
      end;
    end else
    begin
      aAlarmSound := False;
      stStatusName := stStatusName +'[복구]' + stPortName ;
    end;
  end;
  aSubCLass := dmDBFunction.GetDeviceType(aSubCLass) + '[' + aSubAddr + ']';
  case UpperCase(aMode)[1] of
   'A': begin stModeStr:= '경계모드[A]' end;
   'D': begin stModeStr:= '해제모드[D]' end;
   'T': begin stModeStr:= '시험모드[T]' end;
   'I': begin stModeStr:= '등록모드[I]' end;
   'P': begin stModeStr:= '순회모드[P]' end;
  else  begin stModeStr:= '미등록모드['+aMode[1]+']' end;
  end;
  stStatusName := stDeviceType + stStatusName + '/' + stModeStr;

  if aAlarmSound then
  begin
    if PTAlarmUse then
    begin
      if aCmd = 'A' then
      begin
        self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := PTAlaramFile;
        self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
      end;
    end;
  end;
  if aAlarmView then
  begin
    if aCmd = 'A' then
    begin
      InsertAlarmList(aTime, //시간
                    stAlarmName, //경계구역명칭
                    stType,
                    stStatusName,
                    aAlarmSound,
                    aColor,
                    sg_Alarm);  //이벤트 내용
    end;
  end;

  if PTAlarmMessageUse then  //ZONE Sensing Message Use
  begin
    if aCmd = 'A' then
    begin
      if aAlarmSound then
      begin
        st_Message.Caption := stAlarmName + ':' + stStatusName;
        MessageTimer.Enabled := True;
      end;
    end;
  end;

end;

procedure TfmAlarmMapMonitoring.MessageTimerTimer(Sender: TObject);
begin
  pan_Message.Visible := Not pan_Message.Visible;

end;

procedure TfmAlarmMapMonitoring.btn_AlarmConfirmClick(Sender: TObject);
begin
  if fmMain.MediaPlayer1.Mode = mpPlaying then fmMain.MediaPlayer1.Stop;
  if fmMain.MediaPlayer2.Mode = mpPlaying then fmMain.MediaPlayer2.Stop;
  AlarmSoundFileList.Clear;
  MessageTimer.Enabled := False;
  pan_Message.visible := False;

end;

procedure TfmAlarmMapMonitoring.CenterPanel;
var
  nTotW,nTotH,nPanW,nPanH:integer;
  nTop,nLeft : integer;
  nStartH,nStartW : integer;
begin
  nStartH := 0;
  nStartW := 0;
  nTotW := Width;
  nTotH := Height;
  nPanW := pan_Message.Width;
  nPanH := pan_Message.Height;
  nTop := nStartH + (nTotH div 2) - (nPanH div 2);
  nLeft := nStartW + (nTotW div 2) - (nPanW div 2);
  pan_Message.Top := nTop;
  pan_Message.Left := nLeft;

end;

procedure TfmAlarmMapMonitoring.FormResize(Sender: TObject);
begin
  LocationMapShow(L_stSelectBuildingCode,L_stSelectFloorCode,L_stSelectAreaCode,False);
  CenterPanel;
end;

procedure TfmAlarmMapMonitoring.AlarmListClear;
begin

end;

procedure TfmAlarmMapMonitoring.ExitButtonPress(NodeNo: integer; aEcuID, aDoorNo,
  aTime, aInputType,aUserName,aPermitCode,aPermit: string);
var
  stDeviceID : string;
  stDoorID : string;
  stDoorName : string;
  nDeviceIndex : integer;
  nDoorIndex : integer;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stBuildingID : string;
  nBuildingIndex : integer;
  stBuildingName : string;
  stCompanyName : string;
  stJijumName : string;
  stDepartName : string;
  stEmCode : string;
  stEmName : string;
  stPermitName : string;
begin
{  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then
  begin
    //등록되지 않은 기기 데이터
    Exit;
  end;
  stDoorID := stDeviceID + aDoorNo;
  nDoorIndex := DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then Exit;
  stDoorName := IntDoorListView.Items[nDoorIndex].Caption;
  stBuildingName := DoorLocateList.Strings[nDoorIndex];

  if ACAlarmUse then
  begin
    if Not Isdigit(aPermitCode) then
    begin
      self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
      self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
    end;
  end;

  InsertDOORList(aPermitCode,aPermit,aTime,stBuildingName,stDoorName,aInputType,aUserName,
  '','','','',stDoorID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_IntAccess);     }
end;

procedure TfmAlarmMapMonitoring.AccessEventProcess(NodeNo: integer; aEcuID,
  aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
  aButton,aArmAreaNo: string);
var
  stDeviceID : string;
  stAlarmName : string;
  nDeviceIndex : integer;

  nResult : integer;
  nAlarmSound : integer;

  stStatusName : string;
  stPortName : string;
  stModeStr : string;
  stType : string;
  stDeviceType : string;
  stEmName,stCompanyName,stJijumName,stDepartName,stEmCode : string;
  stHandPhone,stCompanyPhone,stAddr1,stAddr2 : string;
begin
  stType := '출입';
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then
  begin
    //등록되지 않은 기기 데이터
    Exit;
  end;

  stAlarmName := TDeviceState(DeviceStateList.Objects[nDeviceIndex]).GetAlarmName(strtoint(aArmAreaNo));
  case aPermit[1] of
    '1' : begin stType := '출입승인' end;
    '2' : begin stType := '방범조작' end;
    else begin stType := '카드조작' end;
  end;

  GetUserInfo(aCardNo,stEmName,stCompanyName,stJijumName,stDepartName,stEmCode,stHandPhone,stCompanyPhone,stAddr1,stAddr2);

  if stEmName = '' then stEmName := aCardNo;

  InsertAlarmList(aTime, //시간
                stAlarmName, //경계구역명칭
                stType,
                stEmName,
                False,
                '255',
                sg_Alarm);  //이벤트 내용



end;

procedure TfmAlarmMapMonitoring.NodeConnectState(NodeNo: integer;
  aConnectState: TNodeCurrentState);
var
  aTreeView   : TTreeview;
  aNode       : TTreeNode;
  stCaption   : string;
  nIndex      : integer;
begin
  nIndex := DeviceCodeList.IndexOf('N'+FillZeroNumber(NodeNo,3));
  if nIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
  stCaption := DeviceCaptionList.Strings[nIndex];

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;

  case aConnectState of
    nsDisConnected :
      begin
        aNode.ImageIndex:=NodeDisConnectImageIndex;
        aNode.SelectedIndex:=NodeDisConnectImageIndex;
        aNode.StateIndex:= NothingStateIndex;
      end;
    nsConnected :
      begin
        aNode.ImageIndex:=NodeConnectImageIndex;
        aNode.SelectedIndex:=NodeConnectImageIndex;
        aNode.StateIndex:= NothingStateIndex;
      end;
    nsFault :
      begin
        aNode.ImageIndex:=NodeConnectImageIndex;
        aNode.SelectedIndex:=NodeConnectImageIndex;
        aNode.StateIndex:= NothingStateIndex;
      end;
    else
      begin
        aNode.ImageIndex:=NodeDisConnectImageIndex;
        aNode.SelectedIndex:=NodeDisConnectImageIndex;
        aNode.StateIndex:= NothingStateIndex;
      end;
  end;
  aTreeView.Refresh;
end;

procedure TfmAlarmMapMonitoring.LoadingBuilding;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stBuildingID : string;
  stBuildingName : string;
  nIndex : integer;
begin
  BuildingListView.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''' + BuildingStep + ''' ';
  stSql := stSql + ' Order by LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ';

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
      if recordcount < 1 then exit;
      nIndex := 0;
      While Not Eof do
      begin
        stBuildingID := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString + FindField('LO_AREACODE').AsString;
        //stBuildingName := FillZeroNumber(nIndex,3) + FindField('LO_NAME').AsString;
        stBuildingName := FindField('LO_NAME').AsString;
        BuildingListView.Items.Add.Caption:= stBuildingName;
        BuildingListView.Items[BuildingListView.Items.Count - 1].SubItems.Add(stBuildingID);     // 빌딩ID
        BuildingListView.Items[BuildingListView.Items.Count - 1].ImageIndex := 8;
        BuildingListView.Items[BuildingListView.Items.Count - 1].StateIndex := NothingStateIndex;
        nIndex := nIndex + 1;
        Next;
        Application.ProcessMessages;
      end;
      BuildingListView.ItemIndex := 0;
      BuildingListViewDblClick(BuildingListView);
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlarmMapMonitoring.BuildingListViewDblClick(Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  L_stSelectBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];
  L_stSelectBuildingCode := '000';
  L_stSelectFloorCode := '000';
  L_stSelectAreaCode := '000';
  L_stSelectBuildingCode := copy(stBuildingID,1,3);
  if strtoint(BuildingStep) > 0 then L_stSelectFloorCode := copy(stBuildingID,4,3);
  if strtoint(BuildingStep) > 1 then L_stSelectAreaCode := copy(stBuildingID,7,3);
  BuildingTab.Caption := L_stSelectBuildingName;
  LocationMapShow(L_stSelectBuildingCode,L_stSelectFloorCode,L_stSelectAreaCode,True);
  //MapLoad(stBuildingCode,stFloorCode,stAreaCode);
end;

function TfmAlarmMapMonitoring.MapLoad(aBuildingCode, aFloorCode,
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


procedure TfmAlarmMapMonitoring.SetDevice(aImage: TImage; aType, aName,
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
      if (aeDeviceAlarmEvent = aeAlarmEvent) then
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

procedure TfmAlarmMapMonitoring.ImageStateChange(aImage: TImage; aType,
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

function TfmAlarmMapMonitoring.TravelImageItem(aImage: string): TImage;
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

procedure TfmAlarmMapMonitoring.Image1MouseMove(Sender: TObject;
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
  if stType = '3' then  //Door 이면
  begin
    TImage(Sender).PopupMenu := PopupMenu_Door;
  end else if stType = '4' then  //Alarm 이면
  begin
    TImage(Sender).PopupMenu := PopupMenu_Alarm;
  end else TImage(Sender).PopupMenu := nil;

end;

procedure TfmAlarmMapMonitoring.LocationMapShow(aBuildingCode, aFloorCode,aSectorCode:string;bFirst: Boolean);
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
  //해당위치의 방범를 찾자
  stSql := stSql + ' select ''4'' as TYPE,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO as SEQ, '; //a.AL_DEVICENO as SEQ, ';
  stSql := stSql + ' a.AR_NAME as NAME,a.AR_TOTWIDTH as TOTW,a.AR_TOTHEIGHT as TOTH,';
  stSql := stSql + ' a.AR_CURX as CURX,a.AR_CURY as CURY,a.AR_LASTMODE as LASTMODE, ';
  stSql := stSql + ' ''0'' as LASTSTATE,''0'' as LASTPOSI ';
  stSql := stSql + ' FROM TB_ARMAREA a ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' AND a.LO_AREACODE = ''' + aSectorCode + ''' ';
  stSql := stSql + ' AND a.AR_USE = ''Y'' ';
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
        nArmAreaIndex := ArmAreaStateList.IndexOf(stDeviceID + inttostr(strtoint(stSeq)));
        if nArmAreaIndex > -1 then
        begin
          wmDeviceWatchmode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmMode;
          aeDeviceAlarmEvent := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmEventState;
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



procedure TfmAlarmMapMonitoring.mn_FullMapClick(Sender: TObject);
begin
  L_nLocationPer := sp_Location.Percent;
  L_nStatePer := sp_State.Percent;
  sp_Location.Percent := 0;
  sp_State.Percent := 100;
  fmMain.ToolBar1.Visible := False;
  fmMain.Menu := nil;
  fmMain.StatusBar1.Visible := False;

end;

procedure TfmAlarmMapMonitoring.mn_BasicMapClick(Sender: TObject);
begin
  sp_Location.Percent := 23;
  sp_State.Percent := 80;
  fmMain.ToolBar1.Visible := True;
  fmMain.Menu := fmMain.MainMenu1;
  fmMain.StatusBar1.Visible := True;

end;

procedure TfmAlarmMapMonitoring.ImageMapHide;
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

procedure TfmAlarmMapMonitoring.mn_ArmModeChangeClick(Sender: TObject);
var
  stAlarmID : string;
begin
  stAlarmID:= L_stSelectNodeNO + L_stSelectECUID + inttostr(strtoint(L_stSelectNO)) ;

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmAlarmMapMonitoring.mn_DisArmModeChangeClick(Sender: TObject);
var
  stAlarmID : string;
begin
  stAlarmID:= L_stSelectNodeNO + L_stSelectECUID + inttostr(strtoint(L_stSelectNO));

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmAlarmMapMonitoring.mn_AlarmConfirmClick(Sender: TObject);
var
  stDeviceID : string;
  nDeviceIndex : integer;
begin
  stDeviceID:= L_stSelectNodeNO + L_stSelectECUID ;

  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then Exit;
  TDeviceState(DeviceStateList.Objects[nDeviceIndex]).AlaramEventClear;

end;

function TfmAlarmMapMonitoring.GetDeviceType(aSubClass: string): string;
var
  stSql : string;
begin
  Result:= '';

  stSql := 'select * from tb_alarmdevicetypecode ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND  al_alarmdevicetypecode = ''' + aSubClass + ''' ';

  with DataModule1.ADOTmpQuery do
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
    result := FindField('al_alarmdevicetypename').AsString ;
  end;

end;

procedure TfmAlarmMapMonitoring.MemoryCreate;
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

  SetLength(AlarmIndexArray,sg_Alarm.ColCount);
  SetLength(relAlarmIndexArray,sg_Alarm.ColCount);

end;

procedure TfmAlarmMapMonitoring.MemoryDestory;
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

end;

procedure TfmAlarmMapMonitoring.Image1DblClick(Sender: TObject);
var
  stDeviceID : string;
  nDeviceIndex : integer;
begin
  stDeviceID:= L_stSelectNodeNO + L_stSelectECUID ;

  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then Exit;
  TDeviceState(DeviceStateList.Objects[nDeviceIndex]).AlaramEventClear;

end;

function TfmAlarmMapMonitoring.GetBuildingIndex(
  aBuildingID: string): integer;
var
  i : integer;
  stBuildingID : string;
begin
  result := -1;
  if BuildingListView.Items.Count < 1 then Exit;
  for i := 0 to BuildingListView.Items.Count - 1 do
  begin
    stBuildingID := BuildingListView.Items[i].SubItems.Strings[0];
    if stBuildingID = aBuildingID then
    begin
      result := i;
      break;
    end;
  end;
end;

procedure TfmAlarmMapMonitoring.iniConfigWrite;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  ini_fun.WriteString('AlarmMapMonitoring','DeviceTab',PageControl1.ActivePage.Name);

  for i := 0 to sg_Alarm.ColCount - 1 do
  begin
    MapAlarm1SizeTable[i] := sg_Alarm.ColWidths[i];
    ini_fun.WriteInteger('맵알람이벤트1사이즈',inttostr(i),sg_Alarm.ColWidths[i]);
  end;

  ini_fun.Free;
end;

procedure TfmAlarmMapMonitoring.iniConfigRead;
var
  ini_fun : TiniFile;
begin

  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  if UpperCase(ini_fun.ReadString('AlarmMapMonitoring','DeviceTab','tbDEVICE')) = 'TBLOCATE' then PageControl1.ActivePage := tbLOCATE
  else PageControl1.ActivePage := tbDEVICE;
  L_stMapHeigh := ini_fun.ReadString('맵환경','높이','32');
  L_stMapwidth := ini_fun.ReadString('맵환경','넓이','32');

  ini_fun.Free;

end;

procedure TfmAlarmMapMonitoring.CellHide;
var
  i : integer;
begin
  for i := 0 to sg_Alarm.ColCount - 1 do
  begin
    sg_Alarm.ColWidths[i] := MapAlarm1SizeTable[i];
    if sg_Alarm.ColWidths[i] = 0 then sg_Alarm.ColWidths[i] := 90;
  end;
end;

procedure TfmAlarmMapMonitoring.MapSize;
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

procedure TfmAlarmMapMonitoring.mn_FireRecoveryClick(Sender: TObject);
var
  stAlarmID : string;
begin
  stAlarmID:= L_stSelectNodeNO + L_stSelectECUID ;

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DIRECT'+ DATADELIMITER + stAlarmID + DATADELIMITER + 'RSM2500' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

  if G_bFireRelayUse then
  begin
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DIRECT'+ DATADELIMITER + stAlarmID + DATADELIMITER + 'RRY00' + FillZeroNumber(G_nFireRelayNumber,2) + 'f' + FillZeroNumber(G_nFireRelayTime,2) + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
  end;

end;

procedure TfmAlarmMapMonitoring.mn_DeviceChangeClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  stNodeNo := copy(stDeviceID,1,3);
  stEcuID := copy(stDeviceID,4,2);

  dmDBFunction.UpdateTB_ACCESSDEVICE_Field_StringValue(stNodeNo,stEcuID,'AC_DEVICECODE','');
  dmDBFunction.UpdateTB_DEVICESCHEDULE_Field_StringValue(stNodeNo,stEcuID,'','','DE_RCVACK','N');

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + stDeviceID + DATADELIMITER + 'Y' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert('0','00','0','0',stDeviceID , '컨트롤러교체');
end;

initialization
  RegisterClass(TfmAlarmMapMonitoring);
Finalization
  UnRegisterClass(TfmAlarmMapMonitoring);

end.
