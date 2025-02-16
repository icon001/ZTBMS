unit uMonitoringServer;

interface

uses
  SysUtils, Classes, DXUnicastDataQueue, DXString, DXServerCore,Forms,SyncObjs,
  uDataModule1, ExtCtrls,WinSock,uWinSocket ;

const
  ClientConnectTime = 600000;
  AllSendClientDelayTime = 10;

type
  TClientReceiveThread = class(TThread)
  private
  protected
    procedure Execute; override;
    procedure ClientDataProcess(aData:string) ;
  public
  end;

  TdmMonitoringServer = class(TDataModule)
    RSERVER1: TDXServerCore;
    DXUnicastDataQueue1: TDXUnicastDataQueue;
    ControlServer: TDXServerCore;
    ControlDataQueue: TDXUnicastDataQueue;
    ServerStartTimer: TTimer;
    procedure RSERVER1NewConnect(ClientThread: TDXClientThread);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ControlServerNewConnect(ClientThread: TDXClientThread);
    procedure ServerStartTimerTimer(Sender: TObject);
  private
    WinsockServer : TServerWinSocket;
    ClientConnectList : TList;
    L_bMonitorServerStart : Boolean;
    FOnEvent: TKTTEvent;
    { Private declarations }
    function  CheckClientDataPacket(aData:String; var bData:String):string;
    procedure RcvServerSocketRead(Sender: TObject;aWinSocket:tSocket;ClientIP:string; Buf:String;DataLen: Integer);
  public
    FClientReceive : TCriticalSection;
    ClientReceiveDataList : TStringList;
    ClientReceiveThread :TClientReceiveThread;
    procedure ClientReceiveProcessStart;  //클라이언트 수신 쓰레드 생성
    procedure ClientReceiveProcessStop;   //클라이언트 수신 쓰레드 정지
  public
    { Public declarations }
    procedure ServerStart(ServerPort: integer);
    procedure ServerStop;
    procedure ControlServerStart(ServerPort: integer);
    procedure ControlServerStop;

    procedure MonitoringBroadCastData(aData:string);
    procedure ControlBroadCastData(aData:string);
  public
    procedure DBSocketInitialize;
    procedure DBSocketBroadCastData(aData:string);
    procedure DBSocketClear(aSeq:integer);
    function  GetLastDBSocketSerial:integer;
  public
    procedure RcvFromClient(aIP,aData:string);
  public
    property OnEvent:      TKTTEvent read FOnEvent       write FOnEvent;
  end;

var
  dmMonitoringServer: TdmMonitoringServer;

implementation


{$R *.dfm}

procedure TdmMonitoringServer.RSERVER1NewConnect(
  ClientThread: TDXClientThread);
Var
   Ws:String;
   I: Integer;
   aIndex: Integer;
   StartTime:Comp;
   aLog: String;
   Sock: Integer;
   nIndex : integer;
   st: string;
   st2: string;
   stTemp : string;
   stIP : string;
begin
  if G_bApplicationTerminate then Exit;
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;

  if ClientConnectList.IndexOf(ClientThread) < 0 then ClientConnectList.Add(ClientThread);

  Try
    DXUnicastDataQueue1.AddSock(Sock);

    StartTime:=TimeCounter+ ClientConnectTime;
    ws:='';

    While ClientThread.Socket.Connected and (not DXString.Timeout (StartTime) ) do
    Begin
      if Not L_bMonitorServerStart then Exit;
      If Application.Terminated then
      Begin
        Try
          ClientThread.Socket.CloseNow;
          nIndex := ClientConnectList.IndexOf(ClientThread);
          if nIndex > -1 then ClientConnectList.Delete(nIndex);
        Except
        End;
        Exit;
      End;
      if G_bApplicationTerminate then Exit;
      //If ForceAbort then Exit;
      stIP := ClientThread.Socket.PeerIPAddress;

      If ClientThread.Socket.Readable then
      Begin
        If ClientThread.Socket.CharactersToRead=0 then
        begin
          Break;
        end else
        begin
          for I:= 1 to ClientThread.Socket.CharactersToRead do
          begin
            if G_bApplicationTerminate then Exit;
            Ws:= Ws + ClientThread.Socket.Read ;
          end;
          {원격지에서 받은 데이터 처리 루틴추가}
          nIndex := pos(LINEEND,Ws);
          if nIndex > 0 then
          begin
            repeat
              st:= CheckClientDataPacket(Ws,st2);
              Ws:= st2;
              if st <> '' then
              begin
                //{
                stTemp := stIP + DATADELIMITER + st;
                Try
                  FClientReceive.Enter;
                  ClientReceiveDataList.Add(stTemp);
                Finally
                  FClientReceive.Leave;
                End; //} //여기서 로드가 걸리는것 같음...
                //RcvFromClient(stIP,st); //--이걸로 교체 함 2011.09.15
              end;
              Application.ProcessMessages;
            until pos(LINEEND,Ws) = 0;
          end;

        end;
        StartTime:=TimeCounter+ ClientConnectTime;
      End
      Else Begin
         DoSleepEx(1);
         //Application.ProcessMessages;
         ProcessWindowsMessageQueue;
      end;
    end;
  Finally
     DXUnicastDataQueue1.DelSock(Sock);
  End;
  Try
     nIndex := ClientConnectList.IndexOf(ClientThread);
     if nIndex > -1 then ClientConnectList.Delete(nIndex);
  Except
  End;

end;

procedure TdmMonitoringServer.DataModuleCreate(Sender: TObject);
begin
  FClientReceive := TCriticalSection.Create;

  ClientReceiveDataList := TStringList.Create;
  ClientConnectList := TList.Create;
  ClientConnectList.Clear;

  WinsockServer := TServerWinSocket.Create(self);
  WinsockServer.OnServerSocketRead := RcvServerSocketRead;

  ClientReceiveProcessStart;
end;

procedure TdmMonitoringServer.ServerStop;
var
  i : integer;
  nIndex : integer;
  ClientThread: TDXClientThread;
begin
  L_bMonitorServerStart := False;
  WinsockServer.ServerStart := False;
  (*
  if ClientConnectList.Count > 0 then
  begin
    for i := ClientConnectList.Count - 1 downto 0 do
    begin
      Try
        ClientThread := TDXClientThread(ClientConnectList.Items[i]);
        if ClientThread.Socket <> nil then
        begin
          //TDXClientThread(ClientConnectList.Items[i]).Socket.CloseNow;
          ClientThread.Socket.CloseNow;
        end;
        nIndex := ClientConnectList.IndexOf(ClientThread);
        if nIndex > -1 then ClientConnectList.Delete(nIndex);
      Except
        continue;
      End;
    end;
  end;
  RSERVER1.Stop;
  *)
end;

procedure TdmMonitoringServer.DataModuleDestroy(Sender: TObject);
begin
  ClientReceiveProcessStop;
  ClientConnectList.Free;
  ClientReceiveDataList.Free;
  
  DXUnicastDataQueue1.Free;
  ControlDataQueue.Free;
  RSERVER1.Free;
  ControlServer.Free;
  FClientReceive.Free;
  WinsockServer.Free;
end;

procedure TdmMonitoringServer.ServerStart(ServerPort: integer);
begin
  WinsockServer.ServerPort := ServerPort;
  WinsockServer.ServerStart := True;
  L_bMonitorServerStart := True;

//  RSERVER1.ServerPort := ServerPort;
//  ServerStartTimer.Enabled := True;
end;

function TdmMonitoringServer.CheckClientDataPacket(aData: String;
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

procedure TdmMonitoringServer.MonitoringBroadCastData(aData: string);
begin
  if Not L_bMonitorServerStart then Exit;
  //DXUnicastDataQueue1.AddToQueue(aData + LINEEND);
  WinsockServer.BroadCastDataSend(aData + LINEEND);
  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'Tx','BROAD',aData,'');
  end;
end;

procedure TdmMonitoringServer.ControlServerStart(ServerPort: integer);
begin
  ControlServer.ServerPort := ServerPort;
  ControlServer.Start;

end;

procedure TdmMonitoringServer.ControlServerStop;
begin
  ControlServer.Stop;
end;

procedure TdmMonitoringServer.ControlServerNewConnect(
  ClientThread: TDXClientThread);
Var
   Ws:String;
   I: Integer;
   aIndex: Integer;
   StartTime:Comp;
   aLog: String;
   Sock: Integer;
   nIndex : integer;
   st: string;
   st2: string;
   stIP : string;
   stTemp : string;
begin
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;
  ControlDataQueue.AddSock(Sock);
  StartTime:=TimeCounter+ ClientConnectTime;
  ws:='';

  While ClientThread.Socket.Connected and (not DXString.Timeout (StartTime) ) do
  Begin
    If Application.Terminated then
    Begin
       ClientThread.Socket.CloseNow;
       Exit;
    End;
    //If ForceAbort then Exit;
    stIP := ClientThread.Socket.PeerIPAddress;

    If ClientThread.Socket.Readable then
    Begin
      If ClientThread.Socket.CharactersToRead=0 then
      begin
        Break;
      end else
      begin
        for I:= 1 to ClientThread.Socket.CharactersToRead do
        begin
          if G_bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;

        {원격지에서 받은 데이터 처리 루틴추가}

        nIndex := pos(LINEEND,Ws);
        if nIndex > 0 then
        begin
          repeat
            st:= CheckClientDataPacket(Ws,st2);
            Ws:= st2;
            if st <> '' then
            begin
              Try
                FClientReceive.Enter;
                stTemp := stIP + DATADELIMITER + st;
                if ClientReceiveDataList.IndexOf(stTemp) < 0 then
                   ClientReceiveDataList.Add(stTemp);
              Finally
                FClientReceive.Leave;
              End;
            end;
            Application.ProcessMessages;
          until pos(LINEEND,Ws) = 0;

        end;

      end;
      StartTime:=TimeCounter+ ClientConnectTime;
    End
    Else Begin
       DoSleepEx(1);
       //Application.ProcessMessages;
       ProcessWindowsMessageQueue;
    end;
  end;
  ControlDataQueue.DelSock(Sock);

end;

procedure TdmMonitoringServer.ControlBroadCastData(aData: string);
begin
  ControlDataQueue.AddToQueue(aData + LINEEND);
  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'Tx','CBROAD',aData,'');
  end;
end;

procedure TdmMonitoringServer.ClientReceiveProcessStart;
begin
  if not(assigned(ClientReceiveThread)) then
  begin
     ClientReceiveThread := TClientReceiveThread.Create(true) ;
     ClientReceiveThread.Priority := tpTimeCritical;
  end;
  if (assigned(ClientReceiveThread)) and (ClientReceiveThread.Suspended  = true) then
  begin
   ClientReceiveThread.Resume ;
  end;

end;

procedure TdmMonitoringServer.ClientReceiveProcessStop;
begin
  Try
   if (assigned(ClientReceiveThread)) and (ClientReceiveThread.Suspended  = false) then
   begin
      ClientReceiveThread.Suspend ;
   end;
   // 쓰레드 객체 존재 확인
   if assigned(ClientReceiveThread) then
   begin
     // 스레드가 잠시 suspend 증 이면
     if ClientReceiveThread.Suspended  = true then
     begin
      ClientReceiveThread.Resume;
     end;
     //
     ClientReceiveThread.Terminate ;
     ClientReceiveThread.WaitFor ;
     ClientReceiveThread.Free ;
     ClientReceiveThread := nil ;
   end;
  Except
    ClientReceiveThread := nil ;
  End;
end;

procedure TdmMonitoringServer.RcvFromClient(aIP, aData: string);
begin
  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'Rx',aIP,aData,'');
  end;   
end;

{ TClientReceiveThread }

procedure TClientReceiveThread.ClientDataProcess(aData: string);
var
  stIP : string;
  nIndex : integer;
begin
  nIndex := pos(DATADELIMITER,aData);
  stIP := Trim(copy(aData,1,nIndex - 1));
  Delete(aData,1,nIndex);
  dmMonitoringServer.RcvFromClient(stIP,aData);
end;

procedure TClientReceiveThread.Execute;
var
  stTemp : string;
begin
  while not (self.Terminated) do
  begin
    if dmMonitoringServer.ClientReceiveDataList.Count > 0 then
    begin
      stTemp := dmMonitoringServer.ClientReceiveDataList.Strings[0];
      Try
        dmMonitoringServer.FClientReceive.Enter;
        dmMonitoringServer.ClientReceiveDataList.Delete(0);
      Finally
        dmMonitoringServer.FClientReceive.Leave;
      End;
      ClientDataProcess(stTemp);
    end;
    sleep(AllSendClientDelayTime) ;
  end;

end;

procedure TdmMonitoringServer.ServerStartTimerTimer(Sender: TObject);
begin
  ServerStartTimer.Enabled := False;
  Try
    RSERVER1.Start;
    L_bMonitorServerStart := True;
  Except
  End;

end;

procedure TdmMonitoringServer.DBSocketBroadCastData(aData: string);
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CLIENTSOCK(CSDATA) Values(''' + aData + ''')' ;
  DataModule1.ProcessLogExecSQL(stSql);
end;

procedure TdmMonitoringServer.DBSocketClear(aSeq: integer);
var
  stSql : string;
begin
  stSql := ' Delete From TB_CLIENTSOCK where SEQ < ' + inttostr(aSeq + 1) + ' ' ;
  DataModule1.ProcessLogExecSQL(stSql);
end;

function TdmMonitoringServer.GetLastDBSocketSerial: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := ' Select Max(SEQ) as seq from TB_CLIENTSOCK ';

  With DataModule1.ADODBSocketQuery do
  begin
    Close;
    Sql.text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := FindField('SEQ').asinteger;
  end;
end;

procedure TdmMonitoringServer.DBSocketInitialize;
var
  stSql : string;
begin
  stSql := 'Delete from TB_CLIENTSOCK ';
  DataModule1.ProcessLogExecSQL(stSql);
  if DBTYPE = 'MSSQL' then
  begin
    stSql := ' DBCC CHECKIDENT(''TB_CLIENTSOCK'',RESEED,0) ';
  end else if DBTYPE = 'PG' then
  begin
    stSql := 'select setval(''TB_CLIENTSOCK_SEQ_SEQ'',1,''f'') ';
  end;
  DataModule1.ProcessLogExecSQL(stSql);
end;

procedure TdmMonitoringServer.RcvServerSocketRead(Sender: TObject;
  aWinSocket: tSocket; ClientIP, Buf: String; DataLen: Integer);
var
  stTemp : string;
begin
  stTemp := ClientIP + DATADELIMITER + Buf;
  Try
    FClientReceive.Enter;
    ClientReceiveDataList.Add(stTemp);
  Finally
    FClientReceive.Leave;
  End;
end;

end.
