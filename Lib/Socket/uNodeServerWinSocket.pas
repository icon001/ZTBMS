unit uNodeServerWinSocket;

interface

uses
  SysUtils, Classes,Messages,WinSock,uDataModule1;

const
  wm_asynch_nodeselect= wm_User;
  NodeMAXSOCKCOUNT = 1000;

const Node_buffer_max= 4096;
      Node_tcp_ip_chunk= 1500;

type

  TdmNodeServerWinSock = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    L_wsa_data: twsaData;
    FOnWinSockAccept: TWinSockAccept;
    FServerPort: integer;
    FServerStart: Boolean;
    FOnWinSockStop: TWinSocketStop;
    FOnWinSockReadEvent: TWinSockReadEvent;
    FWinSocket: tSocket;
    FOnWinSockDisConnect: TWinSockDisConnect;
    procedure SetServerStart(const Value: Boolean);
    { Private declarations }
  private
    //Handle 积己 何盒
    FHandle : THandle;
    function HandleAllocated : Boolean;
    procedure HandleNeeded;
    function GetHandle: THandle;
    procedure WndProc ( var Message : TMessage ); virtual;
    procedure handle_wm_async_select(var Msg: TMessage); message wm_asynch_nodeselect;
    procedure handle_fd_accept_notification(p_socket: tSocket);
    procedure handle_fd_close_notification(p_socket: Integer);
    procedure handle_fd_read_notification(p_socket: tSocket);
    procedure handle_fd_write_notification(p_socket: Integer);
  public
    { Public declarations }
  published
    property Handle : THandle read GetHandle;
    property WinSocket : tSocket read FWinSocket write FWinSocket;      

    ProPerty ServerPort : integer read FServerPort write FServerPort;
    property ServerStart : Boolean read FServerStart write SetServerStart;
  published
    ProPerty OnWinSockAccept : TWinSockAccept read FOnWinSockAccept write FOnWinSockAccept;
    property OnWinSockDisConnect : TWinSockDisConnect read FOnWinSockDisConnect write FOnWinSockDisConnect;
    ProPerty OnWinSockStop : TWinSocketStop read FOnWinSockStop write FOnWinSockStop;
    property OnWinSockReadEvent : TWinSockReadEvent read FOnWinSockReadEvent write FOnWinSockReadEvent;
  end;

var
  dmNodeServerWinSock: TdmNodeServerWinSock;

implementation
uses
  uDevicemodule;
{$R *.dfm}

procedure TdmNodeServerWinSock.DataModuleCreate(Sender: TObject);
begin
  WinSocket:= Invalid_socket;
end;

procedure TdmNodeServerWinSock.DataModuleDestroy(Sender: TObject);
var
  i : integer;
  l_result : integer;
begin

  if WinSocket <> INVALID_SOCKET then
  begin
    l_result:= CloseSocket(WinSocket);
    if l_result = 0 then WinSocket:= INVALID_SOCKET;
    WSACleanup();
  end;

  if HandleAllocated
   then DeAllocateHWND ( FHandle );
   
end;

function TdmNodeServerWinSock.GetHandle: THandle;
begin
  HandleNeeded;
  Result := FHandle;
end;

function TdmNodeServerWinSock.HandleAllocated: Boolean;
begin
  Result := ( FHandle <> 0 );
end;

procedure TdmNodeServerWinSock.HandleNeeded;
begin
  if not HandleAllocated
   then FHandle := AllocateHWND ( WndProc );
end;

procedure TdmNodeServerWinSock.handle_fd_accept_notification(
  p_socket: tSocket);
var l_address_socket_in: tSockAddrIn;
    l_address_size: Integer;
    l_server_client_socket: tSocket;
    l_address_in: tSockAddrIn;
    l_size: Integer;
    nResult : integer;
    stConnectIP : string;
    nConnectPort : integer;
begin
  l_address_size:= sizeof(l_address_socket_in);
  l_server_client_socket:= Accept(p_socket, @l_address_socket_in, @l_address_size);
  l_size := sizeof(tSockAddr);
  GetPeerName(l_server_client_socket,tSockAddr(l_address_in), l_size); //tSockAddr(l_address_in), l_size);
  stConnectIP :=  inet_ntoa(l_address_in.sin_addr);
  nConnectPort :=  l_address_in.sin_port;

  if Assigned(FOnWinSockAccept) then  OnWinSockAccept(Self,l_server_client_socket,stConnectIP,nConnectPort);
end;

procedure TdmNodeServerWinSock.handle_fd_close_notification(
  p_socket: Integer);
begin
  if p_socket= WinSocket then
  begin
    //server should not receive much
  end else
  begin
    if Assigned(FOnWinSockDisConnect) then  OnWinSockDisConnect(Self,p_socket);
  end;
end;

procedure TdmNodeServerWinSock.handle_fd_read_notification(
  p_socket: tSocket);
var
  nIndex : integer;
  l_remaining: Integer;
  l_pt_start_reception: Pointer;
  l_packet_bytes: Integer;

  l_eol_position: Integer;
begin
  if p_socket= WinSocket then
  begin
    //server should not receive much
  end else
  begin
    if Assigned(FOnWinSockReadEvent) then  OnWinSockReadEvent(Self,p_socket);
  end;
end;

procedure TdmNodeServerWinSock.handle_fd_write_notification(
  p_socket: Integer);
begin
end;

procedure TdmNodeServerWinSock.handle_wm_async_select(var Msg: TMessage);
var
    l_param: Integer;
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

procedure TdmNodeServerWinSock.SetServerStart(const Value: Boolean);
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
      Exit;  //家南积己 角菩 矫俊 Open False
    end;
    WinSocket:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    if WinSocket= INVALID_SOCKET then
    begin
      ServerStart := False;
      Exit;  //家南积己 角菩 矫俊 Open False
    end;
    l_result:= wsaAsyncSelect(WinSocket, Handle,wm_asynch_select,FD_ACCEPT+ FD_READ+ FD_WRITE+ FD_CLOSE);
    if l_result<> 0 then
    begin
      ServerStart := False;
      Exit;  //家南积己 角菩 矫俊 Open False
    end;
    FillChar(l_address_socket_in, sizeof(l_address_socket_in), 0);
    with l_address_socket_in do
    begin
      sin_family:= af_Inet;
      sin_port:= hToNs(ServerPort);
      sin_addr.s_addr:= InAddr_Any; // $00000000
    end;
    l_result:= Bind(WinSocket, l_address_socket_in,
        sizeof(l_address_socket_in));
    if l_result <> 0 then
    begin
      ServerStart := False;
      Exit;  //家南积己 角菩 矫俊 Open False
    end;
    l_result:= Listen(WinSocket, MAXSOCKCOUNT);
    if l_result <> 0 then
    begin
      ServerStart := False;
      Exit;  //家南积己 角菩 矫俊 Open False
    end;
  end else
  begin
    if Assigned(FOnWinSockStop) then  OnWinSockStop(Self,WinSocket);
  end;
end;

procedure TdmNodeServerWinSock.WndProc(var Message: TMessage);
begin
  Dispatch ( Message );
end;

end.
