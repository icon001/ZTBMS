unit udmAdoRelay;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX,Dialogs,uCommonVariable,forms;

type
  TdmAdoRelay = class(TDataModule)
    RelayExeQuery: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOConnection: TADOConnection;
    ADOConnection1: TADOConnection;
    ADOConnectionTEST: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FOnAdoConnected: TAdoConnectedEvent;
    FDBConnected: Boolean;
    FOnAdoEvent: TAdoEvent;
    FDBConnected1: Boolean;
    FOnAdoConnected1: TAdoConnectedEvent;
    FDBConnectedTest: Boolean;
    {SQLLOG저장}
    procedure SQLErrorLog(aSQL:string);
    procedure SetDBConnected(const Value: Boolean);
    procedure SetDBConnected1(const Value: Boolean);
    procedure SetDBConnectedTest(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Function ProcessExecSQL(aSql:String): Boolean;
    Function AdoRelayConnected(aDataBaseType,aServerIP,aServerPort,aUserID,aUserPw,aDataBaseName:string):Boolean;
    Function AdoRelay1Connected(aDataBaseType,aServerIP,aServerPort,aUserID,aUserPw,aDataBaseName:string):Boolean;
    Function AdoRelayTESTConnected(aDataBaseType,aServerIP,aServerPort,aUserID,aUserPw,aDataBaseName:string):Boolean;
    Function AdoRelayConnectTEST(aConnectString:string):Boolean;
  public
    property DBConnected :Boolean read FDBConnected  write SetDBConnected;
    property DBConnected1 :Boolean read FDBConnected1  write SetDBConnected1;
    property DBConnectedTest :Boolean read FDBConnectedTest  write SetDBConnectedTest;
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
    property OnAdoConnected1:      TAdoConnectedEvent read FOnAdoConnected1       write FOnAdoConnected1;
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
  end else if aDataBaseType = '5' then  //Oracle
  begin
    //conStr := 'Provider=OraOLEDB.Oracle;';
    //conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SID=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SERVICE_NAME=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    conStr := constr + 'User Id='+ aUserID + ';';
    conStr := constr + 'Password=' + aUserPw + '';
  end else if aDataBaseType = '6' then  //Tibero
  begin
    constr := 'Provider=MSDASQL.1;';
    conStr := conStr + 'User ID=' + aUserID + ';';
    conStr := conStr + 'Password=' + aUserPw + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Data Source=' + aServerIP + ';';

(*//    conStr := 'Provider=tbprov.Tbprov;Location=165.132.16.80,8629;User ID=yonsei_kt;Password=yonsei_kt;';
//    conStr := 'Provider=tbprov.Tbprov;';
    conStr := 'Provider=tbprov.Tbprov.5;';
    //stConnectString := 'Provider=tbprov.Tbprov.1;';
    conStr := conStr + 'Cache Authentication=False;';
    conStr := conStr + 'Encrypt Password=False;';
    conStr := conStr + 'Integrated Security="";';
    conStr := conStr + 'Mask Password=False;';
    conStr := conStr + 'Persist Encrypted=False;';
    conStr := conStr + 'Persist Security Info=False;';
    conStr := conStr + 'User ID=' + aUserID + ';';
    conStr := conStr + 'Password=' + aUserPw + ';';
    conStr := conStr + 'Bind Flags=0;';
    conStr := conStr + 'Initial Catalog=' + aDataBaseName + ';';
    conStr := conStr + 'Data Source=' + aServerIP + ';';
    conStr := conStr + 'Impersonation Level=Anonymous;';
    conStr := conStr + 'Location="";';
    conStr := conStr + 'Lock Owner="";';
    conStr := conStr + 'Mode=ReadWrite;';
    conStr := conStr + 'Protection Level=None;';
    conStr := conStr + 'Extended Properties="";';
    conStr := conStr + 'Updatable Cursor=False;';
    conStr := conStr + 'Enlist=None'; *)
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

  with ADOConnection do
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
  DBConnected := True;
  result := True;
end;

function TdmAdoRelay.ProcessExecSQL(aSql: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  Try
    OleInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
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
  ADOQuery1.Connection := ADOConnection;
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

procedure TdmAdoRelay.SetDBConnected1(const Value: Boolean);
begin
  if FDBConnected1 = Value then Exit;
  FDBConnected1 := Value;
  if Assigned(FOnAdoConnected) then
  begin
    OnAdoConnected1(Self,Value);
  end;
end;

function TdmAdoRelay.AdoRelay1Connected(aDataBaseType, aServerIP,
  aServerPort, aUserID, aUserPw, aDataBaseName: string): Boolean;
var
  conStr : string;
begin
  result := False;
  DBConnected1 := False;
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
  end else if aDataBaseType = '5' then  //Oracle
  begin
    //conStr := 'Provider=OraOLEDB.Oracle;';
    //conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SID=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SERVICE_NAME=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    conStr := constr + 'User Id='+ aUserID + ';';
    conStr := constr + 'Password=' + aUserPw + '';
  end else if aDataBaseType = '6' then  //Tibero
  begin
    constr := 'Provider=MSDASQL.1;';
    conStr := conStr + 'User ID=' + aUserID + ';';
    conStr := conStr + 'Password=' + aUserPw + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Data Source=' + aServerIP + ';';

(*//    conStr := 'Provider=tbprov.Tbprov;Location=165.132.16.80,8629;User ID=yonsei_kt;Password=yonsei_kt;';
//    conStr := 'Provider=tbprov.Tbprov;';
    conStr := 'Provider=tbprov.Tbprov.5;';
    //stConnectString := 'Provider=tbprov.Tbprov.1;';
    conStr := conStr + 'Cache Authentication=False;';
    conStr := conStr + 'Encrypt Password=False;';
    conStr := conStr + 'Integrated Security="";';
    conStr := conStr + 'Mask Password=False;';
    conStr := conStr + 'Persist Encrypted=False;';
    conStr := conStr + 'Persist Security Info=False;';
    conStr := conStr + 'User ID=' + aUserID + ';';
    conStr := conStr + 'Password=' + aUserPw + ';';
    conStr := conStr + 'Bind Flags=0;';
    conStr := conStr + 'Initial Catalog=' + aDataBaseName + ';';
    conStr := conStr + 'Data Source=' + aServerIP + ';';
    conStr := conStr + 'Impersonation Level=Anonymous;';
    conStr := conStr + 'Location="";';
    conStr := conStr + 'Lock Owner="";';
    conStr := conStr + 'Mode=ReadWrite;';
    conStr := conStr + 'Protection Level=None;';
    conStr := conStr + 'Extended Properties="";';
    conStr := conStr + 'Updatable Cursor=False;';
    conStr := conStr + 'Enlist=None'; *)
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

  with ADOConnection1 do
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
  DBConnected1 := True;
  result := True;
end;

function TdmAdoRelay.AdoRelayConnectTEST(aConnectString: string): Boolean;
begin
  result := False;
  with ADOConnection do
  begin
    Connected := False;
    ConnectionString := aConnectString;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : Exception do
        begin
          SQLErrorLog('DBError('+ E.Message + ')' + aConnectString );
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
  end;
  result := True;
end;

function TdmAdoRelay.AdoRelayTESTConnected(aDataBaseType, aServerIP,
  aServerPort, aUserID, aUserPw, aDataBaseName: string): Boolean;
var
  conStr : string;
begin
  result := False;
  DBConnectedTest := False;
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
    conStr := 'Provider=MSDAORA.1;';
    conStr := constr + 'Password=' + aUserPw + ';';
    conStr := constr + 'User ID='+ aUserID + ';';
    conStr := constr + 'Data Source=' + aDataBaseName + ';';
    conStr := constr + 'Persist Security Info=False';   
  end else if aDataBaseType = '5' then  //Oracle
  begin
    conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SERVICE_NAME=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    conStr := constr + 'User Id='+ aUserID + ';';
    conStr := constr + 'Password=' + aUserPw + '';
  end else if aDataBaseType = '6' then  //Tibero
  begin
    constr := 'Provider=MSDASQL.1;';
    conStr := conStr + 'User ID=' + aUserID + ';';
    conStr := conStr + 'Password=' + aUserPw + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Data Source=' + aServerIP + ';';

  end else if aDataBaseType = '0' then   //MDB
  begin

  end else
  begin
    //showmessage('DB Type 이 정확하지 않습니다.');
    Exit;
  end;

  with ADOConnectionTEST do
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
  DBConnectedTest := True;
  result := True;
end;

procedure TdmAdoRelay.SetDBConnectedTest(const Value: Boolean);
begin
  FDBConnectedTest := Value;
end;

end.
