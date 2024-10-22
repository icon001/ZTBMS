unit udmAdoRelay;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX,Dialogs;

type
  TdmAdoRelay = class(TDataModule)
    ADOConnection: TADOConnection;
    RelayExeQuery: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOConnection2: TADOConnection;
    ADOQuery2: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    Function ProcessExecSQL(aSql:String): Boolean;
    Function AdoRelayConnected(aDataBaseType,aServerIP,aServerPort,aUserID,aUserPw,aDataBaseName:string):Boolean;
    Function AdoRelayConnected2(aDataBaseType,aServerIP,aServerPort,aUserID,aUserPw,aDataBaseName:string):Boolean;
  end;

var
  dmAdoRelay: TdmAdoRelay;
  G_nRelayDataBaseType : integer;
  G_stRelayServerIP:string;
  G_stRelayServerPort:string;
  G_stRelayUserID : string;
  G_stRelayUserPW : string;
  G_stRelayDataBaseName : string;

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
    //conStr := constr + 'User Id='+ aUserID + ';';
    //conStr := constr + 'Password=' + aUserPw + '';

    //conStr := 'Provider=MSDAORA.1;';
    conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := constr + 'Password=' + aUserPw + ';';
    conStr := constr + 'User ID='+ aUserID + ';';
    conStr := constr + 'Data Source=' + aDataBaseName + ';';
    conStr := constr + 'Persist Security Info=True';
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
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
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
  result := True;
end;

function TdmAdoRelay.AdoRelayConnected2(aDataBaseType, aServerIP,
  aServerPort, aUserID, aUserPw, aDataBaseName: string): Boolean;
var
  conStr : string;
begin
  result := False;
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
    conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := constr + 'Password=' + aUserPw + ';';
    conStr := constr + 'User ID='+ aUserID + ';';
    conStr := constr + 'Data Source=' + aDataBaseName + ';';
    conStr := constr + 'Persist Security Info=True';
  end else if aDataBaseType = '0' then   //MDB
  begin
  end else
  begin
    Exit;
  end;

  with ADOConnection2 do
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
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
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
  //        ADOConnection.Connected := False;
  //        ADOConnection.Connected := True;
  //        SQLErrorLog('DBError:'+ SQL.Text);
          //ADOConnection.RollbackTrans;
          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.Free;
    OleUninitialize;
  End;
  Result:= True;
end;

end.
