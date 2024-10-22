unit uDisplaymodule;

interface

uses
  SysUtils, Classes,Forms, ExtCtrls,SyncObjs,
  ScktComp,AdPort,AdWnPort,AdSocket,DXString,
  IdGlobal,
  uLomosUtil;

const DISPCLEARCMD = '1B 7B 32 4A';
const DISPCRCMD = '0D';
const DISPLFCMD = '0A';

type
  TdmDisplay = class(TApdWinsockport)
  private
    GeneralDelayTime : dword;
    FCS : TCriticalSection;
    GeneralTimer1 : TTimer;
    FIP: string;
    FPort: string;
    FClearTime: integer;
    FAuthMessage: string;
    FGeneralMessage: string;
    FNotAuthMessage: string;
    FPacketSending: Boolean;
    FGeneralTime: integer;
    procedure SetIP(const Value: string);
    procedure SetPort(const Value: string);
    procedure SetAuthMessage(const Value: string);
    procedure SetClearTime(const Value: integer);
    procedure SetGeneralMessage(const Value: string);
    procedure SetNotAuthMessage(const Value: string);
    procedure SetPacketSending(const Value: Boolean);
    { Private declarations }
    function DateMessageConv(aMessage:string):string;
    procedure SocketPuttstring(aMessage:string);
    procedure GeneralSendPacket;
    procedure SetGeneralTime(const Value: integer);
  public
    SendDataList : TStringList; //전송 Data
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SendData(aData:string);
    Function SocketConnected : Boolean;
  published
    Property DisplayIP: string read FIP write SetIP;
    Property DisplayPort: string read FPort write SetPort;
    Property ClearTime: integer read FClearTime write SetClearTime;
    Property GeneralTime: integer read FGeneralTime write SetGeneralTime;
    Property GeneralMessage: string read FGeneralMessage write SetGeneralMessage;
    Property AuthMessage: string read FAuthMessage write SetAuthMessage;
    Property NotAuthMessage: string read FNotAuthMessage write SetNotAuthMessage;
    Property PacketSending : Boolean read FPacketSending write SetPacketSending;

  end;

var
  dmDisplay: TdmDisplay;

implementation

{$R *.dfm}

{ TdmDisplay }

procedure TdmDisplay.SetAuthMessage(const Value: string);
begin
  FAuthMessage := Value;
end;

procedure TdmDisplay.SetClearTime(const Value: integer);
begin
  FClearTime := Value;
end;

procedure TdmDisplay.SetGeneralMessage(const Value: string);
begin
  FGeneralMessage := Value;
end;

procedure TdmDisplay.SetIP(const Value: string);
begin
  FIP := Value;
  WsAddress := Value;
end;

procedure TdmDisplay.SetNotAuthMessage(const Value: string);
begin
  FNotAuthMessage := Value;
end;

procedure TdmDisplay.SetPort(const Value: string);
begin
  FPort := Value;
  WsPort := Value;
end;

procedure TdmDisplay.SetPacketSending(const Value: Boolean);
begin
  FPacketSending := Value;
end;

procedure TdmDisplay.SendData(aData: string);
var
  stMessage : string;
begin
  if aData = '000' then stMessage := GeneralMessage
  else if aData = '001' then stMessage := AuthMessage
  else stMessage := NotAuthMessage;

  if Pos('DATE(',UpperCase(stMessage)) > 0 then
  begin
    stMessage := DateMessageConv(stMessage);
  end;
  SocketPuttstring(stMessage);

  if aData <> '000' then
  begin
    GeneralDelayTime := GetTickCount + GeneralTime;
    GeneralSendPacket;
  end;

end;

function TdmDisplay.DateMessageConv(aMessage: string): string;
var
  nIndex : integer;
  stTemp : string;
  stMessage : string;
  stFormat : string;
begin
  stTemp := aMessage;
  stMessage := '';

  While( Pos('DATE(',UpperCase(stTemp)) > 0 ) do
  begin
    nIndex := Pos('DATE(',UpperCase(stTemp));
    stMessage := stMessage + copy(stTemp,1,nIndex - 1);
    Delete(stTemp,1,nIndex + Length('DATE(') - 1);
    nIndex := Pos(')',UpperCase(stTemp));
    stFormat := copy(stTemp,1,nIndex - 1);
    Delete(stTemp,1,nIndex + Length(')'));

    stMessage := stMessage + FormatDateTime(stFormat,now);
  end;

  result := stMessage + stTemp;


end;

procedure TdmDisplay.SocketPuttstring(aMessage: string);
var
  stAddress : string;
  stPort : string;
begin
  stAddress := wsAddress;
  stPort := wsPort;

  DeviceLayer:= dlWinsock;
  wsAddress:= stAddress;
  wsPort:=    stPort;
  wsMode:= wsClient;

  if Open then
  begin
    Open := False;
    Delay(10);
  end;
  Try
    //FCS.Enter;
    Open := True;
    if SocketConnected then  //500미리 동안 접속 실패면 빠져 나감
    begin
      PutString(Hex2Ascii(DISPCLEARCMD)); //Display 지움
      //Delay(ClearTime);                   //Clear Time 만큼 대기 후 메시지 전송
      PutString(Hex2Ascii(DISPCRCMD));    //Display 커서 맨 앞으로 옮김
      PutString(Hex2Ascii(DISPLFCMD));    //첫째줄에 커서 변경
      PutString(aMessage);                //뿌려줄 메시지 전송
      PutString(Hex2Ascii(DISPLFCMD));    //둘째줄에 커서 옮김
      //Application.ProcessMessages;
    end;
  Finally
    //FCS.Leave;
  end;

end;

function TdmDisplay.SocketConnected: Boolean;
var
  PastTime : dword;
begin
  result := False;
  PastTime := GetTickCount + 500;
  While Not Open do
  begin
    if GetTickCount > PastTime then Exit;
    Application.ProcessMessages;
  end;

  if Open then result := True;
end;

constructor TdmDisplay.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCS := TCriticalSection.Create;

  AutoOpen:= False;
  DeviceLayer:= dlWinsock;
  WsMode:= wsClient;
{  AutoOpen := False;
  DeviceLayer:= dlWinsock;
  WsMode:= wsClient;
  PromptForPort := False;
  RTS := False;
  TapiMode := tmOff;
  UseMSRShadow := False;
  wsTelnet := False;
}
  SendDataList := TStringList.Create;

  PacketSending := False;

  ClearTime := 10;
  GeneralTime := 3000;

end;

destructor TdmDisplay.Destroy;
begin
  FCS.Free;
  SendDataList.Free;
  inherited Destroy;
end;

procedure TdmDisplay.GeneralSendPacket;
begin
  While True do
  begin
    if GetTickCount > GeneralDelayTime then break;
    Application.ProcessMessages;
  end;

  SendData('000'); //복구 명령 전송
end;

procedure TdmDisplay.SetGeneralTime(const Value: integer);
begin
  FGeneralTime := Value;
end;

end.
