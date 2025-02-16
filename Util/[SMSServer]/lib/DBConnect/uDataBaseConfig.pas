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
    Function DataBaseConnect(aMessage:Boolean=True):Boolean;
    procedure TableVersionCheck;
    function TableSMS1VersionMake: Boolean;
    function TableSMS2VersionMake: Boolean;
    function TableSMS3VersionMake: Boolean;
    function TableSMS4VersionMake: Boolean;
    function TableSMS5VersionMake: Boolean;
    function TableSMS6VersionMake: Boolean;
    function TableSMS7VersionMake: Boolean;
    function TableSMS8VersionMake: Boolean;
    function TableSMS9VersionMake: Boolean;
    function TableSMS10VersionMake: Boolean;
    function TableSMS11VersionMake: Boolean;

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
    function Table62VersionMake: Boolean;
    function Table63VersionMake: Boolean;
    function Table64VersionMake: Boolean;
    function Table65VersionMake: Boolean;
    function Table66VersionMake: Boolean;
    function Table67VersionMake: Boolean;
    function Table68VersionMake: Boolean;
    function Table69VersionMake: Boolean;
    function Table70VersionMake: Boolean;
    function Table71VersionMake: Boolean;
    function Table72VersionMake: Boolean;
    function Table73VersionMake: Boolean;
    function Table74VersionMake: Boolean;
    function Table75VersionMake: Boolean;
    function Table76VersionMake: Boolean;
    function Table77VersionMake: Boolean;
    function Table78VersionMake: Boolean;
    function Table79VersionMake: Boolean;
    function Table80VersionMake: Boolean;
    function Table81VersionMake: Boolean;
    function Table82VersionMake: Boolean;
    function Table83VersionMake: Boolean;
    function Table84VersionMake: Boolean;
    function Table85VersionMake: Boolean;  //KTT관제 연동
    function Table86VersionMake: Boolean;
    function Table87VersionMake: Boolean;
    function Table88VersionMake: Boolean;
    function Table89VersionMake: Boolean;
    function Table90VersionMake: Boolean;  //KTT관제 연동
    function Table91VersionMake: Boolean;  //KTT관제 연동
    function Table92VersionMake: Boolean;  //KTT관제 연동
    function Table93VersionMake: Boolean;
    function Table94VersionMake: Boolean;
    function Table95VersionMake: Boolean;
    function Table96VersionMake: Boolean;
    function Table97VersionMake: Boolean;
    function Table98VersionMake: Boolean;
    function Table99VersionMake: Boolean;
    function Table100VersionMake: Boolean;
    function Table101VersionMake: Boolean;
    function Table102VersionMake: Boolean;
    function Table103VersionMake: Boolean;
    function Table104VersionMake: Boolean;
    function Table105VersionMake: Boolean;
    function Table106VersionMake: Boolean;
    function Table107VersionMake: Boolean;
    function Table108VersionMake: Boolean;
    function PositionNumberValueSetting:Boolean;
    Function UpdateTB_CARDPoitionNum(aGroupCode,aCardNo:string;aPositionNumber:integer):Boolean;
    function GetVersion:integer;
    function GetSMSServerVersion:integer;
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
  uFireBird,
  udmAdoQuery,
  uCommonVariable;

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

Function TDataBaseConfig.DataBaseConnect(aMessage:Boolean=True):Boolean;
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

function TDataBaseConfig.GetSMSServerVersion: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''SMS_VER'' ';
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

function TDataBaseConfig.Table100VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ATWORKTYPE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ATWORKTYPE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_ATWORKTYPE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ATWORKTYPE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','100');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table101VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICENameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ZONEDEVICENameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICENameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICENameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','101');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table102VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','AUTOFCARD','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','102');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table103VersionMake: Boolean;
var
  stSql : string;
  stTemp : string;
  stAW_YESTERDAYTIME : string; //어제 날짜 기준 시간
  stAW_SATURDAYTYPE : string; //토요일근무타입 0:공휴일,1:반휴일,2:평일
  stAW_DEVICETYPE : string; //0:업데이트,1:카드리더,2:버튼방식
  stAW_FIXATTYPE : string; //0:정상,1:전직원 정상 출퇴근
  stAW_NOTBACKUPTYPE : string; //0:미복귀시조퇴처리,1:미복귀시정상퇴근
  stAW_ATSTARTBUTTON : string; //출근조작버튼
  stAW_ATOFFBUTTON : string; //퇴근조작버튼
  stAW_INOUTDEVICETYPE : string; //외출-0:사용안함,1:리더,2:버튼
  stAW_WORKOUTBUTTON : string; //외출조작버튼
  stAW_WORKINBUTTON : string; //복귀조작버튼
begin
  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','103');
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''ATTEND'' ';

  with DataModule1.ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    While Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'ATTYPE1' then stAW_FIXATTYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then stAW_DEVICETYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'INOUTTYPE' then stAW_INOUTDEVICETYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'OFFWKNO' then stAW_ATOFFBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'OUTTIME' then stAW_NOTBACKUPTYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then stAW_SATURDAYTYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'STARTWKNO' then stAW_ATSTARTBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'WKINNO' then stAW_WORKINBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'WKOUTNO' then stAW_WORKOUTBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'YTIME' then stAW_YESTERDAYTIME := FindField('CO_CONFIGVALUE').AsString ;

      Next;
    end;
    stTemp := 'Insert Into TB_ATWORKTYPE(';
    stTemp := stTemp + 'AW_CODE,';
    stTemp := stTemp + 'AW_NAME,';
    stTemp := stTemp + 'AW_YESTERDAYTIME,';
    stTemp := stTemp + 'AW_SATURDAYTYPE,';
    stTemp := stTemp + 'AW_DEVICETYPE,';
    stTemp := stTemp + 'AW_FIXATTYPE,';
    stTemp := stTemp + 'AW_NOTBACKUPTYPE,';
    stTemp := stTemp + 'AW_ATSTARTBUTTON,';
    stTemp := stTemp + 'AW_ATOFFBUTTON,';
    stTemp := stTemp + 'AW_INOUTDEVICETYPE,';
    stTemp := stTemp + 'AW_WORKOUTBUTTON,';
    stTemp := stTemp + 'AW_WORKINBUTTON) ';
    stTemp := stTemp + ' Values( ';
    stTemp := stTemp + '''001'',';
    stTemp := stTemp + '''상시근무자'',';
    stTemp := stTemp + '''' + stAW_YESTERDAYTIME + ''',';
    stTemp := stTemp + '''' + stAW_SATURDAYTYPE + ''',';
    stTemp := stTemp + '''' + stAW_DEVICETYPE + ''',';
    stTemp := stTemp + '''' + stAW_FIXATTYPE + ''',';
    stTemp := stTemp + '''' + stAW_NOTBACKUPTYPE + ''',';
    stTemp := stTemp + '''' + stAW_ATSTARTBUTTON + ''',';
    stTemp := stTemp + '''' + stAW_ATOFFBUTTON + ''',';
    stTemp := stTemp + '''' + stAW_INOUTDEVICETYPE + ''',';
    stTemp := stTemp + '''' + stAW_WORKOUTBUTTON + ''',';
    stTemp := stTemp + '''' + stAW_WORKINBUTTON + ''') ';

    DataModule1.ProcessExecSQL(stTemp);
  end;
end;

function TDataBaseConfig.Table104VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATCODEAWCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATCODEAWCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATCODEAWCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATCODEAWCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ATCODE set AW_CODE = ''001'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','104');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table105VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEAWCODE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEAWCODE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEAWCODE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEAWCODE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_EMPLOYEE set AW_CODE = ''001'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','105');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table106VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODEGubun_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODEGubun_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMSTATUSCODEGubun_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODEGubun_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODEColor_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODEColor_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMSTATUSCODEColor_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODEColor_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Update TB_ALARMSTATUSCODE set AL_COLOR = 255 ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Update TB_ALARMSTATUSCODE set AL_GUBUN = ''001'' ';
  stSql := stSql + ' Where AL_ALARMSTATUSCODE = ''00'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''AF'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''AN'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''BF'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''CC'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''CO'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''CR'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''DF'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''DL'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''DR'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''E1'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''EM'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''FI'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''G1'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''NF'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''NR'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''PF'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''Q1'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S1'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S2'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S3'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S4'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S5'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S6'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S7'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''S8'' ';
  stSql := stSql + ' OR AL_ALARMSTATUSCODE = ''WR'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Update TB_ALARMSTATUSCODE set AL_GUBUN = ''002'' ';
  stSql := stSql + ' Where AL_GUBUN IS NULL ';
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','106');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table107VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values(''FDMSCARD'',''30'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','107');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table108VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_FIREGUBUN
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_FIREGUBUN
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_FIREGUBUN
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_FIREGUBUN
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert Into TB_FIREGUBUN(FG_CODE,FG_NAME) ';
  stSql := stSql + ' Values(''001'',''전체'')';
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_FIREGROUP
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_FIREGROUP
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_FIREGROUP
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_FIREGROUP
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Insert into TB_FIREGROUP select ''1234567890'',AC_NODENO,''001'' from TB_ACCESSDEVICE where AC_ECUID = ''00'' ';
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','108');
  DataModule1.ProcessExecSQL(stSql);

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
  //카드발급테이블에 여기서 발급했는지 여부
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_KTCARDISSUEWriteAdd
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_KTCARDISSUEWriteAdd
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_KTCARDISSUEWriteAdd
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_KTCARDISSUEWriteAdd
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);

  //카드발급테이블에 발급일자
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_KTCARDISSUEWriteDateAdd
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_KTCARDISSUEWriteDateAdd
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_KTCARDISSUEWriteDateAdd
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_KTCARDISSUEWriteDateAdd
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);


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


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','52');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table53VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','EMPLOYEE','0','0:사원별,1:카드별');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','53');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table54VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_MAPLOCATION
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_MAPLOCATION
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_MAPLOCATION
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_MAPLOCATION
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_MAPPOSITION
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_MAPPOSITION
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_MAPPOSITION
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_MAPPOSITION
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_MAPZONE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_MAPZONE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_MAPZONE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_MAPZONE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','54');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table55VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEUPDATE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEUPDATE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEUPDATE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEUPDATE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORUPDATE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORUPDATE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORUPDATE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORUPDATE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEUPDATE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEUPDATE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEUPDATE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEUPDATE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICEUPDATE
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICEUPDATE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ZONEDEVICEUPDATE
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICEUPDATE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','55');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table56VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FTPLISTRetryCount
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FTPLISTRetryCount
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FTPLISTRetryCount
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FTPLISTRetryCount
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','56');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table57VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOOROPENMONI_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOOROPENMONI_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOOROPENMONI_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOOROPENMONI_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORSENDDOOR_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORSENDDOOR_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORSENDDOOR_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORSENDDOOR_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORALARMLONG_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORALARMLONG_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORALARMLONG_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORALARMLONG_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORDSOPEN_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORDSOPEN_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORDSOPEN_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORDSOPEN_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORREMOTEDOOR_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORREMOTEDOOR_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORREMOTEDOOR_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORREMOTEDOOR_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','57');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table58VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','ATTYPE1','0','1:전사원정상출퇴근고정'); //전사원 교대타입에 따른 출퇴근처리
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','58');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table59VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORControlTime_Change
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORControlTime_Change
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORControlTime_Change
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORControlTime_Change
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
  stSql := 'update TB_FTPLIST set FL_RETRYCOUNT = 0 ';

  DataModule1.ProcessExecSQL(stSql);

  stSql := 'update TB_ACCESSDEVICE set SEND_ACK = ''Y'' ';

  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','60');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table61VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','cardServer','0','카드서버연동유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','PER_RELAY','0','사원정보연동유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','PER_SRELAY','0','보내는사원정보연동유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','SENT_RELAY','0','전문연동유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','CARDNOTYPE','0','카드번호Type(고정/가변)');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','CARDNUM','0','카드숫자인식Type');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','CAPOSINUM','0','카드위치사용유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','DUPCARD','0','1인당카드중복여부');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','FIRERECUSE','1','화재복구사용유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','FIREOPEN','0','화재감지시전체개방');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','FIRESTATUS','FI','화재감지시상태값');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('COMMON','ACEVENT','1','0.전체이력,1.카드이벤트만');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','CONTRLPORT','10001','제어포트');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','STATEPORT','10011','상태포트');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','EVENTPORT','10021','이벤트포트');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','MULTISOCK','0','멀티소켓');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','61');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table62VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTAlarmSound_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTAlarmSound_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENTAlarmSound_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTAlarmSound_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTAlarmGRADE_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTAlarmGRADE_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENTAlarmGRADE_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTAlarmGRADE_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTCheckUser_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTCheckUser_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENTCheckUser_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTCheckUser_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','62');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table63VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','USEARMLEN','FALSE');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','ALARMLEN','10');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','63');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table64VersionMake: Boolean;
var
  stSql : string;
begin
  //tb_ACCESSEVENT 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTEMCODEChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ACCESSEVENTEMCODEChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTEMCODEChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTEMCODEChange
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','64');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table65VersionMake: Boolean;
var
  stSql : string;
begin
  G_nDaemonServerVersion := DataModule1.GetDaemonVersion;
  if (G_nDaemonServerVersion > 0) and (G_nDaemonServerVersion < 4) then
  begin
    stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','SCHASYNC','0');
  end else
  begin
    stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','SCHASYNC','1');
  end;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','SCHDEVICE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','65');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table66VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','COMMLOG','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','CARDLOG','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','66');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table67VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDeviceCode_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDeviceCode_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDeviceCode_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDeviceCode_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICERegSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICERegSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICERegSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICERegSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICERegSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICERegSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICERegSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICERegSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORRegSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORRegSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DOORRegSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORRegSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READERDoorPosi_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READERDoorPosi_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_READERDoorPosi_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READERDoorPosi_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READERBuildPosi_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READERBuildPosi_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_READERBuildPosi_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READERBuildPosi_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READERRegSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READERRegSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_READERRegSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READERRegSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICEDelayUse_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICEDelayUse_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ZONEDEVICEDelayUse_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICEDelayUse_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICEPortRecovery_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICEPortRecovery_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ZONEDEVICEPortRecovery_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICEPortRecovery_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ZONEDEVICERegSend_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ZONEDEVICERegSend_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ZONEDEVICERegSend_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ZONEDEVICERegSend_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);


  stSql := 'Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values( ''REGPW'',''' + MimeEncodeString('1234') + ''') ';
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','67');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table68VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTCardno_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTCardno_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENTCardno_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTCardno_Add
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICETelNo_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICETelNo_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICETelNo_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICETelNo_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEmemo_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEmemo_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEmemo_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEmemo_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','68');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table69VersionMake: Boolean;
var
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICELinkusSystemID_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICELinkusSystemID_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICELinkusSystemID_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICELinkusSystemID_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICELinkusTelNo_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICELinkusTelNo_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICELinkusTelNo_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICELinkusTelNo_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEArmControlRing_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEArmControlRing_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEArmControlRing_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEArmControlRing_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDisArmControlRing_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDisArmControlRing_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDisArmControlRing_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDisArmControlRing_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDeviceType_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDeviceType_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDeviceType_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDeviceType_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEPowerType_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEPowerType_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEPowerType_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEPowerType_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEOutDelay_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEOutDelay_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEOutDelay_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEOutDelay_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEInDelay_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEInDelay_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEInDelay_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEInDelay_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEJaejung_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEJaejung_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEJaejung_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEJaejung_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDoor1Type_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDoor1Type_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDoor1Type_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDoor1Type_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDoor2Type_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDoor2Type_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEDoor2Type_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDoor2Type_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEReaderType_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEReaderType_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEReaderType_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEReaderType_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','69');
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

function TDataBaseConfig.Table70VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_DOOR set DO_UPDATE = ''Y'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'update TB_ALARMDEVICE set AL_UPDATE = ''Y'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'update TB_ACCESSDEVICE set AC_PTTYPE = ''1'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','70');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table71VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values( ''DEVICESORT'',''00000000'') ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','71');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table72VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_READERReaderVer_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_READERReaderVer_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_READERReaderVer_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_READERReaderVer_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','72');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table73VersionMake: Boolean;
VAR
  stSql : string;
begin

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEReaderType_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEReaderType_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSDEVICEReaderType_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEReaderType_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEOUTDELAY_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEOUTDELAY_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEOUTDELAY_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEOUTDELAY_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEINDELAY_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEINDELAY_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEINDELAY_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEINDELAY_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEALARMID_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEALARMID_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEALARMID_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEALARMID_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEMUXTEL_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEMUXTEL_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEMUXTEL_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEMUXTEL_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICERINGCOUNT_Delete
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICERINGCOUNT_Delete
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICERINGCOUNT_Delete
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICERINGCOUNT_Delete
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','73');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table74VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','fdmsEMCODE','FALSE'); //RUC 센터 때문에 추가 했는데... RUC 특화로 사용 안함
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','74');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table75VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_DEVICESETTINGINFO
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_DEVICESETTINGINFO
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_DEVICESETTINGINFO
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_DEVICESETTINGINFO
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','75');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table76VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_PERRELAYCONFIG(';
  stSql := stSql + 'PC_CONFIGCODE,';
  stSql := stSql + 'PC_CONFIGVALUE,';
  stSql := stSql + 'PC_CONFIGDETAIL) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''GETDATETIME'',';
  stSql := stSql + '''00000000000000'',';
  stSql := stSql + '''최종가져온시간'')';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','76');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table77VersionMake: Boolean;
var
  stSql : string;
begin
  Exit; //Event 테이블 변경 시 문제 소지 발생 해서 꼭 필요한 경우 유틸로 만들어서 작성

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTJijumCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTJijumCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTJijumCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTJijumCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTDepartCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTDepartCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTDepartCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTDepartCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINJijumCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINJijumCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINJijumCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINJijumCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINDepartCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINDepartCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINDepartCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINDepartCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCOMPANYCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCOMPANYCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCOMPANYCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCOMPANYCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCOMPANYJijumCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCOMPANYJijumCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCOMPANYJijumCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCOMPANYJijumCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCOMPANYDepartCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCOMPANYDepartCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCOMPANYDepartCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCOMPANYDepartCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATDAYSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATDAYSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATDAYSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATDAYSUMMARYCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATEMPEXTRACompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATEMPEXTRACompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATEMPEXTRACompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATEMPEXTRACompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATEVENTCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATEVENTCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATEVENTCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATEVENTCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATMONTHEXTRACompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATMONTHEXTRACompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATMONTHEXTRACompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATMONTHEXTRACompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATMONTHSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATMONTHSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATMONTHSUMMARYCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATMONTHSUMMARYCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATVACATIONCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATVACATIONCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATVACATIONCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATVACATIONCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_BASEPAYCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_BASEPAYCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_BASEPAYCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_BASEPAYCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_CARDCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_CARDCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_CARDCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_CARDCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYJijumCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYJijumCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYJijumCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYJijumCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYDepartCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYDepartCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYDepartCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYDepartCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEECompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEECompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEECompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEECompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEJijumCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEJijumCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEJijumCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEJijumCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEDepartCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEDepartCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEDepartCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEDepartCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEPosiCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEPosiCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEPosiCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEPosiCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODEVENTCompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODEVENTCompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FOODEVENTCompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODEVENTCompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODGRADECompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODGRADECompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FOODGRADECompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODGRADECompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_POSICompanyCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_POSICompanyCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_POSICompanyCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_POSICompanyCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_POSIPosiCodeChange('10')
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_POSIPosiCodeChange('10')
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_POSIPosiCodeChange('10')
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_POSIPosiCodeChange('10')
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','77');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table78VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','PCSERVERTM','1','PCServerDelayTime');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','78');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table79VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','C_INTERVAL','5','ClientSendInterval(ms)');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','79');
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

function TDataBaseConfig.Table80VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','INOUTTYPE','0','외출-0:사용안함,1:리더,2:버튼');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','STARTWKNO','1','출근리더(버튼)번호');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','OFFWKNO','2','퇴근리더(버튼)번호');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','WKOUTNO','3','외출리더(버튼)번호');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','WKINNO','4','복귀리더(버튼)번호');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','80');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table81VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ALARMSTATUSCODE ';
  stSql := stSql + ' Where AL_ALARMSTATUSCODE = ''F1'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','81');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table82VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('ATTEND','ATPRSERVER','FALSE','근태전용서버');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','82');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table83VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSDBTYPE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSDBIP','127.0.0.1');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSDBPORT','1433');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSUSER','sa');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSDBNAME','sh_fpsystem');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','83');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table84VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_ALARMGUBUNCODE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_ALARMGUBUNCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_ALARMGUBUNCODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_ALARMGUBUNCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertTB_ALARMGUBUNCODE('001','구분1');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_ALARMGUBUNCODE('002','구분2');
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICEARMGUBUN
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICEARMGUBUN
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMDEVICEARMGUBUN
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICEARMGUBUN
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','84');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table85VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','KTTSUSES','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','KTTSIP','121.170.197.175');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','KTTSPORT','7001');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','KTTCPORT','4101');
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','85');
  DataModule1.ProcessExecSQL(stSql);

end;


function TDataBaseConfig.Table86VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_ALARMMODENOTCARD('006','CtrlCenter');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('006','a','R3');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_NOTCARDALARMCODE('006','d','R3');
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' Update TB_ALARMEVENT set al_operator = ''CtrlCenter'' ';
  if DBTYPE = 'PG' then stSql := stsql + ' Where substr(al_operator,1,10) = ''.KTLinkUs.'' ';
  if DBTYPE = 'MSSQL' then stSql := stsql + ' Where substring(al_operator,1,10) = ''.KTLinkUs.'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','86');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table87VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','CLIENTSEQ','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('DAEMON','CLIENTTIME','5');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','87');
  DataModule1.ProcessExecSQL(stSql);

end;


function TDataBaseConfig.Table88VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','FDMSNOAUTO','Y','지문번호자동생성유무');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','88');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table89VersionMake: Boolean;
var
  stSql : string;
begin

  //TB_CONFIG
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_CONFIG_ValueChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_CONFIG_ValueChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_CONFIG_ValueChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_CONFIG_ValueChange
  else Exit;
  DataModule1.ProcessEventExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','89');
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

function TDataBaseConfig.Table90VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_PERMITCODE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' PE_PERMITCODE,' ;
  stSql := stSql + ' PE_PERMITNAME) ';
  stSql := stSql + ' Values( ' ;
  stSql := stSql + '''' + GROUPCODE + ''',' ;
  stSql := stSql + '''3'',';
  stSql := stSql + '''방범경계승인'')'  ;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_PERMITCODE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' PE_PERMITCODE,';
  stSql := stSql + ' PE_PERMITNAME) '  ;
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',' ;
  stSql := stSql + '''4'',';
  stSql := stSql + '''방범해제승인'')';
  DataModule1.ProcessExecSQL(stSql);


  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','90');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table91VersionMake: Boolean;
var
  stSql : string;
begin
//  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','ALARMCOUNT','50');
//  DataModule1.ProcessExecSQL(stSql);

  //기기 테이블에 MUXID 추가
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEMuxID_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ACCESSDEVICEMuxID_Add
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEMuxID_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEMuxID_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ACCESSDEVICE set AC_MUXID = ''00'' ';
  DataModule1.ProcessExecSQL(stSql);

  //기기 테이블에 데코더아이디 추가
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICEDecoderID_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ACCESSDEVICEDecoderID_Add
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICEDecoderID_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICEDecoderID_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ACCESSDEVICE set AC_DECODERID = ''KTT00'' ';
  DataModule1.ProcessExecSQL(stSql);

  //알람 이벤트신호 Count
  stSql := 'Insert Into TB_CURRENTDAEMON(CU_STATECODE,CU_STATEVALUE) ';
  stSql := stSql + ' Values( ''KTALARMSEQ'',''0'') ';
  DataModule1.ProcessExecSQL(stSql);

  //PAM Cycle Time - Pre Alive Manager  회선체크
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','KTTPCYCLE','30');
  DataModule1.ProcessExecSQL(stSql);

  //관제이벤트 매핑 코드 테이블 생성
  if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_KTTMAPPINGCODE
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.CreateTB_KTTMAPPINGCODE
  else if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_KTTMAPPINGCODE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_KTTMAPPINGCODE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  //가입자확장기 단선
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','21','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','21','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','21','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','NF','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','NF','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','NF','11','E701');
  DataModule1.ProcessExecSQL(stSql);
  //가입자확장기 복구
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','22','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','22','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','22','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','NR','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','NR','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','NR','11','R701');
  DataModule1.ProcessExecSQL(stSql);
  //가입자확장기 열림
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','23','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','CO','11','E137');
  DataModule1.ProcessExecSQL(stSql);
  //가입자확장기 닫힘
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','24','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','CC','11','R137');
  DataModule1.ProcessExecSQL(stSql);
  //카드리더 단선
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','31','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','31','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','31','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','NF','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','NF','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','NF','11','E138');
  DataModule1.ProcessExecSQL(stSql);
  //카드리더 복구
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','32','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','32','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','32','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','NR','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','NR','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','NR','11','R138');
  DataModule1.ProcessExecSQL(stSql);
  //카드리더 열림
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','33','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','33','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','33','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','CO','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','CO','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','CO','11','E136');
  DataModule1.ProcessExecSQL(stSql);
  //카드리더 닫힘
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','34','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','34','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','34','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','A','CC','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','D','CC','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('CD','N','CC','11','R136');
  DataModule1.ProcessExecSQL(stSql);
  //AC 단선
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','AF','11','E301');
  DataModule1.ProcessExecSQL(stSql);
  //AC 복구
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','AN','11','R301');
  DataModule1.ProcessExecSQL(stSql);
  //카드경계모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','A1','11','E400');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','A1','11','E400');
  DataModule1.ProcessExecSQL(stSql);
  //카드해제모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','C1','11','R400');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','C1','11','R400');
  DataModule1.ProcessExecSQL(stSql);
  //강제경계모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','A3','11','E300');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','A3','11','E300');
  DataModule1.ProcessExecSQL(stSql);
  //강제해제모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','C3','11','R300');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','C3','11','R300');
  DataModule1.ProcessExecSQL(stSql);
  //PC경계모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','A4','11','E620');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','A4','11','E620');
  DataModule1.ProcessExecSQL(stSql);
  //PC해제모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','C4','11','R620');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','C4','11','R620');
  DataModule1.ProcessExecSQL(stSql);
  //관제경계모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','A2','11','E610');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','A2','11','E610');
  DataModule1.ProcessExecSQL(stSql);
  //관제해제모드변경
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','C2','11','R610');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','C2','11','R610');
  DataModule1.ProcessExecSQL(stSql);
  //전원리셋
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','R1','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','R2','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','R2','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','R1','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','R2','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','R2','01','E305');
  DataModule1.ProcessExecSQL(stSql);
  //국선체크
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','PC','11','E600');
  DataModule1.ProcessExecSQL(stSql);
  //프로그램댐퍼
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','EM','11','E306');
  DataModule1.ProcessExecSQL(stSql);
  //TF단말확인
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','PF','11','E139');
  DataModule1.ProcessExecSQL(stSql);
  //DC 단선
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','DL','11','E302');
  DataModule1.ProcessExecSQL(stSql);
  //DC 복구
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','N','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','N','DR','11','R302');
  DataModule1.ProcessExecSQL(stSql);
  //침입
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','ZP','11','E130');  //오픈
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','ZS','11','E130');  //쇼트
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','ZP','11','E130');  //오픈
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','ZS','11','E130');  //쇼트
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','FI','11','E130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','E1','11','E130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','G1','11','E130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','Q1','11','E130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','FI','11','E130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','E1','11','E130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','G1','11','E130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','Q1','11','E130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','ZP','11','E130');  //오픈
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','ZS','11','E130');  //쇼트
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','ZP','11','E130');  //오픈
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','ZS','11','E130');  //쇼트
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','FI','11','E130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','E1','11','E130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','G1','11','E130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','Q1','11','E130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','FI','11','E130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','E1','11','E130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','G1','11','E130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','Q1','11','E130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  //침입복구
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','ZN','11','R130');  //정상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','ZN','11','R130');  //정상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','F2','11','R130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','E2','11','R130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','G2','11','R130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','A','Q2','11','R130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','F2','11','R130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','E2','11','R130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','G2','11','R130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('MN','D','Q2','11','R130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','ZN','11','R130');  //정상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','ZN','11','R130');  //정상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','F2','11','R130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','E2','11','R130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','G2','11','R130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','A','Q2','11','R130');  //설비
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','F2','11','R130');  //화재
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','E2','11','R130');  //비상
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','G2','11','R130');  //가스
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertTB_KTTMAPPINGCODE('EX','D','Q2','11','R130');  //설비
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('21','가입자확장기단선','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('22','가입자확장기복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('31','카드리더단선','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('32','카드리더복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('41','감지기확장기단선','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('42','감지기확장기복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('23','기계열림','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('24','기계닫힘','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('33','카드리더열림','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('34','카드리더닫힘','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('43','감지기확장기열림','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('44','감지기확장기닫힘','0','0','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ALARMSTATUSCODE set AL_ALARMNAME = ''화재알람'' where AL_ALARMSTATUSCODE = ''FI'' ';
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('F2','화재존복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('E2','비상존복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('G2','가스존복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('Q2','설비존복구','0','0','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('EM','프로그램댐퍼','0','0','0');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMSTATUSCODE('PF','TF단말확인','0','0','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','21');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','22');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','31');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','32');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','41');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('Network','42');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','23');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','24');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','33');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','34');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','43');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_ALARMCODEGROUP('기기관련','44');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','91');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table92VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','DDNSUSES','0');
  DataModule1.ProcessExecSQL(stSql);
  //DDNS Server IP
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','DDNS_SIP','121.170.197.180');
  DataModule1.ProcessExecSQL(stSql);
  //DDNS Server PORT
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','DDNS_SPORT','9300');
  DataModule1.ProcessExecSQL(stSql);
  //DDNS Query Server IP
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','DDNS_QIP','121.170.197.180');
  DataModule1.ProcessExecSQL(stSql);
  //DDNS Query Server PORT
  stSql := CommonSql.InsertIntoTB_CONFIG('KTT','DDNS_QPORT','9301');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','92');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table93VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','RELAYUSE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','RELAYNO','6');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('FIRE','RELAYTIME','2');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','93');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table94VersionMake: Boolean;
var
  stSql : string;
begin
  //TB_ALARMDEVIC 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMDEVICENameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMDEVICENameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMDEVICENameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMDEVICENameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  //TB_ACCESSDEVIC 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSDEVICENameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ACCESSDEVICENameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSDEVICENameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSDEVICENameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  //TB_DOOR 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DOORNameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_DOORNameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DOORNameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DOORNameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  //TB_FOOD 이름 사이즈 변경
  if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODNameChange
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_FOODNameChange
  else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODNameChange
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODNameChange
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','94');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table95VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_CONFIG('FOOD','DUPEVENT','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','95');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table96VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_RELAYUNIVERCITY
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_RELAYUNIVERCITY
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_RELAYUNIVERCITY
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_RELAYUNIVERCITY
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','96');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table97VersionMake: Boolean;
var
  stSql : string;
begin    {
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_DEVICECARDNO_downseq
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_DEVICECARDNO_downseq
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_DEVICECARDNO_downseq
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_DEVICECARDNO_downseq
  else Exit;
  DataModule1.ProcessExecSQL(stSql);  }

  dmAdoQuery.NotGradePermitDelete;

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','97');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table98VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_KTTMAPPINGCODE_SendUse
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_KTTMAPPINGCODE_SendUse
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_KTTMAPPINGCODE_SendUse
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_KTTMAPPINGCODE_SendUse
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := ' update TB_KTTMAPPINGCODE set senduse = ''Y'' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','98');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table99VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','DELCARDUSE','N');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','DCARDSTART','11');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('RELAY','DELCARDLEN','3');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','TABLE_VER','99');
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

function TDataBaseConfig.TableSMS10VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','MESSAGE','');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','SMS_VER','10');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.TableSMS11VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','DBTYPE','mssql');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','SMS_VER','11');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.TableSMS1VersionMake: Boolean;
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
  stSql := stSql + '''SMS_VER'',';
  stSql := stSql + '''1'')';
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.TableSMS2VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTSMSSEND_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTSMSSEND_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMEVENTSMSSEND_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTSMSSEND_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ALARMEVENT set AL_SMSSEND = ''Y'' ';
  DataModule1.ProcessExecSQL(stSql);   //지금까지의 데이터는 모두 전송 상태로 만들어 놓는다

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','SMS_VER','2');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.TableSMS3VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','SMSUSE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','AREAGUBUN','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','SMSNUMTYPE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','SERVERTYPE','0');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','SERVERIP','127.0.0.1');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','SERVERPORT','1433');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','USERID','sa');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','USERPW','sapasswd');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','SMS_VER','3');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.TableSMS4VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_SMSALARMZONE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_SMSALARMZONE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_SMSALARMZONE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_SMSALARMZONE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','SMS_VER','4');
  DataModule1.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.TableSMS5VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','SMSUSERID','ajousms1');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','BACKNUM','0312192245');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','SENDERNAME','KTT');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','SENDERID','1111');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','SMS_VER','5');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.TableSMS6VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMSTATUSCODESMSSEND_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMSTATUSCODESMSSEND_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ALARMSTATUSCODESMSSEND_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMSTATUSCODESMSSEND_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_ALARMSTATUSCODE set AL_SMSSEND = ''N'' ';
  DataModule1.ProcessExecSQL(stSql);   //지금까지의 데이터는 모두 전송 안함 상태로 만들어 놓는다

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','SMS_VER','6');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.TableSMS7VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := CommonSql.InsertIntoTB_CONFIG('SMS','DBNAME','sms');
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','SMS_VER','7');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.TableSMS8VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_SMSALARMZONEName_Add
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_SMSALARMZONEName_Add
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_SMSALARMZONEName_Add
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_SMSALARMZONEName_Add
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_SMSALARMSTATE
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_SMSALARMSTATE
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_SMSALARMSTATE
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_SMSALARMSTATE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','SMS_VER','8');
  DataModule1.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.TableSMS9VersionMake: Boolean;
var
  stSql : string;
begin
  if DBTYPE = 'MDB' then stSql := MDBSql.CreateTB_SMSUSER
  else if DBTYPE = 'PG' then stSql := PostGreSql.CreateTB_SMSUSER
  else if DBTYPE = 'MSSQL' then stSql := MSSql.CreateTB_SMSUSER
  else if DBTYPE = 'FB' then stSql := FireBird.CreateTB_SMSALARMSTATE
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('COMMON','SMS_VER','9');
  DataModule1.ProcessExecSQL(stSql);

end;

procedure TDataBaseConfig.TableVersionCheck;
var
  nTableVersion : integer;
begin
  nTableVersion := GetSMSServerVersion;
  if nTableVersion < 1 then TableSMS1VersionMake;
  if nTableVersion < 2 then TableSMS2VersionMake;
  if nTableVersion < 3 then TableSMS3VersionMake;
  if nTableVersion < 4 then TableSMS4VersionMake;
  if nTableVersion < 5 then TableSMS5VersionMake;
  if nTableVersion < 6 then TableSMS6VersionMake;
  if nTableVersion < 7 then TableSMS7VersionMake;
  if nTableVersion < 8 then TableSMS8VersionMake;
  if nTableVersion < 9 then TableSMS9VersionMake;
  if nTableVersion < 10 then TableSMS10VersionMake;
  if nTableVersion < 11 then TableSMS11VersionMake;
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
