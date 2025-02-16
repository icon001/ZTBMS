unit uDaySummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, ComCtrls, StdCtrls, Buttons, uSubForm, CommandArray, DB,
  ADODB,DateUtils,ActiveX;

type
  TfmDaySummary = class(TfmASubForm)
    GroupBox2: TGroupBox;
    Gauge1: TGauge;
    btn_Summary: TBitBtn;
    btn_Close: TBitBtn;
    Label2: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    Label3: TLabel;
    Label17: TLabel;
    cmb_Depart: TComboBox;
    GroupBox1: TGroupBox;
    dt_Date: TDateTimePicker;
    Label1: TLabel;
    ADOQuery: TADOQuery;
    ADOTmpQuery: TADOQuery;
    ADOSummary: TADOQuery;
    ADOMonthSummary: TADOQuery;
    Label4: TLabel;
    ed_emCode: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure btn_SummaryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    L_nSaturday : integer;         //0:휴무,1:반휴일,2:평일
    L_nATTypePay : integer;        //0:근태타입에 따른 계산,1:통상적인 계산
    L_nATType : integer;           //0:고정근무타입,1:사원별근무타입,2:교대근무타입 ,3:혼합타입

    L_nEarlyAdd : integer;         //평일 조기가산
    L_nExtendAdd : integer;        //평일 연장
    L_nNightAdd : integer;         //평일 심야
    L_nsEarlyAdd : integer;         //토요일 조기가산
    L_nsExtendAdd : integer;        //토요일 연장
    L_nsNightAdd : integer;         //토요일 심야
    L_nhEarlyAdd : integer;         //공휴일 조기가산
    L_nhNormalAdd : integer;         //공휴일 조기가산
    L_nhExtendAdd : integer;        //공휴일 연장
    L_nhNightAdd : integer;         //공휴일 심야

    L_WeekTime : integer;          //주간 근무 기준시간
    L_nMonthATTime : integer;      //월간 근무 기준시간
    L_stYesterDayTime : string;    //어제날짜 기준시간
    L_nMonthLastDay : integer;     //월 분리 일자

    L_ErrCount : integer;   //미집계 카운트
    L_TotCount : integer;   //총 건수
    { Private declarations }
    Function CheckHolidy(aYear,aMonth,aDay:string):Boolean;
    Function LoadConfig:Boolean;
    Function GetPersonType(aCompanyCode,aEmCode,aWeekCode:string;aTimeAmt:integer;var aInfromAdd,aWorkAdd,aExtendAdd,aNightAdd:integer;var bFixedAmt:Boolean):Boolean;
    Function MonthSummary(aMonth,aPreMonth,
                   aCompanyCode,aEmCode,aPayGubun,aPayAmt:string ):Boolean;
    Function MonthHolidaySummary(aMonth,aStartDate,aEndDate,aCompanyCode,aEmCode,aPayGubun,aPayAmt:string):Boolean; //공휴일수 심야 가산 집계
    Function MonthWeekSummary(aMonth,aStartDate,aEndDate,aCompanyCode,aEmCode,aPayGubun,aPayAmt:string):Boolean; //평일일수 심야 가산 집계

    Function VacationCheck(aDate,aCompanyCode,aEmCode:string; var aPayVacation,aNonPayVacation:string):Boolean;
    Function DiffMinute(aLargeTime,aSmallTime:string;aCheck:integer):integer;
    Function MakeWorkTime_Minute(aEndTime,aStartTime:string;aCheck:integer):integer;
    Function GetPerAmt(aTimeAmt,aMinuate,aPer:integer;bFixedAmt:Boolean):integer;
    Function GetWorkTime(var aWorkStartTime,aWorkEndTime:string):Boolean;

    Function InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,aAtType,aWeekCode,aInfromMM,aWorkMM,
                          aExtendMM,aNightMM,aPayVacation,aNonPayVacation,aInfromAmt,aWorkAmt,
                          aExtendAmt,aNightAmt,aJiKag,aJotae,aRealyATTimeMM,aLeaveCount,aBackCount,aJijumCode,aDepartCode,aEmName:string):Boolean;
    Function DeleteTB_AtDAYSUMMARY(aDate,aCompanyCode,aEmCode:string):Boolean;
    Function DeleteTB_AtMonthSummary(aMonth,aCompanyCode,aEmCode:string):Boolean;
    Function InsertTB_ATMonthSummary(aMonth,aCompanyCode,aEmCode,aStartDate,aEndDate,
                          aAT_TOTDAYCOUNT,aAT_HOLIDAYCOUNT,aAT_ATTENDDAYCOUNT,aAT_INCOUNT,aAT_JIKAGCOUNT,aAT_JOTAECOUNT,
                          aAT_NONATCOUNT,aAT_PAYVACOUNT,aAT_NONPAYVACOUNT,aAT_INFROMMM,aAT_WORKMM,aAT_EXTENDMM,
                          aAT_NIGHTMM,aAT_HOLIDAYMM,aAT_INFROMAMT,aAT_WORKAMT,aAT_EXTENDAMT,aAT_NIGHTAMT,
                          aAT_HOLIDAYAMT,aAT_REALATTIMEMM,aLeaveCount,aBackCount:string):Boolean;
    Function UpdateTB_ATMonthSummary(aMonth,aCompanyCode,aEmCode,
                          aAT_TOTDAYCOUNT,aAT_HOLIDAYCOUNT,aAT_ATTENDDAYCOUNT,aAT_INCOUNT,aAT_JIKAGCOUNT,aAT_JOTAECOUNT,
                          aAT_NONATCOUNT,aAT_PAYVACOUNT,aAT_NONPAYVACOUNT,aAT_INFROMMM,aAT_WORKMM,aAT_EXTENDMM,
                          aAT_NIGHTMM,aAT_HOLIDAYMM,aAT_INFROMAMT,aAT_WORKAMT,aAT_EXTENDAMT,aAT_NIGHTAMT,
                          aAT_HOLIDAYAMT,aRealyATTimeMM,aLeaveCount,aBackCount:string):Boolean;
  public
    { Public declarations }
    procedure ErrorCount(Sender: TObject;  EventType,EventData:string);
  end;

var
  fmDaySummary: TfmDaySummary;
  CompanyCodeList : TStringList;
  JijumCodeList : TStringList;
  DepartCodeList : TStringList;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uCompanyCodeLoad,
  uMssql,
  uPostGreSql,
  uMDBSql,
  udmDaySummary;

{$R *.dfm}

procedure TfmDaySummary.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDaySummary.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  L_nATTypePay :=0;        //0:근태타입에 따른 계산,1:통상적인 계산
  L_nATType := 0;
  L_WeekTime :=0;          //주간 근무 기준시간
  L_nEarlyAdd :=0;          //평일 조기가산
  L_nExtendAdd :=0;         //평일 연장
  L_nNightAdd :=0;        //평일 심야
  L_nsEarlyAdd :=0;          //토요일 조기가산
  L_nsExtendAdd :=0;         //토요일 연장
  L_nsNightAdd :=0;          //토요일 심야
  L_nhEarlyAdd :=0;         //공휴일 조기가산
  L_nhNormalAdd:=0;          //공휴일 가산
  L_nhExtendAdd :=0;         //공휴일 연장
  L_nhNightAdd :=0;          //공휴일 심야

  dt_Date.Date := Now;

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);
  LoadConfig;


  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 1 then
    begin
      nIndex := CompanyCodeList.IndexOf(MasterCompany);
      if nIndex > -1 then
      begin
        cmb_Company.ItemIndex := nIndex;
        LoadJijumCode(CompanyCodeList.Strings[nIndex],JijumCodeList,cmb_Jijum);
      end;
      cmb_Company.Enabled := False;
    end;
    if strtoint(CompanyGrade) > 2 then
    begin
      nIndex := JijumCodeList.IndexOf(MasterCompany + MasterJijum);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
      cmb_Jijum.Enabled := False;
    end;
  end;
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

end;

procedure TfmDaySummary.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;

end;

procedure TfmDaySummary.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TstringList.Create;

  dmDaySummary.OnEvent := ErrorCount;
end;

procedure TfmDaySummary.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

end;

procedure TfmDaySummary.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

end;

procedure TfmDaySummary.btn_SummaryClick(Sender: TObject);
var
  lastDay: TDate;
  preLastDay : TDate;
  stLastDay : string;
  stpreLastDay : string;
  i : integer;

  stSql : string;
  stDate : string;
  stMonth : string;
  stPreMonth : string;
  PreMonth : TDateTime;
  nWeekCode : integer;
  stWorkStartTime : string;
  stWorkEndTime : string;
begin
  L_TotCount := 0;
  L_ErrCount := 0;

  stWorkStartTime :='0000';
  stWorkEndTime :='0000';
  if L_nATType = 0 then //고정근무타입이면 근무시간을 가져 오자
  begin
    GetWorkTime(stWorkStartTime,stWorkEndTime);
  end;
  PreMonth := IncMonth(dt_Date.Date,-1);
  preLastDay := EndOfTheMonth(PreMonth);
  stpreLastDay := FormatDateTime('dd',preLastDay);
  stPreMonth := FormatDateTime('yyyymm',PreMonth);

  lastDay := EndOfTheMonth(dt_Date.Date);
  stLastDay := FormatDateTime('dd',lastDay);
  stMonth := FormatDateTime('yyyymm',dt_Date.Date);

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEATJoinATBasePAY(ed_emCode.text)
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEATJoinATBasePAY(ed_emCode.text)
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEATJoinATBasePAY(ed_emCode.text)
  else Exit;

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 회사 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to CompanyCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[i] + ''' ';
        end;
        stSql := stSql + ')'; 
      end else stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '2' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 지점 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to JijumCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '3' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 지점코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 부서 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to DepartCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end;
  end else
  begin
    if cmb_Depart.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
    end else if cmb_Jijum.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
    end else if cmb_Company.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
    end;
  end;
  stSql := stSql + ' Order By a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.EM_CODE ';

  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      showmessage('테이블 오픈 실패');
      Exit;
    End;
    if recordCount = 0 then
    begin
      showmessage('작업할 데이터가 없습니다');
      Exit;
    end;
    Gauge1.Visible := True;
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    while Not Eof do
    begin
      if L_nATType = 1 then  //사원별 근태타입
      begin
        stWorkStartTime := FindField('AT_WORKSTARTTIME').AsString;
        stWorkEndTime := FindField('AT_WORKENDTIME').AsString;
      end else if L_nATType = 2 then //교대근무
      begin
        stWorkStartTime := '0000';
        stWorkEndTime := '0000';
      end else if L_nATType = 3 then //혼합근무
      begin
      end;

      stDate := FormatDateTime('yyyymmdd',dt_Date.Date);
      nWeekCode := GetWeekCode(stDate);
      if nWeekCode <> 1 then   //일요일이 아니면
      begin
        if CheckHolidy(Copy(stDate,1,4),Copy(stDate,5,2),Copy(stDate,7,2)) then nWeekCode := 1; //공휴일이면
      end;
      //L_nSaturday //0:휴무,1:반휴일,2:평일
      if nWeekCode = 7 then //토요일 이면 평일로 쓸건지 여부 체크
      begin
        if L_nSaturday = 0 then  nWeekCode := 1      //공휴일 처리
        else if L_nSaturday = 2 then nWeekCode := 8; //평일 처리
      end;

      dmDaySummary.Saturday := L_nSaturday;
      dmDaySummary.ATTypePay := L_nATTypePay;
      dmDaySummary.ATType := L_nATType;
      dmDaySummary.EarlyAdd := L_nEarlyAdd;
      dmDaySummary.ExtendAdd := L_nExtendAdd;
      dmDaySummary.NightAdd := L_nNightAdd;
      dmDaySummary.sEarlyAdd := L_nsEarlyAdd;
      dmDaySummary.sExtendAdd := L_nsExtendAdd;
      dmDaySummary.sNightAdd := L_nsNightAdd;
      dmDaySummary.hEarlyAdd := L_nhEarlyAdd;
      dmDaySummary.hNormalAdd := L_nhNormalAdd;
      dmDaySummary.hExtendAdd := L_nhExtendAdd;
      dmDaySummary.hNightAdd := L_nhNightAdd;
      dmDaySummary.WeekTime := L_WeekTime;
      dmDaySummary.MonthATTime := L_nMonthATTime;
      dmDaySummary.YesterDayTime := L_stYesterDayTime;
      dmDaySummary.MonthLastDay := L_nMonthLastDay;

      dmDaySummary.DaySummary(stDate,
                 inttostr(nWeekCode),
                 FindField('CO_COMPANYCODE').AsString,
                 FindField('EM_CODE').AsString,
                 FindField('PA_GUBUN').AsString,
                 FindField('PA_AMT').AsString,
                 stWorkStartTime,
                 stWorkEndTime);

      Gauge1.Progress := Gauge1.Progress + 1;
      inc(L_TotCount);
      Next;
    end;
    Gauge1.Visible := False;
  end;
  showmessage('총집계건수 : ' + inttostr(L_TotCount) + ',미처리 건수 : ' + inttostr(L_ErrCount));

end;

function TfmDaySummary.CheckHolidy(aYear, aMonth, aDay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_HOLIDAY ';
  stSql := stSql + ' where HO_DAY = ''' + aYear + aMonth + aDay + ''' ';
  with ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text :=  stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
  end;
  result := True;
end;

function TfmDaySummary.LoadConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND (CO_CONFIGGROUP = ''ATTEND'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''PAY'') ';
  
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    First;
    if RecordCount > 0 then
    begin
      while Not Eof do
      begin
        if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then
          L_nSaturday := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'ATTYPEPAY' then
          L_nATTypePay := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
          L_nATType := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'EARLYADD' then
          L_nEarlyAdd := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'EXTENDADD' then
          L_nExtendAdd := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'NIGHTADD' then
          L_nNightAdd := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'SEARLYADD' then
          L_nsEarlyAdd := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'SEXTENDADD' then
          L_nsExtendAdd := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'SNIGHTADD' then
          L_nsNightAdd := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'HEARLYADD' then
          L_nhEarlyAdd := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'HNORMALADD' then
          L_nhNormalAdd := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'HEXTENDADD' then
          L_nhExtendAdd := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'hNIGHTADD' then
          L_nhNightAdd := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'WEEKTIME' then
          L_WeekTime := FindField('CO_CONFIGVALUE').Asinteger
        else if FindField('CO_CONFIGCODE').AsString = 'YTIME' then
          L_stYesterDayTime := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'MONTHLAST' then
          L_nMonthLastDay := FindField('CO_CONFIGVALUE').Asinteger;

        next;
      end;
    end;
  end;
  L_nMonthATTime := Round(((L_WeekTime + 8) * 52 + 8 ) / 12);
  TempAdoQuery.Free;
  CoUninitialize;
end;
(*
function TfmDaySummary.DaySummary(aDate, aWeekCode, aCompanyCode,
  aEmCode,aPayGubun,aPayAmt,aWorkStartTime,aWorkEndTime: string): Boolean;
var
  stSql : string;
  stPayVacation,stNonPayVacation : string;
  stAtType:string;
  nInfromMM,nWorkMM,nExtendMM,nNightMM:integer;
  nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd:integer;
  nInfromAMT,nWorkAMT,nExtendAMT,nNightAMT:integer;
  bYesterDay : Boolean;
  nTimeAmt : integer;  //시간당 급여
  nJikag:integer;
  nJotae:integer;
  nRealyATTimeMM : integer; //실제 근무시간
  nLeaveCount : integer;
  nBackCount : integer;
  bError : Boolean;
  bFixedAmt : Boolean; //개인별 정액 유무
  stJijumCode,stDepartCode,stEmName : string;
begin
  bFixedAmt := False;
  bError := False;
  nInfromMM := 0;
  nWorkMM:= 0;
  nExtendMM:=0;
  nNightMM:=0;
  nInfromAdd := 0;
  nWorkAdd:= 0;
  nExtendAdd:=0;
  nNightAdd:=0;
  nInfromAMT := 0;
  nWorkAMT := 0;
  nExtendAMT := 0;
  nNightAMT := 0;
  nJikag:= 0;
  nJotae:= 0;
  nRealyATTimeMM := 0;
  nLeaveCount := 0;
  nBackCount := 0;

  if aPayGubun = '0' then //월급 정액제
  begin
    nTimeAmt := strtoint(aPayAmt) div L_nMonthATTime;
  end else if aPayGubun = '1' then //시간급 정액제
  begin
    nTimeAmt := strtoint(aPayAmt);
  end;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_ATEVENTDaySummary(aDate,aCompanyCode,aEmCode)
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_ATEVENTDaySummary(aDate,aCompanyCode,aEmCode)
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_ATEVENTDaySummary(aDate,aCompanyCode,aEmCode)
  else Exit;

  result := False;
{  stSql := ' select a.AT_DATE,a.CO_COMPANYCODE,a.EM_CODE,a.AT_INTIME,a.AT_OUTTIME,a.AT_LEAVETIME,a.AT_BACKTIME,';
  stSql := stSql + ' a.AT_INCODE,b.AT_INTYPE,a.AT_OUTCODE,c.AT_OUTTYPE,';
  stSql := stSql + ' d.* ';
  stSql := stSql + ' from TB_ATEVENT a';
  stSql := stSql + ' Left JOIN TB_ATINCODE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_INCODE = b.AT_INCODE ) ';
  stSql := stSql + ' Left JOIN TB_ATOUTCODE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_OUTCODE = c.AT_OUTCODE ) ';
  stSql := stSql + ' Left Join TB_ATCODE d ';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_ATCODE = d.AT_ATCODE ) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';
}
  with AdoSummary do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount = 0 then
    begin
      if Not GetTB_EMPLOYEE_Info(aCompanyCode,aEmCode,stJijumCode,stDepartCode,stEmName) then Exit;
      if VacationCheck(aDate,aCompanyCode,aEmCode,stPayVacation,stNonPayVacation) then
      begin //휴가
        if stPayVacation = '1' then  //유급휴가인 경우만...
        begin
          nWorkMM := DiffMinute(aWorkEndTime,aWorkStartTime,2);
          nWorkAmt := GetPerAmt(nTimeAmt,nWorkMM,0,bFixedAmt);  //휴가는 기본계산
        end;
        result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,'2',aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),stPayVacation,stNonPayVacation,inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),aJijumCode,aDepartCode,aEmName);
      end else
      begin
        if strtoint(aWeekCode) = 1 then //공휴일
           result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,'4',aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),'0','0',inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),aJijumCode,aDepartCode,aEmName)
        else result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,'3',aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),'0','0',inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),aJijumCode,aDepartCode,aEmName); //결근
      end;
      Exit;
    end;

    if VacationCheck(aDate,aCompanyCode,aEmCode,stPayVacation,stNonPayVacation) then
    begin //휴가
      if stPayVacation = '1' then   //유급휴가인 경우만
      begin
        nWorkMM := DiffMinute(aWorkStartTime,aWorkEndTime,2);
        nWorkAmt := GetPerAmt(nTimeAmt,nWorkMM,0,bFixedAmt);  //휴가는 기본계산
      end;
      result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,'2',aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),stPayVacation,stNonPayVacation,inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),aJijumCode,aDepartCode,aEmName);
      Exit;
    end;
    if FindField('AT_INTYPE').AsString = '3' then //결근이면
    begin
      result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,'3',aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),'0','0',inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),aJijumCode,aDepartCode,aEmName); //결근
      Exit;
    end;

    //nRealyATTimeMM := DiffMinute(copy(FindField('AT_OUTTIME').asstring,9,4),copy(FindField('AT_INTIME').asstring,9,4),0);
    nRealyATTimeMM := MakeWorkTime_Minute(copy(FindField('AT_OUTTIME').asstring,9,4),copy(FindField('AT_INTIME').asstring,9,4),0);
    if Trim(FindField('AT_LEAVETIME').asstring) <> '' then nLeaveCount := 1;
    if Trim(FindField('AT_BACKTIME').asstring) <> '' then nBackCount := 1;

    if L_nATTypePay = 2 then  //개인별 적용 계산
    begin
      GetPersonType(aCompanyCode,aEmCode,aWeekCode,nTimeAmt,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
    end;

    stAtType:= '1'; //출근
    if FindField('AT_INTYPE').AsString = '4' then //조기출근이면
    begin
      if aWeekCode = '1' then //공휴일
      begin
        nInfromMM := DiffMinute(FindField('AT_HINFROMTIME').asstring,copy(FindField('AT_INTIME').asstring,9,4),1);
        nWorkMM := MakeWorkTime_Minute(FindField('AT_HWORKENDTIME').asstring,FindField('AT_HWORKSTARTTIME').asstring,2);
        {if copy(FindField('AT_OUTTIME').asstring,9,4) < FindField('AT_HWORKENDTIME').asstring then
          nWorkMM := DiffMinute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_HWORKSTARTTIME').asstring,2)
        else
        begin
          nWorkMM := DiffMinute(FindField('AT_HWORKENDTIME').asstring,FindField('AT_HWORKSTARTTIME').asstring,2);
        end; }
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nInfromAdd := FindField('AT_HEARLYADD').AsInteger;
            nWorkAdd := FindField('AT_HNORMALADD').AsInteger;
          Except
            nInfromAdd := 0;
            nWorkAdd := 0;
          End;
        end else if L_nATTypePay = 1 then //전체 적용 계산
        begin
          nInfromAdd := L_nhEarlyAdd;
          nWorkAdd := L_nhNormalAdd;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
        //nWorkAmt := nTimeAmt * ( nWorkMM / 60) * (( 100 + FindField('AT_HNORMALADD').AsInteger ) / 100);
      end
      else if aWeekCode = '7' then //토요일
      begin
        nInfromMM := DiffMinute(FindField('AT_SINFROMTIME').asstring,copy(FindField('AT_INTIME').asstring,9,4),1);
        nWorkMM := MakeWorkTime_Minute(FindField('AT_SWORKENDTIME').asstring,FindField('AT_SWORKSTARTTIME').asstring,2);
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nInfromAdd := FindField('AT_SEARLYADD').AsInteger;
            nWorkAdd := FindField('AT_SNORMALADD').AsInteger;
          Except
            nInfromAdd := 0;
            nWorkAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nInfromAdd := L_nsEarlyAdd;
          nWorkAdd := 0;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else
      begin
        nInfromMM := DiffMinute(FindField('AT_INFROMTIME').asstring,copy(FindField('AT_INTIME').asstring,9,4),1);
        nWorkMM := MakeWorkTime_Minute(FindField('AT_WORKENDTIME').asstring,FindField('AT_WORKSTARTTIME').asstring,2);
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nInfromAdd := FindField('AT_EARLYADD').AsInteger;
            nWorkAdd := FindField('AT_NORMALADD').AsInteger;
          Except
            nInfromAdd := 0;
            nWorkAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nInfromAdd := L_nEarlyAdd;
          nWorkAdd := 0;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end;
      if L_nATTypePay = 2 then
      begin
        nInfromAmt := GetPerAmt(nInfromAdd,nInfromMM,0,bFixedAmt);
        nWorkAmt := GetPerAmt(nWorkAdd,nWorkMM,0,False);
      end else
      begin
        nInfromAmt := GetPerAmt(nTimeAmt,nInfromMM,nInfromAdd,bFixedAmt);
        nWorkAmt := GetPerAmt(nTimeAmt,nWorkMM,nWorkAdd,bFixedAmt);
      end;
    end else if (FindField('AT_INTYPE').AsString = '1') or (FindField('AT_INTYPE').AsString = '2') then  //출근 또는 지각 이면
    begin

      if FindField('AT_INTYPE').AsString = '2' then nJikag:= 1;

      if aWeekCode = '1' then //공휴일
      begin
        if copy(FindField('AT_OUTTIME').asstring,9,4) < FindField('AT_HWORKENDTIME').asstring then
          nWorkMM := DiffMinute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_HWORKSTARTTIME').asstring,2)
        else
        begin
          nWorkMM := DiffMinute(FindField('AT_HWORKENDTIME').asstring,FindField('AT_HWORKSTARTTIME').asstring,2);
        end;
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nWorkAdd := FindField('AT_HNORMALADD').AsInteger;
          Except
            nWorkAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nWorkAdd := L_nhNormalAdd;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else if aWeekCode = '7' then //토요일
      begin
        nWorkMM := DiffMinute(FindField('AT_SWORKENDTIME').asstring,FindField('AT_SWORKSTARTTIME').asstring,2);
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nWorkAdd := FindField('AT_SNORMALADD').AsInteger;
          Except
            nWorkAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nWorkAdd := 0;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else
      begin
        nWorkMM := DiffMinute(FindField('AT_WORKENDTIME').asstring,FindField('AT_WORKSTARTTIME').asstring,2);
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nWorkAdd := FindField('AT_NORMALADD').AsInteger;
          Except
            nWorkAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nWorkAdd := 0;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end;
      if L_nATTypePay = 2 then
      begin
        nWorkAmt := GetPerAmt(nWorkAdd,nWorkMM,0,False);
      end else
      begin
        nWorkAmt := GetPerAmt(nTimeAmt,nWorkMM,nWorkAdd,bFixedAmt);
      end;
    end else bError := True;

    if FindField('AT_OUTTYPE').AsString = '2' then  nJotae:= 1 //조퇴이면
    else if FindField('AT_OUTTYPE').AsString = '3' then //연장근무이면
    begin
      if aWeekCode = '1' then //공휴일
      begin
        nExtendMM := DiffMinute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_HEXTENDTIME').asstring,2);
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nExtendAdd := FindField('AT_HEXTENDADD').AsInteger;
          Except
            nExtendAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nExtendAdd := L_nhExtendAdd;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else if aWeekCode = '7' then //토요일
      begin
        nExtendMM := DiffMinute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_SEXTENDTIME').asstring,2);
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nExtendAdd := FindField('AT_SEXTENDADD').AsInteger;
          Except
            nExtendAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nExtendAdd := L_nsExtendAdd;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else
      begin
        nExtendMM := DiffMinute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_EXTENDTIME').asstring,2);
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nExtendAdd := FindField('AT_EXTENDADD').AsInteger;
          Except
            nExtendAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nExtendAdd := L_nExtendAdd;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end;
      if L_nATTypePay = 2 then
      begin
        nExtendAmt := GetPerAmt(nExtendAdd,nExtendMM,0,bFixedAmt);
      end else
      begin
        nExtendAmt := GetPerAmt(nTimeAmt,nExtendMM,nExtendAdd,bFixedAmt);
      end;
    end else if FindField('AT_OUTTYPE').AsString = '4' then //야간근무이면
    begin
      if aWeekCode = '1' then //공휴일
      begin
        nExtendMM := DiffMinute(FindField('AT_HNIGHTTIME').asstring,FindField('AT_HEXTENDTIME').asstring,3);
        nNightMM := DiffMinute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_HNIGHTTIME').asstring,2);
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nExtendAdd := FindField('AT_HEXTENDADD').AsInteger;
            nNightAdd := FindField('AT_HNIGHTADD').AsInteger;
          Except
            nExtendAdd := 0;
            nNightAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nExtendAdd := L_nhExtendAdd;
          nNightAdd := L_nhNightAdd;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else if aWeekCode = '7' then //토요일
      begin
        nExtendMM := DiffMinute(FindField('AT_SNIGHTTIME').asstring,FindField('AT_SEXTENDTIME').asstring,3);
        nNightMM := DiffMinute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_SNIGHTTIME').asstring,2);
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nExtendAdd := FindField('AT_SEXTENDADD').AsInteger;
            nNightAdd := FindField('AT_SNIGHTADD').AsInteger;
          Except
            nExtendAdd := 0;
            nNightAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nExtendAdd := L_nsExtendAdd;
          nNightAdd := L_nsNightAdd;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else
      begin
        nExtendMM := DiffMinute(FindField('AT_NIGHTTIME').asstring,FindField('AT_EXTENDTIME').asstring,3);
        nNightMM := DiffMinute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_NIGHTTIME').asstring,2);
        if L_nATTypePay = 0 then  //근태 타입별 계산
        begin
          Try
            nExtendAdd := FindField('AT_EXTENDADD').AsInteger;
            nNightAdd := FindField('AT_NIGHTADD').AsInteger;
          Except
            nExtendAdd := 0;
            nNightAdd := 0;
          End;
        end else if L_nATTypePay = 1 then
        begin
          nExtendAdd := L_nExtendAdd;
          nNightAdd := L_nNightAdd;
        end else if L_nATTypePay = 2 then  //개인별 적용 계산
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end;
      if L_nATTypePay = 2 then
      begin
        nExtendAmt := GetPerAmt(nExtendAdd,nExtendMM,0,bFixedAmt);
        nNightAmt := GetPerAmt(nNightAdd,nNightMM,0,bFixedAmt);
      end else
      begin
        nExtendAmt := GetPerAmt(nTimeAmt,nExtendMM,nExtendAdd,bFixedAmt);
        nNightAmt := GetPerAmt(nTimeAmt,nNightMM,nNightAdd,bFixedAmt);
      end;

    end
    else if FindField('AT_OUTTYPE').AsString <> '1' then bError := True;

    result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,stAtType,aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),'0','0',inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),aJijumCode,aDepartCode,aEmName);

    if bError then inc(L_ErrCount);
  end;

end;
*)

function TfmDaySummary.VacationCheck(aDate,aCompanyCode, aEmCode: string; var aPayVacation,
  aNonPayVacation: string): Boolean;
var
  stSql : string;
begin
  result := False;
  aPayVacation := '0';
  aNonPayVacation := '0';
  stSql := 'select a.*,b.AT_VATYPE from TB_ATVACATION a ';
  stSql := stSql + ' Left Join TB_ATVACODE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_VACODE = b.AT_VACODE) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.VA_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';

  with ADOTmpQuery do
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
    if FindField('AT_VATYPE').AsString = '1' then aPayVacation := '1'
    else if FindField('AT_VATYPE').AsString = '2' then aNonPayVacation := '1';
    
  end;
  result := True;

end;

function TfmDaySummary.InsertTB_ATDAYSUMMARY(aDate, aCompanyCode, aEmCode,
  aAtType, aWeekCode, aInfromMM, aWorkMM, aExtendMM, aNightMM,
  aPayVacation, aNonPayVacation,aInfromAmt,aWorkAmt,aExtendAmt,aNightAmt,
  aJiKag,aJotae,aRealyATTimeMM,aLeaveCount,aBackCount,aJijumCode,aDepartCode,aEmName: string): Boolean;
var
  stSql : string;
begin

  DeleteTB_AtDAYSUMMARY(aDate, aCompanyCode, aEmCode);

  stSql := 'Insert Into TB_ATDAYSUMMARY(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AT_DATE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'AT_TYPE,';
  stSql := stSql + 'AT_WEEKCODE,';
  stSql := stSql + 'AT_INFROMMM,';
  stSql := stSql + 'AT_WORKMM,';
  stSql := stSql + 'AT_EXTENDMM,';
  stSql := stSql + 'AT_NIGHTMM,';
  stSql := stSql + 'AT_INFROMAMT,';
  stSql := stSql + 'AT_WORKAMT,';
  stSql := stSql + 'AT_EXTENDAMT,';
  stSql := stSql + 'AT_NIGHTAMT,';
  stSql := stSql + 'AT_PAYVACATION,';
  stSql := stSql + 'AT_NONPAYVACATION, ';
  stSql := stSql + 'AT_JIKAG, ';
  stSql := stSql + 'AT_JOTAE, ';
  stSql := stSql + 'AT_REALATTIMEMM, ';
  stSql := stSql + 'AT_LEAVECOUNT, ';
  stSql := stSql + 'AT_BACKCOUNT , ';
  stSql := stSql + 'CO_JIJUMCODE , ';
  stSql := stSql + 'CO_DEPARTCODE , ';
  stSql := stSql + 'EM_NAME ) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aAtType + ''',';
  stSql := stSql + aWeekCode + ',';
  stSql := stSql + aInfromMM + ',';
  stSql := stSql + aWorkMM + ',';
  stSql := stSql + aExtendMM + ',';
  stSql := stSql + aNightMM + ',';
  stSql := stSql + aInfromAmt + ',';
  stSql := stSql + aWorkAmt + ',';
  stSql := stSql + aExtendAmt + ',';
  stSql := stSql + aNightAmt + ',';
  stSql := stSql + aPayVacation + ',';
  stSql := stSql + aNonPayVacation + ',';
  stSql := stSql + aJiKag + ',';
  stSql := stSql + aJotae + ',';
  stSql := stSql + aRealyATTimeMM + ',';
  stSql := stSql + aLeaveCount + ',';
  stSql := stSql + aBackCount + ',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aEmName + ''')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDaySummary.DiffMinute(aLargeTime,aSmallTime: string;aCheck:integer): integer;
var
  stHH,stMM : string;
  nHH,nMM : integer;
  bYesterDay1 : Boolean;
  bYesterDay2 : Boolean;
begin
  result := 0;
  if Trim(aLargeTime) = '' then aLargeTime := '0000';
  if Trim(aSmallTime) = '' then aSmallTime := '0000';
  if Length(aLargeTime) <> 4 then aLargeTime := FillZeroStrNum(Trim(aLargeTime),4,False);
  if Length(aSmallTime) <> 4 then aSmallTime := FillZeroStrNum(Trim(aSmallTime),4,False);
  if aCheck = 1 then
  begin
    if aLargeTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
  end else if aCheck = 2 then
  begin
    if aSmallTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
  end else if aCheck = 3 then
  begin
    if aLargeTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
    if aSmallTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
  end;
  bYesterDay1 := False;
  bYesterDay2 := False;
  if L_stYesterDayTime > aLargeTime then  bYesterDay1 := True;  //퇴근시간이 새벽이면
  if L_stYesterDayTime > aSmallTime then  bYesterDay2 := True;  //기준시간이 새벽이면
  if bYesterDay1 then
  begin
    if Not bYesterDay2 then //퇴근시간은 새벽이고 기준시간은 저녁이면
    begin
      nHH := 23 - strtoint(copy(aSmallTime,1,2));
      nMM := 60 - strtoint(copy(aSmallTime,3,2));
      result := (nHH * 60) + nMM;
      nHH := strtoint(copy(aLargeTime,1,2));
      nMM := strtoint(copy(aLargeTime,3,2));
      result := result + (nHH * 60) + nMM;
    end else
    begin  // 기준시간과 퇴근시간이 새벽인 경우
      result := ( (strtoint(copy(aLargeTime,1,2)) * 60) + strtoint(copy(aLargeTime,3,2)) )
                - ((strtoint(copy(aSmallTime,1,2)) * 60) + strtoint(copy(aSmallTime,3,2)) );
    end;
  end else  //둘다 저녁인경우
    result := ( (strtoint(copy(aLargeTime,1,2)) * 60) + strtoint(copy(aLargeTime,3,2)) )
            - ((strtoint(copy(aSmallTime,1,2)) * 60) + strtoint(copy(aSmallTime,3,2)) );

end;

function TfmDaySummary.GetPerAmt(aTimeAmt,aMinuate,aPer:integer;bFixedAmt:Boolean): integer;
begin
  if bFixedAmt then result := aTimeAmt
  else result := (aTimeAmt * aMinuate * ( 100 + aPer )) div (60 * 100) ;

end;

function TfmDaySummary.MonthSummary(aMonth,aPreMonth,aCompanyCode, aEmCode,
  aPayGubun, aPayAmt: string): Boolean;
var
  stStartDate,stEndDate:string;
//  stSql : string;
begin

  DeleteTB_AtMonthSummary(aMonth,aCompanyCode,aEmCode);

  stStartDate := aPreMonth + FillZeroNumber((L_nMonthLastDay + 1),2);
  stEndDate := aMonth + FillZeroNumber(L_nMonthLastDay,2);
  InsertTB_ATMonthSummary(aMonth,aCompanyCode,aEmCode,stStartDate,stEndDate,
                          '0','0','0','0','0','0',
                          '0','0','0','0','0','0',
                          '0','0','0','0','0','0',
                          '0','0','0','0');



  result := MonthHolidaySummary(aMonth,stStartDate,stEndDate,aCompanyCode,aEmCode,aPayGubun,aPayAmt); //공휴일 심야 가산 집계
  result := MonthWeekSummary(aMonth,stStartDate,stEndDate,aCompanyCode,aEmCode,aPayGubun,aPayAmt); //평일 집계

end;

function TfmDaySummary.GetWorkTime(var aWorkStartTime,
  aWorkEndTime: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'select * from TB_ATCODE ';
  with AdoTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    First;
    aWorkStartTime := FindField('AT_WORKSTARTTIME').AsString;
    aWorkEndTime := FindField('AT_WORKENDTIME').AsString;
  end;

  result := True;
end;
 
function TfmDaySummary.MonthHolidaySummary(aMonth,aStartDate, aEndDate, aCompanyCode,
  aEmCode, aPayGubun, aPayAmt: string): Boolean;
var
  stSql : string;      //공휴일
  nTotCount : integer; //총 일수
  nAtCount : integer; //근무일수
  nAtInfromMM : integer; //조기근무 분
  nAtWorkMM : integer; //정상 근무 분
  nAtExtendMM : integer; //연장 근무 분
  nAtNightMM : integer; //야간 근무 분
  nAtPayVacation:integer; //유급휴가일수
  nNonAtPayVacation:integer; //무급휴가일수
  nAtInfromAmt : integer; //조기근무수당
  nAtWorkAmt : integer; //정상 근무 수당
  nAtExtendAmt : integer; //연장 근무 수당
  nAtNightAmt : integer; //야간 근무 수당
  nJiKagCount : integer; //지각일수
  nJotaeCount : integer; //조퇴일수
  nNonAtCount : integer; //결근일수
  nRealyATTimeMM : integer; //실제 근무 일수
  nLeaveCount : integer;  //외출
  nBackCount : integer;   //복귀
begin
  nTotCount := 0; //총 일수
  nAtCount := 0; //근무일수
  nAtInfromMM := 0; //조기근무 분
  nAtWorkMM := 0; //정상 근무 분
  nAtExtendMM := 0; //연장 근무 분
  nAtNightMM := 0; //야간 근무 분
  nAtPayVacation:= 0; //유급휴가일수
  nNonAtPayVacation:= 0; //무급휴가일수
  nAtInfromAmt := 0; //조기근무수당
  nAtWorkAmt := 0; //정상 근무 수당
  nAtExtendAmt := 0; //연장 근무 수당
  nAtNightAmt := 0; //야간 근무 수당
  nJiKagCount := 0; //지각일수
  nJotaeCount := 0; //조퇴일수
  nNonAtCount := 0; //결근일수
  nRealyATTimeMM := 0; //실제 근무 시간
  nLeaveCount := 0;  //외출
  nBackCount := 0;   //복귀

  stSql := 'select AT_TYPE, count(*) as TypeCount,sum(AT_INFROMMM) as AT_INFROMMM, ';
  stSql := stSql + ' sum(AT_WORKMM) as AT_WORKMM,sum(AT_EXTENDMM) as AT_EXTENDMM, ';
  stSql := stSql + ' sum(AT_NIGHTMM) as AT_NIGHTMM,sum(AT_PAYVACATION) as AT_PAYVACATION,';
  stSql := stSql + ' sum(AT_NONPAYVACATION) as AT_NONPAYVACATION,';
  stSql := stSql + ' sum(AT_INFROMAMT) as AT_INFROMAMT,sum(AT_EXTENDAMT) as AT_EXTENDAMT,';
  stSql := stSql + ' sum(AT_NIGHTAMT) as AT_NIGHTAMT,sum(AT_WORKAMT) as AT_WORKAMT, ';
  stSql := stSql + ' sum(AT_LEAVECOUNT) as AT_LEAVECOUNT,sum(AT_BACKCOUNT) as AT_BACKCOUNT, ';
  stSql := stSql + ' sum(AT_JIKAG) as AT_JIKAG,sum(AT_JOTAE) as AT_JOTAE,sum(AT_REALATTIMEMM) as AT_REALATTIMEMM ';
  stSql := stSql + ' from TB_ATDAYSUMMARY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_WEEKCODE = 1 ';   //공휴일 추출
  stSql := stSql + ' AND AT_DATE Between ''' +  aStartDate + ''' ';
  stSql := stSql + ' AND ''' + aEndDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' GROUP BY AT_TYPE ';


  With ADOMonthSummary do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      if FindField('AT_TYPE').AsString = '1' then  //출근
      begin
        nTotCount := nTotCount + FindField('TypeCount').AsInteger; //총 일수
        nAtCount := FindField('TypeCount').AsInteger; //근무일수
        nAtInfromMM := FindField('AT_INFROMMM').AsInteger; //조기근무 분
        nAtWorkMM := FindField('AT_WORKMM').AsInteger; //정상 근무 분
        nAtExtendMM := FindField('AT_EXTENDMM').AsInteger; //연장 근무 분
        nAtNightMM := FindField('AT_NIGHTMM').AsInteger; //야간 근무 분
        nAtPayVacation:= FindField('AT_PAYVACATION').AsInteger; //유급휴가일수
        nNonAtPayVacation:= FindField('AT_NONPAYVACATION').AsInteger; //무급휴가일수
        nAtInfromAmt := FindField('AT_INFROMAMT').AsInteger; //조기근무수당
        nAtWorkAmt := FindField('AT_WORKAMT').AsInteger; //정상 근무 수당
        nAtExtendAmt := FindField('AT_EXTENDAMT').AsInteger; //연장 근무 수당
        nAtNightAmt := FindField('AT_NIGHTAMT').AsInteger; //야간 근무 수당
        nJiKagCount := FindField('AT_JIKAG').AsInteger; //지각일수
        nJotaeCount := FindField('AT_JOTAE').AsInteger; //조퇴일수
        nRealyATTimeMM := FindField('AT_REALATTIMEMM').AsInteger; //근무시간
        nLeaveCount := FindField('AT_LEAVECOUNT').AsInteger;  //외출
        nBackCount := FindField('AT_BACKCOUNT').AsInteger;   //복귀
      end else
      begin
        nTotCount := nTotCount + FindField('TypeCount').AsInteger; //총 일수
      end;
      Next;
    end;
  end;
  
  result := UpdateTB_ATMonthSummary(aMonth, aCompanyCode, aEmCode,
            inttostr(nTotCount), inttostr(nTotCount),
            '0', inttostr(nAtCount), '0', '0',
            '0', '0', '0', '0',
            '0', '0', '0', inttostr(nAtInfromMM+nAtWorkMM+nAtExtendMM+nAtNightMM), '0',
            '0', '0', '0',
            inttostr(nAtInfromAmt+nAtWorkAmt+nAtExtendAmt+nAtNightAmt),inttostr(nRealyATTimeMM),
            inttostr(nLeaveCount),inttostr(nBackCount));
end;


function TfmDaySummary.MonthWeekSummary(aMonth,aStartDate, aEndDate, aCompanyCode,
  aEmCode, aPayGubun, aPayAmt: string): Boolean;
var
  stSql : string;      //공휴일
  nTotCount : integer; //총 일수
  nAtCount : integer; //근무일수
  nAtInfromMM : integer; //조기근무 분
  nAtWorkMM : integer; //정상 근무 분
  nAtExtendMM : integer; //연장 근무 분
  nAtNightMM : integer; //야간 근무 분
  nAtPayVacation:integer; //유급휴가일수
  nNonAtPayVacation:integer; //무급휴가일수
  nAtInfromAmt : integer; //조기근무수당
  nAtWorkAmt : integer; //정상 근무 수당
  nAtExtendAmt : integer; //연장 근무 수당
  nAtNightAmt : integer; //야간 근무 수당
  nJiKagCount : integer; //지각일수
  nJotaeCount : integer; //조퇴일수
  nNonAtCount : integer; //결근일수
  nREALATTIMEMM :integer; //실제 근무시간
  nLeaveCount :integer; //외출횟수
  nBackCount : integer; //복귀횟수
begin
  nTotCount := 0; //총 일수
  nAtCount := 0; //근무일수
  nAtInfromMM := 0; //조기근무 분
  nAtWorkMM := 0; //정상 근무 분
  nAtExtendMM := 0; //연장 근무 분
  nAtNightMM := 0; //야간 근무 분
  nAtPayVacation:= 0; //유급휴가일수
  nNonAtPayVacation:= 0; //무급휴가일수
  nAtInfromAmt := 0; //조기근무수당
  nAtWorkAmt := 0; //정상 근무 수당
  nAtExtendAmt := 0; //연장 근무 수당
  nAtNightAmt := 0; //야간 근무 수당
  nJiKagCount := 0; //지각일수
  nJotaeCount := 0; //조퇴일수
  nNonAtCount := 0; //결근일수
  nREALATTIMEMM := 0; //실제 근무시간
  nLeaveCount := 0;  //외출횟수
  nBackCount := 0;  //복귀횟수

  stSql := 'select AT_TYPE, count(*) as TypeCount,sum(AT_INFROMMM) as AT_INFROMMM, ';
  stSql := stSql + ' sum(AT_WORKMM) as AT_WORKMM,sum(AT_EXTENDMM) as AT_EXTENDMM, ';
  stSql := stSql + ' sum(AT_NIGHTMM) as AT_NIGHTMM,sum(AT_PAYVACATION) as AT_PAYVACATION,';
  stSql := stSql + ' sum(AT_NONPAYVACATION) as AT_NONPAYVACATION,';
  stSql := stSql + ' sum(AT_INFROMAMT) as AT_INFROMAMT,sum(AT_EXTENDAMT) as AT_EXTENDAMT,';
  stSql := stSql + ' sum(AT_NIGHTAMT) as AT_NIGHTAMT,sum(AT_WORKAMT) as AT_WORKAMT, ';
  stSql := stSql + ' sum(AT_JIKAG) as AT_JIKAG,sum(AT_JOTAE) as AT_JOTAE,sum(AT_REALATTIMEMM) as AT_REALATTIMEMM, ';
  stSql := stSql + ' sum(AT_LEAVECOUNT) as AT_LEAVECOUNT,sum(AT_BACKCOUNT) as AT_BACKCOUNT ';
  stSql := stSql + ' from TB_ATDAYSUMMARY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_WEEKCODE <> 1 ';   //공휴일이 아닌경우
  stSql := stSql + ' AND AT_DATE Between ''' +  aStartDate + ''' ';
  stSql := stSql + ' AND ''' + aEndDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' GROUP BY AT_TYPE ';


  With ADOMonthSummary do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      if FindField('AT_TYPE').AsString = '1' then  //출근
      begin
        nTotCount := nTotCount + FindField('TypeCount').AsInteger; //총 일수
        nAtCount := nAtCount + FindField('TypeCount').AsInteger; //근무일수
        nAtInfromMM := nAtInfromMM + FindField('AT_INFROMMM').AsInteger; //조기근무 분
        nAtWorkMM := nAtWorkMM + FindField('AT_WORKMM').AsInteger; //정상 근무 분
        nAtExtendMM := nAtExtendMM + FindField('AT_EXTENDMM').AsInteger; //연장 근무 분
        nAtNightMM := nAtNightMM + FindField('AT_NIGHTMM').AsInteger; //야간 근무 분
        nAtPayVacation:= nAtPayVacation + FindField('AT_PAYVACATION').AsInteger; //유급휴가일수
        nNonAtPayVacation:= nNonAtPayVacation + FindField('AT_NONPAYVACATION').AsInteger; //무급휴가일수
        nAtInfromAmt := nAtInfromAmt + FindField('AT_INFROMAMT').AsInteger; //조기근무수당
        if aPayGubun = '1' then    //시간급인경우 합산을 해 주어야 함
          nAtWorkAmt := nAtWorkAmt + FindField('AT_WORKAMT').AsInteger; //정상 근무 수당
        nAtExtendAmt := nAtExtendAmt + FindField('AT_EXTENDAMT').AsInteger; //연장 근무 수당
        nAtNightAmt := nAtNightAmt + FindField('AT_NIGHTAMT').AsInteger; //야간 근무 수당
        nJiKagCount := nJiKagCount + FindField('AT_JIKAG').AsInteger; //지각일수
        nJotaeCount := nJotaeCount + FindField('AT_JOTAE').AsInteger; //조퇴일수
        nREALATTIMEMM := nREALATTIMEMM + FindField('AT_REALATTIMEMM').AsInteger;
        nLeaveCount := nLeaveCount + FindField('AT_LEAVECOUNT').AsInteger;  //외출횟수
        nBackCount := nBackCount + FindField('AT_BACKCOUNT').AsInteger ;  //복귀횟수
      end else if FindField('AT_TYPE').AsString = '2' then  //휴가인경우
      begin
        nTotCount := nTotCount + FindField('TypeCount').AsInteger; //총 일수
        //nAtCount := nAtCount + FindField('TypeCount').AsInteger; //근무일수
        //nAtInfromMM := nAtInfromMM + FindField('AT_INFROMMM').AsInteger; //조기근무 분
        //nAtWorkMM := nAtWorkMM + FindField('AT_WORKMM').AsInteger; //정상 근무 분
        //nAtExtendMM := nAtExtendMM + FindField('AT_EXTENDMM').AsInteger; //연장 근무 분
        //nAtNightMM := nAtNightMM + FindField('AT_NIGHTMM').AsInteger; //야간 근무 분
        nAtPayVacation:= nAtPayVacation + FindField('AT_PAYVACATION').AsInteger; //유급휴가일수
        nNonAtPayVacation:= nNonAtPayVacation + FindField('AT_NONPAYVACATION').AsInteger; //무급휴가일수
        //nAtInfromAmt := nAtInfromAmt + FindField('AT_INFROMAMT').AsInteger; //조기근무수당
        if aPayGubun = '1' then    //시간급인경우 합산을 해 주어야 함
          nAtWorkAmt := nAtWorkAmt + FindField('AT_WORKAMT').AsInteger; //정상 근무 수당
        //nAtExtendAmt := nAtExtendAmt + FindField('AT_EXTENDAMT').AsInteger; //연장 근무 수당
        //nAtNightAmt := nAtNightAmt + FindField('AT_NIGHTAMT').AsInteger; //야간 근무 수당
        //nJiKagCount := nJiKagCount + FindField('AT_JIKAG').AsInteger; //지각일수
        //nJotaeCount := nJotaeCount + FindField('AT_JOTAE').AsInteger; //조퇴일수
      end else if FindField('AT_TYPE').AsString = '3' then  //결근인경우
      begin
        nTotCount := nTotCount + FindField('TypeCount').AsInteger; //총 일수
        nNonAtCount := nNonAtCount + FindField('TypeCount').AsInteger; //결근일수
      end;
      Next;
    end;
  end;
  if aPayGubun = '0' then    //정액 월급인 경우 기본급여는 기본으로 책정해야 함
    nAtWorkAmt := strtoint(aPayAmt); //정상 근무 수당
    
  UpdateTB_ATMonthSummary(aMonth, aCompanyCode, aEmCode,
  inttostr(nTotCount), '0',
  inttostr(nTotCount), inttostr(nAtCount), inttostr(nJiKagCount), inttostr(nJotaeCount),
  inttostr(nNonAtCount), inttostr(nAtPayVacation), inttostr(nNonAtPayVacation), inttostr(nAtInfromMM),
  inttostr(nAtWorkMM), inttostr(nAtExtendMM), inttostr(nAtNightMM), '0',inttostr(nAtInfromAmt) ,
  inttostr(nAtWorkAmt), inttostr(nAtExtendAmt), inttostr(nAtNightAmt),
  '0',inttostr(nREALATTIMEMM),inttostr(nLeaveCount),inttostr(nBackCount));

end;

function TfmDaySummary.DeleteTB_AtMonthSummary(aMonth, aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ATMONTHSUMMARY ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDaySummary.DeleteTB_AtDAYSUMMARY(aDate, aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ATDAYSUMMARY ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDaySummary.InsertTB_ATMonthSummary(aMonth, aCompanyCode, aEmCode,
  aStartDate, aEndDate, aAT_TOTDAYCOUNT, aAT_HOLIDAYCOUNT,
  aAT_ATTENDDAYCOUNT, aAT_INCOUNT, aAT_JIKAGCOUNT, aAT_JOTAECOUNT,
  aAT_NONATCOUNT, aAT_PAYVACOUNT, aAT_NONPAYVACOUNT, aAT_INFROMMM,
  aAT_WORKMM, aAT_EXTENDMM, aAT_NIGHTMM, aAT_HOLIDAYMM, aAT_INFROMAMT,
  aAT_WORKAMT, aAT_EXTENDAMT, aAT_NIGHTAMT,
  aAT_HOLIDAYAMT,aAT_REALATTIMEMM,aLeaveCount,aBackCount: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATMONTHSUMMARY(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AT_MONTH,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'AT_STARTDATE,';
  stSql := stSql + 'AT_ENDDATE,';
  stSql := stSql + 'AT_TOTDAYCOUNT,';
  stSql := stSql + 'AT_HOLIDAYCOUNT,';
  stSql := stSql + 'AT_ATTENDDAYCOUNT,';
  stSql := stSql + 'AT_INCOUNT,';
  stSql := stSql + 'AT_JIKAGCOUNT,';
  stSql := stSql + 'AT_JOTAECOUNT,';
  stSql := stSql + 'AT_NONATCOUNT,';
  stSql := stSql + 'AT_PAYVACOUNT,';
  stSql := stSql + 'AT_NONPAYVACOUNT,';
  stSql := stSql + 'AT_INFROMMM,';
  stSql := stSql + 'AT_WORKMM,';
  stSql := stSql + 'AT_EXTENDMM,';
  stSql := stSql + 'AT_NIGHTMM,';
  stSql := stSql + 'AT_HOLIDAYMM,';
  stSql := stSql + 'AT_INFROMAMT,';
  stSql := stSql + 'AT_WORKAMT,';
  stSql := stSql + 'AT_EXTENDAMT,';
  stSql := stSql + 'AT_NIGHTAMT,';
  stSql := stSql + 'AT_HOLIDAYAMT,';
  stSql := stSql + 'AT_REALATTIMEMM,  ';
  stSql := stSql + 'AT_LEAVECOUNT,  ';
  stSql := stSql + 'AT_BACKCOUNT)  ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aMonth + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aEmCode + ''', ';
  stSql := stSql + '''' + aStartDate + ''', ';
  stSql := stSql + '''' + aEndDate + ''', ';
  stSql := stSql + aAT_TOTDAYCOUNT + ', ';
  stSql := stSql + aAT_HOLIDAYCOUNT + ', ';
  stSql := stSql + aAT_ATTENDDAYCOUNT + ', ';
  stSql := stSql + aAT_INCOUNT + ', ';
  stSql := stSql + aAT_JIKAGCOUNT + ', ';
  stSql := stSql + aAT_JOTAECOUNT + ', ';
  stSql := stSql + aAT_NONATCOUNT + ', ';
  stSql := stSql + aAT_PAYVACOUNT + ', ';
  stSql := stSql + aAT_NONPAYVACOUNT + ', ';
  stSql := stSql + aAT_INFROMMM + ', ';
  stSql := stSql + aAT_WORKMM + ', ';
  stSql := stSql + aAT_EXTENDMM + ', ';
  stSql := stSql + aAT_NIGHTMM + ', ';
  stSql := stSql + aAT_HOLIDAYMM + ', ';
  stSql := stSql + aAT_INFROMAMT + ', ';
  stSql := stSql + aAT_WORKAMT + ', ';
  stSql := stSql + aAT_EXTENDAMT + ', ';
  stSql := stSql + aAT_NIGHTAMT + ', ';
  stSql := stSql + aAT_HOLIDAYAMT + ', ';
  stSql := stSql + aAT_REALATTIMEMM + ', ';
  stSql := stSql + aLeaveCount + ', ';
  stSql := stSql + aBackCount + ') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDaySummary.UpdateTB_ATMonthSummary(aMonth, aCompanyCode, aEmCode,
  aAT_TOTDAYCOUNT, aAT_HOLIDAYCOUNT,
  aAT_ATTENDDAYCOUNT, aAT_INCOUNT, aAT_JIKAGCOUNT, aAT_JOTAECOUNT,
  aAT_NONATCOUNT, aAT_PAYVACOUNT, aAT_NONPAYVACOUNT, aAT_INFROMMM,
  aAT_WORKMM, aAT_EXTENDMM, aAT_NIGHTMM, aAT_HOLIDAYMM, aAT_INFROMAMT,
  aAT_WORKAMT, aAT_EXTENDAMT, aAT_NIGHTAMT,
  aAT_HOLIDAYAMT,aRealyATTimeMM,aLeaveCount,aBackCount: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATMONTHSUMMARY set ';
  stSql := stSql + 'AT_TOTDAYCOUNT = AT_TOTDAYCOUNT + ' + aAT_TOTDAYCOUNT + ',';
  stSql := stSql + 'AT_HOLIDAYCOUNT = AT_HOLIDAYCOUNT + ' + aAT_HOLIDAYCOUNT + ',';
  stSql := stSql + 'AT_ATTENDDAYCOUNT = AT_ATTENDDAYCOUNT + ' + aAT_ATTENDDAYCOUNT + ',';
  stSql := stSql + 'AT_INCOUNT = AT_INCOUNT + ' + aAT_INCOUNT + ',';
  stSql := stSql + 'AT_JIKAGCOUNT = AT_JIKAGCOUNT + ' + aAT_JIKAGCOUNT + ',';
  stSql := stSql + 'AT_JOTAECOUNT = AT_JOTAECOUNT + ' + aAT_JOTAECOUNT + ',';
  stSql := stSql + 'AT_NONATCOUNT = AT_NONATCOUNT + ' + aAT_NONATCOUNT + ',';
  stSql := stSql + 'AT_PAYVACOUNT = AT_PAYVACOUNT + ' + aAT_PAYVACOUNT + ',';
  stSql := stSql + 'AT_NONPAYVACOUNT = AT_NONPAYVACOUNT + ' + aAT_NONPAYVACOUNT + ',';
  stSql := stSql + 'AT_INFROMMM = AT_INFROMMM + ' + aAT_INFROMMM + ',';
  stSql := stSql + 'AT_WORKMM = AT_WORKMM + ' + aAT_WORKMM + ',';
  stSql := stSql + 'AT_EXTENDMM = AT_EXTENDMM + ' + aAT_EXTENDMM + ',';
  stSql := stSql + 'AT_NIGHTMM = AT_NIGHTMM + ' + aAT_NIGHTMM + ',';
  stSql := stSql + 'AT_HOLIDAYMM = AT_HOLIDAYMM + ' + aAT_HOLIDAYMM + ',';
  stSql := stSql + 'AT_INFROMAMT = AT_INFROMAMT + ' + aAT_INFROMAMT + ',';
  stSql := stSql + 'AT_WORKAMT = AT_WORKAMT + ' + aAT_WORKAMT + ',';
  stSql := stSql + 'AT_EXTENDAMT = AT_EXTENDAMT + ' + aAT_EXTENDAMT + ',';
  stSql := stSql + 'AT_NIGHTAMT = AT_NIGHTAMT + ' + aAT_NIGHTAMT + ',';
  stSql := stSql + 'AT_HOLIDAYAMT = AT_HOLIDAYAMT + ' + aAT_HOLIDAYAMT + ',';
  stSql := stSql + 'AT_REALATTIMEMM = AT_REALATTIMEMM + ' + aRealyATTimeMM + ',';
  stSql := stSql + 'AT_LEAVECOUNT = AT_LEAVECOUNT + ' + aLeaveCount + ',';
  stSql := stSql + 'AT_BACKCOUNT = AT_BACKCOUNT + ' + aBackCount ;
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDaySummary.FormShow(Sender: TObject);
begin
  if Not IsMaster then
  begin
    if IsInsertGrade or IsUpdateGrade then btn_Summary.Enabled := True
    else btn_Summary.Enabled := False;
  end;

end;

function TfmDaySummary.GetPersonType(aCompanyCode,aEmCode,aWeekCode: string;aTimeAmt:integer; var aInfromAdd,
  aWorkAdd, aExtendAdd, aNightAdd: integer;var bFixedAmt: Boolean): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  aInfromAdd := 0;
  aWorkAdd := aTimeAmt;
  aExtendAdd := 0;
  aNightAdd := 0;
  bFixedAmt := False;
  result := False;
  stSql := ' select * from TB_ATEMPEXTRA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then Exit;
    Try
      if aWeekCode = '1' then   //공휴일
      begin
        aWorkAdd := FindField('EX_HEARLYAMT').AsInteger;
        aExtendAdd := FindField('EX_HEXTENDAMT').AsInteger;
        aNightAdd := FindField('EX_HNIGHTAMT').AsInteger;
      end else if aWeekCode = '7' then   //토요일
      begin
        aInfromAdd := FindField('EX_SEARLYAMT').AsInteger;
        aExtendAdd := FindField('EX_SEXTENDAMT').AsInteger;
        aNightAdd := FindField('EX_SNIGHTAMT').AsInteger;
      end else
      begin
        aInfromAdd := FindField('EX_WEARLYAMT').AsInteger;
        aExtendAdd := FindField('EX_WEXTENDAMT').AsInteger;
        aNightAdd := FindField('EX_WNIGHTAMT').AsInteger;
      end;
      if FindField('EX_TYPE').AsInteger = 1 then bFixedAmt := True;
    Except
      Exit;
    End;
    result := True;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmDaySummary.MakeWorkTime_Minute(aEndTime, aStartTime: string;
  aCheck: integer): integer;
var
  stHH,stMM : string;
  nHH,nMM : integer;
begin
  result := 0;
  if Trim(aEndTime) = '' then aEndTime := '0000';
  if Trim(aStartTime) = '' then aStartTime := '0000';
  if Length(aEndTime) <> 4 then aEndTime := FillZeroStrNum(Trim(aEndTime),4,False);
  if Length(aStartTime) <> 4 then aStartTime := FillZeroStrNum(Trim(aStartTime),4,False);
  if aCheck = 1 then
  begin
    if aEndTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
  end else if aCheck = 2 then
  begin
    if aStartTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
  end else if aCheck = 3 then
  begin
    if aEndTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
    if aStartTime = '0000' then Exit; //기준시간이 0000 이면 사용 안하는 경우임
  end;

  if strtoint(aEndTime) > strtoint(aStartTime) then
  begin
    //정상적인 경우
    nHH := strtoint(copy(aEndTime,1,2)) - strtoint(copy(aStartTime,1,2));
    nMM := strtoint(copy(aEndTime,3,2)) - strtoint(copy(aStartTime,3,2));
    result := (nHH * 60) + nMM;
  end else
  begin
    //퇴근시간이 오전이고 출근시간이 전일인경우
    nHH := 24 - strtoint(copy(aStartTime,1,2)) + strtoint(copy(aEndTime,1,2));
    nMM := 0 - strtoint(copy(aStartTime,3,2)) + strtoint(copy(aEndTime,3,2));
    result := (nHH * 60) + nMM;
  end;

end;

procedure TfmDaySummary.ErrorCount(Sender: TObject; EventType,
  EventData: string);
begin
  if EventType = 'ERROR' then inc(L_ErrCount);
end;

end.
