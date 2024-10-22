unit UCommonModule;

interface

uses
  SysUtils, Classes,ADODB,ActiveX,DB;

type
  TCommonModule = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadAlarmModeNotCard(var aStringList:TStringList);
    procedure LoadZoneDetectList(var aStringList:TStringList);
    function GetModeChangeAlarmStatusCode(aAN_CODE:string;var aAlarmStateCode,aDisAlarmStateCode:string):Boolean;
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
  uDataModule1;

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
  aStringList.Add('F1'); //화재알람
  aStringList.Add('E1'); //비상알람
  aStringList.Add('G1'); //가스알람
  aStringList.Add('Q1'); //설비알람
end;

end.
