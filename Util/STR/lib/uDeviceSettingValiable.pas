unit uDeviceSettingValiable;

interface
const
  CardReaderMaxNum = 8;
  PortMaxNum = 8;
  
const
  IDCHECK = 1;                //ID Check
  DEVICETYPECHECK = 2;        //ECU/ICU Check
  USEDEVICECHECK = 3;         //사용확장기체크
  DEVICEVERSIONCHECK = 4;     //기기버젼체크 VR00
  SERIALWIZNET = 5;           //랜정보
  SYSINFOCHECK = 6;           //시스템정보
  ALARMSTATECHECK = 7;        //방범상태체크
  ALARMCONTROL = 8;           //알람제어
  DOORSYSTEMCHECK = 9;        //출입문시스템체크
  LOCKSTATECHECK = 10;        //락 상태 체크
  ZONESENSECHECK = 11;        //알람 상태 체크
  CARDREADERTYPE = 12;        //카드리더 타입 
  CARDREADERINFO = 13;        //카드리더 정보
  CARDREADERVERSION = 14;     //카드리더 버젼정보
  FIRERECOVERY = 15;          //화재복구
  DOORCONTROL = 16;           //출입문제어
  PORTSTATE = 17;             //현재 포트의 쇼트/단선체크
  WIZNETMODULECHECK = 18;     //랜모듈 정보
  ECUSTATE = 19;              //확장기 통신상태
  CARDLIST = 20;              //등록카드리스트
  CARDDOWNLOADACK = 21;          //카드다운로드
  CARDLISTCANCEL = 22;        //카드리스트 조회 취소
  SCHEDULE = 23;              //스케줄 조회
  HOLIDAY = 24;               //특정일
  TIME = 25;                  //시간
  MACINFO = 30;
  LINKUSID = 31;
  LINKUSTEL = 32;
  RINGCOUNT = 33;
  JAEJUNG = 34;
  TELLINE = 35;
  DEVICECODECHECK = 36;           //기기코드VR01

var
  G_nLoopCount : integer = 3;                       //기기 설정 시 루프 횟수
  G_nSetDelayTime : integer = 3000;  //기기전송 후 대기 시간
  G_bDeviceResponse: Array [0..100] of Boolean; //기기 설정 정보 응답 여부
  G_bCardReaderResponse: Array [0..512] of Boolean; //카드리더 정보 응답 여부
  G_bCardReaderVersionResponse: Array [0..512] of Boolean; //카드리더 정보 응답 여부
  G_bPortResponse: Array [0..768] of Boolean; //포트 정보 응답 여부
  G_bFireDevice: Array [0..100] of Boolean;     //화재발생기기

implementation

end.
