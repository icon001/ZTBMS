unit uMcusocket;

interface
uses
  Classes,windows,SysUtils,SyncObjs,IdTCPServer,uDataModule1,Forms;

Type

  TMCUNodeInfo = class
  private
    FNo: Integer;
    FOnConnected: TNodeConnect;
    FSocketConnected: Boolean;
    FMCUID: string;
    FOnRcvData: TNotifyReceive;
    FOnSendData: TNotifyReceive;
    FOnRcvInvalidDevice: TNotifyReceive;
    FSocket: TIdPeerThread;
    FClientIP: string;
    FClientPort: integer;
    FFDtype: TDevicetype;
    FFIREGUBUNCODE: string;
    FCardFixType: Integer;
    FLocate: String;
    FKTTMuxID: string;
    FKTTDecoderChannel: string;
    FKTTCustomerID: string;
    FStateEvent: Boolean;
    procedure SetNo(const Value: Integer);
    procedure SetSocketConnected(const Value: Boolean);
    procedure SetMCUID(const Value: string);
    procedure SetSocket(const Value: TIdPeerThread);
    procedure SetClientIP(const Value: string);
    procedure SetClientPort(const Value: integer);
    procedure SetFdType(const Value: TDevicetype);
    procedure SetLocate(const Value: String);
  public
    Rcv_MsgNo : Char;
    Send_MsgNo: Integer;
    ReceivedLastpacket: String;
    Devices: TStringList;             //등록된 기기 목록

    ReserveSendDataList: TStringList; //내보낼 데이터 목록
    CardSendDataList: TStringList; // 카드데이터 내보낼 목록
    QuickSendDataList: TStringList; // 먼저 내보낼 데이터 목록
    LastConnectedTime: TDatetime;
    ComBuff: String;
    L_nCardDataSend : integer; //카드데이터 쉬자...
    CardDataSendSleepCount : integer;

    AThread: TIdPeerThread;
    AliveTime : TDateTime;
    Procedure DataPacektProcess(aData: string);
    Procedure ACC_sendData(aEcuId:String; aData:String);
    function  SendPacket(aEcuId: String; aCmd:Char; aData: String; aQuick:Boolean;aType:integer = 0):Boolean;
    Procedure ExecSendPacket;
    procedure FireRecovery(aQuick:Boolean=False);
    procedure FireOutbreak(aQuick:Boolean=False);  //전체 화재발생알람

    procedure AllRelayControl(aRelayNo,aControlTime:integer;aQuick:Boolean = True);
  public
    constructor create;
    destructor Destroy;override;
  published
    { Published declarations }
    Property No: Integer Read FNo write SetNo;
    Property CardFixType: Integer Read FCardFixType write FCardFixType;  //0-고정(4Byte),1-가변(G_nCardFixedLength 에 따름)
    Property Locate: String Read FLocate write SetLocate;
    ProPerty OnConnected : TNodeConnect read FOnConnected Write FOnConnected;
    ProPerty SocketConnected : Boolean read FSocketConnected Write SetSocketConnected;
    Property MCUID: string read FMCUID write SetMCUID;
    Property FDtype: TDevicetype Read FFDtype write SetFdType;
    ProPerty OnRcvData : TNotifyReceive read FOnRcvData write FOnRcvData;
    ProPerty OnSendData : TNotifyReceive read FOnSendData write FOnSendData;
    ProPerty OnRcvInvalidDevice: TNotifyReceive read FOnRcvInvalidDevice write FOnRcvInvalidDevice;
    ProPerty Socket:TIdPeerThread read FSocket Write SetSocket;
    property ClientIP : string read FClientIP write SetClientIP;
    property ClientPort : integer read FClientPort write SetClientPort;
    property FIREGUBUNCODE : string Read FFIREGUBUNCODE write FFIREGUBUNCODE;
    Property StateEvent : Boolean read FStateEvent write FStateEvent;
  public
    KTTAlarmSendDataList : TStringList; //관제 센터에 보낼 목록 50개

    procedure KTTAlarm_Add(aSendData:string);
    procedure KTTAlarm_Insert(aSendData:string); //처음 조회시 최종 부터 읽어 오므로 인서트
    property KTTMuxID : string Read FKTTMuxID write FKTTMuxID;
    property KTTDecoderChannel : string Read FKTTDecoderChannel write FKTTDecoderChannel;
    property KTTCustomerID : string Read FKTTCustomerID write FKTTCustomerID;
  end;

  TECUInfo = class
  private
    ArmAreaUse: Array [0..con_nFIXMAXAREANO] of Boolean; //방범구역 사용유무
    ArmAreaName: Array [0..con_nFIXMAXAREANO] of string; //방범구역 명칭
    ArmAreaState: Array [0..con_nFIXMAXAREANO] of TWatchMode; //방범구역 상태
    DoorUse: Array [0..con_nFIXMAXDOORNO] of Boolean; //출입문 사용유무
    DoorName: Array [0..con_nFIXMAXDOORNO] of string; //출입문 명칭
    DoorManageMode: Array [0..con_nFIXMAXDOORNO] of TDoorManageMode;
    DoorPNMode :  Array [0..con_nFIXMAXDOORNO] of TDoorPNMode;
    DoorState :  Array [0..con_nFIXMAXDOORNO] of TDoorState;
    DoorLockMode :  Array [0..con_nFIXMAXDOORNO] of TDoorLockState;
    DoorFire  :  Array [0..con_nFIXMAXDOORNO] of Boolean;

    FMcuNode: TMCUNodeInfo;
    FNodeNO: integer;
    FECUID: String;
    FDeviceID: String;
    FDeviceName: String;
    FFDAMTPER: integer;
    FFDtype: TDevicetype;
    FATtype: TDevicetype;
    FPTtype: TDevicetype;
    FACtype: TDevicetype;
    FOnRcvAlarmData: TAlarmEvent;
    FOnRcvInitAckData: TNotifyReceive;
    FOnRegisterClear: TNotifyReceive;
    FOnRcvRemoteAckData: TNotifyReceive;
    FOnRcvFTPProcessData: TNotifyReceive;
    FOnConnected: TConnectType;
    FOnRcvDoorControl: TNotifyReceive;
    FOnRcvChangeDoorData: TNotifyReceive;
    FOnRcvRegSchedule: TNotifyReceive;
    FOnRcvERRORData: TNotifyReceive;
    FOnRcvCardReadData: TNotifyReceive;
    FOnRcvTellogData: TNotifyReceive;
    FOnNotDefineData: TNotifyReceive;
    FOnRcvDoorSetup: TNotifyReceive;
    FOnRcvRegCardData: TNotifyReceive;
    FOnDoorManageModeChange: TDoorManageModeChangeType;
    FOnDoorModeChange: TDoorModeChangeType;
    FOnDoorPNModeChange: TDoorPNModeChangeType;
    FOnDoorStateChange: TDoorStateChangeType;
    FOnWatchModeChange: TWatchModeChangeType;
    FConnected: Boolean;
    FWatchMode: TWatchMode;
    FDoorManageMode1: TDoorManageMode;
    FDoorPNMode1: TDoorPNMode;
    FDoorState1: TDoorState;
    FDoorManageMode2: TDoorManageMode;
    FDoorPNMode2: TDoorPNMode;
    FDoorState2: TDoorState;
    FJavaraCloseCommand: Boolean;
    FJavaraOpenCommand: Boolean;
    FFireServerCommand: Boolean;
    FDeviceSkillReceive: Boolean;
    FDoor1Use: Boolean;
    FDoor2Use: Boolean;
    FDoorLockMode1: TDoorLockState;
    FDoorLockMode2: TDoorLockState;
    FDoor1Fire: Boolean;
    FDoor2Fire: Boolean;
    FDeviceType: String;
    FOnDeviceTypeChange: TDeviceTypeChange;
    FArmAreaUsed: Boolean;
    procedure SetMcuNode(const Value: TMCUNodeInfo);
    procedure SetNodeNO(const Value: integer);
    procedure SetECUID(const Value: String);
    procedure SetDeviceID(const Value: String);
    procedure SetDeviceName(const Value: String);
    procedure SetAcType(const Value: TDevicetype);
    procedure SetAtType(const Value: TDevicetype);
    procedure SetFdType(const Value: TDevicetype);
    procedure SetFoodAmt(const Value: integer);
    procedure SetPtType(const Value: TDevicetype);
    procedure SetConnected(const Value: Boolean);
    procedure SetWatchMode(const Value: TWatchMode);
    procedure SetDoorManageMode1(const Value: TDoorManageMode);
    procedure SetDoorPNMode1(const Value: TDoorPNMode);
    procedure SetDoorState1(const Value: TDoorState);
    procedure SetDoorManageMode2(const Value: TDoorManageMode);
    procedure SetDoorPNMode2(const Value: TDoorPNMode);
    procedure SetDoorState2(const Value: TDoorState);
    procedure SetFireServerCommand(const Value: Boolean);
    procedure SetJavaraCloseCommand(const Value: Boolean);
    procedure SetJavaraOpenCommand(const Value: Boolean);
    procedure SetDeviceSkillReceive(const Value: Boolean);
    procedure SetDoorLockMode1(const Value: TDoorLockState);
    procedure SetDoorLockMode2(const Value: TDoorLockState);
    procedure SetDoor1Fire(const Value: Boolean);
    procedure SetDoor2Fire(const Value: Boolean);
    procedure SetDeviceType(const Value: String);
  public
    constructor create;
    destructor Destroy;override;
  published
    { Published declarations }
    Property McuNode: TMCUNodeInfo Read FMcuNode write SetMcuNode;
    Property NodeNo: integer Read FNodeNO write SetNodeNO;
    Property ECUID: String Read FECUID write SetECUID;
    Property DeviceID: String Read FDeviceID write SetDeviceID;
    Property DeviceName: String Read FDeviceName write SetDeviceName;
    property ArmAreaUsed : Boolean read FArmAreaUsed write FArmAreaUsed;
    Property ATtype: TDevicetype Read FATtype write SetAtType;
    Property ACtype: TDevicetype Read FACtype write SetAcType;
    Property FDtype: TDevicetype Read FFDtype write SetFdType;
    Property PTtype: TDevicetype Read FPTtype write SetPtType;
    Property FoodAmtPer : integer Read FFDAMTPER write SetFoodAmt;
    Property WatchMode: TWatchMode read FWatchMode write SetWatchMode;
    Property DeviceType : String Read FDeviceType write SetDeviceType;
    Property DoorManageMode1 : TDoorManageMode Read FDoorManageMode1 write SetDoorManageMode1;
    Property DoorPNMode1 : TDoorPNMode Read FDoorPNMode1 write SetDoorPNMode1;
    Property DoorState1 : TDoorState Read FDoorState1 write SetDoorState1;
    Property DoorLockMode1 : TDoorLockState Read FDoorLockMode1 write SetDoorLockMode1;
    property Door1Fire : Boolean read FDoor1Fire write SetDoor1Fire;
    Property Door1Use : Boolean Read FDoor1Use write FDoor1Use;
    Property Door2Use : Boolean Read FDoor2Use write FDoor2Use;
    Property DoorManageMode2 : TDoorManageMode Read FDoorManageMode2 write SetDoorManageMode2;
    Property DoorPNMode2 : TDoorPNMode Read FDoorPNMode2 write SetDoorPNMode2;
    Property DoorState2 : TDoorState Read FDoorState2 write SetDoorState2;
    Property DoorLockMode2 : TDoorLockState Read FDoorLockMode2 write SetDoorLockMode2;
    property Door2Fire : Boolean read FDoor2Fire write SetDoor2Fire;
    //각각의 기기별 기능 점검항목
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
    property OnDeviceTypeChange : TDeviceTypeChange read FOnDeviceTypeChange write FOnDeviceTypeChange;
    Property OnDoorManageModeChange:         TDoorManageModeChangeType   read FOnDoorManageModeChange          write FOnDoorManageModeChange;
    Property OnDoorPNModeChange:         TDoorPNModeChangeType   read FOnDoorPNModeChange          write FOnDoorPNModeChange;
    Property OnDoorStateChange:         TDoorStateChangeType   read FOnDoorStateChange          write FOnDoorStateChange;
    Property OnWatchModeChange:         TWatchModeChangeType   read FOnWatchModeChange          write FOnWatchModeChange;
    property OnDoorModeChange: TDoorModeChangeType read FOnDoorModeChange write FOnDoorModeChange;

    Property Connected: Boolean Read FConnected write SetConnected;

  public
    L_stHolidaySend : string;  // 휴일 등록 전문 01 W
    L_bHolidayRecv : Boolean; //휴일 등록 응답 유무
    LastPollingTime: TDatetime;
    CardDataList : TStringList;       //카드데이터 리스트
    Procedure  SendPacket(aCmd:Char; aData: String;aQuick:Boolean = False;aType:integer=0);
    Procedure  CD_Download(aCardNo:String; ValidDay: String; cardType:Char; RegCode:Char; aTimeCode:Char; func:Char;
                           aAlarmAreaGrade,aDoorAreaGrade,aCardGroup,aCardTimeCode,aCardWeekCode:string;
                           aQuick:Boolean = False;aPositionNum:integer = 0;aCardPosition:Boolean = False);
    Procedure  MemoryCardAdd(aCardNo:String; ValidDay: String; cardType:Char; RegCode:Char; aTimeCode:Char; func:Char;
                           aAlarmAreaGrade,aDoorAreaGrade,aCardGroup,aCardTimeCode,aCardWeekCode:string;
                           aQuick:Boolean = False;aPositionNum:integer = 0;aCardPosition:Boolean = False);
    procedure  Check_DoorState(aDoorNo: Char;aQuick:Boolean = False);
    Procedure  DoorExitButton(aDoorNo: Char);
    Procedure  Control_DoorModeChange(aDoorNo: Char;  aMode:Char;aQuick:Boolean=True);
    Procedure  ReBoot;
    Procedure  ChangewatchMode(aArmAreaNo:string;aMode:TWatchMode);
    Function   Holiday(aCmd:Char;aDate,aDoorNo:string):Boolean;
    Procedure  CheckWatchMode(aArmAreaNo:string;aQuick:Boolean = False);
    Procedure  CheckSystemSkill(aQuick:Boolean = False);
    ProCedure  Check_DeviceVersion(aQuick:Boolean = False);
    Procedure  SendDoorSchadule(aDoor:Char;aDay:Char;aData:String;aQuick:Boolean = False);
    procedure  ServerCarDataSend(aCardReaderNo,aCardData:string);
    procedure  DeviceDoorInfoSearch(aDoor:string);
    procedure  DeviceDoorInfoSetting(aDoor,aCardMode,aDoorMode,aDoorControlTime,aOpenMoni,aUseSch,aSendDoor,aAlarmLong,
               aFire,aLockType,aDSOpen,aRemoteDoor,aCmd:string);
    procedure CardTypeSearch;
    procedure  FireOutbreak(aQuick:Boolean = False);  //화재발생처리
    procedure  RegistDoorTimeCodeUse(aDoorTimeCodeUse:string;aQuick: Boolean);

    procedure  MemoryClear; //충대 프로젝트용

  public
    procedure ArmAreaUseInitialize;
    procedure ArmAreaNameInitialize;
    procedure ArmAreaStateInitialize;

    procedure DoorUseInitialize;
    procedure DoorNameInitialize;
    procedure DoorManageModeInitialize;
    procedure DoorPNModeInitialize;
    procedure DoorStateInitialize;
    procedure DoorLockModeInitialize;
    procedure DoorFireInitialize;

    function GetArmAreaUse(aArmArea:integer):Boolean;
    function GetArmAreaName(aArmArea:integer):string;
    function GetArmAreaState(aArmArea:integer):TWatchMode;

    function GetDoorUse(aDoorNo:integer):Boolean;
    function GetDoorName(aDoorNo:integer):string;
    function GetDoorManageMode(aDoorNo:integer):TDoorManageMode;
    function GetDoorPNMode(aDoorNo:integer):TDoorPNMode;
    function GetDoorState(aDoorNo:integer):TDoorState;
    function GetDoorLockMode(aDoorNo:integer):TDoorLockState;
    function GetDoorFire(aDoorNo:integer):Boolean;

    procedure SetArmAreaUse(aArmArea:integer;aUsed:Boolean);
    procedure SetArmAreaName(aArmArea:integer;aName:string);
    procedure SetArmAreaState(aArmArea:integer;aArmAreaState:TWatchMode);

  protected
    Procedure DataPacektProcess(aData: string; NodeNo:integer;aFireGubunCode:string);
    procedure DeviceRecvAlarmData(aNodeNo:integer;aCommand,aData,aFireGubunCode:string);
    Procedure SendAckforaccess(aMsgCount:String);
    procedure DoorModeState(aNodeNo:integer;aData:string);
    procedure DoorControlState(aNodeNo:integer;aData:string);
    procedure RemoteDataProcess(aNodeNo:integer;aData:string);
    Function  GetSystemSkill(aEcuID,aData:string):Boolean;

  end;


implementation
uses
  uLomosUtil,
  uServerDaemon;

{ TMCUNodeInfo }

procedure TMCUNodeInfo.ACC_sendData(aEcuId, aData: String);
begin
  SendPacket(aEcuId,'c', aData,True);
end;

procedure TMCUNodeInfo.AllRelayControl(aRelayNo, aControlTime: integer;
  aQuick: Boolean);
var
  stData : string;
begin
  stData := 'SM2699' + 'RRY00' + FillZeroNumber(aRelayNo,2) + 'f' + FillZeroNumber(aControlTime,2);
  SendPacket('00','R',stData,aQuick);
end;

constructor TMCUNodeInfo.create;
begin
  inherited;
  AThread := Nil;
  Socket := nil;

  KTTAlarmSendDataList := TStringList.Create;
  ReserveSendDataList:=  TStringList.Create;
  ReserveSendDataList.Clear;
  CardSendDataList := TStringList.Create;
  CardSendDataList.Clear;
  QuickSendDataList:= TStringList.Create;
  QuickSendDataList.Clear;

  Devices:= TStringList.Create;
  Devices.Sorted := True;
  Devices.Duplicates:= dupIgnore;

  SocketConnected:= False;
  ReceivedLastpacket:= '';
  LastConnectedTime:= 0;

  ComBuff:= '';
  Rcv_MsgNo := '0';
  Send_MsgNo:= 0;

  FDtype:= dtnothing;

  L_nCardDataSend := 0;
  CardDataSendSleepCount := CARDDATA_SEND;

  StateEvent := False;
end;

procedure TMCUNodeInfo.DataPacektProcess(aData: string);
var
  aKey: Byte;
  st: string;
  aCommand: Char;
  stEcuId: String;
  DeviceIndex: Integer;
  StatusCode: String;
  aSubCLass:String;
begin

  if aData = '' then Exit;

  //058 K1100000203Aan20061201162319EX0300dNF*************C0

  //31:Q++()./,-**s*S^**+()./,-()
  aKey:= Ord(aData[5]);
  st:= Copy(aData,1,5) + EncodeData(aKey,Copy(aData,6,Length(aData)-6));
  aData:= st;
//  MCUID := Copy(aData,8,7);
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

  if (aCommand = 'c') AND (UpperCase(aData[19]) = 'K') then
  begin
      st:='Y' + Copy(aData,20,2)+'  '+'a';
      ACC_sendData(stEcuId, st);
  end;

  //이전에 받은 패킷과 같은 데이터 이면
  if ReceivedLastpacket = aData then
  begin
     ReceivedLastpacket:= aData;
     Exit;
  end else
  begin
     ReceivedLastpacket:= aData;
  end;

  DeviceIndex:= Devices.IndexOf(FillZeroNumber(No,3) + stEcuId);
  if DeviceIndex < 0 then
  begin
    if Not fmMain.DeviceClientECUAddItem(No,stEcuId) then
    begin
      SendPacket(stEcuId,'a','',True);
      if Assigned(FOnRcvInvalidDevice) then  OnRcvInvalidDevice(Self,aData,No);
      Exit;
    end;
    DeviceIndex:= Devices.IndexOf(FillZeroNumber(No,3) + stEcuId);
  end;
  if DeviceIndex > -1 then //목록에 존재 하면
  begin

    //if (pos('Bad Command',aData) > 0) or (pos('COMM ERROR',aData) > 0 ) then
    if Pos('COMM ERROR',aData) > 0 then
    begin
      TECUInfo(Devices.Objects[DeviceIndex]).Connected:= False;
    end else if (aSubCLass = 'MN') or (aSubCLass = 'EX')then
    begin
     if StatusCode = 'NF' then TECUInfo(Devices.Objects[DeviceIndex]).Connected:= False
     else                      TECUInfo(Devices.Objects[DeviceIndex]).Connected:= True;
    end ;

    TECUInfo(Devices.Objects[DeviceIndex]).DataPacektProcess(aData ,No,FIREGUBUNCODE);
  end else
  begin
    if Assigned(FOnRcvInvalidDevice) then  OnRcvInvalidDevice(Self,aData,No);
  end;

  //if (aCommand <> 'a') AND (aCommand <> 'E') then  //임시 test
  {ACK응답과 출입통제 데이터는 ACK를 보내지 않는다}
  if (aCommand <> 'a') AND (aCommand <> 'c') then
  begin
    SendPacket(stEcuId,'a','',True);
  end;

end;

destructor TMCUNodeInfo.Destroy;
var
  i : integer;
begin
  inherited;
  ReserveSendDataList.Free;
  CardSendDataList.Free;
  QuickSendDataList.Free;

  for I:= 0 to Devices.Count-1 do
  begin
    if Assigned( Devices.Objects[I]) then
      TECUInfo(Devices.Objects[I]).Free;
  end;
  Devices.Free;

  AThread := Nil;
  Socket := nil;
end;

procedure TMCUNodeInfo.ExecSendPacket;
var
  I: Integer;
  st: string;
begin

  if not SocketConnected then  Exit;
  AThread.Connection.Socket.Binding.UpdateBindingPeer;
  if AThread.Connection.Socket.Binding.PeerIP = '' then
  begin
    SocketConnected := False;
    Exit;
  end;
  if QuickSendDataList.Count > 0 then
  begin
    st:= QuickSendDataList[0];
    Try
      AThread.Connection.Write(st);
    Except
      SocketConnected := False;
      QuickSendDataList.Clear;
      Exit;
    End;

    //여기에서 데이터 송신현황 조회 {TO DO}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,st,No);
    end;
    QuickSendDataList.Delete(0);
    Exit;
  end;

  if ReserveSendDataList.Count > 0 then
  begin
    st:= ReserveSendDataList[0];
    Try
      AThread.Connection.Write(st);
    Except
      SocketConnected := False;
      ReserveSendDataList.Clear;
      Exit;
    End;
    //여기에서 데이터 송신현황 조회 {TO DO}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,st,No);
    end;
    ReserveSendDataList.Delete(0);
    Exit;
  end;

  if CardSendDataList.Count > 0 then
  begin
    st:= CardSendDataList[0];
    Try
      AThread.Connection.Write(st);
    Except
      SocketConnected := False;
      CardSendDataList.Clear;
      Exit;
    End;
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

procedure TMCUNodeInfo.FireOutbreak(aQuick: Boolean);
begin
  SendPacket('00','R','SM2900Fire',aQuick);
end;

procedure TMCUNodeInfo.FireRecovery(aQuick:Boolean=False);
begin
  SendPacket('00','R','SM2699RSM2500',aQuick);
//  SendPacket('00','R','SM2599',aQuick);
end;

procedure TMCUNodeInfo.KTTAlarm_Add(aSendData: string);
begin
  if KTTAlarmSendDataList.Count > 50 then KTTAlarmSendDataList.Delete(0);
  KTTAlarmSendDataList.Add(aSendData);
  if KTTAlarmSendDataList.Count > 50 then KTTAlarmSendDataList.Delete(0);
end;

procedure TMCUNodeInfo.KTTAlarm_Insert(aSendData: string);
begin
  if KTTAlarmSendDataList.Count > 49 then Exit;
  KTTAlarmSendDataList.Insert(0,aSendData);
end;

function TMCUNodeInfo.SendPacket(aEcuId: String; aCmd: Char; aData: String;
  aQuick: Boolean; aType: integer): Boolean;
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
  end else
  begin
    if aType = 0 then ReserveSendDataList.Add(ACKStr2)
    else if aType = 1 then CardSendDataList.Add(ACKStr2);
  end;

  Result:= True;
end;

procedure TMCUNodeInfo.SetClientIP(const Value: string);
begin
  if FClientIP <> Value then
  begin
    //여기에서 Client IP 가 다른 곳에서 들어오는 것을 확인 할 수 있음
    FClientIP := Value;
  end;
end;

procedure TMCUNodeInfo.SetClientPort(const Value: integer);
begin
  FClientPort := Value;
end;

procedure TMCUNodeInfo.SetFdType(const Value: TDevicetype);
begin
  FFDtype := Value;
end;

procedure TMCUNodeInfo.SetLocate(const Value: String);
begin
  if Flocate <> Value then
    FLocate:= Value;
end;

procedure TMCUNodeInfo.SetMCUID(const Value: string);
begin
  FMCUID := Value;
end;

procedure TMCUNodeInfo.SetNo(const Value: Integer);
begin
  FNo := Value;
end;

procedure TMCUNodeInfo.SetSocket(const Value: TIdPeerThread);
begin
  FSocket := Value;
  if AThread <> nil then
  begin
    if AThread <> Value then
    begin
      //여기에서 끊김후 재접속 신호를 내 보냄
    end;
  end;
  AThread := Value;
end;

procedure TMCUNodeInfo.SetSocketConnected(const Value: Boolean);
begin
  if FSocketConnected = Value then Exit;
  FSocketConnected := Value;
  if Assigned(FOnConnected) then
  begin
    OnConnected(Self,Value,NO);
  end;
end;


{ TECUInfo }

procedure TECUInfo.CardTypeSearch;
var
  stData : string;
begin
  stData := 'Ct00';          //조회는 전체를 '0'으로 마킹

  SendPacket('Q',stData,True);

end;

procedure TECUInfo.CD_Download(aCardNo:String;  // 카드번호
                              ValidDay: String;// 유효기간(6)
                              cardType:Char;   // 카드타입(0:출입,1:방범,2:출입+방범)
                              RegCode:Char;    // 0.출입문 2개 ,1.1번,2.2번
                              aTimeCode:Char;  // 타임코드
                              func:Char;        // 등록코드(L:등록, N:삭제)
                              aAlarmAreaGrade,
                              aDoorAreaGrade,
                              aCardGroup,
                              aCardTimeCode,
                              aCardWeekCode:string;
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
  nIndex : integer;
  oCard : TCardGrade;
  nCardFixType : integer;
begin
  nCardFixType := McuNode.CardFixType;

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

  if nCardFixType = 0 then           //기기고정타입
  begin
    if CARDLENGTHTYPE = 0 then   //서버 고정 타입
    begin
      if IsNumericCardNo then
      begin
        if Not Isdigit(aCardNo) then Exit;
        aCardNo := FillZeroStrNum(Trim(aCardNo),10);
        xCardNo:=  '00'+EncodeCardNo(aCardNo);
      end
      else xCardNo:= '00' + EncodeCardNo(aCardNo,True);
      xCardNo := FillZeroStrNum(Trim(xCardNo),10);
    end else if CARDLENGTHTYPE = 1 then
    begin
      xCardNo:= '00' + EncodeCardNo(copy(aCardNo,1,8),True);
      xCardNo := FillZeroStrNum(Trim(xCardNo),10);
    end else if CARDLENGTHTYPE = 2 then
    begin
      xCardNo:= '00' + EncodeCardNo(copy(aCardNo,1,8),True);
      xCardNo := FillZeroStrNum(Trim(xCardNo),10);
    end;
  end else if nCardFixType =  1 then  //기기 가변 타입
  begin
    if CARDLENGTHTYPE = 0 then        //서버는 고정
    begin
      if IsNumericCardNo then
      begin
        if Not Isdigit(aCardNo) then Exit;
        aCardNo := FillZeroStrNum(Trim(aCardNo),10);
        aCardNo := Dec2Hex64(StrtoInt64(aCardNo),8);
      end;
      xCardNo:=  FillCharString(aCardNo,'*',16);
    end else if CARDLENGTHTYPE = 1 then
    begin
      xCardNo:= aCardNo;
    end else if CARDLENGTHTYPE = 2 then
    begin
      if (aCardNo[9] = '0') and (aCardNo[10] = '*') then aCardNo[9] := '*'; //시리얼카드이면 시리얼 타입으로 설정하자.
      xCardNo:= aCardNo;
      xCardNo:=  FillCharString(xCardNo,'*',G_nCardFixedLength);
    end;
    nCardLength := Length(xCardNo);
    xCardNo := FillzeroNumber(nCardLength,2) + xCardNo;
  end else if nCardFixType = 2 then   //기기 KT사옥 타입
  begin
    if CARDLENGTHTYPE = 0 then        //서버는 고정
    begin
      if IsNumericCardNo then
      begin
        if Not Isdigit(aCardNo) then Exit;
        aCardNo := FillZeroStrNum(Trim(aCardNo),10);
        aCardNo := Dec2Hex64(StrtoInt64(aCardNo),8);
      end;
      xCardNo:=  FillCharString(aCardNo + '0','*',11);
      xCardNo := Ascii2Hex(xCardNo,False,True);
    end else if CARDLENGTHTYPE = 1 then  //서버는 가변
    begin
      xCardNo:=  FillCharString(copy(aCardNo,1,8) + '0','*',11);
      xCardNo := Ascii2Hex(xCardNo,False,True);
    end else if CARDLENGTHTYPE = 2 then  //서버는 KT사옥용
    begin
      xCardNo := Ascii2Hex(aCardNo,False,True);
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
          aTimeCode +                //타임패턴
          stCardPositionNum +                       //카드 id 번호
          aAlarmAreaGrade +                 //방범구역권한
          aDoorAreaGrade +                  //출입문 권한
          aCardGroup +
          aCardTimeCode +
          aCardWeekCode;


  SendPacket('c',aData,aQuick,1);
  MemoryCardAdd(aCardNo,ValidDay,cardType,RegCode,aTimeCode,func,aAlarmAreaGrade,aDoorAreaGrade,aCardGroup,aCardTimeCode,aCardWeekCode,aQuick,aPositionNum,aCardPosition);

end;

procedure TECUInfo.ChangewatchMode(aArmAreaNo:string;aMode:TWatchMode);
begin
  case aMode of
    cmArm      : SendPacket('R','MC' + FillZeroStrNum(aArmAreaNo,2)+'A',True); //경비모드
    cmDisarm   : SendPacket('R','MC' + FillZeroStrNum(aArmAreaNo,2)+'D',True); //해제모드
    cmPatrol   : SendPacket('R','MC' + FillZeroStrNum(aArmAreaNo,2)+'P',True); //순회모드
    cmInit     : SendPacket('R','MC' + FillZeroStrNum(aArmAreaNo,2)+'I',True); //등록모드
    cmTest     : SendPacket('R','MC' + FillZeroStrNum(aArmAreaNo,2)+'T',True); //TEST모드
  end;
end;

procedure TECUInfo.Check_DeviceVersion(aQuick: Boolean);
begin
  SendPacket('R','VR00',aQuick);
end;

procedure TECUInfo.Check_DoorState(aDoorNo: Char; aQuick: Boolean);
var
  st: string;
begin

  st:= 'C'+                               //  Msg Code
       InttoStr(McuNode.Send_MsgNo)+     //  Msg Count
       ADoorNo+                           //  기기내 Door No
       #$30+                              //  RecordCount(고정)
       #$30+                              //  RecordCount(상태조회)
       #$30;                              //  의미없음

  SendPacket('c',st,aQuick);
end;

procedure TECUInfo.CheckSystemSkill(aQuick: Boolean);
begin
  SendPacket('R','VR90',aQuick);
end;

procedure TECUInfo.CheckWatchMode(aArmAreaNo:string;aQuick:Boolean = False);
var
  stArmArea : string;
  i : integer;
  stData : string;
begin
  if (aArmAreaNo = '0') or (aArmAreaNo = '') then
  begin
    if ECUID = '00' then stData := 'RD00'
    else stData := 'RD00' + ECUID;
    if McuNode <> nil then
      McuNode.SendPacket('00','R',stData,aQuick,0);
  end else
  begin
    stArmArea := '';
    for i := 0 to 8 do
    begin
      stArmArea := stArmArea + '1';
    end;
    stData := 'rd01' + stArmArea;
    SendPacket('R',stData,aQuick);
  end;
end;

constructor TECUInfo.create;
var
  i : integer;
begin
  DeviceID:= '000000000000';
  ATtype:= dtnothing;
  ACtype:= dtnothing;
  PTtype:= dtnothing;
  FDtype:= dtnothing;
  Connected:= False;
  //WatchMode:= cmNothing;
  for i := Low(ArmAreaState) to High(ArmAreaState) do
  begin
    SetArmAreaState(i,cmNothing);
  end;
  LastPollingTime:= 0;
  DoorManageMode1 := dmNothing;
  DoorState1 := dsNothing;
  DoorManageMode2 := dmNothing;
  DoorState2 := dsNothing;

  //기능점검
  DeviceSkillReceive := False;
  FireServerCommand := False;
  JavaraOpenCommand := False;
  JavaraCloseCommand := False;

  Door1Use := False;
  Door2Use := False;

  ArmAreaUseInitialize;
  ArmAreaNameInitialize;
  ArmAreaStateInitialize;

  DoorUseInitialize;
  DoorNameInitialize;
  DoorManageModeInitialize;
  DoorPNModeInitialize;
  DoorStateInitialize;
  DoorLockModeInitialize;
  DoorFireInitialize;

  CardDataList := TStringList.Create;

end;

procedure TECUInfo.DataPacektProcess(aData: string; NodeNo: integer;aFireGubunCode:string);
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
           McuNode.AliveTime := Now;
         end;
    'A','o': begin // 알람 데이터
           DeviceRecvAlarmData(NodeNo,aCommand,aData,aFireGubunCode);
         end;
    'i': begin // Ack Device Set up
           if Assigned(FOnRcvInitAckData) then OnRcvInitAckData(Self,aData,NodeNO);
         end;
    'r': begin // Ack Remotecontrol
           if Assigned(FOnRcvRemoteAckData) then OnRcvRemoteAckData(Self,aData,NodeNO);
           RemoteDataProcess(NodeNO,aData);
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
           case MSG_Code of
             'F' ://전화 로그 데이터 처리
                begin
                  SendAckforaccess(Copy(aData,20,2));
                  if Assigned(FOnRcvTellogData) then OnRcvTellogData(Self,aData,NodeNO);
                end;
             'E' ://카드 데이터(출입) 처리
                begin
                  SendAckforaccess(Copy(aData,20,2));
                  if Assigned(FOnRcvCardReadData) then OnRcvCardReadData(Self,aData,NodeNO);
                end;
             'D' ://문 상태 변경 처리
                begin
                  SendAckforaccess(Copy(aData,20,2));
                  DoorModeState(NodeNO,aData);
                  //if Assigned(FOnRcvChangeDoorData) then OnRcvChangeDoorData(Self,aData,NodeNO);
                end;
             'c' ://문제어 응답
                begin
                  DoorControlState(NodeNo,aData);
                  //if Assigned(FOnRcvDoorControl) then OnRcvDoorControl(Self,aData,NodeNO);
                end;
             'a','b','g'://출입통제 등록 웅답
                begin
                  if Assigned(FOnRcvDoorSetup) then OnRcvDoorSetup(Self,aData,NodeNO);

                end;
             'l','m','n','j':// 카드 데이터 등록 응답
                begin
                  if Assigned(FOnRcvRegCardData) then OnRcvRegCardData(Self,aData,NodeNO);
                end;
             's' : //스케줄 데이터 등록 응답
                begin
                  if Assigned(FOnRcvRegSchedule) then OnRcvRegSchedule(Self,aData,NodeNO);
                end;
             'q' : //휴일등록 응답
                begin
                  if copy(aData,20,4) = L_stHolidaySend then
                  begin
                    L_bHolidayRecv := True;
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

destructor TECUInfo.Destroy;
var
  i : integer;
begin
  if CardDataList.Count > 0 then
  begin
    for i := CardDataList.Count - 1 downto 0 do
    begin
      TCardGrade(CardDataList.Objects[i]).Free;
    end;
  end;
  CardDataList.Clear;
  CardDataList.Free;
  inherited Destroy;
end;

procedure TECUInfo.DeviceDoorInfoSearch(aDoor: string);
var
  stData : string;
begin
  stData := 'B' + '0' +                             //MSG Code
            aDoor +               //문번호
            #$20 + #$20 + '00000000000000000000';          //조회는 전체를 '0'으로 마킹

  SendPacket('c',stData,True);

end;

procedure TECUInfo.DeviceDoorInfoSetting(aDoor, aCardMode, aDoorMode,
  aDoorControlTime, aOpenMoni, aUseSch, aSendDoor, aAlarmLong, aFire,
  aLockType, aDSOpen, aRemoteDoor,aCmd: string);
var
  stData: string;

begin
  stData := aCmd + //'A' +                       //MSG Code
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

procedure TECUInfo.DeviceRecvAlarmData(aNodeNo: integer; aCommand,
  aData,aFireGubunCode: string);
var
  stSubCLass : string;
  stStatusCode : string;
  cMode : Char;
begin
  stSubClass := copy(aData,34,2);
  cMode     := aData[40];
  stStatusCode   := copy(aData,41,2);

  if (stSubCLass = 'MN') or (stSubCLass = 'EX')then
  begin
    if stStatusCode = 'NF' then
    begin
      Connected := False;
//      Exit;
    end else Connected := True;
  end
  else Connected := True;

  case UpperCase(cMode)[1] of
   'A': begin WatchMode := cmArm end;
   'D': begin WatchMode := cmDisarm end;
   'T': begin WatchMode := cmTest end;
   'I': begin WatchMode := cmInit end;
   'P': begin WatchMode := cmPatrol end;
   'E': begin WatchMode := cmJaejung end;
  else  begin WatchMode := cmNothing end;
  end;

  if Assigned(FOnRcvAlarmData) then OnRcvAlarmData(Self,aCommand,aData,aNodeNO,aFireGubunCode);

end;

procedure TECUInfo.DoorControlState(aNodeNo: integer; aData: string);
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
      begin
        if Door1Use then
          OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode1,DoorPNMode1,DoorState1,DoorLockMode1);
      end;
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
      begin
        if Door2Use then
          OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode2,DoorPNMode2,DoorState2,DoorLockMode2);
      end;
    end;
  end;

end;

procedure TECUInfo.DoorExitButton(aDoorNo: Char);
var
  st: string;
begin
  st:= 'C'+                              //  Msg Code
       InttoStr(McuNode.Send_MsgNo)+    //  Msg Count
       aDoorNo+                         //  기기내 Door No
       #$30+                             //  RecordCount(고정)
       #$33+                             //  RecordCount(제어 #$33)
       #$31;
  SendPacket('c',st,True);
end;

procedure TECUInfo.Control_DoorModeChange(aDoorNo, aMode: Char; aQuick: Boolean);
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

procedure TECUInfo.DoorModeState(aNodeNo: integer; aData: string);
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
      begin
        if Door1Use then
          OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode1,DoorPNMode1,DoorState1,DoorLockMode1);
      end;
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
      begin
        if Door2Use then
          OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode2,DoorPNMode2,DoorState2,DoorLockMode2);
      end;
    end;

  end;

end;

procedure TECUInfo.FireOutbreak(aQuick:Boolean = False);
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

function TECUInfo.GetSystemSkill(aEcuID, aData: string): Boolean;
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

Function TECUInfo.Holiday(aCmd: Char; aDate, aDoorNo: string):Boolean;
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
    if G_bApplicationTerminate then Exit;
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;
  result := L_bHolidayRecv;
end;

procedure TECUInfo.ReBoot;
begin
  SendPacket('R','RS00Reset',True);
end;

procedure TECUInfo.RemoteDataProcess(aNodeNo: integer; aData: string);
var
  aCode: String;
  aGubun : string;
  stEcuID : string;
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
  end;

end;

procedure TECUInfo.SendAckforaccess(aMsgCount: String);
var
  st: string;
begin
  //st:=#$90 + aMsgCount+'  '+#$80;
  st:='Y' + aMsgCount+'  '+'a';
  Self.FMcuNode.SendPacket(ECUID,'c',st,True);

end;

procedure TECUInfo.SendDoorSchadule(aDoor, aDay: Char; aData: String;
  aQuick: Boolean);
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
end;

procedure TECUInfo.SendPacket(aCmd: Char; aData: String; aQuick: Boolean;
  aType: integer);
begin
  if FMcuNode <> nil then
  begin
    if FMcuNode.SocketConnected then
       FMcuNode.SendPacket(ECUID,aCmd,aData,aQuick,aType);
  end;

end;

procedure TECUInfo.ServerCarDataSend(aCardReaderNo, aCardData: string);
begin
  SendPacket('R','CD90'+   //CMD
                 '**' +    //예비컨트롤 ID
                 FillZeroNumber(strtoint(aCardReaderNo),2) + //카드리더번호
                 '**' +    //Door No
                 '7F' +
                 FillZeroNumber(Length(aCardData),2) +
                 aCardData , True); //카드리더 전송

end;

procedure TECUInfo.SetAcType(const Value: TDevicetype);
begin
  FACtype := Value;
end;

procedure TECUInfo.SetAtType(const Value: TDevicetype);
begin
  FATtype := Value;
end;

procedure TECUInfo.SetConnected(const Value: Boolean);
begin
  if FConnected <> Value then
  begin
    FConnected := Value;
    if Assigned(FOnConnected) then OnConnected(Self,Value,NodeNO,ECUID);
    if Value then FMcuNode.SocketConnected := Value;
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
         if Door1Use then OnDoorModeChange(Self,NodeNO,ECUID,'1',DoorManageMode1,DoorPNMode1,DoorState1,DoorLockMode1);
         if Door2Use then OnDoorModeChange(Self,NodeNO,ECUID,'2',DoorManageMode2,DoorPNMode2,DoorState2,DoorLockMode2);
      end;
    end;
  end;
end;

procedure TECUInfo.SetDeviceID(const Value: String);
begin
  FDeviceID := Value;
end;

procedure TECUInfo.SetDeviceName(const Value: String);
begin
  FDeviceName := Value;
end;

procedure TECUInfo.SetDeviceSkillReceive(const Value: Boolean);
begin
  FDeviceSkillReceive := Value;
end;

procedure TECUInfo.SetDoor1Fire(const Value: Boolean);
begin
  FDoor1Fire := Value;
end;

procedure TECUInfo.SetDoor2Fire(const Value: Boolean);
begin
  FDoor2Fire := Value;
end;

procedure TECUInfo.SetDoorLockMode1(const Value: TDoorLockState);
begin
  FDoorLockMode1 := Value;
end;

procedure TECUInfo.SetDoorLockMode2(const Value: TDoorLockState);
begin
  FDoorLockMode2 := Value;
end;

procedure TECUInfo.SetDoorManageMode1(const Value: TDoorManageMode);
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

procedure TECUInfo.SetDoorManageMode2(const Value: TDoorManageMode);
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

procedure TECUInfo.SetDoorPNMode1(const Value: TDoorPNMode);
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

procedure TECUInfo.SetDoorPNMode2(const Value: TDoorPNMode);
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

procedure TECUInfo.SetDoorState1(const Value: TDoorState);
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

procedure TECUInfo.SetDoorState2(const Value: TDoorState);
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

procedure TECUInfo.SetECUID(const Value: String);
begin
  FECUID := Value;
end;

procedure TECUInfo.SetFdType(const Value: TDevicetype);
begin
  if FFDtype <> Value then FFDtype := Value;
  if Value = dtFd then
    FMcuNode.FDtype := dtFd;
end;

procedure TECUInfo.SetFireServerCommand(const Value: Boolean);
begin
  FFireServerCommand := Value;
end;

procedure TECUInfo.SetFoodAmt(const Value: integer);
begin
  FFDAMTPER := Value;
end;

procedure TECUInfo.SetJavaraCloseCommand(const Value: Boolean);
begin
  FJavaraCloseCommand := Value;
end;

procedure TECUInfo.SetJavaraOpenCommand(const Value: Boolean);
begin
  FJavaraOpenCommand := Value;
end;

procedure TECUInfo.SetMcuNode(const Value: TMCUNodeInfo);
begin
  if FMcuNode <> Value then
  begin
    FMcuNode := Value;
    FMcuNode.Devices.AddObject(self.DeviceID,Self);
  end;
//  FMcuNode := Value;
end;

procedure TECUInfo.SetNodeNO(const Value: integer);
begin
  if FNodeNO <> Value then  FNodeNO := Value;
end;

procedure TECUInfo.SetPtType(const Value: TDevicetype);
begin
  FPTtype := Value;
end;

procedure TECUInfo.SetWatchMode(const Value: TWatchMode);
begin
  if FWatchMode <> Value then
  begin
    FWatchMode := Value;
    if Assigned(FOnWatchModeChange) then
    begin
      OnWatchModeChange(self,NodeNo,ECUID,'0',Value);
    end;
  end;
end;

procedure TECUInfo.MemoryCardAdd(aCardNo, ValidDay: String; cardType,
  RegCode, aTimeCode, func: Char; aAlarmAreaGrade, aDoorAreaGrade,
  aCardGroup, aCardTimeCode, aCardWeekCode: string; aQuick: Boolean;
  aPositionNum: integer; aCardPosition: Boolean);
var
  nIndex : integer;
  oCard : TCardGrade;
  stDoorAreaGrade : string;
  stArmAreaGrade : string;
  stTemp1,stTemp2 : string;
begin
  stDoorAreaGrade := Ascii2Hex(aDoorAreaGrade);
  stDoorAreaGrade := HexToBinary(stDoorAreaGrade);
  stTemp1 := copy(stDoorAreaGrade,1,8);
  Delete(stTemp1,1,4);
  stTemp2 := copy(stDoorAreaGrade,9,8);
  Delete(stTemp2,1,4);
  stDoorAreaGrade := stTemp1 + stTemp2;


  stArmAreaGrade := Ascii2Hex(aAlarmAreaGrade);
  stArmAreaGrade := HexToBinary(stArmAreaGrade);
  stTemp1 := copy(stArmAreaGrade,1,8);
  Delete(stTemp1,1,4);
  stTemp2 := copy(stArmAreaGrade,9,8);
  Delete(stTemp2,1,4);
  stArmAreaGrade := stTemp1 + stTemp2;

  nIndex := CardDataList.IndexOf(aCardNo);
  if nIndex < 0 then
  begin
    oCard := TCardGrade.Create(nil);
    oCard.ValidDay := ValidDay;
    oCard.cardType := cardType; //카드타입설정: 0=> 출입,1=>방범,2=>방범+출입
    oCard.GRADE := func;

    if stDoorAreaGrade[1] = '1' then oCard.DOOR8 := '1'
    else oCard.DOOR8 := '0';
    if stDoorAreaGrade[2] = '1' then oCard.DOOR7 := '1'
    else oCard.DOOR7 := '0';
    if stDoorAreaGrade[3] = '1' then oCard.DOOR6 := '1'
    else oCard.DOOR6 := '0';
    if stDoorAreaGrade[4] = '1' then oCard.DOOR5 := '1'
    else oCard.DOOR5 := '0';
    if stDoorAreaGrade[5] = '1' then oCard.DOOR4 := '1'
    else oCard.DOOR4 := '0';
    if stDoorAreaGrade[6] = '1' then oCard.DOOR3 := '1'
    else oCard.DOOR3 := '0';
    if stDoorAreaGrade[7] = '1' then oCard.DOOR2 := '1'
    else oCard.DOOR2 := '0';
    if stDoorAreaGrade[8] = '1' then oCard.DOOR1 := '1'
    else oCard.DOOR1 := '0';

    if RegCode = '0' then
    begin
      oCard.DOOR1 := '1';
      oCard.DOOR2 := '1';
    end else if RegCode = '1' then
    begin
      oCard.DOOR1 := '1';
      oCard.DOOR2 := '0';
    end else if RegCode = '2' then
    begin
      oCard.DOOR1 := '0';
      oCard.DOOR2 := '1';
    end else
    begin
      oCard.DOOR1 := '0';
      oCard.DOOR2 := '0';
    end;


    if stArmAreaGrade[1] = '1' then oCard.ARMAREA8 := '1'
    else oCard.ARMAREA8 := '0';
    if stArmAreaGrade[2] = '1' then oCard.ARMAREA7 := '1'
    else oCard.ARMAREA7 := '0';
    if stArmAreaGrade[3] = '1' then oCard.ARMAREA6 := '1'
    else oCard.ARMAREA6 := '0';
    if stArmAreaGrade[4] = '1' then oCard.ARMAREA5 := '1'
    else oCard.ARMAREA5 := '0';
    if stArmAreaGrade[5] = '1' then oCard.ARMAREA4 := '1'
    else oCard.ARMAREA4 := '0';
    if stArmAreaGrade[6] = '1' then oCard.ARMAREA3 := '1'
    else oCard.ARMAREA3 := '0';
    if stArmAreaGrade[7] = '1' then oCard.ARMAREA2 := '1'
    else oCard.ARMAREA2 := '0';
    if stArmAreaGrade[8] = '1' then oCard.ARMAREA1 := '1'
    else oCard.ARMAREA1 := '0';
    if cardType <> '0' then oCard.ARMAREA0 := '1'
    else oCard.ARMAREA0 := '0';

    CardDataList.AddObject(aCardNo,oCard);
  end else
  begin
    TCardGrade(CardDataList.Objects[nIndex]).ValidDay := ValidDay;
    TCardGrade(CardDataList.Objects[nIndex]).cardType := cardType; //카드타입설정: 0=> 출입,1=>방범,2=>방범+출입
    TCardGrade(CardDataList.Objects[nIndex]).GRADE := func;

    if stDoorAreaGrade[1] = '1' then TCardGrade(CardDataList.Objects[nIndex]).DOOR8 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).DOOR8 := '0';
    if stDoorAreaGrade[2] = '1' then TCardGrade(CardDataList.Objects[nIndex]).DOOR7 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).DOOR7 := '0';
    if stDoorAreaGrade[3] = '1' then TCardGrade(CardDataList.Objects[nIndex]).DOOR6 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).DOOR6 := '0';
    if stDoorAreaGrade[4] = '1' then TCardGrade(CardDataList.Objects[nIndex]).DOOR5 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).DOOR5 := '0';
    if stDoorAreaGrade[5] = '1' then TCardGrade(CardDataList.Objects[nIndex]).DOOR4 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).DOOR4 := '0';
    if stDoorAreaGrade[6] = '1' then TCardGrade(CardDataList.Objects[nIndex]).DOOR3 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).DOOR3 := '0';
    if stDoorAreaGrade[7] = '1' then TCardGrade(CardDataList.Objects[nIndex]).DOOR2 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).DOOR2 := '0';
    if stDoorAreaGrade[8] = '1' then TCardGrade(CardDataList.Objects[nIndex]).DOOR1 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).DOOR1 := '0';

    if RegCode = '0' then
    begin
      TCardGrade(CardDataList.Objects[nIndex]).DOOR1 := '1';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR2 := '1';
    end else if RegCode = '1' then
    begin
      TCardGrade(CardDataList.Objects[nIndex]).DOOR1 := '1';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR2 := '0';
    end else if RegCode = '2' then
    begin
      TCardGrade(CardDataList.Objects[nIndex]).DOOR1 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR2 := '1';
    end else
    begin
      TCardGrade(CardDataList.Objects[nIndex]).DOOR1 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR2 := '0';
    end;
    if stArmAreaGrade[1] = '1' then TCardGrade(CardDataList.Objects[nIndex]).ARMAREA8 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).ARMAREA8 := '0';
    if stArmAreaGrade[2] = '1' then TCardGrade(CardDataList.Objects[nIndex]).ARMAREA7 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).ARMAREA7 := '0';
    if stArmAreaGrade[3] = '1' then TCardGrade(CardDataList.Objects[nIndex]).ARMAREA6 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).ARMAREA6 := '0';
    if stArmAreaGrade[4] = '1' then TCardGrade(CardDataList.Objects[nIndex]).ARMAREA5 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).ARMAREA5 := '0';
    if stArmAreaGrade[5] = '1' then TCardGrade(CardDataList.Objects[nIndex]).ARMAREA4 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).ARMAREA4 := '0';
    if stArmAreaGrade[6] = '1' then TCardGrade(CardDataList.Objects[nIndex]).ARMAREA3 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).ARMAREA3 := '0';
    if stArmAreaGrade[7] = '1' then TCardGrade(CardDataList.Objects[nIndex]).ARMAREA2 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).ARMAREA2 := '0';
    if stArmAreaGrade[8] = '1' then TCardGrade(CardDataList.Objects[nIndex]).ARMAREA1 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).ARMAREA1 := '0';
    if cardType <> '0' then TCardGrade(CardDataList.Objects[nIndex]).ARMAREA0 := '1'
    else TCardGrade(CardDataList.Objects[nIndex]).ARMAREA0 := '0';
  end;

end;

procedure TECUInfo.RegistDoorTimeCodeUse(aDoorTimeCodeUse: string;
  aQuick: Boolean);
var
  stData : string;
begin
  stData := 'DL09*' + aDoorTimeCodeUse;
  SendPacket('I',stData,aQuick);
end;

procedure TECUInfo.SetDeviceType(const Value: String);
begin
  if FDeviceType = Value then Exit;
  FDeviceType := Value;
  if Assigned(FOnDeviceTypeChange) then
  begin
    OnDeviceTypeChange(self,NodeNo,ECUID,Value);
  end;
end;

function TECUInfo.GetArmAreaState(aArmArea: integer): TWatchMode;
begin
  result := ArmAreaState[aArmArea];
end;

function TECUInfo.GetArmAreaName(aArmArea: integer): string;
begin
  result := ArmAreaName[aArmArea];
end;

function TECUInfo.GetArmAreaUse(aArmArea: integer): Boolean;
begin
  result := ArmAreaUse[aArmArea];
end;

procedure TECUInfo.MemoryClear;
begin
  SendPacket('I','ac00Register Clear',False);
end;

procedure TECUInfo.ArmAreaNameInitialize;
var
  i : integer;
begin
  for i := LOW(ArmAreaName) to HIGH(ArmAreaName) do
  begin
    ArmAreaName[i] := '';
  end;
end;

procedure TECUInfo.ArmAreaStateInitialize;
var
  i : integer;
begin
  for i := LOW(ArmAreaState) to HIGH(ArmAreaState) do
  begin
    ArmAreaState[i] := cmNothing;
  end;
end;

procedure TECUInfo.ArmAreaUseInitialize;
var
  i : integer;
begin
  for i := LOW(ArmAreaUse) to HIGH(ArmAreaUse) do
  begin
    ArmAreaUse[i] := False;
  end;
end;

procedure TECUInfo.DoorFireInitialize;
var
  i : integer;
begin
  for i := LOW(DoorFire) to HIGH(DoorFire) do
  begin
    DoorFire[i] := False;
    if Assigned(FOnDoorModeChange) then
    begin
      OnDoorModeChange(self,NodeNo,ECUID,inttostr(i),GetDoorManageMode(i),GetDoorPNMode(i),GetDoorState(i),GetDoorLockMode(i));
    end;
  end;
end;

procedure TECUInfo.DoorLockModeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorLockMode) to HIGH(DoorLockMode) do
  begin
    DoorLockMode[i] := lsNothing;
  end;
end;

procedure TECUInfo.DoorManageModeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorManageMode) to HIGH(DoorManageMode) do
  begin
    DoorManageMode[i] := dmNothing;
  end;
end;

procedure TECUInfo.DoorNameInitialize;
var
  i : integer;
begin
  for i := LOW(DoorName) to HIGH(DoorName) do
  begin
    DoorName[i] := '';
  end;
end;

procedure TECUInfo.DoorPNModeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorPNMode) to HIGH(DoorPNMode) do
  begin
    DoorPNMode[i] := pnNothing;
  end;
end;

procedure TECUInfo.DoorStateInitialize;
var
  i : integer;
begin
  for i := LOW(DoorState) to HIGH(DoorState) do
  begin
    DoorState[i] := dsNothing;
  end;
end;

procedure TECUInfo.DoorUseInitialize;
var
  i : integer;
begin
  for i := LOW(DoorUse) to HIGH(DoorUse) do
  begin
    DoorUse[i] := False;
  end;
end;

procedure TECUInfo.SetArmAreaName(aArmArea: integer; aName: string);
begin
  if aArmArea > HIGH(ArmAreaName) then Exit;
  if ArmAreaName[aArmArea] = aName then Exit;
  ArmAreaName[aArmArea] := aName ;
end;

procedure TECUInfo.SetArmAreaState(aArmArea: integer;
  aArmAreaState: TWatchMode);
begin
  if aArmArea > HIGH(ArmAreaState) then Exit;
  if ArmAreaState[aArmArea] = aArmAreaState then Exit;
  //if aArmArea = 0 then WatchMode := aArmAreaState; //방범구역 미사용시
  ArmAreaState[aArmArea] := aArmAreaState ;
  if Assigned(FOnWatchModeChange) then
  begin
    OnWatchModeChange(self,NodeNo,ECUID,inttostr(aArmArea),aArmAreaState);
  end;
end;

procedure TECUInfo.SetArmAreaUse(aArmArea: integer; aUsed: Boolean);
begin
  if aArmArea > HIGH(ArmAreaUse) then Exit;
  if ArmAreaUse[aArmArea] = aUsed then Exit;
  ArmAreaUse[aArmArea] := aUsed ;
  if (aArmArea > 0) and aUsed then ArmAreaUsed := True;
end;

function TECUInfo.GetDoorFire(aDoorNo: integer): Boolean;
begin
  if aDoorNo > HIGH(DoorFire) then Exit;
  result := DoorFire[aDoorNo];
end;

function TECUInfo.GetDoorLockMode(aDoorNo: integer): TDoorLockState;
begin
  if aDoorNo > HIGH(DoorLockMode) then Exit;
  result := DoorLockMode[aDoorNo];
end;

function TECUInfo.GetDoorManageMode(aDoorNo: integer): TDoorManageMode;
begin
  if aDoorNo > HIGH(DoorManageMode) then Exit;
  case aDoorNo of
    1 : begin
      result := DoorManageMode1;
    end;
    2 : begin
      result := DoorManageMode2;
    end;
    else begin
      result := DoorManageMode[aDoorNo];
    end;
  end;
end;

function TECUInfo.GetDoorName(aDoorNo: integer): string;
begin
  if aDoorNo > HIGH(DoorName) then Exit;
  result := DoorName[aDoorNo];
end;

function TECUInfo.GetDoorPNMode(aDoorNo: integer): TDoorPNMode;
begin
  if aDoorNo > HIGH(DoorPNMode) then Exit;

  case aDoorNo of
    1 : begin
      result := DoorPNMode1;
    end;
    2 : begin
      result := DoorPNMode2;
    end;
    else begin
      result := DoorPNMode[aDoorNo];
    end;
  end;
end;

function TECUInfo.GetDoorState(aDoorNo: integer): TDoorState;
begin
  if aDoorNo > HIGH(DoorState) then Exit;
  result := DoorState[aDoorNo];
  case aDoorNo of
    1 : begin
      result := DoorState1;
    end;
    2 : begin
      result := DoorState2;
    end;
    else begin
      result := DoorState[aDoorNo];
    end;
  end;
end;

function TECUInfo.GetDoorUse(aDoorNo: integer): Boolean;
begin
  if aDoorNo > HIGH(DoorUse) then Exit;
  result := DoorUse[aDoorNo];
end;

end.
