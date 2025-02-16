unit udmAdoRelay;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX,Dialogs,uCommonVariable,forms,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection;

type
  TdmAdoRelay = class(TDataModule)
    ZConnection1: TZConnection;
    RelaySearchQuery: TZQuery;
    ExeQuery: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FOnAdoConnected: TAdoConnectedEvent;
    FDBConnected: Boolean;
    FOnAdoEvent: TAdoEvent;
    {SQLLOG저장}
    procedure SQLErrorLog(aSQL:string);
    procedure SetDBConnected(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Function CheckReservLog(aKey,aEmCode,aCardNo,aDoorCode,aAccessTime:string):integer;
    Function ProcessExecSQL(aSql:String): Boolean;
    Function AdoRelayConnected(aDataBaseType,aServerIP,aServerPort,aUserID,aUserPw,aDataBaseName:string):Boolean;
  public
    property DBConnected :Boolean read FDBConnected  write SetDBConnected;
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
    property OnAdoEvent:          TAdoEvent read FOnAdoEvent  write FOnAdoEvent;
  end;

var
  dmAdoRelay: TdmAdoRelay;
  G_nRelayDataBaseType : integer;
  G_stRelayServerIP:string;
  G_stRelayServerPort:string;
  G_stRelayUserID : string;
  G_stRelayUserPW : string;
  G_stRelayDataBaseName : string;
  G_stRelayDateTime : string;

  G_nRelayDataBaseType2 : integer;
  G_stRelayServerIP2:string;
  G_stRelayServerPort2:string;
  G_stRelayUserID2 : string;
  G_stRelayUserPW2 : string;
  G_stRelayDataBaseName2 : string;

implementation

{$R *.dfm}

{ TdmAdoRelay }

function TdmAdoRelay.AdoRelayConnected(aDataBaseType, aServerIP,
  aServerPort, aUserID, aUserPw, aDataBaseName: string): Boolean;
var
  conStr : string;
begin
  result := False;
  DBConnected := False;
  ZConnection1.Protocol := aDataBaseType;
  ZConnection1.Database := aDataBaseName;
  ZConnection1.HostName := aServerIP;
  ZConnection1.Port := strtoint(aServerPort);
  ZConnection1.User := aUserID;
  ZConnection1.Password := aUserPw;

  with ZConnection1 do
  begin
    Disconnect;
    Try
      Connected := True;
    Except
      on E : Exception do
        begin
          SQLErrorLog('DBError('+ E.Message + ')' + conStr );
          // ERROR MESSAGE-BOX DISPLAY
          //ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          //ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
  end;
  DBConnected := True;
  ProcessExecSQL('set names euckr');
  result := True;
end;

function TdmAdoRelay.ProcessExecSQL(aSql: String): Boolean;
var
  ExecQuery :TZQuery;
begin
  Result:= False;
  Try
    OleInitialize(nil);
    ExecQuery := TZQuery.Create(nil);
    ExecQuery.Connection := ZConnection1;
    with ExecQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text:= aSql;
      try
        ExecSQL;
      except
      ON E: Exception do
        begin
          if Assigned(FOnAdoEvent) then
          begin
            OnAdoEvent(Self,'DBError('+ E.Message + ')' + aSql);
          end;
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
          end else if Pos('is marked as crashed and should be repaired',E.Message) > 0 then
          begin
            DBConnected := False;
          end else if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            DBConnected := False;
          end;
          Exit;
        end
      end;
      if Assigned(FOnAdoEvent) then
      begin
        OnAdoEvent(Self,aSql);
      end;
    end;
  Finally
    ExecQuery.Free;
    OleUninitialize;
  End;
  Result:= True;
end;

procedure TdmAdoRelay.DataModuleCreate(Sender: TObject);
begin
  RelaySearchQuery.Connection := ZConnection1;
  DBConnected := False;
end;

procedure TdmAdoRelay.SetDBConnected(const Value: Boolean);
begin
  if FDBConnected = Value then Exit;
  FDBConnected := Value;
  if Assigned(FOnAdoConnected) then
  begin
    OnAdoConnected(Self,Value);
  end;
end;

procedure TdmAdoRelay.SQLErrorLog(aSQL: string);
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

function TdmAdoRelay.CheckReservLog(aKey, aEmCode, aCardNo, aDoorCode,
  aAccessTime: string): integer;
var
  stSql: string;
  TempAdoQuery : TZQuery;
begin
  Result := -1;
  stSql := 'select * from login_log_tbl ';
  stSql := stSql + ' where booking_no = ' + aKey + ' ';
  stSql := stSql + ' AND member_id = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND user_no = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND code_no = ''' + aDoorCode + ''' ';
  stSql := stSql + ' AND login_time = ''' + aAccessTime + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ZConnection1;
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
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

end.
