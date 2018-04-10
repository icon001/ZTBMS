unit uDBModule;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX,forms,
  uCommonVariable;

type
  TdmDBModule = class(TDataModule)
    ADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    ADOTempQuery: TADOQuery;
  private
    FOnAdoConnected: TAdoConnectedEvent;
    FDBConnected: Boolean;
    { Private declarations }
    {SQLLOG저장}
    procedure SQLErrorLog(aSQL:string);
    procedure SetDBConnected(const Value: Boolean);
  public
    { Public declarations }
    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
  published
    property DBConnected : Boolean read FDBConnected write SetDBConnected;
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;

var
  dmDBModule: TdmDBModule;

implementation

{$R *.dfm}

{ TdmDBModule }


function TdmDBModule.ProcessExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  Result:= False;
  //OleInitialize(nil);
  Try
    //FCS.Enter;
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
    ExecQuery.DisableControls;
    //if DBTYPE = 'MDB' then ADOConnection.BeginTrans;
    with ExecQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
//SQLErrorLog(aSql);
      except
      ON E: Exception do
        begin
          SQLErrorLog('DBError('+ E.Message + ')' + aSql);
          
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            DBConnected := False;
          end;
          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;
  //if DBTYPE = 'MDB' then ADOConnection.CommitTrans;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
      SQLErrorLog('DBError:'+ aSql);
    end;
  end else
  begin
    Result:= True;
  end;
end;

procedure TdmDBModule.SetDBConnected(const Value: Boolean);
begin
  if FDBConnected = Value then Exit;
  FDBConnected := Value;
  if Assigned(FOnAdoConnected) then
  begin
    OnAdoConnected(Self,Value);
  end;
end;

procedure TdmDBModule.SQLErrorLog(aSQL: string);
Var
  f: TextFile;
  st: string;
  aFileName: String;
begin

//  if SaveLogData < 1 then Exit;
  if Application.Terminated then Exit;
  {$I-}
  //Critical_SaveLog.Acquire;
  aFileName:= ExtractFileDir(Application.ExeName) + '\..\log\DBerr'+ FormatDateTIme('yyyymmdd',Now)+'.log';
  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('hh:nn:ss:zzz">"   ',Now) + #13#10 + aSQL;
  WriteLn(f,st);
  System.Close(f);
  //Critical_SaveLog.Release;
  {$I+}
end;



end.
