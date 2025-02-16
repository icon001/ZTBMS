unit uMonitoringCommonVariable;

interface

uses
  SysUtils, Classes,uDeviceState;

const
  //StateImageList
  NothingStateIndex = -1;
  DoorOpenModeStateIndex = -1;
  DoorPosiManageStateIndex = 0;
  DoorNegaManageStateIndex = 1;
  DoorCloseModeStateIndex = 2;
  DoorMasterModeStateIndex = 3;
  NormalEventStateIndex = 4;
  AlarmEventStateIndex = 5;

  //NetworkImageList
  ServerConnectImageIndex = 0;
  ServerDisConnectImageIndex = 1;
  NodeConnectImageIndex = 2;
  NodeFaultConnectImageIndex  = 3;
  NodeDisConnectImageIndex = 4;
  DeviceConnectImageIndex = 5;
  DeviceDisConnectImageIndex = 6;

  //DoorImageList
  DoorCloseStateImageIndex = 0;
  DoorOpenStateImageIndex = 1;
  DoorNothingStateImageIndex = 2;
  DoorLongTimeStateImageIndex = 3;
  DoorFireStateImageIndex = 4;

  //AlarmImageList
  AlarmNothingStateImageIndex = 0;
  DisAlarmModeStateImageIndex = 1;
  AlarmModeStateImageIndex = 2;
  AlarmEventStateImageIndex = 3;
  AlarmFireStateImageIndex = 4;
  AlarmTestStateImageIndex = 5;
  AlarmInitStateImageIndex = 6;
  AlarmPatrolStateImageIndex = 7;
  JaeJungAlarmStateImageIndex = 2;
//  JaeJungAlarmStateImageIndex = 8;

  ACCESSEVENTMAXCELL = 15;
  ALARMEVENTMAXCELL = 7;
  MAPALARMEVENTMAXCELL = 7;

type
  TdmMonitoringCommonVariable = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMonitoringCommonVariable: TdmMonitoringCommonVariable;
  BuildingStep : string;  //0: 빌딩별,1:층별,2:구역별
  NodeList : TStringList;              //노드별 기기 정보
  BuildingList : TStringList;          //빌딩별 기기 정보
  BuildingNameList : TStringList;          //빌딩명칭 기기 정보
  ArmAreaStateList : TStringList;       //방범구역 상태 정보
  DoorStateList : TStringList;       //출입문 상태 정보
  DeviceStateList : TStringList;       //기기별 상태 정보
  DaemonState : TDaemonState;          //데몬 상태
  AlarmEventViewStatusCode : TStringList;  //알람 발생 코드
  AlarmEventSoundStatusCode : TStringList;  //소리 발생 코드
  AlarmEventSoundColor : TStringList;       //경보 색깔
  AlarmEventArmStateEvent : TStringList;       //경계중에만 알람발생유무
  AlarmSoundFileList : TStringList;         //알람 발생 파일 적제 리스트
  AccessHeaderNameList : TStringList;       //Access Header Name List
  AlarmHeaderNameList : TStringList;        //Alarm Header Name List

  AccessEventShowTable : Array of integer;  //출입이벤트 조회 항목테이블
  AlarmEventShowTable : Array of integer;   //방범이벤트 조회 항목테이블
  Access1SizeTable : Array of integer;  //출입이벤트 Cell Size
  Access2SizeTable : Array of integer;  //출입이벤트 Cell Size
  Access3SizeTable : Array of integer;  //출입이벤트 Cell Size
  Alarm1SizeTable : Array of integer;  //알람이벤트 Cell Size
  Alarm2SizeTable : Array of integer;  //알람이벤트 Cell Size
  MapAlarm1SizeTable : Array of integer;  //맵알람이벤트 Cell Size

  LocationMapList : TStringList; //LocationMap을 가지고 있다.

  G_bAlarmRefreshStart : Boolean;           //알람 리프레쉬 - 모니터 화면 클리어 할때까지 대기
  G_nAlarmRefreshDate : integer = 2;
  G_nEmCodeLength : integer = 5;

implementation

{$R *.dfm}

end.
