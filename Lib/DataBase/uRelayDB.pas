unit uRelayDB;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX,Dialogs,Forms,uDataModule1;

type
  TdmRelayDB = class(TDataModule)
    FaceCopADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    AttendRelayADOConnection: TADOConnection;
  private
    FFaceCopDBConnected: Boolean;
    FRelayDBConnected: Boolean;
    FOnAdoConnected: TAdoConnectedEvent;
    { Private declarations }
    procedure SetFaceCopDBConnected(const Value: Boolean);
    procedure SetRelayDBConnected(const Value: Boolean);
    procedure SQLErrorLog(aSQL:string);
  public
    { Public declarations }
    Function FaceCopDataBaseConnect(aServerIP,aPort,aDBName,aUserID,aUserPW:string;aMessage:Boolean=True;aOdbc:Boolean=False):Boolean;
    Function RelayAdoConnect(aDataBaseType,aServerIP,aServerPort,aDataBaseName,aUserID,aUserPw:string):Boolean;
    Function RelayProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
  public
    property FaceCopDBConnected : Boolean read FFaceCopDBConnected write SetFaceCopDBConnected;
    property RelayDBConnected : Boolean read FRelayDBConnected write SetRelayDBConnected;
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;

var
  dmRelayDB: TdmRelayDB;

implementation

{$R *.dfm}

{ TdmRelayDB }

function TdmRelayDB.FaceCopDataBaseConnect(aServerIP,aPort,aDBName,aUserID,aUserPW: string;
  aMessage: Boolean=True;aOdbc:Boolean=False): Boolean;
var
  conStr : wideString;
begin
//  if FaceCopDBConnected then Exit;
  FaceCopDBConnected := False;
  result := False;

  conStr := '';
  if aOdbc then
  begin
    conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
    conStr := conStr + 'Extended Properties="DSN=FACECOPODBC;DATABASE=' + aDBName + ';';
    conStr := conStr + 'SERVER=' + aServerIP + ';PORT=' + aPort + ';UID='+ aUserID + ';PWD=' + aUserPW + ';SSLmode=disable;';
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
    conStr := constr + 'Data Source=' + aServerIP + ';'   ;
    conStr := constr + 'location=' + aDBName + ';';
    conStr := constr + 'User Id='+ aUserID + ';';
    conStr := constr + 'password=' + aUserPW;
  end;

  with FaceCopADOConnection do
  begin
    Close;
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
            ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    //CursorLocation := clUseClient;
  end;
  result := True;
  FaceCopDBConnected := True;
end;

function TdmRelayDB.RelayAdoConnect(aDataBaseType, aServerIP, aServerPort,
  aDataBaseName, aUserID, aUserPw: string): Boolean;
var
  conStr : string;
begin
  result := False;
  RelayDBConnected := False;
  if aDataBaseType = '1' then    //MSSQL
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + aUserPw + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + aUserID + ';';
    conStr := constr + 'Initial Catalog=' + aDataBaseName + ';';
    conStr := constr + 'Data Source=' + aServerIP  + ',' + aServerPort;
  end else if aDataBaseType = '2' then  //PostGreSql
  begin
    conStr := 'Provider=PostgreSQL.1;';
    conStr := constr + 'Data Source=' + aServerIP + ',' + aServerPort + ';';
    conStr := constr + 'location=' + aDataBaseName + ';';
    conStr := constr + 'User Id='+ aUserID + ';';
    conStr := constr + 'password=' + aUserPw;
  end else if aDataBaseType = '3' then  //Oracle
  begin
    //conStr := 'Provider=OraOLEDB.Oracle;';
    //conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SID=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    //conStr := 'Provider=OraOLEDB.Oracle;';
    //conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SERVICE_NAME=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    //conStr := constr + 'User Id='+ aUserID + ';';
    //conStr := constr + 'Password=' + aUserPw + '';

    conStr := 'Provider=MSDAORA.1;';
    //conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := constr + 'Password=' + aUserPw + ';';
    conStr := constr + 'User ID='+ aUserID + ';';
    conStr := constr + 'Data Source=' + aDataBaseName + ';';
    conStr := constr + 'Persist Security Info=False';   
    //conStr := constr + 'Persist Security Info=True';  False
  end else if aDataBaseType = '4' then  //Oracle OleDB
  begin
    //conStr := 'Provider=OraOLEDB.Oracle;';
    //conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SID=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SERVICE_NAME=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    conStr := constr + 'User Id='+ aUserID + ';';
    conStr := constr + 'Password=' + aUserPw + '';
  end else if aDataBaseType = '5' then  //ODBC
  begin
    constr := 'Provider=MSDASQL.1;';
    conStr := conStr + 'User ID=' + aUserID + ';';
    conStr := conStr + 'Password=' + aUserPw + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Data Source=' + aServerIP + ';';

  end else if aDataBaseType = '0' then   //MDB
  begin
  {      //if DBName = '' then
    DBName := stExeFolder + '\..\DB\ZMOS.mdb';
    conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    conStr := conStr + 'Data Source=' + DBName + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Jet OLEDB:Database ';
    //if stuserPW <> '' then  conStr := conStr + ' Password=' + stuserPW;  }
  end else
  begin
    //showmessage('DB Type 이 정확하지 않습니다.');
    Exit;
  end;

  with AttendRelayADOConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    //ConnectionString := 'Provider=OraOLEDB.Oracle.1;Password=icon002;User ID=icon002;Data Source=OPPRA;Persist Security Info=True';
    LoginPrompt:= false ;
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
    CursorLocation := clUseServer;
  end;
  RelayDBConnected := True;
  result := True;

end;

function TdmRelayDB.RelayProcessExecSQL(aSql: String;
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
    ExecQuery.Connection := AttendRelayADOConnection;
    ExecQuery.DisableControls;
    //if DBTYPE = 'MDB' then ADOConnection.BeginTrans;
    with ExecQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
      except
      ON E: Exception do
        begin

          SQLErrorLog('DBError('+ E.Message + ')' + aSql);
          
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;

          Exit;
        end;
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;

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

procedure TdmRelayDB.SetFaceCopDBConnected(const Value: Boolean);
begin
  FFaceCopDBConnected := Value;
end;

procedure TdmRelayDB.SetRelayDBConnected(const Value: Boolean);
begin
  FRelayDBConnected := Value;
end;

procedure TdmRelayDB.SQLErrorLog(aSQL: string);
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
