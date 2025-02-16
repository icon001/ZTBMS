unit udmSystemAirCon;

interface

uses
  SysUtils, Classes,Windows,Forms,
  OoMisc,ScktComp, AdPort,AdWnPort,AdSocket,
  xmldom, XMLIntf,msxmldom, XMLDoc,msxml,ActiveX, ExtCtrls;

const
  DMSRcvDelayTime = 5000;

type
  TNodeConnect = procedure(Sender: TObject;  Value:Boolean; NodeNo : integer) of object;
  TNetworkMode = (nmRemote,nmLocal);
  TWatchMode = (cmNothing,cmArm, cmDisarm,cmPatrol,cmInit,cmTest,cmJaejung);
  TSendingMode = (smNothing,smReserve, smSending,smConFirm);
  TPowerMode = (pmNothing,pmOff,pmOn);

  TDMSNode = class(TApdWinsockPort)
  private
    { Private declarations }
    FDMSNo: Integer;
    FSocketConnected: Boolean;
    FOnConnected: TNodeConnect;
    FSocketOpen: Boolean;
    FNetworkMode: TNetworkMode;
    FPasswordAuthState: Boolean;
    FSerialNumberAuthState: Boolean;
    ReceiveCheckTimer: TTimer;
    procedure SetSocketConnected(const Value: Boolean);
    procedure SetSocketOpen(const Value: Boolean);
    procedure SetNetworkNode(const Value: TNetworkMode);
    procedure SetPasswordAuthState(const Value: Boolean);
    procedure SetSerialNumberAuthState(const Value: Boolean);
    procedure ReceiveCheckTimerTimer(Sender: TObject);
  private
    AirconDeviceList : TStringList;
    LastConnectedTime: TDatetime;
    L_stComBuffer : string;

    L_bTreeInfoCheck : Boolean;
    L_bStatusUploadCheck : Boolean;
    L_bMonitoringCheck : Boolean;
    L_bAirconPowerOffCheck : Boolean;
    function GetPasswordAuthXmlData:string;
    function GetSerialAuthXmlData : string;
    function GetMonitoringXmlData : string;
    function GetAirconPowerOffXmlData : string;

    function PassWordAuth_Start : Boolean;
    function SerialNumberAuth_Start : Boolean;
    function AirconPowerMonitoring_Start : Boolean; //에어콘 파워 상태 조회
    function AirconPowerOff_Sending : Boolean;
  protected
    function CheckXmlData(aData:String; var bData:String):string;
    function XMLAttributeItemIndex(node: IXMLDomNode;aAttributeName:string):integer;
    Procedure XmlDataPacketProcess(aData: string);
    procedure AirconPowerStateMonitoingProcess(node: IXMLDomNode);
    procedure SendData(aData:string);
    { Protected declarations }
    procedure CommNodeTriggerAvail(CP: TObject; Count: Word);
    procedure CommNodeWsConnect(Sender: TObject);
    procedure CommNodeWsDisconnect(Sender: TObject);
    procedure CommNodeWsError(Sender: TObject; ErrCode: Integer);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure AirconDevice_Add(aAirconDeviceID:string);
    procedure AirconDevice_PowerOff(aAirconDeviceID:string);
    function DMSPowerOff_Sending : Boolean;  //Timer에 의해 주기적으로 전송
    function GetAirconDevice_PowerMode(aAirconDeviceID:string):TPowerMode;
  public
    ProPerty OnConnected : TNodeConnect read FOnConnected Write FOnConnected;
  public
    Property DMSNo: Integer Read FDMSNo write FDMSNo;
    Property NetworkMode: TNetworkMode read FNetworkMode write SetNetworkNode;
    Property SocketOpen: Boolean Read FSocketOpen write SetSocketOpen;
    ProPerty SocketConnected : Boolean read FSocketConnected Write SetSocketConnected;
    property PasswordAuthState : Boolean read FPasswordAuthState write SetPasswordAuthState;
    property SerialNumberAuthState :Boolean read FSerialNumberAuthState write SetSerialNumberAuthState;
  end;

  TAirconDevice = Class(TComponent)
  private
    FAirconID: string;
    FPowerOffSend: TSendingMode;
    FPowerState: TPowerMode;
    procedure SetPowerState(const Value: TPowerMode);
    { Private declarations }
  private
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    Property AirconID: string Read FAirconID write FAirconID;
    Property PowerState : TPowerMode read FPowerState write SetPowerState;
    Property PowerOffSend : TSendingMode read FPowerOffSend write FPowerOffSend;
  end;

  TArmAreaDevice = Class(TComponent)
  private
    FArmAreaDevice: string;
    FWatchMode: TWatchMode;
    procedure SetWatchMode(const Value: TWatchMode);
    { Private declarations }
  private
    SystemAirconIDList : TStringList;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure SystemAirconDevice_Add(aAirconDeviceID:string);
  public
    Property ArmAreaDevice: string Read FArmAreaDevice write FArmAreaDevice;
    property WatchMode : TWatchMode Read FWatchMode write SetWatchMode;
  end;

  TdmSystemAircon = class(TDataModule)
    SentenceSock: TApdWinsockPort;
    ClientSocket1: TClientSocket;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSystemAircon: TdmSystemAircon;

implementation

uses
  uCommonVariable;
  
{$R *.dfm}

{ TDMSNode }

procedure TDMSNode.AirconDevice_Add(aAirconDeviceID: string);
var
  oAirconDevice : TAirconDevice;
begin
  if AirconDeviceList.IndexOf(aAirconDeviceID) < 0 then
  begin
    oAirconDevice := TAirconDevice.Create(nil);
    oAirconDevice.AirconID := aAirconDeviceID;
    AirconDeviceList.AddObject(aAirconDeviceID,oAirconDevice);
  end;
end;

procedure TDMSNode.AirconDevice_PowerOff(aAirconDeviceID: string);
var
  nIndex : integer;
begin
  nIndex := AirconDeviceList.IndexOf(aAirconDeviceID);
  if nIndex > -1 then
  begin
    TAirconDevice(AirconDeviceList.Objects[nIndex]).PowerOffSend := smReserve; //파워 오프 예약
  end;
end;

function TDMSNode.AirconPowerMonitoring_Start: Boolean;
var
  stXMLData : string;
  PastTime : dword;
begin
  result := False;
  L_bMonitoringCheck := False;
  if Not SocketConnected then Exit;
  stXMLData := GetMonitoringXmlData;
  SendData(stXMLData);
end;

function TDMSNode.AirconPowerOff_Sending: Boolean;
var
  stXMLData : string;
  PastTime : dword;
begin
  result := False;
  L_bAirconPowerOffCheck := False;
  if Not SocketConnected then Exit;
  stXMLData := GetAirconPowerOffXmlData;
  SendData(stXMLData);
end;

procedure TDMSNode.AirconPowerStateMonitoingProcess(node: IXMLDomNode);
var
  i,j,k : integer;
  node1: IXMLDomNode;
  node2: IXMLDomNode;
  allnode: IXMLDomNode;
  nIndex : integer;
  nDeviceIndex : integer;
  stAirconDeviceID : string;
begin
  if node.hasChildNodes then  //getMontoring
  begin
    for i := 0 to node.childNodes.length - 1 do
    begin
      node1 := node.childNodes[i];
      if (node1.nodeType <> NODE_COMMENT) and (node1.nodeType <> NODE_PROCESSING_INSTRUCTION) then
      begin
        if UpperCase(node1.nodeName) = UpperCase('all') then
        begin
          AirconPowerStateMonitoingProcess(node1);
        end else if UpperCase(node1.nodeName) = UpperCase('indoor') then
        begin
          nIndex := XMLAttributeItemIndex(node1,'addr');
          if nIndex > -1 then
          begin
            stAirconDeviceID := UpperCase(node1.attributes.item[nIndex].text);
            stAirconDeviceID := stringReplace(stAirconDeviceID,'.','',[rfReplaceAll]);
            nDeviceIndex := AirconDeviceList.IndexOf(stAirconDeviceID);
            if nDeviceIndex < 0 then continue; //등록되지 않은 시스템 에어콘 상태는 확인 할 필요 없다.
            if node1.hasChildNodes then
            begin
              for j := 0 to node1.childNodes.length - 1 do
              begin
                node2 := node1.childNodes[j];
                if (node2.nodeType <> NODE_COMMENT) and (node2.nodeType <> NODE_PROCESSING_INSTRUCTION) then
                begin
                  if UpperCase(node2.nodeName) = UpperCase('indoorDetail') then
                  begin
                    nIndex := XMLAttributeItemIndex(node2,'power');
                    if nIndex > -1 then
                    begin
                      if UpperCase(node2.attributes.item[nIndex].text) = UpperCase('off') then
                      begin
                        TAirconDevice(AirconDeviceList.Objects[nDeviceIndex]).PowerState := pmOff;
                      end else if UpperCase(node2.attributes.item[nIndex].text) = UpperCase('on') then
                      begin
                        TAirconDevice(AirconDeviceList.Objects[nDeviceIndex]).PowerState := pmOn;
                        if TAirconDevice(AirconDeviceList.Objects[nDeviceIndex]).PowerOffSend = smSending then
                          TAirconDevice(AirconDeviceList.Objects[nDeviceIndex]).PowerOffSend := smReserve;  //전송 했는데 Power On이면 다시 전송 하자
                      end else
                      begin
                        TAirconDevice(AirconDeviceList.Objects[nDeviceIndex]).PowerState := pmNothing;
                        if TAirconDevice(AirconDeviceList.Objects[nDeviceIndex]).PowerOffSend = smSending then
                          TAirconDevice(AirconDeviceList.Objects[nDeviceIndex]).PowerOffSend := smReserve;  //전송 중인데 모르는 경우 다시 전송 하자
                      end;
                    end else
                    begin
                      TAirconDevice(AirconDeviceList.Objects[nDeviceIndex]).PowerState := pmNothing;
                      if TAirconDevice(AirconDeviceList.Objects[nDeviceIndex]).PowerOffSend = smSending then
                          TAirconDevice(AirconDeviceList.Objects[nDeviceIndex]).PowerOffSend := smReserve;  //전송 중인데 모르는 경우 다시 전송 하자
                     end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TDMSNode.CheckXmlData(aData: String; var bData: String): string;
var
  nIndex: Integer;
begin

  Result:= '';
  nIndex := Pos('</root>',aData);
  if nIndex < 1 then
  begin
    bData := aData;
    Exit;
  end;
  result := copy(aData,1,nIndex + Length('</root>'));
  Delete(aData, 1, nIndex + Length('</root>'));
  bData := aData;

end;

procedure TDMSNode.CommNodeTriggerAvail(CP: TObject; Count: Word);
var
  stTemp:String;
  I: Integer;
  nIndex : integer;
  stPacket : string;
  stTemp1:String;
begin
  ReceiveCheckTimer.Enabled := False;
  stTemp:= '';
  for I := 1 to Count do stTemp := stTemp + GetChar;
  L_stComBuffer := L_stComBuffer + stTemp;
  repeat
    stPacket:= CheckXmlData(L_stComBuffer,stTemp1);
    L_stComBuffer:= stTemp1;
    if stPacket <> '' then XmlDataPacketProcess(stPacket);
  until pos('</root>',L_stComBuffer) = 0;
end;

procedure TDMSNode.CommNodeWsConnect(Sender: TObject);
begin
  SocketConnected := True;
end;

procedure TDMSNode.CommNodeWsDisconnect(Sender: TObject);
begin
  SocketConnected := False;
end;

procedure TDMSNode.CommNodeWsError(Sender: TObject; ErrCode: Integer);
begin
  //  SocketOpen := False;
  SocketConnected := False;
end;

constructor TDMSNode.Create(AOwner: TComponent);
begin
  inherited;
  AirconDeviceList := TStringList.Create;
  ReceiveCheckTimer:= TTimer.Create(nil);
  ReceiveCheckTimer.Interval := 5000;
  ReceiveCheckTimer.Enabled := False;
  ReceiveCheckTimer.OnTimer := ReceiveCheckTimerTimer; 

  SocketConnected := False;
  LastConnectedTime:= 0;
  L_stComBuffer := '';

  SocketConnected:= False;
  PasswordAuthState := False;
  SerialNumberAuthState := False;

  LastConnectedTime:= 0;
  L_stComBuffer:= '';

  AutoOpen:= False;
  Open := False;
  DeviceLayer:= dlWinsock;
  WsMode:= wsClient;
  wsTelnet := False;

  NetworkMode:= nmLocal;

  OnTriggerAvail:= CommNodeTriggerAvail;
  OnWsConnect := CommNodeWsConnect;
  OnWsDisconnect := CommNodeWsDisconnect;
  OnWsError := CommNodeWsError;

end;

destructor TDMSNode.Destroy;
var
  i : integer;
begin
  open := False;
  for i := AirconDeviceList.Count - 1 downto 0 do
  begin
    TAirconDevice(AirconDeviceList.Objects[i]).Free;
  end;
  AirconDeviceList.Free;
  inherited;
end;

function TDMSNode.DMSPowerOff_Sending: Boolean;
var
  i : integer;
  bResult : Boolean;
  bSendingResult : Boolean;  //전송중이면
begin
  if AirconDeviceList.Count < 1 then Exit;
  if Not SocketConnected then
  begin
    if SocketOpen then SocketOpen := False
    else SocketOpen := True;    //Socket Open 후에 다시 시도
    Exit;
  end;
  bResult := False;
  bSendingResult := False;
  for i := 0 to AirconDeviceList.Count - 1 do
  begin
    if (TAirconDevice(AirconDeviceList.Objects[i]).PowerOffSend = smReserve) then
    begin
      bResult := True;
      break;
    end;
  end;
  if Not bResult then
  begin
    for i := 0 to AirconDeviceList.Count - 1 do
    begin
      if (TAirconDevice(AirconDeviceList.Objects[i]).PowerOffSend = smSending) then
      begin
        bSendingResult := True;
        break;
      end;
    end;
    if Not bSendingResult then Exit; //전송중인것도 없으면 빠져 나가자
  end;
  if Not SerialNumberAuthState then
  begin
    SocketOpen := False;   //소켓은 접속했는데 시리얼인증은 받지 못한 경우 소켓 Close 후 다시 시도
    Exit;
  end;
  if bSendingResult then
  begin
    AirconPowerMonitoring_Start; //전송 후 상태 확인
  end else
  begin
    AirconPowerOff_Sending;
  end;
  //AirconPowerOff 전송 시작
  //1.Connect 체크
  //2.인증 체크
  //3. 파워 오프 Send

end;

function TDMSNode.GetAirconDevice_PowerMode(
  aAirconDeviceID: string): TPowerMode;
var
  nIndex : integer;
begin
  result := pmNothing;
  nIndex := AirconDeviceList.IndexOf(aAirconDeviceID);
  if nIndex > -1 then
  begin
    result := TAirconDevice(AirconDeviceList.Objects[nIndex]).PowerState;
  end;

end;

function TDMSNode.GetAirconPowerOffXmlData: string;
var
  XMLDoc : TXMLDocument;
  RootNode : IXMLNode;
  FirNode : IXMLNode;
  SecNode : IXMLNode;
  thrNode : IXMLNode;
  fourNode : IXMLNode;
  fiveNode : Array of IXMLNode;
  i : integer;
  nIndex : integer;
begin
  XMLDoc := TXMLDocument.Create(self);
  Try
    XMLDoc.Active := True;
    XMLDoc.Encoding := 'EUC-KR';

    RootNode := XMLDoc.AddChild('root');
    FirNode := RootNode.AddChild('header');
    FirNode.Attributes['sa'] := 'mfc';
    FirNode.Attributes['da'] := 'dms';
    FirNode.Attributes['messageType'] := 'request';
    FirNode.Attributes['dateTime'] := formatDateTime('yyyy-mm-dd hh:nn:ss',now);
    FirNode.Attributes['dvmControlMode'] := 'individual';

    SecNode := RootNode.AddChild('setControl');
    thrNode := SecNode.AddChild('simple');
    thrNode.Attributes['power'] := 'off';
    fourNode := SecNode.AddChild('indoorList');
    SetLength(fiveNode,AirconDeviceList.Count);
    nIndex := 0;
    for i := 0 to AirconDeviceList.Count - 1 do
    begin
      if (TAirconDevice(AirconDeviceList.Objects[i]).PowerOffSend = smReserve) then
      begin
        fiveNode[nIndex] := fourNode.AddChild('indoor');
        fiveNode[nIndex].Attributes['addr'] := copy(AirconDeviceList.Strings[i],1,2) + '.' + copy(AirconDeviceList.Strings[i],3,2) + '.' + copy(AirconDeviceList.Strings[i],5,2);
        TAirconDevice(AirconDeviceList.Objects[i]).PowerOffSend := smSending; //전송중으로 변경
        nIndex := nIndex + 1;
      end;
    end;
    result := XMLDoc.XML.Text + #13#10 + #13#10;
  Finally
    XMLDoc.Free;
  End;

end;

function TDMSNode.GetMonitoringXmlData: string;
var
  XMLDoc : TXMLDocument;
  RootNode : IXMLNode;
  FirNode : IXMLNode;
  SecNode : IXMLNode;
  thrNode : IXMLNode;
begin
  XMLDoc := TXMLDocument.Create(self);
  Try
    XMLDoc.Active := True;
    XMLDoc.Encoding := 'EUC-KR';

    RootNode := XMLDoc.AddChild('root');
    FirNode := RootNode.AddChild('header');
    FirNode.Attributes['sa'] := 'mfc';
    FirNode.Attributes['da'] := 'dms';
    FirNode.Attributes['messageType'] := 'request';
    FirNode.Attributes['dateTime'] := formatDateTime('yyyy-mm-dd hh:nn:ss',now);
    FirNode.Attributes['dvmControlMode'] := 'individual';

    SecNode := RootNode.AddChild('getMonitoring');
    thrNode := SecNode.AddChild('all');
    result := XMLDoc.XML.Text + #13#10 + #13#10;
  Finally
    XMLDoc.Free;
  End;

end;

function TDMSNode.GetPasswordAuthXmlData: string;
var
  XMLDoc : TXMLDocument;
  RootNode : IXMLNode;
  FirNode : IXMLNode;
  SecNode : IXMLNode;
begin
  XMLDoc := TXMLDocument.Create(self);
  Try
    XMLDoc.Active := True;
    XMLDoc.Encoding := 'EUC-KR';

    RootNode := XMLDoc.AddChild('root');
    FirNode := RootNode.AddChild('header');
    FirNode.Attributes['sa'] := 'mfc';
    FirNode.Attributes['da'] := 'dms';
    FirNode.Attributes['messageType'] := 'command';
    FirNode.Attributes['dateTime'] := formatDateTime('yyyy-mm-dd hh:nn:ss',now);
    FirNode.Attributes['dvmControlMode'] := 'individual';

    SecNode := RootNode.AddChild('passwordAuth');
    SecNode.Attributes['password'] := '1234';

    result := XMLDoc.XML.Text + #13#10 + #13#10;
  Finally
    XMLDoc.Free;
  End;
end;

function TDMSNode.GetSerialAuthXmlData: string;
var
  XMLDoc : TXMLDocument;
  RootNode : IXMLNode;
  FirNode : IXMLNode;
  SecNode : IXMLNode;
begin
  XMLDoc := TXMLDocument.Create(self);
  Try
    XMLDoc.Active := True;
    XMLDoc.Encoding := 'EUC-KR';

    RootNode := XMLDoc.AddChild('root');
    FirNode := RootNode.AddChild('header');
    FirNode.Attributes['sa'] := 'mfc';
    FirNode.Attributes['da'] := 'dms';
    FirNode.Attributes['messageType'] := 'command';
    FirNode.Attributes['dateTime'] := formatDateTime('yyyy-mm-dd hh:nn:ss',now);
    FirNode.Attributes['dvmControlMode'] := 'individual';

    SecNode := RootNode.AddChild('shakeSerialNo');
    SecNode.Attributes['serialNo'] := 'SNET20041209094600000';

    result := XMLDoc.XML.Text + #13#10 + #13#10;
  Finally
    XMLDoc.Free;
  End;

end;

Function TDMSNode.PassWordAuth_Start:Boolean;
var
  stXMLData : string;
  PastTime : dword;
begin
  result := False;
  if Not SocketConnected then Exit;
  stXMLData := GetPasswordAuthXmlData;
  SendData(stXMLData);
end;

procedure TDMSNode.ReceiveCheckTimerTimer(Sender: TObject);
begin
  ReceiveCheckTimer.Enabled := False;
  SocketOpen := False; //전송 후 5초가 지났는데도 데이터 수신이 없으면 소켓 Close
end;

procedure TDMSNode.SendData(aData: string);
begin
  ReceiveCheckTimer.Enabled := True;
  PutString(aData);
end;

function TDMSNode.SerialNumberAuth_Start: Boolean;
var
  stXMLData : string;
  PastTime : dword;
begin
  result := False;
  if Not SocketConnected then Exit;
  stXMLData := GetSerialAuthXmlData;
  SendData(stXMLData);
end;

procedure TDMSNode.SetNetworkNode(const Value: TNetworkMode);
begin
  if FNetworkMode <> Value then
  FNetworkMode := Value;
end;

procedure TDMSNode.SetPasswordAuthState(const Value: Boolean);
begin
  if FPasswordAuthState = Value then Exit;
  FPasswordAuthState := Value;
  if Not Value then SocketOpen := False //인증 못 받으면 소켓을 끊자.
  else
  begin
    SerialNumberAuth_Start;
  end;
end;

procedure TDMSNode.SetSerialNumberAuthState(const Value: Boolean);
begin
  FSerialNumberAuthState := Value;
  if Not Value then SocketOpen := False
  else AirconPowerMonitoring_Start;
end;

procedure TDMSNode.SetSocketConnected(const Value: Boolean);
begin
  //SocketOpen := Value;
  if FSocketConnected = Value then Exit;
  FSocketConnected := Value;
  if Assigned(FOnConnected) then
  begin
    OnConnected(Self,Value,DMSNo);
  end;
  if Value then
  begin
    //여기에서 소켓 접속 하면 비밀번호 인증 받자.
    PassWordAuth_Start;
  end;
end;

procedure TDMSNode.SetSocketOpen(const Value: Boolean);
begin
//  if Value then
//    if Not SocketConnected then Open := False;

  if FSocketOpen = Value then Exit;
  FSocketOpen := Value;
  Open := Value;
  if Not Value then
  begin
    SocketConnected := Value;
    PasswordAuthState := Value;
    SerialNumberAuthState := Value;
  end;
end;

function TDMSNode.XMLAttributeItemIndex(node: IXMLDomNode;
  aAttributeName: string): integer;
var
  i,j : integer;
  node1: IXMLDomNode;
begin
  result := -1;
  with node do
  begin
    if attributes.length < 1 then Exit;
    for i := 0 to attributes.length - 1 do
    begin
      if UpperCase(attributes.item[i].nodeName) = UpperCase(aAttributeName) then
      begin
        result := i;
        Exit;
      end;
    end;
  end;
end;

procedure TDMSNode.XmlDataPacketProcess(aData: string);
var
  xml: IXMLDOMDocument;
  NodeList : IXMLDOMNodeList;
  XMLDoc : TXMLDocument;
  xnChild  : IXMLNode;
  xnGrandchild  : IXMLNode ;
  i : Integer;
  j : Integer;
  k : Integer;
  sMsg : string;
  stTemp : string;
  aStream : TStream;
  node: IXMLDomNode;
  node1: IXMLDomNode;
  nodes_se: IXMLDomNodeList;
  nIndex : integer;
begin
  Try
    CoInitialize(nil);
    xml :=CoDOMDocument.Create;
    //xml := CreateOleObject('Microsoft.XMLDOM') as IXMLDOMDocument;
    xml.async := False;
    xml.loadXML(aData);
    if xml.parseError.errorCode <> 0 then
      raise Exception.Create('XML Load error:' + xml.parseError.reason);

    if xml.hasChildNodes then
    begin
      for i := 0 to xml.childNodes.length - 1 do
      begin
        node := xml.childNodes[i];  //root
        if (node.nodeType <> NODE_COMMENT) and (node.nodeType <> NODE_PROCESSING_INSTRUCTION) then
        begin
          if node.hasChildNodes then
          begin
            for j := 0 to node.childNodes.length - 1 do
            begin
              node1 := node.childNodes[j];
              if (node1.nodeType <> NODE_COMMENT) and (node1.nodeType <> NODE_PROCESSING_INSTRUCTION) then
              begin
                if UpperCase(node1.nodeName) = UpperCase('ack') then
                begin
                  nIndex := XMLAttributeItemIndex(node1,'methodName');
                  if nIndex > -1 then
                  begin
                    if UpperCase(node1.attributes.item[nIndex].text) = UpperCase('passwordAuth') then
                    begin
                      nIndex := XMLAttributeItemIndex(node1,'status');
                      if nIndex > -1 then
                      begin
                        if UpperCase(node1.attributes.item[nIndex].text) = UpperCase('true') then PasswordAuthState := True;   //인증성공
                      end;
                    end;
                  end;
                end else if UpperCase(node1.nodeName) = UpperCase('shakeSerialNo') then
                begin
                  SerialNumberAuthState := True;
                end else if UpperCase(node1.nodeName) = UpperCase('treeInfoEx') then
                begin
                  L_bTreeInfoCheck := True;
                end else if UpperCase(node1.nodeName) = UpperCase('getMonitoring') then
                begin
                  AirconPowerStateMonitoingProcess(node1);
                  L_bMonitoringCheck := True;
                end else if UpperCase(node1.nodeName) = UpperCase('getStatusUpload') then
                begin
                  L_bStatusUploadCheck := True;
                end else if UpperCase(node1.nodeName) = UpperCase('setControl') then
                begin
                  L_bAirconPowerOffCheck := True;
                end;
              end;
            end;
          end;
        end;
      end;
    end;

  Finally
    NodeList := nil;
    xml := nil;
    CoUninitialize;
  End;

end;

{ TArmAreaDevice }

constructor TArmAreaDevice.Create(AOwner: TComponent);
begin
  inherited;
  SystemAirconIDList := TStringList.Create;
  WatchMode := cmNothing;
end;

destructor TArmAreaDevice.Destroy;
begin
  SystemAirconIDList.Free;
  inherited;
end;

procedure TArmAreaDevice.SetWatchMode(const Value: TWatchMode);
var
  i : integer;
  nIndex : integer;
begin
  if FWatchMode = Value then Exit;
  FWatchMode := Value;
  if Value = cmArm then //경계중이면 PowerOFF 날리자
  begin
    for i := 0 to SystemAirconIDList.Count - 1 do
    begin
      nIndex := SystemAirConDMSList.IndexOf(copy(SystemAirconIDList.Strings[i],1,3));
      if nIndex > -1 then
      begin
        TDMSNode(SystemAirConDMSList.Objects[nIndex]).AirconDevice_PowerOff(copy(SystemAirconIDList.Strings[i],4,6));
      end;
    end;
  end;
end;

procedure TArmAreaDevice.SystemAirconDevice_Add(aAirconDeviceID: string);
begin
  if SystemAirconIDList.IndexOf(aAirconDeviceID) < 0 then
  begin
    SystemAirconIDList.Add(aAirconDeviceID);
  end;
end;

{ TAirconDevice }

constructor TAirconDevice.Create(AOwner: TComponent);
begin
  inherited;
  PowerState := pmNothing;
  PowerOffSend := smNothing;
end;

destructor TAirconDevice.Destroy;
begin

  inherited;
end;

procedure TAirconDevice.SetPowerState(const Value: TPowerMode);
begin
  FPowerState := Value;
  if Value = pmOff then
  begin
    PowerOffSend := smConFirm; //Off 상태에서는 PowerOff 를 날릴 필요가 없다. 
  end;
end;

end.
