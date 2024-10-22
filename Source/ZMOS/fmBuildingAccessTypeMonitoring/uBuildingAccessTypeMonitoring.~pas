unit uBuildingAccessTypeMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, uSubForm, CommandArray, StdCtrls, ImgList,
  ToolPanels, Shader, ActnList, Menus, Grids, BaseGrid, AdvGrid,Clipbrd,
  Buttons,ADODB,ActiveX, DB,iniFiles, MPlayer,
  uDataModule1, AdvObj;

const
  LeftSpace = '__';

type
  TfmBuildingAccessTypeMonitoring = class(TfmASubForm)
    pan_device: TPanel;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    tbLOCATE: TTabSheet;
    tbDEVICE: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Shader2: TShader;
    Shader3: TShader;
    ActionList1: TActionList;
    Action_LoctionLoad: TAction;
    Action_DeviceLoad: TAction;
    Action_DoorLoad: TAction;
    Action_AlarmLoad: TAction;
    Action_FoodLoad: TAction;
    devicelist: TImageList;
    Action_RecvData: TAction;
    Action_Reload: TAction;
    Action_SensorLoad: TAction;
    ADOAlarmQuery: TADOQuery;
    Action_intAlarmHistory: TAction;
    Action_AlarmHistory: TAction;
    MediaPlayer1: TMediaPlayer;
    MessageTimer: TTimer;
    ImageList48: TImageList;
    sg_Main: TAdvStringGrid;
    sg_ECU: TAdvStringGrid;
    Panel5: TPanel;
    Panel15: TPanel;
    Splitter7: TSplitter;
    pan_monitor: TPanel;
    PageControl2: TPageControl;
    BuildingTab: TTabSheet;
    Panel12: TPanel;
    Panel14: TPanel;
    GroupBox6: TGroupBox;
    Shader6: TShader;
    BuildingListView: TListView;
    tabArea: TTabSheet;
    Panel3: TPanel;
    Panel9: TPanel;
    GroupBox4: TGroupBox;
    Shader4: TShader;
    DoorListView: TListView;
    Panel10: TPanel;
    pan_message: TPanel;
    SpeedButton1: TSpeedButton;
    st_message: TStaticText;
    PopupMenu_Node: TPopupMenu;
    mn_pingTest: TMenuItem;
    N11: TMenuItem;
    mn_TimeSync: TMenuItem;
    PopupMenu_Device: TPopupMenu;
    mn_AllCardDownload: TMenuItem;
    MenuItem11: TMenuItem;
    mn_DeviceReset: TMenuItem;
    stateList: TImageList;
    smallDoorImageList1: TImageList;
    LargeDoorImageList: TImageList;
    Pan_Remark1: TPanel;
    sg_Access: TAdvStringGrid;
    PopupMenu_Door: TPopupMenu;
    pm_modechange: TMenuItem;
    pm_OpenMode: TMenuItem;
    pm_OperateMode: TMenuItem;
    pm_CloseMode: TMenuItem;
    pm_StateCheck: TMenuItem;
    pm_DoorOpen: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N8: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pm_JavarOpen: TMenuItem;
    pm_JavaraClose: TMenuItem;
    pm_MasterMode: TMenuItem;
    pm_posiNega: TMenuItem;
    Positive1: TMenuItem;
    Negative1: TMenuItem;
    PopupMenu_IntAccess: TPopupMenu;
    MenuItem10: TMenuItem;
    MenuItem14: TMenuItem;
    N24: TMenuItem;
    pm_Building: TPopupMenu;
    mn_BuildingOpen: TMenuItem;
    mn_BuildingManager: TMenuItem;
    mn_BuildingClose: TMenuItem;
    mn_BuildingMaster: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    Panel1: TPanel;
    pan_LargeIntro: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image12: TImage;
    Image13: TImage;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    pan_SmallIntro: TPanel;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SocketWatchTimerTimer(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand2Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand3Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand4Execute(Command: TCommand;
      Params: TStringList);
    procedure Action_ReloadExecute(Sender: TObject);
    procedure sg_AccessKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CommandArrayCommandsTCommand5Execute(Command: TCommand;
      Params: TStringList);
    procedure FormShow(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure pan_deviceResize(Sender: TObject);
    procedure Panel12Resize(Sender: TObject);
    procedure Panel15Resize(Sender: TObject);
    procedure Panel14Resize(Sender: TObject);
    procedure BuildingListViewDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_AlarmDblClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure sg_AccessColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_AlarmColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure CommandArrayCommandsTFIRERECOVERExecute(Command: TCommand;
      Params: TStringList);
    procedure FormResize(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure btn_AlarmConfirmClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure sg_MainDblClick(Sender: TObject);
    procedure mi_AlarmSearchClick(Sender: TObject);
    procedure BuildingListViewMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mi_BuildingBigIconClick(Sender: TObject);
    procedure mi_BuildingSmallIconClick(Sender: TObject);
    procedure sg_MainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg_ECUMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mn_pingTestClick(Sender: TObject);
    procedure mn_TimeSyncClick(Sender: TObject);
    procedure mn_AllCardDownloadClick(Sender: TObject);
    procedure mn_DeviceResetClick(Sender: TObject);
    procedure sg_MainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DoorListViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N6Click(Sender: TObject);
    procedure pm_OpenModeClick(Sender: TObject);
    procedure pm_OperateModeClick(Sender: TObject);
    procedure pm_CloseModeClick(Sender: TObject);
    procedure pm_StateCheckClick(Sender: TObject);
    procedure pm_DoorOpenClick(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DoorListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure pm_JavarOpenClick(Sender: TObject);
    procedure pm_JavaraCloseClick(Sender: TObject);
    procedure pm_MasterModeClick(Sender: TObject);
    procedure Positive1Click(Sender: TObject);
    procedure Negative1Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure mn_BuildingManagerClick(Sender: TObject);
    procedure mn_BuildingOpenClick(Sender: TObject);
    procedure mn_BuildingCloseClick(Sender: TObject);
    procedure mn_BuildingMasterClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure PageControl1DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure PageControl2DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
  private
    L_bFirst : Boolean;
    L_bClose : Boolean;

    BuildingAlarmList : TStringList;     //빌딩코드 별 알람기기 목록
    AlarmBuildingcodeList : TStringList; //해당 알람기기가 어느 빌딩코드에 속하는지


    procedure CenterPanel;
  private
    procedure MemoryCreate;
    procedure MemoryDestory;
    procedure ListHeaderNameSet;
    procedure CellHide;
    procedure iniConfigWrite;
    procedure iniConfigRead;

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
    LocationMapList : TStringList; //LocationMap을 가지고 있다.

    DoorIndexArray: Array of integer; //출입문 리스트 순서 배열
    relDoorIndexArray:Array of integer; //실제 위치
    IntDoorIndexArray:Array of integer; //통합 출입문 리스트 순서 배열
    relIntDoorIndexArray:Array of integer; //통합 출입문 실제 위치

    AlarmIndexArray: Array of integer; //알람 리스트 순서 배열
    relAlarmIndexArray:Array of integer; //실제 위치
    IntAlarmIndexArray:Array of integer; //통합 알람 리스트 순서 배열
    relIntAlarmIndexArray:Array of integer; //통합 알람 실제 위치
    
  private
    { Private declarations }

    procedure BuildingDoorControl(aBuildingCode,aCmd:string);
    procedure BuildingDoorScheduleApply(aBuildingCode,aFloorCode,aAreaCode:string);
    procedure DisConnectAlarm(aAlarmID:string);
    procedure RcvCardReadData(aNodeNo,aReceiveData:string); //카드리딩 데이터 처리
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
                  aLocateName, //위치정보
                  aAlarmName, //경계구역명칭
                  aDeviceID,  //주장치번호[메시지번호]
                  aDeviceType,         //발생기기[번호]
                  aStatusCode,  //이벤트코드
                  aStatusName,
                  aAlaramCode:string;
                  aAlarmSound:Boolean;
                  List:TAdvStringGrid);  //이벤트 내용
    procedure Insertsg_SensorList(aTime,aNodeNo,aECUID,aPortNo,aDeviceType,aStatusCode,aStatusName,aPortName:string;List:TAdvStringGrid);

    Function GetStatusCode(aStatusCode:string;var aStatusName :string;aAlarmSound:integer) : integer;
    Function GetDoorBuildingName(NodeNo:integer;aEcuID, aDoorNo:string):string;
    procedure ClearEmpInfo;
    Function UPDATETB_USERCONFIG(aConfigGroup,aConfigID,aValue : string):Boolean;
    Function InsertTB_USERCONFIG(aConfigGroup,aConfigID,aValue : string):Boolean;
    procedure Form_Initialize;

    Function updateTB_ZONEDEVICEState(aAlarmNo,aZoneNum,aState:string):Boolean;
    procedure DisplaySensorState(aNodeNo,aECUID,aPortNo,aMode,aSubCLass,aStatusCode:string;bZoneSensor:Boolean);
    function CheckSchedule(aNodeNo, aECUID,aPortNo:string):Boolean;
    function GetPortName(aNodeNo,aECUID,aPortNo:string):String;

    procedure ACDataProcess(aNodeNo,aECUID,aData:string); //출입데이터
    procedure AlarmDataProcess(aNodeNo,aEcuID,aType,aACTION,aData:string);
    procedure SearchAlarmList;
    
  private
    procedure GridSetting;
    procedure ChangeDoorIndex(FromIndex,ToIndex:integer);
    procedure ChangeAlarmIndex(FromIndex,ToIndex:integer);

    procedure sg_AccessHeaderNameSet;
  private
    L_stSelectNodeNo : string;
    L_stSelectBuildingCode : string;
    procedure LoadingNode;
    procedure LoadingEcu(aNodeNo,aNodeName:string);
    procedure LoadingBuilding;
    procedure LoadingDoorArea(aBuildingCode,aBuildingName:string);
    procedure AlaramConfirm(aNodeNo,aEcuID,aArmAreaNo:string);
  public
    { Public declarations }
    bLocationMapShow : Boolean;
    bDeviceMapShow : Boolean;
    procedure ShowMessage(aMessage:string);
    procedure NodeConnectState(NodeNo:integer;aConnectState:TNodeCurrentState);
    procedure DeviceConnected(NodeNo:integer;aEcuID:string;aConnected:Boolean);
    procedure AlarmModeChanged(NodeNo:integer;aEcuID:string;aWachMode:TWatchMode);
    procedure AccessEventProcess(NodeNo:integer;
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo :string);
    procedure BuildingAlarmModeProcess(aBuildingCode:string;aAlramMode:TWatchMode);
    procedure ExitButtonPress(NodeNo : integer;aEcuID,aDoorNo,aTime,aInputType,aUserName,aPermitCode,aPermit:string);
  public
    procedure DoorFireStateChange(NodeNo:integer;
          aEcuID, aDoorNo:string; aFireState:Boolean);
    procedure DoorStateChange(NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorDSState;
                                  aDoorLockType:TDoorLockState;
                                  aDoorFire:Boolean);

  end;

var
  fmBuildingAccessTypeMonitoring: TfmBuildingAccessTypeMonitoring;


implementation

uses
  uLomosUtil,
  uLocationMap,
  uDeviceMap,
  uDeviceInfo,
  uZonePosition, uMDBSql, uPostGreSql, uMssql, uAlarmSet, uAlarmHistory,
  uFireBird,
  UCommonModule,
  uMonitoringCommonVariable,
  uDeviceState,
  uAlarmConfirm, uJavara, uDBFunction;
{$R *.dfm}




procedure TfmBuildingAccessTypeMonitoring.FormCreate(Sender: TObject);
begin
  MemoryCreate;

  iniConfigRead;

  ListHeaderNameSet;

  CellHide;




  L_bFirst := True;
  L_bClose := False;

  LoadingNode;
  LoadingEcu('000','전체');
  LoadingBuilding;
  LoadingDoorArea('000000000','전체');

  LoadCompanyCode;
  LoadJijumCode;
  LoadDepartCode;

  {
  sg_Main.AddImageIdx(0,1,1,haLeft,vaCenter);
  sg_Main.Cells[0,1] := LeftSpace + 'TEST';
  }
end;

procedure TfmBuildingAccessTypeMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin
  L_bClose := True;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'BuildingAccessTypeMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  iniConfigWrite;
  MemoryDestory;



  Action := caFree;

end;


procedure TfmBuildingAccessTypeMonitoring.SocketWatchTimerTimer(Sender: TObject);
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
//      else if stNodeNo[1] = 'E' then
//        DisConnectECU(stNodeNo);
    end;
  end;

end;




procedure TfmBuildingAccessTypeMonitoring.CommandArrayCommandsTCommand0Execute(
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
  ShowMessage(stReceiveData);
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



procedure TfmBuildingAccessTypeMonitoring.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd: string;
  i : integer;
begin
  stCmd := Params.Values['Data'];

  //여기서는 출입모드 사용안함

end;


procedure TfmBuildingAccessTypeMonitoring.CommandArrayCommandsTCommand2Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmBuildingAccessTypeMonitoring.CommandArrayCommandsTCommand3Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd: string;
  i : integer;
begin
  stCmd := Params.Values['Data'];

  for i:=0 to DeviceStateList.Count - 1 do
  begin
    if stCmd = 'ALARMSETTING' then  //전체경계
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + DeviceStateList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end else if stCmd = 'ALARMDISABLE' then  //전체해제
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + DeviceStateList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.RcvCardReadData(aNodeNo, aReceiveData: string);
begin

end;


function TfmBuildingAccessTypeMonitoring.GetAreaName(aBuildingCode, aFloorCode,
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

function TfmBuildingAccessTypeMonitoring.GetBuildingName(aBuildingCode: string): string;
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

function TfmBuildingAccessTypeMonitoring.GetFloorName(aBuildingCode,
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

function TfmBuildingAccessTypeMonitoring.GetPermitState(aPermit: string): string;
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

function TfmBuildingAccessTypeMonitoring.GetUserInfo(aCardNo: string; var stUserName,
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

procedure TfmBuildingAccessTypeMonitoring.LoadCompanyCode;
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

procedure TfmBuildingAccessTypeMonitoring.LoadDepartCode;
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

procedure TfmBuildingAccessTypeMonitoring.CommandArrayCommandsTCommand4Execute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
end;

procedure TfmBuildingAccessTypeMonitoring.InsertDOORList(aPermitCode,aPermit, aTime, aLocationName,
  aDoorName, aCardNo, aUserName, aCompanyName, aJijumName,aDepartName, aEmID,aDoorID,aHandPhone,aCompanyPhone,aAddr1,aAddr2: string;List:TAdvStringGrid);
var
  nCol: integer;
begin

  with List do
  begin
    //ColWidths[10] := 0;  //상태코드
    if List.Name = 'sg_Access' then
      if Cells[DoorIndexArray[5],1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    List.SelectedCells[1,1];
    if Not Isdigit(aPermitCode) then
    begin
      RowColor[1] := clFuchsia;
    end;
    Cells[DoorIndexArray[0],1] := MakeDatetimeStr(aTime);   //발생시간
    Cells[DoorIndexArray[1],1] := aLocationName ; //copy(aLocationName,10,length(aLocationName)-9); //위치
    Cells[DoorIndexArray[2],1] := aDoorName; //출입문
    Cells[DoorIndexArray[3],1] := aPermitCode; //승인상태 코드
    Cells[DoorIndexArray[4],1] := aPermit; //승인상태
    Cells[DoorIndexArray[5],1] := aCardNo; //카드번호
    Cells[DoorIndexArray[6],1] := aUserName; //이름
    Cells[DoorIndexArray[7],1] := aCompanyName ; //회사명
    Cells[DoorIndexArray[8],1] := aJijumName ; //부서명
    Cells[DoorIndexArray[9],1] := aDepartName ; //부서명
    Cells[DoorIndexArray[10],1] := aEmID; //사번
    Cells[DoorIndexArray[11],1] := aDoorID; //출입문아이디
    Cells[DoorIndexArray[12],1] := aHandPhone; //핸드폰
    Cells[DoorIndexArray[13],1] := aCompanyPhone; //사내전화번호
    Cells[DoorIndexArray[14],1] := aAddr1; //주소1
    Cells[DoorIndexArray[15],1] := aAddr2; //주소2
  end;

end;

function TfmBuildingAccessTypeMonitoring.GetStatusCode(aStatusCode: string;
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

procedure TfmBuildingAccessTypeMonitoring.InsertAlarmList(aTime, aLocateName, aAlarmName,
  aDeviceID, aDeviceType, aStatusCode, aStatusName,aAlaramCode: string;aAlarmSound:Boolean;
  List: TAdvStringGrid);
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
      RowColor[1] := clRed;
    end;
    Cells[AlarmIndexArray[0],1] := MakeDatetimeStr(aTime);       //발생시간
    Cells[AlarmIndexArray[1],1] := aLocateName; // copy(aLocateName,10,length(aLocateName)-9); //위치
    Cells[AlarmIndexArray[2],1] := aAlarmName;  //경계구역
    Cells[AlarmIndexArray[3],1] := aDeviceID;   //주장치번호
    Cells[AlarmIndexArray[4],1] := aDeviceType; //기기번호
    Cells[AlarmIndexArray[5],1] := aStatusCode; //발생코드
    Cells[AlarmIndexArray[6],1] := aStatusName; //이벤트내용
    Cells[AlarmIndexArray[7],1] := aAlaramCode; //AlarmCode
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.Action_ReloadExecute(Sender: TObject);
begin
{  Action_LoctionLoadExecute(Self);
  Action_DeviceLoadExecute(Self);
  Action_DoorLoadExecute(Self);
  Action_AlarmLoadExecute(Self);
  Action_SensorLoadExecute(Self);
  LoadCompanyCode;
  LoadDepartCode;}

//  Action_AlarmLoadExecute(Self);
  

  if L_bClose then Exit;
//  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DEVICEALLSTATE_II'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
//  self.FindSubForm('Main').FindCommand('SendData').Execute;
{  if PatrolUse then
  begin
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
  end; }

//  SocketWatchTimer.Enabled := True;
end;


procedure TfmBuildingAccessTypeMonitoring.ClearEmpInfo;
begin
end;


procedure TfmBuildingAccessTypeMonitoring.sg_AccessKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  st: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      if Name = 'sg_Access' then st:= Cells[DoorIndexArray[5],Row];

//      st:= Cells[5,Row];
      if st <> '' then ClipBoard.SetTextBuf(PChar(st));
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.DisConnectAlarm(aAlarmID: string);
begin

end;


procedure TfmBuildingAccessTypeMonitoring.CommandArrayCommandsTCommand5Execute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
  stCmd : string;
  stID : string;
begin
  stCmd := Params.Values['COMMAND'];
  stValue := Params.Values['VALUE'];

  if stCmd = 'LocationMap' then
  begin
    if stValue = 'TRUE' Then
      bLocationMapShow := True
    else
    begin
      bLocationMapShow := False;
      stID := Params.Values['ID'];
      if LocationMapList.IndexOf(stID) > -1 then LocationMapList.Delete(LocationMapList.IndexOf(stID));
    end;
  end
  else if stCmd = 'DeviceMap' then
  begin
    if stValue = 'TRUE' Then
      bDeviceMapShow := True
    else bDeviceMapShow := False;
  end;

//
end;

procedure TfmBuildingAccessTypeMonitoring.FormShow(Sender: TObject);
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
//  sg_Access.ColWidths[3] := 0;
//  sg_Access.ColWidths[11] := 0;
  sg_Main.ColWidths[2] := 0;


//  Form_Initialize;
//  GridSetting; //그리드를 사용자 환경에 맞게 셋팅함

  pm_CloseMode.Visible := G_bColseModeView;
  pm_MasterMode.Visible := G_bColseModeView;
  pm_PosiNega.Visible := G_bPosiNega;

  PageControl1.ActivePageIndex := 0;
  PageControl2.ActivePageIndex := 0;


  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'BuildingAccessTypeMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
  Application.ProcessMessages;

end;

procedure TfmBuildingAccessTypeMonitoring.N12Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
  stLocateName : string;
begin
{  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID := AlarmCodeList[IntAlarmListView.ItemIndex];
  stAlarmName := IntAlarmListView.Items[IntAlarmListView.ItemIndex].Caption;
  stLocateName := AlarmLocateList.Strings[IntAlarmListView.ItemIndex];

  fmDeviceInfo:= TfmDeviceInfo.Create(Self);
  fmDeviceInfo.DeviceID := stAlarmID;
  fmDeviceInfo.DeviceName := stAlarmName;
  fmDeviceInfo.DeviceType := '4';
  fmDeviceInfo.LocateName := copy(stLocateName,10,length(stLocateName) - 9);
  fmDeviceInfo.SHowmodal;
  fmDeviceInfo.Free;
 }
end;

procedure TfmBuildingAccessTypeMonitoring.PageControl1Change(Sender: TObject);
begin
  //showmessage(PageControl1.ActivePage.Name);
  UPDATETB_USERCONFIG('KTMONITOR','DEVICETAB',PageControl1.ActivePage.Name)
end;

function TfmBuildingAccessTypeMonitoring.UPDATETB_USERCONFIG(aConfigGroup,aConfigID,
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

function TfmBuildingAccessTypeMonitoring.InsertTB_USERCONFIG(aConfigGroup,aConfigID,
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

procedure TfmBuildingAccessTypeMonitoring.PageControl2Change(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','WATCHTAB',PageControl2.ActivePage.Name)
end;

procedure TfmBuildingAccessTypeMonitoring.pan_deviceResize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','DEVICEW',inttostr(pan_device.Width))
end;

procedure TfmBuildingAccessTypeMonitoring.Panel12Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','INTEGH',inttostr(Panel12.Height))
end;

procedure TfmBuildingAccessTypeMonitoring.Panel15Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','INTATH',inttostr(Panel15.Height))
end;

procedure TfmBuildingAccessTypeMonitoring.Panel14Resize(Sender: TObject);
begin
  if BuildingListView.ViewStyle = vsIcon then
  begin
    BuildingListView.ViewStyle := vsList;
    BuildingListView.Refresh;
    BuildingListView.ViewStyle := vsIcon;
  end else if BuildingListView.ViewStyle = vsList then
  begin
    BuildingListView.ViewStyle := vsIcon;
    BuildingListView.Refresh;
    BuildingListView.ViewStyle := vsList;
  end;
end;

procedure TfmBuildingAccessTypeMonitoring.Form_Initialize;
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
        pan_device.Width := FindField('US_VALUE').AsInteger;
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

procedure TfmBuildingAccessTypeMonitoring.BuildingListViewDblClick(Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];
  LoadingDoorArea(stBuildingID,stBuildingName);
  PageControl2.ActivePageIndex := 1;
end;

function TfmBuildingAccessTypeMonitoring.updateTB_ZONEDEVICEState(aAlarmNo, aZoneNum,
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

procedure TfmBuildingAccessTypeMonitoring.DisplaySensorState(aNodeNo, aECUID,aPortNo, aMode,aSubCLass,
  aStatusCode: string;bZoneSensor:Boolean);
begin


end;

function TfmBuildingAccessTypeMonitoring.CheckSchedule(aNodeNo, aECUID,
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

function TfmBuildingAccessTypeMonitoring.GetPortName(aNodeNo, aECUID,
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

procedure TfmBuildingAccessTypeMonitoring.Insertsg_SensorList(aTime,aNodeNo, aECUID, aPortNo,
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




procedure TfmBuildingAccessTypeMonitoring.AlarmDataProcess(aNodeNo, aEcuID, aType, aACTION,
  aData: string);
begin

end;

procedure TfmBuildingAccessTypeMonitoring.ACDataProcess(aNodeNo, aECUID, aData: string);
begin
  RcvCardReadData(aNodeNo,aData);
end;

procedure TfmBuildingAccessTypeMonitoring.FormActivate(Sender: TObject);
begin
  if L_bFirst then
  begin
    L_bFirst := False;
  end;

  Pan_Remark1.Visible := G_bACIntroView;

end;

procedure TfmBuildingAccessTypeMonitoring.SearchAlarmList;

begin

end;

procedure TfmBuildingAccessTypeMonitoring.sg_AlarmDblClickCell(Sender: TObject; ARow,
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
    if cells[0,Row] = '' then Exit;
    stAlarmID:= cells[7,Row];
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

procedure TfmBuildingAccessTypeMonitoring.sg_AccessColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeDoorIndex(FromIndex,ToIndex);
end;

procedure TfmBuildingAccessTypeMonitoring.GridSetting;
var
  i : integer;
begin
  for i:=0 to sg_Access.ColCount - 1 do
  begin
    DoorIndexArray[i] := i;
    relDoorIndexArray[i] := i;
  end;
end;

procedure TfmBuildingAccessTypeMonitoring.ChangeDoorIndex(FromIndex, ToIndex: integer);
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

procedure TfmBuildingAccessTypeMonitoring.ChangeAlarmIndex(FromIndex, ToIndex: integer);
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


procedure TfmBuildingAccessTypeMonitoring.sg_AlarmColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeAlarmIndex(FromIndex,ToIndex);

end;

procedure TfmBuildingAccessTypeMonitoring.sg_AccessHeaderNameSet;
begin
  with sg_Access do
  begin
    cells[0,0] := '발생일자';
    cells[1,0] := '위치';
    cells[2,0] := '출입문명';
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

procedure TfmBuildingAccessTypeMonitoring.ShowMessage(aMessage: string);
begin

end;

procedure TfmBuildingAccessTypeMonitoring.LoadJijumCode;
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


procedure TfmBuildingAccessTypeMonitoring.CommandArrayCommandsTFIRERECOVERExecute(
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

procedure TfmBuildingAccessTypeMonitoring.CenterPanel;
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

procedure TfmBuildingAccessTypeMonitoring.FormResize(Sender: TObject);
begin
  CenterPanel;

end;

procedure TfmBuildingAccessTypeMonitoring.MessageTimerTimer(Sender: TObject);
begin
  pan_Message.Visible := Not pan_Message.Visible;
end;

procedure TfmBuildingAccessTypeMonitoring.btn_AlarmConfirmClick(Sender: TObject);
begin
  MessageTimer.Enabled := False;
  pan_Message.visible := False;

end;

procedure TfmBuildingAccessTypeMonitoring.N8Click(Sender: TObject);
begin
  BuildingListView.ViewStyle := vsIcon;
  BuildingListView.Refresh;
end;

procedure TfmBuildingAccessTypeMonitoring.N17Click(Sender: TObject);
begin
  BuildingListView.ViewStyle := vsList;
  BuildingListView.Refresh;

end;

procedure TfmBuildingAccessTypeMonitoring.LoadingEcu(aNodeNo,aNodeName: string);
var
  stSql : string;
  i : integer;
  nIndex : integer;
  nNodeIndex : integer;
  stNodeIP : string;
begin
  L_stSelectNodeNo := FillZeroNumber(strtoint(aNodeNo),3);
  tbDEVICE.Caption := aNodeName;
  with sg_ECU do
  begin
    if aNodeNo = '000' then //전체
    begin
      rowCount := DeviceStateList.count + 1;
      for i := 0 to DeviceStateList.count - 1 do
      begin
        if TDeviceState(DeviceStateList.Objects[i]).Connected then
        begin
          AddImageIdx(0,i + 1,DeviceConnectImageIndex,haLeft,vaCenter);
        end else
        begin
          AddImageIdx(0,i + 1,DeviceDisConnectImageIndex,haLeft,vaCenter);
        end;
        nNodeIndex := NodeList.IndexOf(FillZeroNumber(TDeviceState(DeviceStateList.Objects[i]).NodeNo,3));
        if nNodeIndex > -1 then
        begin
          Cells[0,i + 1] := LeftSpace + TNodeState(NodeList.Objects[nNodeIndex]).NodeIP;
        end;
        Cells[1,i + 1] := TDeviceState(DeviceStateList.Objects[i]).ECUID;
        Cells[2,i + 1] := TDeviceState(DeviceStateList.Objects[i]).DeviceName;
        Cells[3,i + 1] := inttostr(TDeviceState(DeviceStateList.Objects[i]).NodeNo);
        Cells[4,i + 1] := DeviceStateList.Strings[i];
      end;
    end else
    begin
      nNodeIndex := NodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3));
      if nNodeIndex < 0 then Exit;
      rowCount := TNodeState(NodeList.Objects[nNodeIndex]).NodeDeviceList.Count + 1;
      stNodeIP := TNodeState(NodeList.Objects[nNodeIndex]).NodeIP;
      for i := 0 to TNodeState(NodeList.Objects[nNodeIndex]).NodeDeviceList.Count - 1 do
      begin
        nIndex := DeviceStateList.IndexOf(TNodeState(NodeList.Objects[nNodeIndex]).NodeDeviceList.Strings[i]);
        if nIndex < 0 then continue;
        if TDeviceState(DeviceStateList.Objects[nIndex]).Connected then
        begin
          AddImageIdx(0,i + 1,DeviceConnectImageIndex,haLeft,vaCenter);
        end else
        begin
          AddImageIdx(0,i + 1,DeviceDisConnectImageIndex,haLeft,vaCenter);
        end;
        Cells[0,i + 1] := LeftSpace + stNodeIP;
        Cells[1,i + 1] := TDeviceState(DeviceStateList.Objects[nIndex]).ECUID;
        Cells[2,i + 1] := TDeviceState(DeviceStateList.Objects[nIndex]).DeviceName;
        Cells[3,i + 1] := inttostr(TDeviceState(DeviceStateList.Objects[nIndex]).NodeNo);

      end;
    end;
    refresh;
  end;
end;

procedure TfmBuildingAccessTypeMonitoring.LoadingNode;
var
  i : integer;
begin
  with sg_Main do
  begin
    RowCount := NodeList.Count + 1;
    for i := 0 to NodeList.Count - 1 do
    begin
      if TNodeState(NodeList.Objects[i]).NodeCurrentState = nsDisConnected then
      begin
        AddImageIdx(0,i + 1,NodeDisConnectImageIndex,haLeft,vaCenter);
      end else if TNodeState(NodeList.Objects[i]).NodeCurrentState = nsFault then
      begin
        AddImageIdx(0,i + 1,NodeFaultConnectImageIndex,haLeft,vaCenter);
      end else if TNodeState(NodeList.Objects[i]).NodeCurrentState = nsConnected then
      begin
        AddImageIdx(0,i + 1,NodeConnectImageIndex,haLeft,vaCenter);
      end;
      Cells[0,i + 1] := LeftSpace + TNodeState(NodeList.Objects[i]).NodeName;
      Cells[1,i + 1] := TNodeState(NodeList.Objects[i]).NodeIP;
      Cells[2,i + 1] := inttostr(TNodeState(NodeList.Objects[i]).NODENO);
    end;
    Refresh;
  end;
end;

procedure TfmBuildingAccessTypeMonitoring.sg_MainDblClick(Sender: TObject);
var
  stMainName : string;
begin
  PageControl1.ActivePageIndex := 1;
  with sg_Main do
  begin
    stMainName := Cells[0,Row];
    delete(stMainName,1,length(LeftSpace));
    LoadingEcu(cells[2,Row],stMainName);
  end;
end;

procedure TfmBuildingAccessTypeMonitoring.LoadingBuilding;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stBuildingID : string;
  stBuildingName : string;
begin
  BuildingListView.Clear;

  BuildingListView.Items.Add.Caption := '전체';
  BuildingListView.Items[BuildingListView.Items.Count - 1].SubItems.Add('000000000');     // 빌딩ID
  BuildingListView.Items[BuildingListView.Items.Count - 1].ImageIndex := 0;
  BuildingListView.Items[BuildingListView.Items.Count - 1].StateIndex := NothingStateIndex;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''' + BuildingStep + ''' ';
  //stSql := stSql + ' Order by LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ';
  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

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
      While Not Eof do
      begin
        stBuildingID := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString + FindField('LO_AREACODE').AsString;
        stBuildingName := FindField('LO_NAME').AsString;
        BuildingListView.Items.Add.Caption:= stBuildingName;
        BuildingListView.Items[BuildingListView.Items.Count - 1].SubItems.Add(stBuildingID);     // 빌딩ID
        BuildingListView.Items[BuildingListView.Items.Count - 1].ImageIndex := 0;
        BuildingListView.Items[BuildingListView.Items.Count - 1].StateIndex := NothingStateIndex;
        Next;
        Application.ProcessMessages;
      end;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmBuildingAccessTypeMonitoring.LoadingDoorArea(aBuildingCode,
  aBuildingName: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stDeviceID : string;
  nDoorIndex : integer;
  stDoorID : string;
  stDoorName : string;
  I : integer;
begin
  tabArea.Caption := aBuildingName;
  DoorListView.Clear;
  DoorCodeList.Clear;

  stSql := 'Select a.*,c.AC_JAVARATYPE from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if copy(aBuildingCode,1,3) <> '000' then
  begin
    if BuildingStep = '0' then
    begin
      L_stSelectBuildingCode := copy(aBuildingCode,1,3);
      stSql := stSql + 'AND a.LO_DONGCODE = ''' + copy(aBuildingCode,1,3) + ''' ';
    end else if BuildingStep = '1' then
    begin
      L_stSelectBuildingCode := copy(aBuildingCode,1,6);
      stSql := stSql + 'AND a.LO_DONGCODE = ''' + copy(aBuildingCode,1,3) + ''' ';
      stSql := stSql + 'AND a.LO_FLOORCODE = ''' + copy(aBuildingCode,4,3) + ''' ';
    end else if BuildingStep = '2' then
    begin
      L_stSelectBuildingCode := copy(aBuildingCode,1,9);
      stSql := stSql + 'AND a.LO_DONGCODE = ''' + copy(aBuildingCode,1,3) + ''' ';
      stSql := stSql + 'AND a.LO_FLOORCODE = ''' + copy(aBuildingCode,4,3) + ''' ';
      stSql := stSql + 'AND a.LO_AREACODE = ''' + copy(aBuildingCode,7,3) + ''' ';
    end;
  end;
  stSql := stSql + ' order by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_ECUID ';

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
      if recordCount < 1  then Exit;
      First;
      I := 0;
      While Not Eof do
      begin
        stDeviceID := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString;
        stDoorID := stDeviceID + FindField('DO_DOORNO').AsString;
        nDoorIndex := DoorStateList.IndexOf(stDoorID);
        DoorCodeList.Add(stDoorID);
        stDoorName := FindField('DO_DOORNONAME').AsString;
        DoorListView.Items.Add.Caption:= stDoorName;
        DoorListView.Items[I].SubItems.Add(stDoorID);     // 빌딩ID
        DoorListView.Items[I].SubItems.Add(FindField('AC_JAVARATYPE').AsString);     // 빌딩ID

        if nDoorIndex > -1 then
        begin
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsClose then
          begin
            DoorListView.Items[I].ImageIndex:= DoorCloseStateImageIndex;
          end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsOpen then
          begin
            DoorListView.Items[I].ImageIndex:= DoorOpenStateImageIndex;
          end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsLongTime then
          begin
            DoorListView.Items[I].ImageIndex:= DoorLongTimeStateImageIndex;
          end else
          begin
            DoorListView.Items[I].ImageIndex:= DoorNothingStateImageIndex;
          end;
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire then
          begin
            DoorListView.Items[I].ImageIndex:=DoorFireStateImageIndex;
          end;
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode = pnPositive then
          begin
            if  TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmManager then
            begin
              DoorListView.Items[I].StateIndex := DoorPosiManageStateIndex;
            end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmOpen then
            begin
              DoorListView.Items[I].StateIndex := DoorOpenModeStateIndex;
            end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmLock then
            begin
              DoorListView.Items[I].StateIndex := DoorCloseModeStateIndex;
            end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmMaster then
            begin
              DoorListView.Items[I].StateIndex := DoorMasterModeStateIndex;
            end else
            begin
              DoorListView.Items[I].StateIndex := DoorOpenModeStateIndex;
            end;
          end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode = pnNegative then
          begin
            if  TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmManager then
            begin
              DoorListView.Items[I].StateIndex := DoorNegaManageStateIndex;
            end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmOpen then
            begin
              DoorListView.Items[I].StateIndex := DoorOpenModeStateIndex;
            end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmLock then
            begin
              DoorListView.Items[I].StateIndex := DoorCloseModeStateIndex;
            end else if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmMaster then
            begin
              DoorListView.Items[I].StateIndex := DoorMasterModeStateIndex;
            end else
            begin
              DoorListView.Items[I].StateIndex := DoorOpenModeStateIndex;
            end;
          end else
          begin
            DoorListView.Items[I].StateIndex := DoorOpenModeStateIndex;
          end;

        end;
        inc(I);
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  if DoorListView.ViewStyle = vsList  then
  begin
    DoorListView.ViewStyle := vsIcon;
    DoorListView.Refresh;
    DoorListView.ViewStyle := vsList;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.mi_AlarmSearchClick(Sender: TObject);
begin
  BuildingListViewDblClick(self);
end;

procedure TfmBuildingAccessTypeMonitoring.BuildingListViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if BuildingListView.ItemIndex < 0 then Exit;
  BuildingListView.Items[BuildingListView.ItemIndex].Selected := True;

end;

procedure TfmBuildingAccessTypeMonitoring.mi_BuildingBigIconClick(Sender: TObject);
begin
  BuildingListView.ViewStyle := vsIcon;
end;

procedure TfmBuildingAccessTypeMonitoring.mi_BuildingSmallIconClick(
  Sender: TObject);
begin
  BuildingListView.ViewStyle := vsList;

end;

procedure TfmBuildingAccessTypeMonitoring.DeviceConnected(NodeNo: integer;
  aEcuID: string;aConnected:Boolean);
var
  nDeviceIndex : integer;
  nNodeIndex : integer;
  stDeviceID : string;
  i : integer;
begin
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  with sg_Ecu do
  begin
    if L_stSelectNodeNo = '000' then
    begin
      //nDeviceIndex :=DeviceStateList.IndexOf(stDeviceID);
      nDeviceIndex := -1;
      for i := 1 to RowCount do
      begin
        if cells[4,i] = stDeviceID then
        begin
          nDeviceIndex := i - 1;
          break;
        end;
      end;
      if nDeviceIndex > -1 then
      begin
        RemoveImageIdx(0,nDeviceIndex + 1);
        if aConnected then
          AddImageIdx(0,nDeviceIndex + 1,DeviceConnectImageIndex,haLeft,vaCenter)
        else AddImageIdx(0,nDeviceIndex + 1,DeviceDisConnectImageIndex,haLeft,vaCenter);
      end;
    end else
    begin
      if L_stSelectNodeNo <> FillZeroNumber(NodeNo,3) then Exit; //현재 선택된 노드가 아니면 필요 없음
      //nNodeIndex := NodeList.IndexOf(FillZeroNumber(NodeNo,3));
      //if nNodeIndex < 0 then Exit;
      //nDeviceIndex := TNodeState(NodeList.Objects[nNodeIndex]).NodeDeviceList.IndexOf(stDeviceID);
      nDeviceIndex := -1;
      for i := 1 to RowCount do
      begin
        if cells[4,i] = stDeviceID then
        begin
          nDeviceIndex := i - 1;
          break;
        end;
      end;
      if nDeviceIndex > -1 then
      begin
        RemoveImageIdx(0,nDeviceIndex + 1);
        if aConnected then
          AddImageIdx(0,nDeviceIndex + 1,DeviceConnectImageIndex,haLeft,vaCenter)
        else AddImageIdx(0,nDeviceIndex + 1,DeviceDisConnectImageIndex,haLeft,vaCenter);
      end;
    end;
    refresh;
  end;
end;

procedure TfmBuildingAccessTypeMonitoring.NodeConnectState(NodeNo: integer;
  aConnectState: TNodeCurrentState);
var
  nNodeIndex : integer;
  i : integer;
begin
  nNodeIndex := -1;
  for i := 1 to sg_Main.RowCount do
  begin
    if sg_Main.Cells[2,i] = inttostr(NodeNo) then
    begin
      nNodeIndex := i - 1;
      break;
    end;
  end;
//  nNodeIndex := NodeList.IndexOf(FillZeroNumber(NodeNo,3));
  if nNodeIndex < 0 then Exit;

  with sg_Main do
  begin
    RemoveImageIdx(0,nNodeIndex + 1);
    if aConnectState = nsDisConnected then
      AddImageIdx(0,nNodeIndex + 1,NodeDisConnectImageIndex,haLeft,vaCenter)
    else if aConnectState = nsConnected then
      AddImageIdx(0,nNodeIndex + 1,NodeConnectImageIndex,haLeft,vaCenter)
    else AddImageIdx(0,nNodeIndex + 1,NodeFaultConnectImageIndex,haLeft,vaCenter);
    refresh;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.AlarmModeChanged(NodeNo: integer;
  aEcuID: string; aWachMode: TWatchMode);
begin
end;

procedure TfmBuildingAccessTypeMonitoring.AccessEventProcess(NodeNo: integer;
  aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
  aButton,aArmAreaNo: string);
var
  stDeviceID : string;
  stDoorID : string;
  stDoorName : string;
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
  stHandPhone,stCompanyPhone,stAddr1,stAddr2 : string;
begin
  stPermitName := GetPermitState(aPermit);
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  stDoorID := stDeviceID + aDoorNo;
  nDoorIndex := DoorStateList.IndexOf(stDoorID);
  stBuildingName := GetDoorBuildingName(NodeNo,aEcuID, aDoorNo);
  if nDoorIndex > -1 then
  begin
    stDoorName := TDoorState(DoorStateList.Objects[nDoorIndex]).DoorName;
  end else
  begin
    if aDoorNo = '2' then
    begin
      if dmJavara.JavaraCheck(NodeNo,aEcuID) then
      begin
        nDoorIndex := DoorStateList.IndexOf(stDeviceID + '1');
        if nDoorIndex > -1 then
           stDoorName := TDoorState(DoorStateList.Objects[nDoorIndex]).DoorName + '_닫힘';
        stBuildingName := GetDoorBuildingName(NodeNo,aEcuID, '1');   
      end else
      begin
        stDoorName:= dmDBFunction.GetArmAreaName(inttostr(NodeNo),aEcuID,aArmAreaNo); //방범 구역 명
        if stDoorName = '' then stDoorName:= dmDBFunction.GetDeviceName(inttostr(NodeNo),aEcuID); // 컨트롤러명
      end;
    end else
    begin
      stDoorName:= dmDBFunction.GetArmAreaName(inttostr(NodeNo),aEcuID,aArmAreaNo); //방범 구역 명
      if stDoorName = '' then stDoorName:= dmDBFunction.GetDeviceName(inttostr(NodeNo),aEcuID); // 컨트롤러명
    end;
  end;



  if ACAlarmUse then
  begin
    if Not Isdigit(aPermit) then
    begin
      self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
      self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
    end;
  end;
  GetUserInfo(aCardNo,stEmName,stCompanyName,stJijumName,stDepartName,stEmCode,stHandPhone,stCompanyPhone,stAddr1,stAddr2);

  InsertDOORList(aPermit,stPermitName,aTime,stBuildingName,stDoorName,aCardNo,stEmName,
    stCompanyName,stJijumName,stDepartName,stEmCode,stDoorID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_Access);
end;



procedure TfmBuildingAccessTypeMonitoring.sg_MainMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  sg_Main.SelectRows(sg_Main.Row,1);

end;

procedure TfmBuildingAccessTypeMonitoring.sg_ECUMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  sg_ECU.SelectRows(sg_ECU.Row,1);

end;

procedure TfmBuildingAccessTypeMonitoring.mn_pingTestClick(Sender: TObject);
var
  stIp: String;
begin

  stIp := sg_Main.Cells[1,sg_Main.row];
  stIp := StringReplace(stIP,'__','',[rfReplaceAll]);
  if stIp = '' then Exit;

  if HiWord(GetKeyState(VK_CONTROL)) <> 0 then
    ShellExecute_AndWait('ping',stIp + ' -t')
  else
    ShellExecute_AndWait('ping',stIp);

end;

procedure TfmBuildingAccessTypeMonitoring.mn_TimeSyncClick(Sender: TObject);
var
  stNodeNo: string;
  stDeviceID : string;
begin
  stNodeNo := sg_Main.Cells[2,sg_Main.row];
  if Not isDigit(stNodeNo) then Exit;
  stDeviceID := FillZeroNumber(strtoint(stNodeNo),3) + '00';

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'TIMESYNC'+ DATADELIMITER + stDeviceID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmBuildingAccessTypeMonitoring.mn_AllCardDownloadClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stDeviceID: string;
begin
  stNodeNo := sg_Ecu.Cells[3,sg_Ecu.Row];
  if Not isDigit(stNodeNo) then Exit;
  stEcuID := sg_Ecu.Cells[1,sg_Ecu.Row];
  stDeviceID := FillZeroNumber(strtoint(stNodeNo),3) + stEcuID;

  if (Application.MessageBox(PChar('전체권한 전송시 현재 기기의 권한이 모두 삭제 됩니다. 전체권한 전송하시겠습니까?'),'전송',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + stDeviceID + DATADELIMITER + 'Y' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert('0','00','0','0',stDeviceID , '권한재전송');

end;

procedure TfmBuildingAccessTypeMonitoring.mn_DeviceResetClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stDeviceID: string;
begin
  stNodeNo := sg_Ecu.Cells[3,sg_Ecu.Row];
  if Not isDigit(stNodeNo) then Exit;
  stEcuID := sg_Ecu.Cells[1,sg_Ecu.Row];
  stDeviceID := FillZeroNumber(strtoint(stNodeNo),3) + stEcuID;

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'REBOOT'+ DATADELIMITER + stDeviceID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmBuildingAccessTypeMonitoring.ExitButtonPress(NodeNo: integer; aEcuID,
  aDoorNo, aTime, aInputType,aUserName,aPermitCode,aPermit: string);
var
  stDeviceID : string;
  stDoorID : string;
  stDoorName : string;
  nDoorIndex : integer;
  nDoorStateIndex : integer;
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
  stDoorID := stDeviceID + aDoorNo;
  nDoorIndex := DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then
  begin
    //자바라인지 확인 하자
    if aDoorNo = '2' then
    begin
      if dmJavara.JavaraCheck(NodeNo,aEcuID) then
      begin
        nDoorStateIndex := DoorStateList.IndexOf(stDeviceID + '1');
        if nDoorStateIndex > -1 then
        begin
          stBuildingCode := TDoorState(DoorStateList.Objects[nDoorStateIndex]).BuildingCode;
          stFloorCode := TDoorState(DoorStateList.Objects[nDoorStateIndex]).FloorCode;
          stAreaCode := TDoorState(DoorStateList.Objects[nDoorStateIndex]).AreaCode;
          if BuildingStep = '0' then stBuildingID := stBuildingCode
          else if BuildingStep = '1' then stBuildingID := stBuildingCode + stFloorCode
          else if BuildingStep = '2' then stBuildingID := stBuildingCode + stFloorCode + stAreaCode;
          nBuildingIndex := BuildingList.IndexOf(stBuildingID);
          if nBuildingIndex > -1 then
            stBuildingName := BuildingNameList.Strings[nBuildingIndex];
          stDoorName := TDoorState(DoorStateList.Objects[nDoorStateIndex]).DoorName + '_닫힘'; // 자바라닫힘
          InsertDOORList(aPermitCode,aPermit,aTime,stBuildingName,stDoorName,aInputType,aUserName,
            '','','','',stDoorID,'','','','',sg_Access);
        end;
      end;
    end;
    Exit;
  end;
  nDoorStateIndex := DoorStateList.IndexOf(stDoorID);
  if nDoorStateIndex > -1 then
  begin
    stDoorName := TDoorState(DoorStateList.Objects[nDoorStateIndex]).DoorName;
    stBuildingCode := TDoorState(DoorStateList.Objects[nDoorStateIndex]).BuildingCode;
    stFloorCode := TDoorState(DoorStateList.Objects[nDoorStateIndex]).FloorCode;
    stAreaCode := TDoorState(DoorStateList.Objects[nDoorStateIndex]).AreaCode;
    if BuildingStep = '0' then stBuildingID := stBuildingCode
    else if BuildingStep = '1' then stBuildingID := stBuildingCode + stFloorCode
    else if BuildingStep = '2' then stBuildingID := stBuildingCode + stFloorCode + stAreaCode;
    nBuildingIndex := BuildingList.IndexOf(stBuildingID);
    if nBuildingIndex > -1 then
      stBuildingName := BuildingNameList.Strings[nBuildingIndex];
  end;

  InsertDOORList(aPermitCode,aPermit,aTime,stBuildingName,stDoorName,aInputType,aUserName,
    '','','','',stDoorID,'','','','',sg_Access);

end;

procedure TfmBuildingAccessTypeMonitoring.sg_MainKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  st: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      st:= Cells[1,Row];

      if st <> '' then ClipBoard.SetTextBuf(PChar(st));
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.DoorListViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if DoorListView.ItemIndex < 0 then Exit;
  DoorListView.Items[DoorListView.ItemIndex].Selected := True;

end;

procedure TfmBuildingAccessTypeMonitoring.AlaramConfirm(aNodeNo, aEcuID,aArmAreaNo: string);
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

procedure TfmBuildingAccessTypeMonitoring.N6Click(Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];

  BuildingDoorControl(stBuildingID,'NSOPERATEMODE');
end;

procedure TfmBuildingAccessTypeMonitoring.BuildingAlarmModeProcess(
  aBuildingCode: string; aAlramMode: TWatchMode);
var
  stBuildingID : string;
  nBuildingIndex : integer;
begin
  if BuildingStep = '0' then stBuildingID := copy(aBuildingCode,1,3)
  else if BuildingStep = '1' then stBuildingID := copy(aBuildingCode,1,6)
  else if BuildingStep = '2' then stBuildingID := copy(aBuildingCode,1,9);

  nBuildingIndex := BuildingList.IndexOf(stBuildingID);
  if nBuildingIndex < 0 then Exit;
  
  if aAlramMode = cmArm then
  begin
    BuildingListView.Items[nBuildingIndex].ImageIndex := AlarmModeStateImageIndex;
  end else
  begin
    BuildingListView.Items[nBuildingIndex].ImageIndex := DisAlarmModeStateImageIndex;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.DoorFireStateChange(
  NodeNo: integer; aEcuID, aDoorNo: string; aFireState: Boolean);
var
  stDoorID : string;
  nDoorIndex : integer;
begin
  if Not aFireState then Exit;
  stDoorID := FillZeroNumber(NodeNo,3) + aEcuID + aDoorNo;
  nDoorIndex := DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then Exit;
  if DoorListView.Items[nDoorIndex].ImageIndex <> DoorFireStateImageIndex then
  begin
    DoorListView.Items[nDoorIndex].ImageIndex := DoorFireStateImageIndex;
    DoorListView.Refresh;
  end;
end;

procedure TfmBuildingAccessTypeMonitoring.DoorStateChange(NodeNo: integer;
  aEcuID, aDoorNo: string; aDoorManageType: TDoorManageMode;
  aDoorPNType: TDoorPNMode; aDoorStateType: TDoorDSState;
  aDoorLockType: TDoorLockState;aDoorFire:Boolean);
var
  stDoorID : string;
  nDoorIndex : integer;
begin
  stDoorID := FillZeroNumber(NodeNo,3) + aEcuID + aDoorNo;
  nDoorIndex := DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then Exit;

  if aDoorFire then
  begin
    DoorListView.Items[nDoorIndex].ImageIndex:= DoorFireStateImageIndex;
  end else
  begin
    if aDoorStateType = dsClose then
    begin
      DoorListView.Items[nDoorIndex].ImageIndex:= DoorCloseStateImageIndex;
    end else if aDoorStateType = dsOpen then
    begin
      DoorListView.Items[nDoorIndex].ImageIndex:= DoorOpenStateImageIndex;
    end else if aDoorStateType = dsLongTime then
    begin
      DoorListView.Items[nDoorIndex].ImageIndex:= DoorLongTimeStateImageIndex;
      if LongDoorOpenAlarmUse then
      begin
        self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
        self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
      end;

    end else
    begin
      DoorListView.Items[nDoorIndex].ImageIndex:= DoorNothingStateImageIndex;
    end;
  end;

  if aDoorPNType = pnPositive then
  begin
    if  aDoorManageType = dmManager then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorPosiManageStateIndex;
    end else if aDoorManageType = dmOpen then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorOpenModeStateIndex;
    end else if aDoorManageType = dmLock then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorCloseModeStateIndex;
    end else if aDoorManageType = dmMaster then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorMasterModeStateIndex;
    end else
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorOpenModeStateIndex;
    end;
  end else if aDoorPNType = pnNegative then
  begin
    if  aDoorManageType = dmManager then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorNegaManageStateIndex;
    end else if aDoorManageType = dmOpen then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorOpenModeStateIndex;
    end else if aDoorManageType = dmLock then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorCloseModeStateIndex;
    end else if aDoorManageType = dmMaster then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorMasterModeStateIndex;
    end else
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorOpenModeStateIndex;
    end;
  end else
  begin
    DoorListView.Items[nDoorIndex].StateIndex := DoorOpenModeStateIndex;
  end;
end;

function TfmBuildingAccessTypeMonitoring.GetDoorBuildingName(
  NodeNo: integer; aEcuID, aDoorNo: string): string;
var
  stSql : string;
  stLocationName : string;
begin
  Result:= '';
  stLocationName := '';

  stSql := 'select b.LO_NAME as BuildingName,c.LO_NAME as FloorName,d.LO_NAME as AreaName from TB_DOOR a ';
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
  stSql := stSql + ' AND a.DO_DOORNO = ''' + aDoorNo + ''' ';

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

procedure TfmBuildingAccessTypeMonitoring.pm_OpenModeClick(
  Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= doorListView.Items[i].SubItems.Strings[0];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPENMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','개방모드')
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.pm_OperateModeClick(
  Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    Application.MessageBox(PChar('화재발생시에는 화재 복구 완료 후에 운영모드 가능합니다.'),'정보',MB_OK);
    Exit;
  end;

  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= doorListView.Items[i].SubItems.Strings[0];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','운영모드')
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.pm_CloseModeClick(
  Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    Application.MessageBox(PChar('화재발생시에는 화재 복구 완료 후에 폐쇄모드 가능합니다.'),'정보',MB_OK);
    Exit;
  end;
  
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= doorListView.Items[i].SubItems.Strings[0];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CLOSEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','폐쇄모드')
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.pm_StateCheckClick(
  Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;

  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= doorListView.Items[i].SubItems.Strings[0];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.pm_DoorOpenClick(
  Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= doorListView.Items[i].SubItems.Strings[0];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','출입승인')
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.N19Click(Sender: TObject);
begin
  doorListView.ViewStyle := vsIcon;
  pan_LargeIntro.Visible := True;
  pan_LargeIntro.Align := alClient;
  pan_SmallIntro.Visible := False;

end;

procedure TfmBuildingAccessTypeMonitoring.N20Click(Sender: TObject);
begin
  doorListView.ViewStyle := vsList;
  pan_LargeIntro.Visible := False;
  pan_SmallIntro.Visible := True;
  pan_SmallIntro.Align := alClient;

end;

procedure TfmBuildingAccessTypeMonitoring.N3Click(Sender: TObject);
var
  stDoorID : string;
  stDoorName : string;
begin
  if doorListView.SelCount < 1 then Exit;
  if doorListView.ItemIndex < -1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];
  stDoorName := doorListView.Items[doorListView.ItemIndex].Caption;
  
  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stDoorID;
    fmDeviceMap.DeviceName := stDoorName;
    fmDeviceMap.DeviceType := '3';
    fmDeviceMap.L_stCreateForm := 'TfmBuildingAccessTypeMonitoring';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.N4Click(Sender: TObject);
var
  stDoorID : string;
  stDoorName : string;
  stLocateName : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID := DoorCodeList[doorListView.ItemIndex];
  stDoorName := doorListView.Items[doorListView.ItemIndex].Caption;

  fmDeviceInfo:= TfmDeviceInfo.Create(Self);
  fmDeviceInfo.DeviceID := stDoorID;
  fmDeviceInfo.DeviceName := stDoorName;
  fmDeviceInfo.DeviceType := '3';
  fmDeviceInfo.LocateName := '';
  fmDeviceInfo.SHowmodal;
  fmDeviceInfo.Free;

end;

procedure TfmBuildingAccessTypeMonitoring.CellHide;
var
  i : integer;
begin
  for i := 0 to ACCESSEVENTMAXCELL do
  begin
    if AccessEventShowTable[i] = 0 then
    begin
      sg_Access.ColWidths[DoorIndexArray[i]] := 0;
    end else
    begin
      sg_Access.ColWidths[DoorIndexArray[i]] := Access1SizeTable[DoorIndexArray[i]];
      if sg_Access.ColWidths[DoorIndexArray[i]] = 0 then sg_Access.ColWidths[DoorIndexArray[i]] := 90;
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.iniConfigRead;
var
  ini_fun : TiniFile;
  i : integer;
  stValue : string;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');

  pan_device.Width := ini_fun.ReadInteger('BuildingAccessTypeMonitoring','DeviceWidth',217);
  if pan_device.Width < 5 then pan_device.Width := 5;
  PageControl2.ActivePage := BuildingTab;
  pan_monitor.Height := ini_fun.ReadInteger('BuildingAccessTypeMonitoring','monitorHeight',273);
  if pan_monitor.Height < 5 then pan_monitor.Height := 5;
  sg_Access.Height := ini_fun.ReadInteger('BuildingAccessTypeMonitoring','AccessHeight',144);
  if sg_Access.Height < 5 then sg_Access.Height := 5;

  stValue := ini_fun.ReadString('BuildingAccessTypeMonitoring','BuildingListView','vsIcon');
  if UpperCase(stValue) = 'VSICON' then
  begin
    BuildingListView.ViewStyle := vsList;
    BuildingListView.Refresh;
    BuildingListView.ViewStyle := vsIcon ;
  end else
  begin
    BuildingListView.ViewStyle := vsIcon;
    BuildingListView.Refresh;
    BuildingListView.ViewStyle := vsList;
  end;

  stValue := ini_fun.ReadString('BuildingAccessTypeMonitoring','DoorList','vsIcon');
  if UpperCase(stValue) = 'VSICON' then
  begin
    DoorListView.ViewStyle := vsList;
    DoorListView.Refresh;
    DoorListView.ViewStyle := vsIcon ;
    pan_LargeIntro.Visible := True;
    pan_LargeIntro.Align := alClient;
    pan_SmallIntro.Visible := False;
  end else
  begin
    DoorListView.ViewStyle := vsIcon;
    DoorListView.Refresh;
    DoorListView.ViewStyle := vsList;
    pan_LargeIntro.Visible := False;
    pan_SmallIntro.Visible := True;
    pan_SmallIntro.Align := alClient;
  end;


  for i := LOW(DoorIndexArray) to HIGH(DoorIndexArray) do
  begin
    DoorIndexArray[i] := ini_fun.ReadInteger('BuildingAccessTypeMonitoring','DoorIndexArray'+inttostr(i),i);
  end;
  for i := LOW(relDoorIndexArray) to HIGH(relDoorIndexArray) do
  begin
    relDoorIndexArray[i] := ini_fun.ReadInteger('BuildingAccessTypeMonitoring','relDoorIndexArray'+inttostr(i),i);
  end;

  ini_fun.Free;
end;

procedure TfmBuildingAccessTypeMonitoring.iniConfigWrite;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  ini_fun.WriteInteger('BuildingAccessTypeMonitoring','DeviceWidth',pan_device.Width);
  ini_fun.WriteInteger('BuildingAccessTypeMonitoring','monitorHeight',pan_monitor.Height);
  ini_fun.WriteInteger('BuildingAccessTypeMonitoring','AccessHeight',sg_Access.Height);
  if BuildingListView.ViewStyle = vsIcon then ini_fun.WriteString('BuildingAccessTypeMonitoring','BuildingListView','vsIcon')
  else ini_fun.WriteString('BuildingAccessTypeMonitoring','BuildingListView','vsList');
  if DoorListView.ViewStyle = vsIcon then ini_fun.WriteString('BuildingAccessTypeMonitoring','DoorList','vsIcon')
  else ini_fun.WriteString('BuildingAccessTypeMonitoring','DoorList','vsList');


  for i := LOW(DoorIndexArray) to HIGH(DoorIndexArray) do
  begin
    ini_fun.WriteInteger('BuildingAccessTypeMonitoring','DoorIndexArray'+inttostr(i),DoorIndexArray[i]);
  end;
  for i := LOW(relDoorIndexArray) to HIGH(relDoorIndexArray) do
  begin
    ini_fun.WriteInteger('BuildingAccessTypeMonitoring','relDoorIndexArray'+inttostr(i),relDoorIndexArray[i]);
  end;

  for i := 0 to ACCESSEVENTMAXCELL do
  begin
    Access1SizeTable[i] := sg_Access.ColWidths[i];
    ini_fun.WriteInteger('출입이벤트1사이즈',inttostr(i),sg_Access.ColWidths[i]);
  end;

  ini_fun.Free;
end;

procedure TfmBuildingAccessTypeMonitoring.ListHeaderNameSet;
var
  i : integer;
begin
  for i := LOW(DoorIndexArray) to HIGH(DoorIndexArray) do
  begin
    sg_Access.cells[DoorIndexArray[i],0] := AccessHeaderNameList[i];
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.MemoryCreate;
begin
  BuildingAlarmList := TStringList.Create;     //빌딩코드 별 알람기기 목록
  AlarmBuildingcodeList := TStringList.Create; //해당 알람기기가 어느 빌딩코드에 속하는지
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
  LocationMapList := TStringList.Create;
  LocationMapList.Clear;

  SetLength(DoorIndexArray,sg_Access.ColCount);
  SetLength(relDoorIndexArray,sg_Access.ColCount);

end;

procedure TfmBuildingAccessTypeMonitoring.MemoryDestory;
begin
  BuildingAlarmList.Free;     //빌딩코드 별 알람기기 목록
  AlarmBuildingcodeList.Free; //해당 알람기기가 어느 빌딩코드에 속하는지
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
  LocationMapList.Free;

end;

procedure TfmBuildingAccessTypeMonitoring.DoorListViewSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  inherited;
  if Selected then
    begin
    if TListView(Sender).Items[TListView(Sender).ItemIndex].SubItems.Strings[1] = '1' then
    begin
      pm_modechange.Visible := False;
      pm_DoorOpen.Visible := False;
      pm_JavarOpen.Visible := True;
      pm_JavaraClose.Visible := True;
    end else
    begin
      pm_modechange.Visible := True;
      pm_DoorOpen.Visible := True;
      pm_JavarOpen.Visible := False;
      pm_JavaraClose.Visible := False;
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.pm_JavarOpenClick(
  Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= DoorCodeList[i];
        stDoorID[Length(stDoorID)] := '1'; //자바라 열기 일때는 자바라 문번호를 1번으로 바꿈

        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
        DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','자바라 열기');
      end;
    end;
  Except
    showmessage('전송실패');
    Exit;
  End;
end;

procedure TfmBuildingAccessTypeMonitoring.pm_JavaraCloseClick(
  Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  Try
    if doorListView.SelCount < 1 then Exit;
    for i := 0 to doorListView.Items.Count - 1 do
    begin
      if doorListView.Items[i].Selected then
      begin
        stDoorID:= DoorCodeList[i];
        stDoorID[Length(stDoorID)] := '2'; //자바라 닫기 일때는 자바라 문번호를 2번으로 바꿈

        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
        DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','자바라 닫기')
      end;
    end;
  Except
    showmessage('전송실패');
    Exit;
  End;
end;

procedure TfmBuildingAccessTypeMonitoring.pm_MasterModeClick(
  Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    Application.MessageBox(PChar('화재발생시에는 화재 복구 완료 후에 마스터모드 가능합니다.'),'정보',MB_OK);
    Exit;
  end;
  
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= doorListView.Items[i].SubItems.Strings[0];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'MASTERMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','마스터모드')
    end;
  end;

end;


procedure TfmBuildingAccessTypeMonitoring.Positive1Click(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= doorListView.Items[i].SubItems.Strings[0];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'POSITIVE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','POSITIVE모드')
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.Negative1Click(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= doorListView.Items[i].SubItems.Strings[0];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'NEGATIVE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','NEGATIVE모드')
    end;
  end;

end;

procedure TfmBuildingAccessTypeMonitoring.MenuItem10Click(Sender: TObject);
var
  stCardNo : string;
begin
  stCardNo := sg_Access.Cells[DoorIndexArray[5],sg_Access.Row];
  if stCardNo = '' then Exit;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['VALUE'] := 'EMPLOYEE';
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['CARDNO'] := stCardNo;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Execute;

end;

procedure TfmBuildingAccessTypeMonitoring.MenuItem14Click(Sender: TObject);
var
  stCardNo : string;
begin
  stCardNo := sg_Access.Cells[DoorIndexArray[5],sg_Access.Row];
  if stCardNo = '' then Exit;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['VALUE'] := 'CARDADMIN';
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['CARDNO'] := stCardNo;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Execute;

end;

procedure TfmBuildingAccessTypeMonitoring.N24Click(Sender: TObject);
var
  st : string;
begin
  inherited;
  st := sg_Access.Cells[DoorIndexArray[5],sg_Access.Row];

  if st <> '' then ClipBoard.SetTextBuf(PChar(st));

end;

procedure TfmBuildingAccessTypeMonitoring.mn_BuildingManagerClick(
  Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];

  BuildingDoorControl(stBuildingID,'OPERATEMODE');

end;

procedure TfmBuildingAccessTypeMonitoring.BuildingDoorControl(aBuildingCode,
  aCmd: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stDeviceID : string;
  nDoorIndex : integer;
  stDoorID : string;
  stDoorName : string;
  I : integer;
begin

  stSql := 'Select a.*,c.AC_JAVARATYPE from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if copy(aBuildingCode,1,3) <> '000' then
  begin
    if BuildingStep = '0' then
    begin
      L_stSelectBuildingCode := copy(aBuildingCode,1,3);
      stSql := stSql + 'AND a.LO_DONGCODE = ''' + copy(aBuildingCode,1,3) + ''' ';
    end else if BuildingStep = '1' then
    begin
      L_stSelectBuildingCode := copy(aBuildingCode,1,6);
      stSql := stSql + 'AND a.LO_DONGCODE = ''' + copy(aBuildingCode,1,3) + ''' ';
      stSql := stSql + 'AND a.LO_FLOORCODE = ''' + copy(aBuildingCode,4,3) + ''' ';
    end else if BuildingStep = '2' then
    begin
      L_stSelectBuildingCode := copy(aBuildingCode,1,9);
      stSql := stSql + 'AND a.LO_DONGCODE = ''' + copy(aBuildingCode,1,3) + ''' ';
      stSql := stSql + 'AND a.LO_FLOORCODE = ''' + copy(aBuildingCode,4,3) + ''' ';
      stSql := stSql + 'AND a.LO_AREACODE = ''' + copy(aBuildingCode,7,3) + ''' ';
    end;
  end;
  stSql := stSql + ' order by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_ECUID ';

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
      if recordCount < 1  then Exit;
      First;
      I := 0;
      While Not Eof do
      begin
        stDeviceID := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString;
        stDoorID := stDeviceID + FindField('DO_DOORNO').AsString;
        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := aCmd+ DATADELIMITER + stDoorID + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;

        if copy(aCmd,1,2) = 'NS' then dmDBFunction.UpdateTB_DOOR_Field_StringValue(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,FindField('DO_DOORNO').AsString,'DO_SchIgnore','N');
        DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000',aCmd) ;

        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmBuildingAccessTypeMonitoring.mn_BuildingOpenClick(
  Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];

  BuildingDoorControl(stBuildingID,'OPENMODE');

end;

procedure TfmBuildingAccessTypeMonitoring.mn_BuildingCloseClick(
  Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];

  BuildingDoorControl(stBuildingID,'CLOSEMODE');

end;

procedure TfmBuildingAccessTypeMonitoring.mn_BuildingMasterClick(
  Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];

  BuildingDoorControl(stBuildingID,'MASTERMODE');

end;

procedure TfmBuildingAccessTypeMonitoring.N5Click(Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];

  BuildingDoorControl(stBuildingID,'NSOPENMODE');
end;

procedure TfmBuildingAccessTypeMonitoring.N7Click(Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];

  BuildingDoorControl(stBuildingID,'NSCLOSEMODE');
end;

procedure TfmBuildingAccessTypeMonitoring.N9Click(Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];

  BuildingDoorControl(stBuildingID,'NSMASTERMODE');
end;

procedure TfmBuildingAccessTypeMonitoring.N10Click(Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];
  if (copy(stBuildingID,1,3) <> '000') and (stBuildingID <> '') then
  begin
    if Length(stBuildingID) >= 3 then stBuildingCode := copy(stBuildingID,1,3) ;
    if Length(stBuildingID) >= 6 then stFloorCode := copy(stBuildingID,4,3);
    if Length(stBuildingID) >= 9 then stAreaCode := copy(stBuildingID,7,3) ;
  end;

  BuildingDoorScheduleApply(stBuildingCode,stFloorCode,stAreaCode);
end;

procedure TfmBuildingAccessTypeMonitoring.BuildingDoorScheduleApply(
  aBuildingCode, aFloorCode, aAreaCode: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stDeviceID : string;
  nDoorIndex : integer;
  stDoorID : string;
  stDoorName : string;
  I : integer;
begin

  stSql := 'Select a.*,c.AC_JAVARATYPE from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID) ';
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
  stSql := stSql + ' order by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_ECUID ';

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
      if recordCount < 1  then Exit;
      First;
      I := 0;
      While Not Eof do
      begin
        dmDBFunction.UpdateTB_DOOR_Field_StringValue(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,FindField('DO_DOORNO').AsString,'DO_SchIgnore','N');
        dmDBFunction.UpdateTB_DOOR_Field_StringValue(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,FindField('DO_DOORNO').AsString,'SEND_ACK','N');
        DataModule1.TB_SYSTEMLOGInsert(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,DOORTYPE,FindField('DO_DOORNO').AsString,'0000000000','스케줄무시해제') ;
        //self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'SCHEDULESETTING'+ DATADELIMITER + FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString + DATADELIMITER;
        //self.FindSubForm('Main').FindCommand('SendData').Execute;
        Next;
      end;
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'SCHEDULETIMER'+ DATADELIMITER + '0000000' + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmBuildingAccessTypeMonitoring.PageControl1DrawTab(
  Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect;
  Active: Boolean);
begin
  inherited;
  with Control.Canvas do
  begin
    if Active then
    begin
      Brush.Color := $0099C1FD; // 선택된 탭의 배경색
      Font.Color := clWhite; // 선택된 탭의 글자색
    end
    else
    begin
      Brush.Color := clWhite; // 선택되지 않은 탭의 배경색
      Font.Color := clBlack; // 선택되지 않은 탭의 글자색
    end;
    FillRect(Rect); // Canvas.FillRect 메서드 사용
    TextOut(Rect.Left + 8, Rect.Top + 3, TPageControl(Control).Pages[TabIndex].Caption);
  end;
end;

procedure TfmBuildingAccessTypeMonitoring.PageControl2DrawTab(
  Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect;
  Active: Boolean);
begin
  inherited;
  with Control.Canvas do
  begin
    if Active then
    begin
      Brush.Color := $0099C1FD; // 선택된 탭의 배경색
      Font.Color := clWhite; // 선택된 탭의 글자색
    end
    else
    begin
      Brush.Color := clWhite; // 선택되지 않은 탭의 배경색
      Font.Color := clBlack; // 선택되지 않은 탭의 글자색
    end;
    FillRect(Rect); // Canvas.FillRect 메서드 사용
    TextOut(Rect.Left + 8, Rect.Top + 3, TPageControl(Control).Pages[TabIndex].Caption);
  end;
end;

initialization
  RegisterClass(TfmBuildingAccessTypeMonitoring);
Finalization
  UnRegisterClass(TfmBuildingAccessTypeMonitoring);

end.
