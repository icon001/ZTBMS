unit uServerConnectModule;

interface

uses
  SysUtils, Classes,
  AdWnPort,AdPort,AdSocket,
  uDataModule1;

type
  TdServerConnectModule = class(TApdWinsockport)
  private
    ServerComBuff : string;
    FNo: Integer;
    FOnRcvData: TNotifyReceive;
    FOnSendData: TNotifyReceive;
    FSocketConnected: Boolean;
    FOnConnected: TNodeConnect;
    FNetworkMode: TNetworkMode;
    FRemoteConnected: Boolean;
    procedure SetNo(const Value: Integer);
    procedure SetSocketConnected(const Value: Boolean);
    procedure SetNetworkNode(const Value: TNetworkMode);
    procedure SetRemoteConnected(const Value: Boolean);
    { Private declarations }
  public
    Devices: TStringList;             //등록된 기기 목록
    QuickSendDataList: TStringList; // 먼저 내보낼 데이터 목록
    ReserveSendDataList: TStringList; //내보낼 데이터 목록
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    Procedure ExecSendPacket;
    function  SendPacket(aNodeNo: integer; aEcuID,aDoorID,aCmd, aData: String; aQuick:Boolean;aType:integer = 0):Boolean;
  protected
    procedure CommNodeTriggerAvail(CP: TObject; Count: Word);
    procedure CommNodeWsConnect(Sender: TObject);
    procedure CommNodeWsDisconnect(Sender: TObject);
    procedure CommNodeWsError(Sender: TObject; ErrCode: Integer);

  published
    Property NetworkMode: TNetworkMode read FNetworkMode write SetNetworkNode;
    Property No: Integer Read FNo write SetNo;
    ProPerty OnRcvData : TNotifyReceive read FOnRcvData write FOnRcvData;
    ProPerty OnSendData : TNotifyReceive read FOnSendData write FOnSendData;
    ProPerty OnConnected : TNodeConnect read FOnConnected Write FOnConnected;
    ProPerty SocketConnected : Boolean read FSocketConnected Write SetSocketConnected;
    Property RemoteConnected: Boolean read FRemoteConnected write SetRemoteConnected; 
  end;

  TDevice = Class(TComponent)
  private
    FDaemonNo: integer;
    FNodeNo: integer;
    FEcuID: string;
    FCommServer: TdServerConnectModule;
    FConnected: Boolean;
    procedure SetDaemonNo(const Value: integer);
    procedure SetNodeNo(const Value: integer);
    procedure SetEcuID(const Value: string);
    procedure SetCommServer(const Value: TdServerConnectModule);
    procedure SetConnected(const Value: Boolean);
  protected
  public
    function  SendPacket(aDoorID,aCmd, aData: String; aQuick:Boolean;aType:integer = 0):Boolean;
  published
    Property CommServer: TdServerConnectModule Read FCommServer write SetCommServer;
    property DaemonNo : integer Read FDaemonNo Write SetDaemonNo;
    property NodeNo : integer Read FNodeNo Write SetNodeNo;
    property EcuID : string Read FEcuID Write SetEcuID;
    Property Connected: Boolean Read FConnected write SetConnected;
  end;

var
  dServerConnectModule: TdServerConnectModule;

implementation

uses
  uLomosUtil;
{$R *.dfm}

{ TdServerConnectModule }

procedure TdServerConnectModule.CommNodeTriggerAvail(CP: TObject;
  Count: Word);
var
  st:String;
  I: Integer;
  aData:String;
  nIndex : integer;
  stTemp : string;
begin
  st:= '';
  for I := 1 to Count do st := st + GetChar;
  ServerComBuff:= ServerComBuff + st ;

  repeat
    aData:= Copy(ServerComBuff,1,Pos(LINEEND,ServerComBuff));
    Delete(ServerComBuff,1,Pos(LINEEND,ServerComBuff));

    nIndex := Pos('R',aData);
    if nIndex < 0 then      continue;
    if nIndex > 1 then Delete(aData,1,nIndex - 1);
    if Length(Trim(aData)) < 2 then continue;
    if Assigned(FOnRcvData) then
    begin
      OnRcvData(Self,aData,NO);
    end;

  until pos(LINEEND,ServerComBuff) = 0;

end;

procedure TdServerConnectModule.CommNodeWsConnect(Sender: TObject);
begin
  SocketConnected := True;
end;

procedure TdServerConnectModule.CommNodeWsDisconnect(Sender: TObject);
begin
  SocketConnected := False;
end;

procedure TdServerConnectModule.CommNodeWsError(Sender: TObject;
  ErrCode: Integer);
begin
//  Open := False; -- 이코드를 넣으니까 여기에서 무한루프 
  SocketConnected:= False;
end;

constructor TdServerConnectModule.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Devices:= TStringList.Create;
  Devices.Sorted := True;
  Devices.Duplicates:= dupIgnore;

  QuickSendDataList:= TStringList.Create; // 먼저 내보낼 데이터 목록
  QuickSendDataList.Clear;
  ReserveSendDataList:= TStringList.Create; //내보낼 데이터 목록
  ReserveSendDataList.Clear;

  ServerComBuff := '';

  SocketConnected:= False;

  AutoOpen:= False;
  DeviceLayer:= dlWinsock;
  WsMode:= wsClient;

  NetworkMode:= nmLocal;
  RemoteConnected:= False;

  OnTriggerAvail:= CommNodeTriggerAvail;
  OnWsConnect := CommNodeWsConnect;
  OnWsDisconnect := CommNodeWsDisconnect;
  OnWsError := CommNodeWsError;

end;

destructor TdServerConnectModule.Destroy;
var
  i : integer;
begin
  inherited Destroy;
  for i:= 0 to Devices.Count-1 do
  begin
    if Assigned( Devices.Objects[I]) then
      TDevice(Devices.Objects[I]).Free;
   end;
  Devices.Free;
end;

procedure TdServerConnectModule.ExecSendPacket;
var
  I: Integer;
  st: string;
begin
  if not Open then  Exit;
  if QuickSendDataList.Count > 0 then
  begin
    st:= QuickSendDataList[0];
    PutString(st);
    FlushOutBuffer;
    //여기에서 데이터 송신현황 조회 {TO DO}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,st,No);
    end;
    QuickSendDataList.Delete(0);
    Exit;
  end;

  if ReserveSendDataList.Count > 0 then
  begin
    st:= ReserveSendDataList[0];
    PutString(st);
    FlushOutBuffer;
    //여기에서 데이터 송신현황 조회 {TO DO}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,st,No);
    end;
    ReserveSendDataList.Delete(0);
    Exit;
  end;

end;

function TdServerConnectModule.SendPacket(aNodeNo: integer; aEcuID,aDoorID, aCmd,
  aData: String; aQuick: Boolean; aType: integer): Boolean;
var
  stSendData : string;
begin
  Result := False;

  stSendData := aCmd + DATADELIMITER + FillZeroNumber(aNodeNo,3) + aEcuID + aDoorID + DATADELIMITER + aData + LINEEND;

  if aQuick then
  begin
    QuickSendDataList.add(stSendData);
  end else
  begin
    ReserveSendDataList.Add(stSendData);
  end;
  Result := True;
end;

procedure TdServerConnectModule.SetNetworkNode(const Value: TNetworkMode);
begin
  if FNetworkMode <> Value then
  FNetworkMode := Value;
end;

procedure TdServerConnectModule.SetNo(const Value: Integer);
begin
  FNo := Value;
end;

procedure TdServerConnectModule.SetRemoteConnected(const Value: Boolean);
var
  I: Integer;
begin
  if FRemoteConnected <> Value then
  begin
    FRemoteConnected:= Value;
    if Value then
    begin
      SocketConnected:= True;
//      LastConnectedTime:= Now;
    end else
    begin
      SocketConnected:= False;

      For I:= 0 to Devices.Count -1 do
      begin
        if Assigned(Devices.Objects[I]) then
        begin
          TDevice(Devices.Objects[I]).Connected:= False;
        end;
      end;
    end;
  end;
end;

procedure TdServerConnectModule.SetSocketConnected(const Value: Boolean);
begin
  if FSocketConnected = Value then Exit;
  FSocketConnected := Value;
  if Assigned(FOnConnected) then
  begin
    OnConnected(Self,Value,NO);
  end;
end;

{ TDevice }

function TDevice.SendPacket(aDoorID, aCmd, aData: String; aQuick: Boolean;
  aType: integer): Boolean;
begin
  if CommServer <> nil then
    CommServer.SendPacket(NodeNo,ECUID,aDoorID,aCmd,aData,aQuick,aType);

end;

procedure TDevice.SetCommServer(const Value: TdServerConnectModule);
begin
  FCommServer := Value;
end;

procedure TDevice.SetConnected(const Value: Boolean);
begin
  FConnected := Value;
end;

procedure TDevice.SetDaemonNo(const Value: integer);
begin
  FDaemonNo := Value;
end;

procedure TDevice.SetEcuID(const Value: string);
begin
  FEcuID := Value;
end;

procedure TDevice.SetNodeNo(const Value: integer);
begin
  FNodeNo := Value;
end;

end.
