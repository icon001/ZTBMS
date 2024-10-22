unit uMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, uSubForm, CommandArray, StdCtrls, ImgList,
  ToolPanels, Shader, ActnList, Menus, Grids, BaseGrid, AdvGrid,Clipbrd,
  ActiveX,ADODB,IniFiles, AdvObj;

const AlarmPImageIndex = 2;
const AlarmSImageIndex = 3;
const AlarmNImageIndex = 4;

type
  TfmMonitoring = class(TfmASubForm)
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
    GroupBox1: TGroupBox;
    doorListView: TListView;
    SmallDoorList: TImageList;
    stateList: TImageList;
    LageDoorList: TImageList;
    GroupBox2: TGroupBox;
    TreeView_Location: TTreeView;
    GroupBox3: TGroupBox;
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
    SocketWatchTimer: TTimer;
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
    IntAlarmListView: TListView;
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
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    TreeView_Device: TTreeView;
    NEGATIVE1: TMenuItem;
    NEGTIVE1: TMenuItem;
    StateSendTimer1: TTimer;
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
    procedure Panel9Resize(Sender: TObject);
    procedure Panel12Resize(Sender: TObject);
    procedure Panel15Resize(Sender: TObject);
    procedure Panel14Resize(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure CommandArrayCommandsTCommand6Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand7Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand8Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand9Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand10Execute(Command: TCommand;
      Params: TStringList);
    procedure FormActivate(Sender: TObject);
    procedure NEGATIVE1Click(Sender: TObject);
    procedure NEGTIVE1Click(Sender: TObject);
    procedure sg_AccessDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StateSendTimer1Timer(Sender: TObject);
    procedure TreeView_DeviceDblClick(Sender: TObject);
    procedure doorListViewDblClick(Sender: TObject);
  private
    { Private declarations }
    DeviceCodeList : TStringList; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
    DeviceStateList : TStringList;  //기기의 상태정보를 가지고 있다. (C:Connect,D:Disconnect);
    DeviceCaptionList : TStringList; //기기명을 가지고 있다.
    DeviceLastTimeList : TStringList; //마지막 접속시간을 가지고 있다.
    DoorCodeList : TStringList;   // Door코드를 가지고 있다
    DoorLocateList : TStringList; // Door의 위치정보를 가지고 있다. (000000000위치정보)
    AlarmCodeList : TStringList;  //방범 코드를 가지고 있다.
    AlarmNoList : TStringList;
    AlarmLocateList : TStringList; //방범기기의 위치정보를 가지고 있다. (000000000위치정보)
    FoodCodeList : TStringList;   //식수 코드를 가지고 있다.
    FoodCodeNameList : TStringList; //식수명을 가지고 있다.
    FoodLocateList : TStringList;  //식수기기의 위치정보를 가지고 있다.(000000000위치정보)
    CompanyCodeList : TStringList; //회사코드를 가지고 있다.
    CompanyNameList : TStringList; //회사명칭을 가지고 있다.
    DepartCodeList : TStringList; //부서코드를 가지고 있다.
    DepartNameList : TStringList; //부서명칭을 가지고 있다.

    procedure DisConnectNode(aNodeNo:string);
    procedure ConnectNode(aNodeNo:string);
    procedure DisConnectECU(aECUID:string);
    procedure ConnectECU(aECUID:string);
    procedure DisConnectDoor(aDoorID:string);
    procedure DisConnectAlarm(aAlarmID:string);
    procedure DoorLoad(aBuildingCode,aFloorCode,aAreaCode :string; DoorList:TListView);
    procedure AlarmLoad(aBuildingCode,aFloorCode,aAreaCode :string; AlarmList:TListView);
    procedure FoodLoad(aBuildingCode,aFloorCode,aAreaCode :string);
    procedure RcvCardReadData(aNodeNo,aReceiveData:string); //카드리딩 데이터 처리
    procedure DeviceRcvAlarmData(aNodeNo,aReceiveData: string); //알람 데이터 처리
    procedure RcvChangeDoorData(aNodeNo,aReceiveData:string); //상태변경 데이터 처리
    procedure RcvDoorControl(aNodeNo,aReceiveData:string);
    Function GetBuildingName(aBuildingCode:string):string;
    Function GetFloorName(aBuildingCode,aFloorCode:string):string;
    Function GetAreaName(aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetPermitState(aPermit:string):string;
    Function GetUserInfo(aCardNo:string; var stUserName,stCompanyName,stDepartName,stEmID:string):Boolean;
    procedure InsertDOORList(aPermitCode,aPermit,aTime,aLocationName,aDoorName,aReaderNo,aLocation,aCardNo,aUserName,
    aCompanyName,aDepartName,aEmID,aCardMode:string;List:TAdvStringGrid);
    procedure   InsertAlarmList(aTime, aMeetCode, aMeetFloor,
  aMeetName, aState: string;List:TAdvStringGrid);  //이벤트 내용

    Function GetStatusCode(aStatusCode:string;var aStatusName :string) : integer;
    Function UPDATETB_USERCONFIG(aConfigGroup,aConfigID,aValue : string):Boolean;
    Function InsertTB_USERCONFIG(aConfigGroup,aConfigID,aValue : string):Boolean;
    procedure Form_Initialize;
    procedure setLogin(aLogin:string);
  public
    { Public declarations }
    bLocationMapShow : Boolean;
    bDeviceMapShow : Boolean;

    procedure ShowAccessEvent(aSCSResult, aAuthType, aTimestr, aNodeNo,
      aECUID, aDoorNo, aReaderNo, aCardNo, aEmName, aCompanyName, aJijumName,
      aEmCode, aPosiName:string);
    Function GetAuthName(aAuthType:string):string;

  end;

var
  fmMonitoring: TfmMonitoring;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uServerDaemon;//, uLocationMap, uDeviceMap,uDeviceInfo;
{$R *.dfm}




procedure TfmMonitoring.FormCreate(Sender: TObject);
begin

  DeviceCodeList := TStringList.Create;
  DeviceStateList := TStringList.Create;
  DeviceCaptionList := TStringList.Create;
  DeviceLastTimeList := TStringList.Create;
  DoorCodeList := TStringList.Create;
  DoorLocateList := TStringList.Create;
  AlarmCodeList := TStringList.Create;
  AlarmNoList := TStringList.Create;
  AlarmLocateList := TStringList.Create;
  FoodCodeList := TStringList.Create;
  FoodCodeNameList := TStringList.Create;
  FoodLocateList := TStringList.Create;
  CompanyCodeList := TStringList.Create;
  CompanyNameList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  DepartNameList := TStringList.Create;

  bLocationMapShow := False;
  bDeviceMapShow := False;

  if fmMain.Logined then setLogin('LOGIN')
  else setLogin('');
end;

procedure TfmMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin
  self.FindSubForm('Main').FindCommand('SELECTID').Params.Values['VALUE'] := '';
  self.FindSubForm('Main').FindCommand('SELECTID').Execute;
  self.FindSubForm('Main').FindCommand('MONITOR').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('MONITOR').Execute;
  DeviceCodeList.Free;
  DeviceStateList.Free;
  DeviceCaptionList.Free;
  DeviceLastTimeList.Free;
  DoorCodeList.Free;
  DoorLocateList.Free;
  AlarmCodeList.Free;
  AlarmNoList.Free;
  AlarmLocateList.Free;
  FoodCodeList.Free;
  FoodCodeNameList.Free;
  FoodLocateList.Free;
  CompanyCodeList.Free;
  CompanyNameList.Free;
  DepartCodeList.Free;
  DepartNameList.Free;

  Action := caFree;
  Try
    ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
    ini_fun.WriteString('Monitoring','DeviceTab',PageControl1.ActivePage.Name);
    ini_fun.WriteInteger('Monitoring','Access1Height',Panel3.Height);
    if doorListView.ViewStyle = vsIcon then
      ini_fun.WriteString('Monitoring','DoorListView','vsIcon')
    else
      ini_fun.WriteString('Monitoring','DoorListView','vsList');
  Finally
    ini_fun.Free;
  End;


end;

procedure TfmMonitoring.Action_LoctionLoadExecute(Sender: TObject);
var
  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  stLocationCode,stLocationCaption : string;
  stParentCode : string;
begin
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

  //동코드 로딩
  stSql := ' Select a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' From TB_LOCATION a ';
  stSql := stSql + ' Inner Join (';
  stSql := stSql + ' select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE,b.GROUP_CODE ';
  if Not IsMaster then
    stSql := stSql + ' ,a.AD_USERID ';
  stSql := stSql + ' from TB_Door b ' ;
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINDOOR a ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE AND a.AC_NODENO=b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID AND a.DO_DOORNO=b.DO_DOORNO) ';
  end;
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select e.LO_DONGCODE,e.LO_FLOORCODE,e.LO_AREACODE,e.GROUP_CODE ';
  if Not IsMaster then
    stSql := stSql + ',c.AD_USERID ' ;
  stSql := stSql + ' from TB_ALARMDEVICE d ' ;
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE c  ';
    stSql := stSql + ' ON (c.GROUP_CODE = d.GROUP_CODE AND c.AL_DEVICENO=d.AL_DEVICENO )';
  end;
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE AND d.AC_NODENO=e.AC_NODENO  ';
  stSql := stSql + ' AND d.AC_ECUID = e.AC_ECUID ) ';
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select g.LO_DONGCODE,g.LO_FLOORCODE,g.LO_AREACODE,g.GROUP_CODE ';
  if Not IsMaster then
    stSql := stSql + ' ,f.AD_USERID ';
  stSql := stSql + ' from TB_FOOD g ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINFOOD f  ';
    stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE AND f.AC_NODENO=g.AC_NODENO ';
    stSql := stSql + ' AND f.AC_ECUID = g.AC_ECUID AND f.FO_DOORNO = g.FO_DOORNO ) ';
  end;
  stSql := stSql + ' )b ' ;
  stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE )' ;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  stSql := stSql + ' AND a.LO_GUBUN = ''0'' ';
  stSql := stSql + ' Group by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' Order by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_GUBUN ';

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
      stLocationCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
      stLocationCaption := FindField('LO_NAME').AsString;
      if FindField('LO_GUBUN').AsString = '0' then  //빌딩 등록
      begin
        bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
        bNode.ImageIndex:=7;
        bNode.SelectedIndex:=7;
        bNode.StateIndex:= -1;
        vNode2 := vTreeView.Items.AddChild(vNode1,stLocationCode);
      end;

      Next;
    end;
  end;

  //층코드 로딩
  stSql := ' Select a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' From TB_LOCATION a ';
  stSql := stSql + ' Inner Join ';
  stSql := stSql + ' (select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE,b.GROUP_CODE ';
  if Not IsMaster then
    stSql := stSql + ' ,a.AD_USERID ';
  stSql := stSql + ' from TB_Door b ' ;
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINDOOR a ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE AND a.AC_NODENO=b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID AND a.DO_DOORNO=b.DO_DOORNO) ';
  end;
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select e.LO_DONGCODE,e.LO_FLOORCODE,e.LO_AREACODE,e.GROUP_CODE ';
  if Not IsMaster then
    stSql := stSql + ' ,c.AD_USERID ';
  stSql := stSql + ' from TB_ALARMDEVICE d ' ;
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE c  ';
    stSql := stSql + ' ON (c.GROUP_CODE = d.GROUP_CODE AND c.AL_DEVICENO=d.AL_DEVICENO )';
  end;
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE AND d.AC_NODENO=e.AC_NODENO ';
  stSql := stSql + ' AND d.AC_ECUID = e.AC_ECUID ) ';
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select g.LO_DONGCODE,g.LO_FLOORCODE,g.LO_AREACODE,g.GROUP_CODE ';
  if Not IsMaster then
    stSql := stSql + ' ,f.AD_USERID ';
  stSql := stSql + ' from  TB_FOOD g ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINFOOD f ';
    stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE AND f.AC_NODENO=g.AC_NODENO ';
    stSql := stSql + ' AND f.AC_ECUID = g.AC_ECUID AND f.FO_DOORNO = g.FO_DOORNO ) ';
  end;
  stSql := stSql + ' )b ' ;
  stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE ' ;
  stSql := stSql + ' AND a.LO_FLOORCODE = b.LO_FLOORCODE )' ;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  stSql := stSql + ' AND a.LO_GUBUN = ''1'' ';
  stSql := stSql + ' Group by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' Order by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_GUBUN ';

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
      stParentCode := FindField('LO_DONGCODE').AsString + '000000';
      stLocationCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
      stLocationCaption := FindField('LO_NAME').AsString;
      if FindField('LO_GUBUN').AsString = '1' then  //층 등록
      begin
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
        cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
        cNode.ImageIndex:=8;
        cNode.SelectedIndex:=8;
        cNode.StateIndex:= -1;
        vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
        vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
      end;

      Next;
    end;
  end;

  //구역코드 로딩
  stSql := ' Select a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' From TB_LOCATION a ';
  stSql := stSql + ' Inner Join ';
  stSql := stSql + ' (select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE,b.GROUP_CODE ';
  if Not IsMaster then
    stSql := stSql + ' ,a.AD_USERID ';
  stSql := stSql + ' from TB_Door b ' ;
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINDOOR a  ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE AND a.AC_NODENO=b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID AND a.DO_DOORNO=b.DO_DOORNO) ';
  end;
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select e.LO_DONGCODE,e.LO_FLOORCODE,e.LO_AREACODE,e.GROUP_CODE ';
  if Not IsMaster then
    stSql := stSql + ' ,c.AD_USERID ';
  stSql := stSql + ' from TB_ALARMDEVICE d ' ;
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join  TB_ADMINALARMDEVICE c ';
    stSql := stSql + ' ON (c.GROUP_CODE = d.GROUP_CODE AND c.AL_DEVICENO=d.AL_DEVICENO )';
  end;
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE e ';
  stSql := stSql + ' ON (d.GROUP_CODE = e.GROUP_CODE AND d.AC_NODENO=e.AC_NODENO ';
  stSql := stSql + ' AND d.AC_ECUID = e.AC_ECUID ) ';
  stSql := stSql + ' Union all  ' ;
  stSql := stSql + ' select g.LO_DONGCODE,g.LO_FLOORCODE,g.LO_AREACODE,g.GROUP_CODE ';
  if Not IsMaster then
    stSql := stSql + ' ,f.AD_USERID ';
  stSql := stSql + ' from TB_FOOD g ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINFOOD f ';
    stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE AND f.AC_NODENO=g.AC_NODENO ';
    stSql := stSql + ' AND f.AC_ECUID = g.AC_ECUID AND f.FO_DOORNO = g.FO_DOORNO ) ';
  end;
  stSql := stSql + ' )b ' ;
  stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE ' ;
  stSql := stSql + ' AND a.LO_FLOORCODE = b.LO_FLOORCODE ' ;
  stSql := stSql + ' AND a.LO_AREACODE = b.LO_AREACODE )' ;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  stSql := stSql + ' AND a.LO_GUBUN = ''2'' ';
  stSql := stSql + ' Group by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_NAME,a.LO_GUBUN ';
  stSql := stSql + ' Order by a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,a.LO_GUBUN ';

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
      stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString + '000';
      stLocationCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
      stLocationCaption := FindField('LO_NAME').AsString;
      if FindField('LO_GUBUN').AsString = '2' then  //구역 등록
      begin
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
        cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
        cNode.ImageIndex:=9;
        cNode.SelectedIndex:=9;
        cNode.StateIndex:= -1;
        vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
        vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
      end;

      Next;
    end;
  end;

  if AccessUse then
  begin
    //출입문정보 로딩
    stSql := ' Select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE, ';
    stSql := stSql + ' b.AC_NODENO,b.AC_ECUID,b.DO_DOORNO,b.DO_DOORNONAME ';
    stSql := stSql + ' From TB_DOOR b ';
    if Not IsMaster then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR a ';
      stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO )' ;
    end;
    stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
    if Not IsMaster then
      stSql := stSql + ' AND a.AD_USERID = ''' + Master_ID + ''' ';
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
        stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
        stLocationCode := 'D1' + FillzeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString ;
        stLocationCaption := FindField('DO_DOORNONAME').AsString;
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
        cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
        cNode.ImageIndex:=10;
        cNode.SelectedIndex:=10;
        cNode.StateIndex:= -1;
        vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
        vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);

        Next;
      end;
    end;
  end;

  if PatrolUse then
  begin
    //경비구역 정보 로딩
    stSql := ' Select c.LO_DONGCODE,c.LO_FLOORCODE,c.LO_AREACODE, ';
    stSql := stSql + ' b.AL_DEVICENO,b.AC_NODENO,b.AC_ECUID,b.AL_ZONENAME ';
    stSql := stSql + ' From TB_ALARMDEVICE b ';
    if Not IsMaster then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE a ';
      stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
      stSql := stSql + ' AND a.AL_DEVICENO = b.AL_DEVICENO ) ';
    end;
    stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
    stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE AND b.AC_NODENO=c.AC_NODENO ';
    stSql := stSql + ' AND b.AC_ECUID = c.AC_ECUID ) ';
    stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
    if Not IsMaster then
      stSql := stSql + ' AND a.AD_USERID = ''' + Master_ID + ''' ';
    stSql := stSql + ' Order by c.LO_DONGCODE,c.LO_FLOORCODE,c.LO_AREACODE';

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
        stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
        stLocationCode := 'D2' + FillzeroNumber(FindField('AL_DEVICENO').asinteger,3) + FillzeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString  ;
        stLocationCaption := FindField('AL_ZONENAME').AsString;
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
        cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
        cNode.ImageIndex:=12;
        cNode.SelectedIndex:=12;
        cNode.StateIndex:= -1;
        vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
        vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);

        Next;
      end;
    end;
  end;

  if FoodUse then
  begin
    //식수구역 정보 로딩
    stSql := ' Select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE, ';
    stSql := stSql + ' b.AC_NODENO,b.AC_ECUID,b.FO_DOORNO,b.FO_NAME ';
    stSql := stSql + ' From TB_FOOD b ';
    if Not IsMaster then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD a ';
      stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
    end;
    stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
    if Not IsMaster then
      stSql := stSql + ' AND a.AD_USERID = ''' + Master_ID + ''' ';
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
        stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
        stLocationCode := 'D3' +  FillzeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString + FindField('FO_DOORNO').AsString ;
        stLocationCaption := FindField('FO_NAME').AsString;
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
        cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
        cNode.ImageIndex:=AlarmSImageIndex;
        cNode.SelectedIndex:=AlarmSImageIndex;
        cNode.StateIndex:= -1;
        vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
        vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);

        Next;
      end;
    end;
  end;

end;

procedure TfmMonitoring.Action_DeviceLoadExecute(Sender: TObject);
var
  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
  stSql : string;
  stParentCode : string;
  stLocationCaption : string;
  nIndex : integer;
begin
  aTreeView := TreeView_Device;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  DeviceCodeList.Clear;
  DeviceStateList.Clear;
  DeviceCaptionList.Clear;
  DeviceLastTimeList.Clear;

  aNode:= aTreeView.Items.Add(nil,'서버');
  aNode.ImageIndex:=0;
  aNode.SelectedIndex:=0;
  aNode.StateIndex:= -1;
  DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));
  DeviceCodeList.Add('000000000000');
  DeviceStateList.Add('D');
  DeviceCaptionList.Add('서버');

  //MCU LAN 정보 조회
  stSql := ' Select * ';
  stSql := stSql + ' From TB_ACCESSDEVICE  ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  stSql := stSql + ' Order by AC_NODENO,AC_ECUID ';

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
      if NETTYPE = 'RS232' then stLocationCaption := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +
                                                     ':COM' + FindField('AC_COMPORT').AsString
      else stLocationCaption := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + ':' + FindField('AC_MCUIP').AsString;
{      stLocationCaption := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + '-' +
                           copy(FindField('AC_MACADDR').AsString,1,2) + ':' +
                           copy(FindField('AC_MACADDR').AsString,3,2) + ':' +
                           copy(FindField('AC_MACADDR').AsString,5,2) + ':' +
                           copy(FindField('AC_MACADDR').AsString,7,2) + ':' +
                           copy(FindField('AC_MACADDR').AsString,9,2) + ':' +
                           copy(FindField('AC_MACADDR').AsString,11,2);  }
      DeviceCodeList.Add('N' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3));
      DeviceStateList.Add('D');
      DeviceCaptionList.Add(stLocationCaption);
      DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //LAN의 접속시간 체크하자...
      bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
      bNode.ImageIndex:=2;
      bNode.SelectedIndex:=2;
      bNode.StateIndex:= -1;

      Next;
    end;
  end;


  //ECU정보 로딩
  stSql := ' Select * ';
  stSql := stSql + ' From TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order by AC_NODENO,AC_ECUID ';

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
      stLocationCaption := FindField('AC_ECUID').asstring + ':' + FindField('AC_DEVICENAME').asstring;
      DeviceCodeList.Add('E' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').asstring);
      DeviceStateList.Add('D');
      DeviceCaptionList.Add(stLocationCaption);
      DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //ECU의 접속시간 체크하자...
      nIndex := DeviceCodeList.IndexOf('N' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3));
      if nIndex > -1 then
      begin
        stParentCode := DeviceCaptionList.Strings[nIndex] ;
        bNode:= GetNodeByText(aTreeView,stParentCode,True);
        if bNode <> nil then
        begin
          cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
          cNode.ImageIndex:=4;
          cNode.SelectedIndex:=4;
          cNode.StateIndex:= -1;
        end;
      end;

      Next;
    end;
  end;

  //Door정보 로딩
  stSql := ' Select * ';
  stSql := stSql + ' From TB_DOOR  ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order by AC_NODENO,AC_ECUID,DO_DOORNO ';

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
      stLocationCaption := FindField('DO_DOORNO').asstring + ':' + FindField('DO_DOORNONAME').asstring;
      DeviceCodeList.Add('D' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').asstring + FindField('DO_DOORNO').asstring);
      DeviceStateList.Add('D');
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
      
      Next;
    end;
  end;

end;

procedure TfmMonitoring.SocketWatchTimerTimer(Sender: TObject);
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
      if stNodeNo[1] = 'N' then
        DisConnectNode(stNodeNo)
      else if stNodeNo[1] = 'E' then
        DisConnectECU(stNodeNo);
    end;
  end;

end;

procedure TfmMonitoring.DisConnectNode(aNodeNo: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  i : integer;
  stECUCode : string;
  stDoorCode : string;
  stAlarmCode : string;
  nIndex : integer;
begin
  nIndex := DeviceCodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  if DeviceStateList.Strings[nIndex] = 'D' then exit;
  
  aTreeView := TreeView_Device;
  DeviceStateList.Strings[nIndex] := 'D';
  stCaption := DeviceCaptionList.Strings[nIndex];
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode.ImageIndex <> 2 then aNode.ImageIndex:=2;
  if aNode.SelectedIndex <> 2 then  aNode.SelectedIndex:=2;
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

end;

procedure TfmMonitoring.ConnectNode(aNodeNo: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  nIndex : integer;
begin
  nIndex := DeviceCodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
  if DeviceStateList.Strings[nIndex] = 'C' then Exit;
  stCaption := DeviceCaptionList.Strings[nIndex];
  DeviceStateList.Strings[nIndex] := 'C';

  aTreeView := TreeView_Device;
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  aNode.ImageIndex:=1;
  aNode.SelectedIndex:=1;
  aNode.StateIndex:= -1;

end;


procedure TfmMonitoring.ConnectECU(aECUID: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  stDoorID : string;
  nIndex : integer;
  i : integer;
begin
  nIndex := DeviceCodeList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
  if DeviceStateList.Strings[nIndex] = 'C' then exit;
  for i := 1 to DOORCOUNT do
  begin
    stDoorID:= copy(aECUID,2,5) + inttostr(i);
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
    Delay(100);
  end;

  stCaption := DeviceCaptionList.Strings[nIndex];
  DeviceStateList.Strings[nIndex] := 'C';
  aTreeView := TreeView_Device;
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  if aNode.ImageIndex <> 3 then aNode.ImageIndex:=3;
  if aNode.SelectedIndex <> 3 then aNode.SelectedIndex:=3;
  aNode.StateIndex:= -1;
end;

procedure TfmMonitoring.DisConnectECU(aECUID: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  i : integer;
  stDoorCode : string;
  stAlarmCode : string;
  nIndex : integer;
begin
  nIndex := DeviceCodeList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  if DeviceStateList.Strings[nIndex] = 'D' then exit;
  DeviceStateList.Strings[nIndex] := 'D';
  stCaption := DeviceCaptionList.Strings[nIndex];

  aTreeView := TreeView_Device;

  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode.ImageIndex <> 4 then aNode.ImageIndex:=4;
  if aNode.SelectedIndex <> 4 then aNode.SelectedIndex:=4;
  aNode.StateIndex:= -1;

  for i:=0 to DoorCodeList.Count - 1 do
  begin
    stDoorCode := DoorCodeList.Strings[i];
    if copy(stDoorCode,1,5) = copy(aECUID,2,5) then //해당ECU의 도어이면 모두 물음표처리
    begin
      DisConnectDoor(stDoorCode);
    end;
  end;
end;

procedure TfmMonitoring.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stReceiveData: string;
  stNodeNo,stECUID,stDoorNo : string;
  aCommand : char;
  MSG_Code: Char;
begin
  stReceiveData := Params.Values['Data'];
  Delete(stReceiveData,1,1); //처음 맨 앞자리는 R
  if Length(stReceiveData) < 17 then Exit;
  stNodeNo := copy(stReceiveData,1,3);
  Delete(stReceiveData,1,3); //데몬에서 붙여온 Node 번호
  if Not Isdigit(stNodeNo) then Exit;

  aCommand:= stReceiveData[17];

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

  // 여기에서 화면에 디스플레이 해 주자... 전문을 분석해서...^^   {TO DO }

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
                  //ServerControlSystem 에서는 미사용
                  // RcvCardReadData(stNodeNo,stReceiveData);
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
  end;
  
end;

procedure TfmMonitoring.Action_DoorLoadExecute(Sender: TObject);
begin
  DoorLoad('000','000','000',doorListView);
  //DoorLoad('000','000','000',IntdoorListView);
end;

// 문정보를 로드  하여 해당 리스트에 조회 하자
procedure TfmMonitoring.DoorLoad(aBuildingCode, aFloorCode,
  aAreaCode: string; DoorList: TListView);
var
  stSql : string;
  stDoorID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
begin
  DoorCodeList.Clear;
  DoorLocateList.Clear;
  DoorList.Clear;
  //Door정보 로딩
  stSql := ' Select * ';
  stSql := stSql + ' From TB_DOOR ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order by DO_VIEWSEQ ';

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
    AccessTab.TabVisible := True;

    First;
    i:=0;
    While Not Eof do
    begin
      DoorList.Items.Add.Caption:= FindField('DO_DOORNONAME').asString;
      stDoorID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3) +
                 FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString ;
      DoorList.Items[I].SubItems.Add(stDoorID);     // 문 ID
      DoorCodeList.Add(stDoorID);  //문의 코드를 등록하자
      DoorList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3)); //노드번호
      DoorList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
      DoorList.Items[I].SubItems.Add(FindField('DO_DOORNO').AsString); //문번호
      DoorList.Items[I].ImageIndex:=2;

      inc(i);
      Next;
    end;
  end;

end;

procedure TfmMonitoring.AlarmLoad(aBuildingCode, aFloorCode,
  aAreaCode: string; AlarmList: TListView);
var
  stSql : string;
  stAlarmID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
begin
  AlarmCodeList.Clear;
  AlarmNoList.Clear;
  AlarmLocateList.Clear;
  AlarmList.Clear;
  //Alarm정보 로딩
  stSql := ' Select a.TM_MEETCODE,a.TM_MEETFLOOR,a.TM_MEETNAME ';
  stSql := stSql + ' From TB_ALARMDEVICE a ';
{  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AL_DEVICENO = b.AL_DEVICENO ) ';
  end;
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE AND a.AC_NODENO=c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';}
//  if Not IsMaster then
//    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
//  if ( aBuildingCode <> '' ) and ( aBuildingCode <> '000' ) then
//    stSql := stSql + ' AND c.LO_DONGCODE = ''' + aBuildingCode + ''' ';
//  if ( aFloorCode <> '' ) and ( aFloorCode <> '000' ) then
//    stSql := stSql + ' AND c.LO_FLOORCODE = ''' + aFloorCode + ''' ';
//  if ( aAreaCode <> '' ) and ( aAreaCode <> '000' ) then
//    stSql := stSql + ' AND c.LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' Group by a.TM_MEETCODE,a.TM_MEETFLOOR,a.TM_MEETNAME ';
  stSql := stSql + ' Order by a.TM_MEETFLOOR desc ';

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
      AlarmList.Items.Add.Caption:= FindField('TM_MEETFLOOR').asString + ' ' + FindField('TM_MEETNAME').asString;
//      stAlarmID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
//                 + FindField('AC_ECUID').AsString + FindField('AL_ZONENUM').AsString ;// + FillZeroNumber(FindField('AL_DEVICENO').AsInteger,3);
      stAlarmID := FindField('TM_MEETCODE').AsString;
      AlarmList.Items[I].SubItems.Add(stAlarmID);     // 방범 ID
      AlarmList.Items[I].SubItems.Add(FindField('TM_MEETFLOOR').asString);     // 층
      AlarmList.Items[I].SubItems.Add(FindField('TM_MEETNAME').asString);     // 회의실
      AlarmCodeList.Add(stAlarmID);  //방범아이디를 등록하자
      //AlarmNoList.Add(FillZeroNumber(FindField('AL_DEVICENO').AsInteger,3));
{      stBuildingName := GetBuildingName(FindField('LO_DONGCODE').AsString);
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
      AlarmList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
      AlarmList.Items[I].SubItems.Add(FindField('AL_ZONENUM').AsString); //FindField('AL_DEVICENO').AsString); //알람아이디
}
      AlarmList.Items[I].ImageIndex:=2;

      inc(i);
      Next;
    end;
  end;

end;

procedure TfmMonitoring.Action_AlarmLoadExecute(Sender: TObject);
begin
  AlarmLoad('000','000','000',AlarmListView);
//  AlarmLoad('000','000','000',IntAlarmListView);

end;

procedure TfmMonitoring.Action_FoodLoadExecute(Sender: TObject);
begin
  FoodLoad('000','000','000');
end;

procedure TfmMonitoring.FoodLoad(aBuildingCode, aFloorCode,
  aAreaCode: string);
var
  stSql : string;
  stFoodID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
begin
  FoodCodeList.Clear;
  FoodCodeNameList.Clear;
  FoodLocateList.Clear;
  //Food 정보 로딩
  stSql := ' Select a.AC_NODENO,a.AC_ECUID,a.FO_NAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE';
  stSql := stSql + ' From TB_FOOD a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINFOOD b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
    stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  if ( aBuildingCode <> '' ) and ( aBuildingCode <> '000' ) then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if ( aFloorCode <> '' ) and ( aFloorCode <> '000' ) then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if ( aAreaCode <> '' ) and ( aAreaCode <> '000' ) then
    stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' Group by a.AC_NODENO,a.AC_ECUID,a.FO_NAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE  ';

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
      stFOODID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                 + FindField('AC_ECUID').AsString ;
      FoodCodeList.Add(stFOODID);  //방범아이디를 등록하자
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

procedure TfmMonitoring.pm_StateCheckClick(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.pm_intiStateCheckClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.pm_DoorOpenClick(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.pm_intiDoorOpenClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.pm_OperateModeClick(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDMODE'+ DATADELIMITER + stDoorID + DATADELIMITER + 'P' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  Delay(200);
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.pm_OpenModeClick(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPENMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.pm_intiOpenModeClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPENMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.pm_intiOperateModeClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDMODE'+ DATADELIMITER + stDoorID + DATADELIMITER + 'P' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  Delay(200);
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.CommandArrayCommandsTCommand1Execute(
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
    end else if stCmd = 'OPERATEMODE' then  //전체운영
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + DoorCodeList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
    end;
  end;


end;

procedure TfmMonitoring.Menu_CurLocateClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  if AccessUse then
  begin
    DoorLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),doorListView);
    //DoorLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),IntdoorListView);
  end;
  if PatrolUse then
  begin
    AlarmLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),AlarmListView);
    AlarmLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),IntAlarmListView);
  end;
  if FoodUse then
    FoodLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3) );

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;


end;

procedure TfmMonitoring.TreeView_LocationClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then TreeView_Location.PopupMenu:= nil
  else TreeView_Location.PopupMenu:= Popup_Locate;

end;

procedure TfmMonitoring.TreeView_DeviceClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  if TreeView_Device.SelectionCount = 0 then Exit;
  stCaption := TreeView_Device.Selected.Text;
  if stCaption = '' then Exit;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  if stDeviceID[1] = 'E' then
  begin
    self.FindSubForm('Main').FindCommand('SELECTID').Params.Values['VALUE'] := copy(stDeviceID,2,5);
    self.FindSubForm('Main').FindCommand('SELECTID').Execute;

    TreeView_Device.PopupMenu:= Popup_Device;
  end else TreeView_Device.PopupMenu:= nil;

end;

procedure TfmMonitoring.Menu_DeviceTimeSyncClick(Sender: TObject);
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

procedure TfmMonitoring.Menu_DeviceRebootClick(Sender: TObject);
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

procedure TfmMonitoring.CommandArrayCommandsTCommand2Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmMonitoring.menu_AlarmClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.menu_AlarmDisableClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.Menu_IntAlarmSettingClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[IntAlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.Menu_IntAlarmDisableClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[IntAlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.CommandArrayCommandsTCommand3Execute(
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
    end else if stCmd = 'ALARMDISABLE' then  //전체해제
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + AlarmCodeList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
    end;
  end;

end;

procedure TfmMonitoring.RcvCardReadData(aNodeNo, aReceiveData: string);
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
  stUserName,stCompanyName,stDepartName,stEmID : string;
  stCardMode : string;
  stLocation : string;
begin
  if Length(aReceiveData) < 49 then Exit;

  stECUID :=    Copy(aReceiveData,15,2);
  stDoorNo:=     aReceiveData[21];
  stReaderNo:=   aReceiveData[22];
  stLocation :=  aReceiveData[23];
  if stLocation = '0' then stLocation := '내부'
  else stLocation := '외부';
  stTime:= Copy(aReceiveData,24,12);
  stTime:= copy(FormatDateTime('yyyymmdd',Now),1,2) + stTime;
  stCardMode := aReceiveData[36];
  if stCardMode = '1' then stCardMode := 'Negative'
  else if stCardMode = '0' then stCardMode := 'Positive'
  else stCardMode := '';

  stTemp := Copy(aReceiveData,44,8);
  stCardNo:= DecodeCardNo(stTemp);
  
  if stCardNo = '0000000000' then Exit;
  GetUserInfo(stCardNo,stUserName,stCompanyName,stDepartName,stEmID);

  if not IsDigit(stTime) then Exit;
  stTime:= Copy(stTime,1,4)+'-'+
          Copy(stTime,5,2)+'-'+
          Copy(stTime,7,2)+' '+
          Copy(stTime,9,2)+':'+
          Copy(stTime,11,2)+':'+
          Copy(stTime,13,2);

  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + stECUID + stDoorNo;
  nIndex := DoorCodeList.IndexOf(stDeviceID);
  if nIndex < 0 then //식수 데이터 이거나 출입관제 권한이 없음
  begin
    nIndex := FoodCodeList.IndexOf(copy(stDeviceID,1,12));
    if nIndex < 0 then Exit;
    stMosGubun := 'FOOD';
    stDoorName := FoodCodeNameList.Strings[nIndex];
    stLocationName := FoodLocateList.Strings[nIndex];
  end else
  begin
    stMosGubun := 'DOOR';
    stDoorName := doorListView.Items[nIndex].Caption;
  end;
  //카드승인유무체크
  stPermitCode:= aReceiveData[39];
  stPermit := GetPermitState(stPermitCode);

  if stMosGubun = 'DOOR' then
  begin
    InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stReaderNo,stLocation,stCardNo,stUserName,
    stCompanyName,stDepartName,stEmID,stCardMode,sg_Access);
  end
  else if stMosGubun = 'FOOD' then
    InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stReaderNo,stLocation,stCardNo,stUserName,
    stCompanyName,stDepartName,stEmID,stCardMode,sg_Food);



end;

procedure TfmMonitoring.Menu_DeviceAllCardDownClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + stDeviceID + DATADELIMITER + 'Y' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

//  self.FindSubForm('Main').FindCommand('CARDDOWNLOAD').Params.Values['VALUE'] := stDeviceID + 'A';
//  self.FindSubForm('Main').FindCommand('CARDDOWNLOAD').Execute;

end;

procedure TfmMonitoring.Menu_DeviceCardDownClick(Sender: TObject);
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

function TfmMonitoring.GetAreaName(aBuildingCode, aFloorCode,
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

function TfmMonitoring.GetBuildingName(aBuildingCode: string): string;
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

function TfmMonitoring.GetFloorName(aBuildingCode,
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

function TfmMonitoring.GetPermitState(aPermit: string): string;
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

function TfmMonitoring.GetUserInfo(aCardNo: string; var stUserName,
  stCompanyName, stDepartName, stEmID: string): Boolean;
var
  stSql : string;
  nIndex : integer;
begin
  Result := False;
  stUserName := '';
  stCompanyName := '';
  stDepartName := '';
  stEmID := '';

  stSql := ' select b.EM_NAME,b.CO_COMPANYCODE,b.CO_DEPARTCODE,b.PO_POSICODE,b.EM_CODE from TB_CARD a ';
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
    nIndex := DepartCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString + FindField('CO_DEPARTCODE').AsString);
    if nIndex > -1 then
      stDepartName := DepartNameList.Strings[nIndex] ;
    stEmID := FindField('EM_CODE').AsString ;
  end;

  Result := True;
end;



procedure TfmMonitoring.CommandArrayCommandsTCommand4Execute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
end;

procedure TfmMonitoring.InsertDOORList(aPermitCode,aPermit, aTime, aLocationName,
  aDoorName,aReaderNo,aLocation, aCardNo, aUserName, aCompanyName, aDepartName, aEmID,aCardMode: string;List:TAdvStringGrid);

begin

  with List do
  begin
    //ColWidths[4] := 0;  //상태코드
    if Cells[0,1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    Cells[0,1] := aTime;   //발생시간
    Cells[1,1] := copy(aLocationName,10,length(aLocationName)-9); //위치
    Cells[2,1] := aDoorName; //출입문
    Cells[3,1] := aReaderNo; //리더기 번호
    Cells[4,1] := aLocation; //리더기 위치
    Cells[5,1] := aPermitCode; //승인상태 코드
    Cells[6,1] := aPermit; //승인상태
    Cells[7,1] := aCardNo; //카드번호
    Cells[8,1] := aUserName; //이름
    Cells[9,1] := aCompanyName ; //회사명
    Cells[10,1] := aDepartName ; //부서명
    Cells[11,1] := aEmID; //사번
    Cells[12,1] := aCardMode; //카드모드
    if aPermit = '미승인' then
    begin
      RowColor[1] := clFuchsia;
    end else if UpperCase(aCardMode) = 'NEGATIVE' then
    begin
      RowColor[1] := clYellow;
    end;
//    List.SelectedCells[1,1];
    List.Row := 1;
    //List.SelectRows(1,1);
  end;


end;

procedure TfmMonitoring.Button1Click(Sender: TObject);
begin
// InsertDOORList('1','출입승인', '2003-01-11 11:11:11', '1동-1층-1구역',
//  '문1', '1234567890', '홍길동', '회사', '부서', '1',sg_Access);
// InsertAlarmList( '2003-01-11 11:11:11', '1동-1층-1구역',
//  '경계구역', '1234567890', '발생기기', 'MN', '경보발생',sg_Alarm);

end;

procedure TfmMonitoring.DeviceRcvAlarmData(aNodeNo, aReceiveData: string);
var
  stECUID : string;
  stMsgNo,stTime,stSubClass,stSubAddr,stZoneCode,stMode:string;
  stStatusCode,stStatusName,stPortNo,stState,stOperator : string;
  nResult : integer;
  nIndex : integer;
  stLocate,stAlarmName,stModeStr : string;
  nImageIndex : integer;
  stDeviceType : string;
begin

  stECUID := copy(aReceiveData,15,2);
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

  stMode:= UpperCase(stMode);
  if (IsDigit(stTime)= False) or
     (IsDigit(stECUID) = False) then    Exit;

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
{
  nIndex := AlarmCodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3) + stECUID );

  if nIndex < 0 then Exit;// 관제 권한이 없음

  stLocate := AlarmLocateList.Strings[nIndex]; //경계구역 위치
  stAlarmName:= AlarmListView.Items[nIndex].Caption; // 경계구역 명

  AlarmListView.Items[nIndex].SubItems[2]:= stMode;
  IntAlarmListView.Items[nIndex].SubItems[2]:= stMode;
  AlarmListView.Items[nIndex].SubItems[3]:= InttoStr(nResult);
  IntAlarmListView.Items[nIndex].SubItems[3]:= InttoStr(nResult);
  {존 모드별 아이콘 변경}
{  nImageIndex := 2;
  case stMode[1] of
   'A': begin nImageIndex:= 4; stModeStr:= '경계모드[A]' end;
   'D': begin nImageIndex:= 3; stModeStr:= '해제모드[D]' end;
   'T': begin nImageIndex:= 6; stModeStr:= '시험모드[T]' end;
   'I': begin nImageIndex:= 7; stModeStr:= '등록모드[I]' end;
   'P': begin nImageIndex:= 8; stModeStr:= '순회모드[P]' end;
  else  begin nImageIndex:= 3; stModeStr:= '미등록모드['+stMode[1]+']' end;
  end;
  AlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
  IntAlarmListView.Items[nIndex].ImageIndex:= nImageIndex;


   //nResult: 0:정상,1:알람,-1미등록
  nResult:= GetStatusCode(stStatusCode,stStatusName);

  //통신이상은 경계 아이콘에 표시 하지 않는다.
  if stStatusCode <> 'NF' then
  begin
    if nResult = 1 then
    begin
      AlarmListView.Items[nIndex].StateIndex:= 3;
      IntAlarmListView.Items[nIndex].StateIndex:= 3;
    end
    else
    begin
      AlarmListView.Items[nIndex].StateIndex:= -1;
      IntAlarmListView.Items[nIndex].StateIndex:= -1;
    end;
  end;

  if nResult < 1 then Exit; //정상인 경우 빠져 나감

  stDeviceType:=  stSubCLass +'['+ stSubAddr + ']';

  if stStatusName = '' then  stStatusName:= stSubCLass + stSubAddr + ' '+ stStatusName;

  stStatusName := stStatusName + '/' + stModeStr;

  stTime:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);

{  InsertAlarmList(stTime, //시간
                  stLocate, //위치정보
                  stAlarmName, //경계구역명칭
                  stECUID +'['+stMsgNo+']',  //주장치번호[메시지번호]
                  stDeviceType,         //발생기기[번호]
                  stStatusCode + '/' + stPortNo,  //이벤트코드
                  stStatusName,sg_Alarm);  //이벤트 내용
  InsertAlarmList(stTime, //시간
                  stLocate, //위치정보
                  stAlarmName, //경계구역명칭
                  stECUID +'['+stMsgNo+']',  //주장치번호[메시지번호]
                  stDeviceType,         //발생기기[번호]
                  stStatusCode + '/' + stPortNo,  //이벤트코드
                  stStatusName,sg_IntAlarm);  //이벤트 내용 }


end;

function TfmMonitoring.GetStatusCode(aStatusCode: string;
  var aStatusName: string): integer;
var
  stSql : string;
begin
  Result:= -1;
  aStatusName := '';

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
  end;

end;

procedure TfmMonitoring.InsertAlarmList(aTime, aMeetCode, aMeetFloor,
  aMeetName, aState: string;
  List: TAdvStringGrid);
begin

  with List do
  begin
    if Cells[0,1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    Cells[0,1] := aTime;   //발생시간
    Cells[1,1] := aMeetCode; //위치
    Cells[2,1] := aMeetFloor; //경계구역
    Cells[3,1] := aMeetName; //주장치번호
    Cells[4,1] := aState; //기기번호
  end;

end;

procedure TfmMonitoring.Action_ReloadExecute(Sender: TObject);
begin
  //Action_LoctionLoadExecute(Self);
  Action_DeviceLoadExecute(Self);
  Action_DoorLoadExecute(Self);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  //SocketWatchTimer.Enabled := True;
end;

procedure TfmMonitoring.RcvChangeDoorData(aNodeNo, aReceiveData: string);
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
begin
  //0434K1123456700c6
  //19쨰 ~
  //D20000504161543370000O D3

  if Length(aReceiveData) < 40 then    Exit;

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
        doorListView.Items[nIndex].StateIndex:= 0;
        //IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        doorListView.Items[nIndex].StateIndex:= -1;
        //IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        doorListView.Items[nIndex].StateIndex:= 1;
        //IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        doorListView.Items[nIndex].StateIndex:= -1;
        //IntdoorListView.Items[nIndex].StateIndex:= -1;
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
        doorListView.Items[nIndex].ImageIndex:=0;
        //IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
        doorListView.Items[nIndex].ImageIndex:=1;
        //IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
    'T'://장시간 열림
      begin
        stTimeStr:= '20'+ Copy(stTime,1,2)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= doorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '장시간 열림');
      end;
    'U'://해정이상
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= doorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문열기 실패');
      end;
    'L'://시정이상
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= doorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문닫기 실패');
      end;
  end;
  doorListView.Refresh;

end;

procedure TfmMonitoring.RcvDoorControl(aNodeNo, aReceiveData: string);
var
  stECUID: String;
  stDoorNo: String;
  cMsgNo: Char;
  nIndex  : Integer;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;

begin
  //SHowMessage(ReceiveData);

  stECUID := Copy(aReceiveData,15,2);
  stDoorNo:= aReceiveData[21];
  nIndex:= DoorCodeList.IndexOf(FillzeroNumber(strtoint(aNodeNo),3) + stECUID + stDoorNo);
  //SHowMessage(DeviceID+aDoorNo + #13 + InttoStr(aINdex));
  if nIndex < 0 then    Exit;

  cDoorMode2:= aReceiveData[24];    //Posi/Nega
  cDoorMode:=  aReceiveData[25];    //운영/개방
  cDoorState:= aReceiveData[26];    //문상태


  if cDoorMode2 <> '1' then
  begin
    Case cDoorMode of
      '0':
      begin
        doorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        doorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        doorListView.Items[nIndex].StateIndex:= 1;
        //IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        doorListView.Items[nIndex].StateIndex:= -1;
        //IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;

  end;

  case cDoorState of
    'C': //닫힘
      begin
        doorListView.Items[nIndex].ImageIndex:=0;
        //IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
        doorListView.Items[nIndex].ImageIndex:=1;
        //IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
  end;
  doorListView.Refresh;

end;



procedure TfmMonitoring.sg_IntAccessKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  st: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      st:= Cells[7,Row];
      if st <> '' then ClipBoard.SetTextBuf(PChar(st));
    end;
  end;

end;

procedure TfmMonitoring.N19Click(Sender: TObject);
begin
  doorListView.ViewStyle := vsIcon;

end;

procedure TfmMonitoring.N20Click(Sender: TObject);
begin
  doorListView.ViewStyle := vsList;

end;

procedure TfmMonitoring.N15Click(Sender: TObject);
begin
  IntDoorListView.ViewStyle := vsIcon;

end;

procedure TfmMonitoring.N16Click(Sender: TObject);
begin
  IntDoorListView.ViewStyle := vsList;

end;

procedure TfmMonitoring.DisConnectDoor(aDoorID: string);
begin
  if DoorCodeList.IndexOf(aDoorID) < 0 then Exit;

  doorListView.Items[DoorCodeList.IndexOf(aDoorID)].ImageIndex:=2;
  doorListView.Items[DoorCodeList.IndexOf(aDoorID)].StateIndex := -1;
  //IntdoorListView.Items[DoorCodeList.IndexOf(aDoorID)].ImageIndex:=2;
  //IntdoorListView.Items[DoorCodeList.IndexOf(aDoorID)].StateIndex := -1;

end;

procedure TfmMonitoring.DisConnectAlarm(aAlarmID: string);
begin
  if AlarmCodeList.IndexOf(aAlarmID) < 0 then Exit;

  AlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].ImageIndex:=AlarmPImageIndex;
  AlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].StateIndex := -1;
  IntAlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].ImageIndex:=AlarmPImageIndex;
  AlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].StateIndex := -1;

end;

procedure TfmMonitoring.mn_LocationMapClick(Sender: TObject);
var
  stLocateID : string;
  stBuildingCode,stFloorCode,stSectorCode:string;
begin
{  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  stBuildingCode := copy(stLocateID,1,3);
  stFloorCode := copy(stLocateID,4,3);
  stSectorCode := copy(stLocateID,7,3);
  
  if bLocationMapShow then  fmLocationMap.MapFree;

  if Not bLocationMapShow then
  begin
    fmLocationMap:= TfmLocationMap.Create(Self);
    fmLocationMap.DeviceNameList := TStringList.Create;
    fmLocationMap.aBuildingCode := stBuildingCode;
    fmLocationMap.aFloorCode := stFloorCode;
    fmLocationMap.aSectorCode := stSectorCode;
    bLocationMapShow := True;

    fmLocationMap.SHow;
    fmLocationMap.LocationMapShow;
    fmLocationMap.bActive := True;
  end;
}
end;

procedure TfmMonitoring.CommandArrayCommandsTCommand5Execute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
  stCmd : string;
begin
  stCmd := Params.Values['COMMAND'];
  stValue := Params.Values['VALUE'];

  if stCmd = 'LocationMap' then
  begin
    if stValue = 'TRUE' Then
      bLocationMapShow := True
    else bLocationMapShow := False;
  end
  else if stCmd = 'DeviceMap' then
  begin
    if stValue = 'TRUE' Then
      bDeviceMapShow := True
    else bDeviceMapShow := False;
  end;

//
end;

procedure TfmMonitoring.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  stValue : string;
begin
//  Action_LoctionLoadExecute(Self);
  Action_DeviceLoadExecute(Self);
  Action_DoorLoadExecute(Self);


  self.FindSubForm('Main').FindCommand('MONITOR').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('MONITOR').Execute;
  sg_Access.ColWidths[1] := 0;
  if Not ReaderNOShow then sg_Access.ColWidths[3] := 0;
  if Not ReaderLocationShow then sg_Access.ColWidths[4] := 0;
  //if Not ApproveCodeShow then sg_Access.ColWidths[5] := 0;
  //if Not CardModeShow then sg_Access.ColWidths[12] := 0;
  //sg_IntAccess.ColWidths[3] := 0;

  //Form_Initialize;
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  Panel1.Width := ini_fun.ReadInteger('Monitoring','DeviceWidth',217);


  Panel3.Height := ini_fun.ReadInteger('Monitoring','Access1Height',273);

  stValue := ini_fun.ReadString('Monitoring','DoorListView','vsIcon');
  if UpperCase(stValue) = 'VSICON' then
  begin
    doorListView.ViewStyle := vsIcon;
  end  else
  begin
    doorListView.ViewStyle := vsList;
  end;

  ini_fun.Free;

end;

procedure TfmMonitoring.PageControl1Change(Sender: TObject);
begin
  //showmessage(PageControl1.ActivePage.Name);
  UPDATETB_USERCONFIG('MONITOR','DEVICETAB',PageControl1.ActivePage.Name)
end;

function TfmMonitoring.UPDATETB_USERCONFIG(aConfigGroup,aConfigID,
  aValue: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
{  result := False;
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
}
end;

function TfmMonitoring.InsertTB_USERCONFIG(aConfigGroup,aConfigID,
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

procedure TfmMonitoring.PageControl2Change(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','WATCHTAB',PageControl2.ActivePage.Name)
end;

procedure TfmMonitoring.Panel1Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','DEVICEW',inttostr(Panel1.Width))
end;

procedure TfmMonitoring.Panel3Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','ACCESSH',inttostr(Panel3.Height))
end;

procedure TfmMonitoring.Panel9Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','PATROLH',inttostr(Panel9.Height))
end;

procedure TfmMonitoring.Panel12Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','INTEGH',inttostr(Panel12.Height))
end;

procedure TfmMonitoring.Panel15Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','INTATH',inttostr(Panel15.Height))
end;

procedure TfmMonitoring.Panel14Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','INTPTW',inttostr(Panel14.Width))
end;

procedure TfmMonitoring.Form_Initialize;
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
  stSql := stSql + ' AND US_CONFGROUP = ''MONITOR''';

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

procedure TfmMonitoring.MenuItem1Click(Sender: TObject);
var
  stAlarmID : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.MenuItem2Click(Sender: TObject);
var
  stAlarmID : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;




procedure TfmMonitoring.N1Click(Sender: TObject);
var
  stDoorID : string;
  stDoorName : string;
begin
{  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID := DoorCodeList[IntdoorListView.ItemIndex];
  stDoorName := IntdoorListView.Items[IntdoorListView.ItemIndex].Caption;

  
  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stDoorID;
    fmDeviceMap.DeviceName := stDoorName;
    fmDeviceMap.DeviceType := '3';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;
}
end;

procedure TfmMonitoring.N3Click(Sender: TObject);
var
  stDoorID : string;
  stDoorName : string;
begin
{  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];
  stDoorName := doorListView.Items[doorListView.ItemIndex].Caption;
  
  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stDoorID;
    fmDeviceMap.DeviceName := stDoorName;
    fmDeviceMap.DeviceType := '3';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;
}
end;

procedure TfmMonitoring.MenuItem4Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
begin
{  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];
  stAlarmName := AlarmListView.Items[AlarmListView.ItemIndex].Caption;
  
  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stAlarmID;
    fmDeviceMap.DeviceName := stAlarmName;
    fmDeviceMap.DeviceType := '4';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;
}
end;

procedure TfmMonitoring.N11Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
begin
{  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[IntAlarmListView.ItemIndex];
  stAlarmName := AlarmListView.Items[IntAlarmListView.ItemIndex].Caption;
  
  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stAlarmID;
    fmDeviceMap.DeviceName := stAlarmName;
    fmDeviceMap.DeviceType := '4';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;
}
end;

procedure TfmMonitoring.N2Click(Sender: TObject);
var
  stDoorID : string;
  stDoorName : string;
  stLocateName : string;
begin
{  if IntdoorListView.SelCount < 1 then Exit;
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
}
end;

procedure TfmMonitoring.N4Click(Sender: TObject);
var
  stDoorID : string;
  stDoorName : string;
  stLocateName : string;
begin
{  if doorListView.SelCount < 1 then Exit;
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
}
end;

procedure TfmMonitoring.N12Click(Sender: TObject);
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

procedure TfmMonitoring.MenuItem5Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
  stLocateName : string;
begin
{  if AlarmListView.SelCount < 1 then Exit;
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
}
end;


procedure TfmMonitoring.N22Click(Sender: TObject);
begin
  AlarmListView.ViewStyle := vsIcon;

end;

procedure TfmMonitoring.N23Click(Sender: TObject);
begin
  AlarmListView.ViewStyle := vsList;

end;

procedure TfmMonitoring.CommandArrayCommandsTCommand6Execute(
  Command: TCommand; Params: TStringList);
var
  stMeetCode : string;
  stMeetState,stMeetFloor,stMeetName,stState: string;
  nIndex : integer;
begin
  stMeetCode := Params.Values['MeetCode'];
  stMeetState := Params.Values['MeetState'];

  nIndex := AlarmCodeList.IndexOf(stMeetCode);
  if nIndex < 0 then Exit;

  if stMeetState = 'S' then
  begin
    AlarmListView.Items[nIndex].ImageIndex:= AlarmSImageIndex;
    AlarmListView.Items[nIndex].StateIndex := -1;
    stState := '입실';
  end
  else if stMeetState = 'N' then
  begin
    AlarmListView.Items[nIndex].ImageIndex:= AlarmNImageIndex;
    AlarmListView.Items[nIndex].StateIndex := -1;
    stState := '퇴실';
  end
  else
  begin
    AlarmListView.Items[nIndex].ImageIndex:= AlarmPImageIndex ;
    AlarmListView.Items[nIndex].StateIndex := -1;
    if stMeetState = '3' then stState := 'Connect'
    else stState := '단선';
  end;


  stMeetFloor := AlarmListView.Items[nIndex].SubItems[1];
  stMeetName := AlarmListView.Items[nIndex].SubItems[2];

  if stMeetState <> '3' then InsertAlarmList( formatDateTime('yyyy-mm-dd HH:MM:SS',now),stMeetCode,stMeetFloor,stMeetName,stState,sg_Alarm);


end;

procedure TfmMonitoring.CommandArrayCommandsTCommand7Execute(
  Command: TCommand; Params: TStringList);
var
  stData:string;
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
begin
  stData := Params.Values['Data'];
  aTreeView := TreeView_Device;
  aNode:= aTreeView.Items[0];
  if aNode = nil then Exit;
  aNode.StateIndex:= -1;
//Exit;

  if stData = 'CONNECT' then
  begin
    if aNode.ImageIndex <> 0 then aNode.ImageIndex:=0;
    if aNode.SelectedIndex <> 0 then  aNode.SelectedIndex:=0;
  end else if stData = 'DISCONNECT' then
  begin
    if aNode.ImageIndex <> 15 then aNode.ImageIndex:=15;
    if aNode.SelectedIndex <> 15 then  aNode.SelectedIndex:=15;
  end;

end;

procedure TfmMonitoring.CommandArrayCommandsTCommand8Execute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
end;

procedure TfmMonitoring.CommandArrayCommandsTCommand9Execute(
  Command: TCommand; Params: TStringList);
var
  stLogin : string;
begin
  stLogin := Params.Values['Data'];
  setLogin(stLogin);

end;

procedure TfmMonitoring.setLogin(aLogin: string);
begin
  if aLogin = 'LOGIN' then
  begin
    TreeView_Device.Enabled := True;
    doorListView.Enabled := True;
  end else
  begin
    TreeView_Device.Enabled := False;
    doorListView.Enabled := False;
  end;

end;

procedure TfmMonitoring.CommandArrayCommandsTCommand10Execute(
  Command: TCommand; Params: TStringList);
var
  stReceiveData : string;
  stNodeNo : string;
begin
  stNodeNo := FillZeroNumber(strtoint(Params.Values['NODENO']),3);
  stReceiveData := Params.Values['Data'];
  if UpperCase(stReceiveData) = 'CONNECTED' then
  begin
    ConnectNode('N' + stNodeNo);
  end else
  begin
    DisConnectNode('N' + stNodeNo);
  end;
end;

procedure TfmMonitoring.FormActivate(Sender: TObject);
begin
{  Try
    self.WindowState := wsMaximized;
  Except
  End; } 
  StateSendTimer1.Enabled := True;
end;

procedure TfmMonitoring.NEGATIVE1Click(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDMODE'+ DATADELIMITER + stDoorID + DATADELIMITER + 'N' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  Delay(200);
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.NEGTIVE1Click(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDMODE'+ DATADELIMITER + stDoorID + DATADELIMITER + 'N' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  Delay(200);
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.sg_AccessDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft : integer;
  nTop : integer;
begin
  if (AROW < (Sender as TAdvStringGrid).FixedRows) then
  begin

    DataInCell := (Sender as TAdvStringGrid).Cells[Acol,Arow];

    with (Sender as TAdvStringGrid).Canvas do
    begin
      FillRect(Rect);  //켄버스를 칠한다.(기본값은 흰색)

      if DataInCell <> '' then
      begin
        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //문자를 뿌려준다.. 기본은 검정색
      end;
    End;
  End;
end;

procedure TfmMonitoring.StateSendTimer1Timer(Sender: TObject);
begin
  StateSendTimer1.Enabled := False;
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmMonitoring.TreeView_DeviceDblClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
  stDoorID : string;
  nIndex : integer;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  if stDeviceID[1] = 'D' then
  begin
    stDoorID := copy(stDeviceID,2,6);
    nIndex := DoorCodeList.IndexOf(stDoorID);
    doorListView.ItemIndex := nIndex;
    doorListView.SetFocus;
  end;
//
end;

procedure TfmMonitoring.doorListViewDblClick(Sender: TObject);
var
  stDoorID : string;
  nIndex : integer;
  Node: TTreeNode;
  stCaption : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];
  stDoorID := 'D' + stDoorID;
  nIndex := DeviceCodeList.IndexOf(stDoorID);
  stCaption := DeviceCaptionList.Strings[nIndex];
  Node := GetNodeByText(TreeView_Device,stCaption,True);
  if Node = nil then Exit;
  Node.Selected := True;
  Node.Expanded := True;
  TreeView_Device.SetFocus;
end;

procedure TfmMonitoring.ShowAccessEvent(aSCSResult, aAuthType, aTimestr, aNodeNo,
  aECUID, aDoorNo, aReaderNo, aCardNo, aEmName, aCompanyName, aJijumName,
  aEmCode, aPosiName: string);
var
  stProcess : string;
  stAuthName : string;
  stLocationName : string;
  stDoorName : string;
  stDeviceID : string;
  nIndex : integer;
begin
  case strtoint(aSCSResult) of
    -3 : stProcess := '카드이벤트발생';
    -2 : stProcess := 'DB서버접속실패';
    -1 : stProcess := 'DB결과값없음';
    0  : stProcess := 'DB미승인';
    1  : stProcess := 'DB승인';
    2  : stProcess := '기기전송실패';
    3  : stProcess := '기기접속실패';
    4  : stProcess := '기기전송성공';
    5  : stProcess := '기기전송수신성공';
    6  : stProcess := '출입승인성공';
  else
    stProcess := aSCSResult;
  end;

  stAuthName := GetAuthName(aAuthType);

  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aECUID + aDoorNo;
  nIndex := DoorCodeList.IndexOf(stDeviceID);
  if nIndex < 0 then //식수 데이터 이거나 출입관제 권한이 없음
  begin
    Exit;
  end else
  begin
    stDoorName := doorListView.Items[nIndex].Caption;
  end;

  InsertDOORList(stProcess, stAuthName, aTimestr,
  '', stDoorName, aReaderNo, '내/외부', aCardNo, aEmName,
  aCompanyName, aJijumName, aEmCode, '',sg_Access);

end;

function TfmMonitoring.GetAuthName(aAuthType: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin

  result := '';
  stSql := 'Select * from TB_AUTHTYPE ';
  stSql := stSql + ' Where AT_CODE = ''' + aAuthType + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    With TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        on E : Exception do
        begin
          LogSave(ExeFolder + '\..\log\Dberror' + FormatDateTime('yyyymmdd',now) + '.log',E.Message + ':' + stSql  );
          Exit;
        end;

      End;
      if recordCount < 1 then Exit;
      result := FindField('AT_NAME').AsString;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

initialization
  RegisterClass(TfmMonitoring);
Finalization
  UnRegisterClass(TfmMonitoring);

end.
