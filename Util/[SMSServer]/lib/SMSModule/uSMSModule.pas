unit uSMSModule;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX,Dialogs, ZAbstractConnection,
  ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset,Forms;

type
  TSMSEvent = procedure(Sender: TObject;  aUserID, aSubject, aSmsMessage,aCallBackUrl,
              aCallback, aSendername, aDestNumber,aCdrID,aResult:string) of object;

  TdmSMSModule = class(TDataModule)
    SMSConnection: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FDataBaseIP: string;
    FDataBaseType: string;
    FDataBasePort: integer;
    FUserID: string;
    FUserPW: string;
    FDataBaseName: string;
    FDBConnected: Boolean;
    FOnSMSEvent: TSMSEvent;
    FServerType: integer;
    procedure SetDBConnected(const Value: Boolean);
    { Private declarations }
  private
    procedure SQLErrorLog(aSQL:string);
    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
  public
    { Public declarations }
    Function DataBaseConnect(aMessage:Boolean=True):Boolean;
    Function SMSDataSend(aUserID,aSubject,aSmsMessage,aCallBackUrl,aCallback,aSendername,aDestNumber,aCdrID:string):Boolean;
  published
    property ServerType : integer read FServerType write FServerType;
    property DataBaseType : string read FDataBaseType write FDataBaseType;
    property DataBaseIP : string read FDataBaseIP write FDataBaseIP;
    property DataBasePort : integer read FDataBasePort write FDataBasePort;
    property UserID : string read FUserID write FUserID;
    property UserPW : string read FUserPW write FUserPW;
    property DataBaseName : string read FDataBaseName write FDataBaseName;

    Property DBConnected : Boolean read FDBConnected write SetDBConnected;


    property OnSMSEvent:      TSMSEvent read FOnSMSEvent       write FOnSMSEvent;
  end;

var
  dmSMSModule: TdmSMSModule;

implementation

{$R *.dfm}

{ TdmSMSModule }

function TdmSMSModule.DataBaseConnect(aMessage: Boolean): Boolean;
var
  conStr : wideString;
  stpsqlOdbcSetup : string;
begin
  if DBConnected then Exit;
(*  with SMSConnection do
  begin
    if UpperCase(DataBaseType) = 'MSSQL' then Protocol := 'mssql'
    else if UpperCase(DataBaseType) = 'PG' then Protocol := 'postgresql'
    else if UpperCase(DataBaseType) = 'mysql' then Protocol := 'mysql';
//    SMSConnection.
//    Parameters.Add('trusted=yes');
    Database := DataBaseName;
    HostName := DataBaseIP;
    Port := DataBasePort;
    User := UserID;
    Password := UserPW;
    try
      Disconnect;
      Connect;
    Except
      Exit;
    End;
  end;
  DBConnected := True;
  result := True;
*)

  stpsqlOdbcSetup := 'FALSE';
  result := False;
  Try
    conStr := '';
    if UpperCase(DataBaseType) = 'MSSQL' then
    begin
      conStr := constr + 'Provider=SQLOLEDB.1;';
      conStr := constr + 'Password=' + UserPW + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID=' + UserID + ';';
      conStr := constr + 'Initial Catalog=' + DataBaseName + ';';
      conStr := constr + 'Data Source=' + DataBaseIP  + ',' + inttostr(DataBasePort);
    end else if UpperCase(DataBaseType) = 'PG' then
    begin
      if stpsqlOdbcSetup = 'TRUE' then
      begin
        conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
        conStr := conStr + 'Extended Properties="DSN=PostgreSQL35W;DATABASE=' + DataBaseName + ';';
        conStr := conStr + 'SERVER=' + DataBaseIP + ';PORT=5432;UID='+ UserID + ';PWD=' + UserPW + ';SSLmode=disable;';
        conStr := conStr + 'ReadOnly=0;Protocol=7.4;FakeOidIndex=0;ShowOidColumn=0;';
        conStr := conStr + 'RowVersioning=0;ShowSystemTables=0;ConnSettings=;Fetch=100;';
        conStr := conStr + 'Socket=4096;UnknownSizes=0;MaxVarcharSize=255;MaxLongVarcharSize=8190;';
        conStr := conStr + 'Debug=0;CommLog=0;Optimizer=1;Ksqo=1;UseDeclareFetch=0;TextAsLongVarchar=1;';
        conStr := conStr + 'UnknownsAsLongVarchar=0;BoolsAsChar=1;Parse=0;CancelAsFreeStmt=0;';
        conStr := conStr + 'ExtraSysTablePrefixes=dd_;;LFConversion=1;UpdatableCursors=1;';
        conStr := conStr + 'DisallowPremature=0;TrueIsMinus1=0;BI=0;ByteaAsLongVarBinary=0;UseServerSidePrepare=0;LowerCaseIdentifier=0;XaOpt=1"';
      end else
      begin
        conStr := 'Provider=PostgreSQL OLE DB Provider;';
        //conStr := 'Provider=PostgreSQL.1;';
        conStr := constr + 'Data Source=' + DataBaseIP + ';'   ;
        conStr := constr + 'location=' + DataBaseName + ';';
        conStr := constr + 'User Id='+ UserID + ';';
        conStr := constr + 'password=' + UserPW;
      end;
    end else if UpperCase(DataBaseType) = 'MYSQL' then
    begin
      conStr := 'DRIVER={MySQL ODBC 3.51 Driver};';
      conStr := constr + 'SERVER=' + DataBaseIP + ';'   ;
      conStr := constr + 'DATABASE=' + DataBaseName + ';';
      conStr := constr + 'UID='+ UserID + ';';
      conStr := constr + 'PWD=' + UserPW + ';';
      conStr := constr + 'OPTION=3';
    end else if UpperCase(DataBaseType) = 'ODBC' then
    begin
      conStr := 'Provider=MSDASQL.1;';
      conStr := constr + 'Password=' + UserPW + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID='+ UserID + ';';
      conStr := constr + 'Data Source=' + DataBaseIP + ';';
      conStr := constr + 'Initial Catalog=' + DataBaseName + ';';
    end else if UpperCase(DataBaseType) = 'MDB' then
    begin
      conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      conStr := conStr + 'Data Source=' + DataBaseName + ';';
      conStr := conStr + 'Persist Security Info=True;';
      conStr := conStr + 'Jet OLEDB:Database ';
    end else if UpperCase(DataBaseType) = 'FB' then
    begin
      conStr := 'Provider=MSDASQL;';
      conStr := conStr + 'DRIVER=Firebird/InterBase(r) driver;';
      conStr := constr + 'UID=' + UserID + ';';
      conStr := constr + 'PWD=' + UserPW + ';';
      conStr := constr + 'Auto Commit=true;';
      conStr := constr + 'DBNAME=' + DataBaseIP + ':' + DataBaseName;
    end else
    begin
      showmessage('DB Type 이 정확하지 않습니다.');
      Exit;
    end;

    with SMSConnection do
    begin
      Connected := False;
      Try
        ConnectionString := conStr;
        LoginPrompt:= false ;
        Connected := True;
      Except
        on E : EDatabaseError do
          begin
            // ERROR MESSAGE-BOX DISPLAY
            if aMessage then
              ShowMessage(E.Message );
            Exit;
          end;
        else
          begin
            if aMessage then
              ShowMessage('SMS 데이터베이스 접속 에러' + conStr );
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
    end;

    DBConnected := True;
    result := True;

  Finally
    //
  End;

end;

procedure TdmSMSModule.SetDBConnected(const Value: Boolean);
begin
  FDBConnected := Value;
end;

procedure TdmSMSModule.DataModuleCreate(Sender: TObject);
begin
  DBConnected := False;
end;

function TdmSMSModule.SMSDataSend(aUserID, aSubject, aSmsMessage,
  aCallBackUrl, aCallback, aSendername, aDestNumber,
  aCdrID: string): Boolean;
var
  stSql : string;
  stResult : string;
begin
  if UpperCase(DataBaseType) = 'MSSQL' then
  begin
    stSql := 'INSERT INTO SDK_SMS_SEND ';
    stSql := stSql + '( USER_ID, ';
    stSql := stSql + 'SUBJECT, ';
    stSql := stSql + 'SMS_MSG, ';
    stSql := stSql + 'CALLBACK_URL, ';
    stSql := stSql + 'NOW_DATE, ';
    stSql := stSql + 'SEND_DATE, ';
    stSql := stSql + 'CALLBACK, ';
    stSql := stSql + 'DEST_INFO, ';
    stSql := stSql + 'CDR_ID) ';
    stSql := stSql + ' VALUES ( ';
    stSql := stSql + '''' + aUserID + ''',';
    stSql := stSql + '''' + aSubject + ''',';
    stSql := stSql + '''' + aSmsMessage + ''',';
    stSql := stSql + '''' + aCallBackUrl + ''',';
    stSql := stSql + 'CONVERT(CHAR(8), GETDATE(), 112) + REPLACE(CONVERT(CHAR(8),GETDATE(), 108), '':'', '''') , ';
    stSql := stSql + 'CONVERT(CHAR(8), GETDATE(), 112) + REPLACE(CONVERT(CHAR(8),GETDATE(), 108), '':'', '''') , ';
    stSql := stSql + '''' + aCallback + ''',';
    stSql := stSql + '''' + aSendername + '^' + aDestNumber + ''',';
    stSql := stSql + '''' + aCdrID + ''') ';
  end else if ServerType = 0 then
  begin
      ADOQuery1.SQL.Text := 'set names euckr';
      Try
        //ADOQuery1.Close;
        ADOQuery1.ExecSQL;
      Except
        on e: Exception do
        begin
            ShowMessage(E.Message );
            Exit;
        end;

      End;
    stSql := 'INSERT INTO SDK_SMS_SEND ';
    stSql := stSql + '( USER_ID, ';
    stSql := stSql + 'SUBJECT, ';
    stSql := stSql + 'SMS_MSG, ';
    stSql := stSql + 'CALLBACK_URL, ';
    stSql := stSql + 'NOW_DATE, ';
    stSql := stSql + 'SEND_DATE, ';
    stSql := stSql + 'CALLBACK, ';
    stSql := stSql + 'DEST_INFO, ';
    stSql := stSql + 'CDR_ID) ';
    stSql := stSql + ' VALUES ( ';
    stSql := stSql + '''' + aUserID + ''',';
    stSql := stSql + '''' + aSubject + ''',';
    stSql := stSql + '''' + aSmsMessage + ''',';
    stSql := stSql + '''' + aCallBackUrl + ''',';
    stSql := stSql + 'DATE_FORMAT(NOW(), ''%Y%m%d%H%i%S''), ';
    stSql := stSql + 'DATE_FORMAT(NOW(), ''%Y%m%d%H%i%S'') , ';
    stSql := stSql + '''' + aCallback + ''',';
    stSql := stSql + '''' + aSendername + '^' + aDestNumber + ''',';
    stSql := stSql + '''' + aCdrID + ''') ';
  end;

  if Assigned(FOnSMSEvent) then
  begin
    OnSMSEvent(Self,aUserID, aSubject, aSmsMessage,aCallBackUrl, aCallback,
               aSendername, aDestNumber,aCdrID,stSql);
  end;

  result := ProcessExecSQL(stSql);

  if result then stResult := 'SUCCESS'
  else stResult := 'FAIL';

  if Assigned(FOnSMSEvent) then
  begin
    OnSMSEvent(Self,aUserID, aSubject, aSmsMessage,aCallBackUrl, aCallback,
               aSendername, aDestNumber,aCdrID,stResult);
  end;

end;

function TdmSMSModule.ProcessExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TAdoQuery;
  nResult : integer;
begin
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TAdoQuery.Create(nil);
    ExecQuery.Connection := SMSConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        ExecSQL;
      except
      ON E: Exception do
        begin
          SQLErrorLog('DBError('+ E.Message + ')' + DataBaseType + aSql );
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
        end;
      end;
    end;

    (*if bUpdateResult then
    begin
      if nResult > 0 then Result := True
      else
      begin
        Result := False;
      end;
    end else
    begin
      Result:= True;
    end;
    *)
    Result:= True;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;
end;

procedure TdmSMSModule.SQLErrorLog(aSQL: string);
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
