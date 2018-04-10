unit uCardServerModule;

interface

uses
  SysUtils, Classes, IdThreadMgr, IdThreadMgrDefault, IdBaseComponent,
  IdComponent, IdTCPServer, DXUnicastDataQueue, DXString, DXServerCore,
  SyncObjs,Forms,uCommonVariable;

const
  ConnectTime = 60000;
type
  TdmCardServer = class(TDataModule)
    RSERVER1: TDXServerCore;
    DXUnicastDataQueue1: TDXUnicastDataQueue;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure RSERVER1NewConnect(ClientThread: TDXClientThread);
  private
    FConnection : TCriticalSection;
    ConnectionList : TList;
    L_bServerStart : Boolean;
    FOnCardReceiveEvent: TSocketEvent;
    FOnEvent: TSocketEvent;
    { Private declarations }
    procedure PacketProcess(aIP,aPacket:string;ClientThread: TDXClientThread);
    function CheckClientDataPacket(aData:string;var aLeavePacket:string):string;
  public
    { Public declarations }
    procedure ServerStart(aServerPort: integer);
    procedure ServerStop;

  published
    property OnCardReceiveEvent:      TSocketEvent read FOnCardReceiveEvent       write FOnCardReceiveEvent;
    property OnEvent:      TSocketEvent read FOnEvent       write FOnEvent;
  end;

var
  dmCardServer: TdmCardServer;

implementation

{$R *.dfm}

{ TdmCardServer }

procedure TdmCardServer.ServerStart(aServerPort: integer);
begin
  RSERVER1.ServerPort := aServerPort;
  RSERVER1.Start;
  L_bServerStart := True; 
end;

procedure TdmCardServer.ServerStop;
var
  i : integer;
begin
  if Not L_bServerStart then Exit;
  Try
    FConnection.Enter;
    if ConnectionList.Count > 0 then
    begin
      for i := ConnectionList.Count - 1 downto 0 do
      begin
        Try
          TDXClientThread(ConnectionList.Items[i]).Socket.CloseNow;
          ConnectionList.Delete(i);
        Except
          continue;
        End;
      end;
    end;
  Finally
    FConnection.Leave;
  End;
  RSERVER1.Stop;
  L_bServerStart := False;   
end;

procedure TdmCardServer.DataModuleCreate(Sender: TObject);
begin
  FConnection := TCriticalSection.create;
  ConnectionList := TList.Create;
end;

procedure TdmCardServer.DataModuleDestroy(Sender: TObject);
begin
  if L_bServerStart then
     ServerStop;
  FConnection.Free;
  ConnectionList.Free;
end;

procedure TdmCardServer.RSERVER1NewConnect(ClientThread: TDXClientThread);
Var
   Ws:String;
   I: Integer;
   aIndex: Integer;
   StartTime:Comp;
   aLog: String;
   Sock: Integer;
   nIndex : integer;
   stPacket: string;
   stLeavePacket: string;
   stTemp : string;
   stIP : string;
begin
  if G_bApplicationTerminate then Exit;
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;

  if ConnectionList.IndexOf(ClientThread) < 0 then ConnectionList.Add(ClientThread);

  Try
    DXUnicastDataQueue1.AddSock(Sock);

    StartTime:=TimeCounter+ ConnectTime; //1분대기
    ws:='';

    While ClientThread.Socket.Connected and (not DXString.Timeout (StartTime) ) do
    Begin
      if Not L_bServerStart then Exit;
      If G_bApplicationTerminate then
      Begin
        Try
          Try
            FConnection.Enter;
            ClientThread.Socket.CloseNow;
            nIndex := ConnectionList.IndexOf(ClientThread);
            if nIndex > -1 then ConnectionList.Delete(nIndex);
          Finally
            FConnection.Leave;
          End;
        Except
        End;
        Exit;
      End;

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
          nIndex := pos(ETX,Ws);
          if nIndex > 0 then
          begin
            repeat
              stPacket:= CheckClientDataPacket(Ws,stLeavePacket);
              Ws:= stLeavePacket;
              if stPacket <> '' then
              begin
                PacketProcess(stIP,stPacket,ClientThread);
              end;
              Application.ProcessMessages;
            until pos(ETX,Ws) = 0;
          end;

        end;
        StartTime:=TimeCounter+ ConnectTime;
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
    Try
      FConnection.Enter;
      nIndex := ConnectionList.IndexOf(ClientThread);
      if nIndex > -1 then ConnectionList.Delete(nIndex);
    Finally
      FConnection.Leave;
    End;
  Except
  End;

end;

function TdmCardServer.CheckClientDataPacket(aData:string; var aLeavePacket: string): string;
var
  nIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
begin
  Result:= '';
  aLeavePacket := '';
  nIndex := pos(STX,aData);
  if nIndex = 0 then Exit; //STX 가 없으면 삭제
  if nIndex > 1 then Delete(aData,1,nIndex - 1); //STX 전까지 데이터 삭제
  nIndex := pos(ETX,aData);
  if nIndex = 0 then
  begin
    aLeavePacket := aData;
    Exit; //STX 가 없으면 데이터가 모두 들어오지 않은 상태
  end;
  if nIndex > 1 then
  begin
    Result := copy(aData,1,nIndex);
    Delete(aData, 1, nIndex + 1);
    aLeavePacket:= aData;
  end;
end;

procedure TdmCardServer.PacketProcess(aIP, aPacket: string;
  ClientThread: TDXClientThread);
var
  stDateTime : string;
  stCardNo : string;
begin
  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'RX',aPacket,aIP);
  end;
  if aPacket[2] = 'C' then
  begin
    stDateTime := copy(aPacket,3,14);
    stCardNo := copy(aPacket,17,8);
    if Assigned(FOnCardReceiveEvent) then
    begin
      OnCardReceiveEvent(Self,stCardNo,stDateTime,aIP);
    end;
  end;
  if (aPacket[2] = 'A') or
     (aPacket[2] = 'C') then
  begin
    ClientThread.Socket.Write(aPacket);
    if Assigned(FOnEvent) then
    begin
      OnEvent(Self,'TX',aPacket,aIP);
    end;
  end;
end;

end.
