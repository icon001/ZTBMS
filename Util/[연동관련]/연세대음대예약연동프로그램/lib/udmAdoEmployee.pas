unit udmAdoEmployee;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX,forms,
  uCommonVariable;

type
  TdmADOEmployee = class(TDataModule)
    ADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    ADOTempQuery: TADOQuery;
  private
    FDBConnected: Boolean;
    FOnAdoConnected: TAdoConnectedEvent;
    procedure SQLErrorLog(aSQL:string);
    procedure SetDBConnected(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Function AdoEmployeeConnected(aDataBaseType,aServerIP,aServerPort,aUserID,aUserPw,aDataBaseName:string):Boolean;
  published
    property DBConnected : Boolean read FDBConnected write SetDBConnected;
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;

var
  dmADOEmployee: TdmADOEmployee;

implementation

{$R *.dfm}

{ TdmADOEmployee }

function TdmADOEmployee.AdoEmployeeConnected(aDataBaseType, aServerIP,
  aServerPort, aUserID, aUserPw, aDataBaseName: string): Boolean;
var
  conStr : wideString;
  stDBPath : string;
begin
  result := False;
  if UpperCase(aDataBaseType) = 'MSSQL' then
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + aUserPw + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + aUserID + ';';
    conStr := constr + 'Initial Catalog=' + aDataBaseName + ';';
    conStr := constr + 'Data Source=' + aServerIP  + ',' + aServerPort;
  end else if UpperCase(aDataBaseType) = 'PG' then
  begin
      conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
      conStr := conStr + 'Extended Properties="DSN=PostgreSQL35W;DATABASE=' + aDataBaseName + ';';
      conStr := conStr + 'SERVER=' + aServerIP + ';PORT=5432;UID='+ aUserID + ';PWD=' + aUserPw + ';SSLmode=disable;';
      conStr := conStr + 'ReadOnly=0;Protocol=7.4;FakeOidIndex=0;ShowOidColumn=0;';
      conStr := conStr + 'RowVersioning=0;ShowSystemTables=0;ConnSettings=;Fetch=100;';
      conStr := conStr + 'Socket=4096;UnknownSizes=0;MaxVarcharSize=255;MaxLongVarcharSize=8190;';
      conStr := conStr + 'Debug=0;CommLog=0;Optimizer=1;Ksqo=1;UseDeclareFetch=0;TextAsLongVarchar=1;';
      conStr := conStr + 'UnknownsAsLongVarchar=0;BoolsAsChar=1;Parse=0;CancelAsFreeStmt=0;';
      conStr := conStr + 'ExtraSysTablePrefixes=dd_;;LFConversion=1;UpdatableCursors=1;';
      conStr := conStr + 'DisallowPremature=0;TrueIsMinus1=0;BI=0;ByteaAsLongVarBinary=0;UseServerSidePrepare=0;LowerCaseIdentifier=0;XaOpt=1"';
  end else if UpperCase(aDataBaseType) = 'FB' then
  begin
    conStr := 'Provider=MSDASQL;';
    conStr := conStr + 'DRIVER=Firebird/InterBase(r) driver;';
    conStr := constr + 'UID=' + aUserID + ';';
    conStr := constr + 'PWD=' + aUserPw + ';';
    conStr := constr + 'Auto Commit=true;';
    conStr := constr + 'DBNAME=' + aServerIP + ':' + aDataBaseName;
  end else
  begin
    Exit;
  end;

  with ADOConnection do
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
          SQLErrorLog(E.Message );
          Exit;
        end;
      else
        begin
          SQLErrorLog('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
  end;
  DBConnected := True;
  result := True;

end;

procedure TdmADOEmployee.SetDBConnected(const Value: Boolean);
begin
  if FDBConnected = Value then Exit;
  FDBConnected := Value;
  if Assigned(FOnAdoConnected) then
  begin
    OnAdoConnected(Self,Value);
  end;
end;

procedure TdmADOEmployee.SQLErrorLog(aSQL: string);
Var
  f: TextFile;
  st: string;
  aFileName: String;
begin

//  if SaveLogData < 1 then Exit;
  if Application.Terminated then Exit;
  {$I-}
  //Critical_SaveLog.Acquire;
  aFileName:= ExtractFileDir(Application.ExeName) + '\..\log\EMDBerr'+ FormatDateTIme('yyyymmdd',Now)+'.log';
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
