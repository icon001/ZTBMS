unit uAccessTypeMonitoring;

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
  TfmAccessTypeMonitoring = class(TfmASubForm)
    pan_device: TPanel;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    tbLOCATE: TTabSheet;
    tbDEVICE: TTabSheet;
    stateList: TImageList;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Shader2: TShader;
    Shader3: TShader;
    ActionList1: TActionList;
    devicelist: TImageList;
    Action_Reload: TAction;
    ADOAlarmQuery: TADOQuery;
    MediaPlayer1: TMediaPlayer;
    smallAlarmImageList1: TImageList;
    pan_Message: TPanel;
    st_Message: TStaticText;
    btn_AlarmConfirm: TSpeedButton;
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
    DoorListView: TListView;
    Pan_Remark1: TPanel;
    sg_Access: TAdvStringGrid;
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
    PopupMenu_Node: TPopupMenu;
    mn_pingTest: TMenuItem;
    N11: TMenuItem;
    mn_TimeSync: TMenuItem;
    PopupMenu_Device: TPopupMenu;
    mn_AllCardDownload: TMenuItem;
    MenuItem11: TMenuItem;
    mn_DeviceReset: TMenuItem;
    pm_JavarOpen: TMenuItem;
    pm_JavaraClose: TMenuItem;
    pm_MasterMode: TMenuItem;
    pm_PosiNega: TMenuItem;
    Positive1: TMenuItem;
    Negative1: TMenuItem;
    PopupMenu_IntAccess: TPopupMenu;
    MenuItem10: TMenuItem;
    MenuItem14: TMenuItem;
    N24: TMenuItem;
    tbBuilding: TTabSheet;
    toolslist: TImageList;
    GroupBox1: TGroupBox;
    TreeView_Location: TTreeView;
    Shader1: TShader;
    TreeView_LocationCode: TTreeView;
    Action_LoctionLoad: TAction;
    pm_Building: TPopupMenu;
    MenuItem3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    mn_ScheduleApply: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
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
    procedure FormActivate(Sender: TObject);
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
    procedure DoorListViewMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mi_BuildingBigIconClick(Sender: TObject);
    procedure mi_BuildingSmallIconClick(Sender: TObject);
    procedure pm_OpenModeClick(Sender: TObject);
    procedure pm_OperateModeClick(Sender: TObject);
    procedure pm_CloseModeClick(Sender: TObject);
    procedure pm_StateCheckClick(Sender: TObject);
    procedure pm_DoorOpenClick(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure sg_MainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg_ECUMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mn_pingTestClick(Sender: TObject);
    procedure mn_TimeSyncClick(Sender: TObject);
    procedure mn_AllCardDownloadClick(Sender: TObject);
    procedure mn_DeviceResetClick(Sender: TObject);
    procedure DoorListViewDblClick(Sender: TObject);
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
    procedure Action_LoctionLoadExecute(Sender: TObject);
    procedure TreeView_LocationClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure mn_ScheduleApplyClick(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
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
    procedure LoadingDoor(aBuildingCode,aFloorCode,aAreaCode:string;aListView:TListView);
    procedure BuildingDoorControl(aBuildingCode,aFloorCode,aAreaCode,aCmd:string);
    procedure BuildingDoorScheduleApply(aBuildingCode,aFloorCode,aAreaCode:string);
  public
    { Public declarations }
    bLocationMapShow : Boolean;
    bDeviceMapShow : Boolean;
    procedure ShowMessage(aMessage:string);
    procedure NodeConnectState(NodeNo:integer;aConnectState:TNodeCurrentState);
    procedure DeviceConnected(NodeNo:integer;aEcuID:string;aConnected:Boolean);
    procedure AccessEventProcess(NodeNo:integer;
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo :string);
    procedure DoorFireStateChange(NodeNo:integer;
          aEcuID, aDoorNo:string; aFireState:Boolean);
    procedure DoorStateChange(NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorDSState;
                                  aDoorLockType:TDoorLockState;
                                  aDoorFire:Boolean);
    procedure ExitButtonPress(NodeNo : integer;aEcuID,aDoorNo,aTime,aInputType,aUserName,aPermitCode,aPermit:string);
  end;

var
  fmAccessTypeMonitoring: TfmAccessTypeMonitoring;


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




procedure TfmAccessTypeMonitoring.FormCreate(Sender: TObject);
begin
  MemoryCreate;

  iniConfigRead;

  ListHeaderNameSet;

  CellHide;



  L_bFirst := True;
  L_bClose := False;

//  Action_ReLoadExecute(self);

  LoadCompanyCode;
  LoadJijumCode;
  LoadDepartCode;
  if G_nBuildingVisible = 1 then
  begin
    tbBuilding.TabVisible := True;
    PageControl1.ActivePage := tbBuilding;
    Action_LoctionLoadExecute(Self);
  end else
  begin
    tbBuilding.TabVisible := False;
    PageControl1.ActivePage := tbLOCATE;
  end;

  {
  sg_Main.AddImageIdx(0,1,1,haLeft,vaCenter);
  sg_Main.Cells[0,1] := LeftSpace + 'TEST';
  }
end;

procedure TfmAccessTypeMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin
  L_bClose := True;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'AccessTypeMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  iniConfigWrite;
  MemoryDestory;



  Action := caFree;

end;


procedure TfmAccessTypeMonitoring.SocketWatchTimerTimer(Sender: TObject);
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




procedure TfmAccessTypeMonitoring.CommandArrayCommandsTCommand0Execute(
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

end;



procedure TfmAccessTypeMonitoring.CommandArrayCommandsTCommand1Execute(
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


procedure TfmAccessTypeMonitoring.CommandArrayCommandsTCommand2Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmAccessTypeMonitoring.CommandArrayCommandsTCommand3Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd: string;
  i : integer;
begin
  stCmd := Params.Values['Data'];

  //경계는 사용 안함
end;

procedure TfmAccessTypeMonitoring.RcvCardReadData(aNodeNo, aReceiveData: string);
begin

end;


function TfmAccessTypeMonitoring.GetAreaName(aBuildingCode, aFloorCode,
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

function TfmAccessTypeMonitoring.GetBuildingName(aBuildingCode: string): string;
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

function TfmAccessTypeMonitoring.GetFloorName(aBuildingCode,
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

function TfmAccessTypeMonitoring.GetPermitState(aPermit: string): string;
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

function TfmAccessTypeMonitoring.GetUserInfo(aCardNo: string; var stUserName,
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

procedure TfmAccessTypeMonitoring.LoadCompanyCode;
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

procedure TfmAccessTypeMonitoring.LoadDepartCode;
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

procedure TfmAccessTypeMonitoring.CommandArrayCommandsTCommand4Execute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
end;

procedure TfmAccessTypeMonitoring.InsertDOORList(aPermitCode,aPermit, aTime, aLocationName,
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
    Cells[DoorIndexArray[1],1] := aLocationName; // copy(aLocationName,10,length(aLocationName)-9); //위치
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

function TfmAccessTypeMonitoring.GetStatusCode(aStatusCode: string;
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

procedure TfmAccessTypeMonitoring.InsertAlarmList(aTime, aLocateName, aAlarmName,
  aDeviceID, aDeviceType, aStatusCode, aStatusName,aAlaramCode: string;aAlarmSound:Boolean;
  List: TAdvStringGrid);
begin

  with List do
  begin
    //if Cells[0,1] <> '' then   InsertRows(1,1);

    if List.Name = 'sg_Alarm' then
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
    if List.Name = 'sg_Alarm' then
    begin
      Cells[AlarmIndexArray[0],1] := aTime;   //발생시간
      Cells[AlarmIndexArray[1],1] := aLocateName; // copy(aLocateName,10,length(aLocateName)-9); //위치
      Cells[AlarmIndexArray[2],1] := aAlarmName; //경계구역
      Cells[AlarmIndexArray[3],1] := aDeviceID; //주장치번호
      Cells[AlarmIndexArray[4],1] := aDeviceType; //기기번호
      Cells[AlarmIndexArray[5],1] := aStatusCode; //발생코드
      Cells[AlarmIndexArray[6],1] := aStatusName; //이벤트내용
      Cells[AlarmIndexArray[7],1] := aAlaramCode; //AlarmCode
    end;
  end;

end;

procedure TfmAccessTypeMonitoring.Action_ReloadExecute(Sender: TObject);
begin
  LoadingNode;
  LoadingEcu('000','전체');
  LoadingDoor(copy(L_stSelectBuildingCode,1,3),copy(L_stSelectBuildingCode,4,3),copy(L_stSelectBuildingCode,7,3),doorListView);

  if L_bClose then Exit;
//  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'DEVICEALLSTATE_II'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
//  self.FindSubForm('Main').FindCommand('SendData').Execute;

//  SocketWatchTimer.Enabled := True;
end;


procedure TfmAccessTypeMonitoring.ClearEmpInfo;
begin
end;


procedure TfmAccessTypeMonitoring.sg_AccessKeyDown(Sender: TObject; var Key: Word;
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

procedure TfmAccessTypeMonitoring.DisConnectAlarm(aAlarmID: string);
begin

end;


procedure TfmAccessTypeMonitoring.CommandArrayCommandsTCommand5Execute(
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

procedure TfmAccessTypeMonitoring.FormShow(Sender: TObject);
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
  N13.Visible := G_bColseModeView;
  N21.Visible := G_bColseModeView;
  N16.Visible := G_bColseModeView;


  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'AccessTypeMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Application.ProcessMessages;

end;

procedure TfmAccessTypeMonitoring.N12Click(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.PageControl1Change(Sender: TObject);
begin
  //showmessage(PageControl1.ActivePage.Name);
  UPDATETB_USERCONFIG('KTMONITOR','DEVICETAB',PageControl1.ActivePage.Name)
end;

function TfmAccessTypeMonitoring.UPDATETB_USERCONFIG(aConfigGroup,aConfigID,
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

function TfmAccessTypeMonitoring.InsertTB_USERCONFIG(aConfigGroup,aConfigID,
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

procedure TfmAccessTypeMonitoring.PageControl2Change(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','WATCHTAB',PageControl2.ActivePage.Name)
end;

procedure TfmAccessTypeMonitoring.pan_deviceResize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','DEVICEW',inttostr(pan_device.Width))
end;

procedure TfmAccessTypeMonitoring.Panel12Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','INTEGH',inttostr(Panel12.Height))
end;

procedure TfmAccessTypeMonitoring.Panel15Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','INTATH',inttostr(Panel15.Height))
end;

procedure TfmAccessTypeMonitoring.Panel14Resize(Sender: TObject);
begin
  if DoorListView.ViewStyle = vsIcon then
  begin
    DoorListView.ViewStyle := vsList;
    DoorListView.Refresh;
    DoorListView.ViewStyle := vsIcon;
  end else if DoorListView.ViewStyle = vsList then
  begin
    DoorListView.ViewStyle := vsIcon;
    DoorListView.Refresh;
    DoorListView.ViewStyle := vsList;
  end;
end;

procedure TfmAccessTypeMonitoring.Form_Initialize;
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
        //if nIndex > -1 then
        //  PageControl1.ActivePage := TTabSheet(DeviceTabList.Objects[nIndex]) ;
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

function TfmAccessTypeMonitoring.updateTB_ZONEDEVICEState(aAlarmNo, aZoneNum,
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

procedure TfmAccessTypeMonitoring.DisplaySensorState(aNodeNo, aECUID,aPortNo, aMode,aSubCLass,
  aStatusCode: string;bZoneSensor:Boolean);
begin


end;

function TfmAccessTypeMonitoring.CheckSchedule(aNodeNo, aECUID,
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

function TfmAccessTypeMonitoring.GetPortName(aNodeNo, aECUID,
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

procedure TfmAccessTypeMonitoring.Insertsg_SensorList(aTime,aNodeNo, aECUID, aPortNo,
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




procedure TfmAccessTypeMonitoring.AlarmDataProcess(aNodeNo, aEcuID, aType, aACTION,
  aData: string);
begin

end;

procedure TfmAccessTypeMonitoring.ACDataProcess(aNodeNo, aECUID, aData: string);
begin
  RcvCardReadData(aNodeNo,aData);
end;

procedure TfmAccessTypeMonitoring.FormActivate(Sender: TObject);
begin
  if L_bFirst then
  begin
    L_bFirst := False;
    if ALARMVIEW = 'QUERY' then
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMREFRESH'+ DATADELIMITER + '00000' + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      //SearchAlarmList;
    end;
  end;
  
  Action_ReLoadExecute(self);

  Pan_Remark1.Visible := G_bACIntroView;

  //PageControl1.ActivePageIndex := 0;
  PageControl2.ActivePageIndex := 0;
end;

procedure TfmAccessTypeMonitoring.SearchAlarmList;

begin

end;

procedure TfmAccessTypeMonitoring.sg_AccessColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeDoorIndex(FromIndex,ToIndex);
end;

procedure TfmAccessTypeMonitoring.GridSetting;
var
  i : integer;
begin
  for i:=0 to sg_Access.ColCount - 1 do
  begin
    DoorIndexArray[i] := i;
    relDoorIndexArray[i] := i;
  end;


end;

procedure TfmAccessTypeMonitoring.ChangeDoorIndex(FromIndex, ToIndex: integer);
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

procedure TfmAccessTypeMonitoring.ChangeAlarmIndex(FromIndex, ToIndex: integer);
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


procedure TfmAccessTypeMonitoring.sg_AlarmColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeAlarmIndex(FromIndex,ToIndex);

end;

procedure TfmAccessTypeMonitoring.sg_AccessHeaderNameSet;
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

procedure TfmAccessTypeMonitoring.ShowMessage(aMessage: string);
begin

end;

procedure TfmAccessTypeMonitoring.LoadJijumCode;
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


procedure TfmAccessTypeMonitoring.CommandArrayCommandsTFIRERECOVERExecute(
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

procedure TfmAccessTypeMonitoring.CenterPanel;
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

procedure TfmAccessTypeMonitoring.FormResize(Sender: TObject);
begin
  CenterPanel;

end;

procedure TfmAccessTypeMonitoring.MessageTimerTimer(Sender: TObject);
begin
  pan_Message.Visible := Not pan_Message.Visible;
end;

procedure TfmAccessTypeMonitoring.btn_AlarmConfirmClick(Sender: TObject);
begin
  MessageTimer.Enabled := False;
  pan_Message.visible := False;

end;

procedure TfmAccessTypeMonitoring.N8Click(Sender: TObject);
begin
  DoorListView.ViewStyle := vsIcon;
  DoorListView.Refresh;
end;

procedure TfmAccessTypeMonitoring.N17Click(Sender: TObject);
begin
  DoorListView.ViewStyle := vsList;
  DoorListView.Refresh;

end;

procedure TfmAccessTypeMonitoring.LoadingEcu(aNodeNo,aNodeName: string);
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

procedure TfmAccessTypeMonitoring.LoadingNode;
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

procedure TfmAccessTypeMonitoring.sg_MainDblClick(Sender: TObject);
var
  stMainName : string;
begin
  PageControl1.ActivePage := tbDEVICE;
  with sg_Main do
  begin
    stMainName := Cells[0,Row];
    delete(stMainName,1,length(LeftSpace));
    LoadingEcu(cells[2,Row],stMainName);
  end;
end;

procedure TfmAccessTypeMonitoring.DoorListViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if DoorListView.ItemIndex < 0 then Exit;
  DoorListView.Items[DoorListView.ItemIndex].Selected := True;

end;

procedure TfmAccessTypeMonitoring.mi_BuildingBigIconClick(Sender: TObject);
begin
  DoorListView.ViewStyle := vsIcon;
end;

procedure TfmAccessTypeMonitoring.mi_BuildingSmallIconClick(
  Sender: TObject);
begin
  DoorListView.ViewStyle := vsList;

end;

procedure TfmAccessTypeMonitoring.DeviceConnected(NodeNo: integer;
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
      nDeviceIndex := -1;
      for i := 1 to RowCount do
      begin
        if cells[4,i] = stDeviceID then
        begin
          nDeviceIndex := i - 1;
          break;
        end;
      end;
//      nDeviceIndex :=DeviceStateList.IndexOf(stDeviceID);
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

procedure TfmAccessTypeMonitoring.NodeConnectState(NodeNo: integer;
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


procedure TfmAccessTypeMonitoring.AccessEventProcess(NodeNo: integer;
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
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;

  stPermitName := GetPermitState(aPermit);
  GetUserInfo(aCardNo,stEmName,stCompanyName,stJijumName,stDepartName,stEmCode,stHandPhone,stCompanyPhone,stAddr1,stAddr2);

  stDoorID := stDeviceID + aDoorNo;
  nDoorIndex := DoorStateList.IndexOf(stDoorID);
  if nDoorIndex < 0 then
  begin
    //자바라인지 확인 하자
    if aDoorNo = '2' then
    begin
      if dmJavara.JavaraCheck(NodeNo,aEcuID) then
      begin
        nDoorIndex := DoorStateList.IndexOf(FillZeroNumber(NodeNo,3) + aEcuID + '1');
        if nDoorIndex > -1 then
        begin
          stDoorName := TDoorState(DoorStateList.Objects[nDoorIndex]).DoorName + '_닫힘';
          stBuildingCode := TDoorState(DoorStateList.Objects[nDoorIndex]).BuildingCode;
          stFloorCode := TDoorState(DoorStateList.Objects[nDoorIndex]).FloorCode;
          stAreaCode := TDoorState(DoorStateList.Objects[nDoorIndex]).AreaCode;
          if BuildingStep = '0' then stBuildingID := stBuildingCode
          else if BuildingStep = '1' then stBuildingID := stBuildingCode + stFloorCode
          else if BuildingStep = '2' then stBuildingID := stBuildingCode + stFloorCode + stAreaCode;
          nBuildingIndex := BuildingList.IndexOf(stBuildingID);
          if nBuildingIndex > -1 then
            stBuildingName := BuildingNameList.Strings[nBuildingIndex];
          InsertDOORList(aPermit,stPermitName,aTime,stBuildingName,stDoorName,aCardNo,stEmName,
            stCompanyName,stJijumName,stDepartName,stEmCode,stDoorID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_Access);
          Exit;
        end;
      end;
    end;
    if Not isMaster then Exit;// 관제 권한이 없음
    stDoorName := dmDBFunction.GetDeviceName(inttostr(NodeNo),aEcuID); // 컨트롤러명
  end else
  begin
    stDoorName := TDoorState(DoorStateList.Objects[nDoorIndex]).DoorName;

    stBuildingCode := TDoorState(DoorStateList.Objects[nDoorIndex]).BuildingCode;
    stFloorCode := TDoorState(DoorStateList.Objects[nDoorIndex]).FloorCode;
    stAreaCode := TDoorState(DoorStateList.Objects[nDoorIndex]).AreaCode;
    if BuildingStep = '0' then stBuildingID := stBuildingCode
    else if BuildingStep = '1' then stBuildingID := stBuildingCode + stFloorCode
    else if BuildingStep = '2' then stBuildingID := stBuildingCode + stFloorCode + stAreaCode;
    nBuildingIndex := BuildingList.IndexOf(stBuildingID);
    if nBuildingIndex > -1 then
      stBuildingName := BuildingNameList.Strings[nBuildingIndex];
  end;

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
end;





procedure TfmAccessTypeMonitoring.LoadingDoor(aBuildingCode,aFloorCode,aAreaCode:string;aListView:TListView);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stDeviceID : string;
  nDoorIndex : integer;
  stDoorID : string;
  stDoorName : string;
  I : integer;
begin
  DoorListView.Clear;
  DoorCodeList.Clear;
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
  stSql := stSql + ' order by DO_VIEWSEQ,AC_NODENO,AC_ECUID ';

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
        DoorCodeList.Add(stDoorID);
        stDoorName := FindField('DO_DOORNONAME').AsString;
        DoorListView.Items.Add.Caption:= stDoorName;
        DoorListView.Items[I].SubItems.Add(stDoorID);     // 빌딩ID
        DoorListView.Items[I].SubItems.Add(FindField('AC_JAVARATYPE').AsString);     // 자바라타입

        nDoorIndex := DoorStateList.IndexOf(stDoorID);
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

procedure TfmAccessTypeMonitoring.DoorFireStateChange(NodeNo: integer;
  aEcuID, aDoorNo: string; aFireState: Boolean);
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

procedure TfmAccessTypeMonitoring.DoorStateChange(NodeNo: integer; aEcuID,
  aDoorNo: string; aDoorManageType: TDoorManageMode;
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
  DoorListView.Refresh;
end;

procedure TfmAccessTypeMonitoring.pm_OpenModeClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.pm_OperateModeClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.pm_CloseModeClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.pm_StateCheckClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.pm_DoorOpenClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.N19Click(Sender: TObject);
begin
  doorListView.ViewStyle := vsIcon;
end;

procedure TfmAccessTypeMonitoring.N20Click(Sender: TObject);
begin
  doorListView.ViewStyle := vsList;

end;

procedure TfmAccessTypeMonitoring.N3Click(Sender: TObject);
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
    fmDeviceMap.L_stCreateForm := 'TfmAccessTypeMonitoring';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmAccessTypeMonitoring.N4Click(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.sg_MainMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  sg_Main.SelectRows(sg_Main.Row,1);

end;

procedure TfmAccessTypeMonitoring.sg_ECUMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  sg_ECU.SelectRows(sg_ECU.Row,1);

end;

procedure TfmAccessTypeMonitoring.mn_pingTestClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.mn_TimeSyncClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.mn_AllCardDownloadClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.mn_DeviceResetClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.ExitButtonPress(NodeNo: integer; aEcuID,
  aDoorNo, aTime, aInputType, aUserName, aPermitCode, aPermit: string);
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
begin
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  stDoorID := stDeviceID + aDoorNo;
  nDoorIndex := DoorStateList.IndexOf(stDoorID);
  if nDoorIndex < 0 then
  begin
      //자바라인지 확인 하자
    if aDoorNo = '2' then
    begin
      if dmJavara.JavaraCheck(NodeNo,aEcuID) then
      begin
        nDoorIndex := DoorStateList.IndexOf(stDeviceID + '1');
        if nDoorIndex > -1 then
        begin
          stDoorName:= TDoorState(DoorStateList.Objects[nDoorIndex]).DoorName + '_닫힘'; // 자바라닫힘
          stBuildingCode := TDoorState(DoorStateList.Objects[nDoorIndex]).BuildingCode;
          stFloorCode := TDoorState(DoorStateList.Objects[nDoorIndex]).FloorCode;
          stAreaCode := TDoorState(DoorStateList.Objects[nDoorIndex]).AreaCode;
          if BuildingStep = '0' then stBuildingID := stBuildingCode
          else if BuildingStep = '1' then stBuildingID := stBuildingCode + stFloorCode
          else if BuildingStep = '2' then stBuildingID := stBuildingCode + stFloorCode + stAreaCode;
          nBuildingIndex := BuildingList.IndexOf(stBuildingID);
          if nBuildingIndex > -1 then
            stBuildingName := BuildingNameList.Strings[nBuildingIndex];
          InsertDOORList(aPermitCode,aPermit,aTime,stBuildingName,stDoorName,aInputType,aUserName,
            '','','','',stDoorID,'','','','',sg_Access);
        end;
      end;
    end;
    Exit;
  end;
  stDoorName := TDoorState(DoorStateList.Objects[nDoorIndex]).DoorName;

  stBuildingCode := TDoorState(DoorStateList.Objects[nDoorIndex]).BuildingCode;
  stFloorCode := TDoorState(DoorStateList.Objects[nDoorIndex]).FloorCode;
  stAreaCode := TDoorState(DoorStateList.Objects[nDoorIndex]).AreaCode;
  if BuildingStep = '0' then stBuildingID := stBuildingCode
  else if BuildingStep = '1' then stBuildingID := stBuildingCode + stFloorCode
  else if BuildingStep = '2' then stBuildingID := stBuildingCode + stFloorCode + stAreaCode;
  nBuildingIndex := BuildingList.IndexOf(stBuildingID);
  if nBuildingIndex > -1 then
    stBuildingName := BuildingNameList.Strings[nBuildingIndex];

  InsertDOORList(aPermitCode,aPermit,aTime,stBuildingName,stDoorName,aInputType,aUserName,
    '','','','',stDoorID,'','','','',sg_Access);
end;

procedure TfmAccessTypeMonitoring.DoorListViewDblClick(Sender: TObject);
var
  stDoorID : string;
begin
  if doorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[doorListView.ItemIndex];

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmAccessTypeMonitoring.CellHide;
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

procedure TfmAccessTypeMonitoring.iniConfigRead;
var
  ini_fun : TiniFile;
  i : integer;
  stValue : string;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');

  pan_device.Width := ini_fun.ReadInteger('AccessTypeMonitoring','DeviceWidth',217);
  if pan_device.Width < 5 then pan_device.Width := 5;
  PageControl2.ActivePage := BuildingTab;
  pan_monitor.Height := ini_fun.ReadInteger('AccessTypeMonitoring','monitorHeight',273);
  if pan_monitor.Height < 5 then pan_monitor.Height := 5;
  sg_Access.Height := ini_fun.ReadInteger('AccessTypeMonitoring','AccessHeight',144);
  if sg_Access.Height < 5 then sg_Access.Height := 5;

  stValue := ini_fun.ReadString('AccessTypeMonitoring','DoorListView','vsIcon');
  if UpperCase(stValue) = 'VSICON' then
  begin
    DoorListView.ViewStyle := vsIcon ;
  end else
  begin
    DoorListView.ViewStyle := vsIcon;
    DoorListView.Refresh;
    DoorListView.ViewStyle := vsList;
  end;

  for i := LOW(DoorIndexArray) to HIGH(DoorIndexArray) do
  begin
    DoorIndexArray[i] := ini_fun.ReadInteger('AccessTypeMonitoring','DoorIndexArray'+inttostr(i),i);
  end;
  for i := LOW(relDoorIndexArray) to HIGH(relDoorIndexArray) do
  begin
    relDoorIndexArray[i] := ini_fun.ReadInteger('AccessTypeMonitoring','relDoorIndexArray'+inttostr(i),i);
  end;

  ini_fun.Free;

end;

procedure TfmAccessTypeMonitoring.iniConfigWrite;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  ini_fun.WriteInteger('AccessTypeMonitoring','DeviceWidth',pan_device.Width);
  ini_fun.WriteInteger('AccessTypeMonitoring','monitorHeight',pan_monitor.Height);
  ini_fun.WriteInteger('AccessTypeMonitoring','AccessHeight',sg_Access.Height);
  if DoorListView.ViewStyle = vsIcon then ini_fun.WriteString('AccessTypeMonitoring','DoorListView','vsIcon')
  else ini_fun.WriteString('AccessTypeMonitoring','DoorListView','vsList');

  for i := LOW(DoorIndexArray) to HIGH(DoorIndexArray) do
  begin
    ini_fun.WriteInteger('AccessTypeMonitoring','DoorIndexArray'+inttostr(i),DoorIndexArray[i]);
  end;
  for i := LOW(relDoorIndexArray) to HIGH(relDoorIndexArray) do
  begin
    ini_fun.WriteInteger('AccessTypeMonitoring','relDoorIndexArray'+inttostr(i),relDoorIndexArray[i]);
  end;

  for i := 0 to ACCESSEVENTMAXCELL do
  begin
    Access1SizeTable[i] := sg_Access.ColWidths[i];
    ini_fun.WriteInteger('출입이벤트1사이즈',inttostr(i),sg_Access.ColWidths[i]);
  end;

  ini_fun.Free;

end;

procedure TfmAccessTypeMonitoring.ListHeaderNameSet;
var
  i : integer;
begin
  for i := LOW(DoorIndexArray) to HIGH(DoorIndexArray) do
  begin
    sg_Access.cells[DoorIndexArray[i],0] := AccessHeaderNameList[i];
  end;

end;

procedure TfmAccessTypeMonitoring.MemoryCreate;
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

procedure TfmAccessTypeMonitoring.MemoryDestory;
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

procedure TfmAccessTypeMonitoring.DoorListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
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

procedure TfmAccessTypeMonitoring.pm_JavarOpenClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.pm_JavaraCloseClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.pm_MasterModeClick(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.Positive1Click(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.Negative1Click(Sender: TObject);
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

procedure TfmAccessTypeMonitoring.MenuItem10Click(Sender: TObject);
var
  stCardNo : string;
begin
  stCardNo := sg_Access.Cells[DoorIndexArray[5],sg_Access.Row];
  if stCardNo = '' then Exit;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['VALUE'] := 'EMPLOYEE';
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['CARDNO'] := stCardNo;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Execute;    

end;

procedure TfmAccessTypeMonitoring.MenuItem14Click(Sender: TObject);
var
  stCardNo : string;
begin
  stCardNo := sg_Access.Cells[DoorIndexArray[5],sg_Access.Row];
  if stCardNo = '' then Exit;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['VALUE'] := 'CARDADMIN';
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['CARDNO'] := stCardNo;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Execute;

end;

procedure TfmAccessTypeMonitoring.N24Click(Sender: TObject);
var
  st : string;
begin
  inherited;
  st := sg_Access.Cells[DoorIndexArray[5],sg_Access.Row];

  if st <> '' then ClipBoard.SetTextBuf(PChar(st));

end;

procedure TfmAccessTypeMonitoring.Action_LoctionLoadExecute(
  Sender: TObject);
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

    aNode:= aTreeView.Items.Add(nil,'전체');
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
          vNode2 := vTreeView.Items.AddChild(vNode1,stLocationCode);
        end;
        Application.ProcessMessages;
        Next;
      end;
      if aNode <> nil then aNode.Expanded := True;
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
Exit;
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

procedure TfmAccessTypeMonitoring.TreeView_LocationClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then Exit;
  L_stSelectBuildingCode := stLocateID;
  LoadingDoor(copy(L_stSelectBuildingCode,1,3),copy(L_stSelectBuildingCode,4,3),copy(L_stSelectBuildingCode,7,3),doorListView);
end;

procedure TfmAccessTypeMonitoring.N5Click(Sender: TObject);
var
//  stBuildingID : string;
  stMode : string;
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
//  stBuildingID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
//  if stBuildingID[1] = 'D' then Exit;
  stMode := TMenuItem(Sender).Hint;

  if (copy(L_stSelectBuildingCode,1,3) <> '000') and (L_stSelectBuildingCode <> '') then
  begin
    if Length(L_stSelectBuildingCode) >= 3 then stBuildingCode := copy(L_stSelectBuildingCode,1,3) ;
    if Length(L_stSelectBuildingCode) >= 6 then stFloorCode := copy(L_stSelectBuildingCode,4,3);
    if Length(L_stSelectBuildingCode) >= 9 then stAreaCode := copy(L_stSelectBuildingCode,7,3) ;
  end;

  BuildingDoorControl(stBuildingCode,stFloorCode,stAreaCode,stMode);
end;

procedure TfmAccessTypeMonitoring.BuildingDoorControl(aBuildingCode,aFloorCode,aAreaCode,
  aCmd: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stDeviceID : string;
  nDoorIndex : integer;
  stDoorID : string;
  stDoorName : string;
  I : integer;
  stCmd : string;
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

  case aCmd[1] of
    '0' : begin
      if aCmd[2] = '0' then stCmd := 'OPERATEMODE'
      else if aCmd[2] = '1' then stCmd := 'OPENMODE'
      else if aCmd[2] = '2' then stCmd := 'CLOSEMODE'
      else if aCmd[2] = '3' then stCmd := 'MASTERMODE';
    end;
    '1' : begin
      if aCmd[2] = '0' then stCmd := 'NSOPERATEMODE'
      else if aCmd[2] = '1' then stCmd := 'NSOPENMODE'
      else if aCmd[2] = '2' then stCmd := 'NSCLOSEMODE'
      else if aCmd[2] = '3' then stCmd := 'NSMASTERMODE';
    end;
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
        self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := stCmd+ DATADELIMITER + stDoorID + DATADELIMITER;
        self.FindSubForm('Main').FindCommand('SendData').Execute;
        DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000',stCmd) ;
        if aCmd[1] = '1' then
        begin
          dmDBFunction.UpdateTB_DOOR_Field_StringValue(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,FindField('DO_DOORNO').AsString,'DO_SchIgnore','Y');
        end;
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAccessTypeMonitoring.mn_ScheduleApplyClick(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin

  if (copy(L_stSelectBuildingCode,1,3) <> '000') and (L_stSelectBuildingCode <> '') then
  begin
    if Length(L_stSelectBuildingCode) >= 3 then stBuildingCode := copy(L_stSelectBuildingCode,1,3) ;
    if Length(L_stSelectBuildingCode) >= 6 then stFloorCode := copy(L_stSelectBuildingCode,4,3);
    if Length(L_stSelectBuildingCode) >= 9 then stAreaCode := copy(L_stSelectBuildingCode,7,3) ;
  end;

  BuildingDoorScheduleApply(stBuildingCode,stFloorCode,stAreaCode);

end;

procedure TfmAccessTypeMonitoring.BuildingDoorScheduleApply(aBuildingCode,
  aFloorCode, aAreaCode: string);
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
        DataModule1.TB_SYSTEMLOGInsert(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,DOORTYPE,FindField('DO_DOORNO').AsString,'0000000000','스케줄무시모드해제') ;
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

procedure TfmAccessTypeMonitoring.N23Click(Sender: TObject);
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

      dmDBFunction.UpdateTB_DOOR_Field_StringValue(copy(stDoorID,1,3),copy(stDoorID,4,2),copy(stDoorID,6,1),'DO_SchIgnore','Y');
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'NSOPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','NSOPERATEMODE')
    end;
  end;


end;

procedure TfmAccessTypeMonitoring.N22Click(Sender: TObject);
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

      dmDBFunction.UpdateTB_DOOR_Field_StringValue(copy(stDoorID,1,3),copy(stDoorID,4,2),copy(stDoorID,6,1),'DO_SchIgnore','Y');
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'NSOPENMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','NSOPENMODE')
    end;
  end;

end;

procedure TfmAccessTypeMonitoring.N21Click(Sender: TObject);
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

      dmDBFunction.UpdateTB_DOOR_Field_StringValue(copy(stDoorID,1,3),copy(stDoorID,4,2),copy(stDoorID,6,1),'DO_SchIgnore','Y');
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'NSCLOSEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','NSCLOSEMODE')
    end;
  end;

end;

procedure TfmAccessTypeMonitoring.N16Click(Sender: TObject);
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

      dmDBFunction.UpdateTB_DOOR_Field_StringValue(copy(stDoorID,1,3),copy(stDoorID,4,2),copy(stDoorID,6,1),'DO_SchIgnore','Y');
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'NSMASTERMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','NSMASTERMODE')
    end;
  end;
end;

procedure TfmAccessTypeMonitoring.N25Click(Sender: TObject);
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
      dmDBFunction.UpdateTB_DOOR_Field_StringValue(copy(stDoorID,1,3),copy(stDoorID,4,2),copy(stDoorID,6,1),'DO_SchIgnore','N');
      dmDBFunction.UpdateTB_DOOR_Field_StringValue(copy(stDoorID,1,3),copy(stDoorID,4,2),copy(stDoorID,6,1),'SEND_ACK','N');

      //self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'SCHEDULESETTING'+ DATADELIMITER + stDoorID + DATADELIMITER;
      //self.FindSubForm('Main').FindCommand('SendData').Execute;

      DataModule1.TB_SYSTEMLOGInsert(copy(stDoorID,1,3),copy(stDoorID,4,2),DOORTYPE,copy(stDoorID,6,1),'0000000000','스케줄무시해제')
    end;
  end;

end;

initialization
  RegisterClass(TfmAccessTypeMonitoring);
Finalization
  UnRegisterClass(TfmAccessTypeMonitoring);

end.
