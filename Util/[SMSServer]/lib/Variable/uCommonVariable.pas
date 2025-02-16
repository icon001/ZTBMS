unit uCommonVariable;

interface

uses
  SysUtils, Classes;

const
  //StateImageList
  NothingStateIndex = -1;
  DoorOpenModeStateIndex = -1;
  DoorPosiManageStateIndex = 0;
  DoorNegaManageStateIndex = 1;
  DoorCloseModeStateIndex = 2;
  DoorFullLockStateIndex = 3;  //락잠금
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

  ACCESSEVENTMAXCELL = 11;
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

  GROUPCODE : String;  //사업자등록번호 또는 그룹구분코드10자리

  //Client 프로그램 환경설정
  G_bACAlarmEventUse : Boolean; //출입 전용 알람이벤트 사용유무
  G_bACAlarmUse : Boolean; //출입 미승인 알람 사용유무
  G_bACIntroView : Boolean;  // 출입 범례 표시 유무
  G_bApplicationTerminate : Boolean; //Application 종료 여부
  G_bColseModeView : Boolean;  //폐쇄모드 사용 유무
  G_bFireMessageView : Boolean; //화재 메시지 표시 유무
  G_bIsMaster : Boolean;  //Master ID인지 체크하여 Master ID이면 모든 권한 부여
  G_bKTDupCardReg : Boolean; // KT카드 발급시 중복카드 발급 유무
  G_bLongDoorOpenAlarmUse : Boolean; //장시간 문열림 알람 사용 유무
  G_bPTAlarmUse : Boolean; //방범 이상 시 알람 사용유무
  G_bPTAlarmMessageUse:Boolean; //존 이상시 알람 메시지 사용유무

  G_nAccessEventSearch : integer;   //출입이벤트 조회시 원격제어 및 퇴실버튼 조회시 0,카드데이터만 조회시 1
  G_nBuildingGrade : integer; //0:전체,1:빌딩,2:층,3:구역,4:출입문단위
  G_nBuildingSearchIndex : integer; //위치정보조회시 코드순 0,명칭순 1
  G_nCardCreatePort : integer;   //카드발급기 포트번호
  G_nCardRegisterPort : integer; //카드등록기 포트번호
  G_nCompanySearchIndex : integer; //회사정보조회시 코드순 0,명칭순 1
  G_nFireTime : integer;   //화재 메시지 조회 시간 초
  G_nLoginMoitorStart: integer; //로그인시 모니터링 시작
  G_nMonitorGubun : integer; //모니터링 시 전체모니터링 0,그룹별모니터링 1
  G_nMonitoringAttendReport : integer; //근태 리포트 사용 유무
  G_nSearchIndex : integer; //새창 조회시 기본값조회 0,조회안함1

  G_stACAlarmEventCode : string; //출입 전용 알람이벤트코드
  G_stACAlaramFile : string; //알람 발생 파일
  G_stBuildingStep : string;  //0: 빌딩별,1:층별,2:구역별
  G_stExeFolder: string;
  G_stFireState : string;  //화재상태
  G_stMasterAreaCode:string;     //사용자 구역
  G_stMasterBuildingCode:string; //사용자 관리빌딩
  G_stMasterFloorCode:string;    //사용자 관리층
  G_stMasterID : String;
  G_stPTAlaramFile : string; //방범 알람 발생 파일
  G_stRelayDefaultCode : string; // 외부연동시 연동 디폴트 코드

  G_arrAccessEventShowTable : Array of integer;  //출입이벤트 조회 항목테이블
  G_arrAccess1SizeTable : Array of integer;  //출입이벤트 Cell Size
  G_arrAccess2SizeTable : Array of integer;  //출입이벤트 Cell Size
  G_arrAccess3SizeTable : Array of integer;  //출입이벤트 Cell Size
  G_arrAlarmEventShowTable : Array of integer;   //방범이벤트 조회 항목테이블
  G_arrAlarm1SizeTable : Array of integer;  //알람이벤트 Cell Size
  G_arrAlarm2SizeTable : Array of integer;  //알람이벤트 Cell Size
  G_arrMapAlarm1SizeTable : Array of integer;  //맵알람이벤트 Cell Size

  NodeList : TStringList;              //노드별 기기 정보
  BuildingList : TStringList;          //빌딩별 기기 정보
  BuildingNameList : TStringList;          //빌딩명칭 기기 정보
  DeviceStateList : TStringList;       //기기별 상태 정보
  AlarmEventViewStatusCode : TStringList;  //알람 발생 코드
  AlarmEventSoundStatusCode : TStringList;  //소리 발생 코드
  AlarmEventSoundColor : TStringList;       //경보 색깔
  AlarmSoundFileList : TStringList;         //알람 발생 파일 적제 리스트
  AccessHeaderNameList : TStringList;       //Access Header Name List
  AlarmHeaderNameList : TStringList;        //Alarm Header Name List


  LocationMapList : TStringList; //LocationMap을 가지고 있다.

  G_bAlarmRefreshStart : Boolean;           //알람 리프레쉬 - 모니터 화면 클리어 할때까지 대기

implementation

{$R *.dfm}

end.
