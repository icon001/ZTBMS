unit uWinSocket;

interface

uses
  SysUtils, Classes,WinSock,Messages,SyncObjs,ExtCtrls,
  Forms,u_c_byte_buffer;


const wm_asynch_select= wm_User;
const k_buffer_max= 4096;
      k_tcp_ip_chunk= 1500;
      MAXSOCKCOUNT = 100;

type
  TSocketDataEvent = procedure(Sender: TObject;SockNo:integer; Buf:String;DataLen: Integer)of object;
  TSocketConnectEvent = procedure(Sender: TObject;SockNo:integer)of object;
  TSocketErrorEvent = procedure(Sender: TObject;SockNo:integer;SocketError: Integer)of object;
  TServerSocketDataEvent = procedure(Sender: TObject;aWinSocket:tSocket;ClientIP:string; Buf:String;DataLen: Integer)of object;

type
  TClientWinSocket = Class(TComponent)
  private
    FTCSDeviceSender : TCriticalSection;
    FHandle : THandle;
    FWinSocket: tSocket;
    FConnectPort: integer;
    FConnectIP: string;
    FOnSocketConnected: TSocketConnectEvent;
    FOnSocketDisConnected: TSocketConnectEvent;
    FOnSocketSendComplete: TSocketConnectEvent;
    FOnSocketSend: TSocketDataEvent;
    FOnSocketRead: TSocketDataEvent;
    FOnSocketError: TSocketErrorEvent;
    FOpen: Boolean;
    function GetHandle: THandle;
    procedure SetConnectIP(const Value: string);
    procedure SetConnectPort(const Value: integer);
    procedure SetOpen(const Value: Boolean);
  private
    { Private declarations }
    //********************* WinSock 변수
    l_wsa_data: twsaData;
    l_c_reception_buffer: c_byte_buffer;
  protected
    procedure WndProc ( var Message : TMessage ); virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandleAllocated : Boolean;
    procedure HandleNeeded;
    procedure handle_wm_async_select(var Msg: TMessage); message wm_asynch_select;
    function PutString(aData:string):Boolean;
  published
    property Handle : THandle read GetHandle;
    property WinSocket : tSocket read FWinSocket write FWinSocket;
    property ConnectIP : string read FConnectIP write SetConnectIP;
    property ConnectPort : integer read FConnectPort write SetConnectPort;
    property Open : Boolean read FOpen write SetOpen;
  published
    //소켓 이벤트
    property OnSocketConnected : TSocketConnectEvent read FOnSocketConnected write FOnSocketConnected;
    property OnSocketDisConnected : TSocketConnectEvent read FOnSocketDisConnected write FOnSocketDisConnected;
    property OnSocketRead : TSocketDataEvent read FOnSocketRead write FOnSocketRead;
    property OnSocketSend : TSocketDataEvent read FOnSocketSend write FOnSocketSend;
    property OnSocketSendComplete : TSocketConnectEvent read FOnSocketSendComplete write FOnSocketSendComplete;
    property OnSocketError : TSocketErrorEvent read FOnSocketError write FOnSocketError;
  end;

  TServerWinSocket = Class(TComponent)
  private
    //Handle 생성 부분
    FHandle : THandle;
    FServerStart: Boolean;
    FServerPort: integer;
    FOnServerSocketRead: TServerSocketDataEvent;
    function GetHandle: THandle;
    procedure SetServerStart(const Value: Boolean);
    function HandleAllocated : Boolean;
    procedure HandleNeeded;
  private
    L_server_socket_handle:tSocket;
    L_c_server_client_socket_list: TStringList;
    L_wsa_data: twsaData;
    ClientSocketConnectCheckTimer : TTimer;

    procedure ClientSocketConnectCheckTimerTimer(Sender: TObject);
    procedure ServerSocketRead(Sender: TObject;aWinSocket:tSocket;ClientIP:string; Buf:String;DataLen: Integer);
  protected
    procedure WndProc ( var Message : TMessage ); virtual;
    procedure handle_wm_async_select(var Msg: TMessage); message wm_asynch_select;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BroadCastDataSend(aData:string);
  published
    property Handle : THandle read GetHandle;
    property ServerPort : integer read FServerPort write FServerPort;
    property ServerStart : Boolean read FServerStart write SetServerStart;
  published
    property OnServerSocketRead : TServerSocketDataEvent read FOnServerSocketRead write FOnServerSocketRead;
  end;

  TServerClientSocket = class(TComponent)
  private
    SendClientTimer: TTimer;
    FClientIP: string;
    FLastReceiveTime: TDateTime;
    FOnServerSocketRead: TServerSocketDataEvent;
    FDeviceType: string;
    FOnServerSocketWrite: TServerSocketDataEvent;
  private
    L_ClientBuffer : string;
    L_bClientSocketDestroy : Boolean;
    L_bClientSending : Boolean;
    ClientSendPacketList : TStringList;
    l_c_reception_buffer : c_byte_buffer;
    function  CheckPCClientDataPacket(aData:String; var bData:String):string;
    procedure SendClientTimerTimer(Sender: TObject);
  published
    property DeviceType : string read FDeviceType write FDeviceType; //'0'.메인컨트롤러,'1'.PC
    property ClientIP : string read FClientIP write FClientIP;
    property LastReceiveTime : TDateTime read FLastReceiveTime write FLastReceiveTime;
  published
    property OnServerSocketRead : TServerSocketDataEvent read FOnServerSocketRead write FOnServerSocketRead;
    property OnServerSocketWrite : TServerSocketDataEvent read FOnServerSocketWrite write FOnServerSocketWrite;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    m_socket_handle: tSocket;
    procedure SocketRead;
    procedure SocketClose;
    procedure SocketError(Sender: TObject; SocketError: Integer);
    procedure SocketReceive(Sender: TObject; Buf: PAnsiChar;var DataLen: Integer);
    procedure SocketPacketProcess;
    procedure SocketWrite(aData:string);
  end;

  TdmSocket = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSocket: TdmSocket;

implementation
uses
  uLomosUtil,
  uDataModule1;

{$R *.dfm}
{ TClientWinSocket }

constructor TClientWinSocket.Create(AOwner: TComponent);
begin
  inherited;
  FHandle := 0;
  WinSocket := Invalid_Socket;
  FTCSDeviceSender := TCriticalSection.Create;
  l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
end;

destructor TClientWinSocket.Destroy;
begin
  Open := False;
  l_c_reception_buffer.Free;
  l_c_reception_buffer:= Nil;

  if HandleAllocated
   then DeAllocateHWND ( FHandle );
  FTCSDeviceSender.Free;

  inherited;
end;

function TClientWinSocket.GetHandle: THandle;
begin
  HandleNeeded;
  Result := FHandle;
end;

function TClientWinSocket.HandleAllocated: Boolean;
begin
  Result := ( FHandle <> 0 );
end;

procedure TClientWinSocket.HandleNeeded;
begin
  if not HandleAllocated
   then FHandle := AllocateHWND ( WndProc );

end;

procedure TClientWinSocket.handle_wm_async_select(var Msg: TMessage);
// -- wParam: hSocket, lo(lParam): notification, hi(lParam): error
      procedure handle_fd_connect_notification(p_socket: Integer);
      begin
        if Assigned(FOnSocketConnected) then
        begin
          OnSocketConnected(Self,p_socket);
        end;
      end;

      procedure handle_fd_write_notification(p_socket: Integer);
      begin
        if Assigned(FOnSocketSendComplete) then
        begin
          OnSocketSendComplete(Self,p_socket);
        end;
      end;

      procedure handle_fd_read_notification(p_socket: tSocket);
        var l_remaining: Integer;
            l_pt_start_reception: Pointer;
            l_packet_bytes: Integer;
            l_eol_position: Integer;
            stTemp : String;
        begin
          if l_c_reception_buffer = nil then Exit;

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

            // -- add the received data to the current buffer
            l_pt_start_reception:= @ m_oa_byte_buffer[m_write_index];

            // -- get the data from the client socket
            l_packet_bytes:= Recv(WinSocket, l_pt_start_reception^, l_remaining, 0);
            if l_packet_bytes < 0 then
            begin
              if Assigned(FOnSocketError) then
              begin
                OnSocketError(Self,p_socket,WSAGetLastError);
              end;
            end else
            begin
              m_write_index:= m_write_index+ l_packet_bytes;
              if Assigned(FOnSocketRead) then
              begin
                stTemp := ByteCopy(l_pt_start_reception,l_packet_bytes);
                OnSocketRead(Self,p_socket,stTemp,l_packet_bytes);
              end;
            end;
          end; // with g_c_reception_buffer

        end; // handle_fd_read_notification

      procedure handle_fd_close_notification(p_socket: Integer);
      var l_status: Integer;
          l_linger: TLinger;
          l_absolute_linger: array[0..3] of char absolute l_linger;
      begin
        if WSAIsBlocking
          then
            begin
              WSACancelBlockingCall;
            end;

        ShutDown(p_socket, 2);
        l_linger.l_onoff:= 1;
        l_linger.l_linger:= 0;

        SetSockOpt(p_socket, Sol_Socket, So_Linger, pAnsichar(AnsiString(l_absolute_linger)), sizeof(l_linger));  //l_absolute_linger[0] -> AnsiString(l_absolute_linger) 으로 변경

        l_status:= CloseSocket(p_socket);
        if l_status <> 0 then
        begin
          if Assigned(FOnSocketDisConnected) then
          begin
            OnSocketDisConnected(Self,p_socket);
          end;
        end;
      end; // handle_fd_close_notification
var
  l_param: Integer;
  l_error, l_notification: Integer;
  l_socket_handle: Integer;
begin
    l_param:= Msg.lParam;
    l_socket_handle:= Msg.wParam;

    // -- extract the error and the notification code from l_param
    l_error:= wsaGetSelectError(l_param);
    l_notification:= wsaGetSelectEvent(l_param);

    if l_error <= wsaBaseErr then
    begin
        case l_notification of
          FD_CONNECT: handle_fd_connect_notification(l_socket_handle);
          FD_ACCEPT: {display_bug_stop('no_client_accept')} ;
          FD_WRITE: handle_fd_write_notification(l_socket_handle);
          FD_READ: handle_fd_read_notification(l_socket_handle);
          FD_CLOSE: handle_fd_close_notification(l_socket_handle);
        end // case
    end else
    begin
      if l_notification= FD_CLOSE then handle_fd_close_notification(l_socket_handle)
      else
      begin
        if Assigned(FOnSocketError) then
        begin
          OnSocketError(Self,l_socket_handle,WSAGetLastError);
        end;
      end;
    end; 
end;

function TClientWinSocket.PutString(aData: string): Boolean;
var
  l_result: Integer;
  buf: array of Byte;
  nLen : integer;
  i : integer;
begin
  Try
    FTCSDeviceSender.Enter;
    result := False;
    if Not Open then Exit;
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
        if Assigned(FOnSocketError) then
        begin
          OnSocketError(Self,WinSocket,WSAGetLastError);
        end;
      end;
    Except
      Exit;
    End;
    result := True;
  Finally
    FTCSDeviceSender.Leave;
  End;
end;

procedure TClientWinSocket.SetConnectIP(const Value: string);
begin
  FConnectIP := Value;
end;

procedure TClientWinSocket.SetConnectPort(const Value: integer);
begin
  FConnectPort := Value;
end;

procedure TClientWinSocket.SetOpen(const Value: Boolean);
var
  l_result : Integer;
  l_error: Integer;
  l_version : Word;
  l_socket_address_in: tSockAddrIn;
  l_ip_z: array[0..255] of char;
  rset: TFDSet;
  t: TTimeVal;
  rslt: integer;
  stConnectIP : string;
begin
  if FOpen = Value then Exit;
  stConnectIP := ConnectIP;
  FOpen := Value;
  if Value then
  begin
    l_version:= $0101;
    l_result := wsaStartup(l_version, l_wsa_data);
    if l_result <> 0 then
    begin
      Open := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    WinSocket:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    if WinSocket = INVALID_SOCKET then
    begin
      Open := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    l_result:= wsaAsyncSelect(WinSocket, Handle,
        wm_asynch_select,
        FD_CONNECT+ FD_READ+ FD_WRITE+ FD_CLOSE);

    FillChar(l_socket_address_in, sizeof(l_socket_address_in), 0);
    with l_socket_address_in do
    begin
      sin_family:= pf_Inet;
      // -- the requested service
      sin_port:= hToNs(ConnectPort);
      // -- the server IP address
      if Not IsIPTypeCheck(ConnectIP) then
      begin
        stConnectIP := GetIpFromDomain(ConnectIP);
      end;
      StrPCopy(l_ip_z, stConnectIP);
      sin_addr.s_Addr:= inet_addr(PAnsichar(AnsiString(l_ip_z)));
    end; // with m_socket_address_in
    l_result:= Connect(WinSocket, l_socket_address_in,
        sizeof(l_socket_address_in));
    if l_result<> 0 then
    begin
      l_error:= WSAGetLastError;
      if l_error <> wsaEWouldBlock then
      begin
        Open := False;
        Exit;  //소켓생성 실패 시에 Open False
      end else
      begin
      end;
    end;
  end else
  begin
    if WinSocket <> INVALID_SOCKET then
    begin
      l_result:= CloseSocket(WinSocket);
      if l_result = 0 then
      begin
        WinSocket:= INVALID_SOCKET;
      end;
    end;
  end;
end;

procedure TClientWinSocket.WndProc(var Message: TMessage);
begin
  Dispatch ( Message );
end;

{ TServerWinSocket }

procedure TServerWinSocket.BroadCastDataSend(aData: string);
var
  i : integer;
begin
  for i := 0 to L_c_server_client_socket_list.Count - 1 do
  begin
    TServerClientSocket(L_c_server_client_socket_list.Objects[i]).SocketWrite(aData);
  end;

end;

procedure TServerWinSocket.ClientSocketConnectCheckTimerTimer(
  Sender: TObject);
var
  i : integer;
  dtPollingTime: TDatetime;
  dtTimeOut: TDatetime;
begin
  if L_c_server_client_socket_list.Count < 1 then Exit;
  for i := L_c_server_client_socket_list.Count - 1 downto 0 do
  begin
    dtPollingTime := TServerClientSocket(L_c_server_client_socket_list.Objects[i]).LastReceiveTime;
    dtTimeOut:= IncTime(dtPollingTime,0,6,0,0);   //6분 동안 데이터가 수신된게 없으면 클라이언트 소켓을 끊어 버리자...
    if Now > dtTimeOut then
    begin
      TServerClientSocket(L_c_server_client_socket_list.Objects[i]).SocketClose;
      TServerClientSocket(L_c_server_client_socket_list.Objects[i]).Free;
      L_c_server_client_socket_list.Delete(i);
    end;
  end;
end;

constructor TServerWinSocket.Create(AOwner: TComponent);
begin
  inherited;
  L_c_server_client_socket_list := TStringList.Create;
  ClientSocketConnectCheckTimer := TTimer.Create(nil);
  ClientSocketConnectCheckTimer.Interval := 10000;
  ClientSocketConnectCheckTimer.OnTimer := ClientSocketConnectCheckTimerTimer;
  ClientSocketConnectCheckTimer.Enabled := True;

end;

destructor TServerWinSocket.Destroy;
begin
  ClientSocketConnectCheckTimer.Enabled := false;
  ClientSocketConnectCheckTimer.Free;

  if ServerStart then ServerStart := False;
  L_c_server_client_socket_list.Free;
  inherited;
end;

function TServerWinSocket.GetHandle: THandle;
begin
  HandleNeeded;
  Result := FHandle;

end;

function TServerWinSocket.HandleAllocated: Boolean;
begin
  Result := ( FHandle <> 0 );
end;

procedure TServerWinSocket.HandleNeeded;
begin
  if not HandleAllocated
   then FHandle := AllocateHWND ( WndProc );
end;

procedure TServerWinSocket.handle_wm_async_select(var Msg: TMessage);
  procedure handle_fd_accept_notification(p_socket: tSocket);
  var l_address_socket_in: tSockAddrIn;
      l_address_size: Integer;
      l_server_client_socket: tSocket;
      nIndex : integer;
      oClientSocket : TServerClientSocket;
      l_address_in: tSockAddrIn;
      l_size: Integer;
      nResult : integer;
  begin
    l_address_size:= sizeof(l_address_socket_in);
    l_server_client_socket:= Accept(p_socket, @l_address_socket_in, @l_address_size);
    nIndex := L_c_server_client_socket_list.IndexOf(inttostr(l_server_client_socket));
    if nIndex < 0 then
    begin
      oClientSocket := TServerClientSocket.Create(nil);
      oClientSocket.m_socket_handle := l_server_client_socket;
      l_size := sizeof(tSockAddr);
       GetPeerName(l_server_client_socket, tSockAddr(l_address_in), l_size);
        oClientSocket.ClientIP :=  inet_ntoa(l_address_in.sin_addr);
      oClientSocket.OnServerSocketRead := ServerSocketRead;
      L_c_server_client_socket_list.AddObject(inttostr(l_server_client_socket),oClientSocket);
    end;
  end;
  procedure handle_fd_write_notification(p_socket: Integer);
  var nIndex : integer;
      l_remaining: Integer;
      l_pt_start_reception: Pointer;
  begin
    if p_socket <> L_server_socket_handle then
    begin
      nIndex := L_c_server_client_socket_list.IndexOf(inttostr(p_socket));
      if nIndex > -1 then
      begin
        with TServerClientSocket(L_c_server_client_socket_list.Objects[nIndex]) do
        begin

        end;
      end;
    end;
  end;
  procedure handle_fd_read_notification(p_socket: tSocket);
  var nIndex : integer;
  begin
    if p_socket= L_server_socket_handle then
    begin
      //server should not receive much
    end else
    begin
      nIndex := L_c_server_client_socket_list.IndexOf(inttostr(p_socket));
      if nIndex > -1 then
      begin
        TServerClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SocketRead;
      end;
    end;
  end;
  procedure handle_fd_close_notification(p_socket: Integer);
  var l_status: Integer;
      l_linger: TLinger;
      l_absolute_linger: array[0..3] of char absolute l_linger;

      nIndex : Integer;
  begin
    if p_socket <> L_server_socket_handle then
    begin
      nIndex:= L_c_server_client_socket_list.IndexOf(inttostr(p_socket));
    end;
    if WSAIsBlocking then WSACancelBlockingCall;
    ShutDown(p_socket, 2);
    Try
      SetSockOpt(p_socket, Sol_Socket, So_Linger,
                pAnsichar(AnsiString(l_absolute_linger)), sizeof(l_linger));  // l_absolute_linger[0] ->  AnsiString(l_absolute_linger) 으로 변경
    Except
    End;
    l_status:= CloseSocket(p_socket);
    if nIndex > -1 then
    begin
      TServerClientSocket(L_c_server_client_socket_list.Objects[nIndex]).Free;
      L_c_server_client_socket_list.Delete(nIndex);
    end;
  end;
var l_param: Integer;
    l_error, l_notification: Integer;
    l_socket_handle: Integer;
begin
    l_param:= Msg.lParam;
    l_socket_handle:= Msg.wParam;
    l_error:= wsaGetSelectError(l_param);
    l_notification:= wsaGetSelectEvent(l_param);

    if l_error<= wsaBaseErr then
    begin
      case l_notification of
        FD_ACCEPT: handle_fd_accept_notification(l_socket_handle);
        FD_CONNECT: begin end; //display('no server fd_connect');
        FD_WRITE: handle_fd_write_notification(l_socket_handle);
        FD_READ: handle_fd_read_notification(l_socket_handle);
        FD_CLOSE: handle_fd_close_notification(l_socket_handle);
      end // case
    end else begin
      if l_notification= FD_CLOSE then handle_fd_close_notification(l_socket_handle);
    end;
end;



procedure TServerWinSocket.ServerSocketRead(Sender: TObject;
  aWinSocket: tSocket; ClientIP, Buf: String; DataLen: Integer);
begin
  if Assigned(FOnServerSocketRead) then
  begin
    OnServerSocketRead(Self,aWinSocket,ClientIP,Buf,DataLen);  
  end;   
end;

procedure TServerWinSocket.SetServerStart(const Value: Boolean);
var
  l_result : integer;
  l_address_socket_in: tSockAddrIn;
  i : integer;
begin

  if FServerStart = Value then Exit;
  FServerStart := Value;

  if Value then
  begin
    l_result := wsaStartup($0101, l_wsa_data);
    if l_result <> 0 then
    begin
      ServerStart := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    L_server_socket_handle:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    if L_server_socket_handle= INVALID_SOCKET then
    begin
      ServerStart := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    l_result:= wsaAsyncSelect(L_server_socket_handle, Handle,wm_asynch_select,FD_ACCEPT+ FD_READ+ FD_WRITE+ FD_CLOSE);
    if l_result<> 0 then
    begin
      ServerStart := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    FillChar(l_address_socket_in, sizeof(l_address_socket_in), 0);
    with l_address_socket_in do
    begin
      sin_family:= af_Inet;
      sin_port:= hToNs(ServerPort);
      sin_addr.s_addr:= InAddr_Any; // $00000000
    end;
    l_result:= Bind(L_server_socket_handle, l_address_socket_in,
        sizeof(l_address_socket_in));
    if l_result <> 0 then
    begin
      ServerStart := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    l_result:= Listen(L_server_socket_handle, MAXSOCKCOUNT);
    if l_result <> 0 then
    begin
      ServerStart := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
  end else
  begin
    for i := L_c_server_client_socket_list.Count - 1 downto 0 do
    begin
      TServerClientSocket(L_c_server_client_socket_list.Objects[i]).SocketClose;
      TServerClientSocket(L_c_server_client_socket_list.Objects[i]).Free;
    end;
    if L_server_socket_handle <> INVALID_SOCKET then
    begin
      l_result:= CloseSocket(L_server_socket_handle);
      if l_result = 0 then L_server_socket_handle:= INVALID_SOCKET;
    end;
    L_c_server_client_socket_list.Clear;
  end;
end;

procedure TServerWinSocket.WndProc(var Message: TMessage);
begin
  Dispatch ( Message );
end;

{ TClientSocket }

function TServerClientSocket.CheckPCClientDataPacket(aData: String;
  var bData: String): string;
var
  nIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
begin

  Result:= '';
  nIndex := pos(LINEEND,aData);
  if nIndex > 0 then
  begin
    Result := copy(aData,1,nIndex - 1);
    Delete(aData, 1, nIndex);
    bData:= aData;
  end;

end;

constructor TServerClientSocket.Create(AOwner: TComponent);
begin
  inherited;
  DeviceType := '1'; //PC <-> PC
  l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
  ClientSendPacketList := TStringList.Create;
  L_bClientSocketDestroy := False;
  LastReceiveTime := Now;         //연결 되면 바로 최종 수신 시간을 설정하자... 그래야 서버가 안 끊으니까...

  SendClientTimer:= TTimer.Create(nil);
  SendClientTimer.Interval := 10;
  SendClientTimer.OnTimer := SendClientTimerTimer;
  SendClientTimer.Enabled := True;
end;

destructor TServerClientSocket.Destroy;
begin
  L_bClientSocketDestroy := True;
  if m_socket_handle <> INVALID_SOCKET then m_socket_handle := INVALID_SOCKET;
  while L_bClientSending do    //혹시 전송중이면 타이머 종료 될때까지 기다리자
  begin
    sleep(1);
    Application.ProcessMessages;
  end;
  ClientSendPacketList.Clear;
  ClientSendPacketList.Free;
  SendClientTimer.Enabled := False;
  SendClientTimer.Free;

  inherited;
end;

procedure TServerClientSocket.SendClientTimerTimer(Sender: TObject);
var
  stSendData : string;
  l_result: Integer;
  stTemp : AnsiString ;
  nLen : integer;
  buf : Array of byte;
  i : integer;
begin
  Try
    if L_bClientSocketDestroy then Exit;

    SendClientTimer.Enabled := False;
    L_bClientSending := True;
    if ClientSendPacketList.Count < 1 then Exit;
    stSendData := ClientSendPacketList.Strings[0];
    ClientSendPacketList.Delete(0);
    //stTemp := UTF8Encode(stSendData);
    nLen := Length(stSendData);
    SetLength(buf, nLen);
    for i := 1 to nLen do
    begin
      buf[i-1] := ord(stSendData[i]);
    end;
    l_result:= Send(m_socket_handle,buf[0], nLen, 0);
    if Assigned(FOnServerSocketWrite) then
    begin
      OnServerSocketWrite(Self,m_socket_handle,ClientIP,stSendData,length(stSendData));
    end;
  Finally
    SendClientTimer.Enabled := Not L_bClientSocketDestroy;
    L_bClientSending := False;
  End;

end;

procedure TServerClientSocket.SocketClose;
var
  l_result : integer;
begin
  if m_socket_handle <> INVALID_SOCKET then
  begin
    l_result:= CloseSocket(m_socket_handle);
    if l_result = 0 then m_socket_handle := INVALID_SOCKET;
  end;
end;

procedure TServerClientSocket.SocketError(Sender: TObject;
  SocketError: Integer);
begin

end;

procedure TServerClientSocket.SocketPacketProcess;
var
  stLeavePacketData,stPacketData : string;
  nIndex : integer;
begin
  if DeviceType = '1' then   //PC <-> PC 간 전문
  begin
    nIndex := pos(LINEEND,L_ClientBuffer);
    if nIndex > 0 then
    begin
      repeat
        stPacketData:= CheckPCClientDataPacket(L_ClientBuffer,stLeavePacketData);
        L_ClientBuffer:= stLeavePacketData;
        if stPacketData <> '' then
        begin
          if Assigned(FOnServerSocketRead) then
          begin
            OnServerSocketRead(Self,m_socket_handle,ClientIP,stPacketData,length(stPacketData));
          end;
        end;
        Application.ProcessMessages;
      until pos(LINEEND,L_ClientBuffer) = 0;
    end;
  end;
end;

procedure TServerClientSocket.SocketRead;
var l_remaining: Integer;
    l_pt_start_reception: Pointer;
    l_packet_bytes: Integer;

    l_eol_position: Integer;
    l_file_name: String;
begin
  LastReceiveTime := Now;
  if l_c_reception_buffer = nil then Exit;
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
    l_packet_bytes:= Recv(m_socket_handle, l_pt_start_reception^, l_remaining, 0);
    if l_packet_bytes < 0 then SocketError(self,WSAGetLastError)
    else
    begin
      m_write_index:= m_write_index + l_packet_bytes;
      SocketReceive(self, l_pt_start_reception, l_packet_bytes);
    end;
  end;
end;

procedure TServerClientSocket.SocketReceive(Sender: TObject;
  Buf: PAnsiChar; var DataLen: Integer);
begin
  L_ClientBuffer := L_ClientBuffer + Buf;
  SocketPacketProcess;   
end;

procedure TServerClientSocket.SocketWrite(aData: string);
begin
  if ClientSendPacketList <> nil then ClientSendPacketList.Add(aData);
end;

end.
