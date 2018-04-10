unit uTClientSocket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls;

type
  TConninfo = record
    serverip : string ;
    port : integer ;
  end ;

  TMySocket = class(TClientSocket)
    constructor create(AOwner : TComponent); override ;
    procedure myOnRead(Sender : TObject ; Socket : TCustomWinSocket) ;
    procedure myOnError(Sender : TObject ; Socket : TCustomWinSocket ;
                        ErrorEvent : TErrorEvent ; var ErrorCode : Integer) ;
    procedure myOnConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure myOnDisconnect(Sender: TObject; Socket: TCustomWinSocket);
  end ;

  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Client_connect(info : TConninfo) : boolean;
  end;


var
  Form1: TForm1;
  ClientSocket : TMySocket;
  RcvMsg: string;


implementation

{$R *.dfm}

{ TForm1 }

function TForm1.Client_connect(info: TConninfo): boolean;
begin
  try
    Result := true ;

    ClientSocket.Address    := info.serverip ;
    ClientSocket.Port       := info.port;

    ClientSocket.Open ;

  except

     // 이걸 써두 체크가 되는 것인지.. 

     // 예외처리,, 언제 봐도 이녀석이 작동을 하는건지 도대체 알수 없다
    ClientSocket.active := false ;
    Result := false ;
  end ;

end;

{ TMySocket }

constructor TMySocket.create(AOwner: TComponent);
begin
 inherited Create(AOwner);
  OnRead  := myOnRead ;
  OnError := myOnError ;
  OnConnect := myOnConnect ;
  OnDisConnect := myOnDisConnect ;

  ClientType := ctNonBlocking ;
  active := false ;


end;

procedure TMySocket.myOnConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
//
end;

procedure TMySocket.myOnDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
//
end;

procedure TMySocket.myOnError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  if ErrorCode = 10061 then
    showmessage('서버와의 접속이 끊어졌습니다. '+ ' 소켓에러 발생: '+IntToStr(ErrorCode));

  Socket.Close;
  ErrorCode := 0;

end;

procedure TMySocket.myOnRead(Sender: TObject; Socket: TCustomWinSocket);
var
  intReturnCode : integer;
  szBuffer: array[0..128] of Char;
begin
  RcvMsg := '';
  intReturnCode := 1;
  while (intReturnCode > 0) do
  begin
    FillChar(szBuffer, SizeOf(szBuffer), 0);
    intReturnCode := Socket.ReceiveBuf(szBuffer, SizeOf(szBuffer));
    if intReturnCode > 0 then
      RcvMsg := RcvMsg + szBuffer;
  end;

  Form1.Memo1.Lines.Add(RcvMsg);

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  info: TConninfo;
  bResult : Boolean;
begin
  info.serverip := '127.0.0.1';
  info.port := 23;
  bResult := Client_connect(info);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if ClientSocket.Socket.Connected then
  ClientSocket.Socket.SendText('DATE' + #13#10);

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if ClientSocket.Socket.Connected then
  ClientSocket.Socket.SendText('TIME'+ #13#10);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    ClientSocket := TMySocket.Create(nil);
end;

end.
