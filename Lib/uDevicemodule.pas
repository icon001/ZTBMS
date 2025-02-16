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
  ExtCtrls, DB, ADODB,uDataModule1,SyncObjs,u_c_byte_buffer,WinSock;  //WinSock,IdWinSock2

const wm_asynch_select= wm_User;
const k_buffer_max= 4096;
      k_tcp_ip_chunk= 1500;
      MAXSOCKCOUNT = 100;


const
  Msg_DeviceCheck     = WM_USER + 1001;
  Msg_DeviceReg       = WM_USER + 1002;
  Msg_DeviceRemote    = WM_USER + 1003;
  Msg_CardNoDownload  = WM_USER + 1004;
  Msg_TelNoDownload   = WM_USER + 1005;
  Msg_DoorReg         = WM_USER + 2001;

const
  //COMMANDDATA_SEND = 60;
  CARDDATA_SEND = 100;  //20190604 전송시간을 6초로 변경 후 응답이 오면 즉시전송

type

  TCommNode = class(TComponent)
  private
    { Private declarations }
    //********************* WinSock 변수
    l_wsa_data: twsaData;
    l_c_reception_buffer: c_byte_buffer;
    FWinSockServerPacket: string;
    FOldConnected: integer;
    NodeDisConnectedCheckTimer : TTimer;
    FServerEnqCount: integer;
    FOldSendTime: TDateTime;
    function GetHandle: THandle;
    procedure SetWinSockServerPacket(const Value: string);
    procedure NodeDisConnectedCheckTimerTimer(Sender: TObject);
  private
    { Private declarations }
    FNo: Integer;
    FHandle : THandle;
    FLocate: String;
    FNetworkMode: TNetworkMode;
    FRemoteConnected: Boolean;
    FOnSendData: TNotifyReceive;
    FNodeNoStr: string;
    FOpen: Boolean;
    FWinSocket: tSocket;
    FConnectPort: integer;
    FSocketType: integer;
    FConnectIP: string;
    procedure SetNo(aValue:Integer);
    Procedure SetLocate(aValue:String);
    Procedure SetNetworkNode(const Value: TNetworkMode);
    Procedure SetRemoteConnected (aValue:Boolean);
    procedure SetNodeNoStr(const Value: string);
    procedure SetOpen(const Value: Boolean);
  private
    FMCUID: string;
    FSocketConnected: Boolean;
    FOnConnected: TNodeConnect;
    FFDtype: TDevicetype;
    FKTTDecoderChannel: string;
    FKTTMuxID: string;
    FKTTCustomerID: string;
    FStateEvent: Boolean;
    FFIREGUBUNCODE: string;
    FCardFixType: Integer;
    procedure SetMCUID(const Value: string);
    procedure SetSocketConnected(const Value: Boolean);
    procedure SetFdType(const Value: TDevicetype);
  protected
    { Protected declarations }
    Send_MsgNo: Integer;
    Rcv_MsgNo : Char;
    FOnRcvGarbageData:    TNotifyReceive;     // 쓰레기 데이터
    FOnRcvInvalidDevice:  TNotifyReceive;     // 목록에 없는 장비
    FOnRcvData:           TNotifyReceive;     // 통신에서 받은 데이터

    procedure handle_wm_async_select(var Msg: TMessage); message wm_asynch_select;
    procedure CommNodeTriggerAvail(Sender: TObject;SockNo:integer; Buf:String;DataLen: Integer);
    procedure CommNodeWsConnect(Sender: TObject;SockNo:integer);
    procedure CommNodeWsDisconnect(Sender: TObject;SockNo:integer);
    procedure CommNodeWsError(Sender: TObject;SockNo:integer;SocketError: Integer);
    Procedure ACC_sendData(aEcuId:CString; aData:CString);
  protected
    procedure WndProc ( var Message : TMessage ); virtual;
  public
    { Public declarations }
    FTCSDeviceSender : TCriticalSection;
    ReserveSendDataList: TStringList; //내보낼 데이터 목록
    CardSendDataList: TStringList; // 카드데이터 내보낼 목록
    QuickSendDataList: TStringList; // 먼저 내보낼 데이터 목록
    Devices: TStringList;             //등록된 기기 목록
    LastConnectedTime: TDatetime;
    SocketConnectedTime : TDateTime;
    CardDataSendSleepCount : integer;
    ReceivedLastpacket: String;
    ComBuff: String;
    L_bSocketWriting : Boolean;
    L_nCardDataSend : integer; //카드데이터 쉬자...
    L_nSendDeviceSeq : integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandleAllocated : Boolean;
    procedure HandleNeeded;

    Procedure ExecSendPacket;
    Procedure DataPacektProcess(aData: string);
    procedure FireRecovery(aQuick:Boolean=False);
    procedure FireOutbreak(aQuick:Boolean=False);  //전체 화재발생알람
    procedure AllRelayControl(aRelayNo,aControlTime:integer;aQuick:Boolean = True);

    function PutString(aData:string):Boolean;
    function  SendPacket(aEcuId: String; aCmd:Char; aData: String; aQuick:Boolean;aType:integer = 0):Boolean;
  published
    { Published declarations }
    Property No: Integer Read FNo write SetNo;
    property Handle : THandle read GetHandle;
    property SocketType : integer read FSocketType write FSocketType;  //소켓 타입 1.PC -> 기기,2.PC <- 기기
    property WinSocket : tSocket read FWinSocket write FWinSocket;
    property Open : Boolean read FOpen write SetOpen;
    property ConnectIP : string read FConnectIP write FConnectIP;
    property ConnectPort : integer read FConnectPort write FConnectPort;
    property OldConnected : integer read FOldConnected write FOldConnected;

    Property CardFixType: Integer Read FCardFixType write FCardFixType;  //0-고정(4Byte),1-가변(G_nCardFixedLength 에 따름),2.KT사옥
    Property Locate: String Read FLocate write SetLocate;
    Property MCUID: string read FMCUID write SetMCUID;
    Property NetworkMode: TNetworkMode read FNetworkMode write SetNetworkNode;
    Property FDtype: TDevicetype Read FFDtype write SetFdType;
    Property RemoteConnected: Boolean read FRemoteConnected write SetRemoteConnected;
    property OnRcvGarbageData: TNotifyReceive read FOnRcvGarbageData write FOnRcvGarbageData;
    ProPerty OnRcvInvalidDevice: TNotifyReceive read FOnRcvInvalidDevice write FOnRcvInvalidDevice;
    ProPerty OnRcvData : TNotifyReceive read FOnRcvData write FOnRcvData;
    ProPerty OnSendData : TNotifyReceive read FOnSendData write FOnSendData;
    ProPerty NodeNoStr : string Read FNodeNoStr Write SetNodeNoStr;
    ProPerty OnConnected : TNodeConnect read FOnConnected Write FOnConnected;
    ProPerty SocketConnected : Boolean read FSocketConnected Write SetSocketConnected;
    Property StateEvent : Boolean read FStateEvent write FStateEvent;
    property WinSockServerPacket : string read FWinSockServerPacket write SetWinSockServerPacket;
    property ServerEnqCount : integer read FServerEnqCount write FServerEnqCount;
    property OldSendTime : TDateTime Read FOldSendTime write FOldSendTime;
  public
    KTTAlarmSendDataList : TStringList; //관제 센터에 보낼 목록 50개

    procedure KTTAlarm_Add(aSendData:string);
    procedure KTTAlarm_Insert(aSendData:string); //처음 조회시 최종 부터 읽어 오므로 인서트
    property KTTMuxID : string Read FKTTMuxID write FKTTMuxID;
    property KTTDecoderChannel : string Read FKTTDecoderChannel write FKTTDecoderChannel;
    property KTTCustomerID : string Read FKTTCustomerID write FKTTCustomerID;
    property FIREGUBUNCODE : string Read FFIREGUBUNCODE write FFIREGUBUNCODE;
  end;

  TCardGrade = Class(TComponent)
  private
    FGRADE: char;
    FcardType: char;
    FArmGrade: char;
    FDOOR2: char;
    FDOOR1: char;
    FValidDay: string;
    FRcvState: string;
    FCardPositionNum: string;
    FCardPositionUse: Boolean;
    FDOOR4: char;
    FDOOR5: char;
    FDOOR8: char;
    FDOOR3: char;
    FDOOR6: char;
    FDOOR7: char;
    FArmArea7: char;
    FArmArea6: char;
    FArmArea5: char;
    FArmArea4: char;
    FArmArea1: char;
    FArmArea2: char;
    FArmArea8: char;
    FArmArea0: char;
    FArmArea3: char;
    FRegCode: char;
    FTimeCode: char;
    FDoorGrade: string;
    FArmAreaGrade: string;
    FCardGroup: string;
    FCardTimeCode: string;
    FCardWeekCode: string;
    FMaster: string;
  published
    Property GRADE: char Read FGRADE write FGRADE;
    property ArmAreaGrade : string read FArmAreaGrade write FArmAreaGrade;
    Property ArmArea0: char Read FArmArea0 write FArmArea0;
    Property ArmArea1: char Read FArmArea1 write FArmArea1;
    Property ArmArea2: char Read FArmArea2 write FArmArea2;
    Property ArmArea3: char Read FArmArea3 write FArmArea3;
    Property ArmArea4: char Read FArmArea4 write FArmArea4;
    Property ArmArea5: char Read FArmArea5 write FArmArea5;
    Property ArmArea6: char Read FArmArea6 write FArmArea6;
    Property ArmArea7: char Read FArmArea7 write FArmArea7;
    Property ArmArea8: char Read FArmArea8 write FArmArea8;
    property DoorGrade : string read FDoorGrade write FDoorGrade;
    Property DOOR1: char Read FDOOR1 write FDOOR1;
    Property DOOR2: char Read FDOOR2 write FDOOR2;
    Property DOOR3: char Read FDOOR3 write FDOOR3;
    Property DOOR4: char Read FDOOR4 write FDOOR4;
    Property DOOR5: char Read FDOOR5 write FDOOR5;
    Property DOOR6: char Read FDOOR6 write FDOOR6;
    Property DOOR7: char Read FDOOR7 write FDOOR7;
    Property DOOR8: char Read FDOOR8 write FDOOR8;
    property CardPositionNum : string Read FCardPositionNum write FCardPositionNum;
    property CardPositionUse : Boolean Read FCardPositionUse write FCardPositionUse;
    property CardGroup : string Read FCardGroup write FCardGroup;
    property CardTimeCode : string Read FCardTimeCode write FCardTimeCode;
    property CardWeekCode : string Read FCardWeekCode write FCardWeekCode;
    property cardType : char read FcardType write FcardType;   // 카드타입(0:출입,1:방범,2:출입+방범)
    property Master : string read FMaster write FMaster;        //마스터 카드 유무
    property ValidDay : string read FValidDay write FValidDay;
    property RegCode : char read FRegCode write FRegCode;
    property TimeCode : char read FTimeCode write FTimeCode;
    property RcvState : string read FRcvState write FRcvState;
  end;

  TDevice = Class(TComponent)
  private
    ArmAreaUse: Array [0..con_nFIXMAXAREANO] of Boolean; //방범구역 사용유무
    ArmAreaName: Array [0..con_nFIXMAXAREANO] of string; //방범구역 명칭
    ArmAreaState: Array [0..con_nFIXMAXAREANO] of TWatchMode; //방범구역 상태
    ArmAreaRelayCode: Array [0..con_nFIXMAXAREANO] of string; //방범구역 연동코드
    ArmAreaRelayBuildingCode: Array [0..con_nFIXMAXAREANO] of string; //방범구역 연동위치코드
    ArmAreaDisArmCheckUse: Array [0..con_nFIXMAXAREANO] of integer; //방범구역 미경계 체크 유무
    ArmAreaDisArmCheckTime1From: Array [0..con_nFIXMAXAREANO] of string; //방범구역 미경계 체크 시작 시간
    ArmAreaDisArmCheckTime1To: Array [0..con_nFIXMAXAREANO] of string; //방범구역 미경계 체크 종료 시간
    ArmAreaDisArmEvent: Array [0..con_nFIXMAXAREANO] of integer; //방범구역 알람 발생 유무
    DoorAntiGroup : Array [0..con_nFIXMAXDOORNO] of integer; //출입문 AntiGroup
    DoorUse: Array [0..con_nFIXMAXDOORNO] of Boolean; //출입문 사용유무
    DoorName: Array [0..con_nFIXMAXDOORNO] of string; //출입문 명칭
    DoorManageMode: Array [0..con_nFIXMAXDOORNO] of TDoorManageMode;
    DoorPNMode :  Array [0..con_nFIXMAXDOORNO] of TDoorPNMode;
    DoorState :  Array [0..con_nFIXMAXDOORNO] of TDoorDSState;
    DoorLockMode :  Array [0..con_nFIXMAXDOORNO] of TDoorLockState;
    DoorFire  :  Array [0..con_nFIXMAXDOORNO] of Boolean;

    ArmAreaDisArmCheckTimer : TTimer;

    DeviceAntiGropList : TStringList;
    CardDataList : TStringList;       //전체 권한을 가지고 있는 카드 리스트
    SendCardDataList1 : TStringList;  //바로 전송해야 할 카드 데이터
    SendCardDataList2 : TStringList;  //늦게 전송해야 할 카드 데이터

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
    FOnRcvRegCardData:    TCardEventReceive;         // 카드 리드 데이터
    FOnRcvTellogData:     TNotifyReceive;         // 도어 상태 데이터
    FOnRcvDoorSetup:      TNotifyReceive;         // 도어 제어 데이터
    FOnRcvCardReadData:   TCardEventReceive;         // 도어 설정 데이터
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
    FDoorState: TDoorDSState;
//    FDoorManageMode2: TDoorManageMode;
//    FDoorManageMode1: TDoorManageMode;
//    FDoorState1: TDoorDSState;
//    FDoorState2: TDoorDSState;
//    FDoorPNMode1: TDoorPNMode;
//    FDoorPNMode2: TDoorPNMode;
    FJavaraCloseCommand: Boolean;
    FJavaraOpenCommand: Boolean;
    FFireServerCommand: Boolean;
    FDeviceSkillReceive: Boolean;
//    FDoor1Use: Boolean;
//    FDoor2Use: Boolean;
//    FDoorLockMode1: TDoorLockState;
//    FDoorLockMode2: TDoorLockState;
//    FDoor1Fire: Boolean;
//    FDoor2Fire: Boolean;

    FOnDoorStateChange: TDoorStateChangeType;
    FOnDoorPNModeChange: TDoorPNModeChangeType;
    FOnDoorManageModeChange: TDoorManageModeChangeType;
    FOnWatchModeChange: TWatchModeChangeType;
    FOnDoorModeChange: TDoorModeChangeType;
    FOnRcvFTPProcessData: TNotifyReceive;
    FOnFireStateChange: TFireStateChange;
    FDeviceCode: String;
    FDeviceType: String;
    FOnDeviceTypeChange: TDeviceTypeChange;
    FOnDeviceCodeChange: TDeviceTypeChange;
    FOnDoorTimeCodeUseChange: TDevicePacketData;
    FOnRcvRegTimeCode: TNotifyReceive;
    FDoorScheduleUse: Boolean;
    FArmAreaUsed: Boolean;
    FCardDataSendSleepCount: integer;
    FOnDeviceArmAreaDisArmEvent: TDevicePacketData;
    FHO1USE: Boolean;
    FHO3USE: Boolean;
    FHO2USE: Boolean;
    FMaxLockCount: integer;
    FScheduleSkill: Boolean;
    FOnSendData: TNotifyReceive;
    FOldSendTime: TDateTime;
    FCardBufferFull: Boolean;
    FOnRcvCardBufferFull: TNotifyReceive;

    procedure ArmAreaDisArmCheckTimerTimer(Sender: TObject);

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
//    procedure SetDoorManageMode1(const Value: TDoorManageMode);
//    procedure SetDoorManageMode2(const Value: TDoorManageMode);
//    procedure SetDoorState1(const Value: TDoorDSState);
//    procedure SetDoorState2(const Value: TDoorDSState);
//    procedure SetDoorPNMode1(const Value: TDoorPNMode);
//    procedure SetDoorPNMode2(const Value: TDoorPNMode);
    procedure SetFireServerCommand(const Value: Boolean);
    procedure SetJavaraCloseCommand(const Value: Boolean);
    procedure SetJavaraOpenCommand(const Value: Boolean);
    procedure SetDeviceSkillReceive(const Value: Boolean);
//    procedure SetDoorLockMode1(const Value: TDoorLockState);
//    procedure SetDoorLockMode2(const Value: TDoorLockState);
//    procedure SetDoor1Fire(const Value: Boolean);
//    procedure SetDoor2Fire(const Value: Boolean);
    procedure SetDeviceCode(const Value: String);
    procedure SetDeviceType(const Value: String);
    procedure SetDoorScheduleUse(const Value: Boolean);
    procedure SetCardBufferFull(const Value: Boolean);
  protected
    Procedure DataPacektProcess(aData: string; NodeNo:integer;aFireGubunCode:string);
    Procedure SendAckforaccess(aMsgCount:String);
    procedure DeviceRecvAlarmData(aNodeNo:integer;aCommand,aData,aFireGubunCode:string);
    procedure DoorModeState(aNodeNo:integer;aData:string);
    procedure DoorControlState(aNodeNo:integer;aData:string);
    procedure DoorSetupState(aNodeNo:integer;aData:string);
    procedure RemoteDataProcess(aNodeNo:integer;aData:string);
    Function  GetSystemSkill(aEcuID,aData:string):Boolean;
  public
    L_bMemoryCardClear : Boolean;
    L_bDeviceDestroy : Boolean; //모듈 종료
    L_nCardSendSeq : integer;  //카드 전송 위치
    L_stHolidaySend : string;  // 휴일 등록 전문 01 W
    L_bHolidayRecv : Boolean; //휴일 등록 응답 유무
    LastPollingTime: TDatetime;
    HolidaySendRecv : Array[0..13,0..8] of integer;  //휴일 전송 유무

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    Procedure  SendPacket(aCmd:Char; aData: String;aQuick:Boolean = False;aType:integer=0);
    Procedure  CD_Download(aCardNo:String; ValidDay: String; cardType:Char; RegCode:Char; aTimeCode:Char; func:Char;
                           aAlarmAreaGrade,aDoorAreaGrade,aCardGroup,aCardTimeCode,aCardWeekCode:string;
                           aQuick:Boolean = False;aPositionNum:integer = 0;aCardPosition:Boolean = False;aReceiveState:string='S';aType:integer=1);
    Procedure  MemoryCardAdd(aCardNo:String; ValidDay: String; cardType:Char; RegCode:Char; aTimeCode:Char; func:Char;
                           aAlarmAreaGrade,aDoorAreaGrade,aCardGroup,aCardTimeCode,aCardWeekCode:string;
                           aQuick:Boolean = False;aPositionNum:integer = 0;aCardPosition:Boolean = False;aReceiveState:string='S');
    Procedure  Control_DoorModeChange(aDoorNo: Char;  aMode:Char;aQuick:Boolean=True);
    procedure  Control_DoorPNModeChange(aDoorNo: Char;  aMode:Char;aQuick:Boolean=True);
    Procedure  TimeSync;
    procedure  Check_DoorState(aDoorNo: Char;aQuick:Boolean = False);
    Procedure  DoorExitButton(aDoorNo: Char);
    Procedure  SendDoorSchadule(aDoor:Char;aDay:Char;aData:String;aQuick:Boolean = False);
    Procedure  ChangewatchMode(aArmAreaNo:string;aMode:TWatchMode);
    Procedure  CheckWatchMode(aArmAreaNo:string;aQuick:Boolean = False);
    Procedure  CheckSystemSkill(aQuick:Boolean = False);
    ProCedure  Check_DeviceVersion(aQuick:Boolean = False);
    procedure  DeviceDoorInfoSearch(aDoor:string);
    procedure  DeviceDoorInfoSetting(aDoor,aCardMode,aDoorMode,aDoorControlTime,aOpenMoni,aUseSch,aSendDoor,aAlarmLong,
               aFire,aLockType,aDSOpen,aRemoteDoor,aCmd:string);
    procedure  ScheduleDoorModeChange(aDoor,aDoorMode,aSchUse,aFireUse:string);
    Procedure  ReBoot;
    Function   Holiday(aCmd:Char;aDate,aDoorNo:string):Boolean;
    Function   MonthHoliday(aDoorNo,aMonth:integer;aHoliday:string):Boolean;
    procedure  ServerCarDataSend(aCardReaderNo,aCardData:string);
    procedure  CardTypeSearch;
    procedure  FireOutbreak(aQuick:Boolean = False);  //화재발생처리
    procedure  MemoryClear; //충대 프로젝트용
    procedure  RelayControl(aRelayNo,aControlTime:integer;aQuick:Boolean = True);
    procedure  RegistDoorTimeCodeUse(aDoorTimeCodeUse:string;aQuick: Boolean);
    procedure  RegistTimeCode(aTimeGroup,aTime1,aTime2,aTime3,aTime4:string;aQuick: Boolean);
    procedure  SearchDevicecode;  //DeviceCode 조회 하자.
    procedure  Search_PortState;
    procedure  Search_ZoneExtendPortState;
    procedure  MemoryCardClear; //메모리 카드 하루에 한번씩은 지워주자.
    procedure  CardDownLoadClear; //카드 다운로드 정지 시키자.
  public
    procedure  SendCardDataExecute;
    procedure  CardDataSendPacket(aSendData:string;aSeq:integer);
    procedure  AntiPassGroup_Add(aDoorNo,aAntiGroupCode:integer);
  public
    procedure ArmAreaDisArmEventCheck(aArmAreaNo:integer);
    procedure ArmAreaDisArmClear(aArmAreaNo:integer);
    procedure ArmAreaDisArmCreate(aArmAreaNo:integer);
    procedure ArmAreaUseInitialize;
    procedure ArmAreaNameInitialize;
    procedure ArmAreaStateInitialize;

    procedure DoorAntiGroupInitialize;
    procedure DoorUseInitialize;
    procedure DoorNameInitialize;
    procedure DoorManageModeInitialize;
    procedure DoorPNModeInitialize;
    procedure DoorStateInitialize;
    procedure DoorLockModeInitialize;
    procedure DoorFireInitialize;

    procedure SetArmAreaUse(aArmArea:integer;aUsed:Boolean);
    procedure SetArmAreaName(aArmArea:integer;aName:string);
    procedure SetArmAreaState(aArmArea:integer;aArmAreaState:TWatchMode);
    procedure SetArmAreaDisArmCheckUse(aArmArea:integer;aArmAreaDisArmUseCheck:string);
    procedure SetArmAreaDisArmCheckTime1From(aArmArea:integer;aArmAreaDisArmTime1From:string);
    procedure SetArmAreaDisArmCheckTime1To(aArmArea:integer;aArmAreaDisArmTime1To:string);

    procedure SetDoorUse(aDoorNo:integer;aUsed:Boolean);
    procedure SetDoorName(aDoorNo:integer;aName:string);
    procedure SetDoorManageMode(aDoorNo:integer;aValue:TDoorManageMode);
    procedure SetDoorPNMode(aDoorNo:integer;aValue:TDoorPNMode);
    procedure SetDoorState(aDoorNo:integer;aValue:TDoorDSState);
    procedure SetDoorLockMode(aDoorNo:integer;aValue:TDoorLockState);
    procedure SetDoorFire(aDoorNo:integer;aValue:Boolean);

    function GetAntiGroup(aDoorNo:integer):integer;
    function GetAntiGroupCount : integer;
    function GetDeviceAntiGroup(aIndex:integer) : integer;

    function GetArmAreaUse(aArmArea:integer):Boolean;
    function GetArmAreaName(aArmArea:integer):string;
    function GetArmAreaState(aArmArea:integer):TWatchMode;

    function GetDoorUse(aDoorNo:integer):Boolean;
    function GetDoorName(aDoorNo:integer):string;
    function GetDoorManageMode(aDoorNo:integer):TDoorManageMode;
    function GetDoorPNMode(aDoorNo:integer):TDoorPNMode;
    function GetDoorState(aDoorNo:integer):TDoorDSState;
    function GetDoorLockMode(aDoorNo:integer):TDoorLockState;
    function GetDoorFire(aDoorNo:integer):Boolean;
    function CheckMemoryCardGrade(aCardNo,aDoorCheckNo,aPermit,aValidDate:string):integer;
    function CheckDoorMemoryGrade(aCardNo:string;aDoorNo:integer):integer;
    Function ServerDoorControl(aReaderNo,aDoorNo,aKey,aCardNo,aAuth,aVoice:string):integer;
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
    Property FoodAmtPer : integer Read FFDAMTPER write SetFoodAmt;
//    property CardDataSendSleepCount : integer Read FCardDataSendSleepCount write FCardDataSendSleepCount;
    property OldSendTime : TDateTime Read FOldSendTime write FOldSendTime;

    Property Connected: Boolean Read FConnected write SetConnected;
    property ArmAreaUsed : Boolean read FArmAreaUsed write FArmAreaUsed;
//    Property WatchMode: TWatchMode read FWatchMode write SetWatchMode;
//    Property DoorManageMode1 : TDoorManageMode Read FDoorManageMode1 write SetDoorManageMode1;
//    Property DoorPNMode1 : TDoorPNMode Read FDoorPNMode1 write SetDoorPNMode1;
//    Property DoorState1 : TDoorDSState Read FDoorState1 write SetDoorState1;
//    Property DoorLockMode1 : TDoorLockState Read FDoorLockMode1 write SetDoorLockMode1;
//    property Door1Fire : Boolean read FDoor1Fire write SetDoor1Fire;
//    Property Door1Use : Boolean Read FDoor1Use write FDoor1Use;
//    Property Door2Use : Boolean Read FDoor2Use write FDoor2Use;
    Property DoorScheduleUse : Boolean Read FDoorScheduleUse write SetDoorScheduleUse;
//    Property DoorManageMode2 : TDoorManageMode Read FDoorManageMode2 write SetDoorManageMode2;
//    Property DoorPNMode2 : TDoorPNMode Read FDoorPNMode2 write SetDoorPNMode2;
//    Property DoorState2 : TDoorDSState Read FDoorState2 write SetDoorState2;
//    Property DoorLockMode2 : TDoorLockState Read FDoorLockMode2 write SetDoorLockMode2;
//    property Door2Fire : Boolean read FDoor2Fire write SetDoor2Fire;

    //각각의 기기별 기능 점검항목
    property DeviceSkillReceive : Boolean Read FDeviceSkillReceive Write SetDeviceSkillReceive; //기능 점검 수신여부
    Property FireServerCommand : Boolean Read FFireServerCommand Write SetFireServerCommand; //화재발생을 서버에서 내리는 명령
    Property JavaraOpenCommand : Boolean Read FJavaraOpenCommand Write SetJavaraOpenCommand; //자바라열림 기능
    Property JavaraCloseCommand : Boolean Read FJavaraCloseCommand Write SetJavaraCloseCommand; //자바라닫힘 기능

    Property DeviceType : String Read FDeviceType write SetDeviceType;
    Property DeviceCode : String Read FDeviceCode write SetDeviceCode;
    property HO1USE : Boolean read FHO1USE write FHO1USE;
    property HO2USE : Boolean read FHO2USE write FHO2USE;
    property HO3USE : Boolean read FHO3USE write FHO3USE;
    property MaxLockCount : integer read FMaxLockCount write FMaxLockCount;
    property ScheduleSkill : Boolean read FScheduleSkill write FScheduleSkill;

    property CardBufferFull : Boolean read FCardBufferFull write SetCardBufferFull;


    property OnRcvAlarmData:      TAlarmEvent read FOnRcvAlarmData       write FOnRcvAlarmData;
    property OnRcvInitAckData:    TNotifyReceive read FOnRcvInitAckData     write FOnRcvInitAckData;
    property OnRegisterClear:     TNotifyReceive read FOnRegisterClear      write FOnRegisterClear;
    property OnRcvRemoteAckData:  TNotifyReceive read FOnRcvRemoteAckData   write FOnRcvRemoteAckData;
    property OnRcvFTPProcessData:  TNotifyReceive read FOnRcvFTPProcessData   write FOnRcvFTPProcessData;
    property OnRcvTellogData:     TNotifyReceive read FOnRcvTellogData      write FOnRcvTellogData;
    property OnRcvCardReadData:   TCardEventReceive read FOnRcvCardReadData    write FOnRcvCardReadData;
    property OnRcvChangeDoorData: TNotifyReceive read FOnRcvChangeDoorData  write FOnRcvChangeDoorData;
    property OnRcvDoorControl:    TNotifyReceive read FOnRcvDoorControl     write FOnRcvDoorControl;
    property OnRcvDoorSetup:      TNotifyReceive read FOnRcvDoorSetup       write FOnRcvDoorSetup;
    property OnRcvRegCardData:    TCardEventReceive read FOnRcvRegCardData     write FOnRcvRegCardData;
    property OnNotDefineData:     TNotifyReceive read FOnNotDefineData      write FOnNotDefineData;
    property OnRcvRegSchedule:    TNotifyReceive read FOnRcvRegSchedule     write FOnRcvRegSchedule;
    property OnRcvRegTimeCode:    TNotifyReceive read FOnRcvRegTimeCode     write FOnRcvRegTimeCode;
    Property OnErrorData:         TNotifyReceive read FOnRcvERRORData       write FOnRcvERRORData;
    property OnCardBufferFull:    TNotifyReceive read FOnRcvCardBufferFull     write FOnRcvCardBufferFull;
    Property OnConnected:         TConnectType   read FOnConnected          write FOnConnected;
    Property OnDoorManageModeChange:         TDoorManageModeChangeType   read FOnDoorManageModeChange          write FOnDoorManageModeChange;
    Property OnDoorPNModeChange:         TDoorPNModeChangeType   read FOnDoorPNModeChange          write FOnDoorPNModeChange;
    Property OnDoorStateChange:         TDoorStateChangeType   read FOnDoorStateChange          write FOnDoorStateChange;
    Property OnWatchModeChange:         TWatchModeChangeType   read FOnWatchModeChange          write FOnWatchModeChange;
    property OnDoorModeChange: TDoorModeChangeType read FOnDoorModeChange write FOnDoorModeChange;
    property OnFireStateChange: TFireStateChange read FOnFireStateChange       write FOnFireStateChange;
    property OnDeviceTypeChange : TDeviceTypeChange read FOnDeviceTypeChange write FOnDeviceTypeChange;
    property OnDeviceCodeChange : TDeviceTypeChange read FOnDeviceCodeChange write FOnDeviceCodeChange;
    property OnDeviceArmAreaDisArmEvent : TDevicePacketData read FOnDeviceArmAreaDisArmEvent write FOnDeviceArmAreaDisArmEvent;
    ProPerty OnSendData : TNotifyReceive read FOnSendData write FOnSendData;
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
uses
  udmAdoQuery,
  uZTBMSFunction;

{ TCommNode ===================================================================}
constructor TCommNode.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OldConnected := -1;

  FHandle := 0;
  FTCSDeviceSender := TCriticalSection.Create;

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
  SocketConnectedTime := 0;
  ComBuff:= '';
  Send_MsgNo:= 0;
  Rcv_MsgNo:= '0';
  Open := False;

  FDtype:= dtnothing;

  L_nSendDeviceSeq := 0;
  L_nCardDataSend := 0;
  L_bSocketWriting := False;
  CardDataSendSleepCount := CARDDATA_SEND;

  StateEvent := False;
  WinSocket := Invalid_Socket;
  SocketType := 1;
  l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);

  ServerEnqCount := 0;
  OldSendTime := now;      

  NodeDisConnectedCheckTimer := TTimer.Create(nil);
  NodeDisConnectedCheckTimer.Interval := G_nNodeDisConnectDelayTime * 1000;
  NodeDisConnectedCheckTimer.OnTimer := NodeDisConnectedCheckTimerTimer;
  NodeDisConnectedCheckTimer.Enabled := False;
end;

destructor TCommNode.Destroy;
var
  I: Integer;
begin

  KTTAlarmSendDataList.Free;
  ReserveSendDataList.Free;
  CardSendDataList.Free;
  QuickSendDataList.Free;
  FTCSDeviceSender.Free;


  for I:= 0 to Devices.Count-1 do
  begin
    if Assigned( Devices.Objects[I]) then
      TDevice(Devices.Objects[I]).Free;
   end;
  Devices.Free;

  Open := False;
  l_c_reception_buffer.Free;
  l_c_reception_buffer:= Nil;

  if HandleAllocated
   then DeAllocateHWND ( FHandle );

  inherited Destroy;
end;


procedure TCommNode.CommNodeTriggerAvail(Sender: TObject; SockNo: integer;
  Buf: String; DataLen: Integer);
var
  st: string;
  st2: string;
  aIndex: Integer;
  I: Integer;
begin
  LastConnectedTime:= Now;
  st:= '';
  ComBuff:= ComBuff + Buf;
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
  i : integer;
  stTemp : string;
  stSubNo : string;
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
  stSubNo := copy(aData,36,2);
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
    end else
    begin
      SendPacket(stEcuId,'a','',True,G_nAckSendType);
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

       if (stEcuId <> '00') and ((Pos('COMM ERROR',aData) > 0) or (Pos('UNUSED',upperCase(aData)) > 0)) then  //메인컨트롤러는 붙어 있으면 무조건 통신이 되는거임... rd00 추가에 따른 부분 수정 2011.06.09
       //if (pos('Bad Command',aData) > 0) or (pos('COMM ERROR',aData) > 0 ) then
       begin
          TDevice(Devices.Objects[DeviceIndex]).Connected:= False;
       end else if (aSubCLass = 'MN') or (aSubCLass = 'EX')then
       begin
         if StatusCode = 'NF' then
         begin
          TDevice(Devices.Objects[DeviceIndex]).Connected:= False; //Ack 가 안나감....
          TDevice(Devices.Objects[DeviceIndex]).DataPacektProcess(aData ,No,FIREGUBUNCODE);
//          SendPacket(stEcuId,'a','',True);
         end else
         begin
          TDevice(Devices.Objects[DeviceIndex]).Connected:= True;
          TDevice(Devices.Objects[DeviceIndex]).DataPacektProcess(aData ,No,FIREGUBUNCODE);
         end;//}
       end else
       begin
         TDevice(Devices.Objects[DeviceIndex]).DataPacektProcess(aData ,No,FIREGUBUNCODE);
       end;
  end else
  begin
    //목록에 존재 하지 않으면
    // ACK 를 보내면 알람 데이터 분실 소지 발생 하므로 보내지 않음 2011.03.04
    //목록에 없어도 ACK를 보내야 그 다음 데이터가 올라올수 있음 2012.09.12
    if (aCommand = 'c') AND (UpperCase(aData[19]) = 'K') then
    begin
        st:='Y' + Copy(aData,20,2)+'  '+'a';
        ACC_sendData(stEcuId, st);
    end else if (aCommand = 'a') or (aCommand = 'A') then 
    begin
      SendPacket(stEcuId,'a','',True,G_nAckSendType);
    end;
    if Assigned(FOnRcvInvalidDevice) then  OnRcvInvalidDevice(Self,aData,No);
  end;

  {ACK응답과 알람/출입통제 데이터는 ACK를 보내지 않는다}
  if (aCommand <> 'a') AND (aCommand <> 'A') AND (aCommand <> 'c') then
  //if (aCommand <> 'a') AND (aCommand <> 'E') then  //임시 test
  begin
    SendPacket(stEcuId,'a','',True,G_nAckSendType);
  end;
  OldConnected := 1;   //데이터 수신 후 NF 생성 하자.

end;

procedure TCommNode.CommNodeWsConnect(Sender: TObject; SockNo: integer);
begin
  SocketConnected:= True;
  LastConnectedTime:= Now;
end;

procedure TCommNode.CommNodeWsDisconnect(Sender: TObject; SockNo: integer);
var
  I: Integer;
begin
  Open := False;
  LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Disconnect '+ ConnectIP);
  // 여기에서 클라이언트에 끊김 데이터 전송
  (*
  SocketConnected:= False;

  For I:= 0 to Devices.Count -1 do
  begin
    if Assigned(Devices.Objects[I]) then
    begin
      TDevice(Devices.Objects[I]).Connected:= False;
    end;
  end;
  *)
end;


procedure TCommNode.CommNodeWsError(Sender: TObject; SockNo,
  SocketError: Integer);
var
  I: Integer;
begin
  SocketError := 0;
  Open := False;
  (*

  SocketConnected:= False;

  if Devices.Count = 0 then Exit;
  // 여기에서 클라이언트에 끊김 데이터 전송
  For I:= 0 to Devices.Count -1 do
  begin
    if Assigned(Devices.Objects[I]) then TDevice(Devices.Objects[I]).Connected:= False;
  end;
  *)
end;

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
  nDeviceIndex : integer;
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

  if aType = -1 then   //Ack 데이터는 즉시 전송하자.
  begin
    if SocketConnected then PutString(ACKStr2);

    //송신상태현황 Display {To Do}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,ACKStr2,No);
    end;
    Exit;
  end;

  if aQuick then
  begin
    if aType = 0 then
    begin
      QuickSendDataList.Add(ACKStr2);   //Ack 전송시 바로 전송하자.
    end else if aType = 1 then  //카드 데이터
    begin
      nDeviceIndex := Devices.IndexOf(FillZeroNumber(No,3) + aEcuId);
      if nDeviceIndex > -1 then
      begin
        TDevice(Devices.Objects[nDeviceIndex]).CardDataSendPacket(aCmd+aData,1);
      end;
    end;
  end else
  begin
    if aType = 0 then ReserveSendDataList.Add(ACKStr2)
    else if aType = 1 then
    begin
      nDeviceIndex := Devices.IndexOf(FillZeroNumber(No,3) + aEcuId);
      if nDeviceIndex > -1 then
      begin
        TDevice(Devices.Objects[nDeviceIndex]).CardDataSendPacket(aCmd+aData,2);
      end;
      //CardSendDataList.Add(ACKStr2);
    end;
  end;

  Result:= True;
end;


Procedure TCommNode.ExecSendPacket;
var
  I: Integer;
  st: string;
begin
  //inc(CardDataSendSleepCount);
  CardDataSendSleepCount := CardDataSendSleepCount + 1;

  if not Open then  Exit;
  if not SocketConnected then Exit;

  if QuickSendDataList.Count > 0 then
  begin
    st:= QuickSendDataList[0];
    PutString(st);
    //여기에서 데이터 송신현황 조회 {TO DO}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,st + '(' + inttostr(QuickSendDataList.Count) + '/' + inttostr(CardSendDataList.Count) + ')',No);
    end;
    QuickSendDataList.Delete(0);
    L_nCardDataSend := 0;
    Exit;
  end;


  if ReserveSendDataList.Count > 0 then
  begin
    st:= ReserveSendDataList[0];
    PutString(st);
    //여기에서 데이터 송신현황 조회 {TO DO}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,st,No);
    end;
    ReserveSendDataList.Delete(0);
    L_nCardDataSend := 0;
    Exit;
  end;
  if(CardDataSendSleepCount < CARDDATA_SEND ) then
  begin
    //if OldSendTime + CARDDATA_SEND > now then Exit;   //메인별로 6000ms 씩 쉬었다 보내자 2019-06-04
    Exit;
  end;
  //CardDataSendSleepCount := 0;
  OldSendTime := now;

  ///전송후 다음 장비로 장비 위치 변경하자
  L_nSendDeviceSeq := L_nSendDeviceSeq + 1;
  if L_nSendDeviceSeq > Devices.Count - 1 then
  begin
    L_nSendDeviceSeq := 0;
    //CardDataSendSleepCount := 0;  ///한 메인에서 한 사이클을 돌면 2500ms(sendTimer 50ms, 100 이 되면 전송) 쉬자.
                                                  ///2020년 경희대에서 컨트롤러 하나로 전송시에 카드리더가 동작 하지 않는 현상이 있었음
    //Exit;
  end;
  //if CardDataSendSleepCount < CARDDATA_SEND then Exit;
  if(TDevice(Devices.Objects[L_nSendDeviceSeq]).Connected) then       ///20200622 확장기 통신이 안되는 경우 6초씩 쉬는 부분 수정
  begin
    CardDataSendSleepCount  := 0;
    TDevice(Devices.Objects[L_nSendDeviceSeq]).SendCardDataExecute;
  end;


  (*
  if CardDataSendSleepCount < CARDDATA_SEND then Exit;

  CardDataSendSleepCount := CARDDATA_SEND;

  if CardSendDataList.Count > 0 then
  begin
    CardDataSendSleepCount := 0;
    //inc(L_nCardDataSend);
    //if L_nCardDataSend < 2 then Exit;  //카드데이터는 한타임 쉬자.
    st:= CardSendDataList[0];
    CardSendDataList.Delete(0);
    PutString(st);
    SendCardTime := getTickCount; //마지막 카드데이터 송신한 시간을 가지자.
    //여기에서 데이터 송신현황 조회 {TO DO}
    if Assigned(FOnSendData) then
    begin
      OnSendData(Self,st,No);
    end;

    Exit;
  end;
  *)

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
      LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Disconnect '+ ConnectIP);

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
var
  i,j : integer;
begin
  CommNode := nil;
//  CardDataSendSleepCount := CARDDATA_SEND;
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
    SetArmAreaDisArmCheckUse(i,'0');
    ArmAreaDisArmEvent[i] := 0;
  end;
  LastPollingTime:= 0;
//  DoorManageMode1 := dmNothing;
//  DoorState1 := dsNothing;
//  DoorManageMode2 := dmNothing;
//  DoorState2 := dsNothing;

  //기능점검
  DeviceSkillReceive := False;
  FireServerCommand := False;
  JavaraOpenCommand := False;
  JavaraCloseCommand := False;

  //Door1Use := False;
  //Door2Use := False;

  CardBufferFull := False;

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

  DeviceAntiGropList := TStringList.Create;
  DeviceAntiGropList.Clear;
  CardDataList := TStringList.Create;
  SendCardDataList1 := TStringList.Create;
  SendCardDataList2 := TStringList.Create;

  L_bDeviceDestroy := False;
  L_bMemoryCardClear := False;
  ArmAreaDisArmCheckTimer := TTimer.Create(nil);
  ArmAreaDisArmCheckTimer.Interval := 60 * 1000;     //1분에 한번씩만 돌아 가자.
  ArmAreaDisArmCheckTimer.OnTimer := ArmAreaDisArmCheckTimerTimer;
  ArmAreaDisArmCheckTimer.Enabled := False;

  OldSendTime := Now;

  for i:=0 to 12 do
  begin
    for j:=0 to 8 do HolidaySendRecv[i][j] := -1;   //처음 생성시 전송 성공한것으로 만든 후에 특정일 보낼것 있으면 False 로 만들자...
  end;

  inherited Create(AOwner);
end;

procedure TDevice.SendAckforaccess(aMsgCount:String);
var
  st: string;
begin
  if Self.FCommNode = nil then Exit;
  //st:=#$90 + aMsgCount+'  '+#$80;
  st:='Y' + aMsgCount+'  '+'a';
  Self.FCommNode.SendPacket(ECUID,'c',st,True,G_nAckSendType);
end;

procedure TDevice.DataPacektProcess(aData: string; NodeNo:integer;aFireGubunCode:string);
var
  aCommand: Char;
  MSG_Code: Char;
  nCardNoLen : integer;
  stCardNo : string;
  nCardNo : int64;
  nCardIndex : integer;
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
           DeviceRecvAlarmData(NodeNo,aCommand,aData,aFireGubunCode);
         end;
    'i': begin // 등록데이터
           if Assigned(FOnRcvInitAckData) then OnRcvInitAckData(Self,aData,NodeNO);
         end;
    'r': begin // Ack Remotecontrol
           if Assigned(FOnRcvRemoteAckData) then OnRcvRemoteAckData(Self,aData,NodeNO);
           RemoteDataProcess(NodeNO,aData);
         end;
    'E': begin  //ERROR Data;
           if Assigned(FOnRcvERRORData) then OnErrorData(Self,aData,NodeNO);
           if aData[19] = 'Q' then L_bHolidayRecv := True;
         end;
    'F': begin // OnRcvRemoteAckData
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
           //SendAckforaccess(Copy(aData,20,2));
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
                  if aData[38] = 'S' then
                  begin
                    DoorModeState(NodeNO,aData);  //2011.03.07 스케줄 데이터만 처리하자.
                  end;
                  if Assigned(FOnRcvCardReadData) then
                  begin
                    OnRcvCardReadData(Self,aData,NodeNO,TCommNode(CommNode).CardFixType);
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
                  FCommNode.CardDataSendSleepCount := CARDDATA_SEND;
                  //CardDataSendSleepCount := CARDDATA_SEND;
                  if Assigned(FOnRcvRegCardData) then
                  begin
                    OnRcvRegCardData(Self,aData,NodeNO,TCommNode(CommNode).CardFixType);
                  end else
                  begin
                    if useProcessCount then
                    begin
                      FCS.Enter;
                      G_nProcessCount := G_nProcessCount - 1;
                      FCS.Leave;
                    end;
                  end;
                  // 자동으로 서버 타입에 맞춰서 카드 데이터 변환,2014-09-19
                  if isDigit(Copy(aData,25,2)) then
                    nCardNoLen := strtoint(Copy(aData,25,2))
                  else nCardNoLen := 0;
                  if nCardNoLen = 0 then
                  begin
                    stCardNo:= Copy(aData,27,8);
                    if G_nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
                    begin
                      stCardNo := DecodeCardNo(stCardNo,8,True);
                      stCardNo := copy(stCardNo,1,6) + '00';
                      nCardNo:= Hex2Dec64(stCardNo);
                      stCardNo:= FillZeroNumber2(nCardNo,10);
                    end else
                    begin
                      if IsNumericCardNo then
                        stCardNo:= DecodeCardNo(stCardNo)
                      else stCardNo:= DecodeCardNo(stCardNo,8,True);
                    end;
                    //시리얼 카드 데이터 수신
                    if CARDLENGTHTYPE = 1 then //PC에서 가변길이 카드 사용중이면 카드번호 길이 만큼 생성
                    begin
                      stCardNO := FillCharString(stCardNO,'*',G_nCardFixedLength);
                    end else if CARDLENGTHTYPE = 2 then //카드사옥이면
                    begin
                      stCardNO := FillCharString(stCardNO + '0','*',11);
                    end;
                  end else
                  begin
                    if nCardNoLen = 22 then TCommNode(CommNode).CardFixType := 2;
                    stCardNo:= Copy(aData,27,nCardNoLen);
                    if TCommNode(CommNode).CardFixType = 2 then stCardNo := Hex2Ascii(stCardNo);

                    if CARDLENGTHTYPE = 0 then  //PC에서 고정길이 타입으로 사용중이면
                    begin
                      stCardNo := copy(stCardNo,1,8);
                      if G_nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
                      begin
                        stCardNo := copy(stCardNo,1,6) + '00';
                      end;
                      if IsNumericCardno then   //숫자타입이면
                      begin
                        nCardNo:= Hex2Dec64(stCardNo);
                        stCardNo:= FillZeroNumber2(nCardNo,10);
                      end;
                    end else if CARDLENGTHTYPE = 2 then //카드사옥이면
                    begin
                      if nCardNoLen = 22 then  //KT사옥용이 맞으면
                      begin
                        //stCardNo := Hex2Ascii(stCardNo);
                      end;
                      stCardNo := copy(stCardNo,1,11);
                      if stCardNo[10] = '*' then stCardNo[9] := '0'; //시리얼 카드이면
                    end;
                  end;
                  stCardNo := GetFixedCardNoCheck(stCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);
                  if Not L_bMemoryCardClear then
                  begin
                    nCardIndex := CardDataList.IndexOf(stCardNo);
                    if nCardIndex > -1 then
                    begin
                      if TCardGrade(CardDataList.Objects[nCardIndex]).RcvState = 'S' then
                         TCardGrade(CardDataList.Objects[nCardIndex]).RcvState := 'Y';
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
             't','u': begin                     // 타임코드 응답
                  if Assigned(FOnRcvRegTimeCode) then
                  begin
                    OnRcvRegTimeCode(Self,aData,NodeNO);
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
                  if isDigit(copy(aData,24,2)) and isDigit(copy(aData,20,2)) then
                     HolidaySendRecv[strtoint(copy(aData,24,2))][strtoint(copy(aData,20,2))] := 0; //수신했다.
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
           SendAckforaccess(Copy(aData,20,2));  //처리 하고 나서 Ack 를 보내자.
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
var
  i : integer;
begin
  L_bDeviceDestroy := True;
  ArmAreaDisArmCheckTimer.Enabled := False;
  if CardDataList.Count > 0 then
  begin
    for i := CardDataList.Count - 1 downto 0 do
    begin
      TCardGrade(CardDataList.Objects[i]).Free;
    end;
  end;
  CardDataList.Clear;
  CardDataList.Free;
  SendCardDataList1.Free;
  SendCardDataList2.Free;

  DeviceAntiGropList.Clear;
  DeviceAntiGropList.Free;

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
                              aCardPosition:Boolean = False;
                              aReceiveState:string='S';aType:integer=1);
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RegType: Char;
  aCardType: Char;
  nCardLength : integer;
  stCardPositionNum : string;
  nCardFixType : integer;
  stQuick : string;
begin
  if CommNode = nil then Exit;
  SendCardTime := getTickCount;  //전송할 데이터가 있다면 전송시간을 현재로 바꾸자... 이게 없으면 마지막 전송후 문제가 되어 Ack가 안오는 경우 전송시간이 갱신이 안된다.2019년 1월 25일 

  nCardFixType := CommNode.CardFixType;
  MemoryCardAdd(aCardNo, ValidDay, cardType, RegCode, aTimeCode, func,aAlarmAreaGrade,aDoorAreaGrade,aCardGroup,aCardTimeCode,aCardWeekCode,
                           aQuick,aPositionNum,aCardPosition,aReceiveState);

  if G_bGlobalAntiPass and (DeviceAntiGropList.Count > 0) then
  begin
    //dmAdoQuery.CardRCV_ACKUpdate(aCardNo,inttostr(NodeNo),ECUID,'Y');   //20190829 안티패스에서 통신 이상시 자체 동작하는 것으로 변경에 따라서  권한을 다운로드 해야 됨
    //Exit;  //AntiPass 사용하는 컨트롤러이면 카드 권한 전송하지 말자.
  end;
  if G_nSpecialProgram = 5 then //송호대학교 식수 이면
  begin
    if FDtype = dtFD then
    begin
      dmAdoQuery.CardRCV_ACKUpdate(aCardNo,inttostr(NodeNo),ECUID,'Y');
      Exit;  //송호대학교 식수이면 권한 전송하지 말자.
    end;
  end;

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
      xCardNo :=  FillCharString(aCardNo + '0','*',11);
      xCardNo := copy(xCardNo,1,11);
      xCardNo := Ascii2Hex(xCardNo,False,True);
    end else if CARDLENGTHTYPE = 1 then  //서버는 가변
    begin
      if aCardNo[9] = '*' then
      begin
        aCardNo[9] := '0';
      end;
      //xCardNo:=  FillCharString(copy(aCardNo,1,8) + '0','*',11);
      xCardNo := copy(aCardNo,1,11);
      xCardNo := Ascii2Hex(xCardNo,False,True);
    end else if CARDLENGTHTYPE = 2 then  //서버는 KT사옥용
    begin
      aCardNo := copy(aCardNo,1,11);
      xCardNo := Ascii2Hex(aCardNo,False,True);
    end;
    nCardLength := Length(xCardNo);
    xCardNo := FillzeroNumber(nCardLength,2) + xCardNo;
  end;
(*  if CARDLENGTHTYPE = 0 then
  begin
    if IsNumericCardNo then
    begin
      if Not Isdigit(aCardNo) then Exit;
      aCardNo := FillZeroStrNum(Trim(aCardNo),10);
      xCardNo:=  '00'+EncodeCardNo(aCardNo);
    end
    else
    begin
      xCardNo:= '00' + EncodeCardNo(FillZeroNumber2(Hex2Dec64(aCardNo),10));
    end;

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
      begin
        if isDigit(aCardNo) then xCardNo:=  Dec2Hex64(StrtoInt64(aCardNo),20)
        else Exit;
      end else xCardNo:= aCardNo;
    end else if CARDLENGTHTYPE = 2 then
    begin
      xCardNo := Ascii2Hex(aCardNo);
    end;
    nCardLength := Length(xCardNo);
    xCardNo := FillzeroNumber(nCardLength,2) + xCardNo;
  end;
*)
  if ValidDay = '' then ValidDay:= '000000';
  if Not IsDigit(ValidDay) then ValidDay:= '000000';
  
  if Length(ValidDay) <> 6 then
  begin
    ErrorLogSave(ExeFolder + '\..\log\err'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 'ErrorDownladCardData ','유효기간 <> 6:'+aData);
    Exit;
  end;

  if func = 'D' then func := 'N'; //유효기간 삭제 인경우 2015.12.22

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

  SendPacket('c',aData,aQuick,aType);

  if G_bCardDownloadLogSave then
  begin
    if aQuick then stQuick := 'True'
    else stQuick := 'False';
    LogSave(ExeFolder + '\..\log\CD_DOWNLOAD'+ FormatDateTIme('yyyymmdd',Now)+'.log',CommNode.ConnectIP + ',' + ECUID + ',' + stQuick + ',' + aData);
  end;

end;

procedure TDevice.Control_DoorModeChange(aDoorNo: Char; aMode: Char;aQuick:Boolean=True);
var
  st: string;
begin
  if FDtype = dtFD then
  begin
    if aMode = '1' then Exit; //식수타입은 개방모드 하면 안됨
  end;
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
  SendPacket('c',st,True,-1);
end;

procedure TDevice.SendDoorSchadule(aDoor:Char;aDay:Char;aData:String;aQuick:Boolean = False);
var
  st: String;
begin
   st:= 'S'+        //Command
        '0'+        //Message Code
        aDoor+      //기기내 출입문 번호
        #$20+
        aDay+       //요일:0평일,1반휴일,2:일요일,3휴일,4.휴일2,5.휴일3
        aData;      // Mode Data
   SendPacket('c',st,aQuick);
//   DebugScreen.Trace('[Debug]'+st);
end;


procedure TDevice.Check_DoorState(aDoorNo: Char;aQuick:Boolean = False);
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
    if Value <> nil then
       Value.Devices.AddObject(self.FDeviceID,Self)
    else FCommNode.Devices.Clear;
    FCommNode := Value;
  end;
end;

procedure TDevice.SetConnected(const Value: Boolean);
var
  i,j : integer;
begin
  if FConnected <> Value then
  begin
    FConnected := Value;
    if CommNode = nil then Exit;
    CommNode.StateEvent := True;
    if Assigned(FOnConnected) then OnConnected(Self,Value,NodeNO,ECUID);
    if Value then FCommNode.SocketConnected := Value;
    if Not Value then
    begin
      //DoorManageMode1 := dmNothing;
      //DoorPNMode1 := pnNothing;
      //DoorState1 := dsNothing;
      //DoorManageMode2 := dmNothing;
      //DoorPNMode2 := pnNothing;
      //DoorState2 := dsNothing;
      DoorManageModeInitialize;
      DoorPNModeInitialize;
      DoorStateInitialize;

      //WatchMode := cmNothing;
      if Assigned(FOnDoorModeChange) then
      begin
        for j:=1 to con_nFIXMAXDOORNO do
        begin
          if GetDoorUse(j) then OnDoorModeChange(Self,NodeNO,ECUID,inttostr(j),GetDoorManageMode(j),GetDoorPNMode(j),GetDoorState(j),GetDoorLockMode(j),GetDoorFire(j));
        end;
        (*
         if Door1Use then OnDoorModeChange(Self,NodeNO,ECUID,'1',DoorManageMode1,DoorPNMode1,DoorState1,DoorLockMode1,Door1Fire);
         if Door2Use then OnDoorModeChange(Self,NodeNO,ECUID,'2',DoorManageMode2,DoorPNMode2,DoorState2,DoorLockMode2,Door2Fire);
        *)
      end;
      for i := Low(ArmAreaState) to High(ArmAreaState) do
      begin
        SetArmAreaState(i,cmNothing);
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
    if CommNode <> nil then CommNode.StateEvent := True;
    FWatchMode := Value;
    if Assigned(FOnWatchModeChange) then
    begin
      OnWatchModeChange(self,NodeNo,ECUID,'0',Value);
    end;
  end;
end;

//경비모드 변경
procedure TDevice.ChangewatchMode(aArmAreaNo:string;aMode: TWatchMode);
begin
  case aMode of
    cmArm      : SendPacket('R','MC' + FillZeroStrNum(aArmAreaNo,2)+'A',True); //경비모드
    cmDisarm   : SendPacket('R','MC' + FillZeroStrNum(aArmAreaNo,2)+'D',True); //해제모드
    cmPatrol   : SendPacket('R','MC' + FillZeroStrNum(aArmAreaNo,2)+'P',True); //순회모드
    cmInit     : SendPacket('R','MC' + FillZeroStrNum(aArmAreaNo,2)+'I',True); //등록모드
    cmTest     : SendPacket('R','MC' + FillZeroStrNum(aArmAreaNo,2)+'T',True); //TEST모드
  end;
end;

//경비모드 확인
// 메인장비(기기번호가 00)에만 명령어 전송
procedure TDevice.CheckWatchMode(aArmAreaNo:string;aQuick:Boolean = False);
var
  stArmArea : string;
  i : integer;
  stData : string;
begin
  if (aArmAreaNo = '0') or (aArmAreaNo = '') then
  begin
    if ECUID = '00' then stData := 'RD00'
    else stData := 'RD00' + ECUID;
    if CommNode <> nil then
      CommNode.SendPacket('00','R',stData,aQuick,0);
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

procedure TDevice.ReBoot;
begin
  SendPacket('R','RS00Reset',True);
end;

procedure TCommNode.ACC_sendData(aEcuId, aData: CString);
begin
  SendPacket(aEcuId,'c', aData,True,G_nAckSendType);
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
  if CommNode = nil then Exit;
  if Value = dtFd then
    CommNode.FDtype := dtFd;
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
  if Not Connected then Exit;
  
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
var
  aTimeOut: TDatetime;
  i : integer;
begin
  if FSocketConnected = Value then Exit;
  FSocketConnected := Value;
  ServerEnqCount := 0;      //소켓 끊기거나 접속시 ENQ Count 는 0 으로 만들자.
  if Value then
  begin
    SocketConnectedTime := Now;
    NodeDisConnectedCheckTimer.Enabled := False;
  end else
  begin
    aTimeOut:= IncTime(SocketConnectedTime,0,0,G_nNodeSocketConnectedNFDelayTime,0);   //연결 후 5분 이전에 끊기는 경우 NF 신호 만들지 말자...
    if Now < aTimeout then OldConnected := -1;         //여기가 좀 이상하다...?? 접속하자 마자 끊기는 경우에는 NF를 만들지 않기 위해서임. 최소 5분 이상 접속 한 상태에서만 만들자.
    if Devices.Count > 0 then
    begin
      For I:= 0 to Devices.Count -1 do
      begin
        if Assigned(Devices.Objects[I]) then
        begin
          TDevice(Devices.Objects[I]).Connected:= False;
        end;
      end;
    end;
    if OldConnected <> -1 then  //과거 Connected 상태가 초기값이 아닌경우 Delay 적용 후에 'NF' 를 만들자.
    begin
      NodeDisConnectedCheckTimer.enabled := True;
      OldConnected := -1; //처음 끊긴 경우는 무조건 NF 만들지 말고 일정 시간동안 접속이 안되는 경우에 NF 를 만들자...
    end;
  end;
  
  if Assigned(FOnConnected) then
  begin
    OnConnected(Self,Value,NO,OldConnected);
  end;
  if Not Value then
  begin
    if OldConnected = 1 then OldConnected := 0;
    if Open then Open := Value;
  end;
end;

(*
procedure TDevice.SetDoorManageMode1(const Value: TDoorManageMode);
begin
  if FDoorManageMode1 <> Value then
  begin
    if CommNode <> nil then CommNode.StateEvent := True;
    FDoorManageMode1 := Value;
    if Assigned(FOnDoorManageModeChange) then
    begin
      OnDoorManageModeChange(self,NodeNo,ECUID,'01',Value);
    end;
  end;
end;
*)

(*
procedure TDevice.SetDoorManageMode2(const Value: TDoorManageMode);
begin
  if FDoorManageMode2 <> Value then
  begin
    if CommNode <> nil then CommNode.StateEvent := True;
    FDoorManageMode2 := Value;
    if Assigned(FOnDoorManageModeChange) then
    begin
      OnDoorManageModeChange(self,NodeNo,ECUID,'02',Value);
    end;
  end;
end;
*)
(*
procedure TDevice.SetDoorState1(const Value: TDoorDSState);
begin
  if FDoorState1 <> Value then
  begin
    if CommNode <> nil then CommNode.StateEvent := True;
    FDoorState1 := Value;
    if Assigned(FOnDoorStateChange) then
    begin
      OnDoorStateChange(self,NodeNo,ECUID,'01',Value);
    end;
  end;
end;
*)
(*
procedure TDevice.SetDoorState2(const Value: TDoorDSState);
begin
  if FDoorState2 <> Value then
  begin
    if CommNode <> nil then CommNode.StateEvent := True;
    FDoorState2 := Value;
    if Assigned(FOnDoorStateChange) then
    begin
      OnDoorStateChange(self,NodeNo,ECUID,'02',Value);
    end;
  end;
end;
*)
(*
procedure TDevice.SetDoorPNMode1(const Value: TDoorPNMode);
begin
  if FDoorPNMode1 <> Value then
  begin
    if CommNode <> nil then CommNode.StateEvent := True;
    FDoorPNMode1 := Value;
    if Assigned(FOnDoorPNModeChange) then
    begin
      OnDoorPNModeChange(self,NodeNo,ECUID,'01',Value);
    end;
  end;
end;
*)
(*
procedure TDevice.SetDoorPNMode2(const Value: TDoorPNMode);
begin
  if FDoorPNMode2 <> Value then
  begin
    if CommNode <> nil then CommNode.StateEvent := True;
    FDoorPNMode2 := Value;
    if Assigned(FOnDoorPNModeChange) then
    begin
      OnDoorPNModeChange(self,NodeNo,ECUID,'02',Value);
    end;
  end;
end;
*)

procedure TDevice.DeviceRecvAlarmData(aNodeNo: integer; aCommand,aData,aFireGubunCode: string);
var
  stSubCLass : string;
  stStatusCode : string;
  stZoneCode : string;
  stSubNo : string;
  cMode : Char;
  i : integer;
begin
  stSubClass := copy(aData,34,2);
  stSubNo := copy(aData,36,2);
  stZoneCode := copy(aData,38,2);
  if Not isDigit(stZoneCode) then stZoneCode := '00';

  cMode     := aData[40];
  stStatusCode   := copy(aData,41,2);
  if (stSubCLass = 'MN') or (stSubCLass = 'EX')then
  begin
    if stStatusCode = 'NF' then
    begin
//      SendPacket('a','',True); //Alarm Ack 보내자
      Connected := False;
//      WatchMode := cmNothing;
//      Exit;  //NF 인 경우 저장이 안됨...ㅠ.ㅠ
    end else
    begin
      Connected := True;
      case UpperCase(cMode)[1] of
       'A': begin
              //WatchMode := cmArm;
              SetArmAreaState(strtoint(stZoneCode),cmArm);
            end;
       'D': begin
              //WatchMode := cmDisarm;
              SetArmAreaState(strtoint(stZoneCode),cmDisarm);
            end;
       'T': begin
              //WatchMode := cmTest;
              SetArmAreaState(strtoint(stZoneCode),cmTest);
            end;
       'I': begin
              //WatchMode := cmInit;
              SetArmAreaState(strtoint(stZoneCode),cmInit);
            end;
       'P': begin
              //WatchMode := cmPatrol;
              SetArmAreaState(strtoint(stZoneCode),cmPatrol);
            end;
       'E': begin
              //WatchMode := cmJaejung;
              SetArmAreaState(strtoint(stZoneCode),cmJaejung);
            end;
      else  begin
              //WatchMode := cmNothing;
              SetArmAreaState(strtoint(stZoneCode),cmNothing);
            end;
      end;
    end;
  end else if (stSubCLass = 'EL') then
  begin
    if stStatusCode = 'NF' then
    begin
      if isdigit(stSubNo) then
      begin
        SetDoorManageMode(strtoint(stSubNo) + 2,dmNothing);
        SetDoorState(strtoint(stSubNo) + 2,dsNothing);
        if Assigned(FOnDoorModeChange) then
        begin
          OnDoorModeChange(Self,NodeNO,ECUID,inttostr(strtoint(stSubNo) + 2),GetDoorManageMode(strtoint(stSubNo) + 2),GetDoorPNMode(strtoint(stSubNo) + 2),GetDoorState(strtoint(stSubNo) + 2),GetDoorLockMode(strtoint(stSubNo) + 2),GetDoorFire(strtoint(stSubNo) + 2));
        end;
      end;
    end else if stStatusCode = 'NR' then
    begin
      Check_DoorState(inttostr(strtoint(stSubNo) + 2)[1]);
    end;
  end else
  begin
    Connected := True;

    case UpperCase(cMode)[1] of
     'A': begin
            //WatchMode := cmArm;
            SetArmAreaState(strtoint(stZoneCode),cmArm);
          end;
     'D': begin
            //WatchMode := cmDisarm;
            SetArmAreaState(strtoint(stZoneCode),cmDisarm);
          end;
     'T': begin
            //WatchMode := cmTest;
            SetArmAreaState(strtoint(stZoneCode),cmTest);
          end;
     'I': begin
            //WatchMode := cmInit;
            SetArmAreaState(strtoint(stZoneCode),cmInit);
          end;
     'P': begin
            //WatchMode := cmPatrol;
            SetArmAreaState(strtoint(stZoneCode),cmPatrol);
          end;
     'E': begin
            //WatchMode := cmJaejung;
            SetArmAreaState(strtoint(stZoneCode),cmJaejung);
          end;
    else  begin
            //WatchMode := cmNothing;
            SetArmAreaState(strtoint(stZoneCode),cmNothing);
          end;
    end;
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
    OnRcvAlarmData(Self,aCommand,aData,aNodeNO,aFireGubunCode);
  end;
  SendPacket('a','',True,G_nAckSendType); //Alarm Ack 보내자

end;


procedure TDevice.DoorModeState(aNodeNo: integer; aData: string);
Var
  stDoorNo: String;
  cMsgNo: Char;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;
  bChange : Boolean;
  cInputType : char;
begin
  if Length(aData) < 40 then    Exit;
  bChange := False;

  stDoorNo:= '0' + aData[21];
  if Not isDigit(stDoorNo) then Exit;

  cMsgNo:=    aData[18];
  cDoorState:= aData[40];    //문상태
  cDoorMode:=  aData[37];    //운영/개방
  cDoorMode2:= aData[36];    //Posi/Nega
  cInputType := aData[38];        //'F' 화재
  case cDoorMode of
    '0' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmManager then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmManager);
              bChange := True;
            end
          end;
    '1' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmOpen then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmOpen);
              bChange := True;
            end
          end;
    '2' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmLock then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmLock);
              bChange := True;
            end
          end;
    '3' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmMaster then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmMaster);
              bChange := True;
            end
          end;
    else begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmNothing then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmNothing);
              bChange := True;
            end
          end;
  end;
  case cDoorMode2 of
    '0' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnPositive then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnPositive);
              bChange := True;
            end
          end;
    '1' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnNegative then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnNegative);
              bChange := True;
            end
          end;
    '2' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnPositive then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnPositive);
              bChange := True;
            end
          end;
    '3' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnNegative then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnPositive);
              bChange := True;
            end
          end;
    else  begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnNothing then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnNothing);
              bChange := True;
            end
          end;
  end;

  case cDoorState of
    'C' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsClose then
            begin
              SetDoorState(strtoint(stDoorNo),dsClose);
              bChange := True;
            end
          end;
    'O' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsOpen then
            begin
              SetDoorState(strtoint(stDoorNo),dsOpen);
              bChange := True;
            end
          end;
    'T','D' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsLongTime then
            begin
              //LogSave(ExeFolder + '\..\log\LongTime'+ FormatDateTIme('yyyymmdd',Now)+'.log','DoorModeState:'+aData);
              SetDoorState(strtoint(stDoorNo),dsLongTime);
              bChange := True;
            end
          end;
    'U' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsOpenErr then
            begin
              SetDoorState(strtoint(stDoorNo),dsOpenErr);
              bChange := True;
            end
          end;
    'L' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsCloseErr then
            begin
              SetDoorState(strtoint(stDoorNo),dsCloseErr);
              bChange := True;
            end
          end;
    else  begin
            if GetDoorState(strtoint(stDoorNo)) <> dsNothing then
            begin
              SetDoorState(strtoint(stDoorNo),dsNothing);
              bChange := True;
            end
          end;
  end;
  if bChange then
  begin
    if Assigned(FOnDoorModeChange) then
    begin
      OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,GetDoorManageMode(strtoint(stDoorNo)),GetDoorPNMode(strtoint(stDoorNo)),GetDoorState(strtoint(stDoorNo)),GetDoorLockMode(strtoint(stDoorNo)),GetDoorFire(strtoint(stDoorNo)));
    end;
  end;
  (*
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
              if Not Door1Use then
              begin
                //여기에서 개방 모드 전송 2011.04.11 충남대 버젼인 ICU-200 에서 장시간 열림 신호 올라 오는  부분 처리용
                Control_DoorModeChange('1','1',False);
              end;
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
    case cInputType of
      'F','f': begin
              Door1Fire := True;
           end
      else begin
              Door1Fire := False;
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
      'T','D' : begin
              if Not Door2Use then
              begin
                //여기에서 개방 모드 전송 2011.04.11 충남대 버젼인 ICU-200 에서 장시간 열림 신호 올라 오는  부분 처리용
                Control_DoorModeChange('2','1',False);
              end;
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
    case cInputType of
      'F','f': begin
              Door2Fire := True;
           end
      else begin
              Door2Fire := False;
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

  end;  *)

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
  if Not isDigit(stDoorNo) then Exit;

  cDoorMode2:= aData[24];    //Posi/Nega
  cDoorMode:=  aData[25];    //운영/개방
  cDoorState:= aData[26];    //문상태
  case cDoorMode of
    '0' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmManager then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmManager);
              bChange := True;
            end
          end;
    '1' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmOpen then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmOpen);
              bChange := True;
            end
          end;
    '2' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmLock then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmLock);
              bChange := True;
            end
          end;
    '3' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmMaster then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmMaster);
              bChange := True;
            end
          end;
    else begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmNothing then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmNothing);
              bChange := True;
            end
          end;
  end;
  case cDoorMode2 of
    '0' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnPositive then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnPositive);
              bChange := True;
            end
          end;
    '1' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnNegative then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnNegative);
              bChange := True;
            end
          end;
    '2' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnPositive then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnPositive);
              bChange := True;
            end
          end;
    '3' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnNegative then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnNegative);
              bChange := True;
            end
          end;
    else  begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnNothing then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnNothing);
              bChange := True;
            end
          end;
  end;

  case cDoorState of
    'C' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsClose then
            begin
              SetDoorState(strtoint(stDoorNo),dsClose);
              bChange := True;
            end
          end;
    'O' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsOpen then
            begin
              SetDoorState(strtoint(stDoorNo),dsOpen);
              bChange := True;
            end
          end;
    'T','D' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsLongTime then
            begin
              SetDoorState(strtoint(stDoorNo),dsLongTime);
              //LogSave(ExeFolder + '\..\log\LongTime'+ FormatDateTIme('yyyymmdd',Now)+'.log','DoorControlState:'+aData);
              bChange := True;
            end
          end;
    'U' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsOpenErr then
            begin
              SetDoorState(strtoint(stDoorNo),dsOpenErr);
              bChange := True;
            end
          end;
    'L' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsCloseErr then
            begin
              SetDoorState(strtoint(stDoorNo),dsCloseErr);
              bChange := True;
            end
          end;
    else  begin
            if GetDoorState(strtoint(stDoorNo)) <> dsNothing then
            begin
              SetDoorState(strtoint(stDoorNo),dsNothing);
              bChange := True;
            end
          end;
  end;
  if bChange then
  begin
    if Assigned(FOnDoorModeChange) then
    begin
      OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,GetDoorManageMode(strtoint(stDoorNo)),GetDoorPNMode(strtoint(stDoorNo)),GetDoorState(strtoint(stDoorNo)),GetDoorLockMode(strtoint(stDoorNo)),GetDoorFire(strtoint(stDoorNo)));
    end;
  end;
(*  if stDoorNo = '01' then //1번문이면
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
              if Not Door1Use then
              begin
                //여기에서 개방 모드 전송 2011.04.11 충남대 버젼인 ICU-200 에서 장시간 열림 신호 올라 오는  부분 처리용
                Control_DoorModeChange('1','1',False);
              end;
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
              if Not Door2Use then
              begin
                //여기에서 개방 모드 전송 2011.04.11 충남대 버젼인 ICU-200 에서 장시간 열림 신호 올라 오는  부분 처리용
                Control_DoorModeChange('2','1',False);
              end;
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
  end; *)

end;

procedure TDevice.ServerCarDataSend(aCardReaderNo, aCardData: string);
begin
  if Not isDigit(aCardReaderNo) then Exit;
  
  SendPacket('R','CD90'+   //CMD
                 '**' +    //예비컨트롤 ID
                 FillZeroNumber(strtoint(aCardReaderNo),2) + //카드리더번호
                 '**' +    //Door No
                 '7F' +
                 FillZeroNumber(Length(aCardData),2) +
                 aCardData , True); //카드리더 전송
end;

procedure TCommNode.FireRecovery(aQuick:Boolean=False);
begin
  //SendPacket('00','R','SM2599',aQuick);
  //SendPacket('00','R','SM2699RSM2500',aQuick);
  SendPacket('00','R','SM2699RSM2500a',aQuick); //20150818 화재복구후 현재 모드 상태 재전송 기능 추가
  //SendPacket('00','R','SM2699RSM62',False); //20170131 상태를 현재 상태로 재설정 - 확장기로 보내는 것이 아니고 메인에 보내야 하는데 잘못 보냈음(20190221)
  SendPacket('00','R','SM62',False); //20190221 상태를 현재 상태로 재설정 - 화재 복구 후 출입문 안잠기는 문제때문에
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
  aLockType, aDSOpen, aRemoteDoor,aCmd: string);
var
  stData: string;

begin
  if Not IsDigit(aLockType) then Exit;
  
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
    char(strtoint(aLockType)) +              //전기정 타입
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
  if Not isDigit(stDoorNo) then Exit;

  cDoorMode2:= aData[24];    //Posi/Nega
  cDoorMode:=  aData[25];    //운영/개방
  cDoorState:= aData[26];    //문상태

  case cDoorMode of
    '0' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmManager then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmManager);
              bChange := True;
            end
          end;
    '1' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmOpen then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmOpen);
              bChange := True;
            end
          end;
    '2' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmLock then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmLock);
              bChange := True;
            end
          end;
    '3' : begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmMaster then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmMaster);
              bChange := True;
            end
          end;
    else begin
            if GetDoorManageMode(strtoint(stDoorNo)) <> dmNothing then
            begin
              SetDoorManageMode(strtoint(stDoorNo),dmNothing);
              bChange := True;
            end
          end;
  end;
  case cDoorMode2 of
    '0' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnPositive then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnPositive);
              bChange := True;
            end
          end;
    '1' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnNegative then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnNegative);
              bChange := True;
            end
          end;
    '2' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnPositive then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnPositive);
              bChange := True;
            end
          end;
    '3' : begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnNegative then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnNegative);
              bChange := True;
            end
          end;
    else  begin
            if GetDoorPNMode(strtoint(stDoorNo)) <> pnNothing then
            begin
              SetDoorPNMode(strtoint(stDoorNo),pnNothing);
              bChange := True;
            end
          end;
  end;

  case cDoorState of
    'C' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsClose then
            begin
              SetDoorState(strtoint(stDoorNo),dsClose);
              bChange := True;
            end
          end;
    'O' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsOpen then
            begin
              SetDoorState(strtoint(stDoorNo),dsOpen);
              bChange := True;
            end
          end;
    'T','D' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsLongTime then
            begin
              SetDoorState(strtoint(stDoorNo),dsLongTime);
              //LogSave(ExeFolder + '\..\log\LongTime'+ FormatDateTIme('yyyymmdd',Now)+'.log','DoorSetupState:'+aData);
              bChange := True;
            end
          end;
    'U' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsOpenErr then
            begin
              SetDoorState(strtoint(stDoorNo),dsOpenErr);
              bChange := True;
            end
          end;
    'L' : begin
            if GetDoorState(strtoint(stDoorNo)) <> dsCloseErr then
            begin
              SetDoorState(strtoint(stDoorNo),dsCloseErr);
              bChange := True;
            end
          end;
    else  begin
(*            if GetDoorState(strtoint(stDoorNo)) <> dsNothing then
            begin
              SetDoorState(strtoint(stDoorNo),dsNothing);
              bChange := True;
            end
*)
          end;
  end;
  if bChange then
  begin
    if Assigned(FOnDoorModeChange) then
    begin
      OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,GetDoorManageMode(strtoint(stDoorNo)),GetDoorPNMode(strtoint(stDoorNo)),GetDoorState(strtoint(stDoorNo)),GetDoorLockMode(strtoint(stDoorNo)),GetDoorFire(strtoint(stDoorNo)));
    end;
  end;
(*  if stDoorNo = '01' then //1번문이면
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
    if bChange then
    begin
      if Assigned(FOnDoorModeChange) then
      begin
        if Door2Use then
          OnDoorModeChange(Self,NodeNO,ECUID,stDoorNo,DoorManageMode2,DoorPNMode2,DoorState2,DoorLockMode2);
      end;
    end;
  end;  *)

end;



procedure TDevice.SetFireServerCommand(const Value: Boolean);
begin
  FFireServerCommand := Value;
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

procedure TDevice.SetDeviceSkillReceive(const Value: Boolean);
begin
  FDeviceSkillReceive := Value;
end;

procedure TDevice.RemoteDataProcess(aNodeNo: integer; aData: string);
var
  aCode: String;
  aGubun : string;
  stEcuID : string;
  nLength : integer;
  stTemp : string;
begin
  aCode:= Copy(aData,19,2);
  aGubun := Copy(aData,21,2);
  if aCode = 'VR' then
  begin
    if aGubun = '01' then
    begin
      stTemp :=Copy(aData,23,Length(aData)-24);
      DeviceCode := stTemp;
    end else if aGubun = '90' then
    begin
      stEcuID := copy(aData,15,2);
      nLength := Length(aData) + 1; //ETX 부분이 없어서 있는 것처럼 생각
      GetSystemSkill(stEcuID,Copy(aData,23,nLength - 24));
    end;
  end;
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

procedure TDevice.FireOutbreak(aQuick:Boolean = False);
var
  stSendData : string;
begin
//  if FireServerCommand then
    SendPacket('R','SM2900Fire',aQuick);
{  else
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
  end;   }

end;

procedure TDevice.Check_DeviceVersion(aQuick: Boolean);
begin
  SendPacket('R','VR00',aQuick);
end;

procedure TDevice.MemoryClear;
begin
  SendPacket('I','ac00Register Clear',False);
  //SendPacket(aDeviceID,'I','ac00Register Clear',Sent_Ver);
end;

(*
procedure TDevice.SetDoorLockMode1(const Value: TDoorLockState);
begin
  FDoorLockMode1 := Value;
end;

procedure TDevice.SetDoorLockMode2(const Value: TDoorLockState);
begin
  FDoorLockMode2 := Value;
end;

procedure TDevice.SetDoor1Fire(const Value: Boolean);
begin
  if FDoor1Fire = Value then Exit;
  if CommNode <> nil then CommNode.StateEvent := True;
  FDoor1Fire := Value;

  if Value then     //화재시에는 해당 출입문 화재 신호 발생
  begin
    if Assigned(FOnFireStateChange) then
    begin
      OnFireStateChange(Self,NodeNo,ECUID,'1',Value);
    end;
  end else //화재 복구시에는 이전 모드의 상태값 이벤트 발생 카드모드/운영모드
  begin
    if Assigned(FOnDoorStateChange) then
    begin
      OnDoorModeChange(self,NodeNo,ECUID,'1',DoorManageMode1,DoorPNMode1,DoorState1,DoorLockMode1,Door1Fire);
    end;
  end;
end;

procedure TDevice.SetDoor2Fire(const Value: Boolean);
begin
  if FDoor2Fire = Value then Exit;
  if CommNode <> nil then CommNode.StateEvent := True;
  FDoor2Fire := Value;

  if Value then     //화재시에는 해당 출입문 화재 신호 발생
  begin
    if Assigned(FOnFireStateChange) then
    begin
      OnFireStateChange(Self,NodeNo,ECUID,'2',Value);
    end;
  end else //화재 복구시에는 이전 모드의 상태값 이벤트 발생 카드모드/운영모드
  begin
    if Assigned(FOnDoorStateChange) then
    begin
      OnDoorModeChange(self,NodeNo,ECUID,'2',DoorManageMode2,DoorPNMode2,DoorState2,DoorLockMode2,Door2Fire);
    end;
  end;

end;
*)

procedure TCommNode.SetFdType(const Value: TDevicetype);
begin
  FFDtype := Value;
end;

procedure TDevice.SetDeviceCode(const Value: String);
begin
  if Value = '' then Exit;
  if FDeviceCode <> Value then
  begin
    if Assigned(FOnDeviceCodeChange) then
    begin
      OnDeviceCodeChange(self,NodeNo,ECUID,Value);
    end;
  end;
  FDeviceCode := Value;

  if UpperCase(Value) = 'ACC-104' then   //KTT-811
  begin
    DeviceType := '1';
    HO1USE := True;
    HO2USE := False;
    HO3USE := False;
    MaxLockCount := 2;
    ScheduleSkill := True;
  end else if UpperCase(Value) = 'ACC-510' then   //KTT-812
  begin
    DeviceType := '2';
    HO1USE := True;
    HO2USE := False;
    HO3USE := False;
    MaxLockCount := 8;
    ScheduleSkill := True;
  end else if UpperCase(Value) = 'ACC-503' then   //ICU100
  begin
    DeviceType := '3';
    HO1USE := False;
    HO2USE := False;
    HO3USE := False;
    MaxLockCount := 1;
    ScheduleSkill := False;
  end else if UpperCase(Value) = 'ACC-505' then   //ICU200
  begin
    DeviceType := '4';
    HO1USE := False;
    HO2USE := False;
    HO3USE := False;
    MaxLockCount := 0;
    ScheduleSkill := False;
  end else if UpperCase(Value) = 'MCU-110' then   //MCU300
  begin
    DeviceType := '1';
    HO1USE := True;
    HO2USE := True;
    HO3USE := True;
    MaxLockCount := 8;
    ScheduleSkill := True;
  end else if UpperCase(Value) = 'ECU-110' then   //ECU300
  begin
    DeviceType := '1';
    HO1USE := True;
    HO2USE := True;
    HO3USE := True;
    MaxLockCount := 8;
    ScheduleSkill := True;
  end else if UpperCase(Value) = 'MCU-500' then   //MCU500
  begin
    DeviceType := '1';
    HO1USE := True;
    HO2USE := True;
    HO3USE := True;
    MaxLockCount := 8;
    ScheduleSkill := True;
  end else if UpperCase(Value) = 'ECU-500' then   //ECU500
  begin
    DeviceType := '1';
    HO1USE := True;
    HO2USE := True;
    HO3USE := True;
    MaxLockCount := 8;
    ScheduleSkill := True;
  end else if UpperCase(Value) = 'ICU-300' then   //ICU300
  begin
    DeviceType := '4';
    HO1USE := True;
    HO2USE := True;
    HO3USE := True;
    MaxLockCount := 1;
    ScheduleSkill := True;
  end else if UpperCase(Value) = 'ICU-340' then   //ICU340
  begin
    DeviceType := '4';
    HO1USE := True;
    HO2USE := True;
    HO3USE := True;
    MaxLockCount := 1;
    ScheduleSkill := True;
  end else if UpperCase(Value) = 'ICU-350' then   //ICU350
  begin
    DeviceType := '4';
    HO1USE := True;
    HO2USE := True;
    HO3USE := True;
    MaxLockCount := 1;
    ScheduleSkill := True;
  end else if copy(UpperCase(Value),1,3) = 'ICU' then  //다음에 나오는 ICU 전체
  begin
    DeviceType := '4';
    HO1USE := True;
    HO2USE := True;
    HO3USE := True;
    MaxLockCount := 1;
    ScheduleSkill := True;
  end else   //그 외는 MCU 또는 ECU로 판단
  begin
    DeviceType := '1';
    HO1USE := True;
    HO2USE := True;
    HO3USE := True;
    MaxLockCount := 8;
    ScheduleSkill := True;
  end;
end;

procedure TDevice.SetDeviceType(const Value: String);
begin
  if FDeviceType = Value then Exit;
  FDeviceType := Value;
  if Assigned(FOnDeviceTypeChange) then
  begin
    OnDeviceTypeChange(self,NodeNo,ECUID,Value);
  end;
end;

procedure TCommNode.KTTAlarm_Add(aSendData: string);
begin
  if KTTAlarmSendDataList.Count > 50 then KTTAlarmSendDataList.Delete(0);
  KTTAlarmSendDataList.Add(aSendData);
  if KTTAlarmSendDataList.Count > 50 then KTTAlarmSendDataList.Delete(0);
end;

procedure TCommNode.KTTAlarm_Insert(aSendData: string);
begin
  if KTTAlarmSendDataList.Count > 49 then Exit;
  KTTAlarmSendDataList.Insert(0,aSendData);
end;

procedure TDevice.RelayControl(aRelayNo, aControlTime: integer;
  aQuick: Boolean);
var
  stData : string;
begin
  stData := 'RY00' + FillZeroNumber(aRelayNo,2) + 'f' + FillZeroNumber(aControlTime,2);
  SendPacket('R',stData,aQuick);
end;

procedure TCommNode.AllRelayControl(aRelayNo, aControlTime: integer;
  aQuick: Boolean);
var
  stData : string;
begin
  stData := 'SM2699' + 'RRY00' + FillZeroNumber(aRelayNo,2) + 'f' + FillZeroNumber(aControlTime,2);
  SendPacket('00','R',stData,aQuick);
end;

procedure TCommNode.FireOutbreak(aQuick: Boolean);
begin
  SendPacket('00','R','SM2900Fire',aQuick);
end;


procedure TDevice.RegistDoorTimeCodeUse(aDoorTimeCodeUse: string;aQuick: Boolean);
var
  stData : string;
begin
  stData := 'DL09*' + aDoorTimeCodeUse;
  SendPacket('I',stData,aQuick);

end;

procedure TDevice.RegistTimeCode(aTimeGroup, aTime1, aTime2, aTime3,
  aTime4: string; aQuick: Boolean);
var
  stPacketData : string;
begin
  stPacketData := 'T00  ' + aTimeGroup;
  stPacketData := stPacketData + FillZeroStrNum(aTime1,8);
  stPacketData := stPacketData + FillZeroStrNum(aTime2,8);
  stPacketData := stPacketData + FillZeroStrNum(aTime3,8);
  stPacketData := stPacketData + FillZeroStrNum(aTime4,8);

  SendPacket('c',stPacketData,aQuick);

end;

procedure TDevice.ArmAreaNameInitialize;
var
  i : integer;
begin
  for i := LOW(ArmAreaName) to HIGH(ArmAreaName) do
  begin
    ArmAreaName[i] := '';
  end;
end;

procedure TDevice.ArmAreaStateInitialize;
var
  i : integer;
begin
  for i := LOW(ArmAreaState) to HIGH(ArmAreaState) do
  begin
    ArmAreaState[i] := cmNothing;
  end;
end;

procedure TDevice.ArmAreaUseInitialize;
var
  i : integer;
begin
  for i := LOW(ArmAreaUse) to HIGH(ArmAreaUse) do
  begin
    ArmAreaUse[i] := False;
  end;
end;

procedure TDevice.DoorFireInitialize;
var
  i : integer;
begin
  for i := LOW(DoorFire) to HIGH(DoorFire) do
  begin
    DoorFire[i] := False;
    if Assigned(FOnDoorModeChange) then
    begin
      OnDoorModeChange(self,NodeNo,ECUID,inttostr(i),GetDoorManageMode(i),GetDoorPNMode(i),GetDoorState(i),GetDoorLockMode(i),GetDoorFire(i));
    end;
  end;
end;

procedure TDevice.DoorLockModeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorLockMode) to HIGH(DoorLockMode) do
  begin
    DoorLockMode[i] := lsNothing;
  end;
end;

procedure TDevice.DoorManageModeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorManageMode) to HIGH(DoorManageMode) do
  begin
    DoorManageMode[i] := dmNothing;
  end;
end;

procedure TDevice.DoorNameInitialize;
var
  i : integer;
begin
  for i := LOW(DoorName) to HIGH(DoorName) do
  begin
    DoorName[i] := '';
  end;
end;

procedure TDevice.DoorPNModeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorPNMode) to HIGH(DoorPNMode) do
  begin
    DoorPNMode[i] := pnNothing;
  end;
end;

procedure TDevice.DoorStateInitialize;
var
  i : integer;
begin
  for i := LOW(DoorState) to HIGH(DoorState) do
  begin
    DoorState[i] := dsNothing;
  end;
end;

procedure TDevice.DoorUseInitialize;
var
  i : integer;
begin
  for i := LOW(DoorUse) to HIGH(DoorUse) do
  begin
    DoorUse[i] := False;
  end;
end;

function TDevice.GetArmAreaName(aArmArea: integer): string;
begin
  result := ArmAreaName[aArmArea];
end;

function TDevice.GetArmAreaState(aArmArea: integer): TWatchMode;
begin
  result := ArmAreaState[aArmArea];
end;

function TDevice.GetArmAreaUse(aArmArea: integer): Boolean;
begin
  result := ArmAreaUse[aArmArea];
end;

function TDevice.GetDoorFire(aDoorNo: integer): Boolean;
begin
  if aDoorNo > HIGH(DoorFire) then Exit;
  result := DoorFire[aDoorNo];
end;

function TDevice.GetDoorLockMode(aDoorNo: integer): TDoorLockState;
begin
  if aDoorNo > HIGH(DoorLockMode) then Exit;
  result := DoorLockMode[aDoorNo];
end;

function TDevice.GetDoorManageMode(aDoorNo: integer): TDoorManageMode;
begin
  if aDoorNo > HIGH(DoorManageMode) then Exit;
  result := DoorManageMode[aDoorNo];
  (*
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
  *)

end;

function TDevice.GetDoorName(aDoorNo: integer): string;
begin
  if aDoorNo > HIGH(DoorName) then Exit;
  result := DoorName[aDoorNo];
end;

function TDevice.GetDoorPNMode(aDoorNo: integer): TDoorPNMode;
begin
  if aDoorNo > HIGH(DoorPNMode) then Exit;
  result := DoorPNMode[aDoorNo];
  (*
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
  *)
end;

function TDevice.GetDoorState(aDoorNo: integer): TDoorDSState;
begin
  if aDoorNo > HIGH(DoorState) then Exit;
  result := DoorState[aDoorNo];
  (*case aDoorNo of
    1 : begin
      result := DoorState1;
    end;
    2 : begin
      result := DoorState2;
    end;
    else begin
      result := DoorState[aDoorNo];
    end;
  end;  *)
end;

function TDevice.GetDoorUse(aDoorNo: integer): Boolean;
begin
  if aDoorNo > HIGH(DoorUse) then Exit;
  result := DoorUse[aDoorNo];
end;

procedure TDevice.SetArmAreaName(aArmArea: integer; aName: string);
begin
  if aArmArea > HIGH(ArmAreaName) then Exit;
  if ArmAreaName[aArmArea] = aName then Exit;
  ArmAreaName[aArmArea] := aName ;
end;

procedure TDevice.SetArmAreaState(aArmArea: integer;
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

procedure TDevice.SetArmAreaUse(aArmArea: integer; aUsed: Boolean);
begin
  if aArmArea > HIGH(ArmAreaUse) then Exit;
  if ArmAreaUse[aArmArea] = aUsed then Exit;
  ArmAreaUse[aArmArea] := aUsed ;
  if (aArmArea > 0) and aUsed then ArmAreaUsed := True;
end;

procedure TDevice.SetDoorFire(aDoorNo: integer; aValue: Boolean);
begin
  if aDoorNo > HIGH(DoorFire) then Exit;
  if DoorFire[aDoorNo] = aValue then Exit;
  DoorFire[aDoorNo] := aValue ;
  if aValue then     //화재시에는 해당 출입문 화재 신호 발생
  begin
    if Assigned(FOnFireStateChange) then
    begin
      OnFireStateChange(Self,NodeNo,ECUID,inttostr(aDoorNo),aValue);
    end;
  end else //화재 복구시에는 이전 모드의 상태값 이벤트 발생 카드모드/운영모드
  begin
    if Assigned(FOnDoorModeChange) then
    begin
      OnDoorModeChange(self,NodeNo,ECUID,inttostr(aDoorNo),GetDoorManageMode(aDoorNo),GetDoorPNMode(aDoorNo),GetDoorState(aDoorNo),GetDoorLockMode(aDoorNo),GetDoorFire(aDoorNo));
    end;
  end;

end;

procedure TDevice.SetDoorLockMode(aDoorNo: integer;
  aValue: TDoorLockState);
begin
//  if aDoorNo = 1 then DoorLockMode1 := aValue
//  else if aDoorNo = 2 then DoorLockMode2 := aValue ;
  if aDoorNo > HIGH(DoorLockMode) then Exit;
  if DoorLockMode[aDoorNo] = aValue then Exit;
  DoorLockMode[aDoorNo] := aValue ;
end;

procedure TDevice.SetDoorManageMode(aDoorNo: integer;
  aValue: TDoorManageMode);
begin

//  if aDoorNo = 1 then DoorManageMode1 := aValue
//  else if aDoorNo = 2 then DoorManageMode2 := aValue ;

  if aDoorNo > HIGH(DoorManageMode) then Exit;

  if DoorManageMode[aDoorNo] = aValue then Exit;
  DoorManageMode[aDoorNo] := aValue ;
  if Assigned(FOnDoorManageModeChange) then
  begin
    OnDoorManageModeChange(self,NodeNo,ECUID,inttostr(aDoorNo),aValue);
  end;

end;

procedure TDevice.SetDoorName(aDoorNo: integer; aName: string);
begin
  if aDoorNo > HIGH(DoorName) then Exit;
  if DoorName[aDoorNo] = aName then Exit;
  DoorName[aDoorNo] := aName ;
end;

procedure TDevice.SetDoorPNMode(aDoorNo: integer; aValue: TDoorPNMode);
begin

//  if aDoorNo = 1 then DoorPNMode1 := aValue
//  else if aDoorNo = 2 then DoorPNMode2 := aValue ;

  if aDoorNo > HIGH(DoorPNMode) then Exit;
  if DoorPNMode[aDoorNo] = aValue then Exit;
  DoorPNMode[aDoorNo] := aValue ;
  if Assigned(FOnDoorPNModeChange) then
  begin
    OnDoorPNModeChange(self,NodeNo,ECUID,FillZeroNumber(aDoorNo,2),aValue);
  end;
end;

procedure TDevice.SetDoorState(aDoorNo: integer; aValue: TDoorDSState);
begin
//  if aDoorNo = 1 then DoorState1 := aValue
//  else if aDoorNo = 2 then DoorState2 := aValue ;

  if aDoorNo > HIGH(DoorState) then Exit;
  if DoorState[aDoorNo] = aValue then Exit;
  DoorState[aDoorNo] := aValue ;
  if Assigned(FOnDoorStateChange) then
  begin
    OnDoorStateChange(self,NodeNo,ECUID,FillZeroNumber(aDoorNo,2),aValue);
  end;
end;

procedure TDevice.SetDoorUse(aDoorNo: integer; aUsed: Boolean);
begin
  if aDoorNo > HIGH(DoorUse) then Exit;
  if DoorUse[aDoorNo] = aUsed then Exit;
  DoorUse[aDoorNo] := aUsed ;
end;

function TDevice.CheckMemoryCardGrade(aCardNo, aDoorCheckNo, aPermit,
  aValidDate: string): integer;
var
  nIndex : integer;
begin
  result := -2; // 검색된 카드가 없다... DB에서 찾아 재전송 하자.
  if L_bMemoryCardClear then Exit;
  nIndex := CardDataList.IndexOf(aCardNo);
  if nIndex < 0 then Exit;
  if aPermit = 'A' then //미등록 카드이면
  begin
    if UpperCase(TCardGrade(CardDataList.Objects[nIndex]).GRADE) <> 'N' then Exit; //DB에서 찾아재전송 하자.
  end else if aPermit = 'C' then //방범전용카드 출입 불가
  begin
    if TCardGrade(CardDataList.Objects[nIndex]).cardType <> '1' then Exit; //방범전용이 아니면 DB에서 찾아재전송 하자. (0:출입,1:방범,2:출입+방범)
  end else if aPermit = 'B' then //출입 불가
  begin
    if aDoorCheckNo = '1' then
    begin
      if TCardGrade(CardDataList.Objects[nIndex]).DOOR1 = '1' then Exit;  //출입권한이 있는데 출입 못했으므로 재전송
    end else if aDoorCheckNo = '2' then
    begin
      if TCardGrade(CardDataList.Objects[nIndex]).DOOR2 = '1' then Exit;  //출입권한이 있는데 출입 못했으므로 재전송
    end;
  end else if aPermit = 'F' then //유효기간만료
  begin
    if TCardGrade(CardDataList.Objects[nIndex]).ValidDay > aValidDate then Exit; //유효기간이 남았는데 출입 불가면 재전송
  end else if (aPermit = '1') or (aPermit = '2') then   //출입승인
  begin
    if UpperCase(TCardGrade(CardDataList.Objects[nIndex]).GRADE) = 'N' then Exit; //DB에서 찾아재전송 하자.
    if aDoorCheckNo = '0' then
    begin
      if TCardGrade(CardDataList.Objects[nIndex]).cardType = '0' then Exit;  //출입전용으로 방범승인이면 재전송 (0:출입,1:방범,2:출입+방범)
    end else if aDoorCheckNo = '1' then
    begin
      if TCardGrade(CardDataList.Objects[nIndex]).DOOR1 <> '1' then Exit;  //출입권한이 없는데 출입했으므로 재전송
    end else if aDoorCheckNo = '2' then
    begin
      if TCardGrade(CardDataList.Objects[nIndex]).DOOR2 <> '1' then Exit;  //출입권한이 없는데 출입 못했으므로 재전송
    end;
  end else if (aPermit = '3') or (aPermit = '4') then   //방범승인
  begin
    if UpperCase(TCardGrade(CardDataList.Objects[nIndex]).GRADE) = 'N' then Exit; //DB에서 찾아재전송 하자.
    if TCardGrade(CardDataList.Objects[nIndex]).cardType = '0' then Exit;  //출입전용으로 방범승인이면 재전송   (0:출입,1:방범,2:출입+방범)
  end;
  result := 1;
end;

procedure TDevice.MemoryCardAdd(aCardNo:String; ValidDay: String; cardType:Char; RegCode:Char; aTimeCode:Char; func:Char;
                           aAlarmAreaGrade,aDoorAreaGrade,aCardGroup,aCardTimeCode,aCardWeekCode:string;
                           aQuick:Boolean = False;aPositionNum:integer = 0;aCardPosition:Boolean = False;aReceiveState:string='S');
var
  nIndex : integer;
  oCard : TCardGrade;
  stArmAreaGrade : string;
  stDoorGrade : string;
  stMaster : string;
begin
  stArmAreaGrade := '';
  stDoorGrade := '';
  stMaster := 'N';
  //if (aAlarmAreaGrade = '') and (aDoorAreaGrade = '') then Exit;   //방범/출입권한이 없는 경우이다.
  if aAlarmAreaGrade <> '' then
  begin
    stArmAreaGrade := ASCII2Hex(aAlarmAreaGrade);
    stArmAreaGrade := HexToBinary(stArmAreaGrade);
    if stArmAreaGrade[3] = '1' then stMaster := 'Y';
    Delete(stArmAreaGrade,1,4);
    Delete(stArmAreaGrade,5,4);
  end;

  if aDoorAreaGrade <> '' then
  begin
    stDoorGrade := ASCII2Hex(aDoorAreaGrade);
    stDoorGrade := HexToBinary(stDoorGrade);
    Delete(stDoorGrade,1,4);
    Delete(stDoorGrade,5,4);
  end;
  if L_bMemoryCardClear then Exit;
  nIndex := CardDataList.IndexOf(aCardNo);
  if nIndex < 0 then
  begin
    oCard := TCardGrade.Create(nil);
    oCard.ValidDay := ValidDay;
    oCard.cardType := cardType; //카드타입설정: 0=> 출입,1=>방범,2=>방범+출입
    oCard.CardGroup := aCardGroup;
    oCard.CardPositionNum := inttostr(aPositionNum);
    oCard.CardPositionUse := aCardPosition;
    oCard.CardTimeCode := aCardTimeCode;
    oCard.CardWeekCode := aCardWeekCode;
    oCard.GRADE := func;
    oCard.RcvState := aReceiveState;
    oCard.RegCode := RegCode;
    oCard.TimeCode := aTimeCode;
    oCard.ArmAreaGrade := aAlarmAreaGrade;
    oCard.DoorGrade := aDoorAreaGrade;
    oCard.Master := stMaster;
    if stArmAreaGrade <> '' then
    begin
      oCard.ArmArea0 := stArmAreaGrade[8];
      oCard.ArmArea1 := stArmAreaGrade[8];
      oCard.ArmArea2 := stArmAreaGrade[7];
      oCard.ArmArea3 := stArmAreaGrade[6];
      oCard.ArmArea4 := stArmAreaGrade[5];
      oCard.ArmArea5 := stArmAreaGrade[4];
      oCard.ArmArea6 := stArmAreaGrade[3];
      oCard.ArmArea7 := stArmAreaGrade[2];
      oCard.ArmArea8 := stArmAreaGrade[1];
    end else
    begin
      oCard.ArmArea0 := '0';
      oCard.ArmArea1 := '0';
      oCard.ArmArea2 := '0';
      oCard.ArmArea3 := '0';
      oCard.ArmArea4 := '0';
      oCard.ArmArea5 := '0';
      oCard.ArmArea6 := '0';
      oCard.ArmArea7 := '0';
      oCard.ArmArea8 := '0';
    end;
    if aDoorAreaGrade <> '' then
    begin
      oCard.DOOR1 := stDoorGrade[8];
      oCard.DOOR2 := stDoorGrade[7];
      oCard.DOOR3 := stDoorGrade[6];
      oCard.DOOR4 := stDoorGrade[5];
      oCard.DOOR5 := stDoorGrade[4];
      oCard.DOOR6 := stDoorGrade[3];
      oCard.DOOR7 := stDoorGrade[2];
      oCard.DOOR8 := stDoorGrade[1];
    end else
    begin
      oCard.DOOR1 := '0';
      oCard.DOOR2 := '0';
      oCard.DOOR3 := '0';
      oCard.DOOR4 := '0';
      oCard.DOOR5 := '0';
      oCard.DOOR6 := '0';
      oCard.DOOR7 := '0';
      oCard.DOOR8 := '0';
    end;
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
    CardDataList.AddObject(aCardNo,oCard);
  end else
  begin
    TCardGrade(CardDataList.Objects[nIndex]).ValidDay := ValidDay;
    TCardGrade(CardDataList.Objects[nIndex]).cardType := cardType; //카드타입설정: 0=> 출입,1=>방범,2=>방범+출입
    TCardGrade(CardDataList.Objects[nIndex]).CardGroup := aCardGroup;
    TCardGrade(CardDataList.Objects[nIndex]).CardPositionNum := inttostr(aPositionNum);
    TCardGrade(CardDataList.Objects[nIndex]).CardPositionUse := aCardPosition;
    TCardGrade(CardDataList.Objects[nIndex]).CardTimeCode := aCardTimeCode;
    TCardGrade(CardDataList.Objects[nIndex]).CardWeekCode := aCardWeekCode;
    TCardGrade(CardDataList.Objects[nIndex]).GRADE := func;
    TCardGrade(CardDataList.Objects[nIndex]).RcvState := aReceiveState;
    TCardGrade(CardDataList.Objects[nIndex]).RegCode := RegCode;
    TCardGrade(CardDataList.Objects[nIndex]).ArmAreaGrade := aAlarmAreaGrade;
    TCardGrade(CardDataList.Objects[nIndex]).TimeCode := aTimeCode;
    TCardGrade(CardDataList.Objects[nIndex]).DoorGrade := aDoorAreaGrade;
    TCardGrade(CardDataList.Objects[nIndex]).Master := stMaster;
    if stArmAreaGrade <> '' then
    begin
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea0 := stArmAreaGrade[8];
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea1 := stArmAreaGrade[8];
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea2 := stArmAreaGrade[7];
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea3 := stArmAreaGrade[6];
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea4 := stArmAreaGrade[5];
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea5 := stArmAreaGrade[4];
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea6 := stArmAreaGrade[3];
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea7 := stArmAreaGrade[2];
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea8 := stArmAreaGrade[1];
    end else
    begin
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea0 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea1 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea2 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea3 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea4 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea5 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea6 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea7 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).ArmArea8 := '0';
    end;
    if stDoorGrade <> '' then
    begin
      TCardGrade(CardDataList.Objects[nIndex]).DOOR1 := stDoorGrade[8];
      TCardGrade(CardDataList.Objects[nIndex]).DOOR2 := stDoorGrade[7];
      TCardGrade(CardDataList.Objects[nIndex]).DOOR3 := stDoorGrade[6];
      TCardGrade(CardDataList.Objects[nIndex]).DOOR4 := stDoorGrade[5];
      TCardGrade(CardDataList.Objects[nIndex]).DOOR5 := stDoorGrade[4];
      TCardGrade(CardDataList.Objects[nIndex]).DOOR6 := stDoorGrade[3];
      TCardGrade(CardDataList.Objects[nIndex]).DOOR7 := stDoorGrade[2];
      TCardGrade(CardDataList.Objects[nIndex]).DOOR8 := stDoorGrade[1];
    end else
    begin
      TCardGrade(CardDataList.Objects[nIndex]).DOOR1 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR2 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR3 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR4 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR5 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR6 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR7 := '0';
      TCardGrade(CardDataList.Objects[nIndex]).DOOR8 := '0';
    end;
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
  end;

end;

procedure TCommNode.SetOpen(const Value: Boolean);
var
  l_result : Integer;
  l_error: Integer;
  //l_version : Word;
  l_socket_address_in: tSockAddrIn;
  l_ip_z: array[0..255] of char;
  rset: TFDSet;
  t: TTimeVal;
  rslt: integer;
  stConnectIP : string;
begin
  if FOpen = Value then Exit;
  FOpen := Value;
  if SocketType = 2 then
  begin
    if Not Value then
      CommNodeWsDisconnect(self,WinSocket);
    Exit;
  end;
  stConnectIP := ConnectIP;
  if Value then
  begin
    //l_version:= $0101;
    l_result := wsaStartup(MAKEWORD(1, 1), l_wsa_data);
    if l_result <> 0 then
    begin
      Open := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    WinSocket:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    if WinSocket = INVALID_SOCKET then
    begin
      Open := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    l_result:= wsaAsyncSelect(WinSocket, Handle,
        wm_asynch_select,
        FD_CONNECT+ FD_READ+ FD_WRITE+ FD_CLOSE);

    FillChar(l_socket_address_in, sizeof(l_socket_address_in), 0);
    with l_socket_address_in do
    begin
      sin_family:= pf_Inet;
      // -- the requested service
      sin_port:= hToNs(ConnectPort);
      // -- the server IP address
      if Not IsIPTypeCheck(ConnectIP) then
      begin
        stConnectIP := GetIpFromDomain(ConnectIP);
      end;
      StrPCopy(l_ip_z, stConnectIP);
      sin_addr.s_Addr:= inet_addr(PAnsichar(AnsiString(l_ip_z)));
    end; // with m_socket_address_in
    l_result:= Connect(WinSocket, l_socket_address_in,
        sizeof(l_socket_address_in));
    if l_result<> 0 then
    begin
      l_error:= WSAGetLastError;
      if l_error <> wsaEWouldBlock then
      begin
        //LogSave(ExeFolder + '\..\log\Connectlog'+ FormatDateTIme('yyyymmdd',Now)+'.log',ConnectIP + 'OpenError' + inttostr(WinSocket));
        Open := False;
        Exit;  //소켓생성 실패 시에 Open False
      end else
      begin
      end;
      //LogSave(ExeFolder + '\..\log\Connectlog'+ FormatDateTIme('yyyymmdd',Now)+'.log',ConnectIP + 'Open' + inttostr(WinSocket));
    end;
  end else
  begin
    SocketConnected:= False;
    if WinSocket <> INVALID_SOCKET then
    begin
      //LogSave(ExeFolder + '\..\log\Connectlog'+ FormatDateTIme('yyyymmdd',Now)+'.log',ConnectIP + 'Close' + inttostr(WinSocket));
      shutdown(WinSocket,SD_BOTH);
      l_result:= CloseSocket(WinSocket);
      if l_result = 0 then
      begin
        WinSocket:= INVALID_SOCKET;
      end else
      begin
        WinSocket:= INVALID_SOCKET;
      end;
      if WSAISBlocking then WSACancelBlockingCall;  //--추가 20141215 충남대에서 에러 때문에 혹시나 해서...ㅠ.ㅠ
      WSACleanup;
    end;
  end;
end;

procedure TCommNode.handle_wm_async_select(var Msg: TMessage);
// -- wParam: hSocket, lo(lParam): notification, hi(lParam): error
      procedure handle_fd_connect_notification(p_socket: Integer);
      begin
        CommNodeWsConnect(Self,p_socket);
      end;

      procedure handle_fd_write_notification(p_socket: Integer);
      begin
        L_bSocketWriting := False; //전송 완료
        //
      end;

      procedure handle_fd_read_notification(p_socket: tSocket);
        var l_remaining: Integer;
            l_pt_start_reception: Pointer;
            l_packet_bytes: Integer;
            l_eol_position: Integer;
            stTemp : String;
        begin
          if l_c_reception_buffer = nil then Exit;

          with l_c_reception_buffer do
          begin
            l_remaining:= m_buffer_size- m_write_index;

            // -- if not at least a tcp-ip chunk, increase the room
            if l_remaining < k_tcp_ip_chunk then
            begin
              // -- reallocate
              double_the_capacity;
              l_remaining:= m_buffer_size- m_write_index;
            end;

            // -- add the received data to the current buffer
            l_pt_start_reception:= @ m_oa_byte_buffer[m_write_index];

            // -- get the data from the client socket
            //LogSave(ExeFolder + '\..\log\log'+ ConnectIP +'.log','RecvStart ');
            l_packet_bytes:= Recv(WinSocket, l_pt_start_reception^, l_remaining, 0);
            if l_packet_bytes < 0 then
            begin
              LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(Recv) '+ ConnectIP);
              CommNodeWsError(Self,p_socket,WSAGetLastError);
            end else
            begin
              m_write_index:= m_write_index+ l_packet_bytes;
              stTemp := ByteCopy(l_pt_start_reception,l_packet_bytes);
              //LogSave(ExeFolder + '\..\log\log'+ ConnectIP +'.log',stTemp);
              CommNodeTriggerAvail(Self,p_socket,stTemp,l_packet_bytes);
            end;
          end; // with g_c_reception_buffer

        end; // handle_fd_read_notification

      procedure handle_fd_close_notification(p_socket: Integer);
      var l_status: Integer;
          l_linger: TLinger;
          l_absolute_linger: array[0..3] of char absolute l_linger;
      begin
        if WSAIsBlocking
          then
            begin
              WSACancelBlockingCall;
            end;
        LastConnectedTime:= IncTime(Now,0,G_nNodeSocketReConnectTimeMM,15,0);   //15초 후에 재접속 시도 해 보자.
        Open := False;
        //LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(fd_close) -' + ConnectIP);
        (*
        ShutDown(p_socket, 2);
        l_linger.l_onoff:= 1;
        l_linger.l_linger:= 0;

        SetSockOpt(p_socket, Sol_Socket, So_Linger, pAnsichar(AnsiString(l_absolute_linger)), sizeof(l_linger));  //l_absolute_linger[0] -> AnsiString(l_absolute_linger) 으로 변경

        l_status:= CloseSocket(p_socket);
        WSACleanup;

        if l_status <> 0 then
        begin
          CommNodeWsDisconnect(Self,p_socket);
        end; *)
      end; // handle_fd_close_notification
var
  l_param: Integer;
  l_error, l_notification: Integer;
  l_socket_handle: Integer;
begin
    l_param:= Msg.lParam;
    l_socket_handle:= Msg.wParam;

    // -- extract the error and the notification code from l_param
    l_error:= wsaGetSelectError(l_param);
    l_notification:= wsaGetSelectEvent(l_param);

    if l_error <= wsaBaseErr then
    begin
        case l_notification of
          FD_CONNECT: handle_fd_connect_notification(l_socket_handle);
          FD_ACCEPT: {display_bug_stop('no_client_accept')} ;
          FD_WRITE: handle_fd_write_notification(l_socket_handle);
          FD_READ: handle_fd_read_notification(l_socket_handle);
          FD_CLOSE:
          begin
            LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(fd_close_EVENT) -' + ConnectIP);
            handle_fd_close_notification(l_socket_handle);
          end;
        end // case
    end else
    begin
      if l_notification= FD_CLOSE then
      begin
        LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(fd_close_ERR) -' + ConnectIP);
         handle_fd_close_notification(l_socket_handle);
      end
      else
      begin
         LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(SELECT) -'+ inttostr(l_notification) + '-' + ConnectIP);
         handle_fd_close_notification(l_socket_handle);
//        LastConnectedTime:= IncTime(Now,0,5,0,0);
//        LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(SELECT) -'+ inttostr(l_notification) + '-' + ConnectIP);
//        CommNodeWsError(Self,l_socket_handle,WSAGetLastError);
      end;
    end;
end;

function TCommNode.PutString(aData: string): Boolean;
var
  l_result: Integer;
  buf: array of Byte;
  nLen : integer;
  i : integer;
  FirstTickCount : Double;
begin
  Try
    FTCSDeviceSender.Enter;
    result := False;

    if WinSocket = INVALID_SOCKET then Exit;
    if Not Open then Exit;

    FirstTickCount := GetTickCount + 3000; //3초 대기
    While L_bSocketWriting do
    begin
      if Not Open then Exit;
      Application.ProcessMessages;
      sleep(1);
      if GetTickCount > FirstTickCount then Exit;  //3000밀리동안 응답 없으면 실패로 처리함
    end;//전송 중에는 보내지 말자.  => 전송 완료 메시지 이벤트가 발생 안되어 무용지물

    nLen := Length(aData);
    SetLength(buf, nLen);
    for i := 1 to nLen do
    begin
      buf[i-1] := ord(aData[i]);
    end;

    Try
      l_result:= Send(WinSocket,buf[0], nLen, 0);

      if l_result < 0 then
      begin
        if l_result = wsaEWouldBlock  then
        begin
          L_bSocketWriting := True;  //Socket에 Full 나면 Write
        end else
        begin
          LogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log','Error connect(Send) -'+ inttostr(l_result) + '-' + ConnectIP);
          CommNodeWsError(Self,WinSocket,WSAGetLastError);
        end;
      end;
    Except
      Exit;
    End;
    result := True;
  Finally
    FTCSDeviceSender.Leave;
  End;
end;

function TCommNode.HandleAllocated: Boolean;
begin
  Result := ( FHandle <> 0 );
end;

procedure TCommNode.HandleNeeded;
begin
  if not HandleAllocated
   then FHandle := AllocateHWND ( WndProc );
end;

function TCommNode.GetHandle: THandle;
begin
  HandleNeeded;
  Result := FHandle;
end;

procedure TCommNode.WndProc(var Message: TMessage);
begin
  Dispatch ( Message );
end;

procedure TCommNode.SetWinSockServerPacket(const Value: string);
begin
  FWinSockServerPacket := Value;
  DataPacektProcess(Value);
end;


procedure TDevice.SendCardDataExecute;
var
  stTemp : string;
  cCmd : char;
  stSendData : string;
  i : integer;
begin
  //CardDataSendSleepCount := CardDataSendSleepCount + 1;

    (*if Assigned(FOnSendData) then
  begin
    OnSendData(CommNode,'SendCardDataExecute1(' + inttostr(CardDataSendSleepCount) + ')',NodeNo);
  end;
  *)
  //if CardDataSendSleepCount < CARDDATA_SEND then Exit;

  //if OldSendTime + CARDDATA_SEND < now then Exit;     //카드 데이터 전송을 횟수로 세니까 들어오는 시간이 늦으면 너무 오래 있다가 전송되는 현상이 발생 됨. 일정한 시간 이후에 전송하도록 처리 함 20190528

  (*if Assigned(FOnSendData) then
  begin
    OnSendData(CommNode,'SendCardDataExecute2(' + inttostr(SendCardDataList1.Count) + '/' + inttostr(SendCardDataList2.Count) + ')',NodeNo);
  end;
  *)
  if SendCardDataList1.Count > 0 then   //먼저 보내야 할 카드데이터가 있으면... 보내자
  begin
    Try
      OldSendTime := now;
      //CardDataSendSleepCount := 0;
      stTemp := SendCardDataList1.Strings[0];
      SendCardDataList1.Delete(0);
      cCmd := stTemp[1];
      Delete(stTemp,1,1);
      stSendData := stTemp;
      SendPacket(cCmd,stSendData,True,-1);
    Except
      exit;
    End;
  end else if SendCardDataList2.Count > 0 then
  begin
    Try
      OldSendTime := now;
      //CardDataSendSleepCount := 0;
      stTemp := SendCardDataList2.Strings[0];
      SendCardDataList2.Delete(0);
      cCmd := stTemp[1];
      Delete(stTemp,1,1);
      stSendData := stTemp;
      SendPacket(cCmd,stSendData,True,-1);
    Except
      Exit;
    End;
  end else  //보낼 카드 데이터가 없으면 카드 리스트 중에서 수신을 못한 카드리스트를 메모리에 적재 시키자.
  begin
    CommNode.CardDataSendSleepCount := CARDDATA_SEND;   //보낼 카드 없으면 다음거 보내자.
    if L_bMemoryCardClear then Exit;
    if CardDataList.Count > 0 then
    begin
      L_nCardSendSeq := L_nCardSendSeq + 1;
      if L_nCardSendSeq > CardDataList.Count - 1 then L_nCardSendSeq := 0;

      for i := L_nCardSendSeq to CardDataList.Count - 1 do
      begin
        L_nCardSendSeq := i;
        if TCardGrade(CardDataList.Objects[i]).RcvState <> 'Y' then
        begin
          
          CD_Download(CardDataList.Strings[i],
                      TCardGrade(CardDataList.Objects[i]).ValidDay,
                      TCardGrade(CardDataList.Objects[i]).CARDTYPE,
                      TCardGrade(CardDataList.Objects[i]).RegCode,
                      TCardGrade(CardDataList.Objects[i]).TimeCode,
                      TCardGrade(CardDataList.Objects[i]).GRADE,
                      TCardGrade(CardDataList.Objects[i]).ArmAreaGrade,
                      TCardGrade(CardDataList.Objects[i]).DoorGrade,
                      TCardGrade(CardDataList.Objects[i]).CardGroup,
                      TCardGrade(CardDataList.Objects[i]).CardTimeCode,
                      TCardGrade(CardDataList.Objects[i]).CardWeekCode,
                      False,
                      strtoint(TCardGrade(CardDataList.Objects[i]).CardPositionNum),
                      TCardGrade(CardDataList.Objects[i]).CardPositionUse,
                      'S');
          break;
        end;
      end;
    end;
  end;

end;

procedure TDevice.CardDataSendPacket(aSendData: string; aSeq: integer);
begin
  if aSeq = 1 then SendCardDataList1.Add(aSendData)
  else if aSeq = 2 then SendCardDataList2.Add(aSendData);
end;

procedure TDevice.AntiPassGroup_Add(aDoorNo, aAntiGroupCode: integer);
var
  nIndex : integer;
begin
  if Not G_bGlobalAntiPass then Exit;
  DoorAntiGroup[aDoorNo] := aAntiGroupCode;
  if aAntiGroupcode = 0 then Exit;
  nIndex := DeviceAntiGropList.indexOf(inttostr(aAntiGroupcode));
  if nIndex < 0 then
  begin
    DeviceAntiGropList.Add(inttostr(aAntiGroupcode));
  end;
end;

procedure TDevice.DoorAntiGroupInitialize;
var
  i : integer;
begin
  DeviceAntiGropList.Clear;
  for i := LOW(DoorAntiGroup) to HIGH(DoorAntiGroup) do
  begin
    DoorAntiGroup[i] := 0;
  end;
end;

function TDevice.GetAntiGroup(aDoorNo: integer): integer;
begin
  result := 0;
  if aDoorNo < 1 then Exit;
  result := DoorAntiGroup[aDoorNo];
end;

function TDevice.CheckDoorMemoryGrade(aCardNo: string;
  aDoorNo: integer): integer;
var
  nIndex : integer;
begin
  result := -2; // 검색된 카드가 없다... DB에서 찾아 재전송 하자.
  if L_bMemoryCardClear then Exit;
  nIndex := CardDataList.IndexOf(aCardNo);
  if nIndex < 0 then Exit;
  if UpperCase(TCardGrade(CardDataList.Objects[nIndex]).GRADE) = 'N' then   //권한 없는 카드
  begin
    result := 0;
    Exit;
  end;
  case aDoorNo of
    1 : begin
      if isDigit(TCardGrade(CardDataList.Objects[nIndex]).DOOR1) then result := strtoint(TCardGrade(CardDataList.Objects[nIndex]).DOOR1)
      else result := 0;
    end;
    2 : begin
      if isDigit(TCardGrade(CardDataList.Objects[nIndex]).DOOR2) then result := strtoint(TCardGrade(CardDataList.Objects[nIndex]).DOOR2)
      else result := 0;
    end;
    3 : begin
      if isDigit(TCardGrade(CardDataList.Objects[nIndex]).DOOR3) then result := strtoint(TCardGrade(CardDataList.Objects[nIndex]).DOOR3)
      else result := 0;
    end;
    4 : begin
      if isDigit(TCardGrade(CardDataList.Objects[nIndex]).DOOR4) then result := strtoint(TCardGrade(CardDataList.Objects[nIndex]).DOOR4)
      else result := 0;
    end;
    5 : begin
      if isDigit(TCardGrade(CardDataList.Objects[nIndex]).DOOR5) then result := strtoint(TCardGrade(CardDataList.Objects[nIndex]).DOOR5)
      else result := 0;
    end;
    6 : begin
      if isDigit(TCardGrade(CardDataList.Objects[nIndex]).DOOR6) then result := strtoint(TCardGrade(CardDataList.Objects[nIndex]).DOOR6)
      else result := 0;
    end;
    7 : begin
      if isDigit(TCardGrade(CardDataList.Objects[nIndex]).DOOR7) then result := strtoint(TCardGrade(CardDataList.Objects[nIndex]).DOOR7)
      else result := 0;
    end;
    8 : begin
      if isDigit(TCardGrade(CardDataList.Objects[nIndex]).DOOR8) then result := strtoint(TCardGrade(CardDataList.Objects[nIndex]).DOOR8)
      else result := 0;
    end;
    else begin
      result := 0;
    end;
  end;
end;

function TDevice.ServerDoorControl(aReaderNo, aDoorNo, aKey, aCardNo,
  aAuth,aVoice: string): integer;
var
  xCardNo : string;
  nCardLength : integer;
  nCardFixType : integer;
  stServerControlData : string;
begin

  if Not Connected then
  begin
    result := NOTDEVICECONNECT;
    Exit;
  end;

  nCardFixType := CommNode.CardFixType;

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

  stServerControlData := 'CD90' +
                            ECUID +
                            FillZeroStrNum(aReaderNo,2) +
                            FillZeroStrNum(aDoorNo,2) +
                            Ascii2Hex(aKey) +
                            aAuth +
                            xCardNo +
                            aVoice;
                            //FillZeroNumber(aVoice,3);

  SendPacket('R',stServerControlData,True,-1);
  result := SUCCESSDEVICESEND;
end;

function TDevice.GetAntiGroupCount: integer;
begin
  result := DeviceAntiGropList.Count;
end;

function TDevice.GetDeviceAntiGroup(aIndex: integer): integer;
begin
  if aIndex > DeviceAntiGropList.Count - 1 then Exit;
  result := strtoint(DeviceAntiGropList.Strings[aIndex]);
end;

procedure TDevice.SetDoorScheduleUse(const Value: Boolean);
begin
  if FDoorScheduleUse = Value then Exit;
  FDoorScheduleUse := Value;
end;

procedure TDevice.SearchDevicecode;
begin
  SendPacket('R','VR01');
end;

procedure TCommNode.NodeDisConnectedCheckTimerTimer(Sender: TObject);
begin
  NodeDisConnectedCheckTimer.Enabled := False;
  if SocketConnected then Exit;
  OldConnected := 0;
  if Assigned(FOnConnected) then
  begin
    OnConnected(Self,SocketConnected,NO,1);   //재접속 시도 시간을 초과 하면 'NF'를 만들자.
  end;
end;

procedure TDevice.Control_DoorPNModeChange(aDoorNo, aMode: Char;
  aQuick: Boolean);
var
  st: string;
begin
  st:= 'C' +
       //IntToStr(Send_MsgNo)+                       //Msg Count
       '0'+
       aDoorNo+                             //기기내 문번호
       '0'+
       '1'+                              //'0':해당사항없음,'1':카드운영,'2':출입운영,'3':원격제어
       aMode;                                  // 카드운영:Positive:'0',Negative:'1'
  SendPacket('c',st,aQuick);
end;

procedure TDevice.SetArmAreaDisArmCheckTime1From(aArmArea: integer;
  aArmAreaDisArmTime1From: string);
begin
  if aArmArea > HIGH(ArmAreaDisArmCheckTime1From) then Exit;
  ArmAreaDisArmCheckTime1From[aArmArea] :=  aArmAreaDisArmTime1From;
end;

procedure TDevice.SetArmAreaDisArmCheckTime1To(aArmArea: integer;
  aArmAreaDisArmTime1To: string);
begin
  if aArmArea > HIGH(ArmAreaDisArmCheckTime1To) then Exit;
  ArmAreaDisArmCheckTime1To[aArmArea] :=  aArmAreaDisArmTime1To;
end;

procedure TDevice.SetArmAreaDisArmCheckUse(aArmArea: integer;
  aArmAreaDisArmUseCheck: string);
var
  nArmAreaDisArmUse : integer;
begin
  if aArmArea > HIGH(ArmAreaDisArmCheckUse) then Exit;
  if Not isDigit(aArmAreaDisArmUseCheck) then nArmAreaDisArmUse := 0
  else nArmAreaDisArmUse := strtoint(aArmAreaDisArmUseCheck);
  if ArmAreaDisArmCheckUse[aArmArea] = nArmAreaDisArmUse then Exit;
  ArmAreaDisArmCheckUse[aArmArea] := nArmAreaDisArmUse;
  if nArmAreaDisArmUse = 1 then ArmAreaDisArmCheckTimer.Enabled := True;
end;

procedure TDevice.ArmAreaDisArmCheckTimerTimer(Sender: TObject);
var
  i : integer;
begin
  if L_bDeviceDestroy then Exit;
  for i := 0 to HIGH(ArmAreaDisArmCheckUse) do
  begin
    if ArmAreaDisArmCheckUse[i] = 1 then //미경계 신호 알람 사용중이면
    begin
      ArmAreaDisArmEventCheck(i);      
    end;
  end;
end;

procedure TDevice.ArmAreaDisArmEventCheck(aArmAreaNo: integer);
var
  stStartTime : string;
  stEndTime : string;
  stNowTime : string;
begin
  stStartTime := ArmAreaDisArmCheckTime1From[aArmAreaNo];
  stEndTime := ArmAreaDisArmCheckTime1To[aArmAreaNo];
  if stStartTime = stEndTime then Exit;
  stNowTime := FormatDateTime('hhnnss',now);
  if stStartTime > stEndTime then
  begin
    if (stStartTime <= stNowTime) or (stNowTime <= stEndTime) then
    begin
      if ArmAreaState[aArmAreaNo] <> cmArm then
         ArmAreaDisArmCreate(aArmAreaNo);
    end else
    begin
      ArmAreaDisArmClear(aArmAreaNo);
    end;
  end else
  begin
    if (stStartTime <= stNowTime) and (stNowTime <= stEndTime) then
    begin
      if ArmAreaState[aArmAreaNo] <> cmArm then
         ArmAreaDisArmCreate(aArmAreaNo);
    end else
    begin
      ArmAreaDisArmClear(aArmAreaNo);
    end;

  end;
end;

procedure TDevice.ArmAreaDisArmClear(aArmAreaNo: integer);
begin
  ArmAreaDisArmEvent[aArmAreaNo] := 0;
end;

procedure TDevice.ArmAreaDisArmCreate(aArmAreaNo: integer);
begin
  if ArmAreaDisArmEvent[aArmAreaNo] = 1 then Exit; //이미 알람 발생 했다.
  ArmAreaDisArmEvent[aArmAreaNo] := 1;
  //여기에서 미경계 알람 발생 시키자.
  if Assigned(FOnDeviceArmAreaDisArmEvent) then
  begin
    OnDeviceArmAreaDisArmEvent(self,NodeNo,ECUID,inttostr(aArmAreaNo));
  end;
end;

function TDevice.MonthHoliday(aDoorNo, aMonth: integer;
  aHoliday: string): Boolean;
var
  stData :string;
  FirstTickCount : Double;
begin
  result := False;
  if Not Connected then Exit;
  HolidaySendRecv[aMonth][aDoorNo] := 1; //현재 전송중이다... 수신하면 0 으로 바뀐다.

//  if Not HO2USE then aHoliday := StringReplace(aHoliday,'4','3',[rfReplaceAll]); //굳이 변경 하지 않아도 됨 장비에서 0 이 아니면 특정일로 등록 함
//  if Not HO3USE then aHoliday := StringReplace(aHoliday,'5','3',[rfReplaceAll]);

  stData := 'Q' + //조회'R'
            '0' + //정상 0 에러 1
            inttostr(aDoorNo) + //0:전체,1:1번문,2:2번문
            ' ' + //스페이스
            'A' + //A:추가,D삭제,W:전체삭제
            FillZeroNumber(aMonth,2) + //'00' + //MMDD
            aHoliday;  //'3' : 특정일 데이터
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

procedure TDevice.MemoryCardClear;
var
  i : integer;
begin
  L_bMemoryCardClear := True;
  for i := CardDataList.Count - 1 downto 0 do
  begin
    if TCardGrade(CardDataList.Objects[i]).RcvState = 'Y' then
    begin
      TCardGrade(CardDataList.Objects[i]).Free;
      CardDataList.Delete(i);
    end;
  end;
  L_bMemoryCardClear := False;
end;

procedure TDevice.Search_PortState;
begin
  SendPacket('R','SM10');
end;

procedure TDevice.Search_ZoneExtendPortState;
begin
  SendPacket('R','SM11');
end;

procedure TDevice.ScheduleDoorModeChange(aDoor, aDoorMode, aSchUse,aFireUse: string);
var
  stData: string;
begin
  stData := 'b' + //'A' +                       //MSG Code
    '1' +                              //Msg Count(고정)
    aDoor +                //문번호
    #$20 + #$20 +                      // Record count
    '*' +              //카드운영모드
    aDoorMode +              //출입문 운영모드
    '*' +          //Door제어 시간
    '*' +          //장시간 열림 경보
    aSchUse +           //스케줄 적용유무
    '*' +         //출입문상태전송
    '0' +                              //통신이상시 기기운영(사용안함:고정)
    '0' +                              //AntiPassBack(사용안함:고정)
    '*' +          //장시간 열림 부저출력
    '0' +                              //통신 이상시 부저 출력 (사용안함:고정)
    '*' +              //전기정 타입
    aFireUse +         //화재 발생시 문제어
    '0' +                              //DS LS 검사(사용안함:고정)
    '*' +           //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
    '*' +  //원격해제시 (DoorOpen 0x30,DoorClose 0x31)
    '00000';                           //예비


  SendPacket('c',stData,True);
end;

procedure TDevice.CardDownLoadClear;
begin
  SendCardDataList1.Clear;
  SendCardDataList2.Clear;
end;

procedure TDevice.SetCardBufferFull(const Value: Boolean);
begin
  if FCardBufferFull = Value then Exit;
  FCardBufferFull := Value;
  if Assigned(FOnRcvCardBufferFull) then
  begin
    if Value then OnCardBufferFull(Self,'1',NodeNO)
    else OnCardBufferFull(Self,'0',NodeNO);
  end;
end;

end.
