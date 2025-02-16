{*********************************************************}
{*                   zRegT.INC                           *}
{*      Copyright (C) Zeron                              *}
{*                 All rights reserved.                  *}
{*********************************************************}


var

  Rcv_MsgNo     : Char;
  Send_MsgNo    : Integer;
  ComBuff       : String;   // 데이터 수신용
  IsConfigMCU   : Boolean;  // MCU 설정중인가?
  RegCardMode   : Boolean;  // 카드등록 모드
  ErrorMessage : string; //통신 에러 데이터
  IsStop        : Boolean;  //프로세스 종료

    bMCUIDCheck : Boolean; //MCUIDCheck 여부
    bUsedDeviceCheck : Boolean; //확장기사용 갯수 체크
    bUsedAlarmCheck : Boolean; //알람표시기 체크
    bLinkusIDCheck : Boolean;  //시스템아이디 체크
    bLinksTelNoCheck :Boolean;  //방범 전송 전화번호 체크
    bRingCountCheck : Boolean;  //전화 거는 횟수 체크
    bWiznetCheck : Boolean;     //IP 및 체크
    bSysInfoCheck : Boolean;    //시스템정보 체크
    bSysInfo2Check : Boolean;   //출입문정보체크
    bPortCheck : Boolean;       //포트체크
    bCardReaderCheck : Boolean; //리더기 체크
    bCCTVCheck : Boolean;    //CCTV 체크
    bCardReaderTypeCheck : Boolean; //리더기 타입 체크
    bVERCheck : Boolean; //버전체크
    bReaderVERCheck : Boolean;  //리더기 버젼 체크
    bSearch : Boolean;   //조회 후 통신환경 체크 해야됨
    bErrorCheck : Boolean; //통신 에러
    bECUStatusCheck : Boolean; //MCU일때 ECU 체크 하기 위함
    bECUCommState : Boolean;// ECU 통신상태 체크하기 위함
    bReaderCOMCheck : Boolean; //리더기 통신상태 체크하기 위함
    bIndicatorCheck : Boolean; //상황표시 체크하기 위함
    bSended : Boolean; //송신중인지 체크
    bSensorSet : Boolean; //감지기 셋팅 체크
    bSensorInfo : Boolean; //감지기 정보 셋팅
    bTimeShow : Boolean; //Time 동기화 후 메시지 박스 볼것인지 여부
    bKTConfig : Boolean;  //KTConfig 송수신 여부
    bKTDevice : Boolean;  //KTDevice 송수신 여부

const DelayTime = 800;
const ComCheckDelayTime = 1000;
const  LoopCount = 5 ; //에러 대기 횟수





//{$DEFINE DEBUG}






