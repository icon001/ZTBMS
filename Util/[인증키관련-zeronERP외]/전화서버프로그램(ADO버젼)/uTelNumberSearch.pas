unit uTelNumberSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomMaskEdit,
  LMDCustomExtCombo, LMDCustomListComboBox, LMDListComboBox, OoMisc,
  AdPort, AdWnPort, RzStatus, AdStatLt, ExtCtrls, RzPanel,
  LMDCustomComponent, LMDIniCtrl, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, Menus, antTaskbarIcon,Registry,DB, DXUnicastDataQueue,
  DXString, DXServerCore;

const
  LINEEND = #13;  //클라이언트에서 한문장의 끝을 알리는 데이터값
  DATADELIMITER = '^';

type
  TForm1 = class(TForm)
    WinsockPort: TApdWinsockPort;
    ApdSLController1: TApdSLController;
    RzStatusBar1: TRzStatusBar;
    Panel_ActiveClinetCount: TRzStatusPane;
    RzClockStatus1: TRzClockStatus;
    RXLight: TApdStatusLight;
    TXLight: TApdStatusLight;
    RzFieldStatus1: TRzFieldStatus;
    memo_TelNo: TMemo;
    Panel1: TPanel;
    CB_SerialComm: TLMDLabeledListComboBox;
    btn_Connect: TBitBtn;
    LMDIniCtrl1: TLMDIniCtrl;
    IdUDPClient1: TIdUDPClient;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    TimerBufferSend: TTimer;
    tbi: TantTaskbarIcon;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    miExit: TMenuItem;
    N3: TMenuItem;
    Ver011: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    HideTimer: TTimer;
    N4: TMenuItem;
    btn_PhoneOpen: TBitBtn;
    btn_PhoneClose: TBitBtn;
    btn_Call: TBitBtn;
    RSERVER1: TDXServerCore;
    DXUnicastDataQueue1: TDXUnicastDataQueue;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure btn_ConnectClick(Sender: TObject);
    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TimerBufferSendTimer(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miShowClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure HideTimerTimer(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure btn_PhoneOpenClick(Sender: TObject);
    procedure btn_PhoneCloseClick(Sender: TObject);
    procedure btn_CallClick(Sender: TObject);
    procedure RSERVER1NewConnect(ClientThread: TDXClientThread);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    bApplicationTerminate : Boolean;
    L_stComBuffer : string;
    L_nSendCount : integer;
    L_stTelNumberBuffer :string;
    L_stDateBuffer:string;
    L_stTimeBuffer:string;
    L_bClose :Boolean;
    L_bPortOpen:Boolean;
    L_nPortNumber : integer;
    //L_stSendBuffer : string;
    BroadCastList:TStringList;
    { Private declarations }
    Function FullCheckData:Boolean;
    Function PortOpenConfigSet:Boolean;
    procedure PortOpen(aPort:integer);

    function InsertIntoTB_TELLIST(aDate,aTime,aTelNumber:string):boolean;

    Function DBConnect:Boolean;

    function  CheckClientDataPacket(aData:String; var bData:String):string;
    procedure RcvFromClient(aClientIP,ast:string);   //클라이언트에서 수신된 데이터 처리
    procedure ModemSend(aData:string);
  private
{Detecting Windows Shutdown
To detect Windows Shutdown, you must trap WM_EndSession message. These steps should be taken: Declare a message handling
procedure in your Form's Private section: }
    procedure WMEndSession(var Msg : TWMEndSession); message WM_ENDSESSION;
{Detecting Windows shutdown
When Windows is shutting down, it sends a WM_QueryEndSession to all open applications. To detect (and prevent shutdown), you must
define a message handler to this message. Put this definition on the private section of the main form:}
    procedure WMQueryEndSession(var Msg : TWMQueryEndSession); message WM_QueryEndSession;


  protected
    procedure WndProc(var Msg: TMessage); override;
  public
    { Public declarations }
    procedure SendSocketData(aData:string);
  end;

var
  Form1: TForm1;

implementation

uses
  uLomosUtil,
  uDataModule1,
  uSearchConfig, uPhoneCall;

{$R *.dfm}

procedure TForm1.btn_ConnectClick(Sender: TObject);
begin
  if Not IsDigit(CB_SerialComm.Text[4]) then
  begin
    showmessage('포트설정이 잘못 되었습니다.');
    Exit;
  end;
  PortOpen(strtoint(CB_SerialComm.Text[4]));

end;

procedure TForm1.SendSocketData(aData: string);
begin
  if Not WinsockPort.Open then btn_ConnectClick(self);
  if Not WinsockPort.Open then Exit;
  WinsockPort.PutString(aData);

end;

procedure TForm1.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  st: string;
  i : integer;
  stLine : string;
  nPos : integer;
  stTel : string;
begin
  st:= '';

  for I := 1 to Count do st := st + WinsockPort.GetChar;
  memo_TelNo.Lines.Add(st);

  L_stComBuffer := L_stComBuffer + st;

  nPos := Pos(#13+#10,L_stComBuffer);
  while nPos <> 0 do
  begin
    if nPos > 0 then
    begin
      if nPos > 1 then
      begin
        stLine := copy(L_stComBuffer,1,nPos - 1);
        if Pos('NMBR',stLine) > 0 then L_stTelNumberBuffer := stLine
        else if Pos('DATE',stLine) > 0 then  L_stDateBuffer := stLine
        else if Pos('TIME',stLine) > 0 then L_stTimeBuffer := stLine;


        if Trim(L_stTelNumberBuffer) <> '' then
        begin
          nPos := Pos('=',L_stTelNumberBuffer);
          stTel := copy(L_stTelNumberBuffer,nPos + 1,Length(L_stTelNumberBuffer) - nPos + 1);
          TimerBufferSend.Enabled := True;
          L_stDateBuffer := FormatDateTime('yyyymmdd',now);
          L_stTimeBuffer := FormatDateTime('hhnnss',now);
          BroadCastList.Add(L_stTelNumberBuffer + ',' + L_stDateBuffer + ',' + L_stTimeBuffer);
          InsertIntoTB_TELLIST(L_stDateBuffer,L_stTimeBuffer,Trim(stTel));
          L_stTelNumberBuffer := '';
          L_stDateBuffer := '';
          L_stTimeBuffer := '';
          //TimerBufferSend.Enabled := False;
        end;
{        if FullCheckData then
        begin
          BroadCastList.Add(L_stTelNumberBuffer + ',' + L_stDateBuffer + ',' + L_stTimeBuffer);
          L_stTelNumberBuffer := '';
          L_stDateBuffer := '';
          L_stTimeBuffer := '';
          TimerBufferSend.Enabled := False;
        end;  }
        
      end;
      Delete(L_stComBuffer,1,nPos + 1);
    end;
    nPos := Pos(#13+#10,L_stComBuffer);
    Application.ProcessMessages;
  end;


end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  L_stComBuffer := '';
  L_stTelNumberBuffer := '';
  L_stDateBuffer:= '';
  L_stTimeBuffer:= '';

  with LMDIniCtrl1 do
  begin
    CB_SerialComm.ItemIndex:= ReadInteger('설정','ComNo',0);
  End;
  if L_bPortOpen then
  begin
    if CB_SerialComm.Items.Count < L_nPortNumber - 1 then
    begin
      CB_SerialComm.ItemIndex := L_nPortNumber - 1;
    end;
    PortOpen(L_nPortNumber);
  end;
  HideTimer.Enabled := True;
  RSERVER1.Start;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if Not DBConnect then
  begin
//    showmessage('인증키를 관리하려면 인터넷망에 접속되어야 합니다.');
//    Application.Terminate;
  end;
  L_bClose := False;
  L_nSendCount := 0;
  BroadCastList:= TStringList.Create;
  BroadCastList.Clear;
  tbi.Visible := True;
  tbi.Hint := '전화번호서치프로그램기동';
  PortOpenConfigSet;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bApplicationTerminate := True;
  RSERVER1.Stop;
  WinsockPort.Open := False;
  BroadCastList.Free;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    Visible := False;
    ShowWindow( Application.Handle, SW_HIDE );
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if BroadCastList.Count > 0 then
  begin
    IdUDPClient1.Broadcast(BroadCastList.Strings[0],194501);

    if L_nSendCount > 5 then
    begin
      L_nSendCount := 0;
      BroadCastList.Delete(0);
    end;
    inc(L_nSendCount);
  end;

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  stLine : string;
  nPos : integer;
begin
  L_stComBuffer := 'NMBR=01012122' + #13+#10 + 'DATE=0319' + #13+#10 + 'TIME=1632' ;

 nPos := Pos(#13+#10,L_stComBuffer);
  while nPos <> 0 do
  begin
    if nPos > 0 then
    begin
      if nPos > 1 then
      begin
        stLine := copy(L_stComBuffer,1,nPos - 1);
        if Pos('NMBR',stLine) > 0 then L_stTelNumberBuffer := stLine
        else if Pos('DATE',stLine) > 0 then  L_stDateBuffer := stLine
        else if Pos('TIME',stLine) > 0 then L_stTimeBuffer := stLine;
        TimerBufferSend.Enabled := True;

        if FullCheckData then
        begin
          BroadCastList.Add(L_stTelNumberBuffer + ',' + L_stDateBuffer + ',' + L_stTimeBuffer);
          L_stTelNumberBuffer := '';
          L_stDateBuffer := '';
          L_stTimeBuffer := '';
          TimerBufferSend.Enabled := False;
        end;
        
      end;
      Delete(L_stComBuffer,1,nPos + 1);
    end;
    nPos := Pos(#13+#10,L_stComBuffer);
    Application.ProcessMessages;
  end;


end;

procedure TForm1.TimerBufferSendTimer(Sender: TObject);
begin
  TimerBufferSend.Enabled := False;
  BroadCastList.Add(L_stTelNumberBuffer + ',' + L_stDateBuffer + ',' + L_stTimeBuffer);
  L_stTelNumberBuffer := '';
  L_stDateBuffer := '';
  L_stTimeBuffer := '';
end;

function TForm1.FullCheckData: Boolean;
begin
  result := False;
  if L_stTelNumberBuffer = '' then Exit;
  if L_stDateBuffer = '' then Exit;
  if L_stTimeBuffer = '' then Exit;
  result := True;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if L_bClose = False then
  Begin
    Visible := False;
    CanClose := False;
    ShowWindow( Application.Handle, SW_HIDE );
    Exit;
  End;  
end;

procedure TForm1.miShowClick(Sender: TObject);
begin
  Visible := True;
end;

procedure TForm1.miExitClick(Sender: TObject);
begin
  fmConfig:= TfmConfig.Create(Self);
  fmConfig.SHowmodal;
  fmConfig.Free;
end;

procedure TForm1.tbiDblClick(Sender: TObject);
var
   ptMouse : TPoint;
begin
{   SetForegroundWindow(Application.Handle);
   GetCursorPos(ptMouse);
   pmTest.Popup(ptMouse.X, ptMouse.Y); }
   Visible := True;
end;

procedure TForm1.HideTimerTimer(Sender: TObject);
begin
  if L_bClose then Exit;
  Visible:=False;
  HideTimer.Enabled:=False;

end;

function TForm1.PortOpenConfigSet: Boolean;
var
  FReg : TRegistry;
  stPortOpen : string;
  stPortNum : string;
begin
  stPortOpen := '';
  stPortNum := '';
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   if FReg.OpenKey('SOFTWARE\Zeron\TelNumberSearch\PortOpen', True) then
   begin
     stPortOpen := FReg.ReadString('PortOpen');
     stPortNum := FReg.ReadString('PortNum');
   end;
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 if stPortOpen <> '' then L_bPortOpen := True
 else L_bPortOpen := False;
 if IsDigit(stPortNum) then
 begin
  L_nPortNumber := strtoint(stPortNum);
 end else
 begin
  L_bPortOpen := False;
 end;


 result := True;
end;

procedure TForm1.PortOpen(aPort: integer);
begin
  with WinsockPort do
  begin
      DeviceLayer:= dlWin32;
      Baud:= 115200;
      WinsockPort.ComNumber:=  aPort;
      try
        ApdSLController1.Monitoring:= True;
        OPen:= True;
      except
        ShowMessage('통신포트 를 확인하세요');
        Exit;
      end;
      Panel_ActiveClinetCount.Caption:=  'Com'+ CB_SerialComm.Text[4] + ' 연결대기';
      LMDIniCtrl1.WriteInteger('설정','ComNo',CB_SerialComm.ItemIndex);
      Delay(100);
      SendSocketData('ATS0=0'+#13+#10);
      Delay(100);
      SendSocketData('AT+GCI=61'+#13+#10);
      Delay(100);
      SendSocketData('AT+VCID=1'+#13+#10);
  end;
end;

procedure TForm1.WMEndSession(var Msg: TWMEndSession);
begin
  if Msg.EndSession = True then
  begin
//
  end;

end;

procedure TForm1.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
//  if MessageDlg('Close Windows ?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
//    Msg.Result := 0
//  else
    Msg.Result := 1;

end;

procedure TForm1.WndProc(var Msg: TMessage);
begin
  inherited;
    if Msg.WParam = SC_MINIMIZE then
    begin
      Close;
    end;

end;

function TForm1.InsertIntoTB_TELLIST(aDate, aTime,
  aTelNumber: string): boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_TELLIST ( ';
  stSql := stSql + ' TL_DATE, ';
  stSql := stSql + ' TL_TIME, ';
  stSql := stSql + ' TL_TELNUM ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aTime + ''',';
  stSql := stSql + '''' + aTelNumber + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TForm1.DBConnect: Boolean;
var
  conStr : string;
begin
  result := false;
{  conStr := '';
  conStr := constr + 'Provider=SQLOLEDB.1;';
  conStr := constr + 'Password=sapasswd;';
  conStr := constr + 'Persist Security Info=True;';
  conStr := constr + 'User ID=sa;';
  conStr := constr + 'Initial Catalog=zeron;';
  conStr := constr + 'Data Source=127.0.0.1,1433' ;  }
  conStr := '';
  conStr := constr + 'Provider=SQLOLEDB.1;';
  conStr := constr + 'Password=zeronpass;';
  conStr := constr + 'Persist Security Info=True;';
  conStr := constr + 'User ID=zeron;';
  conStr := constr + 'Initial Catalog=zeron;';
  conStr := constr + 'Data Source=zeron.co.kr' ;

  with DataModule1.ADOConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          //ShowMessage('데이터베이스 접속 에러,네트웍 환경을 확인하세요.' );
          Exit;
        end;
    End;
  end;
  result := true;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  BroadCastList.Clear;
  tbi.Hint := '전화번호서치프로그램중지';
  WinsockPort.Open := False;

  tbi.Hint := '전화번호서치프로그램기동';
  DBConnect;
  PortOpenConfigSet;
  PortOpen(L_nPortNumber);
end;

procedure TForm1.btn_PhoneOpenClick(Sender: TObject);
begin
  SendSocketData('ATDT'+#13+#10);
end;

procedure TForm1.btn_PhoneCloseClick(Sender: TObject);
begin
  SendSocketData(''+#13+#10);
end;

procedure TForm1.btn_CallClick(Sender: TObject);
begin
  fmPhoneCall:= TfmPhoneCall.Create(Self);
  fmPhoneCall.showmodal;
  fmPhoneCall.free;

end;

procedure TForm1.RSERVER1NewConnect(ClientThread: TDXClientThread);
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
begin
  Sock:=ClientThread.Socket.Sock;
  DXUnicastDataQueue1.AddSock(Sock);

  StartTime:=TimeCounter+ 600000;
  ws:='';

  While ClientThread.Socket.Connected and (not DXString.Timeout (StartTime) ) do
  Begin
    If Application.Terminated then
    Begin
       ClientThread.Socket.CloseNow;
       Exit;
    End;

    If ClientThread.Socket.Readable then
    Begin
      If ClientThread.Socket.CharactersToRead=0 then
      begin
        Break;
      end else
      begin
        for I:= 1 to ClientThread.Socket.CharactersToRead do
        begin
          if bApplicationTerminate then Exit;
          Ws:= Ws + ClientThread.Socket.Read ;
        end;
        {원격지에서 받은 데이터 처리 루틴추가}
        nIndex := pos(LINEEND,Ws);
        if nIndex > 0 then
        begin
          repeat
            st:= CheckClientDataPacket(Ws,st2);
            Ws:= st2;
            if st <> '' then RcvFromClient(ClientThread.Socket.PeerIPAddress,st);
            Application.ProcessMessages;
          until pos(LINEEND,Ws) = 0;

        end;

      end;
      StartTime:=TimeCounter+ 600000;
    End
    Else Begin
       DoSleepEx(1);
       //Application.ProcessMessages;
       ProcessWindowsMessageQueue;
    end;
  end;
  DXUnicastDataQueue1.DelSock(Sock);

end;

function TForm1.CheckClientDataPacket(aData: String;
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
    Result := copy(aData,1,nIndex);
    Delete(aData, 1, nIndex);
    bData:= aData;
  end;

end;

procedure TForm1.RcvFromClient(aClientIP, ast: string);
var
  nIndex : integer;
  stCMD : string;
  stData : string;
begin
  nIndex := pos(DATADELIMITER,ast);
  stCMD := Trim(copy(ast,1,nIndex - 1));
  Delete(ast,1,nIndex);
  nIndex := pos(DATADELIMITER,ast);
  stData := copy(ast,1,nIndex - 1);
  Delete(ast,1,nIndex);

  if stCMD = 'MODEMSEND' then ModemSend(stData +#13+#10);            //상태확인

end;

procedure TForm1.ModemSend(aData: string);
begin
  SendSocketData(aData);
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  SendSocketData('ATDT'+#13+#10);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  SendSocketData(''+#13+#10);
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  fmPhoneCall:= TfmPhoneCall.Create(Self);
  fmPhoneCall.showmodal;
  fmPhoneCall.free;

end;

end.
