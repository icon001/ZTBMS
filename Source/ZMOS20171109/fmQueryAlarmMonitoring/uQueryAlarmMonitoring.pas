unit uQueryAlarmMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, uSubForm, CommandArray, StdCtrls, ImgList,
  ToolPanels, Shader, ActnList, Menus, Grids, BaseGrid, AdvGrid,Clipbrd,
  Buttons,ADODB,ActiveX;

type
  TfmQueryAlarmMonitoring = class(TfmASubForm)
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
  private
    { Private declarations }
    DeviceCodeList : TStringList; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
    DeviceStateList : TStringList;  //기기의 상태정보를 가지고 있다. (C:Connect,D:Disconnect);
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
    DepartCodeList : TStringList; //부서코드를 가지고 있다.
    DepartNameList : TStringList; //부서명칭을 가지고 있다.
    LocationMapList : TStringList; //LocationMap을 가지고 있다.

    procedure DisConnectServer;
    procedure ConnectServer;
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
    procedure RcvCardReadData(aNodeNo,aReceiveData:string); //카드리딩 데이터 처리
    procedure DeviceRcvAlarmData(aNodeNo,aReceiveData: string); //알람 데이터 처리
    procedure RcvChangeDoorData(aNodeNo,aReceiveData:string); //상태변경 데이터 처리
    procedure RcvDoorControl(aNodeNo,aReceiveData:string);
    Function GetBuildingName(aBuildingCode:string):string;
    Function GetFloorName(aBuildingCode,aFloorCode:string):string;
    Function GetAreaName(aBuildingCode,aFloorCode,aAreaCode:string):string;
    Function GetPermitState(aPermit:string):string;
    Function GetUserInfo(aCardNo:string; var stUserName,stCompanyName,stDepartName,stEmID:string):Boolean;
    procedure LoadCompanyCode;
    procedure LoadDepartCode;
    procedure InsertDOORList(aPermitCode,aPermit,aTime,aLocationName,aDoorName,aCardNo,aUserName,
    aCompanyName,aDepartName,aEmID:string;List:TAdvStringGrid);
    procedure   InsertAlarmList(aTime, //시간
                  aLocateName, //위치정보
                  aAlarmName, //경계구역명칭
                  aDeviceID,  //주장치번호[메시지번호]
                  aDeviceType,         //발생기기[번호]
                  aStatusCode,  //이벤트코드
                  aStatusName,
                  aAlaramCode:string;List:TAdvStringGrid);  //이벤트 내용
    procedure Insertsg_SensorList(aTime,aNodeNo,aECUID,aPortNo,aDeviceType,aStatusCode,aStatusName,aPortName:string;List:TAdvStringGrid);

    Function GetStatusCode(aStatusCode:string;var aStatusName :string) : integer;
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
    procedure ACDataProcess(aNodeNo,aECUID,aData:string); //출입데이터
    procedure DEVICEDataProcess(aNodeNo,aECUID,aData:string);
    procedure DoorDataProcess(aNodeNo,aEcuID,aDoorNo,aType,aACTION,aData:string);
    procedure AlarmDataProcess(aNodeNo,aEcuID,aType,aACTION,aData:string);
  public
    { Public declarations }
    bLocationMapShow : Boolean;
    bDeviceMapShow : Boolean;
  end;

var
  fmQueryAlarmMonitoring: TfmQueryAlarmMonitoring;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uLocationMap,
  uDeviceMap,
  uDeviceInfo,
  uZonePosition, uMDBSql, uPostGreSql, uMssql;
{$R *.dfm}




procedure TfmQueryAlarmMonitoring.FormCreate(Sender: TObject);
begin

  DeviceCodeList := TStringList.Create;
  DeviceStateList := TStringList.Create;
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
  DepartCodeList := TStringList.Create;
  DepartNameList := TStringList.Create;
  LocationMapList := TStringList.Create;
  LocationMapList.Clear;

  bLocationMapShow := False;
  bDeviceMapShow := False;
  sg_Alarm.ColWidths[7] := 0;
  sg_IntAlarm.ColWidths[7] := 0;

end;

procedure TfmQueryAlarmMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('MONITOR').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('MONITOR').Execute;
  DeviceCodeList.Free;
  DeviceStateList.Free;
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
  DepartCodeList.Free;
  DepartNameList.Free;
  LocationMapList.Free;

  Action := caFree;

end;

procedure TfmQueryAlarmMonitoring.Action_LoctionLoadExecute(Sender: TObject);
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

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectDongLocation
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectDongLocation
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectDongLocation
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

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectFloorLocation
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectFloorLocation
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectFloorLocation
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
            cNode.ImageIndex:=8;
            cNode.SelectedIndex:=8;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
        end;
      end;

      Next;
    end;
  end;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectAreaLocation
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectAreaLocation
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectAreaLocation
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
            cNode.ImageIndex:=9;
            cNode.SelectedIndex:=9;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
        end;
      end;

      Next;
    end;
  end;

  if AccessUse then
  begin
    //출입문정보 로딩
    stSql := ' Select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE, ';
    stSql := stSql + ' b.AC_NODENO,b.AC_MCUID,b.AC_ECUID,b.DO_DOORNO,b.DO_DOORNONAME ';
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

        Next;
      end;
    end;
  end;

  if PatrolUse then
  begin
    //경비구역 정보 로딩
    stSql := ' Select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE, ';
    stSql := stSql + ' b.AC_NODENO,b.AC_MCUID,b.AC_ECUID,b.AL_ZONENAME ';
    stSql := stSql + ' From TB_ALARMDEVICE b ';
    if Not IsMaster then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE a ';
      stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
    end;
{    stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
    stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND b.AC_NODENO = c.AC_NODENO ';
    stSql := stSql + ' AND b.AC_ECUID = c.AC_ECUID ) ';  }
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
        Next;
      end;
    end;
  end;

end;

procedure TfmQueryAlarmMonitoring.Action_DeviceLoadExecute(Sender: TObject);
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
  if bSeverConnected then
  begin
    aNode.ImageIndex:=0;
    aNode.SelectedIndex:=0;
  end else
  begin
    aNode.ImageIndex:=14;
    aNode.SelectedIndex:=14;
  end;
  aNode.StateIndex:= -1;
  DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));
  DeviceCodeList.Add('00000');
  DeviceStateList.Add('D');
  DeviceCaptionList.Add('서버');

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectMCUDeviceLoad
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectMCUDeviceLoad
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectMCUDeviceLoad
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
      stLocationCaption := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + ':' + FindField('AC_MCUIP').AsString + ':' + FindField('AC_MCUPORT').AsString;
      DeviceCodeList.Add('N' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3));
      DeviceStateList.Add('D');
      DeviceCaptionList.Add(stLocationCaption);
      DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //LAN의 접속시간 체크하자...
      bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
      bNode.ImageIndex:=3;
      bNode.SelectedIndex:=3;
      bNode.StateIndex:= -1;

      Next;
    end;
  end;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectECUDeviceLoad
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectECUDeviceLoad
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectECUDeviceLoad
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
      stLocationCaption := FindField('AC_ECUID').asstring + ':' + FindField('AC_DEVICENAME').asstring;
      DeviceCodeList.Add('E' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring);
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
          cNode.ImageIndex:=5;
          cNode.SelectedIndex:=5;
          cNode.StateIndex:= -1;
        end;
      end;

      Next;
    end;
  end;

  if AccessUse then
  begin
    if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_DOORJoinAdmin('','','')
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_DOORJoinAdmin('','','')
    else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectTB_DOORJoinAdmin('','','')
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
        stLocationCaption := FindField('DO_DOORNO').asstring + ':' + FindField('DO_DOORNONAME').asstring;
        DeviceCodeList.Add('D' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring + FindField('DO_DOORNO').asstring);
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

  if PatrolUse then
  begin
    //경비구역 로딩
    if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ALARMDEVICEJoinAdmin('','','')
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_ALARMDEVICEJoinAdmin('','','')
    else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectTB_ALARMDEVICEJoinAdmin('','','')
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
        stLocationCaption :=  FindField('AL_ZONENAME').asstring;
        DeviceCodeList.Add('D' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring );
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
            cNode.ImageIndex:=12;
            cNode.SelectedIndex:=12;
            cNode.StateIndex:= -1;
          end;
        end;

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
      stSql := stSql + ' Inner Join TB_ADMINFOOD b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
    end;
    stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    if Not IsMaster then
      stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
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
        stLocationCaption := FindField('FO_DOORNO').asstring + ':' + FindField('FO_NAME').asstring;
        DeviceCodeList.Add('D' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring + FindField('FO_DOORNO').asstring );
        DeviceStateList.Add('D');
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

        Next;
      end;
    end;
  end;

end;

procedure TfmQueryAlarmMonitoring.SocketWatchTimerTimer(Sender: TObject);
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

procedure TfmQueryAlarmMonitoring.DisConnectNode(aNodeNo: string);
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
  bRefresh := False;
  nIndex := DeviceCodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  if DeviceStateList.Strings[nIndex] = 'D' then exit;
  
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
    if copy(stECUCode,1,1) = 'E' then //ECU코드이면
    begin
      //해당노드의 ECU인지 체크해서 해당 ECU이면 이미지 변경
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

procedure TfmQueryAlarmMonitoring.ConnectNode(aNodeNo: string);
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
  aNode.ImageIndex:=2;
  aNode.SelectedIndex:=2;
  aNode.StateIndex:= -1;
  aTreeView.Refresh;
end;


procedure TfmQueryAlarmMonitoring.ConnectECU(aECUID: string);
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
  if DeviceStateList.Strings[nIndex] = 'C' then exit;
  stDoorID:= aECUID + '1';
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  sleep(1);
  stDoorID:= aECUID + '2';
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

  stCaption := DeviceCaptionList.Strings[nIndex];
  DeviceStateList.Strings[nIndex] := 'C';
  aTreeView := TreeView_Device;
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  if aNode.ImageIndex <> 4 then aNode.ImageIndex:=4;
  if aNode.SelectedIndex <> 4 then aNode.SelectedIndex:=4;
  aNode.StateIndex:= -1;
  aTreeView.Refresh;
end;

procedure TfmQueryAlarmMonitoring.DisConnectECU(aECUID: string);
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
  if DeviceStateList.Strings[nIndex] = 'D' then exit;
  DeviceStateList.Strings[nIndex] := 'D';
  stCaption := DeviceCaptionList.Strings[nIndex];

  aTreeView := TreeView_Device;

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
  if bRefresh then aTreeView.Refresh;
end;

procedure TfmQueryAlarmMonitoring.CommandArrayCommandsTCommand0Execute(
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

procedure TfmQueryAlarmMonitoring.Action_DoorLoadExecute(Sender: TObject);
begin
  DoorLoad('000','000','000',doorListView);
  DoorLoad('000','000','000',IntdoorListView);
end;

// 문정보를 로드  하여 해당 리스트에 조회 하자
procedure TfmQueryAlarmMonitoring.DoorLoad(aBuildingCode, aFloorCode,
  aAreaCode: string; DoorList: TListView);
var
  stSql : string;
  stDoorID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
  stCode : string;
begin
  DoorCodeList.Clear;
  DoorLocateList.Clear;
  DoorList.Clear;
  //Door정보 로딩
  stSql := ' Select a.DO_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
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
  if ( aBuildingCode <> '' ) and ( aBuildingCode <> '000' ) then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if ( aFloorCode <> '' ) and ( aFloorCode <> '000' ) then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if ( aAreaCode <> '' ) and ( aAreaCode <> '000' ) then
    stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' Group by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
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
      DoorList.Items.Add.Caption:= FindField('DO_DOORNONAME').asString;
      stDoorID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3) 
                 + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString ;
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
      DoorList.Items[I].ImageIndex:=2;

      inc(i);
      Next;
    end;
  end;
  DoorCodeList.Clear;
  for i:=0 to DoorList.Items.Count - 1 do
  begin
    stCode := DoorList.Items[I].SubItems.Strings[0];
    DoorCodeList.Add(DoorList.Items[I].SubItems.Strings[0]);  //문의 코드를 등록하자
  end;

end;

procedure TfmQueryAlarmMonitoring.AlarmLoad(aBuildingCode, aFloorCode,
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
  stSql := ' Select a.AL_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AL_ZONENAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  stSql := stSql + ' From TB_ALARMDEVICE a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  end;
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';   }
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  if ( aBuildingCode <> '' ) and ( aBuildingCode <> '000' ) then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if ( aFloorCode <> '' ) and ( aFloorCode <> '000' ) then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if ( aAreaCode <> '' ) and ( aAreaCode <> '000' ) then
    stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
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
      AlarmList.Items.Add.Caption:= FindField('AL_ZONENAME').asString;
      stAlarmID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                 + FindField('AC_ECUID').AsString;// + FillZeroNumber(FindField('AL_DEVICENO').AsInteger,3);
      AlarmList.Items[I].SubItems.Add(stAlarmID);     // 방범 ID
      //AlarmCodeList.Add(stAlarmID);  //방범아이디를 등록하자
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

      AlarmList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3)); //노드번호
      AlarmList.Items[I].SubItems.Add(FindField('AC_MCUID').AsString); //MCUID
      AlarmList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
      AlarmList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString); //알람아이디
      AlarmList.Items[I].ImageIndex:=2;

      inc(i);
      Next;
    end;
  end;
  AlarmCodeList.Clear;
  for i:=0 to AlarmList.Items.Count - 1 do
  begin
    AlarmCodeList.Add(AlarmList.Items[I].SubItems.Strings[0]);  //경비구역의 코드를 등록하자
  end;

end;

procedure TfmQueryAlarmMonitoring.Action_AlarmLoadExecute(Sender: TObject);
begin
  AlarmLoad('000','000','000',AlarmListView);
  AlarmLoad('000','000','000',IntAlarmListView);
end;

procedure TfmQueryAlarmMonitoring.Action_FoodLoadExecute(Sender: TObject);
begin
  FoodLoad('000','000','000');
end;

procedure TfmQueryAlarmMonitoring.FoodLoad(aBuildingCode, aFloorCode,
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
  FoodTab.TabVisible := False;
  Exit;
  //Food 정보 로딩
  stSql := ' Select a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO,a.FO_NAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE';
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
      stFOODID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                 + FindField('AC_ECUID').AsString + FindField('FO_DOORNO').AsString;
      FoodCodeList.Add(stFOODID);  //식수아이디를 등록하자
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

procedure TfmQueryAlarmMonitoring.pm_StateCheckClick(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmQueryAlarmMonitoring.pm_intiStateCheckClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmQueryAlarmMonitoring.pm_DoorOpenClick(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','출입승인')

end;

procedure TfmQueryAlarmMonitoring.pm_intiDoorOpenClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DOOROPEN'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','출입승인')

end;

procedure TfmQueryAlarmMonitoring.pm_OperateModeClick(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','운영모드')

end;

procedure TfmQueryAlarmMonitoring.pm_OpenModeClick(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPENMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','개방모드')

end;

procedure TfmQueryAlarmMonitoring.pm_intiOpenModeClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPENMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','개방모드')

end;

procedure TfmQueryAlarmMonitoring.pm_intiOperateModeClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntdoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntdoorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','운영모드')

end;

procedure TfmQueryAlarmMonitoring.CommandArrayCommandsTCommand1Execute(
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

procedure TfmQueryAlarmMonitoring.Menu_CurLocateClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  if AccessUse then
  begin
    DoorLoad(copy(stLocateID,1,3),copy(stLocateID,4,3),copy(stLocateID,7,3),doorListView);
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

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;


end;

procedure TfmQueryAlarmMonitoring.TreeView_LocationClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then TreeView_Location.PopupMenu:= nil
  else TreeView_Location.PopupMenu:= Popup_Locate;

end;

procedure TfmQueryAlarmMonitoring.TreeView_DeviceClick(Sender: TObject);
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
  if stDeviceID[1] = 'E' then  TreeView_Device.PopupMenu:= Popup_Device
  else TreeView_Device.PopupMenu:= nil;

end;

procedure TfmQueryAlarmMonitoring.Menu_DeviceTimeSyncClick(Sender: TObject);
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

procedure TfmQueryAlarmMonitoring.Menu_DeviceRebootClick(Sender: TObject);
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

procedure TfmQueryAlarmMonitoring.CommandArrayCommandsTCommand2Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmQueryAlarmMonitoring.menu_AlarmClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmQueryAlarmMonitoring.menu_AlarmDisableClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmQueryAlarmMonitoring.Menu_IntAlarmSettingClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[IntAlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','경계모드')

end;

procedure TfmQueryAlarmMonitoring.Menu_IntAlarmDisableClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[IntAlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','해제모드')

end;

procedure TfmQueryAlarmMonitoring.CommandArrayCommandsTCommand3Execute(
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

procedure TfmQueryAlarmMonitoring.RcvCardReadData(aNodeNo, aReceiveData: string);
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
begin
  if Length(aReceiveData) < 49 then Exit;

//  stMCUID :=    Copy(aReceiveData,8,7);
  stECUID :=    Copy(aReceiveData,15,2);
  stDoorNo:=     aReceiveData[21];
  stReaderNo:=   aReceiveData[22];
  stTime:= Copy(aReceiveData,24,12);
  stTime:= copy(FormatDateTime('yyyymmdd',Now),1,2) + stTime;

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
    stLocationName := DoorLocateList.Strings[nIndex];
  end;
  //카드승인유무체크
  stPermitCode:= aReceiveData[39];
  stPermit := GetPermitState(stPermitCode);

  if stMosGubun = 'DOOR' then
  begin
    InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stCardNo,stUserName,
    stCompanyName,stDepartName,stEmID,sg_Access);
    InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stCardNo,stUserName,
    stCompanyName,stDepartName,stEmID,sg_IntAccess);
  end
  else if stMosGubun = 'FOOD' then
    InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stCardNo,stUserName,
    stCompanyName,stDepartName,stEmID,sg_Food);



end;

procedure TfmQueryAlarmMonitoring.Menu_DeviceAllCardDownClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + stDeviceID + DATADELIMITER + 'Y' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

  self.FindSubForm('Main').FindCommand('CARDDOWNLOAD').Params.Values['VALUE'] := stDeviceID + 'A';
  self.FindSubForm('Main').FindCommand('CARDDOWNLOAD').Execute;

end;

procedure TfmQueryAlarmMonitoring.Menu_DeviceCardDownClick(Sender: TObject);
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

function TfmQueryAlarmMonitoring.GetAreaName(aBuildingCode, aFloorCode,
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

function TfmQueryAlarmMonitoring.GetBuildingName(aBuildingCode: string): string;
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

function TfmQueryAlarmMonitoring.GetFloorName(aBuildingCode,
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

function TfmQueryAlarmMonitoring.GetPermitState(aPermit: string): string;
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

function TfmQueryAlarmMonitoring.GetUserInfo(aCardNo: string; var stUserName,
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

procedure TfmQueryAlarmMonitoring.LoadCompanyCode;
var
  stSql : string;
begin
  CompanyCodeList.Clear;
  CompanyNameList.Clear;

  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';

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

procedure TfmQueryAlarmMonitoring.LoadDepartCode;
var
  stSql : string;
begin
  DepartCodeList.Clear;
  DepartNameList.Clear;

  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

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
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_DEPARTCODE').AsString );
      DepartNameList.Add(FindField('CO_NAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmQueryAlarmMonitoring.CommandArrayCommandsTCommand4Execute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
end;

procedure TfmQueryAlarmMonitoring.InsertDOORList(aPermitCode,aPermit, aTime, aLocationName,
  aDoorName, aCardNo, aUserName, aCompanyName, aDepartName, aEmID: string;List:TAdvStringGrid);

begin

  with List do
  begin
    ColWidths[3] := 0;  //상태코드
    if Cells[0,1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    Cells[0,1] := aTime;   //발생시간
    Cells[1,1] := copy(aLocationName,10,length(aLocationName)-9); //위치
    Cells[2,1] := aDoorName; //출입문
    Cells[3,1] := aPermitCode; //승인상태 코드
    Cells[4,1] := aPermit; //승인상태
    Cells[5,1] := aCardNo; //카드번호
    Cells[6,1] := aUserName; //이름
    Cells[7,1] := aCompanyName ; //회사명
    Cells[8,1] := aDepartName ; //부서명
    Cells[9,1] := aEmID; //사번
    if Not Isdigit(aPermitCode) then
    begin
      RowColor[1] := clFuchsia;
    end;
  end;


end;

procedure TfmQueryAlarmMonitoring.Button1Click(Sender: TObject);
begin
 InsertDOORList('1','출입승인', '2003-01-11 11:11:11', '1동-1층-1구역',
  '문1', '1234567890', '홍길동', '회사', '부서', '1',sg_Access);
 InsertAlarmList( '2003-01-11 11:11:11', '1동-1층-1구역',
  '경계구역', '1234567890', '발생기기', 'MN', '경보발생','',sg_Alarm);

end;

procedure TfmQueryAlarmMonitoring.DeviceRcvAlarmData(aNodeNo, aReceiveData: string);
var
  stECUID : string;
  stMsgNo,stTime,stSubClass,stSubAddr,stZoneCode,stMode:string;
  stStatusCode,stStatusName,stPortNo,stState,stOperator : string;
  nResult : integer;
  nIndex : integer;
  stLocate,stAlarmName,stModeStr : string;
  nImageIndex : integer;
  stDeviceType : string;
  i : integer;
  bZoneSensor : Boolean; // 감지 상태 유무
  stPortName : string;
begin

//  stMCUID := copy(aReceiveData,8,7);
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

  stTime:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);

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
  nResult:= GetStatusCode(stStatusCode,stStatusName);
  if stPortNo <> '**' then    //포트 감지 인경우 무조건 뿌리자.
  begin
    nResult := 1;
    if stStatusName = '' then stStatusName := stStatusCode;
    stPortName := GetPortName(aNodeNo,stECUID,stPortNo);
    stStatusName := '[' + stPortName + ']' + stStatusName;    //어떤 조건으로 감지 되었는지 표시
  end;

  stDeviceType:=  stSubCLass +'['+ stSubAddr + ']';

  {존 모드별 아이콘 변경}
  nImageIndex := 2;
  case stMode[1] of
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
    DisplaySensorState(aNodeNo,stECUID,stPortNo,stMode,stSubCLass,stStatusCode,bZoneSensor);

    if bZoneSensor then Insertsg_SensorList(stTime,aNodeNo,stECUID,stPortNo,stDeviceType,stStatusCode,stStatusName,stPortName,sg_Sensor);
  end;

  nIndex := AlarmCodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3) + stECUID );

  if nIndex < 0 then Exit;// 관제 권한이 없음

  stLocate := AlarmLocateList.Strings[nIndex]; //경계구역 위치
  stAlarmName:= AlarmListView.Items[nIndex].Caption; // 경계구역 명

  AlarmListView.Items[nIndex].SubItems[2]:= stMode;
  IntAlarmListView.Items[nIndex].SubItems[2]:= stMode;
  AlarmListView.Items[nIndex].SubItems[3]:= InttoStr(nResult);
  IntAlarmListView.Items[nIndex].SubItems[3]:= InttoStr(nResult);

  AlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
  IntAlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
{  if (stSubCLass = 'MN') or (stSubCLass = 'EX')then
  begin
    if stStatusCode = 'NF' then //통신 이상이면
    begin
      AlarmListView.Items[nIndex].ImageIndex:= 2;
      IntAlarmListView.Items[nIndex].ImageIndex:= 2;
    end;
  end;   }

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

  //위치 정보 보기의 Map 에 알람 표시
  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).AlaramStateChange(aNodeNo,stECUID,stPortNo,stMode,inttostr(nResult));
  end;

  if nResult < 1 then Exit; //정상인 경우 빠져 나감


  InsertAlarmList(stTime, //시간
                  stLocate, //위치정보
                  stAlarmName, //경계구역명칭
                  stECUID +'['+stMsgNo+']',  //주장치번호[메시지번호]
                  stDeviceType,         //발생기기[번호]
                  stStatusCode + '/' + stPortNo,  //이벤트코드
                  stStatusName,
                  FillZeroNumber(strtoint(aNodeNo),3) + stECUID,
                  sg_Alarm);  //이벤트 내용
  InsertAlarmList(stTime, //시간
                  stLocate, //위치정보
                  stAlarmName, //경계구역명칭
                  stECUID +'['+stMsgNo+']',  //주장치번호[메시지번호]
                  stDeviceType,         //발생기기[번호]
                  stStatusCode + '/' + stPortNo,  //이벤트코드
                  stStatusName,
                  FillZeroNumber(strtoint(aNodeNo),3) + stECUID,
                  sg_IntAlarm);  //이벤트 내용


end;

function TfmQueryAlarmMonitoring.GetStatusCode(aStatusCode: string;
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

procedure TfmQueryAlarmMonitoring.InsertAlarmList(aTime, aLocateName, aAlarmName,
  aDeviceID, aDeviceType, aStatusCode, aStatusName,aAlaramCode: string;
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
    Cells[1,1] := copy(aLocateName,10,length(aLocateName)-9); //위치
    Cells[2,1] := aAlarmName; //경계구역
    Cells[3,1] := aDeviceID; //주장치번호
    Cells[4,1] := aDeviceType; //기기번호
    Cells[5,1] := aStatusCode; //발생코드
    Cells[6,1] := aStatusName; //이벤트내용
    Cells[7,1] := aAlaramCode; //AlarmCode
  end;

end;

procedure TfmQueryAlarmMonitoring.Action_ReloadExecute(Sender: TObject);
begin
  Action_LoctionLoadExecute(Self);
  Action_DeviceLoadExecute(Self);
  Action_DoorLoadExecute(Self);
  Action_AlarmLoadExecute(Self);
  Action_SensorLoadExecute(Self);
  LoadCompanyCode;
  LoadDepartCode;

//  SocketWatchTimer.Enabled := True;
end;

procedure TfmQueryAlarmMonitoring.RcvChangeDoorData(aNodeNo, aReceiveData: string);
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
begin
  //0434K1123456700c6
  //19쨰 ~
  //D20000504161543370000O D3

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
        doorListView.Items[nIndex].StateIndex:= 0;
        IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        doorListView.Items[nIndex].StateIndex:= -1;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        doorListView.Items[nIndex].StateIndex:= 1;
        IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        doorListView.Items[nIndex].StateIndex:= -1;
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
    'C': //닫힘
      begin
        doorListView.Items[nIndex].ImageIndex:=0;
        IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
        doorListView.Items[nIndex].ImageIndex:=1;
        IntdoorListView.Items[nIndex].ImageIndex:=1;
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
  //위치 정보 보기의 Map 에 상태 표시
  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(aNodeNo,stECUID,stDoorNo,cDoorMode,cDoorState,cDoorMode2);
  end;

end;

procedure TfmQueryAlarmMonitoring.RcvDoorControl(aNodeNo, aReceiveData: string);
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
begin
  //SHowMessage(ReceiveData);

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
        doorListView.Items[nIndex].StateIndex:= 0;
        IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        doorListView.Items[nIndex].StateIndex:= -1;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        doorListView.Items[nIndex].StateIndex:= 1;
        IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        doorListView.Items[nIndex].StateIndex:= -1;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;

  end;

  case cDoorState of
    'C': //닫힘
      begin
        doorListView.Items[nIndex].ImageIndex:=0;
        IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
        doorListView.Items[nIndex].ImageIndex:=1;
        IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
  end;
  doorListView.Refresh;

  //위치 정보 보기의 Map 에 상태 표시
  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(aNodeNo,stECUID,stDoorNo,cDoorMode,cDoorState,cDoorMode2);
  end;
end;

procedure TfmQueryAlarmMonitoring.sg_AccessClick(Sender: TObject);
var
  stSql : string;
  stCardNo : string;
  stImage : string;
begin
  ClearEmpInfo;
  stCardNo := sg_Access.Cells[5,sg_Access.Row];
  if stCardNo = '' then Exit;
  //stCardNo := '1234567890';

  stSql := 'select b.EM_IMAGE,b.EM_NAME,b.EM_CODE,b.CO_COMPANYNAME, ';
  stSql := stSql + ' b.CO_DEPARTNAME,b.PO_NAME ';
  stSql := stSql + ' From TB_CARD a ';
  stSql := stSql + ' Inner Join   ';
  stSql := stSql + ' ( select a.GROUP_CODE,a.EM_CODE,a.EM_NAME,a.CO_COMPANYCODE, ';
  stSql := stSql + ' b.CO_NAME as CO_COMPANYNAME,c.CO_NAME as CO_DEPARTNAME,';
  stSql := stSql + ' d.PO_NAME,a.EM_IMAGE ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_COMPANY b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_GUBUN = ''1'' )';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = c.CO_DEPARTCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''2'' )';
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
    ed_CompanyName.Text := FindField('CO_COMPANYNAME').AsString;
    ed_DepartName.Text := FindField('CO_DEPARTNAME').AsString;
  end;

end;

procedure TfmQueryAlarmMonitoring.ClearEmpInfo;
begin
  Image1.Picture.Graphic := nil;
  ed_Emname.Text := '';
  ed_Companyname.Text := '';
  ed_DepartName.Text := '';
  ed_Emid.Text := '';
end;


procedure TfmQueryAlarmMonitoring.sg_IntAccessKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  st: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      st:= Cells[5,Row];
      if st <> '' then ClipBoard.SetTextBuf(PChar(st));
    end;
  end;

end;

procedure TfmQueryAlarmMonitoring.N19Click(Sender: TObject);
begin
  doorListView.ViewStyle := vsIcon;

end;

procedure TfmQueryAlarmMonitoring.N20Click(Sender: TObject);
begin
  doorListView.ViewStyle := vsList;

end;

procedure TfmQueryAlarmMonitoring.N15Click(Sender: TObject);
begin
  IntDoorListView.ViewStyle := vsIcon;

end;

procedure TfmQueryAlarmMonitoring.N16Click(Sender: TObject);
begin
  IntDoorListView.ViewStyle := vsList;

end;

procedure TfmQueryAlarmMonitoring.DisConnectDoor(aDoorID: string);
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

  if bRefresh then
  begin
    doorListView.Refresh;
    IntdoorListView.Refresh;
  end;
end;

procedure TfmQueryAlarmMonitoring.DisConnectAlarm(aAlarmID: string);
begin
  if AlarmCodeList.IndexOf(aAlarmID) < 0 then Exit;

  AlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].ImageIndex:=2;
  AlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].StateIndex := -1;
  IntAlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].ImageIndex:=2;
  IntAlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].StateIndex := -1;
  AlarmListView.Refresh;
  IntAlarmListView.Refresh;
end;

procedure TfmQueryAlarmMonitoring.mn_LocationMapClick(Sender: TObject);
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
    LocationMapList.AddObject(stBuildingCode + stFloorCode + stSectorCode,fmLocationMap );
    TfmLocationMap(LocationMapList.Objects[LocationMapList.count - 1]).Show;
    TfmLocationMap(LocationMapList.Objects[LocationMapList.count - 1]).LocationMapShow;
    TfmLocationMap(LocationMapList.Objects[LocationMapList.count - 1]).bActive := True;

  //  bLocationMapShow := True;

  //  fmLocationMap.SHow;
  //  fmLocationMap.LocationMapShow;
  //  fmLocationMap.bActive := True;
  //end;

end;

procedure TfmQueryAlarmMonitoring.CommandArrayCommandsTCommand5Execute(
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

procedure TfmQueryAlarmMonitoring.FormShow(Sender: TObject);
begin
  Action_LoctionLoadExecute(Self);
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

//  SocketWatchTimer.Enabled := True;

  self.FindSubForm('Main').FindCommand('MONITOR').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('MONITOR').Execute;
  sg_Access.ColWidths[3] := 0;
  sg_IntAccess.ColWidths[3] := 0;

  Form_Initialize;

end;

procedure TfmQueryAlarmMonitoring.N1Click(Sender: TObject);
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
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmQueryAlarmMonitoring.N3Click(Sender: TObject);
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
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmQueryAlarmMonitoring.MenuItem4Click(Sender: TObject);
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
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmQueryAlarmMonitoring.N11Click(Sender: TObject);
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
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmQueryAlarmMonitoring.N2Click(Sender: TObject);
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

procedure TfmQueryAlarmMonitoring.N4Click(Sender: TObject);
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

procedure TfmQueryAlarmMonitoring.N12Click(Sender: TObject);
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

procedure TfmQueryAlarmMonitoring.MenuItem5Click(Sender: TObject);
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

procedure TfmQueryAlarmMonitoring.PageControl1Change(Sender: TObject);
begin
  //showmessage(PageControl1.ActivePage.Name);
  UPDATETB_USERCONFIG('MONITOR','DEVICETAB',PageControl1.ActivePage.Name)
end;

function TfmQueryAlarmMonitoring.UPDATETB_USERCONFIG(aConfigGroup,aConfigID,
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

function TfmQueryAlarmMonitoring.InsertTB_USERCONFIG(aConfigGroup,aConfigID,
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

procedure TfmQueryAlarmMonitoring.PageControl2Change(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','WATCHTAB',PageControl2.ActivePage.Name)
end;

procedure TfmQueryAlarmMonitoring.Panel1Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','DEVICEW',inttostr(Panel1.Width))
end;

procedure TfmQueryAlarmMonitoring.Panel3Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','ACCESSH',inttostr(Panel3.Height))
end;

procedure TfmQueryAlarmMonitoring.Panel6Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','ACCESSINFOW',inttostr(Panel6.Width))
end;

procedure TfmQueryAlarmMonitoring.Panel9Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','PATROLH',inttostr(Panel9.Height))
end;

procedure TfmQueryAlarmMonitoring.Panel12Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','INTEGH',inttostr(Panel12.Height))
end;

procedure TfmQueryAlarmMonitoring.Panel15Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','INTATH',inttostr(Panel15.Height))
end;

procedure TfmQueryAlarmMonitoring.Panel14Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('MONITOR','INTPTW',inttostr(Panel14.Width))
end;

procedure TfmQueryAlarmMonitoring.Form_Initialize;
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

procedure TfmQueryAlarmMonitoring.MenuItem1Click(Sender: TObject);
var
  stAlarmID : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','경계모드')

end;

procedure TfmQueryAlarmMonitoring.MenuItem2Click(Sender: TObject);
var
  stAlarmID : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[AlarmListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,'0','0000000000','해제모드')

end;

procedure TfmQueryAlarmMonitoring.DeviceConnectStatus(aReceiveData: string);
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

procedure TfmQueryAlarmMonitoring.AlarmListViewDblClick(Sender: TObject);
var
  nIndex : integer;
begin
// 여기에서 해당하는 알람 경고창 없애자...
  AlarmListView.Selected.StateIndex := -1;
  nIndex := AlarmListView.Selected.Index;
  IntAlarmListView.Items[nIndex].StateIndex := -1;
end;

procedure TfmQueryAlarmMonitoring.IntAlarmListViewDblClick(Sender: TObject);
var
  nIndex : integer;
begin
// 여기에서 해당하는 알람 경고창 없애자...
  IntAlarmListView.Selected.StateIndex := -1;
  nIndex := IntAlarmListView.Selected.Index;
  AlarmListView.Items[nIndex].StateIndex := -1;

end;

procedure TfmQueryAlarmMonitoring.NodeConnectStatus(aReceiveData: string);
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

procedure TfmQueryAlarmMonitoring.CommandArrayCommandsTCommand6Execute(
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

procedure TfmQueryAlarmMonitoring.ConnectServer;
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
begin
  aTreeView := TreeView_Device;
  aNode := aTreeView.Items[0];
  if aNode.ImageIndex <> 0 then
  begin
    aNode.ImageIndex:=0;
    aNode.StateIndex:=0;
  end;
  aTreeView.Refresh;

end;

procedure TfmQueryAlarmMonitoring.DisConnectServer;
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
  i : integer;
begin
  aTreeView := TreeView_Device;
  aNode := aTreeView.Items[0];
  if aNode.ImageIndex <> 14 then
  begin
    aNode.ImageIndex:=14;
    aNode.SelectedIndex := 14;
    aNode.StateIndex:=-1;
    //여기에서 모든 노드 DisConnect 로 표시하자.
    for i :=0 to DeviceCodeList.Count - 1 do
    begin
      if copy(DeviceCodeList.Strings[i],1,1) = 'N' then
      begin
        DisConnectNode(DeviceCodeList.Strings[i]);
      end;
    end;
  end;
  aTreeView.Refresh;

end;

procedure TfmQueryAlarmMonitoring.MenuItem11Click(Sender: TObject);
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

function TfmQueryAlarmMonitoring.GetAlarmNO(aNodeNo, aEcuID: string): integer;
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

procedure TfmQueryAlarmMonitoring.MenuItem6Click(Sender: TObject);
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

procedure TfmQueryAlarmMonitoring.SensorLoad(aBuildingCode, aFloorCode,
  aAreaCode: string;SensorList:TListView);
var
  stSql : string;
  stSensorID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
begin
  SensorCodeList.Clear;
  SensorList.Clear;
  //Alarm정보 로딩
  stSql := ' Select d.AL_VIEWSEQ,a.AL_ZONENUM,a.AL_ZONESTOP,';
  stSql := stSql + ' a.AC_NODENO,a.AC_ECUID,a.AL_ZONENAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  stSql := stSql + ' From TB_ZONEDEVICE a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
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
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  if ( aBuildingCode <> '' ) and ( aBuildingCode <> '000' ) then
    stSql := stSql + ' AND c.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if ( aFloorCode <> '' ) and ( aFloorCode <> '000' ) then
    stSql := stSql + ' AND c.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if ( aAreaCode <> '' ) and ( aAreaCode <> '000' ) then
    stSql := stSql + ' AND c.LO_AREACODE = ''' + aAreaCode + ''' ';
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
      SensorList.Items.Add.Caption:= FindField('AL_ZONENAME').asString;
      stSensorID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                 + FindField('AC_ECUID').AsString
                 + FindField('AL_ZONENUM').AsString ;// + FillZeroNumber(FindField('AL_DEVICENO').AsInteger,3);
      SensorList.Items[I].SubItems.Add(stSensorID);     // 센서 ID
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

      SensorList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3)); //노드번호
      SensorList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
      SensorList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString ); //알람아이디
      SensorList.Items[I].SubItems.Add(FindField('AL_ZONENUM').AsString); //존번호
      SensorList.Items[I].SubItems.Add(FindField('AL_ZONESTOP').AsString); //ZONESTOP 중인지 유무
      if FindField('AL_ZONESTOP').AsString = 'N' then
        SensorList.Items[I].ImageIndex:=2
      else SensorList.Items[I].ImageIndex:=13;

      inc(i);
      Next;
    end;
  end;
  SensorCodeList.Clear;
  for i:=0 to sensorList.Items.Count - 1 do
  begin
    SensorCodeList.Add(sensorList.Items[I].SubItems.Strings[0]);  //센서구역의 코드를 등록하자
  end;

end;

procedure TfmQueryAlarmMonitoring.Action_SensorLoadExecute(Sender: TObject);
begin
  if SensorUse then SensorLoad('000','000','000',SensorListView);
end;

procedure TfmQueryAlarmMonitoring.MenuItem12Click(Sender: TObject);
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

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + copy(stSensorID,1,5) + DATADELIMITER; //방범상태체크
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

function TfmQueryAlarmMonitoring.updateTB_ZONEDEVICEState(aAlarmNo, aZoneNum,
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

procedure TfmQueryAlarmMonitoring.MenuItem13Click(Sender: TObject);
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

procedure TfmQueryAlarmMonitoring.SensorListViewDblClick(Sender: TObject);
begin
  if SensorListView.Items[SensorListView.ItemIndex].ImageIndex = 14 then SensorListView.Items[SensorListView.ItemIndex].ImageIndex := 13;
end;

procedure TfmQueryAlarmMonitoring.DisplaySensorState(aNodeNo, aECUID,aPortNo, aMode,aSubCLass,
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
      if SensorListView.Items[i].ImageIndex = 2 then  //통신 끊김 상태에서만 정상으로 바꿔 주자.
         SensorListView.Items[i].ImageIndex:= 13;
      if bZoneSensor then //감지상태이면
      begin
        if SensorListView.Items[i].SubItems[4] = inttostr(strtoint(aPortNo)) then
        begin  //해당 감지존이면
          SensorListView.Items[i].ImageIndex:= 14; //감지표시
        end;
      end;
      if (aSubCLass = 'MN') or (aSubCLass = 'EX')then  //메인 또는 확장기 의 통신이상이면
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

function TfmQueryAlarmMonitoring.CheckSchedule(aNodeNo, aECUID,
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

function TfmQueryAlarmMonitoring.GetPortName(aNodeNo, aECUID,
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
    if recordCount > 0  then result := FindField('AL_ZONENAME').AsString;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure TfmQueryAlarmMonitoring.Insertsg_SensorList(aTime,aNodeNo, aECUID, aPortNo,
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

procedure TfmQueryAlarmMonitoring.ECUDataProcess(aNodeNo, aECUID, aTYPE, aACTION,
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

procedure TfmQueryAlarmMonitoring.NODEDataProcess(aNodeNo, aTYPE, aACTION,
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

procedure TfmQueryAlarmMonitoring.DEVICEDataProcess(aNodeNo, aECUID, aData: string);
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

procedure TfmQueryAlarmMonitoring.DoorDataProcess(aNodeNo, aEcuID, aDoorNo, aType,
  aACTION, aData: string);
var
  nIndex : integer;
  cDoorMode : char;
  cDoorMode2 : char;
  cDoorState : char;
  i : integer;
begin
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
            doorListView.Items[nIndex].StateIndex:= 0;
            IntdoorListView.Items[nIndex].StateIndex:= 0;
          end;
          else
          begin
            doorListView.Items[nIndex].StateIndex:= -1;
            IntdoorListView.Items[nIndex].StateIndex:= -1;
          end;
        end;
      end else
      begin
        Case cDoorMode of
          '0':
          begin
            doorListView.Items[nIndex].StateIndex:= 1;
            IntdoorListView.Items[nIndex].StateIndex:= 1;
          end;
          else
          begin
            doorListView.Items[nIndex].StateIndex:= -1;
            IntdoorListView.Items[nIndex].StateIndex:= -1;
          end;
        end;

      end;

      case cDoorState of
        'C': //닫힘
          begin
            doorListView.Items[nIndex].ImageIndex:=0;
            IntdoorListView.Items[nIndex].ImageIndex:=0;
          end;
        'O': //열림
          begin
            doorListView.Items[nIndex].ImageIndex:=1;
            IntdoorListView.Items[nIndex].ImageIndex:=1;
          end;
        'E': //에러
          begin
            doorListView.Items[nIndex].ImageIndex:=2;
            IntdoorListView.Items[nIndex].ImageIndex:=2;
          end;
        'T'://장시간 열림
          begin
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
      doorListView.Refresh;
      //위치 정보 보기의 Map 에 상태 표시
      for i := 0 to LocationMapList.Count - 1 do
      begin
        TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(aNodeNo,aEcuID,aDoorNo,cDoorMode,cDoorState,cDoorMode2);
      end;
    end;
  end;  
end;

procedure TfmQueryAlarmMonitoring.AlarmDataProcess(aNodeNo, aEcuID, aType, aACTION,
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

      AlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
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

procedure TfmQueryAlarmMonitoring.ACDataProcess(aNodeNo, aECUID, aData: string);
begin
  RcvCardReadData(aNodeNo,aData);
end;

initialization
  RegisterClass(TfmQueryAlarmMonitoring);
Finalization
  UnRegisterClass(TfmQueryAlarmMonitoring);

end.
