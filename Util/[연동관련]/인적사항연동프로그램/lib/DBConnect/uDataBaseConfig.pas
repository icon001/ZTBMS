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
    function GetVersion:integer;
    class Function GetObject:TDataBaseConfig;   //자기자신을 찾는것  class 는 폼생성전에도 사용가능
  private
    Function AlterTB_ATLISTEVENT_RelayAdd:string;
    Function AlterTB_ATEVENT_RelayAdd : string;
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):string;
    Function InsertIntoTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aDetail:string=''):string;

    function Table1VersionMake: Boolean;
    function Table2VersionMake: Boolean;
    function Table3VersionMake: Boolean;
    function Table4VersionMake: Boolean;
    function Table5VersionMake: Boolean;
    function Table6VersionMake: Boolean;
    function Table7VersionMake: Boolean;
    function Table8VersionMake: Boolean;
    function Table9VersionMake: Boolean;
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
    function SaveEVENTMDB: Boolean;
    function SaveEVENTMSSQL: Boolean;
    function SaveLOGMDB: Boolean;
    function SaveLOGMSSQL: Boolean;
    function SaveLOMOSMDB: Boolean;
    function SaveLOMOSMSSQL(aType: string): Boolean;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  fmDataBaseConfig: TfmDataBaseConfig;

implementation

uses
  uDBModule,
  DIMime,
  uCommonVariable;

{$R *.dfm}

procedure TfmDataBaseConfig.sbCancelClick(Sender: TObject);
begin
  TDataBaseConfig.GetObject.Cancel := True;
  Close;
end;

{ TDataBaseConfig }

function TDataBaseConfig.AlterTB_ATEVENT_RelayAdd: string;
var
  stSql : string;
begin
  if UpperCase(G_stDBType) = 'MSSQL' then
  begin
    stSql := 'ALTER TABLE TB_ATEVENT ADD AT_RELAY char(1) DEFAULT ''N'' NULL ';
  end else if UpperCase(G_stDBType) = 'PG' then
  begin
    stSql := 'ALTER TABLE TB_ATEVENT ADD AT_RELAY char(1) DEFAULT ''N'' NULL ';
  end else if UpperCase(G_stDBType) = 'MDB' then
  begin
    stSql := 'ALTER TABLE TB_ATEVENT ADD AT_RELAY text(1) DEFAULT ''N'' NULL ';
  end else if UpperCase(G_stDBType) = 'FB' then
  begin
    stSql := 'ALTER TABLE TB_ATEVENT ADD AT_RELAY char(1) DEFAULT ''N'' ';
  end;

  result := stSql;

end;

function TDataBaseConfig.AlterTB_ATLISTEVENT_RelayAdd: string;
var
  stSql : string;
begin
  if UpperCase(G_stDBType) = 'MSSQL' then
  begin
    stSql := 'ALTER TABLE TB_ATLISTEVENT ADD AT_RELAY char(1) DEFAULT ''N'' NULL ';
  end else if UpperCase(G_stDBType) = 'PG' then
  begin
    stSql := 'ALTER TABLE TB_ATLISTEVENT ADD AT_RELAY char(1) DEFAULT ''N'' NULL ';
  end else if UpperCase(G_stDBType) = 'MDB' then
  begin
    stSql := 'ALTER TABLE TB_ATLISTEVENT ADD AT_RELAY text(1) DEFAULT ''N'' NULL ';
  end else if UpperCase(G_stDBType) = 'FB' then
  begin
    stSql := 'ALTER TABLE TB_ATLISTEVENT ADD AT_RELAY char(1) DEFAULT ''N'' ';
  end;

  result := stSql;
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
  stDBName : string;
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
    stDBName := lowerCase(ini_fun.ReadString('DBConfig','DBNAME',''));
    stDBPath := ini_fun.ReadString('DBConfig','DBPATH',stExeFolder + '/../DB');
    GROUPCODE := ini_fun.ReadString('COMPANY','GROUPCODE','1234567890');
    G_stDBType := UpperCase(ini_fun.ReadString('DBConfig','TYPE','MSSQL'));
    stpsqlOdbcSetup := UpperCase(ini_fun.ReadString('DBConfig','psqlodbcsetup','FALSE'));
    conStr := '';
    if UpperCase(G_stDBType) = 'MSSQL' then
    begin
      conStr := constr + 'Provider=SQLOLEDB.1;';
      conStr := constr + 'Password=' + stuserPW + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID=' + stuserID + ';';
      conStr := constr + 'Initial Catalog=' + stDBName + ';';
      conStr := constr + 'Data Source=' + stHost  + ',' + stPort;
    end else if UpperCase(G_stDBType) = 'PG' then
    begin
//      conStr := 'Provider=PostgreSQL.1;';
      //conStr := 'Provider=PSQLODBC35W;';
      if stpsqlOdbcSetup = 'TRUE' then
      begin
        conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
        conStr := conStr + 'Extended Properties="DSN=PostgreSQL35W;DATABASE=' + stDBName + ';';
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
        conStr := constr + 'location=' + stDBName + ';';
        conStr := constr + 'User Id='+ stuserID + ';';
        conStr := constr + 'password=' + stuserPW;
      end;

    end else if UpperCase(G_stDBType) = 'MDB' then
    begin
      //if DBName = '' then
      stDBName := stDBPath + '\ZMOS.mdb';
      conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      conStr := conStr + 'Data Source=' + stDBName + ';';
      conStr := conStr + 'Persist Security Info=True;';
      conStr := conStr + 'Jet OLEDB:Database ';
      //if stuserPW <> '' then  conStr := conStr + ' Password=' + stuserPW;
    end else if UpperCase(G_stDBType) = 'FB' then
    begin
      conStr := 'Provider=MSDASQL;';
      conStr := conStr + 'DRIVER=Firebird/InterBase(r) driver;';
      conStr := constr + 'UID=' + stuserID + ';';
      conStr := constr + 'PWD=' + stuserPW + ';';
      conStr := constr + 'Auto Commit=true;';
      conStr := constr + 'DBNAME=' + stHost + ':' + stDBName;
    end else
    begin
      showmessage('DB Type 이 정확하지 않습니다.');
      Exit;
    end;

    with dmDBModule.ADOConnection do
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
  stSql := stSql + ' where CO_CONFIGGROUP = ''EMPCONV'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''TABLE_VER'' ';
  with dmDBModule.ADOTempQuery do
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


function TDataBaseConfig.InsertIntoTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE, aDetail: string): string;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CONFIG (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_CONFIGGROUP,';
  stSql := stSql + ' CO_CONFIGCODE,';
  stSql := stSql + ' CO_CONFIGVALUE,';
  stSql := stSql + ' CO_CONFIGDETAIL) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aCONFIGGROUP + ''', ';
  stSql := stSql + '''' + aCONFIGCODE + ''', ';
  stSql := stSql + '''' + aCONFIGVALUE + ''',';
  stSql := stSql + '''' + aDetail + ''') ';

  result :=  stSql;

end;

procedure TDataBaseConfig.SetCancel(const Value: Boolean);
begin
  FCancel := Value;
end;

procedure TDataBaseConfig.SetDBConnected(const Value: Boolean);
begin
  if FDBConnected = Value then Exit;
  FDBConnected := Value;
  dmDBModule.DBConnected := Value;
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

function TDataBaseConfig.Table1VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := InsertIntoTB_CONFIG('EMPCONV','TABLE_VER','1','인적사항변환테이블');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := InsertIntoTB_CONFIG('EMPCONV','PGTYPE','1','1:아주대');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := InsertIntoTB_CONFIG('EMPCONV','DBTYPE','3','1:MSSQL,2:PostGresql,3:ORACLE,4:MDB');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := InsertIntoTB_CONFIG('EMPCONV','DBIP','127.0.0.1','접속IP');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := InsertIntoTB_CONFIG('EMPCONV','DBPORT','1521','접속PORT');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := InsertIntoTB_CONFIG('EMPCONV','DBUSERID','SYS','접속ID');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := InsertIntoTB_CONFIG('EMPCONV','DBUSERPW','','접속PW');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := InsertIntoTB_CONFIG('EMPCONV','DBNAME','','데이터베이스명');
  dmDBModule.ProcessExecSQL(stSql);

end;


function TDataBaseConfig.Table2VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := InsertIntoTB_CONFIG('EMPCONV','RELAYTIME','30','연동시간(분)');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','TABLE_VER','2');
  dmDBModule.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table3VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := InsertIntoTB_CONFIG('EMPCONV','LASTTIME',formatDateTime('yyyymmddhhnnsszzz',now),'최종연동시간'); ///오늘 날짜로 해서 바로 연동되지 않도록 셋팅
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','TABLE_VER','3');
  dmDBModule.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table4VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := InsertIntoTB_CONFIG('EMPCONV','DELTIME',FormatDateTime('yyyymmddhhnnsszzz',now),'최종삭제연동시간');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','TABLE_VER','4');
  dmDBModule.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table5VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := InsertIntoTB_CONFIG('EMPCONV','JIJUMCD','000','지점코드');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','TABLE_VER','5');
  dmDBModule.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table6VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := AlterTB_ATLISTEVENT_RelayAdd;
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','TABLE_VER','6');
  dmDBModule.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table7VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := InsertIntoTB_CONFIG('EMPCONV','POSICD','000','직위코드');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','TABLE_VER','7');
  dmDBModule.ProcessExecSQL(stSql);
end;

function TDataBaseConfig.Table8VersionMake: Boolean;
var
  stSql : string;
begin
  stSql := InsertIntoTB_CONFIG('EMPCONV','COCODE','099','회사코드');
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','TABLE_VER','8');
  dmDBModule.ProcessExecSQL(stSql);

end;

function TDataBaseConfig.Table9VersionMake: Boolean;
var
  stSql : string;
begin

  stSql := 'Create Table TB_POSIJIJUMMapping (';
  stSql := stSql + ' PG_CODE varchar(30) NOT NULL,';
  stSql := stSql + ' PG_NAME varchar(500) NULL,';
  stSql := stSql + ' PRIMARY KEY (PG_CODE) ';
  stSql := stSql + ' ) ';

  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','TABLE_VER','9');
  dmDBModule.ProcessExecSQL(stSql);
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


function TDataBaseConfig.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): string;
var
  stSql : string;
begin
  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result :=  stSql;

end;

end.
