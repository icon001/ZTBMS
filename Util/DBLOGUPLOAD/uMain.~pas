unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges, DB, ADODB, ComCtrls,ActiveX,DateUtils;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dt_Date: TDateTimePicker;
    Button3: TButton;
    ADOQuery: TADOQuery;
    ADOATQuery: TADOQuery;
    Gauge2: TGauge;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Gauge1: TGauge;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Button4: TButton;
    GroupBox3: TGroupBox;
    Gauge3: TGauge;
    Button5: TButton;
    Label3: TLabel;
    ed_FoodErr: TEdit;
    Button6: TButton;
    RadioButton1: TRadioButton;
    ed_FoodCode: TEdit;
    Label4: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }

    LogList : TStringList;

    AttendConfigCodeList : TStringList; //근태코드 리스트
    AttendConfigInFromTimeList : TStringList; //출입가능시작 시간
    AttendConfigInToTimeList : TStringList; //출입가능끝 시간
    AttendConfigWorkTimeList : TStringList; //근무 시작 시간
    AttendConfigOutTimeList : TStringList; //퇴근 시간
    AttendConfigExtendTimeList : TStringList; //연장근무 시간
    AttendConfigNightTimeList : TStringList; //야간근무 시간
    AttendConfigSInFromTimeList : TStringList; //반휴일 출입가능시작 시간
    AttendConfigSInToTimeList : TStringList; //반휴일 출입가능끝 시간
    AttendConfigSWorkTimeList : TStringList; //반휴일 근무 시작 시간
    AttendConfigSOutTimeList : TStringList; //반휴일 퇴근 시간
    AttendConfigSExtendTimeList : TStringList; //반휴일연장근무 시간
    AttendConfigSNightTimeList : TStringList; //반휴일야간근무 시간
    AttendConfigHInFromTimeList : TStringList; //공휴일 출입가능시작 시간
    AttendConfigHInToTimeList : TStringList; //공휴일 출입가능끝 시간
    AttendConfigHWorkTimeList : TStringList; //공휴일 근무 시작 시간
    AttendConfigHOutTimeList : TStringList; //공휴일 퇴근 시간
    AttendConfigHExtendTimeList : TStringList; //공휴일 연장근무 시간
    AttendConfigHNightTimeList : TStringList; //공휴일 야간근무 시간

    L_YesterDayStandTime : string;           //어제날짜 기준 시간
    L_ToDayStandTime : string;           //오늘날짜 기준 시간
    L_nSaturday : integer;         //0:휴무,1:반휴일,2:평일
    L_nDeviceType : integer;       //0:업데이트,1:카드리더,2:버튼
    L_nATType : integer;           //0:고정근무1:사원별,2:교대근무
    L_nNonBackType : integer;           //0:미복귀시퇴근처리,1:미복귀시정상퇴근
    L_bDeviceSettingShow : Boolean;

  public
    { Public declarations }
    Function LoadAttendConfig : Boolean;
    Function GetAttendCode(aTime,aCompanyCode,aEMCode:string;nWeekCode:integer):string; //해당일자의 출근타입 가져오자
    Function GetEMPLOYEEATCode(aCompanyCode,aEMCode:string):string;
    Function GetChangeATCode(aTime:string;nWeekCode:integer):string;
    Function GetATInCode(aAttendCode,aTime:string;nWeekCode:integer):string; //출근타입에 대한 출근코드 가져오기
    Function GetATOutCode(aAttendCode,aTime:string;nWeekCode:integer;bYesterDay:Boolean):string; //출근타입에 대한 출근코드 가져오기
    Function GetOutAttendCode(aDate,aCompanyCode,aEMCode:string):string; //해당근태일자의 출근 근태 타입을 가져오자.
    Function GetUpdateAttendType(aTime,aCompanyCode,aEMCode:string;dtYesterDay:TDatetime):string;

    Function GetEmployeeInfo(aCardNo:string;bPassNo:Boolean; var aCompanyCode,aEMCode:string ):Boolean;
    Function CheckHolidy(aYear,aMonth,aDay:string):Boolean;


    Function ProcessAttendData1(aTime:String;aCardNo:String):Boolean; // 업데이트 방식

    Function InsertATTENDINCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer):Boolean;
    Function InsertATTENDOutCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;
    Function InsertATTENDLEAVECode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;
    Function InsertATTENDBACKCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;

  end;

var
  Form1: TForm1;

implementation
uses
uDataBaseConfig,uDataModule1,udmAdoQuery,uLomosUtil, UCommonModule;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'log';
  OpenDialog1.Filter := 'log files (*.log)|*.log';
  if OpenDialog1.Execute then
  begin
    Edit1.Text := OpenDialog1.FileName;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LogList := TStringList.Create;
  AttendConfigCodeList := TStringList.Create; //근태코드 리스트
  AttendConfigInFromTimeList := TStringList.Create; //출입가능시작 시간
  AttendConfigInToTimeList := TStringList.Create; //출입가능끝 시간
  AttendConfigWorkTimeList := TStringList.Create; //근무 시작 시간
  AttendConfigOutTimeList := TStringList.Create; //퇴근 시간
  AttendConfigExtendTimeList := TStringList.Create; //연장근무 시간
  AttendConfigNightTimeList := TStringList.Create; //야간근무 시간
  AttendConfigSInFromTimeList := TStringList.Create; //반휴일 출입가능시작 시간
  AttendConfigSInToTimeList := TStringList.Create; //반휴일 출입가능끝 시간
  AttendConfigSWorkTimeList := TStringList.Create; //반휴일 근무 시작 시간
  AttendConfigSOutTimeList := TStringList.Create; //반휴일 퇴근 시간
  AttendConfigSExtendTimeList := TStringList.Create; //반휴일연장근무 시간
  AttendConfigSNightTimeList := TStringList.Create; //반휴일야간근무 시간
  AttendConfigHInFromTimeList := TStringList.Create; //공휴일 출입가능시작 시간
  AttendConfigHInToTimeList := TStringList.Create; //공휴일 출입가능끝 시간
  AttendConfigHWorkTimeList := TStringList.Create; //공휴일 근무 시작 시간
  AttendConfigHOutTimeList := TStringList.Create; //공휴일 퇴근 시간
  AttendConfigHExtendTimeList := TStringList.Create; //공휴일 연장근무 시간
  AttendConfigHNightTimeList := TStringList.Create; //공휴일 야간근무 시간
  
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LogList.Free;
  AttendConfigCodeList.Free;
  AttendConfigInFromTimeList.Free;
  AttendConfigInToTimeList.Free;
  AttendConfigWorkTimeList.Free;
  AttendConfigOutTimeList.Free;
  AttendConfigExtendTimeList.Free;
  AttendConfigNightTimeList.Free;
  AttendConfigSInFromTimeList.Free;
  AttendConfigSInToTimeList.Free;
  AttendConfigSWorkTimeList.Free;
  AttendConfigSOutTimeList.Free;
  AttendConfigSExtendTimeList.Free;
  AttendConfigSNightTimeList.Free;
  AttendConfigHInFromTimeList.Free;
  AttendConfigHInToTimeList.Free;
  AttendConfigHWorkTimeList.Free;
  AttendConfigHOutTimeList.Free;
  AttendConfigHExtendTimeList.Free;
  AttendConfigHNightTimeList.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  nCount : integer;
  stSql : string;
begin
  Gauge1.Progress := 0;
  LogList.Clear;
  if Not FileExists(Edit1.text) then Exit;
  LogList.LoadFromFile(Edit1.text);
  Gauge1.MaxValue := LogList.Count;
  for nCount := 0 to LogList.Count - 1 do
  begin
    Gauge1.Progress := Gauge1.Progress + 1 ;
    stSql := LogList.Strings[nCount];
    if Pos('DBError:',stSql) = 0 then continue;
    Delete(stSql,1,Length('DBError:'));
    if ComboBox1.ItemIndex = 0 then
    begin
      if Pos('TB_ACCESSEVENT',stSql) = 0 then continue;
    end else if ComboBox1.ItemIndex = 1 then   //알람
    begin
      if Pos('TB_ALARMEVENT',stSql) = 0 then continue;
    end else if ComboBox1.ItemIndex = 2 then   //근태
    begin
      if Pos('TB_ATEVENT',stSql) = 0 then continue;
    end else if ComboBox1.ItemIndex = 3 then   //식수
    begin
      if Pos('TB_FOODEVENT',stSql) = 0 then continue;
    end;

    DataModule1.ProcessExecSQL(stSql);

  end;

  LogList.Clear;
  showmessage('업로드완료');

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      Application.Terminate;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;
  dt_Date.Date := Now;
  
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  stSql : string;
  stATSql : string;
  stATWhere : string;
  stTempSql : string;
begin
  LoadAttendConfig;

  stSql := 'select * from TB_ACCESSDEVICE where AC_ACTYPE = ''1'' ';
  with ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    stATSql := 'Select * From TB_ACCESSEVENT ';
    stATWhere := '';
    while Not Eof do
    begin
      if stATWhere = '' then stATWhere := 'Where '
      else stATWhere := stATWhere + ' OR ';
      stATWhere := stATWhere  + '( AC_NODENO = ' + inttostr(FindField('AC_NODENO').asinteger) ;
      stATWhere := stATWhere  + ' AND AC_ECUID = ''' + FindField('AC_ECUID').AsString + ''') ' ;

      Next;
    end;
    Close;
    if stATWhere = '' then Exit;

  end;
  stTempSql := 'Delete From TB_ATEVENT where at_date = ''' + FormatDateTime('yyyymmdd',dt_Date.Date) + ''' ';
  DataModule1.ProcessEventExecSQL(stTempSql);

  stATWhere := stATWhere + 'AND AC_DATE = ''' + FormatDateTime('yyyymmdd',dt_Date.Date) + ''' ';
  stATSql := stATSql + stATWhere + ' Order by ac_time ';


  Gauge2.Progress := 0;
  with ADOATQuery do
  begin
    Close;
    Sql.Text := stATSql;

    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.MaxValue := recordCount;
    While Not Eof do
    begin
      ProcessAttendData1(FindField('ac_date').AsString + FindField('ac_Time').AsString,FindField('ca_CardNo').AsString);
      Gauge2.Progress := Gauge2.Progress + 1;
      Next;
    end;
    
  end;
  showmessage('근태작업완료');

end;

function TForm1.LoadAttendConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  Result := False;
  AttendConfigCodeList.Clear;
  AttendConfigInFromTimeList.Clear;
  AttendConfigInToTimeList.Clear;
  AttendConfigWorkTimeList.Clear;
  AttendConfigOutTimeList.Clear;
  AttendConfigExtendTimeList.Clear;
  AttendConfigNightTimeList.Clear;
  AttendConfigSInFromTimeList.Clear;
  AttendConfigSInToTimeList.Clear;
  AttendConfigSWorkTimeList.Clear;
  AttendConfigSOutTimeList.Clear;
  AttendConfigSExtendTimeList.Clear;
  AttendConfigSNightTimeList.Clear;
  AttendConfigHInFromTimeList.Clear;
  AttendConfigHInToTimeList.Clear;
  AttendConfigHWorkTimeList.Clear;
  AttendConfigHOutTimeList.Clear;
  AttendConfigHExtendTimeList.Clear;
  AttendConfigHNightTimeList.Clear;

  L_YesterDayStandTime := '0000'; //기준시간 = 00시 00분
  L_ToDayStandTime := '0000'; // 기준시간 = 00시 00분

  stSql := 'select * from TB_ATCODE ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  with TempAdoQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    First;
    while Not Eof do
    begin
      if G_bApplicationTerminate then Exit;
      AttendConfigCodeList.Add(FindField('AT_ATCODE').AsString);
      AttendConfigInFromTimeList.Add(FindField('AT_INFROMTIME').AsString);
      AttendConfigInToTimeList.Add(FindField('AT_INTOTIME').AsString);
      AttendConfigWorkTimeList.Add(FindField('AT_WORKSTARTTIME').AsString);
      AttendConfigOutTimeList.Add(FindField('AT_WORKENDTIME').AsString);
      AttendConfigExtendTimeList.Add(FindField('AT_EXTENDTIME').AsString);
      AttendConfigNightTimeList.Add(FindField('AT_NIGHTTIME').AsString);
      AttendConfigSInFromTimeList.Add(FindField('AT_SINFROMTIME').AsString);
      AttendConfigSInToTimeList.Add(FindField('AT_SINTOTIME').AsString);
      AttendConfigSWorkTimeList.Add(FindField('AT_SWORKSTARTTIME').AsString);
      AttendConfigSOutTimeList.Add(FindField('AT_SWORKENDTIME').AsString);
      AttendConfigSExtendTimeList.Add(FindField('AT_SEXTENDTIME').AsString);
      AttendConfigSNightTimeList.Add(FindField('AT_SNIGHTTIME').AsString);
      AttendConfigHInFromTimeList.Add(FindField('AT_HINFROMTIME').AsString);
      AttendConfigHInToTimeList.Add(FindField('AT_HINTOTIME').AsString);
      AttendConfigHWorkTimeList.Add(FindField('AT_HWORKSTARTTIME').AsString);
      AttendConfigHOutTimeList.Add(FindField('AT_HWORKENDTIME').AsString);
      AttendConfigHExtendTimeList.Add(FindField('AT_HEXTENDTIME').AsString);
      AttendConfigHNightTimeList.Add(FindField('AT_HNIGHTTIME').AsString);

      Next;
    end;

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_CONFIGGROUP = ''ATTEND'' ';

    Close;
    //Sql.Clear;
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
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'YTIME' then
          L_YesterDayStandTime := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'TTIME' then
          L_ToDayStandTime := FindField('CO_CONFIGVALUE').AsString
        else if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then
          L_nSaturday := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then
          L_nDeviceType := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
          L_nATType := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'OUTTIME' then
          L_nNonBackType := strtoint(FindField('CO_CONFIGVALUE').AsString);

        next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  Result := True;
end;

function TForm1.GetAttendCode(aTime, aCompanyCode, aEMCode: string;
  nWeekCode: integer): string;
begin
  result := '000';
  if L_nATType = 0 then //고정근무타입이면  첫번째 근태 타입을 넘겨준다.
  begin
    if AttendConfigCodeList.Count > 0 then
      result := AttendConfigCodeList.Strings[0];
  end else if L_nATType = 1 then
  begin
    result := GetEMPLOYEEATCode(aCompanyCode,aEMCode);
  end else if L_nATType = 2 then
  begin
    result := GetChangeATCode(aTime,nWeekCode);
  end;

end;

function TForm1.GetEMPLOYEEATCode(aCompanyCode, aEMCode: string): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;


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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    if FindField('AT_ATCODE').IsNull then Result := '000'
    else if Trim(FindField('AT_ATCODE').AsString) = '' then Result := '000'
    else Result := FindField('AT_ATCODE').AsString;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TForm1.GetChangeATCode(aTime: string; nWeekCode: integer): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
  stTime : string;

begin
  result := '000';
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

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with TempAdoQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql ;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    Result := FindField('AT_ATCODE').AsString;
  end;
  TempAdoQuery.Free;
  CoUninitialize; 
end;

function TForm1.GetATInCode(aAttendCode, aTime: string;
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
    stInFromTime := AttendConfigHInFromTimeList.Strings[nIndex];
    stWorkStartTime := AttendConfigHWorkTimeList.Strings[nIndex];
  end else if nWeekCode = 7 then //토요일
  begin
    stInFromTime := AttendConfigSInFromTimeList.Strings[nIndex];
    stWorkStartTime := AttendConfigSWorkTimeList.Strings[nIndex];
  end else //평일
  begin
    stInFromTime := AttendConfigInFromTimeList.Strings[nIndex];
    stWorkStartTime := AttendConfigWorkTimeList.Strings[nIndex];
  end;
  if copy(aTime,9,4) < stInFromTime then result := '004' //조기출근
  else if copy(aTime,9,4) > stWorkStartTime then result := '002' //지각
  else result := '001'; //정상출근
end;

function TForm1.GetATOutCode(aAttendCode, aTime: string;
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
    stWorkEndTime := AttendConfigHOutTimeList.Strings[nIndex];
    stExtendTime := AttendConfigHExtendTimeList.Strings[nIndex];
    stNightTime := AttendConfigHNightTimeList.Strings[nIndex];
  end else if nWeekCode = 7 then //토요일
  begin
    stWorkEndTime := AttendConfigSOutTimeList.Strings[nIndex];
    stExtendTime := AttendConfigSExtendTimeList.Strings[nIndex];
    stNightTime := AttendConfigSNightTimeList.Strings[nIndex];
  end else //평일
  begin
    stWorkEndTime := AttendConfigOutTimeList.Strings[nIndex];
    stExtendTime := AttendConfigExtendTimeList.Strings[nIndex];
    stNightTime := AttendConfigNightTimeList.Strings[nIndex];
  end;

  if Not bYesterDay then  //저녁에 퇴근이면...
  begin
    if copy(aTime,9,4) < stWorkEndTime then result := '002' //조퇴
    else result := '001';    //정상퇴근
    if stExtendTime <> '0000' then
    begin
      if stExtendTime > L_YesterDayStandTime then //작으면 연장근무시간이 새벽이므로 어제날짜 기준일때 적용 됨
      begin
        if stNightTime > L_YesterDayStandTime then
        begin
          if (stExtendTime < copy(aTime,9,4)) and (copy(aTime,9,4) < stNightTime) then result := '003' //연장근무
          else if copy(aTime,9,4) >= stNightTime then result := '004'; //야간근무
        end else result := '003'; //야간근무 기준이 새벽이면 무조건 연장근무임
      end;
    end else  //연장코드 미사용
    begin
      if  stNightTime <> '0000' then   //야간코드 미사용이면 그냥 정규퇴근
      begin
        if stNightTime > L_YesterDayStandTime then  //야간근무시간이 새벽이 아니면...
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
      if stExtendTime < L_YesterDayStandTime then //연장근무시간이 새벽부터이면
      begin
        if stExtendTime < copy(aTime,9,4) then
        begin
          result := '003'; //연장근무
          if stNightTime <> '0000' then //야간근무시간 사용중이고...
          begin
            if stNightTime < L_YesterDayStandTime then  // 야간 근무가 새벽이면
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
          if stNightTime < L_YesterDayStandTime then //새벽시간부터 시작이면
          begin
            if stNightTime < copy(aTime,9,4) then result := '004'; //야간근무
          end else result := '004';
        end;
      end;
    end else //연장근무 사용 안 하고
    begin
      if stNightTime <> '0000' then //야간근무시간 사용중이고...
      begin
        if stNightTime < L_YesterDayStandTime then //야간근무시간이 새벽부터이면
        begin
          if stNightTime < copy(aTime,9,4) then result := '004'; //야간근무
        end else result := '004'; //야간근무가 저녁시간부터이면 야간근무
      end;
    end;

  end;
end;

function TForm1.GetOutAttendCode(aDate, aCompanyCode,
  aEMCode: string): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;


  stSql := 'select * from TB_ATEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ' ;
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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    if FindField('AT_ATCODE').IsNull then Result := '000'
    else if Trim(FindField('AT_ATCODE').AsString) = '' then Result := '000'
    else Result := FindField('AT_ATCODE').AsString;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TForm1.ProcessAttendData1(aTime, aCardNo: String): Boolean;
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
  stAttendType : string;
  stEMCode : string;
  stCompanyCode : string;
begin
  if Not GetEmployeeInfo(aCardNo,False,stCompanyCode,stEMCode) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '근태 데이터 사원정보 조회오류',aTime+':'+aCardNo);
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

  stDate:= Copy(aTime,1,8);

  //오늘이 무슨요일인가? 알자...
  nWeekCode := DayOfWeek(dtPresent); //1: 일요일,7:토요일
  if nWeekCode <> 1 then
    if CheckHolidy(Copy(aTime,1,4),Copy(aTime,5,2),Copy(aTime,7,2)) then nWeekCode := 1; //공휴일이면

  //L_nSaturday //0:휴무,1:반휴일,2:평일
  if nWeekCode = 7 then //토요일 이면 평일로 쓸건지 여부 체크
  begin
    if L_nSaturday = 0 then  nWeekCode := 1      //공휴일 처리
    else if L_nSaturday = 2 then nWeekCode := 8; //평일 처리
  end;

  stAttendType := GetUpdateAttendType(aTime,stCompanyCode,stEMCode,dtYesterDay);

  if stAttendType = '1' then //출근
  begin
    InsertATTENDINCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode);
  end else if stAttendType = '2' then //퇴근
  begin
    InsertATTENDOUTCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '근태 데이터 저장 오류[근태코드]',aTime+':'+stCompanyCode+':'+stEMCode+':'+stAttendType);
    Exit;
  end;

end;

function TForm1.GetEmployeeInfo(aCardNo: string; bPassNo: Boolean;
  var aCompanyCode, aEMCode: string): Boolean;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aCompanyCode := '000';
  aEMCode := '000';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;


  if Not bPassNo then
  begin
    stSql := 'select a.CO_COMPANYCODE,a.EM_CODE from TB_CARD a ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ' ;
  end
  else   //비밀번호인경우
  begin
    stSql := 'select CO_COMPANYCODE,EM_CODE from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND EM_PASS = ''' + aCardNo + ''' ' ;
  end;

  with TempAdoQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text := stSql ;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    aCompanyCode := FindField('CO_COMPANYCODE').AsString;
    aEMCode := FindField('EM_CODE').AsString;
  end;
  result := True;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TForm1.CheckHolidy(aYear, aMonth, aDay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_HOLIDAY ';
  stSql := stSql + ' where HO_DAY = ''' + aYear + aMonth + aDay + ''' ';
  with DataModule1.ADOTmpQuery do
  begin
    Close;
    //Sql.Clear;
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

function TForm1.GetUpdateAttendType(aTime, aCompanyCode, aEMCode: string;
  dtYesterDay: TDatetime): string;
var
  stDate : string;
begin
  stDate := copy(aTime,1,8);
  //기준시간이 새벽에 찍었는가?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    stDate := FormatDateTime('yyyymmdd',dtYesterDay); //어제날짜.
  end;
  
  if dmAdoQuery.DupCheckTB_AT_EVENT(stDate,aCompanyCode,aEMCode) then result := '2' //퇴근
  else result := '1'; //출근

end;

function TForm1.InsertATTENDINCode(aDate, aTime, aCompanyCode,
  aEMCode: String; nWeekCode: integer): Boolean;
var
  stAttendCode : string;
  stATInCode : string;
  nIndex : integer;
begin
  result := False;
(*
  //근태적용일 오늘 출근하면서 전일자 출근 표시 할일이 있을까? 없을것이다. 고로 오늘날짜가 근태일이다.
  stAttendCode := GetAttendCode(aTime,aCompanyCode,aEMCode,nWeekCode);
  nIndex := AttendConfigCodeList.IndexOf(stAttendCode);
  if nIndex = -1 then //근태코드를 찾지 못한경우
  begin
    if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
    begin
      dmAdoQuery.TB_ATEVENTIntimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,'000');
    end;
    Exit;
  end;
  stATInCode := GetATInCode(stAttendCode,aTime,nWeekCode);  //출근타입에 대한 출근코드 가져오자.
  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
  begin
    dmAdoQuery.TB_ATEVENTIntimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,stATInCode);
  end;
  result := True;
*)
end;

function TForm1.InsertATTENDBACKCode(aDate, aTime, aCompanyCode,
  aEMCode: String; nWeekCode: integer; dtYesterDay: TDatetime): Boolean;
var
  bYesterDay : Boolean;
begin
(*  result := False;
  bYesterDay := False;

  //기준시간이 새벽에 찍었는가?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    aDate := FormatDateTime('yyyymmdd',dtYesterDay);
    bYesterDay := True;
  end;

  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
  begin
    dmAdoQuery.TB_ATEVENTBACKtimeInsert(aDate,aCompanyCode,aEMCode,inttostr(nWeekCode),aTime);
  end else dmAdoQuery.TB_ATEVENTBACKtimeUpdate(aDate,aCompanyCode,aEMCode,aTime);
*)
end;

function TForm1.InsertATTENDLEAVECode(aDate, aTime, aCompanyCode,
  aEMCode: String; nWeekCode: integer; dtYesterDay: TDatetime): Boolean;
var
  bYesterDay : Boolean;
begin
(*
  result := False;
  bYesterDay := False;

  //기준시간이 새벽에 찍었는가?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    aDate := FormatDateTime('yyyymmdd',dtYesterDay);
    bYesterDay := True;
  end;

  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
  begin
    dmAdoQuery.TB_ATEVENTLEAVEtimeInsert(aDate,aCompanyCode,aEMCode,inttostr(nWeekCode),aTime);
  end else dmAdoQuery.TB_ATEVENTLEAVEtimeUpdate(aDate,aCompanyCode,aEMCode,aTime);
*)
end;

function TForm1.InsertATTENDOutCode(aDate, aTime, aCompanyCode,
  aEMCode: String; nWeekCode: integer; dtYesterDay: TDatetime): Boolean;
var
  bYesterDay : Boolean;
  stAttendCode : string;
  stATOutCode : string;
  nIndex : integer;
begin
(*
  result := False;
  bYesterDay := False;

  //기준시간이 새벽에 찍었는가?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    aDate := FormatDateTime('yyyymmdd',dtYesterDay);
    bYesterDay := True;
  end;

  stAttendCode := GetOutAttendCode(aDate,aCompanyCode,aEMCode); //근태 데이터에서 근태코드를 가져옴.
  nIndex := AttendConfigCodeList.IndexOf(stAttendCode);
  if nIndex = -1 then //근태코드를 찾지 못한경우
  begin
    if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //중복 데이터 체크하여 없으면 Insert  있으면 무시
    begin
      dmAdoQuery.TB_ATEVENTOuttimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,'000');
    end else dmAdoQuery.TB_ATEVENTOuttimeUpdate(aDate,aCompanyCode,aEMCode,aTime,'000');
    Exit;
  end;
  
  stATOutCode := GetATOutCode(stAttendCode,aTime,nWeekCode,bYesterDay);  //근태타입에 대한 퇴근코드 가져오자.
  dmAdoQuery.TB_ATEVENTOuttimeUpdate(aDate,aCompanyCode,aEMCode,aTime,stATOutCode);
  result := True;
*)
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'log';
  OpenDialog1.Filter := 'log files (*.log)|*.log';
  if OpenDialog1.Execute then
  begin
    ed_FoodErr.Text := OpenDialog1.FileName;
  end;

end;

procedure TForm1.Button5Click(Sender: TObject);
var
  nCount : integer;
  stLine : string;
  nIndex : integer;
  stCardNo : string;
  stFoodTime : string;
  stNodestr : string;
  stReaderNo : string;
  stPermit : string;
  stCompanyCode : string;
  stEmCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stEmName : string;
  stSql : string;
begin
  Gauge3.Progress := 0;
  LogList.Clear;
  if Not FileExists(ed_FoodErr.text) then Exit;
  LogList.LoadFromFile(ed_FoodErr.text);
  Gauge3.MaxValue := LogList.Count;
  for nCount := 0 to LogList.Count - 1 do
  begin
    Gauge3.Progress := nCount;
    stLine := LogList.Strings[nCount];
//    nIndex := Pos('[1001]',stLine);
//    stCardNo := copy(stLine,nIndex + Length('[1001]'),10);
    stFoodTime := FindCharCopy(stLine,1,';');
    stNodestr := FindCharCopy(stLine,2,';');
    stReaderNo := FindCharCopy(stLine,3,';');
    stCardNo := FindCharCopy(stLine,4,';');
    stPermit := FindCharCopy(stLine,5,';');
    if CommonModule.GetEmCode(stCardNo,stCompanyCode,stEmCode) then
    begin
      if not dmAdoQuery.DupCheckTB_FOOD_EVENT(stFoodTime,strtoint(copy(stNodestr,1,3)),copy(stNodestr,4,2),stReaderNo,stCompanyCode,stEmCode) then
      begin
          CommonModule.GetEmployeeInfo(stCardNo,False,stCompanyCode, stEMCode, stJijumCode, stDepartCode,stEmName);
          stSql := stSql + 'Insert into TB_FOODEVENT';
          stSql := stSql + '(GROUP_CODE,FO_DATE,FO_TIME,AC_NODENO,AC_ECUID,';
          stSql := stSql + 'FO_DOORNO,CO_COMPANYCODE,EM_CODE,FO_FOODCODE,FO_PERMIT,FO_INSERTTIME, ';
          stSql := stSql + 'CO_JIJUMCODE,CO_DEPARTCODE,EM_NAME) ';
          stSql := stSql + 'Values ';
          stSql := stSql + '(';
          stSql := stSql + '''1234567890'',';
          stSql := stSql + '''' + copy(stFoodTime,1,8) + ''',';
          stSql := stSql + '''' + copy(stFoodTime,9,6) + ''',';
          stSql := stSql + copy(stNodestr,1,3) + ',';
          stSql := stSql + '''' + copy(stNodestr,4,2) + ''',';
          stSql := stSql + '''' + stReaderNo + ''',';
          stSql := stSql + '''' + stCompanyCode + ''',';
          stSql := stSql + '''' + stEmCode + ''',';
          stSql := stSql + '''' + ed_FoodCode.Text + ''',';
          stSql := stSql + '''' + stPermit + ''',';
          stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
          stSql := stSql + '''' + stJijumCode + ''',';
          stSql := stSql + '''' + stDepartCode + ''',';
          stSql := stSql + '''' + stEmName + ''') ';

          DataModule1.ProcessEventExecSQL(stSql);

      end else
      begin
        Memo1.Lines.Add('Dup:' + stLine);
      end;
    end else
    begin
      Memo1.Lines.Add('NotEmployee:' + stLine);
    end;
  end;
end;

end.
