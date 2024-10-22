unit uKTTypeMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, uSubForm, CommandArray, StdCtrls, ImgList,
  ToolPanels, Shader, ActnList, Menus, Grids, BaseGrid, AdvGrid,Clipbrd,
  Buttons,ADODB,ActiveX, DB,iniFiles, MPlayer,uDataModule1, AdvObj;

type
  TfmKTTypeMonitoring = class(TfmASubForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    PageControl1: TPageControl;
    tbLOCATE: TTabSheet;
    tbDEVICE: TTabSheet;
    PageControl2: TPageControl;
    IntegrationTab: TTabSheet;
    GroupBox2: TGroupBox;
    TreeView_Location: TTreeView;
    GroupBox3: TGroupBox;
    TreeView_Device: TTreeView;
    Shader2: TShader;
    Shader3: TShader;
    ActionList1: TActionList;
    Action_LoctionLoad: TAction;
    Action_DeviceLoad: TAction;
    Action_DoorLoad: TAction;
    Action_AlarmLoad: TAction;
    Action_FoodLoad: TAction;
    TreeView_LocationCode: TTreeView;
    Panel11: TPanel;
    Panel12: TPanel;
    Splitter5: TSplitter;
    Panel13: TPanel;
    GroupBox5: TGroupBox;
    IntDoorListView: TListView;
    Shader5: TShader;
    Panel14: TPanel;
    Splitter6: TSplitter;
    GroupBox6: TGroupBox;
    Shader6: TShader;
    Panel15: TPanel;
    Splitter7: TSplitter;
    Panel16: TPanel;
    Action_RecvData: TAction;
    PopupMenu_IntiDoor: TPopupMenu;
    pm_intiModeChange: TMenuItem;
    pm_intiOperateMode: TMenuItem;
    pm_intiOpenMode: TMenuItem;
    pm_intiStateCheck: TMenuItem;
    pm_intiDoorOpen: TMenuItem;
    Popup_Device: TPopupMenu;
    MenuItem7: TMenuItem;
    Menu_DeviceAllCardDown: TMenuItem;
    Menu_DeviceCardDown: TMenuItem;
    Menu_DeviceTimeSync: TMenuItem;
    Menu_DeviceReboot: TMenuItem;
    Popup_Locate: TPopupMenu;
    Menu_CurLocate: TMenuItem;
    PopupMenu_AlarmSetting: TPopupMenu;
    menu_Alarm: TMenuItem;
    menu_AlarmDisable: TMenuItem;
    PopupMenu_IntAlarm: TPopupMenu;
    Menu_IntAlarmSetting: TMenuItem;
    Menu_IntAlarmDisable: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    sg_IntAccess: TAdvStringGrid;
    sg_IntAlarm: TAdvStringGrid;
    Action_Reload: TAction;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    mn_LocationMap: TMenuItem;
    PopupMenu_intZone: TPopupMenu;
    MenuItem6: TMenuItem;
    Action_SensorLoad: TAction;
    PopupMenu_Sensor: TPopupMenu;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    ADOAlarmQuery: TADOQuery;
    IntAlarmListView: TListView;
    N21: TMenuItem;
    Action_intAlarmHistory: TAction;
    Action_AlarmHistory: TAction;
    Pan_Remark2: TPanel;
    Pan_Remark1: TPanel;
    Panel4: TPanel;
    Image1: TImage;
    StaticText1: TStaticText;
    Image10: TImage;
    StaticText10: TStaticText;
    Image11: TImage;
    StaticText11: TStaticText;
    pan_Message: TPanel;
    st_Message: TStaticText;
    btn_AlarmConfirm: TSpeedButton;
    MessageTimer: TTimer;
    N3: TMenuItem;
    N4: TMenuItem;
    N8: TMenuItem;
    N17: TMenuItem;
    pm_intiCloseMode: TMenuItem;
    pan_SmallIntro: TPanel;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image2: TImage;
    Image3: TImage;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    pan_LargeIntro: TPanel;
    Image4: TImage;
    Image5: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    toolslist: TImageList;
    statelist: TImageList;
    SmallDoorList: TImageList;
    AlarmSmallList: TImageList;
    LargeDoorList: TImageList;
    LargeAlarmList: TImageList;
    PopupMenu_IntAccess: TPopupMenu;
    MenuItem10: TMenuItem;
    MenuItem14: TMenuItem;
    mn_FireRecovery: TMenuItem;
    pm_intiJavarOpen: TMenuItem;
    pm_intiJavaraClose: TMenuItem;
    N18: TMenuItem;
    mi_AlarmConfirm: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    mn_AlarmReport: TMenuItem;
    N24: TMenuItem;
    pm_intiMasterMode: TMenuItem;
    pm_PosiNega: TMenuItem;
    Positive1: TMenuItem;
    Negative1: TMenuItem;
    N25: TMenuItem;
    mn_BuildingArm: TMenuItem;
    mn_BuildingDisArm: TMenuItem;
    N28: TMenuItem;
    mn_BuildingOpen: TMenuItem;
    mn_BuildingManage: TMenuItem;
    mn_BuildingClose: TMenuItem;
    mn_BuildingMaster: TMenuItem;
    EST1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action_LoctionLoadExecute(Sender: TObject);
    procedure Action_DeviceLoadExecute(Sender: TObject);
    procedure SocketWatchTimerTimer(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure Action_DoorLoadExecute(Sender: TObject);
    procedure Action_AlarmLoadExecute(Sender: TObject);
    procedure pm_intiStateCheckClick(Sender: TObject);
    procedure pm_intiDoorOpenClick(Sender: TObject);
    procedure pm_intiOpenModeClick(Sender: TObject);
    procedure pm_intiOperateModeClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure Menu_CurLocateClick(Sender: TObject);
    procedure TreeView_LocationClick(Sender: TObject);
    procedure TreeView_DeviceClick(Sender: TObject);
    procedure Menu_DeviceTimeSyncClick(Sender: TObject);
    procedure Menu_DeviceRebootClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand2Execute(Command: TCommand;
      Params: TStringList);
    procedure Menu_IntAlarmSettingClick(Sender: TObject);
    procedure Menu_IntAlarmDisableClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand3Execute(Command: TCommand;
      Params: TStringList);
    procedure Menu_DeviceAllCardDownClick(Sender: TObject);
    procedure Menu_DeviceCardDownClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand4Execute(Command: TCommand;
      Params: TStringList);
    procedure Action_ReloadExecute(Sender: TObject);
    procedure sg_IntAccessKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure mn_LocationMapClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand5Execute(Command: TCommand;
      Params: TStringList);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure Panel12Resize(Sender: TObject);
    procedure Panel15Resize(Sender: TObject);
    procedure Panel14Resize(Sender: TObject);
    procedure AlarmListViewDblClick(Sender: TObject);
    procedure IntAlarmListViewDblClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand6Execute(Command: TCommand;
      Params: TStringList);
    procedure MenuItem6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_IntAlarmDblClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure CommandArrayCommandsTCommand7Execute(Command: TCommand;
      Params: TStringList);
    procedure sg_AccessColumnMove(Sender: TObject; ACol: Integer;
      var Allow: Boolean);
    procedure sg_AccessColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_IntAccessColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_IntAlarmColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_AlarmColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure IntDoorListViewDblClick(Sender: TObject);
    procedure Action_intAlarmHistoryExecute(Sender: TObject);
    procedure sg_IntAccessDblClick(Sender: TObject);
    procedure CommandArrayCommandsTFIRERECOVERExecute(Command: TCommand;
      Params: TStringList);
    procedure FormResize(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure btn_AlarmConfirmClick(Sender: TObject);
    procedure Panel13Resize(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure pm_intiCloseModeClick(Sender: TObject);
    procedure IntDoorListViewClick(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure mn_FireRecoveryClick(Sender: TObject);
    procedure IntAlarmListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure pm_intiJavarOpenClick(Sender: TObject);
    procedure pm_intiJavaraCloseClick(Sender: TObject);
    procedure IntDoorListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure mi_AlarmConfirmClick(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure mn_AlarmReportClick(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure pm_intiMasterModeClick(Sender: TObject);
    procedure Positive1Click(Sender: TObject);
    procedure Negative1Click(Sender: TObject);
    procedure mn_BuildingArmClick(Sender: TObject);
    procedure mn_BuildingDisArmClick(Sender: TObject);
    procedure mn_BuildingOpenClick(Sender: TObject);
    procedure mn_BuildingManageClick(Sender: TObject);
    procedure mn_BuildingCloseClick(Sender: TObject);
    procedure mn_BuildingMasterClick(Sender: TObject);
    procedure EST1Click(Sender: TObject);
    procedure CommandArrayCommandsTMAPCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    L_bFirst : Boolean;
    L_bClose : Boolean;

    procedure CenterPanel;
  public
    DeviceCodeList : TStringList; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
    DeviceCaptionList : TStringList; //기기명을 가지고 있다.
    DeviceLastTimeList : TStringList; //마지막 접속시간을 가지고 있다.
    DoorCodeList : TStringList;   // Door코드를 가지고 있다
    intDoorCodeList : TStringList;   // Door코드를 가지고 있다
    DoorLocateList : TStringList; // Door의 위치정보를 가지고 있다. (000000000위치정보)
    AlarmDeviceIDList : TStringList;  //방범기기 아이디를 가지고 있다.
    AlarmNoList : TStringList;
    AlarmFormDisplayList : TStringList;
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

    AlarmIndexArray: Array of integer; //알람 리스트 순서 배열
    relAlarmIndexArray:Array of integer; //실제 위치
    IntAlarmIndexArray:Array of integer; //통합 알람 리스트 순서 배열
    relIntAlarmIndexArray:Array of integer; //통합 알람 실제 위치

    procedure BuildingAlarmControl(aBuildingCode,aFloorCode,aAreaCode,aCmd :string);
    procedure BuildingDoorControl(aBuildingCode,aFloorCode,aAreaCode,aCmd :string);
    procedure DoorLoad(aBuildingCode,aFloorCode,aAreaCode :string; DoorList:TListView);
    procedure AlarmLoad(aBuildingCode,aFloorCode,aAreaCode :string; AlarmList:TListView);
    procedure DeviceStateRefresh;
    procedure DoorStateRefresh;
    procedure AlarmStateRefresh;
    procedure AlaramConfirm(aNodeNo,aEcuID,aArmAreaNo:string);
  private
    procedure MemoryCreate;
    procedure MemoryDestory;
    procedure iniConfigRead;
    procedure iniConfigWrite;
    procedure ListHeaderNameSet;
    procedure CellHide;

  private
    { Private declarations }

    procedure DisConnectServer;
    procedure ConnectServer;
    procedure DisConnectNode(aNodeNo:string);
    procedure ConnectNode(aNodeNo:string);
    procedure DisConnectECU(aECUID:string);
    procedure ConnectECU(aECUID:string);
    procedure DisConnectDoor(aDoorID:string);
    procedure DisConnectAlarm(aAlarmID:string);
    procedure RcvCardReadData(aNodeNo,aReceiveData:string); //카드리딩 데이터 처리
    procedure DeviceRcvAlarmData(aNodeNo,aReceiveData: string); //알람 데이터 처리
    procedure RcvChangeDoorData(aNodeNo,aReceiveData:string); //상태변경 데이터 처리
    procedure RcvDoorControl(aNodeNo,aReceiveData:string);
    Function GetBuildingName(aBuildingCode:string):string;
    Function GetFloorName(aBuildingCode,aFloorCode:string):string;
    Function GetAreaName(aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetDeviceBuildingName(NodeNo:integer;aEcuID:string):string;
    Function GetDeviceName(NodeNo:integer;aEcuID:string):string;
    Function GetPermitState(aPermit:string):string;
    Function GetUserInfo(aCardNo:string; var stUserName,stCompanyName,stJijumName,stDepartName,stEmID,stHandPhone,stCompanyPhone,stAddr1,stAddr2:string):Boolean;
    procedure LoadCompanyCode;
    procedure LoadJijumCode;
    procedure LoadDepartCode;
    procedure InsertDOORList(aPermitCode,aPermit,aTime,aLocationName,aDoorName,aCardNo,aUserName,
    aCompanyName,aJijumName,aDepartName,aEmID,aDoorID,aHandPhone,aCompanyPhone,aAddr1,aAddr2:string;List:TAdvStringGrid);
    procedure   InsertAlarmList(aTime, //시간
                  aLocateName, //위치정보
                  aAlarmName, //경계구역명칭
                  aDeviceID,  //주장치번호[메시지번호]
                  aDeviceType,         //발생기기[번호]
                  aStatusCode,  //이벤트코드
                  aStatusName,
                  aAlaramCode:string;
                  aAlarmSound:integer;
                  aColor:string;
                  List:TAdvStringGrid);  //이벤트 내용
    procedure Insertsg_SensorList(aTime,aNodeNo,aECUID,aPortNo,aDeviceType,aStatusCode,aStatusName,aPortName:string;List:TAdvStringGrid);

    Function GetStatusCode(aStatusCode:string;var aStatusName :string;aAlarmSound:integer) : integer;
    procedure ClearEmpInfo;
    Function UPDATETB_USERCONFIG(aConfigGroup,aConfigID,aValue : string):Boolean;
    Function InsertTB_USERCONFIG(aConfigGroup,aConfigID,aValue : string):Boolean;
    procedure Form_Initialize;
    procedure DeviceConnectStatus(aReceiveData:string);
    procedure NodeConnectStatus(aReceiveData:string);

    Function updateTB_ZONEDEVICEState(aAlarmNo,aZoneNum,aState:string):Boolean;
    procedure DisplaySensorState(aNodeNo,aECUID,aPortNo,aMode,aSubCLass,aStatusCode:string;bZoneSensor:Boolean);
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
    procedure GridSetting;
    procedure ChangeDoorIndex(FromIndex,ToIndex:integer);
    procedure ChangeIntDoorIndex(FromIndex,ToIndex:integer);
    procedure ChangeAlarmIndex(FromIndex,ToIndex:integer);
    procedure ChangeIntAlarmIndex(FromIndex,ToIndex:integer);

    procedure sg_AccessHeaderNameSet;
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
                                  aDoorLockType:TDoorLockState;
                                  aDoorFire:Boolean);
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
    procedure DisplayArmAreaMapShow(aBuildingCode,aNodeNo,aECUID,aArmArea: string);
    procedure DisplayArmAreaMapModeChange(aBuildingCode,aNodeNo,aECUID,aArmArea: string);
  public
    procedure AlarmListClear; //알람 리스트 Clear 후 재 로딩

  end;

var
  fmKTTypeMonitoring: TfmKTTypeMonitoring;


implementation

uses
  uLomosUtil,
  uLocationMap,
  uDeviceMap,
  uDeviceInfo,
  uZonePosition,
  uMDBSql,
  uPostGreSql,
  uMssql,
  uAlarmSet,
  uAlarmHistory,
  uFireBird,
  UCommonModule,
  uMonitoringCommonVariable,
  uDeviceState, uJavara, uAlarmConfirm, uDBFunction, uMain, uAlarmMap;
{$R *.dfm}




procedure TfmKTTypeMonitoring.FormCreate(Sender: TObject);
begin
  L_bFirst := True;
  L_bClose := False;
 
  MemoryCreate;
  iniConfigRead;
  ListHeaderNameSet;
  CellHide;
  mn_FireRecovery.Visible := G_bFireRelayUse;
end;

procedure TfmKTTypeMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i : integer;
begin
  L_bClose := True;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'KTTypeMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  iniConfigWrite;

  if AlarmFormDisplayList.Count > 0 then
  begin
    for i := AlarmFormDisplayList.Count - 1 downto 0 do  TfmAlarmMap(AlarmFormDisplayList.Objects[i]).Free;
  end;
  AlarmFormDisplayList.Clear;
  MemoryDestory;

  Action := caFree;

end;

procedure TfmKTTypeMonitoring.Action_LoctionLoadExecute(Sender: TObject);
var
  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  stLocationCode,stLocationCaption : string;
  stParentCode : string;
begin
  if L_bClose then Exit;
  Try
    aTreeView := TreeView_Location;
    aTreeView.ReadOnly:= True;
    aTreeView.Items.Clear;
    vTreeView := TreeView_LocationCode;   //위치 코드 등록으로 현재 상태를 파악하기 위함
    vTreeView.ReadOnly := True;
    vTreeView.Items.Clear;

    aNode:= aTreeView.Items.Add(nil,'위치');
    aNode.ImageIndex:=11;
    aNode.SelectedIndex:=11;
    aNode.StateIndex:= -1;
    vNode1 := vTreeView.Items.Add(nil,'000000000');

    if DBTYPE = 'MDB' then stSql := MDBSql.SelectDongLocation
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectDongLocation
    else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectDongLocation
    else if DBTYPE = 'FB' then stSql := FireBird.SelectDongLocation
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
        stLocationCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
        stLocationCaption := FindField('LO_NAME').AsString;
        if FindField('LO_GUBUN').AsString = '0' then  //빌딩 등록
        begin
          bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
          bNode.ImageIndex:=8;
          bNode.SelectedIndex:=8;
          bNode.StateIndex:= -1;
          bNode.Expanded := True;
          vNode2 := vTreeView.Items.AddChild(vNode1,stLocationCode);
        end;
        Application.ProcessMessages;
        Next;
      end;
      aNode.Expanded := True;
    end;

    if DBTYPE = 'MDB' then stSql := MDBSql.SelectFloorLocation
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectFloorLocation
    else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectFloorLocation
    else if DBTYPE = 'FB' then stSql := FireBird.SelectFloorLocation
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

      //if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        if L_bClose then Exit;
        stParentCode := FindField('LO_DONGCODE').AsString + '000000';
        stLocationCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
        stLocationCaption := FindField('LO_NAME').AsString;
        if FindField('LO_GUBUN').AsString = '1' then  //층 등록
        begin
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
              cNode.ImageIndex:=9;
              cNode.SelectedIndex:=9;
              cNode.StateIndex:= -1;
              bNode.Expanded := True;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then
            begin
              vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
            end;
            vNode1.Expanded := True;

          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;

    if DBTYPE = 'MDB' then stSql := MDBSql.SelectAreaLocation
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectAreaLocation
    else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectAreaLocation
    else if DBTYPE = 'FB' then stSql := FireBird.SelectAreaLocation
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

      //if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        if L_bClose then Exit;
        stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString + '000';
        stLocationCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
        stLocationCaption := FindField('LO_NAME').AsString;
        if FindField('LO_GUBUN').AsString = '2' then  //구역 등록
        begin
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
              cNode.ImageIndex:=10;
              cNode.SelectedIndex:=10;
              cNode.StateIndex:= -1;
              bNode.Expanded := True;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;

    if G_nBuildingVisible = 1 then Exit;

    if AccessUse then
    begin
      //출입문정보 로딩
      stSql := ' Select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE, ';
      stSql := stSql + ' b.AC_NODENO,b.AC_MCUID,b.AC_ECUID,b.DO_DOORNO,b.DO_DOORNONAME ';
      stSql := stSql + ' From TB_DOOR b ';
      if Not IsMaster then
      begin
        if BuildingGrade = 4 then
        begin
          stSql := stSql + ' Inner Join TB_ADMINDOOR a ';
          stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
          stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
          stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
          stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO )' ;
        end;
      end;
      stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
      if Not IsMaster then
      begin
        if BuildingGrade = 1 then
        begin
          stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        end else if BuildingGrade = 2 then
        begin
          stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
          stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
        end else if BuildingGrade = 3 then
        begin
          stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
          stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
          stSql := stSql + ' AND b.LO_AREACODE = ''' + MasterAreaCode + ''' ';
        end else if BuildingGrade = 4 then stSql := stSql + ' AND a.AD_USERID = ''' + Master_ID + ''' ';
      end;
      stSql := stSql + ' Order by b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE';

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
          stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
          stLocationCode := 'D1' + FillzeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString ;
          stLocationCaption := FindField('DO_DOORNONAME').AsString;
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
              cNode.ImageIndex:=12;
              cNode.SelectedIndex:=12;
              cNode.StateIndex:= -1;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
          Application.ProcessMessages;
          Next;
        end;
      end;
    end;

    if PatrolUse then
    begin
      //경비구역 정보 로딩
      stSql := ' Select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE, ';
      stSql := stSql + ' b.AC_NODENO,b.AC_ECUID,b.AR_AREANO,b.AR_NAME ';
      stSql := stSql + ' From TB_ARMAREA b ';
      if Not IsMaster then
      begin
        if BuildingGrade = 4 then
        begin
          stSql := stSql + ' Inner Join TB_ADMINALARMAREA a ';
          stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
          stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
          stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
          stSql := stSql + ' AND a.AR_AREANO = b.AR_AREANO ) ';
        end;
      end;
  {    stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
      stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND b.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND b.AC_ECUID = c.AC_ECUID ) ';  }
      stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
      if Not IsMaster then
      begin
        if BuildingGrade = 1 then
        begin
          stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        end else if BuildingGrade = 2 then
        begin
          stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
          stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
        end else if BuildingGrade = 3 then
        begin
          stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
          stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
          stSql := stSql + ' AND b.LO_AREACODE = ''' + MasterAreaCode + ''' ';
        end else if BuildingGrade = 4 then stSql := stSql + ' AND a.AD_USERID = ''' + Master_ID + ''' ';
      end;
      stSql := stSql + ' AND b.AR_USE = ''Y'' ';
      stSql := stSql + ' Order by b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE';

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
          stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
          stLocationCode := 'D2' + FillzeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString + inttostr(FindField('AR_AREANO').AsInteger) ;
          stLocationCaption := FindField('AR_NAME').AsString;
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
              cNode.ImageIndex:=13;
              cNode.SelectedIndex:=13;
              cNode.StateIndex:= -1;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
          Application.ProcessMessages;
          Next;
        end;
      end;
    end;

    if FoodUse then
    begin
      //식수구역 정보 로딩
      stSql := ' Select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE, ';
      stSql := stSql + ' b.AC_NODENO,b.AC_MCUID,b.AC_ECUID,b.FO_DOORNO,b.FO_NAME ';
      stSql := stSql + ' From TB_FOOD b ';
      if Not IsMaster then
      begin
        if BuildingGrade = 4 then
        begin
          stSql := stSql + ' Inner Join TB_ADMINFOOD a ';
          stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
          stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
          stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
          stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
        end;
      end;
      stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
      if Not IsMaster then
      begin
        if BuildingGrade = 1 then
        begin
          stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        end else if BuildingGrade = 2 then
        begin
          stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
          stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
        end else if BuildingGrade = 3 then
        begin
          stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
          stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
          stSql := stSql + ' AND b.LO_AREACODE = ''' + MasterAreaCode + ''' ';
        end else if BuildingGrade = 4 then stSql := stSql + ' AND a.AD_USERID = ''' + Master_ID + ''' ';
      end;
      stSql := stSql + ' Order by b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE';

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
          stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
          stLocationCode := 'D3' +  FillzeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString + FindField('FO_DOORNO').AsString ;
          stLocationCaption := FindField('FO_NAME').AsString;
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
              cNode.ImageIndex:=14;
              cNode.SelectedIndex:=14;
              cNode.StateIndex:= -1;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
          Application.ProcessMessages;
          Next;
        end;
      end;
    end;
  Except
    exit;
  End;

end;

procedure TfmKTTypeMonitoring.Action_DeviceLoadExecute(Sender: TObject);
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
  if L_bClose then Exit;
  Try
    aTreeView := TreeView_Device;
    aTreeView.ReadOnly:= True;
    aTreeView.Items.Clear;
    DeviceCodeList.Clear;
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
          DeviceCodeList.Add('A' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring +inttostr(FindField('AR_AREANO').AsInteger) );
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
  Except
    Exit;
  End;
end;

procedure TfmKTTypeMonitoring.SocketWatchTimerTimer(Sender: TObject);
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

procedure TfmKTTypeMonitoring.DisConnectNode(aNodeNo: string);
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
  
  aTreeView := TreeView_Device;
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

procedure TfmKTTypeMonitoring.ConnectNode(aNodeNo: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  nIndex : integer;
begin
{  nIndex := DeviceCodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
  stCaption := DeviceCaptionList.Strings[nIndex];

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  aNode.ImageIndex:=2;
  aNode.SelectedIndex:=2;
  aNode.StateIndex:= -1;
  aTreeView.Refresh;}
end;


procedure TfmKTTypeMonitoring.ConnectECU(aECUID: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  stDoorID : string;
  nIndex : integer;
begin
{  ConnectNode('N' + copy(aECUID,2,3));
  nIndex := DeviceCodeList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
  stCaption := DeviceCaptionList.Strings[nIndex];
  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;

  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  if aNode.ImageIndex <> 4 then aNode.ImageIndex:=4;
  if aNode.SelectedIndex <> 4 then aNode.SelectedIndex:=4;
  aNode.StateIndex:= -1;
  aTreeView.Refresh; }
end;

procedure TfmKTTypeMonitoring.DisConnectECU(aECUID: string);
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
  if bRefresh then aTreeView.Refresh; }
end;

procedure TfmKTTypeMonitoring.CommandArrayCommandsTCommand0Execute(
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

procedure TfmKTTypeMonitoring.Action_DoorLoadExecute(Sender: TObject);
begin
  DoorLoad('000','000','000',IntdoorListView);
end;

// 문정보를 로드  하여 해당 리스트에 조회 하자
procedure TfmKTTypeMonitoring.DoorLoad(aBuildingCode, aFloorCode,
  aAreaCode: string; DoorList: TListView);
var
  stSql : string;
  stDoorID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
  stCode : string;
  stDeviceID : string;
  nDeviceIndex : integer;
  nDoorIndex : integer;
begin
  if L_bClose then Exit;
  DoorCodeList.Clear;
  DoorLocateList.Clear;
  DoorList.Clear;
  //Door정보 로딩
  stSql := ' Select a.DO_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,c.AC_JAVARATYPE ';
  stSql := stSql + ' From TB_DOOR a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  end;
  
  stSql := stSql + ' Group by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,c.AC_JAVARATYPE ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ ';

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

    if RecordCount < 1 then
    begin
      Exit;
    end;
    
    First;
    i:=0;
    While Not Eof do
    begin
      if L_bClose then Exit;
      DoorList.Items.Add.Caption:= FindField('DO_DOORNONAME').asString;
      stDeviceID := FillZeroNumber( FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString;
      stDoorID:= stDeviceID + FindField('DO_DOORNO').AsString ;
      DoorList.Items[I].SubItems.Add(stDoorID);     // 문 ID
      stBuildingName := GetBuildingName(FindField('LO_DONGCODE').AsString);
      stFloorName := GetFloorName(FindField('LO_DONGCODE').AsString,FindField('LO_FLOORCODE').AsString);
      stAreaName := GetAreaName(FindField('LO_DONGCODE').AsString,FindField('LO_FLOORCODE').AsString ,FindField('LO_AREACODE').AsString);
      stLocate := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
      stLocate := stLocate + stBuildingName ;
      if stFloorName <> '' then
      begin
        stLocate := stLocate + '-' + stFloorName ;
        if stAreaName <> '' then stLocate := stLocate + '-' + stAreaName ;
      end;
      DoorLocateList.Add(stLocate);
      DoorList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3)); //노드번호
      DoorList.Items[I].SubItems.Add(FindField('AC_MCUID').AsString); //MCUID
      DoorList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
      DoorList.Items[I].SubItems.Add(FindField('DO_DOORNO').AsString); //문번호
      DoorList.Items[I].SubItems.Add(''); //이벤트타입 'F : 화재,C:카드,B:버튼
      DoorList.Items[I].SubItems.Add(''); //카드번호
      DoorList.Items[I].SubItems.Add(''); //이름
      DoorList.Items[I].SubItems.Add(FindField('AC_JAVARATYPE').AsString); //자바라타입

      nDoorIndex := DoorStateList.IndexOf(stDeviceID + FindField('DO_DOORNO').AsString);
      if nDoorIndex > -1 then
      begin
        if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode = pnPositive then
        begin
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmManager then
          begin
            DoorList.Items[I].StateIndex:= DoorPosiManageStateIndex;
          end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmOpen then
          begin
            DoorList.Items[I].StateIndex:= DoorOpenModeStateIndex;
          end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmLock then
          begin
            DoorList.Items[I].StateIndex:= DoorCloseModeStateIndex;
          end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmMaster then
          begin
            DoorList.Items[I].StateIndex:= DoorMasterModeStateIndex;
          end else
          begin
            DoorList.Items[I].StateIndex:=DoorOpenModeStateIndex;
          end;
        end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode = pnNegative then
        begin
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmManager then
          begin
            DoorList.Items[I].StateIndex:= DoorNegaManageStateIndex;
          end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmOpen then
          begin
            DoorList.Items[I].StateIndex:= DoorOpenModeStateIndex;
          end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmLock then
          begin
            DoorList.Items[I].StateIndex:= DoorCloseModeStateIndex;
          end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmMaster then
          begin
            DoorList.Items[I].StateIndex:= DoorMasterModeStateIndex;
          end else
          begin
            DoorList.Items[I].StateIndex:=DoorOpenModeStateIndex;
          end;
        end else
        begin
          DoorList.Items[I].StateIndex:=DoorOpenModeStateIndex;
        end;
        if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire then
        begin
          DoorList.Items[I].ImageIndex := DoorFireStateImageIndex;
        end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsClose then
        begin
          DoorList.Items[I].ImageIndex := DoorCloseStateImageIndex;
        end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsOpen then
        begin
          DoorList.Items[I].ImageIndex := DoorOpenStateImageIndex;
        end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsLongTime then
        begin
          DoorList.Items[I].ImageIndex := DoorLongTimeStateImageIndex;
        end else
        begin
          DoorList.Items[I].ImageIndex := DoorNothingStateImageIndex;
        end;
      end else
      begin
        DoorList.Items[I].ImageIndex:=DoorNothingStateImageIndex;
      end;

      inc(i);
      Application.ProcessMessages;
      Next;
    end;
  end;
  DoorCodeList.Clear;
  for i:=0 to DoorList.Items.Count - 1 do
  begin
    stCode := DoorList.Items[I].SubItems.Strings[0];
    DoorCodeList.Add(stCode);  //문의 코드를 등록하자
  end;

  if DoorList.ViewStyle = vsList then
  begin
    DoorList.ViewStyle := vsIcon;
    DoorList.Refresh;
    DoorList.ViewStyle := vsList;
  end;

end;

procedure TfmKTTypeMonitoring.AlarmLoad(aBuildingCode, aFloorCode,
  aAreaCode: string; AlarmList: TListView);
var
  stSql : string;
  stAlarmID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
  nAlarmIndex : integer;
begin
  if L_bClose then Exit;
  Try
    AlarmDeviceIDList.Clear;
    AlarmNoList.Clear;
    AlarmLocateList.Clear;
    AlarmList.Clear;

    //Alarm정보 로딩
    stSql := ' Select a.AR_VIEWSEQ,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO,a.AR_NAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
    stSql := stSql + ' From TB_ARMAREA a ';
    if Not IsMaster then
    begin
      if BuildingGrade = 4 then
      begin
        stSql := stSql + ' Inner Join TB_ADMINALARMAREA b ';
        stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
        stSql := stSql + ' AND a.AR_AREANO = b.AR_AREANO ) ';
      end;
    end;
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.AR_USE = ''Y'' ';
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
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
    stSql := stSql + ' Order by a.AR_VIEWSEQ ,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      i:=0;
      While Not Eof do
      begin
        if L_bClose then Exit;
        //AlarmList.Columns.Add.AutoSize := True;
        AlarmList.Items.Add.Caption:= FindField('AR_NAME').asString;
        stAlarmID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                   + FindField('AC_ECUID').AsString + inttostr(FindField('AR_AREANO').AsInteger);// + FillZeroNumber(FindField('AL_DEVICENO').AsInteger,3);
        AlarmList.Items[I].SubItems.Add(stAlarmID);     // 방범 ID
        //AlarmCodeList.Add(stAlarmID);  //방범아이디를 등록하자
        AlarmNoList.Add(stAlarmID);
        stBuildingName := GetBuildingName(FindField('LO_DONGCODE').AsString);
        stFloorName := GetFloorName(FindField('LO_DONGCODE').AsString,FindField('LO_FLOORCODE').AsString);
        stAreaName := GetAreaName(FindField('LO_DONGCODE').AsString,FindField('LO_FLOORCODE').AsString ,FindField('LO_AREACODE').AsString);
        stLocate := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
        stLocate := stLocate + stBuildingName ;
        if stFloorName <> '' then
        begin
          stLocate := stLocate + '-' + stFloorName ;
          if stAreaName <> '' then stLocate := stLocate + '-' + stAreaName ;
        end;
        AlarmLocateList.Add(stLocate);

        AlarmList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3)); //노드번호
        AlarmList.Items[I].SubItems.Add(''); //MCUID
        AlarmList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
        AlarmList.Items[I].SubItems.Add(stAlarmID); //알람아이디

        nAlarmIndex := ArmAreaStateList.IndexOf(stAlarmID);
        if nAlarmIndex > -1 then
        begin
          if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmArm then
          begin
            AlarmList.Items[I].ImageIndex:=AlarmModeStateImageIndex;
          end else if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmDisarm then
          begin
            AlarmList.Items[I].ImageIndex:=DisAlarmModeStateImageIndex;
          end else if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmPatrol then
          begin
            AlarmList.Items[I].ImageIndex:= AlarmPatrolStateImageIndex;
          end else if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmInit then
          begin
            AlarmList.Items[I].ImageIndex:= AlarmInitStateImageIndex;
          end else if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmTest then
          begin
            AlarmList.Items[I].ImageIndex:= AlarmTestStateImageIndex;
          end else
          begin
            AlarmList.Items[I].ImageIndex:= AlarmNothingStateImageIndex;
          end;
          if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmEventState = aeAlarmEvent then
          begin
            AlarmList.Items[I].ImageIndex:= AlarmEventStateImageIndex;
          end;
        end else
        begin
          AlarmList.Items[I].ImageIndex:=AlarmNothingStateImageIndex;
        end;

        inc(i);
        Application.ProcessMessages;
        Next;
      end;
    end;
    AlarmDeviceIDList.Clear;
    for i:=0 to AlarmList.Items.Count - 1 do
    begin
      AlarmDeviceIDList.Add(AlarmList.Items[I].SubItems.Strings[0]);  //경비구역의 코드를 등록하자
    end;
    if AlarmList.ViewStyle = vsList then
    begin
      AlarmList.ViewStyle := vsIcon;
      AlarmList.Refresh;
      AlarmList.ViewStyle := vsList;
    end;
  Except
    Exit;
  End;
end;

procedure TfmKTTypeMonitoring.Action_AlarmLoadExecute(Sender: TObject);
begin
  AlarmLoad('000','000','000',IntAlarmListView);
end;

procedure TfmKTTypeMonitoring.pm_intiStateCheckClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  for i := 0 to IntdoorListView.Items.Count - 1 do
  begin
    if IntdoorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
    end;
  end;


end;

procedure TfmKTTypeMonitoring.pm_intiDoorOpenClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  for i := 0 to IntdoorListView.Items.Count - 1 do
  begin
    if IntdoorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','출입승인')
    end;
  end;

end;

procedure TfmKTTypeMonitoring.pm_intiOpenModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  for i := 0 to IntdoorListView.Items.Count - 1 do
  begin
    if IntdoorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPENMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','개방모드')
    end;
  end;
end;

procedure TfmKTTypeMonitoring.pm_intiOperateModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    Application.MessageBox(PChar('화재발생시에는 화재 복구 완료 후에 운영모드 가능합니다.'),'정보',MB_OK);
    Exit;
  end;
  for i := 0 to IntdoorListView.Items.Count - 1 do
  begin
    if IntdoorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','운영모드')
    end;
  end;


end;

procedure TfmKTTypeMonitoring.CommandArrayCommandsTCommand1Execute(
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

procedure TfmKTTypeMonitoring.Menu_CurLocateClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  DoorLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),IntdoorListView);
  AlarmLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),IntAlarmListView);

{  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
}
end;

procedure TfmKTTypeMonitoring.TreeView_LocationClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then TreeView_Location.PopupMenu:= nil
  else TreeView_Location.PopupMenu:= Popup_Locate;

  if G_nBuildingVisible <> 1 then Exit;
  if stLocateID[1] = 'D' then Exit;
  DoorLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),IntdoorListView);
  AlarmLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),IntAlarmListView);

end;

procedure TfmKTTypeMonitoring.TreeView_DeviceClick(Sender: TObject);
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
    if IsInsertGrade or IsUpdateGrade  then
      TreeView_Device.PopupMenu:= Popup_Device;
  end
  else TreeView_Device.PopupMenu:= nil;

end;

procedure TfmKTTypeMonitoring.Menu_DeviceTimeSyncClick(Sender: TObject);
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

procedure TfmKTTypeMonitoring.Menu_DeviceRebootClick(Sender: TObject);
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

procedure TfmKTTypeMonitoring.CommandArrayCommandsTCommand2Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmKTTypeMonitoring.Menu_IntAlarmSettingClick(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if IntAlarmListView.SelCount < 1 then
  begin
    showmessage('방범구역을 선택해 주세요.');
    Exit;
  end;
  for i := 0 to IntAlarmListView.Items.Count - 1 do
  begin
    if IntAlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmDeviceIDList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,copy(stAlarmID,6,1),'0000000000','경계모드')
    end;
  end;

end;

procedure TfmKTTypeMonitoring.Menu_IntAlarmDisableClick(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if IntAlarmListView.SelCount < 1 then
  begin
    showmessage('방범구역을 선택해 주세요.');
    Exit;
  end;
  for i := 0 to IntAlarmListView.Items.Count - 1 do
  begin
    if IntAlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmDeviceIDList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,copy(stAlarmID,6,1),'0000000000','해제모드')
    end;
  end;

end;

procedure TfmKTTypeMonitoring.CommandArrayCommandsTCommand3Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd: string;
  i : integer;
begin
  stCmd := Params.Values['Data'];

  for i:=0 to AlarmDeviceIDList.Count - 1 do
  begin
    if stCmd = 'ALARMSETTING' then  //전체경계
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + AlarmDeviceIDList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end else if stCmd = 'ALARMDISABLE' then  //전체해제
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + AlarmDeviceIDList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end;
  end;

end;

procedure TfmKTTypeMonitoring.RcvCardReadData(aNodeNo, aReceiveData: string);
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
  bFire : Boolean;
begin
{  if Length(aReceiveData) < 49 then Exit;

  bFire := False;

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
  end else
  begin
    if nCardNoLen = 0 then bExitButton := True
    else
    begin
      stCardNo:= Copy(aReceiveData,44,nCardNoLen);
      stTemp := FillZeroNumber(0,nCardNoLen);
      if stCardNo = stTemp then bExitButton := True; //Exit 버튼 눌른것임
    end;

    if Not bExitButton then
    begin
      if CARDLENGTHTYPE = 1 then
      begin
        if IsNumericCardNo then stCardNo:= inttostr(Hex2Dec64(stCardNo));
      end else if CARDLENGTHTYPE = 2 then     //KT사옥이면
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

  if Not bExitButton then
  begin
    GetUserInfo(stCardNo,stUserName,stCompanyName,stJijumName,stDepartName,stEmID,stHandPhone,stCompanyPhone,stAddr1,stAddr2);
    //카드승인유무체크
    stPermitCode:= aReceiveData[39];
    stPermit := GetPermitState(stPermitCode);
  end else
  begin
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
        'S': begin
             stUserName := '스케줄';
             stPermit := '스케줄열림';
             end;
        'F': begin
             stUserName := '화재발생';
             stPermit := '화재열림';
             bFire := True;
             end;
        'f': begin
             stUserName := '원격화재';
             stPermit := '원격화재열림';
             bFire := True;
             end;
        'C': begin
             stUserName := '카드';
             stPermit := '카드열림';
             end;
      else stUserName:= cInputType;
      end;
  end;


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
  end else
  begin
    stMosGubun := 'DOOR';
    stDoorName := IntdoorListView.Items[nIndex].Caption;
    stLocationName := DoorLocateList.Strings[nIndex];

    IntDoorListView.Items[nIndex].SubItems.Strings[5] := cInputType;
    IntDoorListView.Items[nIndex].SubItems.Strings[6] := stPermit;
    IntDoorListView.Items[nIndex].SubItems.Strings[7] := stUserName;
    if bFire then IntDoorListView.Items[nIndex].ImageIndex := 7;

  end;

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
        end;
      end;
    end;
    if bExitButton then
    begin
      if G_nAccessEventSearch = 1 then Exit;  //카드 이벤트만 조회시 빠져 나감
      {case cInputtype of
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
        'S': begin
             stUserName := '스케줄';
             stPermit := '스케줄열림';
             end;
        'F': begin
             stUserName := '화재발생';
             stPermit := '화재열림';
             end;
        'f': begin
             stUserName := '원격화재';
             stPermit := '원격화재열림';
             end;
        'C': begin
             stUserName := '카드';
             stPermit := '카드열림';
             end;
      else stUserName:= cInputType;
      end;
    end;
    InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stCardNo,stUserName,
    stCompanyName,stJijumName,stEmID,stDeviceID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_IntAccess);
  end;
}
end;

procedure TfmKTTypeMonitoring.Menu_DeviceAllCardDownClick(Sender: TObject);
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

procedure TfmKTTypeMonitoring.Menu_DeviceCardDownClick(Sender: TObject);
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

function TfmKTTypeMonitoring.GetAreaName(aBuildingCode, aFloorCode,
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

function TfmKTTypeMonitoring.GetBuildingName(aBuildingCode: string): string;
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

function TfmKTTypeMonitoring.GetFloorName(aBuildingCode,
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

function TfmKTTypeMonitoring.GetPermitState(aPermit: string): string;
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

function TfmKTTypeMonitoring.GetUserInfo(aCardNo: string; var stUserName,
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

procedure TfmKTTypeMonitoring.LoadCompanyCode;
var
  stSql : string;
begin
  if L_bClose then Exit;
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

procedure TfmKTTypeMonitoring.LoadDepartCode;
var
  stSql : string;
begin
  if L_bClose then Exit;
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

procedure TfmKTTypeMonitoring.CommandArrayCommandsTCommand4Execute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
  if ALARMVIEW = 'QUERY' then
  begin
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMREFRESH'+ DATADELIMITER + '00000' + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
    //SearchAlarmList;
  end;
end;

procedure TfmKTTypeMonitoring.InsertDOORList(aPermitCode,aPermit, aTime, aLocationName,
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
    Cells[IntDoorIndexArray[8],1] := aJijumName ; //지점명
    Cells[IntDoorIndexArray[9],1] := aDepartName ; //부서명
    Cells[IntDoorIndexArray[10],1] := aEmID; //사번
    Cells[IntDoorIndexArray[11],1] := aDoorID; //출입문아이디
    Cells[IntDoorIndexArray[12],1] := aHandPhone; //핸드폰
    Cells[IntDoorIndexArray[13],1] := aCompanyPhone; //사내전화번호
    Cells[IntDoorIndexArray[14],1] := aAddr1; //주소1
    Cells[IntDoorIndexArray[15],1] := aAddr2; //주소2
  end;

end;

procedure TfmKTTypeMonitoring.DeviceRcvAlarmData(aNodeNo, aReceiveData: string);
var
  stECUID : string;
  stMsgNo,stTime,stSubClass,stSubAddr,stZoneCode,stMode:string;
  stStatusCode,stStatusName,stPortNo,stState,stOperator : string;
  stCmd : string;
  nResult : integer;
  nIndex : integer;
  stLocate,stAlarmName,stModeStr : string;
  nImageIndex : integer;
  stDeviceType : string;
  i : integer;
  bZoneSensor : Boolean; // 감지 상태 유무
  stPortName : string;
  nAlarmSound : integer;
  stNewStateCode : string;
  stTemp : string;
  nTempIndex : integer;
begin

//  stMCUID := copy(aReceiveData,8,7);
  stECUID := copy(aReceiveData,15,2);
  stCmd := UpperCase(aReceiveData[17]);
  stMsgNo    := aReceiveData[18];
  stTime     := copy(aReceiveData,20,14);
  stSubClass := copy(aReceiveData,34,2);
  stSubAddr  := copy(aReceiveData,36,2);
  stZoneCode := copy(aReceiveData,38,2);
  stMode     := aReceiveData[40];
  stStatusCode   := copy(aReceiveData,41,2);
  stPortNo   := copy(aReceiveData,43,2);
  stState    := aReceiveData[45];
  stOperator := copy(aReceiveData,46,10);
  if G_nDaemonServerVersion < 1 then
    stNewStateCode := stStatusCode
  else
  begin
    nTempIndex := Pos(';',aReceiveData);
    stTemp := copy(aReceiveData,nTempIndex + 1,Length(aReceiveData) - nTempIndex);
    stNewStateCode := copy(stTemp,1,2);
  end;
  if Not isDigit(stZoneCode) then stZoneCode := '0';
  stZoneCode := inttostr(strtoint(stZoneCode));
  nIndex := AlarmDeviceIDList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3) + stECUID + stZoneCode );

  if Not IsMaster then
  begin
    if nIndex < 0 then Exit;// 관제 권한이 없음
  end;

  stMode:= UpperCase(stMode);
  if (IsDigit(stTime)= False) or
     (IsDigit(stECUID) = False) then    Exit;

  stTime:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);

  if G_nDaemonServerVersion < 1 then
  begin
    if stCmd = 'A' then
    begin
      if stStatusCode = '00' then
      begin
        //Mode Change StateCode
        nTempIndex := AlarmModeNotCardList.IndexOf(stOperator);
        if nTempIndex > -1 then
        begin
          if stMode = 'A' then
            stNewStateCode := TAlarmStatusCode(AlarmModeNotCardList.Objects[nTempIndex]).ALARMSTATUSCODE
          else stNewStateCode := TAlarmStatusCode(AlarmModeNotCardList.Objects[nTempIndex]).DISALARMSTATUSCODE;
        end else
        begin
          if stMode = 'A' then stNewStateCode := 'A1'
          else stNewStateCode := 'C1';
        end;
      end else if isDigit(stPortNo) then
      begin
        //Alarm StateCode
        nTempIndex := ZoneDetectList.IndexOf(stStatusCode);
        if nTempIndex < 0 then
        begin
          stNewStateCode := 'Z' + stState;
        end;
      end;

    end;
  end;
{  if stMode = 'A' then //Alarm 신호 올라 오면 단선 신호인지 쇼트 신호 인지 체크하자
  begin
    if Not bALARMSHORT then
    begin
      if stState = 'S' then Exit; //쇼트 신호를 감지 하지 않는 경우 빠져 나감
    end;
    if Not bALARMDOWN then
    begin
      if stState = 'P' then Exit; //단선 신호를 감지 하지 않는 경우 빠져 나감
    end;
  end;  }
{
  if (stSubCLass = 'MN') or (stSubCLass = 'EX')then
  begin
    if stStatusCode = 'NF' then
      DisConnectECU('E' + FillZeroNumber(strtoint(aNodeNo),3) + stECUID)
    else
      ConnectECU('E' + FillZeroNumber(strtoint(aNodeNo),3) + stECUID);
  end else
  begin
    ConnectECU('E' + FillZeroNumber(strtoint(aNodeNo),3) + stECUID);
  end;
}
   //nResult: 0:정상,1:알람,-1미등록
  nResult:= GetStatusCode(stNewStateCode,stStatusName,nAlarmSound);
  if stPortNo <> '**' then    //포트 감지 인경우 무조건 뿌리자.
  begin
    if stState <> 'N' then
    begin
      nResult := 1;
      nAlarmSound := 1;
      GetStatusCode(stStatusCode,stStatusName,nAlarmSound);
      //if stStatusName = '' then stStatusName := stStatusCode;
      stPortName := GetPortName(aNodeNo,stECUID,stPortNo);
      if stStatusName = '' then
      begin
        stStatusName := '' + stPortNo + '번 침입' + '  ' + stPortName;// + stStatusName; //+ stPortNo +'번존 감지'; //stStatusName;    //어떤 조건으로 감지 되었는지 표시
      end else
      begin
        stStatusName := '' + stStatusName + '  ' + stPortName ;
      end;
    end else
    begin
      //nResult := 1;
      stStatusName := stStatusName +'[복구]' + stPortName ;//+ stPortNo +'번존 복구';
    end;
  end;

  stDeviceType:=  stSubCLass +'['+ stSubAddr + ']';

  {존 모드별 아이콘 변경}
  nImageIndex := 2;
  case UpperCase(stMode)[1] of
   'A': begin nImageIndex:= 4; stModeStr:= '경계모드[A]' end;
   'D': begin nImageIndex:= 3; stModeStr:= '해제모드[D]' end;
   'T': begin nImageIndex:= 6; stModeStr:= '시험모드[T]' end;
   'I': begin nImageIndex:= 7; stModeStr:= '등록모드[I]' end;
   'P': begin nImageIndex:= 8; stModeStr:= '순회모드[P]' end;
  else  begin nImageIndex:= 3; stModeStr:= '미등록모드['+stMode[1]+']' end;
  end;

  if stStatusName = '' then  stStatusName:= stSubCLass + stSubAddr + ' '+ stStatusName;

  stStatusName := stStatusName + '/' + stModeStr;

  if SensorUse then
  begin
    if isDigit(stPortNo) then
    begin
      if CheckSchedule(aNodeNo, stECUID,inttostr(strtoint(stPortNo))) then bZoneSensor := True
      else bZoneSensor := False;
    end  else bZoneSensor := False;
    DisplaySensorState(aNodeNo,stECUID,stPortNo,stMode,stSubCLass,stNewStateCode,bZoneSensor);

  end;


  if nAlarmSound = 1 then
  begin
    if PTAlarmUse then
    begin
      if stCmd = 'A' then
      begin
        self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := PTAlaramFile;
        self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
{        if FileExists(PTAlaramFile) then
        begin
          MediaPlayer1.FileName := PTAlaramFile;
          MediaPlayer1.Open;
          MediaPlayer1.play;
        end;  }
      end;
    end;
  end;

  if nIndex > -1 then
  begin
    stLocate := AlarmLocateList.Strings[nIndex]; //경계구역 위치
    stAlarmName:= IntAlarmListView.Items[nIndex].Caption; // 경계구역 명
    IntAlarmListView.Items[nIndex].SubItems[2]:= stMode;
    IntAlarmListView.Items[nIndex].SubItems[3]:= InttoStr(nResult);

    if IntAlarmListView.Items[nIndex].ImageIndex <> 5 then    //알람발생 상태가 아닌경우 적용
      IntAlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
    //통신이상은 경계 아이콘에 표시 하지 않는다.
    if stStatusCode <> 'NF' then
    begin
      if nAlarmSound = 1 then
      begin
        if stCmd = 'A' then IntAlarmListView.Items[nIndex].ImageIndex:= 5;
      end
      else
      begin
        //IntAlarmListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    stAlarmName := DataModule1.GetDeviceName(aNodeNo,stECUID);
  end;

  if PTAlarmMessageUse then  //ZONE Sensing Message Use
  begin
    if stCmd = 'A' then
    begin
      if isDigit(stPortNo) then
      begin
        st_Message.Caption := stAlarmName + ':' + stPortNo + '번 존 감지!!!';
        MessageTimer.Enabled := True;
      end;
    end;
  end;


    {
  if (stSubCLass = 'MN') or (stSubCLass = 'EX')then
  begin
    if stStatusCode = 'NF' then //통신 이상이면
    begin
      IntAlarmListView.Items[nIndex].ImageIndex:= 2;
    end;
  end;       }
  
{  //위치 정보 보기의 Map 에 알람 표시
  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).AlaramStateChange(aNodeNo,stECUID,stPortNo,stMode,inttostr(nResult));
  end;
}
  if nResult < 1 then Exit; //정상인 경우 빠져 나감

  if ALARMVIEW = 'REAL' then
  begin
    if stCmd = 'A' then
    begin
      InsertAlarmList(stTime, //시간
                  stLocate, //위치정보
                  stAlarmName, //경계구역명칭
                  stECUID +'['+stMsgNo+']',  //주장치번호[메시지번호]
                  stDeviceType,         //발생기기[번호]
                  stStatusCode + '/' + stPortNo,  //이벤트코드
                  stStatusName,
                  FillZeroNumber(strtoint(aNodeNo),3) + stECUID,
                  nAlarmSound,
                  '255',
                  sg_IntAlarm);  //이벤트 내용
      if (nAlarmSound > 0) and (G_nAlarmMapPopup = 1) then
      begin
        DisplayArmAreaMapShow(copy(stLocate,1,9),aNodeNo,stECUID,stZoneCode);
      end;

    end;
  end
  else if ALARMVIEW = 'QUERY' then
  begin
    Delay(200);
    SearchAlarmList;
  end;
  if G_nAlarmMapPopup = 1 then
  begin
    DisplayArmAreaMapModeChange(copy(stLocate,1,9),aNodeNo,stECUID,stZoneCode);
  end;
end;

function TfmKTTypeMonitoring.GetStatusCode(aStatusCode: string;
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

procedure TfmKTTypeMonitoring.InsertAlarmList(aTime, aLocateName, aAlarmName,
  aDeviceID, aDeviceType, aStatusCode, aStatusName,aAlaramCode: string;aAlarmSound:integer;
  aColor:string;List: TAdvStringGrid);
begin

  with List do
  begin
    //if Cells[0,1] <> '' then   InsertRows(1,1);

    if List.Name = 'sg_Alarm' then
      if Cells[AlarmIndexArray[0],1] <> '' then   InsertRows(1,1);
    if List.Name = 'sg_IntAlarm' then
      if Cells[IntAlarmIndexArray[0],1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    List.SelectedCells[1,1];
    if aAlarmSound > 0 then
    begin
      if isDigit(aColor) then RowColor[1] := strtoint(aColor)
      else RowColor[1] := clRed;
    end;
    if List.Name = 'sg_Alarm' then
    begin
      Cells[AlarmIndexArray[0],1] := MakeDatetimeStr(aTime);   //발생시간
      Cells[AlarmIndexArray[1],1] := copy(aLocateName,10,length(aLocateName)-9); //위치
      Cells[AlarmIndexArray[2],1] := aAlarmName; //경계구역
      Cells[AlarmIndexArray[3],1] := aDeviceID; //주장치번호
      Cells[AlarmIndexArray[4],1] := aDeviceType; //기기번호
      Cells[AlarmIndexArray[5],1] := aStatusCode; //발생코드
      Cells[AlarmIndexArray[6],1] := aStatusName; //이벤트내용
      Cells[AlarmIndexArray[7],1] := aAlaramCode; //AlarmCode
    end else if List.Name = 'sg_IntAlarm' then
    begin
      Cells[IntAlarmIndexArray[0],1] := MakeDatetimeStr(aTime);   //발생시간
      Cells[IntAlarmIndexArray[1],1] := copy(aLocateName,10,length(aLocateName)-9); //위치
      Cells[IntAlarmIndexArray[2],1] := aAlarmName; //경계구역
      Cells[IntAlarmIndexArray[3],1] := aDeviceID; //주장치번호
      Cells[IntAlarmIndexArray[4],1] := aDeviceType; //기기번호
      Cells[IntAlarmIndexArray[5],1] := aStatusCode; //발생코드
      Cells[IntAlarmIndexArray[6],1] := aStatusName; //이벤트내용
      Cells[IntAlarmIndexArray[7],1] := aAlaramCode; //AlarmCode
    end;
  end;
end;

procedure TfmKTTypeMonitoring.Action_ReloadExecute(Sender: TObject);
begin
{  Action_LoctionLoadExecute(Self);
  Action_DeviceLoadExecute(Self);
  Action_DoorLoadExecute(Self);
  Action_AlarmLoadExecute(Self);
  Action_SensorLoadExecute(Self);
  LoadCompanyCode;
  LoadDepartCode;}
  if L_bClose then Exit;
  Action_DeviceLoadExecute(Self);
  Action_DoorLoadExecute(Self);
  Action_AlarmLoadExecute(Self);
  
  LoadCompanyCode;
  LoadJijumCode;

  LoadDepartCode;
  Action_LoctionLoadExecute(Self);

  if L_bClose then Exit;
{  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  if PatrolUse then
  begin
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
  end;
}
  DeviceStateRefresh;
  DoorStateRefresh;
  AlarmStateRefresh;
//  SocketWatchTimer.Enabled := True;

end;

procedure TfmKTTypeMonitoring.RcvChangeDoorData(aNodeNo, aReceiveData: string);
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
        if IntdoorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
      '2':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> 5 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 5;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
      '2':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> 5 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 5;
      end;
    end;

  end;

{  if aIndex = 8 then
  begin
    if DoorState = 'C' then  DoorState:= 'O'
    else if DoorState = 'O' then  DoorState:= 'C';
  end;   }

  case cDoorState of
    'C': //닫힘
      begin
        if IntdoorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
        IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
        if IntdoorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
        IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
    'T'://장시간 열림
      begin
        stTimeStr:= '20'+ Copy(stTime,1,2)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= IntdoorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '장시간 열림');
      end;
    'U'://해정이상
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= IntdoorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문열기 실패');
      end;
    'L'://시정이상
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= IntdoorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문닫기 실패');
      end;
  end;
  if bRefresh then
  begin
    IntdoorListView.Refresh;
  end;
  
{  //위치 정보 보기의 Map 에 상태 표시
  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(aNodeNo,stECUID,stDoorNo,cDoorMode,cDoorState,cDoorMode2);
  end;
}
end;

procedure TfmKTTypeMonitoring.RcvDoorControl(aNodeNo, aReceiveData: string);
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
        if IntdoorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
      '2':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> 5 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 5;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
      '2':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> 5 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 5;
      end;
    end;

  end;

  case cDoorState of
    'C': //닫힘
      begin
        if IntdoorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
        IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
        if IntdoorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
        IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
  end;
  if bRefresh then
  begin
    IntdoorListView.Refresh;
  end;

{  //위치 정보 보기의 Map 에 상태 표시
  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(aNodeNo,stECUID,stDoorNo,cDoorMode,cDoorState,cDoorMode2);
  end; }
end;

procedure TfmKTTypeMonitoring.ClearEmpInfo;
begin
end;


procedure TfmKTTypeMonitoring.sg_IntAccessKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  st: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      if Name = 'sg_Access' then st:= Cells[DoorIndexArray[5],Row]
      else if Name = 'sg_IntAccess' then  st:= Cells[IntDoorIndexArray[5],Row];

//      st:= Cells[5,Row];
      if st <> '' then ClipBoard.SetTextBuf(PChar(st));
    end;
  end;

end;

procedure TfmKTTypeMonitoring.N15Click(Sender: TObject);
begin
  IntDoorListView.ViewStyle := vsIcon;
  pan_LargeIntro.Visible := True;
  pan_LargeIntro.Align := alClient;
  pan_SmallIntro.Visible := False;

end;

procedure TfmKTTypeMonitoring.N16Click(Sender: TObject);
begin
  IntDoorListView.ViewStyle := vsList;
  pan_LargeIntro.Visible := False;
  pan_SmallIntro.Visible := True;
  pan_SmallIntro.Align := alClient;

end;

procedure TfmKTTypeMonitoring.DisConnectDoor(aDoorID: string);
var
  bRefresh:Boolean;
begin
  if DoorCodeList.IndexOf(aDoorID) < 0 then Exit;
  bRefresh := False;

  if IntdoorListView.Items[DoorCodeList.IndexOf(aDoorID)].ImageIndex <> 2 then
  begin
    IntdoorListView.Items[DoorCodeList.IndexOf(aDoorID)].ImageIndex:=2;
    bRefresh := true;
  end;
  if IntdoorListView.Items[DoorCodeList.IndexOf(aDoorID)].StateIndex <> -1 then
  begin
    IntdoorListView.Items[DoorCodeList.IndexOf(aDoorID)].StateIndex := -1;
    bRefresh := true;
  end;
  IntdoorListView.Refresh;
end;

procedure TfmKTTypeMonitoring.DisConnectAlarm(aAlarmID: string);
begin
  if AlarmDeviceIDList.IndexOf(aAlarmID) < 0 then Exit;

  IntAlarmListView.Items[AlarmDeviceIDList.IndexOf(aAlarmID)].ImageIndex:=2;
  IntAlarmListView.Items[AlarmDeviceIDList.IndexOf(aAlarmID)].StateIndex := -1;
  IntAlarmListView.Refresh;
end;

procedure TfmKTTypeMonitoring.mn_LocationMapClick(Sender: TObject);
var
  stLocateID : string;
  stBuildingCode,stFloorCode,stSectorCode:string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  stBuildingCode := copy(stLocateID,1,3);
  stFloorCode := copy(stLocateID,4,3);
  stSectorCode := copy(stLocateID,7,3);
  
  //if bLocationMapShow then  fmLocationMap.MapFree;

  //if Not bLocationMapShow then
  //begin
    if LocationMapList.IndexOf(stBuildingCode + stFloorCode + stSectorCode ) > -1 then
    begin
      TfmLocationMap(LocationMapList.Objects[LocationMapList.IndexOf(stBuildingCode + stFloorCode + stSectorCode )]).SetFocus;
      Exit;
    end;
    fmLocationMap:= TfmLocationMap.Create(Self);
    fmLocationMap.DeviceNameList := TStringList.Create;
    fmLocationMap.LocationDeviceList := TStringList.Create;
    fmLocationMap.LocationImageList := TStringList.Create;
    fmLocationMap.aBuildingCode := stBuildingCode;
    fmLocationMap.aFloorCode := stFloorCode;
    fmLocationMap.aSectorCode := stSectorCode;
    fmLocationMap.L_stCreateForm := 'TfmKTTypeMonitoring';
    LocationMapList.AddObject(stBuildingCode + stFloorCode + stSectorCode,fmLocationMap );
    TfmLocationMap(LocationMapList.Objects[LocationMapList.count - 1]).Show;
    TfmLocationMap(LocationMapList.Objects[LocationMapList.count - 1]).LocationMapShow;
    TfmLocationMap(LocationMapList.Objects[LocationMapList.count - 1]).bActive := True;

{    Delay(100);
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
    if PatrolUse then
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
    end;  }
  //  bLocationMapShow := True;

  //  fmLocationMap.SHow;
  //  fmLocationMap.LocationMapShow;
  //  fmLocationMap.bActive := True;
  //end;

end;

procedure TfmKTTypeMonitoring.CommandArrayCommandsTCommand5Execute(
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

procedure TfmKTTypeMonitoring.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  stValue : string;
begin
  if UseStateShow then
  begin
  //  IntDoorListView.LargeImages := stateShowImageList;
  end;


  bLocationMapShow := False;
  bDeviceMapShow := False;

//  sg_AccessHeaderNameSet;
{  Action_LoctionLoadExecute(Self);
  Action_DeviceLoadExecute(Self);
  if AccessUse then
  begin
    Action_DoorLoadExecute(Self);
  end
  else
  begin
    AccessTab.TabVisible := False;
    IntegrationTab.TabVisible := False;
  end;
  if PatrolUse then
  begin
    Action_AlarmLoadExecute(Self);
  end else
  begin
    AlarmTab.TabVisible := False;
    IntegrationTab.TabVisible := False;
  end;
  if FoodUse then
    Action_FoodLoadExecute(self)
  else FoodTab.TabVisible := False;

  if SensorUse then Action_SensorLoadExecute(nil)
  else SensorTab.TabVisible := False;
  
  LoadCompanyCode;
  LoadDepartCode;
}
//  SocketWatchTimer.Enabled := True;
  TreeView_Location.Items.Clear;
  TreeView_Device.Items.Clear;
  IntDoorListView.Items.Clear;
  IntAlarmListView.Items.Clear;

//  Form_Initialize;
//  GridSetting; //그리드를 사용자 환경에 맞게 셋팅함

  pm_intiCloseMode.Visible := G_bColseModeView;
  pm_intiMasterMode.Visible := G_bColseModeView;
  pm_PosiNega.Visible := G_bPosiNega;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'KTTypeMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Application.ProcessMessages;

end;

procedure TfmKTTypeMonitoring.N1Click(Sender: TObject);
var
  stDoorID : string;
  stDoorName : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID := DoorCodeList[IntdoorListView.ItemIndex];
  stDoorName := IntdoorListView.Items[IntdoorListView.ItemIndex].Caption;

  
  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stDoorID;
    fmDeviceMap.DeviceName := stDoorName;
    fmDeviceMap.DeviceType := '3';
    fmDeviceMap.L_stCreateForm := 'TfmKTTypeMonitoring';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmKTTypeMonitoring.N11Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
begin
  if IntAlarmListView.SelCount < 1 then
  begin
    showmessage('방범구역을 선택하세요.');
    Exit;
  end;
  stAlarmID:= AlarmDeviceIDList[IntAlarmListView.ItemIndex];
  stAlarmName := IntAlarmListView.Items[IntAlarmListView.ItemIndex].Caption;
  
  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stAlarmID;
    fmDeviceMap.DeviceName := stAlarmName;
    fmDeviceMap.DeviceType := '4';
    fmDeviceMap.L_stCreateForm := 'TfmKTTypeMonitoring';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmKTTypeMonitoring.N2Click(Sender: TObject);
var
  stDoorID : string;
  stDoorName : string;
  stLocateName : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID := DoorCodeList[IntdoorListView.ItemIndex];
  stDoorName := IntdoorListView.Items[IntdoorListView.ItemIndex].Caption;
  stLocateName := DoorLocateList.Strings[IntdoorListView.ItemIndex];

  fmDeviceInfo:= TfmDeviceInfo.Create(Self);
  fmDeviceInfo.DeviceID := stDoorID;
  fmDeviceInfo.DeviceName := stDoorName;
  fmDeviceInfo.DeviceType := '3';
  fmDeviceInfo.LocateName := copy(stLocateName,10,length(stLocateName) - 9);
  fmDeviceInfo.SHowmodal;
  fmDeviceInfo.Free;

end;

procedure TfmKTTypeMonitoring.N12Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
  stLocateName : string;
begin
  if IntAlarmListView.SelCount < 1 then
  begin
    showmessage('방범구역을 선택하세요.');
    Exit;
  end;
  stAlarmID := AlarmDeviceIDList[IntAlarmListView.ItemIndex];
  stAlarmName := IntAlarmListView.Items[IntAlarmListView.ItemIndex].Caption;
  stLocateName := AlarmLocateList.Strings[IntAlarmListView.ItemIndex];

  fmDeviceInfo:= TfmDeviceInfo.Create(Self);
  fmDeviceInfo.DeviceID := stAlarmID;
  fmDeviceInfo.DeviceName := stAlarmName;
  fmDeviceInfo.DeviceType := '4';
  fmDeviceInfo.LocateName := copy(stLocateName,10,length(stLocateName) - 9);
  fmDeviceInfo.SHowmodal;
  fmDeviceInfo.Free;

end;

procedure TfmKTTypeMonitoring.PageControl1Change(Sender: TObject);
begin
  //showmessage(PageControl1.ActivePage.Name);
  UPDATETB_USERCONFIG('KTMONITOR','DEVICETAB',PageControl1.ActivePage.Name)
end;

function TfmKTTypeMonitoring.UPDATETB_USERCONFIG(aConfigGroup,aConfigID,
  aValue: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'Update TB_USERCONFIG Set';
  stSql := stSql + ' US_VALUE =  ''' + aValue + ''' ';
  stSql := stSql + 'Where ';
  stSql := stSql + ' GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AD_USERID = ''' + Master_ID + ''' ';
  stSql := stSql + ' AND US_CONFIGID = ''' + aConfigID + ''' ';
  stSql := stSql + ' AND US_CONFGROUP = ''' + aConfigGroup + ''' ';

  With DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      nCount := ExecSql;
    Except
      result := InsertTB_USERCONFIG(aConfigGroup,aConfigID,aValue);
      Exit;
    End;
    if nCount = 0 then
    begin
      result := InsertTB_USERCONFIG(aConfigGroup,aConfigID,aValue);
    end;
    result := True;
  end;

end;

function TfmKTTypeMonitoring.InsertTB_USERCONFIG(aConfigGroup,aConfigID,
  aValue: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Insert Into TB_USERCONFIG(';
  stSql := stSql + ' GROUP_CODE,AD_USERID,US_CONFGROUP,US_CONFIGID,US_VALUE ';
  stSql := stSql + ') Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + Master_ID + ''',';
  stSql := stSql + '''' + aConfigGroup + ''',';
  stSql := stSql + '''' + aConfigID + ''',';
  stSql := stSql + '''' + aValue + ''' ';
  stSql := stSql + ')';

  With DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
end;

procedure TfmKTTypeMonitoring.PageControl2Change(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','WATCHTAB',PageControl2.ActivePage.Name)
end;

procedure TfmKTTypeMonitoring.Panel1Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','DEVICEW',inttostr(Panel1.Width))
end;

procedure TfmKTTypeMonitoring.Panel12Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','INTEGH',inttostr(Panel12.Height))
end;

procedure TfmKTTypeMonitoring.Panel15Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','INTATH',inttostr(Panel15.Height))
end;

procedure TfmKTTypeMonitoring.Panel14Resize(Sender: TObject);
begin
  if IntAlarmListView.ViewStyle = vsIcon then
  begin
    IntAlarmListView.ViewStyle := vsList;
    IntAlarmListView.Refresh;
    IntAlarmListView.ViewStyle := vsIcon;
  end else if IntAlarmListView.ViewStyle = vsList then
  begin
    IntAlarmListView.ViewStyle := vsIcon;
    IntAlarmListView.Refresh;
    IntAlarmListView.ViewStyle := vsList;
  end;
  UPDATETB_USERCONFIG('KTMONITOR','INTPTW',inttostr(Panel14.Width));
end;

procedure TfmKTTypeMonitoring.Form_Initialize;
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
  stSql := stSql + ' AND US_CONFGROUP = ''KTMONITOR''';

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
      end else if FindField('US_CONFIGID').AsString = 'DEVICEW' then
      begin
        Panel1.Width := FindField('US_VALUE').AsInteger;
      end else if FindField('US_CONFIGID').AsString = 'INTEGH' then
      begin
        Panel12.Height := FindField('US_VALUE').AsInteger;
      end else if FindField('US_CONFIGID').AsString = 'INTATH' then
      begin
        Panel15.Height := FindField('US_VALUE').AsInteger;
      end else if FindField('US_CONFIGID').AsString = 'INTPTW' then
      begin
        Panel14.Width := FindField('US_VALUE').AsInteger;
      end;
      Next;
    end;
  end;
  DeviceTabList.Free;
  WacthTabList.Free;
end;

procedure TfmKTTypeMonitoring.DeviceConnectStatus(aReceiveData: string);
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

procedure TfmKTTypeMonitoring.AlarmListViewDblClick(Sender: TObject);
var
  nIndex : integer;
begin
// 여기에서 해당하는 알람 경고창 없애자...
  IntAlarmListView.Items[nIndex].StateIndex := -1;
  {
  IntAlarmListView.ViewStyle := vsList;
  IntAlarmListView.Refresh;
  IntAlarmListView.ViewStyle := vsIcon; }

end;

procedure TfmKTTypeMonitoring.IntAlarmListViewDblClick(Sender: TObject);
var
  nIndex : integer;
  stAlarmID : string;
begin

// 여기에서 해당하는 알람 경고창 없애자...
  if IntAlarmListView.Selected = nil then Exit;
  mi_AlarmConfirmClick(self);

  MessageTimer.Enabled := False;
  pan_Message.Visible := False;

end;

procedure TfmKTTypeMonitoring.NodeConnectStatus(aReceiveData: string);
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

procedure TfmKTTypeMonitoring.CommandArrayCommandsTCommand6Execute(
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

procedure TfmKTTypeMonitoring.ConnectServer;
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

procedure TfmKTTypeMonitoring.DisConnectServer;
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
    //여기에서 모든 노드 DisConnect 로 표시하자.
{    for i :=0 to DeviceCodeList.Count - 1 do
    begin
      if copy(DeviceCodeList.Strings[i],1,1) = 'N' then
      begin
        DisConnectNode(DeviceCodeList.Strings[i]);
      end;
    end; }
  end;
  aTreeView.Refresh;

end;

procedure TfmKTTypeMonitoring.MenuItem6Click(Sender: TObject);
var
  stStatusCode : string;
  stPort : string;
  nPos : integer;
  stNodeNo : string;
  stEcuID : string;
  stAlarmName : string;
begin
  stStatusCode := sg_IntAlarm.Cells[5,sg_IntAlarm.row];
  if stStatusCode = '' then Exit;
  nPos := Pos('/',stStatusCode);
  stPort := Trim(copy(stStatusCode,nPos + 1,Length(stStatusCode) - nPos));
  if Not IsDigit(stPort) then Exit;
  
  stNodeNo := copy(sg_IntAlarm.Cells[7,sg_IntAlarm.row],1,3);
  stEcuID := copy(sg_IntAlarm.Cells[7,sg_IntAlarm.row],4,2);
  stAlarmName := sg_IntAlarm.Cells[2,sg_IntAlarm.row];

  fmZonePosition:= TfmZonePosition.Create(Self);
  //fmZonePosition.nAL_ALARMNO := nAlarmNo;
  fmZonePosition.stAC_NODENO := stNodeNo;
  fmZonePosition.stAC_ECUID := stEcuID;
  fmZonePosition.stPortNo := stPort;
  fmZonePosition.stDeviceName  := stAlarmName + ' ';

  fmZonePosition.ShowModal;
  fmZonePosition.Free;
end;


function TfmKTTypeMonitoring.updateTB_ZONEDEVICEState(aAlarmNo, aZoneNum,
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

procedure TfmKTTypeMonitoring.DisplaySensorState(aNodeNo, aECUID,aPortNo, aMode,aSubCLass,
  aStatusCode: string;bZoneSensor:Boolean);
begin


end;

function TfmKTTypeMonitoring.CheckSchedule(aNodeNo, aECUID,
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

function TfmKTTypeMonitoring.GetPortName(aNodeNo, aECUID,
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

procedure TfmKTTypeMonitoring.Insertsg_SensorList(aTime,aNodeNo, aECUID, aPortNo,
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

procedure TfmKTTypeMonitoring.ECUDataProcess(aNodeNo, aECUID, aTYPE, aACTION,
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

procedure TfmKTTypeMonitoring.NODEDataProcess(aNodeNo, aTYPE, aACTION,
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

procedure TfmKTTypeMonitoring.DEVICEDataProcess(aNodeNo, aECUID, aData: string);
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
           DeviceRcvAlarmData(aNodeNo,aData);
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

procedure TfmKTTypeMonitoring.DoorDataProcess(aNodeNo, aEcuID, aDoorNo, aType,
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
            if IntdoorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
            IntdoorListView.Items[nIndex].StateIndex:= 0;
          end;
          '2':       //폐쇄모드
          begin
            if IntdoorListView.Items[nIndex].StateIndex <> 5 then bRefresh := True;
            IntdoorListView.Items[nIndex].StateIndex:= 5;
          end;
          else
          begin
            if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
            IntdoorListView.Items[nIndex].StateIndex:= -1;
          end;
        end;
      end else
      begin
        Case cDoorMode of
          '0':
          begin
            if IntdoorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
            IntdoorListView.Items[nIndex].StateIndex:= 1;
          end;
          '2':  //폐쇄모드
          begin
            if IntdoorListView.Items[nIndex].StateIndex <> 5 then bRefresh := True;
            IntdoorListView.Items[nIndex].StateIndex:= 5;
          end;
          else
          begin
            if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
            IntdoorListView.Items[nIndex].StateIndex:= -1;
          end;
        end;

      end;

      case cDoorState of
        'C': //닫힘
          begin
            if IntdoorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
            IntdoorListView.Items[nIndex].ImageIndex:=0;
          end;
        'O': //열림
          begin
            if IntdoorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
            IntdoorListView.Items[nIndex].ImageIndex:=1;
          end;
        'E': //에러
          begin
            if IntdoorListView.Items[nIndex].ImageIndex <> 2 then bRefresh := True;
            IntdoorListView.Items[nIndex].ImageIndex:=2;
          end;
        'T'://장시간 열림
          begin
            if IntdoorListView.Items[nIndex].ImageIndex <> 8 then bRefresh := True;
            IntdoorListView.Items[nIndex].ImageIndex:=8;
            //stTimeStr:= '20'+ Copy(stTime,1,2)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            //          Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
            //st:= doorListView.Items[nIndex].Caption;
            //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '장시간 열림');
          end;
        'U'://해정이상
          begin
            //stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            //          Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
            //st:= doorListView.Items[nIndex].Caption;
            //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문열기 실패');
          end;
        'L'://시정이상
          begin
            //stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            //          Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
            //st:= doorListView.Items[nIndex].Caption;
            //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문닫기 실패');
          end;
      end;
      if bRefresh then
      begin
        IntdoorListView.Refresh;
      end;

{      //위치 정보 보기의 Map 에 상태 표시
      for i := 0 to LocationMapList.Count - 1 do
      begin
        TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(aNodeNo,aEcuID,aDoorNo,cDoorMode,cDoorState,cDoorMode2);
      end; }
    end;
  end;  
end;

procedure TfmKTTypeMonitoring.AlarmDataProcess(aNodeNo, aEcuID, aType, aACTION,
  aData: string);
var
  nImageIndex : integer;
  nIndex : integer;
begin
  nIndex := AlarmDeviceIDList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID );

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

      if IntAlarmListView.Items[nIndex].ImageIndex <> 5 then //알람발생상태가 아닌경우
        IntAlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
    end;
  end else if aType = 'PT' then  //Alarm 발생 전체전문
  begin
    DeviceRcvAlarmData(aNodeNo,aData);
  end else if aType = 'AL' then  //전체전문
  begin
    DeviceRcvAlarmData(aNodeNo,aData);
  end;

end;

procedure TfmKTTypeMonitoring.ACDataProcess(aNodeNo, aECUID, aData: string);
begin
  RcvCardReadData(aNodeNo,aData);
end;

procedure TfmKTTypeMonitoring.FormActivate(Sender: TObject);
begin
  st_Message.Font.Size := G_nAlarmMessageFontSize;
  if L_bFirst then
  begin
    L_bFirst := False;
  end;

  Pan_Remark1.Visible := G_bACIntroView;
  Pan_Remark2.Visible := G_bACIntroView;
end;

procedure TfmKTTypeMonitoring.SearchAlarmList;
var
  stSql : string;
  nRow : integer;
  stTime,stLocate,stAlarmName : string;
  stEcuID,stDeviceType : string;
  stStatusCode,stStatusName : string;
  stPortName,stGRADE : string;
  nIndex : integer;
  stDate : string;
begin
  GridInitialize(sg_IntAlarm);
  stDate := FormatDateTime('yyyymmdd',now - G_nAlarmRefreshDate);

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else if DBTYPE = 'MSSQL' then stSql := MsSql.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else if DBTYPE = 'FB' then stSql := FireBird.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else Exit;
  //memo1.Text := stSql;
  //Exit;
  with ADOAlarmQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    nRow := 1;
    if recordCount < 1 then Exit;
    sg_IntAlarm.RowCount := recordCount + 1;
    while Not Eof do
    begin
      nIndex := AlarmDeviceIDList.IndexOf(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString );

      if nIndex > -1 then
      begin
        stTime :=  copy(FindField('AL_DATE').AsString,1,4) + '-' +
                   copy(FindField('AL_DATE').AsString,5,2) + '-' +
                   copy(FindField('AL_DATE').AsString,7,2) + ' ' +
                   copy(FindField('AL_TIME').AsString,1,2) + ':' +
                   copy(FindField('AL_TIME').AsString,3,2) + ':' +
                   copy(FindField('AL_TIME').AsString,5,2);
        stLocate := AlarmLocateList.Strings[nIndex]; //경계구역 위치
        stAlarmName:= IntAlarmListView.Items[nIndex].Caption; // 경계구역 명
        stEcuID := FindField('AC_ECUID').AsString;
        stDeviceType:=  FindField('AL_ALARMDEVICETYPECODE').AsString +'['+ FindField('AL_SUBADDR').AsString + ']';
        stStatusCode := FindField('AL_ALARMSTATUSCODE').AsString;
        stStatusName := FindField('AL_ALARMNAME').AsString;
        if stStatusName = '' then stStatusName := stStatusCode;
        if IsDigit(FindField('AL_ZONENO').AsString) then
        begin
          stPortName := GetPortName(inttostr(FindField('AC_NodeNo').asinteger),FindField('AC_ECUID').AsString,FindField('AL_ZONENO').AsString );
          if stPortName = '' then stPortName := FindField('AL_ZONENO').AsString;
          stStatusName := '[' + stPortName + ']' + stStatusName;    //어떤 조건으로 감지 되었는지 표시
        end;
        stGRADE := inttostr(FindField('AL_ALARMGRADE').AsInteger);

        with sg_IntAlarm do
        begin
          Cells[0,nRow] :=  stTime;
          Cells[1,nRow] :=  stLocate;
          Cells[2,nRow] :=  stAlarmName;
          Cells[3,nRow] :=  stEcuID;
          Cells[4,nRow] :=  stDeviceType;
          Cells[5,nRow] :=  stStatusCode;
          Cells[6,nRow] :=  stStatusName;
          Cells[7,nRow] :=  stGRADE;
          Cells[8,nRow] :=  FillZeroNumber(FindField('AC_NODENO').asInteger,3)+
                            stEcuID +
                            FillSpace(FindField('AL_ALARMDEVICETYPECODE').AsString,2) +
                            FillSpace(FindField('al_subaddr').AsString,2) +
                            FillSpace(FindField('al_zonecode').AsString,2) +
                            FillSpace(FindField('al_zoneno').AsString,2) +
                            FillSpace(FindField('al_alarmstatuscode').AsString,2)
                            ;
          if stGRADE = '2' then
          begin
            RowColor[nRow] := clYellow;
          end else if stGRADE = '3' then
          begin
            RowColor[nRow] := clRed;
          end;
        end;
        inc(nRow);
      end else
      begin
        if sg_IntAlarm.RowCount > 2 then sg_IntAlarm.RowCount := sg_IntAlarm.RowCount - 1;
      end;
      next;
    end;
  end;

end;

procedure TfmKTTypeMonitoring.sg_IntAlarmDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  stAlarmID : string;
  stDeviceID : string;
  stAlarmName : string;
  nDeviceIndex : integer;
  bAlarmConfirm : Boolean;
  i : integer;
begin

  
  with (Sender as TAdvStringGrid) do
  begin
    if cells[IntAlarmIndexArray[7],Row] = '' then Exit;
    stAlarmID:= cells[IntAlarmIndexArray[7],Row];
    stDeviceID := copy(stAlarmID,1,5);
    nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);

    if nDeviceIndex < 0 then Exit;
    if ALARMVIEW <> 'QUERY' then
    begin
      TDeviceState(DeviceStateList.Objects[nDeviceIndex]).AlaramEventClear;
      if RowCount > 2 then
         RemoveRows(Row,1)
      else
      begin
        InsertRows(1,1);
        RemoveRows(2,1);   {
        for i:=0 to colcount -1 do  //첫째줄 지움
        begin
          cells[i,Row] := '';
        end;   }
      end;
      Exit;
    End;
    AlaramConfirm(copy(stAlarmID,1,3),copy(stAlarmID,4,2),copy(stAlarmID,6,1));
  end;


end;

procedure TfmKTTypeMonitoring.CommandArrayCommandsTCommand7Execute(
  Command: TCommand; Params: TStringList);
begin
  if IsInsertGrade or IsUpdateGrade  then
  begin
    IntDoorListView.PopupMenu := PopupMenu_IntiDoor;
    IntAlarmListView.PopupMenu := PopupMenu_IntAlarm;
  end
  else
  begin
    TreeView_Device.PopupMenu := nil;
    IntDoorListView.PopupMenu := nil;
    IntAlarmListView.PopupMenu := nil;
  end;
end;

procedure TfmKTTypeMonitoring.sg_AccessColumnMove(Sender: TObject; ACol: Integer;
  var Allow: Boolean);
begin
//  if Allow then showmessage(inttostr(aCol));

end;

procedure TfmKTTypeMonitoring.sg_AccessColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeDoorIndex(FromIndex,ToIndex);
end;

procedure TfmKTTypeMonitoring.GridSetting;
var
  i : integer;
begin
  for i:=0 to sg_IntAccess.ColCount - 1 do
  begin
    IntDoorIndexArray[i] := i;
    relIntDoorIndexArray[i] := i;
  end;
  for i:=0 to sg_IntAlarm.ColCount - 1 do
  begin
    IntAlarmIndexArray[i] := i;
    relIntAlarmIndexArray[i] := i;
  end;


end;

procedure TfmKTTypeMonitoring.ChangeDoorIndex(FromIndex, ToIndex: integer);
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

procedure TfmKTTypeMonitoring.ChangeIntDoorIndex(FromIndex, ToIndex: integer);
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

procedure TfmKTTypeMonitoring.sg_IntAccessColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeIntDoorIndex(FromIndex,ToIndex);
end;

procedure TfmKTTypeMonitoring.ChangeAlarmIndex(FromIndex, ToIndex: integer);
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

procedure TfmKTTypeMonitoring.ChangeIntAlarmIndex(FromIndex, ToIndex: integer);
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

procedure TfmKTTypeMonitoring.sg_IntAlarmColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeIntAlarmIndex(FromIndex,ToIndex);
end;

procedure TfmKTTypeMonitoring.sg_AlarmColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeAlarmIndex(FromIndex,ToIndex);

end;

procedure TfmKTTypeMonitoring.sg_AccessHeaderNameSet;
begin
  with sg_IntAccess do
  begin
    cells[0,0] := '발생일자';
    cells[1,0] := '위치';
    cells[2,0] := '출입문';
    cells[3,0] := '승인코드';
    cells[4,0] := '승인상태';
    cells[5,0] := '카드번호';
    cells[6,0] := '출입자명';
    cells[7,0] := FM002;
    cells[8,0] := FM012;
    cells[9,0] := FM022;
    cells[10,0] := FM101;
  end;
end;

procedure TfmKTTypeMonitoring.IntDoorListViewDblClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;
{
procedure TfmKTTypeMonitoring.ShowMessage(aMessage: string);
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
  stReceiveData := aMessage;
  if stReceiveData = 'ALARMREFRESH' then
  begin
    SearchAlarmList;
    Exit;
  end;
  //Delete(stReceiveData,1,1); //처음 맨 앞자리는 R
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
  end;
end;
}

procedure TfmKTTypeMonitoring.LoadJijumCode;
var
  stSql : string;
begin
  if L_bClose then Exit;
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


procedure TfmKTTypeMonitoring.Action_intAlarmHistoryExecute(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stAlarmName : string;
begin

  stNodeNo := copy(sg_IntAlarm.Cells[7,sg_IntAlarm.row],1,3);
  stEcuID := copy(sg_IntAlarm.Cells[7,sg_IntAlarm.row],4,2);
  stArmAreaNo := copy(sg_IntAlarm.Cells[7,sg_IntAlarm.row],6,1);
  stAlarmName := sg_IntAlarm.Cells[2,sg_IntAlarm.row];
  if (stNodeNo = '') or (stEcuID = '') then Exit;

  Try
    Try
      fmAlarmHistory:= TfmAlarmHistory.Create(Self);
    Except
      Exit;
    End;
    fmAlarmHistory.L_stNODENO := stNodeNo;
    fmAlarmHistory.L_stECUID := stEcuID;
    fmAlarmHistory.L_stArmAreaNo := stArmAreaNo;
    fmAlarmHistory.stDeviceName  := stAlarmName + ' ';

    fmAlarmHistory.ShowModal;
  Finally
    fmAlarmHistory.Free;
  End;
end;

procedure TfmKTTypeMonitoring.sg_IntAccessDblClick(Sender: TObject);
var
  stDoorNo : string;
  nIndex : integer;
begin
  stDoorNo := sg_IntAccess.Cells[IntDoorIndexArray[11],sg_IntAccess.Row];
  if stDoorNo = '' then Exit;
  nIndex:= intDoorCodeList.IndexOf(stDoorNo);
  if nIndex > -1 then
  begin
    IntDoorListView.Items[nIndex].Selected := True;
    IntDoorListView.SetFocus;
  end;

end;

procedure TfmKTTypeMonitoring.CommandArrayCommandsTFIRERECOVERExecute(
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
end;

procedure TfmKTTypeMonitoring.CenterPanel;
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

procedure TfmKTTypeMonitoring.FormResize(Sender: TObject);
begin
  CenterPanel;

end;

procedure TfmKTTypeMonitoring.MessageTimerTimer(Sender: TObject);
begin
  pan_Message.Visible := Not pan_Message.Visible;
end;

procedure TfmKTTypeMonitoring.btn_AlarmConfirmClick(Sender: TObject);
begin
  if fmMain.MediaPlayer1.Mode = mpPlaying then fmMain.MediaPlayer1.Stop;
  if fmMain.MediaPlayer2.Mode = mpPlaying then fmMain.MediaPlayer2.Stop;
  AlarmSoundFileList.Clear;
  MessageTimer.Enabled := False;
  pan_Message.visible := False;

end;

procedure TfmKTTypeMonitoring.Panel13Resize(Sender: TObject);
begin
  if IntDoorListView.ViewStyle = vsIcon then
  begin
    IntDoorListView.ViewStyle := vsList;
    IntDoorListView.ViewStyle := vsIcon;
    IntDoorListView.Refresh;
  end else if IntDoorListView.ViewStyle = vsList then
  begin
    IntDoorListView.ViewStyle := vsIcon;
    IntDoorListView.ViewStyle := vsList;
    IntDoorListView.Refresh;
  end;

end;

procedure TfmKTTypeMonitoring.N8Click(Sender: TObject);
begin
  IntAlarmListView.ViewStyle := vsIcon;
  IntAlarmListView.Refresh;
end;

procedure TfmKTTypeMonitoring.N17Click(Sender: TObject);
begin
  IntAlarmListView.ViewStyle := vsList;
  IntAlarmListView.Refresh;

end;

procedure TfmKTTypeMonitoring.pm_intiCloseModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    Application.MessageBox(PChar('화재발생시에는 화재 복구 완료 후에 페쇄모드 가능합니다.'),'정보',MB_OK);
    Exit;
  end;
  for i := 0 to IntdoorListView.Items.Count - 1 do
  begin
    if IntdoorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CLOSEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','폐쇄모드')
    end;
  end;

end;

procedure TfmKTTypeMonitoring.IntDoorListViewClick(Sender: TObject);
begin
  if IntDoorListView.ItemIndex < 0 then Exit;
  if IntDoorListView.ItemIndex > (IntDoorListView.Items.Count ) then Exit;
  IntDoorListView.Hint := '[' + IntDoorListView.Items[IntDoorListView.ItemIndex].SubItems.Strings[6] + ']' +
                          IntDoorListView.Items[IntDoorListView.ItemIndex].SubItems.Strings[7];
end;

procedure TfmKTTypeMonitoring.DoorFireStateChange(NodeNo: integer; aEcuID,
  aDoorNo: string; aFireState: Boolean);
var
  stDoorID : string;
  nDoorIndex : integer;
begin
  if Not aFireState then Exit;
  stDoorID := FillZeroNumber(NodeNo,3) + aEcuID + aDoorNo;
  nDoorIndex:= DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then Exit;

  if IntdoorListView.Items[nDoorIndex].ImageIndex <> DoorFireStateImageIndex then
  begin
    IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorFireStateImageIndex;
    IntdoorListView.Refresh;
  end;

end;

procedure TfmKTTypeMonitoring.DoorStateChange(NodeNo: integer; aEcuID,
  aDoorNo: string; aDoorManageType: TDoorManageMode;
  aDoorPNType: TDoorPNMode; aDoorStateType: TDoorDSState;
  aDoorLockType: TDoorLockState;aDoorFire:Boolean);
var
  stDoorID : string;
  nDoorIndex : integer;
begin
  stDoorID := FillZeroNumber(NodeNo,3) + aEcuID + aDoorNo;
  nDoorIndex:= DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then Exit;

  if aDoorFire then
  begin
    IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorFireStateImageIndex;
  end else
  begin
    case aDoorStateType of
      dsClose : begin IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorCloseStateImageIndex end;
      dsOpen : begin IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorOpenStateImageIndex end;
      dsLongTime :
        begin
          IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorLongTimeStateImageIndex;
          if LongDoorOpenAlarmUse then
          begin
            self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
            self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
          end;
        end;
      else begin IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorNothingStateImageIndex end;
    end;
  end;

  case aDoorPNType of
    pnPositive :
      begin
        case aDoorManageType of
          dmManager : begin IntdoorListView.Items[nDoorIndex].StateIndex:= DoorPosiManageStateIndex end;
          dmOpen : begin IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex end;
          dmLock : begin IntdoorListView.Items[nDoorIndex].StateIndex:= DoorCloseModeStateIndex end;
          dmMaster : begin IntdoorListView.Items[nDoorIndex].StateIndex:= DoorMasterModeStateIndex end;
          else begin IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex end;
        end;
      end;
    pnNegative :
      begin
        case aDoorManageType of
          dmManager : begin IntdoorListView.Items[nDoorIndex].StateIndex:= DoorNegaManageStateIndex end;
          dmOpen : begin IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex end;
          dmLock : begin IntdoorListView.Items[nDoorIndex].StateIndex:= DoorCloseModeStateIndex end;
          dmMaster : begin IntdoorListView.Items[nDoorIndex].StateIndex:= DoorMasterModeStateIndex end;
          else begin IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex end;
        end;
      end;
    else
      begin
        IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
      end;
  end;
  IntdoorListView.Refresh;

end;

procedure TfmKTTypeMonitoring.DeviceConnected(NodeNo: integer;
  aEcuID: string; aConnected: Boolean);
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

procedure TfmKTTypeMonitoring.AlarmModeChanged(NodeNo: integer;
  aEcuID,aAlarmArea: string; aWachMode: TWatchMode);
var
  nAlarmIndex : integer;
  stAlarmID : string;
  nTempIndex : integer;
begin
  stAlarmID := FillzeroNumber(NodeNo,3) + aEcuID + aAlarmArea;
  nAlarmIndex := AlarmDeviceIDList.IndexOf(stAlarmID);
  if nAlarmIndex < 0 then Exit;// 관제 권한이 없음

  nTempIndex := ArmAreaStateList.IndexOf(stAlarmID);
  if nTempIndex < 0 then exit;

  if TArmAreaState(ArmAreaStateList.Objects[nTempIndex]).AlarmEventState = aeAlarmEvent then Exit; //이벤트 확인하지 않은 상태면 빠져 나감

  case aWachMode of
    cmNothing :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmNothingStateImageIndex;
      end;
    cmArm :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmModeStateImageIndex;
      end;
    cmDisarm :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= DisAlarmModeStateImageIndex;
      end;
    cmPatrol :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmPatrolStateImageIndex;
      end;
    cmInit :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmInitStateImageIndex;
      end;
    cmTest :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmTestStateImageIndex;
      end;
    cmJaejung :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= JaeJungAlarmStateImageIndex;
      end;
    else
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmNothingStateImageIndex;
      end;
  end;
  IntAlarmListView.Refresh;

end;

procedure TfmKTTypeMonitoring.DeviceAlarmEventProcess(NodeNo: integer;
  ECUID,aArmAreaNo: string; aAlaramState: TAlarmEventState);
var
  nAlarmIndex : integer;
  stDeviceID : string;
  stAlarmID : string;
  nTempIndex : integer;
begin
  stDeviceID := FillzeroNumber(NodeNo,3) + ECUID;
  stAlarmID := stDeviceID + inttostr(strtoint(aArmAreaNo));
  nAlarmIndex := AlarmDeviceIDList.IndexOf(stAlarmID);
  if nAlarmIndex < 0 then Exit;// 관제 권한이 없음

  nTempIndex := DeviceStateList.IndexOf(stDeviceID);
  if nTempIndex < 0 then exit;

  case TDeviceState(DeviceStateList.Objects[nTempIndex]).GetAlarmMode(strtoint(aArmAreaNo)) of
    cmNothing :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmNothingStateImageIndex;
      end;
    cmArm :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmModeStateImageIndex;
      end;
    cmDisarm :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= DisAlarmModeStateImageIndex;
      end;
    cmPatrol :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmPatrolStateImageIndex;
      end;
    cmInit :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmInitStateImageIndex;
      end;
    cmTest :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmTestStateImageIndex;
      end;
    cmJaejung :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= JaeJungAlarmStateImageIndex;
      end;
    else
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmNothingStateImageIndex;
      end;
  end;

  case aAlaramState of
    aeNothing :
      begin
      end;
    aeNormal :
      begin
      end;
    aeNormalEvent :
      begin
      end;
    aeAlarmEvent :
      begin
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmEventStateImageIndex;
      end;
    else
      begin
      end;
  end;
  IntAlarmListView.Refresh;

end;

procedure TfmKTTypeMonitoring.AlarmEventProcess(NodeNo: integer; ECUID,aArmAreaNo,
  aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode, aStatusCode,
  aPortNo, aState, aOperator, aNewStateCode: string; aAlarmView,
  aAlarmSound: Boolean;aColor:string);
var
  nAlarmIndex : integer;

  stAlarmID : string;
  stAlarmName : string;
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
begin
  stAlarmID := FillZeroNumber(NodeNo,3) + ECUID + aArmAreaNo;
  nAlarmIndex := AlarmDeviceIDList.IndexOf(stAlarmID);

  if Not isMaster then
    if nAlarmIndex < 0 then Exit;// 관제 권한이 없음

  if nAlarmIndex > -1 then
  begin
    stBuildingName := AlarmLocateList.Strings[nAlarmIndex]; //경계구역 위치
    stAlarmName:= IntAlarmListView.Items[nAlarmIndex].Caption; // 경계구역 명
  end else
  begin
    stBuildingName := GetDeviceBuildingName(NodeNo,ECUID);
    stAlarmName := GetDeviceName(NodeNo,ECUID);
  end;

  nResult:= GetStatusCode(aNewStateCode,stStatusName,nAlarmSound);
  if aPortNo <> '**' then
  begin
    if aState <> 'N' then
    begin
      stPortName := GetPortName(FillZeroNumber(NodeNo,3),ECUID,aPortNo);
      if stStatusName = '' then
      begin
        stStatusName := '' + aPortNo + '번 침입' + '  ' + stPortName;// + stStatusName; //+ stPortNo +'번존 감지'; //stStatusName;    //어떤 조건으로 감지 되었는지 표시
      end else
      begin
        stStatusName := '' + stStatusName + '  ' + stPortName ;
      end;
    end else
    begin
      //aAlarmSound := False;
      stStatusName := stStatusName +'[복구]' + stPortName ;
    end;
  end;
  case UpperCase(aMode)[1] of
   'A': begin stModeStr:= '경계모드[A]' end;
   'D': begin stModeStr:= '해제모드[D]' end;
   'T': begin stModeStr:= '시험모드[T]' end;
   'I': begin stModeStr:= '등록모드[I]' end;
   'P': begin stModeStr:= '순회모드[P]' end;
  else  begin stModeStr:= '미등록모드['+aMode[1]+']' end;
  end;
  stStatusName := stStatusName + '/' + stModeStr;

  nAlarmSound := 0;
  if aAlarmSound then
  begin
    nAlarmSound := 1;
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
                    stBuildingName, //위치정보
                    stAlarmName, //경계구역명칭
                    ECUID ,//+'['+stMsgNo+']',  //기기번호[메시지번호]
                    aSubCLass,         //기기타입[번호]
                    aStatusCode + '/' + aPortNo,  //이벤트코드
                    stStatusName,
                    FillZeroNumber(NodeNo,3) + ECUID,
                    nAlarmSound,
                    aColor,
                    sg_IntAlarm);  //이벤트 내용
      if (nAlarmSound > 0) and (G_nAlarmMapPopup = 1) then
      begin
        DisplayArmAreaMapShow(copy(stBuildingName,1,9),inttostr(NodeNo),ECUID,aZoneCode);
      end;
    end;
  end;

  if PTAlarmMessageUse then  //ZONE Sensing Message Use
  begin
    if aCmd = 'A' then
    begin
      if isDigit(aPortNo) then
      begin
        st_Message.Caption := stAlarmName + ':' + aPortNo + '번 존 감지!!!';
        MessageTimer.Enabled := True;
      end;
    end;
  end;
  if G_nAlarmMapPopup = 1 then
  begin
    DisplayArmAreaMapModeChange(copy(stBuildingName,1,9),inttostr(NodeNo),ECUID,aZoneCode);
  end;

end;

procedure TfmKTTypeMonitoring.ExitButtonPress(NodeNo: integer; aEcuID,
  aDoorNo, aTime, aInputType, aUserName, aPermitCode, aPermit: string);
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
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then
  begin
    //등록되지 않은 기기 데이터
    Exit;
  end;
  stDoorID := stDeviceID + aDoorNo;
  nDoorIndex := DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then
  begin
    //자바라인지 확인 하자
    if aDoorNo = '2' then
    begin
      if dmJavara.JavaraCheck(NodeNo,aEcuID) then
      begin
        nDoorIndex := DoorCodeList.IndexOf(FillZeroNumber(NodeNo,3) + aEcuID + '1');
        if nDoorIndex > -1 then
        begin
          stDoorName := IntDoorListView.Items[nDoorIndex].Caption + '_닫힘'; // 자바라닫힘
          stBuildingName := DoorLocateList.Strings[nDoorIndex];
          InsertDOORList(aPermitCode,aPermit,aTime,stBuildingName,stDoorName,aInputType,aUserName,
            '','','','',stDoorID,'','','','',sg_IntAccess);
        end;
      end;
    end;
    Exit;
  end;
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
    '','','','',stDoorID,'','','','',sg_IntAccess);
end;

procedure TfmKTTypeMonitoring.AccessEventProcess(NodeNo: integer; aEcuID,
  aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
  aButton,aArmAreaNo: string);
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
  nIndex : integer;
  stHandPhone,stCompanyPhone,stAddr1,stAddr2 : string;
  i : integer;
begin
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then
  begin
    Exit;
  end;

  stPermitName := GetPermitState(aPermit);
  GetUserInfo(aCardNo,stEmName,stCompanyName,stJijumName,stDepartName,stEmCode,stHandPhone,stCompanyPhone,stAddr1,stAddr2);

  stDoorID := stDeviceID + aDoorNo;
  nDoorIndex := DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then
  begin
    //자바라인지 확인 하자
    if aDoorNo = '2' then
    begin
      if dmJavara.JavaraCheck(NodeNo,aEcuID) then
      begin
        nDoorIndex := DoorCodeList.IndexOf(FillZeroNumber(NodeNo,3) + aEcuID + '1');
        if nDoorIndex > -1 then
        begin
          stDoorName := IntDoorListView.Items[nDoorIndex].Caption + '_닫힘';
          stBuildingName := DoorLocateList.Strings[nDoorIndex];
          InsertDOORList(aPermit,stPermitName,aTime,stBuildingName,stDoorName,aCardNo,stEmName,
            stCompanyName,stJijumName,stDepartName,stEmCode,stDoorID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_IntAccess);
        end;
        Exit;
      end;
    end;
    if aPermit <> '1' then   //출입승인이 아니면 방범 구역도 보자
    begin
    //if aDoorNo = '0' then
    //begin
    //  for i := 0 to 8 do
    //  begin
        nIndex := AlarmDeviceIDList.IndexOf(stDeviceID + aArmAreaNo );
    //    if nIndex > -1 then break;
    //  end;

      if nIndex < 0 then
      begin
        if Not isMaster then Exit;// 관제 권한이 없음
        stDoorName:= dmDBFunction.GetDeviceName(inttostr(NodeNo),aEcuID); // 컨트롤러명
      end else
      begin
        stDoorName:= IntAlarmListView.Items[nIndex].Caption; // 경계구역 명
        stBuildingName := AlarmLocateList.Strings[nIndex];
      end;
    //end else Exit; //관제권한 없음
    end else Exit;
  end else
  begin
    stDoorName := IntDoorListView.Items[nDoorIndex].Caption;
    stBuildingName := DoorLocateList.Strings[nDoorIndex];
  end;

  if ACAlarmUse then
  begin
    if Not Isdigit(aPermit) then
    begin
      self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
      self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
    end;
  end;

  if nDoorIndex > -1 then
  begin
    IntDoorListView.Items[nDoorIndex].SubItems.Strings[5] := aInputType[1];
    IntDoorListView.Items[nDoorIndex].SubItems.Strings[6] := aPermit[1];
    IntDoorListView.Items[nDoorIndex].SubItems.Strings[7] := stEmName;
  end;

  InsertDOORList(aPermit,stPermitName,aTime,stBuildingName,stDoorName,aCardNo,stEmName,
    stCompanyName,stJijumName,stDepartName,stEmCode,stDoorID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_IntAccess);
end;

procedure TfmKTTypeMonitoring.NodeConnectState(NodeNo: integer;
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

procedure TfmKTTypeMonitoring.AlarmStateRefresh;
var
  i : integer;
  stAlarmID : string;
  nAlarmIndex : integer;
begin
  if IntAlarmListView.Items.Count < 1 then Exit;

  for i := 0 to IntAlarmListView.Items.Count - 1 do
  begin
    stAlarmID:= AlarmDeviceIDList[i];
    nAlarmIndex := ArmAreaStateList.IndexOf(stAlarmID);
    if nAlarmIndex > -1 then
    begin
      if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmArm then
      begin
        IntAlarmListView.Items[I].ImageIndex:=AlarmModeStateImageIndex;
      end else if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmDisarm then
      begin
        IntAlarmListView.Items[I].ImageIndex:=DisAlarmModeStateImageIndex;
      end else if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmPatrol then
      begin
        IntAlarmListView.Items[I].ImageIndex:= AlarmPatrolStateImageIndex;
      end else if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmInit then
      begin
        IntAlarmListView.Items[I].ImageIndex:= AlarmInitStateImageIndex;
      end else if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmTest then
      begin
        IntAlarmListView.Items[I].ImageIndex:= AlarmTestStateImageIndex;
      end else if TArmAreaState(ArmAreaStateList.Objects[nAlarmIndex]).AlarmMode = cmJaejung then
      begin
        IntAlarmListView.Items[I].ImageIndex:= JaeJungAlarmStateImageIndex;
      end else
      begin
        IntAlarmListView.Items[I].ImageIndex:= AlarmNothingStateImageIndex;
      end;
    end else
    begin
      IntAlarmListView.Items[I].ImageIndex:=AlarmNothingStateImageIndex;
    end;

  end;
end;

procedure TfmKTTypeMonitoring.DeviceStateRefresh;
var
  i : integer;
  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
begin
{  aTreeView := TreeView_Device;

  for i := 0 to DeviceList.Count - 1 do
  begin
    bNode := nil;
    stNodeNo := FillZeroNumber(TDevice(DeviceList.Objects[i]).NodeNo,3);
    stDeviceID := stNodeNo + TDevice(DeviceList.Objects[i]).ECUID;
    stLocationCaption :=  TDevice(DeviceList.Objects[i]).DeviceName;
    DeviceCodeList.Add('E' + stDeviceID);
    DeviceCaptionList.Add(stLocationCaption);
    DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //ECU의 접속시간 체크하자...
    nIndex := DeviceCodeList.IndexOf('N' + stNodeNo);
    stParentCode := DeviceCaptionList.Strings[nIndex] ;
    aNode:= GetNodeByText(aTreeView,stParentCode,True);
    if aNode <> nil then
    begin
      bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
      if TDevice(DeviceList.Objects[i]).Connected then
      begin
        bNode.ImageIndex:=DeviceConnectImageIndex;
        bNode.SelectedIndex:=DeviceConnectImageIndex;
      end else
      begin
        bNode.ImageIndex:=DeviceDisConnectImageIndex;
        bNode.SelectedIndex:=DeviceDisConnectImageIndex;
      end;
      bNode.StateIndex:= NothingStateIndex;
    end;
    if bNode <> nil then
    begin
      if TDevice(DeviceList.Objects[i]).Door1Use then
      begin
        cNode := aTreeView.Items.AddChild(bNode,TDevice(DeviceList.Objects[i]).Door1Name);
        cNode.ImageIndex := 12;
        cNode.StateIndex := NothingStateIndex;
      end;
      if TDevice(DeviceList.Objects[i]).AlarmUse then
      begin
        cNode := aTreeView.Items.AddChild(bNode,TDevice(DeviceList.Objects[i]).AlarmName);
        cNode.ImageIndex := 13;
        cNode.StateIndex := NothingStateIndex;
      end;
      bNode.MakeVisible;
    end;
    Application.ProcessMessages;
  end;
}
end;

procedure TfmKTTypeMonitoring.DoorStateRefresh;
var
  i : integer;
  stDeviceID : string;
  stDoorID : string;
  nDoorIndex : integer;
begin
  if IntDoorListView.Items.Count < 1 then Exit;

  for i := 0 to IntDoorListView.Items.Count - 1 do
  begin
    stDeviceID := copy(DoorCodeList[i],1,5);
    stDoorID := DoorCodeList[i];
    nDoorIndex := DoorStateList.IndexOf(stDoorID);
    if nDoorIndex > -1 then
    begin
      if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode = pnPositive then
      begin
        if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmManager then
        begin
          IntDoorListView.Items[I].StateIndex:= DoorPosiManageStateIndex;
        end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmOpen then
        begin
          IntDoorListView.Items[I].StateIndex:= DoorOpenModeStateIndex;
        end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmLock then
        begin
          IntDoorListView.Items[I].StateIndex:= DoorCloseModeStateIndex;
        end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmMaster then
        begin
          IntDoorListView.Items[I].StateIndex:= DoorMasterModeStateIndex;
        end else
        begin
          IntDoorListView.Items[I].StateIndex:=DoorOpenModeStateIndex;
        end;
      end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode = pnNegative then
      begin
        if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmManager then
        begin
          IntDoorListView.Items[I].StateIndex:= DoorNegaManageStateIndex;
        end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmOpen then
        begin
          IntDoorListView.Items[I].StateIndex:= DoorOpenModeStateIndex;
        end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmLock then
        begin
          IntDoorListView.Items[I].StateIndex:= DoorCloseModeStateIndex;
        end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmMaster then
        begin
          IntDoorListView.Items[I].StateIndex:= DoorMasterModeStateIndex;
        end else
        begin
          IntDoorListView.Items[I].StateIndex:=DoorOpenModeStateIndex;
        end;
      end else
      begin
        IntDoorListView.Items[I].StateIndex:=DoorOpenModeStateIndex;
      end;
      if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire then
      begin
        IntDoorListView.Items[I].ImageIndex := DoorFireStateImageIndex;
      end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsClose then
      begin
        IntDoorListView.Items[I].ImageIndex := DoorCloseStateImageIndex;
      end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsOpen then
      begin
        IntDoorListView.Items[I].ImageIndex := DoorOpenStateImageIndex;
      end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsLongTime then
      begin
        IntDoorListView.Items[I].ImageIndex := DoorLongTimeStateImageIndex;
      end else
      begin
        IntDoorListView.Items[I].ImageIndex := DoorNothingStateImageIndex;
      end;
    end else
    begin
      IntDoorListView.Items[I].ImageIndex:=DoorNothingStateImageIndex;
    end;
  end;

end;

procedure TfmKTTypeMonitoring.MenuItem10Click(Sender: TObject);
var
  stCardNo : string;
begin
  stCardNo := sg_IntAccess.Cells[IntDoorIndexArray[5],sg_IntAccess.Row];
  if stCardNo = '' then Exit;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['VALUE'] := 'EMPLOYEE';
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['CARDNO'] := stCardNo;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Execute;

end;

procedure TfmKTTypeMonitoring.MenuItem14Click(Sender: TObject);
var
  stCardNo : string;
begin
  stCardNo := sg_IntAccess.Cells[IntDoorIndexArray[5],sg_IntAccess.Row];
  if stCardNo = '' then Exit;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['VALUE'] := 'CARDADMIN';
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['CARDNO'] := stCardNo;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Execute;

end;

procedure TfmKTTypeMonitoring.MemoryCreate;
begin
  DeviceCodeList := TStringList.Create;
  DeviceCaptionList := TStringList.Create;
  DeviceLastTimeList := TStringList.Create;
  DoorCodeList := TStringList.Create;
  intDoorCodeList := TStringList.Create;
  DoorLocateList := TStringList.Create;
  AlarmDeviceIDList := TStringList.Create;
  AlarmNoList := TStringList.Create;
  AlarmLocateList := TStringList.Create;
  AlarmFormDisplayList := TStringList.Create;
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

  SetLength(IntDoorIndexArray,sg_IntAccess.ColCount);
  SetLength(relIntDoorIndexArray,sg_IntAccess.ColCount);

  SetLength(IntAlarmIndexArray,sg_IntAlarm.ColCount);
  SetLength(relIntAlarmIndexArray,sg_IntAlarm.ColCount);

end;

procedure TfmKTTypeMonitoring.iniConfigRead;
var
  ini_fun : TiniFile;
  i : integer;
  stValue : string;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  if UpperCase(ini_fun.ReadString('KTTypeMonitoring','DeviceTab','tbDEVICE')) = 'TBLOCATE' then PageControl1.ActivePage := tbLOCATE
  else PageControl1.ActivePage := tbDEVICE;
  Panel1.Width := ini_fun.ReadInteger('KTTypeMonitoring','DeviceWidth',217);
  if Panel1.Width < 5 then Panel1.Width := 5;

  stValue := ini_fun.ReadString('KTTypeMonitoring','MonitorTab','AccessTab');
  PageControl2.ActivePage := IntegrationTab;

  Panel12.Height := ini_fun.ReadInteger('KTTypeMonitoring','InitHeight',273);
  if Panel12.Height < 5 then Panel12.Height := 5;
  Panel14.Width := ini_fun.ReadInteger('KTTypeMonitoring','Alarm2Width',478);
  if Panel14.Width < 5 then Panel14.Width := 5;
  Panel15.Height := ini_fun.ReadInteger('KTTypeMonitoring','Access2Height',144);
  if Panel15.Height < 5 then Panel15.Height := 5;


  stValue := ini_fun.ReadString('KTTypeMonitoring','IntDoorListView','vsIcon');
  if UpperCase(stValue) = 'VSICON' then
  begin
    IntDoorListView.ViewStyle := vsList;
    IntDoorListView.Refresh;
    IntDoorListView.ViewStyle := vsIcon ;
    pan_LargeIntro.Visible := True;
    pan_LargeIntro.Align := alClient;
    pan_SmallIntro.Visible := False;
  end else
  begin
    IntDoorListView.ViewStyle := vsIcon;
    IntDoorListView.Refresh;
    IntDoorListView.ViewStyle := vsList;
    pan_LargeIntro.Visible := False;
    pan_SmallIntro.Visible := True;
    pan_SmallIntro.Align := alClient;
  end;

  stValue := ini_fun.ReadString('KTTypeMonitoring','IntAlarmListView','vsIcon');
  if UpperCase(stValue) = 'VSICON' then
  begin
    IntAlarmListView.ViewStyle := vsIcon ;
  end else
  begin
    IntAlarmListView.ViewStyle := vsIcon;
    IntAlarmListView.Refresh;
    IntAlarmListView.ViewStyle := vsList;
  end;

  for i := LOW(IntDoorIndexArray) to HIGH(IntDoorIndexArray) do
  begin
    IntDoorIndexArray[i] := ini_fun.ReadInteger('KTTypeMonitoring','IntDoorIndexArray'+inttostr(i),i);
  end;
  for i := LOW(relIntDoorIndexArray) to HIGH(relIntDoorIndexArray) do
  begin
    relIntDoorIndexArray[i] := ini_fun.ReadInteger('KTTypeMonitoring','relIntDoorIndexArray'+inttostr(i),i);
  end;

  for i := LOW(IntAlarmIndexArray) to HIGH(IntAlarmIndexArray) do
  begin
    IntAlarmIndexArray[i] := ini_fun.ReadInteger('KTTypeMonitoring','IntAlarmIndexArray'+inttostr(i),i);
  end;
  for i := LOW(relIntAlarmIndexArray) to HIGH(relIntAlarmIndexArray) do
  begin
    relIntAlarmIndexArray[i] := ini_fun.ReadInteger('KTTypeMonitoring','relIntAlarmIndexArray'+inttostr(i),i);
  end;

  ini_fun.Free;
end;

procedure TfmKTTypeMonitoring.ListHeaderNameSet;
var
  i : integer;
begin
  for i := LOW(IntDoorIndexArray) to HIGH(IntDoorIndexArray) do
  begin
    sg_IntAccess.cells[IntDoorIndexArray[i],0] := AccessHeaderNameList[i];
  end;
  for i := LOW(IntAlarmIndexArray) to HIGH(IntAlarmIndexArray) do
  begin
    sg_IntAlarm.cells[IntAlarmIndexArray[i],0] := AlarmHeaderNameList[i];
  end;

end;

procedure TfmKTTypeMonitoring.CellHide;
var
  i : integer;
begin
  for i := 0 to ACCESSEVENTMAXCELL do
  begin
    if AccessEventShowTable[i] = 0 then
    begin
      sg_IntAccess.ColWidths[IntDoorIndexArray[i]] := 0;
    end else
    begin
      sg_IntAccess.ColWidths[IntDoorIndexArray[i]] := Access2SizeTable[IntDoorIndexArray[i]];
      if sg_IntAccess.ColWidths[IntDoorIndexArray[i]] = 0 then sg_IntAccess.ColWidths[IntDoorIndexArray[i]] := 90;
    end;
  end;
  for i := 0 to ALARMEVENTMAXCELL do
  begin
    if AlarmEventShowTable[i] = 0 then
    begin
      sg_IntAlarm.ColWidths[IntAlarmIndexArray[i]] := 0;
    end else
    begin
      sg_IntAlarm.ColWidths[IntAlarmIndexArray[i]] := Alarm2SizeTable[IntAlarmIndexArray[i]];
      if sg_IntAlarm.ColWidths[IntAlarmIndexArray[i]] = 0 then sg_IntAlarm.ColWidths[IntAlarmIndexArray[i]] := 90;
    end;
  end;
end;

procedure TfmKTTypeMonitoring.iniConfigWrite;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  ini_fun.WriteString('KTTypeMonitoring','DeviceTab',PageControl1.ActivePage.Name);
  ini_fun.WriteInteger('KTTypeMonitoring','DeviceWidth',Panel1.Width);
  if PageControl2.ActivePage <> nil then
    ini_fun.WriteString('KTTypeMonitoring','MonitorTab',PageControl2.ActivePage.Name);
  ini_fun.WriteInteger('KTTypeMonitoring','InitHeight',Panel12.Height);
  ini_fun.WriteInteger('KTTypeMonitoring','Alarm2Width',Panel14.Width);
  ini_fun.WriteInteger('KTTypeMonitoring','Access2Height',Panel15.Height);
  if IntDoorListView.ViewStyle = vsIcon then ini_fun.WriteString('KTTypeMonitoring','IntDoorListView','vsIcon')
  else ini_fun.WriteString('KTTypeMonitoring','IntDoorListView','vsList');
  if IntAlarmListView.ViewStyle = vsIcon then ini_fun.WriteString('KTTypeMonitoring','IntAlarmListView','vsIcon')
  else ini_fun.WriteString('KTTypeMonitoring','IntAlarmListView','vsList');

  for i := LOW(IntDoorIndexArray) to HIGH(IntDoorIndexArray) do
  begin
    ini_fun.WriteInteger('KTTypeMonitoring','IntDoorIndexArray'+inttostr(i),IntDoorIndexArray[i]);
  end;
  for i := LOW(relIntDoorIndexArray) to HIGH(relIntDoorIndexArray) do
  begin
    ini_fun.WriteInteger('KTTypeMonitoring','relIntDoorIndexArray'+inttostr(i),relIntDoorIndexArray[i]);
  end;
  for i := LOW(IntAlarmIndexArray) to HIGH(IntAlarmIndexArray) do
  begin
    ini_fun.WriteInteger('KTTypeMonitoring','IntAlarmIndexArray'+inttostr(i),IntAlarmIndexArray[i]);
  end;
  for i := LOW(relIntAlarmIndexArray) to HIGH(relIntAlarmIndexArray) do
  begin
    ini_fun.WriteInteger('KTTypeMonitoring','relIntAlarmIndexArray'+inttostr(i),relIntAlarmIndexArray[i]);
  end;

  for i := 0 to ACCESSEVENTMAXCELL do
  begin
    Access2SizeTable[i] := sg_IntAccess.ColWidths[i];
    ini_fun.WriteInteger('출입이벤트2사이즈',inttostr(i),sg_IntAccess.ColWidths[i]);
  end;
  for i := 0 to ALARMEVENTMAXCELL do
  begin
    Alarm2SizeTable[i] := sg_IntAlarm.ColWidths[i];
    ini_fun.WriteInteger('알람이벤트2사이즈',inttostr(i),sg_IntAlarm.ColWidths[i]);
  end;

  ini_fun.Free;
end;

procedure TfmKTTypeMonitoring.MemoryDestory;
begin
  DeviceCodeList.Free;
  DeviceCaptionList.Free;
  DeviceLastTimeList.Free;
  DoorCodeList.Free;
  intDoorCodeList.Free;
  DoorLocateList.Free;
  AlarmDeviceIDList.Free;
  AlarmNoList.Free;
  AlarmLocateList.Free;
  AlarmFormDisplayList.Free;
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

end;

procedure TfmKTTypeMonitoring.mn_FireRecoveryClick(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if IntAlarmListView.SelCount < 1 then
  begin
    showmessage('방범구역을 선택해 주세요.');
    Exit;
  end;
  for i := 0 to IntAlarmListView.Items.Count - 1 do
  begin
    if IntAlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmDeviceIDList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DIRECT'+ DATADELIMITER + stAlarmID + DATADELIMITER + 'RSM2500' + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;

      if G_bFireRelayUse then
      begin
        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DIRECT'+ DATADELIMITER + stAlarmID + DATADELIMITER + 'RRY00' + FillZeroNumber(G_nFireRelayNumber,2) + 'f' + FillZeroNumber(G_nFireRelayTime,2) + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
      end;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','화재복구')
    end;
  end;

end;

procedure TfmKTTypeMonitoring.IntAlarmListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  inherited;
{  if Selected then
  begin
    Try
      if TListView(Sender).Items[TListView(Sender).ItemIndex].SubItems.Strings[8] = '1' then
      begin
        pm_intimodechange.Visible := False;
        pm_intiDoorOpen.Visible := False;
        pm_intiJavarOpen.Visible := True;
        pm_intiJavaraClose.Visible := True;
      end else
      begin
        pm_intimodechange.Visible := True;
        pm_intiDoorOpen.Visible := True;
        pm_intiJavarOpen.Visible := False;
        pm_intiJavaraClose.Visible := False;
      end;
    Except
      Exit;
    End;
  end;  }
end;

procedure TfmKTTypeMonitoring.pm_intiJavarOpenClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  Try
    if IntdoorListView.SelCount < 1 then Exit;
    for i := 0 to IntdoorListView.Items.Count - 1 do
    begin
      if IntdoorListView.Items[i].Selected then
      begin
        stDoorID:= DoorCodeList[i];
        stDoorID[Length(stDoorID)] := '1'; //자바라 열기 일때는 자바라 문번호를 1번으로 바꿈

        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
        DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','자바라열기')
      end;
    end;
  Except
    showmessage('전송실패');
    Exit;
  End;
end;

procedure TfmKTTypeMonitoring.pm_intiJavaraCloseClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  Try
    if IntdoorListView.SelCount < 1 then Exit;
    for i := 0 to IntdoorListView.Items.Count - 1 do
    begin
      if IntdoorListView.Items[i].Selected then
      begin
        stDoorID:= DoorCodeList[i];
        stDoorID[Length(stDoorID)] := '2'; //자바라 닫기 일때는 자바라 문번호를 2번으로 바꿈

        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
        DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','자바라닫기')
      end;
    end;
  Except
    showmessage('전송실패');
    Exit;
  End;

end;

procedure TfmKTTypeMonitoring.IntDoorListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  inherited;
  if Selected then
  begin
    Try
      if TListView(Sender).Items[TListView(Sender).ItemIndex].SubItems.Strings[8] = '1' then
      begin
        pm_intimodechange.Visible := False;
        pm_intiDoorOpen.Visible := False;
        pm_intiJavarOpen.Visible := True;
        pm_intiJavaraClose.Visible := True;
      end else
      begin
        pm_intimodechange.Visible := True;
        pm_intiDoorOpen.Visible := True;
        pm_intiJavarOpen.Visible := False;
        pm_intiJavaraClose.Visible := False;
      end;
    Except
      Exit;
    End;
  end;
end;

procedure TfmKTTypeMonitoring.AlaramConfirm(aNodeNo, aEcuID,aArmAreaNo: string);
var
  stAlarmID : string;
  bAlarmConfirm : Boolean;
begin
  bAlarmConfirm := False;

  stAlarmID := '';
  
  if isdigit(aNodeNo) then
    stAlarmID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + aArmAreaNo;
  Try
    Try
      fmAlarmConfirm:= TfmAlarmConfirm.Create(Self);
    Except
      Exit;
    End;
    fmAlarmConfirm.AlarmID := stAlarmID;
    fmAlarmConfirm.ShowModal;
    bAlarmConfirm := fmAlarmConfirm.bAlarmConfirm;
  Finally
    fmAlarmConfirm.Free;
  End;
  if bAlarmConfirm then
  begin
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMREFRESH'+ DATADELIMITER + '00000' + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
  end;

end;

procedure TfmKTTypeMonitoring.AlarmListClear;
begin
  sg_IntAlarm.InsertRows(1,1);
  GridInitialize(sg_IntAlarm,2);
end;

procedure TfmKTTypeMonitoring.mi_AlarmConfirmClick(Sender: TObject);
var
  stAlarmID : string;
  stDeviceID : string;
  stAlarmName : string;
  nDeviceIndex : integer;
  bAlarmConfirm : Boolean;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID:= IntAlarmListView.items[IntAlarmListView.ItemIndex].SubItems.Strings[0];
  stDeviceID := copy(stAlarmID,1,5);
  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then Exit;
  if ALARMVIEW = 'QUERY' then
  begin
    stAlarmName := IntAlarmListView.items[IntAlarmListView.ItemIndex].Caption;
    Try
      Try
        fmAlarmConfirm:= TfmAlarmConfirm.Create(Self);
      Except
        Exit;
      End;
      fmAlarmConfirm.AlarmID := stAlarmID;
      fmAlarmConfirm.AlarmName := stAlarmName;
      fmAlarmConfirm.ShowModal;
      bAlarmConfirm := fmAlarmConfirm.bAlarmConfirm;
    Finally
      fmAlarmConfirm.Free;
    End;
    if bAlarmConfirm then
    begin
      TDeviceState(DeviceStateList.Objects[nDeviceIndex]).AlaramEventClear;
      AlarmListClear;
      //TDeviceState(DeviceStateList.Objects[nAlarmIndex]).AlaramEventClear;
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMREFRESH'+ DATADELIMITER + '00000' + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
    end;
  end else
  begin
    TDeviceState(DeviceStateList.Objects[nDeviceIndex]).AlaramEventClear;
  end;

end;

procedure TfmKTTypeMonitoring.N20Click(Sender: TObject);
begin
  inherited;
  sg_IntAlarmDblClickCell(sg_IntAlarm,sg_IntAlarm.Row,sg_IntAlarm.Col);

end;

procedure TfmKTTypeMonitoring.N22Click(Sender: TObject);
begin
  inherited;
  AlaramConfirm('','','');

end;

procedure TfmKTTypeMonitoring.mn_AlarmReportClick(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
  stLocateName : string;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID:= IntAlarmListView.items[IntAlarmListView.ItemIndex].SubItems.Strings[0];

  self.FindSubForm('Main').FindCommand('AlarmReport').Params.Values['ALARMID'] := stAlarmID;
  self.FindSubForm('Main').FindCommand('AlarmReport').Execute;

end;

procedure TfmKTTypeMonitoring.N24Click(Sender: TObject);
var
  st : string;
begin
  inherited;
  st := sg_IntAccess.Cells[IntDoorIndexArray[5],sg_IntAccess.Row];

  if st <> '' then ClipBoard.SetTextBuf(PChar(st));

end;

function TfmKTTypeMonitoring.GetDeviceBuildingName(NodeNo: integer;
  aEcuID: string): string;
var
  stSql : string;
  stLocationName : string;
begin
  Result:= '';
  stLocationName := '';

  stSql := 'select b.LO_NAME as BuildingName,c.LO_NAME as FloorName,d.LO_NAME as AreaName from TB_ACCESSDEVICE a ';
  stSql := stSql + ' Left Join (select * from TB_LOCATION where lo_gubun = ''0'') b ';
  stSql := stSql + ' ON (a.LO_DONGCODE = b.LO_DONGCODE ) ';
  stSql := stSql + ' Left Join (select * from TB_LOCATION where lo_gubun = ''1'') c ';
  stSql := stSql + ' ON (a.LO_DONGCODE = c.LO_DONGCODE  ';
  stSql := stSql + ' AND a.LO_FLOORCODE = c.LO_FLOORCODE ) ';
  stSql := stSql + ' Left Join (select * from TB_LOCATION where lo_gubun = ''2'') d ';
  stSql := stSql + ' ON (a.LO_DONGCODE = d.LO_DONGCODE  ';
  stSql := stSql + ' AND a.LO_FLOORCODE = d.LO_FLOORCODE  ';
  stSql := stSql + ' AND a.LO_AREACODE = d.LO_AREACODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(NodeNo);
  stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';

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
    if Trim(FindField('BuildingName').AsString) <> '' then stLocationName := Trim(FindField('BuildingName').AsString);
    if Trim(FindField('FloorName').AsString) <> '' then stLocationName := stLocationName + '-' + Trim(FindField('FloorName').AsString);
    if Trim(FindField('AreaName').AsString) <> '' then stLocationName :=  stLocationName + '-' + Trim(FindField('AreaName').AsString);
    result := stLocationName ;
  end;

end;

function TfmKTTypeMonitoring.GetDeviceName(NodeNo: integer;
  aEcuID: string): string;
var
  stSql : string;
begin
  Result:= '';

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(NodeNo);
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

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
    if Trim(FindField('AC_DEVICENAME').AsString) <> '' then result := FindField('AC_DEVICENAME').AsString;
  end;

end;

procedure TfmKTTypeMonitoring.pm_intiMasterModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    Application.MessageBox(PChar('화재발생시에는 화재 복구 완료 후에 마스터모드 가능합니다.'),'정보',MB_OK);
    Exit;
  end;
  for i := 0 to IntdoorListView.Items.Count - 1 do
  begin
    if IntdoorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'MASTERMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','마스터모드')
    end;
  end;

end;

procedure TfmKTTypeMonitoring.Positive1Click(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  for i := 0 to IntdoorListView.Items.Count - 1 do
  begin
    if IntdoorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'POSITIVE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','POSITIVE모드')
    end;
  end;
end;

procedure TfmKTTypeMonitoring.Negative1Click(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  for i := 0 to IntdoorListView.Items.Count - 1 do
  begin
    if IntdoorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'NEGATIVE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','NEGATIVE모드')
    end;
  end;
end;

procedure TfmKTTypeMonitoring.mn_BuildingArmClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  BuildingAlarmControl(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),'ALARMSETTING');
end;

procedure TfmKTTypeMonitoring.mn_BuildingDisArmClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  BuildingAlarmControl(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),'ALARMDISABLE');
end;

procedure TfmKTTypeMonitoring.BuildingAlarmControl(aBuildingCode,
  aFloorCode, aAreaCode, aCmd: string);
var
  stSql : string;
  stAlarmID : string;
  TempAdoQuery :TADOQuery;
begin
  if L_bClose then Exit;
  Try
    //Alarm정보 로딩
    stSql := ' Select a.AR_VIEWSEQ,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO,a.AR_NAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
    stSql := stSql + ' From TB_ARMAREA a ';
    if Not IsMaster then
    begin
      if BuildingGrade = 4 then
      begin
        stSql := stSql + ' Inner Join TB_ADMINALARMAREA b ';
        stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
        stSql := stSql + ' AND a.AR_AREANO = b.AR_AREANO ) ';
      end;
    end;
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.AR_USE = ''Y'' ';
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
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
    stSql := stSql + ' Order by a.AR_VIEWSEQ ,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO';

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

        if RecordCount < 1 then
        begin
          Exit;
        end;

        First;
        While Not Eof do
        begin
          if L_bClose then Exit;
          stAlarmID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                     + FindField('AC_ECUID').AsString + inttostr(FindField('AR_AREANO').AsInteger);// + FillZeroNumber(FindField('AL_DEVICENO').AsInteger,3);

          self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := aCmd+ DATADELIMITER + stAlarmID + DATADELIMITER;
          self.FindSubForm('Main').FindCommand('SendData').Execute;
          DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,copy(stAlarmID,6,1),'0000000000',aCmd);
          Application.ProcessMessages;
          Next;
        end;
      end;
      
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    Exit;
  End;
end;

procedure TfmKTTypeMonitoring.BuildingDoorControl(aBuildingCode,
  aFloorCode, aAreaCode, aCmd: string);
var
  stSql : string;
  stDoorID : string;
begin
  if L_bClose then Exit;
  //Door정보 로딩
  stSql := ' Select a.DO_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,c.AC_JAVARATYPE ';
  stSql := stSql + ' From TB_DOOR a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  end;
  
  stSql := stSql + ' Group by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,c.AC_JAVARATYPE ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ ';

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

    if RecordCount < 1 then
    begin
      Exit;
    end;
    
    First;

    While Not Eof do
    begin
      if L_bClose then Exit;
      stDoorID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString ;
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := aCmd+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000',aCmd);

      Application.ProcessMessages;
      Next;
    end;
  end;

end;

procedure TfmKTTypeMonitoring.mn_BuildingOpenClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  BuildingDoorControl(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),'OPENMODE');

end;

procedure TfmKTTypeMonitoring.mn_BuildingManageClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  BuildingDoorControl(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),'OPERATEMODE');

end;

procedure TfmKTTypeMonitoring.mn_BuildingCloseClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  BuildingDoorControl(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),'CLOSEMODE');

end;

procedure TfmKTTypeMonitoring.mn_BuildingMasterClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  BuildingDoorControl(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),'MASTERMODE');

end;

procedure TfmKTTypeMonitoring.EST1Click(Sender: TObject);
var
  nIndex : integer;
  oDisplayForm : TfmAlarmMap;
  aBuildingCode : string;
begin
  aBuildingCode := '001001000';
  nIndex := AlarmFormDisplayList.IndexOf(aBuildingCode);
  if nIndex < 0 then
  begin
    oDisplayForm := TfmAlarmMap.Create(Self);
    oDisplayForm.BuildingCode := aBuildingCode;
    oDisplayForm.Add_AlarmArea('1','00','0');
    oDisplayForm.Show;
    AlarmFormDisplayList.AddObject(aBuildingCode,oDisplayForm);
  end else
  begin
    TfmAlarmMap(AlarmFormDisplayList.Objects[nIndex]).Add_AlarmArea('1','00','0');
    TfmAlarmMap(AlarmFormDisplayList.Objects[nIndex]).Show;
  end;
end;

procedure TfmKTTypeMonitoring.DisplayArmAreaMapShow(aBuildingCode,aNodeNo, aECUID,
  aArmArea: string);
var
  nIndex : integer;
  oDisplayForm : TfmAlarmMap;
begin
  nIndex := AlarmFormDisplayList.IndexOf(aBuildingCode);
  if nIndex < 0 then
  begin
    oDisplayForm := TfmAlarmMap.Create(Self);
    oDisplayForm.BuildingCode := aBuildingCode;
    oDisplayForm.Add_AlarmArea(aNodeNo,aEcuID,aArmArea);
    oDisplayForm.Show;
    AlarmFormDisplayList.AddObject(aBuildingCode,oDisplayForm);
  end else
  begin
    TfmAlarmMap(AlarmFormDisplayList.Objects[nIndex]).Add_AlarmArea(aNodeNo,aEcuID,aArmArea);
    TfmAlarmMap(AlarmFormDisplayList.Objects[nIndex]).Show;
  end;
end;

procedure TfmKTTypeMonitoring.CommandArrayCommandsTMAPCloseExecute(
  Command: TCommand; Params: TStringList);
var
  stBuildingCode : string;
  nIndex : integer;
begin
  inherited;
  stBuildingCode := Params.Values['Data'];
  nIndex := AlarmFormDisplayList.IndexOf(stBuildingCode);
  if nIndex > -1 then
  begin
    TfmAlarmMap(AlarmFormDisplayList.Objects[nIndex]).Free;
    AlarmFormDisplayList.Delete(nIndex);
  end;

end;

procedure TfmKTTypeMonitoring.DisplayArmAreaMapModeChange(aBuildingCode,
  aNodeNo, aECUID, aArmArea: string);
var
  nIndex : integer;
begin
  nIndex := AlarmFormDisplayList.IndexOf(aBuildingCode);
  if nIndex > -1 then
  begin
    TfmAlarmMap(AlarmFormDisplayList.Objects[nIndex]).Add_AlarmArea(aNodeNo,aEcuID,aArmArea);
    //TfmAlarmMap(AlarmFormDisplayList.Objects[nIndex]).Show;
  end;
end;

initialization
  RegisterClass(TfmKTTypeMonitoring);
Finalization
  UnRegisterClass(TfmKTTypeMonitoring);

end.
