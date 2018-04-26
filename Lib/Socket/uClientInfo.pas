unit uClientInfo;

interface
uses
  Classes,SysUtils,SyncObjs,IdTCPServer,WinSock,
  Messages,u_c_byte_buffer,uDataModule1;

const wm_asynch_select= wm_User;
const k_buffer_max= 4096;
      k_tcp_ip_chunk= 1500;
      MAXSOCKCOUNT = 100;

Type


  TClientInfo = class
    private
    public
      AThread: TIdPeerThread;
      ClientIP : string;
      ClientPort : integer;
      AliveTime : TDateTime;
  end;

  TDeviceSocketInfo = class
  private
    L_bSocketWriting : Boolean;
    L_ClientBuffer : string;
    l_c_reception_buffer : c_byte_buffer;
    RcvData : string;
    FMCUID: String;
    FWinSocket: tSocket;
    FOnWinSockNodePacket: TWinSockNodePacket;
    FOnWinSockNodeDisConnect: TWinSockNodeDisConnect;
    FConnected: Boolean;
    FLastConnectedTime: TDatetime;
    procedure SetMCUID(const Value: String);
  public
    AThread: TIdPeerThread;
    ClientIP : string;
    ClientPort : integer;
    AliveTime : TDateTime;
    constructor create;
    destructor Destroy;override;
    procedure PacketDataProcess(aData:string);
    function PutString(aData:string):Boolean;
    function  SendPacket(aEcuId: String; aCmd:Char; aData: String; aQuick:Boolean;aType:integer = 0):Boolean;
    procedure SocketRead;
    procedure SocketClose;
    procedure SocketError(Sender: TObject; SocketError: Integer);
    procedure SocketReceive(Sender: TObject; aData: String;var DataLen: Integer);
    procedure SocketPacketProcess;
    procedure SocketWrite(aData:string);

    function GetPacket:string;
    function GetMcuID(aPacket:string):string;
  published
    property LastConnectedTime: TDatetime read FLastConnectedTime write FLastConnectedTime;
    property WinSocket : tSocket read FWinSocket write FWinSocket;
    property Connected : Boolean read FConnected write FConnected;
    Property MCUID: String Read FMCUID write SetMCUID;
    property OnWinSockNodePacket : TWinSockNodePacket Read FOnWinSockNodePacket Write FOnWinSockNodePacket;
    property OnWinSockNodeDisConnect : TWinSockNodeDisConnect Read FOnWinSockNodeDisConnect write FOnWinSockNodeDisConnect;
  end;

implementation
uses
  uServerDaemon,
  uLomosUtil;


{ TDeviceSocketInfo }

constructor TDeviceSocketInfo.create;
begin
  inherited;
  AThread := nil;
  L_bSocketWriting := False;
  RcvData := '';
  MCUID := '';
  WinSocket := Invalid_Socket;
  l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
end;

destructor TDeviceSocketInfo.Destroy;
begin
  inherited;
  SocketClose;
  l_c_reception_buffer.Free;
  l_c_reception_buffer:= Nil;
end;

function TDeviceSocketInfo.GetMcuID(aPacket: string): string;
begin
  result := Copy(aPacket,8,7);
end;

function TDeviceSocketInfo.GetPacket: string;
var
  aIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
begin
  Result:= '';
  Lenstr:= Copy(RcvData,2,3);
  //������ ���� ��ġ �����Ͱ� ���ڰ� �ƴϸ�...
  if not isDigit(Lenstr) then
  begin
    Delete(RcvData,1,1);       //1'st STX ����
    aIndex:= Pos(STX,RcvData); // ���� STX ã��
    if aIndex = 0 then       //STX�� ������...
    begin
      //��ü ������ ����
      RcvData:= '';
    end else if aIndex > 1 then // STX�� 1'st�� �ƴϸ�
    begin
      Delete(RcvData,1,aIndex-1);//STX �� ������ ����
    end;
    Exit;
  end;

  //��Ŷ�� ���ǵ� ����
  DefinedDataLength:= StrtoInt(Lenstr);
  //��Ŷ�� ���ǵ� ���̺��� ���� �����Ͱ� ������
  if Length(RcvData) < DefinedDataLength then
  begin

    //���� �����Ͱ� ���̰� ������(���� �� ������ ����)
    etxIndex:= POS(ETX,RcvData);
    if etxIndex > 0 then
    begin
     Delete(RcvData,1,etxIndex);
     //ShowMessage(toHExstr(aData));
    end;
    Exit;
  end;

  // ���ǵ� ���� ������ �����Ͱ� ETX�� �´°�?
  if RcvData[DefinedDataLength] = ETX then
  begin
    StrBuff:= Copy(RcvData,1,DefinedDataLength);
    Result:=StrBuff;
    Delete(RcvData, 1, DefinedDataLength);
  end else
  begin
    //������ �����Ͱ� EXT�� �ƴϸ� 1'st STX����� ���� STX�� ã�´�.
    Delete(RcvData,1,1);
    aIndex:= Pos(STX,RcvData); // ���� STX ã��
    if aIndex = 0 then       //STX�� ������...
    begin
      //��ü ������ ����
      RcvData:= '';
    end else if aIndex > 1 then // STX�� 1'st�� �ƴϸ�
    begin
      Delete(RcvData,1,aIndex-1);//STX �� ������ ����
    end;
  end;
end;

procedure TDeviceSocketInfo.PacketDataProcess(aData: string);
var
  aKey: Byte;
  stTemp : string;
begin
  if aData = '' then Exit;
  aKey:= Ord(aData[5]);
  stTemp:= Copy(aData,1,5) + EncodeData(aKey,Copy(aData,6,Length(aData)-6));
  aData:= stTemp;
  MCUID := Copy(aData,8,7);
  if Assigned(FOnWinSockNodePacket) then  OnWinSockNodePacket(Self,WinSocket,MCUID,ClientIP,aData);

end;


function TDeviceSocketInfo.PutString(aData: string): Boolean;
var
  l_result: Integer;
  buf: array of Byte;
  nLen : integer;
  i : integer;
  FirstTickCount : Double;
begin
  result := False;

  if WinSocket = INVALID_SOCKET then Exit;
  if Not Connected then Exit;

(*  FirstTickCount := GetTickCount + 3000; //3�� ���
  While L_bSocketWriting do
  begin
    if Not Open then Exit;
    Application.ProcessMessages;
    sleep(1);
    if GetTickCount > FirstTickCount then
    begin
      L_bSocketWriting := False;
      Exit;  //3000�и����� ���� ������ ���з� ó����
    end;
  end;//���� �߿��� ������ ����.  => ���� �Ϸ� �޽��� �̺�Ʈ�� �߻� �ȵǾ� ��������
*)
  nLen := Length(aData);
  SetLength(buf, nLen);
  for i := 1 to nLen do
  begin
    buf[i-1] := ord(aData[i]);
  end;

  Try
    l_result:= Send(WinSocket,buf[0], nLen, 0);

    if l_result < 0 then
    begin
      if l_result = wsaEWouldBlock  then
      begin
        L_bSocketWriting := True;  //Socket�� Full ���� Write
      end else
      begin
//        LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(Send) -'+ inttostr(l_result) + '-' + ConnectIP);
//        CommNodeWsError(Self,WinSocket,WSAGetLastError);
      end;
    end;
  Except
    Exit;
  End;
  result := True;
end;

function TDeviceSocketInfo.SendPacket(aEcuId: String; aCmd: Char;
  aData: String; aQuick: Boolean; aType: integer): Boolean;
var
  ErrCode: Integer;
  ACKStr: String;
  ACKStr2: String;
  aDataLength: Integer;
  aLengthStr: String;
  aKey:Integer;
  aMsgNo: Integer;
  I: Integer;
  st: string;
  stDeviceID : string;
  nDeviceIndex : integer;
begin
  Result:= False;

  if MCUID = '' then MCUID := '0000000';
  stDeviceID := MCUID + aEcuId;

  aDataLength:= 21 + Length(aData);
  aLengthStr:= FillZeroNumber(aDataLength,3);

  if aCmd = 'a' then //���� ó��
  begin
    ACkStr:= STX +aLengthStr+  #$20+'K1'+ stDeviceID+ aCmd+'0';
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
    aKey:= $20;
    ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;
  end else //���� or ���
  begin
    aMsgNo:= 0;
    ACkStr:= STX +aLengthStr+ #$20+'K1'+ stDeviceID+ aCmd+InttoStr(aMsgNo) +aData;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
    aKey:= Ord(ACkStr[5]);
    ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;
  end;

  if Connected then PutString(ACKStr2);

  //�۽Ż�����Ȳ Display {To Do}
  //if Assigned(FOnSendData) then
  //begin
  //  OnSendData(Self,ACKStr2,No);
  //end;

  Result:= True;
end;

procedure TDeviceSocketInfo.SetMCUID(const Value: String);
begin
  FMCUID := Value;
end;

procedure TDeviceSocketInfo.SocketClose;
var
  l_result : integer;
begin
  if WinSocket <> INVALID_SOCKET then
  begin
    l_result:= CloseSocket(WinSocket);
    //if l_result = 0 then
    WinSocket := INVALID_SOCKET;
  end;
  if Assigned(FOnWinSockNodeDisConnect) then OnWinSockNodeDisConnect(self,WinSocket,MCUID);
end;

procedure TDeviceSocketInfo.SocketError(Sender: TObject;
  SocketError: Integer);
begin

end;

procedure TDeviceSocketInfo.SocketPacketProcess;
var
  nIndex: Integer;
  st: string;
  st2: string;
begin
  nIndex:= Pos(STX,L_ClientBuffer);
  if nIndex = 0 then Exit;

  if nIndex > 1 then
  begin
    //STX �� ó���� �ƴϸ� STX�յ����� ����
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 ERR_PROTOCOL_0001,copy(L_ClientBuffer,1,nIndex-1));
    Delete(L_ClientBuffer,1,nIndex-1);
  end;
  if Length(L_ClientBuffer) < 21 then Exit;
  repeat
    st:= CheckDataPacket(L_ClientBuffer,st2);
    L_ClientBuffer:= st2;
    if st <> '' then PacketDataProcess(st);
  until pos(ETX,L_ClientBuffer) = 0;
end;

procedure TDeviceSocketInfo.SocketRead;
var
    l_remaining: Integer;
    l_pt_start_reception: Pointer;
    l_packet_bytes: Integer;

    l_eol_position: Integer;
    stTemp: String;

begin
  if l_c_reception_buffer = nil then Exit;
  LastConnectedTime := Now;
  with l_c_reception_buffer do
  begin
    l_remaining:= m_buffer_size- m_write_index;
    // -- if not at least a tcp-ip chunk, increase the room
    if l_remaining < k_tcp_ip_chunk then
    begin
      // -- reallocate
      double_the_capacity;
      l_remaining:= m_buffer_size- m_write_index;
    end;
    l_pt_start_reception:= @ m_oa_byte_buffer[m_write_index];
    l_packet_bytes:= Recv(WinSocket, l_pt_start_reception^, l_remaining, 0);
    if l_packet_bytes < 0 then SocketError(self,WSAGetLastError)
    else
    begin
      m_write_index:= m_write_index+ l_packet_bytes;
      stTemp := ByteCopy(l_pt_start_reception,l_packet_bytes);
      SocketReceive(self, stTemp, l_packet_bytes);
    end;
  end;
end;

procedure TDeviceSocketInfo.SocketReceive(Sender: TObject; aData: String;
  var DataLen: Integer);
begin
  L_ClientBuffer := L_ClientBuffer + aData;
  SocketPacketProcess;
end;

procedure TDeviceSocketInfo.SocketWrite(aData: string);
begin

end;

end.
 