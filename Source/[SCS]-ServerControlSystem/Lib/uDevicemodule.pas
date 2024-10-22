{***************************************************************}
{                                                               }
{  uDeviceModule.Pas :장비관련 루틴                             }
{                                                               }
{  Copyright (c) 2005 this70@naver.com                          }
{                                                               }
{  All rights reserved.                                         }
{                                                               }
{***************************************************************}
unit uDevicemodule;

interface

uses
  //Printf,
  Forms,
  ComCtrls,
  uLomosUtil,
  Dialogs,
  windows,Messages,SysUtils, Classes, OoMisc,ScktComp, AdPort,AdWnPort,AdSocket,
  ExtCtrls, DB, ADODB,uDataModule1;



const
  Msg_DeviceCheck     = WM_USER + 1001;
  Msg_DeviceReg       = WM_USER + 1002;
  Msg_DeviceRemote    = WM_USER + 1003;
  Msg_CardNoDownload  = WM_USER + 1004;
  Msg_TelNoDownload   = WM_USER + 1005;
  Msg_DoorReg         = WM_USER + 2001;

{$DEFINE TApdWinsockport}  //{$DEFINE TClientSocket}
type

{$IFDEF TApdWinsockport}
  TCommNode = class(TApdWinsockport)
{$ELSE}
  TCommNode = class(TClientSocket)
{$ENDIF}

  private
    { Private declarations }
    ADOQuery: TADOQuery;
    FNo: Integer;
    FLocate: String;
    FNetworkMode: TNetworkMode;
    FRemoteConnected: Boolean;
    FOnSendData: TNotifyReceive;
    FNodeNoStr: string;
    procedure SetNo(aValue:Integer);
    Procedure SetLocate(aValue:String);
    Procedure SetNetworkNode(const Value: TNetworkMode);
    Procedure SetRemoteConnected (aValue:Boolean);
    procedure SetNodeNoStr(const Value: string);
  private
    FMCUID: string;
    FSocketConnected: Boolean;
    FOnConnected: TNodeConnect;
    procedure SetMCUID(const Value: string);
    procedure SetSocketConnected(const Value: Boolean);
  protected
    { Protected declarations }
    Send_MsgNo: Integer;
    Rcv_MsgNo : Char;
    FOnRcvGarbageData:    TNotifyReceive;     // 쓰레기 데이터
    FOnRcvInvalidDevice:  TNotifyReceive;     // 목록에 없는 장비
    FOnRcvData:           TNotifyReceive;     // 통신에서 받은 데이터

{$IFDEF TApdWinsockport}
    procedure CommNodeTriggerAvail(CP: TObject; Count: Word);
    procedure CommNodeWsConnect(Sender: TObject);
    procedure CommNodeWsDisconnect(Sender: TObject);
    procedure CommNodeWsError(Sender: TObject; ErrCode: Integer);
{$ELSE}
    procedure CommNodeTriggerAvail(Sender : TObject ; Socket : TCustomWinSocket) ;
    procedure CommNodeWsConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure CommNodeWsDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure CommNodeWsError(Sender : TObject ; Socket : TCustomWinSocket ;
                        ErrorEvent : TErrorEvent ; var ErrorCode : Integer) ;
{$ENDIF}
    Procedure ACC_sendData(aEcuId:CString; aData:CString);
    function  CheckDataPacket(aData:String; var bData:String):string;

  public
    { Public declarations }
    ReserveSendDataList: TStringList; //내보낼 데이터 목록
    CardSendDataList: TStringList; // 카드데이터 내보낼 목록
    QuickSendDataList: TStringList; // 먼저 내보낼 데이터 목록
    Devices: TStringList;             //등록된 기기 목록
    LastConnectedTime: TDatetime;
    ReceivedLastpacket: String;
    ComBuff: String;
    L_nCardDataSend : integer; //카드데이터 쉬자...
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    Procedure ExecSendPacket;
    Procedure DataPacektProcess(aData: string);
    procedure FireRecovery;

    function  SendPacket(aEcuId: String; aCmd:Char; aData: String; aQuick:Boolean;aType:integer = 0):Boolean;
  published
    { Published declarations }
    Property No: Integer Read FNo write SetNo;
    Property Locate: String Read FLocate write SetLocate;
    Property MCUID: string read FMCUID write SetMCUID;
    Property NetworkMode: TNetworkMode read FNetworkMode write SetNetworkNode;
    Property RemoteConnected: Boolean read FRemoteConnected write SetRemoteConnected; 
    property OnRcvGarbageData: TNotifyReceive read FOnRcvGarbageData write FOnRcvGarbageData;
    ProPerty OnRcvInvalidDevice: TNotifyReceive read FOnRcvInvalidDevice write FOnRcvInvalidDevice;
    ProPerty OnRcvData : TNotifyReceive read FOnRcvData write FOnRcvData;
    ProPerty OnSendData : TNotifyReceive read FOnSendData write FOnSendData;
    ProPerty NodeNoStr : string Read FNodeNoStr Write SetNodeNoStr;
    ProPerty OnConnected : TNodeConnect read FOnConnected Write FOnConnected;
    ProPerty SocketConnected : Boolean read FSocketConnected Write SetSocketConnected;
  end;


  TDevice = Class(TComponent)
  private
    FDeviceID: String;
    FACType: TDeviceType;  //출입사용유무
    FATType: TDeviceType;  //근태사용타입
    FFDType: TDeviceType;  //식수사용유무
    FPTType: TDeviceType;  //방범사용유무
    FCommNode: TCommNode;
    FWatchMode: TWatchMode;                       // 경비모드
    FOnNotDefineData:     TNotifyReceive;         // 정의 않된 데이터 데이터
    FOnRcvAlarmData:      TAlarmEvent;         // 경보 데이터
    FOnRcvDoorControl:    TNotifyReceive;         // 등록 응답 데이터
    FOnRcvChangeDoorData: TNotifyReceive;         // 원격제어 응답 데이터
    FOnRegisterClear:     TNotifyReceive;         // 메모리지움버튼 데이터 응답시
    FOnRcvInitAckData:    TNotifyReceive;         // 전화 로그데이터 응답 데이터
    FOnRcvRegCardData:    TNotifyReceive;         // 카드 리드 데이터
    FOnRcvTellogData:     TNotifyReceive;         // 도어 상태 데이터
    FOnRcvDoorSetup:      TNotifyReceive;         // 도어 제어 데이터
    FOnRcvCardReadData:   TNotifyReceive;         // 도어 설정 데이터
    FOnRcvRegSchedule:    TNotifyReceive;         // 스케줄 데이터 등록 응답
    FOnRcvRemoteAckData:  TNotifyReceive;
    FOnRcvERRORData:      TNotifyReceive;         // ERROR Data
    FOnConnected:         TConnectType;           //Connect 유무

    FConnected: Boolean;
    FNodeNO: integer;
    FFDAMTPER: integer;
    FDeviceName: String;
    FECUID: String;
    FDoorManageMode: TDoorManageMode;
    FDoorState: TDoorState;
    FDoorManageMode2: TDoorManageMode;
    FDoorManageMode1: TDoorManageMode;
    FOnDoorManageModeChange: TDoorManageModeChangeType;
    FDoorState1: TDoorState;
    FDoorState2: TDoorState;
    FOnDoorStateChange: TDoorStateChangeType;
    FOnDoorPNModeChange: TDoorPNModeChangeType;
    FDoorPNMode1: TDoorPNMode;
    FDoorPNMode2: TDoorPNMode;
    FOnWatchModeChange: TWatchModeChangeType;
    FOnDoorModeChange: TDoorModeChangeType;
    FOnRcvFTPProcessData: TNotifyReceive;
    FFireServerCommand: Boolean;
    FDeviceSkillReceive: Boolean;
    FJavaraCloseCommand: Boolean;
    FJavaraOpenCommand: Boolean;

    procedure SetCommNode(const Value: TCommNode);
    procedure SetDeviceID(const Value: String);
    procedure SetConnected(const Value: Boolean);

    Procedure SetWatchMode(const Value: TWatchMode);
    procedure SetAcType(const Value: TDevicetype);
    procedure SetAtType(const Value: TDevicetype);
    procedure SetFdType(const Value: TDevicetype);
    procedure SetPtType(const Value: TDevicetype);
    procedure SetNodeNO(const Value: integer);
    procedure SetFoodAmt(const Value: integer);
    procedure SetDeviceName(const Value: String);
    procedure SetECUID(const Value: String);
    procedure SetDoorManageMode1(const Value: TDoorManageMode);
    procedure SetDoorManageMode2(const Value: TDoorManageMode);
    procedure SetDoorState1(const Value: TDoorState);
    procedure SetDoorState2(const Value: TDoorState);
    procedure SetDoorPNMode1(const Value: TDoorPNMode);
    procedure SetDoorPNMode2(const Value: TDoorPNMode);
    procedure SetFireServerCommand(const Value: Boolean);
    procedure SetDeviceSkillReceive(const Value: Boolean);
    procedure SetJavaraCloseCommand(const Value: Boolean);
    procedure SetJavaraOpenCommand(const Value: Boolean);

  protected
    Procedure DataPacektProcess(aData: string; NodeNo:integer);
    Procedure SendAckforaccess(aMsgCount:String);
    procedure DeviceRecvAlarmData(aNodeNo:integer;aCommand,aData:string);
    procedure DoorModeState(aNodeNo:integer;aData:string);
    procedure DoorControlState(aNodeNo:integer;aData:string);
    procedure DoorSetupState(aNodeNo:integer;aData:string);
    procedure RcvRemoteAckData(NodeNO:integer;aCommand,aData:string);
    Function  GetSystemSkill(aEcuID,aData:string):Boolean;
  public
    L_stHolidaySend : string;  // 휴일 등록 전문 01 W
    L_bHolidayRecv : Boolean; //휴일 등록 응답 유무
    LastPollingTime: TDatetime;
    L_stServerControlData : string;
    L_bServerDoorControlCheck : Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    Procedure  SendPacket(aCmd:Char; aData: String;aQuick:Boolean = False;aType:integer=0);
    Procedure  CD_Download(aCardNo:String; ValidDay: String; cardType:Char; RegCode:Char; aTimeCode:Char; func:Char;
                           aQuick:Boolean = False;aPositionNum:integer = 0;aCardPosition:Boolean = False);
    Procedure  DoorModeChange(aDoorNo: Char;  aMode:Char;aQuick:Boolean=True);
    Procedure  TimeSync;
    procedure  CheckDoorState(aDoorNo: Char;aQuick:Boolean = False);
    Procedure  DoorExitButton(aDoorNo: Char);
    Procedure  SendDoorSchadule(aDoor:Char;aDay:Char;aData:String;aQuick:Boolean = False);
    Procedure  ChangewatchMode(aMode:TWatchMode);
    Procedure  CheckWatchMode(aQuick:Boolean = False);
    procedure  DeviceDoorInfoSearch(aDoor:string);
    procedure  DeviceDoorInfoSetting(aDoor,aCardMode,aDoorMode,aDoorControlTime,aOpenMoni,aUseSch,aSendDoor,aAlarmLong,
               aFire,aLockType,aDSOpen,aRemoteDoor:string);
    Procedure  ReBoot;
    Function   Holiday(aCmd:Char;aDate,aDoorNo:string):Boolean;
    procedure  ServerCarDataSend(aCardReaderNo,aCardData:string);
    procedure CardTypeSearch;
    Function   ServerDoorControl(aReaderNo,aDoorNo,aKey,aCardNo,aAuth:string):integer;
    procedure  CardModeChange(aDoorNo: Char;  aMode:Char);
    Procedure  CheckSystemSkill(aQuick:Boolean = False);
    procedure  FireOutbreak(aQuick:Boolean = False);  //화재발생처리

  published
    Property NodeNo: integer Read FNodeNO write SetNodeNO;
    Property DeviceID: String Read FDeviceID write SetDeviceID;
    Property ECUID: String Read FECUID write SetECUID;
    Property DeviceName: String Read FDeviceName write SetDeviceName;
    Property ATtype: TDevicetype Read FATtype write SetAtType;
    Property ACtype: TDevicetype Read FACtype write SetAcType;
    Property FDtype: TDevicetype Read FFDtype write SetFdType;
    Property PTtype: TDevicetype Read FPTtype write SetPtType;
    Property CommNode: TCommNode Read FCommNode write SetCommNode;
    Property Connected: Boolean Read FConnected write SetConnected;
    Property WatchMode: TWatchMode read FWatchMode write SetWatchMode;
    Property FoodAmtPer : integer Read FFDAMTPER write SetFoodAmt;
    Property DoorManageMode1 : TDoorManageMode Read FDoorManageMode1 write SetDoorManageMode1;
    Property DoorPNMode1 : TDoorPNMode Read FDoorPNMode1 write SetDoorPNMode1;
    Property DoorState1 : TDoorState Read FDoorState1 write SetDoorState1;
    Property DoorManageMode2 : TDoorManageMode Read FDoorManageMode2 write SetDoorManageMode2;
    Property DoorPNMode2 : TDoorPNMode Read FDoorPNMode2 write SetDoorPNMode2;
    Property DoorState2 : TDoorState Read FDoorState2 write SetDoorState2;
    property DeviceSkillReceive : Boolean Read FDeviceSkillReceive Write SetDeviceSkillReceive; //기능 점검 수신여부
    Property FireServerCommand : Boolean Read FFireServerCommand Write SetFireServerCommand; //화재발생을 서버에서 내리는 명령
    Property JavaraOpenCommand : Boolean Read FJavaraOpenCommand Write SetJavaraOpenCommand; //자바라열림 기능
    Property JavaraCloseCommand : Boolean Read FJavaraCloseCommand Write SetJavaraCloseCommand; //자바라닫힘 기능

    property OnRcvAlarmData:      TAlarmEvent read FOnRcvAlarmData       write FOnRcvAlarmData;
    property OnRcvInitAckData:    TNotifyReceive read FOnRcvInitAckData     write FOnRcvInitAckData;
    property OnRegisterClear:     TNotifyReceive read FOnRegisterClear      write FOnRegisterClear;
    property OnRcvRemoteAckData:  TNotifyReceive read FOnRcvRemoteAckData   write FOnRcvRemoteAckData;
    property OnRcvFTPProcessData:  TNotifyReceive read FOnRcvFTPProcessData   write FOnRcvFTPProcessData;
    property OnRcvTellogData:     TNotifyReceive read FOnRcvTellogData      write FOnRcvTellogData;
    property OnRcvCardReadData:   TNotifyReceive read FOnRcvCardReadData    write FOnRcvCardReadData;
    property OnRcvChangeDoorData: TNotifyReceive read FOnRcvChangeDoorData  write FOnRcvChangeDoorData;
    property OnRcvDoorControl:    TNotifyReceive read FOnRcvDoorControl     write FOnRcvDoorControl;
    property OnRcvDoorSetup:      TNotifyReceive read FOnRcvDoorSetup       write FOnRcvDoorSetup;
    property OnRcvRegCardData:    TNotifyReceive read FOnRcvRegCardData     write FOnRcvRegCardData;
    property OnNotDefineData:     TNotifyReceive read FOnNotDefineData      write FOnNotDefineData;
    property OnRcvRegSchedule:    TNotifyReceive read FOnRcvRegSchedule     write FOnRcvRegSchedule;
    Property OnErrorData:         TNotifyReceive read FOnRcvERRORData       write FOnRcvERRORData;
    Property OnConnected:         TConnectType   read FOnConnected          write FOnConnected;
    Property OnDoorManageModeChange:         TDoorManageModeChangeType   read FOnDoorManageModeChange          write FOnDoorManageModeChange;
    Property OnDoorPNModeChange:         TDoorPNModeChangeType   read FOnDoorPNModeChange          write FOnDoorPNModeChange;
    Property OnDoorStateChange:         TDoorStateChangeType   read FOnDoorStateChange          write FOnDoorStateChange;
    Property OnWatchModeChange:         TWatchModeChangeType   read FOnWatchModeChange          write FOnWatchModeChange;
    property OnDoorModeChange: TDoorModeChangeType read FOnDoorModeChange write FOnDoorModeChange;
  end;

  TComModule = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var

//  DebugScreen: TPrintf;
  ComModule: TComModule;

implementation
{$R *.dfm}


{ TCommNode ===================================================================}
constructor TCommNode.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

{$IFDEF TApdWinsockport}
  ReserveSendDataList:=  TStringList.Create;
  ReserveSendDataList.Clear;
  QuickSendDataList:= TStringList.Create;
  QuickSendDataList.Clear;
  CardSendDataList := TStringList.Create;
  CardSendDataList.Clear;
  Devices:= TStringList.Create;
  Devices.Sorted := True;
  Devices.Duplicates:= dupIgnore;

  SocketConnected:= False;
  ReceivedLastpacket:= '';
  LastConnectedTime:= 0;
  ComBuff:= '';
  Send_MsgNo:= 0;
  Rcv_MsgNo:= '0';
  AutoOpen:= False;
  DeviceLayer:= dlWinsock;
  WsMode:= wsClient;

  NetworkMode:= nmLocal;
  RemoteConnected:= False;


  OnTriggerAvail:= CommNodeTriggerAvail;
  OnWsConnect := CommNodeWsConnect;
  OnWsDisconnect := CommNodeWsDisconnect;
  OnWsError := CommNodeWsError;

{$ELSE}

  ReserveSendDataList:=  TStringList.Create;
  CardSendDataList := TStringList.Create;
  QuickSendDataList := TStringList.Create;
  Devices:= TStringList.Create;
  Devices.Sorted := True;
  Devices.Duplicates:= dupIgnore;

  SocketConnected:= False;
  ReceivedLastpacket:= '';
  LastConnectedTime:= 0;
  ComBuff:= '';
  Send_MsgNo:= 0;
  Rcv_MsgNo:= '0';
  active := false ;
  ClientType := ctNonBlocking ;

  NetworkMode:= nmLocal;
  RemoteConnected:= False;
 
  OnRead := CommNodeTriggerAvail;
  OnConnect := CommNodeWsConnect;
  OnDisConnect := CommNodeWsDisconnect;
  OnError := CommNodeWsError;
{$ENDIF}

  L_nCardDataSend := 0;

end;

destructor TCommNode.Destroy;
var
  I: Integer;
begin

  ReserveSendDataList.Free;
  CardSendDataList.Free;
  QuickSendDataList.Free;


  for I:= 0 to Devices.Count-1 do
  begin
    if Assigned( Devices.Objects[I]) then
      TDevice(Devices.Objects[I]).Free;
   end;
  Devices.Free;

  inherited Destroy;
end;

{$IFDEF TApdWinsockport}
procedure TCommNode.CommNodeTriggerAvail(CP: TObject; Count: Word);
var
  st: string;
  st2: string;
  aIndex: Integer;
  I: Integer;
begin

  LastConnectedTime:= Now;
  st:= '';
  for I := 1 to Count do st := st + GetChar;
  ComBuff:= ComBuff + st;
  aIndex:= Pos(STX,ComBuff);

  if aIndex = 0 then Exit;

  if aIndex > 1 then
  begin
    //STX 가 처음이 아니면 STX앞데이터 삭제
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 ERR_PROTOCOL_0001,copy(comBuff,1,aIndex-1));
    Delete(ComBuff,1,aIndex-1);
  end;
  if Length(Combuff) < 21 then Exit;
  repeat
    st:= CheckDataPacket(ComBuff,st2);
    ComBuff:= st2;
    if st <> '' then DataPacektProcess(st);
  until pos(ETX,comBuff) = 0;

end;

{$ELSE}
procedure TCommNode.CommNodeTriggerAvail(Sender : TObject ; Socket : TCustomWinSocket);
var
  st: string;
  st2: string;
  aIndex: Integer;
  I: Integer;
  nReturnCode : integer;
  szBuffer: array[0..MAXBUFFSIZE] of Char;
begin

  LastConnectedTime:= Now;

  nReturnCode := 1;

  while (nReturnCode > 0) do
  begin
    FillChar(szBuffer, SizeOf(szBuffer), 0);
   nReturnCode := Socket.ReceiveBuf(szBuffer, SizeOf(szBuffer));
    if nReturnCode > 0 then
      ComBuff := ComBuff + szBuffer;
  end;

  aIndex:= Pos(STX,ComBuff);

  if aIndex = 0 then Exit;

  if aIndex > 1 then
  begin
    //STX 가 처음이 아니면 STX앞데이터 삭제
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 ERR_PROTOCOL_0001,copy(comBuff,1,aIndex-1));
    Delete(ComBuff,1,aIndex-1);
  end;
  if Length(Combuff) < 21 then Exit;
  repeat
    st:= CheckDataPacket(ComBuff,st2);
    ComBuff:= st2;
    if st <> '' then DataPacektProcess(st);
  until pos(ETX,comBuff) = 0;

end;
{$ENDIF}


function TCommNode.CheckDataPacket(aData: String; var bData:String):String;
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
     //ShowMessage(toHExstr(aData));
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

Procedure TCommNode.DataPacektProcess(aData: string);
var
  aKey: Byte;
  st: string;
  aCommand: Char;
  stEcuId: String;
  DeviceIndex: Integer;
  StatusCode: String;
  aSubCLass:String;
  //ACKStr: String[200];
  //ACKStr2: String[200];

begin

  if aData = '' then Exit;

  //058 K1100000203Aan20061201162319EX0300dNF*************C0

  //31:Q++()./,-**s*S^**+()./,-()
  aKey:= Ord(aData[5]);
  st:= Copy(aData,1,5) + EncodeData(aKey,Copy(aData,6,Length(aData)-6));
  aData:= st;
  MCUID := Copy(aData,8,7);
  stEcuId:= Copy(aData,15,2);
  aSubCLass := copy(aData,34,2);
  aCommand:= aData[17];
  Rcv_MsgNo:= aData[18];

  StatusCode:= Copy(aData,41,2);
  //데이터 수신현황에 데이터 뿌려줌 {TO DO}
  if Assigned(FOnRcvData) then
  begin
    OnRcvData(Self,aData,NO);
  end;

  //이전에 받은 패킷과 같은 데이터 이면
  if ReceivedLastpacket = aData then
  begin
    if (aCommand = 'c') AND (UpperCase(aData[19]) = 'K') then
    begin
        st:='Y' + Copy(aData,20,2)+'  '+'a';
        ACC_sendData(stEcuId, st);
    end;
    ReceivedLastpacket:= aData;
    Exit;
  end else
  begin
     ReceivedLastpacket:= aData;
  end;

  DeviceIndex:= Devices.IndexOf(FillZeroNumber(No,3) + stEcuId);
  if DeviceIndex > -1 then //목록에 존재 하면
  begin

       if Pos('COMM ERROR',aData) > 0 then
       //if (pos('Bad Command',aData) > 0) or (pos('COMM ERROR',aData) > 0 ) then
       begin
          TDevice(Devices.Objects[DeviceIndex]).Connected:= False;
       end else if (aSubCLass = 'MN') or (aSubCLass = 'EX')then
       begin
         if StatusCode = 'NF' then TDevice(Devices.Objects[DeviceIndex]).Connected:= False
         else                      TDevice(Devices.Objects[DeviceIndex]).Connected:= True;
       end ;

     TDevice(Devices.Objects[DeviceIndex]).DataPacektProcess(aData ,No);
  end else
  begin
    //목록에 존재 하지 않으면 
    if (aCommand = 'c') AND (UpperCase(aData[19]) = 'K') then
    begin
        st:='Y' + Copy(aData,20,2)+'  '+'a';
        ACC_sendData(stEcuId, st);
    end;
    if Assigned(FOnRcvInvalidDevice) then  OnRcvInvalidDevice(Self,aData,No);
  end;

  {ACK응답과 알람/출입통제 데이터는 ACK를 보내지 않는다}
  if (aCommand <> 'a') AND (aCommand <> 'A') AND (aCommand <> 'c') then
  //if (aCommand <> 'a') AND (aCommand <> 'E') then  //임시 test
  begin
    SendPacket(stEcuId,'a','',True);
  end;

end;
{$IFDEF TApdWinsockport}
procedure TCommNode.CommNodeWsConnect(Sender: TObject);
var
  I: Integer;
begin
  SocketConnected:= True;
  LastConnectedTime:= Now;

end;
{$ELSE}
procedure TCommNode.CommNodeWsConnect(Sender: TObject; Socket: TCustomWinSocket);
var
  I: Integer;
begin
  SocketConnected:= True;
  LastConnectedTime:= Now;
  // 여기에서 클라이언트에 연결 데이터 전송

end;
{$ENDIF}
{$IFDEF TApdWinsockport}
procedure TCommNode.CommNodeWsDisconnect(Sender: TObject);
var
  I: Integer;
begin
  SocketConnected:= False;
  LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Disconnect '+ wsAddress);

  For I:= 0 to Devices.Count -1 do
  begin
    if Assigned(Devices.Objects[I]) then
    begin
      TDevice(Devices.Objects[I]).Connected:= False;

    end;
  end;

end;
{$ELSE}
procedure TCommNode.CommNodeWsDisconnect(Sender: TObject; Socket: TCustomWinSocket);
var
  I: Integer;
begin
  SocketConnected:= False;
  LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Disconnect '+ Socket.RemoteAddress);
  // 여기에서 클라이언트에 끊김 데이터 전송

  For I:= 0 to Devices.Count -1 do
  begin
    if Assigned(Devices.Objects[I]) then
    begin
      TDevice(Devices.Objects[I]).Connected:= False;

    end;
  end;

end;
{$ENDIF}
{$IFDEF TApdWinsockport}

procedure TCommNode.CommNodeWsError(Sender: TObject; ErrCode: Integer);
var
  I: Integer;
begin
  ErrCode := 0;
  SocketConnected:= False;
  LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect '+ wsAddress);

  For I:= 0 to Devices.Count -1 do
  begin
    if Assigned(Devices.Objects[I]) then TDevice(Devices.Objects[I]).Connected:= False;
  end;

end;

{$ELSE}
procedure TCommNode.CommNodeWsError(Sender : TObject ; Socket : TCustomWinSocket ;
                        ErrorEvent : TErrorEvent ; var ErrorCode : Integer) ;
var
  I: Integer;
begin
  ErrCode := 0;

  SocketConnected:= False;
  LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect '+ Socket.RemoteAddress);
  Socket.Close;
  ErrorCode := 0;

  // 여기에서 클라이언트에 끊김 데이터 전송
  For I:= 0 to Devices.Count -1 do
  begin
    if Assigned(Devices.Objects[I]) then TDevice(Devices.Objects[I]).Connected:= False;
  end;

end;
{$ENDIF}

function TCommNode.SendPacket(aEcuId: String; aCmd:Char; aData: String; aQuick:Boolean;aType:integer = 0):Boolean;
var
  ErrCode: Integer;
  ACKStr: String;
  ACKStr2: String;
  aDataLength: Integer;
  aLengthStr: String;
  aKey:Integer;
  aMsgNo: Integer;
  I: Integer;
  st: string;
  stDeviceID : string;
begin
  Result:= False;
{$IFDEF TApdWinsockport}    //접속되어 있지 않은 기기에는 정보를 내려 보내지 말자.
//  if Not Open then Exit;
{$ELSE}
//   if Not Socket.Connected then Exit;
{$ENDIF}

  if MCUID = '' then MCUID := '0000000';
  stDeviceID := MCUID + aEcuId;

  aDataLength:= 21 + Length(aData);
  aLengthStr:= FillZeroNumber(aDataLength,3);

  if aCmd = 'a' then //응답 처리
  begin
    ACkStr:= STX +aLengthStr+  #$20+'K1'+ stDeviceID+ aCmd+Rcv_MsgNo;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
    aKey:= $20;
    ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;
  end else //제어 or 등록
  begin
    aMsgNo:= Send_MsgNo;
    ACkStr:= STX +aLengthStr+ #$20+'K1'+ stDeviceID+ aCmd+InttoStr(aMsgNo) +aData;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
    aKey:= Ord(ACkStr[5]);
    ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;


    if aMsgNo >= 9 then  Send_MsgNo:= 0
    else                 Send_MsgNo:= aMsgNo + 1;
  end;


  if aQuick then
  begin
    QuickSendDataList.Add(ACKStr2);

{$IFDEF TApdWinsockport}
//    PutString(ACKStr2);
//    FlushOutBuffer;
{$ELSE}
//    Socket.SendText(ACKStr2);
{$ENDIF}

    //송신상태현황 Display {To Do}
//    if Assigned(FOnSendData) then
//    begin
//      OnSendData(Self,ACKStr2,No);
//    end;
  end else
  begin
    if aType = 0 then ReserveSendDataList.Add(ACKStr2)
    else if aType = 1 then CardSendDataList.Add(ACKStr2);
  end;

  Result:= True;
end;


Procedure TCommNode.ExecSendPacket;
var
  I: Integer;
  st: string;
begin

{$IFDEF TApdWinsockport}
  if not Open then  Exit;
{$ELSE}
  if Not Socket.Connected then  Exit;
{$ENDIF}

  if QuickSendDataList.Count > 0 then
  begin
    st:= QuickSendDataList[0];
{$IFDEF TApdWinsockport}
    PutString(st);
    FlushOutBuffer;
{$ELSE}
    Socket.SendText(st);
{$ENDIF}
    //여기에서 데이터 송신현황 조회 {TO DO}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,st,No);
    end;
    QuickSendDataList.Delete(0);
    L_nCardDataSend := 0;
    Exit;
  end;

  if ReserveSendDataList.Count > 0 then
  begin
    st:= ReserveSendDataList[0];
{$IFDEF TApdWinsockport}
    PutString(st);
    FlushOutBuffer;
{$ELSE}
    Socket.SendText(st);
{$ENDIF}
    //여기에서 데이터 송신현황 조회 {TO DO}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,st,No);
    end;
    ReserveSendDataList.Delete(0);
    L_nCardDataSend := 0;
    Exit;
  end;

  if CardSendDataList.Count > 0 then
  begin
    inc(L_nCardDataSend);
    if L_nCardDataSend < 2 then Exit;  //카드데이터는 한타임 쉬자.
    st:= CardSendDataList[0];
{$IFDEF TApdWinsockport}
    PutString(st);
    FlushOutBuffer;
{$ELSE}
    Socket.SendText(st);
{$ENDIF}
    //여기에서 데이터 송신현황 조회 {TO DO}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,st,No);
    end;
    CardSendDataList.Delete(0);
    SendCardTime := getTickCount; //마지막 카드데이터 송신한 시간을 가지자.

    Exit;
  end;

end;



procedure TCommNode.SetLocate(aValue: String);
begin
  if Flocate <> aValue then
    FLocate:= aValue;
end;


procedure TCommNode.SetNo(aValue: Integer);
begin
  if FNo <> aValue then
    FNo:= aValue;
end;

procedure TCommNode.SetNetworkNode(const Value: TNetworkMode);
begin
  if FNetworkMode <> Value then
  FNetworkMode := Value;
end;

procedure TCommNode.SetRemoteConnected(aValue: Boolean);
var
  I: Integer;
begin
  if FRemoteConnected <> aValue then
  begin
    FRemoteConnected:= aValue;
    if aValue then
    begin
      SocketConnected:= True;
      LastConnectedTime:= Now;
    end else
    begin
      SocketConnected:= False;
{$IFDEF TApdWinsockport}
      LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Disconnect '+ WsAddress);
{$ELSE}
      LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Disconnect '+ Socket.RemoteAddress);
{$ENDIF}

      For I:= 0 to Devices.Count -1 do
      begin
        if Assigned(Devices.Objects[I]) then
        begin
          TDevice(Devices.Objects[I]).Connected:= False;

        end;
      end;
    end;
  end;

end;

{ TCommNode = END =============================================================}


{ TDevice =====================================================================}


constructor TDevice.Create(AOwner: TComponent);
begin
  DeviceID:= '000000000000';
  ATtype:= dtnothing;
  ACtype:= dtnothing;
  PTtype:= dtnothing;
  FDtype:= dtnothing;
  Connected:= False;
  WatchMode:= cmNothing;
  LastPollingTime:= 0;
  DoorManageMode1 := dmNothing;
  DoorState1 := dsNothing;
  DoorManageMode2 := dmNothing;
  DoorState2 := dsNothing;

  DeviceSkillReceive := False;
  FireServerCommand := False;
  JavaraOpenCommand := False;
  JavaraCloseCommand := False;
  inherited Create(AOwner);
end;

procedure TDevice.SendAckforaccess(aMsgCount:String);
var
  st: string;
begin
  //st:=#$90 + aMsgCount+'  '+#$80;
  st:='Y' + aMsgCount+'  '+'a';
  Self.FCommNode.SendPacket(ECUID,'c',st,True);
end;

procedure TDevice.DataPacektProcess(aData: string; NodeNo:integer);
var
  aCommand: Char;
  MSG_Code: Char;
begin

  {받은 데이터 커맨드별 처리}
  { ================================================================================
  "A" = Alarm Data
  "E" = Error
  "I" = Initial Data
  "R" = Remote Command
  "e" = ENQ
  "a" = ACK
  "n" = NAK
  "r" = Remote Answer
  "c" = Access Control data
  ★ c(출입통제 데이터)인경우에는 ACK 를 'c' command를 만들어 응답을 해야 한다.
  즉 ACK 응답을 두번 주어야 한다.(①전체 패킷응답,②출입통제 응답)
   ================================================================================ }
  aCommand:= aData[17];
  //058 K1100000203Aan20061201162319EX0300dNF*************C0

  if (UpperCase(aCommand) <> 'A') and
     (aCommand <> 'E') then
  begin
    Connected:= True;
  end;

  case aCommand of
    'e': begin //폴링 데이터
           //Connected:= True;
           LastPollingTime:= Now;
         end;
    'A','o': begin // 알람 데이터
           DeviceRecvAlarmData(NodeNo,aCommand,aData);
         end;
    'i': begin // Ack Device Set up
           if Assigned(FOnRcvInitAckData) then OnRcvInitAckData(Self,aData,NodeNO);
         end;
    'r': begin // Ack Remotecontrol
           RcvRemoteAckData(NodeNO,aCommand,aData);
           if Assigned(FOnRcvRemoteAckData) then OnRcvRemoteAckData(Self,aData,NodeNO);
         end;
    'E': begin  //ERROR Data;
           if Assigned(FOnRcvERRORData) then OnErrorData(Self,aData,NodeNO);
         end;
    'F': begin // Ack Remotecontrol
           if Assigned(FOnRcvRemoteAckData) then OnRcvRemoteAckData(Self,aData,NodeNO);
         end;
    '#': begin // FTP 전송 상태 표시
           if Assigned(FOnRcvFTPProcessData) then OnRcvFTPProcessData(Self,aData,NodeNO);
         end;
    'M': begin
           if Pos('Register Default Set',aData) > 0 then
           begin
            if Assigned(FOnRegisterClear) then OnRegisterClear(Self,aData,NodeNO);
           end;
         end;

    'c': begin
           MSG_Code:= aData[19];
           if useProcessCount then
           begin
              if G_nProcessCount > G_nMaxProcessCount then Exit; //최대 프로세스 갯수를 초과 하면 처리하지 말고 빠지자.
              FCS.Enter;
              inc(G_nProcessCount);
              FCS.Leave;
           end;
           SendAckforaccess(Copy(aData,20,2));
           case MSG_Code of
             'F' ://전화 로그 데이터 처리
                begin
                  //SendAckforaccess(Copy(aData,20,2));
                  if Assigned(FOnRcvTellogData) then
                  begin
                    OnRcvTellogData(Self,aData,NodeNO);
                  end else
                  begin
                    if useProcessCount then
                    begin
                      FCS.Enter;
                      G_nProcessCount := G_nProcessCount - 1;
                      FCS.Leave;
                    end;
                  end;
                end;
             'E' ://카드 데이터(출입) 처리
                begin
                  //SendAckforaccess(Copy(aData,20,2));
                  DoorModeState(NodeNO,aData);
                  if Assigned(FOnRcvCardReadData) then
                  begin
                    OnRcvCardReadData(Self,aData,NodeNO);
                  end else
                  begin
                    if useProcessCount then
                    begin
                      FCS.Enter;
                      G_nProcessCount := G_nProcessCount - 1;
                      FCS.Leave;
                    end;
                  end;
                end;
             'D' ://문 상태 변경 처리
                begin
                  if useProcessCount then
                  begin
                    FCS.Enter;
                    G_nProcessCount := G_nProcessCount - 1;
                    FCS.Leave;
                  end;
                  //SendAckforaccess(Copy(aData,20,2));
                  DoorModeState(NodeNO,aData);
                  //if Assigned(FOnRcvChangeDoorData) then OnRcvChangeDoorData(Self,aData,NodeNO);
                end;
             'c' ://문제어 응답
                begin
                  if useProcessCount then
                  begin
                    FCS.Enter;
                    G_nProcessCount := G_nProcessCount - 1;
                    FCS.Leave;
                  end;
                  DoorControlState(NodeNo,aData);
                  //if Assigned(FOnRcvDoorControl) then OnRcvDoorControl(Self,aData,NodeNO);
                end;
             'a','b','g'://출입통제 등록 웅답
                begin
                  DoorSetupState(NodeNo,aData);
                  if Assigned(FOnRcvDoorSetup) then
                  begin
                    OnRcvDoorSetup(Self,aData,NodeNO);
                  end else
                  begin
                    if useProcessCount then
                    begin
                      FCS.Enter;
                      G_nProcessCount := G_nProcessCount - 1;
                      FCS.Leave;
                    end;
                  end;

                end;
             'l','m','n','j','f':// 카드 데이터 등록 응답
                begin
                  if Assigned(FOnRcvRegCardData) then
                  begin
                    OnRcvRegCardData(Self,aData,NodeNO);
                  end else
                  begin
                    if useProcessCount then
                    begin
                      FCS.Enter;
                      G_nProcessCount := G_nProcessCount - 1;
                      FCS.Leave;
                    end;
                  end;
                end;
             's' : //스케줄 데이터 등록 응답
                begin
                  if Assigned(FOnRcvRegSchedule) then
                  begin
                    OnRcvRegSchedule(Self,aData,NodeNO);
                  end else
                  begin
                    if useProcessCount then
                    begin
                      FCS.Enter;
                      G_nProcessCount := G_nProcessCount - 1;
                      FCS.Leave;
                    end;
                  end;
                end;
             'q' : //휴일등록 응답
                begin
                  if copy(aData,20,4) = L_stHolidaySend then
                  begin
                    L_bHolidayRecv := True;
                  end;
                  if useProcessCount then
                  begin
                    FCS.Enter;
                    G_nProcessCount := G_nProcessCount - 1;
                    FCS.Leave;
                  end;
                end;
             else
                begin
                  if useProcessCount then
                  begin
                    FCS.Enter;
                    G_nProcessCount := G_nProcessCount - 1;
                    FCS.Leave;
                  end;
                end;
           end;
         end;
    'a' : begin
          //ACK
         end;

    else if Assigned(FOnNotDefineData) then
    begin
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                   ERR_PROTOCOL_0002,aData);
      OnNotDefineData(Self,aData,NodeNO);

    end;
  end;
end;

destructor TDevice.Destroy;
begin

  inherited Destroy;
end;

//데이터 전송
procedure TDevice.SendPacket(aCmd: Char; aData: String;aQuick:Boolean = False;aType:integer = 0);
begin
  if CommNode <> nil then
    CommNode.SendPacket(ECUID,aCmd,aData,aQuick,aType);
end;

//카드번호(ID)다운로드
procedure TDevice.CD_Download(aCardNo:String;  // 카드번호
                              ValidDay: String;// 유효기간(6)
                              cardType:Char;   // 카드타입(0:출입,1:방범,2:출입+방범)
                              RegCode:Char;
                              aTimeCode:Char;  // 타임코드
                              func:Char;        // 등록코드(L:등록, N:삭제)
                              aQuick:Boolean = False;
                              aPositionNum:integer = 0;
                              aCardPosition:Boolean = False);
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RegType: Char;
  aCardType: Char;
  nCardLength : integer;
  stCardPositionNum : string;
begin

  if aPositionNum <> 0 then
  begin
    stCardPositionNum := FillZeroNumber(aPositionNum,5);
    if aCardPosition then
    begin
      if func = 'L' then func := 'J'; // 등록인 경우만 J 로 변경 해 줌
    end;
  end else
  begin
    aCardPosition := False; //위치정보가 없는 경우 무조건 일반 포맷으로 전송
    stCardPositionNum := '*****';
  end;

  if HidCardType = 1 then   //Hid CardType
  begin
    aCardNo := inttostr(Hex2Dec64(aCardNo));
    aCardNo := HidReverseCardNo(aCardNo);
    aCardNo := inttostr(Hex2Dec64(aCardNo));
    aCardNo := FillZeroStrNum(Trim(aCardNo),10);
    xCardNo:=  '00'+EncodeCardNo(aCardNo);
  end else if CARDLENGTHTYPE = 0 then
  begin
    if IsNumericCardNo then
    begin
      if Not Isdigit(aCardNo) then Exit;
      aCardNo := FillZeroStrNum(Trim(aCardNo),10);
      xCardNo:=  '00'+EncodeCardNo(aCardNo);
    end
    else xCardNo:= '00' + aCardNo;

    if Length(xCardNo) <> 10 then
    begin
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                  'ErrorDownladCardData ','카드번호 <> 10:'+aData);
      Exit;
    end;
  end else
  begin
    if CARDLENGTHTYPE = 1 then
    begin
      if IsNumericCardNo then
        xCardNo:=  Dec2Hex64(StrtoInt64(aCardNo),20)
      else xCardNo:= aCardNo;
    end else if CARDLENGTHTYPE = 2 then
    begin
      xCardNo := Ascii2Hex(aCardNo);
    end;
    nCardLength := Length(xCardNo);
    xCardNo := FillzeroNumber(nCardLength,2) + xCardNo;
  end;

  if ValidDay = '' then ValidDay:= '000000';
  if Not IsDigit(ValidDay) then ValidDay:= '000000';
  
  if Length(ValidDay) <> 6 then
  begin
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 'ErrorDownladCardData ','유효기간 <> 6:'+aData);
    Exit;
  end;




  aData:= '';
  aData:= func +
          '0'+
          RegCode+                  //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          '  '+                     //RecordCount #$20 #$20
          '0'+                      //예비
          xCardNo+                  //카드번호
          ValidDay+                 //유효기간
          '0'+                      //등록 결과
          cardType+                 //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          aTimeCode;                //타임패턴
    if aCardPosition then
    begin
      if func = 'J' then aData := aData + stCardPositionNum; // 등록인 경우 위치 정보 추가
    end;


  SendPacket('c',aData,aQuick,1);

end;

procedure TDevice.DoorModeChange(aDoorNo: Char; aMode: Char;aQuick:Boolean=True);
var
  st: string;
begin

  st:= 'C'+                                     //  Msg Code
       //InttoStr(CommNode.Send_MsgNo)+          // Message Count
       '0' + 
       aDoorNo+                                //  기기내 Door No
       #$30+                                   //  RecordCount(고정)
       #$32+                                   //  RecordCount(모드변경 #$32)
       aMode;                                  //  '0':운영 ,'1':개방
  SendPacket('c',st,aQuick);

end;

procedure TDevice.DoorExitButton(aDoorNo: Char);
var
  st: string;
begin
  st:= 'C'+                              //  Msg Code
       InttoStr(CommNode.Send_MsgNo)+    //  Msg Count
       aDoorNo+                         //  기기내 Door No
       #$30+                             //  RecordCount(고정)
       #$33+                             //  RecordCount(제어 #$33)
       #$31;
  SendPacket('c',st,True);
end;

procedure TDevice.SendDoorSchadule(aDoor:Char;aDay:Char;aData:String;aQuick:Boolean = False);
var
  st: String;
begin
   st:= 'S'+        //Command
        '0'+        //Message Code
        aDoor+      //기기내 출입문 번호
        #$20+
        aDay+       //요일:0평일,1반휴일,2:일요일,3휴일
        aData;      // Mode Data
   SendPacket('c',st,aQuick);
//   DebugScreen.Trace('[Debug]'+st);
end;


procedure TDevice.CheckDoorState(aDoorNo: Char;aQuick:Boolean = False);
var
  st: string;
begin

  st:= 'C'+                               //  Msg Code
       InttoStr(CommNode.Send_MsgNo)+     //  Msg Count
       ADoorNo+                           //  기기내 Door No
       #$30+                              //  RecordCount(고정)
       #$30+                              //  RecordCount(상태조회)
       #$30;                              //  의미없음

  SendPacket('c',st,aQuick);
end;

procedure TDevice.TimeSync;
var
  TimeStr: String;
begin
  TimeStr:= FormatDatetime('yyyymmddhhnnss',Now);
  SendPacket('R','TM00'+TimeStr,False);
end;

procedure TDevice.SetCommNode(const Value: TCommNode);
var
  DeviceIndex: Integer;
begin
  if FCommNode <> Value then
  begin
    FCommNode := Value;
    FCommNode.Devices.AddObject(self.FDeviceID,Self);
  end;
end;

procedure TDevice.SetConnected(const Value: Boolean);
begin
  if FConnected <> Value then
  begin
    FConnected := Value;
    if Assigned(FOnConnected) then OnConnected(Self,Value,NodeNO,ECUID);
    if Value then FCommNode.SocketConnected := Value;
    if Not Value then
    begin
      DoorManageMode1 := dmNothing;
      DoorPNMode1 := pnNothing;
      DoorState1 := dsNothing;
      DoorManageMode2 := dmNothing;
      DoorPNMode2 := pnNothing;
      DoorState2 := dsNothing;
      WatchMode := cmNothing;
      if Assigned(FOnDoorModeChange) then
      begin
         OnDoorModeChange(Self,NodeNO,ECUID,'1',DoorManageMode1,DoorPNMode1,DoorState1);
         OnDoorModeChange(Self,NodeNO,ECUID,'2',DoorManageMode2,DoorPNMode2,DoorState2);
      end;
    end;
  end;

end;

procedure TDevice.SetDeviceID(const Value: String);
begin
  if FDeviceID <> Value then
  FDeviceID := Value;
end;

procedure TDevice.SetWatchMode(const Value: TWatchMode);
begin
  if FWatchMode <> Value then
  begin
    FWatchMode := Value;
    if Assigned(FOnWatchModeChange) then
    begin
      OnWatchModeChange(self,NodeNo,ECUID,Value);
    end;
  end;
end;

//경비모드 변경
procedure TDevice.ChangewatchMode(aMode: TWatchMode);
begin
  case aMode of
    cmArm      : SendPacket('R','MC00A',True); //경비모드
    cmDisarm   : SendPacket('R','MC00D',True); //해제모드
    cmPatrol   : SendPacket('R','MC00P',True); //순회모드
    cmInit     : SendPacket('R','MC00I',True); //등록모드
    cmTest     : SendPacket('R','MC00T',True); //TEST모드
  end;
end;

//경비모드 확인
// 메인장비(기기번호가 00)에만 명령어 전송
procedure TDevice.CheckWatchMode(aQuick:Boolean = False);
begin
  SendPacket('R','RD00',aQuick);
end;

procedure TDevice.ReBoot;
begin
  SendPacket('R','RS00Reset',True);
end;

procedure TCommNode.ACC_sendData(aEcuId, aData: CString);
begin
  SendPacket(aEcuId,'c', aData,True);
end;

procedure TDevice.SetAcType(const Value: TDevicetype);
begin
  if FACtype <> Value then  FACtype := Value;
end;

procedure TDevice.SetAtType(const Value: TDevicetype);
begin
  if FATtype <> Value then FATtype := Value;
end;

procedure TDevice.SetFdType(const Value: TDevicetype);
begin
  if FFDtype <> Value then FFDtype := Value;
end;

procedure TDevice.SetPtType(const Value: TDevicetype);
begin
  if FPTtype <> Value then FPTtype := Value;
end;

procedure TDevice.SetNodeNO(const Value: integer);
begin
  if FNodeNO <> Value then  FNodeNO := Value;
end;

procedure TDevice.SetFoodAmt(const Value: integer);
begin
  FFDAMTPER := Value;
end;

Function TDevice.Holiday(aCmd:Char;aDate,aDoorNo: string):Boolean;
var
  stData :string;
  FirstTickCount : Double;
begin
  result := False;
  stData := 'Q' + //조회'R'
            '0' + //정상 0 에러 1
            aDoorNo + //0:전체,1:1번문,2:2번문
            ' ' + //스페이스
            aCmd + //A:추가,D삭제,W:전체삭제
            aDate + //MMDD
            '3';  //'3' : 특정일
  L_stHolidaySend := copy(stData,2,4);
  L_bHolidayRecv := False;
  SendPacket('c',stData);

  FirstTickCount := GetTickCount + 3000; //3초 대기
  While Not L_bHolidayRecv do
  begin
    if bApplicationTerminate then Exit;
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;
  result := L_bHolidayRecv;
end;

procedure TCommNode.SetNodeNoStr(const Value: string);
begin
  FNodeNoStr := Value;
end;


procedure TDevice.SetDeviceName(const Value: String);
begin
  FDeviceName := Value;
end;

procedure TCommNode.SetMCUID(const Value: string);
begin
  FMCUID := Value;
end;

procedure TDevice.SetECUID(const Value: String);
begin
  FECUID := Value;
end;

procedure TCommNode.SetSocketConnected(const Value: Boolean);
begin
  if FSocketConnected = Value then Exit;
  FSocketConnected := Value;
  if Assigned(FOnConnected) then
  begin
    OnConnected(Self,Value,NO);
  end;
end;


procedure TDevice.SetDoorManageMode1(const Value: TDoorManageMode);
begin
  if FDoorManageMode1 <> Value then
  begin
    FDoorManageMode1 := Value;
    if Assigned(FOnDoorManageModeChange) then
    begin
      OnDoorManageModeChange(self,NodeNo,ECUID,'01',Value);
    end;
  end;
end;

procedure TDevice.SetDoorManageMode2(const Value: TDoorManageMode);
begin
  if FDoorManageMode2 <> Value then
  begin
    FDoorManageMode2 := Value;
    if Assigned(FOnDoorManageModeChange) then
    begin
      OnDoorManageModeChange(self,NodeNo,ECUID,'02',Value);
    end;
  end;
end;

procedure TDevice.SetDoorState1(const Value: TDoorState);
begin
  if FDoorState1 <> Value then
  begin
    FDoorState1 := Value;
    if Assigned(FOnDoorStateChange) then
    begin
      OnDoorStateChange(self,NodeNo,ECUID,'01',Value);
    end;
  end;
end;

procedure TDevice.SetDoorState2(const Value: TDoorState);
begin
  if FDoorState2 <> Value then
  begin
    FDoorState2 := Value;
    if Assigned(FOnDoorStateChange) then
    begin
      OnDoorStateChange(self,NodeNo,ECUID,'02',Value);
    end;
  end;
end;

procedure TDevice.SetDoorPNMode1(const Value: TDoorPNMode);
begin
  if FDoorPNMode1 <> Value then
  begin
    FDoorPNMode1 := Value;
    if Assigned(FOnDoorPNModeChange) then
    begin
      OnDoorPNModeChange(self,NodeNo,ECUID,'01',Value);
    end;
  end;
end;

procedure TDevice.SetDoorPNMode2(const Value: TDoorPNMode);
begin
  if FDoorPNMode2 <> Value then
  begin
    FDoorPNMode2 := Value;
    if Assigned(FOnDoorPNModeChange) then
    begin
      OnDoorPNModeChange(self,NodeNo,ECUID,'02',Value);
    end;
  end;
end;

procedure TDevice.DeviceRecvAlarmData(aNodeNo: integer; aCommand,aData: string);
var
  stSubCLass : string;
  stStatusCode : string;
  cMode : Char;
begin
  stSubClass := copy(aData,34,2);
  cMode     := aData[40];
  stStatusCode   := copy(aData,41,2);

  case UpperCase(cMode)[1] of
   'A': begin WatchMode := cmArm end;
   'D': begin WatchMode := cmDisarm end;
   'T': begin WatchMode := cmTest end;
   'I': begin WatchMode := cmInit end;
   'P': begin WatchMode := cmPatrol end;
  else  begin WatchMode := cmNothing end;
  end;
  if Assigned(FOnRcvAlarmData) then
  begin
    if useProcessCount then
    begin
      if G_nProcessCount > G_nMaxProcessCount then Exit; //최대 프로세스 갯수를 초과 하면 처리하지 말고 빠지자.
      FCS.Enter;
      inc(G_nProcessCount);
      FCS.Leave;
    end;
    OnRcvAlarmData(Self,aCommand,aData,aNodeNO);
  end;
  SendPacket('a','',True); //Alarm Ack 보내자
  if (stSubCLass = 'MN') or (stSubCLass = 'EX')then
  begin
    if stStatusCode = 'NF' then
    begin
//      SendPacket('a','',True); //Alarm Ack 보내자
      Connected := False;
      WatchMode := cmNothing;
//      Exit;  //NF 인 경우 저장이 안됨...ㅠ.ㅠ
    end else Connected := True;
  end
  else Connected := True;

end;


procedure TDevice.DoorModeState(aNodeNo: integer; aData: string);
Var
  stDoorNo: String;
  cMsgNo: Char;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;
  bChange : Boolean;
begin
  if Length(aData) < 40 then    Exit;
  bChange := False;

  stDoorNo:= '0' + aData[21];

  cMsgNo:=    aData[18];
  cDoorState:= aData[40];    //문상태
  cDoorMode:=  aData[37];    //운영/개방
  cDoorMode2:= aData[36];    //Posi/Nega

  if stDoorNo = '01' then //1번문이면
  begin
    case cDoorMode of
      '0' : begin
              if DoorManageMode1 <> dmManager then
              begin
                DoorManageMode1 := dmManager;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorManageMode1 <> dmOpen then
              begin
                DoorManageMode1 := dmOpen;
                bChange := True;
              end
            end;
      '2' : begin
              if DoorManageMode1 <> dmLock then
              begin
                DoorManageMode1 := dmLock;
                bChange := True;
              end
            end;
      else begin
              if DoorManageMode1 <> dmNothing then
              begin
                DoorManageMode1 := dmNothing;
                bChange := True;
              end
            end;
    end;
    case cDoorMode2 of
      '0' : begin
              if DoorPNMode1 <> pnPositive then
              begin
                DoorPNMode1 := pnPositive;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorPNMode1 <> pnNegative then
              begin
                DoorPNMode1 := pnNegative;
                bChange := True;
              end
            end;
      else  begin 
              if DoorPNMode1 <> pnNothing then
              begin
                DoorPNMode1 := pnNothing;
                bChange := True;
              end
            end;
    end;
    case cDoorState of
      'C' : begin
              if DoorState1 <> dsClose then
              begin
                DoorState1 := dsClose;
                bChange := True;
              end
            end;
      'O' : begin
              if DoorState1 <> dsOpen then
              begin
                DoorState1 := dsOpen;
                bChange := True;
              end
            end;
      'T','D' : begin
              if DoorState1 <> dsLongTime then
              begin
                DoorState1 := dsLongTime;
                bChange := True;
              end
            end;
      'U' : begin
              if DoorState1 <> dsOpenErr then
              begin
                DoorState1 := dsOpenErr;
                bChange := True;
              end
            end;
      'L' : begin
              if DoorState1 <> dsCloseErr then
              begin
                DoorState1 := dsCloseErr;
                bChange := True;
              end
            end;
      else  begin
              if DoorState1 <> dsNothing then
              begin
                DoorState1 := dsNothing;
                bChange := True;
              end
            end;
    end;
    if bChange then
    begin
      if Assigned(FOnDoorModeChange) then
        OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode1,DoorPNMode1,DoorState1);
    end;
  end else if stDoorNo = '02' then
  begin
    case cDoorMode of
      '0' : begin
              if DoorManageMode2 <> dmManager then
              begin
                DoorManageMode2 := dmManager;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorManageMode2 <> dmOpen then
              begin
                DoorManageMode2 := dmOpen;
                bChange := True;
              end
            end;
      '2' : begin
              if DoorManageMode2 <> dmLock then
              begin
                DoorManageMode2 := dmLock;
                bChange := True;
              end
            end;
      else begin
              if DoorManageMode2 <> dmNothing then
              begin
                DoorManageMode2 := dmNothing;
                bChange := True;
              end
            end;
    end;
    case cDoorMode2 of
      '0' : begin
              if DoorPNMode2 <> pnPositive then
              begin
                DoorPNMode2 := pnPositive;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorPNMode2 <> pnNegative then
              begin
                DoorPNMode2 := pnNegative;
                bChange := True;
              end
            end;
      else  begin 
              if DoorPNMode2 <> pnNothing then
              begin
                DoorPNMode2 := pnNothing;
                bChange := True;
              end
            end;
    end;
    case cDoorState of
      'C' : begin
              if DoorState2 <> dsClose then
              begin
                DoorState2 := dsClose;
                bChange := True;
              end
            end;
      'O' : begin
              if DoorState2 <> dsOpen then
              begin
                DoorState2 := dsOpen;
                bChange := True;
              end
            end;
      'T','D' : begin
              if DoorState2 <> dsLongTime then
              begin
                DoorState2 := dsLongTime;
                bChange := True;
              end
            end;
      'U' : begin
              if DoorState2 <> dsOpenErr then
              begin
                DoorState2 := dsOpenErr;
                bChange := True;
              end
            end;
      'L' : begin
              if DoorState2 <> dsCloseErr then
              begin
                DoorState2 := dsCloseErr;
                bChange := True;
              end
            end;
      else  begin
              if DoorState2 <> dsNothing then
              begin
                DoorState2 := dsNothing;
                bChange := True;
              end
            end;
    end;

    if bChange then
    begin
      if Assigned(FOnDoorModeChange) then
        OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode2,DoorPNMode2,DoorState2);
    end;

  end;

end;

procedure TDevice.DoorControlState(aNodeNo: integer; aData: string);
Var
  stDoorNo: String;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;
  bChange : Boolean;
begin
  bChange := False;
  stDoorNo:= '0' + aData[21];

  cDoorMode2:= aData[24];    //Posi/Nega
  cDoorMode:=  aData[25];    //운영/개방
  cDoorState:= aData[26];    //문상태
  if stDoorNo = '01' then //1번문이면
  begin
    case cDoorMode of
      '0' : begin
              if DoorManageMode1 <> dmManager then
              begin
                DoorManageMode1 := dmManager;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorManageMode1 <> dmOpen then
              begin
                DoorManageMode1 := dmOpen;
                bChange := True;
              end
            end;
      '2' : begin
              if DoorManageMode1 <> dmLock then
              begin
                DoorManageMode1 := dmLock;
                bChange := True;
              end
            end;
      else begin
              if DoorManageMode1 <> dmNothing then
              begin
                DoorManageMode1 := dmNothing;
                bChange := True;
              end
            end;
    end;
    case cDoorMode2 of
      '0' : begin
              if DoorPNMode1 <> pnPositive then
              begin
                DoorPNMode1 := pnPositive;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorPNMode1 <> pnNegative then
              begin
                DoorPNMode1 := pnNegative;
                bChange := True;
              end
            end;
      else  begin 
              if DoorPNMode1 <> pnNothing then
              begin
                DoorPNMode1 := pnNothing;
                bChange := True;
              end
            end;
    end;
    case cDoorState of
      'C' : begin
              if DoorState1 <> dsClose then
              begin
                DoorState1 := dsClose;
                bChange := True;
              end
            end;
      'O' : begin
              if DoorState1 <> dsOpen then
              begin
                DoorState1 := dsOpen;
                bChange := True;
              end
            end;
      'T' : begin
              if DoorState1 <> dsLongTime then
              begin
                DoorState1 := dsLongTime;
                bChange := True;
              end
            end;
      'U' : begin
              if DoorState1 <> dsOpenErr then
              begin
                DoorState1 := dsOpenErr;
                bChange := True;
              end
            end;
      'L' : begin
              if DoorState1 <> dsCloseErr then
              begin
                DoorState1 := dsCloseErr;
                bChange := True;
              end
            end;
      else  begin
              if DoorState1 <> dsNothing then
              begin
                DoorState1 := dsNothing;
                bChange := True;
              end
            end;
    end;
    if bChange then
    begin
      if Assigned(FOnDoorModeChange) then
        OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode1,DoorPNMode1,DoorState1);
    end;
  end else if stDoorNo = '02' then
  begin
    case cDoorMode of
      '0' : begin
              if DoorManageMode2 <> dmManager then
              begin
                DoorManageMode2 := dmManager;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorManageMode2 <> dmOpen then
              begin
                DoorManageMode2 := dmOpen;
                bChange := True;
              end
            end;
      '2' : begin
              if DoorManageMode2 <> dmLock then
              begin
                DoorManageMode2 := dmLock;
                bChange := True;
              end
            end;
      else begin
              if DoorManageMode2 <> dmNothing then
              begin
                DoorManageMode2 := dmNothing;
                bChange := True;
              end
            end;
    end;
    case cDoorMode2 of
      '0' : begin
              if DoorPNMode2 <> pnPositive then
              begin
                DoorPNMode2 := pnPositive;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorPNMode2 <> pnNegative then
              begin
                DoorPNMode2 := pnNegative;
                bChange := True;
              end
            end;
      else  begin 
              if DoorPNMode2 <> pnNothing then
              begin
                DoorPNMode2 := pnNothing;
                bChange := True;
              end
            end;
    end;
    case cDoorState of
      'C' : begin
              if DoorState2 <> dsClose then
              begin
                DoorState2 := dsClose;
                bChange := True;
              end
            end;
      'O' : begin
              if DoorState2 <> dsOpen then
              begin
                DoorState2 := dsOpen;
                bChange := True;
              end
            end;
      'T' : begin
              if DoorState2 <> dsLongTime then
              begin
                DoorState2 := dsLongTime;
                bChange := True;
              end
            end;
      'U' : begin
              if DoorState2 <> dsOpenErr then
              begin
                DoorState2 := dsOpenErr;
                bChange := True;
              end
            end;
      'L' : begin
              if DoorState2 <> dsCloseErr then
              begin
                DoorState2 := dsCloseErr;
                bChange := True;
              end
            end;
      else  begin
              if DoorState2 <> dsNothing then
              begin
                DoorState2 := dsNothing;
                bChange := True;
              end
            end;
    end;
    if bChange then
    begin
      if Assigned(FOnDoorModeChange) then
        OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode2,DoorPNMode2,DoorState2);
    end;
  end;

end;

procedure TDevice.ServerCarDataSend(aCardReaderNo, aCardData: string);
begin
  SendPacket('R','CD90'+   //CMD
                 '**' +    //예비컨트롤 ID
                 FillZeroNumber(strtoint(aCardReaderNo),2) + //카드리더번호
                 '**' +    //Door No
                 '7F' +
                 FillZeroNumber(Length(aCardData),2) +
                 aCardData , True); //카드리더 전송
end;

procedure TCommNode.FireRecovery;
begin
  SendPacket('00','R','SM2599',True);
end;

procedure TDevice.DeviceDoorInfoSearch(aDoor:string);
var
  stData : string;
begin
  stData := 'B' + '0' +                             //MSG Code
            aDoor +               //문번호
            #$20 + #$20 + '00000000000000000000';          //조회는 전체를 '0'으로 마킹

  SendPacket('c',stData,True);
end;

procedure TDevice.DeviceDoorInfoSetting(aDoor, aCardMode, aDoorMode,
  aDoorControlTime, aOpenMoni, aUseSch, aSendDoor, aAlarmLong, aFire,
  aLockType, aDSOpen, aRemoteDoor: string);
var
  stData: string;

begin
  stData := 'A' +                       //MSG Code
    '0' +                              //Msg Count(고정)
    aDoor +                //문번호
    #$20 + #$20 +                      // Record count
    aCardMode +              //카드운영모드
    aDoorMode +              //출입문 운영모드
    aDoorControlTime +          //Door제어 시간
    aOpenMoni +          //장시간 열림 경보
    aUseSch +           //스케줄 적용유무
    aSendDoor +         //출입문상태전송
    '0' +                              //통신이상시 기기운영(사용안함:고정)
    '0' +                              //AntiPassBack(사용안함:고정)
    aAlarmLong +          //장시간 열림 부저출력
    '0' +                              //통신 이상시 부저 출력 (사용안함:고정)
    aLockType +              //전기정 타입
    aFire +         //화재 발생시 문제어
    '0' +                              //DS LS 검사(사용안함:고정)
    aDSOpen +           //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
    aRemoteDoor +  //원격해제시 (DoorOpen 0x30,DoorClose 0x31)
    '00000';                           //예비


  SendPacket('c',stData,True);
end;

procedure TDevice.CardTypeSearch;
var
  stData : string;
begin
  stData := 'Ct00';          //조회는 전체를 '0'으로 마킹

  SendPacket('Q',stData,True);

end;


procedure TDevice.DoorSetupState(aNodeNo: integer; aData: string);
Var
  stDoorNo: String;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;
  bChange : Boolean;
begin
  bChange := False;
  stDoorNo:= '0' + aData[21];

  cDoorMode2:= aData[24];    //Posi/Nega
  cDoorMode:=  aData[25];    //운영/개방
  cDoorState:= aData[26];    //문상태
  if stDoorNo = '01' then //1번문이면
  begin
    case cDoorMode of
      '0' : begin
              if DoorManageMode1 <> dmManager then
              begin
                DoorManageMode1 := dmManager;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorManageMode1 <> dmOpen then
              begin
                DoorManageMode1 := dmOpen;
                bChange := True;
              end
            end;
      '2' : begin
              if DoorManageMode1 <> dmLock then
              begin
                DoorManageMode1 := dmLock;
                bChange := True;
              end
            end;
      else begin
              if DoorManageMode1 <> dmNothing then
              begin
                DoorManageMode1 := dmNothing;
                bChange := True;
              end
            end;
    end;
    case cDoorMode2 of
      '0' : begin
              if DoorPNMode1 <> pnPositive then
              begin
                DoorPNMode1 := pnPositive;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorPNMode1 <> pnNegative then
              begin
                DoorPNMode1 := pnNegative;
                bChange := True;
              end
            end;
      else  begin 
              if DoorPNMode1 <> pnNothing then
              begin
                DoorPNMode1 := pnNothing;
                bChange := True;
              end
            end;
    end;
    if bChange then
    begin
      if Assigned(FOnDoorModeChange) then
        OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode1,DoorPNMode1,DoorState1);
    end;
  end else if stDoorNo = '02' then
  begin
    case cDoorMode of
      '0' : begin
              if DoorManageMode2 <> dmManager then
              begin
                DoorManageMode2 := dmManager;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorManageMode2 <> dmOpen then
              begin
                DoorManageMode2 := dmOpen;
                bChange := True;
              end
            end;
      '2' : begin
              if DoorManageMode2 <> dmLock then
              begin
                DoorManageMode2 := dmLock;
                bChange := True;
              end
            end;
      else begin
              if DoorManageMode2 <> dmNothing then
              begin
                DoorManageMode2 := dmNothing;
                bChange := True;
              end
            end;
    end;
    case cDoorMode2 of
      '0' : begin
              if DoorPNMode2 <> pnPositive then
              begin
                DoorPNMode2 := pnPositive;
                bChange := True;
              end
            end;
      '1' : begin
              if DoorPNMode2 <> pnNegative then
              begin
                DoorPNMode2 := pnNegative;
                bChange := True;
              end
            end;
      else  begin 
              if DoorPNMode2 <> pnNothing then
              begin
                DoorPNMode2 := pnNothing;
                bChange := True;
              end
            end;
    end;
    if bChange then
    begin
      if Assigned(FOnDoorModeChange) then
        OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode2,DoorPNMode2,DoorState2);
    end;
  end;

end;



function TDevice.ServerDoorControl(aReaderNo, aDoorNo, aKey,
  aCardNo,aAuth: string): integer;
var
  xCardNo : string;
  nCardLength : integer;
begin

  if Not Connected then
  begin
    result := NOTDEVICECONNECT;
    Exit;
  end;

  if HidCardType = 1 then   //Hid CardType
  begin
    aCardNo := inttostr(Hex2Dec64(aCardNo));
    aCardNo := HidReverseCardNo(aCardNo);
    aCardNo := inttostr(Hex2Dec64(aCardNo));
    aCardNo := FillZeroStrNum(Trim(aCardNo),10);
    xCardNo:=  '00'+EncodeCardNo(aCardNo);
  end else if CARDLENGTHTYPE = 0 then
  begin
    if IsNumericCardNo then
    begin
      if Not Isdigit(aCardNo) then Exit;
      aCardNo := FillZeroStrNum(Trim(aCardNo),10);
      xCardNo:=  '00'+EncodeCardNo(aCardNo);
    end
    else xCardNo:= '00' + aCardNo;

    if Length(xCardNo) <> 10 then
    begin
      ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                  'ErrorDownladCardData ','카드번호 <> 10:' + xCardNo);
      Exit;
    end;
  end else
  begin
    if CARDLENGTHTYPE = 1 then
    begin
      if IsNumericCardNo then
        xCardNo:=  Dec2Hex64(StrtoInt64(aCardNo),20)
      else xCardNo:= aCardNo;
    end else if CARDLENGTHTYPE = 2 then
    begin
      xCardNo := Ascii2Hex(aCardNo);
    end;
    nCardLength := Length(xCardNo);
    xCardNo := FillzeroNumber(nCardLength,2) + xCardNo;
  end;

  L_stServerControlData := 'CD90' +
                            ECUID +
                            FillZeroStrNum(aReaderNo,2) +
                            FillZeroStrNum(aDoorNo,2) +
                            Ascii2Hex(aKey) +
                            aAuth +
                            xCardNo;

  L_bServerDoorControlCheck := False;
  SendPacket('R',L_stServerControlData);
  result := SUCCESSDEVICESEND;
end;

procedure TDevice.RcvRemoteAckData(NodeNO: integer; aCommand,
  aData: string);
var
  aCode: String;
  aGubun : string;
  stEcuID : string;
  stData : string;
  nLength : integer;
begin
  aCode:= Copy(aData,19,2);
  aGubun := Copy(aData,21,2);
  if aCode = 'VR' then
  begin
    if aGubun = '90' then
    begin
      stEcuID := copy(aData,15,2);
      nLength := Length(aData) + 1; //ETX 부분이 없어서 있는 것처럼 생각
      GetSystemSkill(stEcuID,Copy(aData,23,nLength - 25));
    end;
  end else if aCode = 'CD' then
  begin
    if aGubun = '90' then
    begin
      stData := copy(aData,19,Length(L_stServerControlData));
      if  L_stServerControlData = stData then
      begin
        L_bServerDoorControlCheck := True;
      end;
    end;
  end;

end;

procedure TDevice.CardModeChange(aDoorNo, aMode: Char);
var
  st: string;
begin

  st:= 'C'+                                     //  Msg Code
       InttoStr(CommNode.Send_MsgNo) +          // Message Count
       aDoorNo+                                //  기기내 Door No
       #$30+                                   //  RecordCount(고정)
       #$31+                                   //  RecordCount(모드변경 #$31)
       aMode;                                  //  '0':Posi ,'1':Nega
  SendPacket('c',st);

end;

procedure TDevice.FireOutbreak(aQuick: Boolean);
var
  stSendData : string;
begin
  if FireServerCommand then
    SendPacket('R','SM2900Fire',aQuick)
  else
  begin
    stSendData := 'SM26' +
                '99' + //aTargetID : 99 - All
                'c' +
                'C'+                                     //  Msg Code
                //InttoStr(CommNode.Send_MsgNo)+          // Message Count
                '0' +
                '1' + //aDoorNo+                                //  기기내 Door No
                #$30+                                   //  RecordCount(고정)
                #$32+                                   //  RecordCount(모드변경 #$32)
                '1';                                    //aMode;                                  //  '0':운영 ,'1':개방
    SendPacket('R',stSendData,aQuick);
    // Door2 All Open Mode Change
    stSendData := 'SM26' +
                '99' + //aTargetID : 99 - All
                'c' +
                'C'+                                     //  Msg Code
                //InttoStr(CommNode.Send_MsgNo)+          // Message Count
                '0' +
                '2' + //aDoorNo+                                //  기기내 Door No
                #$30+                                   //  RecordCount(고정)
                #$32+                                   //  RecordCount(모드변경 #$32)
                '1';                                    //aMode;                                  //  '0':운영 ,'1':개방
    SendPacket('R',stSendData,aQuick);
  end;

end;

procedure TDevice.SetFireServerCommand(const Value: Boolean);
begin
  FFireServerCommand := Value;
end;

function TDevice.GetSystemSkill(aEcuID, aData: string): Boolean;
var
  stBit : string;
begin
  result := True;

  DeviceSkillReceive := True;
  if Pos('Undefined Command',aData) <> 0 then Exit;

  Delete(aData,1,4);// 'SyFn' 부분 제거
  stBit := HexToBinary(aData);

  case stBit[4] of   //자바라 닫힘 기능
    '0' : JavaraCloseCommand := False;
    '1' : JavaraCloseCommand := True;
  else
    JavaraCloseCommand := False;
  end;
  case stBit[5] of   //자바라 열림 기능
    '0' : JavaraOpenCommand := False;
    '1' : JavaraOpenCommand := True;
  else
    JavaraOpenCommand := False;
  end;
  case stBit[6] of   //화재
    '0' : FireServerCommand := False;
    '1' : FireServerCommand := True;
  else
    FireServerCommand := False;
  end;

end;

procedure TDevice.SetDeviceSkillReceive(const Value: Boolean);
begin
  FDeviceSkillReceive := Value;
end;

procedure TDevice.SetJavaraCloseCommand(const Value: Boolean);
begin
  FJavaraCloseCommand := Value;
end;

procedure TDevice.SetJavaraOpenCommand(const Value: Boolean);
begin
  FJavaraOpenCommand := Value;
end;

procedure TDevice.CheckSystemSkill(aQuick: Boolean);
begin
  SendPacket('R','VR90',aQuick);

end;

end.
