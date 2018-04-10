unit uDeviceState;

interface

uses
  SysUtils, Classes, OoMisc, AdPort, AdWnPort, ExtCtrls,
  uDataModule1;

type
  TDaemonState = Class(TComponent)
  private
    FOnDaemonRestart: TDaemonRestart;
    FOnAlarmRefresh: TDaemonRestart;
    FOnFireRecovery: TDaemonRestart;
    FServerConnected: Boolean;
    FOnServerConnected: TDaemonConnected;
    FOnDaemonLive: TDaemonRestart;
    procedure SetServerConnected(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
  public
    property OnDaemonRestart : TDaemonRestart read FOnDaemonRestart       write FOnDaemonRestart;
    property OnDaemonLive : TDaemonRestart read FOnDaemonLive       write FOnDaemonLive;
    property OnAlarmRefresh : TDaemonRestart read FOnAlarmRefresh write FOnAlarmRefresh;
    property OnFireRecovery : TDaemonRestart read FOnFireRecovery write FOnFireRecovery;
    property OnServerConnected : TDaemonConnected read FOnServerConnected write FOnServerConnected;

    property ServerConnected : Boolean read FServerConnected write SetServerConnected;
  public
    procedure Restart;
    procedure AlaramRefresh;
    procedure FireRecovery;
    procedure Live;
  end;

  TBuildingState = Class(TComponent)
  private
    EcuAllAlarmState: Array of char;
    EcuAlarmState : Array of char;
    EcuNormalEvent : Array of char;
    EcuAlaramEvent : Array of char;
    //EcuAllAlarmState : string; //방범모드 비교 하기 위한 초기 상태
    //EcuAlarmState : string; //경계해제상태
    //EcuNormalEvent : string;  //알람 발생 상태 비교 하기 위한 초기 상태
    //EcuAlaramEvent : string;
    FBuildingAlaramMode: TWatchMode;
    FBuildingAlaramEvent: TAlarmEventState;
    FBuildingCode: string;
    FOnBuildingAlarmEvent: TBuildingAlarmEvent;
    FDeviceCount: integer;
    FOnBuildingAlarmMode: TBuildingAlarmMode; //방범알람 발생 유무
    procedure SetBuildingAlaramMode(const Value: TWatchMode);
    procedure SetBuildingAlaramEvent(const Value: TAlarmEventState);
    procedure SetDeviceCount(const Value: integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property BuildingAlaramMode : TWatchMode read FBuildingAlaramMode write SetBuildingAlaramMode;
    property BuildingAlaramEvent : TAlarmEventState read FBuildingAlaramEvent write SetBuildingAlaramEvent;
    property DeviceCount : integer read FDeviceCount write SetDeviceCount;
  public
    property OnBuildingAlarmMode : TBuildingAlarmMode read FOnBuildingAlarmMode write FOnBuildingAlarmMode;
    property OnBuildingAlarmEvent : TBuildingAlarmEvent read FOnBuildingAlarmEvent write FOnBuildingAlarmEvent;
  public
    BuildingAlarmList : TStringList;
    BuildingAlarmNameList : TStringList;
    BuildingDoorList : TStringList;
    BuildingDoorNameList : TStringList;
    procedure DeviceAdd(aNodeNo:integer;aEcuID,aAlarmName:string);
    procedure DoorAdd(aNodeNo:integer;aEcuID,aDoorNo,aDoorName:string);
    procedure AlarmModeChange(aNodeNo:integer;aEcuID:string;aMode:string);  //aMode 0 해제,1 경계
    procedure AlarmEventChange(aNodeNo:integer;aEcuID:string;aEvent:string); //aEvent 0 알람확인 1 알람발생
  end;

  TNodeState = Class(TComponent)
  private
    EcuUseState : Array of char;
    EcuConnectState : Array of char;
    //EcuUseState : string; //확장기 사용 형식... 64개 0 로 채운후 connectstate 와 비교
    //EcuConnectState : string;
    FNodeConnected: Boolean;
    FEcuCount: integer;
    FNodeNo: integer;
    FNodeCurrentState: TNodeCurrentState;
    FNodeIP: string;
    FNodeName: string;
    FOnNodeConnectState: TNodeConnectState;
    FMaxmumEcuCount: integer;
    procedure NodeInitialize;
    procedure NodeStateCheck; //노드의 전체 상태 체크
    procedure SetEcuCount(const Value: integer);
    procedure SetNodeConnected(const Value: Boolean);
    procedure SetNodeCurrentState(const Value: TNodeCurrentState);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property NodeNo : integer read FNodeNo write FNodeNo;
    property NodeIP : string read FNodeIP write FNodeIP;
    property NodeName : string read FNodeName write FNodeName;
    property NodeConnected : Boolean read FNodeConnected write SetNodeConnected;
    property NodeCurrentState : TNodeCurrentState read FNodeCurrentState write SetNodeCurrentState;
    property EcuCount : integer read FEcuCount write SetEcuCount; //확장기 설정시 EcuConnectState 설정 하자.
    property MaxmumEcuCount : integer read FMaxmumEcuCount write FMaxmumEcuCount; //최대 확장기 달 수 있는 갯수
  public
    property OnNodeConnectState : TNodeConnectState read FOnNodeConnectState write FOnNodeConnectState;
  public
    NodeDeviceList : TStringList;
    procedure DeviceAdd(aEcuID : string);
    procedure DeviceConnected(aEcuID:string;aValue:Boolean);
  end;

  TDeviceState = Class(TComponent)
  private
    FDoor2Fire: Boolean;
    FDoor2Use: Boolean;
    FDoor1Use: Boolean;
    FConnected: Boolean;
    FDoor1Fire: Boolean;
    FNodeNo: integer;
    FECUID: string;
    FFloorCode: string;
    FBuildingCode: string;
    FAreaCode: string;
    FAlarmEventState: TAlarmEventState;
    FDoor2LockState: TDoorLockState;
    FDoor1LockState: TDoorLockState;
    FDoor2ManageMode: TDoorManageMode;
    FDoor1ManageMode: TDoorManageMode;
    FDoor2CardMode: TDoorPNMode;
    FDoor1CardMode: TDoorPNMode;
    FDoor1State: TDoorState;
    FDoor2State: TDoorState;
    FAlarmMode: TWatchMode;
    FDeviceName: string;
    FAlarmName: string;
    FDoor2Name: string;
    FDoor1Name: string;
    FOnFireStateChange: TFireStateChange;
    FOnDeviceConnected: TConnectType;
    FLastAccessData: string;
    FOnAccessEvent: TAccessEvent;
    FOnDoorStateChange: TDoorModeChangeType;
    FLastAlarmData: string;
    FLastAlarmStatus: string;
    FOnAlarmModeChanged: TWatchModeChangeType;
    FOnExitButton: TExitButton;
    FLastNewAlarmStatus: string;
    FOnAlarmEventAnalysis: TAlarmEventAnalysis;
    FOnDeviceAlarmEvent: TDeviceAlarmEvent;
    FReaderNumber: integer;
    FDoorNumber: integer;
    FPortNumber: integer;
    FDeviceCode: string;
    FParentNode: TNodeState;
    FDeviceType: string;
    FDeviceSetupData: string;
    FOnDeviceSetupData: TDevicePacketData;
    FOnDeviceTypeChange: TDeviceTypeChange;
    FDeviceVersion: string;
    procedure SetAlarmEventState(const Value: TAlarmEventState);
    procedure SetAlarmMode(const Value: TWatchMode);
    procedure SetConnected(const Value: Boolean);
    procedure SetDoor1CardMode(const Value: TDoorPNMode);
    procedure SetDoor1Fire(const Value: Boolean);
    procedure SetDoor1LockState(const Value: TDoorLockState);
    procedure SetDoor1ManageMode(const Value: TDoorManageMode);
    procedure SetDoor1State(const Value: TDoorState);
    procedure SetDoor2CardMode(const Value: TDoorPNMode);
    procedure SetDoor2Fire(const Value: Boolean);
    procedure SetDoor2LockState(const Value: TDoorLockState);
    procedure SetDoor2ManageMode(const Value: TDoorManageMode);
    procedure SetDoor2State(const Value: TDoorState);
    procedure SetLastAccessData(const Value: string);
    procedure SetLastAlarmData(const Value: string);
    procedure SetLastAlarmStatus(const Value: string);
    procedure SetLastNewAlarmStatus(const Value: string);
    procedure SetDoorNumber(const Value: integer);
    procedure SetPortNumber(const Value: integer);
    procedure SetReaderNumber(const Value: integer);
    procedure SetDeviceCode(const Value: string);
    procedure SetDeviceType(const Value: string);
    procedure SetDeviceSetupData(const Value: string);
    procedure SetDeviceVersion(const Value: string);
  public
    ReaderList : TStringList;
    PortList : TStringList;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ParentNode : TNodeState read FParentNode write FParentNode;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property FloorCode : string read FFloorCode write FFloorCode;
    property AreaCode : string read FAreaCode write FAreaCode;
    Property NodeNo : integer read FNodeNo write FNodeNo;
    Property ECUID : string read FECUID write FECUID;
    property DeviceName : string read FDeviceName write FDeviceName;
    property AlarmName : string read FAlarmName write FAlarmName;
    Property Door1Use : Boolean Read FDoor1Use write FDoor1Use;
    Property Door2Use : Boolean Read FDoor2Use write FDoor2Use;
    property Door1Name : string read FDoor1Name write FDoor1Name;
    property Door2Name : string read FDoor2Name write FDoor2Name;

    property Connected : Boolean read FConnected write SetConnected;
    property AlarmMode : TWatchMode read FAlarmMode write SetAlarmMode;
    property AlarmEventState : TAlarmEventState read FAlarmEventState write SetAlarmEventState;
    property LastAlarmStatus : string read FLastAlarmStatus write SetLastAlarmStatus;
    property LastNewAlarmStatus : string read FLastNewAlarmStatus write SetLastNewAlarmStatus; //새로 생성한 코드
    property Door1CardMode : TDoorPNMode read FDoor1CardMode write SetDoor1CardMode;
    property Door1ManageMode : TDoorManageMode read FDoor1ManageMode write SetDoor1ManageMode;
    property Door1State : TDoorState read FDoor1State write SetDoor1State;
    property Door1LockState : TDoorLockState read FDoor1LockState write SetDoor1LockState;
    property Door1Fire : Boolean read FDoor1Fire write SetDoor1Fire;
    property Door2CardMode : TDoorPNMode read FDoor2CardMode write SetDoor2CardMode;
    property Door2ManageMode : TDoorManageMode read FDoor2ManageMode write SetDoor2ManageMode;
    property Door2State : TDoorState read FDoor2State write SetDoor2State;
    property Door2LockState : TDoorLockState read FDoor2LockState write SetDoor2LockState;
    property Door2Fire : Boolean read FDoor2Fire write SetDoor2Fire;
    property LastAccessData:string read FLastAccessData write SetLastAccessData;
    property LastAlarmData:string read FLastAlarmData write SetLastAlarmData;
    property DoorNumber : integer read FDoorNumber write SetDoorNumber;
    property ReaderNumber : integer read FReaderNumber write SetReaderNumber;
    property PortNumber : integer read FPortNumber write SetPortNumber;
    property DeviceCode : string read FDeviceCode write SetDeviceCode;
    property DeviceVersion : string read FDeviceVersion write SetDeviceVersion;
    property DeviceType : string read FDeviceType write SetDeviceType;
    property DeviceSetupData:string read FDeviceSetupData write SetDeviceSetupData;
  public
    property OnFireStateChange: TFireStateChange read FOnFireStateChange       write FOnFireStateChange;
    property OnDeviceConnected:TConnectType read FOnDeviceConnected write FOnDeviceConnected;
    property OnAccessEvent:TAccessEvent read FOnAccessEvent write FOnAccessEvent;
    property OnAlarmEventAnalysis:TAlarmEventAnalysis read FOnAlarmEventAnalysis write FOnAlarmEventAnalysis;
    property OnDoorStateChange:TDoorModeChangeType read FOnDoorStateChange write FOnDoorStateChange;
    property OnAlarmModeChanged:TWatchModeChangeType read FOnAlarmModeChanged write FOnAlarmModeChanged;
    property OnExitButton:TExitButton read FOnExitButton write FOnExitButton ;
    property OnDeviceAlarmEvent : TDeviceAlarmEvent read FOnDeviceAlarmEvent write FOnDeviceAlarmEvent;
    property OnDeviceSetupData : TDevicePacketData read FOnDeviceSetupData write FOnDeviceSetupData;
    property OnDeviceTypeChange : TDeviceTypeChange read FOnDeviceTypeChange write FOnDeviceTypeChange;
  private
    procedure BuildingAlarmChange;
    procedure BuildingAlarmModeChange;
  public
    procedure AlaramEventClear;
    procedure DBAlarmStateChange(NodeNo:integer;ECUID:string;aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aZoneCode,aMode,aStatusCode,aPortNo,aState,
                                  aOperator,aNewStateCode:string;
                                  aAlarmView,aAlarmSound:Boolean);
    procedure ReaderInforSet(aReaderNo,aReaderUse,aDoorPosi,aBuildPosi:string);
    procedure PortInforSet(aPortNo,aWatchType,aDelaytimeUse,aPortRecoverySend:string);
  end;

  TReaderState = Class(TComponent)
  private
    FReaderNo: integer;
    FReaderUse: Boolean;
    FControlDoorNo: integer;
    FBuildPosi: integer;
    FDoorPosi: integer;
    FConnected: Boolean;
    FReaderVersion: string;
  public
    property ReaderNo : integer read FReaderNo write FReaderNo;
    property Connected : Boolean read FConnected write FConnected;
    property ReaderUse : Boolean read FReaderUse write FReaderUse;
    property ControlDoorNo : integer read FControlDoorNo write FControlDoorNo;
    property DoorPosi : integer read FDoorPosi write FDoorPosi;
    property BuildPosi : integer read FBuildPosi write FBuildPosi;
    property ReaderVersion : string read FReaderVersion write FReaderVersion;
  end;

  TPortState = Class(TComponent)
  private
    FPortRecoverySend: Boolean;
    FPortDelayTimeUse: Boolean;
    FPortNo: integer;
    FWatchType: integer;
  public
    property PortNo : integer read FPortNo write FPortNo;
    property WatchType : integer read FWatchType write FWatchType;
    property PortDelayTimeUse : Boolean read FPortDelayTimeUse write FPortDelayTimeUse;
    property PortRecoverySend : Boolean read FPortRecoverySend write FPortRecoverySend;
  end;

  TdmDeviceState = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDeviceState: TdmDeviceState;

implementation

uses
  uMonitoringCommonVariable,
  uLomosUtil,
  UCommonModule;
{$R *.dfm}

{ TNodeState }

constructor TNodeState.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NodeDeviceList := TStringList.Create;
  MaxmumEcuCount := 63; //디폴트로 63개 까지 붙일 수 있다.

  SetLength(EcuConnectState,64);
  SetLength(EcuUseState,64);
  NodeInitialize;
  
end;

destructor TNodeState.Destroy;
begin
  NodeDeviceList.Free;
  inherited;
end;

procedure TNodeState.DeviceAdd(aEcuID: string);
var
  nIndex : integer;
  stDeviceID : string;
begin
  nIndex := strtoint(aEcuID);
  EcuUseState[nIndex] := '1';
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  if NodeDeviceList.IndexOf(stDeviceID) < 0 then NodeDeviceList.Add(stDeviceID);
  NodeDeviceList.Sort;
end;

procedure TNodeState.DeviceConnected(aEcuID: string;aValue:Boolean);
var
  nIndex : integer;
begin
  nIndex := strtoint(aEcuID);
  if aValue then
  begin
    EcuConnectState[nIndex] := '1';
    NodeConnected := True;
  end else
  begin
    if aEcuID = '00' then NodeConnected := False;
    EcuConnectState[nIndex] := '0';
  end;
  self.NodeStateCheck;
end;

procedure TNodeState.NodeInitialize;
var
  i : integer;
begin
  EcuUseState[0] := '1';  //'0' 번은 필수로 연결됨
  EcuConnectState[0] := '0';
  for i:= 1 to 63 do
  begin
    EcuUseState[i] := '0';
    EcuConnectState[i] := '0';
  end;

  for i := 0 to DeviceStateList.Count - 1 do
  begin
    if TDeviceState(DeviceStateList.Objects[i]).NodeNo = NodeNo then
    begin
//      TDeviceState(DeviceStateList.Objects[i]).AlarmMode := cmNothing;
      TDeviceState(DeviceStateList.Objects[i]).Connected := False;
    end;
  end;

end;

procedure TNodeState.NodeStateCheck;
var
  i : integer;
  nConnected : integer;
  stDeviceID : string;
  nDeviceIndex : integer;
begin
  nConnected := 0;
{  for i := 0 to HIGH(EcuUseState) do
  begin
    if EcuUseState[i] = '1' then
    begin
      if EcuConnectState[i] = '1' then
      begin
        if nConnected = 0 then nConnected := 3
        else if nConnected = 3 then nConnected := 3
        else if nConnected = 2 then nConnected := 2
        else if nConnected = 1 then nConnected := 2;
      end else
      begin
        if nConnected = 0 then nConnected := 1
        else if nConnected = 1 then nConnected := 1
        else if nConnected = 2 then nConnected := 2
        else if nConnected = 3 then nConnected := 2;
      end;
    end;
  end;  }

  for i := 0 to NodeDeviceList.Count - 1 do
  begin
    stDeviceID := NodeDeviceList.Strings[i];
    nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
    if nDeviceIndex > -1 then
    begin
      if TDeviceState(DeviceStateList.Objects[nDeviceIndex]).Connected then
      begin
        if nConnected = 0 then nConnected := 3
        else if nConnected = 3 then nConnected := 3
        else if nConnected = 2 then nConnected := 2
        else if nConnected = 1 then nConnected := 2;
      end else
      begin
        if nConnected = 0 then nConnected := 1
        else if nConnected = 1 then nConnected := 1
        else if nConnected = 2 then nConnected := 2
        else if nConnected = 3 then nConnected := 2;
      end;
    end else
    begin
      if nConnected = 0 then nConnected := 1
      else if nConnected = 1 then nConnected := 1
      else if nConnected = 2 then nConnected := 2
      else if nConnected = 3 then nConnected := 2;
    end;
  end;

  if nConnected = 3 then NodeCurrentState := nsConnected
  else
  begin
    if nConnected = 2 then NodeCurrentState := nsFault
    else NodeCurrentState := nsDisConnected;
  end;
end;

procedure TNodeState.SetEcuCount(const Value: integer);
begin
  FEcuCount := Value;
end;

procedure TNodeState.SetNodeConnected(const Value: Boolean);
begin
  //Network 연결 된 상태 혹은 끊어진 상태
  if FNodeConnected = Value then Exit;
  FNodeConnected := Value;
  if Value then
  begin
    EcuConnectState[0] := '1';
    NodeStateCheck;
  end  else
  begin
    NodeInitialize;
    NodeCurrentState := nsDisConnected;
  end;
end;

procedure TNodeState.SetNodeCurrentState(const Value: TNodeCurrentState);
begin
  if FNodeCurrentState = Value then exit;
  FNodeCurrentState := Value;
  if Assigned(FOnNodeConnectState) then
  begin
    OnNodeConnectState(Self,NodeNo,Value);
  end;    
end;


{ TBuildingState }

procedure TBuildingState.AlarmEventChange(aNodeNo: integer; aEcuID,
  aEvent: string);
var
  stDeviceID : string;
  stBuildingCode : string;
  nIndex : integer;
begin
  //aMode : '0' 정상 '1' 알람
  stDeviceID := FillZeroNumber(aNodeno,3) + aEcuID;
  stBuildingCode := BuildingCode;
  nIndex := BuildingAlarmList.IndexOf(stDeviceID);
  if nIndex > -1 then
  begin
    EcuAlaramEvent[nIndex] := aEvent[1];
    if String(EcuNormalEvent) = String(EcuAlaramEvent)  then BuildingAlaramEvent := aeNormal
    else BuildingAlaramEvent := aeAlarmEvent;
  end;

end;

procedure TBuildingState.AlarmModeChange(aNodeNo: integer; aEcuID,
  aMode: string);
var
  stDeviceID : string;
  nIndex : integer;
begin
  //aMode : '0' 해제 '1' 방범
  stDeviceID := FillZeroNumber(aNodeno,3) + aEcuID;
  nIndex := BuildingAlarmList.IndexOf(stDeviceID);
  if nIndex > -1 then
  begin
    EcuAlarmState[nIndex] := aMode[1];
    if String(EcuAlarmState) = String(EcuAllAlarmState) then BuildingAlaramMode := cmArm  //전체경계시에 경계 표시
    else BuildingAlaramMode := cmDisarm;
  end;
end;

constructor TBuildingState.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BuildingAlarmList := TStringList.Create;
  BuildingAlarmNameList := TStringList.Create;
  BuildingDoorList := TStringList.Create;
  BuildingDoorNameList := TStringList.Create;
end;

destructor TBuildingState.Destroy;
begin
  BuildingAlarmList.Free;
  BuildingAlarmNameList.Free;
  BuildingDoorList.Free;
  BuildingDoorNameList.Free;
  inherited;
end;

procedure TBuildingState.DeviceAdd(aNodeNo: integer; aEcuID,aAlarmName: string);
var
  stDeviceID : string;
begin
  stDeviceID := FillZeroNumber(aNodeNo,3) + aEcuID;
  if BuildingAlarmList.IndexOf(stDeviceID) < 0 then
  begin
    BuildingAlarmList.Add(stDeviceID);
    BuildingAlarmNameList.Add(aAlarmName);
  end;
end;

procedure TBuildingState.DoorAdd(aNodeNo: integer; aEcuID, aDoorNo,
  aDoorName: string);
var
  stDoorID : string;
begin
  stDoorID := FillZeroNumber(aNodeNo,3) + aEcuID + aDoorNo;
  if BuildingDoorList.IndexOf(stDoorID) < 0 then
  begin
    BuildingDoorList.Add(stDoorID);
    BuildingDoorNameList.Add(aDoorName);
  end;
end;

procedure TBuildingState.SetBuildingAlaramEvent(
  const Value: TAlarmEventState);
begin
  if FBuildingAlaramEvent = Value then Exit;
  FBuildingAlaramEvent := Value;

  if Assigned(FOnBuildingAlarmEvent) then
  begin
    OnBuildingAlarmEvent(Self,FBuildingCode,Value);
  end;
end;

procedure TBuildingState.SetBuildingAlaramMode(const Value: TWatchMode);
begin
  if FBuildingAlaramMode = Value then Exit;
  FBuildingAlaramMode := Value;
  if Assigned(FOnBuildingAlarmMode) then
  begin
    OnBuildingAlarmMode(Self,FBuildingCode,Value);
  end;

end;

procedure TBuildingState.SetDeviceCount(const Value: integer);
var
  i : integer;
begin
  FDeviceCount := Value;
  SetLength(EcuAllAlarmState,Value);
  SetLength(EcuAlarmState,Value);
  SetLength(EcuNormalEvent,Value);
  SetLength(EcuAlaramEvent,Value);
  for i := 0 to Value - 1 do
  begin
    EcuAllAlarmState[i] := '1';
    EcuAlarmState[i] := '0';
    EcuNormalEvent[i] := '0';
    EcuAlaramEvent[i] := '0';
  end;

end;

{ TDeviceState }

procedure TDeviceState.AlaramEventClear;
begin
  FAlarmEventState := aeNormal;
  if Assigned(FOnDeviceAlarmEvent) then
  begin
    OnDeviceAlarmEvent(self,NodeNo,ECUID,aeNormal);
  end;
  BuildingAlarmChange;
end;

procedure TDeviceState.BuildingAlarmChange;
var
  stBuildingCode : string;
  nBuidingIndex : integer;
  stEvent : string;
begin
  if BuildingStep = '0' then stBuildingCode := BuildingCode
  else if BuildingStep = '1' then stBuildingCode := BuildingCode + FloorCode
  else if BuildingStep = '2' then stBuildingCode := BuildingCode + FloorCode + AreaCode;

  nBuidingIndex := BuildingList.IndexOf(stBuildingCode);
  if nBuidingIndex < 0 then Exit;

  case FAlarmEventState of
    aeAlarmEvent : begin  stEvent := '1' end
    else begin stEvent := '0' end;
  end;
  TBuildingState(BuildingList.Objects[nBuidingIndex]).AlarmEventChange(NodeNo,Ecuid,stEvent);
end;

procedure TDeviceState.BuildingAlarmModeChange;
var
  stBuildingCode : string;
  nBuidingIndex : integer;
  stMode : string;
begin
  if BuildingStep = '0' then stBuildingCode := BuildingCode
  else if BuildingStep = '1' then stBuildingCode := BuildingCode + FloorCode
  else if BuildingStep = '2' then stBuildingCode := BuildingCode + FloorCode + AreaCode;

  nBuidingIndex := BuildingList.IndexOf(stBuildingCode);
  if nBuidingIndex < 0 then Exit;

  case FAlarmMode of
    cmArm : begin  stMode := '1' end
    else begin stMode := '0' end;
  end;
  TBuildingState(BuildingList.Objects[nBuidingIndex]).AlarmModeChange(NodeNo,Ecuid,stMode);
end;

constructor TDeviceState.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ReaderList := TStringList.Create;
  PortList := TStringList.Create;
  ParentNode := nil;
  //디폴트 설정
  DoorNumber := 2;
  ReaderNumber := 8;
  PortNumber := 8;
  DeviceType := '1'; //KTT811
end;

procedure TDeviceState.DBAlarmStateChange(NodeNo: integer; ECUID, aCmd,
  aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode, aStatusCode,
  aPortNo, aState, aOperator, aNewStateCode: string; aAlarmView,
  aAlarmSound: Boolean);
begin
  if aCmd <> 'A' then Exit; //알람 발생 상태가 아니면 이벤트 발생하지 말자.
{  case UpperCase(aMode)[1] of
   'A': begin AlarmMode := cmArm end;
   'D': begin AlarmMode := cmDisarm end;
   'T': begin AlarmMode := cmTest end;
   'I': begin AlarmMode := cmInit end;
   'P': begin AlarmMode := cmPatrol end;
  else  begin  end;
  end; }

  if aAlarmView or aAlarmSound then
  begin
    if aAlarmSound then AlarmEventState := aeAlarmEvent
    else
      AlarmEventState := aeNormalEvent;
  end else AlarmEventState := aeNormal;

  if Assigned(FOnAlarmEventAnalysis) then
  begin
    OnAlarmEventAnalysis(Self,NodeNo,EcuID,aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aZoneCode,aMode,aStatusCode,aPortNo,aState,
                                  aOperator,aNewStateCode,aAlarmView,aAlarmSound);
  end;
end;

destructor TDeviceState.Destroy;
begin
  ReaderList.Free;
  PortList.Free;
  inherited;
end;



procedure TDeviceState.PortInforSet(aPortNo, aWatchType, aDelaytimeUse,
  aPortRecoverySend: string);
var
  nIndex : integer;
begin
  nIndex := PortList.IndexOf(aPortNo);
  if nIndex < 0 then Exit;
  if isdigit(aWatchType) then TPortState(PortList.Objects[nIndex]).WatchType := strtoint(aWatchType);
  if aDelaytimeUse = '1' then TPortState(PortList.Objects[nIndex]).PortDelayTimeUse := True
  else TPortState(PortList.Objects[nIndex]).PortDelayTimeUse := False;
  if aPortRecoverySend = '1' then TPortState(PortList.Objects[nIndex]).PortRecoverySend := True
  else TPortState(PortList.Objects[nIndex]).PortRecoverySend := False;

end;

procedure TDeviceState.ReaderInforSet(aReaderNo, aReaderUse, aDoorPosi,
  aBuildPosi: string);
var
  nIndex : integer;
begin
  nIndex := ReaderList.IndexOf(aReaderNo);
  if nindex < 0 then Exit;
  if aReaderUse = 'Y' then
    TReaderState(ReaderList.Objects[nIndex]).FReaderUse := True
  else TReaderState(ReaderList.Objects[nIndex]).FReaderUse := False;
  if isdigit(aDoorPosi) then TReaderState(ReaderList.Objects[nIndex]).DoorPosi := strtoint(aDoorPosi);
  if isdigit(aBuildPosi) then TReaderState(ReaderList.Objects[nIndex]).BuildPosi := strtoint(aBuildPosi);

end;

procedure TDeviceState.SetAlarmEventState(const Value: TAlarmEventState);
begin
  if FAlarmEventState = value then Exit;
  if FAlarmEventState = aeAlarmEvent then Exit;
  if aeAlarmEvent = aeNormalEvent then
  begin
    if Value = aeNormal then Exit;
  end;
  FAlarmEventState := Value;
  BuildingAlarmChange;

  if Assigned(FOnDeviceAlarmEvent) then
  begin
    OnDeviceAlarmEvent(self,NodeNo,ECUID,Value);
  end;
end;

procedure TDeviceState.SetAlarmMode(const Value: TWatchMode);
begin
  if FAlarmMode = Value then Exit;
  FAlarmMode := Value;
  if Assigned(FOnAlarmModeChanged) then
  begin
    OnAlarmModeChanged(self,NodeNo,ECUID,Value);
  end;
  BuildingAlarmModeChange;
end;

procedure TDeviceState.SetConnected(const Value: Boolean);
var
  nNodeIndex : integer;
begin
  if FConnected = Value then Exit;
  FConnected := Value;

  nNodeIndex := NodeList.IndexOf(FillZeroNumber(NodeNo,3));
  if nNodeIndex > -1 then
  begin
    TNodeState(NodeList.Objects[nNodeIndex]).DeviceConnected(ECUID,Value);
  end;

  if Assigned(FOnDeviceConnected) then
  begin
    OnDeviceConnected(Self,Value,NodeNo,ECUID);
  end;

  if Not Value then
  begin
    AlarmMode := cmNothing;
    Door1CardMode := pnNothing;
    Door2CardMode := pnNothing;
    Door1ManageMode := dmNothing;
    Door2ManageMode := dmNothing;
    Door1State := dsNothing;
    Door2State := dsNothing;
    Door1LockState := lsNothing;
    Door2LockState := lsNothing;
    Door1Fire := False;
    Door2Fire := False;
  end;

end;

procedure TDeviceState.SetDeviceCode(const Value: string);
begin
  if Value = '' then Exit;
  //if FDeviceCode = Value then Exit;
  FDeviceCode := Value;

  if UpperCase(Value) = 'ACC-104' then   //KTT-811
  begin
    DeviceType := '1';
  end else if UpperCase(Value) = 'ACC-510' then   //KTT-812
  begin
    DeviceType := '2';
  end else if UpperCase(Value) = 'ACC-503' then   //ICU100
  begin
    DeviceType := '3';
  end else if UpperCase(Value) = 'ACC-505' then   //ICU200
  begin
    DeviceType := '4';
  end;
end;

procedure TDeviceState.SetDeviceSetupData(const Value: string);
begin
  if FDeviceSetupData = Value then Exit;
  FDeviceSetupData := Value;
  if Assigned(FOnDeviceSetupData) then
  begin
    OnDeviceSetupData(Self,NodeNo,EcuID,Value);
  end;
end;

procedure TDeviceState.SetDeviceType(const Value: string);
begin
  if FDeviceType = Value then Exit;
  FDeviceType := Value;
  if UpperCase(Value) = '1' then //KTT811
  begin
    DoorNumber := 2;
    ReaderNumber := 8;
    PortNumber := 8;
    if ECUID = '00' then
    begin
      if ParentNode <> nil then
      begin
        TNodeState(ParentNode).MaxmumEcuCount := 63;
      end;
    end;
  end else if UpperCase(Value) = '2' then  //KTT812
  begin
    DoorNumber := 1;
    ReaderNumber := 8;
    PortNumber := 8;
    if ECUID = '00' then
    begin
      if ParentNode <> nil then
      begin
        TNodeState(ParentNode).MaxmumEcuCount := 15;
      end;
    end;
  end else if UpperCase(Value) = '3' then   //ICU100
  begin
    DoorNumber := 1;
    ReaderNumber := 0;
    PortNumber := 6;
  end else if UpperCase(Value) = '4' then  //ICU200
  begin
    DoorNumber := 0;
    ReaderNumber := 0;
    PortNumber := 6;
  end;

  if Assigned(FOnDeviceTypeChange) then
  begin
    OnDeviceTypeChange(self,NodeNo,ECUID,Value);
  end;

end;

procedure TDeviceState.SetDeviceVersion(const Value: string);
begin
  if Value = '' then exit;
  if FDeviceVersion = Value then exit;
  FDeviceVersion := Value;
end;

procedure TDeviceState.SetDoor1CardMode(const Value: TDoorPNMode);
begin
  if FDoor1CardMode = Value then Exit;
  FDoor1CardMode := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,'1',Door1ManageMode,Door1CardMode,Door1State,Door1LockState);
  end;

end;

procedure TDeviceState.SetDoor1Fire(const Value: Boolean);
begin
  if FDoor1Fire = Value then Exit;
  FDoor1Fire := Value;

  if Value then     //화재시에는 해당 출입문 화재 신호 발생
  begin
    if Assigned(FOnFireStateChange) then
    begin
      OnFireStateChange(Self,NodeNo,ECUID,'1',Value);
    end;
  end else //화재 복구시에는 이전 모드의 상태값 이벤트 발생 카드모드/운영모드
  begin
    if Assigned(FOnDoorStateChange) then
    begin
      OnDoorStateChange(self,NodeNo,ECUID,'1',Door1ManageMode,Door1CardMode,Door1State,Door1LockState);
    end;
  end;
end;

procedure TDeviceState.SetDoor1LockState(const Value: TDoorLockState);
begin
  FDoor1LockState := Value;
end;

procedure TDeviceState.SetDoor1ManageMode(const Value: TDoorManageMode);
begin
  if FDoor1ManageMode = Value then Exit;
  FDoor1ManageMode := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,'1',Door1ManageMode,Door1CardMode,Door1State,Door1LockState);
  end;
end;

procedure TDeviceState.SetDoor1State(const Value: TDoorState);
begin
  if FDoor1State = Value then Exit;
  FDoor1State := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,'1',Door1ManageMode,Door1CardMode,Door1State,Door1LockState);
  end;
end;

procedure TDeviceState.SetDoor2CardMode(const Value: TDoorPNMode);
begin
  if FDoor2CardMode = Value then Exit;
  FDoor2CardMode := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,'2',Door2ManageMode,Door2CardMode,Door2State,Door2LockState);
  end;
end;

procedure TDeviceState.SetDoor2Fire(const Value: Boolean);
begin
  if FDoor2Fire = Value then Exit;
  FDoor2Fire := Value;

  if Value then     //화재시에는 해당 출입문 화재 신호 발생
  begin
    if Assigned(FOnFireStateChange) then
    begin
      OnFireStateChange(Self,NodeNo,ECUID,'2',Value);
    end;
  end else //화재 복구시에는 이전 모드의 상태값 이벤트 발생 카드모드/운영모드
  begin
    if Assigned(FOnDoorStateChange) then
    begin
      OnDoorStateChange(self,NodeNo,ECUID,'2',Door2ManageMode,Door2CardMode,Door2State,Door2LockState);
    end;
  end;
end;

procedure TDeviceState.SetDoor2LockState(const Value: TDoorLockState);
begin
  FDoor2LockState := Value;
end;

procedure TDeviceState.SetDoor2ManageMode(const Value: TDoorManageMode);
begin
  if FDoor2ManageMode = Value then Exit;
  FDoor2ManageMode := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,'2',Door2ManageMode,Door2CardMode,Door2State,Door2LockState);
  end;
end;

procedure TDeviceState.SetDoor2State(const Value: TDoorState);
begin
  if FDoor2State = Value then Exit;
  FDoor2State := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,'2',Door2ManageMode,Door2CardMode,Door2State,Door2LockState);
  end;
end;

procedure TDeviceState.SetDoorNumber(const Value: integer);
begin
  FDoorNumber := Value;
end;

procedure TDeviceState.SetLastAccessData(const Value: string);
var
  stDoorNo,stReaderNo : string;
  stPermitCode : string;
  stTime : string;
  stCardNo : string;
  nCardNoLen : integer;
  bExitButton : Boolean;
  cButton : char; //근태 버튼
  cInputType : char; //변경 사유 (원격제어: "R" ,버튼: "B" ,카드: "C", 스케쥴동작  :'S'  )
  stTemp : string;
  nCardNo : int64;
begin
  if FLastAccessData = Value then Exit;
  FLastAccessData := Value;

  bExitButton := False;

  stDoorNo:=     Value[21];
  stReaderNo:=   Value[22];
  cInputType:=   Value[38];
  stPermitCode:= Value[39];
  cButton :=     Value[41];
  stTime:= Copy(Value,24,12);
  stTime:= copy(FormatDateTime('yyyymmdd',Now),1,2) + stTime;
  if isDigit(Copy(Value,42,2)) then
    nCardNoLen := strtoint(Copy(Value,42,2))
  else nCardNoLen := 0;

  if CARDLENGTHTYPE = 0 then  //고정길이 타입이면
  begin
    stTemp := Copy(Value,44,8);
    if nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
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
    stCardNo:= Copy(Value,44,nCardNoLen);
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
  if bExitButton then
  begin
    if cInputType = 'F' then
    begin
      if stDoorNo = '1' then Door1Fire := True
      else if stDoorNo = '2' then Door2Fire := True;
    end;
    if Assigned(FOnExitButton) then
    begin
      OnExitButton(Self,NodeNo,EcuID,stDoorNo,stTime,cInputType);
    end;
    Exit;
  end;
  if Assigned(FOnAccessEvent) then
  begin
    OnAccessEvent(Self,NodeNo,EcuID,stDoorNo,stReaderNo,stCardNo,stTime,stPermitCode,cInputType,cButton);
  end;

  if cInputType = 'F' then
  begin
    if stDoorNo = '1' then Door1Fire := True
    else if stDoorNo = '2' then Door2Fire := True;
  end else
  begin
    if stDoorNo = '1' then Door1Fire := False
    else if stDoorNo = '2' then Door2Fire := False;
  end;


end;

procedure TDeviceState.SetLastAlarmData(const Value: string);
var
  stCmd : string;
  stMsgNo : string;
  stTime : string;
  stSubClass : string;
  stSubAddr : string;
  stZoneCode : string;
  stMode : string;
  stStatusCode : string;
  stPortNo : string;
  stState : string;
  stOperator : string;
  stNewStateCode : string;
  nTempIndex : integer;
  stTemp : string;
  bAlarmSound : Boolean;
  bAlarmView : Boolean;
begin
  if FLastAlarmData = Value then Exit;
  FLastAlarmData := Value;

  stCmd := UpperCase(Value[17]);   //'A' 알람발생,'O'상태조회
  stMsgNo    := Value[18];
  stTime     := copy(Value,20,14);
  stSubClass := copy(Value,34,2);
  stSubAddr  := copy(Value,36,2);
  stZoneCode := copy(Value,38,2);
  stMode     := UpperCase(Value[40]);
  stStatusCode   := copy(Value,41,2);
  stPortNo   := copy(Value,43,2);
  stState    := Value[45];
  stOperator := copy(Value,46,10);

  if G_nDaemonServerVersion < 1 then
    stNewStateCode := stStatusCode
  else
  begin
    nTempIndex := Pos(';',Value);
    stTemp := copy(Value,nTempIndex + 1,Length(Value) - nTempIndex);
    stNewStateCode := copy(stTemp,1,2);
  end;

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
          stNewStateCode := 'Z' + stState;     //S:쇼트,N:정상,P:단선
        end;
      end;
    end;
  end;

  LastAlarmStatus := stStatusCode;
  LastNewAlarmStatus := stNewStateCode;

  nTempIndex := AlarmEventViewStatusCode.Indexof(stStatusCode);
  if nTempIndex < 0 then
  begin
    nTempIndex := AlarmEventViewStatusCode.Indexof(stNewStateCode);
  end;
  if nTempIndex < 0 then bAlarmView := False
  else bAlarmView := True;

  nTempIndex := AlarmEventSoundStatusCode.Indexof(stStatusCode);
  if nTempIndex < 0 then
  begin
    nTempIndex := AlarmEventSoundStatusCode.Indexof(stNewStateCode);
  end;
  if nTempIndex < 0 then bAlarmSound := False
  else bAlarmSound := True;

  if stPortNo <> '**' then    //포트 감지 인경우 무조건 뿌리자.
  begin
    if stState <> 'N' then
    begin
      bAlarmSound := True;
      bAlarmView := True;
    end else
    begin
      bAlarmSound := False; //존 복구는 알람 울리지 말자...
    end;
  end;

  case UpperCase(stMode)[1] of
   'A': begin AlarmMode := cmArm end;
   'D': begin AlarmMode := cmDisarm end;
   'T': begin AlarmMode := cmTest end;
   'I': begin AlarmMode := cmInit end;
   'P': begin AlarmMode := cmPatrol end;
  else  begin  end;
  end;

  if (stSubCLass = 'MN') or (stSubCLass = 'EX')then
  begin
    if stStatusCode = 'NF' then
    begin
      AlarmMode := cmNothing;
    end;
  end;
  if stCmd <> 'A' then Exit; //알람 발생 상태가 아니면 이벤트 발생하지 말자.
  if bAlarmView or bAlarmSound then
  begin
    if bAlarmSound then AlarmEventState := aeAlarmEvent
    else
      AlarmEventState := aeNormalEvent;
  end else AlarmEventState := aeNormal;

  if Assigned(FOnAlarmEventAnalysis) then
  begin
    OnAlarmEventAnalysis(Self,NodeNo,EcuID,stCmd,stMsgNo,stTime,stSubClass,stSubAddr,
                                  stZoneCode,stMode,stStatusCode,stPortNo,stState,
                                  stOperator,stNewStateCode,bAlarmView,bAlarmSound);
  end;
end;

procedure TDeviceState.SetLastAlarmStatus(const Value: string);
begin
  FLastAlarmStatus := Value; //최종과 같은 알람이 발생 하더라도 알람 이벤트는 다시 발생 시켜 줘야 함.
end;

procedure TDeviceState.SetLastNewAlarmStatus(const Value: string);
begin
  FLastNewAlarmStatus := Value;
end;

procedure TDeviceState.SetPortNumber(const Value: integer);
var
  i : integer;
  TempPort : TPortState;
begin
  if FPortNumber = value then Exit;
  FPortNumber := Value;

  PortList.Clear;

  for i := 1 to Value do
  begin
    TempPort := TPortState.Create(self);
    TempPort.PortNo := i;
    TempPort.WatchType := 0;
    TempPort.PortDelayTimeUse := False;
    TempPort.PortRecoverySend := False;
    PortList.AddObject(inttostr(i),TempPort);
  end;
end;

procedure TDeviceState.SetReaderNumber(const Value: integer);
var
  i : integer;
  TempReader : TReaderState;
begin
  if FReaderNumber = value then Exit;
  FReaderNumber := Value;

  ReaderList.Clear;

  for i := 1 to Value do
  begin
    TempReader := TReaderState.Create(self);
    TempReader.ReaderNo := i;
    TempReader.ReaderUse := False;
    TempReader.ControlDoorNo := 0;
    TempReader.DoorPosi := 0;
    TempReader.BuildPosi := 0;
    TempReader.Connected := False;
    TempReader.ReaderVersion := '';
    ReaderList.AddObject(inttostr(i),TempReader);
  end;

end;

{ TDaemonState }

procedure TDaemonState.AlaramRefresh;
begin
  if Assigned(FOnAlarmRefresh) then
  begin
    OnAlarmRefresh(Self);
  end;

end;

constructor TDaemonState.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TDaemonState.Destroy;
begin

  inherited;
end;

procedure TDaemonState.FireRecovery;
begin
  if Assigned(FOnFireRecovery) then
  begin
    OnFireRecovery(Self);
  end;

end;

procedure TDaemonState.Live;
begin
  if Assigned(FOnDaemonLive) then
  begin
    OnDaemonLive(Self);
  end;
end;

procedure TDaemonState.Restart;
begin
  if Assigned(FOnDaemonRestart) then
  begin
    OnDaemonRestart(Self);
  end;
end;

procedure TDaemonState.SetServerConnected(const Value: Boolean);
begin
  if FServerConnected = Value then Exit;
  FServerConnected := Value;
  if Assigned(FOnServerConnected) then
  begin
    OnServerConnected(Self,Value);
  end;
end;

end.
