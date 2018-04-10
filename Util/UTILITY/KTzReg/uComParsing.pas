unit uComParsing;

interface
uses SysUtils,uLomosUtil;

//소켓으로 받은 데이터 패킷 상태 확인 및 한패킷 추출하여 리턴
function  CheckDataPacket(aData: String; var bData:String):String;
//한 패킷을 분석하여 데이터 추출
function  GetDataPacket(aData:string; var aDeviceID:string;
                        var aCMD:Char;var aMsgNo:Char;var aVer:string;var aDataLen:integer):string;

function GetDataCommand(aData:string):string; //데이터 CMD 추출
function GetDataCommandType(aData:string):string; //데이터 CMDType 추출
function GetDeviceData(aData:string):string; //데이터커맨드를 제외한 데이터

//----------카드리더 관련 조회------------
function GetReaderNo(aData:string):integer;   //카드리더 번호 추출
function GetCardReaderUse(aData:string):integer;  //카드리더 사용유무추출
function GetCardReaderInOut(aData:string):integer; //카드리더 설치 위치추출
function GetCardReaderBuildingInOut(aData:string):integer; //카드리더 빌딩 설치 위치추출
function GetReaderToDoorNo(aData:string):integer;          //카드리더가 해당하는 문번호
function GetCardReaderToZoneNo(aData:string):integer;      //카드리더에 해당하는 존번호 미사용
function GetCardReaderLocateName(aData:string):string;      //카드리더 설치 위치 추출
function GetCardReaderType(aData:string):Char;             //카드리더 타입

//----------시스템정보등록(I) 관련 조회------------  //SY001000222                00003D
function GetWatchPowerOff(aData:string):integer;  //정전감시여부 추출
function GetComControlType(aData:string):integer;  //관제통신방식
function GetOutDelayTime(aData:string):integer; //퇴실지연 시간 추출
function GetInDelayTime(aData:string):integer; //입실지연 시간 추출
function GetSystemSpare(aData:string):integer;  //예비
function GetDoor1Type(aData:string):integer;    //Door1 Type
function GetDoor2Type(aData:string):integer;    //Door2 Type
function GetSystemLocateName(aData:string):string; //시스템 위치명

//----------릴레이정보 관련 조회------------  //RY02110000600
function GetRelayNo(aData:string):integer;
function GetRelayLinkType(aData:string):integer; //릴레이 연동방식
function GetRelayOutPutType(aData:string):integer; //릴레이 출력방식
function GetRelayTimer(aData:string):integer; //릴레이 타이머
function GetRelayUseType(aData:string):integer; //릴레이 사용방식
function GetRelayActionTime(aData:string):integer; //릴레이 동작시간

//----------포트정보 관련 조회------------  //LP01SS00000000000000000000000000미설정          04007
function GetPortNo(aData:string):integer;  //포트번호
function GetPortStatus(aData:string):string; //포트 상태
function GetPortWatchType(aData:string):integer; //포트감시형태
function GetPortAlarmType(aData:string):integer; //알람발생방식형태
function GetPortRecorverSignal(aData:string):integer; //알람복구신호 전송유무
function GetPortDelayTimeUse(aData:string):integer;    //지연시간 적용유무
function GetPortLocateName(aData:string):string;     //포트 위치명
function GetPortDetectTime(aData:string):string;     //포트감지시간

//----------관제정보 관련 조회------------  //LP01SS00000000000000000000000000미설정          04007
function GetLinkusID(aData:string):string;  //관제아이디
function GetLinkusTelNoSeq(aData:string):integer; //관제전화번호 순서
function GetLinkusTelNum(aData:string):string;    //관제전화번호
function GetLinkusLineCheckTime(aData:string):string;  //국선체크시간
function GetLinkusLineCheckStartTime(aData:string):string;  //국선체크시작시간
function GetLinkusRemoteControlRingCount(aData:string):integer; //원격제어 링카운트

//----------제어 관련 조회------------  //LP01SS00000000000000000000000000미설정          04007
function GetTimeSync(aData:string):string; //시간동기화
function GetDeviceVersion(aData:string):string; //기기 버젼
function GetAlarmMode(aData:string):char; //알람 모드
function GetSirenType(aData:string):string; //사이렌타입

//----------출입 관련 조회------------  //LP01SS00000000000000000000000000미설정          04007
function GetAcMsgCode(aData:string):char;

//----------펌웨어 다운로드 관련 ------------  //LP01SS00000000000000000000000000미설정          04007
function GetFlashWritePrograss(aData:string):integer;  //진행현황
function GetFlashWriteSize(aData:string):string;  //요청한 사이즈

implementation

function  CheckDataPacket(aData: String; var bData:String):String;
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

function  GetDataPacket(aData:string; var aDeviceID:string;
                        var aCMD:Char;var aMsgNo:Char;var aVer:string;var aDataLen:integer):string;
begin
  aVer := copy(aData,6,2);
  if aVer = 'K1' then
  begin
    aDataLen := 21;
    aDeviceID:= Copy(aData,8,9);
    aCMD:= aData[17];
    aMsgNo:= aData[18];
    GetDataPacket := Copy(aData,19,Length(aData)- aDataLen);
  end
  else if aVer = 'K2' then
  begin
    aDataLen := 22;
    aDeviceID:= Copy(aData,8,10);
    aCMD:= aData[18];
    aMsgNo:= aData[19];
    GetDataPacket := Copy(aData,20,Length(aData)- aDataLen );
  end;

end;

function GetDataCommand(aData:string):string;
begin
  GetDataCommand := copy(aData,1,2);
end;
function GetDataCommandType(aData:string):string; //데이터 CMDType 추출
begin
  GetDataCommandType := copy(aData,3,4);
end;
function GetDeviceData(aData:string):string; //데이터커맨드를 제외한 데이터
begin
  GetDeviceData := Trim(copy(aData,5,length(aData) - 4));
end;


function GetReaderNo(aData:string):integer;
var
  stTemp : string;
begin
  Delete(aData,1,2); //Data Command
  stTemp:= copy(aData,1,2);
  GetReaderNo := strtoint(stTemp);
end;

function GetCardReaderUse(aData:string):integer;
begin
  GetCardReaderUse := strtoint(copy(aData,5,1)); //5번째 자리가 사용 유무를 표시함
end;

function GetCardReaderInOut(aData:string):integer; //카드리더 설치 위치추출
begin
  GetCardReaderInOut := strtoint(copy(aData,6,1)); //6번째 자리가 사용 유무를 표시함
end;

function GetCardReaderBuildingInOut(aData:string):integer; //카드리더 빌딩 설치 위치추출
begin
  if IsDigit(copy(aData,26,1)) then
    GetCardReaderBuildingInOut := strtoint(copy(aData,26,1)) //26번째 자리가 사용 유무를 표시함
  else GetCardReaderBuildingInOut := -1;
end;

function GetReaderToDoorNo(aData:string):integer;          //카드리더가 해당하는 문번호
begin
  if IsDigit(copy(aData,7,1)) then
    GetReaderToDoorNo := strtoint(copy(aData,7,1)) //7번째 자리
  else GetReaderToDoorNo := -1;
end;

function GetCardReaderToZoneNo(aData:string):integer;      //카드리더에 해당하는 존번호 미사용
begin
  if IsDigit(copy(aData,8,1)) then
    GetCardReaderToZoneNo := strtoint(copy(aData,8,1)) //8번째 자리
  else GetCardReaderToZoneNo := -1;
end;

function GetCardReaderLocateName(aData:string):string;      //카드리더 설치 위치 추출
begin
  GetCardReaderLocateName := Trim(Copy(aData,10,16));
end;

function GetCardReaderType(aData:string):Char;             //카드리더 타입
begin
  GetCardReaderType := aData[5];
end;

function GetWatchPowerOff(aData:string):integer;  //정전감시여부 추출
begin
  if IsDigit(copy(aData,5,1)) then
    GetWatchPowerOff := strtoint(copy(aData,5,1)) //5번째 자리
  else GetWatchPowerOff := -1;
end;
function GetComControlType(aData:string):integer;  //관제통신방식
begin
  Try
    GetComControlType := strtoint(aData[31]); //31번째 자리
  Except
    GetComControlType := 0;
  End;
end;
function GetOutDelayTime(aData:string):integer; //퇴실지연 시간 추출
begin
  Try
    GetOutDelayTime := strtoint(copy(aData,6,3)); //6~8번째 자리
  Except
    GetOutDelayTime := 0;
  End;
end;
function GetInDelayTime(aData:string):integer; //입실지연 시간 추출
begin
  Try
    GetInDelayTime := strtoint(copy(aData,28,3)); //28~30번째 자리
  Except
    GetInDelayTime := 0;
  End;
end;

function GetSystemSpare(aData:string):integer; //예비 추출
begin
  Try
    GetSystemSpare := strtoint(copy(aData,9,1)); //9번째 자리
  Except
    GetSystemSpare := -1;
  End;
end;
function GetDoor1Type(aData:string):integer;    //Door1 Type
begin
  Try
    GetDoor1Type := strtoint(copy(aData,10,1)); //10번째 자리
  Except
    GetDoor1Type := -1;
  End;
end;
function GetDoor2Type(aData:string):integer;    //Door2 Type
begin
  Try
    GetDoor2Type := strtoint(copy(aData,11,1)); //11번째 자리
  Except
    GetDoor2Type := -1;
  End;
end;
function GetSystemLocateName(aData:string):string; //시스템 위치명
begin
  GetSystemLocateName := Trim(Copy(aData,12,16));
end;
function GetRelayNo(aData:string):integer;   //릴레이번호
begin
  Try
    GetRelayNo := strtoint(copy(aData,3,2)); //3~4번째 자리
  Except
    GetRelayNo := -1;
  End;
end;
function GetRelayLinkType(aData:string):integer; //릴레이 연동방식
begin
  Try
    GetRelayLinkType := strtoint(copy(aData,5,1)); //5번째 자리
  Except
    GetRelayLinkType := -1;
  End;
end;
function GetRelayOutPutType(aData:string):integer; //릴레이 출력방식
begin
  Try
    GetRelayOutPutType := strtoint(copy(aData,6,1)); //6번째 자리
  Except
    GetRelayOutPutType := -1;
  End;
end;
function GetRelayTimer(aData:string):integer; //릴레이 타이머
begin
  Try
    GetRelayTimer := strtoint(copy(aData,7,1)); //7번째 자리
  Except
    GetRelayTimer := -1;
  End;
end;
function GetRelayUseType(aData:string):integer; //릴레이 사용방식
begin
  Try
    GetRelayUseType := strtoint(copy(aData,8,1)); //8번째 자리
  Except
    GetRelayUseType := -1;
  End;
end;
function GetRelayActionTime(aData:string):integer; //릴레이 동작시간
begin
  Try
    GetRelayActionTime := strtoint(copy(aData,9,5)); //9~13번째 자리
  Except
    GetRelayActionTime := 0;
  End;
end;

function GetPortNo(aData:string):integer;  //포트번호
begin
  Try
    GetPortNo := strtoint(copy(aData,3,2)); //3~4번째 자리
  Except
    GetPortNo := 0;
  End;
end;
function GetPortStatus(aData:string):string; //포트 상태
begin
  GetPortStatus := Trim(copy(aData,5,2)); //5~6번째 자리
end;
function GetPortWatchType(aData:string):integer; //포트감시형태
begin
  Try
    GetPortWatchType := strtoint(copy(aData,7,1)); //7번째 자리
  Except
    GetPortWatchType := 0;
  End;
end;
function GetPortAlarmType(aData:string):integer; //알람발생방식형태
begin
  Try
    GetPortAlarmType := strtoint(copy(aData,8,1)); //8번째 자리
  Except
    GetPortAlarmType := -1;
  End;
end;
function GetPortRecorverSignal(aData:string):integer; //알람복구신호 전송유무
begin
  Try
    GetPortRecorverSignal := strtoint(copy(aData,9,1)); //9번째 자리
  Except
    GetPortRecorverSignal := -1;
  End;
end;
function GetPortDelayTimeUse(aData:string):integer;    //지연시간 적용유무
begin
  Try
    GetPortDelayTimeUse := strtoint(copy(aData,10,1)); //10번째 자리
  Except
    GetPortDelayTimeUse := -1;
  End;
end;
function GetPortLocateName(aData:string):string;     //포트 위치명
begin
  GetPortLocateName := Trim(copy(aData,33,16));
end;
function GetPortDetectTime(aData:string):string;     //포트감지시간
begin
  GetPortDetectTime := Trim(copy(aData,49,4));
end;

function GetLinKusID(aData:string):string;  //관제아이디
var
  stTemp : string;
begin
  stTemp := Trim(copy(aData,5,4));
  GetLinKusID := Hex2DecStr(stTemp);
end;
function GetLinkusTelNoSeq(aData:string):integer; //관제전화번호 순서
begin
  Try
    GetLinkusTelNoSeq := strtoint(copy(aData,5,2)); //5~6번째 자리
  Except
    GetLinkusTelNoSeq := 0;
  End;
end;
function GetLinkusTelNum(aData:string):string;    //관제전화번호
begin
  GetLinkusTelNum := Trim(copy(aData,7,Length(aData) - 6));
end;
function GetLinkusLineCheckTime(aData:string):string;  //국선체크시간
begin
  GetLinkusLineCheckTime := Trim(copy(aData,5,2));
end;
function GetLinkusLineCheckStartTime(aData:string):string;  //국선체크시작시간
begin
  GetLinkusLineCheckStartTime := Trim(copy(aData,5,2));
end;

function GetLinkusRemoteControlRingCount(aData:string):integer; //원격제어 링카운트
begin
  Try
    GetLinkusRemoteControlRingCount := strtoint(copy(aData,5,2)); //5~6번째 자리
  Except
    GetLinkusRemoteControlRingCount := 0;
  End;
end;

function GetTimeSync(aData:string):string; //시간동기화
begin
  GetTimeSync := Trim(copy(aData,5,14));
end;
function GetDeviceVersion(aData:string):string; //기기 버젼
begin
  GetDeviceVersion := Trim(copy(aData,5,length(aData) - 4));
end;
function GetAlarmMode(aData:string):char; //알람 모드
begin
  GetAlarmMode := aData[7];
end;
function GetSirenType(aData:string):string; //사이렌타입
begin
  GetSirenType := Trim(copy(aData,5,2));
end;

function GetAcMsgCode(aData:string):char;
begin
  GetAcMsgCode := aData[1];
end;

function GetFlashWritePrograss(aData:string):integer;
begin
  Try
    GetFlashWritePrograss := strtoint(copy(aData,5,7)); //5~11번째 자리
  Except
    GetFlashWritePrograss := 0;
  End;
end;
function GetFlashWriteSize(aData:string):string;  //요청한 사이즈
begin
  GetFlashWriteSize := copy(aData,12,4); //12~15번째 자리
end;

end.
