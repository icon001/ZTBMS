unit uAlarmTypeMonitoring;

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
  TfmAlarmTypeMonitoring = class(TfmASubForm)
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
    Action_LoctionLoad: TAction;
    Action_DeviceLoad: TAction;
    Action_DoorLoad: TAction;
    Action_AlarmLoad: TAction;
    Action_FoodLoad: TAction;
    devicelist: TImageList;
    Action_RecvData: TAction;
    Action_Reload: TAction;
    PopupMenu_intZone: TPopupMenu;
    MenuItem6: TMenuItem;
    Action_SensorLoad: TAction;
    PopupMenu_Building: TPopupMenu;
    mi_AlarmSearch: TMenuItem;
    mi_BuildingBigIcon: TMenuItem;
    ADOAlarmQuery: TADOQuery;
    N21: TMenuItem;
    Action_intAlarmHistory: TAction;
    Action_AlarmHistory: TAction;
    MediaPlayer1: TMediaPlayer;
    smallAlarmImageList1: TImageList;
    MessageTimer: TTimer;
    ImageList48: TImageList;
    sg_Main: TAdvStringGrid;
    sg_ECU: TAdvStringGrid;
    N1: TMenuItem;
    mi_BuildingSmallIcon: TMenuItem;
    Panel5: TPanel;
    Panel15: TPanel;
    sg_Access: TAdvStringGrid;
    Splitter7: TSplitter;
    pan_monitor: TPanel;
    PageControl2: TPageControl;
    BuildingTab: TTabSheet;
    Panel12: TPanel;
    Panel14: TPanel;
    GroupBox6: TGroupBox;
    Shader6: TShader;
    BuildingListView: TListView;
    Pan_Remark1: TPanel;
    Panel4: TPanel;
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    StaticText1: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    tabArea: TTabSheet;
    Panel3: TPanel;
    Panel9: TPanel;
    GroupBox4: TGroupBox;
    Shader4: TShader;
    AlarmListView: TListView;
    Panel10: TPanel;
    Panel17: TPanel;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    StaticText30: TStaticText;
    sg_Alarm: TAdvStringGrid;
    Splitter2: TSplitter;
    PopupMenu_Alarm: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    mi_AlarmBigIcon: TMenuItem;
    mi_AlarmSmallIcon: TMenuItem;
    mi_AlarmConfirm: TMenuItem;
    N8: TMenuItem;
    N4: TMenuItem;
    N9: TMenuItem;
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
    N5: TMenuItem;
    mn_AlarmReport: TMenuItem;
    N6: TMenuItem;
    mn_FireRecovery: TMenuItem;
    st_Buildingname: TStaticText;
    PopupMenu_IntAccess: TPopupMenu;
    MenuItem10: TMenuItem;
    MenuItem14: TMenuItem;
    N24: TMenuItem;
    N7: TMenuItem;
    mn_BuildingArmControl: TMenuItem;
    mn_BuildingDisArmControl: TMenuItem;
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
    procedure MenuItem6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_AlarmDblClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure sg_AccessColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_AlarmColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure Action_intAlarmHistoryExecute(Sender: TObject);
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
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure mi_AlarmBigIconClick(Sender: TObject);
    procedure mi_AlarmSmallIconClick(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure mi_AlarmConfirmClick(Sender: TObject);
    procedure AlarmListViewDblClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand6Execute(Command: TCommand;
      Params: TStringList);
    procedure N4Click(Sender: TObject);
    procedure sg_AlarmMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg_MainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg_ECUMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mn_pingTestClick(Sender: TObject);
    procedure mn_TimeSyncClick(Sender: TObject);
    procedure mn_AllCardDownloadClick(Sender: TObject);
    procedure mn_DeviceResetClick(Sender: TObject);
    procedure mn_AlarmReportClick(Sender: TObject);
    procedure sg_MainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AlarmListViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N6Click(Sender: TObject);
    procedure mn_FireRecoveryClick(Sender: TObject);
    procedure Panel5Resize(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure mn_BuildingArmControlClick(Sender: TObject);
    procedure mn_BuildingDisArmControlClick(Sender: TObject);
  private
    L_bFirst : Boolean;
    L_bClose : Boolean;

    BuildingAlarmList : TStringList;     //�����ڵ� �� �˶���� ���
    AlarmBuildingcodeList : TStringList; //�ش� �˶���Ⱑ ��� �����ڵ忡 ���ϴ���


    procedure CenterPanel;
  private
    procedure MemoryCreate;
    procedure MemoryDestory;
    procedure ListHeaderNameSet;
    procedure CellHide;
    procedure iniConfigRead;
    procedure iniConfigWrite;

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
    LocationMapList : TStringList; //LocationMap�� ������ �ִ�.

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

    procedure DisConnectAlarm(aAlarmID:string);
    procedure RcvCardReadData(aNodeNo,aReceiveData:string); //ī�帮�� ������ ó��
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
    procedure   InsertAlarmList(aTime, //�ð�
                  aLocateName, //��ġ����
                  aAlarmName, //��豸����Ī
                  aDeviceID,  //����ġ��ȣ[�޽�����ȣ]
                  aDeviceType,         //�߻����[��ȣ]
                  aStatusCode,  //�̺�Ʈ�ڵ�
                  aStatusName,
                  aAlaramCode:string;
                  aAlarmSound:Boolean;
                  aColor:string;
                  List:TAdvStringGrid);  //�̺�Ʈ ����
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

    procedure ACDataProcess(aNodeNo,aECUID,aData:string); //���Ե�����
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
    procedure LoadingPatrolArea(aBuildingCode,aBuildingName:string);
    procedure AlaramConfirm(aNodeNo,aEcuID,aArmAreaNo:string);
  public
    { Public declarations }
    bLocationMapShow : Boolean;
    bDeviceMapShow : Boolean;
    procedure ShowMessage(aMessage:string);
    procedure NodeConnectState(NodeNo:integer;aConnectState:TNodeCurrentState);
    procedure DeviceConnected(NodeNo:integer;aEcuID:string;aConnected:Boolean);
    procedure AlarmModeChanged(NodeNo:integer;aEcuID,aAlarmArea:string;aWachMode:TWatchMode);
    procedure AccessEventProcess(NodeNo:integer;
          aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
          aButton,aArmAreaNo :string);
    procedure AlarmEventProcess(NodeNo:integer;
        ECUID,aArmAreaNo, aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode,
        aStatusCode, aPortNo, aState, aOperator, aNewStateCode:string;
        aAlarmView, aAlarmSound:Boolean;aColor:string);
    procedure AlarmListClear; //�˶� ����Ʈ Clear �� �� �ε�
    procedure BuildingAlarmEventProcess(aBuildingCode:string;aAlaramState:TAlarmEventState);
    procedure BuildingAlarmModeProcess(aBuildingCode:string;aAlramMode:TWatchMode);
    procedure DeviceAlarmEventProcess(NodeNo:integer;ECUID,aArmAreaNo:string;aAlaramState:TAlarmEventState);
    procedure ExitButtonPress(NodeNo : integer;aEcuID,aDoorNo,aTime,aInputType,aUserName,aPermitCode,aPermit:string);
  end;

var
  fmAlarmTypeMonitoring: TfmAlarmTypeMonitoring;


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
  uAlarmConfirm, uMain, uDBFunction;
{$R *.dfm}




procedure TfmAlarmTypeMonitoring.FormCreate(Sender: TObject);
begin
  MemoryCreate;
  iniConfigRead;
  ListHeaderNameSet;
  CellHide;
  

  L_bFirst := True;
  L_bClose := False;


{  LoadingNode;
  LoadingEcu('000','��ü');
  LoadingBuilding;
  LoadingPatrolArea('000000000','��ü');

}
  LoadCompanyCode;
  LoadJijumCode;
  LoadDepartCode;
  {
  sg_Main.AddImageIdx(0,1,1,haLeft,vaCenter);
  sg_Main.Cells[0,1] := LeftSpace + 'TEST';
  }
  mn_FireRecovery.Visible := G_bFireRelayUse;
end;

procedure TfmAlarmTypeMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  L_bClose := True;
  MessageTimer.Enabled := False;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'AlarmTypeMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  iniConfigWrite;
  MemoryDestory;

  Action := caFree;

end;


procedure TfmAlarmTypeMonitoring.SocketWatchTimerTimer(Sender: TObject);
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
//      else if stNodeNo[1] = 'E' then
//        DisConnectECU(stNodeNo);
    end;
  end;

end;




procedure TfmAlarmTypeMonitoring.CommandArrayCommandsTCommand0Execute(
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
begin
  stReceiveData := Params.Values['Data'];
  ShowMessage(stReceiveData);
{  //Delete(stReceiveData,1,1); //ó�� �� ���ڸ��� R
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
  Delete(stReceiveData,1,3); //���󿡼� �ٿ��� Node ��ȣ
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

  // ���⿡�� ȭ�鿡 ���÷��� �� ����... ������ �м��ؼ�...^^

  case aCommand of
    'A': begin // �˶� ������
           DeviceRcvAlarmData(stNodeNo,stReceiveData);
         end;

    'c': begin      //ī�嵥���� ó��
           //Connected:= True;
           MSG_Code:= stReceiveData[19];
           case MSG_Code of
             'E' ://ī�� ������(����) ó��
                begin
                   RcvCardReadData(stNodeNo,stReceiveData);
                end;
             'D' ://�� ���� ���� ó��
                begin
                  RcvChangeDoorData(stNodeNo,stReceiveData);
                end;
             'c' ://������ ����
                begin
                  RcvDoorControl(stNodeNo,stReceiveData);
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
  end;   }
end;



procedure TfmAlarmTypeMonitoring.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd: string;
  i : integer;
begin
  stCmd := Params.Values['Data'];

  //���⼭�� ���Ը�� ������

end;


procedure TfmAlarmTypeMonitoring.CommandArrayCommandsTCommand2Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmAlarmTypeMonitoring.CommandArrayCommandsTCommand3Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd: string;
  i : integer;
begin
  stCmd := Params.Values['Data'];

  for i:=0 to DeviceStateList.Count - 1 do
  begin
    if stCmd = 'ALARMSETTING' then  //��ü���
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + DeviceStateList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end else if stCmd = 'ALARMDISABLE' then  //��ü����
    begin
      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + DeviceStateList.Strings[i] + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      Delay(100);
    end;
  end;

end;

procedure TfmAlarmTypeMonitoring.RcvCardReadData(aNodeNo, aReceiveData: string);
begin

end;


function TfmAlarmTypeMonitoring.GetAreaName(aBuildingCode, aFloorCode,
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

function TfmAlarmTypeMonitoring.GetBuildingName(aBuildingCode: string): string;
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

function TfmAlarmTypeMonitoring.GetFloorName(aBuildingCode,
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

function TfmAlarmTypeMonitoring.GetPermitState(aPermit: string): string;
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

function TfmAlarmTypeMonitoring.GetUserInfo(aCardNo: string; var stUserName,
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

procedure TfmAlarmTypeMonitoring.LoadCompanyCode;
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
//TEST___________
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := 'LoadCompanyCode';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;

  end;
end;

procedure TfmAlarmTypeMonitoring.LoadDepartCode;
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
//TEST___________
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := 'LoadDepartCode';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;

  end;
end;

procedure TfmAlarmTypeMonitoring.CommandArrayCommandsTCommand4Execute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
end;

procedure TfmAlarmTypeMonitoring.InsertDOORList(aPermitCode,aPermit, aTime, aLocationName,
  aDoorName, aCardNo, aUserName, aCompanyName, aJijumName,aDepartName, aEmID,aDoorID,aHandPhone,aCompanyPhone,aAddr1,aAddr2: string;List:TAdvStringGrid);
var
  nCol: integer;
begin

  with List do
  begin
    //ColWidths[10] := 0;  //�����ڵ�
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
    Cells[DoorIndexArray[0],1] := MakeDatetimeStr(aTime);   //�߻��ð�
    Cells[DoorIndexArray[1],1] := aLocationName ; //copy(aLocationName,10,length(aLocationName)-9); //��ġ
    Cells[DoorIndexArray[2],1] := aDoorName; //���Թ�
    Cells[DoorIndexArray[3],1] := aPermitCode; //���λ��� �ڵ�
    Cells[DoorIndexArray[4],1] := aPermit; //���λ���
    Cells[DoorIndexArray[5],1] := aCardNo; //ī���ȣ
    Cells[DoorIndexArray[6],1] := aUserName; //�̸�
    Cells[DoorIndexArray[7],1] := aCompanyName ; //ȸ���
    Cells[DoorIndexArray[8],1] := aJijumName ; //�μ���
    Cells[DoorIndexArray[9],1] := aDepartName ; //�μ���
    Cells[DoorIndexArray[10],1] := aEmID; //���
    Cells[DoorIndexArray[11],1] := aDoorID; //���Թ����̵�
    Cells[DoorIndexArray[12],1] := aHandPhone; //�ڵ���
    Cells[DoorIndexArray[13],1] := aCompanyPhone; //�系��ȭ��ȣ
    Cells[DoorIndexArray[14],1] := aAddr1; //�ּ�1
    Cells[DoorIndexArray[15],1] := aAddr2; //�ּ�2
  end;

end;

function TfmAlarmTypeMonitoring.GetStatusCode(aStatusCode: string;
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

procedure TfmAlarmTypeMonitoring.InsertAlarmList(aTime, aLocateName, aAlarmName,
  aDeviceID, aDeviceType, aStatusCode, aStatusName,aAlaramCode: string;aAlarmSound:Boolean;
  aColor:string;List: TAdvStringGrid);
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
    Cells[AlarmIndexArray[0],1] := MakeDatetimeStr(aTime);       //�߻��ð�
    Cells[AlarmIndexArray[1],1] := aLocateName; // copy(aLocateName,10,length(aLocateName)-9); //��ġ
    Cells[AlarmIndexArray[2],1] := aAlarmName;  //��豸��
    Cells[AlarmIndexArray[3],1] := aDeviceID;   //����ġ��ȣ
    Cells[AlarmIndexArray[4],1] := aDeviceType; //����ȣ
    Cells[AlarmIndexArray[5],1] := aStatusCode; //�߻��ڵ�
    Cells[AlarmIndexArray[6],1] := aStatusName; //�̺�Ʈ����
    Cells[AlarmIndexArray[7],1] := aAlaramCode; //AlarmCode
  end;

end;

procedure TfmAlarmTypeMonitoring.Action_ReloadExecute(Sender: TObject);
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


procedure TfmAlarmTypeMonitoring.ClearEmpInfo;
begin
end;


procedure TfmAlarmTypeMonitoring.sg_AccessKeyDown(Sender: TObject; var Key: Word;
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

procedure TfmAlarmTypeMonitoring.DisConnectAlarm(aAlarmID: string);
begin

end;


procedure TfmAlarmTypeMonitoring.CommandArrayCommandsTCommand5Execute(
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

procedure TfmAlarmTypeMonitoring.FormShow(Sender: TObject);
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


  //sg_AccessHeaderNameSet;  //2011.07.06 ���� ���濡 ���� ���ܵ�

  sg_Main.ColWidths[2] := 0;
  //if L_bFirst then       //20161226 FormActive ���� ���� �ϴ� ���� Showmessage �� ó�� ��... //FormActive �� ������ ȭ�鿡 �ε� �Ǳ� ���� ������ ��� ���� �κ� ������ Index ���� �߻�
  begin
    //L_bFirst := False;
    LoadingNode;
    LoadingEcu('000','��ü');
    LoadingBuilding;
    LoadingPatrolArea('000000000','��ü');
    if ALARMVIEW = 'QUERY' then
    begin

//TEST___________
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := 'ALARMREFRESH_START';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMREFRESH'+ DATADELIMITER + '00000' + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
//TEST___________

    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := 'ALARMREFRESH_END';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;
    end;
  end;

  //Form_Initialize;  //Ini ������ ���� �ϵ��� ó����
  //GridSetting; //�׸��带 ����� ȯ�濡 �°� ������
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'AlarmTypeMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Application.ProcessMessages;

end;

procedure TfmAlarmTypeMonitoring.N12Click(Sender: TObject);
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

procedure TfmAlarmTypeMonitoring.PageControl1Change(Sender: TObject);
begin
  //showmessage(PageControl1.ActivePage.Name);
  UPDATETB_USERCONFIG('KTMONITOR','DEVICETAB',PageControl1.ActivePage.Name)
end;

function TfmAlarmTypeMonitoring.UPDATETB_USERCONFIG(aConfigGroup,aConfigID,
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

function TfmAlarmTypeMonitoring.InsertTB_USERCONFIG(aConfigGroup,aConfigID,
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

procedure TfmAlarmTypeMonitoring.PageControl2Change(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','WATCHTAB',PageControl2.ActivePage.Name)
end;

procedure TfmAlarmTypeMonitoring.pan_deviceResize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','DEVICEW',inttostr(pan_device.Width))
end;

procedure TfmAlarmTypeMonitoring.Panel12Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','INTEGH',inttostr(Panel12.Height))
end;

procedure TfmAlarmTypeMonitoring.Panel15Resize(Sender: TObject);
begin
  UPDATETB_USERCONFIG('KTMONITOR','INTATH',inttostr(Panel15.Height))
end;

procedure TfmAlarmTypeMonitoring.Panel14Resize(Sender: TObject);
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

procedure TfmAlarmTypeMonitoring.Form_Initialize;
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

procedure TfmAlarmTypeMonitoring.BuildingListViewDblClick(Sender: TObject);
var
  nIndex : integer;
  stBuildingID : string;
  stBuildingName : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingName := BuildingListView.Items[nIndex].Caption;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];
  LoadingPatrolArea(stBuildingID,stBuildingName);
  PageControl2.ActivePageIndex := 1;
end;

procedure TfmAlarmTypeMonitoring.MenuItem6Click(Sender: TObject);
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
  fmZonePosition.stDeviceName  := stAlarmName + ' ';

  fmZonePosition.ShowModal;
  fmZonePosition.Free;
end;


function TfmAlarmTypeMonitoring.updateTB_ZONEDEVICEState(aAlarmNo, aZoneNum,
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

procedure TfmAlarmTypeMonitoring.DisplaySensorState(aNodeNo, aECUID,aPortNo, aMode,aSubCLass,
  aStatusCode: string;bZoneSensor:Boolean);
begin


end;

function TfmAlarmTypeMonitoring.CheckSchedule(aNodeNo, aECUID,
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

function TfmAlarmTypeMonitoring.GetPortName(aNodeNo, aECUID,
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

procedure TfmAlarmTypeMonitoring.Insertsg_SensorList(aTime,aNodeNo, aECUID, aPortNo,
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




procedure TfmAlarmTypeMonitoring.AlarmDataProcess(aNodeNo, aEcuID, aType, aACTION,
  aData: string);
begin

end;

procedure TfmAlarmTypeMonitoring.ACDataProcess(aNodeNo, aECUID, aData: string);
begin
  RcvCardReadData(aNodeNo,aData);
end;

procedure TfmAlarmTypeMonitoring.FormActivate(Sender: TObject);
begin
  st_Message.Font.Size := G_nAlarmMessageFontSize;
  if L_bFirst then
  begin
    L_bFirst := False;

    Pan_Remark1.Visible := G_bACIntroView;

    PageControl1.ActivePageIndex := 0;
    PageControl2.ActivePageIndex := 0;
  end;
  N7.Visible := BuildingAlarmShow;
  mn_BuildingArmControl.Visible := BuildingAlarmShow;
  mn_BuildingDisArmControl.Visible := BuildingAlarmShow;
end;

procedure TfmAlarmTypeMonitoring.SearchAlarmList;  
begin

end;

procedure TfmAlarmTypeMonitoring.sg_AlarmDblClickCell(Sender: TObject; ARow,
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
        for i:=0 to colcount -1 do  //ù°�� ����
        begin
          cells[i,Row] := '';
        end;   }
      end;
      Exit;
    End;
    AlaramConfirm(copy(stAlarmID,1,3),copy(stAlarmID,4,2),copy(stAlarmID,6,1));
  end;

end;

procedure TfmAlarmTypeMonitoring.sg_AccessColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeDoorIndex(FromIndex,ToIndex);
end;

procedure TfmAlarmTypeMonitoring.GridSetting;
var
  i : integer;
begin
  for i:=0 to sg_Access.ColCount - 1 do
  begin
    DoorIndexArray[i] := i;
    relDoorIndexArray[i] := i;
  end;
  for i:=0 to sg_Alarm.ColCount - 1 do
  begin
    AlarmIndexArray[i] := i;
    relAlarmIndexArray[i] := i;
  end;


end;

procedure TfmAlarmTypeMonitoring.ChangeDoorIndex(FromIndex, ToIndex: integer);
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

procedure TfmAlarmTypeMonitoring.ChangeAlarmIndex(FromIndex, ToIndex: integer);
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


procedure TfmAlarmTypeMonitoring.sg_AlarmColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    ChangeAlarmIndex(FromIndex,ToIndex);

end;

procedure TfmAlarmTypeMonitoring.sg_AccessHeaderNameSet;
begin
  with sg_Access do
  begin
    cells[0,0] := '�߻�����';
    cells[1,0] := '��ġ';
    cells[2,0] := '�������';
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

procedure TfmAlarmTypeMonitoring.ShowMessage(aMessage: string);
begin

end;

procedure TfmAlarmTypeMonitoring.LoadJijumCode;
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
//TEST___________
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := 'LoadJijumCode';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;

  end;
end;


procedure TfmAlarmTypeMonitoring.Action_intAlarmHistoryExecute(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stAlarmName : string;
begin

  stNodeNo := copy(sg_Alarm.Cells[7,sg_Alarm.row],1,3);
  stEcuID := copy(sg_Alarm.Cells[7,sg_Alarm.row],4,2);
  stArmAreaNo := copy(sg_Alarm.Cells[7,sg_Alarm.row],6,1);
  stAlarmName := sg_Alarm.Cells[2,sg_Alarm.row];
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

procedure TfmAlarmTypeMonitoring.CommandArrayCommandsTFIRERECOVERExecute(
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

procedure TfmAlarmTypeMonitoring.CenterPanel;
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

procedure TfmAlarmTypeMonitoring.FormResize(Sender: TObject);
begin
  CenterPanel;

end;

procedure TfmAlarmTypeMonitoring.MessageTimerTimer(Sender: TObject);
begin
  Try
    //pan_Message.Visible := Not pan_Message.Visible;
    st_message.Visible := Not st_message.Visible;
  Except
    Exit;
  End;
end;

procedure TfmAlarmTypeMonitoring.btn_AlarmConfirmClick(Sender: TObject);
begin
  if fmMain.MediaPlayer1.Mode = mpPlaying then fmMain.MediaPlayer1.Stop;
  if fmMain.MediaPlayer2.Mode = mpPlaying then fmMain.MediaPlayer2.Stop;
  AlarmSoundFileList.Clear;
//  MessageTimer.Enabled := False;
  pan_Message.visible := False;

end;

procedure TfmAlarmTypeMonitoring.N8Click(Sender: TObject);
begin
  BuildingListView.ViewStyle := vsIcon;
  BuildingListView.Refresh;
end;

procedure TfmAlarmTypeMonitoring.N17Click(Sender: TObject);
begin
  BuildingListView.ViewStyle := vsList;
  BuildingListView.Refresh;

end;

procedure TfmAlarmTypeMonitoring.LoadingEcu(aNodeNo,aNodeName: string);
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
    if aNodeNo = '000' then //��ü
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
//TEST___________
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := 'LoadingEcu';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;
end;

procedure TfmAlarmTypeMonitoring.LoadingNode;
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
//TEST___________
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := 'LoadingNode';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;
end;

procedure TfmAlarmTypeMonitoring.sg_MainDblClick(Sender: TObject);
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

procedure TfmAlarmTypeMonitoring.LoadingBuilding;
var
  i : integer;
  stBuildingName : string;
  stBuildingID : string;
begin
  BuildingListView.Clear;
  for i := 0 to BuildingList.Count - 1 do
  begin
    stBuildingName := BuildingNameList.Strings[i];
    BuildingListView.Items.Add.Caption:= stBuildingName;
    stBuildingID := BuildingList.strings[i];
    BuildingListView.Items[I].SubItems.Add(stBuildingID);     // ����ID

    if TBuildingState(BuildingList.Objects[i]).BuildingAlaramMode = cmArm then
    begin
      BuildingListView.Items[I].ImageIndex:= AlarmModeStateImageIndex;
    end else
    begin
      BuildingListView.Items[I].ImageIndex:= DisAlarmModeStateImageIndex;
    end;

    if TBuildingState(BuildingList.Objects[i]).BuildingAlaramEvent = aeNormalEvent then
    begin
      BuildingListView.Items[I].StateIndex := NormalEventStateIndex;
    end else if TBuildingState(BuildingList.Objects[i]).BuildingAlaramEvent = aeAlarmEvent then
    begin
      BuildingListView.Items[I].StateIndex := AlarmEventStateIndex;
    end else
    begin
      BuildingListView.Items[I].StateIndex := NothingStateIndex;
    end;
  end;
//TEST___________
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := 'LoadingBuilding';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;
end;

procedure TfmAlarmTypeMonitoring.LoadingPatrolArea(aBuildingCode,
  aBuildingName: string);
var
  i : integer;
  nBuildingIndex : integer;
  stAlarmName : string;
  stAlarmAreaID : string;
  stDeviceID : string;
  nDeviceIndex : integer;
  nAlarmAreaNo : integer;
  AlarmMode : TWatchMode;
  AlarmEventState : TAlarmEventState;
begin
  tabArea.Caption := aBuildingName;
  AlarmListView.Clear;
  nBuildingIndex := -1;
  if BuildingStep = '0' then
    L_stSelectBuildingCode := copy(aBuildingCode,1,3)
  else if BuildingStep = '1' then
    L_stSelectBuildingCode := copy(aBuildingCode,1,6)
  else if BuildingStep = '2' then
    L_stSelectBuildingCode := copy(aBuildingCode,1,9);

  nBuildingIndex := BuildingList.IndexOf(L_stSelectBuildingCode);
  if nBuildingIndex < 0 then Exit;
  for i := 0 to TBuildingState(BuildingList.Objects[nBuildingIndex]).BuildingAlarmList.Count - 1 do
  begin
    stAlarmName := TBuildingState(BuildingList.Objects[nBuildingIndex]).BuildingAlarmNameList.Strings[i];
    AlarmListView.Items.Add.Caption:= stAlarmName;
    stAlarmAreaID := TBuildingState(BuildingList.Objects[nBuildingIndex]).BuildingAlarmList.Strings[i];
    AlarmListView.Items[i].SubItems.Add(stAlarmAreaID);
    stDeviceID := copy(stAlarmAreaID,1,5);
    nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
    nAlarmAreaNo := 0;
    if isDigit(stAlarmAreaID[6]) then
      nAlarmAreaNo := strtoint(stAlarmAreaID[6]);
    if nDeviceIndex > -1 then
    begin
      AlarmListView.Items[I].ImageIndex := AlarmNothingStateImageIndex;
      AlarmMode := TDeviceState(DeviceStateList.Objects[nDeviceIndex]).GetAlarmMode(nAlarmAreaNo);
      if AlarmMode = cmNothing then
      begin
        AlarmListView.Items[I].ImageIndex := AlarmNothingStateImageIndex;
      end else if AlarmMode = cmArm then
      begin
        AlarmListView.Items[I].ImageIndex := AlarmModeStateImageIndex;
      end else if AlarmMode = cmDisarm then
      begin
        AlarmListView.Items[I].ImageIndex := DisAlarmModeStateImageIndex;
      end else if AlarmMode = cmPatrol then
      begin
        AlarmListView.Items[I].ImageIndex := AlarmPatrolStateImageIndex;
      end else if AlarmMode = cmInit then
      begin
        AlarmListView.Items[I].ImageIndex := AlarmInitStateImageIndex;
      end else if AlarmMode = cmTest then
      begin
        AlarmListView.Items[I].ImageIndex := AlarmTestStateImageIndex;
      end;

      AlarmListView.Items[I].StateIndex := NothingStateIndex;
      AlarmEventState := TDeviceState(DeviceStateList.Objects[nDeviceIndex]).GetAlarmEventState(nAlarmAreaNo);
      if AlarmEventState = aeNothing then
      begin
        AlarmListView.Items[I].StateIndex := NothingStateIndex;
      end else if AlarmEventState = aeNormal then
      begin
        AlarmListView.Items[I].StateIndex := NothingStateIndex;
      end else if AlarmEventState = aeNormalEvent then
      begin
        AlarmListView.Items[I].StateIndex := NormalEventStateIndex;
      end else if AlarmEventState = aeAlarmEvent then
      begin
        AlarmListView.Items[I].StateIndex := AlarmEventStateIndex;
      end;
    end;

  end;
  if AlarmListView.ViewStyle = vsList then
  begin
    AlarmListView.ViewStyle := vsIcon;
    AlarmListView.Refresh;
    AlarmListView.ViewStyle := vsList;
  end;
//TEST___________
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := 'LoadingPatrolArea';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;

end;

procedure TfmAlarmTypeMonitoring.mi_AlarmSearchClick(Sender: TObject);
begin
  BuildingListViewDblClick(self);
end;

procedure TfmAlarmTypeMonitoring.BuildingListViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if BuildingListView.ItemIndex < 0 then Exit;
  BuildingListView.Items[BuildingListView.ItemIndex].Selected := True;

end;

procedure TfmAlarmTypeMonitoring.mi_BuildingBigIconClick(Sender: TObject);
begin
  BuildingListView.ViewStyle := vsIcon;
end;

procedure TfmAlarmTypeMonitoring.mi_BuildingSmallIconClick(
  Sender: TObject);
begin
  BuildingListView.ViewStyle := vsList;

end;

procedure TfmAlarmTypeMonitoring.MenuItem3Click(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if AlarmListView.SelCount < 1 then Exit;
  for i := 0 to AlarmListView.Items.Count - 1 do
  begin
    if AlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmListView.Items[i].SubItems.Strings[0];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,copy(stAlarmID,6,1),'0000000000','�����')
    end;
  end;

end;

procedure TfmAlarmTypeMonitoring.MenuItem4Click(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if AlarmListView.SelCount < 1 then Exit;
  for i := 0 to AlarmListView.Items.Count - 1 do
  begin
    if AlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmListView.Items[i].SubItems.Strings[0];

      self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
      self.FindSubForm('Main').FindCommand('SendData').Execute;
      DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmID,1,3),copy(stAlarmID,4,2),ALARMTYPE,copy(stAlarmID,6,1),'0000000000','�������')
    end;
  end;

end;

procedure TfmAlarmTypeMonitoring.mi_AlarmBigIconClick(Sender: TObject);
begin
  AlarmListView.ViewStyle := vsIcon;
end;

procedure TfmAlarmTypeMonitoring.mi_AlarmSmallIconClick(Sender: TObject);
begin
  AlarmListView.ViewStyle := vsList;
end;

procedure TfmAlarmTypeMonitoring.DeviceConnected(NodeNo: integer;
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
      //nDeviceIndex :=DeviceStateList.IndexOf(stDeviceID);
      if nDeviceIndex > -1 then
      begin
        RemoveImageIdx(0,nDeviceIndex + 1);
        if aConnected then
          AddImageIdx(0,nDeviceIndex + 1,DeviceConnectImageIndex,haLeft,vaCenter)
        else AddImageIdx(0,nDeviceIndex + 1,DeviceDisConnectImageIndex,haLeft,vaCenter);
      end;
    end else
    begin
      if L_stSelectNodeNo <> FillZeroNumber(NodeNo,3) then Exit; //���� ���õ� ��尡 �ƴϸ� �ʿ� ����
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

procedure TfmAlarmTypeMonitoring.NodeConnectState(NodeNo: integer;
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

procedure TfmAlarmTypeMonitoring.AlarmModeChanged(NodeNo: integer;
  aEcuID,aAlarmArea: string; aWachMode: TWatchMode);
var
  nBuildingIndex : integer;
  nAlarmIndex : integer;
  stArmAreaID : string;
begin
  stArmAreaID := FillZeroNumber(NodeNo,3) + aEcuID + aAlarmArea;
  nBuildingIndex := BuildingList.IndexOf(L_stSelectBuildingCode);
  nAlarmIndex := TBuildingState(BuildingList.Objects[nBuildingIndex]).BuildingAlarmList.IndexOf(stArmAreaID);
  if nAlarmIndex < 0 then Exit;
  if AlarmListView.Items.Count <= nAlarmIndex then Exit;
  AlarmListView.Items[nAlarmIndex].ImageIndex := AlarmNothingStateImageIndex;
  if aWachMode = cmNothing then
  begin
    AlarmListView.Items[nAlarmIndex].ImageIndex := AlarmNothingStateImageIndex;
  end else if aWachMode = cmArm then
  begin
    AlarmListView.Items[nAlarmIndex].ImageIndex := AlarmModeStateImageIndex;
  end else if aWachMode = cmDisarm then
  begin
    AlarmListView.Items[nAlarmIndex].ImageIndex := DisAlarmModeStateImageIndex;
  end else if aWachMode = cmPatrol then
  begin
    AlarmListView.Items[nAlarmIndex].ImageIndex := AlarmPatrolStateImageIndex;
  end else if aWachMode = cmInit then
  begin
    AlarmListView.Items[nAlarmIndex].ImageIndex := AlarmInitStateImageIndex;
  end else if aWachMode = cmTest then
  begin
    AlarmListView.Items[nAlarmIndex].ImageIndex := AlarmTestStateImageIndex;
  end;
end;

procedure TfmAlarmTypeMonitoring.AccessEventProcess(NodeNo: integer;
  aEcuID, aDoorNo, aReaderNo, aCardNo, aTime, aPermit, aInputType,
  aButton,aArmAreaNo: string);
var
  stArmAreaID : string;
  stAlarmName : string;
  nArmAreaIndex : integer;
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
  stArmAreaID := FillZeroNumber(NodeNo,3) + aEcuID + aArmAreaNo;
  nArmAreaIndex := ArmAreaStateList.IndexOf(stArmAreaID);
  if nArmAreaIndex < 0 then
  begin
    Exit;
  end;
  stAlarmName := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).ArmAreaName;
  stBuildingCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).BuildingCode;
  stFloorCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).FloorCode;
  stAreaCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AreaCode;
  if BuildingStep = '0' then stBuildingID := stBuildingCode
  else if BuildingStep = '1' then stBuildingID := stBuildingCode + stFloorCode
  else if BuildingStep = '2' then stBuildingID := stBuildingCode + stFloorCode + stAreaCode;
  nBuildingIndex := BuildingList.IndexOf(stBuildingID);
  if nBuildingIndex > -1 then
    stBuildingName := BuildingNameList.Strings[nBuildingIndex];

  stPermitName := GetPermitState(aPermit);
  if ACAlarmUse then
  begin
    if Not Isdigit(aPermit) then
    begin
      self.FindSubForm('Main').FindCommand('AlarmSound').Params.Values['VALUE'] := ACAlaramFile;
      self.FindSubForm('Main').FindCommand('AlarmSound').Execute;
    end;
  end;
  GetUserInfo(aCardNo,stEmName,stCompanyName,stJijumName,stDepartName,stEmCode,stHandPhone,stCompanyPhone,stAddr1,stAddr2);

  InsertDOORList(aPermit,stPermitName,aTime,stBuildingName,stAlarmName,aCardNo,stEmName,
    stCompanyName,stJijumName,stDepartName,stEmCode,stArmAreaID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_Access)
end;

procedure TfmAlarmTypeMonitoring.AlarmEventProcess(NodeNo: integer; ECUID,aArmAreaNo,
  aCmd, aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode, aStatusCode,
  aPortNo, aState, aOperator, aNewStateCode: string; aAlarmView,
  aAlarmSound: Boolean;aColor:string);
var
  stArmAreaID : string;
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
begin
  stArmAreaID := FillZeroNumber(NodeNo,3) + ECUID + aArmAreaNo;
  nArmAreaIndex := ArmAreaStateList.IndexOf(stArmAreaID);
  if nArmAreaIndex > -1 then
  begin
    //��ϵ��� ���� ��� ������
    stAlarmName := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).ArmAreaName;
    stBuildingCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).BuildingCode;
    stFloorCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).FloorCode;
    stAreaCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AreaCode;
  end else
  begin
    nDeviceIndex := DeviceStateList.IndexOf(FillZeroNumber(NodeNo,3) + ECUID);
    if nDeviceIndex > -1 then
      stAlarmName := TDeviceState(DeviceStateList.Objects[nDeviceIndex]).DeviceName;
  end;
  if BuildingStep = '0' then stBuildingID := stBuildingCode
  else if BuildingStep = '1' then stBuildingID := stBuildingCode + stFloorCode
  else if BuildingStep = '2' then stBuildingID := stBuildingCode + stFloorCode + stAreaCode;
  nBuildingIndex := BuildingList.IndexOf(stBuildingID);
  if nBuildingIndex > -1 then
    stBuildingName := BuildingNameList.Strings[nBuildingIndex];

  nResult:= GetStatusCode(aStatusCode,stStatusName,nAlarmSound);
  if aPortNo <> '**' then
  begin
    if aState <> 'N' then
    begin
      //stPortName := GetPortName(FillZeroNumber(NodeNo,3),ECUID,aPortNo);
      if aSubCLass <> 'EL' then stPortName := GetPortName(FillZeroNumber(NodeNo,3),ECUID,aPortNo)
      else stPortName := dmDBFunction.GetDeviceName(FillZeroNumber(NodeNo,3),ECUID) + '_' + aSubAddr;
      //stPortName := '[' + aSubAddr + ']' + stPortName;
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
  aSubCLass := dmDBFunction.GetDeviceType(aSubCLass) + '[' + aSubAddr + ']';
  case UpperCase(aMode)[1] of
   'A': begin stModeStr:= '�����[A]' end;
   'D': begin stModeStr:= '�������[D]' end;
   'T': begin stModeStr:= '������[T]' end;
   'I': begin stModeStr:= '��ϸ��[I]' end;
   'P': begin stModeStr:= '��ȸ���[P]' end;
  else  begin stModeStr:= '�̵�ϸ��['+aMode[1]+']' end;
  end;
  stStatusName := stStatusName + '/' + stModeStr;

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
      InsertAlarmList(aTime, //�ð�
                    stBuildingName, //��ġ����
                    stAlarmName, //��豸����Ī
                    ECUID ,//+'['+stMsgNo+']',  //����ȣ[�޽�����ȣ]
                    aSubCLass,         //���Ÿ��[��ȣ]
                    aStatusCode + '/' + aPortNo,  //�̺�Ʈ�ڵ�
                    stStatusName,
                    FillZeroNumber(NodeNo,3) + ECUID,
                    aAlarmSound,
                    aColor,
                    sg_Alarm);  //�̺�Ʈ ����
    end;
  end;

  if PTAlarmMessageUse then  //ZONE Sensing Message Use
  begin
    if aCmd = 'A' then
    begin
      if isDigit(aPortNo) then
      begin
        st_BuildingName.Caption := stBuildingName;
        st_Message.Caption := stAlarmName + ':' + aPortNo + '�� �� ����!!!';
        pan_message.Visible := True;
        MessageTimer.Enabled := True;
      end;
    end;
  end;

end;

procedure TfmAlarmTypeMonitoring.AlarmListClear;
var
  i : integer;
begin
  sg_Alarm.InsertRows(1,1);
  GridInitialize(sg_Alarm,2);
  for i := 0 to BuildingListView.Items.Count - 1 do
  begin
    if BuildingListView.Items[I].StateIndex <> NothingStateIndex then
    begin
      BuildingListView.Items[I].StateIndex := NothingStateIndex;
      BuildingListView.Refresh;
    end;
  end;
  for i := 0 to AlarmListView.Items.Count - 1 do
  begin
    if AlarmListView.Items[I].StateIndex <> NothingStateIndex then
    begin
      AlarmListView.Items[I].StateIndex := NothingStateIndex;
      AlarmListView.Refresh;
    end;
  end;
end;

procedure TfmAlarmTypeMonitoring.BuildingAlarmEventProcess(
  aBuildingCode: string; aAlaramState: TAlarmEventState);
var
  stBuildingID : string;
  nBuildingIndex : integer;
begin
  if BuildingStep = '0' then stBuildingID := copy(aBuildingCode,1,3)
  else if BuildingStep = '1' then stBuildingID := copy(aBuildingCode,1,6)
  else if BuildingStep = '2' then stBuildingID := copy(aBuildingCode,1,9);

  nBuildingIndex := BuildingList.IndexOf(stBuildingID);
  if nBuildingIndex < 0 then Exit;
  
  if aAlaramState = aeNormalEvent then
  begin
    BuildingListView.Items[nBuildingIndex].StateIndex := NormalEventStateIndex;
  end else if aAlaramState = aeAlarmEvent then
  begin
    BuildingListView.Items[nBuildingIndex].StateIndex := AlarmEventStateIndex;
  end else
  begin
    BuildingListView.Items[nBuildingIndex].StateIndex := NothingStateIndex;
  end;

end;

procedure TfmAlarmTypeMonitoring.DeviceAlarmEventProcess(NodeNo: integer;
  ECUID,aArmAreaNo: string; aAlaramState: TAlarmEventState);
var
  nBuildingIndex : integer;
  stAlarmID : string;
  nAlarmIndex : integer;
begin
  nBuildingIndex := BuildingList.IndexOf(L_stSelectBuildingCode);
  if nBuildingIndex < 0 then Exit;
  stAlarmID := FillZeroNumber(NodeNo,3) + ECUID + inttostr(strtoint(aArmAreaNo));
  nAlarmIndex := TBuildingState(BuildingList.Objects[nBuildingIndex]).BuildingAlarmList.IndexOf(stAlarmID);
  if nAlarmIndex < 0 then Exit;
  if AlarmListView.Items.Count <= nAlarmIndex then Exit;

  AlarmListView.Items[nAlarmIndex].StateIndex := NothingStateIndex;
  if aAlaramState = aeNothing then
  begin
    //AlarmListView.Items[nAlarmIndex].StateIndex := NothingStateIndex;
  end else if aAlaramState = aeNormal then
  begin
    //AlarmListView.Items[nAlarmIndex].StateIndex := NothingStateIndex;
  end else if aAlaramState = aeNormalEvent then
  begin
    AlarmListView.Items[nAlarmIndex].StateIndex := NormalEventStateIndex;
  end else if aAlaramState = aeAlarmEvent then
  begin
    AlarmListView.Items[nAlarmIndex].StateIndex := AlarmEventStateIndex;
  end;

end;

procedure TfmAlarmTypeMonitoring.MenuItem8Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmListView.items[AlarmListView.ItemIndex].SubItems.Strings[0];
  stAlarmName := AlarmListView.items[AlarmListView.ItemIndex].Caption;

  if bDeviceMapShow then  fmDeviceMap.MapFree;

  if Not bDeviceMapShow then
  begin
    fmDeviceMap:= TfmDeviceMap.Create(Self);
    fmDeviceMap.DeviceID := stAlarmID;
    fmDeviceMap.DeviceName := stAlarmName;
    fmDeviceMap.DeviceType := '4';
    fmDeviceMap.L_stCreateForm := 'TfmAlarmTypeMonitoring';
    bDeviceMapShow := True;

    fmDeviceMap.SHow;
    fmDeviceMap.bActive := True;
  end;

end;

procedure TfmAlarmTypeMonitoring.MenuItem9Click(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
  stLocateName : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmListView.items[AlarmListView.ItemIndex].SubItems.Strings[0];
  stAlarmName := AlarmListView.items[AlarmListView.ItemIndex].Caption;
//  stLocateName := AlarmLocateList.Strings[IntAlarmListView.ItemIndex];

  fmDeviceInfo:= TfmDeviceInfo.Create(Self);
  fmDeviceInfo.DeviceID := stAlarmID;
  fmDeviceInfo.DeviceName := stAlarmName;
  fmDeviceInfo.DeviceType := '4';
  fmDeviceInfo.LocateName := copy(stLocateName,10,length(stLocateName) - 9);
  fmDeviceInfo.SHowmodal;
  fmDeviceInfo.Free;
end;

procedure TfmAlarmTypeMonitoring.mi_AlarmConfirmClick(Sender: TObject);
var
  stAlarmID : string;
  stDeviceID : string;
  stAlarmName : string;
  nDeviceIndex : integer;
  bAlarmConfirm : Boolean;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmListView.items[AlarmListView.ItemIndex].SubItems.Strings[0];
  stDeviceID := copy(stAlarmID,1,5);
  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then Exit;
  if ALARMVIEW = 'QUERY' then
  begin
    stAlarmName := AlarmListView.items[AlarmListView.ItemIndex].Caption;
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

procedure TfmAlarmTypeMonitoring.AlarmListViewDblClick(Sender: TObject);
begin
  inherited;
  mi_AlarmConfirmClick(self);
end;

procedure TfmAlarmTypeMonitoring.CommandArrayCommandsTCommand6Execute(
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
//      DisConnectServer;
    end else if pos('CONNECTED',upperCase(stValue)) > 0 then
    begin
//      ConnectServer;
    end;
  end else if UpperCase(stCmd) = 'NODE' then
  begin
    if pos('DISCONNECTED',upperCase(stValue)) > 0 then
    begin
//      DisConnectNode('N' + copy(stID,1,3));
    end else if pos('CONNECTED',upperCase(stValue)) > 0 then
    begin
//      ConnectNode('N' + copy(stID,1,3));
    end;
  end else if UpperCase(stCmd) = 'DEVICE' then
  begin
    if pos('DISCONNECTED',upperCase(stValue)) > 0 then
    begin
//      DisConnectECU('E'+ copy(stID,1,5));
    end else if pos('CONNECTED',upperCase(stValue)) > 0 then
    begin
//      ConnectECU('E'+ copy(stID,1,5));
    end;
  end;  //
end;

procedure TfmAlarmTypeMonitoring.N4Click(Sender: TObject);
begin
  sg_AlarmDblClickCell(sg_Alarm,sg_Alarm.Row,sg_Alarm.Col);
end;

procedure TfmAlarmTypeMonitoring.sg_AlarmMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  sg_Alarm.SelectRows(sg_Alarm.Row,1);

end;

procedure TfmAlarmTypeMonitoring.sg_MainMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  sg_Main.SelectRows(sg_Main.Row,1);

end;

procedure TfmAlarmTypeMonitoring.sg_ECUMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  sg_ECU.SelectRows(sg_ECU.Row,1);

end;

procedure TfmAlarmTypeMonitoring.mn_pingTestClick(Sender: TObject);
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

procedure TfmAlarmTypeMonitoring.mn_TimeSyncClick(Sender: TObject);
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

procedure TfmAlarmTypeMonitoring.mn_AllCardDownloadClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stDeviceID: string;
begin
  stNodeNo := sg_Ecu.Cells[3,sg_Ecu.Row];
  if Not isDigit(stNodeNo) then Exit;
  stEcuID := sg_Ecu.Cells[1,sg_Ecu.Row];
  stDeviceID := FillZeroNumber(strtoint(stNodeNo),3) + stEcuID;

  if (Application.MessageBox(PChar('��ü���� ���۽� ���� ����� ������ ��� ���� �˴ϴ�. ��ü���� �����Ͻðڽ��ϱ�?'),'����',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + stDeviceID + DATADELIMITER + 'Y' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert('0','00','0','0',stDeviceID , '����������');

end;

procedure TfmAlarmTypeMonitoring.mn_DeviceResetClick(Sender: TObject);
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

procedure TfmAlarmTypeMonitoring.ExitButtonPress(NodeNo: integer; aEcuID,
  aDoorNo, aTime, aInputType,aUserName,aPermitCode,aPermit: string);
var
  stArmAreaID : string;
  stAlarmName : string;
  nArmAreaIndex : integer;
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
  stArmAreaID := FillZeroNumber(NodeNo,3) + aEcuID + '0';
  nArmAreaIndex := ArmAreaStateList.IndexOf(stArmAreaID);
  if nArmAreaIndex < 0 then
  begin
    //��ϵ��� ���� ��� ������
    Exit;
  end;
  stAlarmName := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).ArmAreaName;
  stBuildingCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).BuildingCode;
  stFloorCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).FloorCode;
  stAreaCode := TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AreaCode;
  if BuildingStep = '0' then stBuildingID := stBuildingCode
  else if BuildingStep = '1' then stBuildingID := stBuildingCode + stFloorCode
  else if BuildingStep = '2' then stBuildingID := stBuildingCode + stFloorCode + stAreaCode;
  nBuildingIndex := BuildingList.IndexOf(stBuildingID);
  if nBuildingIndex > -1 then
    stBuildingName := BuildingNameList.Strings[nBuildingIndex];


  InsertDOORList(aPermitCode,aPermit,aTime,stBuildingName,stAlarmName,aInputType,aUserName,
    '','','','',stArmAreaID,'','','','',sg_Access)

end;

procedure TfmAlarmTypeMonitoring.mn_AlarmReportClick(Sender: TObject);
var
  stAlarmID : string;
  stAlarmName : string;
  stLocateName : string;
begin
  if AlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmListView.items[AlarmListView.ItemIndex].SubItems.Strings[0];

  self.FindSubForm('Main').FindCommand('AlarmReport').Params.Values['ALARMID'] := stAlarmID;
  self.FindSubForm('Main').FindCommand('AlarmReport').Execute;


end;

procedure TfmAlarmTypeMonitoring.sg_MainKeyDown(Sender: TObject;
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

procedure TfmAlarmTypeMonitoring.AlarmListViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if AlarmListView.ItemIndex < 0 then Exit;
  AlarmListView.Items[AlarmListView.ItemIndex].Selected := True;

end;

procedure TfmAlarmTypeMonitoring.AlaramConfirm(aNodeNo, aEcuID,aArmAreaNo: string);
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

procedure TfmAlarmTypeMonitoring.N6Click(Sender: TObject);
begin
  AlaramConfirm('','','');
end;

procedure TfmAlarmTypeMonitoring.BuildingAlarmModeProcess(
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
  if BuildingListView.Items.Count <= nBuildingIndex then Exit;

  if aAlramMode = cmArm then
  begin
    BuildingListView.Items[nBuildingIndex].ImageIndex := AlarmModeStateImageIndex;
  end else
  begin
    BuildingListView.Items[nBuildingIndex].ImageIndex := DisAlarmModeStateImageIndex;
  end;

end;

procedure TfmAlarmTypeMonitoring.MemoryCreate;
begin
  BuildingAlarmList := TStringList.Create;     //�����ڵ� �� �˶���� ���
  AlarmBuildingcodeList := TStringList.Create; //�ش� �˶���Ⱑ ��� �����ڵ忡 ���ϴ���
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

  SetLength(AlarmIndexArray,sg_Alarm.ColCount);
  SetLength(relAlarmIndexArray,sg_Alarm.ColCount);

end;

procedure TfmAlarmTypeMonitoring.MemoryDestory;
begin
  BuildingAlarmList.Free;     //�����ڵ� �� �˶���� ���
  AlarmBuildingcodeList.Free; //�ش� �˶���Ⱑ ��� �����ڵ忡 ���ϴ���
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

procedure TfmAlarmTypeMonitoring.ListHeaderNameSet;
var
  i : integer;
begin
  for i := LOW(DoorIndexArray) to HIGH(DoorIndexArray) do
  begin
    sg_Access.cells[DoorIndexArray[i],0] := AccessHeaderNameList[i];
  end;
  for i := LOW(AlarmIndexArray) to HIGH(AlarmIndexArray) do
  begin
    sg_Alarm.cells[AlarmIndexArray[i],0] := AlarmHeaderNameList[i];
  end;

end;

procedure TfmAlarmTypeMonitoring.iniConfigRead;
var
  ini_fun : TiniFile;
  i : integer;
  stValue : string;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');

  pan_device.Width := ini_fun.ReadInteger('AlarmTypeMonitoring','DeviceWidth',217);
  if pan_device.Width < 5 then pan_device.Width := 5;
  PageControl2.ActivePage := BuildingTab;
  pan_monitor.Height := ini_fun.ReadInteger('AlarmTypeMonitoring','monitorHeight',273);
  if pan_monitor.Height < 5 then pan_monitor.Height := 5;
  sg_Access.Height := ini_fun.ReadInteger('AlarmTypeMonitoring','AccessHeight',144);
  if sg_Access.Height < 5 then sg_Access.Height := 5;

  stValue := ini_fun.ReadString('AlarmTypeMonitoring','BuildingListView','vsIcon');
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

  stValue := ini_fun.ReadString('AlarmTypeMonitoring','AlarmList','vsIcon');
  if UpperCase(stValue) = 'VSICON' then
  begin
    AlarmListView.ViewStyle := vsList;
    AlarmListView.Refresh;
    AlarmListView.ViewStyle := vsIcon ;
  end else
  begin
    AlarmListView.ViewStyle := vsIcon;
    AlarmListView.Refresh;
    AlarmListView.ViewStyle := vsList;
  end;

  for i := 0 to sg_Main.ColCount - 1 do
  begin
    if i < 2 then
      sg_Main.ColWidths[i] := ini_fun.ReadInteger('AlarmTypeMonitoring','MainColWidth'+inttostr(i),90)
    else sg_Main.ColWidths[i] := ini_fun.ReadInteger('AlarmTypeMonitoring','MainColWidth'+inttostr(i),0);
  end;

  for i := 0 to sg_ECU.ColCount - 1 do
  begin
    if i < 3 then
      sg_ECU.ColWidths[i] := ini_fun.ReadInteger('AlarmTypeMonitoring','ECUColWidth'+inttostr(i),90)
    else sg_ECU.ColWidths[i] := ini_fun.ReadInteger('AlarmTypeMonitoring','ECUColWidth'+inttostr(i),0);
  end;

  for i := 0 to sg_ECU.ColCount - 1 do
  begin
    ini_fun.WriteInteger('AlarmTypeMonitoring','ECUColWidth'+inttostr(i),sg_ECU.ColWidths[i]);
  end;

  for i := LOW(DoorIndexArray) to HIGH(DoorIndexArray) do
  begin
    DoorIndexArray[i] := ini_fun.ReadInteger('AlarmTypeMonitoring','DoorIndexArray'+inttostr(i),i);
  end;
  for i := LOW(relDoorIndexArray) to HIGH(relDoorIndexArray) do
  begin
    relDoorIndexArray[i] := ini_fun.ReadInteger('AlarmTypeMonitoring','relDoorIndexArray'+inttostr(i),i);
  end;
  for i := LOW(AlarmIndexArray) to HIGH(AlarmIndexArray) do
  begin
    AlarmIndexArray[i] := ini_fun.ReadInteger('AlarmTypeMonitoring','AlarmIndexArray'+inttostr(i),i);
  end;
  for i := LOW(relAlarmIndexArray) to HIGH(relAlarmIndexArray) do
  begin
    relAlarmIndexArray[i] := ini_fun.ReadInteger('AlarmTypeMonitoring','relAlarmIndexArray'+inttostr(i),i);
  end;

  ini_fun.Free;
end;

procedure TfmAlarmTypeMonitoring.CellHide;
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
  for i := 0 to ALARMEVENTMAXCELL do
  begin
    if AlarmEventShowTable[i] = 0 then
    begin
      sg_Alarm.ColWidths[AlarmIndexArray[i]] := 0;
    end else
    begin
      sg_Alarm.ColWidths[AlarmIndexArray[i]] := Alarm1SizeTable[AlarmIndexArray[i]];
      if sg_Alarm.ColWidths[AlarmIndexArray[i]] = 0 then sg_Alarm.ColWidths[AlarmIndexArray[i]] := 90;
    end;
  end;

end;

procedure TfmAlarmTypeMonitoring.iniConfigWrite;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  ini_fun.WriteInteger('AlarmTypeMonitoring','DeviceWidth',pan_device.Width);
  ini_fun.WriteInteger('AlarmTypeMonitoring','monitorHeight',pan_monitor.Height);
  ini_fun.WriteInteger('AlarmTypeMonitoring','AccessHeight',sg_Access.Height);
  if BuildingListView.ViewStyle = vsIcon then ini_fun.WriteString('AlarmTypeMonitoring','BuildingListView','vsIcon')
  else ini_fun.WriteString('AlarmTypeMonitoring','BuildingListView','vsList');
  if AlarmListView.ViewStyle = vsIcon then ini_fun.WriteString('AlarmTypeMonitoring','AlarmList','vsIcon')
  else ini_fun.WriteString('AlarmTypeMonitoring','AlarmList','vsList');

  for i := 0 to sg_Main.ColCount - 1 do
  begin
    ini_fun.WriteInteger('AlarmTypeMonitoring','MainColWidth'+inttostr(i),sg_Main.ColWidths[i]);
  end;

  for i := 0 to sg_ECU.ColCount - 1 do
  begin
    ini_fun.WriteInteger('AlarmTypeMonitoring','ECUColWidth'+inttostr(i),sg_ECU.ColWidths[i]);
  end;

  for i := LOW(DoorIndexArray) to HIGH(DoorIndexArray) do
  begin
    ini_fun.WriteInteger('AlarmTypeMonitoring','DoorIndexArray'+inttostr(i),DoorIndexArray[i]);
  end;
  for i := LOW(relDoorIndexArray) to HIGH(relDoorIndexArray) do
  begin
    ini_fun.WriteInteger('AlarmTypeMonitoring','relDoorIndexArray'+inttostr(i),relDoorIndexArray[i]);
  end;
  for i := LOW(AlarmIndexArray) to HIGH(AlarmIndexArray) do
  begin
    ini_fun.WriteInteger('AlarmTypeMonitoring','AlarmIndexArray'+inttostr(i),AlarmIndexArray[i]);
  end;
  for i := LOW(relAlarmIndexArray) to HIGH(relAlarmIndexArray) do
  begin
    ini_fun.WriteInteger('AlarmTypeMonitoring','relAlarmIndexArray'+inttostr(i),relAlarmIndexArray[i]);
  end;

  for i := 0 to ACCESSEVENTMAXCELL do
  begin
    Access1SizeTable[i] := sg_Access.ColWidths[i];
    ini_fun.WriteInteger('�����̺�Ʈ1������',inttostr(i),sg_Access.ColWidths[i]);
  end;
  for i := 0 to ALARMEVENTMAXCELL do
  begin
    Alarm1SizeTable[i] := sg_Alarm.ColWidths[i];
    ini_fun.WriteInteger('�˶��̺�Ʈ1������',inttostr(i),sg_Alarm.ColWidths[i]);
  end;

  ini_fun.Free;

end;

procedure TfmAlarmTypeMonitoring.mn_FireRecoveryClick(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  if AlarmListView.SelCount < 1 then Exit;
  for i := 0 to AlarmListView.Items.Count - 1 do
  begin
    if AlarmListView.Items[i].Selected then
    begin
      stAlarmID:= AlarmListView.Items[i].SubItems.Strings[0];

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

procedure TfmAlarmTypeMonitoring.Panel5Resize(Sender: TObject);
begin
  inherited;
  pan_message.Left := Panel5.Left + ((Panel5.Width div 2) - (pan_message.Width div 2));
  pan_message.Top := (Panel5.Height div 2) - (pan_message.Height div 2);
end;

procedure TfmAlarmTypeMonitoring.MenuItem10Click(Sender: TObject);
var
  stCardNo : string;
begin
  stCardNo := sg_Access.Cells[DoorIndexArray[5],sg_Access.Row];
  if stCardNo = '' then Exit;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['VALUE'] := 'EMPLOYEE';
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['CARDNO'] := stCardNo;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Execute;    
end;

procedure TfmAlarmTypeMonitoring.MenuItem14Click(Sender: TObject);
var
  stCardNo : string;
begin
  stCardNo := sg_Access.Cells[DoorIndexArray[5],sg_Access.Row];
  if stCardNo = '' then Exit;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['VALUE'] := 'CARDADMIN';
  self.FindSubForm('Main').FindCommand('CARDSHOW').Params.Values['CARDNO'] := stCardNo;
  self.FindSubForm('Main').FindCommand('CARDSHOW').Execute;

end;

procedure TfmAlarmTypeMonitoring.N24Click(Sender: TObject);
var
  st : string;
begin
  inherited;
  st := sg_Access.Cells[DoorIndexArray[5],sg_Access.Row];

  if st <> '' then ClipBoard.SetTextBuf(PChar(st));

end;

procedure TfmAlarmTypeMonitoring.mn_BuildingArmControlClick(
  Sender: TObject);
var
  nIndex : integer;
  nBuildingIndex : integer;
  stBuildingID : string;
  stSelectBuildingCode : string;
  i : integer;
  stAlarmAreaID : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];
  if BuildingStep = '0' then
    stSelectBuildingCode := copy(stBuildingID,1,3)
  else if BuildingStep = '1' then
    stSelectBuildingCode := copy(stBuildingID,1,6)
  else if BuildingStep = '2' then
    stSelectBuildingCode := copy(stBuildingID,1,9);

  nBuildingIndex := BuildingList.IndexOf(stSelectBuildingCode);

  for i := 0 to TBuildingState(BuildingList.Objects[nBuildingIndex]).BuildingAlarmList.Count - 1 do
  begin
    stAlarmAreaID := TBuildingState(BuildingList.Objects[nBuildingIndex]).BuildingAlarmList.Strings[i];
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmAreaID + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
    DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmAreaID,1,3),copy(stAlarmAreaID,4,2),ALARMTYPE,copy(stAlarmAreaID,6,1),'0000000000','�����')
  end;
end;

procedure TfmAlarmTypeMonitoring.mn_BuildingDisArmControlClick(
  Sender: TObject);
var
  nIndex : integer;
  nBuildingIndex : integer;
  stBuildingID : string;
  stSelectBuildingCode : string;
  i : integer;
  stAlarmAreaID : string;
begin
  if BuildingListView.Selected = nil then Exit;
  nIndex := BuildingListView.Selected.Index;
  stBuildingID := BuildingListView.Items[nIndex].SubItems.Strings[0];
  if BuildingStep = '0' then
    stSelectBuildingCode := copy(stBuildingID,1,3)
  else if BuildingStep = '1' then
    stSelectBuildingCode := copy(stBuildingID,1,6)
  else if BuildingStep = '2' then
    stSelectBuildingCode := copy(stBuildingID,1,9);

  nBuildingIndex := BuildingList.IndexOf(stSelectBuildingCode);

  for i := 0 to TBuildingState(BuildingList.Objects[nBuildingIndex]).BuildingAlarmList.Count - 1 do
  begin
    stAlarmAreaID := TBuildingState(BuildingList.Objects[nBuildingIndex]).BuildingAlarmList.Strings[i];
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmAreaID + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
    DataModule1.TB_SYSTEMLOGInsert(copy(stAlarmAreaID,1,3),copy(stAlarmAreaID,4,2),ALARMTYPE,copy(stAlarmAreaID,6,1),'0000000000','�������')
  end;
end;

initialization
  RegisterClass(TfmAlarmTypeMonitoring);
Finalization
  UnRegisterClass(TfmAlarmTypeMonitoring);

end.