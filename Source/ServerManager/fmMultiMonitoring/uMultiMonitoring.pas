unit uMultiMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, uSubForm, CommandArray, StdCtrls, ImgList,
  ToolPanels, Shader, ActnList, Menus, Grids, BaseGrid, AdvGrid,Clipbrd,
  Buttons,ADODB,ActiveX, DB,iniFiles, MPlayer,uDataModule1, AdvObj;

type
  TfmMultiMonitoring = class(TfmASubForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    PageControl1: TPageControl;
    tbLOCATE: TTabSheet;
    tbDEVICE: TTabSheet;
    PageControl2: TPageControl;
    AccessTab: TTabSheet;
    AlarmTab: TTabSheet;
    FoodTab: TTabSheet;
    IntegrationTab: TTabSheet;
    Panel3: TPanel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Splitter3: TSplitter;
    Panel7: TPanel;
    Image1: TImage;
    Label1: TLabel;
    ed_Emname: TEdit;
    Label2: TLabel;
    ed_Companyname: TEdit;
    Label3: TLabel;
    ed_DepartName: TEdit;
    Label4: TLabel;
    ed_Emid: TEdit;
    StaticText1: TStaticText;
    GroupBox1: TGroupBox;
    doorListView: TListView;
    SmallDoorList: TImageList;
    stateList: TImageList;
    LageDoorList: TImageList;
    GroupBox2: TGroupBox;
    TreeView_Location: TTreeView;
    GroupBox3: TGroupBox;
    TreeView_Device: TTreeView;
    Shader1: TShader;
    Shader2: TShader;
    Shader3: TShader;
    ActionList1: TActionList;
    Action_LoctionLoad: TAction;
    Action_DeviceLoad: TAction;
    Action_DoorLoad: TAction;
    Action_AlarmLoad: TAction;
    Action_FoodLoad: TAction;
    toolslist: TImageList;
    TreeView_LocationCode: TTreeView;
    Splitter4: TSplitter;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    GroupBox4: TGroupBox;
    AlarmListView: TListView;
    Shader4: TShader;
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
    PopupMenu_Door: TPopupMenu;
    pm_modechange: TMenuItem;
    pm_OpenMode: TMenuItem;
    pm_OperateMode: TMenuItem;
    pm_StateCheck: TMenuItem;
    pm_DoorOpen: TMenuItem;
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
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    GroupBox7: TGroupBox;
    Shader7: TShader;
    sg_Access: TAdvStringGrid;
    sg_Food: TAdvStringGrid;
    sg_IntAccess: TAdvStringGrid;
    sg_Alarm: TAdvStringGrid;
    sg_IntAlarm: TAdvStringGrid;
    Action_Reload: TAction;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    mn_LocationMap: TMenuItem;
    PopupMenu_Alarm: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    PopupMenu_Zone: TPopupMenu;
    MenuItem11: TMenuItem;
    PopupMenu_intZone: TPopupMenu;
    MenuItem6: TMenuItem;
    SensorTab: TTabSheet;
    Panel17: TPanel;
    Splitter8: TSplitter;
    Panel18: TPanel;
    GroupBox8: TGroupBox;
    SensorListView: TListView;
    Shader8: TShader;
    sg_Sensor: TAdvStringGrid;
    Action_SensorLoad: TAction;
    PopupMenu_Sensor: TPopupMenu;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    ADOAlarmQuery: TADOQuery;
    MediaPlayer1: TMediaPlayer;
    Label5: TLabel;
    ed_JijumName: TEdit;
    IntAlarmListView: TListView;
    N21: TMenuItem;
    N22: TMenuItem;
    Action_intAlarmHistory: TAction;
    Action_AlarmHistory: TAction;
    Label6: TLabel;
    ed_HPone: TEdit;
    pan_ACIntro: TPanel;
    pan_LargeIntro: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    pan_SmallIntro: TPanel;
    StaticText6: TStaticText;
    Image6: TImage;
    StaticText7: TStaticText;
    Image7: TImage;
    StaticText8: TStaticText;
    Image8: TImage;
    StaticText9: TStaticText;
    Image9: TImage;
    Memo1: TMemo;
    pm_CloseMode: TMenuItem;
    pm_IntiCloseMode: TMenuItem;
    pan_Message: TPanel;
    btn_AlarmConfirm: TSpeedButton;
    st_Message: TStaticText;
    MessageTimer: TTimer;
    mn_FireRecovery: TMenuItem;
    mn_IntFireRecovery: TMenuItem;
    pm_JavarOpen: TMenuItem;
    pm_JavaraClose: TMenuItem;
    pm_intiJavaraClose: TMenuItem;
    pm_intiJavarOpen: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action_LoctionLoadExecute(Sender: TObject);
    procedure Action_DeviceLoadExecute(Sender: TObject);
    procedure SocketWatchTimerTimer(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure Action_DoorLoadExecute(Sender: TObject);
    procedure Action_AlarmLoadExecute(Sender: TObject);
    procedure Action_FoodLoadExecute(Sender: TObject);
    procedure pm_StateCheckClick(Sender: TObject);
    procedure pm_intiStateCheckClick(Sender: TObject);
    procedure pm_DoorOpenClick(Sender: TObject);
    procedure pm_intiDoorOpenClick(Sender: TObject);
    procedure pm_OperateModeClick(Sender: TObject);
    procedure pm_OpenModeClick(Sender: TObject);
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
    procedure menu_AlarmClick(Sender: TObject);
    procedure menu_AlarmDisableClick(Sender: TObject);
    procedure Menu_IntAlarmSettingClick(Sender: TObject);
    procedure Menu_IntAlarmDisableClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand3Execute(Command: TCommand;
      Params: TStringList);
    procedure Menu_DeviceAllCardDownClick(Sender: TObject);
    procedure Menu_DeviceCardDownClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand4Execute(Command: TCommand;
      Params: TStringList);
    procedure Button1Click(Sender: TObject);
    procedure Action_ReloadExecute(Sender: TObject);
    procedure sg_AccessClick(Sender: TObject);
    procedure sg_IntAccessKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure mn_LocationMapClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand5Execute(Command: TCommand;
      Params: TStringList);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure Panel6Resize(Sender: TObject);
    procedure Panel9Resize(Sender: TObject);
    procedure Panel12Resize(Sender: TObject);
    procedure Panel15Resize(Sender: TObject);
    procedure Panel14Resize(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure AlarmListViewDblClick(Sender: TObject);
    procedure IntAlarmListViewDblClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand6Execute(Command: TCommand;
      Params: TStringList);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure Action_SensorLoadExecute(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure SensorListViewDblClick(Sender: TObject);
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
    procedure doorListViewDblClick(Sender: TObject);
    procedure IntDoorListViewDblClick(Sender: TObject);
    procedure Action_intAlarmHistoryExecute(Sender: TObject);
    procedure Action_AlarmHistoryExecute(Sender: TObject);
    procedure sg_AccessDblClick(Sender: TObject);
    procedure sg_IntAccessDblClick(Sender: TObject);
    procedure CommandArrayCommandsTFIRERECOVERExecute(Command: TCommand;
      Params: TStringList);
    procedure pm_CloseModeClick(Sender: TObject);
    procedure pm_IntiCloseModeClick(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure btn_AlarmConfirmClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mn_FireRecoveryClick(Sender: TObject);
    procedure mn_IntFireRecoveryClick(Sender: TObject);
    procedure doorListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure pm_JavarOpenClick(Sender: TObject);
    procedure pm_JavaraCloseClick(Sender: TObject);
    procedure pm_intiJavarOpenClick(Sender: TObject);
    procedure pm_intiJavaraCloseClick(Sender: TObject);
  private
    L_bFirst : Boolean;
    L_bClose : Boolean;

  public
    DeviceCodeList : TStringList; // ����ڵ带 ������ �ִ�. (N:���(3�ڸ�),E:ECU(9�ڸ�))
    DeviceCaptionList : TStringList; //������ ������ �ִ�.
    DeviceLastTimeList : TStringList; //������ ���ӽð��� ������ �ִ�.
    DoorCodeList : TStringList;   // Door�ڵ带 ������ �ִ�
    intDoorCodeList : TStringList;   // Door�ڵ带 ������ �ִ�
    DoorLocateList : TStringList; // Door�� ��ġ������ ������ �ִ�. (000000000��ġ����)
    AlarmCodeList : TStringList;  //��� �ڵ带 ������ �ִ�.
    intAlarmCodeList : TStringList;  //��� �ڵ带 ������ �ִ�.
    AlarmNoList : TStringList;
    SensorCodeList : TStringList;  //���� �ڵ带 ������ �ִ�.
    AlarmLocateList : TStringList; //�������� ��ġ������ ������ �ִ�. (000000000��ġ����)
    FoodCodeList : TStringList;   //�ļ� �ڵ带 ������ �ִ�.
    FoodCodeNameList : TStringList; //�ļ����� ������ �ִ�.
    FoodLocateList : TStringList;  //�ļ������ ��ġ������ ������ �ִ�.(000000000��ġ����)
    CompanyCodeList : TStringList; //ȸ���ڵ带 ������ �ִ�.
    CompanyNameList : TStringList; //ȸ���Ī�� ������ �ִ�.
    JijumCodeList : TStringList; //�����ڵ带 ������ �ִ�.
    JijumNameList : TStringList; //������Ī�� ������ �ִ�.
    DepartCodeList : TStringList; //�μ��ڵ带 ������ �ִ�.
    DepartNameList : TStringList; //�μ���Ī�� ������ �ִ�.

    DoorIndexArray: Array of integer; //���Թ� ����Ʈ ���� �迭
    relDoorIndexArray:Array of integer; //���� ��ġ
    IntDoorIndexArray:Array of integer; //���� ���Թ� ����Ʈ ���� �迭
    relIntDoorIndexArray:Array of integer; //���� ���Թ� ���� ��ġ

    AlarmIndexArray: Array of integer; //�˶� ����Ʈ ���� �迭
    relAlarmIndexArray:Array of integer; //���� ��ġ
    IntAlarmIndexArray:Array of integer; //���� �˶� ����Ʈ ���� �迭
    relIntAlarmIndexArray:Array of integer; //���� �˶� ���� ��ġ
    
  private
    { Private declarations }

    procedure DisConnectServer(aServerID:string);
    procedure ConnectServer(aServerID:string);
    procedure DisConnectNode(aNodeNo:string);
    procedure ConnectNode(aNodeNo:string);
    procedure DisConnectECU(aECUID:string);
    procedure ConnectECU(aECUID:string);
    procedure DisConnectDoor(aDoorID:string);
    procedure DisConnectAlarm(aAlarmID:string);
    procedure DoorLoad(aBuildingCode,aFloorCode,aAreaCode :string; DoorList:TListView);
    procedure AlarmLoad(aBuildingCode,aFloorCode,aAreaCode :string; AlarmList:TListView);
    procedure FoodLoad(aBuildingCode,aFloorCode,aAreaCode :string);
    procedure SensorLoad(aBuildingCode,aFloorCode,aAreaCode :string;SensorList:TListView);
    procedure RcvCardReadData(aNodeNo,aReceiveData:string); //ī�帮�� ������ ó��
    procedure DeviceRcvAlarmData(aNodeNo,aReceiveData: string); //�˶� ������ ó��
    procedure RcvChangeDoorData(aNodeNo,aReceiveData:string); //���º��� ������ ó��
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
    aCompanyName,aJijumName,aDepertName,aEmID,aDoorID,aHandPhone,aCompanyPhone,aAddr1,aAddr2:string;List:TAdvStringGrid);
    procedure   InsertAlarmList(aTime, //�ð�
                  aLocateName, //��ġ����
                  aAlarmName, //��豸����Ī
                  aDeviceID,  //����ġ��ȣ[�޽�����ȣ]
                  aDeviceType,         //�߻����[��ȣ]
                  aStatusCode,  //�̺�Ʈ�ڵ�
                  aStatusName,
                  aAlaramCode:string;
                  aAlarmSound:integer;
                  aColor:string;
                  List:TAdvStringGrid);  //�̺�Ʈ ����
    procedure Insertsg_SensorList(aTime,aNodeNo,aECUID,aPortNo,aDeviceType,aStatusCode,aStatusName,aPortName:string;List:TAdvStringGrid);

    Function GetStatusCode(aStatusCode:string;var aStatusName :string;aAlarmSound:integer) : integer;
    procedure ClearEmpInfo;
    Function UPDATETB_USERCONFIG(aConfigGroup,aConfigID,aValue : string):Boolean;
    Function InsertTB_USERCONFIG(aConfigGroup,aConfigID,aValue : string):Boolean;
    procedure Form_Initialize;
    procedure DeviceConnectStatus(aReceiveData:string);
    procedure NodeConnectStatus(aReceiveData:string);

    function GetAlarmNO(aNodeNo,aEcuID:string):integer;
    Function updateTB_ZONEDEVICEState(aAlarmNo,aZoneNum,aState:string):Boolean;
    procedure DisplaySensorState(aNodeNo,aECUID,aPortNo,aMode,aSubCLass,aStatusCode:string;bZoneSensor:Boolean);
    function CheckSchedule(aNodeNo, aECUID,aPortNo:string):Boolean;
    function GetPortName(aNodeNo,aECUID,aPortNo:string):String;

    procedure NODEDataProcess(aNodeNo,aTYPE,aACTION,aData:string);
    procedure ECUDataProcess(aNodeNo,aECUID,aTYPE,aACTION,aData:string);
    procedure ACDataProcess(aNodeNo,aECUID,aData:string); //���Ե�����
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
    procedure AllStateCheck;
    procedure GetServerState;
    procedure CenterPanel;
    procedure AlarmListClear; //�˶� ����Ʈ Clear �� �� �ε�
  public
    { Public declarations }
    bLocationMapShow : Boolean;
    bDeviceMapShow : Boolean;
    procedure RcvMessage(aMessage:string;aDaemonNo:integer);
    procedure DoorFireStateChange(NodeNo:integer;aEcuID, aDoorNo:string; aFireState:Boolean);
    procedure DoorStateChange(NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorState;
                                  aDoorLockType:TDoorLockState);
    procedure DeviceConnected(NodeNo:integer;aEcuID:string;aConnected:Boolean);
    procedure AlarmModeChanged(NodeNo:integer;aEcuID:string;aWachMode:TWatchMode);
    procedure DeviceAlarmEventProcess(NodeNo:integer;ECUID:string;aAlaramState:TAlarmEventState);
    procedure AlarmEventProcess(NodeNo:integer;
        ECUID, aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode,
        aStatusCode, aPortNo, aState, aOperator, aNewStateCode:string;
        aAlarmView, aAlarmSound:Boolean;aColor:string);
    procedure ExitButtonPress(NodeNo : integer;aEcuID,aDoorNo,aTime,aInputType,aUserName,aPermitCode,aPermit:string);
    procedure AccessEventProcess(NodeNo:integer;
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton :string);
    procedure NodeConnectState(NodeNo:integer;aConnectState:TNodeCurrentState);
  end;

var
  fmMultiMonitoring: TfmMultiMonitoring;


implementation

uses
  uLomosUtil,
  uLocationMap,
  uDeviceMap,
  uDeviceInfo,
  uZonePosition, uMDBSql, uPostGreSql, uMssql, uAlarmSet, uAlarmHistory,
  uFireBird,
  UCommonModule,
  uMonitoringCommonVariable, uAlarmConfirm,
  uDeviceState, uJavara;
{$R *.dfm}




procedure TfmMultiMonitoring.FormCreate(Sender: TObject);
begin
  L_bFirst := True;
  L_bClose := False;
  
  mn_FireRecovery.Visible := G_bFireRelayUse;
  mn_IntFireRecovery.Visible := G_bFireRelayUse;

end;

procedure TfmMultiMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin
  L_bClose := True;

  self.FindSubForm('Main').FindCommand('MULTIMONITOR').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('MULTIMONITOR').Execute;
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

  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  ini_fun.WriteString('Monitoring','DeviceTab',PageControl1.ActivePage.Name);
  ini_fun.WriteInteger('Monitoring','DeviceWidth',Panel1.Width);
  ini_fun.WriteString('Monitoring','MonitorTab',PageControl2.ActivePage.Name);
  ini_fun.WriteInteger('Monitoring','Access1Height',Panel3.Height);
  ini_fun.WriteInteger('Monitoring','EmpWidth',Panel6.Width);
  ini_fun.WriteInteger('Monitoring','Alarm1Height',Panel9.Height);
  ini_fun.WriteInteger('Monitoring','Sensor1Height',Panel17.Height);
  ini_fun.WriteInteger('Monitoring','InitHeight',Panel12.Height);
  ini_fun.WriteInteger('Monitoring','Alarm2Width',Panel14.Width);
  ini_fun.WriteInteger('Monitoring','Access2Height',Panel15.Height);
  if doorListView.ViewStyle = vsIcon then
    ini_fun.WriteString('Monitoring','DoorListView','vsIcon')
  else
    ini_fun.WriteString('Monitoring','DoorListView','vsList');
  if IntDoorListView.ViewStyle = vsIcon then ini_fun.WriteString('Monitoring','IntDoorListView','vsIcon')
  else ini_fun.WriteString('Monitoring','IntDoorListView','vsList');

  ini_fun.Free;


  Action := caFree;

end;

procedure TfmMultiMonitoring.Action_LoctionLoadExecute(Sender: TObject);
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

  aTreeView := TreeView_Location;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := TreeView_LocationCode;   //��ġ �ڵ� ������� ���� ���¸� �ľ��ϱ� ����
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  aNode:= aTreeView.Items.Add(nil,'��ġ');
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
      if FindField('LO_GUBUN').AsString = '0' then  //���� ���
      begin
        bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
        bNode.ImageIndex:=7;
        bNode.SelectedIndex:=7;
        bNode.StateIndex:= -1;
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
      if FindField('LO_GUBUN').AsString = '1' then  //�� ���
      begin
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=8;
            cNode.SelectedIndex:=8;
            cNode.StateIndex:= -1;
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
      if FindField('LO_GUBUN').AsString = '2' then  //���� ���
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
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
        end;
      end;
      Application.ProcessMessages;
      Next;
    end;
  end;

  if AccessUse then
  begin
    //���Թ����� �ε�
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
            cNode.ImageIndex:=10;
            cNode.SelectedIndex:=10;
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
    //��񱸿� ���� �ε�
    stSql := ' Select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE, ';
    stSql := stSql + ' b.AC_NODENO,b.AC_MCUID,b.AC_ECUID,b.AL_ZONENAME ';
    stSql := stSql + ' From TB_ALARMDEVICE b ';
    if Not IsMaster then
    begin
      if BuildingGrade = 4 then
      begin
        stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE a ';
        stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
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
        stLocationCode := 'D2' + FillzeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString  ;
        stLocationCaption := FindField('AL_ZONENAME').AsString;
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

  if FoodUse then
  begin
    //�ļ����� ���� �ε�
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

end;

procedure TfmMultiMonitoring.Action_DeviceLoadExecute(Sender: TObject);
var
  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
  stSql : string;
  stParentCode : string;
  stLocationCaption : string;
  nIndex : integer;
  tlDaemonGubun : TStringList;
  i : integer;
  stTemp : string;
begin
  aTreeView := TreeView_Device;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  DeviceCodeList.Clear;
  DeviceCaptionList.Clear;
  DeviceLastTimeList.Clear;

  Try
    tlDaemonGubun := TStringList.Create;

    if Not IsMaster then
    begin
      if Not BuildingGrade <> 0 then
      begin
        if BuildingGrade < 4 then
        begin                //���⿡�� �ش� ���� ������ ã�� ����
          stSql := 'select b.AC_DAEMONGUBUN from TB_ACCESSDEVICE a ';
          stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
          stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
          stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
          stSql := stsql + ' AND b.AC_GUBUN = ''0'') ';
          stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
          stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
          if BuildingGrade > 1 then
            stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
          if BuildingGrade > 2 then
            stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
          stSql := stSql + ' GROUP BY b.AC_DAEMONGUBUN ';
        end else if BuildingGrade = 4 then
        begin
          stSql := 'select b.AC_DAEMONGUBUN from TB_ACCESSDEVICE a ';
          stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
          stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
          stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
          stSql := stsql + ' AND b.AC_GUBUN = ''0'') ';
          stSql := stSql + ' Inner Join  ';
          stSql := stSql + ' (select AC_NODENO,AC_MCUID,AC_ECUID,AD_USERID,GROUP_CODE from TB_ADMINDOOR ';
          stSql := stSql + ' Union all ';
          stSql := stSql + ' select b.AC_NODENO,b.AC_MCUID,b.AC_ECUID,a.AD_USERID,a.GROUP_CODE from TB_ADMINALARMDEVICE a  ';
          stSql := stSql + ' Inner Join TB_ALARMDEVICE b ';
          stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
          stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
          stSql := stSql + ' AND a.AC_ECUID =  b.AC_ECUID ) ';
          stSql := stSql + ' Union all ';
          stSql := stSql + ' select AC_NODENO,AC_MCUID,AC_ECUID,AD_USERID,GROUP_CODE from TB_ADMINFOOD ) c ';
          stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
          stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO) ';
          stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
          stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''' ';
          stSql := stSql + ' GROUP BY b.AC_DAEMONGUBUN ';
        end;
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
          while Not Eof do
          begin
            tlDaemonGubun.Add(inttostr(FindField('AC_DAEMONGUBUN').asinteger));
            Next;
          end;
        end;
      end;
    end;

    stSql := 'Select * from TB_DAEMONMULTI ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    if Not IsMaster then
    begin
      if Not BuildingGrade <> 0 then
      begin
        for i := 0 to tlDaemonGubun.Count - 1 do
        begin
          stSql := stSql + ' AND DM_GUBUN = ' + tlDaemonGubun.Strings[i] ;
        end;
      end;
    end;
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
      while Not Eof do
      begin
        stTemp := inttostr(FindField('DM_GUBUN').asinteger) + ':' + FindField('DM_SERVERIP').AsString + ',' + FindField('DM_SERVERPORT').AsString ;
        aNode:= aTreeView.Items.Add(nil,'����' + stTemp );
        aNode.ImageIndex:=14;
        aNode.SelectedIndex:=14;
        aNode.StateIndex:= -1;
        DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));
        DeviceCodeList.Add('S' + FillZeroNumber(FindField('DM_GUBUN').asinteger,5));
        DeviceCaptionList.Add('����' + stTemp);
        Next;
      end;
    end;

  Finally
    tlDaemonGubun.free;
  End;

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
      stLocationCaption := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + ':' + FindField('AC_MCUIP').AsString + ':' + FindField('AC_MCUPORT').AsString;
      DeviceCodeList.Add('N' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3));
      DeviceCaptionList.Add(stLocationCaption);
      DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //LAN�� ���ӽð� üũ����...
      nIndex := DeviceCodeList.IndexOf('S' + FillZeroNumber(FindField('AC_DAEMONGUBUN').AsInteger,5));
      if nIndex > -1 then
      begin
        stParentCode := DeviceCaptionList.Strings[nIndex] ;
        bNode:= GetNodeByText(aTreeView,stParentCode,True);
        if bNode <> nil then
        begin
          cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
          cNode.ImageIndex:=3;
          cNode.SelectedIndex:=3;
          cNode.StateIndex:= -1;
        end;
      end;
      {
      bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
      bNode.ImageIndex:=3;
      bNode.SelectedIndex:=3;
      bNode.StateIndex:= -1;
      }
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
      stLocationCaption := FindField('AC_ECUID').asstring + ':' + FindField('AC_DEVICENAME').asstring;
      DeviceCodeList.Add('E' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring);
      DeviceCaptionList.Add(stLocationCaption);
      DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //ECU�� ���ӽð� üũ����...
      nIndex := DeviceCodeList.IndexOf('N' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3));
      if nIndex > -1 then
      begin
        stParentCode := DeviceCaptionList.Strings[nIndex] ;
        bNode:= GetNodeByText(aTreeView,stParentCode,True);
        if bNode <> nil then
        begin
          cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
          cNode.ImageIndex:=5;
          cNode.SelectedIndex:=5;
          cNode.StateIndex:= -1;
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
            cNode.ImageIndex:=10;
            cNode.SelectedIndex:=10;
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
    //��񱸿� �ε�
    if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_ARMAREJoinAdmin('','','')
    else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_ARMAREJoinAdmin('','','')
    else if DBTYPE = 'MSSQL' then stSql := MSSql.selectTB_ARMAREJoinAdmin('','','')
    else if DBTYPE = 'FB' then stSql := FireBird.selectTB_ARMAREJoinAdmin('','','')
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
        stLocationCaption :=  FindField('AL_ZONENAME').asstring;
        DeviceCodeList.Add('D' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring );
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

  if FoodUse then
  begin
    //�ļ����� �ε�
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
          cNode.ImageIndex:=13;
          cNode.SelectedIndex:=13;
          cNode.StateIndex:= -1;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  end;

end;

procedure TfmMultiMonitoring.SocketWatchTimerTimer(Sender: TObject);
var
  i : integer;
  dtLastTime : TDatetime;
  dtTimeOut : TDatetime;
  stNodeNo : string;
begin
// ������ ������ ���ӽð��� �������.
  for i:= 1 to DeviceLastTimeList.Count - 1 do
  begin
    dtLastTime := strToDateTime(DeviceLastTimeList.Strings[i]);
    dtTimeOut:= IncTime(dtLastTime,0,0,15,0);
    if Now > dtTimeOut then
    begin
      // ���⿡�� �ش� ����� �̹����� ������ ����.
      stNodeNo := DeviceCodeList.Strings[i];
      if (stNodeNo[1] = 'N') then
        DisConnectNode(stNodeNo);
//      else if stNodeNo[1] = 'E' then
//        DisConnectECU(stNodeNo);
    end;
  end;

end;

procedure TfmMultiMonitoring.DisConnectNode(aNodeNo: string);
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
  if TreeView_Device.Items.Count < 1 then Exit;
  bRefresh := False;
  nIndex := DeviceCodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;

  aTreeView := TreeView_Device;
  DeviceStateList.Strings[nIndex] := 'D';
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
    if copy(stECUCode,1,1) = 'E' then //ECU�ڵ��̸�
    begin
      //�ش����� ECU���� üũ�ؼ� �ش� ECU�̸� �̹��� ����
      if copy(stECUCode,2,3) = copy(aNodeNo,2,3) then
      begin
        DisConnectECU(stECUCode);
{        stCaption := DeviceCaptionList.Strings[DeviceCodeList.IndexOf(stECUCode)];
        aNode:= GetNodeByText(aTreeView,stCaption,False);
        if aNode.ImageIndex <> 5 then  aNode.ImageIndex:=5;
        if aNode.SelectedIndex <> 5 then  aNode.SelectedIndex:=5;
        aNode.StateIndex:= -1;  }

      end;
    end;
  end;
  if bRefresh then aTreeView.Refresh;

  {
  for i:=0 to DoorCodeList.Count - 1 do
  begin
    stDoorCode := DoorCodeList.Strings[i];
    if copy(stDoorCode,1,3) = copy(aNodeNo,2,3) then //�ش����� �����̸� ��� ����ǥó��
    begin
      DisConnectDoor(stDoorCode);
    end;
  end;  
  for i:=0 to AlarmCodeList.Count - 1 do
  begin
    stAlarmCode := AlarmCodeList.Strings[i];
    if copy(stAlarmCode,1,3) = copy(aNodeNo,2,3) then //�ش����� �����̸� ��� ����ǥó��
    begin
      DisConnectAlarm(stAlarmCode);
    end;
  end;  }

end;

procedure TfmMultiMonitoring.ConnectNode(aNodeNo: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  nIndex : integer;
begin
  nIndex := DeviceCodeList.IndexOf(aNodeNo);
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
  aTreeView.Refresh;
end;


procedure TfmMultiMonitoring.ConnectECU(aECUID: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  stDoorID : string;
  nIndex : integer;
begin
  nIndex := DeviceCodeList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
{  stDoorID:= aECUID + '1';
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  sleep(1);
  stDoorID:= aECUID + '2';
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
}
  stCaption := DeviceCaptionList.Strings[nIndex];
  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;

  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  if aNode.ImageIndex <> 4 then aNode.ImageIndex:=4;
  if aNode.SelectedIndex <> 4 then aNode.SelectedIndex:=4;
  aNode.StateIndex:= -1;
  aTreeView.Refresh;
end;

procedure TfmMultiMonitoring.DisConnectECU(aECUID: string);
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
  bRefresh := False;
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
    if copy(stDoorCode,1,5) = copy(aECUID,2,5) then //�ش�ECU�� �����̸� ��� ����ǥó��
    begin
      DisConnectDoor(stDoorCode);
    end;
  end;

  for i:=0 to AlarmCodeList.Count -1 do
  begin
    stAlarmCode := AlarmCodeList.Strings[i];
    if Copy(stAlarmCode,1,5) = copy(aECUID,2,5) then //�ش�ECU�� Alam�̸� ����ǥ
    begin
      DisConnectAlarm(stAlarmCode);
    end;
  end;
  if bRefresh then aTreeView.Refresh;
end;

procedure TfmMultiMonitoring.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stReceiveData: string;
  stNodeNo,stECUID,stDoorNo,stReaderNo : string;
  aCommand : char;
  MSG_Code: Char;
  stDevice : string; //S:����,E:ECU,D:Door,
  stTYPE : string;
  stACTION : string;
  nLength : integer;
  stData : string;
  stDaemonGubun : string;
begin
  stReceiveData := Params.Values['Data'];
  stDaemonGubun := Params.Values['DaemonGubun'];
  if not IsDigit(stDaemonGubun) then stDaemonGubun := '0';
  RcvMessage(stReceiveData,strtoint(stDaemonGubun));

end;

procedure TfmMultiMonitoring.Action_DoorLoadExecute(Sender: TObject);
begin
  DoorLoad('000','000','000',doorListView);
  if PatrolUse then
    DoorLoad('000','000','000',IntdoorListView);
end;

// �������� �ε�  �Ͽ� �ش� ����Ʈ�� ��ȸ ����
procedure TfmMultiMonitoring.DoorLoad(aBuildingCode, aFloorCode,
  aAreaCode: string; DoorList: TListView);
var
  stSql : string;
  stDoorID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
  stCode : string;
begin
  if L_bClose then Exit;
  DoorCodeList.Clear;
  DoorLocateList.Clear;
  DoorList.Clear;
  //Door���� �ε�
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
      AccessTab.TabVisible := False;
      IntegrationTab.TabVisible := False;
      Exit;
    end;
    AccessTab.TabVisible := True;
    if AlarmTab.Visible then IntegrationTab.TabVisible := True;
    
    First;
    i:=0;
    While Not Eof do
    begin
      if L_bClose then Exit;
      DoorList.Items.Add.Caption:= FindField('DO_DOORNONAME').asString;
      stDoorID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3) 
                 + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString ;
      DoorList.Items[I].SubItems.Add(stDoorID);     // �� ID
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
      DoorList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3)); //����ȣ
      DoorList.Items[I].SubItems.Add(FindField('AC_MCUID').AsString); //MCUID
      DoorList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
      DoorList.Items[I].SubItems.Add(FindField('DO_DOORNO').AsString); //����ȣ
      DoorList.Items[I].SubItems.Add(FindField('AC_JAVARATYPE').AsString); //�ڹٶ�Ÿ��
      DoorList.Items[I].ImageIndex:=2;

      inc(i);
      Application.ProcessMessages;
      Next;
    end;
  end;
  DoorCodeList.Clear;
  for i:=0 to DoorList.Items.Count - 1 do
  begin
    stCode := DoorList.Items[I].SubItems.Strings[0];
    DoorCodeList.Add(stCode);  //���� �ڵ带 �������
  end;

  if DoorList.ViewStyle = vsList then
  begin
    DoorList.ViewStyle := vsIcon;
    DoorList.Refresh;
    DoorList.ViewStyle := vsList;
  end;

end;

procedure TfmMultiMonitoring.AlarmLoad(aBuildingCode, aFloorCode,
  aAreaCode: string; AlarmList: TListView);
var
  stSql : string;
  stAlarmID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
begin
  if L_bClose then Exit;
  AlarmCodeList.Clear;
  AlarmNoList.Clear;
  AlarmLocateList.Clear;
  AlarmList.Clear;

  //Alarm���� �ε�
  stSql := ' Select a.AL_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AL_ZONENAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  stSql := stSql + ' From TB_ALARMDEVICE a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
    end;
  end;
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';   }
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
  //  stSql := stSql + ' Group by a.AL_VIEWSEQ,a.AL_DEVICENO,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AL_ZONENAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  stSql := stSql + ' Order by a.AL_VIEWSEQ ';

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
      AlarmTab.TabVisible := False;
      IntegrationTab.TabVisible := False;
      Exit;
    end;
    AlarmTab.TabVisible := True;
    if AccessTab.TabVisible then IntegrationTab.TabVisible := True;

    First;
    i:=0;
    While Not Eof do
    begin
      if L_bClose then Exit;
      //AlarmList.Columns.Add.AutoSize := True;
      AlarmList.Items.Add.Caption:= FindField('AL_ZONENAME').asString;
      stAlarmID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                 + FindField('AC_ECUID').AsString;// + FillZeroNumber(FindField('AL_DEVICENO').AsInteger,3);
      AlarmList.Items[I].SubItems.Add(stAlarmID);     // ��� ID
      //AlarmCodeList.Add(stAlarmID);  //������̵� �������
      AlarmNoList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +FindField('AC_ECUID').AsString );
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

      AlarmList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3)); //����ȣ
      AlarmList.Items[I].SubItems.Add(FindField('AC_MCUID').AsString); //MCUID
      AlarmList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
      AlarmList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString); //�˶����̵�
      AlarmList.Items[I].ImageIndex:=2;

      inc(i);
      Application.ProcessMessages;
      Next;
    end;
  end;
  AlarmCodeList.Clear;
  for i:=0 to AlarmList.Items.Count - 1 do
  begin
    AlarmCodeList.Add(AlarmList.Items[I].SubItems.Strings[0]);  //��񱸿��� �ڵ带 �������
  end;
  AlarmList.ViewStyle := vsIcon;
  AlarmList.Refresh;
  AlarmList.ViewStyle := vsList;


end;

procedure TfmMultiMonitoring.Action_AlarmLoadExecute(Sender: TObject);
begin
  AlarmLoad('000','000','000',AlarmListView);
  AlarmLoad('000','000','000',IntAlarmListView);
end;

procedure TfmMultiMonitoring.Action_FoodLoadExecute(Sender: TObject);
begin
  FoodLoad('000','000','000');
end;

procedure TfmMultiMonitoring.FoodLoad(aBuildingCode, aFloorCode,
  aAreaCode: string);
var
  stSql : string;
  stFoodID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
begin
  if L_bClose then Exit;
  FoodCodeList.Clear;
  FoodCodeNameList.Clear;
  FoodLocateList.Clear;
  FoodTab.TabVisible := False;
  Exit;
  //Food ���� �ε�
  stSql := ' Select a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO,a.FO_NAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE';
  stSql := stSql + ' From TB_FOOD a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
      stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
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
  
  stSql := stSql + ' Group by a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO,a.FO_NAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE  ';

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
      FoodTab.TabVisible := False;
      Exit;
    end;
    FoodTab.TabVisible := True;
    First;
    i:=0;
    While Not Eof do
    begin
      if L_bClose then Exit;
      stFOODID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                 + FindField('AC_ECUID').AsString + FindField('FO_DOORNO').AsString;
      FoodCodeList.Add(stFOODID);  //�ļ����̵� �������
      FoodCodeNameList.Add(FindField('FO_NAME').AsString);                  
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
      FoodLocateList.Add(stLocate);

      inc(i);
      Next;
    end;
  end;

end;

procedure TfmMultiMonitoring.pm_StateCheckClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
    end;
  end;

end;

procedure TfmMultiMonitoring.pm_intiStateCheckClick(Sender: TObject);
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

procedure TfmMultiMonitoring.pm_DoorOpenClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','���Խ���')
    end;
  end;

end;

procedure TfmMultiMonitoring.pm_intiDoorOpenClick(Sender: TObject);
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
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','���Խ���')
    end;
  end;

end;

procedure TfmMultiMonitoring.pm_OperateModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    Application.MessageBox(PChar('ȭ��߻��ÿ��� ȭ�� ���� �Ϸ� �Ŀ� ���� �����մϴ�.'),'����',MB_OK);
    Exit;
  end;
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','����')
    end;
  end;


end;

procedure TfmMultiMonitoring.pm_OpenModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPENMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','������')
    end;
  end;

end;

procedure TfmMultiMonitoring.pm_intiOpenModeClick(Sender: TObject);
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
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','������')
    end;
  end;

end;

procedure TfmMultiMonitoring.pm_intiOperateModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    Application.MessageBox(PChar('ȭ��߻��ÿ��� ȭ�� ���� �Ϸ� �Ŀ� ���� �����մϴ�.'),'����',MB_OK);
    Exit;
  end;
  for i := 0 to IntdoorListView.Items.Count - 1 do
  begin
    if IntdoorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','����')
    end;
  end;

end;

procedure TfmMultiMonitoring.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd: string;
  i : integer;
begin
  stCmd := Params.Values['Data'];

  for i:=0 to DoorCodeList.Count - 1 do
  begin
    if stCmd = 'OPENMODE' then  //��ü����
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPENMODE'+ DATADELIMITER + DoorCodeList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end else if stCmd = 'OPERATEMODE' then  //��ü�
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + DoorCodeList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end;
  end;


end;

procedure TfmMultiMonitoring.Menu_CurLocateClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  if AccessUse then
  begin
    DoorLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),doorListView);
    if PatrolUse then
      DoorLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),IntdoorListView);
  end;
  if PatrolUse then
  begin
    AlarmLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),AlarmListView);
    AlarmLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),IntAlarmListView);
  end;
  if FoodUse then
    FoodLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3) );
  if SensorUse then
    SensorLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),SensorListView);

{  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  if PatrolUse then
  begin
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
  end;
}
end;

procedure TfmMultiMonitoring.TreeView_LocationClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then TreeView_Location.PopupMenu:= nil
  else TreeView_Location.PopupMenu:= Popup_Locate;

end;

procedure TfmMultiMonitoring.TreeView_DeviceClick(Sender: TObject);
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

procedure TfmMultiMonitoring.Menu_DeviceTimeSyncClick(Sender: TObject);
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

procedure TfmMultiMonitoring.Menu_DeviceRebootClick(Sender: TObject);
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

procedure TfmMultiMonitoring.CommandArrayCommandsTCommand2Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmMultiMonitoring.menu_AlarmClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMultiMonitoring.menu_AlarmDisableClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMultiMonitoring.Menu_IntAlarmSettingClick(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  for i := 0 to IntAlarmListView.Items.Count - 1 do
  begin
    if IntAlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','�����')
    end;
  end;

end;

procedure TfmMultiMonitoring.Menu_IntAlarmDisableClick(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  for i := 0 to IntAlarmListView.Items.Count - 1 do
  begin
    if IntAlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','�������')
    end;
  end;

end;

procedure TfmMultiMonitoring.CommandArrayCommandsTCommand3Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd: string;
  i : integer;
begin
  stCmd := Params.Values['Data'];

  for i:=0 to AlarmCodeList.Count - 1 do
  begin
    if stCmd = 'ALARMSETTING' then  //��ü���
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + AlarmCodeList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end else if stCmd = 'ALARMDISABLE' then  //��ü����
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + AlarmCodeList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end;
  end;

end;

procedure TfmMultiMonitoring.RcvCardReadData(aNodeNo, aReceiveData: string);
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
  if CARDLENGTHTYPE = 0 then  //�������� Ÿ���̸�
  begin
    stTemp := Copy(aReceiveData,44,8);
    if nSpecialProgram = 3 then  //KTTELECOP ���ǵ����Ʈ�� 3�ڸ��� ���.
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
    if stCardNo = stTemp then bExitButton := True; //Exit ��ư ��������

    if Not bExitButton then
    begin
      if CARDLENGTHTYPE = 1 then
      begin
        if IsNumericCardNo then stCardNo:= inttostr(Hex2Dec64(stCardNo));
      end else if CARDLENGTHTYPE = 2 then
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

  //ī���������üũ
  stPermitCode:= aReceiveData[39];
  stPermit := GetPermitState(stPermitCode);

  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + stECUID + stDoorNo;
  nIndex := DoorCodeList.IndexOf(stDeviceID);
  if nIndex < 0 then //�ļ� ������ �̰ų� ���԰��� ������ ����
  begin
    //�ڹٶ����� Ȯ�� ����
    if stDoorNo = '2' then
    begin
      if dmJavara.JavaraCheck(strtoint(aNodeNo),stEcuID) then
      begin
        nIndex := DoorCodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3) + stECUID + '1');
        if nIndex > -1 then
        begin
          stLocationName := DoorLocateList.Strings[nIndex];
          stDoorName:= doorListView.Items[nIndex].Caption + '_����'; // �ڹٶ����
          InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stCardNo,stUserName,
          stCompanyName,stJijumName,'',stEmID,stDeviceID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_Access);
          InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stCardNo,stUserName,
          stCompanyName,stJijumName,'',stEmID,stDeviceID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_IntAccess);
        end;
      end;
    end;
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
    stDoorName := doorListView.Items[nIndex].Caption;
    stLocationName := DoorLocateList.Strings[nIndex];
  end;

  if stMosGubun = 'DOOR' then
  begin
    if ACAlarmUse then
    begin
      if Not Isdigit(stPermitCode) then
      begin
        if FileExists(ACAlaramFile) then
        begin
          MediaPlayer1.FileName := ACAlaramFile;
          MediaPlayer1.Open;
          MediaPlayer1.play;
        end;
      end;
    end;
    if bExitButton then
    begin
      if G_nAccessEventSearch = 1 then Exit;  //ī�� �̺�Ʈ�� ��ȸ�� ���� ����
      case cInputtype of
        'R': begin
             stUserName :=  '��������';
             stPermit := '���������';
             end;
        'P': begin
             stUserName :=  '��ȭ';
             stPermit := '��ȭ�����';
             end;
        'B': begin
             stUserName := '��ǹ�ư';
             stPermit := '��ǹ�ư����';
             end;
      else stUserName:= cInputType;
      end;
    end;
    InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stCardNo,stUserName,
    stCompanyName,stJijumName,'',stEmID,stDeviceID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_Access);
    InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stCardNo,stUserName,
    stCompanyName,stJijumName,'',stEmID,stDeviceID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_IntAccess);
  end else if stMosGubun = 'FOOD' then
  begin
    if bExitButton then Exit;
    InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stCardNo,stUserName,
    stCompanyName,stJijumName,'',stEmID,stDeviceID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_Food);
  end;

end;

procedure TfmMultiMonitoring.Menu_DeviceAllCardDownClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  if (Application.MessageBox(PChar('��ü���� ���۽� ���� ����� ������ ��� ���� �˴ϴ�. ��ü���� �����Ͻðڽ��ϱ�?'),'����',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + stDeviceID + DATADELIMITER + 'Y' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert('0','00','0','0',stDeviceID , '����������');
{
  self.FindSubForm('Main').FindCommand('CARDDOWNLOAD').Params.Values['VALUE'] := stDeviceID + 'A';
  self.FindSubForm('Main').FindCommand('CARDDOWNLOAD').Execute;
}
end;

procedure TfmMultiMonitoring.Menu_DeviceCardDownClick(Sender: TObject);
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

function TfmMultiMonitoring.GetAreaName(aBuildingCode, aFloorCode,
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

function TfmMultiMonitoring.GetBuildingName(aBuildingCode: string): string;
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

function TfmMultiMonitoring.GetFloorName(aBuildingCode,
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

function TfmMultiMonitoring.GetPermitState(aPermit: string): string;
var
  stSql : string;
begin
  Result := '�̵���ڵ�';
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

function TfmMultiMonitoring.GetUserInfo(aCardNo: string; var stUserName,
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

procedure TfmMultiMonitoring.LoadCompanyCode;
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

procedure TfmMultiMonitoring.LoadDepartCode;
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

procedure TfmMultiMonitoring.CommandArrayCommandsTCommand4Execute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
end;

procedure TfmMultiMonitoring.InsertDOORList(aPermitCode,aPermit, aTime, aLocationName,
  aDoorName, aCardNo, aUserName, aCompanyName, aJijumName,aDepertName, aEmID,aDoorID,aHandPhone,aCompanyPhone,aAddr1,aAddr2: string;List:TAdvStringGrid);
var
  nCol: integer;

begin

  with List do
  begin
    //ColWidths[10] := 0;  //�����ڵ�
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
    if List.Name = 'sg_Access' then
    begin
      Cells[DoorIndexArray[0],1] := aTime;   //�߻��ð�
      Cells[DoorIndexArray[1],1] := copy(aLocationName,10,length(aLocationName)-9); //��ġ
      Cells[DoorIndexArray[2],1] := aDoorName; //���Թ�
      Cells[DoorIndexArray[3],1] := aPermitCode; //���λ��� �ڵ�
      Cells[DoorIndexArray[4],1] := aPermit; //���λ���
      Cells[DoorIndexArray[5],1] := aCardNo; //ī���ȣ
      Cells[DoorIndexArray[6],1] := aUserName; //�̸�
      Cells[DoorIndexArray[7],1] := aCompanyName ; //ȸ���
      Cells[DoorIndexArray[8],1] := aJijumName ; //������
      Cells[DoorIndexArray[9],1] := aDepertName ; //�μ���
      Cells[DoorIndexArray[10],1] := aEmID; //���
      Cells[DoorIndexArray[11],1] := aDoorID; //���Թ�
      Cells[DoorIndexArray[12],1] := aHandPhone; //�ڵ���
      Cells[DoorIndexArray[13],1] := aCompanyPhone; //�系��ȭ��ȣ
      Cells[DoorIndexArray[14],1] := aAddr1; //�ּ�1
      Cells[DoorIndexArray[15],1] := aAddr2; //�ּ�2

      sg_AccessClick(self);
    end else if List.Name = 'sg_IntAccess' then
    begin
      Cells[IntDoorIndexArray[0],1] := aTime;   //�߻��ð�
      Cells[IntDoorIndexArray[1],1] := copy(aLocationName,10,length(aLocationName)-9); //��ġ
      Cells[IntDoorIndexArray[2],1] := aDoorName; //���Թ�
      Cells[IntDoorIndexArray[3],1] := aPermitCode; //���λ��� �ڵ�
      Cells[IntDoorIndexArray[4],1] := aPermit; //���λ���
      Cells[IntDoorIndexArray[5],1] := aCardNo; //ī���ȣ
      Cells[IntDoorIndexArray[6],1] := aUserName; //�̸�
      Cells[IntDoorIndexArray[7],1] := aCompanyName ; //ȸ���
      Cells[IntDoorIndexArray[8],1] := aJijumName ; //�μ���
      Cells[IntDoorIndexArray[9],1] := aDepertName ; //�μ���
      Cells[IntDoorIndexArray[10],1] := aEmID; //���
      Cells[IntDoorIndexArray[11],1] := aDoorID; //���

    end;
  end;

end;

procedure TfmMultiMonitoring.Button1Click(Sender: TObject);
begin
 InsertDOORList('1','���Խ���', '2003-01-11 11:11:11', '1��-1��-1����',
  '��1', '1234567890', 'ȫ�浿', 'ȸ��', '','�μ�', '1','001011','','','','',sg_Access);
 InsertAlarmList( '2003-01-11 11:11:11', '1��-1��-1����',
  '��豸��', '1234567890', '�߻����', 'MN', '�溸�߻�','',0,'255',sg_Alarm);

end;

procedure TfmMultiMonitoring.DeviceRcvAlarmData(aNodeNo, aReceiveData: string);
var
  stECUID : string;
  stMsgNo,stTime,stSubClass,stSubAddr,stZoneCode,stMode:string;
  stStatusCode,stStatusName,stPortNo,stState,stOperator : string;
  stCmd :string;
  nResult : integer;
  nIndex : integer;
  stLocate,stAlarmName,stModeStr : string;
  nImageIndex : integer;
  stDeviceType : string;
  i : integer;
  bZoneSensor : Boolean; // ���� ���� ����
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

  nIndex := AlarmCodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3) + stECUID );

  if nIndex < 0 then Exit;// ���� ������ ����

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

  {  if stMode = 'A' then //Alarm ��ȣ �ö� ���� �ܼ� ��ȣ���� ��Ʈ ��ȣ ���� üũ����
  begin
    if Not bALARMSHORT then
    begin
      if stState = 'S' then Exit; //��Ʈ ��ȣ�� ���� ���� �ʴ� ��� ���� ����
    end;
    if Not bALARMDOWN then
    begin
      if stState = 'P' then Exit; //�ܼ� ��ȣ�� ���� ���� �ʴ� ��� ���� ����
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
//nResult: 0:����,1:�˶�,-1�̵��
  nResult:= GetStatusCode(stNewStateCode,stStatusName,nAlarmSound);
  if stPortNo <> '**' then    //��Ʈ ���� �ΰ�� ������ �Ѹ���.
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
        stStatusName := '' + stPortNo + '�� ħ��' + '  ' + stPortName;// + stStatusName; //+ stPortNo +'���� ����'; //stStatusName;    //� �������� ���� �Ǿ����� ǥ��
      end else
      begin
        stStatusName := '' + stStatusName + '  ' + stPortName ;
      end;
    end else
    begin
      //nResult := 1;
      stStatusName := stStatusName +'[����]' + stPortName ;//+ stPortNo +'���� ����';
    end;
  end;

  stDeviceType:=  stSubCLass +'['+ stSubAddr + ']';

  {�� ��庰 ������ ����}
  nImageIndex := 2;
  case stMode[1] of
   'A': begin nImageIndex:= 4; stModeStr:= '�����[A]' end;
   'D': begin nImageIndex:= 3; stModeStr:= '�������[D]' end;
   'T': begin nImageIndex:= 6; stModeStr:= '������[T]' end;
   'I': begin nImageIndex:= 7; stModeStr:= '��ϸ��[I]' end;
   'P': begin nImageIndex:= 8; stModeStr:= '��ȸ���[P]' end;
  else  begin nImageIndex:= 3; stModeStr:= '�̵�ϸ��['+stMode[1]+']' end;
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

    if bZoneSensor then Insertsg_SensorList(stTime,aNodeNo,stECUID,stPortNo,stDeviceType,stNewStateCode,stStatusName,stPortName,sg_Sensor);
  end;


  if nAlarmSound = 1 then
  begin
    if PTAlarmUse then
    begin
      if stCmd = 'A' then
      begin
        if FileExists(PTAlaramFile) then
        begin
          MediaPlayer1.FileName := PTAlaramFile;
          MediaPlayer1.Open;
          MediaPlayer1.play;
        end;
      end;
    end;
  end;

  stLocate := AlarmLocateList.Strings[nIndex]; //��豸�� ��ġ
  stAlarmName:= AlarmListView.Items[nIndex].Caption; // ��豸�� ��

  AlarmListView.Items[nIndex].SubItems[2]:= stMode;
  IntAlarmListView.Items[nIndex].SubItems[2]:= stMode;
  AlarmListView.Items[nIndex].SubItems[3]:= InttoStr(nResult);
  IntAlarmListView.Items[nIndex].SubItems[3]:= InttoStr(nResult);

  AlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
  IntAlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
  {
  if (stSubCLass = 'MN') or (stSubCLass = 'EX')then
  begin
    if stStatusCode = 'NF' then //��� �̻��̸�
    begin
      AlarmListView.Items[nIndex].ImageIndex:= 2;
      IntAlarmListView.Items[nIndex].ImageIndex:= 2;
    end;
  end;   }

  //����̻��� ��� �����ܿ� ǥ�� ���� �ʴ´�.
  if stStatusCode <> 'NF' then
  begin
    if nResult = 1 then
    begin
      if stCmd = 'A' then
      begin
        AlarmListView.Items[nIndex].StateIndex:= 3;
        IntAlarmListView.Items[nIndex].StateIndex:= 3;
      end;
    end
    else
    begin
      //AlarmListView.Items[nIndex].StateIndex:= -1;
      //IntAlarmListView.Items[nIndex].StateIndex:= -1;
    end;
  end;

{  //��ġ ���� ������ Map �� �˶� ǥ��
  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).AlaramStateChange(aNodeNo,stECUID,stPortNo,stMode,inttostr(nResult));
  end; }

  if nResult < 1 then Exit; //������ ��� ���� ����

  if ALARMVIEW = 'REAL' then
  begin
    if stCmd = 'A' then
    begin
      InsertAlarmList(stTime, //�ð�
                    stLocate, //��ġ����
                    stAlarmName, //��豸����Ī
                    stECUID +'['+stMsgNo+']',  //����ȣ[�޽�����ȣ]
                    stDeviceType,         //���Ÿ��[��ȣ]
                    stStatusCode + '/' + stPortNo,  //�̺�Ʈ�ڵ�
                    stStatusName,
                    FillZeroNumber(strtoint(aNodeNo),3) + stECUID,
                    nAlarmSound,
                    '255',
                    sg_Alarm);  //�̺�Ʈ ����
      InsertAlarmList(stTime, //�ð�
                    stLocate, //��ġ����
                    stAlarmName, //��豸����Ī
                    stECUID +'['+stMsgNo+']',  //����ġ��ȣ[�޽�����ȣ]
                    stDeviceType,         //�߻����[��ȣ]
                    stStatusCode + '/' + stPortNo,  //�̺�Ʈ�ڵ�
                    stStatusName,
                    FillZeroNumber(strtoint(aNodeNo),3) + stECUID,
                    nAlarmSound,
                    '255',
                    sg_IntAlarm);  //�̺�Ʈ ����
    end;
  end
  else if ALARMVIEW = 'QUERY' then
  begin
      Delay(200);
      SearchAlarmList;
  end;


end;

function TfmMultiMonitoring.GetStatusCode(aStatusCode: string;
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

procedure TfmMultiMonitoring.InsertAlarmList(aTime, aLocateName, aAlarmName,
  aDeviceID, aDeviceType, aStatusCode, aStatusName,aAlaramCode: string;aAlarmSound:integer;
  aColor:string;  List: TAdvStringGrid);
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
      if isDigit(aColor) then  RowColor[1] := strtoint(aColor)
      else RowColor[1] := clRed;
    end;
    if List.Name = 'sg_Alarm' then
    begin
      Cells[AlarmIndexArray[0],1] := aTime;   //�߻��ð�
      Cells[AlarmIndexArray[1],1] := copy(aLocateName,10,length(aLocateName)-9); //��ġ
      Cells[AlarmIndexArray[2],1] := aAlarmName; //��豸��
      Cells[AlarmIndexArray[3],1] := aDeviceID; //����ġ��ȣ
      Cells[AlarmIndexArray[4],1] := aDeviceType; //����ȣ
      Cells[AlarmIndexArray[5],1] := aStatusCode; //�߻��ڵ�
      Cells[AlarmIndexArray[6],1] := aStatusName; //�̺�Ʈ����
      Cells[AlarmIndexArray[7],1] := aAlaramCode; //AlarmCode
    end else if List.Name = 'sg_IntAlarm' then
    begin
      Cells[IntAlarmIndexArray[0],1] := aTime;   //�߻��ð�
      Cells[IntAlarmIndexArray[1],1] := copy(aLocateName,10,length(aLocateName)-9); //��ġ
      Cells[IntAlarmIndexArray[2],1] := aAlarmName; //��豸��
      Cells[IntAlarmIndexArray[3],1] := aDeviceID; //����ġ��ȣ
      Cells[IntAlarmIndexArray[4],1] := aDeviceType; //����ȣ
      Cells[IntAlarmIndexArray[5],1] := aStatusCode; //�߻��ڵ�
      Cells[IntAlarmIndexArray[6],1] := aStatusName; //�̺�Ʈ����
      Cells[IntAlarmIndexArray[7],1] := aAlaramCode; //AlarmCode
    end;
  end;

end;

procedure TfmMultiMonitoring.Action_ReloadExecute(Sender: TObject);
begin
{  Action_LoctionLoadExecute(Self);
  Action_DeviceLoadExecute(Self);
  Action_DoorLoadExecute(Self);
  Action_AlarmLoadExecute(Self);
  Action_SensorLoadExecute(Self);
  LoadCompanyCode;
  LoadDepartCode;}

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
  LoadJijumCode;

  LoadDepartCode;
  Action_LoctionLoadExecute(Self);
  AllStateCheck;
  {
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  if PatrolUse then
  begin
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
  end;     }

//  SocketWatchTimer.Enabled := True;
end;

procedure TfmMultiMonitoring.RcvChangeDoorData(aNodeNo, aReceiveData: string);
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
  //19�� ~
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
  cDoorState:= aReceiveData[40];    //������
  cDoorMode:=  aReceiveData[37];    //�/����
  cDoorMode2:= aReceiveData[36];    //Posi/Nega
  stTime:=     Copy(aReceiveData,24,12);

  if cDoorMode2 <> '1' then
  begin
    Case cDoorMode of
      '0':
      begin
        if doorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= 0;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        if doorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= -1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        if doorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= 1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        if doorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= -1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;

  end;

{  if aIndex = 8 then
  begin
    if DoorState = 'C' then  DoorState:= 'O'
    else if DoorState = 'O' then  DoorState:= 'C';
  end;   }

  case cDoorState of
    'C': //����
      begin
        if doorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
        doorListView.Items[nIndex].ImageIndex:=0;
        if PatrolUse then
          IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //����
      begin
        if doorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
        doorListView.Items[nIndex].ImageIndex:=1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
    'T'://��ð� ����
      begin
        stTimeStr:= '20'+ Copy(stTime,1,2)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= doorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '��ð� ����');
      end;
    'U'://�����̻�
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= doorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '������ ����');
      end;
    'L'://�����̻�
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= doorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '���ݱ� ����');
      end;
  end;
  if bRefresh then
  begin
    doorListView.Refresh;
    if PatrolUse then IntdoorListView.Refresh;
  end;
  
{  //��ġ ���� ������ Map �� ���� ǥ��
  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(aNodeNo,stECUID,stDoorNo,cDoorMode,cDoorState,cDoorMode2);
  end;   }

end;

procedure TfmMultiMonitoring.RcvDoorControl(aNodeNo, aReceiveData: string);
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
  cDoorMode:=  aReceiveData[25];    //�/����
  cDoorState:= aReceiveData[26];    //������
  stState := cDoorMode + cDoorState ;
//  MapAction('3',aNodeNo,stECUID,stDoorNo,stState);

  if cDoorMode2 <> '1' then
  begin
    Case cDoorMode of
      '0':
      begin
        if doorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= 0;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        if doorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= -1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        if doorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= 1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        if doorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= -1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;

  end;

  case cDoorState of
    'C': //����
      begin
        if doorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
        doorListView.Items[nIndex].ImageIndex:=0;
        if PatrolUse then
          IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //����
      begin
        if doorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
        doorListView.Items[nIndex].ImageIndex:=1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
  end;
  if bRefresh then
  begin
    doorListView.Refresh;
    if PatrolUse then IntdoorListView.Refresh;
  end;

{  //��ġ ���� ������ Map �� ���� ǥ��
  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(aNodeNo,stECUID,stDoorNo,cDoorMode,cDoorState,cDoorMode2);
  end;  }
end;

procedure TfmMultiMonitoring.sg_AccessClick(Sender: TObject);
var
  stSql : string;
  stCardNo : string;
  stImage : string;
  nIndex : integer;
begin
  ClearEmpInfo;
  stCardNo := sg_Access.Cells[DoorIndexArray[5],sg_Access.Row];
  if stCardNo = '' then Exit;
  //stCardNo := '1234567890';

  stSql := 'select b.EM_IMAGE,b.EM_NAME,b.EM_CODE,b.CO_COMPANYCODE, ';
  stSql := stSql + ' b.CO_JIJUMCODE,b.CO_DEPARTCODE,b.PO_NAME,b.em_handphone ';
  stSql := stSql + ' From TB_CARD a ';
  stSql := stSql + ' Inner Join   ';
  stSql := stSql + ' ( select a.GROUP_CODE,a.EM_CODE,a.EM_NAME,a.CO_COMPANYCODE, ';
  stSql := stSql + ' a.CO_JIJUMCODE,a.CO_DEPARTCODE,';
  stSql := stSql + ' d.PO_NAME,a.EM_IMAGE,a.em_handphone ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
{  stSql := stSql + ' Left Join TB_COMPANY b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_GUBUN = ''1'' )';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = c.CO_DEPARTCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''2'' )';  }
  stSql := stSql + ' Left Join TB_POSI d ';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.PO_POSICODE = d.PO_POSICODE ) ';
  stSql := stSql + ' ) b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE )';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + stCardNo + ''' ';

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
    if DBType = 'MSSQL' then
    begin
      JPEGLoadFromDB(FieldByName('EM_IMAGE'), Image1);
    end else
    begin
      stImage := FindField('EM_IMAGE').AsString;
      if FileExists(stImage) then
        Image1.Picture.LoadFromFile(stImage);
    end;
    ed_Emname.Text := FindField('EM_NAME').AsString;
    ed_Emid.Text := FindField('EM_CODE').AsString;
    ed_HPone.Text := FindField('em_handphone').AsString;

    nIndex := CompanyCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString);
    if nIndex > -1 then
      ed_CompanyName.Text := CompanyNameList.Strings[nIndex] ;
    nIndex := JijumCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString);
    if nIndex > -1 then
      ed_JijumName.Text := JijumNameList.Strings[nIndex] ;
    nIndex := DepartCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString + FindField('CO_DEPARTCODE').AsString);
    if nIndex > -1 then
      ed_DepartName.Text := DepartNameList.Strings[nIndex] ;

//    ed_CompanyName.Text := FindField('CO_COMPANYNAME').AsString;
//    ed_DepartName.Text := FindField('CO_DEPARTNAME').AsString;
  end;

end;

procedure TfmMultiMonitoring.ClearEmpInfo;
begin
  Image1.Picture.Graphic := nil;
  ed_Emname.Text := '';
  ed_Companyname.Text := '';
  ed_DepartName.Text := '';
  ed_Emid.Text := '';
end;


procedure TfmMultiMonitoring.sg_IntAccessKeyDown(Sender: TObject; var Key: Word;
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

procedure TfmMultiMonitoring.N19Click(Sender: TObject);
begin
  doorListView.ViewStyle := vsIcon;
  pan_LargeIntro.Visible := True;
  pan_LargeIntro.Align := alClient;
  pan_SmallIntro.Visible := False;
end;

procedure TfmMultiMonitoring.N20Click(Sender: TObject);
begin
  doorListView.ViewStyle := vsList;
  pan_LargeIntro.Visible := False;
  pan_SmallIntro.Visible := True;
  pan_SmallIntro.Align := alClient;

end;

procedure TfmMultiMonitoring.N15Click(Sender: TObject);
begin
  IntDoorListView.ViewStyle := vsIcon;

end;

procedure TfmMultiMonitoring.N16Click(Sender: TObject);
begin
  IntDoorListView.ViewStyle := vsList;

end;

procedure TfmMultiMonitoring.DisConnectDoor(aDoorID: string);
var
  bRefresh:Boolean;
begin
  if DoorCodeList.IndexOf(aDoorID) < 0 then Exit;
  bRefresh := False;

  if doorListView.Items[DoorCodeList.IndexOf(aDoorID)].ImageIndex <> 2 then
  begin
    doorListView.Items[DoorCodeList.IndexOf(aDoorID)].ImageIndex:=2;
    bRefresh := True;
  end;
  if doorListView.Items[DoorCodeList.IndexOf(aDoorID)].StateIndex <> -1 then
  begin
    doorListView.Items[DoorCodeList.IndexOf(aDoorID)].StateIndex := -1;
    bRefresh := true;
  end;
  if PatrolUse then
  begin
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
  end;

  if bRefresh then
  begin
    doorListView.Refresh;
    if PatrolUse then
      IntdoorListView.Refresh;
  end;
end;

procedure TfmMultiMonitoring.DisConnectAlarm(aAlarmID: string);
begin
  if AlarmCodeList.IndexOf(aAlarmID) < 0 then Exit;

  AlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].ImageIndex:=2;
  AlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].StateIndex := -1;
  IntAlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].ImageIndex:=2;
  IntAlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].StateIndex := -1;
  AlarmListView.Refresh;
  IntAlarmListView.Refresh;
end;

procedure TfmMultiMonitoring.mn_LocationMapClick(Sender: TObject);
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
    fmLocationMap.L_stCreateForm := 'TfmMultiMonitoring';
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

procedure TfmMultiMonitoring.CommandArrayCommandsTCommand5Execute(
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

procedure TfmMultiMonitoring.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  stValue : string;
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

  SetLength(DoorIndexArray,sg_Access.ColCount);
  SetLength(relDoorIndexArray,sg_Access.ColCount);
  SetLength(IntDoorIndexArray,sg_IntAccess.ColCount);
  SetLength(relIntDoorIndexArray,sg_IntAccess.ColCount);

  SetLength(AlarmIndexArray,sg_Alarm.ColCount);
  SetLength(relAlarmIndexArray,sg_Alarm.ColCount);
  SetLength(IntAlarmIndexArray,sg_IntAlarm.ColCount);
  SetLength(relIntAlarmIndexArray,sg_IntAlarm.ColCount);

  bLocationMapShow := False;
  bDeviceMapShow := False;
  sg_Alarm.ColWidths[7] := 0;
  sg_IntAlarm.ColWidths[7] := 0;

  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  if UpperCase(ini_fun.ReadString('Monitoring','DeviceTab','tbDEVICE')) = 'TBLOCATE' then PageControl1.ActivePage := tbLOCATE
  else PageControl1.ActivePage := tbDEVICE;
  Panel1.Width := ini_fun.ReadInteger('Monitoring','DeviceWidth',217);

  stValue := ini_fun.ReadString('Monitoring','MonitorTab','AccessTab');
  if UpperCase(stValue) = 'INTEGRATIONTAB' then PageControl2.ActivePage := IntegrationTab
  else if UpperCase(stValue) = 'SENSORTAB' then PageControl2.ActivePage := SensorTab
  else if UpperCase(stValue) = 'FOODTAB' then PageControl2.ActivePage := FoodTab
  else if UpperCase(stValue) = 'ALARMTAB' then PageControl2.ActivePage := AlarmTab
  else PageControl2.ActivePage := AccessTab;

  Panel3.Height := ini_fun.ReadInteger('Monitoring','Access1Height',273);
  Panel6.Width := ini_fun.ReadInteger('Monitoring','EmpWidth',178);

  Panel9.Height := ini_fun.ReadInteger('Monitoring','Alarm1Height',273);
  Panel17.Height := ini_fun.ReadInteger('Monitoring','Sensor1Height',273);

  Panel12.Height := ini_fun.ReadInteger('Monitoring','InitHeight',273);
  Panel14.Width := ini_fun.ReadInteger('Monitoring','Alarm2Width',378);
  Panel15.Height := ini_fun.ReadInteger('Monitoring','Access2Height',144);

  stValue := ini_fun.ReadString('Monitoring','DoorListView','vsIcon');
  if UpperCase(stValue) = 'VSICON' then
  begin
    doorListView.ViewStyle := vsIcon;
    pan_LargeIntro.Visible := True;
    pan_LargeIntro.Align := alClient;
    pan_SmallIntro.Visible := False;
  end  else
  begin
//    doorListView.ViewStyle := vsIcon;
//    doorListView.Refresh;
    doorListView.ViewStyle := vsList;
    pan_LargeIntro.Visible := False;
    pan_SmallIntro.Visible := True;
    pan_SmallIntro.Align := alClient;
  end;

  stValue := ini_fun.ReadString('Monitoring','IntDoorListView','vsIcon');
  if UpperCase(stValue) = 'VSICON' then IntDoorListView.ViewStyle := vsIcon
  else
  begin
//    IntDoorListView.ViewStyle := vsIcon;
//    IntDoorListView.Refresh;
    IntDoorListView.ViewStyle := vsList;
  end;

  ini_fun.Free;

  sg_AccessHeaderNameSet;
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
  doorListView.Items.Clear;
  AlarmListView.Items.Clear;
  SensorListView.Items.Clear;
  IntDoorListView.Items.Clear;
  IntAlarmListView.Items.Clear;

  sg_Access.ColWidths[3] := 0;
  sg_Access.ColWidths[11] := 0;
  sg_IntAccess.ColWidths[3] := 0;
  sg_IntAccess.ColWidths[11] := 0;

  Form_Initialize;
  GridSetting; //�׸��带 ����� ȯ�濡 �°� ������


  pan_ACIntro.Visible := G_bACIntroView;
  pm_CloseMode.Visible := G_bColseModeView;
  pm_IntiCloseMode.Visible := G_bColseModeView;
  Application.ProcessMessages;

end;

procedure TfmMultiMonitoring.N1Click(Sender: TObject);
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
    fmDeviceMap.L_stCreateForm := 'TfmMultiMonitoring';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmMultiMonitoring.N3Click(Sender: TObject);
var
  stDoorID : string;
  stDoorName : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];
  stDoorName := doorListView.Items[doorListView.ItemIndex].Caption;
  
  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stDoorID;
    fmDeviceMap.DeviceName := stDoorName;
    fmDeviceMap.DeviceType := '3';
    fmDeviceMap.L_stCreateForm := 'TfmMultiMonitoring';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmMultiMonitoring.MenuItem4Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];
  stAlarmName := AlarmListView.Items[AlarmListView.ItemIndex].Caption;
  
  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stAlarmID;
    fmDeviceMap.DeviceName := stAlarmName;
    fmDeviceMap.DeviceType := '4';
    fmDeviceMap.L_stCreateForm := 'TfmMultiMonitoring';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmMultiMonitoring.N11Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[IntAlarmListView.ItemIndex];
  stAlarmName := AlarmListView.Items[IntAlarmListView.ItemIndex].Caption;
  
  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stAlarmID;
    fmDeviceMap.DeviceName := stAlarmName;
    fmDeviceMap.DeviceType := '4';
    fmDeviceMap.L_stCreateForm := 'TfmMultiMonitoring';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmMultiMonitoring.N2Click(Sender: TObject);
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

procedure TfmMultiMonitoring.N4Click(Sender: TObject);
var
  stDoorID : string;
  stDoorName : string;
  stLocateName : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID := DoorCodeList[doorListView.ItemIndex];
  stDoorName := doorListView.Items[doorListView.ItemIndex].Caption;
  stLocateName := DoorLocateList.Strings[doorListView.ItemIndex];

  fmDeviceInfo:= TfmDeviceInfo.Create(Self);
  fmDeviceInfo.DeviceID := stDoorID;
  fmDeviceInfo.DeviceName := stDoorName;
  fmDeviceInfo.DeviceType := '3';
  fmDeviceInfo.LocateName := copy(stLocateName,10,length(stLocateName) - 9);
  fmDeviceInfo.SHowmodal;
  fmDeviceInfo.Free;

end;

procedure TfmMultiMonitoring.N12Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
  stLocateName : string;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
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

end;

procedure TfmMultiMonitoring.MenuItem5Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
  stLocateName : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID := AlarmCodeList[AlarmListView.ItemIndex];
  stAlarmName := AlarmListView.Items[AlarmListView.ItemIndex].Caption;
  stLocateName := AlarmLocateList.Strings[AlarmListView.ItemIndex];

  fmDeviceInfo:= TfmDeviceInfo.Create(Self);
  fmDeviceInfo.DeviceID := stAlarmID;
  fmDeviceInfo.DeviceName := stAlarmName;
  fmDeviceInfo.DeviceType := '4';
  fmDeviceInfo.LocateName := copy(stLocateName,10,length(stLocateName) - 9);
  fmDeviceInfo.SHowmodal;
  fmDeviceInfo.Free;

end;

procedure TfmMultiMonitoring.PageControl1Change(Sender: TObject);
begin
  //showmessage(PageControl1.ActivePage.Name);
  UPDATETB_USERCONFIG('MLMONITOR','DEVICETAB',PageControl1.ActivePage.Name)
end;

function TfmMultiMonitoring.UPDATETB_USERCONFIG(aConfigGroup,aConfigID,
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

function TfmMultiMonitoring.InsertTB_USERCONFIG(aConfigGroup,aConfigID,
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

procedure TfmMultiMonitoring.PageControl2Change(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MLMONITOR','WATCHTAB',PageControl2.ActivePage.Name)
end;

procedure TfmMultiMonitoring.Panel1Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MLMONITOR','DEVICEW',inttostr(Panel1.Width))
end;

procedure TfmMultiMonitoring.Panel3Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MLMONITOR','ACCESSH',inttostr(Panel3.Height))
end;

procedure TfmMultiMonitoring.Panel6Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MLMONITOR','ACCESSINFOW',inttostr(Panel6.Width))
end;

procedure TfmMultiMonitoring.Panel9Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MLMONITOR','PATROLH',inttostr(Panel9.Height))
end;

procedure TfmMultiMonitoring.Panel12Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MLMONITOR','INTEGH',inttostr(Panel12.Height))
end;

procedure TfmMultiMonitoring.Panel15Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MLMONITOR','INTATH',inttostr(Panel15.Height))
end;

procedure TfmMultiMonitoring.Panel14Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MLMONITOR','INTPTW',inttostr(Panel14.Width))
end;

procedure TfmMultiMonitoring.Form_Initialize;
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
  stSql := stSql + ' AND US_CONFGROUP = ''MLMONITOR''';

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
      end else if FindField('US_CONFIGID').AsString = 'ACCESSH' then
      begin
        Panel3.Height := FindField('US_VALUE').AsInteger;
      end else if FindField('US_CONFIGID').AsString = 'ACCESSINFOW' then
      begin
        Panel6.Width := FindField('US_VALUE').AsInteger;
      end else if FindField('US_CONFIGID').AsString = 'PATROLH' then
      begin
        Panel9.Height := FindField('US_VALUE').AsInteger;
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

procedure TfmMultiMonitoring.MenuItem1Click(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if AlarmListView.SelCount < 1 then Exit;
  for i := 0 to AlarmListView.Items.Count - 1 do
  begin
    if AlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','�����')
    end;
  end;

end;

procedure TfmMultiMonitoring.MenuItem2Click(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if AlarmListView.SelCount < 1 then Exit;
  for i := 0 to AlarmListView.Items.Count - 1 do
  begin
    if AlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','�������')
    end;
  end;

end;

procedure TfmMultiMonitoring.DeviceConnectStatus(aReceiveData: string);
var
  stNodeNo : string;
  stECUID : string;
  stDoorNo : string;

begin
  Delete(aReceiveData,1,1); //ó�� �� ���ڸ��� R OR C
  stNodeNo := copy(aReceiveData,1,3);
  Delete(aReceiveData,1,3); //���󿡼� �ٿ��� Node ��ȣ
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

procedure TfmMultiMonitoring.AlarmListViewDblClick(Sender: TObject);
var
  nIndex : integer;
  stAlarmID : string;
  nAlarmIndex : integer;
  stAlarmName : string;
  bAlarmConfirm : Boolean;
begin
  if AlarmListView.Selected = nil then Exit;
  // ���⿡�� �ش��ϴ� �˶� ���â ������...
  nIndex := AlarmListView.Selected.Index;
  stAlarmID:= AlarmListView.items[nIndex].SubItems.Strings[0];
  nAlarmIndex := DeviceStateList.IndexOf(stAlarmID);
  if nAlarmIndex < 0 then Exit;
  if ALARMVIEW = 'QUERY' then
  begin
    stAlarmName := AlarmListView.items[nAlarmIndex].Caption;
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
      TDeviceState(DeviceStateList.Objects[nAlarmIndex]).AlaramEventClear;
      AlarmListClear;
      //TDeviceState(DeviceStateList.Objects[nAlarmIndex]).AlaramEventClear;
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMREFRESH'+ DATADELIMITER + '00000' + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
    end;
  end else
  begin
    TDeviceState(DeviceStateList.Objects[nAlarmIndex]).AlaramEventClear;
  end;
end;

procedure TfmMultiMonitoring.IntAlarmListViewDblClick(Sender: TObject);
var
  nIndex : integer;
  stAlarmID : string;
  nAlarmIndex : integer;
  stAlarmName : string;
  bAlarmConfirm : Boolean;
begin
  if IntAlarmListView.Selected = nil then Exit;
  // ���⿡�� �ش��ϴ� �˶� ���â ������...
  nIndex := IntAlarmListView.Selected.Index;
  stAlarmID:= IntAlarmListView.items[nIndex].SubItems.Strings[0];
  nAlarmIndex := DeviceStateList.IndexOf(stAlarmID);
  if nAlarmIndex < 0 then Exit;
  if ALARMVIEW = 'QUERY' then
  begin
    stAlarmName := IntAlarmListView.items[nAlarmIndex].Caption;
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
      TDeviceState(DeviceStateList.Objects[nAlarmIndex]).AlaramEventClear;
      AlarmListClear;
      //TDeviceState(DeviceStateList.Objects[nAlarmIndex]).AlaramEventClear;
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMREFRESH'+ DATADELIMITER + '00000' + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
    end;
  end else
  begin
    TDeviceState(DeviceStateList.Objects[nAlarmIndex]).AlaramEventClear;
  end;
end;

procedure TfmMultiMonitoring.NodeConnectStatus(aReceiveData: string);
var
  stNodeNo : string;
begin
  Delete(aReceiveData,1,2); //ó�� �� ���ڸ��� CN
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

procedure TfmMultiMonitoring.CommandArrayCommandsTCommand6Execute(
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
      DisConnectServer(stID);
    end else if pos('CONNECTED',upperCase(stValue)) > 0 then
    begin
      ConnectServer(stID);
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

procedure TfmMultiMonitoring.ConnectServer(aServerID:string);
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
  nIndex : integer;
  stCaption : string;
begin
  nIndex := DeviceCodeList.IndexOf('S' + aServerID);
  if nIndex < 0 then Exit;
  stCaption := DeviceCaptionList.Strings[nIndex];

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  aNode.ImageIndex:=0;
  aNode.SelectedIndex:=0;
  aNode.StateIndex:= 0;
  aTreeView.Refresh;

end;

procedure TfmMultiMonitoring.DisConnectServer(aServerID:string);
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
  nIndex : integer;
  stCaption : string;
  i : integer;
begin
  nIndex := DeviceCodeList.IndexOf('S' + aServerID);
  if nIndex < 0 then Exit;
  stCaption := DeviceCaptionList.Strings[nIndex];

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  aNode.ImageIndex:=14;
  aNode.SelectedIndex:=14;
  aNode.StateIndex:= -1;
  for i :=0 to DeviceCodeList.Count - 1 do
  begin
    if copy(DeviceCodeList.Strings[i],1,1) = 'N' then
    begin
      if copy(DeviceCodeList.Strings[i],2,5) = aServerID then
          DisConnectNode(DeviceCodeList.Strings[i]);
    end;
  end;
  aTreeView.Refresh;

end;

procedure TfmMultiMonitoring.MenuItem11Click(Sender: TObject);
var
  stStatusCode : string;
  stPort : string;
  nPos : integer;
  stNodeNo : string;
  stEcuID : string;
  nAlarmNo : integer;
  stAlarmName : string;
begin
  stStatusCode := sg_Alarm.Cells[5,sg_Alarm.row];
  if stStatusCode = '' then Exit;
  nPos := Pos('/',stStatusCode);
  stPort := Trim(copy(stStatusCode,nPos + 1,Length(stStatusCode) - nPos));
  if Not IsDigit(stPort) then Exit;
  
  stNodeNo := copy(sg_Alarm.Cells[7,sg_Alarm.row],1,3);
  stEcuID := copy(sg_Alarm.Cells[7,sg_Alarm.row],4,2);
  //nAlarmNo := GetAlarmNO(stNodeNo,stEcuID);
  //if nAlarmNo = 0 then Exit;
  stAlarmName := sg_Alarm.Cells[2,sg_Alarm.row];

  fmZonePosition:= TfmZonePosition.Create(Self);
  //fmZonePosition.nAL_ALARMNO := nAlarmNo;
  fmZonePosition.stAC_NODENO := stNodeNo;
  fmZonePosition.stAC_ECUID := stEcuID;
  fmZonePosition.stPortNo := stPort;
  fmZonePosition.stDeviceName  := stAlarmName;

  fmZonePosition.ShowModal;
  fmZonePosition.Free;

end;

function TfmMultiMonitoring.GetAlarmNO(aNodeNo, aEcuID: string): integer;
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

procedure TfmMultiMonitoring.MenuItem6Click(Sender: TObject);
var
  stStatusCode : string;
  stPort : string;
  nPos : integer;
  stNodeNo : string;
  stEcuID : string;
  nAlarmNo : integer;
  stAlarmName : string;
begin
  stStatusCode := sg_IntAlarm.Cells[5,sg_IntAlarm.row];
  if stStatusCode = '' then Exit;
  nPos := Pos('/',stStatusCode);
  stPort := Trim(copy(stStatusCode,nPos + 1,Length(stStatusCode) - nPos));
  if Not IsDigit(stPort) then Exit;
  
  stNodeNo := copy(sg_IntAlarm.Cells[7,sg_IntAlarm.row],1,3);
  stEcuID := copy(sg_IntAlarm.Cells[7,sg_IntAlarm.row],4,2);
  //nAlarmNo := GetAlarmNO(stNodeNo,stEcuID);
  //if nAlarmNo = 0 then Exit;
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

procedure TfmMultiMonitoring.SensorLoad(aBuildingCode, aFloorCode,
  aAreaCode: string;SensorList:TListView);
var
  stSql : string;
  stSensorID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
begin
  if L_bClose then Exit;
  SensorCodeList.Clear;
  SensorList.Clear;
  //Alarm���� �ε�
  stSql := ' Select d.AL_VIEWSEQ,a.AL_ZONENUM,a.AL_ZONESTOP,';
  stSql := stSql + ' a.AC_NODENO,a.AC_ECUID,a.AL_ZONENAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  stSql := stSql + ' From TB_ZONEDEVICE a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
    end;
  end;
  stSql := stSql + ' Inner Join TB_ALARMDEVICE d';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE  ';
  stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID ) ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (c.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND c.AC_NODENO= d.AC_NODENO ';
  stSql := stSql + ' AND c.AC_ECUID = d.AC_ECUID ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_ZONEUSE = ''Y'' ';
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
//  stSql := stSql + ' Group by a.AL_VIEWSEQ,a.AL_DEVICENO,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AL_ZONENAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  stSql := stSql + ' Order by d.AL_VIEWSEQ,a.AC_NODENO,a.AC_ECUID,a.AL_ZONENUM ';

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
      SensorTab.TabVisible := False;
      Exit;
    end;
    SensorTab.TabVisible := True;

    First;
    i:=0;
    While Not Eof do
    begin
      if L_bClose then Exit;
      SensorList.Items.Add.Caption:= FindField('AL_ZONENAME').asString;
      stSensorID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                 + FindField('AC_ECUID').AsString
                 + FindField('AL_ZONENUM').AsString ;// + FillZeroNumber(FindField('AL_DEVICENO').AsInteger,3);
      SensorList.Items[I].SubItems.Add(stSensorID);     // ���� ID
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
      //AlarmLocateList.Add(stLocate);

      SensorList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3)); //����ȣ
      SensorList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
      SensorList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString ); //�˶����̵�
      SensorList.Items[I].SubItems.Add(FindField('AL_ZONENUM').AsString); //����ȣ
      SensorList.Items[I].SubItems.Add(FindField('AL_ZONESTOP').AsString); //ZONESTOP ������ ����
      if FindField('AL_ZONESTOP').AsString = 'N' then
        SensorList.Items[I].ImageIndex:=2
      else SensorList.Items[I].ImageIndex:=13;

      inc(i);
      Application.ProcessMessages;
      Next;
    end;
  end;
  SensorCodeList.Clear;
  for i:=0 to sensorList.Items.Count - 1 do
  begin
    SensorCodeList.Add(sensorList.Items[I].SubItems.Strings[0]);  //���������� �ڵ带 �������
  end;

end;

procedure TfmMultiMonitoring.Action_SensorLoadExecute(Sender: TObject);
begin
  if SensorUse then SensorLoad('000','000','000',SensorListView);
end;

procedure TfmMultiMonitoring.MenuItem12Click(Sender: TObject);
var
  stSensorID : string;
begin
  if SensorListView.SelCount < 1 then Exit;
  stSensorID:= SensorCodeList[SensorListView.ItemIndex];
  SensorListView.Items[SensorListView.ItemIndex].ImageIndex := 2;
  SensorListView.Items[SensorListView.ItemIndex].SubItems.Strings[5] := 'N';
  updateTB_ZONEDEVICEState(SensorListView.Items[SensorListView.ItemIndex].SubItems.Strings[3],
                           SensorListView.Items[SensorListView.ItemIndex].SubItems.Strings[4],
                           'N');

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + copy(stSensorID,1,5) + DATADELIMITER; //�������üũ
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

function TfmMultiMonitoring.updateTB_ZONEDEVICEState(aAlarmNo, aZoneNum,
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

procedure TfmMultiMonitoring.MenuItem13Click(Sender: TObject);
var
  stSensorID : string;
begin
  if SensorListView.SelCount < 1 then Exit;
  stSensorID:= SensorCodeList[SensorListView.ItemIndex];
  SensorListView.Items[SensorListView.ItemIndex].ImageIndex := 13;
  SensorListView.Items[SensorListView.ItemIndex].SubItems.Strings[5] := 'Y';
  updateTB_ZONEDEVICEState(SensorListView.Items[SensorListView.ItemIndex].SubItems.Strings[3],
                           SensorListView.Items[SensorListView.ItemIndex].SubItems.Strings[4], 
                           'Y');

end;

procedure TfmMultiMonitoring.SensorListViewDblClick(Sender: TObject);
begin
  if SensorListView.Items[SensorListView.ItemIndex].ImageIndex = 14 then SensorListView.Items[SensorListView.ItemIndex].ImageIndex := 13;
end;

procedure TfmMultiMonitoring.DisplaySensorState(aNodeNo, aECUID,aPortNo, aMode,aSubCLass,
  aStatusCode: string;bZoneSensor:Boolean);
var
  i : integer;
  stZoneCode:string;
begin

  stZoneCode := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  for i := 0 to SensorCodeList.Count - 1 do
  begin
    if copy(SensorCodeList.Strings[i],1,5) = stZoneCode then
    begin
      if SensorListView.Items[i].ImageIndex = 2 then  //��� ���� ���¿����� �������� �ٲ� ����.
         SensorListView.Items[i].ImageIndex:= 13;
      if bZoneSensor then //���������̸�
      begin
        if SensorListView.Items[i].SubItems[4] = inttostr(strtoint(aPortNo)) then
        begin  //�ش� �������̸�
          SensorListView.Items[i].ImageIndex:= 14; //����ǥ��
        end;
      end;
      if (aSubCLass = 'MN') or (aSubCLass = 'EX')then  //���� �Ǵ� Ȯ��� �� ����̻��̸�
      begin
        if aStatusCode = 'NF' then
        begin
          if SensorListView.Items[i].SubItems[5] = 'N' then
             SensorListView.Items[i].ImageIndex := 2;
        end;
      end;
    end;
  end;

end;

function TfmMultiMonitoring.CheckSchedule(aNodeNo, aECUID,
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

function TfmMultiMonitoring.GetPortName(aNodeNo, aECUID,
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

procedure TfmMultiMonitoring.Insertsg_SensorList(aTime,aNodeNo, aECUID, aPortNo,
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
    Cells[0,1] := aTime;   //�߻��ð�
    Cells[1,1] := stLocateName;
    Cells[2,1] := aPortName ; //������Ī
    Cells[3,1] := aECUID; //����ġ��ȣ
    Cells[4,1] := aDeviceType; //
    Cells[5,1] := aStatusCode + '/' + aPortNo; //
    Cells[6,1] := aStatusName; //

  end;

end;

procedure TfmMultiMonitoring.ECUDataProcess(aNodeNo, aECUID, aTYPE, aACTION,
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
  end else if aTYPE = 'AC' then //���� ������
  begin
    ACDataProcess(aNodeNo,aECUID,aData);
  end else if aTYPE = 'AL' then //��ü ������
  begin
    DEVICEDataProcess(aNodeNo,aECUID,aData);
  end;

end;

procedure TfmMultiMonitoring.NODEDataProcess(aNodeNo, aTYPE, aACTION,
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

procedure TfmMultiMonitoring.DEVICEDataProcess(aNodeNo, aECUID, aData: string);
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

  // ���⿡�� ȭ�鿡 ���÷��� �� ����... ������ �м��ؼ�...^^

  case cCMD of
    'A': begin // �˶� ������
           DeviceRcvAlarmData(aNodeNo,aData);
         end;

    'c': begin      //ī�嵥���� ó��
           //Connected:= True;
           MSG_Code:= aData[19];
           case MSG_Code of
             'E' ://ī�� ������(����) ó��
                begin
                   RcvCardReadData(aNodeNo,aData);
                end;
             'D' ://�� ���� ���� ó��
                begin
                  RcvChangeDoorData(aNodeNo,aData);
                end;
             'c' ://������ ����
                begin
                  RcvDoorControl(aNodeNo,aData);
                end;
             'a','b'://�������� ��� ����
                begin
                  //RcvDoorSetup(Self,aData);
                end;
             'l','m','n':// ī�� ������ ��� ����
                begin
                  //RcvRegCardData(Self,aData);
                end;
           end;
         end;
  end;
end;

procedure TfmMultiMonitoring.DoorDataProcess(aNodeNo, aEcuID, aDoorNo, aType,
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

  if nIndex < 0 then Exit; // ���� ������ ����
  if aType = 'DV' then
  begin
    if aAction = 'S' then
    begin
      cDoorMode := aData[1];
      cDoorMode2 := aData[2];
      cDoorState := aData[3];

      if cDoorMode2 = '0' then    // Positive �̸�
      begin
        Case cDoorMode of
          '0':       //����
          begin
            if doorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
            doorListView.Items[nIndex].StateIndex:= 0;
            if PatrolUse then
              IntdoorListView.Items[nIndex].StateIndex:= 0;
          end;
          else
          begin
            if doorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
            doorListView.Items[nIndex].StateIndex:= -1;
            if PatrolUse then
              IntdoorListView.Items[nIndex].StateIndex:= -1;
          end;
        end;
      end else
      begin
        Case cDoorMode of
          '0':
          begin
            if doorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
            doorListView.Items[nIndex].StateIndex:= 1;
            if PatrolUse then
              IntdoorListView.Items[nIndex].StateIndex:= 1;
          end;
          else
          begin
            if doorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
            doorListView.Items[nIndex].StateIndex:= -1;
            if PatrolUse then
              IntdoorListView.Items[nIndex].StateIndex:= -1;
          end;
        end;

      end;

      case cDoorState of
        'C': //����
          begin
            if doorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
            doorListView.Items[nIndex].ImageIndex:=0;
            if PatrolUse then
              IntdoorListView.Items[nIndex].ImageIndex:=0;
          end;
        'O': //����
          begin
            if doorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
            doorListView.Items[nIndex].ImageIndex:=1;
            if PatrolUse then
              IntdoorListView.Items[nIndex].ImageIndex:=1;
          end;
        'E': //����
          begin
            if doorListView.Items[nIndex].ImageIndex <> 2 then bRefresh := True;
            doorListView.Items[nIndex].ImageIndex:=2;
            if PatrolUse then
              IntdoorListView.Items[nIndex].ImageIndex:=2;
          end;
        'T'://��ð� ����
          begin
            //stTimeStr:= '20'+ Copy(stTime,1,2)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            //          Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
            //st:= doorListView.Items[nIndex].Caption;
            //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '��ð� ����');
          end;
        'U'://�����̻�
          begin
            //stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            //          Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
            //st:= doorListView.Items[nIndex].Caption;
            //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '������ ����');
          end;
        'L'://�����̻�
          begin
            //stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            //          Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
            //st:= doorListView.Items[nIndex].Caption;
            //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '���ݱ� ����');
          end;
      end;
      if bRefresh then
      begin
        doorListView.Refresh;
        if PatrolUse then IntdoorListView.Refresh;
      end;

{      //��ġ ���� ������ Map �� ���� ǥ��
      for i := 0 to LocationMapList.Count - 1 do
      begin
        TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(aNodeNo,aEcuID,aDoorNo,cDoorMode,cDoorState,cDoorMode2);
      end;   }
    end;
  end;  
end;

procedure TfmMultiMonitoring.AlarmDataProcess(aNodeNo, aEcuID, aType, aACTION,
  aData: string);
var
  nImageIndex : integer;
  nIndex : integer;
begin
  nIndex := AlarmCodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID );

  if nIndex < 0 then Exit;// ���� ������ ����

  if aType = 'DV' then //�������
  begin
    if aAction = 'S' then //��������
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

      AlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
      IntAlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
    end;
  end else if aType = 'PT' then  //Alarm �߻� ��ü����
  begin
    DeviceRcvAlarmData(aNodeNo,aData);
  end else if aType = 'AL' then  //��ü����
  begin
    DeviceRcvAlarmData(aNodeNo,aData);
  end;

end;

procedure TfmMultiMonitoring.ACDataProcess(aNodeNo, aECUID, aData: string);
begin
  RcvCardReadData(aNodeNo,aData);
end;

procedure TfmMultiMonitoring.FormActivate(Sender: TObject);
begin
  if L_bFirst then
  begin
    L_bFirst := False;
    self.FindSubForm('Main').FindCommand('MULTIMONITOR').Params.Values['VALUE'] := 'TRUE';
    self.FindSubForm('Main').FindCommand('MULTIMONITOR').Execute;
    if ALARMVIEW = 'QUERY' then
    begin
      SearchAlarmList;
    end;
  end;

end;

procedure TfmMultiMonitoring.SearchAlarmList;
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
  GridInitialize(sg_Alarm);
  GridInitialize(sg_IntAlarm);
  stDate := FormatDateTime('yyyymmdd',now - G_nAlarmRefreshDate);

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else if DBTYPE = 'MSSQL' then stSql := MsSql.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else if DBTYPE = 'FB' then stSql := FireBird.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else Exit;

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
    sg_Alarm.RowCount := recordCount + 1;
    sg_IntAlarm.RowCount := recordCount + 1;
    while Not Eof do
    begin
      nIndex := AlarmCodeList.IndexOf(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString );

      if nIndex > -1 then
      begin
        stTime :=  copy(FindField('AL_DATE').AsString,1,4) + '-' +
                   copy(FindField('AL_DATE').AsString,5,2) + '-' +
                   copy(FindField('AL_DATE').AsString,7,2) + ' ' +
                   copy(FindField('AL_TIME').AsString,1,2) + ':' +
                   copy(FindField('AL_TIME').AsString,3,2) + ':' +
                   copy(FindField('AL_TIME').AsString,5,2);
        stLocate := AlarmLocateList.Strings[nIndex]; //��豸�� ��ġ
        stAlarmName:= AlarmListView.Items[nIndex].Caption; // ��豸�� ��
        stEcuID := FindField('AC_ECUID').AsString;
        stDeviceType:=  FindField('AL_ALARMDEVICETYPECODE').AsString +'['+ FindField('AL_SUBADDR').AsString + ']';
        stStatusCode := FindField('AL_ALARMSTATUSCODE').AsString;
        stStatusName := FindField('AL_ALARMNAME').AsString;
        if stStatusName = '' then stStatusName := stStatusCode;
        if IsDigit(FindField('AL_ZONENO').AsString) then
        begin
          stPortName := GetPortName(inttostr(FindField('AC_NodeNo').asinteger),FindField('AC_ECUID').AsString,FindField('AL_ZONENO').AsString );
          if stPortName = '' then stPortName := FindField('AL_ZONENO').AsString;
          stStatusName := '[' + stPortName + ']' + stStatusName;    //� �������� ���� �Ǿ����� ǥ��
        end;
        stGRADE := inttostr(FindField('AL_ALARMGRADE').AsInteger);

        with sg_Alarm do
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
        sg_Alarm.RowCount := sg_Alarm.RowCount - 1;
        sg_IntAlarm.RowCount := sg_IntAlarm.RowCount - 1;
      end;
      next;
    end;
  end;

end;

procedure TfmMultiMonitoring.sg_IntAlarmDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  stNodeNo,stEcuId:string;
  stAlarmdevicetypecode, stSubaddr :string;
  stZonecode, stZoneno, stAlarmstatuscode :string;
begin
  if ALARMVIEW <> 'QUERY' then
  begin
    if Sender = sg_IntAlarm then Action_intAlarmHistoryExecute(Action_intAlarmHistory)
    else Action_AlarmHistoryExecute(Action_AlarmHistory);
    Exit;
  End;

  with (Sender as TStringGrid) do
  begin
    stNodeNo := inttostr(strtoint(copy(cells[8,ARow],1,3)));
    stEcuId := copy(cells[8,ARow],4,2);
    stAlarmdevicetypecode := copy(cells[8,ARow],6,2);
    stSubaddr := copy(cells[8,ARow],8,2);
    stZonecode := copy(cells[8,ARow],10,2);
    stZoneno := copy(cells[8,ARow],12,2);
    stAlarmstatuscode := copy(cells[8,ARow],14,2);
    fmAlarmSet:= TfmAlarmSet.Create(Self);
    fmAlarmSet.ed_AlarmName.Text := Cells[2,ARow];
    fmAlarmSet.ed_AlarmCode.Text := Cells[5,ARow];
    fmAlarmSet.ed_AlarmContent.Text := Cells[6,ARow];
    fmAlarmSet.L_stNodeNo := stNodeNo;
    fmAlarmSet.L_stEcuID := stEcuID;
    fmAlarmSet.L_stAlarmdevicetypecode := stAlarmdevicetypecode;
    fmAlarmSet.L_stSubaddr := stSubaddr;
    fmAlarmSet.L_stZonecode := stZoneCode;
    fmAlarmSet.L_stZoneno := stZoneNo;
    fmAlarmSet.L_stAlarmstatuscode := stAlarmstatuscode;
    fmAlarmSet.SHowmodal;
    fmAlarmSet.Free;
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMREFRESH';
    self.FindSubForm('Main').FindCommand('SendData').Execute;
  end;



end;

procedure TfmMultiMonitoring.CommandArrayCommandsTCommand7Execute(
  Command: TCommand; Params: TStringList);
begin
  if IsInsertGrade or IsUpdateGrade  then
  begin
    doorListView.PopupMenu := PopupMenu_Door;
    AlarmListView.PopupMenu := PopupMenu_Alarm;
    SensorListView.PopupMenu := PopupMenu_Sensor;
    if PatrolUse then
      IntDoorListView.PopupMenu := PopupMenu_IntiDoor;
    IntAlarmListView.PopupMenu := PopupMenu_IntAlarm;
  end
  else
  begin
    TreeView_Device.PopupMenu := nil;
    doorListView.PopupMenu := nil;
    AlarmListView.PopupMenu := nil;
    SensorListView.PopupMenu := nil;
    IntDoorListView.PopupMenu := nil;
    IntAlarmListView.PopupMenu := nil;
  end;
end;

procedure TfmMultiMonitoring.sg_AccessColumnMove(Sender: TObject; ACol: Integer;
  var Allow: Boolean);
begin
//  if Allow then showmessage(inttostr(aCol));

end;

procedure TfmMultiMonitoring.sg_AccessColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeDoorIndex(FromIndex,ToIndex);
end;

procedure TfmMultiMonitoring.GridSetting;
var
  i : integer;
begin
  for i:=0 to sg_Access.ColCount - 1 do
  begin
    DoorIndexArray[i] := i;
    relDoorIndexArray[i] := i;
  end;
  for i:=0 to sg_IntAccess.ColCount - 1 do
  begin
    IntDoorIndexArray[i] := i;
    relIntDoorIndexArray[i] := i;
  end;
  for i:=0 to sg_Alarm.ColCount - 1 do
  begin
    AlarmIndexArray[i] := i;
    relAlarmIndexArray[i] := i;
  end;
  for i:=0 to sg_IntAlarm.ColCount - 1 do
  begin
    IntAlarmIndexArray[i] := i;
    relIntAlarmIndexArray[i] := i;
  end;


{
  for i:=0 to sg_Access.ColCount - 1 do
  begin
    sg_Access.Cells[i,0] := DoorHeaderArray[i];
  end;
  }
end;

procedure TfmMultiMonitoring.ChangeDoorIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := relDoorIndexArray[FromIndex];
  if FromIndex > ToIndex then   //�ڿ� �ִ� ���� ������ ���� ���
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      relDoorIndexArray[i] := relDoorIndexArray[i - 1];
    end;
    relDoorIndexArray[ToIndex] := nChangData;
  end else   //�տ� �ִ� ���� �ڷ� ���� ���
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

procedure TfmMultiMonitoring.ChangeIntDoorIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := relIntDoorIndexArray[FromIndex];
  if FromIndex > ToIndex then   //�ڿ� �ִ� ���� ������ ���� ���
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      relIntDoorIndexArray[i] := relIntDoorIndexArray[i - 1];
    end;
    relIntDoorIndexArray[ToIndex] := nChangData;
  end else   //�տ� �ִ� ���� �ڷ� ���� ���
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

procedure TfmMultiMonitoring.sg_IntAccessColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeIntDoorIndex(FromIndex,ToIndex);
end;

procedure TfmMultiMonitoring.ChangeAlarmIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := relAlarmIndexArray[FromIndex];
  if FromIndex > ToIndex then   //�ڿ� �ִ� ���� ������ ���� ���
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      relAlarmIndexArray[i] := relAlarmIndexArray[i - 1];
    end;
    relAlarmIndexArray[ToIndex] := nChangData;
  end else   //�տ� �ִ� ���� �ڷ� ���� ���
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

procedure TfmMultiMonitoring.ChangeIntAlarmIndex(FromIndex, ToIndex: integer);
var
  i : integer;
  nChangData : integer;
begin
  nChangData := relIntAlarmIndexArray[FromIndex];
  if FromIndex > ToIndex then   //�ڿ� �ִ� ���� ������ ���� ���
  begin
    for i := FromIndex downto ToIndex + 1 do
    begin
      relIntAlarmIndexArray[i] := relIntAlarmIndexArray[i - 1];
    end;
    relIntAlarmIndexArray[ToIndex] := nChangData;
  end else   //�տ� �ִ� ���� �ڷ� ���� ���
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

procedure TfmMultiMonitoring.sg_IntAlarmColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeIntAlarmIndex(FromIndex,ToIndex);
end;

procedure TfmMultiMonitoring.sg_AlarmColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeAlarmIndex(FromIndex,ToIndex);

end;

procedure TfmMultiMonitoring.sg_AccessHeaderNameSet;
begin
  with sg_Access do
  begin
    cells[0,0] := '�߻�����';
    cells[1,0] := '��ġ';
    cells[2,0] := '���Թ�';
    cells[3,0] := '�����ڵ�';
    cells[4,0] := '���λ���';
    cells[5,0] := 'ī���ȣ';
    cells[6,0] := '�����ڸ�';
    cells[7,0] := FM002;
    cells[8,0] := FM012;
    cells[9,0] := FM022;
    cells[10,0] := FM101;
  end;
  with sg_IntAccess do
  begin
    cells[0,0] := '�߻�����';
    cells[1,0] := '��ġ';
    cells[2,0] := '���Թ�';
    cells[3,0] := '�����ڵ�';
    cells[4,0] := '���λ���';
    cells[5,0] := 'ī���ȣ';
    cells[6,0] := '�����ڸ�';
    cells[7,0] := FM002;
    cells[8,0] := FM012;
    cells[9,0] := FM022;
    cells[10,0] := FM101;
  end;
end;

procedure TfmMultiMonitoring.doorListViewDblClick(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
end;

procedure TfmMultiMonitoring.IntDoorListViewDblClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMultiMonitoring.RcvMessage(aMessage: string;aDaemonNo:integer);
var
  stReceiveData: string;
  stNodeNo,stECUID,stDoorNo,stReaderNo : string;
  aCommand : char;
  MSG_Code: Char;
  stDevice : string; //S:����,E:ECU,D:Door,
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
  //Delete(stReceiveData,1,1); //ó�� �� ���ڸ��� R
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

  if stDevice = 'S' then     //�������� �ִ� ������ ó��
  begin
    if UpperCase(stData) = 'RESTART' then
    begin
      Action_ReloadExecute(Self);
      Exit;
    end;
  end else if stDevice = 'N' then //��� ������ ó��
  begin
    NODEDataProcess(stNodeNo,stTYPE,stACTION,stData);
  end else if stDevice = 'E' then //��� ������ ó��
  begin
    ECUDataProcess(stNodeNo,stECUID,stTYPE,stACTION,stData);
  end else if stDevice = 'D' then //���Թ� ������ ó��
  begin
    DoorDataProcess(stNodeNo,stEcuID,stDoorNo,stType,stACTION,stData);
  end else if stDevice = 'R' then //���� ������ ó��
  begin
  end else if stDevice = 'A' then //�˶� ������ ó��
  begin
    AlarmDataProcess(stNodeNo,stEcuID,stType,stACTION,stData);
  end;
end;

procedure TfmMultiMonitoring.LoadJijumCode;
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


procedure TfmMultiMonitoring.Action_intAlarmHistoryExecute(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  nAlarmNo : integer;
  stAlarmName : string;
begin

  stNodeNo := copy(sg_IntAlarm.Cells[7,sg_IntAlarm.row],1,3);
  stEcuID := copy(sg_IntAlarm.Cells[7,sg_IntAlarm.row],4,2);
  stAlarmName := sg_IntAlarm.Cells[2,sg_IntAlarm.row];
  if (stNodeNo = '') or (stEcuID = '') then Exit;

  Try
    Try
      fmAlarmHistory:= TfmAlarmHistory.Create(Self);
    Except
      Exit;
    End;
    fmAlarmHistory.stAC_NODENO := stNodeNo;
    fmAlarmHistory.stAC_ECUID := stEcuID;
    fmAlarmHistory.stDeviceName  := stAlarmName + ' ';

    fmAlarmHistory.ShowModal;
  Finally
    fmAlarmHistory.Free;
  End;
end;

procedure TfmMultiMonitoring.Action_AlarmHistoryExecute(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  nAlarmNo : integer;
  stAlarmName : string;
begin

  stNodeNo := copy(sg_Alarm.Cells[7,sg_Alarm.row],1,3);
  stEcuID := copy(sg_Alarm.Cells[7,sg_Alarm.row],4,2);
  stAlarmName := sg_Alarm.Cells[2,sg_Alarm.row];
  if (stNodeNo = '') or (stEcuID = '') then Exit;

  fmAlarmHistory:= TfmAlarmHistory.Create(Self);
  fmAlarmHistory.stAC_NODENO := stNodeNo;
  fmAlarmHistory.stAC_ECUID := stEcuID;
  fmAlarmHistory.stDeviceName  := stAlarmName + ' ';

  fmAlarmHistory.ShowModal;
  fmAlarmHistory.Free;
end;

procedure TfmMultiMonitoring.sg_AccessDblClick(Sender: TObject);
var
  stDoorNo : string;
  nIndex : integer;
begin
  stDoorNo := sg_Access.Cells[DoorIndexArray[10],sg_Access.Row];
  if stDoorNo = '' then Exit;
  nIndex:= DoorCodeList.IndexOf(stDoorNo);
  if nIndex > -1 then
  begin
    doorListView.Items[nIndex].Selected := True;
    doorListView.SetFocus;
  end;

end;

procedure TfmMultiMonitoring.sg_IntAccessDblClick(Sender: TObject);
var
  stDoorNo : string;
  nIndex : integer;
begin
  stDoorNo := sg_IntAccess.Cells[IntDoorIndexArray[10],sg_IntAccess.Row];
  if stDoorNo = '' then Exit;
  nIndex:= intDoorCodeList.IndexOf(stDoorNo);
  if nIndex > -1 then
  begin
    IntDoorListView.Items[nIndex].Selected := True;
    IntDoorListView.SetFocus;
  end;

end;

procedure TfmMultiMonitoring.AllStateCheck;
begin
  GetServerState;
//  if IsMaster then
  begin
    self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['DAEMON'] := '00000';
    self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['NODENO'] := '000';
    self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['ECUID'] := '00';
    self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['DOORID'] := '0';
    self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['COMMAND'] := 'STATECHECK';
    self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['DATA'] := '';
    self.FindSubForm('Main').FindCommand('MULTISEND').Execute;

    if PatrolUse then
    begin
      self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['DAEMON'] := '00000';
      self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['NODENO'] := '000';
      self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['ECUID'] := '00';
      self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['DOORID'] := '0';
      self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['COMMAND'] := 'ALARMCHECK';
      self.FindSubForm('Main').FindCommand('MULTISEND').Params.Values['DATA'] := '';
      self.FindSubForm('Main').FindCommand('MULTISEND').Execute;
    end;
    Exit;
  end;
end;

procedure TfmMultiMonitoring.GetServerState;
begin
  self.FindSubForm('Main').FindCommand('SERVERSTATE').Execute;

end;

procedure TfmMultiMonitoring.CommandArrayCommandsTFIRERECOVERExecute(
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

procedure TfmMultiMonitoring.pm_CloseModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if doorListView.SelCount < 1 then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    Application.MessageBox(PChar('ȭ��߻��ÿ��� ȭ�� ���� �Ϸ� �Ŀ� ����� �����մϴ�.'),'����',MB_OK);
    Exit;
  end;
  for i := 0 to doorListView.Items.Count - 1 do
  begin
    if doorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CLOSEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','�����')
    end;
  end;

end;

procedure TfmMultiMonitoring.pm_IntiCloseModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  if DataModule1.CheckFireOrgin then
  begin
    Application.MessageBox(PChar('ȭ��߻��ÿ��� ȭ�� ���� �Ϸ� �Ŀ� ����� �����մϴ�.'),'����',MB_OK);
    Exit;
  end;
  for i := 0 to IntdoorListView.Items.Count - 1 do
  begin
    if IntdoorListView.Items[i].Selected then
    begin
      stDoorID:= DoorCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CLOSEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','�����')
    end;
  end;

end;

procedure TfmMultiMonitoring.DoorFireStateChange(NodeNo: integer; aEcuID,
  aDoorNo: string; aFireState: Boolean);
var
  stDoorID : string;
  nDoorIndex : integer;
begin
  if Not aFireState then Exit;
  stDoorID := FillZeroNumber(NodeNo,3) + aEcuID + aDoorNo;
  nDoorIndex:= DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then Exit;

  if DoorListView.Items[nDoorIndex].ImageIndex <> DoorFireStateImageIndex then
  begin
    DoorListView.Items[nDoorIndex].ImageIndex := DoorFireStateImageIndex;
    DoorListView.Refresh;
    if PatrolUse then
    begin
      IntdoorListView.Items[nDoorIndex].StateIndex:= DoorFireStateImageIndex;
      IntdoorListView.Refresh;
    end;
  end;

end;

procedure TfmMultiMonitoring.DoorStateChange(NodeNo: integer; aEcuID,
  aDoorNo: string; aDoorManageType: TDoorManageMode;
  aDoorPNType: TDoorPNMode; aDoorStateType: TDoorState;
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
    DoorListView.Items[nDoorIndex].ImageIndex:= DoorCloseStateImageIndex;
    if PatrolUse then IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorCloseStateImageIndex;
  end else if aDoorStateType = dsOpen then
  begin
    DoorListView.Items[nDoorIndex].ImageIndex:= DoorOpenStateImageIndex;
    if PatrolUse then IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorOpenStateImageIndex;
  end else if aDoorStateType = dsLongTime then
  begin
    DoorListView.Items[nDoorIndex].ImageIndex:= DoorLongTimeStateImageIndex;
    if PatrolUse then IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorLongTimeStateImageIndex;
  end else
  begin
    DoorListView.Items[nDoorIndex].ImageIndex:= DoorNothingStateImageIndex;
    if PatrolUse then IntdoorListView.Items[nDoorIndex].ImageIndex:= DoorNothingStateImageIndex;
  end;

  if aDoorPNType = pnPositive then
  begin
    if  aDoorManageType = dmManager then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorPosiManageStateIndex;
      if PatrolUse then IntdoorListView.Items[nDoorIndex].StateIndex:= DoorPosiManageStateIndex;
    end else if aDoorManageType = dmOpen then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorOpenModeStateIndex;
      if PatrolUse then IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
    end else if aDoorManageType = dmLock then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorCloseModeStateIndex;
      if PatrolUse then IntdoorListView.Items[nDoorIndex].StateIndex:= DoorCloseModeStateIndex;
    end else
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorOpenModeStateIndex;
      if PatrolUse then IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
    end;
  end else if aDoorPNType = pnNegative then
  begin
    if  aDoorManageType = dmManager then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorNegaManageStateIndex;
      if PatrolUse then IntdoorListView.Items[nDoorIndex].StateIndex:= DoorNegaManageStateIndex;
    end else if aDoorManageType = dmOpen then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorOpenModeStateIndex;
      if PatrolUse then IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
    end else if aDoorManageType = dmLock then
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorCloseModeStateIndex;
      if PatrolUse then IntdoorListView.Items[nDoorIndex].StateIndex:= DoorCloseModeStateIndex;
    end else
    begin
      DoorListView.Items[nDoorIndex].StateIndex := DoorOpenModeStateIndex;
      if PatrolUse then IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
    end;
  end else
  begin
    DoorListView.Items[nDoorIndex].StateIndex := DoorOpenModeStateIndex;
    if PatrolUse then IntdoorListView.Items[nDoorIndex].StateIndex:= DoorOpenModeStateIndex;
  end;
  DoorListView.Refresh;
  if PatrolUse then IntdoorListView.Refresh;

end;

procedure TfmMultiMonitoring.DeviceConnected(NodeNo: integer;
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

procedure TfmMultiMonitoring.AlarmModeChanged(NodeNo: integer;
  aEcuID: string; aWachMode: TWatchMode);
var
  nAlarmIndex : integer;
  stDeviceID : string;
begin
  nAlarmIndex := AlarmCodeList.IndexOf(FillzeroNumber(NodeNo,3) + aEcuID );
  if nAlarmIndex < 0 then Exit;// ���� ������ ����

  case aWachMode of
    cmNothing :
      begin
        AlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmNothingStateImageIndex;
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmNothingStateImageIndex;
      end;
    cmArm :
      begin
        AlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmModeStateImageIndex;
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmModeStateImageIndex;
      end;
    cmDisarm :
      begin
        AlarmListView.Items[nAlarmIndex].ImageIndex:= DisAlarmModeStateImageIndex;
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= DisAlarmModeStateImageIndex;
      end;
    cmPatrol :
      begin
        AlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmPatrolStateImageIndex;
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmPatrolStateImageIndex;
      end;
    cmInit :
      begin
        AlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmInitStateImageIndex;
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmInitStateImageIndex;
      end;
    cmTest :
      begin
        AlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmTestStateImageIndex;
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmTestStateImageIndex;
      end;
    else
      begin
        AlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmNothingStateImageIndex;
        IntAlarmListView.Items[nAlarmIndex].ImageIndex:= AlarmNothingStateImageIndex;
      end;
  end;
end;

procedure TfmMultiMonitoring.DeviceAlarmEventProcess(NodeNo: integer;
  ECUID: string; aAlaramState: TAlarmEventState);
var
  nAlarmIndex : integer;
begin
  nAlarmIndex := AlarmCodeList.IndexOf(FillzeroNumber(NodeNo,3) + ECUID );
  if nAlarmIndex < 0 then Exit;

  case aAlaramState of
    aeNothing :
      begin
        AlarmListView.Items[nAlarmIndex].StateIndex:= NothingStateIndex;
        IntAlarmListView.Items[nAlarmIndex].StateIndex:= NothingStateIndex;
      end;
    aeNormal :
      begin
        AlarmListView.Items[nAlarmIndex].StateIndex:= NothingStateIndex;
        IntAlarmListView.Items[nAlarmIndex].StateIndex:= NothingStateIndex;
      end;
    aeNormalEvent :
      begin
        AlarmListView.Items[nAlarmIndex].StateIndex:= NormalEventStateIndex;
        IntAlarmListView.Items[nAlarmIndex].StateIndex:= NormalEventStateIndex;
      end;
    aeAlarmEvent :
      begin
        AlarmListView.Items[nAlarmIndex].StateIndex:= AlarmEventStateIndex;
        IntAlarmListView.Items[nAlarmIndex].StateIndex:= AlarmEventStateIndex;
      end;
    else
      begin
      end;
  end;
  AlarmListView.Refresh;
  IntAlarmListView.Refresh;

end;

procedure TfmMultiMonitoring.AlarmEventProcess(NodeNo: integer; ECUID,
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
  stAlarmID := FillZeroNumber(NodeNo,3) + ECUID;
  nAlarmIndex := AlarmCodeList.IndexOf(stAlarmID);

  if nAlarmIndex < 0 then Exit;// ���� ������ ����

  stBuildingName := AlarmLocateList.Strings[nAlarmIndex]; //��豸�� ��ġ
  stAlarmName:= AlarmListView.Items[nAlarmIndex].Caption; // ��豸�� ��

  nResult:= GetStatusCode(aStatusCode,stStatusName,nAlarmSound);
  if aPortNo <> '**' then
  begin
    if aState <> 'N' then
    begin
      stPortName := GetPortName(FillZeroNumber(NodeNo,3),ECUID,aPortNo);
      if stStatusName = '' then
      begin
        stStatusName := '' + aPortNo + '�� ħ��' + '  ' + stPortName;// + stStatusName; //+ stPortNo +'���� ����'; //stStatusName;    //� �������� ���� �Ǿ����� ǥ��
      end else
      begin
        stStatusName := '' + stStatusName + '  ' + stPortName ;
      end;
    end else
    begin
      aAlarmSound := False;
      stStatusName := stStatusName +'[����]' + stPortName ;
    end;
  end;
  case UpperCase(aMode)[1] of
   'A': begin stModeStr:= '�����[A]' end;
   'D': begin stModeStr:= '�������[D]' end;
   'T': begin stModeStr:= '������[T]' end;
   'I': begin stModeStr:= '��ϸ��[I]' end;
   'P': begin stModeStr:= '��ȸ���[P]' end;
  else  begin stModeStr:= '�̵�ϸ��['+aMode[1]+']' end;
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
      InsertAlarmList(aTime, //�ð�
                    stBuildingName, //��ġ����
                    stAlarmName, //��豸����Ī
                    ECUID ,//+'['+stMsgNo+']',  //����ȣ[�޽�����ȣ]
                    aSubCLass,         //���Ÿ��[��ȣ]
                    aStatusCode + '/' + aPortNo,  //�̺�Ʈ�ڵ�
                    stStatusName,
                    FillZeroNumber(NodeNo,3) + ECUID,
                    nAlarmSound,
                    aColor,
                    sg_Alarm);  //�̺�Ʈ ����
      InsertAlarmList(aTime, //�ð�
                    stBuildingName, //��ġ����
                    stAlarmName, //��豸����Ī
                    ECUID ,//+'['+stMsgNo+']',  //����ȣ[�޽�����ȣ]
                    aSubCLass,         //���Ÿ��[��ȣ]
                    aStatusCode + '/' + aPortNo,  //�̺�Ʈ�ڵ�
                    stStatusName,
                    FillZeroNumber(NodeNo,3) + ECUID,
                    nAlarmSound,
                    aColor,
                    sg_IntAlarm);  //�̺�Ʈ ����
    end;
  end;

  if PTAlarmMessageUse then  //ZONE Sensing Message Use
  begin
    if aCmd = 'A' then
    begin
      if isDigit(aPortNo) then
      begin
        st_Message.Caption := stAlarmName + ':' + aPortNo + '�� �� ����!!!';
        MessageTimer.Enabled := True;
      end;
    end;
  end;

end;

procedure TfmMultiMonitoring.MessageTimerTimer(Sender: TObject);
begin
  pan_Message.Visible := Not pan_Message.Visible;

end;

procedure TfmMultiMonitoring.btn_AlarmConfirmClick(Sender: TObject);
begin
  MessageTimer.Enabled := False;
  pan_Message.visible := False;

end;

procedure TfmMultiMonitoring.FormResize(Sender: TObject);
begin
  CenterPanel;

end;

procedure TfmMultiMonitoring.CenterPanel;
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

procedure TfmMultiMonitoring.AlarmListClear;
var
  i : integer;
begin
  sg_Alarm.InsertRows(1,1);
  GridInitialize(sg_Alarm,2);
  sg_IntAlarm.InsertRows(1,1);
  GridInitialize(sg_IntAlarm,2);
  for i := 0 to AlarmListView.Items.Count - 1 do
  begin
    if AlarmListView.Items[I].StateIndex <> NothingStateIndex then
    begin
      AlarmListView.Items[I].StateIndex := NothingStateIndex;
      AlarmListView.Refresh;
    end;
  end;

end;

procedure TfmMultiMonitoring.ExitButtonPress(NodeNo: integer; aEcuID,
  aDoorNo, aTime, aInputType,aUserName,aPermitCode,aPermit: string);
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
    //��ϵ��� ���� ��� ������
    Exit;
  end;
  stDoorID := stDeviceID + aDoorNo;
  nDoorIndex := DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then
  begin
    //�ڹٶ����� Ȯ�� ����
    if aDoorNo = '2' then
    begin
      if dmJavara.JavaraCheck(NodeNo,aEcuID) then
      begin
        nDoorIndex := DoorCodeList.IndexOf(FillZeroNumber(NodeNo,3) + aEcuID + '1');
        if nDoorIndex > -1 then
        begin
          stDoorName:= doorListView.Items[nDoorIndex].Caption + '_����'; // �ڹٶ����
          stBuildingName := DoorLocateList.Strings[nDoorIndex];
          InsertDOORList(aPermitCode,aPermit,aTime,stBuildingName,stDoorName,aInputType,aUserName,
            '','','','',stDoorID,'','','','',sg_Access);
          if PatrolUse then InsertDOORList(aPermitCode,aPermit,aTime,stBuildingName,stDoorName,aInputType,aUserName,
            '','','','',stDoorID,'','','','',sg_IntAccess);
          Exit;
        end;
      end;
    end;
    Exit;
  end;
  stDoorName := DoorListView.Items[nDoorIndex].Caption;
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
    '','','','',stDoorID,'','','','',sg_Access);
  if PatrolUse then InsertDOORList(aPermitCode,aPermit,aTime,stBuildingName,stDoorName,aInputType,aUserName,
    '','','','',stDoorID,'','','','',sg_IntAccess);
end;

procedure TfmMultiMonitoring.AccessEventProcess(NodeNo: integer; aEcuID,
  aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
  aButton: string);
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
  stHandPhone,stCompanyPhone,stAddr1,stAddr2 : string;
begin
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then
  begin
    //��ϵ��� ���� ��� ������
    Exit;
  end;
  GetUserInfo(aCardNo,stEmName,stCompanyName,stJijumName,stDepartName,stEmCode,stHandPhone,stCompanyPhone,stAddr1,stAddr2);
  stPermitName := GetPermitState(aPermit);
  stDoorID := stDeviceID + aDoorNo;
  nDoorIndex := DoorCodeList.IndexOf(stDoorID);
  if nDoorIndex < 0 then
  begin
    //�ڹٶ����� Ȯ�� ����
    if aDoorNo = '2' then
    begin
      if dmJavara.JavaraCheck(NodeNo,aEcuID) then
      begin
        nDoorIndex := DoorCodeList.IndexOf(FillZeroNumber(NodeNo,3) + aEcuID + '1');
        if nDoorIndex > -1 then
        begin
          stDoorName:= doorListView.Items[nDoorIndex].Caption + '_����'; // �ڹٶ����
          stBuildingName := DoorLocateList.Strings[nDoorIndex];
          InsertDOORList(aPermit,stPermitName,aTime,stBuildingName,stDoorName,aCardNo,stEmName,
            stCompanyName,stJijumName,stDepartName,stEmCode,stDoorID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_Access);
          if PatrolUse then InsertDOORList(aPermit,stPermitName,aTime,stBuildingName,stDoorName,aCardNo,stEmName,
            stCompanyName,stJijumName,stDepartName,stEmCode,stDoorID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_IntAccess);
          Exit;
        end;
      end;
    end;
    Exit;
  end;
  stDoorName := DoorListView.Items[nDoorIndex].Caption;
  stBuildingName := DoorLocateList.Strings[nDoorIndex];

  if ACAlarmUse then
  begin
    if Not Isdigit(aPermit) then
    begin
      self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
      self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
    end;
  end;

  InsertDOORList(aPermit,stPermitName,aTime,stBuildingName,stDoorName,aCardNo,stEmName,
    stCompanyName,stJijumName,stDepartName,stEmCode,stDoorID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_Access);
  if PatrolUse then InsertDOORList(aPermit,stPermitName,aTime,stBuildingName,stDoorName,aCardNo,stEmName,
    stCompanyName,stJijumName,stDepartName,stEmCode,stDoorID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_IntAccess);
end;

procedure TfmMultiMonitoring.NodeConnectState(NodeNo: integer;
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

procedure TfmMultiMonitoring.mn_FireRecoveryClick(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if AlarmListView.SelCount < 1 then Exit;
  for i := 0 to AlarmListView.Items.Count - 1 do
  begin
    if AlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DIRECT'+ DATADELIMITER + stAlarmID + DATADELIMITER + 'RSM2500' + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;

      if G_bFireRelayUse then
      begin
        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DIRECT'+ DATADELIMITER + stAlarmID + DATADELIMITER + 'RRY00' + FillZeroNumber(G_nFireRelayNumber,2) + 'f' + FillZeroNumber(G_nFireRelayTime,2) + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
      end;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','ȭ�纹��')
    end;
  end;

end;

procedure TfmMultiMonitoring.mn_IntFireRecoveryClick(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  for i := 0 to IntAlarmListView.Items.Count - 1 do
  begin
    if IntAlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmCodeList[i];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DIRECT'+ DATADELIMITER + stAlarmID + DATADELIMITER + 'RSM2500' + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;

      if G_bFireRelayUse then
      begin
        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DIRECT'+ DATADELIMITER + stAlarmID + DATADELIMITER + 'RRY00' + FillZeroNumber(G_nFireRelayNumber,2) + 'f' + FillZeroNumber(G_nFireRelayTime,2)  + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
      end;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','ȭ�纹��')
    end;
  end;

end;

procedure TfmMultiMonitoring.doorListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  inherited;
  if Selected then
    begin
    if TListView(Sender).Items[TListView(Sender).ItemIndex].SubItems.Strings[5] = '1' then
    begin
      pm_modechange.Visible := False;
      pm_DoorOpen.Visible := False;
      pm_JavarOpen.Visible := True;
      pm_JavaraClose.Visible := True;
      pm_intimodechange.Visible := False;
      pm_intiDoorOpen.Visible := False;
      pm_intiJavarOpen.Visible := True;
      pm_intiJavaraClose.Visible := True;
    end else
    begin
      pm_modechange.Visible := True;
      pm_DoorOpen.Visible := True;
      pm_JavarOpen.Visible := False;
      pm_JavaraClose.Visible := False;
      pm_intimodechange.Visible := True;
      pm_intiDoorOpen.Visible := True;
      pm_intiJavarOpen.Visible := False;
      pm_intiJavaraClose.Visible := False;
    end;
  end;
end;

procedure TfmMultiMonitoring.pm_JavarOpenClick(Sender: TObject);
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
        stDoorID[Length(stDoorID)] := '1'; //�ڹٶ� ���� �϶��� �ڹٶ� ����ȣ�� 1������ �ٲ�

        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
        DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','�ڹٶ� ����');
      end;
    end;
  Except
    showmessage('���۽���');
    Exit;
  End;
end;

procedure TfmMultiMonitoring.pm_JavaraCloseClick(Sender: TObject);
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
        stDoorID[Length(stDoorID)] := '2'; //�ڹٶ� �ݱ� �϶��� �ڹٶ� ����ȣ�� 2������ �ٲ�

        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
        DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','�ڹٶ� �ݱ�')
      end;
    end;
  Except
    showmessage('���۽���');
    Exit;
  End;
end;

procedure TfmMultiMonitoring.pm_intiJavarOpenClick(Sender: TObject);
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
        stDoorID[Length(stDoorID)] := '1'; //�ڹٶ� ���� �϶��� �ڹٶ� ����ȣ�� 1������ �ٲ�

        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
        DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','�ڹٶ󿭱�')
      end;
    end;
  Except
    showmessage('���۽���');
    Exit;
  End;

end;

procedure TfmMultiMonitoring.pm_intiJavaraCloseClick(Sender: TObject);
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
        stDoorID[Length(stDoorID)] := '2'; //�ڹٶ� �ݱ� �϶��� �ڹٶ� ����ȣ�� 2������ �ٲ�

        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
        DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','�ڹٶ�ݱ�')
      end;
    end;
  Except
    showmessage('���۽���');
    Exit;
  End;

end;

initialization
  RegisterClass(TfmMultiMonitoring);
Finalization
  UnRegisterClass(TfmMultiMonitoring);

end.
