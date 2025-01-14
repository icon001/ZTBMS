unit uMonitorSocket;

interface

uses
  SysUtils, Classes, OoMisc, AdPort, AdWnPort, ExtCtrls,
  uDataModule1,uLomosUtil;

type
  TBuildingState = Class(TComponent)
  private
    EcuNormalState : string; //방범 정상 상태
    EcuAlarmState : string; //경계해제상태
    EcuAlaramEvent : string;
    FBuildingAlaramMode: TWatchMode;
    FBuildingAlaramEvent: TAlarmEventState; //방범알람 발생 유무
    procedure SetBuildingAlaramMode(const Value: TWatchMode);
    procedure SetBuildingAlaramEvent(const Value: TAlarmEventState);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property BuildingAlaramMode : TWatchMode read FBuildingAlaramMode write SetBuildingAlaramMode;
    property BuildingAlaramEvent : TAlarmEventState read FBuildingAlaramEvent write SetBuildingAlaramEvent;
  public
    DeviceList : TStringList;
    procedure DeviceAdd(aNodeNo:integer;aEcuID:string);
    procedure AlarmModeChange(aNodeNo:integer;aEcuID:string;aMode:string);  //aMode 0 해제,1 경계
    procedure AlarmEventChange(aNodeNo:integer;aEcuID:string;aEvent:string); //aEvent 0 알람확인 1 알람발생
  end;

  TNodeState = Class(TComponent)
  private
    DeviceList : TStringList;
    EcuUseState : string; //확장기 사용 형식... 64개 0 로 채운후 connectstate 와 비교
    EcuConnectState : string;
    FNodeConnected: Boolean;
    FEcuCount: integer;
    FNodeNo: integer;
    FNodeCurrentState: TNodeCurrentState;
    FNodeIP: string;
    FNodeName: string;
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
  public
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
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
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
  published
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
  public
  end;

  TdmMonitorSocket = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMonitorSocket: TdmMonitorSocket;

implementation

{$R *.dfm}

{ TNodeState }

constructor TNodeState.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DeviceList := TStringList.Create;
  NodeInitialize;
end;

destructor TNodeState.Destroy;
begin
  DeviceList.Free;
  inherited;
end;

procedure TNodeState.DeviceAdd(aEcuID: string);
var
  nIndex : integer;
  stDeviceID : string;
begin
  nIndex := strtoint(aEcuID);
  EcuUseState[nIndex + 1] := '1';
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  if DeviceList.IndexOf(stDeviceID) < 0 then DeviceList.Add(stDeviceID);
end;

procedure TNodeState.DeviceConnected(aEcuID: string;aValue:Boolean);
var
  nIndex : integer;
begin
  nIndex := strtoint(aEcuID);
  if aValue then
    EcuConnectState[nIndex + 1] := '1'
  else EcuConnectState[nIndex + 1] := '0';
  NodeStateCheck;
end;

procedure TNodeState.NodeInitialize;
var
  i : integer;
begin
  EcuUseState := '1';  //'0' 번은 필수로 연결됨
  EcuConnectState := '0';
  for i:= 1 to 63 do
  begin
    EcuUseState := EcuUseState + '0';
    EcuConnectState := EcuConnectState + '0';
  end;

end;

procedure TNodeState.NodeStateCheck;
begin
  if EcuUseState = EcuConnectState then NodeCurrentState := nsConnected
  else
  begin
    if pos('1',EcuConnectState) > 0 then NodeCurrentState := nsFault
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
    EcuConnectState[1] := '1';
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
end;


{ TBuildingState }

procedure TBuildingState.AlarmEventChange(aNodeNo: integer; aEcuID,
  aEvent: string);
var
  stDeviceID : string;
  nIndex : integer;
begin
  //aMode : '0' 정상 '1' 알람
  stDeviceID := FillZeroNumber(aNodeno,3) + aEcuID;
  nIndex := DeviceList.IndexOf(stDeviceID);
  if nIndex > -1 then
  begin
    EcuAlaramEvent[nIndex + 1] := aEvent[1];
    if EcuAlaramEvent = EcuNormalState then BuildingAlaramEvent := aeNormal
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
  nIndex := DeviceList.IndexOf(stDeviceID);
  if nIndex > -1 then
  begin
    EcuAlarmState[nIndex + 1] := aMode[1];
    if EcuAlarmState = EcuNormalState then BuildingAlaramMode := cmDisarm
    else BuildingAlaramMode := cmArm;
  end;
end;

constructor TBuildingState.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DeviceList := TStringList.Create;   //기기 아이디 저장소
  DeviceList.Clear;
  EcuNormalState := '';
  EcuAlarmState := '';
  EcuAlaramEvent := '';
end;

destructor TBuildingState.Destroy;
begin
  DeviceList.Free;
  inherited;
end;

procedure TBuildingState.DeviceAdd(aNodeNo: integer; aEcuID: string);
var
  stDeviceID : string;
begin
  stDeviceID := FillZeroNumber(aNodeNo,3) + aEcuID;
  if DeviceList.IndexOf(stDeviceID) < 0 then
  begin
    DeviceList.Add(stDeviceID);
    EcuNormalState := EcuNormalState + '0';
    EcuAlarmState := EcuAlarmState + '0';
    EcuAlaramEvent := EcuAlaramEvent + '0';
  end;
end;

procedure TBuildingState.SetBuildingAlaramEvent(
  const Value: TAlarmEventState);
begin
  if FBuildingAlaramEvent = Value then Exit;
  FBuildingAlaramEvent := Value;
end;

procedure TBuildingState.SetBuildingAlaramMode(const Value: TWatchMode);
begin
  if FBuildingAlaramMode = Value then Exit;
  FBuildingAlaramMode := Value;
end;

{ TDeviceState }

constructor TDeviceState.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

destructor TDeviceState.Destroy;
begin

  inherited;
end;

procedure TDeviceState.SetAlarmEventState(const Value: TAlarmEventState);
begin
  FAlarmEventState := Value;
end;

procedure TDeviceState.SetAlarmMode(const Value: TWatchMode);
begin
  FAlarmMode := Value;
end;

procedure TDeviceState.SetConnected(const Value: Boolean);
begin
  FConnected := Value;
end;

procedure TDeviceState.SetDoor1CardMode(const Value: TDoorPNMode);
begin
  FDoor1CardMode := Value;
end;

procedure TDeviceState.SetDoor1Fire(const Value: Boolean);
begin
  FDoor1Fire := Value;
end;

procedure TDeviceState.SetDoor1LockState(const Value: TDoorLockState);
begin
  FDoor1LockState := Value;
end;

procedure TDeviceState.SetDoor1ManageMode(const Value: TDoorManageMode);
begin
  FDoor1ManageMode := Value;
end;

procedure TDeviceState.SetDoor1State(const Value: TDoorState);
begin
  FDoor1State := Value;
end;

procedure TDeviceState.SetDoor2CardMode(const Value: TDoorPNMode);
begin
  FDoor2CardMode := Value;
end;

procedure TDeviceState.SetDoor2Fire(const Value: Boolean);
begin
  FDoor2Fire := Value;
end;

procedure TDeviceState.SetDoor2LockState(const Value: TDoorLockState);
begin
  FDoor2LockState := Value;
end;

procedure TDeviceState.SetDoor2ManageMode(const Value: TDoorManageMode);
begin
  FDoor2ManageMode := Value;
end;

procedure TDeviceState.SetDoor2State(const Value: TDoorState);
begin
  FDoor2State := Value;
end;

end.
