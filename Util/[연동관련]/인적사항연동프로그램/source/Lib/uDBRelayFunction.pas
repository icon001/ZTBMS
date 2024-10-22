unit uDBRelayFunction;

interface

uses
  SysUtils, Classes,ADODB,ActiveX;

type
  TdmDBRelayFunction = class(TDataModule)
  private
    { Private declarations }
    Function CheckSejongKTTRelay(aHR_ID:string):integer;
    Function InsertSejongKTTRelay(aHR_ID, aHR_NAME, aHR_LOCCODE,aHR_STATUS, aHR_VACANCY:string):Boolean;
    Function UpdateSejongKTTRelay(aHR_ID, aHR_NAME, aHR_LOCCODE,aHR_STATUS, aHR_VACANCY:string):Boolean;
  public
    { Public declarations }
    Function SejongRealRelay(aHR_ID, aHR_NAME, aHR_LOCCODE, aHR_STATUS,aHR_VACANCY:string):Boolean;
  end;

var
  dmDBRelayFunction: TdmDBRelayFunction;

implementation

uses
udmAdoRelay;
{$R *.dfm}

{ TdmDBRelayFunction }

function TdmDBRelayFunction.CheckSejongKTTRelay(aHR_ID: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from KTT ';
  stSql := stSql + ' Where  id = ''' + aHR_ID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection1;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      result := 0;
      if recordCount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBRelayFunction.InsertSejongKTTRelay(aHR_ID, aHR_NAME,
  aHR_LOCCODE, aHR_STATUS, aHR_VACANCY: string): Boolean;
var
  stSql : string;
begin
  stSql := 'insert into KTT(id,status,vacancy,name,loc_code,datetime) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + aHR_ID + ''', ';
  stSql := stSql + '' + aHR_STATUS + ', ';
  stSql := stSql + '' + aHR_VACANCY + ', ';
  stSql := stSql + '''' + aHR_NAME + ''', ';
  stSql := stSql + '''' + aHR_LOCCODE + ''', ';
  stSql := stSql + 'getdate() ) ';

  Result := dmAdoRelay.ProcessExecSQL1(stSql);
end;

function TdmDBRelayFunction.SejongRealRelay(aHR_ID, aHR_NAME, aHR_LOCCODE,
  aHR_STATUS, aHR_VACANCY: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  if aHR_STATUS = 'A' then aHR_STATUS := '1'
  else aHR_STATUS := '0';
  if Trim(aHR_VACANCY) = '' then aHR_VACANCY := '0'  //재실
  else aHR_VACANCY := '1'; //공실
  if CheckSejongKTTRelay(aHR_ID) = 1 then
  begin
    //Update
    result := UpdateSejongKTTRelay(aHR_ID, aHR_NAME, aHR_LOCCODE,aHR_STATUS, aHR_VACANCY) ;
  end else
  begin
    //Insert
    InsertSejongKTTRelay(aHR_ID, aHR_NAME, aHR_LOCCODE,aHR_STATUS, aHR_VACANCY) ;
    if CheckSejongKTTRelay(aHR_ID) = 1 then result := True;
  end;
end;

function TdmDBRelayFunction.UpdateSejongKTTRelay(aHR_ID, aHR_NAME,
  aHR_LOCCODE, aHR_STATUS, aHR_VACANCY: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update KTT set status = ' + aHR_STATUS + ', ';
  stSql := stSql + 'vacancy = ' + aHR_VACANCY + ', ';
  stSql := stSql + 'name = ''' + aHR_NAME + ''', ';
  stSql := stSql + 'loc_code = ''' + aHR_LOCCODE + ''', ';
  stSql := stSql + 'datetime = getdate() ';
  stSql := stSql + ' Where  id = ''' + aHR_ID + ''' ';

  Result := dmAdoRelay.ProcessExecSQL1(stSql);
end;

end.
