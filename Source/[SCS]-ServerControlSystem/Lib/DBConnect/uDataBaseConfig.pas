unit uDataBaseConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls,iniFiles,DB, ComCtrls,ADOdb,
  FolderDialog;

type
  TDataBaseConfig = class(TComponent)
  private
    FDBConnected: Boolean;
    FCancel: Boolean;
    class function FindSelf:TComponent;
    procedure SetDBConnected(const Value: Boolean);
    procedure SetCancel(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Procedure ShowDataBaseConfig;
    Function DataBaseConnect:Boolean;
    procedure TableVersionCheck;
    function Table1VersionMake: Boolean;
    function Table2VersionMake: Boolean;
    function Table3VersionMake: Boolean;
    function Table4VersionMake: Boolean;
    function Table5VersionMake: Boolean;
    function Table6VersionMake: Boolean;
    function Table7VersionMake: Boolean;
    function Table8VersionMake: Boolean;
    function Table9VersionMake: Boolean;
    function Table10VersionMake: Boolean;
    function Table11VersionMake: Boolean;
    function Table12VersionMake: Boolean;
    function Table13VersionMake: Boolean;
    function Table14VersionMake: Boolean;
    function Table15VersionMake: Boolean;
    function Table16VersionMake: Boolean;
    function Table17VersionMake: Boolean;
    function Table18VersionMake: Boolean;
    function Table19VersionMake: Boolean;
    function Table20VersionMake: Boolean;
    function Table21VersionMake: Boolean;
    function Table22VersionMake: Boolean;
    function Table23VersionMake: Boolean;
    function Table24VersionMake: Boolean;
    function Table25VersionMake: Boolean;
    function Table26VersionMake: Boolean;
    function Table27VersionMake: Boolean;
    function Table28VersionMake: Boolean;
    function Table29VersionMake: Boolean;
    function Table30VersionMake: Boolean;
    function Table31VersionMake: Boolean;
    function Table32VersionMake: Boolean;
    function Table33VersionMake: Boolean;
    function Table34VersionMake: Boolean;
    function Table35VersionMake: Boolean;
    function Table36VersionMake: Boolean;
    function Table37VersionMake: Boolean;
    function Table38VersionMake: Boolean;
    function Table39VersionMake: Boolean;
    function Table40VersionMake: Boolean;
    function Table41VersionMake: Boolean;
    function Table42VersionMake: Boolean;
    function Table43VersionMake: Boolean;
    function Table44VersionMake: Boolean;
    function Table45VersionMake: Boolean;
    function Table46VersionMake: Boolean;
    function Table47VersionMake: Boolean;
    function Table48VersionMake: Boolean;
    function Table49VersionMake: Boolean;
    function Table50VersionMake: Boolean;
    function Table51VersionMake: Boolean;
    function Table52VersionMake: Boolean;
    function Table53VersionMake: Boolean;
    function Table54VersionMake: Boolean;
    function Table55VersionMake: Boolean;
    function Table56VersionMake: Boolean;
    function Table57VersionMake: Boolean;
    function Table58VersionMake: Boolean;
    function Table59VersionMake: Boolean;
    function Table60VersionMake: Boolean;
    function Table61VersionMake: Boolean;
    function PositionNumberValueSetting:Boolean;
    Function UpdateTB_CARDPoitionNum(aGroupCode,aCardNo:string;aPositionNumber:integer):Boolean;
    function GetVersion:integer;
    function CheckPersonRelay : string;
    function CheckSamyuk : Boolean;
    function CheckFdms : Boolean;
    class Function GetObject:TDataBaseConfig;   //자기자신을 찾는것  class 는 폼생성전에도 사용가능
  Published
    { Published declarations }
    Property Cancel:Boolean read FCancel write SetCancel;
    Property DBConnected : Boolean read FDBConnected write SetDBConnected;
  end;

  TfmDataBaseConfig = class(TForm)
    sbSave: TSpeedButton;
    sbCancel: TSpeedButton;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    rg_DBType1: TRadioGroup;
    pn_Mssql1: TPanel;
    Label1: TLabel;
    edServerIP1: TEdit;
    Label2: TLabel;
    edServerPort1: TEdit;
    Label3: TLabel;
    edUserid1: TEdit;
    Label4: TLabel;
    edPasswd1: TEdit;
    Label5: TLabel;
    edDataBaseName1: TEdit;
    pn_Mssql2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edServerIP2: TEdit;
    edServerPort2: TEdit;
    edUserid2: TEdit;
    edPasswd2: TEdit;
    edDataBaseName2: TEdit;
    rg_DBType2: TRadioGroup;
    pn_Mssql3: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edServerIP3: TEdit;
    edServerPort3: TEdit;
    edUserid3: TEdit;
    edPasswd3: TEdit;
    edDataBaseName3: TEdit;
    rg_DBType3: TRadioGroup;
    OpenDialog1: TOpenDialog;
    chk_Copy: TCheckBox;
    pn_MDB1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    ed_mdbPass1: TEdit;
    ed_MdbName1: TEdit;
    btn_File1: TButton;
    pn_MDB2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    ed_mdbPass2: TEdit;
    ed_MdbName2: TEdit;
    btn_File2: TButton;
    pn_MDB3: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    ed_mdbPass3: TEdit;
    ed_MdbName3: TEdit;
    btn_File3: TButton;
    FolderDialog1: TFolderDialog;
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure edServerIP1KeyPress(Sender: TObject; var Key: Char);
    procedure edServerPort1KeyPress(Sender: TObject; var Key: Char);
    procedure edUserid1KeyPress(Sender: TObject; var Key: Char);
    procedure edPasswd1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure edServerIP1Enter(Sender: TObject);
    procedure edServerPort1Enter(Sender: TObject);
    procedure ed(Sender: TObject);
    procedure edPasswd1Enter(Sender: TObject);
    procedure edDataBaseName1KeyPress(Sender: TObject; var Key: Char);
    procedure edDataBaseName1Enter(Sender: TObject);
    procedure btn_File1Click(Sender: TObject);
    procedure rg_DBType1Click(Sender: TObject);
    procedure rg_DBType2Click(Sender: TObject);
    procedure rg_DBType3Click(Sender: TObject);
    procedure chk_CopyClick(Sender: TObject);
    procedure edDataBaseName1Exit(Sender: TObject);
    procedure edPasswd1Exit(Sender: TObject);
    procedure edUserid1Exit(Sender: TObject);
    procedure edServerPort1Exit(Sender: TObject);
    procedure edServerIP1Exit(Sender: TObject);
  private
    { Private declarations }
    function SaveLOMOSMSSQL(aType:string):Boolean;
    function SaveLOMOSMDB:Boolean;
    function SaveEVENTMSSQL:Boolean;
    function SaveEVENTMDB:Boolean;
    function SaveLOGMSSQL:Boolean;
    function SaveLOGMDB:Boolean;
  public
    { Public declarations }
  end;

var
  fmDataBaseConfig: TfmDataBaseConfig;

implementation

uses
  uDataModule1,
  DIMime,
  uCommonSql,
  uMDBSql,
  uPostGreSql,
  uMSSQL,
  uFireBird;

{$R *.dfm}

procedure TfmDataBaseConfig.sbCancelClick(Sender: TObject);
begin
  TDataBaseConfig.GetObject.Cancel := True;
  Close;
end;

{ TDataBaseConfig }

function TDataBaseConfig.CheckFdms: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''fdmsUSE'' ';
  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    Try
      if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then result := True;
    Except
      Exit;
    End;
  end;
end;

function TDataBaseConfig.CheckPersonRelay: string;
var
  stSql : string;
begin
  result := '0';
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''PER_RELAY'' ';
  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    Try
      result := FindField('CO_CONFIGVALUE').AsString;
    Except
      Exit;
    End;
  end;
end;

function TDataBaseConfig.CheckSamyuk: Boolean;
var
  stSql : string;
begin
  result := False;
  if CheckPersonRelay = '1' then result := True;  //삼육대연동이면 True
end;

Function TDataBaseConfig.DataBaseConnect:Boolean;
var
  conStr : wideString;
  stHost : String;
  stPort : String;
  stuserID : String;
  stuserPW : String;
  stpsqlOdbcSetup : String;
  ini_fun : TiniFile;
  stExeFolder : String;
  stDBPath : string;
begin
    if DBConnected then Exit;
    result := False;
    CanCel := False;

    stExeFolder  := ExtractFileDir(Application.ExeName);
  Try
    ini_fun := TiniFile.Create(stExeFolder + '\Zmos.INI');

    stHost  := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    stPort := ini_fun.ReadString('DBConfig','Port','1433');
    stuserID := ini_fun.ReadString('DBConfig','UserID','sa');
    stuserPW := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW',''));  //saPasswd
    DBName := lowerCase(ini_fun.ReadString('DBConfig','DBNAME',''));
    stDBPath := ini_fun.ReadString('DBConfig','DBPATH',stExeFolder + '/../DB');
    GROUPCODE := ini_fun.ReadString('COMPANY','GROUPCODE','1234567890');
    DBType := UpperCase(ini_fun.ReadString('DBConfig','TYPE','MSSQL'));
    DBServer := stHost;
    DBUser := stuserID;
    DBUserPw := stuserPW;
    DBPort := stPort;
    stpsqlOdbcSetup := UpperCase(ini_fun.ReadString('DBConfig','psqlodbcsetup','FALSE'));
    conStr := '';
    if UpperCase(DBType) = 'MSSQL' then
    begin
      conStr := constr + 'Provider=SQLOLEDB.1;';
      conStr := constr + 'Password=' + stuserPW + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID=' + stuserID + ';';
      conStr := constr + 'Initial Catalog=' + DBName + ';';
      conStr := constr + 'Data Source=' + stHost  + ',' + stPort;
    end else if UpperCase(DBType) = 'PG' then
    begin
//      conStr := 'Provider=PostgreSQL.1;';
      //conStr := 'Provider=PSQLODBC35W;';
      if stpsqlOdbcSetup = 'TRUE' then
      begin
        conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
        conStr := conStr + 'Extended Properties="DSN=PostgreSQL35W;DATABASE=' + DBName + ';';
        conStr := conStr + 'SERVER=' + stHost + ';PORT=5432;UID='+ stuserID + ';PWD=' + stuserPW + ';SSLmode=disable;';
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
        conStr := constr + 'Data Source=' + stHost + ';'   ;
        conStr := constr + 'location=' + DBName + ';';
        conStr := constr + 'User Id='+ stuserID + ';';
        conStr := constr + 'password=' + stuserPW;
      end;

{      conStr := 'Provider=PGNP.1;';
      conStr := constr + 'password=' + stuserPW + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User Id='+ stuserID + ';';
      conStr := constr + 'Data Source=' + stHost + ';'   ;
      conStr := constr + 'Extended Properties="SSL=allow;"';  }
    end else if UpperCase(DBType) = 'MDB' then
    begin
      //if DBName = '' then
      DBName := stDBPath + '\ZMOS.mdb';
      conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      conStr := conStr + 'Data Source=' + DBName + ';';
      conStr := conStr + 'Persist Security Info=True;';
      conStr := conStr + 'Jet OLEDB:Database ';
      //if stuserPW <> '' then  conStr := conStr + ' Password=' + stuserPW;
    end else if UpperCase(DBType) = 'FB' then
    begin
      conStr := 'Provider=MSDASQL;';
      conStr := conStr + 'DRIVER=Firebird/InterBase(r) driver;';
      conStr := constr + 'UID=' + stuserID + ';';
      conStr := constr + 'PWD=' + stuserPW + ';';
      conStr := constr + 'Auto Commit=true;';
      conStr := constr + 'DBNAME=' + stHost + ':' + DBName;
    end else
    begin
      showmessage('DB Type 이 정확하지 않습니다.');
      Exit;
    end;

    with DataModule1.ADOConnection do
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
      //CursorLocation := clUseClient;
    end;

    stHost  := ini_fun.ReadString('EVENTDBConfig','Host','127.0.0.1');
    stPort := ini_fun.ReadString('EVENTDBConfig','Port','1433');
    stuserID := ini_fun.ReadString('EVENTDBConfig','UserID','sa');
    stuserPW := MimeDecodeString(ini_fun.ReadString('EVENTDBConfig','UserPW',''));  //saPasswd
    DBName := lowerCase(ini_fun.ReadString('EVENTDBConfig','DBNAME',''));
    conStr := '';
    if UpperCase(DBType) = 'MSSQL' then
    begin
      conStr := constr + 'Provider=SQLOLEDB.1;';
      conStr := constr + 'Password=' + stuserPW + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID=' + stuserID + ';';
      conStr := constr + 'Initial Catalog=' + DBName + ';';
      conStr := constr + 'Data Source=' + stHost  + ',' + stPort;
    end else if UpperCase(DBType) = 'PG' then
    begin
      if stpsqlOdbcSetup = 'TRUE' then
      begin
        conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
        conStr := conStr + 'Extended Properties="DSN=PostgreSQL35W;DATABASE=' + DBName + ';';
        conStr := conStr + 'SERVER=' + stHost + ';PORT=5432;UID='+ stuserID + ';PWD=' + stuserPW + ';SSLmode=disable;';
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
        conStr := constr + 'Data Source=' + stHost + ';'   ;
        conStr := constr + 'location=' + DBName + ';';
        conStr := constr + 'User Id='+ stuserID + ';';
        conStr := constr + 'password=' + stuserPW;
      end;
    end else if UpperCase(DBType) = 'MDB' then
    begin
      //if DBName = '' then
      //DBName := stExeFolder + '\..\DB\ZEVENT.mdb';
      DBName := stDBPath + '\ZEVENT.mdb';
      conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      conStr := conStr + 'Data Source=' + DBName + ';';
      conStr := conStr + 'Persist Security Info=True;';
      conStr := conStr + 'Jet OLEDB:Database ';
      //if stuserPW <> '' then  conStr := conStr + ' Password=' + stuserPW;
    end else if UpperCase(DBType) = 'FB' then
    begin
      conStr := 'Provider=MSDASQL;';
      conStr := conStr + 'DRIVER=Firebird/InterBase(r) driver;';
      conStr := constr + 'UID=' + stuserID + ';';
      conStr := constr + 'PWD=' + stuserPW + ';';
      conStr := constr + 'Auto Commit=true;';
      conStr := constr + 'DBNAME=' + stHost + ':' + DBName;
    end else
    begin
      showmessage('DB Type 이 정확하지 않습니다.');
      Exit;
    end;

    with DataModule1.ADOConnectionEVENT do
    begin
      Connected := False;
      ConnectionString := conStr;
      Try
        LoginPrompt:= false ;
        Connected := True;
      Except
        on E : EDatabaseError do
          begin
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
      //CursorLocation := clUseClient;
    end;

    stHost  := ini_fun.ReadString('LOGDBConfig','Host','127.0.0.1');
    stPort := ini_fun.ReadString('LOGDBConfig','Port','1433');
    stuserID := ini_fun.ReadString('LOGDBConfig','UserID','sa');
    stuserPW := MimeDecodeString(ini_fun.ReadString('LOGDBConfig','UserPW',''));  //saPasswd
    DBName := lowerCase(ini_fun.ReadString('LOGDBConfig','DBNAME',''));
    //DBType := UpperCase(ini_fun.ReadString('LOGDBConfig','TYPE','MSSQL'));
    conStr := '';
    if UpperCase(DBType) = 'MSSQL' then
    begin
      conStr := constr + 'Provider=SQLOLEDB.1;';
      conStr := constr + 'Password=' + stuserPW + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID=' + stuserID + ';';
      conStr := constr + 'Initial Catalog=' + DBName + ';';
      conStr := constr + 'Data Source=' + stHost  + ',' + stPort;
    end else if UpperCase(DBType) = 'PG' then
    begin
      if stpsqlOdbcSetup = 'TRUE' then
      begin
        conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
        conStr := conStr + 'Extended Properties="DSN=PostgreSQL35W;DATABASE=' + DBName + ';';
        conStr := conStr + 'SERVER=' + stHost + ';PORT=5432;UID='+ stuserID + ';PWD=' + stuserPW + ';SSLmode=disable;';
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
        conStr := constr + 'Data Source=' + stHost + ';'   ;
        conStr := constr + 'location=' + DBName + ';';
        conStr := constr + 'User Id='+ stuserID + ';';
        conStr := constr + 'password=' + stuserPW;
      end;
    end else if UpperCase(DBType) = 'MDB' then
    begin
      //if DBName = '' then
      //DBName := stExeFolder + '\..\DB\ZLOG.mdb';
      DBName := stDBPath + '\ZLOG.mdb';
      conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      conStr := conStr + 'Data Source=' + DBName + ';';
      conStr := conStr + 'Persist Security Info=True;';
      conStr := conStr + 'Jet OLEDB:Database ';
      //if stuserPW <> '' then  conStr := conStr + ' Password=' + stuserPW;
    end else if UpperCase(DBType) = 'FB' then
    begin
      conStr := 'Provider=MSDASQL;';
      conStr := conStr + 'DRIVER=Firebird/InterBase(r) driver;';
      conStr := constr + 'UID=' + stuserID + ';';
      conStr := constr + 'PWD=' + stuserPW + ';';
      conStr := constr + 'Auto Commit=true;';
      conStr := constr + 'DBNAME=' + stHost + ':' + DBName;
    end else
    begin
      showmessage('DB Type 이 정확하지 않습니다.');
      Exit;
    end;

    with DataModule1.ADOConnectionLOG do
    begin
      Connected := False;
      ConnectionString := conStr;
      Try
        LoginPrompt:= false ;
        Connected := True;
      Except
        on E : EDatabaseError do
          begin
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
      //CursorLocation := clUseClient;
    end;
    TableVersionCheck;

    DBConnected := True;
    result := True;

  Finally
    ini_fun.free;
  End;
end;

class function TDataBaseConfig.FindSelf: TComponent;
var
  Loop:Integer;
begin
  Result:=Nil;
  for Loop:=0 to Application.ComponentCount-1 do begin
      if Application.Components[Loop] is TDataBaseConfig then begin
          Result:= Application.Components[Loop];
          Break;
      end;
  end;
end;

class function TDataBaseConfig.GetObject: TDataBaseConfig;
begin
   If FindSelf = Nil then TDataBaseConfig.Create(Application);
   Result := TDataBaseConfig(FindSelf);
end;

function TDataBaseConfig.GetVersion: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''TABLE_VER'' ';
  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    Try
      result := strtoint(FindField('CO_CONFIGVALUE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TDataBaseConfig.PositionNumberValueSetting: Boolean;
var
  stSql : string;
  nPositionNumber : integer;
begin
  stSql := 'Select * from TB_CARD ';
  nPositionNumber := 1;

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    While Not Eof do
    begin
      UpdateTB_CARDPoitionNum(FindField('GROUP_CODE').AsString,FindField('CA_CARDNO').AsString,nPositionNumber);
      inc(nPositionNumber);
      Next;
    end;
  end;


end;

procedure TDataBaseConfig.SetCancel(const Value: Boolean);
begin
  FCancel := Value;
end;

procedure TDataBaseConfig.SetDBConnected(const Value: Boolean);
begin
  FDBConnected := Value;
end;

procedure TDataBaseConfig.ShowDataBaseConfig;
begin
  FDBConnected := False;

  fmDataBaseConfig:=TfmDataBaseConfig.Create(Nil);
  Try
    fmDataBaseConfig.ShowModal;
  Finally
    fmDataBaseConfig.Free;
  End;
end;

procedure TfmDataBaseConfig.sbSaveClick(Sender: TObject);
var
  bResult : Boolean;
begin
  if rg_DBType1.ItemIndex = 0 then
  begin
    chk_CopyClick(self);
    bResult := SaveLOMOSMSSQL('MSSQL');
  end else
  if rg_DBType1.ItemIndex = 1 then
  begin
    chk_CopyClick(self);
    bResult := SaveLOMOSMSSQL('PG');
  end else
  if rg_DBType1.ItemIndex = 3 then
  begin
    chk_CopyClick(self);
    bResult := SaveLOMOSMSSQL('FB');
  end else
  begin
    bResult := SaveLOMOSMDB;
  end;
  if Not bResult then Exit;

  if rg_DBType1.ItemIndex = 0 then
  begin
    bResult := SaveEVENTMSSQL;
  end else
  if rg_DBType1.ItemIndex = 1 then
  begin
    bResult := SaveEVENTMSSQL;
  end else
  if rg_DBType1.ItemIndex = 3 then
  begin
    bResult := SaveEVENTMSSQL;
  end else
  begin
    bResult := SaveEVENTMDB;
  end;
  if Not bResult then Exit;

  if rg_DBType1.ItemIndex = 0 then
  begin
    bResult := SaveLOGMSSQL;
  end else
  if rg_DBType1.ItemIndex = 1 then
  begin
    bResult := SaveLOGMSSQL;
  end else
  if rg_DBType1.ItemIndex = 3 then
  begin
    bResult := SaveLOGMSSQL;
  end else
  begin
    bResult := SaveLOGMDB;
  end;
  if Not bResult then Exit;


  TDataBaseConfig.GetObject.DataBaseConnect;
  Close;
end;

procedure TfmDataBaseConfig.edServerIP1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    edServerPort1.SetFocus;
  end  else
  begin
    if chk_Copy.Checked then
    begin
      edServerIP2.Text := edServerIP1.Text;
      edServerIP3.Text := edServerIP1.Text;
    end;
  end;
end;

procedure TfmDataBaseConfig.edServerPort1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    edUserID1.SetFocus;
  end else
  begin
    if chk_Copy.Checked then
    begin
      edServerPort2.Text := edServerPort1.Text;
      edServerPort3.Text := edServerPort1.Text;
    end;
  end;

end;

procedure TfmDataBaseConfig.edUserid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    edPasswd1.SetFocus;
  end else
  begin
    if chk_Copy.Checked then
    begin
      edUserid2.Text := edUserid1.Text;
      edUserid3.Text := edUserid1.Text;
    end;
  end;

end;

procedure TfmDataBaseConfig.edPasswd1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    edDataBaseName1.SetFocus;
  end else
  begin
    if chk_Copy.Checked then
    begin
      edPasswd2.Text := edPasswd1.Text;
      edPasswd3.Text := edPasswd1.Text;
    end;
  end;

end;

procedure TfmDataBaseConfig.FormActivate(Sender: TObject);
var
  ini_fun : TiniFile;
  stExeFolder : string;
  stDBType : string;
begin
  StatusBar1.Panels[0].Text := 'DB 환경설정이 잘못되었습니다. 재설정하시기 바랍니다.';

  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Zmos.INI');

  stDBType := ini_fun.ReadString('DBConfig','Type','MSSQL');
  if UpperCase(stDBType) = 'MSSQL' then
  begin
    rg_DBType1.ItemIndex := 0;
    edServerIP1.Text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    edServerPort1.Text := ini_fun.ReadString('DBConfig','Port','1433');
    edUserID1.Text := ini_fun.ReadString('DBConfig','UserID','sa');
    edPasswd1.Text := MimeDEcodeString(ini_fun.ReadString('DBConfig','UserPW','sapasswd'));
    edDataBaseName1.Text := ini_fun.ReadString('DBConfig','DBNAME','ZMOS');

    edServerIP2.Text := ini_fun.ReadString('EVENTDBConfig','Host','127.0.0.1');
    edServerPort2.Text := ini_fun.ReadString('EVENTDBConfig','Port','1433');
    edUserID2.Text := ini_fun.ReadString('EVENTDBConfig','UserID','sa');
    edPasswd2.Text := MimeDEcodeString(ini_fun.ReadString('EVENTDBConfig','UserPW','sapasswd'));
    edDataBaseName2.Text := ini_fun.ReadString('EVENTDBConfig','DBNAME','ZMOS');

    edServerIP3.Text := ini_fun.ReadString('LOGDBConfig','Host','127.0.0.1');
    edServerPort3.Text := ini_fun.ReadString('LOGDBConfig','Port','1433');
    edUserID3.Text := ini_fun.ReadString('LOGDBConfig','UserID','sa');
    edPasswd3.Text := MimeDEcodeString(ini_fun.ReadString('LOGDBConfig','UserPW','sapasswd'));
    edDataBaseName3.Text := ini_fun.ReadString('LOGDBConfig','DBNAME','ZMOS');
  end else
  if UpperCase(stDBType) = 'PG' then
  begin
    rg_DBType1.ItemIndex := 1;
    edServerIP1.Text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    edServerPort1.Text := ini_fun.ReadString('DBConfig','Port','5432');
    edUserID1.Text := ini_fun.ReadString('DBConfig','UserID','postgres');
    edPasswd1.Text := MimeDEcodeString(ini_fun.ReadString('DBConfig','UserPW','1'));
    edDataBaseName1.Text := ini_fun.ReadString('DBConfig','DBNAME','ZMOS');

    edServerIP2.Text := ini_fun.ReadString('EVENTDBConfig','Host','127.0.0.1');
    edServerPort2.Text := ini_fun.ReadString('EVENTDBConfig','Port','5432');
    edUserID2.Text := ini_fun.ReadString('EVENTDBConfig','UserID','postgres');
    edPasswd2.Text := MimeDEcodeString(ini_fun.ReadString('EVENTDBConfig','UserPW','1'));
    edDataBaseName2.Text := ini_fun.ReadString('EVENTDBConfig','DBNAME','ZMOS');

    edServerIP3.Text := ini_fun.ReadString('LOGDBConfig','Host','127.0.0.1');
    edServerPort3.Text := ini_fun.ReadString('LOGDBConfig','Port','5432');
    edUserID3.Text := ini_fun.ReadString('LOGDBConfig','UserID','postgres');
    edPasswd3.Text := MimeDEcodeString(ini_fun.ReadString('LOGDBConfig','UserPW','1'));
    edDataBaseName3.Text := ini_fun.ReadString('LOGDBConfig','DBNAME','ZMOS');
  end else
  if UpperCase(stDBType) = 'FB' then
  begin
    rg_DBType1.ItemIndex := 3;
    edServerIP1.Text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    edServerPort1.Text := ini_fun.ReadString('DBConfig','Port','1433');
    edUserID1.Text := ini_fun.ReadString('DBConfig','UserID','SYSDBA');
    edPasswd1.Text := MimeDEcodeString(ini_fun.ReadString('DBConfig','UserPW','masterkey'));
    edDataBaseName1.Text := ini_fun.ReadString('DBConfig','DBNAME','ZMOS');

    edServerIP2.Text := ini_fun.ReadString('EVENTDBConfig','Host','127.0.0.1');
    edServerPort2.Text := ini_fun.ReadString('EVENTDBConfig','Port','1433');
    edUserID2.Text := ini_fun.ReadString('EVENTDBConfig','UserID','SYSDBA');
    edPasswd2.Text := MimeDEcodeString(ini_fun.ReadString('EVENTDBConfig','UserPW','masterkey'));
    edDataBaseName2.Text := ini_fun.ReadString('EVENTDBConfig','DBNAME','ZMOS');

    edServerIP3.Text := ini_fun.ReadString('LOGDBConfig','Host','127.0.0.1');
    edServerPort3.Text := ini_fun.ReadString('LOGDBConfig','Port','1433');
    edUserID3.Text := ini_fun.ReadString('LOGDBConfig','UserID','SYSDBA');
    edPasswd3.Text := MimeDEcodeString(ini_fun.ReadString('LOGDBConfig','UserPW','masterkey'));
    edDataBaseName3.Text := ini_fun.ReadString('LOGDBConfig','DBNAME','ZMOS');
  end else
  begin
    rg_DBType1.ItemIndex := 2;
    ed_mdbPass1.Text := ini_fun.ReadString('DBConfig','UserPW','');
    ed_MdbName1.Text := ini_fun.ReadString('DBConfig','DBPATH','');

    ed_mdbPass2.Text := ini_fun.ReadString('EVENTDBConfig','UserPW','');
    ed_MdbName2.Text := ini_fun.ReadString('EVENTDBConfig','DBPATH','');

    ed_mdbPass3.Text := ini_fun.ReadString('LOGDBConfig','UserPW','');
    ed_MdbName3.Text := ini_fun.ReadString('LOGDBConfig','DBPATH','');
  end;
  ini_fun.free;

  PageControl1.ActivePageIndex := 0;

end;

procedure TfmDataBaseConfig.edServerIP1Enter(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'DB 서버의 IP를 입력하여 주세요.';
end;

procedure TfmDataBaseConfig.edServerPort1Enter(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'DB 서버의 Port를 입력하여 주세요. 기본포트는 1433 입니다.';
end;

procedure TfmDataBaseConfig.ed(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'DB 서버의 계정을 입력하여 주세요.';
end;

procedure TfmDataBaseConfig.edPasswd1Enter(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'DB 서버 계정의 비밀번호를 입력하여 주세요.';
end;

procedure TfmDataBaseConfig.edDataBaseName1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    sbSaveClick(Self);
  end else
  begin
    if chk_Copy.Checked then
    begin
      edDataBaseName2.Text := edDataBaseName1.Text;
      edDataBaseName3.Text := edDataBaseName1.Text;
    end;
  end;

end;

procedure TfmDataBaseConfig.edDataBaseName1Enter(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := '데이터베이스명을 입력하여 주세요.';

end;

procedure TfmDataBaseConfig.btn_File1Click(Sender: TObject);
begin
  FolderDialog1.Title := 'DB 폴더 찾기';
  //OpenDialog1.DefaultExt := 'MDB';
  //OpenDialog1.Filter := 'Access files (*.mdb)|*.MDB';
  if FolderDialog1.Execute then
  begin
    if Sender = btn_File1 then ed_MdbName1.Text := FolderDialog1.Directory;
    if Sender = btn_File2 then ed_MdbName2.Text := FolderDialog1.Directory;
    if Sender = btn_File3 then ed_MdbName3.Text := FolderDialog1.Directory;
  end;
end;

procedure TfmDataBaseConfig.rg_DBType1Click(Sender: TObject);
begin
  if rg_DBType1.ItemIndex = 0 then
  begin
    pn_Mssql1.Visible := True;
    pn_MDB1.Visible := False;
    pn_Mssql1.Align := alClient;
    pn_Mssql2.Visible := True;
    pn_MDB2.Visible := False;
    pn_Mssql2.Align := alClient;
    pn_Mssql3.Visible := True;
    pn_MDB3.Visible := False;
    pn_Mssql3.Align := alClient;
    Label2.Visible := True;
    edServerPort1.Visible := True;
  end else
  if rg_DBType1.ItemIndex = 1 then
  begin
    pn_Mssql1.Visible := True;
    pn_MDB1.Visible := False;
    pn_Mssql1.Align := alClient;
    pn_Mssql2.Visible := True;
    pn_MDB2.Visible := False;
    pn_Mssql2.Align := alClient;
    pn_Mssql3.Visible := True;
    pn_MDB3.Visible := False;
    pn_Mssql3.Align := alClient;
    Label2.Visible := False;
    edServerPort1.Visible := False;
  end else
  begin
    pn_Mssql1.Visible := False;
    pn_MDB1.Visible := True;
    pn_MDB1.Align := alClient;
    pn_Mssql2.Visible := False;
    pn_MDB2.Visible := True;
    pn_MDB2.Align := alClient;
    pn_Mssql3.Visible := False;
    pn_MDB3.Visible := True;
    pn_MDB3.Align := alClient;
  end;
end;

function TfmDataBaseConfig.SaveLOMOSMSSQL(aType:string): Boolean;
var
  ini_fun : TiniFile;
  stExeFolder : String;
begin
  result := False;

  if edServerIP1.Text = '' then
  begin
    showmessage('서버IP가 비어 있습니다.');
    PageControl1.ActivePageIndex := 0;
    edServerIP1.SetFocus;
    Exit;
  End;

  if edServerPort1.Text = '' then
  begin
    showmessage('서버Port가 비어 있습니다.');
    PageControl1.ActivePageIndex := 0;
    edServerPort1.SetFocus;
    Exit;
  end;

  if edUserID1.Text = '' then
  begin
    showmessage('서버계정이 비어 있습니다.');
    PageControl1.ActivePageIndex := 0;
    edUserID1.SetFocus;
    Exit;
  end;

  if edPasswd1.Text = '' then
  begin
    showmessage('서버계정의 비밀번호가 비어 있습니다.');
    PageControl1.ActivePageIndex := 0;
    edPasswd1.SetFocus;
    Exit;
  end;

  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Zmos.INI');

  ini_fun.WriteString('DBConfig','TYPE',aType);
  ini_fun.WriteString('DBConfig','Host',Trim(edServerIP1.Text));
  ini_fun.WriteString('DBConfig','Port',Trim(edServerPort1.Text));
  ini_fun.WriteString('DBConfig','UserID',Trim(edUserID1.Text));
  ini_fun.WriteString('DBConfig','UserPW',MimeEncodeString(Trim(edPasswd1.Text)));
  ini_fun.WriteString('DBConfig','DBNAME',Trim(edDataBaseName1.Text));
  ini_fun.free;

  result := True;
end;

function TfmDataBaseConfig.SaveLOMOSMDB: Boolean;
var
  ini_fun : TiniFile;
  stExeFolder : String;
begin
  result := False;

  if ed_MdbName1.Text = '' then
  begin
    showmessage('DB 파일 위치를 확인하세요..');
    PageControl1.ActivePageIndex := 0;
    ed_MdbName1.SetFocus;
    Exit;
  End;

  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Zmos.INI');

  ini_fun.WriteString('DBConfig','TYPE','MDB');
  ini_fun.WriteString('DBConfig','UserPW',MimeEncodeString(Trim(ed_mdbPass1.Text)));
  ini_fun.WriteString('DBConfig','DBPATH',Trim(ed_MdbName1.Text));
  ini_fun.free;

  result := True;
end;

procedure TfmDataBaseConfig.rg_DBType2Click(Sender: TObject);
begin
  if rg_DBType2.ItemIndex = 0 then
  begin
    pn_Mssql2.Visible := True;
    pn_MDB2.Visible := False;
    pn_Mssql2.Align := alClient;
  end else
  begin
    pn_Mssql2.Visible := False;
    pn_MDB2.Visible := True;
    pn_MDB2.Align := alClient;
  end;
end;

procedure TfmDataBaseConfig.rg_DBType3Click(Sender: TObject);
begin
  if rg_DBType3.ItemIndex = 0 then
  begin
    pn_Mssql3.Visible := True;
    pn_MDB3.Visible := False;
    pn_Mssql3.Align := alClient;
  end else
  begin
    pn_Mssql3.Visible := False;
    pn_MDB3.Visible := True;
    pn_MDB3.Align := alClient;
  end;
end;

function TfmDataBaseConfig.SaveEVENTMDB: Boolean;
var
  ini_fun : TiniFile;
  stExeFolder : String;
begin
{  result := False;

  if ed_MdbName2.Text = '' then
  begin
    showmessage('DB 파일 위치를 확인하세요..');
    PageControl1.ActivePageIndex := 1;
    ed_MdbName2.SetFocus;
    Exit;
  End;

  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Zmos.INI');

  ini_fun.WriteString('EVENTDBConfig','TYPE','MDB');
  ini_fun.WriteString('EVENTDBConfig','UserPW',MimeEncodeString(Trim(ed_mdbPass2.Text)));
  ini_fun.WriteString('EVENTDBConfig','DBNAME',Trim(ed_MdbName2.Text));
  ini_fun.free;

  result := True;  }
end;

function TfmDataBaseConfig.SaveEVENTMSSQL: Boolean;
var
  ini_fun : TiniFile;
  stExeFolder : String;
begin
  result := False;

  if edServerIP2.Text = '' then
  begin
    showmessage('서버IP가 비어 있습니다.');
    PageControl1.ActivePageIndex := 1;
    edServerIP2.SetFocus;
    Exit;
  End;

  if edServerPort2.Text = '' then
  begin
    showmessage('서버Port가 비어 있습니다.');
    PageControl1.ActivePageIndex := 1;
    edServerPort2.SetFocus;
    Exit;
  end;

  if edUserID2.Text = '' then
  begin
    showmessage('서버계정이 비어 있습니다.');
    PageControl1.ActivePageIndex := 1;
    edUserID2.SetFocus;
    Exit;
  end;

  if edPasswd2.Text = '' then
  begin
    showmessage('서버계정의 비밀번호가 비어 있습니다.');
    PageControl1.ActivePageIndex := 1;
    edPasswd2.SetFocus;
    Exit;
  end;

  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Zmos.INI');

//  ini_fun.WriteString('DBConfig','TYPE','MSSQL');
  ini_fun.WriteString('EVENTDBConfig','Host',Trim(edServerIP2.Text));
  ini_fun.WriteString('EVENTDBConfig','Port',Trim(edServerPort2.Text));
  ini_fun.WriteString('EVENTDBConfig','UserID',Trim(edUserID2.Text));
  ini_fun.WriteString('EVENTDBConfig','UserPW',MimeEncodeString(Trim(edPasswd2.Text)));
  ini_fun.WriteString('EVENTDBConfig','DBNAME',Trim(edDataBaseName2.Text));
  ini_fun.free;

  result := True;
end;

function TfmDataBaseConfig.SaveLOGMDB: Boolean;
var
  ini_fun : TiniFile;
  stExeFolder : String;
begin
{  result := False;

  if ed_MdbName3.Text = '' then
  begin
    showmessage('DB 파일 위치를 확인하세요..');
    PageControl1.ActivePageIndex := 2;
    ed_MdbName3.SetFocus;
    Exit;
  End;

  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Zmos.INI');

  ini_fun.WriteString('LOGDBConfig','TYPE','MDB');
  ini_fun.WriteString('LOGDBConfig','UserPW',MimeEncodeString(Trim(ed_mdbPass3.Text)));
  ini_fun.WriteString('LOGDBConfig','DBNAME',Trim(ed_MdbName3.Text));
  ini_fun.free;

  result := True; }
end;

function TfmDataBaseConfig.SaveLOGMSSQL: Boolean;
var
  ini_fun : TiniFile;
  stExeFolder : String;
begin
  result := False;

  if edServerIP3.Text = '' then
  begin
    showmessage('서버IP가 비어 있습니다.');
    PageControl1.ActivePageIndex := 2;
    edServerIP3.SetFocus;
    Exit;
  End;

  if edServerPort3.Text = '' then
  begin
    showmessage('서버Port가 비어 있습니다.');
    PageControl1.ActivePageIndex := 2;
    edServerPort3.SetFocus;
    Exit;
  end;

  if edUserID2.Text = '' then
  begin
    showmessage('서버계정이 비어 있습니다.');
    PageControl1.ActivePageIndex := 2;
    edUserID3.SetFocus;
    Exit;
  end;

  if edPasswd3.Text = '' then
  begin
    showmessage('서버계정의 비밀번호가 비어 있습니다.');
    PageControl1.ActivePageIndex := 2;
    edPasswd3.SetFocus;
    Exit;
  end;

  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Zmos.INI');

//  ini_fun.WriteString('DBConfig','TYPE','MSSQL');
  ini_fun.WriteString('LOGDBConfig','Host',Trim(edServerIP3.Text));
  ini_fun.WriteString('LOGDBConfig','Port',Trim(edServerPort3.Text));
  ini_fun.WriteString('LOGDBConfig','UserID',Trim(edUserID3.Text));
  ini_fun.WriteString('LOGDBConfig','UserPW',MimeEncodeString(Trim(edPasswd3.Text)));
  ini_fun.WriteString('LOGDBConfig','DBNAME',Trim(edDataBaseName3.Text));
  ini_fun.free;

  result := True;
end;

procedure TfmDataBaseConfig.chk_CopyClick(Sender: TObject);
begin
  if chk_Copy.Checked then
  begin
    edServerIP2.Text := edServerIP1.text;
    edServerIP3.Text := edServerIP1.Text;
    edServerPort2.Text := edServerPort1.Text;
    edServerPort3.Text := edServerPort1.Text;
    edUserid2.Text := edUserid1.Text;
    edUserid3.Text := edUserid1.Text;
    edPasswd2.Text := edPasswd1.Text;
    edPasswd3.Text := edPasswd1.Text;
    edDataBaseName2.Text := edDataBaseName1.Text;
    edDataBaseName3.Text := edDataBaseName1.Text;
  end;
end;

function TDataBaseConfig.Table10VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_DEVICECARDNOACKINDEX
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_DEVICECARDNOACKINDEX
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_DEVICECARDNOACKINDEX
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_DEVICECARDNOACKINDEX
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISCARDNO
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISCARDNO
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISCARDNO
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISCARDNO
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISCARDTYPE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISCARDTYPE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISCARDTYPE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISCARDTYPE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISSENDSTATUS2
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISSENDSTATUS2
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISSENDSTATUS2
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISSENDSTATUS2
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','10');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table11VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_WORKLOG
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_WORKLOG
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_WORKLOG
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_WORKLOG
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','11');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table12VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' update TB_CONFIG set CO_CONFIGVALUE = ''DOOR'' ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''FOODDEVICE'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','12');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table13VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := 'ALTER TABLE TB_CARD ADD POSITIONNUM INTEGER ';
  if DBType <> 'FB' then stSql := stSql + ' NULL ';
  DataModule1.ProcessExecSQL(stSql);

  PositionNumberValueSetting;

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','13');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table14VersionMake: Boolean;
var
  stSql : string;
begin
  {
  stSql := 'Insert Into TB_PROGRAMID( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'PR_PROGRAMID,';
  stSql := stSql + 'PR_GROUPCODE,';
  stSql := stSql + 'PR_PROGRAMNAME,';
  stSql := stSql + 'PR_VISIBLE,';
  stSql := stSql + 'PR_VIEWSEQ,';
  stSql := stSql + 'CO_CONFIGCODE,';
  stSql := stSql + 'PR_ENABLE';
  stSql := stSql + ') ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''ATC04r'',';
  stSql := stSql + '''ATREPORT'',';
  stSql := stSql + '''실시간근태보고서'',';
  stSql := stSql + '''Y'',';
  stSql := stSql + '23,';
  stSql := stSql + '''ATTEND'',';
  stSql := stSql + '''Y'')';


  DataModule1.ProcessExecSQL(stSql); }
  stSql := commonSql.InsertIntoTB_PROGRAMID('ATC04r','ATREPORT','실시간근태보고서','Y','23','ATTEND','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','14');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table15VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READERInOutCount
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READERInOutCount
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_READERInOutCount
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READERInOutCount
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_INOUTCOUNT
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_INOUTCOUNT
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_INOUTCOUNT
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_INOUTCOUNT
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_INOUTGROUP
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_INOUTGROUP
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_INOUTGROUP
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_INOUTGROUP
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('MOSTYPE','INOUTCOUNT','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','15');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table16VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','DEVICESVER','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','DTOSPORT1','3000');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','DTOSPORT2','3001');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','DTOSPORT3','3002');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','16');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table17VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_FTPLIST
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_FTPLIST
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_FTPLIST
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_FTPLIST
  else exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','FTPPORT','3100');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','17');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table18VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODEALARMSOUND
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODEALARMSOUND
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMSTATUSCODEALARMSOUND
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODEALARMSOUND
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','18');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table19VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','SPECIALCD','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','19');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table1VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CONFIG(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'CO_CONFIGGROUP,';
  stSql := stSql + 'CO_CONFIGCODE,';
  stSql := stSql + 'CO_CONFIGVALUE)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''1234567890'',';
  stSql := stSql + '''COMMON'',';
  stSql := stSql + '''TABLE_VER'',';
  stSql := stSql + '''1'')';
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table20VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_KTCARDISSUE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_KTCARDISSUE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_KTCARDISSUE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_KTCARDISSUE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISINSERTTIME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISINSERTTIME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISINSERTTIME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISINSERTTIME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','20');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table21VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then Exit
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateView_CARD
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateView_CARD
  else if DBTYPE = 'FB' then stSql := FireBird.CreateView_CARD
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','21');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table22VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := commonSql.InsertIntoTB_PROGRAMID('MOB06i','MOMANAGE','KT카드발급','Y','11','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','22');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table23VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_RELAYGUBUN
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_RELAYGUBUN
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_RELAYGUBUN
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_RELAYGUBUN
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEERelayGubun
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEERelayGubun
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEERelayGubun
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEERelayGubun
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_EMPLOYEE set RG_CODE = ''001'' ';
  stSql := stSql + ' where RG_CODE IS NULL ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','23');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table24VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_FORMNAME('040','직원구분','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('041','직원코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('042','직원코드명칭','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','24');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table25VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_RELAYGUBUN('001','정직원');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_RELAYGUBUN('002','외부인');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','25');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table26VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYUPDATECHECK
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYUPDATECHECK
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYUPDATECHECK
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYUPDATECHECK
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_POSIUPDATECHECK
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_POSIUPDATECHECK
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_POSIUPDATECHECK
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_POSIUPDATECHECK
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','26');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table27VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINBuildingGrade
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINBuildingGrade
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINBuildingGrade
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINBuildingGrade
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINDongCode
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINDongCode
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINDongCode
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINDongCode
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINFloorCode
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINFloorCode
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINFloorCode
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINFloorCode
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINAreaCode
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINAreaCode
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINAreaCode
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINAreaCode
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDaemonGubun
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDaemonGubun
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDaemonGubun
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDaemonGubun
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.updateTB_ACCESSDEVICEDaemonGubunAll('1');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_FORMNAME('901','빌딩코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('902','빌딩명칭','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('903','빌딩권한','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('911','층코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('912','층명칭','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('913','층권한','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('921','구역코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('922','구역명칭','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('923','구역권한','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('933','출입문권한','Y');
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','27');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table28VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_PROGRAMGROUP('MODEVICE','관제-기기관리','Y','MONITORING');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF00','MODEVICE','기기관리','D','50','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF01i','MODEVICE','위치정보관리','Y','51','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF02i','MODEVICE','컨트롤러관리','Y','52','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF03i','MODEVICE','출입문관리','Y','53','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF04i','MODEVICE','방범구역관리','Y','54','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','28');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table29VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','FTPUSE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','MULTI','0');
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_DAEMONMULTI
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_DAEMONMULTI
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_DAEMONMULTI
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_DAEMONMULTI
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','29');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table2VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := 'select * from TB_MONTHAT ';
  with DataModule1.ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if FieldCount < 42 then
    begin
      stSql := ' ALTER TABLE TB_MONTHAT ADD MO_NIGHTTIME int ';
      if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
      DataModule1.ProcessExecSQL(stSql);
      stSql := ' ALTER TABLE TB_MONTHAT ADD MO_HOLIDAYTIME int ';
      if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
      DataModule1.ProcessExecSQL(stSql);
    end;
  end;
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','2');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table30VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_CARDDoorGrade
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_CARDDoorGrade
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_CARDDoorGrade
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_CARDDoorGrade
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_CARD set CA_DOORGRADE = ''Y'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','30');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table31VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOF05i','MODEVICE','출입문스케줄관리','Y','55','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','31');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table32VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_DOORGUBUN
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_DOORGUBUN
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_DOORGUBUN
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_DOORGUBUN
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORGUBUN
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORGUBUN
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORGUBUN
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORGUBUN
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertTB_DOORGUBUN('001','구분1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_DOORGUBUN('002','구분2');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','32');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table33VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOE04r','MOREPORT','출입통계보고서','Y','44','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','33');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table34VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','KHUADDDAY','','경희대입력연동날짜');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','KHUDELDAY','','경희대삭제연동날짜');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','34');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table35VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','MAXPROCESS','10');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','35');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table36VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSNO','4');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','36');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table37VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISEMNAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISEMNAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISEMNAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISEMNAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISHANDPHONE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISHANDPHONE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISHANDPHONE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISHANDPHONE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISCOMPANYNAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISCOMPANYNAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISCOMPANYNAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISCOMPANYNAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISJIJUMNAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISJIJUMNAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISJIJUMNAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISJIJUMNAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISDEPARTNAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISDEPARTNAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISDEPARTNAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISDEPARTNAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISPOSINAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISPOSINAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISPOSINAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISPOSINAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','37');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table38VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','CARDADDDAY','','경희대카드연동날짜');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','CARDDELDAY','','경희대카드삭제연동날짜');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','38');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table39VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PERMITCODE(';
  stSql := stSql + 'PE_PERMITCODE,';
  stSql := stSql + 'PE_PERMITNAME)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''F'',';
  stSql := stSql + '''유효기간만료'')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','39');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table3VersionMake: Boolean;
var
  stSql : string;
  stPath : string;
begin
  stPath := 'C:\Program Files\ACServer\ACCESS.mdb';
  if DBTYPE = 'PG' then stPath := 'C:\\Program Files\\ACServer\\ACCESS.mdb';
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','fdmsUSE','FALSE');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','fdmsPath',stPath);
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','fdmsPW','fdmsamho');
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' ALTER TABLE TB_EMPLOYEE ADD FDMS_ID int ';
  if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then  stSql := ' ALTER TABLE TB_EMPLOYEE ADD FDMS_RELAY text(1) '
  else stSql := ' ALTER TABLE TB_EMPLOYEE ADD FDMS_RELAY varchar(1) ';
  if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' ALTER TABLE TB_DOOR ADD FDMS_ID int ';
  if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'MDB' then  stSql := ' ALTER TABLE TB_DOOR ADD FDMS_RELAY text(1) '
  else stSql := ' ALTER TABLE TB_DOOR ADD FDMS_RELAY varchar(1) ';
  if DBTYPE <> 'FB' then stSql := stSql + ' NULL ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','3');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table40VersionMake: Boolean;
var
  stSql : string;
  stCardLen : string;
begin
  stCardLen := '24'; //성현지문카드길이

  if CheckPersonRelay = '3' then stCardLen := '32'; //경희대 성현지문카드길이 = 32자리

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSCARDLN',stCardLen,'성현지문카드길이');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','40');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table41VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_CONFIG('CARD','CARDFIXED','FALSE','카드길이고정유무');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('CARD','FIXEDLEN','11','카드길이');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('CARD','FILLPOSI','0','채움문자위치 0:앞,1:뒤');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('CARD','FILLCHAR','0','채움문자');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','41');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table42VersionMake: Boolean;
var
  stSql : string;
  stCode1Name,stCode2Name : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_CARDTYPE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_CARDTYPE
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_CARDTYPE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_CARDTYPE
  else exit;
  DataModule1.ProcessExecSQL(stSql);

  stCode1Name := '일반카드';
  stCode2Name := '기타카드';
  if CheckSamyuk then  //삼육대인경우
  begin
    stCode1Name := '일반카드';
    stCode2Name := '모바일카드';
  end else if CheckFdms then  //지문연동인 경우
  begin
    stCode1Name := '지문연동카드';
    stCode2Name := '일반카드';
  end;
  
  stSql := 'Insert Into TB_CARDTYPE(CT_CODE,CT_NAME) ';
  stSql := stSql + ' Values( ''1'',''' + stCode1Name + ''') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_CARDTYPE(CT_CODE,CT_NAME) ';
  stSql := stSql + ' Values( ''2'',''' + stCode2Name + ''') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','42');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table43VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := 'Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values( ''FIREORIGIN'',''FALSE'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','43');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table44VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_HOLIDAYState
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_HOLIDAYState
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_HOLIDAYState
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_HOLIDAYState
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','44');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table45VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEHoSend
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEHoSend
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEHoSend
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEHoSend
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','45');
  DataModule1.ProcessExecSQL(stSql);

end;


function TDataBaseConfig.Table46VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := 'Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values( ''SEND_HOYY'','''') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','46');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table47VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ALARMSTATUSCODE(';
  stSql := stSql + ' AL_ALARMSTATUSCODE,';
  stSql := stSql + ' AL_ALARMNAME,';
  stSql := stSql + ' AL_ALARMVIEW,';
  stSql := stSql + ' AL_ALARMGRADE,';
  stSql := stSql + ' AL_ALARMSOUND ) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''FI'',';
  stSql := stSql + '''FI 화재알람'',';
  stSql := stSql + '1,';
  stSql := stSql + '3,';
  stSql := stSql + '1) ';
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','47');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table48VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('R1','RESET(경계모드)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('R2','RESET(해제모드)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('A1','경계모드변경(카드)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('A2','경계모드변경(관제)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('A3','경계모드변경(연동)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('A4','경계모드변경(서버)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('C1','해제모드변경(카드)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('C2','해제모드변경(관제)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('C3','해제모드변경(연동)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('C4','해제모드변경(서버)','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('R3','복구버튼','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('ZS','알람발생(쇼트)','1','3','1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('ZP','알람발생(단선)','1','3','1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('ZN','알람복구','1','0','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','48');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table49VersionMake: Boolean;
var
  stSql : string;
begin
  //뷰삭제
  stSql := 'DROP VIEW VI_CARDINFO ';
  DataModule1.ProcessExecSQL(stSql);
  //tb_employee 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEEmNameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_EMPLOYEEEmNameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEEmNameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEEmNameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  {
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODEPrimaryDelete
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMSTATUSCODEPrimaryDelete
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODEPrimaryDelete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODEPrimaryDelete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);   }
  //알람상태코드 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODECodeChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMSTATUSCODECodeChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODECodeChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODECodeChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  //알람 이벤트 상태코드 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTCodeChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMEVENTCodeChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTCodeChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTCodeChange
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);
  //알람 이벤트 oper 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTOperChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMEVENTOperChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTOperChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTOperChange
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);
  //알람 이벤트 재정의 상태코드 생성
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTSTATECODE2Add
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMEVENTSTATECODE2Add
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTSTATECODE2Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTSTATECODE2Add
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);
  //알람상태 그룹 테이블 생성
  if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ALARMCODEGROUP
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_ALARMCODEGROUP
  else if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ALARMCODEGROUP
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ALARMCODEGROUP
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  //알람 모드변경 제외 그룹 테이블 생성
  if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ALARMMODENOTCARD
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_ALARMMODENOTCARD
  else if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ALARMMODENOTCARD
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ALARMMODENOTCARD
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  //알람 모드변경 제외 데이터 인서트
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('001','***RESET**');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('002','.KTLinkUs.');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('003','ForceRelay');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('004','0000000000');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('005','RecoveryOK');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('ET','기타','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','49');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table4VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_FormName
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_FormName
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_FormName
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_FormName
  else exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_FORMNAME('001','회사코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('002','회사명','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('011','지점코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('012','지점명','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('021','부서코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('022','부서명','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('031','직위코드','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('032','직위명','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('101','사번','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('102','이름','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('103','사내전화번호','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('104','입사일','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('105','퇴사일','Y');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_FORMNAME('106','사원','Y');
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','4');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table50VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','DAEMON_VER','0','데몬버젼');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','50');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table51VersionMake: Boolean;
var
  stSql : string;
begin
  //카드외의 상태코드 테이블
  if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_NOTCARDALARMCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_NOTCARDALARMCODE
  else if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_NOTCARDALARMCODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_NOTCARDALARMCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('RESET','R1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('RESET','R2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('RESET','WR');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('RESET','CR');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','A1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','A2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','A3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','A4');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','C1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','C2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','C3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('모드변경','C4');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','ZS');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','ZP');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','ZN');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','E1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','F1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','FI');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','G1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Alarm','Q1');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','NF');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','NR');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('AC전원','AF');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('AC전원','AN');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Data','BF');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','CC');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','CO');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('밧데리','DF');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('밧데리','DL');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('밧데리','DR');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기타','ET');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('001','a','R1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('001','d','R2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('002','a','A2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('002','d','C2');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('003','a','A3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('003','d','C3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('004','a','A4');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('004','d','C4');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('005','a','R3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('005','d','R3');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','51');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table52VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTCOMPANYCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTCOMPANYCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTCOMPANYCODE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTCOMPANYCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTEMCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTEMCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTEMCODE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTEMCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTJIJUMCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTJIJUMCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTJIJUMCODE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTJIJUMCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTDEPARTCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTDEPARTCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTDEPARTCODE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTDEPARTCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTEMNAME
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTEMNAME
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTEMNAME
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTEMNAME
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SCS','RY_SERVER','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','52');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table53VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTSCSHIS
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTSCSHIS
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTSCSHIS
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTSCSHIS
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','53');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table54VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTAUTHTYPE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTAUTHTYPE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTAUTHTYPE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTAUTHTYPE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_AUTHTYPE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_AUTHTYPE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_AUTHTYPE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_AUTHTYPE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_AUTHTYPE('001','승인');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_AUTHTYPE('002','미승인');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_AUTHTYPE('003','DB접속실패');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_AUTHTYPE('004','서버접속실패');
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','54');
  DataModule1.ProcessExecSQL(stSql);

end;


function TDataBaseConfig.Table55VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateSEAT_USER_VIEW
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateSEAT_USER_VIEW
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateSEAT_USER_VIEW
  else if DBTYPE = 'FB' then stSql := FireBird.CreateSEAT_USER_VIEW
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','55');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table56VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_KTBIZMEKADOOR
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_KTBIZMEKADOOR
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_KTBIZMEKADOOR
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_KTBIZMEKADOOR
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','56');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table57VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_KTBMDISPLAY
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_KTBMDISPLAY
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_KTBMDISPLAY
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_KTBMDISPLAY
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_KTBMDISPLAYMESSAGE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_KTBMDISPLAYMESSAGE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_KTBMDISPLAYMESSAGE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_KTBMDISPLAYMESSAGE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','57');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table58VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','HIDCARD','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','58');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table59VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_BARCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_BARCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_BARCODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_BARCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DoorSoundIP
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DoorSoundIP
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DoorSoundIP
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DoorSoundIP
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DoorSoundPort
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DoorSoundPort
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DoorSoundPort
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DoorSoundPort
  else Exit;
  
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','59');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table5VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoAT_INCODE('101','정상출근','1','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_INCODE('102','외근후출근','1','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_INCODE('103','지각','2','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_INCODE('104','조기출근','4','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_INCODE('105','결근','3','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoAT_OUTCODE('101','정상퇴근','1','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_OUTCODE('102','외근후퇴근','1','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_OUTCODE('103','조퇴','2','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_OUTCODE('104','연장근무','3','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoAT_OUTCODE('105','야간근무','4','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_PROGRAMID('MOE02r','MOREPORT','경보이력보고서','Y','42','MONITORING','Y');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','5');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table60VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_SOUNDCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_SOUNDCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_SOUNDCODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_SOUNDCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_SOUNDCODE(SO_CODE,SO_NAME) ';
  stSql := stSql + ' Values(''0'','''')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_SOUNDCODE(SO_CODE,SO_NAME) ';
  stSql := stSql + ' Values(''1'',''unreco~1'')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_SOUNDCODE(SO_CODE,SO_NAME) ';
  stSql := stSql + ' Values(''2'',''finish1'')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_SOUNDCODE(SO_CODE,SO_NAME) ';
  stSql := stSql + ' Values(''3'',''thanks'')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_SOUNDCODE(SO_CODE,SO_NAME) ';
  stSql := stSql + ' Values(''4'','''')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_SOUNDCODE(SO_CODE,SO_NAME) ';
  stSql := stSql + ' Values(''5'','''')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_SOUNDCODE(SO_CODE,SO_NAME) ';
  stSql := stSql + ' Values(''6'','''')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_SOUNDCODE(SO_CODE,SO_NAME) ';
  stSql := stSql + ' Values(''7'','''')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_SOUNDCODE(SO_CODE,SO_NAME) ';
  stSql := stSql + ' Values(''8'','''')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Insert Into TB_SOUNDCODE(SO_CODE,SO_NAME) ';
  stSql := stSql + ' Values(''9'','''')';
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','60');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table61VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DoorSoundVolume
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DoorSoundVolume
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DoorSoundVolume
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DoorSoundVolume
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','61');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table6VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','LOGINTYPE','TRUE');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('MOSTYPE','ALARMVIEW','REAL');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','fdmsType','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','6');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table7VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ALARMSHOW
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ALARMSHOW
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_ALARMSHOW
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ALARMSHOW
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','7');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table8VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_EMPHIS
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_EMPHIS
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_EMPHIS
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_EMPHIS
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  if DBTYPE = 'FB' then
  begin
    stSql := 'CREATE SEQUENCE GEN_TB_EMPHIS_ID ';
    DataModule1.ProcessExecSQL(stSql);

    stSql := 'CREATE OR ALTER TRIGGER TB_EMPHIS_BI FOR TB_EMPHIS ';
    stSql := stSql + ' ACTIVE BEFORE INSERT POSITION 0 ';
    stSql := stSql + ' AS ';
    stSql := stSql + ' BEGIN ';
    stSql := stSql + '   IF (NEW.SEQ IS NULL) THEN ';
    stSql := stSql + '     NEW.SEQ = GEN_ID(GEN_TB_EMPHIS_ID,1); ';
    stSql := stSql + ' END ';
    DataModule1.ProcessExecSQL(stSql);
  end;

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','8');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table9VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_SERVERCARDRELAY
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_SERVERCARDRELAY
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_SERVERCARDRELAY
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_SERVERCARDRELAY
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_SERVERCARDRELAYHIS
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_SERVERCARDRELAYHIS
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_SERVERCARDRELAYHIS
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_SERVERCARDRELAYHIS
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_PERRELAYCONFIG
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_PERRELAYCONFIG
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_PERRELAYCONFIG
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_PERRELAYCONFIG
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','9');
  DataModule1.ProcessExecSQL(stSql);
end;

procedure TDataBaseConfig.TableVersionCheck;
var
  nTableVersion : integer;
begin
  nTableVersion := GetVersion;

  if nTableVersion < 1 then Table1VersionMake;
  if nTableVersion < 2 then Table2VersionMake;
  if nTableVersion < 3 then Table3VersionMake;
  if nTableVersion < 4 then Table4VersionMake;
  if nTableVersion < 5 then Table5VersionMake;
  if nTableVersion < 6 then Table6VersionMake;
  if nTableVersion < 7 then Table7VersionMake;
  if nTableVersion < 8 then Table8VersionMake;
  if nTableVersion < 9 then Table9VersionMake;
  if nTableVersion < 10 then Table10VersionMake;
  if nTableVersion < 11 then Table11VersionMake;
  if nTableVersion < 12 then Table12VersionMake;
  if nTableVersion < 13 then Table13VersionMake;
  if nTableVersion < 14 then Table14VersionMake;
  if nTableVersion < 15 then Table15VersionMake;
  if nTableVersion < 16 then Table16VersionMake;
  if nTableVersion < 17 then Table17VersionMake;
  if nTableVersion < 18 then Table18VersionMake;
  if nTableVersion < 19 then Table19VersionMake;
  if nTableVersion < 20 then Table20VersionMake;
  if nTableVersion < 21 then Table21VersionMake;
  if nTableVersion < 22 then Table22VersionMake;
  if nTableVersion < 23 then Table23VersionMake;
  if nTableVersion < 24 then Table24VersionMake;
  if nTableVersion < 25 then Table25VersionMake;
  if nTableVersion < 26 then Table26VersionMake;
  if nTableVersion < 27 then Table27VersionMake;
  if nTableVersion < 28 then Table28VersionMake;
  if nTableVersion < 29 then Table29VersionMake;
  if nTableVersion < 30 then Table30VersionMake;
  if nTableVersion < 31 then Table31VersionMake;
  if nTableVersion < 32 then Table32VersionMake;
  if nTableVersion < 33 then Table33VersionMake;
  if nTableVersion < 34 then Table34VersionMake;
  if nTableVersion < 35 then Table35VersionMake;
  if nTableVersion < 36 then Table36VersionMake;
  if nTableVersion < 37 then Table37VersionMake;
  if nTableVersion < 38 then Table38VersionMake;
  if nTableVersion < 39 then Table39VersionMake;
  if nTableVersion < 40 then Table40VersionMake;
  if nTableVersion < 41 then Table41VersionMake;
  if nTableVersion < 42 then Table42VersionMake;
  if nTableVersion < 43 then Table43VersionMake;
  if nTableVersion < 44 then Table44VersionMake;
  if nTableVersion < 45 then Table45VersionMake;
  if nTableVersion < 46 then Table46VersionMake;
  if nTableVersion < 47 then Table47VersionMake;
  if nTableVersion < 48 then Table48VersionMake;
  if nTableVersion < 49 then Table49VersionMake;
  if nTableVersion < 50 then Table50VersionMake;
  if nTableVersion < 51 then Table51VersionMake;
  if nTableVersion < 52 then Table52VersionMake;
  if nTableVersion < 53 then Table53VersionMake;
  if nTableVersion < 54 then Table54VersionMake;
  if nTableVersion < 55 then Table55VersionMake;
  if nTableVersion < 56 then Table56VersionMake;
  if nTableVersion < 57 then Table57VersionMake;
  if nTableVersion < 58 then Table58VersionMake;
  if nTableVersion < 59 then Table59VersionMake;
  if nTableVersion < 60 then Table60VersionMake;
  if nTableVersion < 61 then Table61VersionMake;

end;

procedure TfmDataBaseConfig.edDataBaseName1Exit(Sender: TObject);
begin
  if chk_Copy.Checked then
  begin
    edDataBaseName2.Text := edDataBaseName1.Text;
    edDataBaseName3.Text := edDataBaseName1.Text;
  end;

end;

procedure TfmDataBaseConfig.edPasswd1Exit(Sender: TObject);
begin
    if chk_Copy.Checked then
    begin
      edPasswd2.Text := edPasswd1.Text;
      edPasswd3.Text := edPasswd1.Text;
    end;

end;

procedure TfmDataBaseConfig.edUserid1Exit(Sender: TObject);
begin
    if chk_Copy.Checked then
    begin
      edUserid2.Text := edUserid1.Text;
      edUserid3.Text := edUserid1.Text;
    end;

end;

procedure TfmDataBaseConfig.edServerPort1Exit(Sender: TObject);
begin
    if chk_Copy.Checked then
    begin
      edServerPort2.Text := edServerPort1.Text;
      edServerPort3.Text := edServerPort1.Text;
    end;

end;

procedure TfmDataBaseConfig.edServerIP1Exit(Sender: TObject);
begin
    if chk_Copy.Checked then
    begin
      edServerIP2.Text := edServerIP1.Text;
      edServerIP3.Text := edServerIP1.Text;
    end;

end;

function TDataBaseConfig.UpdateTB_CARDPoitionNum(aGroupCode,
  aCardNo: string; aPositionNumber: integer): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_CARD ';
  stSql := stSql + ' Set POSITIONNUM = ' + inttostr(aPositionNumber) ;
  stSql := stSql + ' Where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

end.
