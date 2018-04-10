unit uCommonVariable;

interface

uses Classes,Graphics,Messages;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;
  con_LocalPosiImageIndex = 3;

const
  con_CMDArmAreaName = 1;

const
  con_DoorLogType = '1';
  con_ArmAreaLogType = '2';


var
  G_bAccessMonitoringUse : Boolean = True; //출입모니터링
  G_bACMonitorEventSoundOnUse : Boolean; //출입 전용 모니터링 알람 발생
  G_bAlarmEventLengthUse : Boolean; //알람이벤트 처리시 가변 길이 사용
  G_bAlarmEventMessageUse : Boolean; //알람이벤트 발생시 메시지 박스 출력
  G_bAlarmEventSoundOnUse : Boolean; //알람이벤트 발생시 알람 사운드 사용
  G_bAlarmMonitoringUse : Boolean = TRUE; //알람 모니터링 사용유무
//  G_bAlarmRefreshStart : Boolean;    //QUERY 타입에서 알람 리프레쉬 수행중인 동안 알람 발생 시키지 말자
  G_bApplicationTerminate : Boolean;
  G_bAutoFdmsCardNo : Boolean;       //지문 전용 카드번호 생성
  G_bCardAutoDownLoadUse : Boolean; //카드 자동 다운로드
  G_bCardGradeCopyUse : Boolean;    //카드권한 복사
  G_bCardLengthFixedUse : Boolean; //카드 길이 고정 사용
  G_bCardLogSave : Boolean;        //카드데이터 log파일 저장유무
  G_bCardTypeNumeric : Boolean; //범용 4Byte 시 카드 표시 숫자 타입 유무
  G_bCardPositionUse : Boolean; //카드 위치정보 사용유무
  G_bDeviceCommLogSave : Boolean; //기기의 통신데이터 저장유무
  G_bDeviceServerUse : Boolean;  //기기가 서버 모드로 동작하는가?
  G_bDoorAccessEventSoundOnUse : Boolean; //미승인 출입 이벤트 발생시 알람발생
  G_bDoorColseModeUse : Boolean;  //출입문 폐쇄 모드 사용유무
  G_bDoorLongTimeOpenAlarmEventUse : Boolean; //장시간 열림 발생시 이벤트 발생
  G_bDoorFireMessageView : Boolean; //화재시 메지지 박스 보이기
  G_bDoorFireRecoveryUse : Boolean; //화재복구 사용유무
  G_bDoorFireRelayUse : Boolean;    //화재시 타 시스템 연동 사용 유무
  G_bDoorOpenModeOpenStateUse : Boolean;  //개방모드시 출입문 열림 표시
  G_bExitButtonEventUse : Boolean;              //퇴실버튼 이력을 남길것인지 유무
  G_bFTPZeronServerUse : Boolean;
  G_bInOutCountUse : Boolean;       //재실보고서 사용 유무
  G_bIsMaster : Boolean;  //Master 유무
  G_bKTDupCardReg : Boolean;    // KT 카드 발급시 두장 이상 카드 발급
  G_bMonitorIntroView : Boolean;  //모니터링 범례 표시
  G_bTypeAccessUse : Boolean; //출입 사용유무
  G_bTypeAttendUse : Boolean; //근태 사용유무
  G_bTypeFoodUse : Boolean;   //식수 사용유무
  G_bTypePatrolUse : Boolean; //방범 사용유무
  G_bTypeSensorUse : Boolean; //센서 사용유무

  G_nAccessEventSearch : integer = 1; //0:버튼,퇴실 이벤트 조회,1:카드이벤트만 조회
  G_nAckSendType : integer;          //ACK 바로 전송(-1),First 전송(0)
  G_nAdminBuildingGrade : integer; //0:전체,1:빌딩,2:층,3:구역,4:출입문단위
  G_nAdminCompanyGrade : integer;  //0.전체권한
  G_nAdminClassCodeLength : integer = 3;  //관리자 등급코드길이
  G_nAlarmEventLength : integer;   //방범 이벤트 카드 길이
  G_nAlarmRefreshDate : integer = 2;  //QUERY 타입의 알람 이벤트 조회시 2일전 데이터 까지만 조회 하자.
  G_nAlarmSoundCount : integer = 1;   //알람발생 횟수
  G_nAreaCodeLength : integer = 3;
  G_nAttendWorkingType : integer = 3;      //0:고정근무1:사원별,2:교대근무,3:혼합
  G_nBlinkCount : integer = 10;
  G_nBuildingCodeLength : integer = 3;
  G_nBuildingSearchIndex : integer;  //위치정보조회시 코드순 0,명칭순 1
  G_nBuildingStep : integer = 0;    //빌딩별 모니터링시 빌딩스텝 0:빌딩,1:층,2:구역
  G_nEmployeeDupCard : integer = 0; //0:1인당 1장의 카드 발급,1:1인당 여러장 카드 발급
  G_nCardCreatePort : integer; // 발급기 포트
  G_nCardFixedLength : integer = 16;     //고정 길이
  G_nCardFixedPosition : integer = 1; //채움문자위치 0:앞,1:뒤
  G_nCardGroupLength : integer = 3;
  G_nCardLengthType : integer = 0; //카드번호 타입 0:고정4Byte, 1:가변, 2:HEX<->ASCII(KT),3:통합(가변)
  G_nCardRegisterPort : integer;   //등록기포트
  G_nColorEmGroup : integer = clYellow;
  G_nColorEmployee : integer = clWhite;
  G_nCompanyCodeLength : integer = 3;
  G_nCompanySearchIndex : integer;      //회사정보 조회시 소트 순서 코드순 0,명칭순 1
  G_nDaemonGubun : integer;             //데몬구분 향후 n개의 데몬과 통합시
  G_nDaemonServerVersion : integer = 0; //통신데몬 버젼
  G_nDefaultDoorCount : integer = 2;  //초기생성 디폴트 출입문 갯수
  G_nDefaultReaderCount : integer = 8; //초기생성 디폴트 리더갯수
  G_nDefaultZoneCount : integer = 8; //초기생성 디폴트 존갯수
  G_nDeviceCardGroupLength : integer = 3; //그룹코드 길이
  G_nDoorFireMessageTime : integer;  //화재시 메시지 박스 조회 시간
  G_nFireRelayNumber : integer = 6; //화재복구시 릴레이 번호
  G_nFireRelayTime : integer = 2;    //화재복구시 릴레이 제어 시간(초)
  G_nFloorCodeLength : integer = 3;
  G_nFoodGradePosition : integer = 0; //식수권한점검 0:기기,1:서버
  G_nFPMSLength : integer = 4; //지문번호 길이
  G_nIDLength : integer = 7;          //컨트롤러 ID 길이
  G_nMultiDaemon : integer = 0;     //데몬동작형태 0: 데몬 단독 동작 1:멀티데몬(구현 안됨)
  G_nMultiSocket : integer = 0;
  G_nMonitorGubun : integer;        //모니터링 띄울때 타입
  G_nMoitorLoginStart : integer;    //로그인시 모니터링 화면 띄울지 유무  0 띄움,1 안띄움
  G_nMonitorSockType : integer = 0;   //모니터 소켓 타입 0.TCP 1.DB
  G_nNodeCodeLength : integer = 3;
  G_nMaxComPort : integer = 40;
  G_nMaxECUCount : integer = 63;
  G_nPatrolCardType : integer = 0;
  G_nPersonRelayType : integer = 0; //가져오는 사원연동형태 0:연동안함,1:삼육대 연동,2:KT서초사옥,3:경희대 ,4:LOMOS,5:명지대
  G_nPosiCodeLength : integer = 3;
  G_nProgramType : integer = 0; //0 : KTTelecop,1:S-TEC
  G_nRelayGubunCodeLength : integer = 3;  //사원구분코드 길이
  G_nReportSearchIndex : integer; // 보고서 조회시 화면 검색 버튼 클릭 전 조회 유무
  G_nScheduleDevice : integer;    //스케줄 0:컨트롤러자체동작,1:PC스케줄
  G_nSocketReciveTime : integer = 100; //소켓 리딩 타임
  G_nSpecialProgram : integer = 0;  //특화서비스 0: 범용,1:KT서초사옥,2:RUC(지문연동),3:KTTELECOP(자리수틀림),4:상황표시

  G_stACMonitorAlaramFile : string; //출입전용 알람파일
  G_stACMonitorEventCode : string; //출입전용 모니터링에서 알람발생코드
  G_stAdminAreaCode : string; //관리 구역코드
  G_stAdminBuildingCode : string; //관리 빌딩코드
  G_stAdminCompanyCode : string; //관리 회사코드
  G_stAdminDepartCode : string; //관리 부서코드
  G_stAdminFloorCode : string; //관리 층코드
  G_stAdminJijumCode : string; //관리 지점코드
  G_stAdminUserID : string; //관리자 로그인 아이디
  G_stAdminUserName : string; //관리자 명
  G_stAlarmEventAlaramFile : string; //알람이벤트 발생 파일
  G_stAlarmViewType : string; //REAL:실시간 알람,QUERY:DB Type
  G_stBuildingStep : string;
  G_stCardFixedFillChar : string;
  G_stDaemonControlPort : string;
  G_stDaemonEventPort : string;
  G_stDaemonFoodPort : string;
  G_stDaemonFTPPort : string;
  G_stDaemonServerIP : string;
  G_stDaemonServerPort : string;
  G_stDaemonStatePort : string;
  G_stDefaultRelayCode : string;   //디폴트 연동 코드
  G_stDoorFireStateCode : string = 'FI';  //화재 발생 메시지 코드
  G_stDoorLongTimeStateCode : string;   //출입문 장시간 열림 코드
  G_stExeFolder : string;
  G_stFileServerIP : string; //이미지 파일 서버
  G_stFileServerDir : string;
  G_stFireStatus : string = 'FI';
  G_stFoodDeviceType : string;  //DOOR/READER 구분
  G_stGroupCode : string;
  G_stMapBuildingAlarmEventIconFile : string;
  G_stMapBuildingArmModeIconFile : string;
  G_stMapBuildingDisArmModeIconFile : string;
  G_stMapBuildingFireIconFile : string;
  G_stMapBuildingNormalEventIconFile : string;
  G_stKT3MPServerIP : string;
  G_stKT3MPServerPort : string;
  G_stKT3MPGatewayID : string;
  G_stKT3MPDeviceID : string;
  G_stKT3MPDevicePW : string;
  G_stKTSmallSetDBTYPE : string;
  G_stKTSmallSetDBIP : string;
  G_stKTSmallSetDBPort : string;
  G_stKTSmallSetDBUserID : string;
  G_stKTSmallSetDBUserPW : string;
  G_stKTSmallSetDBName : string;
  G_stKTSmallSetDBPollingTime:string;
  G_stPatrolMapFile : string;
  G_stRelayKHUAddDate : string; //경희대 연동날짜
  G_stRelayKHUCARDDate : string; //경희대카드연동날짜
  G_stRelayKHUDelDate : string; //경희대 삭제 연동 날짜

implementation

end.
