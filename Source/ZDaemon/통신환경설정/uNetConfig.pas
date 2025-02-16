unit uNetConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, RzLabel, RzPanel, Mask, RzEdit,
  Grids, RzRadGrp,WinSpool, OoMisc, AdPort, AdWnPort, AdStatLt, ComCtrls,
  DB, ADODB, RzCmboBx, RzButton, RzRadChk, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPServer, IdUDPClient,IdSocketHandle,AdSocket;

const
  nDelayTime = 3000;
  nUsedDevice = 16;
  BROADSERVERPORT = 5001;
  BROADCLIENTPORT = 1460;
  TCPCLIENTPORT = 1461;
type
  TfmNetConfig = class(TForm)
    GroupBox1: TGroupBox;
    pan_header: TPanel;
    rd_rs232: TRadioButton;
    rd_lan: TRadioButton;
    Notebook1: TNotebook;
    pan_rs232: TPanel;
    pan_Lan: TPanel;
    gr_rs232: TGroupBox;
    Label2: TLabel;
    ed_RMAC1: TRzEdit;
    ed_RMAC2: TRzEdit;
    ed_RMAC3: TRzEdit;
    ed_RMAC4: TRzEdit;
    ed_RMAC5: TRzEdit;
    ed_RMAC6: TRzEdit;
    RzGroupBox7: TRzGroupBox;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    ed_RLocalIP: TRzEdit;
    ed_RSunnet: TRzEdit;
    ed_RGateway: TRzEdit;
    ed_RLocalPort: TRzEdit;
    Panel1: TPanel;
    sg_WiznetList: TStringGrid;
    Group_RDevice: TRzCheckGroup;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    cmb_ComPort: TComboBox;
    btn_Rs232ConTest: TSpeedButton;
    st_Connected: TStaticText;
    btn_RSetting: TSpeedButton;
    btn_RClose: TSpeedButton;
    btn_LClose: TSpeedButton;
    btn_LSetting: TSpeedButton;
    WinsockPort: TApdWinsockPort;
    Off_Timer: TTimer;
    Label4: TLabel;
    ed_RMCUID: TEdit;
    ApdSLController1: TApdSLController;
    ReconnectSocketTimer: TTimer;
    StatusBar1: TStatusBar;
    Label5: TLabel;
    ed_LMCUID: TEdit;
    ADOTmpQuery: TADOQuery;
    GroupBox3: TGroupBox;
    RadioModeClient: TRadioButton;
    RadioModeServer: TRadioButton;
    RadioModeMixed: TRadioButton;
    RzLabel9: TRzLabel;
    Edit_ServerIp: TRzEdit;
    RzLabel10: TRzLabel;
    Edit_Serverport: TRzEdit;
    RzGroupBox9: TRzGroupBox;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    ComboBox_Boad: TRzComboBox;
    ComboBox_Databit: TRzComboBox;
    ComboBox_Parity: TRzComboBox;
    ComboBox_Stopbit: TRzComboBox;
    ComboBox_Flow: TRzComboBox;
    RzGroupBox10: TRzGroupBox;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    Edit_Time: TRzEdit;
    Edit_Size: TRzEdit;
    Edit_Char: TRzEdit;
    Edit_Idle: TRzEdit;
    Checkbox_Debugmode: TRzCheckBox;
    Checkbox_DHCP: TRzCheckBox;
    RzEdit1: TRzEdit;
    IdUDPServer1: TIdUDPServer;
    IdUDPClient1: TIdUDPClient;
    WiznetTimer: TTimer;
    Panel6: TPanel;
    pan_LanDetail: TPanel;
    Label3: TLabel;
    ed_LMAC3: TRzEdit;
    ed_LMAC1: TRzEdit;
    ed_LMAC2: TRzEdit;
    ed_LMAC4: TRzEdit;
    ed_LMAC5: TRzEdit;
    ed_LMAC6: TRzEdit;
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel8: TRzLabel;
    ed_LLocalIP: TRzEdit;
    ed_LSunnet: TRzEdit;
    ed_LGateway: TRzEdit;
    ed_LLocalPort: TRzEdit;
    Group_LDevice: TRzCheckGroup;
    chk_ZeronType: TCheckBox;
    chk_MCUChange: TCheckBox;
    cmb_MCU: TComboBox;
    btn_BroadSearch: TSpeedButton;
    procedure rd_rs232Click(Sender: TObject);
    procedure rd_lanClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure btn_LCloseClick(Sender: TObject);
    procedure btn_RCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_Rs232ConTestClick(Sender: TObject);
    procedure WinsockPortWsConnect(Sender: TObject);
    procedure WinsockPortWsDisconnect(Sender: TObject);
    procedure ReconnectSocketTimerTimer(Sender: TObject);
    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure btn_RSettingClick(Sender: TObject);
    procedure cmb_ComPortChange(Sender: TObject);
    procedure WinsockPortWsError(Sender: TObject; ErrCode: Integer);
    procedure Off_TimerTimer(Sender: TObject);
    procedure btn_BroadSearchClick(Sender: TObject);
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure sg_WiznetListClick(Sender: TObject);
    procedure btn_LSettingClick(Sender: TObject);
    procedure chk_MCUChangeClick(Sender: TObject);
  private
    SelectMAC :string;
    bNetConfigSet : Boolean;
    NETTYPE : string;
    { Private declarations }
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;
    Function WinsockPortOpen(aType:string):Boolean;
    procedure PrintLog(aMesg:string);
    function  CheckDataPacket(aData: String; var bData:String):String;
    function  DataPacektProcess( aData: string):Boolean;

    Procedure RegDataProcess(aData: String);  //등록 데이터 수신
    procedure RemoteDataProcess(aData: String); //원격 제어 데이터 수신
    Procedure AccessDataProcess(aData: String);  //출입통제 데이터
    Procedure ClearWiznetInfo;
    Procedure ClearLanInfo;
    procedure DetailWizNetList(aWiznetData:string);

    procedure ACC_sendData(aDeviceID:String; aData:String;aVer:string);
    procedure RcvDeviceID(aData: String);  //ID 등록 조회 응답
    Procedure RcvUsedDevice(aData,aRegGubun: String); // ECU 등록 응답
    Procedure RcvWiznetInfo(aData:String);   // LAN 모듈 설정 응답

    Procedure PollingAck(aDeviceID: String);
    Procedure Cnt_CheckVer(aDeviceID: String);
    function Check_ID:Boolean;
    Procedure CheckUsedDevice(aDeviceID,aCmd: String);
    procedure RegUsedDevice(aDeviceID,aCmd: String);

    procedure RS232LANSetting;
    procedure RegLanWiznet;  //UDP로 LAN 모듈 셋팅

    procedure FormInit;
    procedure MCULoad(cmb_Box:TComboBox);
  public
    { Public declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;
    function  SendPacket(aDeviceID: String;aCmd:Char; aData: String;aVer:string):Boolean;

    function UpdateTB_ACCESSDEVICE_RCV(aIp,aRcv:string):Boolean;
  end;

var
  fmNetConfig: TfmNetConfig;
  ComPortList : TStringList;
  MCUIDList : TStringList;
  bWizeNetLanRecv : Boolean; //랜모듈 읽기 성공 유무
  bCheckID : Boolean; //ID 체크 성공 유무
  DoCloseWinsock : Boolean;
  StopConnection : Boolean; //연결 해제 버튼시 True
  bConnected : Boolean;
  wiznetData : String;
  Sent_Ver : string;
  ComBuff : string;  //수신된 메시지 버퍼
  Rcv_MsgNo     : Char;
  Send_MsgNo    : Integer;
  MACADDR :string;
  NodeNo : string;
  MCUID : string;
  OffTimerCount : integer;

implementation

uses
uDataModule1,
uLomosUtil;
{$R *.dfm}

procedure TfmNetConfig.rd_rs232Click(Sender: TObject);
begin
  NoteBook1.PageIndex := 0;
end;

procedure TfmNetConfig.rd_lanClick(Sender: TObject);
begin
  NoteBook1.PageIndex := 1;
end;

procedure TfmNetConfig.Notebook1PageChanged(Sender: TObject);
begin
  pan_header.Caption := Notebook1.ActivePage;
end;

procedure TfmNetConfig.btn_LCloseClick(Sender: TObject);
begin
  if Not bNetConfigSet then
  begin
    if Application.MessageBox(Pchar('통신환경을 설정하지 않은 내역이 있습니다.' + #13 +
                       '통신환경 설정창을 종료하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
  end;
  Close;
end;

procedure TfmNetConfig.btn_RCloseClick(Sender: TObject);
begin
  if Not bNetConfigSet then
  begin
    if Application.MessageBox(Pchar('통신환경을 설정하지 않은 내역이 있습니다.' + #13 +
                       '통신환경 설정창을 종료하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
  end;
  Close;
end;

procedure TfmNetConfig.FormCreate(Sender: TObject);
var
  nCount : integer;
  i : integer;
begin
  bNetConfigSet := True;

  NETTYPE := 'TCPIP';
  rd_lan.Checked := True;
  Notebook1.PageIndex := 1;
  Notebook1PageChanged(self);

  MCUIDList := TStringList.Create;
  MCUIDList.Clear;
  ComPortList := TStringList.Create;
  ComPortList.Clear;
  nCount := GetSerialPortList(ComPortList);
  cmb_ComPort.Clear;
  btn_Rs232ConTest.Enabled := False;
  if nCount > 0 then
  begin
    for i:= 0 to nCount - 1 do
    begin
      cmb_ComPort.items.Add(ComPortList.Strings[i])
    end;
    cmb_ComPort.ItemIndex := 0;
    btn_Rs232ConTest.Enabled := True;
  end;
  Sent_Ver := 'K1';
  DoCloseWinsock := False;
  bConnected := False;
  StopConnection := False;
  ComBuff := '';
  MCUID := '';
  Forminit;
end;

function TfmNetConfig.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmNetConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Off_Timer.Enabled := False;
  ReconnectSocketTimer.Enabled := False;
  WiznetTimer.Enabled := False;

  WinsockPort.Open := False;
  ApdSLController1.Monitoring:= False;
  IdUDPClient1.Active := False;
  IdUDPServer1.Active := False;

  ComPortList.Destroy;
  Off_Timer.Destroy;
  ReconnectSocketTimer.Destroy;
  WiznetTimer.Destroy;

  WinsockPort.Destroy;
  ApdSLController1.Destroy;
  IdUDPClient1.Destroy;
  IdUDPServer1.Destroy;

end;

function TfmNetConfig.GetSerialPortList(List: TStringList;
  const doOpenTest: Boolean): LongWord;
type
 TArrayPORT_INFO_1 = array[0..0] Of PORT_INFO_1;
 PArrayPORT_INFO_1 = ^TArrayPORT_INFO_1;
var
{$IF USE_ENUMPORTS_API}
 PL : PArrayPORT_INFO_1;
 TotalSize, ReturnCount : LongWord;
 Buf : String;
 CommNum : WORD;
{$IFEND}
 I : LongWord;
 CHandle : THandle;
begin
 List.Clear;
{$IF USE_ENUMPORTS_API}
 EnumPorts(nil, 1, nil, 0, TotalSize, ReturnCount);
 if TotalSize < 1 then begin
    Result := 0;
    Exit;
    end;
 GetMem(PL, TotalSize);
 EnumPorts(nil, 1, PL, TotalSize, TotalSize, Result);

 if Result < 1 then begin
    FreeMem(PL);
    Exit;
    end;

 for I:=0 to Result-1 do begin
    Buf := UpperCase(PL^[I].pName);
    CommNum := DecodeCommportName(PL^[I].pName);
    if CommNum = 0 then Continue;
    List.AddObject(EncodeCommportName(CommNum), Pointer(CommNum));
    end;
{$ELSE}
 for I:=1 to MAX_COMPORT do List.AddObject(EncodeCommportName(I), Pointer(I));
{$IFEND}
 // Open Test
 if List.Count > 0 then for I := List.Count-1 downto 0 do begin
    CHandle := CreateFile(PChar(List[I]), GENERIC_WRITE or GENERIC_READ,
     0, nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL,
     0);
    if CHandle = INVALID_HANDLE_VALUE then begin
if doOpenTest or (GetLastError() <> ERROR_ACCESS_DENIED) then List.Delete(I);
Continue;
end;
    CloseHandle(CHandle);
    end;

 Result := List.Count;
{$IF USE_ENUMPORTS_API}
 if Assigned(PL) then FreeMem(PL);
{$IFEND}

end;

function TfmNetConfig.DecodeCommportName(PortName: String): WORD;
var
 Pt : Integer;
begin
 PortName := UpperCase(PortName);
 if (Copy(PortName, 1, 3) = 'COM') then begin
    Delete(PortName, 1, 3);
    Pt := Pos(':', PortName);
    if Pt = 0 then Result := 0
       else Result := StrToInt(Copy(PortName, 1, Pt-1));
 end
 else if (Copy(PortName, 1, 7) = '\\.\COM') then begin
    Delete(PortName, 1, 7);
    Result := StrToInt(PortName);
 end
 else Result := 0;

end;

function TfmNetConfig.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

procedure TfmNetConfig.btn_Rs232ConTestClick(Sender: TObject);
var
  stDeviceID : string;
  FirstTickCount: Longint;
begin
  st_Connected.Color := clBtnFace;
  Screen.Cursor:= crHourGlass;
  StopConnection := False;
  btn_Rs232ConTest.Enabled := False;
  NETTYPE :='RS232';
  if Not WinsockPort.Open then WinsockPortOpen(NETTYPE);
  bWizeNetLanRecv := False;
  wiznetData := '';
  MACADDR := '000000000000';
  if ed_RMCUID.Text = '' then stDeviceID := '000000000'
  else stDeviceID := ed_RMCUID.Text + '00';

  SendPacket(stDeviceID,'Q','NW00',Sent_Ver);

  FirstTickCount := GetTickCount + nDelayTime; //3초 대기
  While Not bWizeNetLanRecv do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;

  if Not bWizeNetLanRecv then
  begin
    st_Connected.Caption := 'DisConnected';
    btn_Rs232ConTest.Enabled := True;
    Screen.Cursor:= crDefault;
    showmessage('기기 응답이 없습니다.');
    Exit;
  end;
  bNetConfigSet := False;

  st_Connected.Caption := 'Connected';
  st_Connected.Color := clYellow;
  gr_rs232.Enabled := True;
  Screen.Cursor:= crDefault;
{
  Check_ID;

  bCheckUsedDevice := False;
  CheckUsedDevice(MCUID + '00','0');
  FirstTickCount := GetTickCount + nDelayTime; //3초 대기
  While Not bCheckUsedDevice do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;

  if Not bCheckUsedDevice then
  begin
    st_Connected.Caption := 'DisConnected';
    btn_Rs232ConTest.Enabled := True;
    showmessage('ECU 체크에 실패 하였습니다.');
  end;
  Screen.Cursor:= crDefault;
}
  btn_Rs232ConTest.Enabled := True;

end;

function TfmNetConfig.SendPacket(aDeviceID: String; aCmd: Char; aData,
  aVer: string): Boolean;
var
  ErrCode: Integer;
  ACKStr: String;
  ACKStr2: String;
  aDataLength: Integer;
  aLengthStr: String;
  aKey:Integer;
  aMsgNo: Integer;
  amsgData : String;
  st: string;
begin

  Result := False;
  if DoCloseWinsock then Exit;

  if not WinsockPort.Open then
  begin
    Off_Timer.Enabled:= False;
    OffTimerCount := 0;
    bConnected := False;
    ShowMessage('통신 연결이 안되었습니다.');
    Exit;
  end;
  bConnected := True;

  ErrCode:= 0;
  Result:= False;
  aDataLength:= 21 + Length(aData);
  aLengthStr:= FillZeroNumber(aDataLength,3);

  if aCmd = 'a' then {응답 처리}
  begin
    ACkStr:= STX +aLengthStr+  #$20+ aVer + aDeviceID+ aCmd+Rcv_MsgNo;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
    aKey:= $20;
    ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;
  end else           {제어 or 등록 }
  begin
    aMsgNo:= Send_MsgNo;
    ACkStr:= STX +aLengthStr+ #$20+ aVer + aDeviceID+ aCmd+InttoStr(aMsgNo) +aData;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
    aKey:= Ord(ACkStr[5]);
    ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;
    if aMsgNo >= 9 then  Send_MsgNo:= 0
    else                 Send_MsgNo:= aMsgNo + 1;
  end;

  //WinsockPort.FlushOutBuffer;
  WinsockPort.PutString(ACKStr2);

  Result:= True;
end;

procedure TfmNetConfig.WinsockPortWsConnect(Sender: TObject);
begin
  DoCloseWinsock := False;
  bConnected := True;
  ReconnectSocketTimer.Enabled := False;
end;

function TfmNetConfig.WinsockPortOpen(aType: string): Boolean;
begin
  Send_MsgNo:= 0;
  Rcv_MsgNo:='0';
  ComBuff:= '';
  with WinsockPort do
  begin
    ApdSLController1.Monitoring:= False;
    bConnected := False;
    OPen:= False;
    
    if UpperCase(aType) = 'RS232' then
    begin
      DeviceLayer:= dlWin32;
      Baud:= 38400;
      WinsockPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
      try
        ApdSLController1.Monitoring:= True;
        OPen:= True;
      except
        ShowMessage('통신포트 를 확인하세요');
        Exit;
      end;
      Delay(100);

    end else
    begin
      DeviceLayer:= dlWinsock;
      wsAddress:= ed_LLocalIP.Text;
      wsPort:=    ed_LLocalPort.Text;
      wsMode:= wsClient;
      try
        ApdSLController1.Monitoring:= True;
        OPen:= True;
      except
        ShowMessage('기기 IP 설정값을 확인하세요.');
        Exit;
      end;
      StopConnection:= False;
      Sleep(100);
    end;

  end;
end;

procedure TfmNetConfig.WinsockPortWsDisconnect(Sender: TObject);
begin
  bConnected := False;
  if ReconnectSocketTimer.Enabled then exit; // only do once

  if StopConnection then Exit;

  DoCloseWinsock := true;
  ReconnectSocketTimer.Enabled := true;
  gr_rs232.Enabled := False;
end;

procedure TfmNetConfig.ReconnectSocketTimerTimer(Sender: TObject);
begin
  if DoCloseWinsock then
  begin
    DoCloseWinsock:= False;
    WinsockPort.OPen:= False;
  end else
  begin
    ReconnectSocketTimer.Enabled:= False;
    WinsockPort.OPen:= True;
  end;
end;

procedure TfmNetConfig.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  st: string;
  st2: String;
  st3: String;
  aIndex: Integer;
  I: Integer;
  DataLength: Integer;
begin
  st:= '';

  for I := 1 to Count do st := st + WinsockPort.GetChar;

  PrintLog(st);

  
  ComBuff:= ComBuff + st;
  aIndex:= Pos(STX,ComBuff);  // STX 위치를 확인 한다.
  if aIndex = 0 then Exit    // STX가 없으면 루틴에서 나간다.
  else if aIndex > 1 then
  begin
    //SHowMessage(ComBuff);
    Delete(ComBuff,1,aIndex-1);  //STX위치가 1아니면 STX앞까지 삭제
  end;
  if Length(Combuff) < 21 then Exit;
  repeat
    st3:= CheckDataPacket(ComBuff,st2);

    ComBuff:= st2;
    if st <> '' then DataPacektProcess(st3);
    Application.ProcessMessages;
  until pos(ETX,comBuff) = 0;
end;

procedure TfmNetConfig.PrintLog(aMesg: string);
begin
  StatusBar1.Panels[0].Text := aMesg;
end;

function TfmNetConfig.CheckDataPacket(aData: String;
  var bData: String): String;
var
  aIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
begin

  Result:= '';
  Lenstr:= Copy(aData,2,3);
  //데이터 길이 위치 데이터가 숫자가 아니면...
  if not isDigit(Lenstr) then
  begin
    Delete(aData,1,1);       //1'st STX 삭제
    aIndex:= Pos(STX,aData); // 다음 STX 찾기
    if aIndex = 0 then       //STX가 없으면...
    begin
      //전체 데이터 버림
      bData:= '';
    end else if aIndex > 1 then // STX가 1'st가 아니면
    begin
      Delete(aData,1,aIndex-1);//STX 앞 데이터 삭제
      bData:= aData;
    end else
    begin
      bData:= aData;
    end;
    Exit;
  end;

  //패킷에 정의된 길이
  DefinedDataLength:= StrtoInt(Lenstr);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < DefinedDataLength then
  begin
    //실제 데이터가 길이가 작으면(아직 다 못받은 상태)
    etxIndex:= POS(ETX,aData);
    if etxIndex > 0 then
    begin
     Delete(aData,1,etxIndex);
    end;
    bData:= aData;
    Exit;
  end;

  // 정의된 길이 마지막 데이터가 ETX가 맞는가?
  if aData[DefinedDataLength] = ETX then
  begin
    StrBuff:= Copy(aData,1,DefinedDataLength);
    Result:=StrBuff;
    Delete(aData, 1, DefinedDataLength);
    bData:= aData;
  end else
  begin
    //마직막 데이터가 EXT가 아니면 1'st STX지우고 다음 STX를 찾는다.
    Delete(aData,1,1);
    aIndex:= Pos(STX,aData); // 다음 STX 찾기
    if aIndex = 0 then       //STX가 없으면...
    begin
      //전체 데이터 버림
      bData:= '';
    end else if aIndex > 1 then // STX가 1'st가 아니면
    begin
      Delete(aData,1,aIndex-1);//STX 앞 데이터 삭제
      bData:= aData;
    end else
    begin
      bData:= aData;
    end;
  end;
end;

function TfmNetConfig.DataPacektProcess(aData: string): Boolean;
var
  aKey: Byte;
  st: string;
  aCommand: Char;
  aCntId: String;
  amsgData : String;
  aVer : string;
begin
  Result:= False;
  if aData = '' then Exit;

  //31:Q++()./,-**s*S^**+()./,-()
  aKey:= Ord(aData[5]);
  st:= Copy(aData,1,5) + EncodeData(aKey,Copy(aData,6,Length(aData)-6))+aData[Length(aData)];
  aData:= st;
  aVer := copy(aData,6,2);
  aCntId:= Copy(aData,8,9);
  aCommand:= aData[17];
  Rcv_MsgNo:= aData[18];

  amsgData := Copy(aData,19,Length(aData)-21);

  st:=  WinsockPort.WsAddress +#9+
        Copy(aCntId,1,7)+#9+
        Copy(aCntId,8,2)+#9+
        aCommand+#9+
        amsgData+#9+
        'RX'+#9+
        aData;

  if  (aCommand = 'e') then
  begin
     PollingAck(aCntID);
  end else if (aCommand = 'a') then
  begin
    Exit;
  end else if (aCommand <> 'c') then
  begin
    if (aCommand <> '#') then
    begin
      if (aCommand <> '*') then SendPacket(aCntID,'a','',aVer);   //브로드캐스팅일때는 무시
    end;
  end;


  {받은 데이터 커맨드별 처리}
  { ================================================================================
  "A" = Alarm Data
  "I" = Initial Data
  "R" = Remote Command
  "e" = ENQ
  "E" = ERROR
  "a" = ACK
  "n" = NAK
  "r" = Remote Answer
  "c" = Access Control data
  ★ c(출입통제 데이터)인경우에는 ACK 를 'c' command를 만들어 응답을 해야 한다.
  즉 ACK 응답을 두번 주어야 한다.(①전체 패킷응답,②출입통제 응답)
   ================================================================================ }

  if aVer = 'K1' then
  begin
    //codesite.SendMsg(st);
    case aCommand of
//      'A':{알람}          begin  end;
      'i':{Initial}       begin  RegDataProcess(aData)    end;
//      'R':{Remote}        begin  RemoteDataProcess(aData) end;
//      'r':{Remote Answer} begin  RemoteDataProcess(aData) end;
//      'c':{출입통제}      begin  AccessDataProcess(aData) end;
//      'f':{펌웨어}        begin  FirmwareProcess(aData)   end;
//      'F':{펌웨어}        begin  FirmwareProcess2(aData)  end;
//      '*':{브로드캐스트}  begin  BroadCastProcess(aData)  end;
//      'E':{브로드캐스트에러} begin  BroadErrorProcess(aData) end;
//      'm':{관제데이터 모니터링 } begin PTMonitoringProcess(aData) end;
//      '#':{게이지 값 모니터링} begin GageMonitor(aData) end;
      'e':{ERROR}
      else {error 발생: [E003]정의 되지 않은 커맨드}
    end;
  end else if aVer = 'AD' then
  begin
//    case aCommand of
//      'i':{Initial}       begin  RegStateIndicateProcess(aData)    end;
//      'c':{출입통제}      begin  StateIndicateAccessDataProcess(aData) end;
//      else {error 발생: [E003]정의 되지 않은 커맨드}
//    end;
  end;

  Result:= True;
end;

procedure TfmNetConfig.RegDataProcess(aData: String);
var
  aDeviceCode: String;
  I: Integer;
  aRegCode: cString;
  aRegGubun : string;
begin
  aDeviceCode := Copy(aData, 8,7);
  if NETTYPE = 'RS232' then ed_RMCUID.Text := aDeviceCode
  else ed_LMCUID.Text := aDeviceCode;

  aRegCode:= Copy(aData,19,2);
  aRegGubun := Copy(aData,21,2);
  //40 K1123456700i1IF00제론시스템      61
  if aRegCode = 'ID' then
  begin
    RcvDeviceID(aData);
  end else if aRegCode = 'CD' then
  begin
//    RcvCR(aData);
  end else if aRegCode = 'SY' then
  begin
//    RcvSysinfo(aData);
  end else if aRegCode = 'RY' then
  begin
//    RcvRelay(aData)
  end else if aRegCode = 'LP' then
  begin
//    RcvPort(aData)
  end else if aRegCode = 'AD' then
  begin
//    RcvUsedAlarmdisplay(aData)
  end else if aRegCode = 'EX' then
  begin
    RcvUsedDevice(aData,aRegGubun)
  end else if aRegCode = 'TN' then
  begin
//    RcvTellNo(aData);
  end else if aRegCode = 'CT' then
  begin
//    RcvCallTime(aData);
  end else if aRegCode = 'BT' then
  begin
//    RcvbroadcastTime(aData);
  end else if aRegCode = 'DI' then
  begin
//    RcvDialInfo(aData);
  end else if aRegCode = 'DT' then
  begin
//    RcvControlDialInfo(aData);
  end else if aRegCode = 'NW' then
  begin
    ClearWiznetInfo;
    RcvWiznetInfo(aData)
  end else if aRegCode = 'VC' then
  begin
//    RcvVoiceTime(aData);
  end else if aRegCode = 'Id' then
  begin
//    RcvLinkusId(aData);
  end else if aRegCode = 'Tn' then
  begin
//    RcvLinkusTelNo(aData);
  end else if aRegCode = 'Pt' then
  begin
//    RcvLinkusPt(aData);
  end else if aRegCode = 'Rc' then
  begin
//    RcvRingCount(aData);
  end else if aRegCode = 'Ct' then
  begin
//    RcvCardType(aData);
  end else if aRegCode = '0@' then
  begin
//    RcvResetData(aData);
  end else if aRegCode = 'EL' then //존확장기 추가
  begin
//    RcvZoneExInfo(aData);
  end;

end;

procedure TfmNetConfig.RemoteDataProcess(aData: String);
var
  aCode: String;
  aGubun:string;
  st: string;
  aIndex: Integer;
  aType:String;
  aRelayNo: Integer;
  stRomVer : string;
  stECUID : string;
begin
  //037 K1123456700r1TM00050107180637EF
  aCode:= Copy(aData,19,2);
  aGubun:= Copy(aData,21,2);
  stECUID :=  copy(aData,15,2);
  if aCode = 'TM' then          //시간설정
  begin
    {Edit_TimeSync.Text:= Copy(aData,23,4)+'-'+  //년
                         Copy(aData,27,2)+'-'+  //월
                         Copy(aData,29,2)+' '+  //일
                         Copy(aData,31,2)+':'+  //시
                         Copy(aData,33,2)+':'+  //분
                         Copy(aData,35,2);      //초
    Edit_TimeSync2.Text := Edit_TimeSync.Text;}
  end else if aCode = 'VR' then //버젼확인
  begin
    stRomVer :=Copy(aData,23,Length(aData)-25);
  end else if aCode = 'CV' then
  begin
    //Label17.Caption:= 'Reader Ver:' + Copy(aData,23,Length(aData)-25);
  end else if aCode = 'RS' then //Reset
  begin
    {Edit_Reset.Text:= Copy(aData,23,Length(aData)-23);
    Edit_Reset2.Text := Edit_Reset.Text;}
  end else if aCode = 'MC' then   //Change mode
  begin
    {ComboBox_Zone.Color:= clYellow;
    RzComboBox1.Color:= ClYellow;
    st:= Copy(aData,21,2);
    if isDigit(st) then
    begin
      aIndex:=  StrtoInt(st);
      if aIndex >= ComboBox_Zone.Items.Count  then Exit;
      ComboBox_Zone.ItemIndex:= aIndex;
      ComboBox_Zone.Text:=ComboBox_Zone.Items[aIndex];
    end;

    case aData[23] of
      'A': RzComboBox1.ItemIndex:= 0;
      'D': RzComboBox1.ItemIndex:= 1;
      'P': RzComboBox1.ItemIndex:= 2;
    end;
    RzComboBox1.Text:= RzComboBox1.Items[RzComboBox1.ItemIndex];}
  end else if aCode = 'RN' then
  begin
    //Edit_Random.Text:= Copy(aData,23,Length(aData)-24);
  end else if aCode = 'RY' then
  begin
    {aType:= Copy(aData,23,2);
    if aType = 'SI' then
    begin
      if aData[25] = '1' then SHowMessage('싸이렌이 ON 되었습니다.')
      else                    SHowMessage('싸이렌이 OFF 되었습니다.')
    end else if aType = 'LP'then
    begin
      if aData[25] = '1' then SHowMessage('경광등이 ON 되었습니다.')
      else                    SHowMessage('경광등이 OFF 되었습니다.')
    end else
    begin
      if isDigit(aType) then
      begin
        aRelayNo:= StrtoInt(aType);
        cb_RelayNo.ItemIndex:= aRelayNo-1;
        if aData[25] = '1' then cb_RelayOnOff.ItemIndex:= 1
        else                    cb_RelayOnOff.ItemIndex:= 0;
      end;
    end;  }
  end else if aCode = 'Pt' then //
  begin
    {st:= Copy(aData,23,2);
    edPtDelayTime.Color:= clYellow;
    edPtDelayTime.Text:= st;}
  end else if aCode = 'Rd' then
  begin
   //SHowMessage('전화걸기 요청 응답'+#13+ Copy(aData,23,Length(aData)-24));
  end else if aCode = 'sc' then //
  begin
    {st:= Copy(aData,23,Length(aData)-25);
    ed_SortDisp.Color:= clYellow;
    ed_SortDisp.Text:= st;  }
  end else if aCode = 'CD' then
  begin
   { aType:= Copy(aData,21,2);
    if aType = '00' then Label141.Caption := copy(aData,23,Length(aData)-25)
    else if aType = '01' then Label142.Caption := copy(aData,23,Length(aData)-25); }
  end else if aCode = 'SM' then
  begin
   { if aGubun = '51' then
    begin
      if Copy(aData,23,5) = '00000' then stPTstate.Caption := 'OFF'
      else stPTstate.Caption := 'ON';
      lbl_PtMonitor.Caption := inttostr(strtoint(Copy(aData,23,5)));
    end; }
  end else if aCode = 'fp' then //FTP 사용 가능 유무
  begin
    //if aGubun = '90' then RcvFTPCheck(aData);
  end;
end;


procedure TfmNetConfig.AccessDataProcess(aData: String);
var
  DeviceID: String;
  st: string;
  msgCode: Char;
  accData: String;
  stVer : string;
begin

  // STX ~ 21's Byte :Header
  //040 K1123456700i1IFN00제론시스템      61

  //DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  DeviceID:= Copy(aData,8,9);
  stVer := copy(aData,6,2);

  accData:= Copy(aData,19,Length(aData)-20); //출입통제 위한 실제 데이터
  msgCode:= accData[1];

  {ACK 응답:출입과 DOOR}
  if (msgCode <> 'a') and (msgCode <> 'b') and (msgCode <> 'c') and
     (msgCode <> 'l') and (msgCode <> 'm') and (msgCode <> 'n')
  then
  begin
    st:='Y' + Copy(aData,20,2)+'  '+'a';
    //st:='Y' + '01'+'  '+'a';
    ACC_sendData(DeviceID, st,stVer);
  end;

  {출입통제 데이터 처리}
//0460K1100000400c2a51  005000000010000000009E
//  case msgcode of
//    'F': RcvTelEventData(accData);
//    'E': RcvAccEventData(accData);
//    'X': RcvAccXEventData(accData);
//    'D': RcvDoorEventData(accData);
//    'a': RcvSysinfo2(accData);        //기기 등록 응답
//    'b': RcvSysinfo2(accData);        //기기 조회 응답
//    'c': RcvAccControl(accData);      //기기 제어 응답
//'l','n','m': RcvCardRegAck(accData);  //카드등록응답
//'s','p': RcvSch(accData);             // 스케줄 응답
//    'v': RcvFoodTime(accData);        //식사시간응답
//  end;

  {
  제어내용             PC  <-> COntroller
  ====================================
  출입이벤트            #$90 <-> #$31
  DOOR 이벤트           #$90 <-> #32

  제어                  #$31 <-> #$41

  시스템정보 등록       #$50 <-> #$60
  시스템저보 조회       #$51 <-> #$61
  카드데이터 등록       #$52 <-> #$62
  카드데이터 조회       #$53 <-> #$63
  스케줄데이터 등록     #$56 <-> #$66
  스케줄데이터 조회     #$57 <-> #$67
  특정일데이터 등록     #$58 <-> #$68
  특정일데이터 조희     #$59 <-> #$69
  카드데이터(개별)등록  #$70 <-> #$80
  카드데이터(개별)조회  #$71 <-> #$81
  카드데이터(개별)삭제  #$72 <-> #$82
  ACK 전송              #$90
  }

end;

procedure TfmNetConfig.ACC_sendData(aDeviceID, aData: String;
  aVer: string);
begin
  SendPacket(aDeviceID,'c', aData,aVer);
end;


procedure TfmNetConfig.PollingAck(aDeviceID: String);
var
  ACKStr: String;
  ACKStr2: String;
  aDataLength: Integer;
  aLengthStr: String;
  aKey:Integer;
  st: string;
begin
  aDataLength:= 21;
  aLengthStr:= FillZeroNumber(aDataLength,3);

  ACkStr:= STX +aLengthStr+  #$20+Sent_Ver+ aDeviceID+ 'a'+Rcv_MsgNo;
  ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
  aKey:= $20;
  ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;

  //WinsockPort.FlushOutBuffer;
  WinsockPort.PutString(ACKStr2);
end;

procedure TfmNetConfig.RcvDeviceID(aData: String);
begin
  //40 K1123456700i1IF00제론시스템      61
  Delete(aData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  MCUID:=  Copy(aData,22,7);

  bCheckID := True;

end;


procedure TfmNetConfig.RcvUsedDevice(aData, aRegGubun: String);
var
  st: string;
  I: Integer;
begin
  Delete(aData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= Copy(aData,22,100);

  for I:= 1 to nUsedDevice - 1 do
  begin
    if st[I] = '1' then
    begin
     Group_RDevice.ItemChecked[I-1]:= True;
     Group_LDevice.ItemChecked[I-1]:= True;
    end
    else
    begin
      Group_RDevice.ItemChecked[I-1]:= False;
      Group_LDevice.ItemChecked[I-1]:= False;
    end;
  end;
  Cnt_CheckVer(MCUID+'00');
end;

procedure TfmNetConfig.FormInit;
var
  I : integer;
  st : string;
begin
  Group_RDevice.Items.Clear;
  Group_LDevice.Items.Clear;

  for I:= 0 to nUsedDevice - 1 do
  begin
    st:= FillZeroNumber(I,2) + '    ';
    Group_RDevice.Items.Add(st);
    Group_LDevice.Items.Add(st);
  end;

end;

procedure TfmNetConfig.ClearWiznetInfo;
begin

  ed_RLocalIP.Text:= '';
  ed_LLocalIP.Text:= '';
  ed_RSunnet.Text:= '';
  ed_LSunnet.Text:= '';
  ed_RGateway.Text:= '';
  ed_LGateway.Text:= '';
  ed_RLocalPort.Text:= '';
  //ed_LLocalPort.Text:= '';
  ed_RMAC1.Text:= '00';
  ed_RMAC2.Text:= '00';
  ed_RMAC3.Text:= '00';
  ed_RMAC4.Text:= '00';
  ed_RMAC5.Text:= '00';
  ed_RMAC6.Text:= '00';
  ed_LMAC1.Text:= '00';
  ed_LMAC2.Text:= '00';
  ed_LMAC3.Text:= '00';
  ed_LMAC4.Text:= '00';
  ed_LMAC5.Text:= '00';
  ed_LMAC6.Text:= '00';

  ed_RLocalIP.Color:= clWhite;
  ed_LLocalIP.Color:= clWhite;
  ed_RSunnet.Color:= clWhite;
  ed_LSunnet.Color:= clWhite;
  ed_RGateway.Color:= clWhite;
  ed_LGateway.Color:= clWhite;
  ed_RLocalPort.Color:= clWhite;
  ed_LLocalPort.Color:= clWhite;
  ed_RMAC1.Color:= clWhite;
  ed_RMAC2.Color:= clWhite;
  ed_RMAC3.Color:= clWhite;
  ed_RMAC4.Color:= clWhite;
  ed_RMAC5.Color:= clWhite;
  ed_RMAC6.Color:= clWhite;
  ed_LMAC1.Color:= clWhite;
  ed_LMAC2.Color:= clWhite;
  ed_LMAC3.Color:= clWhite;
  ed_LMAC4.Color:= clWhite;
  ed_LMAC5.Color:= clWhite;
  ed_LMAC6.Color:= clWhite;

end;

procedure TfmNetConfig.RcvWiznetInfo(aData: String);
var
  I: Integer;
  st,st2: String;
  DataStr:String;
  ErrorLog: String;
  FHeader:        String[2];
  FMacAddress:    String[12];
  FMode:          String[2];
  FIPAddress:     String[8];
  FSubnet:        String[8];
  FGateway:       String[8];
  FClientPort:    String[4];
  FServerIP:      String[8];
  FServerPort:    String[4];
  FSerial_Baud:   String[2];
  FSerial_data:   String[2];
  FSerial_Parity: String[2];
  FSerial_stop:   String[2];
  FSerial_flow:   String[2];
  FDelimiterChar: String[2];
  FDelimiterSize: String[4];
  FDelimitertime: String[4];
  FDelimiterIdle: String[4];
  FDebugMode:     String[2];
  FROMVer:        String[4];
  FOnDHCP:        String[2];
  FReserve:       String[4];

begin

  Delete(aData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  DataStr:= copy(aData,22,94);

  FHeader:=            Copy(DataStr, 1,2);
  FMacAddress:=        Copy(DataStr, 3,12);
  FMode:=              Copy(DataStr,15,2);
  FIPAddress:=         Copy(DataStr,17,8);
  FSubnet:=            Copy(DataStr,25,8);
  FGateway:=           Copy(DataStr,33,8);
  FClientPort:=        Copy(DataStr,41,4);
  FServerIP:=          Copy(DataStr,45,8);
  FServerPort:=        Copy(DataStr,53,4);
  FSerial_Baud:=       Copy(DataStr,57,2);
  FSerial_data:=       Copy(DataStr,59,2);
  FSerial_Parity:=     Copy(DataStr,61,2);
  FSerial_stop:=       Copy(DataStr,63,2);
  FSerial_flow:=       Copy(DataStr,65,2);
  FDelimiterChar:=     Copy(DataStr,67,2);
  FDelimiterSize:=     Copy(DataStr,69,4);
  FDelimitertime:=     Copy(DataStr,73,4);
  FDelimiterIdle:=     Copy(DataStr,77,4);
  FDebugMode:=         Copy(DataStr,81,2);
  FROMVer:=            Copy(DataStr,83,4);
  FOnDHCP:=            Copy(DataStr,87,2);
  FReserve:=           Copy(DataStr,89,6);

  //헤더가 aa이면 설정응답
  if FHeader = 'aa' then
  begin
    Exit;
  end;
  bWizeNetLanRecv:= True;

  Off_Timer.Enabled:= False;
  OffTimerCount := 0;

  MACADDR := FMacAddress;
  //2.MAC Address
  //RzEdit2.Text:=  FMacAddress;
  if UpperCase(NETTYPE) = 'RS232' then
  begin
    ed_RMAC1.Color:= clYellow;
    ed_RMAC2.Color:= clYellow;
    ed_RMAC3.Color:= clYellow;
    ed_RMAC4.Color:= clYellow;
    ed_RMAC5.Color:= clYellow;
    ed_RMAC6.Color:= clYellow;
    ed_RMAC1.Text:= Copy(FMacAddress,1,2);
    ed_RMAC2.Text:= Copy(FMacAddress,3,2);
    ed_RMAC3.Text:= Copy(FMacAddress,5,2);
    ed_RMAC4.Text:= Copy(FMacAddress,7,2);
    ed_RMAC5.Text:= Copy(FMacAddress,9,2);
    ed_RMAC6.Text:= Copy(FMacAddress,11,2);
  end else
  begin
    ed_LMAC1.Color:= clYellow;
    ed_LMAC2.Color:= clYellow;
    ed_LMAC3.Color:= clYellow;
    ed_LMAC4.Color:= clYellow;
    ed_LMAC5.Color:= clYellow;
    ed_LMAC6.Color:= clYellow;
    ed_LMAC1.Text:= Copy(FMacAddress,1,2);
    ed_LMAC2.Text:= Copy(FMacAddress,3,2);
    ed_LMAC3.Text:= Copy(FMacAddress,5,2);
    ed_LMAC4.Text:= Copy(FMacAddress,7,2);
    ed_LMAC5.Text:= Copy(FMacAddress,9,2);
    ed_LMAC6.Text:= Copy(FMacAddress,11,2);
  end;


  //3.Mode (Server mode: 01, Client mode: 00)
  //if FMode = '00' then Checkbox_Client.Checked:= True
  //else               Checkbox_Client.Checked:= False;

  if FMode = '00' then RadioModeClient.Checked:= True
  else if FMode = '02' then RadioModeServer.Checked:= True
  else                      RadioModeMixed.Checked:= True;

  // 4.IP address
  st2:= '';
  st:= Hex2Ascii(FIPAddress);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  ed_RLocalIP.Text:= st2;
  ed_RLocalIP.Color := clYellow;
//  ed_LLocalIP.Text:= st2;
//  ed_LLocalIP.Color := clYellow;

  // 5.Subnet mask
  st2:= '';
  st:= Hex2Ascii(FSubnet);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  ed_RSunnet.Text:= st2;
  ed_RSunnet.Color := clYellow;
//  ed_LSunnet.Text:= st2;
//  ed_LSunnet.Color := clYellow;

  // 6.Gateway address
  st2:= '';
  st:= Hex2Ascii(FGateway);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  ed_RGateway.Text:= st2;
  ed_RGateway.Color := clYellow;
//  ed_LGateway.Text:= st2;
//  ed_LGateway.Color := clYellow;

  //7.Port number (Client)
  st2:= Hex2DecStr(FClientPort);
  ed_RLocalPort.Text:= st2;
  ed_RLocalPort.Color := clYellow;
//  ed_LLocalPort.Text:= st2;
//  ed_LLocalPort.Color := clYellow;

  //8. Server IP address
  st2:= '';
  st:= Hex2Ascii(FServerIP);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_ServerIp.Text:= st2;

  //9.  Port number (Server)
  st2:= '';
  st2:= Hex2DecStr(FServerPort);
  Edit_Serverport.Text:= st2;

  //10. Serial speed (bps)
  if FSerial_Baud = 'A0' then ComboBox_Boad.ItemIndex:=0
  else if FSerial_Baud = 'D0' then ComboBox_Boad.ItemIndex:=1
  else if FSerial_Baud = 'E8' then ComboBox_Boad.ItemIndex:=2
  else if FSerial_Baud = 'F4' then ComboBox_Boad.ItemIndex:=3
  else if FSerial_Baud = 'FA' then ComboBox_Boad.ItemIndex:=4
  else if FSerial_Baud = 'FD' then ComboBox_Boad.ItemIndex:=5
  else if FSerial_Baud = 'FE' then ComboBox_Boad.ItemIndex:=6
  else if FSerial_Baud = 'FF' then ComboBox_Boad.ItemIndex:=7
  else ComboBox_Boad.ItemIndex:=-1;

  //11. Serial data size (08: 8 bit), (07: 7 bit)
  if FSerial_data = '07' then      ComboBox_Databit.ItemIndex:= 0
  else if FSerial_data = '08' then ComboBox_Databit.ItemIndex:= 1
  else                             ComboBox_Databit.ItemIndex:= -1;

  //12. Parity (00: No), (01: Odd), (02: Even)
  if FSerial_Parity = '00' then      ComboBox_Parity.ItemIndex:= 0
  else if FSerial_Parity = '01' then ComboBox_Parity.ItemIndex:= 1
  else if FSerial_Parity = '02' then ComboBox_Parity.ItemIndex:= 2
  else                               ComboBox_Parity.ItemIndex:= -1;

  //13. Stop bit
  if FSerial_stop = '01' then ComboBox_Stopbit.ItemIndex:= 0
  else                        ComboBox_Stopbit.ItemIndex:= -1;

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
  if FSerial_flow = '00' then ComboBox_Flow.ItemIndex:= 0
  else if FSerial_flow = '01' then ComboBox_Flow.ItemIndex:= 1
  else if FSerial_flow = '02' then ComboBox_Flow.ItemIndex:= 2
  else                             ComboBox_Flow.ItemIndex:= -1;


  //15. Delimiter char

  Edit_Char.Text:= FDelimiterChar;

  //16.Delimiter size
  st2:= '';
  st2:= Hex2DecStr(FDelimiterSize);
  Edit_Size.Text:= st2;


  //17. Delimiter time
  st2:= '';
  st2:= Hex2DecStr(FDelimitertime);
  Edit_Time.Text:= st2;

  //18.Delimiter idle time
  st2:= '';
  st2:= Hex2DecStr(FDelimiterIdle);
  Edit_Idle.Text:= st2;

  //19. Debug code (00: ON), (01: OFF)
  if FDebugMode = '00' then Checkbox_Debugmode.Checked:= True
  else                      Checkbox_Debugmode.Checked:= False;

  //20.Software major version
   st:= Hex2Ascii(FROMVer);
   RzEdit1.Text:= InttoStr(Ord(st[1]))+'.'+InttoStr(Ord(st[2]));

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
  if FOnDHCP = '01' then  Checkbox_DHCP.Checked:= True
  else if FOnDHCP = '00' then  Checkbox_DHCP.Checked:= False;

  ErrorLog:= '';

  if FMode <> Copy(wiznetData,15,2)then
     ErrorLog:= ErrorLog +'Mode:' +Copy(wiznetData,15,2) +'<>'+FMode+#13;
  if FIPAddress <> Copy(wiznetData,17,8) then
     ErrorLog:= ErrorLog +'IPAddress:' +Copy(wiznetData,17,8) +'<>'+FIPAddress+#13;
  if FSubnet <> Copy(wiznetData,25,8) then
     ErrorLog:= ErrorLog +'SubNet:' +Copy(wiznetData,25,8) +'<>'+FSubnet+#13;
  if FGateway <> Copy(wiznetData,33,8) then
     ErrorLog:= ErrorLog +'Gateway:' +Copy(wiznetData,33,8) +'<>'+FGateway+#13;
  if FClientPort <> Copy(wiznetData,41,4) then
     ErrorLog:= ErrorLog +'ClientPort:' +Copy(wiznetData,41,8) +'<>'+FClientPort+#13;
  if FServerIP <> Copy(wiznetData,45,8)then
     ErrorLog:= ErrorLog +'ServerIP:' +Copy(wiznetData,45,8) +'<>'+FServerIP+#13;
  if FServerPort <> Copy(wiznetData,53,4)then
     ErrorLog:= ErrorLog +'ServerPort:' +Copy(wiznetData,53,8) +'<>'+FServerPort+#13;
  if FSerial_Baud <> Copy(wiznetData,57,2)then
     ErrorLog:= ErrorLog +'Serial_Baud:' +Copy(wiznetData,57,2) +'<>'+FSerial_Baud+#13;
  if FSerial_data <> Copy(wiznetData,59,2)then
     ErrorLog:= ErrorLog +'Serial_data:' +Copy(wiznetData,59,2) +'<>'+FSerial_data+#13;
  if FSerial_Parity <> Copy(wiznetData,61,2)then
     ErrorLog:= ErrorLog +'Serial_Parity:' +Copy(wiznetData,61,2) +'<>'+FSerial_Parity+#13;
  if FSerial_stop <> Copy(wiznetData,63,2)then
     Errorlog:= Errorlog +'Serial_stop:' +Copy(wiznetData,63,2) +'<>'+FSerial_stop+#13;
  if FSerial_flow <> Copy(wiznetData,65,2)then
     Errorlog:= Errorlog +'Serial_flow:' +Copy(wiznetData,65,2) +'<>'+FSerial_flow+#13;
  if FDelimiterChar <> Copy(wiznetData,67,2)then
     Errorlog:= Errorlog +'DelimiterChar:' +Copy(wiznetData,67,2) +'<>'+FDelimiterChar+#13;
  if FDelimiterSize <> Copy(wiznetData,69,4)then
     Errorlog:= Errorlog +'DelimiterSize:' +Copy(wiznetData,69,2) +'<>'+FDelimiterSize+#13;
  if FDelimitertime <> Copy(wiznetData,73,4)then
     Errorlog:= Errorlog +'Delimitertime:' +Copy(wiznetData,73,4) +'<>'+FDelimitertime+#13;
  if FDelimiterIdle <> Copy(wiznetData,77,4)then
     Errorlog:= Errorlog +'DelimiterIdle:' +Copy(wiznetData,77,4) +'<>'+FDelimiterIdle+#13;
  if FDebugMode <> Copy(wiznetData,81,2) then
     Errorlog:= Errorlog +'DebugMode:' +Copy(wiznetData,81,4) +'<>'+FDebugMode+#13;
  {
  if FROMVer <> Copy(wiznetData,83,4)then
     Errorlog:= Errorlog +'ROMVer:' +Copy(wiznetData,83,4) +'<>'+FROMVer+#13;
  }
  if FOnDHCP <> Copy(wiznetData,87,2)then
     Errorlog:= Errorlog +'OnDHCP:' +Copy(wiznetData,87,4) +'<>'+FOnDHCP;
  if FReserve <> Copy(wiznetData,89,6) then
{  if (Errorlog <> '') and (WizNetRegMode = True) then
  begin
     Errorlog:= '설정값과 응답값이 틀립니다.' +#13+
                 '==========================='+#13+
                 '  설정값 < ===== > 응답값  '+#13+
                 '==========================='+#13+
                  Errorlog;
     SHowMessage(Errorlog);
  end else
  begin
    //SHowMessage('설정/조회 완료 되었습니다..');
  end;   }


end;

procedure TfmNetConfig.Cnt_CheckVer(aDeviceID: String);
begin
  SendPacket(aDeviceID,'R','VR00',Sent_Ver);
end;




function TfmNetConfig.Check_ID:Boolean;
var
  FirstTickCount : double;
begin
  result := False;
  ed_RMCUID.Text := '';
  ed_LMCUID.Text := '';
  bCheckID := False;
  SendPacket('000000000','Q','ID000000000',Sent_Ver); //ID Check
  FirstTickCount := GetTickCount + nDelayTime; //3초 대기
  While Not bCheckID do
  begin
    Application.ProcessMessages;
    if DoCloseWinsock then Break;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;

  result := bCheckID;
end;

procedure TfmNetConfig.CheckUsedDevice(aDeviceID, aCmd: String);
begin
  SendPacket(aDeviceID,'Q','EX0' + aCmd,Sent_Ver);
end;

procedure TfmNetConfig.btn_RSettingClick(Sender: TObject);
var
  FirstTickCount: Longint;
begin

  btn_RSetting.Enabled := False;
  btn_RClose.Enabled := False;

  bWizeNetLanRecv := False;
  if Not WinsockPort.Open then WinsockPortOpen('RS232');

  NETTYPE := 'RS232';
  UpdateTB_Config('DAEMON','NETTYPE',NETTYPE);
  bNetConfigSet := True;
  UpdateTB_ACCESSDEVICE_RCV('','N');
{
  OffTimerCount := 0;
  Off_Timer.Enabled := True;
  RS232LANSetting;

  FirstTickCount := GetTickCount + nDelayTime + 20000; //13초 대기
  While Not bWizeNetLanRecv do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;
  Off_Timer.Enabled := False;

  if Not bWizeNetLanRecv then
  begin
    st_Connected.Caption := 'DisConnected';
    btn_RSetting.Enabled := True;
    btn_RClose.Enabled := True;
    showmessage('설정에 실패 했습니다.');
    Exit;
  end;

  bCheckUsedDevice := False;
  RegUsedDevice(MCUID + '00','0');
  FirstTickCount := GetTickCount + nDelayTime ; //1초 대기
  While Not bCheckUsedDevice do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;
  if Not bCheckUsedDevice then
  begin
    st_Connected.Caption := 'DisConnected';
    btn_RSetting.Enabled := True;
    btn_RClose.Enabled := True;
    showmessage('ECU 등록에 실패 했습니다.');
    Exit;
  end;
  bNetConfigSet := True;
}
  btn_RSetting.Enabled := True;
  btn_RClose.Enabled := True;
end;

procedure TfmNetConfig.RS232LANSetting;
var
  I: Integer;
  No: Integer;
  st,st2: String;
  DataStr: String;
  aDeviceID: String;
  FHeader:         String[2];
  FMacAddress:    String[12];
  FMode:          String[2];
  FIPAddress:     String[8];
  FSubnet:        String[8];
  FGateway:       String[8];
  FClientPort:    String[4];
  FServerIP:      String[8];
  FServerPort:    String[4];
  FSerial_Baud:   String[2];
  FSerial_data:   String[2];
  FSerial_Parity: String[2];
  FSerial_stop:   String[2];
  FSerial_flow:   String[2];
  FDelimiterChar: String[2];
  FDelimiterSize: String[4];
  FDelimitertime: String[4];
  FDelimiterIdle: String[4];
  FDebugMode:     String[2];
  FROMVer:        String[4];
  FOnDHCP:        String[2];
  FReserve:       String[6];
begin
  //1.Header
  FHeader:= 'AA';
  //2.MAC Address 지정안함
  FMacAddress:='000000000000';
  //3.Mode (Server mode: 02, Client mode: 00)
  //if Checkbox_Client.Checked then FMode:= '00'
  //else                            FMode:= '01';
  {if RadioModeClient.Checked then FMode:= '00'
  else if RadioModeServer.Checked then FMode:= '02'
  else if RadioModeMixed.Checked then  FMode:= '01'; }
  FMode:= '02';  //무조건 서버 모드로 동작


  // 4.IP address
  st2:= '';
  if ed_RLocalIP.Text = '' then ed_RLocalIP.Text:= '0.0.0.0';
  for I:= 0 to 3 do
  begin
    st:= FindCharCopy(ed_RLocalIP.Text,I,'.');
    No:= StrToInt(st);
    st2:= st2 + Char(No);
  end;
  FIPAddress:= ToHexStrNoSpace(st2);

  // 5.Subnet mask
  st2:= '';
  if ed_RSunnet.Text = '' then ed_RSunnet.Text:= '0.0.0.0';
  for I:= 0 to 3 do
  begin
    st:= FindCharCopy(ed_RSunnet.Text,I,'.');
    No:= StrToInt(st);
    st2:= st2 + Char(No);
  end;
  FSubnet:= ToHexStrNoSpace(st2);

  // 6.Gateway address
  st2:= '';
  if ed_RGateway.Text = '' then ed_RGateway.Text:= '0.0.0.0';
  for I:= 0 to 3 do
  begin
    st:= FindCharCopy(ed_RGateway.Text,I,'.');
    No:= StrToInt(st);
    st2:= st2 + Char(No);
  end;
  FGateway:= ToHexStrNoSpace(st2);

  //7.Port number (Client)
  st2:= '';
  if ed_RLocalPort.Text = '' then ed_RLocalPort.Text:= '0';
  st2:='';
  st:= Dec2Hex(StrtoInt(ed_RLocalPort.Text),2);
  if Length(st) < 4 then st:= '0'+st;
  st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
  FClientPort:= ToHexStrNoSpace(st2);

  //8. Server IP address
  st2:= '';
  if Edit_ServerIp.Text = '' then Edit_ServerIp.Text:= '0.0.0.0';
  for I:= 0 to 3 do
  begin
    st:= FindCharCopy(Edit_ServerIp.Text,I,'.');
    No:= StrToInt(st);
    st2:= st2 + Char(No);
  end;
  FServerIP:= ToHexStrNoSpace(st2);

  //9.  Port number (Server)
  st2:= '';
  if Edit_Serverport.Text = '' then Edit_Serverport.Text:= '0';
  st2:='';
  st:= Dec2Hex(StrtoInt(Edit_Serverport.Text),2);
  if Length(st) < 4 then st:= '0'+st;
  st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
  FServerPort:= ToHexStrNoSpace(st2);

  //10. Serial speed (bps)
  {case ComboBox_Boad.ItemIndex of
    0: FSerial_Baud:= 'F4'; //9600           F4
    1: FSerial_Baud:= 'FA'; //19200          FA
    2: FSerial_Baud:= 'FD'; //38400 Default  FD
    3: FSerial_Baud:= 'FE'; //57600          FE
    4: FSerial_Baud:= 'FF'; //115200         FF
    else FSerial_Baud:= 'FD';
  end;  }
  FSerial_Baud:= 'FD';
  //11. Serial data size (08: 8 bit), (07: 7 bit)
  {case ComboBox_Databit.ItemIndex of
      0: FSerial_data:= '07';
      1: FSerial_data:= '08';
      else FSerial_data:= '08';
  end; }
  FSerial_data:= '08';
  //12. Parity (00: No), (01: Odd), (02: Even)
  {case ComboBox_Parity.ItemIndex of
    0: FSerial_Parity:= '00'; //None
    1: FSerial_Parity:= '01'; //Odd
    2: FSerial_Parity:= '02'; //Even
    else FSerial_Parity:= '00';
  end; }
  FSerial_Parity:= '00';
  //13. Stop bit
  FSerial_stop:= '01';

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
 { case ComboBox_Flow.ItemIndex  of
    0: FSerial_flow:= '00';
    1: FSerial_flow:= '01';
    2: FSerial_flow:= '02';
  end; }
  FSerial_flow:= '00';

  //15. Delimiter char
  if Edit_Char.Text ='' then Edit_Char.Text:= '00';
  FDelimiterChar:= Edit_Char.Text;

  //16.Delimiter size
  st2:= '';
  if Edit_Size.Text ='' then Edit_Size.Text:= '0';
  st2:='';
  st:= Dec2Hex(StrtoInt(Edit_Size.Text),2);
  st:=FillZeroStrNum(st,4);
  st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
  FDelimiterSize:= ToHexStrNoSpace(st2);

  //17. Delimiter time
  if Edit_Time.Text = '' then Edit_Time.Text:= '20';
  st2:='';
  st:= Dec2Hex(StrtoInt(Edit_Time.Text),2);
  st:=FillZeroStrNum(st,4);
  st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
  FDelimitertime:= ToHexStrNoSpace(st2);

  //18.Delimiter idle time
  if Edit_Idle.Text = '' then Edit_Idle.Text:= '0';
  st2:='';
  st:= Dec2Hex(StrtoInt(Edit_Idle.Text),2);
  st:=FillZeroStrNum(st,4);
  st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
  FDelimiterIdle:= ToHexStrNoSpace(st2);

  //19. Debug code (00: ON), (01: OFF)
  if Checkbox_Debugmode.Checked then FDebugMode:= '00'
  else                               FDebugMode:= '01';

  //20.Software major version
  FROMVer:='0000';

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
  if Checkbox_DHCP.Checked then FOnDHCP:= '01'
  else                          FOnDHCP:= '00';

  //22.Reserved for future use
  FReserve:= '000000';

  DataStr:= FHeader+
            FMacAddress+
            FMode+
            FIPAddress+
            FSubnet+
            FGateway+
            FClientPort+
            FServerIP+
            FServerPort+
            FSerial_Baud+
            FSerial_data+
            FSerial_Parity+
            FSerial_stop+
            FSerial_flow+
            FDelimiterChar+
            FDelimiterSize+
            FDelimitertime+
            FDelimiterIdle+
            FDebugMode+
            FROMVer+
            FOnDHCP+
            FReserve;
  WiznetData:= DataStr;

  aDeviceID:= MCUID + '00';
  {
  SHowMessage(FHeader+#13+
              FMacAddress+#13+
              FMode+#13+
              FIPAddress+#13+
              FSubnet+#13+
              FGateway+#13+
              FClientPort+#13+
              FServerIP+#13+
              FServerPort+#13+
              FSerial_Baud+#13+
              FSerial_data+#13+
              FSerial_Parity+#13+
              FSerial_stop+#13+
              FSerial_flow+#13+
              FDelimiterChar+#13+
              FDelimiterSize+#13+
              FDelimitertime+#13+
              FDelimiterIdle+#13+
              FDebugMode+#13+
              FROMVer+#13+
              FOnDHCP+#13+
              FReserve+#13+
            '길이:'+InttoStr(Length(DataStr)));
  }
  if  Length(aDeviceID) < 9 then
  begin
    aDeviceID:= '000000000';
  end;
  SendPacket(aDeviceID,'I','NW00'+DataStr,Sent_Ver);

end;

procedure TfmNetConfig.RegUsedDevice(aDeviceID, aCmd: String);
var
  st: string;
  I: Integer;
  DeviceID: String;
begin
{}
  st:='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  if UpperCase(NetType) = 'RS232' then
  begin
    for I:= 1 to Group_RDevice.Items.Count-1 do
    begin
      if Group_RDevice.ItemChecked[I] then st[I+1]:= '1';
    end;
  end else
  begin
    for I:= 1 to Group_LDevice.Items.Count-1 do
    begin
      if Group_LDevice.ItemChecked[I] then st[I+1]:= '1';
    end;
  end;
  SendPacket(aDeviceID,'I','EX0' + aCmd +st,Sent_Ver);
end;

procedure TfmNetConfig.cmb_ComPortChange(Sender: TObject);
begin
  StopConnection := True;
  WinsockPort.Open := False;
end;

procedure TfmNetConfig.WinsockPortWsError(Sender: TObject;
  ErrCode: Integer);
begin
  bConnected := False;
  if ReconnectSocketTimer.Enabled then exit; // only do once

  if StopConnection then Exit;

  DoCloseWinsock := true;
  ReconnectSocketTimer.Enabled := true;
  gr_rs232.Enabled := False;

end;

procedure TfmNetConfig.Off_TimerTimer(Sender: TObject);
var
  st: string;
  I: Integer;
  aDeviceID:String;
begin

  if not WinsockPort.Open then
  begin
    //if not ISDwonLoad then Off_Timer.Enabled:= False;
    Exit;
  end;

  if OffTimerCount >= 1 then
  begin
      SendPacket(MCUID + '00','Q','NW00',Sent_Ver);
  end;
  inc(OffTimerCount);
end;

procedure TfmNetConfig.btn_BroadSearchClick(Sender: TObject);
var
  nRow : integer;
  nCol : integer;
begin
  bNetConfigSet := False;
  with sg_WiznetList do
  begin
    for nRow := 1 to RowCount - 1 do
    begin
      for nCol := 0 to ColCount - 1 do
      begin
        Cells[nCol,nRow] := '';
      end;
    end;
    RowCount := 2;
  end;
  wiznetData:= '';
  ClearWiznetInfo;

  IdUDPServer1.Active := False;
  IdUDPServer1.DefaultPort := BROADSERVERPORT;
  IdUDPServer1.Active := True;

  IdUDPClient1.Broadcast('FIND',BROADCLIENTPORT);
  bNetConfigSet := False;
end;

procedure TfmNetConfig.ClearLanInfo;
begin
  ed_LMAC1.Text := '00';
  ed_LMAC2.Text := '00';
  ed_LMAC3.Text := '00';
  ed_LMAC4.Text := '00';
  ed_LMAC5.Text := '00';
  ed_LMAC6.Text := '00';

  ed_LLocalIP.Text:= '';
  ed_LSunnet.Text:= '';
  ed_LGateway.Text:= '';
  //ed_LLocalPort.Text:= '';
  ComboBox_Boad.Text:= '';
  ComboBox_Databit.Text:= '';
  ComboBox_Parity.Text:= '';
  ComboBox_Stopbit.Text:= '';
  ComboBox_Flow.Text:= '';
  Edit_Time.Text:= '';
  Edit_Size.Text:= '';
  Edit_Char.Text:= '';
  Edit_Idle.Text:= '';
  Edit_ServerIp.Text:= '';
  Edit_Serverport.Text:= '';
  Checkbox_Debugmode.Checked:= False;
  Checkbox_DHCP.Checked:= False;
  RadioModeMixed.Checked:= True;
  pan_LanDetail.Enabled := False;
end;

procedure TfmNetConfig.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  RecvData : String;
  S,st : string;
  MAcStr : string;
  nRow : integer;
  bSearch : Boolean;
begin
  DataStringStream := TStringStream.Create('');
  try
    DataStringStream.CopyFrom(AData, AData.Size);
    RecvData:=DataStringStream.DataString;
  finally
    DataStringStream.Free;
  end;

  WiznetTimer.Enabled:= False;

  S:= RecvData;

  if  Length(S) < 47 then Exit;

  {MAC Address}

  if (copy(S,1,4) <> 'IMIN') and (copy(S,1,4) <> 'SETC')
     and (copy(S,1,4) <> 'LNDT') and (copy(S,1,4) <> 'LNSD')
  then Exit;

  WiznetData:= S;
  bWizeNetLanRecv := True; //조회 모드에서만

  if bNetConfigSet then Exit;

  if (copy(S,1,4) = 'IMIN') or (copy(S,1,4) <> 'SETC') then chk_ZeronType.Checked := False
  else chk_ZeronType.Checked := True;

  st:= copy(S,5,6);
  MAcStr:= ToHexStrNoSpace(st);
  MAcStr:=  Copy(MAcStr,1,2) + ':' +
            Copy(MAcStr,3,2) + ':' +
            Copy(MAcStr,5,2) + ':' +
            Copy(MAcStr,7,2) + ':' +
            Copy(MAcStr,9,2) + ':' +
            Copy(MAcStr,11,2);
  with sg_WiznetList do
  begin
    bSearch := False;
    for nRow := 1 to RowCount - 1 do
    begin
      if cells[0,nRow] = MAcStr then
      begin
        cells[0,nRow] := MAcStr ;
        cells[1,nRow] := WiznetData;
        sg_WiznetList.Row := nRow;
        DetailWizNetList(WiznetData);
        bSearch := True;
        bWizeNetLanRecv := True; //설정 값 리턴
      end;
    end;
    if Not bSearch then
    begin
      if Cells[0,1] <> '' then rowCount := RowCount + 1;
      cells[0,RowCount - 1] := MAcStr ;
      cells[1,RowCount - 1] := WiznetData;
      if RowCount = 2 then   DetailWizNetList(WiznetData);
      if selectMAC = MAcStr then
      begin
        sg_WiznetList.Row := RowCount - 1;
        DetailWizNetList(WiznetData);
      end;
    end;
  end;
  //sg_WiznetListClick(self);
end;

procedure TfmNetConfig.sg_WiznetListClick(Sender: TObject);
var
  FirstTickCount: Longint;
  i : integer;
begin
  if sg_WiznetList.Cells[0,sg_WiznetList.Row] = '' then Exit;

  WiznetData := sg_WiznetList.Cells[1,sg_WiznetList.Row];
  DetailWizNetList(WiznetData);
  SelectMAC := sg_WiznetList.Cells[0,sg_WiznetList.Row]

end;

procedure TfmNetConfig.DetailWizNetList(aWiznetData: string);
var
  I: Integer;
  S: string;
  st: String;
  st2: String;
  n: Integer;
  MAcStr:String;
begin
  ClearWiznetInfo;

  S:= aWiznetData;

  if  Length(S) < 47 then Exit;

  {MAC Address}

  if (copy(S,1,4) <> 'IMIN') and (copy(S,1,4) <> 'SETC')
     and (copy(S,1,4) <> 'LNDT') and (copy(S,1,4) <> 'LNSD')
  then Exit;

  if (copy(S,1,4) = 'IMIN') or (copy(S,1,4) = 'SETC') then chk_ZeronType.Checked := False
  else chk_ZeronType.Checked := True;


  st:= copy(S,5,6);

  MACADDR:= ToHexStrNoSpace(st);

  ed_LMAC1.Color:= clYellow;
  ed_LMAC2.Color:= clYellow;
  ed_LMAC3.Color:= clYellow;
  ed_LMAC4.Color:= clYellow;
  ed_LMAC5.Color:= clYellow;
  ed_LMAC6.Color:= clYellow;

  ed_LMAC1.Text:= Copy(MACADDR,1,2);
  ed_LMAC2.Text:= Copy(MACADDR,3,2);
  ed_LMAC3.Text:= Copy(MACADDR,5,2);
  ed_LMAC4.Text:= Copy(MACADDR,7,2);
  ed_LMAC5.Text:= Copy(MACADDR,9,2);
  ed_LMAC6.Text:= Copy(MACADDR,11,2);

  {Mode}
  //if S[11] = #$00 then Checkbox_Client.Checked:= True
  //else                 Checkbox_Client.Checked:= False;

  if S[11] = #$00 then RadioModeClient.Checked:= True
  else if S[11] = #$02 then RadioModeServer.Checked:= True
  else if S[11] = #$01 then RadioModeMixed.Checked:= True;


  {IP Address}
  st:= Copy(S,12,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  ed_LLocalIP.Text:= st2;
  ed_LLocalIP.Color:= clYellow;

  {Subnet Mask}
  st:= Copy(S,16,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  ed_LSunnet.Text:= st2;
  ed_LSunnet.Color:= clYellow;

  {GateWay}
  st:= Copy(S,20,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  ed_LGateway.Text:= st2;
  ed_LGateway.Color:= clYellow;

  {Port Number- Client}
  st:= copy(S,24,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  ed_LLocalPort.Text:= st2;
  ed_LLocalPort.Color:= clYellow;

  {Server IP}
  st:= copy(s,26,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_ServerIp.Text:= st2;

  {Server Port}
  st:= copy(S,30,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Serverport.Text:= st2;

  {Serial Baudrate}
  case S[32] of
     #$BB: begin ComboBox_Boad.ItemIndex:= 8; end;
     #$FF: begin ComboBox_Boad.ItemIndex:= 7; end;
     #$FE: begin ComboBox_Boad.ItemIndex:= 6; end;
     #$FD: begin ComboBox_Boad.ItemIndex:= 5; end;
     #$FA: begin ComboBox_Boad.ItemIndex:= 4; end;
     #$F4: begin ComboBox_Boad.ItemIndex:= 3; end;
     #$E8: begin ComboBox_Boad.ItemIndex:= 2; end;
     #$D0: begin ComboBox_Boad.ItemIndex:= 1; end;
     #$A0: begin ComboBox_Boad.ItemIndex:= 0; end;
  end;
  ComboBox_Boad.Text:= ComboBox_Boad.Items[ComboBox_Boad.ItemIndex];
  {Data Bit}
  st:= copy(s,33,1);
  n:= Ord(st[1]);
  if n = 7 then ComboBox_Databit.ItemIndex:= 0
  else if n =8 then ComboBox_Databit.ItemIndex:= 1
  else ComboBox_Databit.Text:= InttoStr(n);
  ComboBox_Databit.Text:= ComboBox_Databit.Items[ComboBox_Databit.ItemIndex];

  {Parity}
  case S[34] of
    #$00: ComboBox_Parity.ItemIndex:= 0;
    #$01: ComboBox_Parity.ItemIndex:= 1;
    #$02: ComboBox_Parity.ItemIndex:= 2;
  end;
  ComboBox_Parity.Text:= ComboBox_Parity.Items[ComboBox_Parity.ItemIndex];
  {Stop Bit}
  st:= copy(s,35,1);
  ComboBox_Stopbit.Text:= InttoStr(Ord(st[1]));

  {Flow Control}
  case S[36] of
    #$00: ComboBox_Flow.ItemIndex:= 0;
    #$01: ComboBox_Flow.ItemIndex:= 1;
    #$02: ComboBox_Flow.ItemIndex:= 2;
  end;
  ComboBox_Flow.Text:= ComboBox_Flow.Items[ComboBox_Flow.ItemIndex];
  {DelimiterChar}
  Edit_Char.Text:= ToHexStrNoSpace(s[37]);
  {FDelimiterSize}
  st:= Copy(S,38,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Size.Text:= st2;
  {Delimitertime}
  st:= Copy(S,40,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Time.Text:= st2;

  {FDelimiterIdle}
  st:= Copy(S,42,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Idle.Text:= st2;

  {Debug Mode}
  if S[44] = #$0 then Checkbox_Debugmode.Checked:= True //IIM7100.FDebugMode:='0' //ON
  else                Checkbox_Debugmode.Checked:= False;// IIM7100.FDebugMode:='1';//OFF

  {Major Version}
  RzEdit1.Text:= InttoStr(Ord(s[45]))+'.'+InttoStr(Ord(s[46]));
  if Not chk_ZeronType.Checked then RzEdit1.Color := $0080FFFF
  else RzEdit1.Color := clSkyBlue;

  {DHCP MODE}
  if S[47] = #$0 then Checkbox_DHCP.Checked:= False//IIM7100.FOnDHCP:= '0'//OFF
  else                Checkbox_DHCP.Checked:= True;//IIM7100.FOnDHCP:= '1'; //ON

  pan_LanDetail.Enabled := True;

end;

procedure TfmNetConfig.btn_LSettingClick(Sender: TObject);
var
  FirstTickCount : double;
  i : integer;
  nNodeNo : integer;
  stMac : string;
begin
  bNetConfigSet := True;
  NETTYPE := 'TCPIP';

  Screen.Cursor:= crHourGlass;
  btn_LSetting.Enabled := False;
  btn_LClose.Enabled := False;
  bWizeNetLanRecv := False;
  UpdateTB_ACCESSDEVICE_RCV(ed_LLocalIP.Text,'N');

{  if chk_MCUChange.Checked then
  begin
    if cmb_MCU.itemIndex < 0 then
    begin
      showmessage('MCU 교체시에는 교체할 MCU를 선택해 주셔야 합니다.');
      btn_LSetting.Enabled := True;
      btn_LClose.Enabled := True;
      Screen.Cursor:=crDefault;
      Exit;
    end;
    stMac := ed_LMAC1.Text +
             ed_LMAC2.Text +
             ed_LMAC3.Text +
             ed_LMAC4.Text +
             ed_LMAC5.Text +
             ed_LMAC6.Text;
    nNodeNo := strtoint(copy(MCUIDList.Strings[cmb_MCU.itemIndex],1,3));
  end;   }

  RegLanWiznet;

  FirstTickCount := GetTickCount + nDelayTime + 20000; //13초 대기
  While Not bWizeNetLanRecv do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;

  if Not bWizeNetLanRecv then
  begin
    btn_LSetting.Enabled := True;
    btn_LClose.Enabled := True;
    Screen.Cursor:= crDefault;
    showmessage('LAN 설정에 실패 했습니다.');
    Exit;
  end;

{
  WinsockPortOpen('TCPIP');

  FirstTickCount := GetTickCount + 1000; //3초 대기
  While Not bConnected do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;

  for i:=0 to 3 do
  begin
    if Check_ID then break;
  end;

  bCheckUsedDevice := False;
  RegUsedDevice(MCUID + '00','0');
  FirstTickCount := GetTickCount + nDelayTime ; //1초 대기
  While Not bCheckUsedDevice do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;
  if Not bCheckUsedDevice then
  begin
    btn_LSetting.Enabled := True;
    btn_LClose.Enabled := True;
    Screen.Cursor:= crDefault;
    showmessage('ECU 등록에 실패 했습니다.');
    Exit;
  end;
 }

  Screen.Cursor:= crDefault;

  btn_LSetting.Enabled := True;
  btn_LClose.Enabled := True;
  bNetConfigSet := True;
end;

procedure TfmNetConfig.RegLanWiznet;
var
  st,st2 : string;
  I : integer;
  No : integer;
begin
    if Not chk_ZeronType.Checked then
    begin
      wiznetData[1]:='S';
      wiznetData[2]:='E';
      wiznetData[3]:='T';
      wiznetData[4]:='T';
    end else
    begin
      wiznetData[1]:='L';
      wiznetData[2]:='N';
      wiznetData[3]:='S';
      wiznetData[4]:='V';
    end;

    {LocalIP}
    st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(ed_LLocalIP.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[11+I]:= st2[I];
    end;

   {Local subnet}
   st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(ed_LSunnet.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[15+I]:= st2[I];
    end;

   {Local Gateway}
   st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(ed_LGateway.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[19+I]:= st2[I];
    end;

    {Local Port}
    st2:='';
    //st:= Dec2Hex(StrtoInt(ed_LLocalPort.Text),2);
    st:= Dec2Hex(3000,2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[24]:= st2[1];
    wiznetData[25]:= st2[2];

    {Server IP}
    st2:='';
    if Edit_ServerIp.Text = '' then Edit_ServerIp.Text := '127.0.0.1';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_ServerIp.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[25+I]:= st2[I];
    end;

    {Server Port}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Serverport.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[30]:= st2[1];
    wiznetData[31]:= st2[2];

    {Mode}
    //if Checkbox_Client.Checked then wiznetData[11] := #$00
    //else                            wiznetData[11] := #$01;

    {if RadioModeClient.Checked then wiznetData[11] := #$00
    else if RadioModeServer.Checked then wiznetData[11] := #$02
    else if RadioModeMixed.Checked then  wiznetData[11] := #$01;}
    wiznetData[11] := #$02; //서버 모드


    {Board}
    {case ComboBox_Boad.ItemIndex of
      3: wiznetData[32]:= #$F4; //9600
      4: wiznetData[32]:= #$FA; //19200
      5: wiznetData[32]:= #$FD; //38400
      6: wiznetData[32]:= #$FE; //57600
      7: wiznetData[32]:= #$FF; //115200
    else wiznetData[32]:= #$FD; //38400
    end;}
    wiznetData[32]:= #$FD; //38400

    {DataBit}
    {case ComboBox_Databit.ItemIndex of
      0: wiznetData[33]:= #$07;
      1: wiznetData[33]:= #$08;
    end;}
    wiznetData[33]:= #$08; //8Bit
    {Parity}
    {case ComboBox_Parity.ItemIndex of
      0: wiznetData[34]:= #$00;
      1: wiznetData[34]:= #$01;
      2: wiznetData[34]:= #$02;
    end; }
    wiznetData[34]:= #$00; // None Parity
    {Stop Bit}
    wiznetData[35]:= #$01;

    {Flow}
    {case ComboBox_Flow.ItemIndex of
      0: wiznetData[36]:= #$00;
      1: wiznetData[36]:= #$01;
      2: wiznetData[36]:= #$02;
    end;}
    wiznetData[36]:= #$00; //None Flow
    {Delimeter Time}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Time.Text),2);
    //if Length(st) < 4 then st:= '0'+st;
    st:=FillZeroStrNum(st,4);
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[40]:= st2[1];
    wiznetData[41]:= st2[2];

    {Delimeter Size}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Size.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[38]:= st2[1];
    wiznetData[39]:= st2[2];

    {Delimeter Char}
    st:= Edit_Char.Text;
    wiznetData[37]:= Char(Hex2Dec(st));

    {Delimeter IdleTIme}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Idle.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[42]:= st2[1];
    wiznetData[43]:= st2[2];
    {Debug Mode}
    if Checkbox_Debugmode.Checked then  wiznetData[44]:= #$00
    else                                wiznetData[44] := #$01;

    if Checkbox_DHCP.Checked then wiznetData[47]:= #$01
    else                          wiznetData[47]:= #$00;

    IdUDPServer1.Active := False;
    IdUDPServer1.DefaultPort := BROADSERVERPORT;
    IdUDPServer1.Active := True;
    IdUDPClient1.Broadcast(wiznetData,BROADCLIENTPORT);
    //ClearWiznetInfo;

end;


procedure TfmNetConfig.chk_MCUChangeClick(Sender: TObject);
begin
  if chk_MCUChange.Checked then
  begin
    cmb_MCU.Visible := True;
    MCULoad(cmb_MCU);
  end else
  begin
    cmb_MCU.Visible := False;
  end;
end;

procedure TfmNetConfig.MCULoad(cmb_Box: TComboBox);
var
  stSql : string;
  stDeviceName : string;
begin
  MCUIDList.Clear;
  cmb_Box.Clear;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  stSql := stSql + ' order by AC_NODENO,AC_ECUID ';
  with ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    while Not Eof do
    begin
      if FindField('AC_DEVICENAME').AsString = '' then stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_MACADDR').AsString
      else stDeviceName := FindField('AC_ECUID').AsString + ':' + FindField('AC_DEVICENAME').AsString;
      cmb_Box.Items.Add(stDeviceName);
      MCUIDList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString );
      Next;
    end;
  end;

end;


function TfmNetConfig.UpdateTB_ACCESSDEVICE_RCV(aIp,
  aRcv: string): Boolean;
var
  stSql : string;
begin
  stSql := ' update TB_ACCESSDEVICE set SEND_ACK = ''' + aRcv + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  if aIp <> '' then
  stSql := stSql + ' AND AC_MCUIP = ''' + aIp + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

end.
