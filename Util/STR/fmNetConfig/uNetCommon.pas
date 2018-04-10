unit uNetCommon;

interface

uses
  SysUtils, Classes, DB, dbisamtb,Windows,Forms;

type CString = string[100];

type
  TZoneStatus = Class(TComponent)
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FOnParentStatus: string;
    FOnStatusCode: string;
    FOnStatusName: string;
    procedure SetParentStatus(const Value: string);
    procedure SetStatusCode(const Value: string);
    procedure SetStatusName(const Value: string);
  published
    property ParentStatus:string Read FOnParentStatus write SetParentStatus;
    property StatusCode:string Read FOnStatusCode write SetStatusCode;
    property StatusName:string Read FOnStatusName write SetStatusName;
  end;

type
  TPanelMessage = procedure(Sender: TObject;  aMessage:string) of object; //메시지 전송 폼
  TNodeConnect = procedure(Sender: TObject;  aConnected:Boolean) of object; //
  TECUConnect = procedure(Sender: TObject; aEcuID:string; aConnected:Boolean) of object;
  TPacketView = procedure(Sender: TObject;  aSendingData,aType:string) of object;
  TReceivePacket = procedure(Sender: TObject;  aReceiveData:string) of object;
  TServerModeConnect = procedure(Sender:TObject) of object;
  //알람이벤트
  TAlarmEvent = procedure(Sender: TObject;  aECUID,aTime,aSubCLass,aSubAddr,aZone,
                          aMode,aStatus,aLoop,aState,aOper:string) of object;
  //등록 이벤트
  TDeviceIDSetting = procedure(Sender: TObject;  aECUID,aDeviceID:string) of object;
  TCardReaderSetting = procedure(Sender: TObject;  aECUID,aReaderNo,aUsedCR,
                       aCRPosition,aDoorNo,aLocate,aBuildingPosi:string) of object;
  TSystemSetting = procedure(Sender: TObject;  aECUID,aPowerWatch,aOutDelay,
                       aDoor1Type,aDoor2Type,aLocate,aInDelay,aLockExtend:string) of object;
  TLampSirenOnOff = procedure(Sender: TObject;  aECUID,stLampOnOff,aSirenOnOff:string) of object;
  TLampTime = procedure(Sender: TObject;  aECUID,aLampTime:string) of object;
  TSirenTime = procedure(Sender: TObject;  aECUID,aSirenTime:string) of object;
  TPortSetting = procedure(Sender: TObject;  aECUID,aPort,aWatchType,aAlarmType,
                          aRecoverType,aDelayTimeType,aPortLocate,aDetectTime:string) of object;
  TDeviceUsedSetting = procedure(Sender: TObject;  aECUID,aDeviceUsed:string) of object;
  TWiznetInfoSetting = procedure(Sender: TObject;  aECUID,aHeader,aMacAddress,aMode,
                          aIPAddress,aSubnet,aGateway,aClientPort,aServerIP,aServerPort,
                          aSerial_Baud,aSerial_data,aSerial_Parity,aSerial_stop,
                          aSerial_flow,aDelimiterChar,aDelimiterSize,aDelimitertime,
                          aDelimiterIdle,aDebugMode,aROMVer,aOnDHCP,aReserve:string) of object;
  TCardReaderTypeSetting = procedure(Sender: TObject;  aECUID,aCardReaderType:string) of object;
  TDeviceState = procedure(Sender: TObject;  aECUID,aCmd,aData:string) of object;
  TCCCSetting = procedure(Sender:TObject; aEcuID,aData:String) of object;
  //원격제어
  TDeviceTime = procedure(Sender: TObject;  aECUID,aTime:string) of object;
  TDeviceType = procedure(Sender: TObject;  aECUID,aDeviceType:string) of object;
  TSystemFunction = procedure(Sender: TObject;  aECUID:string;
                          aJavaraCloseCommand,aJavaraOpenCommand,aFireServerCommand:Boolean) of object;
  TDeviceVersion = procedure(Sender: TObject;  aECUID,aDeviceVersion:string) of object;
  TCardReaderVersion = procedure(Sender: TObject;  aECUID,aCardReaderNo,aCardReaderVersion:string) of object;
  TDeviceReset = procedure(Sender: TObject;  aECUID:string) of object;
  TCardListSearch = procedure(Sender: TObject;  aECUID,aData:string) of object;
  TEcuState = procedure(Sender: TObject;  aECUID,aData:string) of object;
  TCardGrade = procedure(Sender:TObject; aEcuID,aData:string) of object;
  //출입통제이벤트
  TCardAccessEvent = procedure(Sender: TObject;  aECUID,aDoorNo,aReaderNo,aInOut,aTime,
                          aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,
                          aATButton,stCardNo:string) of object;
  TDoorEvent = procedure(Sender: TObject;  aECUID,aDoorNo,aReaderNo,aInOut,aTime,
                          aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState:string) of object;
  TDoorSettingEvent = procedure(Sender: TObject;  aECUID,aDoorNo,aCardMode,aDoorMode,
                          aDoorControlTime,aLongDoorOpenTime,aSchedule,aDoorState,
                          aNetFailRun,aAntiPass,aLongDoorOpenUse,aNetFailAlarm,
                          aDoorLockType,aFireDoorControl,aLockState,aDoorOpenState,
                          aRemoteDoorOpen:string) of object;
  TDoorState  = procedure(Sender: TObject;  aECUID,aDoorNo,aCardMode,aDoorMode,aDoorState:string) of object;
  TCardRegist  = procedure(Sender: TObject;  aECUID,aDoorNo,aCmdState,aCardType,
                          aCardNo,aExpireDate,aRegResult,aCardAuth,aTimeMode:string) of object;
  TScheduleSetting = procedure(Sender: TObject;  aECUID,aDoorNo,aCmd,aDayOfWeek,a1ModeTime,a1Mode,
                          a2ModeTime,a2Mode,a3ModeTime,a3Mode,a4ModeTime,a4Mode,
                          a5ModeTime,a5Mode:string) of object;
  THolidaySetting = procedure(Sender: TObject;  aECUID,aDoorNo,aMonth,aDate:string) of object;
 
  TdmCommon = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  STX = #$2;
  ETX = #$3;
  ENQ = #$5;
  ACK = #$6;
  NAK = #$15;
  EOT = #$04;
  TAB = #$09;
  HexString : String = '0123456789ABCDEF';

const PORTOPENFAIL = -1;
const PORTCONNECTFAIL = 0;
const PORTCONNECTED = 1;
const
  DELAYTIME = 3000;
  USEDDEVICE = 16;
  BROADSERVERPORT = 5001 ;
  BROADCLIENTPORT = 1460 ;
  TCPCLIENTPORT = 1461 ;
  MAX_COMPORT = 35;
  
const MCUNAME = 'MCU100';
      ECUNAME = 'ECU100';
      ICUNAME = 'ICU100';
const ECUTYPE = 'ECU';
      ICUTYPE = 'ICU';


var
  dmCommon: TdmCommon;
  //전문 생성
  RecvMsgNo : string; //수신메시지번호
  SendMsgNo : integer = 0; //송신메시지번호

  // KT-TELECOP 용과 S-TEC 용 구분하기 위함
  //{
  G_nIDLength : integer = 17;
  G_stDeviceVer : string = 'ST'; //전문 버젼 정보
  G_nProgramType : integer = 1; //0 : KTTelecop,1:S-TEC
  G_nCardType : integer = 2;  // 0: 4Byte 숫자,1:KT사옥,2:대학교
  G_nHolidayCount : integer =  5;
  //}
  {
  G_nIDLength : integer = 7;
  G_stDeviceVer : string = 'K1'; //전문 버젼 정보
  G_nProgramType : integer = 0; //0 : KTTelecop,1:S-TEC
  G_nCardType : integer = 0;  // 0: 4Byte 숫자,1:KT사옥,2:대학교
  G_nHolidayCount : integer =  3;
  //}
  G_nDelayTime : integer = 1000;  //기기전송 후 대기 시간
  G_stTCPConf : string;    //TCPIP,TCPPort
  G_nComPort : integer;    //시리얼 포트
  G_nLoopCount : integer ; //에러 대기 횟수
  G_nLANTime : integer;
  G_nLANLoop : integer;
  G_nConnectMode : Integer; //0:TCP,1:RS232
  G_nServerMode : integer;  //0:클라이언트모드 1:서버모드
  G_bDeviceConnected : Boolean; //기기 연결 상태

  G_bDeviceSearch : Boolean;  //기기선택시 기기정보 조회
  G_bRealRegist : Boolean;    //실시간 기기 등록

  G_nCardReaderNumber :integer = 8; //카드리더 갯수
  G_nPortNumber :integer = 12; //존 갯수
  G_nDoorNumber :integer = 2; //출입문 갯수

  G_bFireDevice: Array [0..100] of Boolean;     //화재발생기기
  G_bCardReaderUse: Array [0..8] of Boolean;  //카드리더 사용 유무 체크

  ZoneStatusList : TStringList; //존구분 리스트
  ZoneDetailList : TStringList; //존상태 세부 구분 리스트

  G_bApplicationTerminate : Boolean; //Application 종료 여부

  G_nMCMode : integer;

//{$DEFINE DEBUG}


implementation

{$R *.dfm}

{ TZoneStatus }

constructor TZoneStatus.Create(AOwner: TComponent);
begin
  inherited;
//
end;

destructor TZoneStatus.Destroy;
begin
//
  inherited;
end;

procedure TZoneStatus.SetParentStatus(const Value: string);
begin
  FOnParentStatus := Value;
end;

procedure TZoneStatus.SetStatusCode(const Value: string);
begin
  FOnStatusCode := Value;
end;

procedure TZoneStatus.SetStatusName(const Value: string);
begin
  FOnStatusName := Value;
end;

end.
