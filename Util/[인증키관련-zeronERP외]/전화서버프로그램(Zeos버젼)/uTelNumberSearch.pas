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
  DXString, DXServerCore,IniFiles, IdUDPServer,IdSocketHandle;

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
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    TimerBufferSend: TTimer;
    tbi: TantTaskbarIcon;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
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
    N9: TMenuItem;
    SpeedButton1: TSpeedButton;
    IdUDPClient1: TIdUDPClient;
    IdUDPServer1: TIdUDPServer;
    ed_delay: TEdit;
    Label1: TLabel;
    CB_WCDMA: TLMDLabeledListComboBox;
    btn_WCDMAConnect: TBitBtn;
    WinsockWCDMA: TApdWinsockPort;
    ApdSLController2: TApdSLController;
    SMSTimer: TTimer;
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
    procedure N9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure ed_delayChange(Sender: TObject);
    procedure btn_WCDMAConnectClick(Sender: TObject);
    procedure WinsockWCDMATriggerAvail(CP: TObject; Count: Word);
    procedure SMSTimerTimer(Sender: TObject);
  private
    bApplicationTerminate : Boolean;
    L_stComBuffer : string;
    L_nSendCount : integer;
    L_stTelNumberBuffer :string;
    L_stDateBuffer:string;
    L_stTimeBuffer:string;
    L_bClose :Boolean;
    L_bPortOpen:Boolean;
    L_bWCDMAPortOpen:Boolean;
    L_nPortNumber : integer;
    L_nWCDMAPortNumber : integer;
    //L_stSendBuffer : string;
    BroadCastList:TStringList;
    { Private declarations }
    Function FullCheckData:Boolean;
    Function PortOpenConfigSet:Boolean;
    procedure PortOpen(aPort:integer);
    procedure PortWCDMAOpen(aPort:integer);
    procedure PortClose;
    procedure PortWCDMAClose;

    function InsertIntoTB_TELLIST(aDate,aTime,aTelNumber:string):boolean;
    function InsertIntoTB_SMSReceive(aTime,aRcvTelNumber,aSendTelNumber,aMessage:string):boolean;

    function  CheckClientDataPacket(aData:String; var bData:String):string;
    function  CheckTB_TELLIST(aDate,aTime,aTelNo:string):Boolean;
    procedure RcvFromClient(aClientIP,ast:string);   //클라이언트에서 수신된 데이터 처리
    procedure ModemSend(aData:string);
  private
    L_stServerPort : string;
    procedure GetTB_Config;
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
    procedure SendWCDMASocketData(aData:string);
    procedure SMSReceive(aMessageNo:string);
    procedure SMSReceiveMessage(aReceiveMessage:string);
    procedure SMSSend(aPhoneNumber,aMessage:string);
    function PhoneNumberPDU(aNumber:string):string;
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
  if btn_Connect.Caption = '해제' then
  begin
    PortClose;
    Exit;
  end;
  if Not IsDigit(copy(CB_SerialComm.Text,4,2)) then
  begin
    showmessage('포트설정이 잘못 되었습니다.');
    Exit;
  end;
  PortOpen(strtoint(copy(CB_SerialComm.Text,4,2)));

end;

procedure TForm1.SendSocketData(aData: string);
begin
  //if Not WinsockPort.Open then btn_ConnectClick(self);
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
  stDateBuffer : string;
  stTimeBuffer : string;
begin
  st:= '';
  stDateBuffer := '';

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
        Delete(L_stComBuffer,1,nPos + 1);
        if Pos('NMBR',stLine) > 0 then L_stTelNumberBuffer := stLine
        else if Pos('DATE',stLine) > 0 then  stDateBuffer := stLine
        else if Pos('TIME',stLine) > 0 then  stTimeBuffer := stLine;

        if stDateBuffer <> '' then
        begin
          nPos := Pos('=',stDateBuffer);
          if nPos > 0 then
            stDateBuffer := Trim(copy(stDateBuffer,nPos + 1,Length(stDateBuffer) - nPos));
          L_stDateBuffer := FormatDateTime('yyyy',now) + stDateBuffer;
        end;
        if stTimeBuffer <> '' then
        begin
          nPos := Pos('=',stTimeBuffer);
          if nPos > 0 then
            stTimeBuffer := Trim(copy(stTimeBuffer,nPos + 1,Length(stTimeBuffer) - nPos));
          L_stTimeBuffer := Trim(stTimeBuffer);
        end;

        if Trim(L_stTelNumberBuffer) <> '' then
        begin
          //nPos := Pos('NMBR',L_stTelNumberBuffer);
          //stTel := copy(L_stTelNumberBuffer,nPos + Length('NMBR'),Length(L_stTelNumberBuffer) - (nPos + Length('NMBR')) );
          stTel := stringReplace(L_stTelNumberBuffer,'NMBR','',[rfReplaceAll]);
          stTel := stringReplace(stTel,'=','',[rfReplaceAll]);
          stTel := Trim(stTel);
          //nPos := Pos('=',L_stTelNumberBuffer);
          //stTel := copy(L_stTelNumberBuffer,nPos + 1,Length(L_stTelNumberBuffer) - nPos + 1);
          TimerBufferSend.Enabled := True;

          if L_stDateBuffer = '' then
            L_stDateBuffer := FormatDateTime('yyyymmdd',now);
          if L_stTimeBuffer = '' then
            L_stTimeBuffer := FormatDateTime('hhnnss',now);
          memo_TelNo.Lines.Add('Add DATE=' + L_stDateBuffer);
          if Length(L_stTimeBuffer) < 6 then
          begin
            L_stTimeBuffer := L_stTimeBuffer + FormatDateTime('ss',now);
          end;
          BroadCastList.Add('NMBR=' + stTel + ',' + L_stDateBuffer + ',' + L_stTimeBuffer);
          if isdigit(ed_delay.Text) then
            Delay(strtoint(ed_delay.Text) * 1000);
          if CheckTB_TELLIST(L_stDateBuffer,L_stTimeBuffer,Trim(stTel)) then Exit;
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
      end else
      begin
        Delete(L_stComBuffer,1,nPos + 1);  
      end;
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
    ed_delay.Text := ReadString('설정','Delay','0');
    CB_WCDMA.ItemIndex:= ReadInteger('설정','WCDMAComNo',0);
  End;
  if L_bPortOpen then
  begin
    if CB_SerialComm.Items.Count < L_nPortNumber - 1 then
    begin
      CB_SerialComm.ItemIndex := L_nPortNumber - 1;
    end;
    PortOpen(L_nPortNumber);
  end;
  if L_bWCDMAPortOpen then
  begin
    if CB_WCDMA.Items.Count < L_nWCDMAPortNumber - 1 then
    begin
      CB_WCDMA.ItemIndex := L_nWCDMAPortNumber - 1;
    end;
    PortWCDMAOpen(L_nWCDMAPortNumber);
  end;
  HideTimer.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ExeFolder := ExtractFileDir(Application.ExeName);
  if Not DataModule1.DBConnect('zeron.co.kr','3307','zerp','zeron','zeronpass') then
  begin
    showmessage('인증키를 관리하려면 인터넷망에 접속되어야 합니다.');
    Application.Terminate;
  end;
  L_bClose := False;
  L_nSendCount := 0;
  BroadCastList:= TStringList.Create;
  BroadCastList.Clear;
  tbi.Visible := True;
  tbi.Hint := '전화번호서치프로그램기동';
  PortOpenConfigSet;
  GetTB_Config;
  if Not isDigit(L_stServerPort) then L_stServerPort := '4981';
  RSERVER1.ServerPort := strtoint(L_stServerPort);
  RSERVER1.Start;
  SMSTimer.Enabled := True;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bApplicationTerminate := True;
  Timer1.Enabled := False;
  SMSTimer.Enabled := False;
  TimerBufferSend.Enabled := False;
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
  Try
    Timer1.Enabled := False;
    if bApplicationTerminate then Exit;
    if BroadCastList.Count > 0 then
    begin
      IdUDPClient1.Broadcast(BroadCastList.Strings[0] + #$3 ,12345);
      DXUnicastDataQueue1.AddToQueue(BroadCastList.Strings[0] + #$3);
      BroadCastList.Delete(0);
    end;
  Finally
    Timer1.Enabled := Not bApplicationTerminate;
  End;

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
  stPortOpen : string;
  nPortNum : integer;
begin
  stPortOpen := '';
  stPortOpen := LMDIniCtrl1.ReadString('설정','PortOpen','TRUE');
  nPortNum := LMDIniCtrl1.ReadInteger('설정','ComNo',1);
  if stPortOpen = 'TRUE' then L_bPortOpen := True
  else L_bPortOpen := False;
  L_nPortNumber := nPortNum;

  stPortOpen := LMDIniCtrl1.ReadString('설정','WCDMAPortOpen','TRUE');
  nPortNum := LMDIniCtrl1.ReadInteger('설정','WCDMAComNo',1);
  if stPortOpen = 'TRUE' then L_bWCDMAPortOpen := True
  else L_bWCDMAPortOpen := False;
  L_nWCDMAPortNumber := nPortNum;

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
        LMDIniCtrl1.WriteString('설정','PortOpen','FALSE');
        ShowMessage('통신포트 를 확인하세요');
        Exit;
      end;
      Panel_ActiveClinetCount.Caption:=  'Com'+ CB_SerialComm.Text[4] + ' 연결대기';
      LMDIniCtrl1.WriteString('설정','PortOpen','TRUE');
      LMDIniCtrl1.WriteInteger('설정','ComNo',CB_SerialComm.ItemIndex);
      Delay(100);
      SendSocketData('ATS0=0'+#13+#10);
      Delay(100);
      SendSocketData('AT+GCI=61'+#13+#10);
      Delay(100);
      SendSocketData('AT+VCID=1'+#13+#10);
  end;
  btn_Connect.Caption := '해제';
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
  stSql := stSql + ' TL_TELNUMBER ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aTime + ''',';
  stSql := stSql + '''' + aTelNumber + ''') ';

  if Not DataModule1.DBConnect('zeron.co.kr','3307','zerp','zeron','zeronpass') then
  begin
    Exit;
  end;

  result := DataModule1.ProcessExecSQL(stSql);
  if result then memo_TelNo.Lines.Add('Add Success!!!')
  else memo_TelNo.Lines.Add('Add Fail!!!');
end;


procedure TForm1.N4Click(Sender: TObject);
begin
  BroadCastList.Clear;
  tbi.Hint := '전화번호서치프로그램중지';
  WinsockPort.Open := False;

  tbi.Hint := '전화번호서치프로그램기동';
  if Not DataModule1.DBConnect('zeron.co.kr','3307','zerp','zeron','zeronpass') then
  begin
//    showmessage('인증키를 관리하려면 인터넷망에 접속되어야 합니다.');
//    Application.Terminate;
  end;
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

  if stCMD = 'MODEMSEND' then ModemSend(stData +#13+#10)
  else
  begin
    BroadCastList.Add(stData);            //상태확인
    Timer1.Enabled := True;
  end;

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

procedure TForm1.N9Click(Sender: TObject);
var
  stExec:string;
begin
  stExec := ExtractFileDir(Application.ExeName) + '\SmartUpdate.exe';
  if FileExists(stExec) then
  begin
    IdUDPServer1.Active := False;
    RSERVER1.Stop;
    tbi.Visible := False;
    WinsockPort.Open := False;
    My_RunDosCommand(stExec,True,False);
    Close;
  end;

end;

procedure TForm1.GetTB_Config;
var
  stSql : string;
begin
  L_stServerPort := '4981';
  stSql := 'Select * From TB_CONFIG ';

  with DataModule1.ZTempQuery do
  begin
    close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      if FindField('CO_CODE').AsString = 'SERVERPORT' then
      begin
        L_stServerPort := FindField('CO_VALUE').AsString;
      end;
      Next;
    end;
  end;
  if Not IsDigit(L_stServerPort) then L_stServerPort := '4981';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
    IdUDPServer1.Active := False;
    IdUDPServer1.DefaultPort := 23456;
    IdUDPServer1.Active := True;

end;

procedure TForm1.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  RecvData : String;
  nIndex : integer;
  st,st2 : string;
begin
  DataStringStream := TStringStream.Create('');
  try
    DataStringStream.CopyFrom(AData, AData.Size);
    RecvData:=DataStringStream.DataString;
  finally
    DataStringStream.Free;
  end;
  {원격지에서 받은 데이터 처리 루틴추가}
  nIndex := pos(LINEEND,RecvData);
  if nIndex > 0 then
  begin
    repeat
      st:= CheckClientDataPacket(RecvData,st2);
      RecvData:= st2;
      if st <> '' then RcvFromClient('BROADCAST',st);
      Application.ProcessMessages;
    until pos(LINEEND,RecvData) = 0;
  end;

end;

procedure TForm1.PortClose;
begin
  with WinsockPort do
  begin
    ApdSLController1.Monitoring:= False;
    OPen:= False;
    Panel_ActiveClinetCount.Caption:=  'Com'+ CB_SerialComm.Text[4] + ' 연결끊기';
    LMDIniCtrl1.WriteString('설정','PortOpen','FALSE');
    LMDIniCtrl1.WriteInteger('설정','ComNo',CB_SerialComm.ItemIndex);
  end;
  btn_Connect.Caption := '연결';
end;

function TForm1.CheckTB_TELLIST(aDate, aTime, aTelNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * From TB_TELLIST ';
  stSql := stSql + ' Where TL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND mid(TL_TIME,1,4) = ''' + copy(aTime,1,4) + ''' ';
  stSql := stSql + ' AND TL_TELNUMBER  = ''' + aTelNo + ''' ';

  with DataModule1.ZTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then exit;
    result := True;
  end;

end;

procedure TForm1.ed_delayChange(Sender: TObject);
begin
    LMDIniCtrl1.WriteString('설정','Delay',ed_delay.Text); 
end;

procedure TForm1.btn_WCDMAConnectClick(Sender: TObject);
begin
  if btn_WCDMAConnect.Caption = '해제' then
  begin
    PortWCDMAClose;
    Exit;
  end;
  if Not IsDigit(copy(CB_WCDMA.Text,4,2)) then
  begin
    showmessage('포트설정이 잘못 되었습니다.');
    Exit;
  end;
  PortWCDMAOpen(strtoint(copy(CB_WCDMA.Text,4,2)));

end;

procedure TForm1.PortWCDMAOpen(aPort: integer);
begin
  with WinsockWCDMA do
  begin
      DeviceLayer:= dlWin32;
      Baud:= 115200;
      ComNumber:=  aPort;
      try
        ApdSLController2.Monitoring:= True;
        OPen:= True;
      except
        LMDIniCtrl1.WriteString('설정','WCDMAPortOpen','FALSE');
        ShowMessage('통신포트 를 확인하세요');
        Exit;
      end;
      LMDIniCtrl1.WriteString('설정','WCDMAPortOpen','TRUE');
      LMDIniCtrl1.WriteInteger('설정','WCDMAComNo',CB_WCDMA.ItemIndex);
      Delay(100);
      SendWCDMASocketData('ATE1'+#13);
      Delay(1000);
      SendWCDMASocketData('AT+CNMI=3,1,0,0,0' + #13);  //SMS 수신 모드
  end;
  btn_WCDMAConnect.Caption := '해제';
end;

procedure TForm1.SendWCDMASocketData(aData: string);
var
  stSendData : string;
  nLen : integer;
  nSendLen : integer;
  Tick: DWORD;
  i : integer;
begin
  if bApplicationTerminate then Exit;
  if Not WinsockWCDMA.Open then Exit;
  WinsockWCDMA.PutString(aData);
  Tick := GetTickCount + 10000;
  repeat
      Application.ProcessMessages;
      if GetTickCount > Tick then break;
  until WinsockWCDMA.OutBuffUsed = 0;

  memo_TelNo.Lines.Add('WCDMATX] ' + aData);
end;

procedure TForm1.WinsockWCDMATriggerAvail(CP: TObject; Count: Word);
var
  stTemp : string;
  i : integer;
  stMessageLength : string;
  nPos : integer;
  stReceiveMessage : string;
  stSCALength : string;
begin
  stTemp:= '';
  for I := 1 to Count do stTemp := stTemp + WinsockWCDMA.GetChar;
  memo_TelNo.Lines.Add('WCDMARX] ' + stTemp);

  nPos := Pos('+CMTI:',stTemp);
  if nPos > 0 then
  begin
    //SMS 수신 된경우이다.
    if nPos > 1 then Delete(stTemp,1,nPos - 1);
    Delete(stTemp,1,12); //Length('+CMTI: "ME",'));
    nPos := Pos(#$D,stTemp);
    stTemp := copy(stTemp,1,nPos-1);
    if isDigit(stTemp) then
    begin
      //메시지 수신 하자.
      SMSReceive(stTemp);
    end;
  end;
  nPos := Pos('+CMGR:',stTemp);
  if Pos('+CMGR:',stTemp) > 0 then   //메시지 수신 되는 경우이다.
  begin
    if nPos > 1 then Delete(stTemp,1,nPos - 1);
    Delete(stTemp,1,Length('+CMGR: '));
    stReceiveMessage := FindCharCopy(stTemp,2,',');
    nPos := Pos(#$D,stReceiveMessage);
    stMessageLength := copy(stReceiveMessage,1,nPos - 1);

    if isDigit(stMessageLength) then
    begin
      stSCALength := copy(stReceiveMessage,nPos + 2,2);
      stReceiveMessage := copy(stReceiveMessage,nPos + 2,(strtoint(stMessageLength) + Hex2Dec(stSCALength) + 1) * 2);
      SMSReceiveMessage(stReceiveMessage);
    end;

  end;
end;

procedure TForm1.PortWCDMAClose;
begin
  with WinsockWCDMA do
  begin
    ApdSLController2.Monitoring:= False;
    OPen:= False;
    LMDIniCtrl1.WriteString('설정','WCDMAPortOpen','FALSE');
    LMDIniCtrl1.WriteInteger('설정','WCDMAComNo',CB_WCDMA.ItemIndex);
  end;
  btn_WCDMAConnect.Caption := '연결';
end;

procedure TForm1.SMSSend(aPhoneNumber, aMessage: string);
var
 stSendData : string;
 stSMSData : string;
 stUDHL : string;
 stIED : string;
 stReturnNumber : string;
begin
  if Length(aPhoneNumber) <> 11 then Exit; //휴대폰 번호가 아니다.
  SendWCDMASocketData('AT+CMGF=0' + #13);
  Delay(1000);

  stSendData := '0051FF0BA1' ; //헤더
  stSendData := stSendData + PhoneNumberPDU(aPhoneNumber);
  stSendData := stSendData + '00'; //TP-PID
  stSendData := stSendData + '84'; //84 : KS5601 (한글), 00 : 7bit (ASCII),04 : 8bit (Octet)
  stSendData := stSendData + 'A7'; //SMSC 에 저장되어 있는 기간
  stReturnNumber := '01220046551';
  //stReturnNumber := '01098965497';
  stIED := Dec2Hex(Length(stReturnNumber),2); //발신신전화번호 길이
  stIED := stIED + 'A1';
  stIED := stIED + PhoneNumberPDU(stReturnNumber);
  stUDHL := '22';  //22 : 회신번호
  stUDHL := stUDHL + Dec2Hex(Length(stIED) div 2,2);
  stUDHL := stUDHL + stIED;
  stSMSData := Dec2Hex(Length(stUDHL) div 2,2);
  stSMSData := stSMSData + stUDHL;
  stSMSData := stSMSData + Ascii2Hex(aMessage);
  stSendData := stSendData + Dec2Hex(Length(stSMSData) div 2,2) + stSMSData;

  SendWCDMASocketData('AT+CMGS=' + inttostr(Length(stSendData) div 2 - 1) + #13);
  Delay(500);
  SendWCDMASocketData(stSendData);
  //SendPacket(Hex2Ascii(stSendData) + #13 + #10);
  Delay(500);
  SendWCDMASocketData(#13);
  Delay(500);
  SendWCDMASocketData(#$1A);   //CTRL+Z

end;

procedure TForm1.SMSTimerTimer(Sender: TObject);
var
  stSql : string;
  stUpdateSql : string;
begin
  if bApplicationTerminate then Exit;

  SMSTimer.Enabled := False;
  Try
    stSql := 'Select * From TB_SMS ';
    stSql := stSql + ' Where SM_STATE = ''N'' ';
    stSql := stSql + ' Order By SM_DATE ';

    with DataModule1.ZSMSQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then exit;
      While Not Eof do
      begin
        SMSSend(FindField('SM_PHONENUM').Asstring, FindField('SM_MESSAGE').Asstring);
        stUpdateSql := 'Update TB_SMS Set SM_STATE = ''Y'' where MA_USERID = ''' + FindField('MA_USERID').Asstring + ''' ';
        stUpdateSql := stUpdateSql + ' AND SM_DATE = ''' + FindField('SM_DATE').Asstring + ''' ';
        stUpdateSql := stUpdateSql + ' AND SM_PHONENUM = ''' + FindField('SM_PHONENUM').Asstring + ''' ';
        
        DataModule1.ProcessExecSQL(stUpdateSql);
        Next;
      end;
    end;
  Finally
    SMSTimer.Enabled := Not bApplicationTerminate;
  End;


end;

function TForm1.PhoneNumberPDU(aNumber: string): string;
var
  nLen : integer;
  stResult : string;
  i : integer;
begin
  stResult := '';
  nLen := length(aNumber);
  if nLen mod 2 <> 0 then aNumber := aNumber + 'F';
  nLen := length(aNumber);
  for i := 0 to (nLen div 2) - 1 do
  begin
    stResult := stResult + aNumber[i*2 + 2] + aNumber[i*2 + 1];
  end;
  result := stResult;
end;

procedure TForm1.SMSReceive(aMessageNo: string);
begin
  SendWCDMASocketData('AT+CMGR=' + aMessageNo + #13);
end;

procedure TForm1.SMSReceiveMessage(aReceiveMessage: string);
var
  stTemp : string;
  nTemp : integer;
  stReceiveTelNumber : string;
  stSendTelNumber : string;
  stSmsMessage : string;
  stSmsTime : string;
begin
  stTemp := copy(aReceiveMessage,1,2); //SCA Length
  nTemp := Hex2Dec(stTemp);
  Delete(aReceiveMessage,1,2);         //SCA Length삭제
  Delete(aReceiveMessage,1,nTemp * 2); //SCA Header 삭제
  Delete(aReceiveMessage,1,2);         //송신 문자메시지의 첫 번째 octet
  stTemp := copy(aReceiveMessage,1,2); //수신번호 길이
  nTemp := Hex2Dec(stTemp);
  Delete(aReceiveMessage,1,2);         //수신번호 길이삭제
  Delete(aReceiveMessage,1,2);         //A1 삭제
  if (nTemp mod 2) <> 0 then nTemp := nTemp + 1;
  stTemp := copy(aReceiveMessage,1,nTemp); //수신전화번호
  stReceiveTelNumber := stTemp;
  Delete(aReceiveMessage,1,nTemp);         //수신전화번호 삭제
  Delete(aReceiveMessage,1,2);         //TP-PID 삭제
  Delete(aReceiveMessage,1,2);         //TP-DCS 삭제  84 : KS5601 (한글),00 : 7bit (ASCII),04 : 8bit (Octet)
  stTemp := copy(aReceiveMessage,1,14); //sms수신시간
  stSmsTime := stTemp;
  Delete(aReceiveMessage,1,14);         //sms수신시간 삭제
  Delete(aReceiveMessage,1,2);          //TP-UDL 삭제
  Delete(aReceiveMessage,1,2);          //TP-UDHL 삭제
  Delete(aReceiveMessage,1,2);          //IEI 삭제
  Delete(aReceiveMessage,1,2);          //IEDL 삭제
  stTemp := copy(aReceiveMessage,1,2); //회신번호 길이
  nTemp := Hex2Dec(stTemp);
  Delete(aReceiveMessage,1,2);         //수신번호 길이삭제
  Delete(aReceiveMessage,1,2);         //A1 삭제
  if (nTemp mod 2) <> 0 then nTemp := nTemp + 1;
  stTemp := copy(aReceiveMessage,1,nTemp); //회신전화번호
  stSendTelNumber := stTemp;
  Delete(aReceiveMessage,1,nTemp);         //회신전화번호 삭제
  stSmsMessage := Hex2Ascii(aReceiveMessage);
  stReceiveTelNumber := PhoneNumberPDU(stReceiveTelNumber);
  stReceiveTelNumber := stringReplace(stReceiveTelNumber,'F','',[rfReplaceAll]);
  stSendTelNumber := PhoneNumberPDU(stSendTelNumber);
  stSendTelNumber := stringReplace(stSendTelNumber,'F','',[rfReplaceAll]);
  stSmsTime := PhoneNumberPDU(stSmsTime);
  stSmsTime := '20' + stSmsTime;
  InsertIntoTB_SMSReceive(stSmsTime,stReceiveTelNumber,stSendTelNumber,stSmsMessage);
end;


function TForm1.InsertIntoTB_SMSReceive(aTime, aRcvTelNumber,
  aSendTelNumber, aMessage: string): boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_SMSRECEIVE ( ';
  stSql := stSql + ' SM_TIME, ';
  stSql := stSql + ' SM_RCVTELNUM, ';
  stSql := stSql + ' SM_SENDTELNUM, ';
  stSql := stSql + ' SM_MESSAGE ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aTime + ''',';
  stSql := stSql + '''' + aRcvTelNumber + ''',';
  stSql := stSql + '''' + aSendTelNumber + ''',';
  stSql := stSql + '''' + aMessage + ''') ';

  if Not DataModule1.DBConnect('zeron.co.kr','3307','zerp','zeron','zeronpass') then
  begin
    Exit;
  end;

  result := DataModule1.ProcessExecSQL(stSql);
  if result then memo_TelNo.Lines.Add('Add Success!!!')
  else memo_TelNo.Lines.Add('Add Fail!!!');
end;

end.
