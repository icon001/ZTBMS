unit uFoodEventInsert;

interface

uses
  SysUtils, Classes;

type
  TdmDBFoodEvent = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FFoodYesterDayTime: string;
    FoodConfigCodeList : TStringList;
    FoodConfigStartList : TStringList;
    FoodConfigEndList : TStringList;
    FFoodDupEvent: integer;
    { Private declarations }
  public
    { Public declarations }
    procedure StringListClear;
    Function FoodCodeAdd(aFoodCode,aStartTime,aEndTime:string):Boolean;
    Function ProcessFoodData(aTime, aCardNo, aECUID:string; aNodeNO:integer; aReaderNo,aPermit:char;aJijumCode,aDepartCode,aCompanyCode,aEmCode,aEmName:string):Boolean;
  public
    property FoodYesterDayTime : string read FFoodYesterDayTime write FFoodYesterDayTime;
    property FoodDupEvent : integer read FFoodDupEvent write FFoodDupEvent;
  end;

var
  dmDBFoodEvent: TdmDBFoodEvent;

implementation

uses
  udmAdoQuery,
  uCommonModule,
  uDataModule1,
  DateUtils,
  uLomosUtil;
{$R *.dfm}

{ TdmDBFoodEvent }

function TdmDBFoodEvent.ProcessFoodData(aTime, aCardNo, aECUID: string;
  aNodeNO: integer; aReaderNo, aPermit: char; aJijumCode,
  aDepartCode, aCompanyCode,aEmCode,aEmName: string): Boolean;
var
  stDateStr: String;
  wYear    : word;
  wMonth   : word;
  wDay     : word;
  wHour    : word;
  wMinute  : word;
  wSecond  : word;
  dtPresent: TDatetime;
  cPermit: Char;
  dtStartTime : TDatetime;
  dtEndTime : TDatetime;
  stFoodCode: String;
  stSql : string;
  i : integer;
  DeviceIndex : integer;
  stRelay : string;
  stFoodData : string;
  bYesterDay : Boolean;
  dtYesterDay : TDatetime;
  stFoodTime : string;
begin
  if isDigit(aPermit) then cPermit:= 'Y'    //#31 �Ǵ� #32 �̸� ���� �ƴϸ� N
  else                     cPermit:= 'N';

  if Not isDigit(aTime) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ļ��ð� ����' + ':' + aTime);
    Exit;
  end;

  if Length(aTime) < 14 then
  begin
    ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ļ��ð� ����' + ':' + aTime);
    Exit;
  end;
  bYesterDay := False;
  if copy(aTime,9,4) < FoodYesterDayTime then
  begin
    bYesterDay := True; //������ ������ ����.
  end;

  Try
    wYear  := StrtoInt(Copy(aTime,1,4));
    wMonth := StrtoInt(Copy(aTime,5,2));
    wDay   := StrtoInt(Copy(aTime,7,2));
    wHour  := StrtoInt(Copy(aTime,9,2));
    wMinute:= StrtoInt(Copy(aTime,11,2));
    wSecond:= StrtoInt(Copy(aTime,13,2));

    dtPresent:= EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, wSecond,00);
  Except
    ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ļ��ð� ����' + ':' + aTime);
    Exit;
  end;
  dtYesterDay := dtPresent - 1;

  stFoodTime := aTime;
  if bYesterDay then
  begin
    stFoodTime := FormatDateTime('yyyymmdd',dtYesterDay) + copy(aTime,9,6);
  end;

  stFoodCode := '000'; // ����Ʈ�ڵ�
  
//  if FoodConfigCodeList.Count < 1 then Exit; //FoodCount �� ������ �ļ�ȯ�� ������ �����Ƿ� �׸�����
  Try
    for i:= 0 to FoodConfigCodeList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      wHour := strtoInt(copy(FoodConfigStartList.Strings[i],1,2));
      wMinute := strtoInt(copy(FoodConfigStartList.Strings[i],3,2));
      dtStartTime := EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, 00,00);
      wHour := strtoInt(copy(FoodConfigEndList.Strings[i],1,2));
      wMinute := strtoInt(copy(FoodConfigEndList.Strings[i],3,2));
      dtEndTime := EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, 00,00);
      if dtStartTime < dtEndTime then
      begin
        if (dtPresent >=  dtStartTime ) And (dtPresent <=  dtEndTime ) then
        begin
           stFoodCode:= FoodConfigCodeList.Strings[i];
           break;
        end;
      end else    //24�ð� �Ѿ�� ���
      begin
        if (dtPresent >=  dtStartTime ) or (dtPresent <=  dtEndTime ) then
        begin
           stFoodCode:= FoodConfigCodeList.Strings[i];
           break;
        end;
      end;
    end;
  Except
    ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ļ�ȯ�� ����' + ':' + aTime);
    Exit;

  End;


  if FoodDupEvent = 1 then
  begin
    //�ļ� �̺�Ʈ �ߺ� �Ұ� ó���� �ļ� �ڵ� Ȯ�� ����.
    if stFoodCode = '000' then
    begin
      ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ļ� �ð��� ������');
      Exit; //�ļ� �ð� �ܿ� ������ ��� �Ұ� ó��
    end;
    if dmAdoQuery.DupEventCodeFOODEVENT(stFoodTime,stFoodCode,aCompanyCode,aEmCode) then
    begin
      ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ߺ��Ļ�');
      Exit; //�ش����ڿ� �ش� �ڵ�� �ѹ� �̻��� �� �Դ´�.
    end;
  end;

  stDateStr:= Copy(stFoodTime,1,8);

  if not dmAdoQuery.DupCheckTB_FOOD_EVENT(stFoodTime,aNodeNo,aECUID,aReaderNo,aCompanyCode,aEmCode) then
  begin
      stSql := stSql + 'Insert into TB_FOODEVENT';
      stSql := stSql + '(GROUP_CODE,FO_DATE,FO_TIME,AC_NODENO,AC_ECUID,';
      stSql := stSql + 'FO_DOORNO,CO_COMPANYCODE,EM_CODE,FO_FOODCODE,FO_PERMIT,FO_INSERTTIME, ';
      stSql := stSql + 'CO_JIJUMCODE,CO_DEPARTCODE,EM_NAME) ';
      stSql := stSql + 'Values ';
      stSql := stSql + '(';
      stSql := stSql + '''' + GROUPCODE + ''',';
      stSql := stSql + '''' + copy(stFoodTime,1,8) + ''',';
      stSql := stSql + '''' + copy(stFoodTime,9,6) + ''',';
      stSql := stSql + inttostr(aNodeNo) + ',';
      stSql := stSql + '''' + aECUID + ''',';
      stSql := stSql + '''' + aReaderNo + ''',';
      stSql := stSql + '''' + aCompanyCode + ''',';
      stSql := stSql + '''' + aEmCode + ''',';
      stSql := stSql + '''' + stFoodCode + ''',';
      stSql := stSql + '''' + cPermit + ''',';
      stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
      stSql := stSql + '''' + aJijumCode + ''',';
      stSql := stSql + '''' + aDepartCode + ''',';
      stSql := stSql + '''' + aEmName + ''') ';

      DataModule1.ProcessEventExecSQL(stSql);

  end else
  begin
      ErrorLogSave(ExeFolder + '\..\log\Fooderr'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                       '1001',aCardNo+'�ߺ�������');
  end;

end;

procedure TdmDBFoodEvent.DataModuleCreate(Sender: TObject);
begin
  FoodConfigCodeList := TStringList.Create;
  FoodConfigStartList := TStringList.Create;
  FoodConfigEndList := TStringList.Create;
end;

procedure TdmDBFoodEvent.DataModuleDestroy(Sender: TObject);
begin
  FoodConfigCodeList.free;
  FoodConfigStartList.free;
  FoodConfigEndList.free;
end;

procedure TdmDBFoodEvent.StringListClear;
begin
  FoodConfigCodeList.clear;
  FoodConfigStartList.clear;
  FoodConfigEndList.clear;
end;

function TdmDBFoodEvent.FoodCodeAdd(aFoodCode, aStartTime,
  aEndTime: string): Boolean;
begin
  FoodConfigCodeList.Add(aFoodCode);
  FoodConfigStartList.Add(aStartTime);
  FoodConfigEndList.Add(aEndTime);
end;

end.
