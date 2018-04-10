unit udmAttendEvent;

interface

uses
  SysUtils, Classes,DateUtils,ADODB,ActiveX,uDataModule1;

type
  TdmAttendEvent = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    AttendConfigCodeList : TStringList; //근태코드리스트
    AttendConfigHInFromTimeList : TStringList; //공휴일 출입가능시작 시간
    AttendConfigHWorkTimeList : TStringList; //공휴일 근무 시작 시간
    AttendConfigSInFromTimeList : TStringList; //반휴일 출입가능시작 시간
    AttendConfigSWorkTimeList : TStringList; //반휴일 근무 시작 시간
    AttendConfigInFromTimeList : TStringList; //출입가능시작 시간
    AttendConfigWorkTimeList : TStringList; //근무 시작 시간
    AttendConfigHOutTimeList : TStringList; //공휴일 퇴근 시간
    AttendConfigHExtendTimeList : TStringList; //공휴일 연장근무 시간
    AttendConfigHNightTimeList : TStringList; //공휴일 야간근무 시간
    AttendConfigSOutTimeList : TStringList; //반휴일 퇴근 시간
    AttendConfigSExtendTimeList : TStringList; //반휴일연장근무 시간
    AttendConfigSNightTimeList : TStringList; //반휴일야간근무 시간
    AttendConfigOutTimeList : TStringList; //퇴근 시간
    AttendConfigExtendTimeList : TStringList; //연장근무 시간
    AttendConfigNightTimeList : TStringList; //야간근무 시간
    AttendConfigInToTimeList : TStringList; //출입가능끝 시간
    AttendConfigSInToTimeList : TStringList; //반휴일 출입가능끝 시간
    AttendConfigHInToTimeList : TStringList; //공휴일 출입가능끝 시간

    FOnSendEvent: TNotifyReceive;
    FAtYesterDayStandTime: string;
    FSaturdayType: integer;
    FATInOutDeviceType: integer;
    FATWorkInNo: string;
    FATWorkOutsideNo: string;
    FATDeviceType: integer;
    FATStartWorkNo: string;
    FATOffWorkNo: string;
    FAttendWorkingType: integer;
    FATWorkNotBackupType: integer;
    FATOutFixedType: integer;
    { Private declarations }
  private
    procedure StringListCreate;
    procedure StringListFree;
  private
    Function  GetATInCode(aAttendCode,aNowTime:string;nWeekCode:integer):string; //출근타입에 대한 출근코드 가져오기
    Function  GetATOutCode(aAttendCode,aTime:string;nWeekCode:integer;bYesterDay:Boolean):string; //출근타입에 대한 출근코드 가져오기
    Function  GetOutAttendCode(aDate,aCompanyCode,aEMCode:string):string; //해당근태일자의 출근 근태 타입을 가져오자.
    Function  GetAttendCode(aTime,aCompanyCode,aEMCode:string;nWeekCode:integer):string; //해당일자의 출근타입 가져오자
    Function  GetChangeATCode(aTime:string;nWeekCode:integer):string;
    Function  GetEMPLOYEEATCode(aCompanyCode,aEMCode:string):string;
  private
    Function InsertTB_ATTEND_BACKCode(aAtDate,aNowTime,aCompanyCode,aEMCode:String;nWeekCode:integer;aYesterDay:Boolean):Boolean;
    Function InsertTB_ATTEND_BusinessOutCode(aAtDate,aNowTime,aCompanyCode,aEMCode:String;aWeekCode:integer;aYesterDay:Boolean):Boolean;
    Function InsertTB_ATTEND_INCode(aATDate,aNowTime,aCompanyCode,aEMCode:String;nWeekCode:integer;aAtInsert:Boolean):Boolean;
    Function InsertTB_ATTEND_OutCode(aDate,aNowTime,aCompanyCode,aEMCode:String;nWeekCode:integer;aYesterDay:Boolean):Boolean;
  public
    procedure StringListClear;
    procedure AttendConfigCodeList_Add(aData:string);
    procedure AttendConfigHInFromTimeList_Add(aData:string);
    procedure AttendConfigHWorkTimeList_Add(aData:string);
    procedure AttendConfigSInFromTimeList_Add(aData:string);
    procedure AttendConfigSWorkTimeList_Add(aData:string);
    procedure AttendConfigInFromTimeList_Add(aData:string);
    procedure AttendConfigWorkTimeList_Add(aData:string);
    procedure AttendConfigHOutTimeList_Add(aData:string);
    procedure AttendConfigHExtendTimeList_Add(aData:string);
    procedure AttendConfigHNightTimeList_Add(aData:string);
    procedure AttendConfigSOutTimeList_Add(aData:string);
    procedure AttendConfigSExtendTimeList_Add(aData:string);
    procedure AttendConfigSNightTimeList_Add(aData:string);
    procedure AttendConfigOutTimeList_Add(aData:string);
    procedure AttendConfigExtendTimeList_Add(aData: string);
    procedure AttendConfigNightTimeList_Add(aData: string);
    procedure AttendConfigInToTimeList_Add(aData: string);
    procedure AttendConfigSInToTimeList_Add(aData: string);
    procedure AttendConfigHInToTimeList_Add(aData: string);
  public
    { Public declarations }
    Function Process_ATEvent(aTime,aNodeNo,aECUID,aCardNo,aDoorNo,aReaderNo,aButton:string):Boolean;
    Function Process_UpdateAttendData(aATDate,aNowTime,aCardNo,aCompanyCode,aEMCode,aAttendType:string;aWeekCode:integer;aYesterDay:Boolean;aAtInsert:Boolean):Boolean;
    Function Process_UpdateBussinessInOut(aATDate,aNowTime,aCardNo,aCompanyCode,aEMCode,aAttendType:string;aWeekCode:integer;aYesterDay:Boolean):Boolean;
  published
    Property OnSendEvent : TNotifyReceive read FOnSendEvent write FOnSendEvent;
  published
    property AtYesterDayStandTime : string read FAtYesterDayStandTime write FAtYesterDayStandTime;  //어제 기준근태시간
    property SaturdayType : integer read FSaturdayType write FSaturdayType; //0:토요일 공휴일 처리, 1:토요일 반휴일 처리,2:토요일 평일 처리
    property ATDeviceType : integer read FATDeviceType write FATDeviceType; //출퇴근 0:업데이트 1:카드 2:버튼
    property ATInOutDeviceType : integer read FATInOutDeviceType write FATInOutDeviceType; //외출 복귀 0:사용안함 1:카드 2:버튼
    property ATStartWorkNo : string read FATStartWorkNo write FATStartWorkNo; //출근 버튼값
    property ATOffWorkNo : string read FATOffWorkNo write FATOffWorkNo;       //퇴근 버튼값
    property ATWorkInNo : string read FATWorkInNo write FATWorkInNo; //복귀버튼 값
    property ATWorkOutsideNo : string read FATWorkOutsideNo write FATWorkOutsideNo; //외출버튼 값
    property AttendWorkingType : integer read FAttendWorkingType write FAttendWorkingType;   //0:고정근무1:사원별,2:교대근무
    property ATWorkNotBackupType : integer read FATWorkNotBackupType write FATWorkNotBackupType; ////외출 후 미복귀 처리0:미복귀시퇴근처리,1:미복귀시정상퇴근
    property ATOutFixedType : integer read FATOutFixedType write FATOutFixedType;  //정시출퇴근사용유무 - 0:사용안함,1:사용함
  end;

var
  dmAttendEvent: TdmAttendEvent;

implementation

uses
  udmAdoQuery,
  uCommonModule,
  uLomosUtil;

{$R *.dfm}

{ TdmAttendEvent }

function TdmAttendEvent.GetAttendCode(aTime, aCompanyCode, aEMCode: string;
  nWeekCode: integer): string;
begin
  result := '001';
  if AttendWorkingType = 0 then //고정근무타입이면  첫번째 근태 타입을 넘겨준다.
  begin
    if AttendConfigCodeList.Count > 0 then
      result := AttendConfigCodeList.Strings[0];
  end else if AttendWorkingType = 1 then  //사원별 근무타입이면 사원별 근무 타입을 가져온다.
  begin
    result := GetEMPLOYEEATCode(aCompanyCode,aEMCode);
  end else if AttendWorkingType = 2 then  //교대근무시 근무 타입을 가져온다.
  begin
    result := GetChangeATCode(aTime,nWeekCode);
  end;

end;

function TdmAttendEvent.InsertTB_ATTEND_INCode(aATDate, aNowTime,
  aCompanyCode, aEMCode: String; nWeekCode: integer;
  aAtInsert: Boolean): Boolean;
var
  stAttendCode : string;
  stATInCode : string;
  nIndex : integer;
begin
  result := False;
  
  //근태적용일 오늘 출근하면서 전일자 출근 표시 할일이 있을까? 없을것이다. 고로 오늘날짜가 근태일이다.
  stAttendCode := GetAttendCode(aNowTime,aCompanyCode,aEMCode,nWeekCode);
  nIndex := AttendConfigCodeList.IndexOf(stAttendCode);
  if nIndex = -1 then //근태코드를 찾지 못한경우
  begin
    if aAtInsert then dmAdoQuery.TB_ATEVENTIntimeInsert(aATDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aNowTime,'000')
    else dmAdoQuery.TB_ATEVENTIntimeUpdate(aATDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aNowTime,'000');
    Exit;
  end;
  stATInCode := GetATInCode(stAttendCode,aNowTime,nWeekCode);  //출근타입에 대한 출근코드 가져오자.
  if aAtInsert then  dmAdoQuery.TB_ATEVENTIntimeInsert(aATDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aNowTime,stATInCode)
  else dmAdoQuery.TB_ATEVENTIntimeUpdate(aATDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aNowTime,stATInCode);
  result := True;

end;

function TdmAttendEvent.Process_ATEvent(aTime, aNodeNo, aECUID, aCardNo,
  aDoorNo, aReaderNo, aButton: string): Boolean;
var
  stDate: String;
  wYear    : word;
  wMonth   : word;
  wDay     : word;
  wHour    : word;
  wMinute  : word;
  wSecond  : word;
  dtPresent: TDatetime;
  dtYesterDay : TDatetime;

  stAttendCode : string; //출근코드
  nWeekCode : integer; //1:공휴일,7:토요일
  stAttendType : string; //1:출근,2:퇴근
  stEMCode : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stEmName : string;

  nAtOutGubun : integer; //0:출퇴근,1:외출복귀
  cAtType : char;
  bYesterDay : Boolean;
  nATDeviceType : integer;
  nReaderNo : integer;

  stClientSendData : string;
  bAtInsert : Boolean;
begin
  bYesterDay := False; //기준은 오늘이다.
  cAtType := ' ';

  if Not CommonModule.GetEmployeeInfo(aCardNo,False,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName) then
  begin
    stClientSendData := 'R' +
                        'E' +
                        aNodeNo +
                        aEcuID +
                        '00' +
                        FillZeroNumber(strtoint(aReaderNo),2) +
                        'AT' +
                        'C' +
                        FillZeroNumber(Length(aCardNo) + 15 ,3) +
                        aTime +
                        cAtType +
                        aCardNo;

    if Assigned(FOnSendEvent) then
    begin
      OnSendEvent(Self,stClientSendData,strtoint(aNodeNo));
    end;
    Exit;
  end;

  if Not IsDigit(aTime) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '근태 시간 오류',aTime+':'+aCardNo);
    Exit;
  end;
  
  wYear  := StrtoInt(Copy(aTime,1,4));
  wMonth := StrtoInt(Copy(aTime,5,2));
  wDay   := StrtoInt(Copy(aTime,7,2));
  wHour  := StrtoInt(Copy(aTime,9,2));
  wMinute:= StrtoInt(Copy(aTime,11,2));
  wSecond:= StrtoInt(Copy(aTime,13,2));
  dtPresent:= EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, wSecond,00);
  dtYesterDay := dtPresent - 1;

  stDate:= Copy(aTime,1,8);  //근태 기준 일자를 잡자.
  //기준시간이 새벽에 찍었는가?
  if copy(aTime,9,4) < AtYesterDayStandTime then
  begin
    stDate := FormatDateTime('yyyymmdd',dtYesterDay); //어제날짜를 근태일로 잡자.
    bYesterDay := True; //기준을 어제로 잡자.
  end;

  if bYesterDay then
  begin
    //어제가 무슨요일인가? 알자...
    nWeekCode := DayOfWeek(dtYesterDay); //1: 일요일,7:토요일
  end else
  begin
    //오늘이 무슨요일인가? 알자...
    nWeekCode := DayOfWeek(dtPresent); //1: 일요일,7:토요일
  end;
  
  if nWeekCode <> 1 then
  begin
    if CommonModule.CheckHolidy(Copy(stDate,1,4),Copy(stDate,5,2),Copy(stDate,7,2)) then nWeekCode := 1; //기준일이 공휴일이면
  end;

  //L_nSaturday //0:휴무,1:반휴일,2:평일
  if nWeekCode = 7 then //토요일 이면 평일로 쓸건지 여부 체크
  begin
    if SaturdayType = 0 then  nWeekCode := 1      //공휴일 처리
    else if SaturdayType = 2 then nWeekCode := 8; //평일 처리
  end;

  //여기에서 외출복귀인지 출퇴근인지 구분해 내자.

  nAtOutGubun := 0;
  if ATInOutDeviceType = 1 then  //카드리더 사용
  begin
    if (aReaderNo = ATWorkInNo)
    or (aReaderNo = ATWorkOutsideNo) then nAtOutGubun := 1;
  end else if ATInOutDeviceType = 2 then //버튼 사용
  begin
    if (aButton = ATWorkInNo)
    or (aButton = ATWorkOutsideNo) then nAtOutGubun := 1;
  end;

  if nAtOutGubun = 0 then  //출/퇴근 처리
  begin
    nATDeviceType := ATDeviceType;
    if ATStartWorkNo = ATOffWorkNo then //버튼이 같은 값이면.
    begin
      if nATDeviceType = 1 then
      begin
        if aReaderNo[1] = ATStartWorkNo[1] then nATDeviceType := 0; //리더 값이 들어 오면 업데이트 방식으로 변경
      end else if nATDeviceType = 2 then
      begin
        if aButton[1] = ATStartWorkNo[1] then nATDeviceType := 0; //버튼 값이 들어 오면 업데이트 방식으로 변경
      end;
    end;
    bAtInsert := True;
    stAttendType := dmAdoQuery.GetUpdateAttendType(stDate,aTime,stCompanyCode,stEMCode,bAtInsert);
    if nATDeviceType = 0 then   //업데이트 방식 출퇴근 처리
    begin
      cAtType := '0';
      Process_UpdateAttendData(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay,bAtInsert);
    end else if nATDeviceType = 1 then  //카드리더
    begin
      bAtInsert := True;
      cAtType := aReaderNo[1];
      if cAtType = ATStartWorkNo[1] then stAttendType := '1' //출근
      else if cAtType = ATOffWorkNo[1] then stAttendType := '2' //퇴근
      else stAttendType := '0';
      Process_UpdateAttendData(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay,bAtInsert);
    end else if nATDeviceType = 2 then //버튼 타입
    begin
      bAtInsert := True;
      cAtType := aButton[1];
      if cAtType = ATStartWorkNo[1] then stAttendType := '1' //출근
      else if cAtType = ATOffWorkNo[1] then stAttendType := '2' //퇴근
      else stAttendType := '0';
      Process_UpdateAttendData(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay,bAtInsert);
    end else if nATDeviceType = 3 then //출입문 타입
    begin
      bAtInsert := True;
      cAtType := aDoorNo[1];
      if cAtType = ATStartWorkNo[1] then stAttendType := '1' //출근
      else if cAtType = ATOffWorkNo[1] then stAttendType := '2' //퇴근
      else stAttendType := '0';
      Process_UpdateAttendData(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay,bAtInsert);
    end;
  end else if nAtOutGubun = 1 then //외출 복귀 처리
  begin
    if ATInOutDeviceType = 1 then  //카드리더
    begin
      cAtType := aReaderNo[1];
      if cAtType = ATWorkOutsideNo[1] then stAttendType := '1' //외출
      else if cAtType = ATWorkInNo[1] then stAttendType := '2' //복귀
      else stAttendType := '0';
      Process_UpdateBussinessInOut(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay);
    end else if ATInOutDeviceType = 2 then  //버튼 타입
    begin
      cAtType := aButton[1];
      if cAtType = ATWorkOutsideNo[1] then stAttendType := '1' //외출
      else if cAtType = ATWorkInNo[1] then stAttendType := '2' //복귀
      else stAttendType := '0';
      Process_UpdateBussinessInOut(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay);
    end;
  end;

  if isDigit(aReaderNo) then nReaderNo := strtoint(aReaderNo)
  else nReaderNo := 0;
  
  stClientSendData := 'R' +
                      'E' +
                      aNodeNo +
                      aEcuID +
                      '00' +
                      FillZeroNumber(strtoint(aReaderNo),2) +
                      'AT' +
                      'C' +
                      FillZeroNumber(Length(aCardNo+';'+inttostr(nAtOutGubun)+';'+stAttendType) + 15 ,3) +
                      aTime +
                      cAtType +
                      aCardNo+';'+inttostr(nAtOutGubun)+';'+stAttendType;

  if Assigned(FOnSendEvent) then
  begin
    OnSendEvent(Self,stClientSendData,strtoint(aNodeNo));
  end;

end;

function TdmAttendEvent.Process_UpdateAttendData(aATDate, aNowTime,
  aCardNo, aCompanyCode, aEMCode, aAttendType: string; aWeekCode: integer;
  aYesterDay, aAtInsert: Boolean): Boolean;
begin

  if aAttendType = '1' then //출근
  begin
    InsertTB_ATTEND_INCode(aATDate,aNowTime,aCompanyCode,aEMCode,aWeekCode,aAtInsert);
  end else if aAttendType = '2' then //퇴근
  begin
    InsertTB_ATTEND_OutCode(aATDate,aNowTime,aCompanyCode,aEMCode,aWeekCode,aYesterDay);
  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '근태 데이터 저장 오류[근태코드]',aNowTime+':'+aCompanyCode+':'+aEMCode+':'+aAttendType);
    Exit;
  end;

end;

function TdmAttendEvent.Process_UpdateBussinessInOut(aATDate, aNowTime,
  aCardNo, aCompanyCode, aEMCode, aAttendType: string; aWeekCode: integer;
  aYesterDay: Boolean): Boolean;
begin

  if aAttendType = '1' then //외출
  begin
    InsertTB_ATTEND_BusinessOutCode(aATDate,aNowTime,aCompanyCode,aEMCode,aWeekCode,aYesterDay);
    //여기에서 외출시 현재 퇴근이면...
    if ATWorkNotBackupType = 0 then //미복귀시 현재 시간으로 퇴근 처리
      InsertTB_ATTEND_OutCode(aATDate,aNowTime,aCompanyCode,aEMCode,aWeekCode,aYesterDay)
    else if ATWorkNotBackupType = 1 then //미복귀시 정상 퇴근 처리
    begin
      dmAdoQuery.TB_ATEVENTOuttimeUpdate(aATDate,aCompanyCode,aEMCode,aNowTime,'001');
    end;
  end else if aAttendType = '2' then //복귀
  begin
    InsertTB_ATTEND_BACKCode(aATDate,aNowTime,aCompanyCode,aEMCode,aWeekCode,aYesterDay);
    if Not dmAdoQuery.DupCheckTB_ATEVENT_OutTime(aATDate,aNowTime,aCompanyCode,aEMCode) then  //퇴근 시간이 복귀 시간보다 작으면 
       dmAdoQuery.TB_ATEVENTOuttimeUpdate(aATDate,aCompanyCode,aEMCode,'','000'); //퇴근시간 지움
  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '근태 데이터 저장 오류[근태코드]',aNowTime+':'+aCompanyCode+':'+aEMCode+':'+aAttendType);
    Exit;
  end;

end;

procedure TdmAttendEvent.DataModuleCreate(Sender: TObject);
begin
  StringListCreate;
end;

procedure TdmAttendEvent.StringListCreate;
begin
    AttendConfigCodeList := TStringList.Create;
    AttendConfigHInFromTimeList := TStringList.Create; //공휴일 출입가능시작 시간
    AttendConfigHWorkTimeList := TStringList.Create; //공휴일 근무 시작 시간
    AttendConfigSInFromTimeList := TStringList.Create; //반휴일 출입가능시작 시간
    AttendConfigSWorkTimeList := TStringList.Create; //반휴일 근무 시작 시간
    AttendConfigInFromTimeList := TStringList.Create; //출입가능시작 시간
    AttendConfigWorkTimeList := TStringList.Create; //근무 시작 시간
    AttendConfigHOutTimeList := TStringList.Create; //공휴일 퇴근 시간
    AttendConfigHExtendTimeList := TStringList.Create; //공휴일 연장근무 시간
    AttendConfigHNightTimeList := TStringList.Create; //공휴일 야간근무 시간
    AttendConfigSOutTimeList := TStringList.Create; //반휴일 퇴근 시간
    AttendConfigSExtendTimeList := TStringList.Create; //반휴일연장근무 시간
    AttendConfigSNightTimeList := TStringList.Create; //반휴일야간근무 시간
    AttendConfigOutTimeList := TStringList.Create; //퇴근 시간
    AttendConfigExtendTimeList := TStringList.Create; //연장근무 시간
    AttendConfigNightTimeList := TStringList.Create; //야간근무 시간
    AttendConfigInToTimeList := TStringList.Create; //출입가능끝 시간
    AttendConfigSInToTimeList := TStringList.Create; //반휴일 출입가능끝 시간
    AttendConfigHInToTimeList := TStringList.Create; //공휴일 출입가능끝 시간
end;

procedure TdmAttendEvent.StringListClear;
begin
    AttendConfigCodeList.Clear;
    AttendConfigHInFromTimeList.Clear; //공휴일 출입가능시작 시간
    AttendConfigHWorkTimeList.Clear;
    AttendConfigSInFromTimeList.Clear; //반휴일 출입가능시작 시간
    AttendConfigSWorkTimeList.Clear; //반휴일 근무 시작 시간
    AttendConfigInFromTimeList.Clear; //출입가능시작 시간
    AttendConfigWorkTimeList.Clear; //근무 시작 시간
    AttendConfigHOutTimeList.Clear; //공휴일 퇴근 시간
    AttendConfigHExtendTimeList.Clear; //공휴일 연장근무 시간
    AttendConfigHNightTimeList.Clear; //공휴일 야간근무 시간
    AttendConfigSOutTimeList.Clear; //반휴일 퇴근 시간
    AttendConfigSExtendTimeList.Clear; //반휴일연장근무 시간
    AttendConfigSNightTimeList.Clear; //반휴일야간근무 시간
    AttendConfigOutTimeList.Clear; //퇴근 시간
    AttendConfigExtendTimeList.Clear; //연장근무 시간
    AttendConfigNightTimeList.Clear; //야간근무 시간
    AttendConfigInToTimeList.Clear; //출입가능끝 시간
    AttendConfigSInToTimeList.Clear; //반휴일 출입가능끝 시간
    AttendConfigHInToTimeList.Clear; //공휴일 출입가능끝 시간
end;

procedure TdmAttendEvent.AttendConfigCodeList_Add(aData: string);
begin
  //if AttendConfigCodeList.IndexOf(aData) < 0 then
  AttendConfigCodeList.Add(aData);
end;

procedure TdmAttendEvent.StringListFree;
begin
    AttendConfigCodeList.Free; //근태코드 리스트
    AttendConfigHInFromTimeList.Free; //공휴일 출입가능시작 시간
    AttendConfigHWorkTimeList.Free; //공휴일 근무 시작 시간
    AttendConfigSInFromTimeList.Free; //반휴일 출입가능시작 시간
    AttendConfigSWorkTimeList.Free; //반휴일 근무 시작 시간
    AttendConfigInFromTimeList.Free; //출입가능시작 시간
    AttendConfigWorkTimeList.Free; //근무 시작 시간
    AttendConfigHOutTimeList.Free; //공휴일 퇴근 시간
    AttendConfigHExtendTimeList.Free; //공휴일 연장근무 시간
    AttendConfigHNightTimeList.Free; //공휴일 야간근무 시간
    AttendConfigSOutTimeList.Free; //반휴일 퇴근 시간
    AttendConfigSExtendTimeList.Free; //반휴일연장근무 시간
    AttendConfigSNightTimeList.Free; //반휴일야간근무 시간
    AttendConfigOutTimeList.Free; //퇴근 시간
    AttendConfigExtendTimeList.Free; //연장근무 시간
    AttendConfigNightTimeList.Free; //야간근무 시간
    AttendConfigInToTimeList.Free; //출입가능끝 시간
    AttendConfigSInToTimeList.Free; //반휴일 출입가능끝 시간
    AttendConfigHInToTimeList.Free; //공휴일 출입가능끝 시간
end;

procedure TdmAttendEvent.DataModuleDestroy(Sender: TObject);
begin
  StringListFree;
end;

function TdmAttendEvent.GetEMPLOYEEATCode(aCompanyCode,
  aEMCode: string): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'select * from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ' ;
    stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ' ;

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;
      if FindField('AT_ATCODE').IsNull then Result := '000'
      else if Trim(FindField('AT_ATCODE').AsString) = '' then Result := '000'
      else Result := FindField('AT_ATCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmAttendEvent.GetChangeATCode(aTime: string;
  nWeekCode: integer): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
  stTime : string;

begin
  result := '001';
  stTime := copy(aTime,9,4);


  stSql := 'select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if nWeekCode = 1 then //일요일 데이터에서 찾자
  begin
    stSql := stSql + ' AND AT_HINFROMTIME <= ''' + stTime + ''' ';
    stSql := stSql + ' AND AT_HINTOTIME >= ''' + stTime + ''' ';
  end else if nWeekCode = 7 then
  begin
    stSql := stSql + ' AND AT_SINFROMTIME <= ''' + stTime + ''' ';
    stSql := stSql + ' AND AT_SINTOTIME >= ''' + stTime + ''' ';
  end else
  begin
    stSql := stSql + ' AND AT_INFROMTIME <= ''' + stTime + ''' ';
    stSql := stSql + ' AND AT_INTOTIME >= ''' + stTime + ''' ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;
      Result := FindField('AT_ATCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmAttendEvent.GetATInCode(aAttendCode, aNowTime: string;
  nWeekCode: integer): string;
var
  nIndex : integer;
  stInFromTime,stWorkStartTime:string;
begin
  result := '000';

  nIndex := AttendConfigCodeList.IndexOf(aAttendCode);
  if nIndex < 0 then Exit;
  if nWeekCode = 1 then  //공휴일
  begin
    if nIndex < AttendConfigHInFromTimeList.Count then stInFromTime := AttendConfigHInFromTimeList.Strings[nIndex]
    else stInFromTime := '0000';
    if nIndex < AttendConfigHWorkTimeList.Count then  stWorkStartTime := AttendConfigHWorkTimeList.Strings[nIndex]
    else stWorkStartTime := '0000';
  end else if nWeekCode = 7 then //토요일
  begin
    if nIndex < AttendConfigSInFromTimeList.Count then stInFromTime := AttendConfigSInFromTimeList.Strings[nIndex]
    else stInFromTime := '0000';
    if nIndex < AttendConfigSWorkTimeList.Count then  stWorkStartTime := AttendConfigSWorkTimeList.Strings[nIndex]
    else stWorkStartTime := '0000';
  end else //평일
  begin
    if nIndex < AttendConfigInFromTimeList.Count then stInFromTime := AttendConfigInFromTimeList.Strings[nIndex]
    else stInFromTime := '0000';
    if nIndex < AttendConfigWorkTimeList.Count then stWorkStartTime := AttendConfigWorkTimeList.Strings[nIndex]
    else stWorkStartTime := '0000';
  end;
  if copy(aNowTime,9,4) < stInFromTime then result := '004' //조기출근
  else if copy(aNowTime,9,4) > stWorkStartTime then result := '002' //지각
  else result := '001'; //정상출근

  if ATOutFixedType = 1 then  result := '001';  //전사원 정시출퇴근이면 정상퇴근으로 넘김

end;

function TdmAttendEvent.InsertTB_ATTEND_OutCode(aDate, aNowTime,
  aCompanyCode, aEMCode: String; nWeekCode: integer;
  aYesterDay: Boolean): Boolean;
var
  stAttendCode : string;
  stATOutCode : string;
  nIndex : integer;
begin
  result := False;

  stAttendCode := GetOutAttendCode(aDate,aCompanyCode,aEMCode); //근태 데이터에서 근태코드를 가져옴.
  nIndex := AttendConfigCodeList.IndexOf(stAttendCode);
  if nIndex = -1 then //근태코드를 찾지 못한경우
  begin
    if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
    begin
      dmAdoQuery.TB_ATEVENTOuttimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aNowTime,'000');
    end else
    begin
      if dmAdoQuery.DupCheckTB_ATEVENT_OutTime(aDate,aNowTime,aCompanyCode,aEMCode) then   //퇴근시간이 없거나 현재시간보다 작은 경우
         dmAdoQuery.TB_ATEVENTOuttimeUpdate(aDate,aCompanyCode,aEMCode,aNowTime,'000');
    end;
    Exit;
  end;
  
  if dmAdoQuery.DupCheckTB_ATEVENT_OutTime(aDate,aNowTime,aCompanyCode,aEMCode) then   //퇴근시간이 없거나 현재시간보다 작은 경우
  begin
    stATOutCode := GetATOutCode(stAttendCode,aNowTime,nWeekCode,aYesterDay);  //근태타입에 대한 퇴근코드 가져오자.
    dmAdoQuery.TB_ATEVENTOuttimeUpdate(aDate,aCompanyCode,aEMCode,aNowTime,stATOutCode);
    result := True;
  end;
end;

function TdmAttendEvent.InsertTB_ATTEND_BusinessOutCode(aAtDate, aNowTime,
  aCompanyCode, aEMCode: String; aWeekCode: integer;
  aYesterDay: Boolean): Boolean;
begin
  result := False;

  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aAtDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
  begin
    dmAdoQuery.TB_ATEVENTLEAVEtimeInsert(aAtDate,aCompanyCode,aEMCode,inttostr(aWeekCode),aNowTime);
  end else
  begin
    if dmAdoQuery.DupCheckTB_ATEVENT_BussinessOutTime(aAtDate,aNowTime,aCompanyCode,aEMCode) then   //외근시간이 없거나 현재시간보다 큰 경우
       dmAdoQuery.TB_ATEVENTLEAVEtimeUpdate(aAtDate,aCompanyCode,aEMCode,aNowTime);
  end;

end;

function TdmAttendEvent.InsertTB_ATTEND_BACKCode(aAtDate, aNowTime,
  aCompanyCode, aEMCode: String; nWeekCode: integer;
  aYesterDay: Boolean): Boolean;
begin
  result := False;

  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aAtDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
  begin
    dmAdoQuery.TB_ATEVENTBACKtimeInsert(aAtDate,aCompanyCode,aEMCode,inttostr(nWeekCode),aNowTime);
  end else
  begin
    if dmAdoQuery.DupCheckTB_ATEVENT_BussinessInTime(aAtDate,aNowTime,aCompanyCode,aEMCode) then   //복귀시간이 없거나 현재시간보다 작은 경우
      dmAdoQuery.TB_ATEVENTBACKtimeUpdate(aAtDate,aCompanyCode,aEMCode,aNowTime);
  end;

end;

procedure TdmAttendEvent.AttendConfigHInFromTimeList_Add(aData: string);
begin
  //if AttendConfigHInFromTimeList.IndexOf(aData) < 0 then
  AttendConfigHInFromTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigHWorkTimeList_Add(aData: string);
begin
  //if AttendConfigHWorkTimeList.IndexOf(aData) < 0 then
  AttendConfigHWorkTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSInFromTimeList_Add(aData: string);
begin
  //if AttendConfigSInFromTimeList.IndexOf(aData) < 0 then
  AttendConfigSInFromTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSWorkTimeList_Add(aData: string);
begin
  //if AttendConfigSWorkTimeList.IndexOf(aData) < 0 then
  AttendConfigSWorkTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigInFromTimeList_Add(aData: string);
begin
  //if AttendConfigInFromTimeList.IndexOf(aData) < 0 then
  AttendConfigInFromTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigWorkTimeList_Add(aData: string);
begin
  //if AttendConfigWorkTimeList.IndexOf(aData) < 0 then
  AttendConfigWorkTimeList.Add(aData);
end;

function TdmAttendEvent.GetOutAttendCode(aDate, aCompanyCode,
  aEMCode: string): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';


  stSql := 'select * from TB_ATEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ' ;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ' ;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;
      if FindField('AT_ATCODE').IsNull then Result := '000'
      else if Trim(FindField('AT_ATCODE').AsString) = '' then Result := '000'
      else Result := FindField('AT_ATCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmAttendEvent.GetATOutCode(aAttendCode, aTime: string;
  nWeekCode: integer; bYesterDay: Boolean): string;
var
  nIndex : integer;
  stWorkEndTime:string;
  stExtendTime:string;
  stNightTime:string;
begin
  result := '000';


  nIndex := AttendConfigCodeList.IndexOf(aAttendCode);
  if nIndex < 0 then Exit;
  if nWeekCode = 1 then  //공휴일
  begin
    if nIndex < AttendConfigHOutTimeList.Count then stWorkEndTime := AttendConfigHOutTimeList.Strings[nIndex]
    else stWorkEndTime := '2400';
    if nIndex < AttendConfigHExtendTimeList.Count then stExtendTime := AttendConfigHExtendTimeList.Strings[nIndex]
    else stExtendTime := '2400';
    if nIndex < AttendConfigHNightTimeList.Count then stNightTime := AttendConfigHNightTimeList.Strings[nIndex]
    else stNightTime := '2400';
  end else if nWeekCode = 7 then //토요일
  begin
    if nIndex < AttendConfigSOutTimeList.Count then stWorkEndTime := AttendConfigSOutTimeList.Strings[nIndex]
    else stWorkEndTime := '2400';
    if nIndex < AttendConfigSExtendTimeList.Count then stExtendTime := AttendConfigSExtendTimeList.Strings[nIndex]
    else stExtendTime := '2400';
    if nIndex < AttendConfigSNightTimeList.Count then stNightTime := AttendConfigSNightTimeList.Strings[nIndex]
    else stNightTime := '2400';
  end else //평일
  begin
    if nIndex < AttendConfigOutTimeList.Count then stWorkEndTime := AttendConfigOutTimeList.Strings[nIndex]
    else stWorkEndTime := '2400';
    if nIndex < AttendConfigExtendTimeList.Count then stExtendTime := AttendConfigExtendTimeList.Strings[nIndex]
    else stExtendTime := '2400';
    if nIndex < AttendConfigNightTimeList.Count then stNightTime := AttendConfigNightTimeList.Strings[nIndex]
    else stNightTime :='2400';
  end;

  if Not bYesterDay then  //저녁에 퇴근이면...
  begin
    if copy(aTime,9,4) < stWorkEndTime then result := '002' //조퇴
    else result := '001';    //정상퇴근
    if stExtendTime <> '0000' then
    begin
      if stExtendTime > AtYesterDayStandTime then //작으면 연장근무시간이 새벽이므로 어제날짜 기준일때 적용 됨
      begin
        if stNightTime > AtYesterDayStandTime then
        begin
          if (stExtendTime < copy(aTime,9,4)) and (copy(aTime,9,4) < stNightTime) then result := '003' //연장근무
          else if copy(aTime,9,4) >= stNightTime then result := '004'; //야간근무
        end else result := '003'; //야간근무 기준이 새벽이면 무조건 연장근무임
      end;
    end else  //연장코드 미사용
    begin
      if  stNightTime <> '0000' then   //야간코드 미사용이면 그냥 정규퇴근
      begin
        if stNightTime > AtYesterDayStandTime then  //야간근무시간이 새벽이 아니면...
        begin
          if copy(aTime,9,4) >= stNightTime then result := '004'; //야간근무
        end;
      end;
    end;
  end else   //새벽에 퇴근이면...
  begin
    result := '001'; //정상 퇴근
    if stExtendTime <> '0000' then //연장근무 사용중이고...
    begin
      if stExtendTime < AtYesterDayStandTime then //연장근무시간이 새벽부터이면
      begin
        if stExtendTime < copy(aTime,9,4) then
        begin
          result := '003'; //연장근무
          if stNightTime <> '0000' then //야간근무시간 사용중이고...
          begin
            if stNightTime < AtYesterDayStandTime then  // 야간 근무가 새벽이면
            begin
              if stNightTime < copy(aTime,9,4) then result := '004'; //야간근무
            end;
          end;
        end;
      end else //연장근무 시간이 저녁 시간이면
      begin
        result := '003'; //연장근무
        if stNightTime <> '0000' then //야간근무시간 사용중이고...
        begin
          if stNightTime < AtYesterDayStandTime then //새벽시간부터 시작이면
          begin
            if stNightTime < copy(aTime,9,4) then result := '004'; //야간근무
          end else result := '004';
        end;
      end;
    end else //연장근무 사용 안 하고
    begin
      if stNightTime <> '0000' then //야간근무시간 사용중이고...
      begin
        if stNightTime < AtYesterDayStandTime then //야간근무시간이 새벽부터이면
        begin
          if stNightTime < copy(aTime,9,4) then result := '004'; //야간근무
        end else result := '004'; //야간근무가 저녁시간부터이면 야간근무
      end;
    end;
  end;
  if ATOutFixedType = 1 then  result := '001';  //전사원 정시출퇴근이면 정상퇴근으로 넘김

end;

procedure TdmAttendEvent.AttendConfigHOutTimeList_Add(aData: string);
begin
  //if AttendConfigHOutTimeList.IndexOf(aData) < 0 then
  AttendConfigHOutTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigHExtendTimeList_Add(aData: string);
begin
  //if AttendConfigHExtendTimeList.IndexOf(aData) < 0 then
  AttendConfigHExtendTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigHNightTimeList_Add(aData: string);
begin
  //if AttendConfigHNightTimeList.IndexOf(aData) < 0 then
  AttendConfigHNightTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSOutTimeList_Add(aData: string);
begin
  //if AttendConfigSOutTimeList.IndexOf(aData) < 0 then
  AttendConfigSOutTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSExtendTimeList_Add(aData: string);
begin
  //if AttendConfigSExtendTimeList.IndexOf(aData) < 0 then
  AttendConfigSExtendTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSNightTimeList_Add(aData: string);
begin
  //if AttendConfigSNightTimeList.IndexOf(aData) < 0 then
  AttendConfigSNightTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigOutTimeList_Add(aData: string);
begin
  //if AttendConfigOutTimeList.IndexOf(aData) < 0 then
  AttendConfigOutTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigExtendTimeList_Add(aData: string);
begin
  //if AttendConfigExtendTimeList.IndexOf(aData) < 0 then
  AttendConfigExtendTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigNightTimeList_Add(aData: string);
begin
  //if AttendConfigNightTimeList.IndexOf(aData) < 0 then
  AttendConfigNightTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigHInToTimeList_Add(aData: string);
begin
  //if AttendConfigHInToTimeList.IndexOf(aData) < 0 then
  AttendConfigHInToTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigInToTimeList_Add(aData: string);
begin
  //if AttendConfigInToTimeList.IndexOf(aData) < 0 then
  AttendConfigInToTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSInToTimeList_Add(aData: string);
begin
  //if AttendConfigSInToTimeList.IndexOf(aData) < 0 then
  AttendConfigSInToTimeList.Add(aData);
end;

end.
