unit uScsConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,iniFiles, DB, ADODB, ExtCtrls, ComCtrls;

type
  TfmMain = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ed_serverip: TEdit;
    ed_serverPort: TEdit;
    Label3: TLabel;
    ed_userid: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    ed_Passwd: TEdit;
    Label6: TLabel;
    ed_DBName: TEdit;
    btn_DBTrance: TButton;
    btn_Exit: TButton;
    OpenDialog1: TOpenDialog;
    ADOQuery1: TADOQuery;
    ADORelayConnection: TADOConnection;
    ADOMDBQuery: TADOQuery;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    ProgressBar1: TProgressBar;
    rg_DBType: TRadioGroup;
    ADOConnection1: TADOConnection;
    GroupBox4: TGroupBox;
    cmb_Program: TComboBox;
    ADOConnection: TADOConnection;
    chk_DBCreate: TCheckBox;
    gb_khu: TGroupBox;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ed_OracleServerIP: TEdit;
    ed_OraclePort: TEdit;
    ed_OracleUserID: TEdit;
    ed_OraclePw: TEdit;
    ed_OracleDB: TEdit;
    gb_ktbizmeka: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ed_MssqlServerIP: TEdit;
    ed_MSSQLPort: TEdit;
    ed_MSSQLUserID: TEdit;
    ed_MSSQLPw: TEdit;
    ed_MSSQLDB: TEdit;
    st_Oraconnect: TStaticText;
    btn_OracleConnect: TBitBtn;
    st_Mssqlconnect: TStaticText;
    btn_MssqlConnect: TBitBtn;
    Chk_DBType: TCheckBox;
    procedure btn_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_DBTranceClick(Sender: TObject);
    procedure rg_DBTypeClick(Sender: TObject);
    procedure cmb_ProgramChange(Sender: TObject);
    procedure btn_OracleConnectClick(Sender: TObject);
    procedure btn_MssqlConnectClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    L_bPGOdbcUse : Boolean;
    { Private declarations }
    procedure CreateDataBase(stDBName : string);
    Function DBChange(stDBName : string):Boolean;
    Function Create_Table : Boolean;
    Function mdbToMSSQL : Boolean;
    Function InsertTB_ADMIN(stGROUP_CODE,stAD_USERID,stAD_USERPW,
             stAD_USERNAME,stGR_GRADECODE,stAD_UPDATETIME,
             stAD_UPDATEOPERATER,stAD_MASTER:string):Boolean;
    Function InsertTB_ALARMDEVICETYPECODE(stGROUP_CODE,stAL_ALARMDEVICETYPECODE,
             stAL_ALARMDEVICETYPENAME:string):Boolean;
    Function InsertTB_ALARMSTATUSCODE(stGROUP_CODE,stAL_ALARMSTATUSCODE,
             stAL_ALARMNAME,stAL_ALARMVIEW,stAL_ALARMGRADE:string):Boolean;
    Function InsertTB_ATCODE(stGROUP_CODE,stAT_ATCODE,stAT_CODENAME,
             stAT_WORKSTARTTIME,stAT_WORKENDTIME,stAT_INFROMTIME,
             stAT_INTOTIME,stAT_NIGHTTIME:string):Boolean;
    Function InsertTB_CONFIG(stGROUP_CODE,stCO_CONFIGGROUP,stCO_CONFIGCODE,
             stCO_CONFIGVALUE,stCO_CONFIGDETAIL:string):Boolean;
    Function InsertTB_CURRENTDAEMON(stGROUP_CODE,stCU_STATECODE,stCU_STATEVALUE:string):Boolean;
    Function InsertTB_GRADE(stGROUP_CODE,stGR_GRADECODE,stGR_GARDENAME,
             stGR_UPDATETIME,stGR_UPDATEOPERATOR:string):Boolean;
    Function InsertTB_GRADEPROGRAM(stGROUP_CODE,stGR_GRADECODE,
             stPR_GROUPCODE,stPR_PROGRAMID,stGR_GUBUN,stAC_UPDATEDATE,
             stAC_UPDATEOPERATOR,stGR_UPDATE,stGR_INSERT,stGR_DELETE:string):Boolean;
    Function InsertTB_PERMITCODE(stGROUP_CODE,stPE_PERMITCODE,stPE_PERMITNAME:string):Boolean;
    Function InsertTB_PROGRAMGROUP(stGROUP_CODE,stPR_GROUPCODE,stPR_GROUPCODENAME,
             stPR_VISIBLE,stGUBUN:string):Boolean;
    Function InsertTB_PROGRAMID(stGROUP_CODE,stPR_PROGRAMID,stPR_GROUPCODE,
             stPR_PROGRAMNAME,stPR_VISIBLE,stPR_VIEWSEQ,stCO_CONFIGCODE,
             stPR_UPDATETIME,stPR_UPDATEOPERATOR,stPR_ENABLE:string):Boolean;
    Function InsertTB_ZIPCODE(stZI_ZIPCODE,stZI_SIDO,stZI_GUGUN,stZI_DONG,stZI_BUNJI:string):Boolean;

    Function CommonConfigSetting:Boolean;
    Function KTConfigSetting:Boolean;
    Function UpdateTB_CONFIG(aGroupCode,aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aConfigDetail:string=''):Boolean;

    Function OracleConnected:Boolean;
    Function MssqlConnected:Boolean;
    Function KHUSetting:Boolean;
    Function KTBizMekaSetting : Boolean;
    Function KTBizMekaIISetting(aType:string): Boolean;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  L_ExeFolder : String;

implementation
uses
  DIMime,
  uLomosUtil;

{$R *.dfm}

procedure TfmMain.btn_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  stDBType : string;
begin
    L_ExeFolder := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(L_ExeFolder + '\ZMOS.INI');

    L_bPGOdbcUse := False;
    if UpperCase(ini_fun.ReadString('DBConfig','psqlodbcsetup','FALSE')) = 'TRUE' then L_bPGOdbcUse := True;

    stDBType := ini_fun.ReadString('DBConfig','TYPE','');
    if UpperCase(stDBType) = 'PG' then
    begin
      GroupBox1.Visible := True;
      rg_DBType.ItemIndex := 1;
      ed_serverip.text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      ed_serverPort.Text := ini_fun.ReadString('DBConfig','Port','5432');
      ed_userid.Text := ini_fun.ReadString('DBConfig','UserID','postgres');
      ed_Passwd.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW',''));
      ed_DBName.Text := ini_fun.ReadString('DBConfig','DBNAME','SCS');
    end else if UpperCase(stDBType) = 'MSSQL' then
    begin
      GroupBox1.Visible := True;
      rg_DBType.ItemIndex := 0;
      ed_serverip.text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      ed_serverPort.Text := ini_fun.ReadString('DBConfig','Port','1433');
      ed_userid.Text := ini_fun.ReadString('DBConfig','UserID','sa');
      ed_Passwd.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW',''));
      ed_DBName.Text := ini_fun.ReadString('DBConfig','DBNAME','SCS');
    end else if UpperCase(stDBType) = 'FB' then
    begin
      GroupBox1.Visible := True;
      rg_DBType.ItemIndex := 3;
      ed_serverip.text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      ed_serverPort.Text := ini_fun.ReadString('DBConfig','Port','5432');
      ed_userid.Text := ini_fun.ReadString('DBConfig','UserID','SYSDBA');
      ed_Passwd.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','masterkey'));
      ed_DBName.Text := ini_fun.ReadString('DBConfig','DBNAME','SCS');
    end;

    ed_OracleServerIP.Text := ini_fun.ReadString('연동','ORACLEServerIP','163.180.98.73');
    ed_OraclePort.Text := ini_fun.ReadString('연동','ORACLEServerPort','1521');
    ed_OracleUserID.Text := ini_fun.ReadString('연동','ORACLEUserID','SEAT');
    ed_OraclePw.Text := ini_fun.ReadString('연동','ORACLEUserPW','seat01');
    ed_OracleDB.Text := ini_fun.ReadString('연동','ORACLEDBName','DLIDB');

    ed_MssqlServerIP.Text := ini_fun.ReadString('연동','MSSQLServerIP','127.0.0.1');
    ed_MSSQLPort.Text := ini_fun.ReadString('연동','MSSQLServerPort','1433');
    ed_MSSQLUserID.Text := ini_fun.ReadString('연동','MSSQLUserID','sa');
    ed_MSSQLPw.Text := ini_fun.ReadString('연동','MSSQLUserPW','saPasswd');
    ed_MSSQLDB.Text := ini_fun.ReadString('연동','MSSQLDBName','zmos');

    ini_fun.Free;
    
    rg_DBType.Visible := False;
    rg_DBTypeClick(rg_DBType);

end;

procedure TfmMain.btn_DBTranceClick(Sender: TObject);
var
  conStr : string;

  ini_fun : TiniFile;
  FileList:TStringList;
begin
  if cmb_Program.ItemIndex < 1 then
  begin
    showmessage('프로그램환경 설정을 선택 하셔야 합니다.');
    Exit;
  end;

  if cmb_Program.ItemIndex = 1 then
  begin
    if UpperCase(st_Oraconnect.Caption) <> 'CONNECTED' then
    begin
      showmessage('접속테스트를 먼저 수행후 작업 하세요.');
      Exit;
    end;
  end else if cmb_Program.ItemIndex = 2 then
  begin
    if UpperCase(st_Mssqlconnect.Caption) <> 'CONNECTED' then
    begin
      showmessage('접속테스트를 먼저 수행후 작업 하세요.');
      Exit;
    end;
  end else if cmb_Program.ItemIndex = 3 then
  begin
    if UpperCase(st_Mssqlconnect.Caption) <> 'CONNECTED' then
    begin
      showmessage('접속테스트를 먼저 수행후 작업 하세요.');
      Exit;
    end;
  end;
  
    btn_DBTrance.Enabled := False;

    if rg_DBType.ItemIndex = 0 then
    begin
      conStr := 'Provider=SQLOLEDB.1;';
      conStr := constr + 'Password=' + Trim(ed_Passwd.Text) + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID='+ Trim(ed_userid.Text) + ';';
      if chk_DBCreate.Checked then constr := constr + 'Initial Catalog=master;'
      else constr := constr + 'Initial Catalog=' + ed_DBName.Text + ';';
      conStr := constr + 'Data Source=' + Trim(ed_serverip.Text) + ',' +  Trim(ed_serverPort.Text);
    end else
    if rg_DBType.ItemIndex = 1 then
    begin
      if Not L_bPGOdbcUse then
      begin
        conStr := 'Provider=PostgreSQL.1;';
        conStr := constr + 'Data Source=' + Trim(ed_serverip.Text) + ';'   ;
        if chk_DBCreate.Checked then constr := constr + 'location=postgres;'
        else constr := constr + 'location=' + ed_DBName.Text + ';';
        //conStr := constr + 'location=postgres;';
        conStr := constr + 'User Id='+ Trim(ed_userid.Text) + ';';
        conStr := constr + 'password=' + Trim(ed_Passwd.Text);
      end else
      begin
        conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
        conStr := conStr + 'Extended Properties="DSN=PostgreSQL35W;';
        //conStr := conStr + 'DATABASE=postgres;';
        if chk_DBCreate.Checked then constr := constr + 'DATABASE=postgres;'
        else constr := constr + 'DATABASE=' + ed_DBName.Text + ';';
        conStr := conStr + 'SERVER=' + Trim(ed_serverip.Text) + ';PORT=5432;UID='+ Trim(ed_userid.Text) + ';PWD=' + Trim(ed_Passwd.Text) + ';SSLmode=disable;';
        conStr := conStr + 'ReadOnly=0;Protocol=7.4;FakeOidIndex=0;ShowOidColumn=0;';
        conStr := conStr + 'RowVersioning=0;ShowSystemTables=0;ConnSettings=;Fetch=100;';
        conStr := conStr + 'Socket=4096;UnknownSizes=0;MaxVarcharSize=255;MaxLongVarcharSize=8190;';
        conStr := conStr + 'Debug=0;CommLog=0;Optimizer=1;Ksqo=1;UseDeclareFetch=0;TextAsLongVarchar=1;';
        conStr := conStr + 'UnknownsAsLongVarchar=0;BoolsAsChar=1;Parse=0;CancelAsFreeStmt=0;';
        conStr := conStr + 'ExtraSysTablePrefixes=dd_;;LFConversion=1;UpdatableCursors=1;';
        conStr := conStr + 'DisallowPremature=0;TrueIsMinus1=0;BI=0;ByteaAsLongVarBinary=0;UseServerSidePrepare=0;LowerCaseIdentifier=0;XaOpt=1"';
      end;
      //conStr := constr + 'Persist Security Info=True;';
      //conStr := 'Provider=PostgreSQL;Server=127.0.0.1;Port=5432;Database=postgres;User Id=postgres;Password=masterkey;';
      //conStr := 'Provider=PostgreSQL.1;Data Source=127.0.0.1;location=postgres;User ID=postgres;password=masterkey;timeout=1000;';
      //conStr := 'Provider=PostgreSQL OLE DB Provider;Location=postgres;Data Source=127.0.0.1:5432;UserID=postgres;Password=masterkey;';
      //conStr := 'Provider=PostgreSQL.1;Data Source=127.0.0.1;location=postgres;User Id=postgres;password=masterkey;';
    end else
    if rg_DBType.ItemIndex = 3 then
    begin
      conStr := 'Provider=MSDASQL;';
      conStr := conStr + 'DRIVER=Firebird/InterBase(r) driver;';
      conStr := constr + 'UID=' + Trim(ed_userid.Text) + ';';
      conStr := constr + 'PWD=' + Trim(ed_Passwd.Text) + ';';
      conStr := constr + 'Auto Commit=true;';
      conStr := constr + 'DBNAME=' + Trim(ed_serverip.Text) + ':' + Trim(ed_DBName.Text);
    end;



    with ADOConnection do
    begin
      Connected := False;
      ConnectionString := conStr;
      LoginPrompt:= false ;

      Try
        Connected := True;
      Except
        ON E: Exception do
        begin
          btn_DBTrance.Enabled := True;
          showmessage(conStr + E.Message + ' DataBase Connect 실패');
          Exit;
        end;
      End;
      CursorLocation := clUseServer;
    end;  

    ini_fun := TiniFile.Create(L_ExeFolder + '\ZMOS.INI');

    with ini_fun do
    begin
      Writestring('DBConfig','Host',Trim(ed_serverip.Text));
      Writestring('DBConfig','Port',Trim(ed_serverPort.Text));
      Writestring('DBConfig','UserID',Trim(ed_userid.Text));
      Writestring('DBConfig','UserPW',MimeEncodeString(Trim(ed_Passwd.Text)));
      Writestring('DBConfig','DBNAME',Trim(ed_DBName.Text));

      Writestring('EVENTDBConfig','Host',Trim(ed_serverip.Text));
      Writestring('EVENTDBConfig','Port',Trim(ed_serverPort.Text));
      Writestring('EVENTDBConfig','UserID',Trim(ed_userid.Text));
      Writestring('EVENTDBConfig','UserPW',MimeEncodeString(Trim(ed_Passwd.Text)));
      Writestring('EVENTDBConfig','DBNAME',Trim(ed_DBName.Text));

      Writestring('LOGDBConfig','Host',Trim(ed_serverip.Text));
      Writestring('LOGDBConfig','Port',Trim(ed_serverPort.Text));
      Writestring('LOGDBConfig','UserID',Trim(ed_userid.Text));
      Writestring('LOGDBConfig','UserPW',MimeEncodeString(Trim(ed_Passwd.Text)));
      Writestring('LOGDBConfig','DBNAME',Trim(ed_DBName.Text));
    end;

    ini_fun.Free;


    Label7.Caption := 'DataBase 생성중...';
    Label7.Visible := True;
    Label7.Refresh;
    if rg_DBType.ItemIndex <> 3 then
    begin
      if chk_DBCreate.Checked then
      begin
        CreateDataBase(LowerCase(ed_DBName.Text));
        if Not DBChange(LowerCase(ed_DBName.Text)) then
        begin
          btn_DBTrance.Enabled := True;
          showmessage('DataBase 변경 실패');
          Exit;
        end;
      end;
    end;

    Label7.Caption := '테이블 생성중...';
    Label7.Visible := True;
    Label7.Refresh;
    if Not Create_Table then
    begin
      Label7.Caption := '테이블 생성 실패.';
      btn_DBTrance.Enabled := True;
      //showmessage('Table 생성 실패');
      Exit;
    end;
    Label7.Caption := '테이블 생성 완료.';
    {
    Label7.Caption := '초기 데이터 셋팅중...';
    mdbToMSSQL;       }
    btn_DBTrance.Enabled := True;
    //showmessage('테이블 생성 완료');

    if cmb_Program.ItemIndex = 1 then //경희대
    begin
      KHUSetting;
    end else if cmb_Program.ItemIndex = 2 then //KT비즈메카
    begin
      KTBizMekaSetting;
    end else if cmb_Program.ItemIndex = 3 then //인천대공원
    begin
      KTBizMekaIISetting('2');
    end else if cmb_Program.ItemIndex = 4 then //KT비즈메카II
    begin
      KTBizMekaIISetting('3');
    end else if cmb_Program.ItemIndex = 5 then //바코드
    begin
      KTBizMekaIISetting('4');
    end;

    Close;

end;

procedure TfmMain.CreateDataBase(stDBName: string);
var
  stSql :string;
begin
  stSql := 'Create DataBase ' + stDBName ;

  with ADOQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
end;

function TfmMain.DBChange(stDBName: string): Boolean;
var
  conStr : string;
begin
  result := False;

    if rg_DBType.ItemIndex = 0 then
    begin
      conStr := 'Provider=SQLOLEDB.1;';
      conStr := constr + 'Password=' + Trim(ed_Passwd.Text) + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID='+ Trim(ed_userid.Text) + ';';
      conStr := constr + 'Initial Catalog='+ stDBName + ';';
      conStr := constr + 'Data Source=' + Trim(ed_serverip.Text) + ',' +  Trim(ed_serverPort.Text);
    end else
    if rg_DBType.ItemIndex = 1 then
    begin
      conStr := constr + 'password=' + Trim(ed_Passwd.Text);
      if Not L_bPGOdbcUse then
      begin
        conStr := 'Provider=PostgreSQL.1;';
        conStr := constr + 'Data Source=' + Trim(ed_serverip.Text) + ';'   ;
        conStr := constr + 'location=' + trim(stDBName) + ';';
        //conStr := conStr + 'Port=' + Trim(ed_serverPort.Text)  + ';' ;
        conStr := constr + 'User Id='+ Trim(ed_userid.Text) + ';';
      end else
      begin
        conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
        conStr := conStr + 'Extended Properties="DSN=PostgreSQL35W;DATABASE=' + trim(stDBName) + ';';
        conStr := conStr + 'SERVER=' + Trim(ed_serverip.Text) + ';PORT=5432;UID='+ Trim(ed_userid.Text) + ';PWD=' + Trim(ed_Passwd.Text) + ';SSLmode=disable;';
        conStr := conStr + 'ReadOnly=0;Protocol=7.4;FakeOidIndex=0;ShowOidColumn=0;';
        conStr := conStr + 'RowVersioning=0;ShowSystemTables=0;ConnSettings=;Fetch=100;';
        conStr := conStr + 'Socket=4096;UnknownSizes=0;MaxVarcharSize=255;MaxLongVarcharSize=8190;';
        conStr := conStr + 'Debug=0;CommLog=0;Optimizer=1;Ksqo=1;UseDeclareFetch=0;TextAsLongVarchar=1;';
        conStr := conStr + 'UnknownsAsLongVarchar=0;BoolsAsChar=1;Parse=0;CancelAsFreeStmt=0;';
        conStr := conStr + 'ExtraSysTablePrefixes=dd_;;LFConversion=1;UpdatableCursors=1;';
        conStr := conStr + 'DisallowPremature=0;TrueIsMinus1=0;BI=0;ByteaAsLongVarBinary=0;UseServerSidePrepare=0;LowerCaseIdentifier=0;XaOpt=1"';
      end;
    end;

    with ADOConnection do
    begin
      Connected := False;
      ConnectionString := conStr;
      LoginPrompt:= false ;

      Try
        Connected := True;
      Except
        Exit;
      End;
      CursorLocation := clUseServer;
    end;
    result := True;
end;

function TfmMain.Create_Table: Boolean;
var
  stSql : string;
  CreateTableList : TStringList;
  i : integer;
  stFileName : string;
begin
  result := False;
  if rg_DBType.ItemIndex = 0 then
  begin
    stFileName := L_ExeFolder + '\createTable.sql';
  end else
  if rg_DBType.ItemIndex = 1 then
  begin
    stFileName := L_ExeFolder + '\createPostSql.sql';
  end else
  if rg_DBType.ItemIndex = 2 then
  begin
    stFileName := L_ExeFolder + '\createMDBSql.sql';
  end else
  if rg_DBType.ItemIndex = 3 then
  begin
    stFileName := L_ExeFolder + '\createFireBird.sql';
  end;
  if Not FileExists(stFileName) then
  begin
    showmessage(stFileName + '파일을 찾을수 없습니다.');
    Exit;
  end;

  CreateTableList := TStringList.Create;
  CreateTableList.Clear;

  CreateTableList.LoadFromFile(stFileName);

  ProgressBar1.Visible := True;
  ProgressBar1.Max := CreateTableList.Count;
  for i:=0 to CreateTableList.Count - 1 do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    Application.ProcessMessages;
    if Pos(';',CreateTableList.Strings[i]) > 0 then
    begin
      stSql := stSql + ' ' + CreateTableList.Strings[i];
      with ADOQuery1 do
      begin
        Close;
        Sql.Clear;
        Sql.Text := stSql;
        Try
          ExecSql;
        Except
          stSql := '';
          continue;
        End;
        stSql := '';
        continue;
      end;
    end else
    begin
      stSql := stSql + ' ' + CreateTableList.Strings[i];
    end;
  end;

  ProgressBar1.Visible := False;
  CreateTableList.Free;
  result := True;

end;

function TfmMain.mdbToMSSQL: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_ADMIN ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_ADMIN(
          FindField('GROUP_CODE').AsString,
          FindField('AD_USERID').AsString,
          FindField('AD_USERPW').AsString,
          FindField('AD_USERNAME').AsString,
          FindField('GR_GRADECODE').AsString,
          FindField('AD_UPDATETIME').AsString,
          FindField('AD_UPDATEOPERATER').AsString,
          FindField('AD_MASTER').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_ALARMDEVICETYPECODE ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_ALARMDEVICETYPECODE(
          FindField('GROUP_CODE').AsString,
          FindField('AL_ALARMDEVICETYPECODE').AsString,
          FindField('AL_ALARMDEVICETYPENAME').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_ALARMSTATUSCODE ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_ALARMSTATUSCODE(
          FindField('GROUP_CODE').AsString,
          FindField('AL_ALARMSTATUSCODE').AsString,
          FindField('AL_ALARMNAME').AsString,
          FindField('AL_ALARMVIEW').AsString,
          FindField('AL_ALARMGRADE').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_ATCODE ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_ATCODE(
          FindField('GROUP_CODE').AsString,
          FindField('AT_ATCODE').AsString,
          FindField('AT_CODENAME').AsString,
          FindField('AT_WORKSTARTTIME').AsString,
          FindField('AT_WORKENDTIME').AsString,
          FindField('AT_INFROMTIME').AsString,
          FindField('AT_INTOTIME').AsString,
          FindField('AT_NIGHTTIME').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_CONFIG ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_CONFIG(
          FindField('GROUP_CODE').AsString,
          FindField('CO_CONFIGGROUP').AsString,
          FindField('CO_CONFIGCODE').AsString,
          FindField('CO_CONFIGVALUE').AsString,
          FindField('CO_CONFIGDETAIL').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_CURRENTDAEMON ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_CURRENTDAEMON(
          FindField('GROUP_CODE').AsString,
          FindField('CU_STATECODE').AsString,
          FindField('CU_STATEVALUE').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_GRADE ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_GRADE(
          FindField('GROUP_CODE').AsString,
          FindField('GR_GRADECODE').AsString,
          FindField('GR_GARDENAME').AsString,
          FindField('GR_UPDATETIME').AsString,
          FindField('GR_UPDATEOPERATOR').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_GRADEPROGRAM ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_GRADEPROGRAM(
          FindField('GROUP_CODE').AsString,
          FindField('GR_GRADECODE').AsString,
          FindField('PR_GROUPCODE').AsString,
          FindField('PR_PROGRAMID').AsString,
          FindField('GR_GUBUN').AsString,
          FindField('AC_UPDATEDATE').AsString,
          FindField('AC_UPDATEOPERATOR').AsString,
          FindField('GR_UPDATE').AsString,
          FindField('GR_INSERT').AsString,
          FindField('GR_DELETE').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_PERMITCODE ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_PERMITCODE(
          FindField('GROUP_CODE').AsString,
          FindField('PE_PERMITCODE').AsString,
          FindField('PE_PERMITNAME').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_PROGRAMGROUP ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_PROGRAMGROUP(
          FindField('GROUP_CODE').AsString,
          FindField('PR_GROUPCODE').AsString,
          FindField('PR_GROUPCODENAME').AsString,
          FindField('PR_VISIBLE').AsString,
          FindField('GUBUN').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_PROGRAMID ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_PROGRAMID(
          FindField('GROUP_CODE').AsString,
          FindField('PR_PROGRAMID').AsString,
          FindField('PR_GROUPCODE').AsString,
          FindField('PR_PROGRAMNAME').AsString,
          FindField('PR_VISIBLE').AsString,
          FindField('PR_VIEWSEQ').AsString,
          FindField('CO_CONFIGCODE').AsString,
          FindField('PR_UPDATETIME').AsString,
          FindField('PR_UPDATEOPERATOR').AsString,
          FindField('PR_ENABLE').AsString
         );
        Next;
      end;
    end;
  end;

  stSql := 'select * from TB_ZIPCODE ';

  with ADOMDBQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    ProgressBar1.Visible := True;
    ProgressBar1.Max := recordCount;
    ProgressBar1.Position := 0;
    if recordcount > 0 then
    begin
      while Not Eof do
      begin
        InsertTB_ZIPCODE(
          FindField('ZI_ZIPCODE').AsString,
          FindField('ZI_SIDO').AsString,
          FindField('ZI_GUGUN').AsString,
          FindField('ZI_DONG').AsString,
          FindField('ZI_BUNJI').AsString
         );
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Next;
      end;
    end;
    ProgressBar1.Visible := False;
  end;

  result := True;
end;

function TfmMain.InsertTB_ADMIN(stGROUP_CODE, stAD_USERID, stAD_USERPW,
  stAD_USERNAME, stGR_GRADECODE, stAD_UPDATETIME, stAD_UPDATEOPERATER,
  stAD_MASTER: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_ADMIN(GROUP_CODE,AD_USERID,AD_USERPW,';
  stSql := stSql + 'AD_USERNAME,GR_GRADECODE, AD_UPDATETIME, AD_UPDATEOPERATER,';
  stSql := stSql + 'AD_MASTER) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stAD_USERID + ''',';
  stSql := stSql + '''' + stAD_USERPW + ''',';
  stSql := stSql + '''' + stAD_USERNAME + ''',';
  stSql := stSql + '''' + stGR_GRADECODE + ''',';
  stSql := stSql + '''' + stAD_UPDATETIME + ''',';
  stSql := stSql + '''' + stAD_UPDATEOPERATER + ''',';
  stSql := stSql + '''' + stAD_MASTER + ''' )';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_ALARMDEVICETYPECODE(stGROUP_CODE,
  stAL_ALARMDEVICETYPECODE, stAL_ALARMDEVICETYPENAME: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_ALARMDEVICETYPECODE(GROUP_CODE,AL_ALARMDEVICETYPECODE,AL_ALARMDEVICETYPENAME) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stAL_ALARMDEVICETYPECODE + ''',';
  stSql := stSql + '''' + stAL_ALARMDEVICETYPENAME + ''' )';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_ALARMSTATUSCODE(stGROUP_CODE,
  stAL_ALARMSTATUSCODE, stAL_ALARMNAME, stAL_ALARMVIEW,
  stAL_ALARMGRADE: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if stAL_ALARMVIEW = '' then stAL_ALARMVIEW := '0';
  if stAL_ALARMGRADE = '' then stAL_ALARMGRADE := '0';

  stSql := 'Insert Into TB_ALARMSTATUSCODE(GROUP_CODE,';
  stSql := stSql + 'AL_ALARMSTATUSCODE, AL_ALARMNAME, AL_ALARMVIEW,';
  stSql := stSql + 'AL_ALARMGRADE) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stAL_ALARMSTATUSCODE + ''',';
  stSql := stSql + '''' + stAL_ALARMNAME + ''',';
  stSql := stSql + stAL_ALARMVIEW + ',';
  stSql := stSql + stAL_ALARMGRADE + ' )';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_ATCODE(stGROUP_CODE, stAT_ATCODE, stAT_CODENAME,
  stAT_WORKSTARTTIME, stAT_WORKENDTIME, stAT_INFROMTIME, stAT_INTOTIME,
  stAT_NIGHTTIME: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_ATCODE(GROUP_CODE,AT_ATCODE,AT_CODENAME,';
  stSql := stSql + 'AT_WORKSTARTTIME,AT_WORKENDTIME,AT_INFROMTIME,AT_INTOTIME,';
  stSql := stSql + 'AT_NIGHTTIME) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stAT_ATCODE + ''',';
  stSql := stSql + '''' + stAT_CODENAME + ''',';
  stSql := stSql + '''' + stAT_WORKSTARTTIME + ''',';
  stSql := stSql + '''' + stAT_WORKENDTIME + ''',';
  stSql := stSql + '''' + stAT_INFROMTIME + ''',';
  stSql := stSql + '''' + stAT_INTOTIME + ''',';
  stSql := stSql + '''' + stAT_NIGHTTIME + ''' )';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_CONFIG(stGROUP_CODE, stCO_CONFIGGROUP,
  stCO_CONFIGCODE, stCO_CONFIGVALUE, stCO_CONFIGDETAIL: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_CONFIG(GROUP_CODE,CO_CONFIGGROUP,';
  stSql := stSql + 'CO_CONFIGCODE,CO_CONFIGVALUE,CO_CONFIGDETAIL) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stCO_CONFIGGROUP + ''',';
  stSql := stSql + '''' + stCO_CONFIGCODE + ''',';
  stSql := stSql + '''' + stCO_CONFIGVALUE + ''',';
  stSql := stSql + '''' + stCO_CONFIGDETAIL + ''' )';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_CURRENTDAEMON(stGROUP_CODE, stCU_STATECODE,
  stCU_STATEVALUE: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_CURRENTDAEMON(GROUP_CODE,CU_STATECODE,';
  stSql := stSql + 'CU_STATEVALUE) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stCU_STATECODE + ''',';
  stSql := stSql + '''' + stCU_STATEVALUE + ''' )';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_GRADE(stGROUP_CODE, stGR_GRADECODE,
  stGR_GARDENAME, stGR_UPDATETIME, stGR_UPDATEOPERATOR: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_GRADE(GROUP_CODE,GR_GRADECODE,';
  stSql := stSql + 'GR_GARDENAME,GR_UPDATETIME,GR_UPDATEOPERATOR) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stGR_GRADECODE + ''',';
  stSql := stSql + '''' + stGR_GARDENAME + ''',';
  stSql := stSql + '''' + stGR_UPDATETIME + ''',';
  stSql := stSql + '''' + stGR_UPDATEOPERATOR + ''' )';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_GRADEPROGRAM(stGROUP_CODE, stGR_GRADECODE,
  stPR_GROUPCODE, stPR_PROGRAMID, stGR_GUBUN, stAC_UPDATEDATE,
  stAC_UPDATEOPERATOR, stGR_UPDATE, stGR_INSERT,
  stGR_DELETE: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_GRADEPROGRAM(GROUP_CODE,GR_GRADECODE,';
  stSql := stSql + 'PR_GROUPCODE,PR_PROGRAMID,GR_GUBUN,AC_UPDATEDATE,';
  stSql := stSql + 'AC_UPDATEOPERATOR,GR_UPDATE,GR_INSERT,GR_DELETE) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stGR_GRADECODE + ''',';
  stSql := stSql + '''' + stPR_GROUPCODE + ''',';
  stSql := stSql + '''' + stPR_PROGRAMID + ''',';
  stSql := stSql + '''' + stGR_GUBUN + ''',';
  stSql := stSql + '''' + stAC_UPDATEDATE + ''',';
  stSql := stSql + '''' + stAC_UPDATEOPERATOR + ''',';
  stSql := stSql + '''' + stGR_UPDATE + ''',';
  stSql := stSql + '''' + stGR_INSERT + ''',';
  stSql := stSql + '''' + stGR_DELETE + ''')';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_PERMITCODE(stGROUP_CODE, stPE_PERMITCODE,
  stPE_PERMITNAME: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_PERMITCODE(GROUP_CODE,PE_PERMITCODE,PE_PERMITNAME) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stPE_PERMITCODE + ''',';
  stSql := stSql + '''' + stPE_PERMITNAME + ''')';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_PROGRAMGROUP(stGROUP_CODE, stPR_GROUPCODE,
  stPR_GROUPCODENAME, stPR_VISIBLE, stGUBUN: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_PROGRAMGROUP(GROUP_CODE,PR_GROUPCODE,';
  stSql := stSql + 'PR_GROUPCODENAME,PR_VISIBLE,GUBUN) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stPR_GROUPCODE + ''',';
  stSql := stSql + '''' + stPR_GROUPCODENAME + ''',';
  stSql := stSql + '''' + stPR_VISIBLE + ''',';
  stSql := stSql + '''' + stGUBUN + ''')';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_PROGRAMID(stGROUP_CODE, stPR_PROGRAMID,
  stPR_GROUPCODE, stPR_PROGRAMNAME, stPR_VISIBLE, stPR_VIEWSEQ,
  stCO_CONFIGCODE, stPR_UPDATETIME, stPR_UPDATEOPERATOR,
  stPR_ENABLE: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if stPR_VIEWSEQ = '' then stPR_VIEWSEQ := '0';

  stSql := 'Insert Into TB_PROGRAMID(GROUP_CODE,PR_PROGRAMID,';
  stSql := stSql + 'PR_GROUPCODE,PR_PROGRAMNAME,PR_VISIBLE,PR_VIEWSEQ,';
  stSql := stSql + 'CO_CONFIGCODE,PR_UPDATETIME,PR_UPDATEOPERATOR,';
  stSql := stSql + 'PR_ENABLE) values(';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stPR_PROGRAMID + ''',';
  stSql := stSql + '''' + stPR_GROUPCODE + ''',';
  stSql := stSql + '''' + stPR_PROGRAMNAME + ''',';
  stSql := stSql + '''' + stPR_VISIBLE + ''',';
  stSql := stSql + stPR_VIEWSEQ + ',';
  stSql := stSql + '''' + stCO_CONFIGCODE + ''',';
  stSql := stSql + '''' + stPR_UPDATETIME + ''',';
  stSql := stSql + '''' + stPR_UPDATEOPERATOR + ''',';
  stSql := stSql + '''' + stPR_ENABLE + ''')';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TfmMain.InsertTB_ZIPCODE(stZI_ZIPCODE, stZI_SIDO, stZI_GUGUN,
  stZI_DONG, stZI_BUNJI: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_ZIPCODE(ZI_ZIPCODE,ZI_SIDO,ZI_GUGUN,ZI_DONG,ZI_BUNJI) values(';
  stSql := stSql + '''' + stZI_ZIPCODE + ''',';
  stSql := stSql + '''' + stZI_SIDO + ''',';
  stSql := stSql + '''' + stZI_GUGUN + ''',';
  stSql := stSql + '''' + stZI_DONG + ''',';
  stSql := stSql + '''' + stZI_BUNJI + ''')';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

procedure TfmMain.rg_DBTypeClick(Sender: TObject);
begin
  if rg_DBType.ItemIndex < 2 then
  begin
    GroupBox1.Visible := True;
    if rg_DBType.ItemIndex = 0 then
    begin
      Label3.Visible := true;
      ed_serverPort.Visible := true;
    end else
    begin
      Label3.Visible := False;
      ed_serverPort.Visible := False;
    end;
  end else if rg_DBType.ItemIndex = 2 then
  begin
    GroupBox1.Visible := False;
  end else if rg_DBType.ItemIndex = 3 then
  begin
    GroupBox1.Visible := True;
    Label3.Visible := False;
    ed_serverPort.Visible := False;

  end;
end;

function TfmMain.CommonConfigSetting: Boolean;
begin
  UpdateTB_CONFIG('1234567890','ATTEND', 'DEVICETYPE', '0', '0:UPDATE,1:카드리더,2:버튼방식');
  UpdateTB_CONFIG('1234567890','DAEMON', 'IP', '127.0.0.1', '데몬서버아이피');
  UpdateTB_CONFIG('1234567890','MOSTYPE','FILEIP','127.0.0.1','파일서버아이피');
  UpdateTB_CONFIG('1234567890', 'DAEMON', 'PORT', '5101', '데몬서버포트');
  UpdateTB_CONFIG('1234567890', 'DAEMON', 'ATPORT', '5102', '근태서버포트');
  if rg_DBType.ItemIndex = 1 then UpdateTB_CONFIG('1234567890', 'DATABASE', 'BACKDIR', 'c:\\Backup', '데이터베이스백업디렉토리')
  else UpdateTB_CONFIG('1234567890', 'DATABASE', 'BACKDIR', 'c:\Backup', '데이터베이스백업디렉토리');
  if rg_DBType.ItemIndex = 1 then UpdateTB_CONFIG('1234567890', 'MOSTYPE', 'FILEDIR', '\\\\127.0.0.1\\shareddocs', '파일서버디렉토리')
  else UpdateTB_CONFIG('1234567890', 'MOSTYPE', 'FILEDIR', '\\127.0.0.1\shareddocs', '파일서버디렉토리');

  if Not InsertTB_CONFIG('1234567890','COMMON','CARDNOTYPE','0','카드번호Type(고정/가변)') then
  begin
    UpdateTB_CONFIG('1234567890','COMMON','CARDNOTYPE','0','카드번호Type(고정/가변)');
  end;
  if Not InsertTB_CONFIG('1234567890','FIRE','FIRERECUSE','1','화재복구사용유무') then
  begin
    UpdateTB_CONFIG('1234567890','FIRE','FIRERECUSE','1','화재복구사용유무');
  end;
  if Not InsertTB_CONFIG('1234567890','COMMON','SPECIALCD','0','0:Common,1:KT') then
  begin
    UpdateTB_CONFIG('1234567890','COMMON','SPECIALCD','0','0:Common,1:KT');
  end;
  if Not InsertTB_CONFIG('1234567890','COMMON','CARDNUM','0','0:숫자,1:ASCII') then
  begin
    UpdateTB_CONFIG('1234567890','COMMON','CARDNUM','0','0:숫자,1:ASCII');
  end;
  UpdateTB_CONFIG('1234567890','MCUCOMM','CARDAUTO','TRUE','카드자동다운로드' );

end;

function TfmMain.KTConfigSetting: Boolean;
begin
  UpdateTB_CONFIG('1234567890','ATTEND', 'DEVICETYPE', '0', '0:UPDATE,1:카드리더,2:버튼방식');
  UpdateTB_CONFIG('1234567890','DAEMON', 'IP', '127.0.0.1', '데몬서버아이피');
  UpdateTB_CONFIG('1234567890','MOSTYPE','FILEIP','127.0.0.1','파일서버아이피');
  UpdateTB_CONFIG('1234567890', 'DAEMON', 'PORT', '5101', '데몬서버포트');
  UpdateTB_CONFIG('1234567890', 'DAEMON', 'ATPORT', '5102', '근태서버포트');
  if rg_DBType.ItemIndex = 1 then UpdateTB_CONFIG('1234567890', 'DATABASE', 'BACKDIR', 'c:\\Backup', '데이터베이스백업디렉토리')
  else UpdateTB_CONFIG('1234567890', 'DATABASE', 'BACKDIR', 'c:\Backup', '데이터베이스백업디렉토리');
  if rg_DBType.ItemIndex = 1 then UpdateTB_CONFIG('1234567890', 'MOSTYPE', 'FILEDIR', '\\\\127.0.0.1\\shareddocs', '파일서버디렉토리')
  else UpdateTB_CONFIG('1234567890', 'MOSTYPE', 'FILEDIR', '\\127.0.0.1\shareddocs', '파일서버디렉토리');

  if Not InsertTB_CONFIG('1234567890','COMMON','CARDNOTYPE','2','카드번호Type(고정/가변)') then
  begin
    UpdateTB_CONFIG('1234567890','COMMON','CARDNOTYPE','2','카드번호Type(고정/가변)');
  end;
  if Not InsertTB_CONFIG('1234567890','FIRE','FIRERECUSE','1','화재복구사용유무') then
  begin
    UpdateTB_CONFIG('1234567890','FIRE','FIRERECUSE','1','화재복구사용유무');
  end;
  if Not InsertTB_CONFIG('1234567890','COMMON','SPECIALCD','1','0:Common,1:KT') then
  begin
    UpdateTB_CONFIG('1234567890','COMMON','SPECIALCD','1','0:Common,1:KT');
  end;
  UpdateTB_CONFIG('1234567890','MCUCOMM','CARDAUTO','TRUE','카드자동다운로드' );
end;

function TfmMain.UpdateTB_CONFIG(aGroupCode,aCONFIGGROUP, aCONFIGCODE, aCONFIGVALUE,
  aConfigDetail: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''', ';
  stSql := stSql + ' CO_CONFIGDETAIL = ''' + aConfigDetail + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;

end;

procedure TfmMain.cmb_ProgramChange(Sender: TObject);
begin
  if cmb_Program.ItemIndex = 1 then
  begin
    gb_khu.Visible := True;
    gb_ktbizmeka.Visible := False;
    GroupBox3.Align := alBottom;
    Application.ProcessMessages;
    GroupBox3.Align := alTop;
  end else if cmb_Program.ItemIndex = 2 then
  begin
    gb_khu.Visible := False;
    gb_ktbizmeka.Visible := True;
    GroupBox3.Align := alBottom;
    Application.ProcessMessages;
    GroupBox3.Align := alTop;
  end else if cmb_Program.ItemIndex = 3 then
  begin
    gb_khu.Visible := False;
    gb_ktbizmeka.Visible := True;
    GroupBox3.Align := alBottom;
    Application.ProcessMessages;
    GroupBox3.Align := alTop;
  end else if cmb_Program.ItemIndex = 4 then
  begin
    gb_khu.Visible := False;
    gb_ktbizmeka.Visible := True;
    GroupBox3.Align := alBottom;
    Application.ProcessMessages;
    GroupBox3.Align := alTop;
  end else
  begin
    gb_khu.Visible := False;
    gb_ktbizmeka.Visible := False;
    GroupBox3.Align := alBottom;
    Application.ProcessMessages;
    GroupBox3.Align := alTop;
  end;
end;

procedure TfmMain.btn_OracleConnectClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Zmos.INI');
    btn_OracleConnect.Enabled := False;
    st_Oraconnect.Caption := '';
    if Not OracleConnected then
    begin
      st_Oraconnect.Caption := 'Not Connected';
      Exit;
    end;
    st_Oraconnect.Caption := 'Connected';


    ini_fun.WriteString('연동','ORACLEServerIP',ed_OracleServerIP.Text);
    ini_fun.WriteString('연동','ORACLEServerPort',ed_OraclePort.Text);
    ini_fun.WriteString('연동','ORACLEUserID',ed_OracleUserID.Text);
    ini_fun.WriteString('연동','ORACLEUserPW',ed_OraclePw.Text);
    ini_fun.WriteString('연동','ORACLEDBName',ed_OracleDB.Text);
  Finally
    btn_OracleConnect.Enabled := True;
    ini_fun.Free;
  End;
end;

function TfmMain.OracleConnected: Boolean;
var
  conStr : string;
begin
  result := False;

  conStr := 'Provider=OraOLEDB.Oracle;';
  conStr := constr + 'Password=' + ed_OraclePw.Text + ';';
  conStr := constr + 'User ID='+ ed_OracleUserID.Text + ';';
  conStr := constr + 'Data Source=' + ed_OracleDB.Text + ';';
  conStr := constr + 'Persist Security Info=True';

  with ADORelayConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
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
          ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
  end;
  result := True;
end;

procedure TfmMain.btn_MssqlConnectClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Zmos.INI');

    btn_MssqlConnect.Enabled := False;
    st_Mssqlconnect.Caption := '';
    if Not MssqlConnected then
    begin
      st_Mssqlconnect.Caption := 'Not Connected';
      Exit;
    end;
    st_Mssqlconnect.Caption := 'Connected';

    if Chk_DBType.Checked then
      ini_fun.WriteString('연동','KTDBTYPE','ORACLE')
    else ini_fun.WriteString('연동','KTDBTYPE','MSSQL');
    ini_fun.WriteString('연동','MSSQLServerIP',ed_MssqlServerIP.Text);
    ini_fun.WriteString('연동','MSSQLServerPort',ed_MSSQLPort.Text);
    ini_fun.WriteString('연동','MSSQLUserID',ed_MSSQLUserID.Text);
    ini_fun.WriteString('연동','MSSQLUserPW',ed_MSSQLPw.Text);
    ini_fun.WriteString('연동','MSSQLDBName',ed_MSSQLDB.Text);
  Finally
    btn_MssqlConnect.Enabled := True;
    ini_fun.Free;
  End;
end;

function TfmMain.MssqlConnected: Boolean;
var
  conStr : string;
begin
  result := False;

  if Not Chk_DBType.Checked then
  begin
    conStr := 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + ed_MSSQLPw.Text + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + ed_MSSQLUserID.Text + ';';
    conStr := constr + 'Initial Catalog=' + ed_MSSQLDB.Text + ';';
    conStr := constr + 'Data Source=' + ed_MssqlServerIP.Text + ',' + ed_MSSQLPort.Text + ' ';

    with ADORelayConnection do
    begin
      Connected := False;
      ConnectionString := conStr;
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
            ShowMessage('데이터베이스 접속 에러' );
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
    end;
  end else
  begin
    //Provider=MSDAORA.1;User ID=ofmc;Data Source=FMCDB_OJUNG;Persist Security Info=False
    //conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := 'Provider=MSDAORA.1;';
    conStr := constr + 'Password=' + ed_MSSQLPw.Text + ';';
    conStr := constr + 'User ID='+ ed_MSSQLUserID.Text + ';';
    conStr := constr + 'Data Source=' + ed_MSSQLDB.Text + ';';
    conStr := constr + 'Persist Security Info=True';

    with ADORelayConnection do
    begin
      Connected := False;
      ConnectionString := conStr;
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
            ShowMessage('데이터베이스 접속 에러' );
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
    end;
  end;
  result := True;
end;

function TfmMain.KHUSetting: Boolean;
begin
  UpdateTB_CONFIG('1234567890','ATTEND', 'DEVICETYPE', '0', '0:UPDATE,1:카드리더,2:버튼방식');
  UpdateTB_CONFIG('1234567890','DAEMON', 'IP', '127.0.0.1', '데몬서버아이피');
  UpdateTB_CONFIG('1234567890','MOSTYPE','FILEIP','127.0.0.1','파일서버아이피');
  UpdateTB_CONFIG('1234567890', 'DAEMON', 'PORT', '5101', '데몬서버포트');
  UpdateTB_CONFIG('1234567890', 'DAEMON', 'ATPORT', '5102', '근태서버포트');
  if rg_DBType.ItemIndex = 1 then UpdateTB_CONFIG('1234567890', 'DATABASE', 'BACKDIR', 'c:\\Backup', '데이터베이스백업디렉토리')
  else UpdateTB_CONFIG('1234567890', 'DATABASE', 'BACKDIR', 'c:\Backup', '데이터베이스백업디렉토리');
  if rg_DBType.ItemIndex = 1 then UpdateTB_CONFIG('1234567890', 'MOSTYPE', 'FILEDIR', '\\\\127.0.0.1\\shareddocs', '파일서버디렉토리')
  else UpdateTB_CONFIG('1234567890', 'MOSTYPE', 'FILEDIR', '\\127.0.0.1\shareddocs', '파일서버디렉토리');

  if Not InsertTB_CONFIG('1234567890','COMMON','CARDNOTYPE','1','카드번호Type(고정/가변)') then
  begin
    UpdateTB_CONFIG('1234567890','COMMON','CARDNOTYPE','1','카드번호Type(고정/가변)');
  end;
  if Not InsertTB_CONFIG('1234567890','FIRE','FIRERECUSE','1','화재복구사용유무') then
  begin
    UpdateTB_CONFIG('1234567890','FIRE','FIRERECUSE','1','화재복구사용유무');
  end;
  UpdateTB_CONFIG('1234567890','MCUCOMM','CARDAUTO','TRUE','카드자동다운로드' );

  if Not InsertTB_CONFIG('1234567890','SCS','RY_SERVER','0','0:경희대,1:KT비즈메카') then
  begin
    UpdateTB_CONFIG('1234567890','SCS','RY_SERVER','0','0:경희대,1:KT비즈메카');
  end;

end;

function TfmMain.KTBizMekaSetting: Boolean;
begin
  UpdateTB_CONFIG('1234567890','ATTEND', 'DEVICETYPE', '0', '0:UPDATE,1:카드리더,2:버튼방식');
  UpdateTB_CONFIG('1234567890','DAEMON', 'IP', '127.0.0.1', '데몬서버아이피');
  UpdateTB_CONFIG('1234567890','MOSTYPE','FILEIP','127.0.0.1','파일서버아이피');
  UpdateTB_CONFIG('1234567890', 'DAEMON', 'PORT', '5101', '데몬서버포트');
  UpdateTB_CONFIG('1234567890', 'DAEMON', 'ATPORT', '5102', '근태서버포트');
  if rg_DBType.ItemIndex = 1 then UpdateTB_CONFIG('1234567890', 'DATABASE', 'BACKDIR', 'c:\\Backup', '데이터베이스백업디렉토리')
  else UpdateTB_CONFIG('1234567890', 'DATABASE', 'BACKDIR', 'c:\Backup', '데이터베이스백업디렉토리');
  if rg_DBType.ItemIndex = 1 then UpdateTB_CONFIG('1234567890', 'MOSTYPE', 'FILEDIR', '\\\\127.0.0.1\\shareddocs', '파일서버디렉토리')
  else UpdateTB_CONFIG('1234567890', 'MOSTYPE', 'FILEDIR', '\\127.0.0.1\shareddocs', '파일서버디렉토리');

  if Not InsertTB_CONFIG('1234567890','COMMON','CARDNOTYPE','0','카드번호Type(고정/가변)') then
  begin
    UpdateTB_CONFIG('1234567890','COMMON','CARDNOTYPE','0','카드번호Type(고정/가변)');
  end;
  if Not InsertTB_CONFIG('1234567890','FIRE','FIRERECUSE','1','화재복구사용유무') then
  begin
    UpdateTB_CONFIG('1234567890','FIRE','FIRERECUSE','1','화재복구사용유무');
  end;
  if Not InsertTB_CONFIG('1234567890','SCS','RY_SERVER','1','0:경희대,1:KT비즈메카') then
  begin
    UpdateTB_CONFIG('1234567890','SCS','RY_SERVER','1','0:경희대,1:KT비즈메카');
  end;
  if Not InsertTB_CONFIG('1234567890','COMMON','CARDNUM','0','0:숫자,1:ASCII') then
  begin
    UpdateTB_CONFIG('1234567890','COMMON','CARDNUM','0','0:숫자,1:ASCII');
  end;
  UpdateTB_CONFIG('1234567890','MCUCOMM','CARDAUTO','TRUE','카드자동다운로드' );

end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  btn_DBTrance.Left := (fmMain.Width div 2) - (btn_DBTrance.Width div 2);
end;

function TfmMain.KTBizMekaIISetting(aType:string): Boolean;
begin
  UpdateTB_CONFIG('1234567890','ATTEND', 'DEVICETYPE', '0', '0:UPDATE,1:카드리더,2:버튼방식');
  UpdateTB_CONFIG('1234567890','DAEMON', 'IP', '127.0.0.1', '데몬서버아이피');
  UpdateTB_CONFIG('1234567890','MOSTYPE','FILEIP','127.0.0.1','파일서버아이피');
  UpdateTB_CONFIG('1234567890', 'DAEMON', 'PORT', '5101', '데몬서버포트');
  UpdateTB_CONFIG('1234567890', 'DAEMON', 'ATPORT', '5102', '근태서버포트');
  if rg_DBType.ItemIndex = 1 then UpdateTB_CONFIG('1234567890', 'DATABASE', 'BACKDIR', 'c:\\Backup', '데이터베이스백업디렉토리')
  else UpdateTB_CONFIG('1234567890', 'DATABASE', 'BACKDIR', 'c:\Backup', '데이터베이스백업디렉토리');
  if rg_DBType.ItemIndex = 1 then UpdateTB_CONFIG('1234567890', 'MOSTYPE', 'FILEDIR', '\\\\127.0.0.1\\shareddocs', '파일서버디렉토리')
  else UpdateTB_CONFIG('1234567890', 'MOSTYPE', 'FILEDIR', '\\127.0.0.1\shareddocs', '파일서버디렉토리');

  if Not InsertTB_CONFIG('1234567890','COMMON','CARDNOTYPE','0','카드번호Type(고정/가변)') then
  begin
    UpdateTB_CONFIG('1234567890','COMMON','CARDNOTYPE','0','카드번호Type(고정/가변)');
  end;
  if Not InsertTB_CONFIG('1234567890','FIRE','FIRERECUSE','1','화재복구사용유무') then
  begin
    UpdateTB_CONFIG('1234567890','FIRE','FIRERECUSE','1','화재복구사용유무');
  end;
  if Not InsertTB_CONFIG('1234567890','SCS','RY_SERVER',aType,'0:경희대,1:KT비즈메카') then
  begin
    UpdateTB_CONFIG('1234567890','SCS','RY_SERVER',aType,'0:경희대,1:KT비즈메카');
  end;
  if Not InsertTB_CONFIG('1234567890','COMMON','CARDNUM','1','0:숫자,1:ASCII') then
  begin
    UpdateTB_CONFIG('1234567890','COMMON','CARDNUM','1','0:숫자,1:ASCII');
  end;
  UpdateTB_CONFIG('1234567890','MCUCOMM','CARDAUTO','TRUE','카드자동다운로드' );

end;

end.
