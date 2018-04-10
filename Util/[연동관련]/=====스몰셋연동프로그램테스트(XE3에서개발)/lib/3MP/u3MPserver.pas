unit u3MPserver;

interface

uses
  SysUtils, Classes, OoMisc, AdPort, AdWnPort,Windows,AdSocket,Forms;

type
  Tdm3MPServer = class(TDataModule)
    KTSocket: TApdWinsockPort;
    procedure KTSocketWsConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure KTSocketWsDisconnect(Sender: TObject);
    procedure KTSocketWsError(Sender: TObject; ErrCode: Integer);
    procedure KTSocketTriggerAvail(CP: TObject; Count: Word);
  private
    function Get3MpHexHeader(aData,aPacketType:string):string;
    function HextoKTSendPacket(aHexSendData:string):Boolean;
  private
    L_stReceiveHexData : string;
    FKTServerIP: string;
    FKTServerPort: string;
    FSocketOpen: Boolean;
    FKTServerConnected: Boolean;
    procedure SetSocketOpen(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    function KTServerChannelAuth(aGateWayID,aDeviceID,aDevicePW:string):Boolean;
  public
    property KTServerIP : string read FKTServerIP write FKTServerIP;
    property KTServerPort : string read FKTServerPort write FKTServerPort;
    property SocketOpen : Boolean read FSocketOpen write SetSocketOpen;
    property KTServerConnected : Boolean read FKTServerConnected write FKTServerConnected;
  end;

var
  dm3MPServer: Tdm3MPServer;

implementation
uses
  uLomosUtil;
{$R *.dfm}

{ Tdm3MPServer }

procedure Tdm3MPServer.SetSocketOpen(const Value: Boolean);
var
  PastTime : dword;
begin
  if FSocketOpen = Value then Exit;
  FSocketOpen := Value;


  with KTSocket do
  begin
    WsAddress := KTServerIP;  //'127.0.0.1';//
    WsPort := KTServerPort;
    DeviceLayer:= dlWinsock;
    wsMode:=    wsClient;
    Try
      Open := False;
      Delay(200);
      Open := True;
    Except
      Exit;
    end;
  end;

  PastTime := GetTickCount + 3000;  //응답이 올때 까지 대기하자.  1초 대기
  While Not KTServerConnected do
  begin
    if GetTickCount > PastTime then
    begin
      break;  //3000밀리동안 응답 없으면 실패로 처리함
    end;
    Application.ProcessMessages;
  end;
  if Not KTServerConnected then   //3초 동안 접속이 안되면 
  begin
    SocketOpen := False;
    Exit;
  end;
end;

procedure Tdm3MPServer.KTSocketWsConnect(Sender: TObject);
begin
  KTServerConnected :=  True;  
end;

procedure Tdm3MPServer.DataModuleCreate(Sender: TObject);
begin
  KTServerConnected := False;
end;

procedure Tdm3MPServer.KTSocketWsDisconnect(Sender: TObject);
begin
  KTServerConnected := False;
  SocketOpen := False;
end;

procedure Tdm3MPServer.KTSocketWsError(Sender: TObject; ErrCode: Integer);
begin
  KTServerConnected := False;
  SocketOpen := False;
end;

procedure Tdm3MPServer.KTSocketTriggerAvail(CP: TObject; Count: Word);
var
  i : integer;
  bLoop : Boolean;
  stLeavePacketData : string;
  stPacketData : string;
  nFormat : integer;
begin
  for i := 1 to Count do
  begin
    L_stReceiveHexData := L_stReceiveHexData + char2Hex(TApdWinsockPort(CP).GetChar);
  end;
  bLoop := False;
(*  repeat
    if Trim(L_stReceiveHexData) = '' then break;
    nFormat := PacketFormatCheck(L_stReceiveHexData,stLeavePacketData,stPacketData);
    {/*
     nFormat : -1 -> 비정상 전문
               -2 -> 길이가 짧은 전문
                1 ->  STX 포맷
                2 ->  SOH 포맷
    */}
    L_stReceiveHexData:= stLeavePacketData;
    if nFormat < 0 then
    begin
      if L_stReceiveHexData = '' then break;
      if nFormat = -1 then  //비정상 전문 인경우
      begin
         Delete(L_stReceiveHexData,1,2);
         continue;
      end else break;   //포맷 길이가 작게 들어온 경우
    end;
    //memo1.Lines.Add('[RX]' + stPacketData);
    if stPacketData <> '' then ReceiveHexPacketDataProcess(stPacketData);
    Application.ProcessMessages;
  until bLoop;
*)
end;

function Tdm3MPServer.KTServerChannelAuth(aGateWayID, aDeviceID,
  aDevicePW: string): Boolean;
var
  stBodyMessage : string;
  stHexHeader : string;
  stHexSendData : string;
begin
  stBodyMessage := '{"extrSysID":"' + aGateWayID + '","deviceId":"' + aDeviceID + '","athnRqtNo":"' + aDevicePW + '","msgHeadVO":{"mapHeaderExtension":{}}}';

  stHexHeader := Get3MpHexHeader(stBodyMessage,'1');

  stHexSendData := stHexHeader + Ascii2Hex(stBodyMessage);
  HextoKTSendPacket(stHexSendData);
end;

function Tdm3MPServer.Get3MpHexHeader(aData,aPacketType: string): string;
var
  stHexHeader : string;
  nHeaderSize : integer;
begin
  nHeaderSize := 35;
  stHexHeader := Dec2Hex(Length(aData) + nHeaderSize,8);
  if aPacketType = '1' then
  begin
    stHexHeader := stHexHeader + '1101002360E000000150B67C0307000000000000000000000000000000000000030000';  //채널인증
  end else if aPacketType = '2' then
  begin
    stHexHeader := stHexHeader + '11010023619B00000150B67C046E000000000000000000000000000000000000030000';  //데이터 수집
  end else if aPacketType = '3' then
  begin
    stHexHeader := stHexHeader + '1101002360E700000150B68B7482000000000000000000000000000000000000030000';   //Alive
  end else if aPacketType = '3' then
  begin
    stHexHeader := stHexHeader + '11010023620D00000150B740C501000000003B9ACEED000000003B9C5BF50000030000';   //데이터 전달
  end;

  result := stHexHeader;
end;

function Tdm3MPServer.HextoKTSendPacket(aHexSendData: string): Boolean;
var
  nLength : integer;
  i : integer;
  stSendData:pchar;
begin
  result := False;
  nLength := Length(aHexSendData) div 2;
  Try
    stSendData := strAlloc(nLength);
    for i := 0 to nLength - 1 do
    begin
      stSendData[i] := Char(Hex2Dec(copy(aHexSendData,(i*2) + 1,2)));
    end;
    Try
      if KTSocket.Open then
        KTSocket.PutBlock(stSendData[0],nLength)
      else Exit;
    Except
      Exit;
    End;
  Finally
    StrDispose(stSendData);
  End;
  result := True;

end;

end.
