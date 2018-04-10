unit uSocket;

interface

uses
  SysUtils, Classes, AdStatLt, OoMisc, AdPort, AdWnPort,
  Dialogs,AdSocket,Windows,Forms,
  uCommon, ExtCtrls;

type
  TCurrentDeviceState = Class(TComponent)
  private
    DoorUse: Array [0..MAXDOORNO] of string; //0 미사용,1 사용
    DoorState: Array [0..MAXDOORNO] of TDoorDSState;
    DoorLockState: Array [0..MAXDOORNO] of TDoorLockState;
    DoorFire: Array [0..MAXDOORNO] of string; //0 정상,1 화재발생
    DoorPNMode: Array [0..MAXDOORNO] of TDoorPNMode;
    DoorManageMode: Array [0..MAXDOORNO] of TDoorManageMode;
    DoorUseType: Array [0..MAXDOORNO] of string; //0:방범전용,1:출입전용,2:방범+출입
    ReaderUse: Array [0..MAXREADERNO] of string; //0 미사용,1 사용
    ReaderDoorNo : Array[0..MAXREADERNO] of string; // 리더별 출입문 번호
    ReaderVersion : Array[0..MAXREADERNO] of string; //리더 버젼 정보
    ReaderConnectionState : Array[0..MAXREADERNO] of string; //0 통신안됨,1:통신성공
    FECUID: string;
    FConnected: Boolean;
    FDoor1Fire: Boolean;
    FDeviceCode: string;
    FDeviceType: string;
    FDeviceVersion: string;
    FAlarmMode: TWatchMode;
    FOnDeviceChange: TDeviceChange;
    FOnConnected: TDeviceChange;
    FOnAlarmModeChange: TDeviceChange;
    FOnDoorTypeChange: TDeviceChange;
    FOnDoorStateChange: TDeviceChange;
    FOnReaderUseChange: TDeviceChange;
    FOnReaderConnectChange: TDeviceChange;
    FOnDeviceCodeChange: TDeviceChange;
    FOnDeviceTypeChange: TDeviceChange;
    FMaxDoorNo: integer;
    FMaxReaderNo: integer;
    FMaxPortNo: integer;
    FCDMAUse: Boolean;
    FDVRUse: Boolean;
    FCardType: string;
    FOnDvrUseChange: TDeviceChange;
    FCARDREADERTELUse: Boolean;
    FOnCARDREADERTELUseChange: TDeviceChange;
    FOnCardTypeChange: TDeviceChange;
    FOnCDMAUseChange: TDeviceChange;
    procedure SetConnected(const Value: Boolean);
    procedure SetAlarmMode(const Value: TWatchMode);
    procedure SetDeviceCode(const Value: string);
    procedure SetDeviceType(const Value: string);
    procedure SetDeviceVersion(const Value: string);
    procedure SetCDMAUse(const Value: Boolean);
    procedure SetDVRUse(const Value: Boolean);
    procedure SetCardType(const Value: string);
    procedure SetCARDREADERTELUse(const Value: Boolean);
  private
    procedure DoorUseInitialize;
    procedure DoorStateInitialize;
    procedure DoorLockStateInitialize;
    procedure DoorFireInitialize;
    procedure DoorPNModeInitialize;
    procedure DoorManageModeInitialize;
    procedure ReaderUseInitialize;
    procedure ReaderDoorNoInitialize;
    procedure ReaderVersionInitialize;
    procedure ReaderConnectionStateInitialize;
  published
    Property ECUID : string read FECUID write FECUID;
    property Connected : Boolean read FConnected write SetConnected;
    property AlarmMode : TWatchMode read FAlarmMode write SetAlarmMode;
    property DeviceCode : string read FDeviceCode write SetDeviceCode;
    property CardType : string read FCardType write SetCardType;
    property DeviceVersion : string read FDeviceVersion write SetDeviceVersion;
    property DeviceType : string read FDeviceType write SetDeviceType;
    Property MaxDoorNo : integer read FMaxDoorNo write FMaxDoorNo;
    Property MaxReaderNo : integer read FMaxReaderNo write FMaxReaderNo;
    Property MaxPortNo : integer read FMaxPortNo write FMaxPortNo;
    property CDMAUse : Boolean read FCDMAUse write SetCDMAUse;
    property DVRUse : Boolean read FDVRUse write SetDVRUse;
    property CARDREADERTELUse : Boolean read FCARDREADERTELUse write SetCARDREADERTELUse;
  published
    property OnDeviceChange :TDeviceChange read FOnDeviceChange write FOnDeviceChange;  //View Refresh
    property OnConnected :TDeviceChange read FOnConnected write FOnConnected;           //ECU 의 연결상태 표시
    property OnAlarmModeChange :TDeviceChange read FOnAlarmModeChange write FOnAlarmModeChange; //방범상태 표시
    property OnDoorTypeChange :TDeviceChange read FOnDoorTypeChange write FOnDoorTypeChange;    //출입문 타입변경에 따른 출입문상태 조회 및 View Refresh
    property OnDoorStateChange :TDeviceChange read FOnDoorStateChange write FOnDoorStateChange; //출입문 상태 표시
    property OnReaderUseChange :TDeviceChange read FOnReaderUseChange write FOnReaderUseChange; //리더 사용시 리더 버젼 정보 조회
    property OnReaderConnectChange :TDeviceChange read FOnReaderConnectChange write FOnReaderConnectChange; //리더 통신 상태 변경
    property OnDeviceCodeChange :TDeviceChange read FOnDeviceCodeChange write FOnDeviceCodeChange;
    property OnDeviceTypeChange :TDeviceChange read FOnDeviceTypeChange write FOnDeviceTypeChange;
    property OnCDMAUseChange :TDeviceChange read FOnCDMAUseChange write FOnCDMAUseChange;
    property OnDvrUseChange :TDeviceChange read FOnDvrUseChange write FOnDvrUseChange;
    property OnCARDREADERTELUseChange :TDeviceChange read FOnCARDREADERTELUseChange write FOnCARDREADERTELUseChange;
    property OnCardTypeChange :TDeviceChange read FOnCardTypeChange write FOnCardTypeChange;


  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    function GetDoorUsed(aDoorNo:integer):Boolean;
    function GetDoorState(aDoorNo:integer):TDoorDSState;
    function GetDoorPNMode(aDoorNo:integer):TDoorPNMode;
    function GetDoorManagerMode(aDoorNo:integer):TDoorManageMode;
    function GetReaderUse(aReaderNo:integer):Boolean;
    function GetReaderDoor(aReaderNo:integer):integer;
    function GetReaderConnectState(aReaderNo:integer):Boolean;
    function GetReaderVersion(aReaderNo:integer):string;
  public
    procedure SetReaderInfo(aReaderNo,aUsedCR,aCRPosition,aDoorNo,aLocate, aBuildingPosi:string);
    procedure SetDoorType(aDoorNo:integer;aDoorType:string);
    procedure SetDoorState(aDoorNo, aCardMode,aDoorMode, aDoorState,aDoorSchedule:string);
    procedure SetReaderVersion(aCardReaderNo, aCardReaderVersion:string);
    procedure setReaderConnected(nReaderNo:integer;aConnected:Boolean);
    procedure setDeviceConnected(aConnected:Boolean);
  end;

  TSocketECUState = Class(TComponent)
  private
    FConnected: Boolean;
    FECUID: string;
  published
    Property ECUID : string read FECUID write FECUID;
    Property Connected : Boolean read FConnected write FConnected;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TdmSocket = class(TDataModule)
    Commport: TApdWinsockPort;
    SendTimer: TTimer;
    procedure CommportWsConnect(Sender: TObject);
    procedure CommportWsDisconnect(Sender: TObject);
    procedure CommportWsError(Sender: TObject; ErrCode: Integer);
    procedure CommportWsAccept(Sender: TObject; Addr: TInAddr;
      var Accept: Boolean);
    procedure CommportTriggerAvail(CP: TObject; Count: Word);
    procedure SendTimerTimer(Sender: TObject);
    procedure CommportTriggerOutSent(Sender: TObject);
  private
    FSocketConnected: Boolean;
    FOnPanelMessage: TPanelMessage;
    FOnNodeConnect: TNodeConnect;
    FOnPacketView: TPacketView;
    FServerMode: Integer;
    FConnectMode: Integer;
    FSocketCOM: integer;
    FSocketAddress: String;
    FSocketPort: String;
    FNodeConnected: Boolean;
    FOnReceivePacket: TReceivePacket;
    FDeviceID: string;
    FOnAlarmEvent: TAlarmEvent;
    FOnCardAccessEvent: TCardAccessEvent;
    FOnDoorEvent: TDoorEvent;
    FOnDoorSettingEvent: TDoorSettingEvent;
    FOnCardRegist: TCardRegist;
    FOnDoorState: TDoorState;
    FOnHolidaySetting: THolidaySetting;
    FOnScheduleSetting: TScheduleSetting;
    FOnDeviceIDSetting: TDeviceIDSetting;
    FOnCardReaderSetting: TCardReaderSetting;
    FOnSystemSetting: TSystemSetting;
    FOnLampSirenOnOff: TLampSirenOnOff;
    FOnLampTime: TLampTime;
    FOnSirenTime: TSirenTime;
    FOnPortSetting: TPortSetting;
    FOnDeviceUsedSetting: TDeviceUsedSetting;
    FOnWiznetInfoSetting: TWiznetInfoSetting;
    FOnCardReaderTypeSetting: TCardReaderTypeSetting;
    FOnDeviceState: TDeviceState;
    FOnDeviceTime: TDeviceTime;
    FOnDeviceType: TDeviceType;
    FOnSystemFunction: TSystemFunction;
    FOnDeviceVersion: TDeviceVersion;
    FOnCardReaderVersion: TCardReaderVersion;
    FOnDeviceReset: TDeviceReset;
    FOnECUConnect: TECUConnect;
    FOnServerModeConnect: TServerModeConnect;
    FOnEcuState: TEcuState;
    FOnCardGrade: TCardGrade;
    FOnCDMASetting: TCCCSetting;
    FOnCCCInfoSetting: TCCCSetting;
    FOnCCCTimeInterval: TCCCSetting;
    FOnCCCStartTime: TCCCSetting;
    FOnDeviceCode: TDeviceType;
    FOnKTTSystemID: TEcuState;
    FOnKTTTelNumber: TDeviceState;
    FOnKTTRingCount: TDeviceState;
    FOnArmDsCheck: TDeviceState;
    FOnArmRelayCheck: TDeviceState;
    FOnDVRUseSetting: TCCCSetting;
    FOnDVRInfoSetting: TCCCSetting;
    FOnCARDREADERTelNumber: TDeviceState;
    FFTPUSE: Boolean;
    FOnGageMonitor: TDeviceState;
    FOnFirmwareProcess: TDeviceState;
    FOnFirmwareProcess2: TDeviceState;
    FOnPTMonitoringProcess: TDeviceState;
    FKTT812FirmwareDownLoadType: Boolean;
    FKTT812FirmwareStarting: Boolean;
    FOnKTT812FlashDataEvent: TEcuState;
    FOnKTT812FlashDataEndEvent: TEcuState;
    FSocketOutSenting: Boolean;
    FKTT812BroadFirmWareStarting: Boolean;
    FOnKTT812EcuFirmWareDownloadComplete: TEcuState;
    FOnConnectError: TNodeConnect;
    FOnKTT811FTPFirmWareDownloadComplete: TEcuState;
    procedure SetServerMode(const Value: Integer);
    procedure SetConnectMode(const Value: Integer);
    procedure SetSocketAddress(const Value: String);
    procedure SetSocketCOM(const Value: integer);
    procedure SetSocketPort(const Value: String);
    procedure SetNodeConnected(const Value: Boolean);
    procedure SetSocketConnected(const Value: Boolean);
    procedure SetDeviceID(const Value: string);
    procedure setFTPUSE(const Value: Boolean);
  private
    FirstSendDataList : TStringList;
    QuickSendDataList : TStringList;
    ReserveSendDataList : TStringList;
    ConnectDeviceList : TStringList;
    EcuStateDeviceList : TStringList;

    L_DeviceBuffer : string;
    L_bSocketConnecting : Boolean;
    L_stReceiveHoliday : string;
    L_bDecoderFormat : Boolean;
    L_bKTT812DownloadFormat:Boolean;
    L_bSending : Boolean;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Private declarations }
    procedure AlarmVariable_Initialize;
    procedure ECUListAdd(aEcuID:string);
    procedure ECUListDelete(aEcuID:string);
  private
    Function ComPort9600Connect:integer;
    Function ComPort38400Connect:integer;
  private
    Function SendPacket(aEcuID,aCmd,aData,aVer:string;aQuick:Boolean=False;aPriority:integer=2):Boolean;
    Function SocketPutString(aData:string):Boolean;
    Function DataPacketProcess(aPacketData:string):Boolean;
    function KTT812DataPacektProcess( aPacketData: string):Boolean;
    function CheckKTT812FirmwareDataPacket(aData: String; var bData:String;var aPacketData:string):integer;
    procedure RcvKTT812FirmWareDownload(aEcuID,aGubun,aRealData:string);
  public
    Function ECUConnected(aEcuID:string;aConnected:Boolean):Boolean;
  private
    //수신 패킷 분석
    procedure  DeviceRcvAlarmData(aECUID,aVer,aRealData:string);
    procedure  DeviceRcvAlarmSearchData(aECUID,aVer,aRealData:string);
    //등록 포맷
    procedure  RegDataProcess(aECUID,aVer,aRealData:string);
    procedure  RcvDeviceID(aECUID,aVer, aRealData:string); //기기ID등록조회
    procedure  RcvCardReader(aECUID,aVer, aRealData:string); //카드리더 등록조회
    procedure  RcvSysinfo(aECUID,aVer, aRealData:string);    //시스템 정보 등록조회
    procedure  RcvRelay(aECUID,aVer, aRealData:string);      //릴레이정보 등록조회
    procedure  RcvLampState(aECUID,aVer,aRealData:string);   //림프 설정 정보
    procedure  RcvPort(aECUID,aVer, aRealData:string);       //Loop(존)정보 등록조회
    procedure  RcvUsedAlarmdisplay(aECUID,aVer, aRealData:string); //알람표시기 등록조회
    procedure  RcvUsedDevice(aECUID,aVer, aRealData:string); //확장기 사용정보
    procedure  RcvDeviceType(aECUID,aVer,aRealData:string);
    procedure  RcvWiznetInfo(aECUID,aVer, aRealData:string); //네트웍정보
    procedure  RcvControlDialInfo(aECUID,aVer, aRealData:string);
    procedure  RcvKTTSystemId(aECUID,aVer, aRealData:string);   //관제 시스템아이디
    procedure  RcvKTTTelNo(aECUID,aVer, aRealData:string);      //관제 데코더 전화번호
    procedure  RcvCardReaderTelNo(aECUID,aVer, aRealData:string);      //카드리더 전화번호
    procedure  RcvCardType(aECUID,aVer, aRealData:string);   //카드타입
    procedure  RcvRingCount(aECUID,aVer, aRealData:string);  //
    procedure  DeviceState1Show(aECUID,aVer, aRealData:string);  //기기의 현재 상태 조회
    procedure  DoorLockState(aECUID,aVer, aRealData:string);  //락 상태 조회
    procedure  ZoneStateShow(aECUID,aVer, aRealData:string);
    procedure  ZoneSensState(aECUID,aVer, aRealData:string); //기기 이상 상태
    procedure  RcvFireRecovery(aECUID,aVer, aRealData:string); //화재 복구 포맷
    procedure  RcvCCCSettingData(aECUID,aVer, aRealData:string);
    procedure  RcvCCCControlData(aECUID,aVer,aRealData:string);
    procedure  RcvArmDsCheck(aECUID,aVer, aRealData:string);
    procedure  RcvArmRelayCheck(aECUID,aVer, aRealData:string);
    procedure  RcvDVRSettingData(aECUID,aVer, aRealData:string);
    procedure  RcvFTPCheck(aECUID,aVer, aRealData:string);
    procedure  RcvFTPDownLoadState(aECUID,aVer, aRealData:string);

    // 원격제어 메세지 코드 처리
    procedure  RemoteDataProcess(aECUID,aVer,aRealData:string);
    procedure  RcvDeviceCode(aECUID,aVer, aRealData:string);
    procedure  RcvSystemFunction(aECUID,aVer, aRealData:string);
    procedure  RcvDeviceVersion(aECUID,aVer, aRealData:string);
    procedure  RcvCardReaderVersion(aECUID,aVer, aRealData:string);
    procedure  RcvEcuState(aEcuId,aVer,aRealData:string);

    //출입통제포맷
    procedure  AccessDataProcess(aECUID,aVer,aRealData:string);
    procedure  RcvAccEventData(aECUID,aVer, aRealData:string);    // 출입카드 이벤트
    procedure  RcvDoorEventData(aECUID,aVer, aRealData:string);   // 문상태 변경 데이터 처리
    procedure  RcvDoorinfo2(aECUID,aVer, aRealData:string);        //출입문 등록 응답
    procedure  RcvAccControl(aECUID,aVer, aRealData:string);      //기기 제어 응답
    procedure  RcvCardRegAck(aECUID,aVer, aRealData:string);      //카드등록응답
    procedure  RcvSch(aECUID,aVer, aRealData:string);             // 스케줄 응답
    procedure  RcvHoliday(aECUID,aVer, aRealData:string);         // 휴일 조회
    procedure  RcvCardAllDelete(aECUID,aVer, aRealData:string);

    procedure  FirmwareProcess(aECUID,aVer,aRealData:string);

    procedure  FirmwareProcess2(aECUID,aVer,aRealData:string);

    procedure  BroadCastProcess(aECUID,aVer,aRealData:string);

    procedure  BroadErrorProcess(aECUID,aVer,aRealData:string);

    procedure  PTMonitoringProcess(aECUID,aVer,aRealData:string);

    procedure  GageMonitor(aECUID,aVer,aRealData:string);

    procedure  ErrorDataProcess(aECUID,aVer,aRealData:string) ;

  public
    LastConnectedTime: TDatetime;
    { Public declarations }
    Function SocketConnect:Boolean;
    Function SocketDisConnect : Boolean;
    Function DeviceConnectCheck(aEcuID:string):Boolean;
  public
    //제어
    Function ChangeAlarmMode(aEcuID, aMode:string):Boolean;
    Function AllFireRecovery:Boolean;
    function RemoteDoorControl(aEcuID,aDoorNo,aControlType,aControl:string):Boolean;
    function ControlerReset(aEcuID:string):Boolean;
  public
    //기기정보 등록
    Function ID_Registration(aID:string):Boolean;
    Function UsedDevice_Registration(aUseEcu:string):Boolean;
    Function DeviceType_Registration(aUseEcuType:string):Boolean;
    Function RegistSerialWritewiznet(aIP,aSubNet,aGateway,aPort,aServerIP,aServerPort,aMode,aDhcp:string):Boolean;
    Function RegistSystemInfo(aEcuID,aWatchPowerOff,aDelayIn,aDelayOut,aDoor1Type,aDoor2Type,aLocate: string):Boolean;
    Function RegistDoorSystemInfo(aEcuID,aDoorNo,aCardModeType,aDoorModeType,
              aDoorControlTime,aDoorLongOpenTime,aScheduleUse,aDoorStatusUse,
              aDoorLongTimeUse,aDoorLockType,aDoorFireOpenUse,aDoorDSOpenState,
              aRemoteOpen:string):Boolean;
    Function RegistCardType(aEcuID,aCardType:string):Boolean;
    Function RegistCardReaderInfo(aEcuID:string;aReaderNo,aReaderUse,aReaderDoor,aReaderDoorLocate,aReaderBuildingLocate:integer;aLocate:string):Boolean;
    Function RegistPortInfo(aEcuID, aPortNo, aWatchType,aDelayUse, aRecoverUse, aPortDelayTime, aStatusCode,aLocate:string):Boolean;
    Function RegistAlartLampSiren(aEcuID, aAlertLamp,aAlertSiren:string):Boolean;
    Function CardDownLoad(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aAlarm,aValidDate,aPatrolCardType,aCardType:string):Boolean;
    Function RegistrationDeviceSchedule(aEcuID,aDoorNo,aDayCode,aScheduleData:string):Boolean;
    Function registHoliday(aEcuID, aDoorNo,aCMD, aHoliday,aHolidayType:string):Boolean;
    Function registTime(aDate:string):Boolean;
    Function CdmaUseRegist(aData:string):Boolean;
    Function RegistcdmaSetData(aEcuID, aCdmaMin,aCdmaMux, aCdmaIP, aCdmaPort, aCdmachktime, aCdmarssi:string):Boolean;
    Function CCCInfoRegist(aIP,aPort:string):Boolean;
    Function CCCTimeIntervalRegist(aTime:string):Boolean;
    Function CCCStartTimeRegist(aTime:string):Boolean;
    Function DVRUseRegist(aData:string):Boolean;
    Function RegistDVRSetData(aEcuID, aDVRIP,aDVRPort:string):Boolean;
    Function RegistMacAddress(aMac:string):Boolean;
    Function KTTSystemID_Registration(aLinkusID:string):Boolean;
    Function RegistKTTTelNum(aNo,aTelNum:string):Boolean;
    Function RegistKTTRingCount(aArmRingCount,aDisArmRingCount:integer):Boolean;
    function RegistArmDsCheck(aEcuID,aDoorNo,aArmDsCheck:string):Boolean;    //812 경계시 DS체크
    function RegistArmRelay(aEcuID,aArmRelay:string):Boolean;
    function RegistAlertLampTime(aEcuID,aAlertLampTime:string):Boolean;
    function RegistAlertSirenTime(aEcuID,aAlertSirenTime:string):Boolean;
    function CardReaderTelNumberRegist(aEcuID,aNo,aTelNo:string):Boolean;
  public
    //기기 정보 조회
    Function ID_Check:Boolean;
    Function DeviceCode_Check(aEcuID:string;aDelay:Boolean=False):Boolean;  //ECU/ICU 타입 체크
    Function DeviceType_Check(aDelay:Boolean=False):Boolean;  //ECU/ICU 타입 체크
    Function UsedDevice_Check(aDelay:Boolean=True):Boolean; //확장기 사용체크
    function KTTSystemIDSearch:Boolean;
    function KTTTelNumSearch(aNo:string):Boolean;
    function KTTRingCountSearch:Boolean;
    Function CdmaUseCheck:Boolean;     //CDMA 사용 유무 체크
    Function CCCInfoCheck:Boolean;     //CCC Info 조회
    Function CCCTimeIntervalCheck : Boolean; //CCC TimeInterval
    Function CCCStartTimeCheck : Boolean; //CCC StartTimeCheck
    Function DVRUseCheck(aEcuID:String):Boolean;
    Function DVRSetDataSearch(aEcuID:String):Boolean;
    Function DeviceVersion_Check(aEcuID:string;aDelay: Boolean=True):Boolean;  //기기 버젼 체크
    Function SysInfo_Check(aEcuID:string;aDelay:Boolean=True):Boolean;
    Function SearchArmDsCheck(aEcuID,aDoorNo:string;aDelay:Boolean=True):Boolean;
    Function SearchArmRelay(aEcuID:string;aDelay:Boolean=True):Boolean;
    Function AlarmState_Check(aEcuID:string;aDelay:Boolean=True):Boolean; //방범상태조회
    Function DoorSystemInfo_Check(aEcuID,aDoorNo:string):Boolean; //출입문정보조회
    Function DoorState_Check(aEcuID,aDoorNo:string;aDelay:Boolean=True):Boolean; //출입문 상태조회
    Function DoorLockDeviceState_Check(aEcuID:string):Boolean; //출입문 기기 상태 조회
    Function ZoneSensState_Check:Boolean;  //이상발생 체크
    Function CardReaderType_Check(aEcuID:string):Boolean;  //카드리더 타입 체크
    Function CardReaderInfo_Check(aEcuID,aReaderNo:string;aDelay:Boolean=True):Boolean; //카드리더 정보 체크
    Function CardReaderVersion_Check(aEcuID,aReaderNo:string;aDelay:Boolean=True):Boolean; //카드리더 버젼 체크
    Function PortInfo_Check(aEcuID,aPortNo:string):Boolean; //포트등록정보체크
    function PortState_Check(aEcuID:string):Boolean;  //포트상태체크
    function AlertLampTimeCheck(aEcuID:string):Boolean;
    function AlertSirenTimeCheck(aEcuID:string):Boolean;
    function AlartLampSirenStateCheck(aEcuID:string):Boolean;
    function WiznetModuleInfo_Check(aDelay:Boolean=True):Boolean; //랜모듈 정보 조회
    function EcuStatusCheck:Boolean;         //확장기 통신상태 체크
    function DeviceCardSearch(aEcuID:string):Boolean; //
    function CardSearchCancel(aEcuID:string):Boolean;
    function DeviceSchedule_Check(aEcuID,aDoorNo,aDayCode:string):Boolean;
    function Holiday_Search(aEcuID, aDoorNo, aDate,aHolidayType:string):string;
    function TimeCheck:Boolean;
    function MacSearch:Boolean;
    function CardReaderTelNumberSearch(aEcuID,aTelNo:string):Boolean;
    Function CheckSystemFunction(aEcuID:string;aDelay:Boolean=True):Boolean;
    Function CheckFTP(aEcuID:string;aDelay:Boolean=True):Boolean;
  public
    Function AllDeviceDisArm:Boolean;
    Function AllDeviceFireRecovery:Boolean;
    Function AllDeviceSendPacket(aCmd,aData:String):Boolean;
  public
    Function DirectSendPacket(aEcuID,aCmd,aData:string;aQuick:Boolean=False):Boolean;
    Function SendKTT812FirmWarePacket(aHexCmd,aHexData:string):Boolean;
    Function SendBufferClear:Boolean;

  published
    property DeviceID : string Read FDeviceID write SetDeviceID;

    property FTPUSE:Boolean read FFTPUSE write setFTPUSE;
    Property ConnectMode: Integer Read FConnectMode write SetConnectMode;  //0:LAN 1:RS-232
    Property ServerMode: Integer Read FServerMode write SetServerMode;  //0:Client 1:ServerMode
    Property SocketAddress: String Read FSocketAddress write SetSocketAddress;
    Property SocketPort: String Read FSocketPort write SetSocketPort;
    Property SocketCOM: integer Read FSocketCOM write SetSocketCOM;
    Property SocketConnected : Boolean Read FSocketConnected write SetSocketConnected; //소켓 오픈 성공 상태
    Property NodeConnected : Boolean Read FNodeConnected write SetNodeConnected; //장비가 정상 접속 하여 ID 체크가 완료된 상태
    property KTT812FirmwareDownLoadType:Boolean read FKTT812FirmwareDownLoadType write FKTT812FirmwareDownLoadType;
    property KTT812FirmwareStarting:Boolean read FKTT812FirmwareStarting write FKTT812FirmwareStarting;
    property KTT812BroadFirmWareStarting:Boolean read FKTT812BroadFirmWareStarting write FKTT812BroadFirmWareStarting;
    property SocketOutSenting:Boolean read FSocketOutSenting write FSocketOutSenting;

    property OnPanelMessage: TPanelMessage read FOnPanelMessage write FOnPanelMessage;
    property OnNodeConnect: TNodeConnect read FOnNodeConnect write FOnNodeConnect;
    property OnECUConnect: TECUConnect read FOnECUConnect write FOnECUConnect;
    property OnPacketView : TPacketView read FOnPacketView write FOnPacketView;
    property OnReceivePacket: TReceivePacket read FOnReceivePacket write FOnReceivePacket;
    property OnServerModeConnect: TServerModeConnect read FOnServerModeConnect write FOnServerModeConnect;
    property OnConnectError: TNodeConnect read FOnConnectError write FOnConnectError;

    //알람 이벤트
    property OnAlarmEvent: TAlarmEvent read FOnAlarmEvent write FOnAlarmEvent;
    //등록 이벤트
    property OnDeviceIDSetting:TDeviceIDSetting read FOnDeviceIDSetting write FOnDeviceIDSetting;
    property OnCardReaderSetting:TCardReaderSetting read FOnCardReaderSetting write FOnCardReaderSetting;
    property OnSystemSetting:TSystemSetting read FOnSystemSetting write FOnSystemSetting;
    property OnLampSirenOnOff:TLampSirenOnOff read FOnLampSirenOnOff write FOnLampSirenOnOff;
    property OnLampTime:TLampTime read FOnLampTime write FOnLampTime;
    property OnSirenTime:TSirenTime read FOnSirenTime write FOnSirenTime;
    property OnPortSetting:TPortSetting read FOnPortSetting write FOnPortSetting;
    property OnDeviceUsedSetting:TDeviceUsedSetting read FOnDeviceUsedSetting write FOnDeviceUsedSetting;
    property OnWiznetInfoSetting:TWiznetInfoSetting read FOnWiznetInfoSetting write FOnWiznetInfoSetting;
    property OnCardReaderTypeSetting:TCardReaderTypeSetting read FOnCardReaderTypeSetting write FOnCardReaderTypeSetting;
    property OnDeviceState:TDeviceState read FOnDeviceState write FOnDeviceState;
    property OnCDMASetting:TCCCSetting read FOnCDMASetting write FOnCDMASetting;
    property OnCCCInfoSetting:TCCCSetting read FOnCCCInfoSetting write FOnCCCInfoSetting;
    property OnCCCTimeInterval:TCCCSetting read FOnCCCTimeInterval write FOnCCCTimeInterval;
    property OnCCCStartTime:TCCCSetting read FOnCCCStartTime write FOnCCCStartTime;
    property OnKTTSystemID:TEcuState read FOnKTTSystemID write FOnKTTSystemID;
    property OnKTTTelNumber:TDeviceState read FOnKTTTelNumber write FOnKTTTelNumber;
    property OnKTTRingCount:TDeviceState read FOnKTTRingCount write FOnKTTRingCount;
    property OnArmDsCheck:TDeviceState read FOnArmDsCheck write FOnArmDsCheck;
    property OnArmRelayCheck:TDeviceState read FOnArmRelayCheck write FOnArmRelayCheck;
    property OnDVRUseSetting:TCCCSetting read FOnDVRUseSetting write FOnDVRUseSetting;
    property OnDVRInfoSetting:TCCCSetting read FOnDVRInfoSetting write FOnDVRInfoSetting;
    property OnCARDREADERTelNumber:TDeviceState read FOnCARDREADERTelNumber write FOnCARDREADERTelNumber;
    property OnGageMonitor:TDeviceState read FOnGageMonitor write FOnGageMonitor;
    property OnFirmwareProcess:TDeviceState read FOnFirmwareProcess write FOnFirmwareProcess;
    property OnFirmwareProcess2:TDeviceState read FOnFirmwareProcess2 write FOnFirmwareProcess2;
    property OnPTMonitoringProcess:TDeviceState read FOnPTMonitoringProcess write FOnPTMonitoringProcess;

    // 원격제어 메세지
    property OnDeviceTime:TDeviceTime read FOnDeviceTime write FOnDeviceTime;
    property OnDeviceType:TDeviceType read FOnDeviceType write FOnDeviceType;
    property OnDeviceCode:TDeviceType read FOnDeviceCode write FOnDeviceCode;
    property OnSystemFunction:TSystemFunction read FOnSystemFunction write FOnSystemFunction;
    property OnDeviceVersion:TDeviceVersion read FOnDeviceVersion write FOnDeviceVersion;
    property OnCardReaderVersion:TCardReaderVersion read FOnCardReaderVersion write FOnCardReaderVersion;
    property OnDeviceReset:TDeviceReset read FOnDeviceReset write FOnDeviceReset;
    property OnEcuState:TEcuState read FOnEcuState write FOnEcuState;
    property OnCardGrade:TCardGrade read FOnCardGrade write FOnCardGrade;
    //property OnCardListSearch:TCardListSearch read FOnCardListSearch write FOnCardListSearch;
    //출입통제 이벤트
    property OnCardAccessEvent: TCardAccessEvent read FOnCardAccessEvent write FOnCardAccessEvent;
    property OnDoorEvent: TDoorEvent read FOnDoorEvent write FOnDoorEvent;
    property OnDoorSettingEvent :TDoorSettingEvent read FOnDoorSettingEvent write FOnDoorSettingEvent;
    property OnDoorState: TDoorState read FOnDoorState write FOnDoorState;
    property OnCardRegist: TCardRegist read FOnCardRegist write FOnCardRegist;
    property OnScheduleSetting : TScheduleSetting read FOnScheduleSetting write FOnScheduleSetting;
    property OnHolidaySetting : THolidaySetting read FOnHolidaySetting write FOnHolidaySetting;

    property OnKTT811FTPFirmWareDownloadComplete:TEcuState read FOnKTT811FTPFirmWareDownloadComplete write FOnKTT811FTPFirmWareDownloadComplete;

    //812Firmware Update
    property OnKTT812FlashDataEvent:TEcuState read FOnKTT812FlashDataEvent write FOnKTT812FlashDataEvent;
    property OnKTT812FlashDataEndEvent:TEcuState read FOnKTT812FlashDataEndEvent write FOnKTT812FlashDataEndEvent;
    property OnKTT812EcuFirmWareDownloadComplete:TEcuState read FOnKTT812EcuFirmWareDownloadComplete write FOnKTT812EcuFirmWareDownloadComplete;
  end;

var
  dmSocket: TdmSocket;

implementation

uses
  uLomosUtil,
  uCheckValiable,
  uUtil;

{$R *.dfm}

{ TdmSocket }

function TdmSocket.ID_Check: Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'ID' + FillZeroNumber(0,G_nIDLength + 2);

  G_bDeviceResponse[IDCHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, False);
  result := ResponseCheck(IDCHECK,G_nDelayTime);
end;

function TdmSocket.ComPort38400Connect: integer;
var
  nLoop : integer;
  bResult : Boolean;
begin
  result := PORTOPENFAIL;
  With CommPort do
  begin
    Baud:= 38400;
    try
      //ApdSLController.Monitoring:= True;
      OPen:= True;
    except
      Exit;
    end;
  end;
  SocketConnected := True;
  Delay(10);
  bResult := False;
  for nLoop := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    bResult := ID_Check;
    if bResult then break;
  end;
  if bResult then result := PORTCONNECTED
  else result := PORTCONNECTFAIL;

end;

function TdmSocket.ComPort9600Connect: integer;
var
  nLoop : integer;
  bResult : Boolean;
begin
  result := PORTOPENFAIL;
  With CommPort do
  begin
    Baud:= 9600;
    try
      //ApdSLController.Monitoring:= True;
      OPen:= True;
    except
      Exit;
    end;
  end;
  SocketConnected := True;
  Delay(10);
  bResult := False;
  for nLoop := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    bResult := ID_Check;
    if bResult then break;
  end;
  if bResult then result := PORTCONNECTED
  else result := PORTCONNECTFAIL;
end;

constructor TdmSocket.Create(AOwner: TComponent);
var
  i : integer;
begin
  inherited;
  LastConnectedTime := 0;
  NodeConnected := false;
  SocketConnected := False;

  DeviceID := Fillzeronumber(0,G_nIDLength);

  L_DeviceBuffer := '';
  L_bSocketConnecting := False;

  FirstSendDataList := TStringList.Create;
  QuickSendDataList := TStringList.Create;
  ReserveSendDataList := TStringList.Create;
  ConnectDeviceList := TStringList.Create;
  EcuStateDeviceList := TStringList.Create;

  for i := 0 to 63 do
  begin
    G_bDeviceResponse[i] := False;
  end;
  KTT812FirmwareDownLoadType := False;
  SocketOutSenting := False;
end;

destructor TdmSocket.Destroy;
begin
  if SocketConnected then SocketDisConnect;
  FirstSendDataList.Free;
  QuickSendDataList.Free;
  ReserveSendDataList.Free;
  ConnectDeviceList.Free;
  EcuStateDeviceList.Free;

  inherited;
end;

function TdmSocket.SendPacket(aEcuID, aCmd, aData,aVer: string;
  aQuick: Boolean=False;aPriority:integer=2): Boolean;
var
  stPacket: string;
  nDataLength: Integer;
  stLen: string;
  nMsgNo: Integer;
begin
  Result := false;
  if Not SocketConnected then Exit;
  if G_bApplicationTerminate then Exit;

  nDataLength := (G_nIDLength + 14) + Length(aData);
  stLen := FillZeroNumber(nDataLength, 3);

  if aCmd = 'a' then {응답 처리}
     stPacket := PacketCreate(G_nProgramType,stLen,aVer,DeviceID + aEcuID,aCmd,'',RecvMsgNo)
  else {제어 or 등록 }
  begin
    nMsgNo  := SendMsgNo;
    stPacket := PacketCreate(G_nProgramType,stLen,aVer,DeviceID + aEcuID,aCmd,aData,inttostr(nMsgNo));
    if nMsgNo >= 9 then SendMsgNo := 0
    else SendMsgNo := nMsgNo + 1;
  end;
  if aPriority < 2 then
  begin
    FirstSendDataList.Add(stPacket);
  end else if aQuick then
  begin
    QuickSendDataList.Add(stPacket);
  end else ReserveSendDataList.Add(stPacket);
  {
  if aQuick then
  begin
    SocketPutString(stPacket);
  end else
  begin
    ReserveSendDataList.Add(stPacket);
  end; //}
end;
function TdmSocket.DirectSendPacket(aEcuID, aCmd, aData: string;
  aQuick: Boolean): Boolean;
begin
  SendPacket(aEcuID,aCmd,aData,G_stDeviceVer,aQuick);
end;
procedure TdmSocket.SetConnectMode(const Value: Integer);
begin
  FConnectMode := Value;
  if Value = 0 then
      CommPort.DeviceLayer:= dlWinsock
  else if Value = 1 then
      CommPort.DeviceLayer:= dlWin32;
end;

procedure TdmSocket.SetNodeConnected(const Value: Boolean);
var
  i : integer;
begin
  if FNodeConnected = Value then exit;
  FNodeConnected := Value;
  if Assigned(FOnNodeConnect) then
  begin
    OnNodeConnect(Self,Value);
  end;
  if Not Value then
  begin
    for i := ConnectDeviceList.Count - 1 to 0 do
    begin
      ECUConnected(ConnectDeviceList.Strings[i],False);
    end;
  end;

{  if Value then
  begin
    EcuStatusCheck;   
  end;   }
end;

procedure TdmSocket.SetServerMode(const Value: Integer);
begin
  FServerMode := Value;
  if Value = 0 then
    CommPort.wsMode:= wsClient
  else if Value = 1 then
    CommPort.wsMode:= wsServer;
end;

procedure TdmSocket.SetSocketAddress(const Value: String);
begin
  FSocketAddress := Value;
  CommPort.wsAddress :=  Value;
end;

procedure TdmSocket.SetSocketCOM(const Value: integer);
begin
  FSocketCOM := Value;
  CommPort.ComNumber:= Value;
end;

procedure TdmSocket.SetSocketConnected(const Value: Boolean);
var
  i : integer;
begin
  if FSocketConnected = Value then Exit;
  FSocketConnected := Value;
  if Value then
  begin
    ECUListAdd('00');
  end else
  begin
    L_bSending := False;
    for i := EcuStateDeviceList.Count -1 downto 0 do
    begin
      ECUListDelete(EcuStateDeviceList.Strings[i]);
    end;
  end;
end;

procedure TdmSocket.SetSocketPort(const Value: String);
begin
  FSocketPort := Value;
  CommPort.wsPort:=    Value;
end;

Function TdmSocket.SocketConnect:Boolean;
var
  nConnected : integer;
  FirstTickCount : double;
begin
  result := False;
  if L_bSocketConnecting then Exit;
  Try
    L_bSocketConnecting := True;
    NodeConnected := False;
    CommPort.OPen:= False;
    Delay(100);
    if ConnectMode = 0 then //LAN 접속이면
    begin
      With CommPort do
      begin
        //ApdSLController.Monitoring:= True;
        Try
          OPen:= True;
        Except
          Exit;
        End;
        if ServerMode = 1 then
        begin
          result := True;
          Exit;
        end;
        //여기서 Connected 될 동안 대기 DELAYTIME 만큼
        FirstTickCount := GetTickCount + DELAYTIME;
        While Not SocketConnected do
        begin
          Application.ProcessMessages;
          if GetTickCount > FirstTickCount then Break;
        end;
        if Not SocketConnected then Exit; //Delay Time 동안 접속 되지 않음
        result := True;
        //NodeConnected := ID_Check;    //2011.07.19 처음 접속시 아이디 체크 하지 말자
        //NodeConnected := True;

      end;
    end else if ConnectMode = 1 then  //RS-232 접속이면
    begin
      nConnected := ComPort9600Connect;
      if nConnected <> PORTCONNECTED then
      begin
        if nConnected = PORTOPENFAIL then
        begin
          showmessage('포트오픈 실패');
          Exit;
        end else
        begin
          nConnected := ComPort38400Connect;
          if nConnected <> PORTCONNECTED then
          begin
            exit;
          end;
        end;
        //result := ID_Check;
      end;
      result := True;
    end;
    NodeConnected := result;
  Finally
    L_bSocketConnecting := False;
  End;

end;

function TdmSocket.SocketDisConnect: Boolean;
begin
  result := False;
  Try
    NodeConnected := False;
    if Commport.Open then
    begin
      Commport.FlushInBuffer;
      Commport.FlushOutBuffer;
      Commport.Open := false;
      SocketConnected := False;
    end;
  Except
    Exit;
  End;
  result := True;
end;

procedure TdmSocket.CommportWsConnect(Sender: TObject);
begin
  LastConnectedTime:= Now;
  SocketConnected := True;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,'연결 IP:' + SocketAddress );
  end;
end;

procedure TdmSocket.CommportWsDisconnect(Sender: TObject);
begin
  SocketConnected := False;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,SocketAddress + ' 해제' );
  end;
end;

procedure TdmSocket.CommportWsError(Sender: TObject; ErrCode: Integer);
begin
  SocketConnected := False;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,' 접속실패 - ' + inttostr(ErrCode) );
  end;
  if Assigned(FOnConnectError) then
  begin
    OnConnectError(Self,False);
  end;

end;

procedure TdmSocket.CommportWsAccept(Sender: TObject; Addr: TInAddr;
  var Accept: Boolean);
var
  ConnectedIP: string;
begin
  ConnectedIP:= InttoStr(Ord(Addr.S_un_b.s_b1))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b2))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b3))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b4));

  if SocketAddress = ConnectedIP then
  begin
    SocketConnected := True;
    Accept := true;
    if Assigned(FOnPanelMessage) then
    begin
      OnPanelMessage(Self,ConnectedIP + ' 접속');
    end;
    if Assigned(FOnServerModeConnect) then
    begin
      OnServerModeConnect(Self);
    end;
    {
    Delay(10);
    for nLoop := 0 to G_nLoopCount - 1 do
    begin
      bResult := ID_Check;
      if bResult then break;
    end;
    //bResult := ID_Check;
    NodeConnected := true;  }
  end else
  begin
    if Assigned(FOnPanelMessage) then
    begin
      OnPanelMessage(Self,ConnectedIP + ' 접속불허');
    end;
    Accept := False;
  end;

end;

function TdmSocket.SocketPutString(aData: string): Boolean;
begin
  result := False;
  if Not SocketConnected then Exit;
  Commport.PutString(aData);
  if Assigned(FOnPacketView) then
  begin
    OnPacketView(Self,aData,'TX');
  end;


end;

procedure TdmSocket.CommportTriggerAvail(CP: TObject; Count: Word);
var
  stTemp: string;
  i: Integer;
  bLoop : Boolean;
  stLeavePacketData : string;
  stPacketData : string;
  nFormat : integer;
begin
  LastConnectedTime:= Now;
  stTemp := '';
  for i := 1 to Count do stTemp := stTemp + TApdWinsockPort(CP).GetChar;

  //NodeConnected:=True;
  if KTT812FirmwareDownLoadType then  //KTT812 Firmware Download 중이면
  begin
    stTemp := ASCII2Hex(stTemp);
  end;

  L_DeviceBuffer := L_DeviceBuffer + stTemp;

  bLoop := False;
  repeat
    if Trim(L_DeviceBuffer) = '' then Exit;

    if Not KTT812FirmwareDownLoadType then
    begin
      nFormat := PacketFormatCheck(L_DeviceBuffer,G_nProgramType,stLeavePacketData,stPacketData);
      {/*
       nFormat : -1 -> 비정상 전문
                 -2 -> 길이가 짧은 전문
                  1 ->  STX 포맷
                  2 ->  SOH 포맷
      */}
    end else
    begin
      nFormat := CheckKTT812FirmwareDataPacket(L_DeviceBuffer,stLeavePacketData,stPacketData);
    end;
    L_DeviceBuffer:= stLeavePacketData;

    if nFormat < 0 then
    begin
      if L_DeviceBuffer = '' then break;
      if nFormat = -1 then  //비정상 전문 인경우
      begin
         Delete(L_DeviceBuffer,1,1);
         continue;
      end else break;   //포맷 길이가 작게 들어온 경우

    end;

    L_bDecoderFormat := False;
    L_bKTT812DownloadFormat := False;
    if nFormat = 1 then L_bDecoderFormat := False
    else if nFormat = 2 then L_bDecoderFormat := True
    else if nFormat = 3 then L_bKTT812DownloadFormat := True
    else continue;

    if L_bDecoderFormat then continue;   //데코더 포맷인 경우 처리 하지 말자

    if stPacketData <> '' then
    begin
      if L_bKTT812DownloadFormat then KTT812DataPacektProcess(stPacketData)
      else DataPacketProcess(stPacketData);
    end;

    if L_bKTT812DownloadFormat then
    begin
      if pos(KTT812FirmwareHeader,L_DeviceBuffer) = 0 then bLoop := True
      else bLoop := False;
    end else
    begin
      if pos(ETX,L_DeviceBuffer) = 0 then bLoop := True
      else bLoop := False;
    end;
    
  until bLoop;

end;

function TdmSocket.DataPacketProcess(aPacketData: string): Boolean;
var
  stECUID : string;
  stCMD : string;
  stRealData : string;
begin
  result := False;
  if aPacketData = '' then Exit;
  if Assigned(FOnPacketView) then
  begin
    OnPacketView(Self,aPacketData,'RX');
  end;
  DeviceID := Copy(aPacketData, 8, G_nIDLength);
  stECUID := copy(aPacketData,8 + G_nIDLength,2);
  stCMD:= aPacketData[G_nIDLength + 10];
  RecvMsgNo:= aPacketData[G_nIDLength + 11];
  G_stDeviceVer := copy(aPacketData,6,2);

  stRealData := Copy(aPacketData,G_nIDLength + 12,Length(aPacketData)-(G_nIDLength + 14));

  if (pos('Bad Command',aPacketData) > 0) or (pos('COMM ERROR',aPacketData) > 0 ) or (pos('UNUSED',aPacketData) > 0 ) then
  begin
    ECUConnected(stECUID,False);
  end else
  begin
    if (stCMD <> 'A') and (stCMD <> 'o') then ECUConnected(stECUID,True);//통신에러 나오는 경우도 있음
  end;

  if (stCMD = 'a') then
  begin
    Exit;
  end else if (stCMD <> 'c') then
  begin
    SendPacket(stECUID, 'a', '',G_stDeviceVer, true,1);
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

  case stCMD[1] of
    'A':{알람}          begin  DeviceRcvAlarmData(stECUID,G_stDeviceVer,stRealData)         end;
    'o':{알람조회}      begin  DeviceRcvAlarmSearchData(stECUID,G_stDeviceVer,stRealData)   end;
    'i':{Initial}       begin  RegDataProcess(stECUID,G_stDeviceVer,stRealData)             end;
    'R':{Remote}        begin  RemoteDataProcess(stECUID,G_stDeviceVer,stRealData)          end;
    'r':{Remote Answer} begin  RemoteDataProcess(stECUID,G_stDeviceVer,stRealData)          end;
    'c':{출입통제}      begin  AccessDataProcess(stECUID,G_stDeviceVer,stRealData)          end;
    'f':{펌웨어}        begin  FirmwareProcess(stECUID,G_stDeviceVer,stRealData)            end;
    'F':{펌웨어}        begin  FirmwareProcess2(stECUID,G_stDeviceVer,stRealData)           end;
    '*':{브로드캐스트}  begin  BroadCastProcess(stECUID,G_stDeviceVer,stRealData)           end;
    'E':{브로드캐스트에러} begin  BroadErrorProcess(stECUID,G_stDeviceVer,stRealData)       end;
    'm':{관제데이터 모니터링 } begin PTMonitoringProcess(stECUID,G_stDeviceVer,stRealData)  end;
    '#':{게이지 값 모니터링} begin GageMonitor(stECUID,G_stDeviceVer,stRealData)            end;
    'e':{ERROR}         begin ErrorDataProcess(stECUID,G_stDeviceVer,stRealData)            end;
    else {error 발생: [E003]정의 되지 않은 커맨드}  begin ErrorDataProcess(stECUID,G_stDeviceVer,stRealData) end;
  end;

  Result:= True;
end;

procedure TdmSocket.SetDeviceID(const Value: string);
begin
  if FDeviceID = Value then Exit;
  FDeviceID := Value;
end;

function TdmSocket.DeviceConnectCheck(aEcuID: string): Boolean;
begin
  result := False;
  if ConnectDeviceList.IndexOf(aEcuID) > -1 then result := True;
end;

function TdmSocket.ECUConnected(aEcuID: string;
  aConnected: Boolean): Boolean;
var
  nIndex : integer;
begin
  result := True;
  if aConnected then
  begin
    if ConnectDeviceList.IndexOf(aEcuID) < 0 then ConnectDeviceList.Add(aEcuID);
  end else
  begin
    if ConnectDeviceList.IndexOf(aEcuID) > -1 then ConnectDeviceList.Delete(ConnectDeviceList.IndexOf(aEcuID));
  end;

  nIndex := EcuStateDeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  if TSocketECUState(EcuStateDeviceList.Objects[nIndex]).Connected = aConnected then Exit;
  TSocketECUState(EcuStateDeviceList.Objects[nIndex]).Connected := aConnected;
  
  if Assigned(FOnECUConnect) then
  begin
    OnECUConnect(Self,aEcuID,aConnected);
  end;
end;


procedure TdmSocket.ECUListAdd(aEcuID: string);
var
  oEcuState : TSocketECUState;
  nIndex : integer;
begin
  nIndex := EcuStateDeviceList.IndexOf(aEcuID);
  if nIndex > -1 then Exit;
  oEcuState := TSocketECUState.Create(self);
  oEcuState.ECUID := aEcuID;

  EcuStateDeviceList.AddObject(aEcuID,oEcuState);
  EcuStateDeviceList.Sort;

end;

procedure TdmSocket.ECUListDelete(aEcuID: string);
var
  nIndex : integer;
begin
  nIndex := EcuStateDeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TSocketECUState(EcuStateDeviceList.Objects[nIndex]).Free;
  EcuStateDeviceList.Delete(nIndex);
end;

{출입통제}
procedure TdmSocket.AccessDataProcess(aECUID,aVer, aRealData: string);
var
  msgCode: Char;
  stTemp : string;
begin
  msgCode:= aRealData[1];

  {ACK 응답:출입과 DOOR}
  if (msgCode <> 'a') and (msgCode <> 'b') and (msgCode <> 'c') and
     (msgCode <> 'l') and (msgCode <> 'm') and (msgCode <> 'n')
  then
  begin
    stTemp:='Y' + Copy(aRealData,2,2)+'  '+'a';
    SendPacket(aECUID, 'c', stTemp,aVer, true,1);
  end;

  {출입통제 데이터 처리}
  case msgcode of
     //'F': RcvTelEventData(aECUID,aVer, aRealData);
    'E': RcvAccEventData(aECUID,aVer, aRealData);
    'D': RcvDoorEventData(aECUID,aVer, aRealData);
    'a': RcvDoorinfo2(aECUID,aVer, aRealData);        //출입문 등록 응답
    'b': RcvDoorinfo2(aECUID,aVer, aRealData);        //출입문 조회 응답
    'c': RcvAccControl(aECUID,aVer, aRealData);      //기기 제어 응답
'l','n','m','e','h','d','f': RcvCardRegAck(aECUID,aVer, aRealData);  //카드등록응답
's','p': RcvSch(aECUID,aVer, aRealData);             // 스케줄 응답
'r','q': RcvHoliday(aECUID,aVer, aRealData);         // 휴일 조회
    'o': RcvCardAllDelete(aECUID,aVer, aRealData);
  end;
end;
{브로드캐스트}
procedure TdmSocket.BroadCastProcess(aECUID,aVer, aRealData: string);
begin
//
end;
{브로드캐스트에러}
procedure TdmSocket.BroadErrorProcess(aECUID,aVer, aRealData: string);
begin
//
end;

{알람}
procedure TdmSocket.DeviceRcvAlarmData(aECUID,aVer, aRealData: string);
var
  stTime : string;
  stSubCLass : string;
  stSubAddr : string;
  stZone : string;
  stMode : string;
  stStatus : string;
  stLoop : string;
  stState : string;
  stOper : string;
begin
  stTime     := copy(aRealData,2,14);
  stSubCLass := copy(aRealData,16,2);
  stSubAddr  := copy(aRealData,18,2);
  stZone     := copy(aRealData,20,2);
  stMode     := copy(aRealData,22,1);
  stStatus   := copy(aRealData,23,2);
  stLoop     := copy(aRealData,25,2);
  stState    := copy(aRealData,27,1);
  if aVer = 'ST' then
  begin
    if isDigit(copy(aRealData,28,2)) then stOper := copy(aRealData,30,strtoint(copy(aRealData,28,2)))
    else stOper     := copy(aRealData,28,10);
  end
  else
    stOper     := copy(aRealData,28,10);

  if Assigned(FOnAlarmEvent) then
  begin
    OnAlarmEvent(Self,aECUID,stTime,stSubCLass,stSubAddr,stZone,stMode,stStatus,stLoop,stState,stOper);
  end;

  if (stSubCLass = 'MN') or (stSubCLass = 'EX') or (stSubCLass = 'SC') then
  begin
    if stStatus = 'NF' then ECUConnected(aECUID,False)
    else ECUConnected(aECUID,True);
  end else ECUConnected(aECUID,True);

end;

procedure TdmSocket.ErrorDataProcess(aECUID,aVer, aRealData: string);
begin
//사용 안함
end;
{펌웨어}
procedure TdmSocket.FirmwareProcess(aECUID,aVer, aRealData: string);
begin
// 펌웨어 데이터 작업시 사용
  if Assigned(FOnFirmwareProcess) then
  begin
    OnFirmwareProcess(Self,aECUID,'',aRealData);
  end;
end;
{펌웨어}
procedure TdmSocket.FirmwareProcess2(aECUID,aVer, aRealData: string);
begin
// 펌웨어 데이터 작업시 사용
  if Assigned(FOnFirmwareProcess2) then
  begin
    OnFirmwareProcess2(Self,aECUID,'',aRealData);
  end;
end;
{게이지 값 모니터링}
procedure TdmSocket.GageMonitor(aECUID,aVer, aRealData: string);
begin
 // 펌웨어 데이터 작업시 사용
  if Assigned(FOnGageMonitor) then
  begin
    OnGageMonitor(Self,aECUID,'',aRealData);
  end;
end;
{관제데이터 모니터링 }
procedure TdmSocket.PTMonitoringProcess(aECUID,aVer, aRealData: string);
begin
//사용안함
  if Assigned(FOnPTMonitoringProcess) then
  begin
    OnPTMonitoringProcess(Self,aECUID,'',aRealData);
  end;
end;
{Initial}
procedure TdmSocket.RegDataProcess(aECUID,aVer, aRealData: string);
var
  stRegCode: String;
  stGubun : string;
begin
  stRegCode:= Copy(aRealData,1,2);
  stGubun:= Copy(aRealData,3,2);

  if stRegCode = 'ID' then
  begin
    RcvDeviceID(aECUID,aVer, aRealData);
  end else if stRegCode = 'CD' then
  begin
    RcvCardReader(aECUID,aVer, aRealData);
  end else if stRegCode = 'SY' then
  begin
    RcvSysinfo(aECUID,aVer, aRealData);
  end else if stRegCode = 'RY' then
  begin
    RcvRelay(aECUID,aVer, aRealData);
  end else if stRegCode = 'LP' then
  begin
    RcvPort(aECUID,aVer, aRealData);
  end else if stRegCode = 'AD' then
  begin
    //RcvUsedAlarmdisplay(aECUID,aVer, aRealData);
  end else if stRegCode = 'EX' then
  begin
    if stGubun = '00' then
      RcvUsedDevice(aECUID,aVer, aRealData)
    else if stGubun = '02' then
      RcvDeviceType(aECUID,aVer, aRealData);
  end else if stRegCode = 'TN' then
  begin
    if stGubun = '01' then
      RcvCardReaderTelNo(aECUID,aVer, aRealData);
  end else if stRegCode = 'CT' then
  begin
    //RcvCallTime(aECUID,aVer, aRealData);
  end else if stRegCode = 'BT' then
  begin
    //RcvbroadcastTime(aECUID,aVer, aRealData);
  end else if stRegCode = 'DI' then
  begin
    //RcvDialInfo(aECUID,aVer, aRealData);
  end else if stRegCode = 'NW' then
  begin
    RcvWiznetInfo(aECUID,aVer, aRealData);
  end else if stRegCode = 'DT' then
  begin
    RcvControlDialInfo(aECUID,aVer, aRealData);
  end else if stRegCode = 'VC' then
  begin
    //RcvVoiceTime(aECUID,aVer, aRealData);
  end else if stRegCode = 'Id' then
  begin
    RcvKTTSystemId(aECUID,aVer, aRealData);
  end else if stRegCode = 'Tn' then
  begin
    RcvKTTTelNo(aECUID,aVer, aRealData);
  end else if stRegCode = 'Pt' then
  begin
    //RcvLinkusPt(aECUID,aVer, aRealData);
  end else if stRegCode = 'Ct' then
  begin
    RcvCardType(aECUID,aVer, aRealData);
  end else if stRegCode = 'Rc' then
  begin
    RcvRingCount(aECUID,aVer, aRealData);
  end else if stRegCode = 'SM' then
  begin
    if stGubun = '00' then
    begin
      DeviceState1Show(aECUID,aVer, aRealData);
    end else if stGubun = '10' then
    begin
      ZoneStateShow(aECUID,aVer, aRealData);
    end else if stGubun = '20' then
    begin
      DoorLockState(aECUID,aVer, aRealData);
    end else if stGubun = '24' then
    begin
      ZoneSensState(aECUID,aVer, aRealData);
    end else if stGubun = '25' then
    begin
      RcvFireRecovery(aECUID,aVer, aRealData);
    end;
  end else if stRegCode = 'WL' then
  begin
    RcvCCCSettingData(aECUID,aVer, aRealData);
  end else if stRegCode = 'DV' then
  begin
    RcvDVRSettingData(aECUID,aVer, aRealData);
  end else if stRegCode = 'DL' then
  begin
    if stGubun = '00' then
    begin
    end else if stGubun = '01' then
    begin
      RcvArmDsCheck(aECUID,aVer, aRealData);
    end;
  end else if stRegCode = 'fn' then
  begin
    if stGubun = '05' then RcvArmRelayCheck(aECUID,aVer, aRealData);
  end;
end;
{Remote}
procedure TdmSocket.RemoteDataProcess(aECUID,aVer, aRealData: string);
var
  stCmd: String;
  stGubun : string;
  stTime : string;
begin
  stCmd:= Copy(aRealData,1,2);
  stGubun := Copy(aRealData,3,2);
  if stCmd = 'Pt' then
  begin
    //RcvLinkusPt(aECUID,aVer, aRealData);
  end else if stCmd = 'TM' then
  begin
    G_bDeviceResponse[TIME] := TRUE;
    //시간설정
    stTime :=  Copy(aRealData,5,14);
    if Assigned(FOnDeviceTime) then
    begin
      OnDeviceTime(Self,aECUID,stTime);
    end;
  end else if stCmd = 'VR' then
  begin
    //기기 버젼확인
    if stGubun = '01' then //기기코드이면
    begin
      //RcvDeviceType(aECUID,aVer, aRealData);
      RcvDeviceCode(aECUID,aVer, aRealData);
      Exit;
    end else if stGubun = '90' then
    begin
      RcvSystemFunction(aECUID,aVer, aRealData);
      Exit;
    end else if stGubun = '00' then
    begin
      RcvDeviceVersion(aECUID,aVer, aRealData);
      Exit;
    end;
  end else if stCmd = 'CV' then
  begin
    // 카드리더 버젼
    RcvCardReaderVersion(aECUID,aVer, aRealData);
  end else if stCmd = 'RS' then //Reset
  begin
    G_bDeviceResponse[DEVICERESET] := True;
    if Assigned(FOnDeviceReset) then
    begin
      OnDeviceReset(Self,aECUID);
    end;
  end else if stCmd = 'MC' then   //Change mode
  begin
    //모드변경시 Mode Change로 올라옴
      if Pos('ModeChangeStart',aRealData) > 0 then
      begin
        G_bDeviceResponse[ALARMCONTROL] := True;
      end;
  end else if stCmd = 'cs' then //통신상태체크
  begin
    if stGubun = '00' then RcvEcuState(aEcuId,aVer,aRealData);
    {
      stGubun = '00' -- cs0011uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu //확장기
      stGubun = '01' -- cs01x01uuuuuu //카드리더 8개
      stGubun = '02' -- cs02xuuuu //상황표시기
    }
  end else if stCmd = 'CD' then //카드데이터
  begin
    if stGubun = '10' then
    begin
      G_bDeviceResponse[CARDLISTCANCEL] := True;
    end
    else if stGubun = '11' then
    begin
      if Assigned(FOnCardGrade) then
      begin
        OnCardGrade(Self,aECUID,aRealData);
      end;
    end
    else if stGubun = '20' then
    begin
    end
    else if stGubun = '21' then
    begin
    end;

  end else if stCmd = 'SM' then
  begin
    if stGubun = '00' then
    begin
      DeviceState1Show(aECUID,aVer, aRealData);
    end else if stGubun = '10' then
    begin
      ZoneStateShow(aECUID,aVer, aRealData);
    end else if stGubun = '20' then
    begin
      DoorLockState(aECUID,aVer, aRealData)
    end else if stGubun = '24' then
    begin
      ZoneSensState(aECUID,aVer, aRealData);
    end else if stGubun = '25' then
    begin
      RcvFireRecovery(aECUID,aVer, aRealData);
    end;
  end else if stCmd = 'WL' then
  begin
    RcvCCCControlData(aECUID,aVer,aRealData);
  end else if stCmd = 'fp' then //FTP 사용 가능 유무
  begin
    if stGubun = '90' then RcvFTPCheck(aECUID,aVer, aRealData)
    else if stGubun = '10' then RcvFTPDownLoadState(aECUID,aVer, aRealData);
  end else if stCmd = 'fw' then
  begin
    RcvKTT812FirmWareDownload(aECUID,stGubun,aRealData);
  end;
end;

procedure TdmSocket.RcvAccControl(aECUID, aVer, aRealData: string);
Var
  stDoorNo: String;
  stDoorState: string;
  stCardMode: string;
  stDoorMode: string;
  stDoorSchedule : string;
begin
  G_bDeviceResponse[DOORCONTROL] := True;
  
  stDoorNo:=   aRealData[3];
  stCardMode:= aRealData[6];    //Posi/Nega
  stDoorMode:=  aRealData[7];    //운영/개방
  stDoorState:= aRealData[8];    //문상태
  stDoorSchedule:= aRealData[9];    //문상태
  if Assigned(FOnDoorState) then
  begin
    OnDoorState(Self,aECUID,stDoorNo,stCardMode,stDoorMode,stDoorState,stDoorSchedule);
  end;

end;

procedure TdmSocket.RcvAccEventData(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
  stReaderNo : string;
  stInOut : string;
  stTime : string;
  stCardMode : string;
  stDoorMode : string;
  stChangeState :string;
  stAccessResult : string;
  stDoorState : string;
  stATButton : string;

  nCardNoLen : integer;
  stCardNo : string;
  stExitButton : string;
begin

  stDoorNo:=  aRealData[3];
  stReaderNo := aRealData[4];
  stInOut := aRealData[5];
  stTime  := '20' + copy(aRealData,6,12);
  stCardMode := aRealData[18]; //Posi/Nega
  stDoorMode:=  aRealData[19]; //운영/개방
  stChangeState := aRealData[20]; //변경사유
  stAccessResult := aRealData[21]; //출입승인결과
  stDoorState:= aRealData[22]; //문상태
  stATButton:= aRealData[23]; //근태버튼

  nCardNoLen := 0;
  if isDigit(Copy(aRealData,24,2)) then nCardNoLen := strtoint(Copy(aRealData,24,2));
  if nCardNoLen = 0 then
  begin
    stCardNo:= copy(aRealData,26,8);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
    stCardNo:= DecodeCardNo(stCardNo);
    stCardNo := dec2Hex(strtoint64(stCardNo),8);
  end else
  begin
    stCardNo := copy(aRealData,26,nCardNoLen);
  end;
  if G_nCardType = 0 then
  begin
    if stCardNo = '00000000' then Exit;
  end else if G_nCardType = 1 then
  begin
    stExitButton := FillZeroNumber(0,11);
    if stCardNo = Ascii2Hex(stExitButton) then Exit;
  end else if G_nCardType = 1 then
  begin
    stExitButton := FillZeroNumber(0,nCardNoLen);
    if stCardNo = stExitButton then Exit;
  end;

  if Assigned(FOnCardAccessEvent) then
  begin
    OnCardAccessEvent(Self,aECUID,stDoorNo,stReaderNo,stInOut,stTime,
                      stCardMode,stDoorMode,stChangeState,stAccessResult,
                      stDoorState,stATButton,stCardNo);
  end;

end;

procedure TdmSocket.RcvCardAllDelete(aECUID, aVer, aRealData: string);
var
  stCmdState : string;
  stDoorNo : string;
  stCardType : string;
  nCardLen : integer;
  stCardNo : string;
  stExpireDate : string;
  stRegResult : string;
  stCardAuth : string;
  stTimeMode : string;
begin
  stCmdState := aRealData[1];
{  case aRealData[1] of
    'l','e','f':stCmdState:='[등록]';
    'm','h':stCmdState:='[조회]';
    'n','d':stCmdState:='[삭제]';
    'o':stCmdState:='[전체삭제]';
  end; }

  stDoorNo   := Copy(aRealData,3,1);
  stCardType := Copy(aRealData,4,2);

  nCardLen := 0;
  if isDigit(Copy(aRealData,7,2)) then nCardLen := strtoint(Copy(aRealData,7,2));

  if nCardLen = 0 then //4Byte 고정
  begin
    stCardNo:= copy(aRealData,9,8);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
    stCardNo:= DecodeCardNo(stCardNo);
    stCardNo := dec2Hex(strtoint64(stCardNo),8);
    nCardLen := 8;
  end else
  begin
    stCardNo := copy(aRealData,9,nCardLen);
  end;
  stExpireDate := Copy(aRealData,9 + nCardLen ,6);
  stRegResult := copy(aRealData,9 + nCardLen + 6,1); //등록결과
  stCardAuth := copy(aRealData,9 + nCardLen + 7,1);  //카드권한
  stTimeMode := copy(aRealData,9 + nCardLen + 8,1);  //출입시간모드

  if Assigned(FOnCardRegist) then
  begin
    OnCardRegist(Self,aECUID,stDoorNo,stCmdState,stCardType,stCardNo,stExpireDate,
                 stRegResult,stCardAuth,stTimeMode);
  end;

end;

procedure TdmSocket.RcvCardRegAck(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stDoorNo : string;
  stCardType : string;
  nCardLen : integer;
  stCardNo : string;
  stExpireDate : string;
  stRegResult : string;
  stCardAuth : string;
  stTimeMode : string;
begin

  G_bDeviceResponse[CARDDOWNLOADACK] := True;
  
  stCmd := aRealData[1];
{  case aRealData[1] of
    'l','e','f':stCmdState:='[등록]';
    'm','h':stCmdState:='[조회]';
    'n','d':stCmdState:='[삭제]';
    'o':stCmdState:='[전체삭제]';
  end; }

  stDoorNo   := Copy(aRealData,3,1);
  stCardType := Copy(aRealData,4,2);
  
  nCardLen := 0;
  if isDigit(Copy(aRealData,7,2)) then nCardLen := strtoint(Copy(aRealData,7,2));

  if nCardLen = 0 then //4Byte 고정
  begin
    stCardNo:= copy(aRealData,9,8);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
    stCardNo:= DecodeCardNo(stCardNo);
    stCardNo := dec2Hex(strtoint64(stCardNo),8);
    nCardLen := 8;
  end else
  begin
    stCardNo := copy(aRealData,9,nCardLen);
  end;
  stExpireDate := Copy(aRealData,9 + nCardLen ,6);
  stRegResult := copy(aRealData,9 + nCardLen + 6,1); //등록결과
  stCardAuth := copy(aRealData,9 + nCardLen + 7,1);  //카드권한
  stTimeMode := copy(aRealData,9 + nCardLen + 8,1);  //출입시간모드

  if Assigned(FOnCardRegist) then
  begin
    OnCardRegist(Self,aECUID,stDoorNo,stCmd,stCardType,stCardNo,stExpireDate,
                 stRegResult,stCardAuth,stTimeMode);
  end;

end;

procedure TdmSocket.RcvDoorEventData(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
  stReaderNo : string;
  stInOut : string;
  stTime : string;
  stCardMode : string;
  stDoorMode : string;
  stChangeState :string;
  stAccessResult : string;
  stDoorState : string;
begin

  stDoorNo:=  aRealData[3];
  stReaderNo := aRealData[4];
  stInOut := aRealData[5];
  stTime  := '20' + copy(aRealData,6,12);
  stCardMode := aRealData[18]; //Posi/Nega
  stDoorMode:=  aRealData[19]; //운영/개방
  stChangeState := aRealData[20]; //변경사유
  stAccessResult := aRealData[21]; //출입승인결과
  stDoorState:= aRealData[22]; //문상태

  if Assigned(FOnDoorEvent) then
  begin
    OnDoorEvent(Self,aECUID,stDoorNo,stReaderNo,stInOut,stTime,
                      stCardMode,stDoorMode,stChangeState,stAccessResult,
                      stDoorState);
  end;

end;

procedure TdmSocket.RcvHoliday(aECUID, aVer, aRealData: string);
var
  stMonth : string;
  stDate : string;
  stDoorNo : string;
begin
  L_stReceiveHoliday := aECUID + aRealData;
  G_bDeviceResponse[HOLIDAY] := True;
  stDoorNo := aRealData[3];
  stMonth := copy(aRealData,6,2);
  stDate := copy(aRealData,8,31);

  if Assigned(FOnHolidaySetting) then
  begin
    OnHolidaySetting(Self,aECUID,stDoorNo,stMonth,stDate);
  end;

end;

procedure TdmSocket.RcvSch(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stDoorNo : string;
  stDayOfWeek : string;
  st1ModeTime : string;
  st1Mode : string;
  st2ModeTime : string;
  st2Mode : string;
  st3ModeTime : string;
  st3Mode : string;
  st4ModeTime : string;
  st4Mode : string;
  st5ModeTime : string;
  st5Mode : string;
begin
  G_bDeviceResponse[SCHEDULE] := True;
  stCmd := aRealData[1];
  stDoorNo := aRealData[3];
  stDayOfWeek := aRealData[5];
  //st1ModeTime := copy(aRealData,6,4);
  st1Mode := aRealData[10];
  st1ModeTime := copy(aRealData,11,4);
  st2Mode := aRealData[15];
  st2ModeTime := copy(aRealData,16,4);
  st3Mode := aRealData[20];
  st3ModeTime := copy(aRealData,21,4);
  st4Mode := aRealData[25];
  st4ModeTime := copy(aRealData,26,4);
  st5Mode := aRealData[30];
  st5ModeTime := copy(aRealData,31,4);

  if Assigned(FOnScheduleSetting) then
  begin
    OnScheduleSetting(Self,aECUID,stDoorNo,stCmd,stDayOfWeek,st1ModeTime,st1Mode,
                          st2ModeTime,st2Mode,st3ModeTime,st3Mode,st4ModeTime,st4Mode,
                          st5ModeTime,st5Mode);
  end;

end;

procedure TdmSocket.RcvDoorinfo2(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
  stCardMode : string;
  stDoorMode : string;
  stDoorControlTime : string;
  nDoorControlTime : integer;
  nOrd : integer;
  nMsec : integer;
  stLongDoorOpenTime : string;
  stSchedule : string;
  stDoorState : string;
  stNetFailRun : string;
  stAntiPass : string;
  stLongDoorOpenUse : string;
  stNetFailAlarm : string;
  stDoorLockType : string;
  nLockType : integer;
  stFireDoorControl : string;
  stLockState : string;
  stDoorOpenState : string;
  stRemoteDoorOpen : string;
begin
  G_bDeviceResponse[DOORSYSTEMCHECK] := True;

  stDoorNo:=  aRealData[3];
  stCardMode := aRealData[6];
  stDoorMode := aRealData[7];
  stDoorControlTime := aRealData[8];
  if aRealData[8] >= #$30 then
  begin
   if aRealData[8] < #$40 then  stDoorControlTime := aRealData[8]
   else
   begin
      if (aRealData[8] >= 'A') and (aRealData[8] <= 'Z') then  nDoorControlTime := Ord(aRealData[8]) - Ord('A')
      else nDoorControlTime := Ord(aRealData[8]) - Ord('a') + 26;
      nDoorControlTime := nDoorControlTime * 5;
      stDoorControlTime := inttostr( 10 + nDoorControlTime );
   end;
  end else
  begin
    nOrd := Ord(aRealData[8]);
    nMsec := (nOrd - $20) * 100;
    stDoorControlTime := inttostr(nMsec) + 'ms';
  end;
  stLongDoorOpenTime := aRealData[9];
  stSchedule := aRealData[10];
  stDoorState := aRealData[11];
  stNetFailRun := aRealData[12];  //사용안함
  stAntiPass := aRealData[13];  //사용안함
  stLongDoorOpenUse := aRealData[14];
  stNetFailAlarm := aRealData[15]; //사용안함
  nLockType := 0;
  if aRealData[16] >= #$30 then
  begin
    nLockType:= ord(aRealData[16]) - ord('0');
  end;
  stDoorLockType := inttostr(nLockType);
  stFireDoorControl := aRealData[17];
  stLockState := aRealData[18];
  stDoorOpenState := aRealData[19];
  stRemoteDoorOpen := aRealData[20];

  if Assigned(FOnDoorSettingEvent) then
  begin
    OnDoorSettingEvent(Self,aECUID,stDoorNo,stCardMode,stDoorMode,stDoorControlTime,
                       stLongDoorOpenTime,stSchedule,stDoorState,stNetFailRun,
                       stAntiPass,stLongDoorOpenUse,stNetFailAlarm,stDoorLockType,
                       stFireDoorControl,stLockState,stDoorOpenState,stRemoteDoorOpen);
  end;

end;


procedure TdmSocket.ZoneSensState(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stData : string;
  nStartNo : integer;
  stDeviceState : string;
  stEcuID : string;
  stBinary : string;
  i : integer;
  stTemp : string;
begin
  G_bDeviceResponse[ZONESENSECHECK] := True;
  stCmd := copy(aRealData,3,2);
  stData := copy(aRealData,5,Length(aRealData) - 4);
  if Assigned(FOnDeviceState) then
  begin
    OnDeviceState(Self,aECUID,stCmd,stData);
  end;
  nStartNo := strtoint(copy(stData,1,2));
  stDeviceState := copy(stData,4,Length(stData) - 3);
  for i := 0 to 31 do
  begin
    stTemp := Trim(copy(stDeviceState,(i*3) + 1,3));
    stEcuID := FillZeroNumber(nStartNo + i ,2);
    stBinary := HexToBinary(stTemp);
    if stBinary[8] = '1' then G_bFireDevice[strtoint(stEcuID)] := True
    else G_bFireDevice[strtoint(stEcuID)] := False;
  end;

end;

procedure TdmSocket.DeviceState1Show(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stData : string;
begin
  stCmd := copy(aRealData,3,2);
  stData := copy(aRealData,5,Length(aRealData) - 4);
  if Assigned(FOnDeviceState) then
  begin
    OnDeviceState(Self,aECUID,stCmd,stData);
  end;

end;

procedure TdmSocket.DoorLockState(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stData : string;
begin
  G_bDeviceResponse[LOCKSTATECHECK] := True;
  stCmd := copy(aRealData,3,2);
  stData := copy(aRealData,5,Length(aRealData) - 4);
  if Assigned(FOnDeviceState) then
  begin
    OnDeviceState(Self,aECUID,stCmd,stData);
  end;

end;

procedure TdmSocket.RcvCardReader(aECUID, aVer, aRealData: string);
var
  stReaderNo : string;
  stUsedCR : string;
  stCRPosition : string;
  stDoorNo : string;
  stLocate : string;
  stBuildingPosi : string;
  nReaderPoint : integer;
begin
  //G_bDeviceResponse[CARDREADERINFO] := True;

  stReaderNo := Copy(aRealData, 3, 2);
  stUsedCR := Copy(aRealData, 5, 1);         // 카드리더 사용여부
  stCRPosition := Copy(aRealData, 6, 1);               // 설치 위치
  stDoorNo := Copy(aRealData, 7, 1);                 // 연동 문번호
  stLocate := Copy(aRealData, 10, 16);       // 카드리더 위치명
  stBuildingPosi := Copy(aRealData, 26, 1);          //빌딩 위치

  if isDigit(stReaderNo) then
  begin
    nReaderPoint := (strtoint(aEcuID) * G_nCardReaderNumber ) + strtoint(stReaderNo);

    G_bCardReaderResponse[nReaderPoint] := True;
  end;

  if Assigned(FOnCardReaderSetting) then
  begin
    OnCardReaderSetting(Self,aECUID,stReaderNo,stUsedCR,stCRPosition,stDoorNo,stLocate,stBuildingPosi);
  end;

end;

procedure TdmSocket.RcvCardType(aECUID, aVer, aRealData: string);
var
  stCardType: string;
begin
  G_bDeviceResponse[CARDREADERTYPE] := True;
  stCardType := Copy(aRealData, 5, 10);
  if Assigned(FOnCardReaderTypeSetting) then
  begin
    OnCardReaderTypeSetting(Self,aECUID,stCardType);
  end;

end;

procedure TdmSocket.RcvControlDialInfo(aECUID, aVer, aRealData: string);
begin
//데코더다이얼타임- 사용안함
end;

procedure TdmSocket.RcvDeviceID(aECUID, aVer, aRealData: string);
var
  stID : string;
begin
  stID := copy(aRealData,5,G_nIDLength);
  G_bDeviceResponse[IDCHECK] := True;
  if Assigned(FOnDeviceIDSetting) then
  begin
    OnDeviceIDSetting(Self,aECUID,stID);
  end;
end;

procedure TdmSocket.RcvPort(aECUID, aVer, aRealData: string);
var
  stPort: string;
  stWatchType : string; //김시형태
  stAlarmType : string; //알람발생형식
  stRecoverType : string;   //복구형식
  stDelayTimeType :string;  //지연시간형식
  stPortLocate  :string;    //포트위치명
  stDetectTime : string;
  nPortPoint : integer;
begin
  //         1         2         3         4         5         6
  //123456789012345678901234567890
  //LP08S831001111111101011111111100
  stPort := Copy(aRealData, 3, 2);
  stWatchType := Copy(aRealData, 5, 2);
  stAlarmType := Copy(aRealData, 7, 1);
  stRecoverType := Copy(aRealData, 9, 1);
  stDelayTimeType := Copy(aRealData, 10, 1);
  stPortLocate := Copy(aRealData, 33, 16);
  stDetectTime := Copy(aRealData, 49, 4);

  nPortPoint := (strtoint(aEcuID) * G_nPortNumber ) + strtoint(stPort);
  G_bPortResponse[nPortPoint] := True;

  if Assigned(FOnPortSetting) then
  begin
    OnPortSetting(Self,aECUID,stPort,stWatchType,stAlarmType,stRecoverType,
                  stDelayTimeType,stPortLocate,stDetectTime);
  end;

end;

procedure TdmSocket.RcvRelay(aECUID, aVer, aRealData: string);
var
  stRelayNo : string;
begin
  stRelayNo:= Copy(aRealData,3,2);

  if Not IsDigit(stRelayNo) then
  begin
    RcvLampState(aECUID,aVer,aRealData);
    Exit;
  end;
  //릴레이 설정은 없음
end;

procedure TdmSocket.RcvRingCount(aECUID, aVer, aRealData: string);
var
  stArmCount : string;
  stDisArmCount : string;
begin
  G_bDeviceResponse[KTTRINGCOUNT] := True;
  Delete(aRealData,1,4);
  stArmCount := Copy(aRealData, 1, 2);
  stDisArmCount := Copy(aRealData, 3, 2);
  if Assigned(FOnKTTRingCount) then
  begin
    OnKTTRingCount(Self,aECUID,stArmCount,stDisArmCount);
  end;

end;

procedure TdmSocket.RcvSysinfo(aECUID, aVer, aRealData: string);
var
  stTemp : string;
  stPowerWatch : string;
  stOutDelay : string;
  stDoor1Type : string;
  stDoor2Type : string;
  stLocate : string;
  stInDelay : string;
  stLockExtend : string;
  nIndex : integer;
begin
  stTemp := Copy(aRealData, 5, 7);
  if not isDigit(stTemp) then Exit;
  G_bDeviceResponse[SYSINFOCHECK] := True;

  stPowerWatch := aRealData[5];  {정전 감시여부}
  stOutDelay := Copy(aRealData, 6, 3);  {퇴실지연시간}
  stDoor1Type := aRealData[10];  {Door1 용도}
  stDoor2Type := aRealData[11];  {Door2 용도}
  stLocate := Trim(Copy(aRealData, 12, 16)); {시스템 위치명}
  stInDelay := Trim(Copy(aRealData, 28, 3)); {입실지연시간}
  if Length(aRealData) > 31 then
    stLockExtend := aRealData[32];

  if Assigned(FOnSystemSetting) then
  begin
    OnSystemSetting(Self,aECUID,stPowerWatch,stOutDelay,stDoor1Type,stDoor2Type,stLocate,stInDelay,stLockExtend);
  end;

  nIndex := DeviceList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 0 then
    TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorType(1,stDoor1Type);
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 1 then
    TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorType(2,stDoor2Type);

end;

procedure TdmSocket.RcvUsedAlarmdisplay(aECUID, aVer, aRealData: string);
begin
//사용안함
end;

procedure TdmSocket.RcvWiznetInfo(aECUID, aVer, aRealData: string);
var
  FHeader: string[2];
  FMacAddress: string[12];
  FMode: string[2];
  FIPAddress: string[8];
  FSubnet: string[8];
  FGateway: string[8];
  FClientPort: string[4];
  FServerIP: string[8];
  FServerPort: string[4];
  FSerial_Baud: string[2];
  FSerial_data: string[2];
  FSerial_Parity: string[2];
  FSerial_stop: string[2];
  FSerial_flow: string[2];
  FDelimiterChar: string[2];
  FDelimiterSize: string[4];
  FDelimitertime: string[4];
  FDelimiterIdle: string[4];
  FDebugMode: string[2];
  FROMVer: string[4];
  FOnDHCP: string[2];
  FReserve: string[4];
  DataStr : string;
begin
  G_bDeviceResponse[WIZNETMODULECHECK] := True;
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  DataStr := Copy(aRealData, 5, 94);

  FHeader := Copy(DataStr, 1, 2);
  FMacAddress := Copy(DataStr, 3, 12);
  FMode := Copy(DataStr, 15, 2);
  FIPAddress := Copy(DataStr, 17, 8);
  FSubnet := Copy(DataStr, 25, 8);
  FGateway := Copy(DataStr, 33, 8);
  FClientPort := Copy(DataStr, 41, 4);
  FServerIP := Copy(DataStr, 45, 8);
  FServerPort := Copy(DataStr, 53, 4);
  FSerial_Baud := Copy(DataStr, 57, 2);
  FSerial_data := Copy(DataStr, 59, 2);
  FSerial_Parity := Copy(DataStr, 61, 2);
  FSerial_stop := Copy(DataStr, 63, 2);
  FSerial_flow := Copy(DataStr, 65, 2);
  FDelimiterChar := Copy(DataStr, 67, 2);
  FDelimiterSize := Copy(DataStr, 69, 4);
  FDelimitertime := Copy(DataStr, 73, 4);
  FDelimiterIdle := Copy(DataStr, 77, 4);
  FDebugMode := Copy(DataStr, 81, 2);
  FROMVer := Copy(DataStr, 83, 4);
  FOnDHCP := Copy(DataStr, 87, 2);
  FReserve := Copy(DataStr, 89, 6);

{ //데이터 변환은 폼에서 하자
  // 4.IP address ★★★★★
  stTemp := Hex2Ascii(FIPAddress);
  stData := '';
  for i := 1 to 4 do
  begin
    if i < 4 then stData := stData + IntToStr(Ord(stTemp[I])) + '.'
    else stData := stData + IntToStr(Ord(stTemp[I]));
  end;
  FIPAddress := stData;


  // 5.Subnet mask ★★★★★
  stData := '';
  stTemp := Hex2Ascii(FSubnet);
  for I := 1 to 4 do
  begin
    if I < 4 then stData := stData + IntToStr(Ord(stTemp[I])) + '.'
    else stData := stData + IntToStr(Ord(stTemp[I]));
  end;
  FSubnet := stData;

  // 6.Gateway address  ★★★★★
  stData := '';
  stTemp := Hex2Ascii(FGateway);
  for I := 1 to 4 do
  begin
    if I < 4 then stData := stData + IntToStr(Ord(stTemp[I])) + '.'
    else stData := stData + IntToStr(Ord(stTemp[I]));
  end;
  FGateway := stData;

  //7.Port number (Client) ★★★★★
  FClientPort := Hex2DecStr(FClientPort);

  //8. Server IP address
  stData := '';
  stTemp := Hex2Ascii(FServerIP);
  for I := 1 to 4 do
  begin
    if I < 4 then stData := stData + IntToStr(Ord(stTemp[I])) + '.'
    else stData := stData + IntToStr(Ord(stTemp[I]));
  end;
  FServerIP := stData;

  //9.  Port number (Server)
  FServerPort := Hex2DecStr(FServerPort);

  //10. Serial speed (bps)

  //11. Serial data size (08: 8 bit), (07: 7 bit)

  //12. Parity (00: No), (01: Odd), (02: Even)

  //13. Stop bit

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)

  //15. Delimiter char

  //16.Delimiter size
  FDelimiterSize := Hex2DecStr(FDelimiterSize);

  //17. Delimiter time
  FDelimitertime := Hex2DecStr(FDelimitertime);

  //18.Delimiter idle time
  FDelimiterIdle := Hex2DecStr(FDelimiterIdle);

  //19. Debug code (00: ON), (01: OFF)

  //20.Software major version

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
}
  if Assigned(FOnWiznetInfoSetting) then
  begin
    OnWiznetInfoSetting(Self,aECUID,FHeader,FMacAddress,FMode,FIPAddress,FSubnet,
           FGateway,FClientPort,FServerIP,FServerPort,FSerial_Baud,FSerial_data,
           FSerial_Parity,FSerial_stop,FSerial_flow,FDelimiterChar,FDelimiterSize,
           FDelimitertime,FDelimiterIdle,FDebugMode,FROMVer,FOnDHCP,FReserve);
  end;

end;

procedure TdmSocket.ZoneStateShow(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stData : string;
begin
  G_bDeviceResponse[PORTSTATE] := True;
  
  stCmd := copy(aRealData,3,2);
  stData := copy(aRealData,5,Length(aRealData) - 4);
  if Assigned(FOnDeviceState) then
  begin
    OnDeviceState(Self,aECUID,stCmd,stData);
  end;

end;

procedure TdmSocket.RcvUsedDevice(aECUID, aVer, aRealData: string);
var
  stDevice : string;
  i : integer;
  stEcuID : string;
begin
  G_bDeviceResponse[USEDEVICECHECK] := True;
  stDevice := copy(aRealData,5,100);
  if Assigned(FOnDeviceUsedSetting) then
  begin
    OnDeviceUsedSetting(Self,aECUID,stDevice);
  end;

  for i := 2 to MAXECUCOUNT + 1 do  // 1번째는 메인임
  begin
    stEcuID := FillZeroNumber(i-1, 2);
    if stDevice[i] = '1' then
    begin
      EcuListAdd(stEcuID);
    end else
    begin
      EcuListDelete(stEcuID);
    end;
  end;

end;

procedure TdmSocket.RcvLampState(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stLampOnOff : string;
  stSirenOnOff : string;
  stLampTime : string;
  stSirenTime : string;
begin
  stCmd := copy(aRealData,3,2);
  if UpperCase(stCmd) = 'EP' then
  begin
    G_bDeviceResponse[ALERTLAMPSIREN] := True;
    stLampOnOff := copy(aRealData,5,1);  //Lamp
    stSirenOnOff := copy(aRealData,6,1);  //Siren
    if Assigned(FOnLampSirenOnOff) then
    begin
      OnLampSirenOnOff(Self,aECUID,stLampOnOff,stSirenOnOff);
    end;
  end else if UpperCase(stCmd) = 'LP' then
  begin
    G_bDeviceResponse[ALERTLAMPTIME] := True;
    stLampTime := copy(aRealData,9,5);
    if IsDigit(stLampTime) then
    begin
      stLampTime := inttostr(strtoint(stLampTime) div 60);
      if Assigned(FOnLampTime) then
      begin
        OnLampTime(Self,aECUID,stLampTime);
      end;
    end;
  end else if UpperCase(stCmd) = 'SI' then
  begin
    G_bDeviceResponse[ALERTSIRENTIME] := True;
    stSirenTime := copy(aRealData,9,5);
    if IsDigit(stSirenTime) then
    begin
      stSirenTime := inttostr(strtoint(stSirenTime) div 60);
      if Assigned(FOnSirenTime) then
      begin
        OnSirenTime(Self,aECUID,stSirenTime);
      end;
    end;
  end;
end;

function TdmSocket.DeviceType_Check(aDelay:Boolean=False): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'EX02';
  G_bDeviceResponse[DEVICETYPECHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(DEVICETYPECHECK,G_nDelayTime);

end;

procedure TdmSocket.RcvDeviceType(aECUID, aVer, aRealData: string);
var
  stDeviceType : string;
begin
  G_bDeviceResponse[DEVICETYPECHECK] := True;
  stDeviceType := copy(aRealData,5,Length(aRealData)-4);
//  if stDeviceCode = 'ACC-503' then  stDeviceType := 'ICU'
//  else stDeviceType := 'ECU';
  if Assigned(FOnDeviceType) then
  begin
    OnDeviceType(Self,aECUID,stDeviceType);
  end;

end;

procedure TdmSocket.RcvSystemFunction(aECUID, aVer, aRealData: string);
var
  stSystemFunction : string;
  stBit : string;
  bJavaraCloseCommand : Boolean;
  bJavaraOpenCommand : Boolean;
  bFireServerCommand : Boolean;
begin
  stSystemFunction := copy(aRealData,5,Length(aRealData)-4);

  G_bDeviceResponse[SYSTEMFUNCTION] := True;

  if Pos('Undefined Command',aRealData) <> 0 then Exit;

  Delete(stSystemFunction,1,4);// 'SyFn' 부분 제거
  stBit := HexToBinary(stSystemFunction);

  case stBit[4] of   //자바라 닫힘 기능
    '0' : bJavaraCloseCommand := False;
    '1' : bJavaraCloseCommand := True;
  else
    bJavaraCloseCommand := False;
  end;
  case stBit[5] of   //자바라 열림 기능
    '0' : bJavaraOpenCommand := False;
    '1' : bJavaraOpenCommand := True;
  else
    bJavaraOpenCommand := False;
  end;
  case stBit[6] of   //화재
    '0' : bFireServerCommand := False;
    '1' : bFireServerCommand := True;
  else
    bFireServerCommand := False;
  end;

  if Assigned(FOnSystemFunction) then
  begin
    OnSystemFunction(Self,aECUID,bJavaraCloseCommand,bJavaraOpenCommand,bFireServerCommand);
  end;

end;

procedure TdmSocket.RcvDeviceVersion(aECUID, aVer, aRealData: string);
var
  stDeviceVersion : string;
begin
  G_bDeviceResponse[DEVICEVERSIONCHECK] := True;
  
  stDeviceVersion := copy(aRealData,5,Length(aRealData)-4);
  if Assigned(FOnDeviceVersion) then
  begin
    OnDeviceVersion(Self,aECUID,stDeviceVersion);
  end;

end;

procedure TdmSocket.RcvCardReaderVersion(aECUID, aVer, aRealData: string);
var
  stCardReaderNo : string;
  stCardReaderVersion : string;
  nReaderPoint : integer;
begin

  stCardReaderNo := copy(aRealData,3,2);

  if isDigit(stCardReaderNo) then
  begin
    nReaderPoint := (strtoint(aEcuID) * G_nCardReaderNumber ) + strtoint(stCardReaderNo);
    G_bCardReaderVersionResponse[nReaderPoint] := True;
  end;

  stCardReaderVersion := copy(aRealData,5,Length(aRealData) - 4);
  if Assigned(FOnCardReaderVersion) then
  begin
    OnCardReaderVersion(Self,aECUID,stCardReaderNo,stCardReaderVersion);
  end;

end;

function TdmSocket.UsedDevice_Check(aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'EX00';
  G_bDeviceResponse[USEDEVICECHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(USEDEVICECHECK,G_nDelayTime);

end;

function TdmSocket.DeviceVersion_Check(aEcuID: string;aDelay: Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'VR00';

  G_bDeviceResponse[DEVICEVERSIONCHECK] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(DEVICEVERSIONCHECK,G_nDelayTime);    //기기타입은 기다리지 말자.

end;

function TdmSocket.ID_Registration(aID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'ID00' + aID;

  G_bDeviceResponse[IDCHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(IDCHECK,G_nDelayTime);
end;

function TdmSocket.UsedDevice_Registration(aUseEcu: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX00' + aUseEcu;

  G_bDeviceResponse[USEDEVICECHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(USEDEVICECHECK,G_nDelayTime);
end;

function TdmSocket.RegistSerialWritewiznet(aIP, aSubNet, aGateway, aPort,
  aServerIP, aServerPort, aMode, aDhcp: string): Boolean;
var
  I: Integer;
  No: Integer;
  st, st2: string;
  DataStr: string;
  FHeader: string[2];
  FMacAddress: string[12];
  FMode: string[2];
  FIPAddress: string[8];
  FSubnet: string[8];
  FGateway: string[8];
  FClientPort: string[4];
  FServerIP: string[8];
  FServerPort: string[4];
  FSerial_Baud: string[2];
  FSerial_data: string[2];
  FSerial_Parity: string[2];
  FSerial_stop: string[2];
  FSerial_flow: string[2];
  FDelimiterChar: string[2];
  FDelimiterSize: string[4];
  FDelimitertime: string[4];
  FDelimiterIdle: string[4];
  FDebugMode: string[2];
  FROMVer: string[4];
  FOnDHCP: string[2];
  FReserve: string[6];
  stData : string;
begin
  Result := false;

  //1.Header
  FHeader := 'AA';
  //2.MAC Address 지정안함
  FMacAddress := '000000000000';
  //3.Mode (Server mode: 01, Client mode: 00)
  FMode := aMode;
  // 4.IP address
  st2 := '';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aIP, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FIPAddress := ToHexStrNoSpace(st2);

  // 5.Subnet mask
  st2 := '';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aSubnet, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FSubnet := ToHexStrNoSpace(st2);

  // 6.Gateway address
  st2 := '';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aGateway, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FGateway := ToHexStrNoSpace(st2);

  //7.Port number (Client)
  st2 := '';
  if aPort = '' then aPort := '3000';
  st := Dec2Hex(strtoint64(aPort), 2);
  if Length(st) < 4 then st := '0' + st;
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FClientPort := ToHexStrNoSpace(st2);

  //8. Server IP address
  st2 := '';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aServerIp, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FServerIP := ToHexStrNoSpace(st2);

  //9.  Port number (Server)
  st2 := '';
  if aServerPort = '' then aServerPort := '3000';
  st2 := '';
  st := Dec2Hex(strtoint64(aServerPort), 2);
  if Length(st) < 4 then st := '0' + st;
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FServerPort := ToHexStrNoSpace(st2);

  //10. Serial speed (bps)
  FSerial_Baud := 'FD';
  {
  case ComboBox_Boad.ItemIndex of
    0: FSerial_Baud:= 'F4'; //9600           F4
    1: FSerial_Baud:= 'FA'; //19200          FA
    2: FSerial_Baud:= 'FD'; //38400 Default  FD
    3: FSerial_Baud:= 'FE'; //57600          FE
    4: FSerial_Baud:= 'FF'; //115200         FF
    else FSerial_Baud:= 'FD';
  end;
   }

  //11. Serial data size (08: 8 bit), (07: 7 bit)
  FSerial_data := '08';

  //12. Parity (00: No), (01: Odd), (02: Even)
  FSerial_Parity := '00';
  //13. Stop bit
  FSerial_stop := '01';

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
  FSerial_flow := '00';

  //15. Delimiter char
  FDelimiterChar := '03';

  //16.Delimiter size
  st := '0000';
  st2 := '';
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FDelimiterSize := ToHexStrNoSpace(st2);
                              
  //17. Delimiter time
  st := Dec2Hex(strtoint64('10'), 2);
  st := FillZeroStrNum(st, 4);

  st2 := '';
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FDelimitertime := ToHexStrNoSpace(st2);

  //18.Delimiter idle time
  st := '0000';
  st2 := '';
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FDelimiterIdle := ToHexStrNoSpace(st2);

  //19. Debug code (00: ON), (01: OFF)
  FDebugMode := '01';

  //20.Software major version
  FROMVer := '0000';

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
  FOnDHCP := aDhcp;

  //22.Reserved for future use
  FReserve := '000000';

  DataStr := FHeader + FMacAddress + FMode + FIPAddress + FSubnet +
    FGateway + FClientPort + FServerIP + FServerPort + FSerial_Baud +
    FSerial_data + FSerial_Parity + FSerial_stop + FSerial_flow +
    FDelimiterChar + FDelimiterSize + FDelimitertime + FDelimiterIdle +
    FDebugMode + FROMVer + FOnDHCP + FReserve;

  stData := 'NW00' + DataStr;

  G_bDeviceResponse[SERIALWIZNET] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(SERIALWIZNET,G_nDelayTime);

end;

function TdmSocket.SysInfo_Check(aEcuID: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SY00';

  G_bDeviceResponse[SYSINFOCHECK] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(SYSINFOCHECK,G_nDelayTime);

end;

function TdmSocket.RegistSystemInfo(aEcuID, aWatchPowerOff, aDelayIn,
  aDelayOut, aDoor1Type, aDoor2Type, aLocate: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SY00' +                                   // COMMAND
    aWatchPowerOff +                                  // 정전감시여부
    FillZeroNumber(strtoint(aDelayOut), 3) +          // 퇴실지연시간
    '2' +                                             // 예비
    aDoor1Type +                                      // Door1
    aDoor2Type +                                      //Door2
    SetStrLength(aLocate, 16) +                           // 위치명
    FillZeroNumber(strtoint(aDelayIn), 3) +           // 입실지연시간
    '0' ;                                             // 관제 통신 방식(고정)

  G_bDeviceResponse[SYSINFOCHECK] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(SYSINFOCHECK,G_nDelayTime);

end;

function TdmSocket.AlarmState_Check(aEcuID: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'RD00' + aEcuID;

  G_bDeviceResponse[ALARMSTATECHECK] := False;

  SendPacket('00', 'R', stData,G_stDeviceVer, aDelay);

  if aDelay then
  result := ResponseCheck(ALARMSTATECHECK,G_nDelayTime);

end;

procedure TdmSocket.DeviceRcvAlarmSearchData(aECUID, aVer,
  aRealData: string);
var
  stTime : string;
  stSubCLass : string;
  stSubAddr : string;
  stZone : string;
  stMode : string;
  stStatus : string;
  stLoop : string;
  stState : string;
  stOper : string;
  nIndex : integer;
begin
  G_bDeviceResponse[ALARMSTATECHECK] := True;
  
  stTime     := copy(aRealData,2,14);
  stSubCLass := copy(aRealData,16,2);
  stSubAddr  := copy(aRealData,18,2);
  stZone     := copy(aRealData,20,2);
  stMode     := copy(aRealData,22,1);
  stStatus   := copy(aRealData,23,2);
  stLoop     := copy(aRealData,25,2);
  stState    := copy(aRealData,27,1);
  if aVer = 'ST' then
  begin
    if isDigit(copy(aRealData,28,2)) then stOper := copy(aRealData,30,strtoint(copy(aRealData,28,2)))
    else stOper     := copy(aRealData,28,10);
  end
  else
    stOper     := copy(aRealData,28,10);

  if Assigned(FOnAlarmEvent) then
  begin
    OnAlarmEvent(Self,aECUID,stTime,stSubCLass,stSubAddr,stZone,stMode,stStatus,stLoop,stState,stOper);
  end;

  if (stSubCLass = 'MN') or (stSubCLass = 'EX') or (stSubCLass = 'SC') then
  begin
    if stStatus = 'NF' then ECUConnected(aECUID,False)
    else ECUConnected(aECUID,True);
  end else ECUConnected(aECUID,True);

end;

function TdmSocket.ChangeAlarmMode(aEcuID, aMode: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'MC' +         //COMMAND
            '00' +                //ZONE 고정
            aMode;                //A:경계, D:해제, P:순회

  G_bDeviceResponse[ALARMCONTROL] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALARMCONTROL,G_nDelayTime);

end;

function TdmSocket.DoorSystemInfo_Check(aEcuID, aDoorNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'B' + '0' +                             //MSG Code
            aDoorNo +               //문번호
            #$20 + #$20 + '00000000000000000000';          //조회는 전체를 '0'으로 마킹

  G_bDeviceResponse[DOORSYSTEMCHECK] := False;
  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);
  result := ResponseCheck(DOORSYSTEMCHECK,G_nDelayTime);

end;

function TdmSocket.RegistDoorSystemInfo(aEcuID, aDoorNo, aCardModeType,
  aDoorModeType, aDoorControlTime, aDoorLongOpenTime, aScheduleUse,
  aDoorStatusUse, aDoorLongTimeUse, aDoorLockType, aDoorFireOpenUse,
  aDoorDSOpenState, aRemoteOpen: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'A' +                       //MSG Code
    '0' +                              //Msg Count(고정)
    aDoorNo +                //문번호
    #$20 + #$20 +                      // Record count
    aCardModeType +              //카드운영모드
    aDoorModeType +              //출입문 운영모드
    aDoorControlTime +          //Door제어 시간
    aDoorLongOpenTime +          //장시간 열림 경보
    aScheduleUse +           //스케줄 적용유무
    aDoorStatusUse +         //출입문상태전송
    '0' +                              //통신이상시 기기운영(사용안함:고정)
    '0' +                              //AntiPassBack(사용안함:고정)
    aDoorLongTimeUse +          //장시간 열림 부저출력
    '0' +                              //통신 이상시 부저 출력 (사용안함:고정)
    aDoorLockType +              //전기정 타입
    aDoorFireOpenUse +         //화재 발생시 문제어
    '0' +                              //DS LS 검사(사용안함:고정)
    aDoorDSOpenState +           //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
    aRemoteOpen +  //원격해제시 (DoorOpen 0x30,DoorClose 0x31)
    '00000';                           //예비

  G_bDeviceResponse[DOORSYSTEMCHECK] := False;

  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);

  result := ResponseCheck(DOORSYSTEMCHECK,G_nDelayTime);


end;

function TdmSocket.DoorLockDeviceState_Check(aEcuID:string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SM20';

  G_bDeviceResponse[LOCKSTATECHECK] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(LOCKSTATECHECK,G_nDelayTime);

end;

function TdmSocket.ZoneSensState_Check: Boolean;
var
  stData : string;
begin
  AlarmVariable_Initialize;

  Result := false;
  stData := 'SM24';

  G_bDeviceResponse[ZONESENSECHECK] := False;
  SendPacket('00', 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(ZONESENSECHECK,G_nDelayTime);

end;

procedure TdmSocket.AlarmVariable_Initialize;
var
  i : integer;
begin
  for i := 0 to HIGH(G_bFireDevice) do
  begin
    G_bFireDevice[i] := False;
  end;

end;

function TdmSocket.CardReaderType_Check(aEcuID:string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Ct00';

  G_bDeviceResponse[CARDREADERTYPE] := False;
  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, True);
  result := ResponseCheck(CARDREADERTYPE,G_nDelayTime);

end;

function TdmSocket.CardReaderInfo_Check(aEcuID,
  aReaderNo: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
  nReaderPoint : integer;
begin
  Result := false;
  stData := 'CD' + FillZeroNumber(strtoint(aReaderNo), 2);

  nReaderPoint := (strtoint(aEcuID) * G_nCardReaderNumber ) + strtoint(aReaderNo);

  G_bCardReaderResponse[nReaderPoint] := False;
//  G_bDeviceResponse[CARDREADERINFO] := False;
  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
     result := CardReaderResponseCheck(nReaderPoint,G_nDelayTime);

end;

function TdmSocket.CardReaderVersion_Check(aEcuID,
  aReaderNo: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
  nReaderPoint : integer;
begin
  Result := false;
  stData := 'CV' + FillZeroNumber(strtoint(aReaderNo), 2);

  nReaderPoint := (strtoint(aEcuID) * G_nCardReaderNumber ) + strtoint(aReaderNo);
  G_bCardReaderVersionResponse[nReaderPoint] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay);
  if aDelay then
  result := CardReaderVersionResponseCheck(nReaderPoint,G_nDelayTime);

end;

function TdmSocket.RegistCardType(aEcuID, aCardType: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Ct00' + aCardType;

  G_bDeviceResponse[CARDREADERTYPE] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(CARDREADERTYPE,G_nDelayTime);

end;

function TdmSocket.RegistCardReaderInfo(aEcuID: string; aReaderNo,
  aReaderUse, aReaderDoor, aReaderDoorLocate,
  aReaderBuildingLocate: integer; aLocate: string): Boolean;
var
  stData : string;
  nReaderPoint : integer;
begin
  stData := 'CD' +                                      //COMMAND
    FillZeroNumber(aReaderNo, 2) +                        //리더 번호
    IntToStr(aReaderUse) +                                //리더 사용 유무
    IntToStr(aReaderDoorLocate) +                         //리더 위치
    IntToStr(aReaderDoor) +                               //Door No
    '00' +                                                //존번호
    SetStrLength(aLocate, 16) +                              //위치명
    IntToStr(aReaderBuildingLocate);                      //건물설치위치

  nReaderPoint := (strtoint(aEcuID) * G_nCardReaderNumber ) + aReaderNo;

  G_bCardReaderResponse[nReaderPoint] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := CardReaderResponseCheck(nReaderPoint,G_nDelayTime);

end;

function TdmSocket.AllFireRecovery: Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SM2599';

  G_bDeviceResponse[FIRERECOVERY] := False;
  SendPacket('00', 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(FIRERECOVERY,G_nDelayTime);

end;

procedure TdmSocket.RcvFireRecovery(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[FIRERECOVERY] := True;
end;

function TdmSocket.RemoteDoorControl(aEcuID, aDoorNo, aControlType,
  aControl: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'C' + '0' +                      //정상/비정상 여부
            aDoorNo +                        //기기내 문번호
            '0' +                            //고정
            aControlType +                   //'0':해당사항없음,'1':카드운영,'2':출입운영,'3':원격제어
            aControl;                        // 카드운영:Positive:'0',Negative:'1'
  // 출입운영:'0':운영 ,'1':개방
  // 원격제어:'0':시정,'1':해정

  G_bDeviceResponse[DOORCONTROL] := False;
  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);
  result := ResponseCheck(DOORCONTROL,G_nDelayTime);

end;

function TdmSocket.PortInfo_Check(aEcuID, aPortNo: string): Boolean;
var
  stData : string;
  nPortPoint : integer;
begin
  Result := false;
  stData := 'LP' + FillZeroNumber(strtoint(aPortNo), 2);

  nPortPoint := (strtoint(aEcuID) * G_nPortNumber ) + strtoint(aPortNo);
  G_bPortResponse[nPortPoint] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, True);
  result := PortResponseCheck(nPortPoint,G_nDelayTime);

end;

function TdmSocket.PortState_Check(aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SM10';

  G_bDeviceResponse[PORTSTATE] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(PORTSTATE,G_nDelayTime);

end;

function TdmSocket.RegistPortInfo(aEcuID, aPortNo, aWatchType, aDelayUse,
  aRecoverUse, aPortDelayTime, aStatusCode, aLocate: string): Boolean;
var
  stData : string;
  nPortPoint : integer;
begin

  stData := 'LP' +                             //COMMAND
    FillZeroNumber(strtoint(aPortNo),2) +      //포트번호
    aStatusCode +                              //상태코드('SS' 디폴트)
    aWatchType +                               //감시형태
    '0' +                                      //알람발생 방식(고정)
    aRecoverUse +                              //복구신호전송(고정)
    aDelayUse +                                //지연시간 사용유무
    '00' +                                     //램프
    '00' +                                     //싸이렌
    '00' +                                     //릴레이1
    '00' +                                     //릴레이2
    '00' +                                     //출입문연동1
    '00' +                                     //출입문연동2
    '00' +                                     //메인램프
    '00' +                                     //메인싸이렌
    '00' +                                     //메인릴레이1
    '00' +                                     //메인릴레이2
    '00' +                                     //존번호
    SetStrLength(aLocate, 16) +                   //위치명
    FillZeroNumber(strtoint(aPortDelayTime), 2) +           //감지시간
    '00';                                      //사용안함

  nPortPoint := (strtoint(aEcuID) * G_nPortNumber ) + strtoint(aPortNo);
  G_bPortResponse[nPortPoint] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := PortResponseCheck(nPortPoint,G_nDelayTime);

end;

function TdmSocket.WiznetModuleInfo_Check(aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'NW00';

  G_bDeviceResponse[WIZNETMODULECHECK] := False;

  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);
  if aDelay then
  result := ResponseCheck(WIZNETMODULECHECK,G_nDelayTime);

end;

function TdmSocket.EcuStatusCheck: Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'cs00';

  G_bDeviceResponse[ECUSTATE] := False;

  SendPacket('00', 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(ECUSTATE,G_nDelayTime);

end;

procedure TdmSocket.RcvEcuState(aEcuId, aVer, aRealData: string);
var
  i : integer;
begin
  G_bDeviceResponse[ECUSTATE] := True;
  if Assigned(FOnEcuState) then
  begin
    OnEcuState(Self,aECUID,aRealData);
  end;
  Delete(aRealData,1,4);
  for i:= 1 to Length(aRealData) do
  begin
    if aRealData[i] = '1' then
    begin
      ECUConnected(FillZeroNumber(i-1,2),True);
    end else
    begin
      ECUConnected(FillZeroNumber(i-1,2),False);
    end;
  end;
end;

procedure TdmSocket.SendTimerTimer(Sender: TObject);
var
  stTemp : string;
begin

  if Not Commport.Open then Exit;

  if L_bSending then
  begin
    L_bSending := False;
    Exit;
  end;

  if FirstSendDataList.Count > 0 then
  begin
    stTemp := FirstSendDataList.Strings[0];
    FirstSendDataList.Delete(0);
    L_bSending := True;
    SocketPutString(stTemp);
    Exit;
  end;

  if QuickSendDataList.Count > 0 then
  begin
    stTemp := QuickSendDataList.Strings[0];
    QuickSendDataList.Delete(0);
    L_bSending := True;
    SocketPutString(stTemp);
    Exit;
  end;
  
  if ReserveSendDataList.Count > 0 then
  begin
    stTemp := ReserveSendDataList.Strings[0];
    ReserveSendDataList.Delete(0);
    L_bSending := True;
    SocketPutString(stTemp);
  end;
end;

function TdmSocket.DeviceCardSearch(aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'CD11';

  G_bDeviceResponse[CARDLIST] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(CARDLIST,G_nDelayTime);

end;

function TdmSocket.CardDownLoad(aEcuID, aCardNo, aPermit, aDoor1, aDoor2,
  aAlarm, aValidDate,aPatrolCardType,aCardType: string): Boolean;
var
  stData : string;
  stRegCode : string;
  stCardType : string;
  stTempCardNo : string;
  nCardLength : integer;
begin
  if aPatrolCardType <> 'V' then aPatrolCardType := ' ';

  if aDoor1 = 'Y' then
  begin
    stRegCode := '1';     //첫번째 문 등록
    if aDoor2 = 'Y' then stRegCode := '0';       //첫번째 두번째 문등록
  end
  else if aDoor2 = 'Y' then
  begin
    stRegCode := '2';  //두번째 문
  end else stRegCode := '3';   //방범전용

  if aAlarm = 'Y' then
  begin
    if stRegCode = '3' then stCardType := '1' //방범전용
    else stCardType := '2';   //출입방범
  end else
  begin
    stCardType := '0';    //출입
    if aPatrolCardType <> 'V' then
    begin
      if stRegCode = '3' then aPermit :='N';  //방범 출입 권한 모두 없으면 삭제
    end;
  end;

  nCardLength := Length(aCardNo);
  if (aCardType = AUTOKT811) or    //무인국사
     (aCardType = COMMON811) then  //범용
  begin
    stTempCardNo := inttostr(Hex2Dec64(aCardNo));
    stTempCardNo := EncodeCardNo(stTempCardNo);
    aCardNo := stTempCardNo;
    nCardLength := 0;
  end;
  if Length(aValidDate) <> 6 then aValidDate := FillZeroNumber(0,6);

  stData:= aPermit +
          //InttoStr(Send_MsgNo)+     // Message Count
          '0'+
          stRegCode+                      //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          ' '+                     //RecordCount  #$20
          aPatrolCardType +        //순찰카드
          '0'+                      //예비
          FillzeroNumber(nCardLength,2) + //카드길이
          aCardNo+                  //카드번호
          aValidDate +              //유효기간
          '0'+                      //등록 결과
          stCardType+               //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          '0'                       //타입패턴
          ;                         // 위치 정보

  G_bDeviceResponse[CARDDOWNLOADACK] := False;

  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);

  //result := ResponseCheck(CARDDOWNLOADACK,G_nDelayTime);

end;

function TdmSocket.CardSearchCancel(aEcuID: string): Boolean;
var
  stData : string;
begin
  stData := 'CD10';
  G_bDeviceResponse[CARDLISTCANCEL] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);

  result := ResponseCheck(CARDLISTCANCEL,G_nDelayTime);   

end;

function TdmSocket.DeviceSchedule_Check(aEcuID, aDoorNo,
  aDayCode: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData:= 'P'+        //Command
        '0'+        //Message Code
        aDoorNo+      //기기내 출입문 번호
        #$20+
        aDayCode;       //요일:0평일,1반휴일,2:일요일,3휴일

  G_bDeviceResponse[SCHEDULE] := False;

  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);
  result := ResponseCheck(SCHEDULE,G_nDelayTime);

end;

function TdmSocket.RegistrationDeviceSchedule(aEcuID,aDoorNo,aDayCode,
  aScheduleData: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData:= 'S'+        //Command
        '0'+        //Message Code
        aDoorNo+      //기기내 출입문 번호
        #$20+
        aDayCode+       //요일:0평일,1반휴일,2:일요일,3휴일
        aScheduleData;      // Mode Data

  G_bDeviceResponse[SCHEDULE] := False;

  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);

  result := ResponseCheck(SCHEDULE,G_nDelayTime);

end;

function TdmSocket.Holiday_Search(aEcuID, aDoorNo, aDate,aHolidayType: string): string;
var
  stData : string;
  bResult : Boolean;
  i : integer;
  stEcuID : string;
  stDoorNo : string;
begin
  Result := '';
  stData := 'R' + //조회'R'
            '0' + //정상 0 에러 1
            aDoorNo + //0:전체,1:1번문,2:2번문
            ' ' + //스페이스
            ' ' + //A:추가,D삭제,W:전체삭제
            aDate + //MMDD
            aHolidayType;  //'3' : 특정일

  G_bDeviceResponse[HOLIDAY] := False;
  L_stReceiveHoliday := '';
  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);

  bResult := ResponseCheck(HOLIDAY,G_nDelayTime);

  if L_stReceiveHoliday = '' then Exit;

  stEcuID := copy(L_stReceiveHoliday,1,2);
  Delete(L_stReceiveHoliday,1,2);
  Try
    stDoorNo := L_stReceiveHoliday[3];
  Except
    Exit;
  End;
  if (stEcuID = aEcuID) and (stDoorNo = aDoorNo) then
  begin
    Delete(L_stReceiveHoliday,1,5);
    result := L_stReceiveHoliday;
    Exit;
  end;
  G_bDeviceResponse[HOLIDAY] := False;
  L_stReceiveHoliday := '';

end;

function TdmSocket.registHoliday(aEcuID, aDoorNo,aCMD, aHoliday,
  aHolidayType: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'Q' + //조회'R'
            '0' + //정상 0 에러 1
            aDoorNo + //0:전체,1:1번문,2:2번문
            ' ' + //스페이스
            aCMD + //A:추가,D삭제,W:전체삭제
            aHoliday + //MMDD
            aHolidayType;  //'3' : 특정일

  G_bDeviceResponse[HOLIDAY] := False;

  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);

  result := ResponseCheck(HOLIDAY,G_nDelayTime);

end;

function TdmSocket.registTime(aDate: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'TM00' +   // COMMAND
            aDate;         // 시간데이터

  G_bDeviceResponse[TIME] := False;

  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := ResponseCheck(TIME,G_nDelayTime);

end;

function TdmSocket.TimeCheck: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'TM00' +   // COMMAND
            '20999999999999';         // 시간데이터

  G_bDeviceResponse[TIME] := False;

  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := ResponseCheck(TIME,G_nDelayTime);

end;

function TdmSocket.CdmaUseCheck: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL00';
  G_bDeviceResponse[USECDMACHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(USECDMACHECK,G_nDelayTime);

end;

procedure TdmSocket.RcvCCCSettingData(aECUID, aVer, aRealData: string);
var
  stGubun : string;
begin
  stGubun:= Copy(aRealData,3,2);

  if stGubun = '00' then
  begin
    G_bDeviceResponse[USECDMACHECK] := True;
    if Assigned(FOnCDMASetting) then
    begin
      OnCDMASetting(Self,aECUID,aRealData[5]);
    end;
  end else if stGubun = '01' then
  begin
    G_bDeviceResponse[conCCCInfoCHECK] := True;
    if Assigned(FOnCCCInfoSetting) then
    begin
      Delete(aRealData,1,4);
      OnCCCInfoSetting(Self,aECUID,aRealData);
    end;
  end else if stGubun = '02' then
  begin
    G_bDeviceResponse[conCCCInfoCHECK] := True;
    if Assigned(FOnCCCInfoSetting) then
    begin
      Delete(aRealData,1,4);
      Delete(aRealData,1,1);
      OnCCCInfoSetting(Self,aECUID,aRealData);
    end;
  end else if stGubun = '20' then
  begin
    G_bDeviceResponse[conCCCTimeIntervalCheck] := True;
    if Assigned(FOnCCCTimeInterval) then
    begin
      Delete(aRealData,1,4);
      OnCCCTimeInterval(Self,aECUID,aRealData);
    end;
  end;

end;

function TdmSocket.CCCInfoCheck: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL01';
  G_bDeviceResponse[conCCCInfoCHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCInfoCHECK,G_nDelayTime);

end;

function TdmSocket.CCCTimeIntervalCheck: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL20';
  G_bDeviceResponse[conCCCTimeIntervalCheck] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCTimeIntervalCheck,G_nDelayTime);

end;

function TdmSocket.CCCStartTimeCheck: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL21';
  G_bDeviceResponse[conCCCStartTimeCheck] := False;
  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCStartTimeCheck,G_nDelayTime);

end;

procedure TdmSocket.RcvCCCControlData(aECUID, aVer, aRealData: string);
var
  stGubun : string;
begin
  stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);
  if stGubun = '20' then
  begin
    G_bDeviceResponse[conCCCStartTimeCheck] := True;
    if Assigned(FOnCCCStartTime) then
    begin
      OnCCCStartTime(Self,aECUID,aRealData);
    end;
  end else if stGubun = '21' then
  begin
    G_bDeviceResponse[conCCCStartTimeCheck] := True;
    if Assigned(FOnCCCStartTime) then
    begin
      OnCCCStartTime(Self,aECUID,aRealData);
    end;
  end;

end;

function TdmSocket.CdmaUseRegist(aData: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL00' + aData;
  G_bDeviceResponse[USECDMACHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(USECDMACHECK,G_nDelayTime);

end;

function TdmSocket.CCCInfoRegist(aIP, aPort: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL01' + aIP + ' ' + aPort;
  G_bDeviceResponse[conCCCInfoCHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCInfoCHECK,G_nDelayTime);

end;

function TdmSocket.CCCTimeIntervalRegist(aTime: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL20'+ aTime;
  G_bDeviceResponse[conCCCTimeIntervalCheck] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCTimeIntervalCheck,G_nDelayTime);

end;

function TdmSocket.CCCStartTimeRegist(aTime: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL20' + aTime;
  G_bDeviceResponse[conCCCStartTimeCheck] := False;
  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCStartTimeCheck,G_nDelayTime);

end;

function TdmSocket.MacSearch: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'NW00';

  G_bDeviceResponse[MACINFO] := False;

  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(MACINFO,G_nDelayTime);

end;

function TdmSocket.RegistMacAddress(aMac: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData:= 'NW99'+
          'AA'+
          aMac +
          '~mAc^wRITe^coNFIrm~';

  G_bDeviceResponse[MACINFO] := False;

  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(MACINFO,G_nDelayTime);

end;

function TdmSocket.DoorState_Check(aEcuID, aDoorNo: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'C' + '0' +                             //MSG Code
            aDoorNo +                               //문번호
            '000' ;                               //조회는 전체를 '0'으로 마킹

  G_bDeviceResponse[DOORCONTROL] := False;
  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, aDelay);
  if aDelay then
  result := ResponseCheck(DOORCONTROL,G_nDelayTime);

end;

procedure TdmSocket.RcvDeviceCode(aECUID, aVer, aRealData: string);
var
  stDeviceCode : string;
begin
  G_bDeviceResponse[DEVICECODECHECK] := True;
  stDeviceCode := copy(aRealData,5,Length(aRealData)-4);
  if Assigned(FOnDeviceCode) then
  begin
    OnDeviceCode(Self,aECUID,stDeviceCode);
  end;

end;

function TdmSocket.DeviceCode_Check(aEcuID: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'VR01';

  G_bDeviceResponse[DEVICECODECHECK] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);

  if aDelay then
    result := ResponseCheck(DEVICECODECHECK,G_nDelayTime);    //기기타입은 기다리지 말자.

end;

function TdmSocket.DeviceType_Registration(aUseEcuType: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX02' + aUseEcuType;

  G_bDeviceResponse[DEVICETYPECHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(DEVICETYPECHECK,G_nDelayTime);

end;

function TdmSocket.KTTSystemID_Registration(aLinkusID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Id00' + aLinkusID;

  G_bDeviceResponse[KTTSYSTEMID] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTSYSTEMID,G_nDelayTime);

end;

procedure TdmSocket.RcvKTTSystemId(aECUID, aVer, aRealData: string);
var
  stTemp: string;
begin
  G_bDeviceResponse[KTTSYSTEMID] := True;
  stTemp := copy(aRealData,5,4);
  if stTemp <> 'AAAA' then
  begin
    stTemp := FillZeroNumber(Hex2Dec(stTemp),4);
  end;
  if Assigned(FOnKTTSystemID) then
  begin
    OnKTTSystemID(Self,aECUID,stTemp);
  end;

end;

procedure TdmSocket.RcvKTTTelNo(aECUID, aVer, aRealData: string);
var
  stTemp: string;
begin
  G_bDeviceResponse[KTTTELNUM] := True;
  stTemp := copy(aRealData,5,2);
  Delete(aRealData, 1, 6);
  if Assigned(FOnKTTTelNumber) then
  begin
    OnKTTTelNumber(Self,aECUID,stTemp,aRealData);
  end;

end;

procedure TdmSocket.RcvCardReaderTelNo(aECUID, aVer, aRealData: string);
var
  stTemp: string;
begin
  G_bDeviceResponse[CARDREADERTELNUMBERCHECK] := True;
  stTemp := copy(aRealData,5,2);
  Delete(aRealData, 1, 6);
  if Assigned(FOnCARDREADERTelNumber) then
  begin
    OnCARDREADERTelNumber(Self,aECUID,stTemp,aRealData);
  end;

end;

function TdmSocket.RegistKTTTelNum(aNo, aTelNum: string): Boolean;
var
  stData : string;
begin
  Result := false;
  aTelNum := SetSpaceLength(aTelNum, 20);
  stData := 'Tn00' + FillZeroNumber(strtoint(aNo),2) + aTelNum;

  G_bDeviceResponse[KTTTELNUM] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTTELNUM,G_nDelayTime);

end;

function TdmSocket.RegistKTTRingCount(aArmRingCount,
  aDisArmRingCount: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Rc00' + FillZeroNumber(aArmRingCount,2) + FillZeroNumber(aDisArmRingCount,2);

  G_bDeviceResponse[KTTRINGCOUNT] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTRINGCOUNT,G_nDelayTime);

end;

function TdmSocket.KTTRingCountSearch: Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Rc00';

  G_bDeviceResponse[KTTRINGCOUNT] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTRINGCOUNT,G_nDelayTime);

end;

function TdmSocket.KTTSystemIDSearch: Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Id00';

  G_bDeviceResponse[KTTSYSTEMID] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTSYSTEMID,G_nDelayTime);

end;

function TdmSocket.KTTTelNumSearch(aNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Tn00' + FillZeroNumber(strtoint(aNo),2);

  G_bDeviceResponse[KTTTELNUM] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTTELNUM,G_nDelayTime);

end;



function TdmSocket.ControlerReset(aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'RS00Reset';

  G_bDeviceResponse[DEVICERESET] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(DEVICERESET,G_nDelayTime);

end;

function TdmSocket.RegistArmDsCheck(aEcuID, aDoorNo,
  aArmDsCheck: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL01' +                                   // COMMAND
    FillZeroNumber(strtoint(aDoorNo),2) +             // 출입문번호
    aArmDsCheck;                                         // 0 : 미사용,1:사용

  G_bDeviceResponse[ARMDSCHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(ARMDSCHECK,G_nDelayTime);

end;

procedure TdmSocket.RcvArmDsCheck(aECUID, aVer, aRealData: string);
var
  //stGubun : string;
  stDoorNo : string;
begin
  G_bDeviceResponse[ARMDSCHECK] := True;
  //stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);
  stDoorNo := copy(aRealData,1,2);
  if Not isDigit(stDoorNo) then Exit;
  stDoorNo := inttostr(strtoint(stDoorNo));
  if stDoorNo = '1' then
  begin
    if isDigit(aRealData[3]) then
    begin
      if strtoint(aRealData[3]) < 2 then
      begin
      //여기서 ArmDs 체크
        if Assigned(FOnArmDsCheck) then
        begin
          OnArmDsCheck(Self,aECUID,stDoorNo,aRealData[3]);
        end;
      end;
    end;
  end;


end;

function TdmSocket.SearchArmDsCheck(aEcuID, aDoorNo: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL01' +                                   // COMMAND
    FillZeroNumber(strtoint(aDoorNo),2) ;             // 출입문번호

  G_bDeviceResponse[ARMDSCHECK] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(ARMDSCHECK,G_nDelayTime);

end;

function TdmSocket.RegistArmRelay(aEcuID, aArmRelay: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn05';
  if aArmRelay = '1'  then stData := stData + 'D'
  else stData := stData + 'A';

  G_bDeviceResponse[ARMRELAYTYPE] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(ARMRELAYTYPE,G_nDelayTime);

end;

procedure TdmSocket.RcvArmRelayCheck(aECUID, aVer, aRealData: string);
var
  nArmRelay : integer;
begin
  G_bDeviceResponse[ARMDSCHECK] := True;
  //stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);
  if UpperCase(aRealData[1]) = 'A' then nArmRelay := 0
  else if UpperCase(aRealData[1]) = 'D' then nArmRelay := 1
  else Exit;

  if Assigned(FOnArmRelayCheck) then
  begin
    OnArmRelayCheck(Self,aECUID,'',inttostr(nArmRelay));
  end;

end;

function TdmSocket.SearchArmRelay(aEcuID: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn05';

  G_bDeviceResponse[ARMRELAYTYPE] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(ARMRELAYTYPE,G_nDelayTime);

end;

function TdmSocket.RegistAlartLampSiren(aEcuID, aAlertLamp,
  aAlertSiren: string): Boolean;
var
  stData : string;
begin

  stData := 'RYEP'+aAlertLamp+aAlertSiren;

  G_bDeviceResponse[ALERTLAMPSIREN] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALERTLAMPSIREN,G_nDelayTime);

end;

function TdmSocket.AlartLampSirenStateCheck(aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'RYEP';

  G_bDeviceResponse[ALERTLAMPSIREN] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALERTLAMPSIREN,G_nDelayTime);

end;

function TdmSocket.RegistAlertLampTime(aEcuID,
  aAlertLampTime: string): Boolean;
var
  stData : string;
begin

  if Not isDigit(aAlertLampTime) then Exit;

  stData := 'RYLP1110'+FillZeroNumber(strtoint(aAlertLampTime) * 60,5) ;

  G_bDeviceResponse[ALERTLAMPTIME] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALERTLAMPTIME,G_nDelayTime);

end;

function TdmSocket.RegistAlertSirenTime(aEcuID,
  aAlertSirenTime: string): Boolean;
var
  stData : string;
begin

  if Not Isdigit(aAlertSirenTime) then Exit;

  stData := 'RYSI1110'+FillZeroNumber(strtoint(aAlertSirenTime) * 60,5);

  G_bDeviceResponse[ALERTSIRENTIME] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALERTSIRENTIME,G_nDelayTime);

end;

function TdmSocket.AlertLampTimeCheck(aEcuID: string): Boolean;
var
  stData : string;
begin
  stData := 'RYLP1110';

  G_bDeviceResponse[ALERTLAMPTIME] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALERTLAMPTIME,G_nDelayTime);

end;

function TdmSocket.AlertSirenTimeCheck(aEcuID: string): Boolean;
var
  stData : string;
begin

  stData := 'RYSI1110';

  G_bDeviceResponse[ALERTSIRENTIME] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALERTSIRENTIME,G_nDelayTime);

end;


function TdmSocket.RegistcdmaSetData(aEcuID, aCdmaMin, aCdmaMux, aCdmaIP,
  aCdmaPort, aCdmachktime, aCdmarssi: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL02' +
                aCdmaMin + '}' +
                aCdmaMux + '}' +
                aCdmaIP + '}' +
                aCdmaPort + '}' +
                aCdmachktime + '}' +
                aCdmarssi + '}';

  G_bDeviceResponse[conCCCInfoCHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCInfoCHECK,G_nDelayTime);

end;

function TdmSocket.DVRUseRegist(aData: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'DV00' + aData;
  G_bDeviceResponse[USEDVRCHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(USEDVRCHECK,G_nDelayTime);

end;

procedure TdmSocket.RcvDVRSettingData(aECUID, aVer, aRealData: string);
var
  stGubun : string;
begin
  stGubun:= Copy(aRealData,3,2);
  delete(aRealData,1,4);
  if stGubun = '00' then
  begin
    G_bDeviceResponse[USEDVRCHECK] := True;
    if Assigned(FOnDVRUseSetting) then
    begin
      OnDVRUseSetting(Self,aECUID,aRealData);
    end;
  end else if stGubun = '01' then
  begin
    G_bDeviceResponse[DVRInfoCHECK] := True;
    if Assigned(FOnDVRInfoSetting) then
    begin
      OnDVRInfoSetting(Self,aECUID,aRealData);
    end;
  end;

end;

function TdmSocket.RegistDVRSetData(aEcuID, aDVRIP,
  aDVRPort: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'DV01' +
                aDVRIP + ' ' +
                aDVRPort ;

  G_bDeviceResponse[DVRInfoCHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(DVRInfoCHECK,G_nDelayTime);

end;

function TdmSocket.DVRUseCheck(aEcuID: String): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'DV00';
  G_bDeviceResponse[USEDVRCHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(USEDVRCHECK,G_nDelayTime);
end;

function TdmSocket.DVRSetDataSearch(aEcuID: String): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'DV01';
  G_bDeviceResponse[DVRInfoCHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(DVRInfoCHECK,G_nDelayTime);

end;

 
function TdmSocket.CardReaderTelNumberSearch(aEcuID,
  aTelNo: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'TN01' + FillZeroNumber(strtoint(aTelNo),2);
  G_bDeviceResponse[CARDREADERTELNUMBERCHECK] := False;
  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(CARDREADERTELNUMBERCHECK,G_nDelayTime);

end;


function TdmSocket.CardReaderTelNumberRegist(aEcuID,aNo,
  aTelNo: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'TN01' + FillZeroNumber(strtoint(aNo),2) + SetSpacelength(aTelNo,20);
  G_bDeviceResponse[CARDREADERTELNUMBERCHECK] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(CARDREADERTELNUMBERCHECK,G_nDelayTime + 2000);

end;

function TdmSocket.CheckSystemFunction(aEcuID: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'VR90';
  G_bDeviceResponse[SYSTEMFUNCTION] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(SYSTEMFUNCTION,G_nDelayTime);

end;

function TdmSocket.CheckFTP(aEcuID: string; aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'fp90';
  G_bDeviceResponse[FTPFUNCTION] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(FTPFUNCTION,G_nDelayTime);

end;
  
procedure TdmSocket.RcvFTPCheck(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[FTPFUNCTION] := True;
  if Pos('Undefined Command',aRealData) > 0 then FTPUSE := False
  else FTPUSE := TRUE;

end;
 
procedure TdmSocket.setFTPUSE(const Value: Boolean);
begin
  FFTPUSE := Value;
end;

{ TDeviceState }

constructor TCurrentDeviceState.Create(AOwner: TComponent);
begin
  Connected := False;
  AlarmMode := cmNothing;
  DeviceCode := '';
  DeviceVersion := '';
  DeviceType := KTT811;
  CardType := NOTHINGTYPE;
  CARDREADERTELUse := False;
  DoorUseInitialize;
  DoorStateInitialize;
  DoorLockStateInitialize;
  DoorFireInitialize;
  DoorPNModeInitialize;
  DoorManageModeInitialize;
  ReaderUseInitialize;
  ReaderDoorNoInitialize;
  ReaderVersionInitialize;
  ReaderConnectionStateInitialize;
end;

destructor TCurrentDeviceState.Destroy;
begin

  inherited;
end;

procedure TCurrentDeviceState.DoorFireInitialize;
var
  i : integer;
begin
  for i := LOW(DoorFire) to HIGH(DoorFire) do
  begin
    DoorFire[i] := '0';
  end;

end;

procedure TCurrentDeviceState.DoorLockStateInitialize;
var
  i : integer;
begin
  for i := LOW(DoorLockState) to HIGH(DoorLockState) do
  begin
    DoorLockState[i] := lsNothing;
  end;

end;

procedure TCurrentDeviceState.DoorManageModeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorManageMode) to HIGH(DoorManageMode) do
  begin
    DoorManageMode[i] := dmNothing;
  end;

end;

procedure TCurrentDeviceState.DoorPNModeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorPNMode) to HIGH(DoorPNMode) do
  begin
    DoorPNMode[i] := pnNothing;
  end;

end;

procedure TCurrentDeviceState.DoorStateInitialize;
var
  i : integer;
begin
  for i := LOW(DoorState) to HIGH(DoorState) do
  begin
    DoorState[i] := dsNothing;
  end;

end;

procedure TCurrentDeviceState.DoorUseInitialize;
var
  i : integer;
begin
  for i := LOW(DoorUse) to HIGH(DoorUse) do
  begin
    DoorUse[i] := '0';
  end;
end;

function TCurrentDeviceState.GetDoorManagerMode(
  aDoorNo: integer): TDoorManageMode;
begin
  result := dmNothing;
  if aDoorNo > MAXDOORNO then Exit;
  result := DoorManageMode[aDoorNo];

end;

function TCurrentDeviceState.GetDoorPNMode(aDoorNo: integer): TDoorPNMode;
begin
  result := pnNothing;
  if aDoorNo > MAXDOORNO then Exit;
  result := DoorPNMode[aDoorNo];
end;

function TCurrentDeviceState.GetDoorState(aDoorNo: integer): TDoorDSState;
begin
  result := dsNothing;
  if aDoorNo > MAXDOORNO then Exit;
  result := DoorState[aDoorNo];
end;

function TCurrentDeviceState.GetDoorUsed(aDoorNo: integer): Boolean;
begin
  result := False;
  if aDoorNo > MAXDOORNO then Exit;
  if DoorUse[aDoorNo] = '1' then result := True;
end;

function TCurrentDeviceState.GetReaderConnectState(
  aReaderNo: integer): Boolean;
begin
  result := False;
  if aReaderNo > MAXREADERNO then Exit;
  if ReaderConnectionState[aReaderNo] = '1' then result := True;
end;

function TCurrentDeviceState.GetReaderDoor(aReaderNo: integer): integer;
begin
  result := -1;
  if aReaderNo > MAXREADERNO then Exit;
  if isdigit(ReaderDoorNo[aReaderNo]) then result := strtoint(ReaderDoorNo[aReaderNo]);
end;

function TCurrentDeviceState.GetReaderUse(aReaderNo: integer): Boolean;
begin
  result := False;
  if aReaderNo > MAXREADERNO then Exit;
  if ReaderUse[aReaderNo] = '1' then result := True;
end;

procedure TCurrentDeviceState.ReaderDoorNoInitialize;
var
  i : integer;
begin
  for i := LOW(ReaderDoorNo) to HIGH(ReaderDoorNo) do
  begin
    ReaderDoorNo[i] := '0';
  end;   
end;

procedure TCurrentDeviceState.ReaderConnectionStateInitialize;
var
  i : integer;
begin
  for i := LOW(ReaderConnectionState) to HIGH(ReaderConnectionState) do
  begin
    ReaderConnectionState[i] := '0';
  end;

end;

procedure TCurrentDeviceState.ReaderUseInitialize;
var
  i : integer;
begin
  for i := LOW(ReaderUse) to HIGH(ReaderUse) do
  begin
    ReaderUse[i] := '0';
  end;

end;

procedure TCurrentDeviceState.ReaderVersionInitialize;
var
  i : integer;
begin
  for i := LOW(ReaderVersion) to HIGH(ReaderVersion) do
  begin
    ReaderVersion[i] := '';
  end;

end;

procedure TCurrentDeviceState.SetAlarmMode(const Value: TWatchMode);
begin
  if FAlarmMode = Value then Exit;
  FAlarmMode := Value;
  if Assigned(FOnAlarmModeChange) then
  begin
    OnAlarmModeChange(Self,EcuID,'',True);
  end;

end;

procedure TCurrentDeviceState.SetConnected(const Value: Boolean);
begin
  if FConnected = Value then exit;
  FConnected := Value;
  if Assigned(FOnConnected) then
  begin
    OnConnected(Self,EcuID,'',Value);
  end;
end;

procedure TCurrentDeviceState.SetDeviceCode(const Value: string);
begin
  if FDeviceCode = Value then Exit;
  FDeviceCode := Value;
  if Assigned(FOnDeviceCodeChange) then
  begin
    OnDeviceCodeChange(Self,EcuID,Value,True);
  end;
  if Value = 'ACC-503' then DeviceType := ICU100
  else if Value = 'ACC-505' then DeviceType := ICU200
  else if Value = 'ACC-510' then
  begin
    DeviceType := KTT812;
  end else if Value = 'ACC-104' then
  begin
    DeviceType := KTT811;
    CARDREADERTELUse := True;
  end else if Value = 'ACC-100' then
  begin
    DeviceType := KTT811;
    CardType := AUTOKT811;
    CARDREADERTELUse := True;
  end else if Value = 'ACC-510' then
  begin
    DeviceType := ACC100;
  end;

end;

procedure TCurrentDeviceState.SetDeviceType(const Value: string);
begin
  if FDeviceType = Value then Exit;
  FDeviceType := Value;
  if Assigned(FOnDeviceTypeChange) then
  begin
    OnDeviceTypeChange(Self,EcuID,Value,True);
  end;
  if Value = KTT811 then
  begin
    MaxDoorNo := 2;
    if CardType = AUTOKT811 then MaxDoorNo := 1;
    MaxReaderNo := 8;
    if CardType = AUTOKT811 then MaxReaderNo := 1;
    MaxPortNo := 8;
    CDMAUse := False;
  end else if Value = KTT812 then
  begin
    MaxDoorNo := 1;
    MaxReaderNo := 8;
    MaxPortNo := 8;
    CDMAUse := True;
  end else if Value = ICU100 then
  begin
    MaxDoorNo := 1;
    MaxReaderNo := 0;
    MaxPortNo := 6;
    CDMAUse := False;
  end else if Value = ICU200 then
  begin
    MaxDoorNo := 0;
    MaxReaderNo := 0;
    MaxPortNo := 6;
    CDMAUse := False;
  end else if Value = ACC100 then
  begin
    MaxDoorNo := 2;
    MaxReaderNo := 8;
    MaxPortNo := 0;
    CDMAUse := False;
  end else
  begin
    MaxDoorNo := 0;
    MaxReaderNo := 0;
    MaxPortNo := 0;
    CDMAUse := False;
  end;
  if MaxDoorNo < 1 then  SetDoorType(1,'0');
  if MaxDoorNo < 2 then  SetDoorType(2,'0');
end;

procedure TCurrentDeviceState.SetDeviceVersion(const Value: string);
begin
  if FDeviceVersion = Value then Exit;
  FDeviceVersion := Value;
  if Pos('KT',Value) > 0  then CardType := KT811 //KT사옥용
  else if Pos('KHU',Value) > 0 then CardType := UNIVER811 //경희대용
  else if Pos('UNIV',Value) > 0 then CardType := UNIVER811 //명지대(범용대학교용)
  else if Pos('MJU',Value) > 0 then CardType := UNIVER811 //명지대(범용대학교용)
  else if Pos('CNU',Value) > 0 then CardType := UNIVER811 //충남대용
  else if Pos('AJU',Value) > 0 then CardType := UNIVER811 //아주대용
  else
  begin
    if DeviceCode = 'ACC-100' then CardType := AUTOKT811
    else CardType := COMMON811;
  end;
end;


procedure TCurrentDeviceState.SetReaderInfo(aReaderNo, aUsedCR,
  aCRPosition, aDoorNo, aLocate, aBuildingPosi: string);
var
  nReaderNo : integer;
  bUpdate : Boolean;
begin
  bUpdate := False;
  if Not IsDigit(aReaderNo) then Exit;
  nReaderNo := strtoint(aReaderNo);
  if ReaderUse[nReaderNo] <> aUsedCR then
  begin
    bUpdate := True;
    ReaderUse[nReaderNo] := aUsedCR;
    if aUsedCR = '1' then
    begin
      if Assigned(FOnReaderUseChange) then
      begin
        OnReaderUseChange(Self,ECUID,aReaderNo,True);
      end;
    end;
  end;

  if ReaderDoorNo[nReaderNo] <> aDoorNo then
  begin
    bUpdate := True;
    ReaderDoorNo[nReaderNo] := aDoorNo;
  end;
  
  if Assigned(FOnDeviceChange) then
  begin
    OnDeviceChange(Self,ECUID,'',bUpdate);
  end;

end;

procedure TCurrentDeviceState.SetDoorType(aDoorNo: integer;
  aDoorType: string);
var
  bUpdate : Boolean;
  stDoorType : string;
begin
  bUpdate := False;
  if aDoorNo > MAXDOORNO then Exit;
  stDoorType := '0';
  if aDoorType <> '0' then stDoorType := '1';
  if DoorUse[aDoorNo] <> stDoorType then
  begin
    bUpdate := True;
    DoorUse[aDoorNo] := stDoorType;
    if Assigned(FOnDoorTypeChange) then
    begin
      if stDoorType = '1' then OnDoorTypeChange(Self,ECUID,inttostr(aDoorNo),True)
      else OnDoorTypeChange(Self,ECUID,inttostr(aDoorNo),False);
    end;
  end;
  if DoorUseType[aDoorNo] <> aDoorType then
  begin
    DoorUseType[aDoorNo] := aDoorType;
  end;


end;

procedure TCurrentDeviceState.SetDoorState(aDoorNo, aCardMode, aDoorMode,
  aDoorState, aDoorSchedule: string);
var
  nDoorNo : integer;
  bUpdate : Boolean;
  oCardMode : TDoorPNMode;
  oDoorMode : TDoorManageMode;
  oDoorState : TDoorDSState;
begin
  bUpdate := False;
  if Not isDigit(aDoorNo) then Exit;

  nDoorNo := strtoint(aDoorNo);

  case aCardMode[1] of
    '0': begin oCardMode := pnPositive end;
    '1': begin oCardMode := pnNegative end;
    '2': begin oCardMode := pnPositive end;
    '3': begin oCardMode := pnNegative end;
    else begin oCardMode := pnNothing  end;
  end;
  case aDoorMode[1] of
    '0' : begin oDoorMode := dmManager end;
    '1' : begin oDoorMode := dmOpen end;
    '2' : begin oDoorMode := dmLock end;
    else  begin oDoorMode := dmNothing end;
  end;
  case aDoorState[1] of
    'C' : begin oDoorState := dsClose end;
    'O' : begin oDoorState := dsOpen end;
    'T' : begin oDoorState := dsLongTime end;
    'U' : begin oDoorState := dsOpenErr end;
    'L' : begin oDoorState := dsCloseErr end;
    else  begin oDoorState := dsNothing end;
  end;

  if DoorPNMode[nDoorNo] <> oCardMode then
  begin
    bUpdate := True;
    DoorPNMode[nDoorNo] := oCardMode;
  end;
  if DoorManageMode[nDoorNo] <> oDoorMode then
  begin
    bUpdate := True;
    DoorManageMode[nDoorNo] := oDoorMode;
  end;
  if DoorState[nDoorNo] <> oDoorState then
  begin
    bUpdate := True;
    DoorState[nDoorNo] := oDoorState;
  end;

  if bUpdate then
  begin
    if Assigned(FOnDoorStateChange) then
    begin
      OnDoorStateChange(Self,ECUID,aDoorNo,bUpdate);
    end;
  end;

end;

procedure TCurrentDeviceState.SetReaderVersion(aCardReaderNo,
  aCardReaderVersion: string);
var
  nReaderNo : integer;
begin
  if Not isDigit(aCardReaderNo) then Exit;
  nReaderNo := strtoint(aCardReaderNo);
  ReaderVersion[nReaderNo] := aCardReaderVersion;
  setReaderConnected(nReaderNo,True);
{  if ReaderConnectionState[nReaderNo] <> '1' then
  begin
    setReaderConnected(nReaderNo,True);
    if Assigned(FOnReaderConnectChange) then
    begin
      OnReaderConnectChange(Self,ECUID,aCardReaderNo,True);
    end;
  end; }

end;

procedure TCurrentDeviceState.setReaderConnected(nReaderNo: integer;
  aConnected: Boolean);
var
  stReaderConnected : string;
begin
  if aConnected then stReaderConnected := '1'
  else stReaderConnected := '0';

  if ReaderConnectionState[nReaderNo] <> stReaderConnected then
  begin
    ReaderConnectionState[nReaderNo] := stReaderConnected;
    if Assigned(FOnReaderConnectChange) then
    begin
      OnReaderConnectChange(Self,ECUID,inttostr(nReaderNo),aConnected);
    end;
  end;

end;

procedure TCurrentDeviceState.setDeviceConnected(aConnected: Boolean);
begin
  if Connected = aConnected then Exit;
  Connected := aConnected;
end;


procedure TCurrentDeviceState.SetCDMAUse(const Value: Boolean);
begin
  if FCDMAUse = Value then Exit;
  FCDMAUse := Value;
  if Assigned(FOnCDMAUseChange) then
  begin
    OnCDMAUseChange(Self,ECUID,'',Value);
  end;
end;

procedure TCurrentDeviceState.SetDVRUse(const Value: Boolean);
begin
  if FDVRUse = Value then Exit;
  FDVRUse := Value;
  if Assigned(FOnDvrUseChange) then
  begin
    OnDvrUseChange(Self,ECUID,'',Value);
  end;
end;


procedure TCurrentDeviceState.SetCardType(const Value: string);
begin
  if FCardType = Value then Exit;
  FCardType := Value;
  if Assigned(FOnCardTypeChange) then
  begin
    OnCardTypeChange(Self,ECUID,Value,True);
  end;

  if Value = KT811 then DVRUse := True
  else DVRUse := False;
  if Value = AUTOKT811 then
  begin
    MaxReaderNo := 1;
    MaxDoorNo := 1;
  end;
end;



procedure TCurrentDeviceState.SetCARDREADERTELUse(const Value: Boolean);
begin
  if FCARDREADERTELUse = Value then Exit;
  FCARDREADERTELUse := Value;
  if Assigned(FOnCARDREADERTELUseChange) then
  begin
    OnCARDREADERTELUseChange(Self,ECUID,'',Value);
  end;
end;


function TCurrentDeviceState.GetReaderVersion(aReaderNo: integer): string;
begin
  if aReaderNo > MAXREADERNO then Exit;
  result := ReaderVersion[aReaderNo];

end;

{ TECUState }

constructor TSocketECUState.Create(AOwner: TComponent);
begin
  inherited;
  Connected := False;
end;

destructor TSocketECUState.Destroy;
begin

  inherited;
end;


function TdmSocket.SendKTT812FirmWarePacket(aHexCmd,
  aHexData: string): Boolean;
var
  stHexData : string;
  stASCIIHEADER : string;
  stCheckSum : string;
  nLen : integer;
  i : integer;
  nPacketLength : integer;
  chSendChar : char;
begin
  nLen := 0;
  if Length(aHexData) > 0 then
     nLen := Length(aHexData) div 2;
  stHexData := '01'; //기기종류
  stHexData := stHexData + '00'; //기기번호
  stHexData := stHexData + 'AA'; //MSG번호
  stHexData := stHexData + aHexCmd; //Command
  stHexData := stHexData + dec2Hex(nLen + 2,2);//FillZeroNumber(nLen + 2,2);
  stHexData := stHexData + '00'; //SenseState
  stHexData := stHexData + '00'; //Comm Flag
  stHexData := stHexData + aHexData;
  stCheckSum := ASCII2Hex(MakeHexSum(stHexData));
  stHexData := stHexData + stCheckSum;

  nPacketLength := Length(stHexData) div 2;
  if Commport.Open then
  begin
    for i := 0 to nPacketLength - 1 do
    begin
      chSendChar := char(Hex2Dec(copy(stHexData,(i * 2) + 1,2)));
        Commport.PutChar(chSendChar);
    end;
  end;
end;

function TdmSocket.CheckKTT812FirmwareDataPacket(aData: String; var bData,
  aPacketData: string): integer;
var
  Lenstr: String;
  stCheckSum : string;
  DefinedDataLength : integer;
  StrBuff : string;
  stGetCheckSum : string;
begin

  result := -1; //비정상 전문

  aPacketData:= '';
  if Length(aData) < 6 then
  begin
    result := -2; //자릿수가 작게 들어온 경우
    bData:= aData;           //한자리 삭제 후  리턴
    Exit;
  end;
  if copy(aData,1,6) <> KTT812FirmwareHeader then
  begin
    //delete(aData,1,2);
    bData:= aData;           //한자리 삭제 후  리턴
    Exit;
  end;
  Lenstr := copy(aData,9,2);
  //패킷에 정의된 길이
  DefinedDataLength:= Hex2Dec(Lenstr);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < (10 + (DefinedDataLength * 2) + 2) then
  begin
    result := -2; //자릿수가 작게 들어온 경우
    //실제 데이터가 길이가 작으면(아직 다 못받은 상태)
    bData:= aData;
    Exit;
  end;
  stCheckSum := copy(aData,11 + (DefinedDataLength * 2),2);
  stGetCheckSum := MakeHexSum(copy(aData,1,11 + (DefinedDataLength * 2)));
  stGetCheckSum := ASCII2Hex(stGetCheckSum);
  if stCheckSum <> stGetCheckSum then
  begin
    //delete(aData,1,2);
    bData:= aData;           //한자리 삭제 후  리턴
    Exit;
  end;

  StrBuff:= Copy(aData,1,10 + (DefinedDataLength * 2) + 2);
  Delete(aData, 1, 10 + (DefinedDataLength * 2) + 2);
  bData:= aData;
  aPacketData:=StrBuff;
  result := 3; //KTT812 포맷이 맞다.
end;

function TdmSocket.KTT812DataPacektProcess(aPacketData: string): Boolean;
var
  stCmd : string;
  stLen : string;
  stData : string;
  stAsciiData : string;
  stSubCmd : string;
begin
  Result:= False;
  if aPacketData = '' then Exit;

  stCmd := copy(aPacketData,7,2);
  stLen := copy(aPacketData,9,2);
  stData := copy(aPacketData,11,(Hex2Dec(stLen) * 2) );
  if stCmd = '06' then
  begin
    KTT812FirmwareStarting := True; //현재 펌웨어 업데이트 중입니다.
    // ACK 데이터는 무시하자.
  end else if stCmd = '21' then
  begin
    Delete(stData,1,4); //Sense State,Commo Flag 삭제
    //여기에서 데이터 분석하여 처리 하자.
    stAsciiData := Hex2Ascii(stData);
    Delete(stAsciiData,1,1); //'F' 제거
    stSubCmd := copy(stAsciiData,1,4);
    if stSubCmd = 'fd01' then
    begin
      Delete(stAsciiData,1,4);
      if Assigned(FOnKTT812FlashDataEvent) then
      begin
        OnKTT812FlashDataEvent(Self,'00',stAsciiData);
      end;
    end else if stSubCmd = 'fx01' then
    begin
      KTT812FirmwareDownLoadType :=False; //메인의 펌웨어 업데이트 종료
      if Assigned(FOnKTT812FlashDataEndEvent) then
      begin
        OnKTT812FlashDataEndEvent(Self,'00','');
      end;
    end;
  end;
  Result:= True;
end;


procedure TdmSocket.CommportTriggerOutSent(Sender: TObject);
begin
  L_bSending := False;
  SocketOutSenting := False; //전송 완료
end;

procedure TdmSocket.RcvKTT812FirmWareDownload(aEcuID, aGubun,
  aRealData: string);
var
  stGubun : string;
begin
  stGubun := copy(aRealData,5,3);
  if stGubun = 'f85' then
  begin
    KTT812BroadFirmWareStarting := True;
  end else if stGubun = 'f88' then
  begin
    if Assigned(FOnKTT812EcuFirmWareDownloadComplete) then
    begin
      OnKTT812EcuFirmWareDownloadComplete(Self,aEcuID,'');
    end;
  end;

end;

function TdmSocket.SendBufferClear: Boolean;
begin
  FirstSendDataList.Clear;
  QuickSendDataList.Clear;
  ReserveSendDataList.Clear;
end;

function TdmSocket.AllDeviceDisArm: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'SM2699RMC00D';

  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := True;
end;

function TdmSocket.AllDeviceFireRecovery: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'SM2599';

  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := True;   

end;

procedure TdmSocket.RcvFTPDownLoadState(aECUID, aVer, aRealData: string);
var
  stGubun : string;
begin
  if length(aRealData) < 8 then exit; 
  stGubun := copy(aRealData,5,3);
  if stGubun = 'f88' then
  begin
    if Assigned(FOnKTT811FTPFirmWareDownloadComplete) then
    begin
      OnKTT811FTPFirmWareDownloadComplete(Self,aEcuID,'');
    end;
  end;
end;

function TdmSocket.AllDeviceSendPacket(aCmd, aData: String): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'SM2699' + aCmd + aData;

  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := True;

end;

end.
