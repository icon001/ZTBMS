unit uDeviceState;

interface

uses
  SysUtils, Classes, OoMisc, AdPort, AdWnPort, ExtCtrls,
  uDataModule1;

type
  TArmAreaState = Class(TComponent)
  private
    FNodeNo: integer;
    FBuildingCode: string;
    FFloorCode: string;
    FArmAreaNo: string;
    FAreaCode: string;
    FArmAreaName: string;
    FECUID: string;
    FAlarmEventState: TAlarmEventState;
    FOnArmAreaAlarmEventState: TArmAreaAlarmEventState;
    FAlarmMode: TWatchMode;
    FOnAlarmModeChanged: TWatchModeChangeType;
    procedure SetAlarmMode(const Value: TWatchMode);
    procedure SetAlarmEventState(const Value: TAlarmEventState);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BuildingAlarmEventChange;
    procedure BuildingAlarmModeChange;
  published
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property FloorCode : string read FFloorCode write FFloorCode;
    property AreaCode : string read FAreaCode write FAreaCode;
    property NodeNo : integer read FNodeNo write FNodeNo;
    property ECUID : string read FECUID write FECUID;
    property ArmAreaNo : string read FArmAreaNo write FArmAreaNo;
    property ArmAreaName : string read FArmAreaName write FArmAreaName;
    property AlarmMode : TWatchMode read FAlarmMode write SetAlarmMode;
    property AlarmEventState : TAlarmEventState read FAlarmEventState write SetAlarmEventState;
  published
    property OnAlarmModeChanged : TWatchModeChangeType read FOnAlarmModeChanged       write FOnAlarmModeChanged;
    property OnArmAreaAlarmEventState : TArmAreaAlarmEventState read FOnArmAreaAlarmEventState       write FOnArmAreaAlarmEventState;
  end;

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
    procedure DeviceAdd(aNodeNo:integer;aEcuID,aAreaNo,aAlarmName:string);
    procedure DoorAdd(aNodeNo:integer;aEcuID,aDoorNo,aDoorName:string);
    procedure AlarmModeChange(aNodeNo:integer;aEcuID,aArmAreaNo:string;aMode:string);  //aMode 0 해제,1 경계
    procedure AlarmEventChange(aNodeNo:integer;aEcuID,aArmAreaNo:string;aEvent:string); //aEvent 0 알람확인 1 알람발생
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
    FCardFixType: Integer;
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
    Property CardFixType: Integer Read FCardFixType write FCardFixType;  //0-고정(4Byte),1-가변(G_nCardFixedLength 에 따름)
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
    FConnected: Boolean;
    FNodeNo: integer;
    FECUID: string;
    FDeviceName: string;
    FOnDeviceConnected: TConnectType;
    FLastAccessData: string;
    FOnAccessEvent: TAccessEvent;
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
    procedure SetConnected(const Value: Boolean);
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
    Property NodeNo : integer read FNodeNo write FNodeNo;
    Property ECUID : string read FECUID write FECUID;
    property DeviceName : string read FDeviceName write FDeviceName;

    property Connected : Boolean read FConnected write SetConnected;
    property LastAlarmStatus : string read FLastAlarmStatus write SetLastAlarmStatus;
    property LastNewAlarmStatus : string read FLastNewAlarmStatus write SetLastNewAlarmStatus; //새로 생성한 코드
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
    property OnDeviceConnected:TConnectType read FOnDeviceConnected write FOnDeviceConnected;
    property OnAccessEvent:TAccessEvent read FOnAccessEvent write FOnAccessEvent;
    property OnAlarmEventAnalysis:TAlarmEventAnalysis read FOnAlarmEventAnalysis write FOnAlarmEventAnalysis;
    property OnAlarmModeChanged:TWatchModeChangeType read FOnAlarmModeChanged write FOnAlarmModeChanged;
    property OnExitButton:TExitButton read FOnExitButton write FOnExitButton ;
    property OnDeviceAlarmEvent : TDeviceAlarmEvent read FOnDeviceAlarmEvent write FOnDeviceAlarmEvent;
    property OnDeviceSetupData : TDevicePacketData read FOnDeviceSetupData write FOnDeviceSetupData;
    property OnDeviceTypeChange : TDeviceTypeChange read FOnDeviceTypeChange write FOnDeviceTypeChange;
  private
//    procedure BuildingAlarmChange(aArmAreaNo:string='0');
//    procedure BuildingAlarmModeChange(aArmAreaNo:string='0');
  public
    function GetAlarmEventState(aArmAreaNo:integer):TAlarmEventState;
    function GetAlarmMode(aArmAreaNo:integer):TWatchMode;
    function GetAlarmName(aArmAreaNo:integer):string;
    procedure SetAlarmEventState(aArmAreaNo:integer;aAlarmEventState:TAlarmEventState);
    procedure SetAlarmMode(aArmAreaNo:integer;aAlarmMode:TWatchMode);
    procedure SetAlarmName(aArmAreaNo:integer;aName:string);
    procedure SetDoorStateInit(aDoorNo:integer);
    procedure AlaramEventClear;
    procedure DBAlarmStateChange(NodeNo:integer;ECUID:string;aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aZoneCode,aMode,aStatusCode,aPortNo,aState,
                                  aOperator,aNewStateCode:string;
                                  aAlarmView,aAlarmSound:Boolean;
                                  aColor:string);
    procedure ReaderInforSet(aReaderNo,aReaderUse,aDoorPosi,aBuildPosi:string);
    procedure PortInforSet(aPortNo,aWatchType,aDelaytimeUse,aPortRecoverySend:string);
  end;

  TDoorState = Class(TComponent)
  private
    FDoorUse: Boolean;
    FDoorFire: Boolean;
    FDoorNo: integer;
    FNodeNo: integer;
    FDoorName: string;
    FECUID: string;
    FDoorLockState: TDoorLockState;
    FDoorManageMode: TDoorManageMode;
    FDoorCardMode: TDoorPNMode;
    FDoorDSState: TDoorDSState;
    FOnDoorStateChange: TDoorModeChangeType;
    FFloorCode: string;
    FBuildingCode: string;
    FAreaCode: string;
    procedure SetDoorCardMode(const Value: TDoorPNMode);
    procedure SetDoorFire(const Value: Boolean);
    procedure SetDoorLockState(const Value: TDoorLockState);
    procedure SetDoorManageMode(const Value: TDoorManageMode);
    procedure SetDoorDSState(const Value: TDoorDSState);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    Property NodeNo : integer read FNodeNo write FNodeNo;
    Property ECUID : string read FECUID write FECUID;
    Property DoorNo : integer Read FDoorNo write FDoorNo;
    Property DoorUse : Boolean Read FDoorUse write FDoorUse;
    property DoorName : string read FDoorName write FDoorName;
    property DoorCardMode : TDoorPNMode read FDoorCardMode write SetDoorCardMode;
    property DoorManageMode : TDoorManageMode read FDoorManageMode write SetDoorManageMode;
    property DoorDSState : TDoorDSState read FDoorDSState write SetDoorDSState;
    property DoorLockState : TDoorLockState read FDoorLockState write SetDoorLockState;
    property DoorFire : Boolean read FDoorFire write SetDoorFire;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property FloorCode : string read FFloorCode write FFloorCode;
    property AreaCode : string read FAreaCode write FAreaCode;
  published
    property OnDoorStateChange:TDoorModeChangeType read FOnDoorStateChange write FOnDoorStateChange;
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
  Try
    if NodeDeviceList <> nil then
    begin
//      NodeDeviceList.Clear;
      NodeDeviceList := nil;
      NodeDeviceList.Free;
    end;
  Except
    Exit;
  End;
//  inherited;
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

procedure TBuildingState.AlarmEventChange(aNodeNo: integer; aEcuID,aArmAreaNo,
  aEvent: string);
var
  stDeviceID : string;
  stBuildingCode : string;
  nIndex : integer;
begin
  //aMode : '0' 정상 '1' 알람
  stDeviceID := FillZeroNumber(aNodeno,3) + aEcuID + aArmAreaNo;
  stBuildingCode := BuildingCode;
  nIndex := BuildingAlarmList.IndexOf(stDeviceID);
  if nIndex > -1 then
  begin
    EcuAlaramEvent[nIndex] := aEvent[1];
    if String(EcuNormalEvent) = String(EcuAlaramEvent)  then BuildingAlaramEvent := aeNormal
    else BuildingAlaramEvent := aeAlarmEvent;
  end;

end;

procedure TBuildingState.AlarmModeChange(aNodeNo: integer; aEcuID,aArmAreaNo,
  aMode: string);
var
  stDeviceID : string;
  nIndex : integer;
begin
  //aMode : '0' 해제 '1' 방범
  stDeviceID := FillZeroNumber(aNodeno,3) + aEcuID + aArmAreaNo;
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
  Try
    BuildingAlarmList.Free;
    BuildingAlarmNameList.Free;
    BuildingDoorList.Free;
    BuildingDoorNameList.Free;
  Except
    Exit;
  End;
  inherited;
end;

procedure TBuildingState.DeviceAdd(aNodeNo: integer; aEcuID,aAreaNo,aAlarmName: string);
var
  stDeviceID : string;
begin
  stDeviceID := FillZeroNumber(aNodeNo,3) + aEcuID + aAreaNo;
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
var
  i : integer;
  nIndex : integer;
begin
  for i := 0 to 8 do
  begin
    nIndex := ArmAreaStateList.IndexOf(FillZeroNumber(NodeNo,3) + ECUID + inttostr(i));
    if nIndex > -1 then
    begin
      TArmAreaState(ArmAreaStateList.Objects[nIndex]).AlarmEventState := aeNormal;
    end;
  end; 
end;

(*procedure TDeviceState.BuildingAlarmChange(aArmAreaNo:string='0');
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

  case AlarmEventStateArray[strtoint(aArmAreaNo)] of
    aeAlarmEvent : begin  stEvent := '1' end
    else begin stEvent := '0' end;
  end;
  TBuildingState(BuildingList.Objects[nBuidingIndex]).AlarmEventChange(NodeNo,Ecuid,aArmAreaNo,stEvent);
end;

procedure TDeviceState.BuildingAlarmModeChange(aArmAreaNo:string='0');
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

  case AlarmModeArray[strtoint(aArmAreaNo)] of
    cmArm : begin  stMode := '1' end
    else begin stMode := '0' end;
  end;
  TBuildingState(BuildingList.Objects[nBuidingIndex]).AlarmModeChange(NodeNo,Ecuid,aArmAreaNo,stMode);
end;
*)
constructor TDeviceState.Create(AOwner: TComponent);
var
  i : integer;
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
  for i := 0 to 8 do
  begin
    SetAlarmEventState(i,aeNormal);
  end;
  for i := 0 to 8 do
  begin
    SetAlarmMode(i,cmNothing);
  end;
end;

procedure TDeviceState.DBAlarmStateChange(NodeNo: integer; ECUID, aCmd,
  aMsgNo, aTime, aSubClass, aSubAddr, aZoneCode, aMode, aStatusCode,
  aPortNo, aState, aOperator, aNewStateCode: string; aAlarmView,
  aAlarmSound: Boolean;aColor:string);
var
  nArmAreaNo : integer;
begin
  if aCmd <> 'A' then Exit; //알람 발생 상태가 아니면 이벤트 발생하지 말자.

  nArmAreaNo := 0;
  if isDigit(aZoneCode) then nArmAreaNo := strtoint(aZoneCode);

  if aAlarmView or aAlarmSound then
  begin
    if aAlarmSound then SetAlarmEventState(nArmAreaNo,aeAlarmEvent)
    else SetAlarmEventState(nArmAreaNo,aeNormalEvent);
  end else SetAlarmEventState(nArmAreaNo,aeNormal);

  if Assigned(FOnAlarmEventAnalysis) then
  begin
    OnAlarmEventAnalysis(Self,NodeNo,EcuID,inttostr(nArmAreaNo),aCmd,aMsgNo,aTime,aSubClass,aSubAddr,
                                  aZoneCode,aMode,aStatusCode,aPortNo,aState,
                                  aOperator,aNewStateCode,aAlarmView,aAlarmSound,aColor);
  end;
end;

destructor TDeviceState.Destroy;
begin
  Try
    {
    ReaderList.Clear;
    ReaderList := nil;
    PortList.Clear;
    PortList := nil;
    }
    ReaderList.Free;
    PortList.Free;
  Except
    Exit;
  End;
  inherited;
end;



function TDeviceState.GetAlarmEventState(
  aArmAreaNo: integer): TAlarmEventState;
var
  nIndex : integer;
begin
  result := aeNothing;
  nIndex := ArmAreaStateList.IndexOf(FillZeroNumber(NodeNo,3) + ECUID + inttostr(aArmAreaNo));
  if nIndex > -1 then
  begin
    result := TArmAreaState(ArmAreaStateList.Objects[nIndex]).AlarmEventState;
  end;
end;

function TDeviceState.GetAlarmMode(aArmAreaNo: integer): TWatchMode;
var
  nIndex : integer;
begin
  result := cmNothing;
  nIndex := ArmAreaStateList.IndexOf(FillZeroNumber(NodeNo,3) + ECUID + inttostr(aArmAreaNo));
  if nIndex > -1 then
  begin
    result := TArmAreaState(ArmAreaStateList.Objects[nIndex]).AlarmMode;
  end;
end;

function TDeviceState.GetAlarmName(aArmAreaNo: integer): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := ArmAreaStateList.IndexOf(FillZeroNumber(NodeNo,3) + ECUID + inttostr(aArmAreaNo));
  if nIndex > -1 then
  begin
    result := TArmAreaState(ArmAreaStateList.Objects[nIndex]).ArmAreaName;
  end;
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
(*
procedure TDeviceState.SetAlarmMode(const Value: TWatchMode);
begin
end;
*)

procedure TDeviceState.SetAlarmEventState(aArmAreaNo: integer;
  aAlarmEventState: TAlarmEventState);
var
  nIndex : integer;
begin
  nIndex := ArmAreaStateList.IndexOf(FillZeroNumber(NodeNo,3) + ECUID + inttostr(aArmAreaNo));
  if nIndex > -1 then
  begin
    if TArmAreaState(ArmAreaStateList.Objects[nIndex]).AlarmEventState <> aAlarmEventState then
    begin
      if aAlarmEventState = aeAlarmEvent then  TArmAreaState(ArmAreaStateList.Objects[nIndex]).AlarmEventState := aAlarmEventState
      else if aAlarmEventState = aeNormalEvent then
      begin
        if TArmAreaState(ArmAreaStateList.Objects[nIndex]).AlarmEventState = aeNormal then TArmAreaState(ArmAreaStateList.Objects[nIndex]).AlarmEventState := aAlarmEventState;
      end;
    end;
  end;

end;

procedure TDeviceState.SetAlarmMode(aArmAreaNo: integer;
  aAlarmMode: TWatchMode);
var
  nIndex : integer;
begin
  nIndex := ArmAreaStateList.IndexOf(FillZeroNumber(NodeNo,3) + ECUID + inttostr(aArmAreaNo));
  if nIndex > -1 then
  begin
    TArmAreaState(ArmAreaStateList.Objects[nIndex]).AlarmMode := aAlarmMode;
  end;
end;

procedure TDeviceState.SetAlarmName(aArmAreaNo: integer; aName: string);
var
  nIndex : integer;
begin
  nIndex := ArmAreaStateList.IndexOf(FillZeroNumber(NodeNo,3) + ECUID + inttostr(aArmAreaNo));
  if nIndex > -1 then
  begin
    TArmAreaState(ArmAreaStateList.Objects[nIndex]).ArmAreaName := aName;
  end;
end;

procedure TDeviceState.SetConnected(const Value: Boolean);
var
  nNodeIndex : integer;
  i : integer;
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
    for i := 0 to 8 do SetAlarmMode(i,cmNothing);
    for i := 1 to 8 do SetDoorStateInit(i);
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

procedure TDeviceState.SetDoorNumber(const Value: integer);
begin
  FDoorNumber := Value;
end;

procedure TDeviceState.SetDoorStateInit(aDoorNo: integer);
var
  stDoorID:string;
  nIndex : integer;
begin
  stDoorID := FillZeroNumber(NodeNo,3) + ECUID + inttostr(aDoorNo);
  nIndex := DoorStateList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;
  TDoorState(DoorStateList.Objects[nIndex]).DoorCardMode := pnNothing;
  TDoorState(DoorStateList.Objects[nIndex]).DoorManageMode := dmNothing;
  TDoorState(DoorStateList.Objects[nIndex]).DoorDSState := dsNothing;
  TDoorState(DoorStateList.Objects[nIndex]).DoorLockState := lsNothing;
  TDoorState(DoorStateList.Objects[nIndex]).DoorFire := False;
end;

procedure TDeviceState.SetLastAccessData(const Value: string);
var
  stDoorNo,stReaderNo : string;
  stArmAreaNo : string;
  stPermitCode : string;
  stTime : string;
  stCardNo : string;
  nCardNoLen : integer;
  bExitButton : Boolean;
  cButton : char; //근태 버튼
  cInputType : char; //변경 사유 (원격제어: "R" ,버튼: "B" ,카드: "C", 스케쥴동작  :'S'  )
  stTemp : string;
  nCardNo : int64;
  stDoorID : string;
  nDoorIndex : integer;
  stCardType : string;
  Lenstr : string;
  StrBuff : string;
begin
  if FLastAccessData = Value then Exit;
  FLastAccessData := Value;

  stArmAreaNo := '0';
  stCardType := FindCharCopy(Value,1,';');
  Lenstr:= Copy(Value,2,3);
  StrBuff:= Copy(Value,1,strtoint(Lenstr)-3);

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

  if nCardNoLen = 0 then
  begin
    if CARDLENGTHTYPE = 0 then  //서버가 고정길이 타입이면
    begin
      stCardNo := Copy(Value,44,8);
      if G_nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
      begin
        stCardNo := DecodeCardNo(stCardNo,8,True);
        stCardNo := copy(stCardNo,1,6) + '00';
        nCardNo:= Hex2Dec64(stCardNo);
        stCardNo:= FillZeroNumber2(nCardNo,10);
        if stCardNo = '0000000000' then bExitButton := True;
      end else
      begin
        if IsNumericCardNo then
        begin
          stCardNo:= DecodeCardNo(stCardNo);
          if stCardNo = '0000000000' then bExitButton := True;
        end
        else
        begin
          stCardNo:= DecodeCardNo(stCardNo,8,True);
          if FillZeroNumber(Hex2Dec64(stCardNo),10) = '0000000000' then bExitButton := True;
        end;
      end;
    end else if CARDLENGTHTYPE = 1 then  //가변 길이이면
    begin
      stTemp := Copy(Value,44,8);
      stCardNo := DecodeCardNo(stTemp,8,True);
      nCardNo:= Hex2Dec64(stCardNo);
      if nCardNo = 0 then bExitButton := True;
      stCardNo := FillCharString(stCardNo,'*',16);
    end else if CARDLENGTHTYPE = 2 then  //KT사옥이면
    begin
      stTemp := Copy(Value,44,8);
      stCardNo := DecodeCardNo(stTemp,8,True);
      nCardNo:= Hex2Dec64(stCardNo);
      if nCardNo = 0 then bExitButton := True;
      stCardNo := FillCharString(stCardNo + '0','*',11);
    end;
    stCardNo := GetFixedCardNoCheck(stCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);
    if Length(StrBuff) > 56 then
    begin
      stArmAreaNo := StrBuff[57];
    end;
  end else
  begin
    stCardNo:= Copy(Value,44,nCardNoLen);
    stTemp := FillZeroNumber(0,nCardNoLen);
    if stCardNo = stTemp then bExitButton := True; //Exit 버튼 눌른것임
    if Not bExitButton then
    begin
      if stCardType = '2' then
      begin
        stCardNo := Hex2Ascii(stCardNo,True);
        if stCardNo = '00000000000' then bExitButton := True; //Exit 버튼 눌른것임
      end;
    end;

    if Not bExitButton then
    begin
      if CARDLENGTHTYPE = 0 then  //PC가 고정길이 타입이면
      begin
        stCardNo := copy(stCardNo,1,8);
        if IsNumericCardNo then
        begin
          nCardNo:= Hex2Dec64(stCardNo);
          stCardNo := FillZeroNumber(nCardNo,10);
        end;
      end else if CARDLENGTHTYPE = 2 then //KT사옥이면
      begin
        //stCardNo := Hex2Ascii(stCardNo);
      end;
      stCardNo := GetFixedCardNoCheck(stCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);
    end;
    if Length(StrBuff) > (44 + nCardNoLen + 4) then
    begin
      stArmAreaNo := StrBuff[44 + nCardNoLen + 5];
    end;
  end;
  if Not isDigit(stArmAreaNo) then stArmAreaNo := '0';
  
  if bExitButton then
  begin
    if cInputType = 'F' then
    begin
      stDoorID := FillZeroNumber(NodeNo,3) + EcuID + stDoorNo;
      nDoorIndex := DoorStateList.indexOf(stDoorID);
      if nDoorIndex > -1 then
      begin
        TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := True;
      end;
    end;
    if Assigned(FOnExitButton) then
    begin
      OnExitButton(Self,NodeNo,EcuID,stDoorNo,stTime,cInputType);
    end;
    Exit;
  end;
  if Assigned(FOnAccessEvent) then
  begin
    OnAccessEvent(Self,NodeNo,EcuID,stDoorNo,stReaderNo,stCardNo,stTime,stPermitCode,cInputType,cButton,stArmAreaNo);
  end;

  if cInputType = 'F' then
  begin
    stDoorID := FillZeroNumber(NodeNo,3) + EcuID + stDoorNo;
    nDoorIndex := DoorStateList.indexOf(stDoorID);
    if nDoorIndex > -1 then
    begin
      TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := True;
    end;
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
  stAlarmColor : string;
  nArmAreaNo : integer;
  nCardFixType : integer;
  nIndex : integer;
  nOperLenth : integer;
  nOperStartPoint : integer;
begin
  if FLastAlarmData = Value then Exit;
  FLastAlarmData := Value;

  nCardFixType := CARDLENGTHTYPE ;
  nIndex := NodeList.Indexof(FillZeroNumber(NodeNo,3));
  if nIndex > -1 then
  begin
    nCardFixType := TNodeState(NodeList.Objects[nIndex]).CardFixType;
  end;
  nOperStartPoint := 46;
  if nCardFixType = 0 then
  begin
    nOperLenth := 10;
    nOperStartPoint := 46;
  end else
  begin
    if AlarmEventLengthUse then
    begin
      nOperLenth := AlarmEventLength;
      nOperStartPoint := nOperStartPoint + 2;
    end else
    begin
      nOperLenth := 10;       
      nOperStartPoint := 46;
    end;
  end;
  stAlarmColor := '255'; //무조건 빨간색으로 설정


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
  //stOperator := copy(Value,46,10);
  stOperator := copy(Value,nOperStartPoint,nOperLenth);

  nArmAreaNo := 0;
  if isDigit(stZoneCode) then nArmAreaNo := strtoint(stZoneCode);
  
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
  else
  begin
    stAlarmColor := AlarmEventSoundColor.Strings[nTempIndex];
    bAlarmSound := True;
  end;

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
   'A': begin SetAlarmMode(nArmAreaNo,cmArm) end;
   'D': begin SetAlarmMode(nArmAreaNo,cmDisarm) end;
   'T': begin SetAlarmMode(nArmAreaNo,cmTest) end;
   'I': begin SetAlarmMode(nArmAreaNo,cmInit) end;
   'P': begin SetAlarmMode(nArmAreaNo,cmPatrol) end;
   'E': begin SetAlarmMode(nArmAreaNo,cmJaejung) end;
  else  begin  end;
  end;

  if (stSubCLass = 'MN') or (stSubCLass = 'EX')then
  begin
    if stStatusCode = 'NF' then
    begin
      SetAlarmMode(nArmAreaNo,cmNothing);
    end;
  end;
  if stCmd <> 'A' then Exit; //알람 발생 상태가 아니면 이벤트 발생하지 말자.
  if bAlarmView or bAlarmSound then
  begin
    if bAlarmSound then SetAlarmEventState(nArmAreaNo,aeAlarmEvent)
    else SetAlarmEventState(nArmAreaNo,aeNormalEvent);
  end else SetAlarmEventState(nArmAreaNo,aeNormal);

  if Assigned(FOnAlarmEventAnalysis) then
  begin
    OnAlarmEventAnalysis(Self,NodeNo,EcuID,inttostr(nArmAreaNo),stCmd,stMsgNo,stTime,stSubClass,stSubAddr,
                                  stZoneCode,stMode,stStatusCode,stPortNo,stState,
                                  stOperator,stNewStateCode,bAlarmView,bAlarmSound,stAlarmColor);
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

{ TArmAreaState }

procedure TArmAreaState.BuildingAlarmEventChange;
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

  case AlarmEventState of
    aeAlarmEvent : begin  stEvent := '1' end
    else begin stEvent := '0' end;
  end;
  TBuildingState(BuildingList.Objects[nBuidingIndex]).AlarmEventChange(NodeNo,Ecuid,ArmAreaNo,stEvent);
end;

procedure TArmAreaState.BuildingAlarmModeChange;
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
  TBuildingState(BuildingList.Objects[nBuidingIndex]).AlarmModeChange(NodeNo,Ecuid,ArmAreaNo,stMode);
end;

constructor TArmAreaState.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TArmAreaState.Destroy;
begin

  inherited;
end;

procedure TArmAreaState.SetAlarmEventState(const Value: TAlarmEventState);
begin
  if FAlarmEventState = Value then Exit;
  FAlarmEventState := Value;
  if Assigned(FOnArmAreaAlarmEventState) then
  begin
    OnArmAreaAlarmEventState(self,NodeNo,ECUID,ArmAreaNo,Value);
  end;
  BuildingAlarmEventChange;
end;

procedure TArmAreaState.SetAlarmMode(const Value: TWatchMode);
begin
  if FAlarmMode = Value then Exit;
  FAlarmMode := Value;
  if Assigned(FOnAlarmModeChanged) then
  begin
    OnAlarmModeChanged(self,NodeNo,ECUID,ArmAreaNo,Value);
  end;
  BuildingAlarmModeChange;
end;

{ TDoorState }

constructor TDoorState.Create(AOwner: TComponent);
begin
  inherited;
  DoorCardMode := pnNothing;
  DoorManageMode := dmNothing;
  DoorDSState := dsNothing;
  DoorLockState := lsNothing;
  DoorFire := False;
end;

destructor TDoorState.Destroy;
begin

  inherited;
end;

procedure TDoorState.SetDoorCardMode(const Value: TDoorPNMode);
begin
  if FDoorCardMode = Value then Exit;
  FDoorCardMode := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,inttostr(DoorNo),DoorManageMode,DoorCardMode,DoorDSState,DoorLockState,DoorFire);
  end;
end;

procedure TDoorState.SetDoorFire(const Value: Boolean);
begin
  if FDoorFire = Value then Exit;
  FDoorFire := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,inttostr(DoorNo),DoorManageMode,DoorCardMode,DoorDSState,DoorLockState,DoorFire);
  end;
end;

procedure TDoorState.SetDoorLockState(const Value: TDoorLockState);
begin
  if FDoorLockState = Value then Exit;
  FDoorLockState := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,inttostr(DoorNo),DoorManageMode,DoorCardMode,DoorDSState,DoorLockState,DoorFire);
  end;
end;

procedure TDoorState.SetDoorManageMode(const Value: TDoorManageMode);
begin
  if FDoorManageMode = Value then Exit;
  FDoorManageMode := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,inttostr(DoorNo),DoorManageMode,DoorCardMode,DoorDSState,DoorLockState,DoorFire);
  end;
end;

procedure TDoorState.SetDoorDSState(const Value: TDoorDSState);
begin
  if FDoorDSState = Value then Exit;
  FDoorDSState := Value;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,inttostr(DoorNo),DoorManageMode,DoorCardMode,DoorDSState,DoorLockState,DoorFire);
  end;
end;

end.
