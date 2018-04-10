unit UCommonModule;

interface

uses
  SysUtils, Classes,ADODB,ActiveX,DB;

const
  FTPRETRYCOUNT = 3;

type
  TCommonModule = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadAlarmModeNotCard(var aStringList:TStringList);
    procedure LoadZoneDetectList(var aStringList:TStringList);

    Function CheckHolidy(aYear,aMonth,aDay:string):Boolean;  //해당 날짜가 공휴일인지 체크

    function  GetModeChangeAlarmStatusCode(aAN_CODE:string;var aAlarmStateCode,aDisAlarmStateCode:string):Boolean;
    Function  GetEmCode(aCardNo:string;var aCompanyCode,aEmCode:string):Boolean;
    Function  GetEmployeeInfo(aCardNo:string;bPassNo:Boolean; var aCompanyCode,aEMCode,aJijumCode,aDepartCode,aEmName:string ):Boolean;
    Function  GetEmployeeInfo_AWCODE(aCardNo:string;bPassNo:Boolean; var aCompanyCode,aEMCode,aJijumCode,aDepartCode,aEmName,aAWCode:string ):Boolean;
  public
    Function InsertTB_ATTEND_INCode(aATDate,aNowTime,aCompanyCode,aEMCode:String;nWeekCode:integer;aAtInsert:Boolean):Boolean;
  end;

  TAlarmStatusCode = Class(TComponent)
  private
    FALARMDATA: string;
    FDISALARMSTATUSCODE: string;
    FALARMSTATUSCODE: string;
    procedure SetALARMDATA(const Value: string);
    procedure SetALARMSTATUSCODE(const Value: string);
    procedure SetDISALARMSTATUSCODE(const Value: string);
    { Private declarations }
  public
    { Public declarations }
  published
    Property ALARMDATA:string Read FALARMDATA write SetALARMDATA;
    Property ALARMSTATUSCODE:string Read FALARMSTATUSCODE write SetALARMSTATUSCODE;
    Property DISALARMSTATUSCODE:string Read FDISALARMSTATUSCODE write SetDISALARMSTATUSCODE;
  end;


var
  CommonModule: TCommonModule;
  //************Alarm Data Process Change
  AlarmModeNotCardList : TStringList;  //카드데이터 아닌 리스트
  ZoneDetectList : TStringList;        //존감지 상태 코드

implementation
uses
  uCommonVariable,uDataModule1;

{$R *.dfm}


{ TAlarmStatusCode }

procedure TAlarmStatusCode.SetALARMDATA(const Value: string);
begin
  FALARMDATA := Value;
end;

procedure TAlarmStatusCode.SetALARMSTATUSCODE(const Value: string);
begin
  FALARMSTATUSCODE := Value;
end;

procedure TAlarmStatusCode.SetDISALARMSTATUSCODE(const Value: string);
begin
  FDISALARMSTATUSCODE := Value;
end;

{ TCommonModule }

function TCommonModule.CheckHolidy(aYear, aMonth, aDay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_HOLIDAY ';
  stSql := stSql + ' where HO_DAY = ''' + aYear + aMonth + aDay + ''' ';
  stSql := stSql + ' AND HO_STATE = ''I'' ';
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

function TCommonModule.GetEmCode(aCardNo: string; var aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount > 0 then
      begin
        aCompanyCode := FindField('CO_COMPANYCODE').AsString;
        aEmCode := FindField('EM_CODE').AsString;
        result := True;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TCommonModule.GetEmployeeInfo(aCardNo: string; bPassNo: Boolean;
  var aCompanyCode, aEMCode, aJijumCode, aDepartCode,
  aEmName: string): Boolean;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aCompanyCode := '000';
  aEMCode := '000';
  aJijumCode := '000';
  aDepartCode := '000';
  aEmName := '';


  if Not bPassNo then
  begin
    stSql := 'select a.CO_COMPANYCODE,a.EM_CODE,b.CO_JIJUMCODE,b.CO_DEPARTCODE,';
    stSql := stSql + 'b.EM_NAME from TB_CARD a ';
    stSql := stSql + ' Left Join TB_EMPLOYEE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.EM_CODE = b.EM_CODE) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ' ;
  end
  else   //비밀번호인경우
  begin
    stSql := 'select CO_COMPANYCODE,EM_CODE,CO_JIJUMCODE,CO_DEPARTCODE,EM_NAME from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND EM_PASS = ''' + aCardNo + ''' ' ;
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
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aEMCode := FindField('EM_CODE').AsString;
      aJijumCode := FindField('CO_JIJUMCODE').AsString;
      aDepartCode := FindField('CO_DEPARTCODE').AsString;
      aEmName := FindField('EM_NAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TCommonModule.GetEmployeeInfo_AWCODE(aCardNo: string;
  bPassNo: Boolean; var aCompanyCode, aEMCode, aJijumCode, aDepartCode,
  aEmName, aAWCode: string): Boolean;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aCompanyCode := '000';
  aEMCode := '000';
  aJijumCode := '000';
  aDepartCode := '000';
  aEmName := '';


  if Not bPassNo then
  begin
    stSql := 'select a.CO_COMPANYCODE,a.EM_CODE,b.CO_JIJUMCODE,b.CO_DEPARTCODE,';
    stSql := stSql + 'b.EM_NAME,b.AW_CODE from TB_CARD a ';
    stSql := stSql + ' Left Join TB_EMPLOYEE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.EM_CODE = b.EM_CODE) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ' ;
  end
  else   //비밀번호인경우
  begin
    stSql := 'select CO_COMPANYCODE,EM_CODE,CO_JIJUMCODE,CO_DEPARTCODE,EM_NAME,AW_CODE from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND EM_PASS = ''' + aCardNo + ''' ' ;
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
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aEMCode := FindField('EM_CODE').AsString;
      aJijumCode := FindField('CO_JIJUMCODE').AsString;
      aDepartCode := FindField('CO_DEPARTCODE').AsString;
      aEmName := FindField('EM_NAME').AsString;
      aAWCode := FindField('AW_CODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TCommonModule.GetModeChangeAlarmStatusCode(aAN_CODE: string;
  var aAlarmStateCode, aDisAlarmStateCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aAlarmStateCode := '';
  aDisAlarmStateCode := '';
  
  stSql := ' SELECT * from TB_NOTCARDALARMCODE ';
  stSql := stSql + ' where AN_CODE = ''' + aAN_CODE + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      While Not Eof do
      begin
        if Trim(FindField('AN_MODE').AsString) = 'a' then aAlarmStateCode := FindField('AL_STATUSCODE2').AsString
        else if Trim(FindField('AN_MODE').AsString) = 'd' then aDisAlarmStateCode := FindField('AL_STATUSCODE2').AsString;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TCommonModule.InsertTB_ATTEND_INCode(aATDate, aNowTime,
  aCompanyCode, aEMCode: String; nWeekCode: integer;
  aAtInsert: Boolean): Boolean;
begin

end;

procedure TCommonModule.LoadAlarmModeNotCard(var aStringList: TStringList);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  AlarmStatusCode : TAlarmStatusCode;
  stAlarmStateCode : string;
  stDisAlarmStateCode : string;
begin
  aStringList.Clear;

  stSql := ' SELECT * from TB_ALARMMODENOTCARD ';
  stSql := stSql + ' order by AN_CODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      While Not Eof do
      begin
        AlarmStatusCode:= TAlarmStatusCode.Create(Self);
        AlarmStatusCode.ALARMDATA := FindField('AN_NOTDATA').AsString;
        GetModeChangeAlarmStatusCode(FindField('AN_CODE').AsString,stAlarmStateCode,stDisAlarmStateCode);
        AlarmStatusCode.ALARMSTATUSCODE := stAlarmStateCode;
        AlarmStatusCode.DISALARMSTATUSCODE := stDisAlarmStateCode;
        aStringList.AddObject(FindField('AN_NOTDATA').AsString,AlarmStatusCode);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TCommonModule.LoadZoneDetectList(var aStringList: TStringList);
begin
  aStringList.Clear;
  aStringList.Add('FI'); //화재알람
//  aStringList.Add('F1'); //화재알람
  aStringList.Add('E1'); //비상알람
  aStringList.Add('G1'); //가스알람
  aStringList.Add('Q1'); //설비알람
end;

end.
