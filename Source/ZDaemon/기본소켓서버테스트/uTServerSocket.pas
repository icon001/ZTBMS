unit uTServerSocket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, RzStatus, ExtCtrls, RzPanel;

type
  TMyServerThread = class(TServerClientThread)
  public
   procedure ClientExecute; override;
  end;

  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    StatusBar1: TRzStatusBar;
    StatusPane1: TRzStatusPane;
    procedure ServerSocket1Accept(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ServerSocket1GetThread(Sender: TObject;
      ClientSocket: TServerClientWinSocket;
      var SocketThread: TServerClientThread);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    Function SendClientData(stData : string):Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ServerSocket1Accept(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusPane1.Caption := inttostr(ServerSocket1.Socket.ActiveConnections) + ' Connect';

end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  rcvText : string;
begin
  rcvText := ServerSocket1.Socket.ReceiveText;
  ServerSocket1.Socket.SendText(rcvText);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 ServerSocket1.Port:=23;  // Telnet Port
 ServerSocket1.ServerType:=stThreadBlocking;
 ServerSocket1.ThreadCacheSize:=10;

 ServerSocket1.Open;


end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ServerSocket1.Close; // 연결된 모든 Connection 을 닫고, ServerSocket 을 닫는

end;

procedure TForm1.ServerSocket1GetThread(Sender: TObject;
  ClientSocket: TServerClientWinSocket;
  var SocketThread: TServerClientThread);
var
 iMaxClient: Integer;
begin

 iMaxClient:=2000;

 if ServerSocket1.Socket.ActiveConnections>iMaxClient then
 begin
    ClientSocket.SendText('Sorry! Max Client Connected.'+#13#10);
    ClientSocket.Close;
 end
 else
 begin
    SocketThread := TMyServerThread.Create(False, ClientSocket);
 end;

end;

{ TMyServerThread }

procedure TMyServerThread.ClientExecute;
var
 Stream: TWinSocketStream;
 iTimeOut: Integer;
 InBuf, OutBuf: array [0..1024] of Char;
 Buffer, strCmd, strRet: String;
 i: Integer;
begin

 iTimeOut:=60000;

 try
   Stream := TWinSocketStream.Create(ClientSocket, iTimeOut);


   { Welcome Message .... }
{   if ClientSocket.Connected then
   begin
     FillChar(OutBuf, 1024, 0);
     StrPCopy(OutBuf, 'Welcome ! TimeServer written by Delphi.'+#13#10#13#10+
              'Method : TIME, DATE, QUIT'+#13#10#13#10);
     Stream.Write(OutBuf, StrLen(OutBuf));
   end;  }

   Buffer:='';
   while (not Terminated) and ClientSocket.Connected do
   begin

       if not Stream.WaitForData(iTimeOut) then
       begin
          ClientSocket.Close;
          Break;
       end;  

       try
          i:=Stream.Read(InBuf, 1024);
       except
          ClientSocket.Close;
          Break;
       end;

       if i = 0 then
       begin
         ClientSocket.Close;
         Break;
       end;

       InBuf[i]:=#0;
       Buffer:=Buffer+StrPas(InBuf);
       //Stream.Write(InBuf, StrLen(InBuf));  // Echo to Client

       i:=Pos(#13#10, Buffer);
       if i>0 then
       begin
          strCmd:=UpperCase(Copy(Buffer, 1, i-1));
          Buffer:='';

          if strCmd='DATE' then
             strRet:=FormatDateTime('yyyy-mm-dd', Now)
          else if strCmd='TIME' then
             strRet:=FormatDateTime('hh:nn:ss', Now)
          else if strCmd='QUIT' then
          begin
             StrPCopy(OutBuf, 'Good Bye !!!'+#13#10#0);
             Stream.Write(OutBuf, StrLen(OutBuf));
             ClientSocket.Close;
             Break;
          end
          else
             strRet:='Unknown Command.';

          StrPCopy(OutBuf, strRet+#13#10#0);
          Form1.SendClientData(OutBuf);
          //Stream.Write(OutBuf, StrLen(OutBuf));
       end;
   end;

 except
   HandleException;
 end;

 Stream.Free;
end;

procedure TForm1.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode:=0;
  Socket.Close;

end;

function TForm1.SendClientData(stData: string): Boolean;
var
  nConnection : integer;
begin
  for nConnection:=0 to ServerSocket1.Socket.ActiveConnections - 1 do
  begin
    //ServerSocket1.Socket.Connections[nConnection].SendBuf(stData);
    ServerSocket1.Socket.Connections[nConnection].SendText(stData);
  end;
end;

end.
