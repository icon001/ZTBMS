unit uBroadCast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, OoMisc, AdPort, AdWnPort, Buttons,
  ExtCtrls, StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  DXUnicastDataQueue, DXString, DXServerCore, ComCtrls, IdUDPServer,IdSocketHandle;

Const
  SearchCMD = 'QNW50';
  RSearchCMD = 'qNW50';
  InitialCMD = 'INW50';
  RInitialCMD = 'iNW50';
  BroadSendPort = 1460 + 10;
  BroadRcvPort = 5001 + 10;
  TCPPort = 1461 + 10;

type
  TfmMain = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ed_total: TEdit;
    Label2: TLabel;
    ed_Version: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    btn_Search: TSpeedButton;
    btn_Setting: TSpeedButton;
    btn_Close: TSpeedButton;
    WinsockPort: TApdWinsockPort;
    sg_List: TAdvStringGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_Connect: TEdit;
    ed_ip: TEdit;
    ed_Subnet: TEdit;
    ed_GateWay: TEdit;
    ed_Serverip: TEdit;
    ed_AVServerIP: TEdit;
    ed_UserAVIP: TEdit;
    Label9: TLabel;
    ed_port: TEdit;
    Label10: TLabel;
    ed_ServerPort: TEdit;
    Label11: TLabel;
    ed_AVServerPort: TEdit;
    Label12: TLabel;
    ed_UserAVPort: TEdit;
    Label13: TLabel;
    ed_LocalIP: TEdit;
    Label14: TLabel;
    ed_LocalPort: TEdit;
    Label15: TLabel;
    ed_LocalSubnet: TEdit;
    Label16: TLabel;
    ed_LocalGateWay: TEdit;
    Label17: TLabel;
    ed_LocalServerIP: TEdit;
    Label18: TLabel;
    ed_LocalServerPort: TEdit;
    ed_LocalConnect: TEdit;
    ed_Mac: TEdit;
    ed_LocalMac: TEdit;
    rg_NM: TRadioGroup;
    rg_Dhcp: TRadioGroup;
    ed_Constate: TEdit;
    rg_LocalNM: TRadioGroup;
    rg_LocalDhcp: TRadioGroup;
    ed_LocalConState: TEdit;
    rg_Debug: TRadioGroup;
    chk_TCPIP: TCheckBox;
    ed_TcpIp: TEdit;
    DXServerCore1: TDXServerCore;
    DXUnicastDataQueue1: TDXUnicastDataQueue;
    UDPClient: TIdUDPClient;
    chk_Local: TCheckBox;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Timer1: TTimer;
    uServer: TIdUDPServer;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_ListClick(Sender: TObject);
    procedure chk_TCPIPClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_SettingClick(Sender: TObject);
    procedure UServerUDPDataNoPool(Data: Pointer; PeerIP: String; PeerPort,
      DataLen: Integer);
    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure chk_LocalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure uServerUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
  private
    { Private declarations }
    procedure ViewLocal;
    procedure HideLocal;
    procedure Clear_Panel;
    procedure White_Control;
    procedure Control_Yellow;
    procedure SendPacket(aCmd,aSendData:string);
    function  GetSetData:string;
    procedure ListClear;
    procedure RcvDataProcess;
    procedure DataPacketProcess(aPacket:string);
    procedure SearchProcess(aPacket:string);
    procedure InitialProcess(aPacket:string);
    function sg_ListUpdate(aPacket:string;nRow:integer):Boolean;
    function HexToIP(aHex:string):string;
    function MacFormat(aMac:string):string;
    function IPtoHex(aIP:string):string;
    function PortToHex(aPort:string):string;
    procedure EnabledLocal;
    procedure DisabledLocal;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  RecvData : string;
  MacList : TStringList;
  bSearch : Boolean;
  IsClick : Boolean;

implementation
uses
uLomosUtil;
{$R *.dfm}

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Userver.Active := False;
  Close;
end;

procedure TfmMain.FormActivate(Sender: TObject);
var
  i : integer;
begin
  bSearch := False;
  MacList := TStringList.Create;
  MacList.Clear;
  sg_List.ColWidths[0] := 0;
  sg_List.ColWidths[1] := 200;
  for i:=2 to sg_List.ColCount -1 do
  begin
    sg_List.ColWidths[i] := 0;
  end;
  UServer.Active := False;
  UServer.DefaultPort  := BroadRcvPort;
  UServer.Active := True;
  Clear_Panel;
  HideLocal;
  IsClick := False;

end;

procedure TfmMain.HideLocal;
begin
  //fmMain.Width := 595;
  DisabledLocal;
end;

procedure TfmMain.sg_ListClick(Sender: TObject);
begin
  Clear_Panel;
  White_Control;
  with sg_List do
  begin
    if Cells[0,Row] = '' then Exit;
    ed_mac.Text := Cells[1,Row];
    ed_ip.Text := HexToIP(Cells[2,Row]);
    ed_Subnet.Text := HexToIP(Cells[3,Row]);
    ed_GateWay.Text := HexToIP(Cells[4,Row]);
    ed_port.Text := Hex2DecStr(Cells[5,Row]);
    ed_Serverip.Text := HexToIP(Cells[6,Row]);
    ed_ServerPort.Text := Hex2DecStr(Cells[7,Row]);
    if Cells[8,Row] = 'S' then rg_NM.ItemIndex := 1
    else rg_NM.ItemIndex := 0;
    rg_Dhcp.ItemIndex := strtoint(Cells[9,Row]);
    if Cells[10,Row] = 'C' then ed_Connect.Text := 'Connected'
    else ed_Connect.Text := 'DisConnected';
    ed_Constate.Text := Cells[10,Row];
    if Cells[11,Row] = '0' then
    begin
      HideLocal;
      chk_Local.Checked := False;
    end
    else
    begin
      ViewLocal;
      chk_Local.Checked := True;
    end;
    ed_LocalMac.Text := Cells[12,Row];
    ed_LocalIP.Text := HexToIP(Cells[13,Row]);
    ed_LocalSubnet.Text := HexToIP(Cells[14,Row]);
    ed_LocalGateWay.Text := HexToIP(Cells[15,Row]);
    ed_LocalPort.Text := Hex2DecStr(Cells[16,Row]);
    ed_LocalServerIP.Text := HexToIP(Cells[17,Row]);
    ed_LocalServerPort.Text := Hex2DecStr(Cells[18,Row]);
    if Cells[19,Row] = 'S' then rg_LocalNM.ItemIndex := 1
    else rg_LocalNM.ItemIndex := 0;
    rg_LocalDhcp.ItemIndex := strtoint(Cells[20,Row]);
    if Cells[21,Row] = 'C' then ed_LocalConnect.Text := 'Connected'
    else ed_LocalConnect.Text := 'DisConnected';
    ed_LocalConState.Text := Cells[21,Row];
    ed_AVServerIP.Text := HexToIP(Cells[22,Row]);
    ed_AVServerPort.Text := Hex2DecStr(Cells[23,Row]);
    ed_UserAVIP.Text := HexToIP(Cells[24,Row]);
    ed_UserAVPort.Text := Hex2DecStr(Cells[25,Row]);
    rg_debug.ItemIndex := strtoint(Cells[26,Row]);
    ed_Version.Text := Cells[27,Row];
  end;
  btn_Setting.Enabled := True;
end;

procedure TfmMain.ViewLocal;
begin
  //fmMain.Width := 954;
  EnabledLocal;
end;

procedure TfmMain.chk_TCPIPClick(Sender: TObject);
begin
  if chk_TCPIP.Checked then
  begin
    ed_TcpIp.Visible := True;
    ed_TcpIp.SetFocus;
  end else
  begin
    ed_TcpIp.Visible := False;
  end;
end;

procedure TfmMain.btn_SearchClick(Sender: TObject);
begin
  bSearch := True;
  IsClick := True;
  MacList.Clear;
  ListClear;
  Clear_Panel;
  White_Control;
  //SendPacket('FIND','');
  SendPacket(SearchCMD,'');
  ProgressBar1.Max := 5000;
  ProgressBar1.Position := 0;
  Panel2.Visible := True;
  Timer1.Enabled := True;
end;

procedure TfmMain.Clear_Panel;
begin
    btn_Setting.Enabled := False;

    chk_Local.Checked := False;
    ed_mac.Text := '';
    ed_ip.Text := '';
    ed_Subnet.Text := '';
    ed_GateWay.Text := '';
    ed_port.Text := '';
    ed_Serverip.Text := '';
    ed_ServerPort.Text := '';
    rg_NM.ItemIndex := 1;
    rg_Dhcp.ItemIndex := 1;
    ed_Connect.Text := '';
    ed_Constate.Text := '';
    ed_LocalMac.Text := '';
    ed_LocalIP.Text := '';
    ed_LocalSubnet.Text := '';
    ed_LocalGateWay.Text := '';
    ed_LocalPort.Text := '';
    ed_LocalServerIP.Text := '';
    ed_LocalServerPort.Text := '';
    rg_LocalNM.ItemIndex := 1;
    rg_LocalDhcp.ItemIndex := 1;
    ed_LocalConnect.Text := '';
    ed_LocalConState.Text := '';
    ed_AVServerIP.Text := '';
    ed_AVServerPort.Text := '';
    ed_UserAVIP.Text := '';
    ed_UserAVPort.Text := '';
    rg_debug.ItemIndex := 0;
    ed_Version.Text := '';

end;

procedure TfmMain.White_Control;
begin
    //chk_Local.Color := clWhite;
    ed_mac.Color := clWhite;
    ed_ip.Color := clWhite;
    ed_Subnet.Color := clWhite;
    ed_GateWay.Color := clWhite;
    ed_port.Color := clWhite;
    ed_Serverip.Color := clWhite;
    ed_ServerPort.Color := clWhite;
    //rg_NM.Color := clWhite;
    //rg_Dhcp.Color := clWhite;
    ed_Connect.Color := clWhite;
    ed_Constate.Color := clWhite;
    ed_LocalMac.Color := clWhite;
    ed_LocalIP.Color := clWhite;
    ed_LocalSubnet.Color := clWhite;
    ed_LocalGateWay.Color := clWhite;
    ed_LocalPort.Color := clWhite;
    ed_LocalServerIP.Color := clWhite;
    ed_LocalServerPort.Color := clWhite;
    //rg_LocalNM.Color := clWhite;
    //rg_LocalDhcp.Color := clWhite;
    ed_LocalConnect.Color := clWhite;
    ed_LocalConState.Color := clWhite;
    ed_AVServerIP.Color := clWhite;
    ed_AVServerPort.Color := clWhite;
    ed_UserAVIP.Color := clWhite;
    ed_UserAVPort.Color := clWhite;
    //rg_debug.Color := clWhite;
    ed_Version.Color := clWhite;
end;

procedure TfmMain.btn_SettingClick(Sender: TObject);
var
  stSendData : string;
begin
  bSearch := True;
  White_Control;
  stSendData := GetSetData;
  SendPacket(InitialCMD,stSendData);
  ProgressBar1.Max := 5000;
  ProgressBar1.Position := 0;
  Panel2.Visible := True;
  Timer1.Enabled := True;
end;


procedure TfmMain.SendPacket(aCmd, aSendData: string);
var
  stSendData : string;
begin
  stSendData := aCmd + aSendData;
  if chk_TCPIP.Checked then
  begin
    RecvData := '';
    if WinsockPort.Open then WinSockPort.Open := False;
    WinsockPort.WsAddress := ed_TcpIp.Text;
    WinsockPort.WsPort := inttostr(TCPPort);
    WinsockPort.Open := True;
    WinsockPort.PutString(stSendData);
  end else
  begin
    RecvData := '';
    UDPClient.Broadcast(stSendData,BroadSendPort);
  end;
end;

function TfmMain.GetSetData: string;
var
  stData : string;
begin
  stData := '1';  //네트웍정보
  stData := stData + StringReplace(ed_Mac.Text,':','',[rfReplaceAll]);          //MAC
  stData := stData + IPtoHex(ed_ip.Text);           //IP
  stData := stData + IPtoHex(ed_subnet.Text);       //SUBNET
  stData := stData + IPtoHex(ed_gateway.Text);      //GateWay
  stData := stData + PortToHex(ed_port.Text);       //Port
  stData := stData + IPtoHex(ed_ServerIp.Text);     //ServerIp
  stData := stData + PortToHex(ed_ServerPort.Text); //ServerPort
  if rg_nm.ItemIndex = 0 then                       //NetWork Mode
    stData := stData + 'C'
  else stData := stData + 'S';
  if rg_Dhcp.ItemIndex < 0 then rg_Dhcp.ItemIndex := 0;
  stData := stData + inttostr(rg_Dhcp.ItemIndex);
  stData := stData + ed_Constate.Text;               //Connect Sate
  stData := stData + '^';
  if chk_Local.Checked then stData := stData + '1'  //로칼 네트웍 정보
  else stData := stData + '0';
  stData := stData + StringReplace(ed_LocalMac.Text,':','',[rfReplaceAll]); //Local Mac
  stData := stData + IPtoHex(ed_Localip.Text);           //LocalIP
  stData := stData + IPtoHex(ed_Localsubnet.Text);       //LocalSUBNET
  stData := stData + IPtoHex(ed_Localgateway.Text);      //LocalGateWay
  stData := stData + PortToHex(ed_Localport.Text);       //LocalPort
  stData := stData + IPtoHex(ed_LocalServerIp.Text);     //LocalServerIp
  stData := stData + PortToHex(ed_LocalServerPort.Text); //LocalServerPort
  if rg_Localnm.ItemIndex = 0 then                       //LocalNetWork Mode
    stData := stData + 'C'
  else stData := stData + 'S';
  if rg_LocalDhcp.ItemIndex < 0 then rg_LocalDhcp.ItemIndex := 0;
  stData := stData + inttostr(rg_LocalDhcp.ItemIndex);
  stData := stData + ed_LocalConstate.Text;               //LocalConnect Sate
  stData := stData + '^';
  stData := stData + IPtoHex(ed_AVServerIP.Text);         //AV Manager Server Ip
  stData := stData + PortToHex(ed_AVServerPort.Text);     //AV Manager Server Port
  stData := stData + IPtoHex(ed_UserAVIP.Text);         //AV Generl Server Ip
  stData := stData + PortToHex(ed_UserAVPort.Text);     //AV Generl Server Port
  if rg_Debug.ItemIndex < 0 then rg_Debug.ItemIndex := 0;
  stData := stData + inttostr(rg_Debug.ItemIndex);
  stData := stData + FillSpace(ed_Version.Text,4);
  memo1.Lines.Add(stData);
  result := stData;
end;

procedure TfmMain.ListClear;
var
  i : integer;
begin
  with sg_List do
  begin
    RowCount := 2;
    for i := 0 to ColCount -1 do
    begin
      Cells[i,1] := '';
    end;
  end;
end;

procedure TfmMain.UServerUDPDataNoPool(Data: Pointer; PeerIP: String;
  PeerPort, DataLen: Integer);
begin
  memo1.Lines.Add(copy(String(Data),1,DataLen));
  RecvData := RecvData + copy(String(Data),1,DataLen);
  RcvDataProcess;
end;

procedure TfmMain.RcvDataProcess;
var
  nIndex : integer;
  stPacket : string;
  nLen : integer;
begin
  nIndex := Pos('NW50',RecvData);
  if nIndex < 2 then
  begin
    RecvData := '';
    Exit;
  End;
  While Length(RecvData) >= 148 do
  begin
    if nIndex > 2 then Delete(RecvData,1,nIndex - 1);
    nLen := Length(RecvData);
    if  nLen < 148 then Exit;
    stPacket := copy(RecvData,1,148);
    Delete(RecvData,1,148);
    DataPacketProcess(stPacket);
  end;

end;

procedure TfmMain.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  st : string;
  i : integer;
begin
  st:= '';

  for i := 1 to Count do st := st + WinsockPort.GetChar;

  RecvData := RecvData + st;
  RcvDataProcess;

end;

procedure TfmMain.DataPacketProcess(aPacket: string);
var
  stCmd : string;
begin
  stCmd := copy(aPacket,1,5);
  if stCmd = RSearchCMD then SearchProcess(aPacket)
  else if stCmd = RInitialCMD then InitialProcess(aPacket);

end;

procedure TfmMain.InitialProcess(aPacket: string);
var
  nRow : integer;
begin
  Clear_Panel;
  nRow := MacList.IndexOf(MacFormat(copy(aPacket,7,12)));
  sg_ListUpdate(aPacket,nRow + 1);

  ed_mac.Text := MacFormat(copy(aPacket,7,12));     //Mac
  ed_ip.Text := HexToIP(copy(aPacket,19,8));         //IP
  ed_Subnet.Text := HexToIP(copy(aPacket,27,8));    //SubNet
  ed_GateWay.Text := HexToIP(copy(aPacket,35,8));   //GateWay
  ed_port.Text := Hex2DecStr(copy(aPacket,43,4));   //Port
  ed_Serverip.Text := HexToIP(copy(aPacket,47,8));  //ServerIP
  ed_ServerPort.Text := Hex2DecStr(copy(aPacket,55,4));  //ServerPort
  if copy(aPacket,59,1) = 'S' then rg_NM.ItemIndex := 1
  else rg_NM.ItemIndex := 0;
  rg_Dhcp.ItemIndex := strtoint(copy(aPacket,60,1));
  if copy(aPacket,61,1) = 'C' then ed_Connect.Text := 'Connected'
  else ed_Connect.Text := 'DisConnected';
  ed_Constate.Text := copy(aPacket,61,1);
  if copy(aPacket,63,1) = '1' then
  begin
    chk_Local.Checked := True;
    ViewLocal;
  end else
  begin
    chk_Local.Checked := False;
    HideLocal;
  end;  ed_LocalMac.Text := MacFormat(copy(aPacket,64,12));  //Local Mac
  ed_LocalIP.Text := HexToIP(copy(aPacket,76,8));  //LocalIP
  ed_LocalSubnet.Text := HexToIP(copy(aPacket,84,8));  //LocalSubNet
  ed_LocalGateWay.Text := HexToIP(copy(aPacket,92,8));  //LocalGateWay
  ed_LocalPort.Text := Hex2DecStr(copy(aPacket,100,4));  //LocalPort
  ed_LocalServerIP.Text := HexToIP(copy(aPacket,104,8));  //LocalServerIP
  ed_LocalServerPort.Text := Hex2DecStr(copy(aPacket,112,4));  //LocalServerPort
  if copy(aPacket,116,1) = 'S' then rg_LocalNM.ItemIndex := 1
  else rg_LocalNM.ItemIndex := 0;
  rg_LocalDhcp.ItemIndex := strtoint(copy(aPacket,117,1));
  if copy(aPacket,118,1) = 'C' then ed_LocalConnect.Text := 'Connected'
  else ed_LocalConnect.Text := 'DisConnected';
  ed_LocalConState.Text := copy(aPacket,118,1);
  ed_AVServerIP.Text := HexToIP(copy(aPacket,120,8));  //AV Manager IP
  ed_AVServerPort.Text := Hex2DecStr(copy(aPacket,128,4));  //AV Manager Port
  ed_UserAVIP.Text := HexToIP(copy(aPacket,132,8));  //AV General IP
  ed_UserAVPort.Text := Hex2DecStr(copy(aPacket,140,4));  //AV General Port
  rg_debug.ItemIndex := strtoint(copy(aPacket,144,1));  //Debug Code
  ed_Version.Text := copy(aPacket,145,4);  //Version
  Control_Yellow;
  btn_Setting.Enabled := True;
end;

procedure TfmMain.SearchProcess(aPacket: string);
var
  nRow : integer;
begin
  if MacList.IndexOf(MacFormat(copy(aPacket,7,12))) > -1 then Exit;
  MacList.Add(MacFormat(copy(aPacket,7,12)));
  with sg_List do
  begin
    if RowCount = 2 then
    begin
      if Cells[0,1] <> '' then RowCount := RowCount + 1;
    end else
    begin
      RowCount := RowCount + 1;
    end;
    nRow := RowCount - 1;
    Cells[0,nRow] := copy(aPacket,6,1);   //Network info
    Cells[1,nRow] := MacFormat(copy(aPacket,7,12));     //Mac
    Cells[2,nRow] := copy(aPacket,19,8);  //IP
    Cells[3,nRow] := copy(aPacket,27,8);  //SubNet
    Cells[4,nRow] := copy(aPacket,35,8);  //GateWay
    Cells[5,nRow] := copy(aPacket,43,4);  //Port
    Cells[6,nRow] := copy(aPacket,47,8);  //ServerIP
    Cells[7,nRow] := copy(aPacket,55,4);  //ServerPort
    Cells[8,nRow] := copy(aPacket,59,1);  //Mode
    Cells[9,nRow] := copy(aPacket,60,1);  //DHCP Option
    Cells[10,nRow] := copy(aPacket,61,1);  //ConnectState
    Cells[11,nRow] := copy(aPacket,62,1);  //구분자
    Cells[11,nRow] := copy(aPacket,63,1);  //LocalNetwork info
    Cells[12,nRow] := MacFormat(copy(aPacket,64,12));     //Local Mac
    Cells[13,nRow] := copy(aPacket,76,8);  //LocalIP
    Cells[14,nRow] := copy(aPacket,84,8);  //LocalSubNet
    Cells[15,nRow] := copy(aPacket,92,8);  //LocalGateWay
    Cells[16,nRow] := copy(aPacket,100,4);  //LocalPort
    Cells[17,nRow] := copy(aPacket,104,8);  //LocalServerIP
    Cells[18,nRow] := copy(aPacket,112,4);  //LocalServerPort
    Cells[19,nRow] := copy(aPacket,116,1);  //LocalMode
    Cells[20,nRow] := copy(aPacket,117,1);  //LocalDHCP Option
    Cells[21,nRow] := copy(aPacket,118,1);  //LocalConnectState
    Cells[22,nRow] := copy(aPacket,119,1);  //구분자
    Cells[22,nRow] := copy(aPacket,120,8);  //AV Manager IP
    Cells[23,nRow] := copy(aPacket,128,4);  //AV Manager Port
    Cells[24,nRow] := copy(aPacket,132,8);  //AV General IP
    Cells[25,nRow] := copy(aPacket,140,4);  //AV General Port
    Cells[26,nRow] := copy(aPacket,144,1);  //Debug Code
    Cells[27,nRow] := copy(aPacket,145,4);  //Version
  end;
  ed_Total.Text := inttostr(sg_List.rowcount - 1);
  if IsClick then sg_ListClick(self);
  IsClick := False;

end;

function TfmMain.HexToIP(aHex: string): string;
var
  stData:string;
  stTemp : string;
  nTemp : integer;
  i : integer;
begin
  if Length(aHex) < 8 then
  begin
    result := '';
    Exit;
  end;
  aHex := Hex2Ascii(aHex);
  stData := '';
  for i:=1 to 4 do
  begin
    if I < 4 then stData := stData + IntToStr(Ord(aHex[I])) + '.'
    else stData := stData + IntToStr(Ord(aHex[I]));
  end;
  result := stData ;
end;

function TfmMain.MacFormat(aMac: string): string;
begin
  result := copy(aMac,1,2) + ':' +
            copy(aMac,3,2) + ':' +
            copy(aMac,5,2) + ':' +
            copy(aMac,7,2) + ':' +
            copy(aMac,9,2) + ':' +
            copy(aMac,11,2);
end;

function TfmMain.IPtoHex(aIP: string): string;
var
  stTemp : string;
  i : integer;
  nTemp : integer;
  stData : string;
begin
  stData := '';
  for i := 0 to 3 do
  begin
    stTemp  := FindCharCopy(aIP, i, '.');
    nTemp  := StrToInt(stTemp);
    stData := stData + Char(nTemp);
  end;
  result := ToHexStrNoSpace(stData);

end;

function TfmMain.PortToHex(aPort: string): string;
var
  stTemp : string;
  i : integer;
  nTemp : integer;
  stData : string;
begin
  stData := '';
  stTemp := Dec2Hex(StrToInt(aPort), 2);
  if Length(stTemp) < 4 then stTemp := '0' + stTemp;
  stData := Chr(Hex2Dec(Copy(stTemp, 1, 2))) + Char(Hex2Dec(Copy(stTemp, 3, 2)));
  result := ToHexStrNoSpace(stData);

end;

procedure TfmMain.Control_Yellow;
begin
    //chk_Local.Color := clWhite;
    ed_mac.Color := clYellow;
    ed_ip.Color := clYellow;
    ed_Subnet.Color := clYellow;
    ed_GateWay.Color := clYellow;
    ed_port.Color := clYellow;
    ed_Serverip.Color := clYellow;
    ed_ServerPort.Color := clYellow;
    //rg_NM.Color := clWhite;
    //rg_Dhcp.Color := clWhite;
    ed_Connect.Color := clYellow;
    ed_Constate.Color := clYellow;
    ed_LocalMac.Color := clYellow;
    ed_LocalIP.Color := clYellow;
    ed_LocalSubnet.Color := clYellow;
    ed_LocalGateWay.Color := clYellow;
    ed_LocalPort.Color := clYellow;
    ed_LocalServerIP.Color := clYellow;
    ed_LocalServerPort.Color := clYellow;
    //rg_LocalNM.Color := clWhite;
    //rg_LocalDhcp.Color := clWhite;
    ed_LocalConnect.Color := clYellow;
    ed_LocalConState.Color := clYellow;
    ed_AVServerIP.Color := clYellow;
    ed_AVServerPort.Color := clYellow;
    ed_UserAVIP.Color := clYellow;
    ed_UserAVPort.Color := clYellow;
    //rg_debug.Color := clWhite;
    ed_Version.Color := clYellow;
end;

procedure TfmMain.chk_LocalClick(Sender: TObject);
begin
  if chk_Local.Checked then EnabledLocal
  else DisabledLocal;
end;

procedure TfmMain.DisabledLocal;
begin
  Label13.Enabled := False;
  ed_LocalIP.Enabled := False;
  Label14.Enabled := False;
  ed_LocalPort.Enabled := False;
  Label15.Enabled := False;
  ed_LocalSubnet.Enabled := False;
  rg_LocalNm.Enabled := False;
  Label16.Enabled := False;
  ed_LocalGateWay.Enabled := False;
  Label17.Enabled := False;
  ed_LocalServerIP.Enabled := False;
  Label18.Enabled := False;
  ed_LocalServerPort.Enabled := False;
  ed_LocalConnect.Enabled := False;
//
end;

procedure TfmMain.EnabledLocal;
begin
  Label13.Enabled := True;
  ed_LocalIP.Enabled := True;
  Label14.Enabled := True;
  ed_LocalPort.Enabled := True;
  Label15.Enabled := True;
  ed_LocalSubnet.Enabled := True;
  rg_LocalNm.Enabled := True;
  Label16.Enabled := True;
  ed_LocalGateWay.Enabled := True;
  Label17.Enabled := True;
  ed_LocalServerIP.Enabled := True;
  Label18.Enabled := True;
  ed_LocalServerPort.Enabled := True;
  ed_LocalConnect.Enabled := True;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  
//  UServer.Destroy;
//  WinsockPort.Destroy;
//  UDPClient.Destroy;
end;

procedure TfmMain.SpeedButton1Click(Sender: TObject);
begin
  SendPacket('FIND','');

end;

procedure TfmMain.Button1Click(Sender: TObject);
begin
  Panel2.visible := False;
  if IsClick then sg_ListClick(self);
  IsClick := False;
end;

procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  progressbar1.Position := progressbar1.Position + 200;
  progressbar1.Refresh;
  if progressbar1.Position >= progressbar1.Max then
  begin
    Panel2.Visible := False;
    Timer1.Enabled := False;
    bSearch := False;
  end;
  application.ProcessMessages;
end;

procedure TfmMain.uServerUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  stBuffer : String;
begin
  if Not bSearch then Exit;
  DataStringStream := TStringStream.Create('');
  try
    DataStringStream.CopyFrom(AData, AData.Size);
    stBuffer:=DataStringStream.DataString;
    memo1.Lines.Add(stBuffer);
    RecvData := RecvData + stBuffer;
    RcvDataProcess;
  finally
    DataStringStream.Free;
  end;

end;

function TfmMain.sg_ListUpdate(aPacket: string; nRow: integer): Boolean;
begin
  if nRow < 0 then Exit;
  with sg_List do
  begin
    if nRow > RowCount - 1 then Exit;
    Cells[0,nRow] := copy(aPacket,6,1);   //Network info
    Cells[1,nRow] := MacFormat(copy(aPacket,7,12));     //Mac
    Cells[2,nRow] := copy(aPacket,19,8);  //IP
    Cells[3,nRow] := copy(aPacket,27,8);  //SubNet
    Cells[4,nRow] := copy(aPacket,35,8);  //GateWay
    Cells[5,nRow] := copy(aPacket,43,4);  //Port
    Cells[6,nRow] := copy(aPacket,47,8);  //ServerIP
    Cells[7,nRow] := copy(aPacket,55,4);  //ServerPort
    Cells[8,nRow] := copy(aPacket,59,1);  //Mode
    Cells[9,nRow] := copy(aPacket,60,1);  //DHCP Option
    Cells[10,nRow] := copy(aPacket,61,1);  //ConnectState
    Cells[11,nRow] := copy(aPacket,62,1);  //구분자
    Cells[11,nRow] := copy(aPacket,63,1);  //LocalNetwork info
    Cells[12,nRow] := MacFormat(copy(aPacket,64,12));     //Local Mac
    Cells[13,nRow] := copy(aPacket,76,8);  //LocalIP
    Cells[14,nRow] := copy(aPacket,84,8);  //LocalSubNet
    Cells[15,nRow] := copy(aPacket,92,8);  //LocalGateWay
    Cells[16,nRow] := copy(aPacket,100,4);  //LocalPort
    Cells[17,nRow] := copy(aPacket,104,8);  //LocalServerIP
    Cells[18,nRow] := copy(aPacket,112,4);  //LocalServerPort
    Cells[19,nRow] := copy(aPacket,116,1);  //LocalMode
    Cells[20,nRow] := copy(aPacket,117,1);  //LocalDHCP Option
    Cells[21,nRow] := copy(aPacket,118,1);  //LocalConnectState
    Cells[22,nRow] := copy(aPacket,119,1);  //구분자
    Cells[22,nRow] := copy(aPacket,120,8);  //AV Manager IP
    Cells[23,nRow] := copy(aPacket,128,4);  //AV Manager Port
    Cells[24,nRow] := copy(aPacket,132,8);  //AV General IP
    Cells[25,nRow] := copy(aPacket,140,4);  //AV General Port
    Cells[26,nRow] := copy(aPacket,144,1);  //Debug Code
    Cells[27,nRow] := copy(aPacket,145,4);  //Version
  end;

end;

end.
