unit uATStateCalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ComCtrls, DB, ADODB;

type
  TfmATStateCalc = class(TForm)
    btn_Summary: TBitBtn;
    btn_Close: TBitBtn;
    Label1: TLabel;
    dt_Date: TDateTimePicker;
    Gauge: TGauge;
    ADOQuery: TADOQuery;
    ADOExec: TADOQuery;
    ADOTemp: TADOQuery;
    ADOQuery1: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_SummaryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    HolidayList : TStringList;
    { Private declarations }
    Function SummaryCheck(var aUser:string) : Boolean;
    Function SummaryWork(aState : string):Boolean;
    Function GetHoliday:integer;
    Function SaturdayATCheck:Boolean; //토요일 휴무 체크
    Function DeleteTB_MONTHAT(aMonth:string):Boolean;
    Function ATDataSummary(aMonth,aLastDay,aCardNo:string):Boolean; //해당월 해당카드 집계
    Function UpdateTB_MONTHAT(aMonth,aCardNo,aField,aValue,aType:string):Boolean;
    Function GetNightCheck(aCode,aIntime,aOutTime:string;var aValue:string;Var aNightTime:integer):Boolean;
    Function GetATCode(aInTime:string; var aCode,aNightTime :string):Boolean;
    Function CalcTime(aNightTime,aOutTime:string):integer;
  public
    { Public declarations }
  end;

var
  fmATStateCalc: TfmATStateCalc;

implementation
uses
uDataModule1,
uLomosUtil;

{$R *.dfm}

procedure TfmATStateCalc.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmATStateCalc.FormActivate(Sender: TObject);
begin
  dt_Date.Date := Now;
end;

procedure TfmATStateCalc.btn_SummaryClick(Sender: TObject);
var
  stSql : string;
  stMonth : string;
  bResult : Boolean;
  stUser : string;
  stCardNo : string;
  nLastDay : integer; //해당월의 마지막 날짜
begin

  btn_Summary.Enabled := False;
  //휴일체크
  nLastDay := GetHoliday;

  stMonth := FormatDateTime('yyyymm',dt_Date.Date);

  bResult := SummaryCheck(stUser);
  if Not bResult then
  begin
    showmessage('현재 ' + stUser + '가 집계 작업 중입니다.');
    Exit;
  end;

  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      btn_Summary.Enabled := True;
      showmessage('테이블 오픈 실패');
      Exit;
    End;
    if recordCount < 1 then  Exit;

    Gauge.Visible := True;
    Gauge.MaxValue := recordCount;
    Gauge.Progress := 0;
    SummaryWork('START');
    DeleteTB_MONTHAT(stMonth);  //작업월 데이터를 삭제 하여 클리어 한다.
    while Not Eof do
    begin
      stCardNo := FindField('CA_CARDNO').AsString ;
      ATDataSummary(stMonth,FillzeroNumber(nLastDay,2),stCardNo);
      Gauge.Progress := Gauge.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  Gauge.Visible := False;
  SummaryWork('END');
  btn_Summary.Enabled := True;
end;

function TfmATStateCalc.SummaryCheck(var aUser:string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Select * from TB_CURRENTDAEMON ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CU_STATECODE = ''ATSUMMARY'' ';

  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Result := True
    else
    begin
      aUser := FindField('CU_STATEVALUE').AsString ;
    end;
  end;
end;

function TfmATStateCalc.SummaryWork(aState: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  if aState = 'START' then
  begin
    stSql := 'Insert Into TB_CURRENTDAEMON(GROUP_CODE,CU_STATECODE,CU_STATEVALUE)';
    stsql := stSql + ' VALUES (''' + GROUPCODE + ''',';
    stSql := stSql + '''ATSUMMARY'',';
    stSql := stSql + '''' + Master_ID + ''')';
  end
  else if aState = 'END' then
  begin
    stSql := 'Delete From TB_CURRENTDAEMON ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''' ;
    stSql := stSql + ' AND CU_STATECODE = ''ATSUMMARY''';
  end;

  with ADOExec do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;

  Result := True;
end;

procedure TfmATStateCalc.FormCreate(Sender: TObject);
begin
  HolidayList := TStringList.Create;
end;

procedure TfmATStateCalc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  HolidayList.Free;
end;

function TfmATStateCalc.GetHoliday: integer;
var
  stSql : string;
  stMonth : string;
  stDate : string;
  i : integer;
  bSaturDay : Boolean;
begin
  result := 0;
  bSaturDay := SaturdayATCheck;
  stMonth := FormatDateTime('yyyy-mm',dt_Date.Date);
  HolidayList.Clear;
  for i := 1 to 32 do
  begin
    stDate := stMonth + '-' + FillZeroNumber(i,2);
    if Not DateCheck(stDate) then break;
    if DayOfWeek(StrtoDate(stDate)) = 1 then
        HolidayList.Add(StringReplace(stDate,'-','',[rfReplaceAll])); //일요일
    if bSaturDay then
    begin
      if DayOfWeek(StrtoDate(stDate)) = 7 then
          HolidayList.Add(StringReplace(stDate,'-','',[rfReplaceAll])); //토요일
    end;
  end;
  result := i - 1; //마지막 날짜 구함
  stSql := 'select * From TB_HOLIDAY';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND HO_DAY Between ''' + FormatDateTime('yyyymm',dt_Date.Date) + '01'' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymm',dt_Date.Date) + '31'' ';

  with AdoTemp do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      if HolidayList.IndexOf(FindField('HO_DAY').AsString) < 0 then HolidayList.Add(FindField('HO_DAY').AsString);
      Next;
    end;
  end;
  HolidayList.Sort;
end;

function TfmATStateCalc.SaturdayATCheck: Boolean;
var
  stSql : string;
begin
  result := True;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''ATTEND'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''SATURDAY'' ';

  with AdoTemp do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    if FindField('CO_CONFIGVALUE').AsString = 'N' then Result := False;
  end;
end;

function TfmATStateCalc.DeleteTB_MONTHAT(aMonth: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_MONTHAT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND MO_MONTH = ''' + aMonth + ''' ';

  with ADOExec do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Execsql;
    Except
      Exit;
    End;

  end;
  result := True;
end;

function TfmATStateCalc.ATDataSummary(aMonth, aLastDay,
  aCardNo: string): Boolean;
var
  stSql : string;
  nTotCnt : integer; //총 출근해야 될 날수
  nATCnt : integer;  // 출근일수
  nJikakCnt : integer; //지각일수
  nJotaeCnt : integer;  //조퇴일수
  nNightCnt : integer;  //야근일수
  nNightTime : integer;  //야근 시간(분)
  nTempTime : integer;
  nHolidayCnt : integer; //휴일근무일수
  nHolidayTime : integer; //휴일근무시간(분)
  nABSENCECNT : integer; //결근일수
  i : integer;
  stValue : string; //'0'근무없음,'1'정상출퇴근,'2'정상출근조퇴,'3'지각정상퇴근,'4'지각조퇴,'A'결근,'B'휴일근무,'C'야근,'D'지각야근
  bResult : Boolean;
begin
  result := False;
  nTotCnt := strtoint(aLastDay) - HolidayList.Count ; //총 날짜 중 휴일 날짜를 뺀 수가 출근해야 될 날짜.
  stSql := ' Insert Into TB_MONTHAT(GROUP_CODE,MO_MONTH,CA_CARDNO) ';
  stSql := stSql + ' VALUES(''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aMonth + ''',';
  stSql := stSql + '''' + aCardNo + ''')';

  with AdoExec do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;

  stSql := ' Select * from TB_ATEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE Between ''' + aMonth + '01'' ';
  stSql := stSql + ' AND ''' + aMonth + aLastDay + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Order By AT_DATE ';

  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    nATCnt := 0;
    nJikakCnt := 0;
    nJotaeCnt := 0;
    nNightCnt := 0;
    nNightTime := 0;
    nHolidayCnt := 0;
    nHolidayTime := 0;
    nABSENCECNT := 0;
    if RecordCount < 1 then
    begin
      for i := 1 to strtoint(aLastDay) do
      begin
        if HolidayList.IndexOf(aMonth + FillZeroNumber(i,2)) < 0 then
        begin
          inc(nABSENCECNT);
          UpdateTB_MONTHAT(aMonth,aCardNo,'MO_' + FillZeroNumber(i,2),'A','CHAR');  //결근
        end else
          UpdateTB_MONTHAT(aMonth,aCardNo,'MO_' + FillZeroNumber(i,2),'0','CHAR'); //근무없음
      end;
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_ATCNT' ,inttoStr(nATCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_JIKAKCNT' ,inttoStr(nJikakCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_JOTAECNT' ,inttoStr(nJotaeCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_NIGHTCNT' ,inttoStr(nNightCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_TOTATCNT' ,inttoStr(nTotCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_ABSENCECNT' ,inttoStr(nABSENCECNT),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_NIGHTTIME' ,inttoStr(nNightTime),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_HOLIDAYCNT' ,inttoStr(nHolidayCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_HOLIDAYTIME' ,inttoStr(nHolidayTime),'INTEGER');

      Result := True;
      Exit;
    end;
    nATCnt := RecordCount; //총 출근일수
    for i := 1 to strtoint(aLastDay) do
    begin
      if HolidayList.IndexOf(aMonth + FillZeroNumber(i,2)) < 0 then
      begin
        inc(nABSENCECNT);
        UpdateTB_MONTHAT(aMonth,aCardNo,'MO_' + FillZeroNumber(i,2),'A','CHAR');  //결근
      end else
        UpdateTB_MONTHAT(aMonth,aCardNo,'MO_' + FillZeroNumber(i,2),'0','CHAR'); //근무없음
    end;
    First;
    While Not Eof do
    begin
      if HolidayList.IndexOf(FindField('AT_DATE').AsString) < 0 then //정상근무
      begin
        stValue := '1' ; //'0'근무없음,'1'정상출퇴근,'2'정상출근조퇴,'3'지각정상퇴근,'4'지각조퇴,'A'결근,'B'휴일근무,'C'야근,'D'지각야근
        nABSENCECNT := nABSENCECNT - 1;
        if FindField('AT_INRESULT').AsString = 'N' then   //지각자이면
        begin
          stValue := '3';
          inc(nJikakCnt);
          bResult := False;
          if FindField('AT_OUTRESULT').AsString = 'N' then
          begin
            stValue := '4'; //조퇴자이면
            inc(nJotaeCnt);
          end
          else bResult := GetNightCheck(FindField('AT_ATCODE').AsString,FindField('AT_INTIME').AsString,FindField('AT_OUTTIME').AsString,stValue,nTempTime);
          if bResult then
          begin
            inc(nNightCnt);
            nNightTime := nNightTime + nTempTime;
          end;
        end else
        begin
          bResult := False;
          if FindField('AT_OUTRESULT').AsString = 'N' then
          begin
            stValue := '2';
            inc(nJotaeCnt);
          end
          else bResult := GetNightCheck(FindField('AT_ATCODE').AsString,FindField('AT_INTIME').AsString,FindField('AT_OUTTIME').AsString,stValue,nTempTime);
          if bResult then
          begin
           inc(nNightCnt);
           nNightTime := nNightTime + nTempTime;
          end;
        end;
      end else begin //휴일근무
        inc(nHolidayCnt);
        nTempTime := CalcTime(copy(FindField('AT_INTIME').AsString,9,4),copy(FindField('AT_OUTTIME').AsString,9,4)) ;
        nHolidayTime := nHolidayTime + nTempTime;
        stValue := 'B'; //휴일근무
      end;
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_' + Copy(FindField('AT_DATE').AsString,7,2),stValue,'CHAR');  //결근

      Next;
    end;
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_ATCNT' ,inttoStr(nATCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_JIKAKCNT' ,inttoStr(nJikakCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_JOTAECNT' ,inttoStr(nJotaeCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_NIGHTCNT' ,inttoStr(nNightCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_TOTATCNT' ,inttoStr(nTotCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_ABSENCECNT' ,inttoStr(nABSENCECNT),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_NIGHTTIME' ,inttoStr(nNightTime),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_HOLIDAYCNT' ,inttoStr(nHolidayCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_HOLIDAYTIME' ,inttoStr(nHolidayTime),'INTEGER');

  end;

  result := True;
end;

function TfmATStateCalc.UpdateTB_MONTHAT(aMonth, aCardNo, aField,
  aValue,aType: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := ' Update TB_MONTHAT SET ' + aField + ' = ';
  if aType = 'CHAR' then stSql := stSql + '''';
  stSql := stSql + aValue ;
  if aType = 'CHAR' then stSql := stSql + '''';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND MO_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  with AdoExec  do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
    Result := True;
  end;
end;

function TfmATStateCalc.GetNightCheck(aCode,aIntime,aOutTime:string; var aValue: string; Var aNightTime:integer): Boolean;
var
  bResult : Boolean;
  stNightTime : string;
begin
  result := False;
  bResult := True;
  aNightTime := 0;
  bResult := GetATCode(aInTime,aCode,stNightTime);
  if Not bResult then Exit; //stNightTime 를 못가져 온 경우 야근 체크 하지 말자.
  if Length(Trim(stNightTime)) <> 4 then Exit; //stNightTime 를 못가져 온 경우 야근 체크 하지 말자.
  if strtoint(stNightTime) < strtoint(copy(aOutTime,9,4)) then //당일 날짜인경우 체크
  begin
    aNightTime := CalcTime(stNightTime,copy(aOutTime,9,4));
    if aValue = '3' then aValue := 'D'        //지각야근
    else if aValue = '1' then aValue := 'C';  //정상야근
    result := True; //야근시에만 True
  end else if strtoint(copy(aIntime,1,8)) < strtoint(copy(aOutTime,1,8)) then //전일 출근 다음날 퇴근인경우
  begin
    aNightTime := CalcTime(stNightTime,copy(aOutTime,9,4));
    if aValue = '3' then aValue := 'D'        //지각야근
    else if aValue = '1' then aValue := 'C';  //정상야근
    result := True; //야근시에만 True
  end;

end;

function TfmATStateCalc.GetATCode(aInTime: string;
  var aCode,aNightTime: string): Boolean;
var
  stSql : string;
  nRow : integer;
begin
  result := False;
  stSql := 'select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Trim(aCode) <> '' then stSql := stSql + ' AND AT_ATCODE = ''' + aCode + ''' ';
  aNightTime := '';

  with AdoTemp do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql ;

    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    if Trim(aCode) <> '' then
    begin
      aNightTime := FindField('AT_NIGHTTIME').AsString;
    end else
    begin
      While Not Eof do
      begin
        if FindField('AT_INFROMTIME').asInteger < FindField('AT_INTOTIME').asInteger then   //정상인경우
        begin
          if FindField('AT_INFROMTIME').asInteger < strtoint(aInTime) then
          begin
            if FindField('AT_INTOTIME').asInteger > strtoint(aInTime) then
            begin
              aCode :=  FindField('AT_ATCODE').AsString;
              aNightTime := FindField('AT_NIGHTTIME').AsString;
              Break;
            end;
          end;
        end else   //다음날로 넘어가는 경우
        begin
          if FindField('AT_INFROMTIME').asInteger < strtoint(aInTime) then
          begin
            aCode :=  FindField('AT_ATCODE').AsString;
            aNightTime := FindField('AT_NIGHTTIME').AsString;
            Break;
          end else if  FindField('AT_INTOTIME').asInteger > strtoint(aInTime) then
          begin
            aCode :=  FindField('AT_ATCODE').AsString;
            aNightTime := FindField('AT_NIGHTTIME').AsString;
            Break;
          end;
        end;
        Next;
      end;
    end; //If

  end;
  if Trim(aCode) <> '' then result := True;
end;

function TfmATStateCalc.CalcTime(aNightTime, aOutTime: string): integer;
var
  nBasicHH : integer;
  nBasicMM : integer;
  nDestHH : integer;
  nDestMM : integer;
  nCalcHH : integer;
  nCalcMM : integer;
begin
  nBasicHH := strtoint(copy(aNightTime,1,2));
  nBasicMM := strtoint(copy(aNightTime,3,2));
  nDestHH := strtoint(copy(aOutTime,1,2));
  nDestMM := strtoint(copy(aOutTime,3,2));

  if nBasicHH > nDestHH then nDestHH := nDestHH + 24; //다음날 새벽에 나가는 경우
  if nBasicMM > nDestMM then
  begin
    nDestHH := nDestHH - 1;
    nDestMM := nDestMM + 60;
  end;
  nCalcHH := nDestHH - nBasicHH;
  nCalcMM := nDestMM - nBasicMM;
  result := (nCalcHH * 60) + nCalcMM;
end;

end.
