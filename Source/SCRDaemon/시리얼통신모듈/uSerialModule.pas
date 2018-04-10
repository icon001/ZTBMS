unit uSerialModule;

interface

uses
  SysUtils, Classes, AdStatLt, OoMisc, AdPort, AdWnPort,uDataModule1,uLomosUtil;

const
  STARTREADER = '01';
  SERIALSTX = #$87;
  ENQCMD = #$5;
  ACKCMD = #$6;
  CARDCMD = #$24;
  BUTTONCMD = #$27;
  REGISTERCMD = #$12;
  NOTREGISTERCMD = #$14;

  BASICERROR = 20;

const
  ERR_DEVICE_0001   = '통신 이상';
  ERR_DEVICE_0002   = '미등록 기기 ';
  ERR_PROTOCOL_0001 = 'STX이전 데이터';
  ERR_PROTOCOL_0002 = '정의 안된 커맨드';
  ERR_PROTOCOL_0003 = 'ERROR 커맨드';
  ERR_DB_0001       = 'DB저장 실패';
  ERR_PACKET_0001   = 'Packet내 데이터 오류';
  ERR_PACKET_0002   = 'Packet 사이즈부족';

type
  TNotifyReceive = procedure(Sender: TObject;  ReceiveData: string; NodeNo : integer) of object;
  TNodeConnect = procedure(Sender: TObject;  Value:Boolean; NodeNo : integer) of object;
  TConnectType = procedure(Sender: TObject;  Value:Boolean; NodeNo : integer;aEcuID:string) of object;
  TDeviceType = (dtNothing,dtAc,dtAt,dtPt,dtFd);

  TSerialECU = Class(TComponent)
  private
    FNodeNO: integer;
    FSerialPort: TApdWinsockPort;
    FConnected: Boolean;
    FCommNode: TApdWinsockPort;
    FOnConnected: TConnectType;
    FOnRcvCardReadData: TNotifyReceive;
    FErrorCount: integer;
    FECUID: String;
    FATtype: TDevicetype;
    FOnRcvButtonReadData: TNotifyReceive;
    ComRcvBuffer:string;
    procedure SetNodeNO(const Value: integer);
    procedure SetSerialPort(const Value: TApdWinsockPort);
    procedure SetConnected(const Value: Boolean);
    procedure SetCommNode(const Value: TApdWinsockPort);
    procedure ComponentCreate(Sender: TObject);
    procedure SetErrorCount(const Value: integer);
    procedure SetECUID(const Value: String);
    procedure SetAtType(const Value: TDevicetype);

  published
    Property ErrorCount: integer Read FErrorCount write SetErrorCount;
    Property NodeNo: integer Read FNodeNO write SetNodeNO;
    Property ECUID: String Read FECUID write SetECUID;
    Property SerialPort: TApdWinsockPort Read FSerialPort write SetSerialPort;
    Property Connected: Boolean Read FConnected write SetConnected;
    property OnRcvCardReadData:   TNotifyReceive read FOnRcvCardReadData    write FOnRcvCardReadData;
    property OnRcvButtonReadData:   TNotifyReceive read FOnRcvButtonReadData    write FOnRcvButtonReadData;
    Property OnConnected:         TConnectType   read FOnConnected          write FOnConnected;
    Property AtType: TDevicetype Read FATtype write SetAtType;

    Property CommNode: TApdWinsockPort Read FCommNode write SetCommNode;

  Public
    Procedure SendPacket(aCmd:Char; aData: String);
    Procedure DataPacektProcess(aData: string; NodeNo:integer);

  end;

  
  TSerialModule = class(TDataModule)
    WinsockPort: TApdWinsockPort;
    ApdSLController1: TApdSLController;
    procedure DataModuleCreate(Sender: TObject);
    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FOnRcvData: TNotifyReceive;
    FOnSendData: TNotifyReceive;
    FNo: Integer;
    FRemoteConnected: Boolean;
    FSocketConnected: Boolean;
    FOnConnected: TNodeConnect;
    FOnRcvInvalidDevice: TNotifyReceive;
    procedure SetNo(const Value: Integer);
    procedure SetRemoteConnected(const Value: Boolean);
    procedure SetSocketConnected(const Value: Boolean);
    Function CheckDataPacket(aData:String; var bData:String):string;
    Procedure DataPacektProcess(aData: string);
    { Private declarations }
  public
    Devices: TStringList;             //등록된 기기 목록
    { Public declarations }
    function  SendPacket(aREADERID: String;aCmd:Char; aData: String):Boolean;
  published
    ProPerty OnRcvData : TNotifyReceive read FOnRcvData write FOnRcvData;
    ProPerty OnSendData : TNotifyReceive read FOnSendData write FOnSendData;
    Property No: Integer Read FNo write SetNo;
    Property RemoteConnected: Boolean read FRemoteConnected write SetRemoteConnected; 
    ProPerty OnConnected : TNodeConnect read FOnConnected Write FOnConnected;
    ProPerty OnRcvInvalidDevice: TNotifyReceive read FOnRcvInvalidDevice write FOnRcvInvalidDevice;
    ProPerty SocketConnected : Boolean read FSocketConnected Write SetSocketConnected;
  protected
    Send_MsgNo: Integer;
    Rcv_MsgNo : Char;
  end;

var
  SerialModule: TSerialModule;
  ComBuff: String;
  G_bPackageEND:Boolean;

implementation

{$R *.dfm}

{ TSerialModule }

function TSerialModule.SendPacket(aREADERID: String; aCmd: Char;
  aData: String): Boolean;
var
  nDataLength: Integer;
  stLengthStr: String;
  stSendData : string;
  nCheckSum : integer;
begin

  Result := False;
  if not WinsockPort.Open then
  begin
    Exit;
  end;

  nDataLength:= Length(aData);
  stLengthStr:= '$' + inttostr(nDataLength);
//  if Send_MsgNo >= 9 then  Send_MsgNo:= 0
//  else                     Send_MsgNo:= Send_MsgNo + 1;

  stSendData := SERIALSTX +
                Char(strtoint(aREADERID)) +
                Char(Send_MsgNo) +
                aCmd +
                Char(strtoint(stLengthStr)) +
                aData ;
  nCheckSum:= Ord(MakeSum(stSendData));
  stSendData := stSendData +
                Char(nCheckSum);

  if Assigned(FOnSendData) then
  begin
    OnSendData(Self,stSendData,No);
  end;
  WinsockPort.PutString(stSendData);

  Result:= True;
end;

procedure TSerialModule.SetNo(const Value: Integer);
begin
  FNo := Value;
end;

procedure TSerialModule.SetRemoteConnected(const Value: Boolean);
begin
  FRemoteConnected := Value;
end;

procedure TSerialModule.SetSocketConnected(const Value: Boolean);
begin
  if FSocketConnected = Value then Exit;
  FSocketConnected := Value;
  if Assigned(FOnConnected) then
  begin
    OnConnected(Self,Value,NO);
  end;
end;

procedure TSerialModule.DataModuleCreate(Sender: TObject);
begin
  Devices:= TStringList.Create;
  Devices.Sorted := True;
  Devices.Duplicates:= dupIgnore;

  Send_MsgNo := 0;
  ComBuff := '';
end;

procedure TSerialModule.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  st: string;
  st2: string;
  aIndex: Integer;
  I: Integer;
begin

  st:= '';
  for I := 1 to Count do st := st + WinsockPort.GetChar;
  ComBuff:= ComBuff + st;
  aIndex:= Pos(SERIALSTX,ComBuff);

  if aIndex = 0 then Exit;
  SocketConnected:= True;

  if aIndex > 1 then
  begin
    //STX 가 처음이 아니면 STX앞데이터 삭제
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 ERR_PROTOCOL_0001,copy(comBuff,1,aIndex-1));
    Delete(ComBuff,1,aIndex-1);
  end;
  if Length(Combuff) < 5 then Exit;
  repeat
    st:= CheckDataPacket(ComBuff,st2);
    ComBuff:= st2;
    if st <> '' then DataPacektProcess(st);
  until st = '';

end;

function TSerialModule.CheckDataPacket(aData: String;
  var bData: String): string;
var
  aIndex: Integer;
  Lenstr: String;
  nLength : integer;
  stData: String;
  stCheckSum : string;
  nCheckSum : integer;
begin

  Result:= '';
  if Length(aData) < 6 then Exit; 
  Lenstr:= Copy(aData,5,1);
  nLength := strtoint(Dec2Hex(Ord(Lenstr[1]),2));
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < (5 + nLength + 1) then
  begin
    bData:= aData;
    Exit;
  end;
  stData:= Copy(aData,1,nLength + 5);
  stCheckSum := Copy(aData,6 + nLength ,1);
  nCheckSum:= Ord(MakeSum(stData));
  if stCheckSum = Char(nCheckSum) then
  begin
    Result:=stData;
    Delete(aData, 1, 6 + nLength);
    bData:= aData;
  end else
  begin
    Delete(aData, 1, 6 + nLength);
    bData:= aData;
  end;

end;

procedure TSerialModule.DataPacektProcess(aData: string);
var
  DeviceIndex: Integer;
  stEcuID : string;
begin

  if aData = '' then Exit;
  //데이터 수신현황에 데이터 뿌려줌 {TO DO}
  if Assigned(FOnRcvData) then
  begin
    OnRcvData(Self,aData,NO);
  end;
  stEcuID := Dec2Hex(Ord(aData[2]),2);
  DeviceIndex:= Devices.IndexOf(FillZeroNumber(No,3) + stECUID);

  if DeviceIndex > -1 then //목록에 존재 하면
  begin
     TSerialECU(Devices.Objects[DeviceIndex]).DataPacektProcess(aData ,No);
  end else
  begin
    if Assigned(FOnRcvInvalidDevice) then  OnRcvInvalidDevice(Self,aData,No);
  end;
{  //058 K1100000203Aan20061201162319EX0300dNF*************C0
  cTemp := copy(aData,2,1);
  stEcuID := Dec2Hex(Ord(cTemp),2);

  cCMD := copy(aData,4,1);
  cTemp := copy(aData,5,1); //Length
  nLength := strtoint(Dec2Hex(Ord(cTemp),2));
  stData := copy(aData,6,nLength);
}

end;

{ TSerialECU }

procedure TSerialECU.ComponentCreate(Sender: TObject);
begin
  ErrorCount := 0;
end;

procedure TSerialECU.DataPacektProcess(aData: string; NodeNo: integer);
var
  cCmd: Char;
  MSG_Code: Char;
begin

  Connected:= True;
  ErrorCount := 0;

  cCMD := aData[4];
{  if ComRcvBuffer = aData then Exit;
  ComRcvBuffer := aData;}

  case cCMD of
    ACKCMD: begin //데이터 없음
           //Connected:= True;
           G_bPackageEND := True;
         end;
    CARDCMD: begin // 카드 데이터
           if Assigned(FOnRcvCardReadData) then OnRcvCardReadData(Self,aData,NodeNO);
         end;
    BUTTONCMD: begin // 버튼 Set up
           if Assigned(FOnRcvButtonReadData) then OnRcvButtonReadData(Self,aData,NodeNO);
         end;
    else
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   ERR_PROTOCOL_0002,aData);
  end;
end;

procedure TSerialECU.SendPacket(aCmd: Char; aData: String);
begin
  ErrorCount := ErrorCount + 1; //ErrorCount 를 증가 시켜서 ErrorCount 가 20회 이상 인경우 DisConnected;
  if ErrorCount > BASICERROR then Connected := False;
  SerialModule.SendPacket(ECUID,aCmd,aData);
end;

procedure TSerialECU.SetAtType(const Value: TDevicetype);
begin
  FATtype := Value;
end;

procedure TSerialECU.SetCommNode(const Value: TApdWinsockPort);
begin
  FCommNode := Value;
end;

procedure TSerialECU.SetConnected(const Value: Boolean);
begin
  if FConnected <> Value then
  begin
    FConnected := Value;
    if Assigned(FOnConnected) then OnConnected(Self,Value,NodeNO,ECUID);
  end;
end;

procedure TSerialECU.SetECUID(const Value: String);
begin
  FECUID := Value;
end;

procedure TSerialECU.SetErrorCount(const Value: integer);
begin
  FErrorCount := Value;
end;

procedure TSerialECU.SetNodeNO(const Value: integer);
begin
  FNodeNO := Value;
end;

procedure TSerialECU.SetSerialPort(const Value: TApdWinsockPort);
begin
  FSerialPort := Value;
end;

procedure TSerialModule.DataModuleDestroy(Sender: TObject);
begin
  Devices.Free;

end;

end.
